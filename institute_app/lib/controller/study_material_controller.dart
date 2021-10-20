import 'package:get/get.dart';
import 'package:imstitute/models/study_modals.dart';

import '../services/services.dart';

class StudyMaterialController extends GetxController {
  @override
  void onInit() {
    fetchMaterial();
    super.onInit();
  }

  var isLoading = true.obs;
  // var study = Study().obs;
  Future<Study> fetchMaterial() async {
    isLoading(true);
    var events = await Services.fetchStudy();
    // eventList.value = events;
    isLoading(false);
    return events;
  }
}
