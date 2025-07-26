import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/app_colors.dart';
import '../../../core/ui/widgets/centered_circular_progress_indicator.dart';
import '../../products/controller/product_review_controller.dart';
import '../widgets/review_card_section.dart';
import 'create_review_screen.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key, required this.id});

  final String id;

  static final String name = 'ReviewScreen';

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<ProductReviewController>().getReview(id: widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reviews',
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new_sharp, size: 20),
          splashRadius: 20,
        ),
        elevation: 6,
        backgroundColor: AppColors.themColor.shade600,
      ),
      body: GetBuilder<ProductReviewController>(
        builder: (controller) {
          if (controller.isLoading) {
            return const Center(child: CenteredCircularProgressIndicator());
          }
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              reviewCardSection(),
              reviewCountSection(
                count: controller.reviewList.length,
                id: widget.id,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget reviewCountSection({int? count, String? id}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.themColor.shade100,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Reviews (${count ?? 0})',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: AppColors.themColor.shade900,
              ),
            ),
          ),
          GestureDetector(
            onTap: () => _createReviewScreen(id),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.themColor.shade700,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.themColor.shade700.withValues(alpha: 0.4),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(8),
              child: const Icon(Icons.add, color: Colors.white, size: 28),
            ),
          ),
        ],
      ),
    );
  }



  void onTapToCrateReviewScreen() {
    Navigator.pushNamed(context, CreateReviewScreen.name);
  }

  _createReviewScreen(id) {
    Navigator.pushNamed(context, CreateReviewScreen.name, arguments: id);
  }
}
