import 'package:get/get.dart';
import 'package:crafty_bay/app/urls.dart';
import 'package:crafty_bay/core/services/network/network_client.dart';
import '../../data/models/review_screen_model.dart';

class ReviewController extends GetxController {
  bool _inProgress = false;
  String? _errorMessage;
  late ReviewResponseModel _reviewResponse;

  bool get inProgress => _inProgress;
  String? get errorMessage => _errorMessage;
  ReviewResponseModel get reviewResponse => _reviewResponse;

  Future<bool> submitReview(Map<String, dynamic> body) async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    final NetworkResponse response = await Get.find<NetworkClient>().postRequest(
      Urls.reviewsUrl,
      body: body,
    );

    if (response.isSuccess && response.responseData != null) {
      _reviewResponse = ReviewResponseModel.fromJson(response.responseData!);
      _errorMessage = null;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage ?? "Unknown error occurred";
    }

    _inProgress = false;
    update();
    return isSuccess;
  }
}
