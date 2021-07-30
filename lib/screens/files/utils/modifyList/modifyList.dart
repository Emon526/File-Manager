import 'package:filemanager/screens/files/utils/modifyList/modyfylistitemWidget.dart';
import 'package:flutter/material.dart';

class ModifyList extends StatelessWidget {
  const ModifyList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.builder(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 15.0),
            itemCount: 10,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15.0,
                crossAxisSpacing: 15.0),
            itemBuilder: (context, index) {
              return ModifyListItemWidget();
            }));
  }
}
