import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:imstitute/models/study_modals.dart';

import '../services/services.dart';

class StudyController extends GetxController {
  var g = GetStorage();
  @override
  void onInit() {
    fetchMaterial();
    subjects();
    super.onInit();
  }

  var data = <Notes>[].obs;
  var isLoading = true.obs;
  var subj = <String>[].obs;
  void fetchMaterial() async {
    isLoading(true);
    var notes = await Services.fetchStudy();
    data.value = notes;
    isLoading(false);
  }

  void subjects() {
    subj(g.read('subjects') ?? []);
  }
}
