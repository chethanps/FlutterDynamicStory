import 'package:destini/story_brain.dart';
import 'package:flutter/material.dart';

StoryBrain storyBrain = StoryBrain();

void main() {
  runApp(Destini());
}

class Destini extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}

class StoryPage extends StatefulWidget {
  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    storyBrain.getStoryTitle(),
                    style: TextStyle(fontSize: 25.0),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: FlatButton(
                  color: Colors.red,
                onPressed: () {
                    setState(() {
                      String choice1 = storyBrain.getChoice1();
                      if(storyBrain.getChoice1().compareTo('Restart') == 0) {
                        storyBrain.restart();
                      } else {
                        storyBrain.moveToNextStory(true);
                      }
                    });
                },
                child: Text(storyBrain.getChoice1(),
                  style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                child: Visibility(
                  visible: storyBrain.getChoice2().isNotEmpty?true:false,
                  child: FlatButton(
                    color: Colors.blue,
                    onPressed: () {
                      setState(() {
                        if(storyBrain.getChoice2() == ''){
                          //Do nothing
                        } else {
                          storyBrain.moveToNextStory(false);
                        }
                      });
                    },
                    child: Text(storyBrain.getChoice2(),
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
