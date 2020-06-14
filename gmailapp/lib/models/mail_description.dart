class Maildescription {

  int _id;
  String _from;
  String _to;
  String _subject;
  String _body;  
  String _date;

  Maildescription(this._from,this._to,this._subject,this._body,this._date);
  Maildescription.withId(this._id,this._from,this._to,this._subject,this._body,this._date);
  int get id => _id;
  String get from => _from;
  String get to => _to;
  String get subject => _subject;
  String get body => _body;  
  String get date => _date;

  set from(String newFrom){
    /*if(!checkadd(newFrom)){

    }*/
    this._from=newFrom;
  }
  
  set to(String newTo){
    this._to=newTo;
  }
  
  set subject(String newSubject){
    this._subject=newSubject;
  }

  set body(String newBody){
    this._subject=newBody;
  }

  set date(String newDate){
      this._subject=newDate;
  }

  // Convert Description objects into a Map object
	Map<String, dynamic> toMap() {

		var map = Map<String, dynamic>();
		if (id != null) {
			map['id'] = _id;
		}
		map['From'] = _from;
		map['To'] = _to;
		map['Subject'] = _subject;
    map['Body'] = _body;
		map['Date'] = _date;

		return map;
	}

	// Extract Description object from a Map object
	Maildescription.fromMapObject(Map<String, dynamic> map) {
		this._id = map['id'];
		this._from = map['From'];
		this._to = map['To'];
		this._subject = map['Subject'];
    this._body = map['Body'];
		this._date = map['Date'];
	}
}