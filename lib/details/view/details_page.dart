// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:agents_of_valorant/data/model/agent_model.dart';

class AgentDetails extends StatelessWidget {
  final Agent agent;
  const AgentDetails({
    Key? key,
    required this.agent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(agent.name),
      ),
    );
  }
}
