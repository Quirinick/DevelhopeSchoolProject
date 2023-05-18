public class ListNotifie{
@AuraEnabled(cacheable=true) //Expose Apex Methods to Lightning Web Components   
    public static List<NewNotifications> getAllNotifications() {
        List<NewNotifications> returnList = new List<NewNotifications>();
        List<Notifications__c> newNotificationList = [SELECT Id, Name, CreatedDate 
                                                      FROM Notifications__c ORDER BY  CreatedDate DESC];
    
        for(Notifications__c n : newNotificationList ){
            NewNotifications newNot = new NewNotifications(n.Name, n.Id, n.CreatedDate);
            returnList.add(newNot);
          }
            return returnList;
        }
    
public class NewNotifications {
    @AuraEnabled   
    public String name;
    @AuraEnabled
    public String notificationsId;   
    @AuraEnabled
    public Datetime createdDate = date.today();
        
public NewNotifications (String name, Id notificationsId, Datetime createdDate) {
    this.name = name;
    this.notificationsId = notificationsId;
    this.createdDate = createdDate;
    
    }    
 }
}


// Questo codice Apex definisce una classe chiamata "ListNotifie" che fornisce un metodo per ottenere una lista di notifiche e una classe interna "NewNotifications" che rappresenta le informazioni di una singola notifica