class Usermodel{
  String username ;
  String email ;
  String uid;
  bool isVerify ;
  Usermodel({
    required  this.username,
    required  this.email,
    required  this.uid,
    required  this.isVerify,



});


  String afficheU() {
    return '$username de $email a id:$uid et islogged : $isVerify';
  }



}