import 'dart:ui';

import 'package:barg_test/core/assets.dart';
import 'package:barg_test/model/user_model/user_model.dart';
import 'package:barg_test/view/widgets/full_screen_loading_widget..dart';
import 'package:barg_test/view/widgets/glass_widget.dart';
import 'package:barg_test/view_model/main_view_model/main_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class MainView extends StatelessWidget {
  static const path = "/MainView";
  final controller = Get.put<MainViewModel>(MainViewModel());
  MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        _usersListWidget(),
        _loadingWidget(),
        _appBarWidget(),
      ],
    ));
  }

  GetBuilder<MainViewModel> _loadingWidget() {
    return GetBuilder<MainViewModel>(builder: (controller) {
      if (controller.isLoading) {
        return const Padding(
          padding: EdgeInsets.only(top: 120.0),
          child: FullScreenLoadingWidget(),
        );
      } else {
        return const SizedBox();
      }
    });
  }

  SizedBox _usersListWidget() {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: GetBuilder<MainViewModel>(builder: (controller) {
        return ListView.builder(
            itemCount:
                controller.usersList.isEmpty ? 5 : controller.usersList.length,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(top: 120.0, right: 32.0, left: 32.0),
            itemBuilder: (context, index) {
              if (controller.usersList.isEmpty) {
                return _usersListItemSkeletonWidget();
              }
              User user = controller.usersList[index];
              return _usersListItemWidget(user);
            });
      }),
    );
  }

  Padding _usersListItemWidget(User user) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: InkWell(
        onTap: () => controller.getUserById(user.guid ?? ""),
        child: Ink(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 60.0,
                    width: 60.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(user.picture!),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.name!,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black),
                      ),
                      const SizedBox(height: 2.0),
                      SizedBox(
                        width: Get.width * 0.6,
                        child: Text(
                          user.email!,
                          textAlign: TextAlign.start,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 6.0),
              SizedBox(
                width: Get.width,
                child: Text(
                  "Address : " + user.address!,
                  textAlign: TextAlign.start,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Colors.black),
                ),
              ),
              const SizedBox(height: 8.0),
              const Divider()
            ],
          ),
        ),
      ),
    );
  }

  Container _appBarWidget() {
    return Container(
        width: Get.width,
        height: 120.0,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AssetsPath.loginBackgroundImage),
                fit: BoxFit.cover),
            boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 4)]),
        alignment: Alignment.center,
        child: GetBuilder<MainViewModel>(builder: (controller) {
          if (controller.ownerUser == null) {
            return _ownerUserSkeletonWidget();
          }
          return _ownerUserWidget(controller);
        }));
  }

  Padding _ownerUserWidget(MainViewModel controller) {
    return Padding(
      padding: const EdgeInsets.only(right: 25.0, left: 32.0, top: 40.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 60.0,
                    width: 60.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(controller.ownerUser!.picture!),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.ownerUser!.name!,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                      const SizedBox(height: 2.0),
                      SizedBox(
                        width: Get.width * 0.6,
                        child: Text(
                          controller.ownerUser!.email!,
                          textAlign: TextAlign.start,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Icon(Icons.arrow_forward_ios_rounded, color: Colors.white)
            ],
          ),
        ],
      ),
    );
  }

  Padding _usersListItemSkeletonWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(40.0),
                child: Shimmer(
                  color: Colors.grey,
                  child: const SizedBox(
                    height: 60.0,
                    width: 60.0,
                  ),
                ),
              ),
              const SizedBox(width: 8.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Shimmer(
                      color: Colors.grey,
                      child: SizedBox(
                        height: 20.0,
                        width: Get.width * 0.35,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Shimmer(
                      color: Colors.grey,
                      child: SizedBox(
                        height: 15.0,
                        width: Get.width * 0.25,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Shimmer(
              color: Colors.grey[700]!,
              child: SizedBox(
                height: 15.0,
                width: Get.width * 0.6,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding _ownerUserSkeletonWidget() {
    return Padding(
      padding: const EdgeInsets.only(right: 25.0, left: 32.0, top: 40.0),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(40.0),
                child: Shimmer(
                  child: const SizedBox(
                    height: 60.0,
                    width: 60.0,
                  ),
                ),
              ),
              const SizedBox(width: 8.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Shimmer(
                      child: SizedBox(
                        height: 20.0,
                        width: Get.width * 0.3,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Shimmer(
                      child: SizedBox(
                        height: 15.0,
                        width: Get.width * 0.2,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
