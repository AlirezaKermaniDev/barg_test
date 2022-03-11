import 'dart:ui';

import 'package:barg_test/core/assets.dart';
import 'package:barg_test/model/friend_model/friend_model.dart';
import 'package:barg_test/view/widgets/full_screen_loading_widget..dart';
import 'package:barg_test/view_model/profile_view_model/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  static const path = "/ProfileView";
  final controller =
      Get.put<ProfileViewModel>(ProfileViewModel(), tag: Get.arguments.guid);

  ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: UniqueKey(),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          _profileHeaderWidget(),
          _profileBodyWidget(),
          _profileBackButtonWidget(),
          _loadingWidget(),
        ],
      ),
    );
  }

  Padding _profileBackButtonWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0, left: 8.0, right: 8.0),
      child: IconButton(
        icon: const Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
        onPressed: controller.onBack,
      ),
    );
  }

  GetBuilder<ProfileViewModel> _loadingWidget() {
    return GetBuilder<ProfileViewModel>(
        init: ProfileViewModel(),
        tag: Get.arguments.guid,
        builder: (controller) {
          if (controller.isLoading) {
            return FullScreenLoadingWidget(
              key: UniqueKey(),
            );
          } else {
            return const SizedBox();
          }
        });
  }

  SingleChildScrollView _profileBodyWidget() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 100.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _avatarWidget(),
            Container(
              width: Get.width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32.0),
                      topRight: Radius.circular(32.0))),
              child: Padding(
                padding: const EdgeInsets.only(left: 32.0, right: 32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _nameAndEmailWidget(),
                    _userDetailsWidget(),
                    _userFriendsWidget(),
                    _userGreetingWidget(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding _userGreetingWidget() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 16.0, bottom: 8.0),
            child: Text(
              "Greeting",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Text(
            controller.user?.greeting ?? "",
            textAlign: TextAlign.start,
            style: const TextStyle(
                fontWeight: FontWeight.w500, fontSize: 16, color: Colors.black),
          ),
        ],
      ),
    );
  }

  Widget _userFriendsWidget() {
    return controller.user?.friends == null || controller.user!.friends!.isEmpty
        ? const SizedBox()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(
                  "Friends",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Wrap(
                  children: controller.user!.friends!
                      .map((freind) => _feriendsItemWidget(freind))
                      .toList(),
                ),
              ),
            ],
          );
  }

  Column _userDetailsWidget() {
    return Column(
      children: [
        _userDetailWidget("Age", controller.user!.age!.toString()),
        _userDetailWidget("Phone number", controller.user!.phone!),
        _userDetailWidget("Gender", controller.user!.gender!),
        _userDetailWidget("Eye color", controller.user!.eyeColor!),
        _userDetailWidget("Company", controller.user!.company!),
        _userDetailWidget("Favorite fruit", controller.user!.favoriteFruit!),
        _userDetailWidget("Address", controller.user!.address!),
        _editButtonWidget(),
      ],
    );
  }

  SizedBox _nameAndEmailWidget() {
    return SizedBox(
      width: Get.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              controller.user!.name!,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Text(
              controller.user!.email!,
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                  color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  Container _avatarWidget() {
    return Container(
      height: 120.0,
      width: 120.0,
      margin: const EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 3.0),
          shape: BoxShape.circle),
      child: Container(
        margin: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(controller.user!.picture!),
                fit: BoxFit.cover),
            shape: BoxShape.circle),
      ),
    );
  }

  Stack _profileHeaderWidget() {
    return Stack(
      children: [
        SizedBox(
          height: 220.0,
          width: Get.width,
          child: Image.asset(AssetsPath.loginBackgroundImage,
              fit: BoxFit.cover, alignment: Alignment.bottomCenter),
        ),
        Container(
          height: 220.0,
          width: Get.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.white.withOpacity(0), Colors.white],
                  stops: const [0.01, 0.8])),
        ),
      ],
    );
  }

  Widget _feriendsItemWidget(Friend friend) {
    return GestureDetector(
      onTap: () => controller.getUserById(friend.guid ?? ""),
      child: Container(
        height: 45.0,
        margin: const EdgeInsets.only(left: 0.0, right: 16.0, bottom: 16.0),
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 12.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 4.0,
                  offset: Offset(0.0, 3.0))
            ],
            image: const DecorationImage(
                image: AssetImage(AssetsPath.loginBackgroundImage),
                fit: BoxFit.cover)),
        child: Text(
          friend.name!,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }

  SingleChildRenderObjectWidget _editButtonWidget() {
    return controller.user!.isOwner!
        ? Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: SizedBox(
              height: 45.0,
              width: Get.width,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.black26),
                  elevation: MaterialStateProperty.all(5.0),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
                  backgroundColor: MaterialStateProperty.all(Colors.pinkAccent),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                ),
                child: const Text(
                  "Edit",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          )
        : const SizedBox();
  }

  Column _userDetailWidget(String title, String value) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title + " :",
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.black),
            ),
            SizedBox(
              width: Get.width * 0.5,
              child: Text(
                value,
                maxLines: 2,
                textAlign: TextAlign.end,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black),
              ),
            ),
          ],
        ),
        const Divider()
      ],
    );
  }
}
