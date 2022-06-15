import 'package:agents_of_valorant/data/model/agent_model.dart';
import 'package:agents_of_valorant/home/view/widgets/casing_extension.dart';
import 'package:agents_of_valorant/widgets/loader_wave.dart';
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
                fadeOutDuration: const Duration(milliseconds: 400),
                imageUrl: agent!.agentImg,
                placeholder: (context, url) => const Center(
                  child: FittedBox(
                    child: LoaderWave(),
                  ),
                ),
              ),
              // child: Image.network(
              //   agent!.agentImg,
              // ),
            ),
          ),
          Positioned(
            // top: size.height * 0.7,
            bottom: size.height * 0.13,
            left: 40,
            // right: 100,
            child: Opacity(
              opacity: 1.0 - factorChange!,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Transform.scale(
                    scaleX: -1,
                    scaleY: -1,
                    child: Text(
                      '"',
                      style: GoogleFonts.bizUDGothic(
                        fontSize: 96,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 32,
                      ),
                      SizedBox(
                        width: size.width * 0.75,
                        child: Text(
                          agent!.selectionVoice,
                          softWrap: true,
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 64,
                  ),
                  Text(
                    agent!.name.toUpperCase(),
                    style: GoogleFonts.roboto(
                      fontSize: 64,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    agent!.role.toCapitalized(),
                    style: GoogleFonts.roboto(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
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
