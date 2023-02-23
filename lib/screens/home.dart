import 'package:flutter/material.dart';

import '../data/File_Json.dart';
import '../data/courses.dart';
import '../data/minor_courses.dart';
import '../data/my_courses.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text(""),
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: getBody());
  }

  Widget getBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 5),
      child: Column(
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
                height: 200,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  image: DecorationImage(
                      image: AssetImage('assets/images/appbar.jpg'),
                      fit: BoxFit.cover),
                ),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('helllllooo \n Hla hakim',
                          style: TextStyle(
                              fontSize: 27,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(255, 1, 104, 132)),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.notifications,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey,
                          size: 26,
                        ),
                        floatingLabelAlignment: FloatingLabelAlignment.start,
                        // floatingLabelBehavior: FloatingLabelBehavior.never,
                        floatingLabelStyle: TextStyle(
                          backgroundColor: Colors.white,
                        ),
                        suffixIcon: Icon(
                          Icons.mic,
                          color: Colors.blue,
                        ),
                        labelText: "search your courses",
                        labelStyle: TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(45)))),
                  )
                ]),
              )
            ],
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Academic cources',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  'see more',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
          const SizedBox(height: 15),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.all(10),
            child: Wrap(
              children: List.generate(
                courses.length,
                (index) {
                  var data = courses[index];
                  final isMatchingCourse = mycourses
                      .any((course) => course['title'] == data['title']);
                  var size = MediaQuery.of(context).size;
                  return Padding(
                    padding: const EdgeInsets.only(right: 15, bottom: 20),
                    child: Container(
                      alignment: Alignment.topCenter,
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(17),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10.0,
                                offset: const Offset(0, 5)),
                          ]),
                      width: size.width * 0.6,
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              Container(
                                height: size.height * 0.2,
                                width: size.width * 0.6,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(
                                    data['image'],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 7,
                                left: 7,
                                child: Container(
                                  width: 90,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: Colors.white70,
                                      borderRadius: BorderRadius.circular(100)),
                                  alignment: Alignment.center,
                                  child: Text(
                                    '${data['semester']} semester',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 14),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(data['title'],
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    decoration: isMatchingCourse
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 14)),
                          ),
                          SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.only(right: 7, left: 7),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 30,
                                  width: 30,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.network(
                                      data['instructor_profile'],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Container(
                                      width: 70,
                                      alignment: Alignment.centerLeft,
                                      child: Text(data['instructor_name'])),
                                ),
                                Text(
                                  '${data['credits']} credits',
                                  style: const TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Current Cources',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  'see more',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
          SizedBox(height: 25),
          Column(
              children: List.generate(
            commingCourses.length,
            (index) {
              var size = MediaQuery.of(context).size;
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 0, 31, 77),
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Container(
                              height: size.width * 0.17,
                              width: size.width * 0.17,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  commingCourses[index]['image'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 5),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    commingCourses[index]['title'],
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    'Instructor : ${commingCourses[index]['instructor_name']}',
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Stack(
                                alignment: Alignment.centerLeft,
                                children: [
                                  Container(
                                    width: size.width,
                                    height: 5,
                                    decoration: BoxDecoration(
                                      color: Colors.white12,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  ),
                                  Container(
                                    width: (size.width *
                                            commingCourses[index]
                                                ['percentage'] /
                                            100) -
                                        30,
                                    height: 5,
                                    decoration: BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  ),
                                ]),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            alignment: Alignment.centerRight,
                            child: Text(
                              '${commingCourses[index]['percentage']}%',
                              style: const TextStyle(
                                  color: Colors.amber,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          )),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Minor Cources',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  'see more',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: minorCources.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      image: DecorationImage(
                        image: NetworkImage(minorCources[index]
                            ["minorCourcesinstructor_profile"]),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 90,
                            height: 30,
                            decoration: BoxDecoration(
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(100)),
                            alignment: Alignment.center,
                            child: Text(
                              'SEMESTER ${minorCources[index]["minorCourcessemester"]}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 13),
                            ),
                          ),
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.white70,
                                  borderRadius: BorderRadius.circular(10)),
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      minorCources[index]["minorCourcestitle"],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                    Text(
                                      minorCources[index]
                                          ["minorCourcesinstructor_name"],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    const SizedBox(height: 10.0),
                                    Text(
                                      "${minorCources[index]["minorCourcespercentage"]}% completed",
                                      style: const TextStyle(
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
