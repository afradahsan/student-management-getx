class StudentModel{
  int? id;
  String? name;
  String? className;
  String? stream;

  StudentModel({this.id, this.name,this.className, this.stream});

  factory StudentModel.fromMap(Map<dynamic, dynamic> json){
    return StudentModel(
      id: json['id'],
      name: json['name'],
      className: json['className'],
      stream: json['stream']
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'name': name,
      'className': className,
      'stream': stream
    };
  }
}