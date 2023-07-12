import 'package:cookpedia/core/utils/app_color.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_sizer/app_height.dart';
import '../../../../core/utils/app_sizer/app_width.dart';

class DefaultButton extends StatelessWidget {
  final void Function()? onTap;
  final Color ? color;
  final Widget? child;

  const DefaultButton({Key? key, this.color, this.child, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: AppWidth.w10,vertical: AppHeight.h105),
        height: AppHeight.h8,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: color??AppColor.primaryColor,
        ),
        child: child,
      ),
    );
  }
}