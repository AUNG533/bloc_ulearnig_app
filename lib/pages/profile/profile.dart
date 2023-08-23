import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/pages/profile/profile_widge.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: SingleChildScrollView(
          child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            profileIconAndEditButton(),
            const SizedBox(height: 30.0),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: buildListView(),
            ),
          ],
        ),
      )),
    );
  }
}


