import 'package:flutter/material.dart';
import 'package:gmailapp/app_screens/compose.dart';
import 'package:gmailapp/models/mail_description.dart';
import 'package:gmailapp/utils/database_helper.dart';
import 'package:sqflite/sqflite.dart';
//import 'package:gmailapp/app_screens/Discription.dart';


class MailList extends StatefulWidget{
    
    @override
    State<StatefulWidget> createState(){

      return GmailListState();
    }
}


abstract class GmailListState extends State<MailList>{
  DatabaseHelper databaseHelper=DatabaseHelper();
  List<Maildescription> maillist;
  int count=0;  
 
  @override
  Widget build(BuildContext context) {
    if(maillist == null) {
      maillist=List<Maildescription>();
      updateListView();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          ('Mail'),
          style: TextStyle(
            color: Colors.white
          )
        ),
        backgroundColor: Colors.black54,
        leading: Icon( Icons.menu,color: Colors.white,),
      ),
      body: getMailListView(),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
        backgroundColor: Colors.white,
        elevation: 15.0,
        autofocus: true,
        //hoverElevation: 5.0,
        onPressed: (){
          debugPrint('tapped on FAB');
          gotoCompose(Maildescription('', '', '', '', ''),'Compose');
        },
        tooltip: 'Create Mail',
        child: Icon(Icons.create,color: Colors.black54,),

      ),
    );
  }
  
  ListView getMailListView() {
    TextStyle titleStyle = Theme.of(context).textTheme.subtitle1;
    
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position){
        return Card(
          color: Colors.white,
          elevation: 3.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue[100],
              child: Icon(Icons.mail_outline,color: Colors.blue[900],),
            ),
            title: Text(this.maillist[position].to,style: titleStyle,),

            subtitle: Text(this.maillist[position].date),

            trailing: GestureDetector(
              child: Icon(Icons.delete_outline,color: Colors.redAccent[700],),
              onTap: () {
                _delete(context, maillist[position]);
              },
            ),

            onTap: () {
              debugPrint('Description');
              gotoCompose(this.maillist[position], 'Compose');
              //gotoDiscription();
            },
          ), 
        );
      }, 
    );
  }
  void _delete(BuildContext context,Maildescription mail )async{

    int result = await databaseHelper.deleteNote(mail.id);
    if(result!=0){
      _showSnackBar(context, 'Note Deleted Successfully');
      updateListView();
    }
  }

  void _showSnackBar(context, String message) {

    final snackbar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackbar);
  }

  void gotoCompose(Maildescription mail,String title){
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Compose(mail,title);
    }));
  }
  /*void gotoDiscription(){
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Discription();
    }));
  }*/
  void updateListView(){
    debugPrint('update down');
    final Future<Database>dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database){
      
      Future<List<Maildescription>> maillistfuture = databaseHelper.getNoteList();
      maillistfuture.then((mailList){
        setState((){
          this.maillist=mailList;
          this.count=mailList.length;
        });
      }); 
    });
  }
}
