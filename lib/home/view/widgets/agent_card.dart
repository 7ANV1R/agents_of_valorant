import 'package:agents_of_valorant/data/model/agent_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AgentCard extends StatelessWidget {
  const AgentCard({
    super.key,
    required this.agent,
    required this.factorChange,
  });
  final Agent? agent;
  final double? factorChange;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final separation = size.height * 0.24;
    return OverflowBox(
      alignment: Alignment.topCenter,
      maxHeight: size.height,
      child: Stack(
        children: [
          Positioned.fill(
            top: separation,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Color(int.parse(agent!.bgColor)),
                borderRadius: BorderRadius.circular(40),
              ),
            ),
          ),
          Positioned(
            top: separation * factorChange! + 50,
            bottom: size.height * 0.35,
            left: 20,
            right: 20,
            child: Opacity(
              opacity: 1.0 - factorChange!,
              child: Image.network(
                agent!.agentImg,
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.7,
            // left: 40,
            right: 100,
            child: Opacity(
              opacity: 1.0 - factorChange!,
              child: Text(
                agent!.name.toUpperCase(),
                style: GoogleFonts.roboto(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
