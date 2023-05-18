public with sharing class PdfLendaController {
@AuraEnabled public NotatEStudenteve [] notatEStudenteve { get; set; }
public PdfLendaController(){}
public PdfLendaController(Subject__c lenda){
    this.notatEStudenteve =new List<NotatEStudenteve>();
    NotatEStudenteve nots = new NotatEStudenteve();
   Subject__c lendet =[select Id,name,Teacher__r.Name,  (select id, name, Student__r.name from grades__r)from Subject__c where id =: lenda.id ];
   Map<String,List<String>> mappa = new Map<String,List<String>>();
   List<String> studentet4 = new List<String>();
   List<String> studentet5 = new List<String>();
   List<String> studentet6 = new List<String>();
   List<String> studentet7 = new List<String>();
   List<String> studentet8 = new List<String>();
   List<String> studentet9 = new List<String>();
   List<String> studentet10 = new List<String>();
   for(Grade__c n :lendet.grades__r){
    switch on n.name{
        when '4'{
            studentet4.add(n.Student__r.name);
        }
        when '5'{
            studentet5.add(n.Student__r.name);
        }
        when '6'{
            studentet6.add(n.Student__r.name);
        }
        when '7'{
            studentet7.add(n.Student__r.name);
        }
        when '8'{
            studentet8.add(n.Student__r.name);
        }
        when '9'{
            studentet9.add(n.Student__r.name);
        }
        when '10'{
            studentet10.add(n.Student__r.name);
        }
    }
    
   }
   mappa.put('4',studentet4);
   mappa.put('5',studentet5);
   mappa.put('6',studentet6);
   mappa.put('7',studentet7);
   mappa.put('8',studentet8);
   mappa.put('9',studentet9);
   for(String i: mappa.keySet()){
        nots.setData(lendet, i, mappa.get(i));
        notatEStudenteve.add(nots);
    }
    //nots.setData(lenda, mappa.keySet(), mappa.values());
    

}
public class  NotatEStudenteve{
        @AuraEnabled public List<String> studenti { get; set; }
        @AuraEnabled public String nota { get; set; }
        @AuraEnabled public String pedagogu { get; set; }
        @AuraEnabled public String emri { get; set; }


    public void setData(Subject__c lenda, String nota, List<String> studentet){
    this.studenti = studentet;
    this.nota = nota;
    this.pedagogu = lenda.Teacher__r.Name;
    this.emri = lenda.Name;
}

}





}

//classe Apex sembra essere utilizzata per recuperare le valutazioni degli studenti 
//Clin base alla materia e organizzarle in un formato appropriato per la generazione di un documento PDF