
class ConditionModel {
  const ConditionModel({
    required this.text,
    required this.icon,
  });
  final String text;
  final String icon;

  factory ConditionModel.formJson(jsonData) {
    return ConditionModel(
      text: jsonData['text'],
      icon: jsonData['icon'],
    );
  }
}
