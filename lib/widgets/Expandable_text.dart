import 'package:e_commerce_app/utility/colors.dart';
import 'package:e_commerce_app/utility/AppLayout.dart';
import 'package:e_commerce_app/widgets/smalltext.dart';
import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  final String text;

  const ExpandableText({super.key, required this.text});

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText=true;

  double textHeight = AppLayout.baseHeight/5.63;

  @override
  void initState(){
    super.initState();
    if(widget.text.length>textHeight){
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf = widget.text.substring(textHeight.toInt()+1, widget.text.length);
    }else{
      firstHalf = widget.text;
      secondHalf = "";
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty?Smalltext(height: 1.8, color: AppColors.paraColor, size: AppLayout.getHeight(16),  text: firstHalf):Column(
        children: [
          Smalltext(height: 1.8, color: AppColors.paraColor,size:AppLayout.getHeight(16),text: hiddenText?(firstHalf+"..."):(firstHalf+secondHalf)),
          InkWell(
            onTap: () {
              setState(() {
                hiddenText=!hiddenText;
              });
            },
            child: Row(
              children: [
                Smalltext( text:"show more", color: AppColors.mainColor, ),
                Icon(hiddenText?Icons.arrow_drop_down :Icons.arrow_drop_up, color: AppColors.mainColor,)
              ],
            ),
          )
        ],
      ),
    );
  }
}