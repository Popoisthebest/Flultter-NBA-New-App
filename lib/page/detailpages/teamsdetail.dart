import 'package:flutter/material.dart';

class TeamsDetailPage extends StatefulWidget {
  final String conference;
  final String division;
  final String full_name;

  const TeamsDetailPage(
      {super.key,
      required this.conference,
      required this.division,
      required this.full_name});

  @override
  State<TeamsDetailPage> createState() => _TeamsDetailPageState();
}

class _TeamsDetailPageState extends State<TeamsDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Team Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  widget.full_name,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Text(
                  "컨퍼런스: ${widget.conference}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Text(
                  "디비전: ${widget.division}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
