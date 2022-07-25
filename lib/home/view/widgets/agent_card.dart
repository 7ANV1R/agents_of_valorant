import 'package:agents_of_valorant/data/model/agent_model.dart';
import 'package:agents_of_valorant/home/view/widgets/casing_extension.dart';
import 'package:agents_of_valorant/widgets/loader_wave.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

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
            child: Hero(
              tag: agent!.bgColor,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: HexColor(agent!.bgColor),
                  borderRadius: BorderRadius.circular(40),
                ),
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
              child: Hero(
                tag: agent!.agentImg,
                child: CachedNetworkImage(
                  fadeOutDuration: const Duration(milliseconds: 400),
                  imageUrl: agent!.agentImg,
                  placeholder: (context, url) => const Center(
                    child: FittedBox(
                      child: LoaderWave(),
                    ),
                  ),
                ),
              ),
              // child: Image.network(
              //   agent!.agentImg,
              // ),
            ),
          ),
          Positioned(
            top: separation,
            right: size.width * 0.05,
            child: Opacity(
              opacity: 1.0 - factorChange!,
              child: Hero(
                tag: agent!.agentNumber,
                child: Material(
                  type: MaterialType.transparency,
                  child: Text(
                    agent!.agentNumber.toString(),
                    style: GoogleFonts.oswald(
                      fontSize: 96,
                      fontWeight: FontWeight.bold,
                      color: Colors.white.withOpacity(0.15),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            // top: size.height * 0.7,
            bottom: size.height * 0.13,
            left: size.width * 0.07,
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
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: size.width * 0.04,
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
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  Hero(
                    tag: agent!.name,
                    child: Material(
                      type: MaterialType.transparency,
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
                  Text(
                    agent!.role.toCapitalized(),
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: size.height * 0.13,
            right: size.width * 0.05,
            child: Opacity(
              opacity: 1.0 - factorChange!,
              child: Lottie.asset(
                'assets/lottie/right-arrow.json',
                height: 64,
                width: 64,
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
