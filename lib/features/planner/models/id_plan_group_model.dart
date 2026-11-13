class IdPlanGroupModel {
  final String id;
  final String title;
  final String groupId;
  final String createdDateTime;

  IdPlanGroupModel({
    required this.id,
    required this.title,
    required this.groupId,
    required this.createdDateTime,
  });

  factory IdPlanGroupModel.fromJson(Map<String, dynamic> json) =>
      IdPlanGroupModel(
        id: json["id"],
        title: json["title"],
        groupId: json["groupId"],
        createdDateTime: json["createdDateTime"],
      );
}
