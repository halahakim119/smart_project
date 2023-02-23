import 'package:flutter/material.dart';
import '../data/my_courses.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final filteredCourses = mycourses.where((course) => course['percentage'] == 100).toList();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text(
            "My Courses",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 5),
            child: Column(children: [
              Column(
                  children: List.generate(
                filteredCourses.length,
                (index) {
                  var size = MediaQuery.of(context).size;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 0, 31, 77),
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                height: size.width * 0.17,
                                width: size.width * 0.17,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    filteredCourses[index]['image'],
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
                                      filteredCourses[index]['title'],
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      'Instructor : ${filteredCourses[index]['instructor_name']}',
                                      style:
                                          const TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
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
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                      ),
                                      Container(
                                        width: (size.width *
                                                filteredCourses[index]['percentage'] /
                                                100) -
                                            30,
                                        height: 5,
                                        decoration: BoxDecoration(
                                          color: Colors.amber,
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                      ),
                                    ]),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  '${filteredCourses[index]['percentage']}%',
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
              ))
            ])));
  }
}
