class GroupModel {
  final String id;
  final DateTime createdDateTime;
  final String description;
  final String displayName;
  final String mail;
  final String mailNickname;
  final String visibility;

  GroupModel({
    required this.id,
    required this.createdDateTime,
    required this.description,
    required this.displayName,
    required this.mail,
    required this.mailNickname,
    required this.visibility,
  });

  factory GroupModel.fromJson(Map<String, dynamic> json) => GroupModel(
    id: json["id"],
    createdDateTime: DateTime.parse(json["createdDateTime"]),
    description: json["description"],
    displayName: json["displayName"],
    mail: json["mail"],
    mailNickname: json["mailNickname"],
    visibility: json["visibility"],
  );
}
