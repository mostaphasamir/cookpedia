import 'package:cookpedia/feature/walk_through/domain/entities/cooking_level.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_sizer/app_height.dart';
import '../../../../core/utils/app_sizer/app_width.dart';

class CookingLevelWidget extends StatelessWidget {
  final CookingLevel cookingLevel ;
  const CookingLevelWidget({Key? key, required this.cookingLevel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppWidth.w4,vertical: AppHeight.h1),
      margin: EdgeInsets.symmetric(horizontal: AppWidth.w1,vertical: AppHeight.h1),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(cookingLevel.title,style: Theme.of(context).textTheme.titleMedium,),
          SizedBox(height: AppHeight.h105,),
          Text(cookingLevel.description,style: Theme.of(context).textTheme.bodySmall,),
        ],
      ),
    );
  }
}
