import 'dart:convert';
import 'package:api_test/model/team.dart';
import 'package:api_test/page/detailpages/teamsdetail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String searchText = '';

// ignore: must_be_immutable
class TeamPage extends StatefulWidget {
  const TeamPage({super.key});

  @override
  State<TeamPage> createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  List<Team> teams = [];
  List<Team> filteredTeams = [];
  bool isLoading = false;

  // get team
  Future getTeams() async {
    setState(() {
      isLoading = true;
    });

    const String apiUrl = "https://api.balldontlie.io/v1/teams";
    const String apiKey = "d531a72c-1a15-4f55-9155-d2fa812dfa9a";

    final response =
        await http.get(Uri.parse(apiUrl), headers: {'Authorization': apiKey});
    var jsonData = jsonDecode(response.body);

    List<Team> tempList = [];
    for (var eachTeam in jsonData['data']) {
      tempList.add(
        Team(
          abbreviation: eachTeam['abbreviation'],
          city: eachTeam['city'],
          conference: eachTeam['conference'],
          division: eachTeam['division'],
          full_name: eachTeam['full_name'],
        ),
      );
    }

    setState(() {
      teams = tempList;
      filteredTeams = teams;
      isLoading = false;
    });
  }

  void _filterTeams(String enteredKeyword) {
    List<Team> results = [];
    if (enteredKeyword.isEmpty) {
      results = teams;
    } else {
      results = teams
          .where(
            (team) => team.abbreviation.toLowerCase().contains(
                  enteredKeyword.toLowerCase(),
                ),
          )
          .toList();
    }

    setState(() {
      filteredTeams = results;
    });
  }

  @override
  void initState() {
    super.initState();
    getTeams();
  }

  @override
  Widget build(BuildContext context) {
    getTeams();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Teams' Page"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: '팀의 약칭',
                hintText: '팀의 약칭으로 검색해 주세요.',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              onChanged: (value) {
                _filterTeams(value);
              },
            ),
          ),
          Expanded(
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: filteredTeams.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TeamsDetailPage(
                                  conference: filteredTeams[index].conference,
                                  division: filteredTeams[index].division,
                                  full_name: filteredTeams[index].full_name,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10)),
                            child: ListTile(
                              title: Text(filteredTeams[index].full_name),
                              subtitle: Text(filteredTeams[index].abbreviation),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
