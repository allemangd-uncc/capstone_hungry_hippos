import 'package:capstone_hungry_hippos/twitter_assets/twitterFeed.dart';
import 'package:flutter/material.dart';
import '../twitter_assets/tweet.dart';

class TwitterFeed extends StatelessWidget{
  List<Tweet> fuck = [];
  final test = new Tweet(1, "We'll get through this together, Niner Nation. #WeAreAllNiners", "@unccharlotte", "https://pbs.twimg.com/profile_images/1175214096280629249/QC79Xju2_400x400.jpg", "test");
  final test2 = new Tweet(2, "Let's test your UNC Charlotte knowledge...do you know why we became the 49ers? Here's the full history on the pioneering spirit that shaped our trajectory  http://bit.ly/UNCC-1949", "@unccharlotte", "https://pbs.twimg.com/profile_images/1175214096280629249/QC79Xju2_400x400.jpg", "test");
  final test3 = new Tweet(3, "Niner Nation means uplifting each other. This 4/9 Day, let's show our students why #WeAreAllNiners by supporting the Student Emergency Relief Fund ️ http://bit.ly/UNCC-SER", "@unccharlotte", "https://pbs.twimg.com/profile_images/1175214096280629249/QC79Xju2_400x400.jpg", "test");
  final test4 = new Tweet(4, "Niner Nation: Chancellor Dubois shares that UNC Charlotte will be able to apply our established parking refund procedures with special considerations for the impact of COVID-19.", "@unccharlotte", "https://pbs.twimg.com/profile_images/1175214096280629249/QC79Xju2_400x400.jpg", "test");
  final test5 = new Tweet(5, "4/9 Day is just for us, Niner Nation. From wherever you are, you're family #WeAreAllNiners", "@unccharlotte", "https://pbs.twimg.com/profile_images/1175214096280629249/QC79Xju2_400x400.jpg", "test");
  final test6= new Tweet(6, "Niner Nation, #49erAlumni Gene Johnson ’73 is getting us excited for 4/9 Day tomorrow! Put on your Niner gear, call your friends and let’s celebrate together virtually \n We’re all in this together! ", "@unccharlotte", "https://pbs.twimg.com/profile_images/1175214096280629249/QC79Xju2_400x400.jpg", "test");
  final test7 = new Tweet(7, "From virtual events to one-on-one sessions with counselors, it's easy to stay connected with @UNCCAdmissions", "@unccharlotte", "https://pbs.twimg.com/profile_images/1175214096280629249/QC79Xju2_400x400.jpg", "test");


  @override
  Widget build(BuildContext context) {
    fuck.add(test);
    fuck.add(test2);
    fuck.add(test3);
    fuck.add(test4);
    fuck.add(test5);
    fuck.add(test6);
    fuck.add(test7);

    return StatefulBuilder(
        builder: (context, StateSetter setState) => Scaffold(
            appBar: AppBar(
              centerTitle: false,
              title: Text("49ers Tweets"),
              backgroundColor: Colors.green,
            ),
            body: Container(
              color: Colors.black12,
              child:
              VerticalTwitterFeed(twitterFeed: fuck),
            ),
            drawer: Drawer(
              child: ListView(
                children: <Widget>[
                  DrawerHeader(
                    child: Text(
                      'Drawer Header',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green,
                    ),
                  ),
                  ListTile(
                    title: IconButton(
                      icon: Icon(Icons.home),
                      onPressed: () => Navigator.pushNamed(context, '/'),
                    ),
                  ),
                ],
              ),
            )
        ));
  }
}

