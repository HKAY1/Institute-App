import 'package:get/get.dart';
import 'package:imstitute/models/study_modals.dart';

import '../services/services.dart';

class NotesController extends GetxController {
  @override
  void onInit() {
    fetchMaterial();
    super.onInit();
  }

  var data = <Notes>[].obs;
  var isLoading = true.obs;
  void fetchMaterial() async {
    isLoading(true);
    var notes = await Services.fetchStudy();
    data.value = notes;
    isLoading(false);
  }
}
