import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../../../core/ui/widgets/centered_circular_progress_indicator.dart';
import '../../../auth/ui/controller/login_controller.dart';

class CreateReviewScreen extends StatefulWidget {
  const CreateReviewScreen({super.key});
  static final String name = '/create-review';


  @override
  State<CreateReviewScreen> createState() => _CreateReviewScreenState();
}

class _CreateReviewScreenState extends State<CreateReviewScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _reviewController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Review')),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24,horizontal: 28),
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
                controller: _reviewController,
                textInputAction: TextInputAction.next,
                maxLines: 7,
                decoration: InputDecoration(
                  hintText: "Write a review",
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  border: OutlineInputBorder(),
                ),
                validator: (String? value) {
                  if (value?.trim().isEmpty ?? true) {
                    return 'Enter a review';
                  }
                  return null;
                },
              ),


              SizedBox(height: 16),
              GetBuilder<LoginController>(
                builder: (controller) {
                  return Visibility(
                    visible: controller.inProgress == false,
                    replacement: CenteredCircularProgressIndicator(),
                    child: ElevatedButton(
                      onPressed: _onTapSubmitButton,
                      child: Text('Submit'),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _onTapSubmitButton() {

  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _reviewController.dispose();
    super.dispose();
  }
}
