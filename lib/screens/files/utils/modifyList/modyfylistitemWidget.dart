import 'package:filemanager/helpers/colors/app_color.dart';
import 'package:filemanager/helpers/widget/text.dart';
import 'package:flutter/material.dart';

class ModifyListItemWidget extends StatelessWidget {
  const ModifyListItemWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: AppColor.cardbgColor,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.folder,
                                color: AppColor.modifyfolderColor,
                                size: 80,
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              sText("4k Movies", AppColor.titleColor, 18.0,
                                  FontWeight.bold),
                              sText("911 item", AppColor.titleColor, 14.0,
                                  FontWeight.normal)
                            ],
                          ),
                        );
  }
}