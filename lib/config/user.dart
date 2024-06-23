class User {
  final String id;
  final int age;
  final String gender;
  final bool hypertension;
  final bool heartDisease;
  final bool everMarried;
  final String workType;
  final int residenceType;
  final double avgGlucoseLevel;
  final double bmi;
  final String tel;

  User({
    required this.id, required this.age, required this.gender,
    required this.hypertension, required this.heartDisease,
    required this.everMarried, required this.workType,
    required this.residenceType, required this.avgGlucoseLevel,
    required this.bmi, required this.tel
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      age: map['age'],
      gender: map['gender'],
      hypertension: map['hypertension'],
      heartDisease: map['heart_disease'],
      everMarried: map['ever_married'],
      workType: map['work_type'],
      residenceType: map['residence_type'],
      avgGlucoseLevel: map['avg_glucose_level'],
      bmi: map['bmi'],
      tel: map['tel'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'age': age,
      'gender': gender,
      'hypertension': hypertension,
      'heart_disease': heartDisease,
      'ever_married': everMarried,
      'work_type': workType,
      'residence_type': residenceType,
      'avg_glucose_leve;': avgGlucoseLevel,
      'bmi': bmi,
      'tel': tel
    };
  }
}
