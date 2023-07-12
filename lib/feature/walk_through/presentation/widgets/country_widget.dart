import 'package:cookpedia/feature/walk_through/data/models/country_model.dart';
import 'package:cookpedia/feature/walk_through/domain/entities/country.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/app_sizer/app_height.dart';
import '../../../../core/utils/app_sizer/app_width.dart';

Widget countryWidget({required Country country}) => Container(
      height: AppHeight.h8,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      margin: EdgeInsets.only(bottom: AppHeight.h2),
      child: Row(
        children: [
          SizedBox(
            width: AppWidth.w6,
          ),
          Icon(Icons.flag),
          // Image(
          //   image: NetworkImage(
          //     country.flagURL,
          //   ),
          //   width: AppWidth.w14,
          //   height: AppHeight.h10,
          // ),
          SizedBox(
            width: AppWidth.w4,
          ),
          Text(
            country.code,
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 14.sp,
            ),
          ),
          SizedBox(
            width: AppWidth.w4,
          ),
          SizedBox(
            width: AppWidth.w65,
            child: Text(
              country.name,
              style: const TextStyle(
                overflow: TextOverflow.ellipsis,
              ),
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
