import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/app_colors.dart';
import '../../../core/ui/widgets/centered_circular_progress_indicator.dart';
import '../../products/controller/create_review_controller.dart';

class CreateReviewScreen extends StatefulWidget {
  const CreateReviewScreen({super.key, required this.id});

  final String id ;
  static const name = 'Create Review Screen';

  @override
  State<CreateReviewScreen> createState() => _CreateReviewScreenState();
}

class _CreateReviewScreenState extends State<CreateReviewScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _reviewTeController = TextEditingController();
  final GlobalKey<FormState> _formKey  = GlobalKey<FormState>();
  final CreateReviewController controller =Get.find<CreateReviewController>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          'Create Review',
          style: TextStyle(fontWeight: FontWeight.normal),
        ),
        centerTitle: true,
        backgroundColor: AppColors.themColor.shade600,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 8),
              TextFormField(
                controller: _firstNameController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(hintText: "First Name"),
                validator: (String? value) {
                  if (value?.trim().isEmpty ?? true) {
                    return 'Enter a valid First Name';
                  }
                  return null;
                },
              ),

              SizedBox(height: 18),
              TextFormField(
                controller: _lastNameController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    hintText: "Last Name"),
                validator: (String? value) {
                  if (value?.trim().isEmpty ?? true) {
                    return 'Enter a valid Last Name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 18),
              TextFormField(
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'Enter your comment';
                  }
                  return null;
                },
                controller: _reviewTeController,
                maxLines: 6,
                decoration: InputDecoration(hintText: 'Write Review'),
              ),
              SizedBox(height: 18),

              ElevatedButton(
                onPressed:()=> _onTapSubmitReview(),
                child: Visibility(
                  visible: controller.isLoading == false,
                  replacement: CenteredCircularProgressIndicator(),
                  child: Text(
                    'Submit',
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _onTapSubmitReview()async{

    int rating = controller.rating;

    Map<String,dynamic> body = {
      "product": widget.id,
      "comment": _reviewTeController.text.trim() ,
      "rating": rating
    };

    if(_formKey.currentState!.validate()){
      bool isSuccess = await  controller.createReview(body);

      if(isSuccess){
        _reviewTeController.clear();
        Get.snackbar('Thank you', 'your opinion is more valuable for us');
      }
    }
Navigator.pop(context);
  }

}
