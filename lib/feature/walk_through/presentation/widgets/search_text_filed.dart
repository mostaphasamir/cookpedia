import 'package:cookpedia/core/utils/app_sizer/app_height.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_sizer/app_width.dart';

Widget searchTextFiled({
void Function(String)? onChanged,
})=> TextField(
onChanged:onChanged ,
  decoration: InputDecoration(
    fillColor: AppColor.grayColor,
    contentPadding: EdgeInsets.symmetric(horizontal: AppWidth.w3,vertical: AppHeight.h105),
    prefixIcon: const Icon(Icons.search,color: Colors.black,),
    hintText: "Search Country",

    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide.none,
    ),
    filled: true,
  ),
);