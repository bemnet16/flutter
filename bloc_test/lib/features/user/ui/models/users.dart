class Users {
  String user;
  String userImg;
  String imageUrl;

  Users(this.user, this.userImg, this.imageUrl);

  static List<Users> generateCourses() {
    return [
      Users('Bemnet Adugnaw', 'images/image-3.png', 'images/image-1.png'),
      Users('Alex Ismaeal', 'images/image-2.png', 'images/image-2.png'),
      Users('Hile Anteneh', 'images/image-1.png', 'images/image-3.png'),
    ];
  }
}
