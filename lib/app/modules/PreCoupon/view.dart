import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/components/custom_future_builder.dart';
import 'package:getx_skeleton/app/repositories/coupons/coupon_repository.dart';

import '../../../models/coupon/coupon_model.dart';
import '../../../models/coupon/free_coupon.dart';
import '../../../utils/color_manager.dart';
import '../../components/CustomBottomNavbar/custom_buttom_navbar.dart';
import 'index.dart';
import 'widgets/widgets.dart';

class PrecouponPage extends GetView<PrecouponController> {
  const PrecouponPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const HelloWidget();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PrecouponController>(
      builder: (_) {
        final double screenW = MediaQuery.of(context).size.width;
        return Scaffold(
          backgroundColor: ColorManager.base20,
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Container(
                      height: 60,
                      width: 250,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: ColorManager.shadowColor.withOpacity(0.3),
                              blurRadius: 10),
                          BoxShadow(
                            color: ColorManager.shadowColor.withOpacity(0.3),
                            spreadRadius: -2,
                            blurRadius: 5,
                          ),
                        ],
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                          child: Text(
                        "Premium Tahminler",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: ColorManager.base00),
                      )),
                    ),
                  ),
                ),
                Expanded(
                  child: CustomFutureBuilder<List<FreeCoupon>>(
                      future: controller.getFreeCoupons(COUPONTYPE.NEW),
                      onError: (msg) {
                        return Text(msg);
                      },
                      onSuccess: (items) {
                        return ListView.builder(
                            itemCount: items.length,
                            itemBuilder: (context, itemNumber) {
                              var item = items[itemNumber];
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 24),
                                child: Container(
                                  height: 80,
                                  width: screenW * 0.9,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: ColorManager.shadowColor
                                              .withOpacity(0.3),
                                          blurRadius: 10),
                                      BoxShadow(
                                        color: ColorManager.shadowColor
                                            .withOpacity(0.3),
                                        spreadRadius: -2,
                                        blurRadius: 5,
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(15),
                                    color: ColorManager.base00,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "Takım1",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge,
                                      ),
                                      CircleAvatar(),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 12.0),
                                            child: Text(
                                              "06:30",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium
                                                  ?.copyWith(
                                                      color: Colors.deepOrange),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 8.0),
                                            child: Text(
                                              "30 oct",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium
                                                  ?.copyWith(
                                                      color: Colors.grey),
                                            ),
                                          )
                                        ],
                                      ),
                                      CircleAvatar(),
                                      Text(
                                        "Takım1",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                      },
                      onDataEmpty: () {
                        return Container();
                      }),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
