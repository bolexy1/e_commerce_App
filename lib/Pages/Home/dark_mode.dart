import 'package:e_commerce_app/utility/colors.dart';
import 'package:e_commerce_app/utility/AppLayout.dart';
import 'package:e_commerce_app/widgets/Icon_and_text.dart';
import 'package:e_commerce_app/widgets/app_colunm.dart';
import 'package:e_commerce_app/widgets/bigtext.dart';
import 'package:e_commerce_app/widgets/smalltext.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

class DarkMode extends StatefulWidget {
  const DarkMode ({super.key});

  @override
  State<DarkMode> createState() => _DarkModeState();
}

class _DarkModeState extends State<DarkMode> {
  PageController pageController =PageController(viewportFraction: 0.85);
  var _currPageValue =0.0;
  double _scaleFactor=0.8;
  double _height =AppLayout.getHeight(220);

  @override
  
    void initState(){
      super.initState();
      pageController.addListener(() {
        setState(() {
          _currPageValue= pageController.page!;
          
        });
      });
    
  }

  @override
  void dispose(){
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Slider section
        Container(
          // color: Colors.red,
          height: AppLayout.getHeight(320),
          child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder: (context, position){
              return _buildPageItem(position);
            }),
        ),
      // Dots
      new DotsIndicator(
        dotsCount: 5,
        position: _currPageValue,
        decorator: DotsDecorator(
          activeColor: AppColors.mainColor,
          size: const Size.square(9.0),
          activeSize: const Size(18.0, 9.0),
          activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
        )
      ),

      // Popular text
      SizedBox(height: AppLayout.getHeight(30),),
      Container(
        margin: EdgeInsets.only(left: AppLayout.getWidth(30)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            BigText(text: "Popular",color: Colors.white,),
            SizedBox(width: AppLayout.getWidth(10),),
            Container(
              margin: const EdgeInsetsDirectional.only(bottom: 3),
              child: BigText(text: ".", color: Colors.black26,),

            ),
            SizedBox(width: AppLayout.getWidth(10),),
            Container(
              margin: const EdgeInsetsDirectional.only(bottom: 2),
              child: Smalltext(text: "Food paring"),
            ),
            // list of images

           

          ],
        )),

        SizedBox(height: AppLayout.getHeight(10),),
                ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                 shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index){
                  return Container(
                    margin: EdgeInsets.only(left: AppLayout.getWidth(20),right:AppLayout.getWidth(20), bottom: AppLayout.getHeight(10)),
                    child: Row(                      
                      children: [
                        Container(
                          width: AppLayout.getWidth(120),
                          height: AppLayout.getHeight(120),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppLayout.getHeight(20)),
                            //  color: Colors.blue,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/food0.png"))
                          ),
                        ),
                        Expanded(
                          child: Container(
                           
                                                 
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topRight: Radius.circular(AppLayout.getHeight(20)),
                              bottomRight: Radius.circular(AppLayout.getHeight(20))
                              ),
                              color: Colors.black38
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: AppLayout.getWidth(10), right:AppLayout.getWidth(10) ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BigText(text: "Nutritious fruit meal in China", color: Colors.white,),
                                SizedBox(height: AppLayout.getHeight(10),),
                                Smalltext(text: "With chinese Characteristics"),
                                 SizedBox(height: AppLayout.getHeight(10),),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconAndText(icon: Icons.circle_sharp, text: "Normal",  iconColor: AppColors.inconColor1,), 
                                        SizedBox(width: 0,),
                                        IconAndText(icon: Icons.location_on, text: "1,7km",  iconColor: AppColors.mainColor),
                                        SizedBox(width: 0,),
                                        IconAndText(icon: Icons.access_time_rounded, text: "32mins",  iconColor: AppColors.iconColor2),                   

                                      ],),
                                

                              ],
                            ),
                              ),
                          ),
                        )
                      ],
                    ),
                  );
              
                }),
            



      ],
    );
  }
  Widget _buildPageItem(int index){
    Matrix4 matrix = new Matrix4.identity();
    if(index ==_currPageValue.floor()){
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

    }else if(index == _currPageValue.floor()+1){
      var currScale = _scaleFactor+(_currPageValue-index+1)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

    }else if(index == _currPageValue.floor()-1){
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
       var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }else{
      var currScale=0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor)/2, 1);
    }
 

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
          height: AppLayout.getHeight(220),
          margin: EdgeInsets.only(left: AppLayout.getWidth(10), right: AppLayout.getWidth(10)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppLayout.getHeight(30)),
            color:index.isEven? Color(0xFF69c5df): Color(0xFF9294cc),
            image: DecorationImage(
              fit: BoxFit.cover,
              image:        
            AssetImage("assets/images/food0.png"))
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter ,
          child: Container(
            height: AppLayout.getHeight(130),
            margin: EdgeInsets.only(left: AppLayout.getWidth(30), right: AppLayout.getWidth(30), bottom: AppLayout.getHeight(30)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppLayout.getHeight(20)),
              // color: Colors.white,
              color: Colors.black38,
              boxShadow: [
                BoxShadow(
                  // color: Color(0xFFe8e8e8),
                   blurRadius: 5.0,
                  offset: Offset(0, 5)
                ),
                BoxShadow(
                  // color: Colors.white,
                  color: Colors.black38,
                  offset: Offset(-5, 0)

                ),
                BoxShadow(
                  // color: Colors.white,
                  color: Colors.black38,
                  offset: Offset(5, 0)

                )
              ]
             
            ),
            child: Container(
              padding: EdgeInsets.only(top: AppLayout.getHeight(15),left: 15,right: 15),
              child: AppColunm(text: "Chinese Side", color: Colors.white,),
            ),
          
          ),
        ),
        ]
      ),
    );
  }
}