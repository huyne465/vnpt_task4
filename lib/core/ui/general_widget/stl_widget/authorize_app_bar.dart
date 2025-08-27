import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:vnpt_task5/constants/app_constants.dart';
import 'package:vnpt_task5/generated/locale_keys.g.dart';

class AuthorizeAppBar extends StatelessWidget {
  const AuthorizeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.arrow_back_ios),
      ),
      title: Text(
        LocaleKeys.appbar_authorizeCitizenIDTitle.tr(),
        style: textStyleMedium,
      ),
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
    );
  }
}
