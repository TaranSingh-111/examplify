class RegisterRequest{
  final String name;
  final String email;
  final String password;
  final int studentno;
  final String branch;
  final String section;
  final int year;

  RegisterRequest({
    required this.name,
    required this.email,
    required this.password,
    required this.studentno,
    required this.branch,
    required this.section,
    required this.year,
});

  Map<String, dynamic> toJson(){
    return {
      'name' : name,
      'email' : email,
      'password' : password,
      'studentno' : studentno,
      'branch' : branch,
      'section' : section,
      'year' : year,
    };
  }
}