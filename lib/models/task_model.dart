class TaskModel {
  static const String collectionName = "TaskCollection";
  String id;

  String taskName;

  String description;

  int selectedDate;

  bool isDone;

  TaskModel({
     this.id = "",
    required this.taskName,
    required this.description,
    required this.selectedDate,
      this.isDone = false,
  });

  factory TaskModel.fromFireStore(Map<String, dynamic> json) => TaskModel(
        id: json["id"],
        taskName: json["taskName"],
        description: json["description"],
        selectedDate: json["selectedDate"],
        isDone: json["isDone"],
      );

  Map<String, dynamic> toFireStore() {
    return {
      "id": id,
      "taskName": taskName,
      "description": description,
      "selectedDate": selectedDate,
      "isDone": isDone,
    };
  }
}
