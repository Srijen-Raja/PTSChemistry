import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    var wid = MediaQuery.of(context).size.width;
    var hei = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Me'),
      ),
      body: Row(children: [
          (wid*0.95>hei)?Column(
            children: [
              SizedBox(width: wid*0.3,child:
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset("images/pts-12.jpg"),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(onPressed: () async {
                        final Uri url = Uri.parse('https://www.youtube.com/@SrinivasanPT');
                        if (!await launchUrl(url)) {
                          print("cant open");
                        }
                      }
                          ,elevation: 0, hoverElevation: 10,splashColor: Colors.deepPurple,backgroundColor: Colors.transparent,child: Image.asset("images/youtube.png")),
                      SizedBox(width: 5,),
                      FloatingActionButton(onPressed: () async {
                        final Uri url = Uri.parse('https://api.whatsapp.com/send/?phone=917448961696&text&type=phone_number&app_absent=0');
                        if (!await launchUrl(url)) {
                          print("cant open");
                        }
                      },elevation: 0,hoverElevation: 10,splashColor: Colors.deepPurple,backgroundColor: Colors.transparent ,child: Image.asset("images/whatsapp.png")),
                      SizedBox(width: 5,),
                      FloatingActionButton(onPressed: () async {
                        final Uri url = Uri.parse('https://www.facebook.com/PaadhoorThiruvengadachariSrinivasan/');
                        if (!await launchUrl(url)) {
                          print("cant open");
                        }
                      },elevation: 0,hoverElevation: 10,splashColor: Colors.deepPurple,backgroundColor: Colors.transparent, child: Image.asset("images/facebook.png")),
                      SizedBox(width: 5,),
                      FloatingActionButton(onPressed: () async {
                        final Uri url = Uri.parse('https://www.instagram.com/profpts/');
                        if (!await launchUrl(url)) {
                          print("cant open");
                        }
                      },elevation: 0,hoverElevation: 10,splashColor: Colors.deepPurple,backgroundColor: Colors.transparent, child: Image.asset("images/instagram.png"),),
                    ],
                  ),
                  Center(child: TextButton(onPressed: () => Navigator.pushNamed(context, '/contact'),style: ButtonStyle(
                    // This removes the hover effect
                    overlayColor: MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.hovered)) {
                          return Colors.transparent;
                        }
                        return null; // Defer to the widget's default.
                      },
                    ),
                  ), child: Text("Contact me",style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal),)),)
                ],),

              ),
            ],
          ):SizedBox.shrink(),
          Spacer(flex: 1,),
          SizedBox(width: (wid>hei)?wid*0.6:wid*0.95  ,child:
              SingleChildScrollView(child:
          Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            (wid*0.95<= hei)?Row(
              children: [
                SizedBox(width: wid*0.85,child:
                Column(
                  children: [
                    Image.asset("images/pts-12.jpg"),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingActionButton(onPressed: () async {
                          final Uri url = Uri.parse('https://www.youtube.com/@SrinivasanPT');
                          if (!await launchUrl(url)) {
                            print("cant open");
                          }
                        }
                            ,elevation: 0, hoverElevation: 10,splashColor: Colors.deepPurple,backgroundColor: Colors.transparent,child: Image.asset("images/youtube.png")),
                        SizedBox(width: 5,),
                        FloatingActionButton(onPressed: () async {
                          final Uri url = Uri.parse('https://api.whatsapp.com/send/?phone=917448961696&text&type=phone_number&app_absent=0');
                          if (!await launchUrl(url)) {
                            print("cant open");
                          }
                        },elevation: 0,hoverElevation: 10,splashColor: Colors.deepPurple,backgroundColor: Colors.transparent ,child: Image.asset("images/whatsapp.png")),
                        SizedBox(width: 5,),
                        FloatingActionButton(onPressed: () async {
                          final Uri url = Uri.parse('https://www.facebook.com/PaadhoorThiruvengadachariSrinivasan/');
                          if (!await launchUrl(url)) {
                            print("cant open");
                          }
                        },elevation: 0,hoverElevation: 10,splashColor: Colors.deepPurple,backgroundColor: Colors.transparent, child: Image.asset("images/facebook.png")),
                        SizedBox(width: 5,),
                        FloatingActionButton(onPressed: () async {
                          final Uri url = Uri.parse('https://www.instagram.com/profpts/');
                          if (!await launchUrl(url)) {
                            print("cant open");
                          }
                        },elevation: 0,hoverElevation: 10,splashColor: Colors.deepPurple,backgroundColor: Colors.transparent, child: Image.asset("images/instagram.png"),),
                      ],
                    ),
                    Center(child: TextButton(onPressed: () => Navigator.pushNamed(context, '/contact'),style: ButtonStyle(
                      // This removes the hover effect
                      overlayColor: MaterialStateProperty.resolveWith<Color?>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.hovered)) {
                            return Colors.transparent;
                          }
                          return null;
                        },
                      ),
                    ), child: Text("Contact me",style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal),)),)
                  ],),

                ),
              ],
            ):SizedBox.shrink(),
            Text(
                'Welcome to PTS Chemistry',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              softWrap: true,
            ),
            SizedBox(height: 25),
            Text(
              'Are you looking to master chemistry concepts, boost your grades, or simply develop a deeper appreciation for the subject? You’re in the right place! As a dedicated online chemistry tutor, my goal is to make chemistry clear, engaging, and accessible for everyone—whether you’re a high school student, a college learner, or someone returning to science after a break.',
              style: TextStyle(fontSize: 16, height: 1.5),
              softWrap: true,
            ),
            SizedBox(height: 10,),Text(
              ' A Great Career starts with a Right Decision !',
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18, height: 1.5),
              softWrap: true,
            ),
            SizedBox(height: 30),
            Text(
              'About Me',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              softWrap: true,
            ),
            SizedBox(height: 16),
            Text(
              'Hi! I’m College Professor with more than two decades of teaching experience. I have taught hundreds of students at various levels. I’m passionate about making chemistry easy to understand and enjoyable. I’ve helped learners overcome challenges, ace exams, and even discover a love for chemistry they never knew they had.',
              style: TextStyle(fontSize: 16, height: 1.5),
              softWrap: true,
            ),
            SizedBox(height: 30,),
            Text(
              'What I Offer',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              softWrap: true,
            ),
            SizedBox(height: 16),
            Text(
              ' Personalized Lessons: Every student learns differently. I tailor my teaching style and materials to fit your individual needs and learning pace.\n Exam Preparation: Need help preparing for an upcoming test or exam? I’ll guide you through key concepts, problem-solving techniques, and effective study strategies.\n Homework Assistance: Stuck on a tricky assignment? I’m here to break down complex problems and make homework less stressful.\n Foundations to Advanced Topics: From the basics of atoms and molecules to advanced organic and inorganic chemistry, I cover it all.\n Graded Online Tests: I give regular tests with instant grading on the topics covered in each class for better grasp of the subject and make it easy to remember.\n Interactive Learning: Use of digital whiteboards, quizzes, and real-time feedback.\n Resource Library: Access to curated study notes, practice questions, and helpful resources.',
              style: TextStyle(fontSize: 16, height: 1.5),
              softWrap: true,
            ),
            SizedBox(height: 30,),
            Text(
              'Let’s Start Your Chemistry Journey!',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Whether you’re aiming for top grades, preparing for competitive exams, or simply want to build your confidence in chemistry, I’m here to support you every step of the way. Explore the blog for free tips and resources, or Contact Me to book your first session.\n\nChemistry doesn\’t have to be confusing or intimidating—it can be fun and rewarding! Let\’s unlock your potential together.',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            SizedBox(height: 50),
          ],
        ),),),
        Spacer(flex: 1,),
        ],)
    );
  }
}
