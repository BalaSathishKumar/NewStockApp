
import 'package:base_flutter_provider_project/data/models/Insights_model/LatestTipsModel.dart';
import 'package:flutter/material.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/utils.dart';
import 'package:story_view/widgets/story_view.dart';
import 'package:url_launcher/url_launcher.dart';

class TipStatus extends StatefulWidget {


  List<Insights> latesttips;

  TipStatus({ required this.latesttips});


  @override
  State<TipStatus> createState() => _TipStatusState();
}

class _TipStatusState extends State<TipStatus> {
  final controller = StoryController();
  bool isRedirect = false;

  @override
  Widget build(BuildContext context) {

    List<String> testtring = ["story 1","story 2",];

    List<StoryItem> storyItems =[];
    for(var i=0;i< widget.latesttips.length; i++){
        // storyItems.add(StoryItem.text(title: testtring[i], backgroundColor: Colors.green.shade100,)
      storyItems.add(StoryItem.pageImage(url: widget.latesttips[i].imageUrl ?? "", controller: controller));
       /* if(testtring[i] == "story 1"){
          isRedirect= true;
        }*/
    }


/*   List<StoryItem> storyItems = [
      StoryItem.text(title: 'sauda Story1', backgroundColor: Colors.green.shade100),
      StoryItem.text(title: 'sauda Story2', backgroundColor: Colors.green.shade100),
      StoryItem.pageImage(url: "https://media.istockphoto.com/id/1456222076/photo/stockmarket-and-investment-theme-background-with-city-skyscraper.webp?b=1&s=170667a&w=0&k=20&c=LY6P3MuNt4-N13kgDg1-KWbrSjRujYOSSJzblzxwnWE=", controller: controller),
      StoryItem.pageImage(url: "https://images.pexels.com/photos/1624438/pexels-photo-1624438.jpeg?auto=compress&cs=tinysrgb&w=600", controller: controller),
 *//*  StoryItem.pageImage(...),
    StoryItem.pageImage(...),
    StoryItem.pageVideo()*//*
    ];*/
    return  Scaffold(
      body: Container(
        child: StoryView(
          storyItems: storyItems,
          controller: controller,
          repeat: false,
          inline: false,
          onStoryShow: (value) {
            print('on story show story ${storyItems}');
            if(isRedirect){
            //  _launchUrl();
            }
         //  print('on story show story${value}');
            },
          onComplete: () {
            Navigator.pop(context);
          },
          onVerticalSwipeComplete: (direction) {
            if (direction == Direction.up) {
                Navigator.pop(context);
              //context.router.push(());
              // Navigator.push(context, MaterialPageRoute(builder: (context)=>StockHome()));
            }
          },

        ),
      ),
    );
  }


  void _launchUrl() async {
    const url = 'https://blog.logrocket.com';
    Uri uri = Uri.parse(url);
    if (await  canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Could not launch the URL.'),
      ));
    }
  }
}
