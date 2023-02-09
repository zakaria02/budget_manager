class UserDto {
  String? uid;
  final String? displayName;
  UserDto({
    this.uid,
    this.displayName,
  });

  UserDto copyWith({
    String? uid,
    String? displayName,
  }) {
    return UserDto(
      uid: uid ?? this.uid,
      displayName: displayName ?? this.displayName,
    );
  }
}
