import 'package:http/http.dart' as http;
import 'package:teacher_institute/modals/teacher_eventmodal.dart';

class Services {
  static var client = http.Client();

  static Future<Map<String, List<MyEvent>>> fetchEvent() async {
    await Future.delayed(const Duration(seconds: 1));
    return fakeData;
  }
}

var fakeData = <String, List<MyEvent>>{
  '1633804200000': [
    MyEvent(
      name: 'PTM Notice',
      discription: "teri esi ki tesi",
      endDate: 1633804200000,
      startTime: '12:20 PM',
      endTime: '12:30 AM',
    ),
    MyEvent(
      name: 'Guu Notice',
      discription: "teri esi ki tesi",
      endDate: 1633804200000,
      startTime: '12:20 PM',
      endTime: '12:30 AM',
    ),
    MyEvent(
      name: 'poi Notice',
      discription: "teri esi ki tesi",
      endDate: 1633804200000,
      startTime: '12:30 AM',
      endTime: '12:30 AM',
    ),
  ],
  '1635445800000': [
    MyEvent(
      name: 'PTM Notice',
      discription: "teri esi ki tesi",
      endDate: 1633804200000,
      startTime: '12:30 AM',
      endTime: '12:30 AM',
    ),
    MyEvent(
      name: 'Guu Notice',
      discription: "teri esi ki tesi",
      endDate: 1633804200000,
      startTime: '12:30 AM',
      endTime: '12:30 AM',
    ),
    MyEvent(
      name: 'poi Notice',
      discription: "teri esi ki tesi",
      endDate: 1633804200000,
      startTime: '12:30 AM',
      endTime: '12:30 AM',
    ),
    MyEvent(
      name: 'poi Notice',
      discription: "teri esi ki tesi",
      endDate: 1633804200000,
      startTime: '12:30 AM',
      endTime: '12:30 AM',
    ),
  ],
};
