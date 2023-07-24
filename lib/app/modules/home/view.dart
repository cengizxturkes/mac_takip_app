import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/routes/app_pages.dart';

import '../../../utils/color_manager.dart';
import 'index.dart';
import 'widgets/widgets.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: ColorManager.base20,
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarIconBrightness: Brightness.dark),
            elevation: 0,
            toolbarHeight: 80,
            leadingWidth: 80,
            centerTitle: true,
            leading: Padding(
              padding: const EdgeInsets.all(16.0),
              child: CircleAvatar(
                backgroundColor: ColorManager.base00,
                child: Icon(Icons.person),
              ),
            ),
            title: Text("Uygulama Adı"),
          ),
          backgroundColor: ColorManager.base20,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  HomeCouponTypeButton(
                    bgColor: Theme.of(context).colorScheme.primary,
                    textColor: ColorManager.base00,
                    title: "Premium Tahminler",
                    routePath: Routes.PRECOUPON,
                  ),
                  HomeCouponTypeButton(
                    bgColor: ColorManager.base00,
                    textColor: ColorManager.base120,
                    title: "Günün Kuponu",
                    routePath: Routes.COUPON,
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
                child: Text(
                  "Öne Çıkan Maçlar",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              SizedBox(
                height: 200,
                child: PageView.builder(
                    controller: controller.pageController,
                    itemCount: 5,
                    itemBuilder: (context, itemNumber) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Container(
                          height: 180,
                          width: 180,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color:
                                      ColorManager.shadowColor.withOpacity(0.3),
                                  blurRadius: 10),
                              BoxShadow(
                                color:
                                    ColorManager.shadowColor.withOpacity(0.3),
                                spreadRadius: -2,
                                blurRadius: 5,
                              ),
                            ],
                            image: DecorationImage(
                              opacity: 0.3,
                              alignment: Alignment.topRight,
                              image: itemNumber.isEven
                                  ? AssetImage(
                                      "assets/images/homepage_screen1.png")
                                  : AssetImage(
                                      "assets/images/homepage_screen2.png"),
                            ),
                            color: itemNumber.isEven
                                ? Colors.purple
                                : Colors.blueAccent,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Column(
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Premier League",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "Week 10",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                          radius: 32,
                                        ),
                                        Text(
                                          "Newcastle",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Text("Home",
                                            style:
                                                TextStyle(color: Colors.white))
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text("0:3",
                                            style:
                                                TextStyle(color: Colors.white)),
                                        Container(
                                          height: 40,
                                          width: 60,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              color: itemNumber.isOdd
                                                  ? Colors.purple
                                                  : Colors.blueAccent),
                                          child: Center(
                                              child: Text("83",
                                                  style: TextStyle(
                                                      color: Colors.white))),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                          radius: 32,
                                        ),
                                        Text("Newcastle",
                                            style:
                                                TextStyle(color: Colors.white)),
                                        Text("Home",
                                            style:
                                                TextStyle(color: Colors.white))
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 12,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 6,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        crossAxisCount: 3),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: ColorManager.base00,
                          boxShadow: [
                            BoxShadow(
                                color:
                                    ColorManager.shadowColor.withOpacity(0.3),
                                blurRadius: 10),
                            BoxShadow(
                              color: ColorManager.shadowColor.withOpacity(0.3),
                              spreadRadius: -2,
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              controller.buttonText[index],
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
