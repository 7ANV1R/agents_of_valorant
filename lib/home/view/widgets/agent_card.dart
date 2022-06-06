import 'package:agents_of_valorant/data/model/agent_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
                color: HexColor(agent!.bgColor),
                // color: Color(int.parse(agent!.bgColor)),
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
              child: CachedNetworkImage(
                imageUrl: agent!.agentImg,
                placeholder: (context, url) => const Center(
                  child: FittedBox(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                ),
              ),
              // child: Image.network(
              //   agent!.agentImg,
              // ),
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

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
  static int _getColorFromHex(String hexColor) {
    
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return int.parse(hexColor, radix: 16);
  }
}
