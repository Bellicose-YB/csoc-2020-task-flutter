import 'package:flutter/material.dart';
import 'package:gmailapp/models/mail_description.dart';
import 'package:gmailapp/utils/database_helper.dart';
import 'package:intl/intl.dart';

class Compose extends StatefulWidget {
  final String appBarTitle;
  final Maildescription des;

  Compose(this.des,this.appBarTitle);

	@override
  State<StatefulWidget> createState() {

    return NoteDetailState(this.des,this.appBarTitle);
  }
}

class NoteDetailState extends State<Compose> {

	/*static var _priorities = ['High', 'Low'];*/
  String appBarTitle;
  Maildescription des;

	TextEditingController sourceController = TextEditingController();
  TextEditingController recieverController = TextEditingController();
	TextEditingController subjectController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  NoteDetailState(this.des,this.appBarTitle);

	@override
  Widget build(BuildContext context) {

		TextStyle textStyle = Theme.of(context).textTheme.title;

      sourceController.text = des.from;
      recieverController.text = des.to;
      dateController.text = des.date;
 	    subjectController.text = des.subject;
      emailController.text = des.body;    

    return Scaffold(
	    appBar: AppBar(
		    title: Text(
          'Compose',
          style: TextStyle(
            color: Colors.white
          )
        ),

        backgroundColor: Colors.black38,
	    ),

	    body: Padding(
		    padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
		    child: ListView(
			    children: <Widget>[
/*
			    	// First element
				    ListTile(
					    title: DropdownButton(
							    items: _priorities.map((String dropDownStringItem) {
							    	return DropdownMenuItem<String> (
									    value: dropDownStringItem,
									    child: Text(dropDownStringItem),
								    );
							    }).toList(),

							    style: textStyle,

							    value: 'Low',

							    onChanged: (valueSelectedByUser) {
							    	setState(() {
							    	  debugPrint('User selected $valueSelectedByUser');
							    	});
							    }
					    ),
				    ),
*/
				    // Second Element
				    Padding(
					    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
					    child: TextField(
						    controller: sourceController,
						    style: textStyle,
						    onChanged: (value) {
						    	debugPrint('Something changed in Title Text Field');
                  updatefrom();
						    },
                
						    decoration: InputDecoration(
							    labelText: 'From',
							    labelStyle: TextStyle(
                      color: Colors.black12
                      ),

                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 1.0),
                  ),

							    border: OutlineInputBorder(
								    borderRadius: BorderRadius.circular(5.0)
							    )
						    ),
					    ),
				    ),

				    // Third Element
				    Padding(
					    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
					    child: TextField(
						    controller: recieverController,
						    style: textStyle,
						    onChanged: (value) {
							    debugPrint('Something changed in Description Text Field');
                  updateto();
						    },
						    decoration: InputDecoration(
								    labelText: 'To',
								    labelStyle: TextStyle(
                      color: Colors.black12
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 1.0),
                    ),

								    border: OutlineInputBorder(
										    borderRadius: BorderRadius.circular(5.0)
								    )
						    ),
					    ),
				    ),
/*
            Padding(
					    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
					    child: TextField(
						    controller: dateController,
						    style: textStyle,
						    onChanged: (value) {
						    	debugPrint('Something changed in date Text Field');
                  //updatedate();
						    },
                
						    decoration: InputDecoration(
							    labelText: 'Date',
							    labelStyle: TextStyle(
                      color: Colors.black12
                      ),

                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 1.0),
                  ),

							    border: OutlineInputBorder(
								    borderRadius: BorderRadius.circular(5.0)
							    )
						    ),
					    ),
				    ),
*/

            // Fourth Element
            Padding(
					    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
					    child: TextField(
						    controller: subjectController,
						    style: textStyle,
						    onChanged: (value) {
							    debugPrint('Something changed in Subeject Text Field');
                  updatesubject();
						    },
						    decoration: InputDecoration(
								    labelText: 'Subject',
								    labelStyle: TextStyle(
                      color: Colors.black12
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 1.0),
                    ),

								    border: OutlineInputBorder(
										    borderRadius: BorderRadius.circular(5.0)
								    )
						    ),
					    ),
				    ),


            // Fifth Element
            Padding(
					    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
					    child: TextField(
						    controller: emailController,
                keyboardType: TextInputType.multiline,
                maxLines: 5,
						    style: textStyle,
						    onChanged: (value) {
							    debugPrint('Something changed in Description Text Field');
                  updatebody();
						    },
						    decoration: InputDecoration(
								    labelText: 'Compose',
								    labelStyle: TextStyle(
                      color: Colors.black12
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 1.0),
                    ),

								    border: OutlineInputBorder(
										    borderRadius: BorderRadius.circular(5.0)
								    )
						    ),
					    ),
				    ),


				    // sixth Element
				    Padding(
					    padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
					    child: Row(
						    children: <Widget>[
						    	Expanded(
								    child: RaisedButton(
									    color: Colors.red,//Theme.of(context).primaryColorDark,
									    textColor: Colors.white,//Theme.of(context).primaryColorLight,
									    child: Text(
										    'Delete',
										    textScaleFactor: 1.5,
									    ),
									    onPressed: () {
									    	setState(() {
									    	  debugPrint("Delete button clicked");
									    	});
									    },
								    ),
							    ),

							    Container(width: 5.0,),

							    Expanded(
								    child: RaisedButton(
									    color: Colors.black26,//Theme.of(context).primaryColorDark,
									    textColor: Colors.white,//Theme.of(context).primaryColorLight,
									    child: Text(
										    'Save',
										    textScaleFactor: 1.5,
									    ),
									    onPressed: () {
										    setState(() {
											    debugPrint("Save button clicked");
                          _save();      
										    });
									    },
								    ),
							    ),

						    ],
					    ),
				    ),

			    ],
		    ),
	    ),

    );
  }
  void updatefrom(){
    des.from = sourceController.text;
  }
  
  void updateto(){
    des.to = recieverController.text;
  }
  
  void updatedate(){
    des.date = dateController.text;
  }
  
  void updatesubject(){
    des.subject = subjectController.text;
  }

  void updatebody(){
    des.body = emailController.text;
  }
  DatabaseHelper helper = DatabaseHelper();
  void _save() async {
    //movetoLastScreen();
    des.date=DateFormat.yMMMd().format(DateTime.now());
    int result;
    if(des.id!=null){
      result = await helper.updateNote(des);
    }else{
      result = await helper.updateNote(des);
    }
    if(result!=0){//Success
      _showAlertdialog('Status','email sent successfully');
    }else{//failure
      _showAlertdialog('Status','email not sent');
    }
  }
  _showAlertdialog(String title,String message){
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(context: context,
              builder: (_)=> alertDialog
    );
  }
}
