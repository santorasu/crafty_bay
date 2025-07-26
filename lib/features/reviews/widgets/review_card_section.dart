import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../products/controller/product_review_controller.dart';

Widget reviewCardSection() {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: ListView.separated(
        itemCount: Get.find<ProductReviewController>().reviewList.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          return GetBuilder<ProductReviewController>(
            builder: (controller) {
              final review = controller.reviewList[index];
              return Card(
                elevation: 3,
                shadowColor: Colors.black12,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 24,
                            backgroundColor: Colors.grey.shade400,
                            foregroundColor: Colors.white,
                            child: const Icon(Icons.person_outline, size: 30),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Text(
                              review.userName.isEmpty
                                  ? 'John Doe'
                                  : review.userName,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      Text(
                        review.comment.isEmpty
                            ? 'ekta review korte de vai, ekta review korte de vai, ekta review korte de vai, ekta review korte de vai, ekta review korte de vai, ekta review korte de vai, ekta review korte de vai, ekta review korte de vai, ekta review korte de vai, ekta review korte de vai, ekta review korte de vai, ekta review korte de vai, ekta review korte de vai, ekta review korte de vai, ekta review korte de vai, ekta review korte de vai, ekta review korte de vai, ekta review korte de vai, ekta review korte de vai, ekta review korte de vai, ekta review korte de vai, ekta review korte de vai,'
                            : review.comment,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: Colors.grey.shade800,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    ),
  );
}
