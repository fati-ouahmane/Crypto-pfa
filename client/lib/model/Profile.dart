class Profile {

  final String username;
  final String name;
  final String email;


  Profile({

    required this.username,
    required this.name,
    required this.email,

  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(

      username: json['username'] as String,
      name: json['name'] as String,
      email: json['email'] as String,

    );
  }
}
