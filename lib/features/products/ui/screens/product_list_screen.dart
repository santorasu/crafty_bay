import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../../../core/ui/widgets/centered_circular_progress_indicator.dart';
import '../../../common/ui/widgets/product_card.dart';
import '../../controller/new_prduct_controller.dart';
import '../../controller/popular_product_controller.dart';
import '../../controller/special_product_controller.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, required this.tag});

  final String tag;

  static final String name = 'product-list';

  @override
  State<ProductListScreen> createState() => _ProductList();
}

class _ProductList extends State<ProductListScreen> {
  final ScrollController _scrollController = ScrollController();
  dynamic _controller;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(loadMoreData);
    _controller = sourceCheck();
  }

  void loadMoreData() {
    if (_scrollController.position.extentAfter < 50) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: _onTapBack,
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        title: Text(widget.tag, style: TextTheme.of(context).headlineSmall),
      ),
      body: GetBuilder(
        init: _controller,
        builder: (_) {
          return Visibility(
            visible: _controller.isLoading == false,
            replacement: Center(child: CenteredCircularProgressIndicator()),
            child: _controller.productList.isEmpty
                ? Center(child: Text('No product on this category'))
                : Column(
                    children: [
                      Expanded(
                        child: GridView.builder(
                          controller: _scrollController,
                          itemCount: _controller.productList.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                mainAxisSpacing: 8,
                                crossAxisSpacing: 8,
                                childAspectRatio: 0.7,
                              ),
                          itemBuilder: ((BuildContext context, int index) {
                            Logger().w(_controller.productList.length);

                            var controller = _controller.productList[index];
                            return FittedBox(
                              child: ProductCard(
                                id: controller.id,
                                imageUrl: controller.imageUrl.isNotEmpty
                                    ? controller.imageUrl.first
                                    : null,
                                title: controller.name,
                                price: controller.price,
                              ),
                            );
                          }),
                        ),
                      ),
                      _controller.isLoading
                          ? LinearProgressIndicator()
                          : SizedBox.shrink(),
                    ],
                  ),
          );
        },
      ),
    );
  }

  dynamic sourceCheck() {
    if (widget.tag.toLowerCase() == 'new') {
      return Get.find<NewProductController>();
    } else if (widget.tag.toLowerCase() == 'special') {
      return Get.find<SpecialProductController>();
    } else if (widget.tag.toLowerCase() == 'popular') {
      return Get.find<PopularProductController>();
    } else {
      return Get.find<NewProductController>();
    }
  }

  _onTapBack() {
    Navigator.pop(context);
  }
}
