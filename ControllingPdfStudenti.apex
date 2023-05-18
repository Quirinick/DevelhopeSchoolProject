public with sharing class controllingPdfStudenti {
     public ApexPages.StandardController controller;
 	public List<Grade__c > notaList{get; set;}
 	public Student__c  s {get; set;}
 	public String studentId{get;set;}
 	public Date Today { get { return Date.today(); }}

public controllingPdfStudenti(ApexPages.StandardController controller) {
    s = new Student__c();
    studentId = controller.getId();
    notaList = [select id, name,Subject__c , Subject__r.name, Student__c from Grade__c where Student__c =: studentId order by Subject__r.name];
}
}

// Questa classe è progettata per gestire la generazione di un file PDF contenente le valutazioni dei voti di uno studente specifico.