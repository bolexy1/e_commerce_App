import 'package:e_commerce_app/widgets/App_icon.dart';
import 'package:e_commerce_app/widgets/bigtext.dart';
import 'package:e_commerce_app/widgets/smalltext.dart';
import 'package:flutter/material.dart';

class Facebook extends StatelessWidget {
  final Map<String, String> Imagemap ={
    "create \n story": "assets/images/8.jpg",
    "Lizzy jay official": "assets/images/Lizzy.png",
    "Rosemary\nonyinye": "assets/images/Rose.png",
    "Paul \n Adefarasin": "assets/images/Paul.png"

  };


   Facebook({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.black87,
      body: ListView(
        
        children:[ Column(
          children: [
        
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    
                    padding: EdgeInsets.only(left: 0, top: 25),
                    child: Text("facebook",style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 255, 255, 255)),),),
                    Row(
                      children: [
                        AppIcon(icon: Icons.add,iconColor: Colors.white, iconSize: 25,backgroundcolor: const Color.fromARGB(90, 158, 158, 158),),
                        SizedBox(width: 5),
                        AppIcon(icon: Icons.search,iconSize: 25, iconColor: Colors.white,backgroundcolor: const Color.fromARGB(93, 158, 158, 158),),
                        SizedBox(width: 5),
                        Stack(
                          children: [
                            Positioned(
                              
                              child: AppIcon(icon: Icons.message_rounded, iconColor: Colors.white,iconSize: 25, backgroundcolor: const Color.fromARGB(98, 158, 158, 158),)),
                              Positioned(
                                right: -3,
                              top: 0,
                                child: Container(
                                height: 19,
                                width: 25,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(child: Text("9+",style: TextStyle(color: Colors.white, fontSize: 13),)),
                              )
                              )
                          ],
                        )
                      ],
                    ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 0, top: 10),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                           
                           image: DecorationImage(
                            fit: BoxFit.fill,
                            image:
                            AssetImage("assets/images/8.jpg") )
                        ),
                      ),
                      SizedBox(width: 10,),
                      
                       Smalltext(text: "What's on your mind?",color: Colors.white,)
                    ],
                  ),             
                  AppIcon(icon: Icons.image, backgroundcolor: const Color.fromARGB(0, 109, 109, 109),iconColor: Colors.white,iconSize: 26,)
                ],
              ),
            ),
            SizedBox(height: 15,),
            Divider(height: 10,color: Colors.black,thickness: 3,),
            SizedBox(height: 5,),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  
                  SizedBox(width: 5,),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal, // 🔁 Don't forget this
                      child: Row(
                        children: List.generate(4, (index) {
                            String title = Imagemap.keys.elementAt(index);
                            String imagePath = Imagemap.values.elementAt(index);
                          return Row(
                            children: [
                              index < 1?Stack(
                    children: [
                      Positioned(
                        child: Container(
                          height: 200,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color.fromARGB(255, 55, 55, 55),
                           
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: 140,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8)),
                                   image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(imagePath),
                                ),
                              
                                ),
                              ),
                              SizedBox(height: 20,),
              
                              Smalltext(text: title, color: Colors.white,size: 12,)
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 40,
                        right: 35,
                        child:AppIcon(icon: Icons.add, backgroundcolor: Colors.blue, size: 30,iconSize: 24,iconColor: Colors.white,)
                      ),
                    ],
                  ):
                  Stack(
                    children: [
                      Positioned(
                        child: Container(
                          height: 200,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.red,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(imagePath),
                            ),
                          ),
                       
                          child: 
                          Container(
                            margin: EdgeInsets.only(top: 160),
                            child: Center(child: Text(title, style: TextStyle(color: Colors.white),)),
                          )
                        ),
                      ),
                      Positioned(
                        top: 10,
                        left: 5,
                        child:Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.blue,
                              width: 3
                              
                            ),
                            image: DecorationImage(image: AssetImage("assets/images/8.jpg"))
                          ),
                        )
                      ),
                    ],
                  ),
                  SizedBox(width: 5),
                            ],
                          );
                        }),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 10,),
            Divider(height: 10,color: Colors.black,thickness: 3,),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 0, top: 10),
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                               color: Colors.red,
                               image: DecorationImage(
                                fit: BoxFit.cover,
                                image:
                                AssetImage("assets/images/b.png") )
                            ),
                          ),
                          SizedBox(width: 10,),
                          
                           Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Smalltext(text: "InstagramBlog9ja",color: Colors.white,),
                               Smalltext(text: "6m .")
                  
                             ],
                           )
                        ],
                      ),             
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("...",style: TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.bold),),
                          SizedBox(width: 10,),                      
                          // Text("X",style: TextStyle(color: Colors.white, fontSize: 22))
                          AppIcon(icon: Icons.close_sharp, iconSize: 26,backgroundcolor: Colors.transparent,iconColor: Colors.white,)
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Text("2027: Jonathan Set to Run for Presidency, Say... See more",style: TextStyle(color: Colors.white, fontSize: 12),)
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 10,),
            Container(
              color: Colors.black,
              child: Column(
                children: [
                  Container(
                    height: 200,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/GoodLuck.png"))
                    ),
                   
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BigText(text: "2027:",color: Colors.white, size: 28,),
                      BigText(text: " JONATHAN",color: Colors.amberAccent,size: 28,),
                      BigText(text: " SET",color: Colors.white,size: 28,),
                      BigText(text: " TO",color: Colors.amberAccent,size: 28,)
              
              
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    BigText(text: "RUN",color: Colors.amberAccent,size: 28,),
                    BigText(text: " FOR", color: Colors.white,size: 28,),
                    BigText(text: " PRESIDENCY",color: Colors.amberAccent,size: 28,)
                  ],)
                ],
              ),
            )
         ],
        ),
      ]
      ),
    );
  }
}