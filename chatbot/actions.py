from typing import Any, Text, Dict, List
from rasa_sdk import Action, Tracker
from rasa_sdk.executor import CollectingDispatcher
from rasa_sdk.events import SlotSet
import mysql.connector

config = {
    'user': 'root',
    'password': '',
    'host': '127.0.0.1', 
    'database': 'rasa_chatboot'
}

conn = mysql.connector.connect(**config)

def run_query(query, dispatcher):
    cursor = conn.cursor()
    try:
        # Create a cursor object using cursor() method
        cursor.execute(query)
            
        response = cursor.fetchone()
        
        if response:
            response_text = response[0]
            dispatcher.utter_message(text=response_text)
        else:
            dispatcher.utter_message(text="لا يوجد اجابة لدي للسؤال المعطى , جرب سؤال اخر وشكرا")
    except mysql.connector.Error as err:
        dispatcher.utter_message(text=f"هناك خطأ يرجى المحاولة مرة أخرى")
    # finally:
    #     if cursor:
    #         cursor.close()
    #     if conn:
    #         conn.close()

    return []


def run_query_paper(query, dispatcher):
    cursor = conn.cursor()
    try:
        # Create a cursor object using cursor() method
        cursor.execute(query)
            
        response = cursor.fetchall()
        
        if response:
            response_text = response[0]
            response_text = " يبدأ التسجيل في " + response_text[0] + "\n" + " ينتهي التسجيل في " + response_text[1] 
            dispatcher.utter_message(text=response_text)
        else:
            dispatcher.utter_message(text="لا يوجد اجابة لدي للسؤال المعطى , جرب سؤال اخر وشكرا")
    except mysql.connector.Error as err:
        dispatcher.utter_message(text=f"هناك خطأ يرجى المحاولة مرة أخرى")
    # finally:
    #     if cursor:
    #         cursor.close()
    #     if conn:
    #         conn.close()

    return []


class ActionCheckSufficientFunds(Action):
    def name(self) -> Text:
        return "action_check_sufficient_funds"

    def run(
        self,
        dispatcher: CollectingDispatcher,
        tracker: Tracker,
        domain: Dict[Text, Any],
    ) -> List[Dict[Text, Any]]:
        # hard-coded balance for tutorial purposes. in production this
        # would be retrieved from a database or an API
        balance = 1000
        transfer_amount = tracker.get_slot("amount")
        has_sufficient_funds = transfer_amount <= balance
        return [SlotSet("has_sufficient_funds", has_sufficient_funds)]

   
class ActionTsgelMoz(Action):
    def name(self) -> str:
        return "action_tsgel_moz"

    def run(self, dispatcher, tracker, domain):
        query = "SELECT start_date, end_date FROM chatboot_response WHERE intent = 'utter_tsgel_moz'"
        run_query_paper(query, dispatcher)


class ActionTsgelGen(Action):
    def name(self) -> str:
        return "action_tsgel_gen"

    def run(self, dispatcher, tracker, domain):
        query = "SELECT start_date, end_date FROM chatboot_response WHERE intent = 'utter_tsgel_gen'"
        run_query_paper(query, dispatcher)


class ActionTsgelGenPep(Action):
    def name(self) -> str:
        return "action_tsgel_gen_pep"

    def run(self, dispatcher, tracker, domain):
        query = "SELECT answer FROM chatboot_response WHERE intent = 'utter_tsgel_gen_pep'"
        run_query(query, dispatcher)


class ActionTsgelMozPep(Action):
    def name(self) -> str:
        return "action_tsgel_moz_pep"

    def run(self, dispatcher, tracker, domain):
        query = "SELECT answer FROM chatboot_response WHERE intent = 'utter_tsgel_moz_pep'"
        run_query(query, dispatcher)


class ActionTsgelSakanNewStudents(Action):
    def name(self) -> str:
        return "action_tsgel_sakan_new_students"

    def run(self, dispatcher, tracker, domain):
        query = "SELECT start_date, end_date FROM chatboot_response WHERE intent = 'utter_tsgel_sakan_new_students'"
        run_query_paper(query, dispatcher)


class ActionTsgelSakanOldStudents(Action):
    def name(self) -> str:
        return "action_tsgel_sakan_old_students"

    def run(self, dispatcher, tracker, domain):
        query = "SELECT start_date, end_date FROM chatboot_response WHERE intent = 'utter_tsgel_sakan_old_students'"
        run_query_paper(query, dispatcher)


class ActionTsgelSakanPepNewStudents(Action):
    def name(self) -> str:
        return "action_tsgel_sakan_pep_new_students"

    def run(self, dispatcher, tracker, domain):
        query = "SELECT answer FROM chatboot_response WHERE intent = 'utter_tsgel_sakan_pep_new_students'"
        run_query(query, dispatcher)


class ActionTsgelSakanPepOldStudents(Action):
    def name(self) -> str:
        return "action_tsgel_sakan_pep_old_students"

    def run(self, dispatcher, tracker, domain):
        query = "SELECT answer FROM chatboot_response WHERE intent = 'utter_tsgel_sakan_pep_old_students'"
        run_query(query, dispatcher)


class ActionTsgelTrade(Action):
    def name(self) -> str:
        return "action_tsgel_trade"

    def run(self, dispatcher, tracker, domain):
        query = "SELECT start_date, end_date FROM chatboot_response WHERE intent = 'utter_tsgel_trade'"
        run_query_paper(query, dispatcher)


class ActionTsgelSyNo(Action):
    def name(self) -> str:
        return "action_tsgel_sy_no"

    def run(self, dispatcher, tracker, domain):
        query = "SELECT ansstart_date, end_datewear FROM chatboot_response WHERE intent = 'utter_tsgel_sy_no'"
        run_query_paper(query, dispatcher)


class ActionTsgelStopPep(Action):
    def name(self) -> str:
        return "action_tsgel_stop_pep"

    def run(self, dispatcher, tracker, domain):
        query = "SELECT answer FROM chatboot_response WHERE intent = 'utter_tsgel_stop_pep'"
        run_query(query, dispatcher)


class ActionCancelTsgelStopPep(Action):
    def name(self) -> str:
        return "action_cancel_tsgel_stop_pep"

    def run(self, dispatcher, tracker, domain):
        query = "SELECT answer FROM chatboot_response WHERE intent = 'utter_cancel_tsgel_stop_pep'"
        run_query(query, dispatcher)


class ActionTasgelGraduationDocumentPep(Action):
    def name(self) -> str:
        return "action_tasgel_graduation_document_pep"

    def run(self, dispatcher, tracker, domain):
        query = "SELECT answer FROM chatboot_response WHERE intent = 'utter_tasgel_graduation_document_pep'"
        run_query(query, dispatcher)


class ActionReleaseCardInsteadOfDamagedPep(Action):
    def name(self) -> str:
        return "action_release_card_instead_of_damaged_pep"

    def run(self, dispatcher, tracker, domain):
        query = "SELECT answer FROM chatboot_response WHERE intent = 'utter_release_card_instead_of_damaged_pep'"
        run_query(query, dispatcher)


class ActionProtestOnMarkPep(Action):
    def name(self) -> str:
        return "action_protest_on_mark_pep"

    def run(self, dispatcher, tracker, domain):
        query = "SELECT answer FROM chatboot_response WHERE intent = 'utter_protest_on_mark_pep'"
        run_query(query, dispatcher)


class ActionStatementOnUniversityLifePep(Action):
    def name(self) -> str:
        return "action_statement_on_university_life_pep"

    def run(self, dispatcher, tracker, domain):
        query = "SELECT answer FROM chatboot_response WHERE intent = 'utter_statement_on_university_life_pep'"
        run_query(query, dispatcher)


class ActionUniversityCardInsteadOfLostPep(Action):
    def name(self) -> str:
        return "action_university_card_instead_of_lost_pep"

    def run(self, dispatcher, tracker, domain):
        query = "SELECT answer FROM chatboot_response WHERE intent = 'utter_university_card_instead_of_lost_pep'"
        run_query(query, dispatcher)


class ActionSymmetricTransformationPep(Action):
    def name(self) -> str:
        return "action_symmetric_transformation_pep"

    def run(self, dispatcher, tracker, domain):
        query = "SELECT answer FROM chatboot_response WHERE intent = 'utter_symmetric_transformation_pep'"
        run_query(query, dispatcher)


class ActionAsymmetricTransformationPep(Action):
    def name(self) -> str:
        return "action_asymmetric_transformation_pep"

    def run(self, dispatcher, tracker, domain):
        query = "SELECT answer FROM chatboot_response WHERE intent = 'utter_asymmetric_transformation_pep'"
        run_query(query, dispatcher)


class ActionPhLink(Action):
    def name(self) -> str:
        return "action_Ph_link"

    def run(self, dispatcher, tracker, domain):
        query = "SELECT answer FROM chatboot_response WHERE intent = 'utter_Ph_link'"
        run_query(query, dispatcher)


class ActionCircutLink(Action):
    def name(self) -> str:
        return "action_circut_link"

    def run(self, dispatcher, tracker, domain):
        query = "SELECT answer FROM chatboot_response WHERE intent = 'utter_circut_link'"
        run_query(query, dispatcher)


class ActionRbcsArcLink(Action):
    def name(self) -> str:
        return "action_Rbcs_arc_link"

    def run(self, dispatcher, tracker, domain):
        query = "SELECT answer FROM chatboot_response WHERE intent = 'utter_Rbcs_arc_link'"
        run_query(query, dispatcher)


class ActionTeleGroupLink(Action):
    def name(self) -> str:
        return "action_tele_group_link"

    def run(self, dispatcher, tracker, domain):
        query = "SELECT answer FROM chatboot_response WHERE intent = 'utter_tele_group_link'"
        run_query(query, dispatcher)


class ActionDoamStartDate(Action):
    def name(self) -> str:
        return "action_doam_start_date"

    def run(self, dispatcher, tracker, domain):
        query = "SELECT start_date, end_date FROM chatboot_response WHERE intent = 'utter_doam_start_date'"
        run_query_paper(query, dispatcher)


class ActionUniOfficeWork(Action):
    def name(self) -> str:
        return "action_uni_office_work"

    def run(self, dispatcher, tracker, domain):
        query = "SELECT answer FROM chatboot_response WHERE intent = 'utter_uni_office_work'"
        run_query(query, dispatcher)


class ActionPepWorkLoc(Action):
    def name(self) -> str:
        return "action_pep_work_loc"

    def run(self, dispatcher, tracker, domain):
        query = "SELECT answer FROM chatboot_response WHERE intent = 'utter_pep_work_loc'"
        run_query(query, dispatcher)