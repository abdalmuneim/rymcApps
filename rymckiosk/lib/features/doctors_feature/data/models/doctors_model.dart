import 'package:rymckiosk/generated/assets/assets.dart';

class DoctorModel {
  int? id;
  String? name;
  String? phone;
  String? img;
  String? specialty;
  String? aboutDoctor;
  bool? isBusy;
  String? fcmToken;
  String? deviceId;
  String? createdAt;

  DoctorModel({
    this.id,
    this.name,
    this.phone,
    this.img,
    this.isBusy,
    this.specialty,
    this.aboutDoctor,
    this.fcmToken,
    this.deviceId,
    this.createdAt,
  });

  DoctorModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? "";
    name = json['name'] ?? "";
    img = json['image'] ?? "";
    phone = json['phone'] ?? "";
    isBusy = json['isBusy'] ?? "";
    specialty = json['specialty'] ?? "";
    aboutDoctor = json['aboutDoctor'] ?? "";
    fcmToken = json['fcmToken'] ?? "";
    // deviceId = json['deviceId'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['image'] = img;
    data['phone'] = phone;
    data['isBusy'] = isBusy;
    data['specialty'] = specialty;
    data['aboutDoctor'] = aboutDoctor;
    data['createdAt'] = createdAt;
    data['fcmToken'] = fcmToken;
    data['deviceId'] = deviceId;
    return data;
  }
}

final List<DoctorModel> doctorData = [
  DoctorModel(
    name: "د. مجدي مصطفى",
    phone: "+9661111111",
    img: Assets.assetsImagesDr1,
    isBusy: true,
    specialty: "أخصائي الصدرية\nطب بشري ماجيستير صدرية",
  ),
  DoctorModel(
    name: "DR. Sahar OBG specialist",
    phone: "+9661111111",
    img: Assets.assetsImagesDr2,
    specialty: "أخصائي الصدرية\nطب بشري ماجيستير صدرية",
    isBusy: false,
  ),
  DoctorModel(
    name: "DR. Sahar OBG specialist",
    phone: "+9661111111",
    specialty: "أخصائي الصدرية\nطب بشري ماجيستير صدرية",
    img: Assets.assetsImagesDr3,
    isBusy: false,
  ),
  DoctorModel(
    specialty: "أخصائي الصدرية\nطب بشري ماجيستير صدرية",
    name: "DR. Sahar OBG specialist",
    phone: "+9661111111",
    img: Assets.assetsImagesDr3,
    isBusy: false,
  ),
  DoctorModel(
    name: "DR. Sahar OBG specialist",
    phone: "+9661111111",
    img: Assets.assetsImagesDr3,
    specialty: "أخصائي الصدرية\nطب بشري ماجيستير صدرية",
    isBusy: false,
  ),
];
