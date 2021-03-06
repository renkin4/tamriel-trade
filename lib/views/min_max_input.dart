import 'package:TamrielTrade/common/typedefs.dart';
import 'package:TamrielTrade/values/values.dart';
import 'package:TamrielTrade/views/input.dart';
import 'package:flutter/material.dart';

class MinMaxInput extends StatelessWidget {
  final String title;
  final StringCallback onChangeMin;
  final StringCallback onChangeMax;

  MinMaxInput({this.title, this.onChangeMin, this.onChangeMax});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.padding24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.only(bottom: Dimensions.padding6),
                child: Text(title)),
            Row(
              children: [
                Container(
                  width: Dimensions.minMaxWidth,
                  child: Input(
                      hint: "Min",
                      isCenter: true,
                      isNumber: true,
                      onChange: onChangeMin != null ? onChangeMin : (value) {}),
                ),
                Expanded(child: Container()),
                Container(
                  width: Dimensions.minMaxWidth,
                  child: Input(
                      hint: "Max",
                      isCenter: true,
                      isNumber: true,
                      onChange: onChangeMax != null ? onChangeMax : (value) {}),
                )
              ],
            )
          ],
        ));
  }
}
