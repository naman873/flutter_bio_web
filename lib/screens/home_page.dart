import 'package:blog_project/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  String selectedDropDownValue = "Home";
  ScrollController scrollController = ScrollController();
  ValueNotifier<bool> showBottomToTop = ValueNotifier(false);

  bool isExpanded = false;

  List<String> dropDownEvents = [
    'Home',
    'About',
    'Resume',
    'Services',
    'Contact'
  ];

  bool isLeetCodeHover = false;
  bool isLinkedInHover = false;
  bool isGitHover = false;

  late List<Color> colorList = [];
  late List<EdgeInsets> paddingList = [];

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(milliseconds: 300), vsync: this);

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    colorList = List.filled(dropDownEvents.length, Colors.white);
    paddingList = List.filled(dropDownEvents.length, EdgeInsets.zero);

    scrollController.addListener(() {
      if (scrollController.position.pixels >
          MediaQuery.of(context).size.height / 2) {
        setState(() {
          if (scrollController.position.pixels <
              MediaQuery.of(context).size.height) {
            selectedDropDownValue = "Home";
          } else if (scrollController.position.pixels >
                  MediaQuery.of(context).size.height * 0.5 &&
              scrollController.position.pixels <
                  MediaQuery.of(context).size.height * 1.5) {
            selectedDropDownValue = "About";
          } else if (scrollController.position.pixels >
                  MediaQuery.of(context).size.height * 1.5 &&
              scrollController.position.pixels <
                  MediaQuery.of(context).size.height * 3.5) {
            selectedDropDownValue = "Resume";
          }
          if (scrollController.position.pixels >
                  MediaQuery.of(context).size.height * 3.5 &&
              scrollController.position.pixels <
                  MediaQuery.of(context).size.height * 4.5) {
            selectedDropDownValue = "Services";
          }
          if (scrollController.position.pixels >
              MediaQuery.of(context).size.height * 4.5) {
            selectedDropDownValue = "Contact";
          }
          //
          showBottomToTop = ValueNotifier(true);
        });
      } else {
        setState(() {
          showBottomToTop = ValueNotifier(false);
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void toggle() {
    setState(() {
      isExpanded = !isExpanded;
      if (isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  void changeDropDownValue(String value) {
    setState(() {
      selectedDropDownValue = value;
      switch (value) {
        case "Home":
          scrollController.animateTo(0,
              duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
        case "About":
          scrollController.animateTo(MediaQuery.of(context).size.height * 1,
              duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
        case "Resume":
          scrollController.animateTo(MediaQuery.of(context).size.height * 2,
              duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
        case "Services":
          scrollController.animateTo(MediaQuery.of(context).size.height * 4,
              duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
        case "Contact":
          scrollController.animateTo(MediaQuery.of(context).size.height * 5,
              duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
      }
    });
  }

  List<List<String>> experience = [
    [
      "DreamOrbit",
      "April 2024 - Present",
      "Software Engineer",
      "Developed responsive Flutter web applications for FinTech projects, integrating bureau data into dynamic, user-friendly interfaces. Leveraged GetX for state management and implemented features like asset and farm detail input. Designed and tested RESTful APIs to enable seamless front-end and back-end communication.Automated CI/CD pipelines with Jenkins and conducted LambdaTest for cross-platform functionality."
    ],
    [
      "Software Arcade",
      "July 2023 - Jan 2024",
      "Cross Platform Software Developer",
      "Developed and maintained cross-platform Flutter applications with RESTful APIs. Collaborated with cross-functional teams to implement high-performance features and ensure app scalability. Delivered clean, maintainable code and mentored junior developers on best practices. Implemented data validation and serialization to ensure consistent app behavior."
    ],
    [
      "Ongraph",
      "May 2022 - June 2023",
      "Software Engineer",
      "Led the development of Android and iOS applications using Flutter, integrating databases like SQLAlchemy. Designed data models, schemas, and implemented analytics for app performance. Managed CI/CD pipelines and feature delivery from conception to deployment. Streamlined backend communication with robust API integrations."
    ],
    [
      "Enablesoft",
      "July 2021 - April 2022",
      "Flutter Developer",
      "Developed scalable school management apps with GetX state management. Refactored projects to implement MVP architecture. Optimized database queries, wrote unit tests, and created documentation for APIs. Enhanced app responsiveness by implementing efficient client-side caching techniques."
    ]
  ];

  List<List<String>> education = [
    [
      "Bachelor Degree",
      "2016 - 2020",
      "Maharshi Dayanand University",
      "The program provided a strong foundation in computer science fundamentals, including programming, algorithms, database management, and software development. Emphasized practical learning through projects and hands-on labs, fostering skills in problem-solving, critical thinking, and teamwork. Equipped with knowledge in emerging technologies like machine learning, web development, and data analytics."
    ]
  ];

  List<String> servicesProvide = [
    "I am proficient in developing cross-platform mobile applications for both iOS and Android using Flutter, as well as creating responsive web applications with Flutter Web. Additionally, I have expertise in building intuitive and dynamic iOS apps using SwiftUI.",
    "Experienced in building responsive and feature-rich web applications with Flutter Web, ensuring seamless performance across devices and browsers. I excel at integrating APIs and crafting scalable, user-friendly designs tailored to business needs. My expertise includes implementing state management solutions like Provider and GetX for robust app logic. Additionally, I focus on optimizing application performance and ensuring smooth deployments.",
    "Specialized in creating high-quality, cross-platform mobile apps for iOS and Android, leveraging Flutter’s capabilities to deliver efficient and visually appealing solutions. My apps prioritize performance, state management, and consistent user experiences. I am proficient in integrating third-party APIs and native platform features to enhance functionality. Furthermore, I ensure the apps are fully tested and comply with platform-specific guidelines for smooth app store approvals.",
    "Skilled in developing native iOS applications using SwiftUI, focusing on dynamic interfaces, smooth navigation, and modern design principles. I deliver apps that align with Apple’s Human Interface Guidelines for optimal usability. My workflow emphasizes clean code practices and the integration of advanced SwiftUI features such as animations and custom views. I am also adept at working with CoreData and Combine to build robust and data-driven applications."
  ];

  String connectMessage =
      "Please feel free to reach out if you require assistance or services related to software development, including Flutter, Dart, SwiftUI or Python. With extensive experience in building robust applications, I offer solutions in UI/UX design, state management, cross-platform development, microcontroller programming, and software architecture. I’m available to help optimize and enhance your project or tackle specific challenges in these areas.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/intro-bg.jpg"),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withValues(alpha: 0.75), BlendMode.darken),
                  ),
                ),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 150,
                      ),
                      Text(
                        "HELLO, WORLD.",
                        style: TextStyle(
                            color: Colors.pink,
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 5),
                      ),
                      Text(
                        "I'm Naman Dhiman.",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 72,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 0),
                      ),
                      Text(
                        "|  SOFTWARE ENGINEER  |",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w100,
                            letterSpacing: 4),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            scrollController.animateTo(
                                MediaQuery.of(context).size.height * 1,
                                duration: Duration(milliseconds: 400),
                                curve: Curves.easeInOut);
                          });
                        },
                        style: ButtonStyle(
                          shape: WidgetStateProperty.resolveWith<
                                  RoundedRectangleBorder>(
                              (Set<WidgetState> states) {
                            if (states.contains(WidgetState.hovered)) {
                              return RoundedRectangleBorder(
                                  side:
                                      BorderSide(width: 3, color: Colors.pink),
                                  borderRadius: BorderRadius.circular(0));
                            }
                            return RoundedRectangleBorder(
                                side: BorderSide(width: 3, color: Colors.grey),
                                borderRadius: BorderRadius.circular(0));
                          }),
                          backgroundColor:
                              WidgetStatePropertyAll(Colors.transparent),
                          padding: WidgetStatePropertyAll(
                            EdgeInsets.all(30),
                          ),
                        ),
                        child: Row(
                          spacing: 10,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "MORE ABOUT ME",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 4),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down_outlined,
                              size: 18,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      Center(
                        child: Row(
                          spacing: 30,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MouseRegion(
                              onEnter: (_) {
                                setState(() {
                                  isLinkedInHover = true;
                                });
                              },
                              onExit: (_) {
                                setState(() {
                                  isLinkedInHover = false;
                                });
                              },
                              child: GestureDetector(
                                onTap: () {
                                  _launchUrl(
                                      "https://www.linkedin.com/in/naman-dhiman-1888a5191/");
                                },
                                child: Image.asset(
                                  "images/linkedin.png",
                                  color: isLinkedInHover
                                      ? Colors.pink
                                      : Colors.white,
                                  width: 50,
                                ),
                              ),
                            ),
                            MouseRegion(
                              onEnter: (_) {
                                setState(() {
                                  isGitHover = true;
                                });
                              },
                              onExit: (_) {
                                setState(() {
                                  isGitHover = false;
                                });
                              },
                              child: GestureDetector(
                                onTap: () {
                                  _launchUrl("https://github.com/naman873");
                                },
                                child: Image.asset(
                                  "images/git.png",
                                  color:
                                      isGitHover ? Colors.pink : Colors.white,
                                  width: 35,
                                ),
                              ),
                            ),
                            MouseRegion(
                              onEnter: (_) {
                                setState(() {
                                  isLeetCodeHover = true;
                                });
                              },
                              onExit: (_) {
                                setState(() {
                                  isLeetCodeHover = false;
                                });
                              },
                              child: GestureDetector(
                                onTap: () {
                                  _launchUrl("https://leetcode.com/profile/");
                                },
                                child: Image.asset(
                                  "images/leetcode.png",
                                  color: isLeetCodeHover
                                      ? Colors.pink
                                      : Colors.white,
                                  width: 35,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Column(
                  spacing: 15,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      "About",
                      style: TextStyle(
                          color: Colors.pink,
                          letterSpacing: 5,
                          fontSize: 16,
                          fontWeight: FontWeight.w900),
                    ),
                    Text(
                      "Let me introduce myself.",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 40,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: Image.asset(
                            "images/img.jpeg",
                            fit: BoxFit.cover,
                            // height: 90,
                          ).image,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Text(
                            Constants.introText,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Profile",
                      style: TextStyle(
                          color: Colors.black,
                          letterSpacing: 5,
                          decoration: TextDecoration.underline,
                          fontSize: 18,
                          fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Column(
                        spacing: 10,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "FULL NAME :",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  Text(
                                    "Naman Dhiman",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "DOB :",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  Text(
                                    "29 August, 1998",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "JOB :",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  Text(
                                    "Software Engineer",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Website :",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  Text(
                                    "Website Url ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Email :",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  Text(
                                    "namandhiman98@gmail.com",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              Container()
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Skills",
                      style: TextStyle(
                          color: Colors.black,
                          letterSpacing: 5,
                          decoration: TextDecoration.underline,
                          fontSize: 18,
                          fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "•Flutter",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "•Dart",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "•Firebase",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "•SwiftUI",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "•Python",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "•API Integration",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "•Local Storage",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "•Deployment",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "•SDK Integration",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                side: BorderSide(width: 3, color: Colors.black),
                                borderRadius: BorderRadius.circular(0)),
                            backgroundColor: Colors.black,
                            padding: EdgeInsets.symmetric(
                                vertical: 25, horizontal: 30)),
                        child: Text(
                          "DOWNLOAD RESUME",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 4),
                        )),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 2,
                color: Color(0xffebebeb),
                child: Column(
                  spacing: 15,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      "RESUME",
                      style: TextStyle(
                          color: Colors.pink,
                          letterSpacing: 5,
                          fontSize: 16,
                          fontWeight: FontWeight.w900),
                    ),
                    Text(
                      "More of my credentials.",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 35,
                          fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Text(
                        Constants.introText2,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Work Experience",
                      style: TextStyle(
                          color: Colors.pink,
                          fontSize: 22,
                          fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Column(
                        children: [
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: experience.length,
                              itemBuilder: (context, index) {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.17,
                                      padding: EdgeInsets.only(top: 5),
                                      child: Column(
                                        children: [
                                          Text(
                                            experience[index][0],
                                            style: TextStyle(
                                                fontWeight: FontWeight.w900,
                                                fontSize: 20),
                                          ),
                                          Text(
                                            experience[index][1],
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15,
                                                color: Colors.grey),
                                          )
                                        ],
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(14),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.black),
                                          child: Icon(
                                            Icons.cases_rounded,
                                            color: Colors.white,
                                            size: 17,
                                          ),
                                        ),
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.18,
                                          width: 2,
                                          color: Colors.grey
                                              .withValues(alpha: 0.2),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 100,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 5),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            experience[index][2],
                                            style: TextStyle(
                                                fontWeight: FontWeight.w900,
                                                fontSize: 18),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.07,
                                            height: 2,
                                            color: Colors.grey
                                                .withValues(alpha: 0.5),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.42,
                                            child: Text(
                                              experience[index][3],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15,
                                                  color: Colors.grey),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              })
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Education",
                      style: TextStyle(
                          color: Colors.pink,
                          fontSize: 22,
                          fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Column(
                        children: [
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: education.length,
                              itemBuilder: (context, index) {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.17,
                                      padding: EdgeInsets.only(top: 5),
                                      child: Column(
                                        children: [
                                          Text(
                                            education[index][0],
                                            style: TextStyle(
                                                fontWeight: FontWeight.w900,
                                                fontSize: 20),
                                          ),
                                          Text(
                                            education[index][1],
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15,
                                                color: Colors.grey),
                                          )
                                        ],
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(14),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.black),
                                          child: Icon(
                                            Icons.school,
                                            color: Colors.white,
                                            size: 17,
                                          ),
                                        ),
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.18,
                                          width: 2,
                                          color: Colors.grey
                                              .withValues(alpha: 0.2),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 100,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 5),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            education[index][2],
                                            style: TextStyle(
                                                fontWeight: FontWeight.w900,
                                                fontSize: 18),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.07,
                                            height: 2,
                                            color: Colors.grey
                                                .withValues(alpha: 0.5),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.42,
                                            child: Text(
                                              education[index][3],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15,
                                                  color: Colors.grey),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              })
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/bg.jpg"),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withValues(alpha: 0.6), BlendMode.darken),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      "SERVICES",
                      style: TextStyle(
                          color: Colors.pink,
                          letterSpacing: 5,
                          fontSize: 16,
                          fontWeight: FontWeight.w900),
                    ),
                    Text(
                      "What Can I Do For You?",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Text(
                        servicesProvide[0],
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 10,
                            children: [
                              Icon(
                                Icons.public,
                                color: Colors.pink,
                                size: 50,
                              ),
                              Text(
                                "Web Development",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                  width: 300,
                                  child: Text(servicesProvide[1],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500)))
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 10,
                            children: [
                              Icon(
                                Icons.phone_android,
                                color: Colors.pink,
                                size: 50,
                              ),
                              Text(
                                "Mobile Development",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                  width: 300,
                                  child: Text(servicesProvide[2],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500)))
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 10,
                            children: [
                              Icon(
                                Icons.phone_iphone,
                                color: Colors.pink,
                                size: 50,
                              ),
                              Text(
                                "Native iOS Developer",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                  width: 300,
                                  child: Text(servicesProvide[3],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500)))
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.black.withValues(alpha: 0.9),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      "CONTACT",
                      style: TextStyle(
                          color: Colors.pink,
                          letterSpacing: 5,
                          fontSize: 16,
                          fontWeight: FontWeight.w900),
                    ),
                    Text(
                      "I'd Love To Hear From You",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Text(
                        connectMessage,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 10,
                            children: [
                              Icon(
                                Icons.place,
                                color: Colors.white,
                                size: 50,
                              ),
                              Text(
                                "WHERE TO FIND ME",
                                style: TextStyle(
                                    color: Colors.pink,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                  width: 300,
                                  child: Text("Janak Puri, New Delhi",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500)))
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 10,
                            children: [
                              Icon(
                                Icons.email,
                                color: Colors.white,
                                size: 50,
                              ),
                              Text(
                                "EMAIL ME AT",
                                style: TextStyle(
                                    color: Colors.pink,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                  width: 300,
                                  child: Text("namandhiman8527@gmail.com",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500)))
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 10,
                            children: [
                              Icon(
                                Icons.call,
                                color: Colors.white,
                                size: 50,
                              ),
                              Text(
                                "CALL ME AT",
                                style: TextStyle(
                                    color: Colors.pink,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                  width: 300,
                                  child: Text("+91 8527048153",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500)))
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(child: Container()),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.2,
                            ),
                            Text(
                              "© Copyright 2024",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              width: 1,
                              height: 15,
                              color: Colors.grey.withValues(alpha: 0.4),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Made By: ",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "Naman Dhiman",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          left: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: toggle,
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                    color: Colors.black,
                    child: AnimatedSwitcher(
                      duration: Duration(milliseconds: 400),
                      switchInCurve: Curves.easeInOutCubic,
                      switchOutCurve: Curves.easeInOutCubic,
                      transitionBuilder: (child, animation) {
                        return FadeTransition(
                            opacity: animation,
                            child: ScaleTransition(
                                scale: animation, child: child));
                      },
                      child: !isExpanded
                          ? Icon(
                              Icons.menu,
                              color: Colors.pink,
                              size: 30,
                            )
                          : Icon(
                              Icons.close,
                              color: Colors.pink,
                              size: 30,
                            ),
                    )),
              ),
              SizeTransition(
                sizeFactor: _animation,
                axisAlignment: 0.8,
                child: Container(
                  width: 200,
                  color: Colors.black,
                  child: Column(
                      children: dropDownEvents.map((String value) {
                    int index = dropDownEvents.indexOf(value);
                    return GestureDetector(
                      onTap: () {
                        changeDropDownValue(value);
                      },
                      child: MouseRegion(
                        onEnter: (_) {
                          setState(() {
                            colorList[index] = Colors.pink;
                            paddingList[index] = EdgeInsets.only(left: 10);
                          });
                        },
                        onExit: (_) {
                          setState(() {
                            colorList[index] = Colors.white;
                            paddingList[index] = EdgeInsets.only(left: 0);
                          });
                        },
                        child: AnimatedPadding(
                          padding: paddingList[index],
                          duration: Duration(milliseconds: 250),
                          child: ListTile(
                            title: AnimatedDefaultTextStyle(
                              style: TextStyle(
                                  color: selectedDropDownValue == value
                                      ? Colors.pink
                                      : colorList[index],
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                              duration: Duration(milliseconds: 150),
                              child: Text(value),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList()),
                ),
              )
            ],
          ),
        ),
        Positioned(
            bottom: 0,
            right: 0,
            child: ValueListenableBuilder(
              valueListenable: showBottomToTop,
              builder: (BuildContext context, value, Widget? child) {
                return AnimatedOpacity(
                  opacity: value ? 1 : 0,
                  duration: Duration(milliseconds: 200),
                  child: GestureDetector(
                    onTap: () {
                      if (value) {
                        scrollController.animateTo(0,
                            duration: Duration(milliseconds: 400),
                            curve: Curves.easeInOut);
                      }
                    },
                    child: Container(
                      height: 70,
                      width: 55,
                      color: Colors.pink,
                      child: Icon(
                        Icons.arrow_upward_sharp,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              },
            ))
      ],
    ));
  }

  Future<void> _launchUrl(String url) async {
    Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }
}
