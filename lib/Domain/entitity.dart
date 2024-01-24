class UserList{
  final Map<String, Map<String, List<String>>> users;

  UserList({required this.users});

  factory UserList.fromJson(Map<String, dynamic> json) {
    return UserList(
      users: Map<String, Map<String, List<String>>>.from(json).map(
            (key, value) => MapEntry(
          key,
          {
            'rooms': List<String>.from(value['rooms']!),
          },
        ),
      ),
    );
  }
}

