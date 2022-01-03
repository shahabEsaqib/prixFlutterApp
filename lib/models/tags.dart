
class Tags {

  String name = '';
  var friends = [];
  var hastagged = [];
  var tagedby = [];
   Tags(String name,String friend, String hastagged, String taggedby)
  {
    this.name=name;
    friends.add(friend);
    this.hastagged.add(hastagged);
    this.tagedby.add(taggedby);


  }

}