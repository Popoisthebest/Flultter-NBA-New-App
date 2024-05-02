import 'package:api_test/page/detailpages/teamsdetail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlayerDetailPage extends StatefulWidget {
  final String first_name;
  final String last_name;
  final String height;
  final String weight;
  final String position;
  final String country;
  final String team_name;

  const PlayerDetailPage({
    super.key,
    required this.first_name,
    required this.last_name,
    required this.weight,
    required this.height,
    required this.position,
    required this.country,
    required this.team_name,
  });

  @override
  State<PlayerDetailPage> createState() => _PlayerDetailPageState();
}

class _PlayerDetailPageState extends State<PlayerDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Player Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "${widget.first_name} ${widget.last_name}",
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "키: ${widget.height}(feet-inch)",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "몸무게: ${widget.weight}lbs",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "포지션: ${widget.position}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "국적: ${widget.country}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "팀명: ${widget.team_name}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
