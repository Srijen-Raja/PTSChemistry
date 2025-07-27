import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'main.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

//class grade board school
// name year present position prof reviews
//(Formatting)
  // History for JEE

  @override
  Widget build(BuildContext context) {final ButtonStyle navLinkStyle = TextButton.styleFrom(
    foregroundColor: Colors.black,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
    textStyle: const TextStyle(fontSize: 15),
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14))),
  ).copyWith(
    overlayColor: WidgetStateProperty.all(const Color(0xFFE3D5E8)),
    foregroundColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
        if (states.contains(WidgetState.hovered)) {
          return Theme.of(context).primaryColor;
        }
        return Colors.black;
      },
    ),
  );
  var wid = MediaQuery.of(context).size.width;
  var hei = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: (hei * 0.85 > wid)?true:false,
        backgroundColor: appbgcol,
        foregroundColor: Colors.black,
        elevation: 1.0,
        toolbarHeight: 70,
        title: Row(children: [
          SizedBox(height: 70, width: 70, child: IconButton(onPressed: () => Navigator.pushNamed(context, '/'), icon: Image.asset("images/icon1.png"))),
          const SizedBox(width: 5),
          const Text('About Me', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
        ]),
        actions: (hei<wid*0.9)?<Widget>[
          TextButton(
            onPressed: () => Navigator.pushNamed(context, '/'),
            style: navLinkStyle,
            child: const Text('Home'),
          ),
          TextButton(
            onPressed: () => Navigator.pushNamed(context, '/material'),
            style: navLinkStyle,
            child: const Text('Study Material / Tests'),
          ),
          TextButton(
            onPressed: () => Navigator.pushNamed(context, '/reviews'),
            style: navLinkStyle,
            child: const Text('Reviews'),
          ),
          TextButton(
            onPressed: () => Navigator.pushNamed(context, '/about'),
            style: navLinkStyle,
            child: const Text('About Me'),
          ),
          const SizedBox(width: 10),
          OutlinedButton(
            onPressed: () => Navigator.pushNamed(context, '/contact'),
            child: const Text('Contact'),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.black,
              side: const BorderSide(color: Colors.black),
            ).copyWith(
              backgroundColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.hovered)) return Colors.grey.shade100;
                return null;
              }),
            ),
          ),
          const SizedBox(width: 10),
          // ElevatedButton(
          //   onPressed: () => Navigator.pushNamed(context, '/login'),
          //   child: const Text('Sign Up'),
          //   style: ElevatedButton.styleFrom(
          //     backgroundColor: Colors.black,
          //     foregroundColor: Colors.white,
          //   ).copyWith(
          //     backgroundColor: WidgetStateProperty.resolveWith((states) {
          //       if (states.contains(WidgetState.hovered)) return Colors.grey.shade800;
          //       return Colors.black;
          //     }),
          //   ),
          // ),
          const SizedBox(width: 20),
        ]:<Widget>[SizedBox.shrink()],
      ),
        backgroundColor: bgcol,
        drawer: (hei * 0.85 > wid)
            ? Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('PTS Chemistry Class', style: TextStyle(fontSize: 24)),
              ),
              ListTile(
                leading: const Icon(Icons.home_outlined),
                title: const Text('Home'),
                onTap: () => Navigator.pushNamed(context, '/'),
              ),
              ListTile(
                leading: const Icon(Icons.book_outlined),
                title: const Text('Study Materials'),
                onTap: () => Navigator.pushNamed(context, '/material'),
              ),
              ListTile(
                leading: const Icon(Icons.reviews_outlined),
                title: const Text('Reviews'),
                onTap: () => Navigator.pushNamed(context, '/reviews'),
              ),
              ListTile(
                leading: const Icon(Icons.account_box_outlined),
                title: const Text('About Me'),
                onTap: () => Navigator.pushNamed(context, '/about'),
              ),
              ListTile(
                leading: const Icon(Icons.quick_contacts_dialer_outlined),
                title: const Text('Contact'),
                onTap: () => Navigator.pushNamed(context, '/contact'),
              ),
              // ListTile(
              //   leading: const Icon(Icons.settings),
              //   title: const Text('Sign Up'),
              //   onTap: () => Navigator.pushNamed(context, '/login'),
              // ),
            ],
          ),
        )
            : null,
      body: Row(children: [
          (wid*0.95>hei)?Column(
            children: [
              SizedBox(width: wid*0.3,child:
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.all(10),child: Image.asset("images/pts-12.jpg"),),
                  Text("Dr. PT Srinivasan",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                  SizedBox(height: 6,),
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
                      SizedBox(width: 5,),
                      FloatingActionButton(onPressed: () async {
                        final Uri url = Uri.parse('https://t.me/ptschemistryclass');
                        if (!await launchUrl(url)) {
                          print("cant open");
                        }
                      },elevation: 0,hoverElevation: 10,splashColor: Colors.deepPurple,backgroundColor: Colors.transparent ,child: Image.asset("images/telegram.png")),

                    ],
                  ),
                  Center(child: TextButton(onPressed: () => Navigator.pushNamed(context, '/videos'),style: ButtonStyle(
                    // This removes the hover effect
                    overlayColor: MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.hovered)) {
                          return Colors.transparent;
                        }
                        return null; // Defer to the widget's default.
                      },
                    ),
                  ), child: Text("Check out my Lectures!",style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal),)),),

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
                  ), child: Text("Contact me",style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal),)),),
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
                    Center(child: TextButton(onPressed: () => Navigator.pushNamed(context, '/videos'),style: ButtonStyle(
                      // This removes the hover effect
                      overlayColor: MaterialStateProperty.resolveWith<Color?>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.hovered)) {
                            return Colors.transparent;
                          }
                          return null; // Defer to the widget's default.
                        },
                      ),
                    ), child: Text("Check out my Lectures!",style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal),)),),
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
                'Welcome to PTS Chemistry Class',
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
              'A Great Career starts with a Right Decision !',
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
            SizedBox(height: 40,),
            Text(
              'Qualifications',
              style: TextStyle(fontSize: 26, height: 1.5, fontWeight: FontWeight.bold),
            ),
            ListTile(
              subtitle: Text("MSc. (Biochemistry)"),
              title: Text("Christian Medical College & Hospital Vellore",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.pink),),
            ),
            ListTile(
              subtitle: Text("PhD (Science)"),
              title: Text("Bose Institute, Jadhavpur Univversity,Kolkatta",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.pink),),
            ),
            ListTile(
              subtitle: Text("Cert. Course in BioInformatics"),
              title: Text("Stanford University",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.pink),),
            ),
            ListTile(
              subtitle: Text("MSc. (BioInformatics)"),
              title: Text("Sikkim Manipal University of Technology and Sciences",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.pink),),
            ),
            ListTile(
              subtitle: Text("MA. Philosophy and Religion"),
              title: Text("Madurai Kamaraj University",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.pink),),
            ),
            ListTile(
              subtitle: Text("MA. Tamil"),
              title: Text("University of Madras",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.pink),),
            ),
            ListTile(
              subtitle: Text("Certified Academic Counselor"),
              title: Text("IGNOU",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.pink),),
            ),
            SizedBox(height: 30,),
            Text(
              'What I Offer',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              softWrap: true,
            ),
            SizedBox(height: 16),
            Text(
              'Personalized Lessons: ',
              style: TextStyle(fontSize: 16, height: 1.5,fontWeight: FontWeight.bold),
              softWrap: true,
            ),
            Text(
              'Every student learns differently. I tailor my teaching style and materials to fit your individual needs and learning pace.\n',
              style: TextStyle(fontSize: 16, height: 1.5),
              softWrap: true,
            ),
            Text(
              'Exam Preparation: ',
              style: TextStyle(fontSize: 16, height: 1.5, fontWeight: FontWeight.bold),
              softWrap: true,
            ),
            Text(
              'Need help preparing for an upcoming test or exam? I’ll guide you through key concepts, problem-solving techniques, and effective study strategies.\n',
              style: TextStyle(fontSize: 16, height: 1.5),
              softWrap: true,
            ),
            Text("Homework Assistance: ",
            style: TextStyle(fontSize: 16, height: 1.5,fontWeight: FontWeight.bold),),
            Text("Stuck on a tricky assignment? I’m here to break down complex problems and make homework less stressful.\n",
            style: TextStyle(fontSize: 16,height: 1.5),),
            Text("Foundations to Advanced Topics: ",
            style: TextStyle(fontSize: 16,height: 1.5,fontWeight: FontWeight.bold),),
            Text("From the basics of atoms and molecules to advanced organic and inorganic chemistry, I cover it all.\n",
            style: TextStyle(fontSize: 16,height: 1.5),),
            Text("Graded Online Tests: ",
            style: TextStyle(fontSize: 16,height: 1.5,fontWeight: FontWeight.bold),),
            Text("I give regular tests with instant grading on the topics covered in each class for better grasp of the subject and make it easy to remember.\n",
            style: TextStyle(fontSize: 16,height: 1.5),),
            Text("Interactive Learning: ",
            style: TextStyle(fontSize: 16,height: 1.5,fontWeight: FontWeight.bold),),
            Text("Use of digital whiteboards, quizzes, and real-time feedback.\n",
            style: TextStyle(fontSize: 16,height: 1.5),),
            Text("Resource Library: ",
            style: TextStyle(fontSize: 16,height: 1.5,fontWeight: FontWeight.bold),),
            Text("Access to curated study notes, practice questions, and helpful resources.",
            style: TextStyle(fontSize: 16,height: 1.5),),
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
