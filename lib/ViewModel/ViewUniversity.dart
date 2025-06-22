import 'package:flutter/material.dart';
import 'package:university/Model/universityModel.dart';
import 'package:university/View/UniversityService.dart';

class Viewuniversity extends StatefulWidget {
  const Viewuniversity({super.key});

  @override
  State<Viewuniversity> createState() => _ViewuniversityState();
}

class _ViewuniversityState extends State<Viewuniversity> {
  UniversityService service = UniversityService();
  TextEditingController country = TextEditingController();
  List<UniversityModel> university = [];

  fetchUniversityData(String country) async {
    var data = await service.getUniversity(country);
    setState(() {
      university = data;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchUniversityData("India");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    country.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${country.text} University"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
                controller: country,
                onEditingComplete: () {
                  fetchUniversityData(country.text);
                }),
            university.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                        itemCount: university.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              print(
                                  "Webpage : ${university[index].webPages[0]}");
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Card(
                                elevation: 10,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              "State Province: ${university[index].stateProvince}"),
                                          Text(
                                              "Alpha Two Codes: ${university[index].alphaTwoCode}"),
                                        ],
                                      ),
                                      Text(
                                        "Name: ${university[index].name}",
                                        maxLines: 3,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              "Domains: ${university[index].domains[0]}"),
                                          Text(
                                              "Country: ${university[index].country}"),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
