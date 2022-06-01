// ignore_for_file: public_member_api_docs, sort_constructors_first, lines_longer_than_80_chars
class Agent {
  String name;
  String agentImg;
  String role;
  int agentNumber;
  String agentBio;
  String selectionVoice;
  String qAbilityName;
  String qAbilityDescription;
  String eAbilityName;
  String eAbilityDescription;
  String cAbilityName;
  String cAbilityDescription;
  String xAbilityName;
  String xAbilityDescription;

  Agent({
    required this.name,
    required this.agentImg,
    required this.role,
    required this.agentNumber,
    required this.agentBio,
    required this.selectionVoice,
    required this.qAbilityName,
    required this.qAbilityDescription,
    required this.eAbilityName,
    required this.eAbilityDescription,
    required this.cAbilityName,
    required this.cAbilityDescription,
    required this.xAbilityName,
    required this.xAbilityDescription,
  });
}

List agents = <Agent>[
  Agent(
    name: 'brimstone',
    agentImg: 'https://static.wikia.nocookie.net/valorant/images/3/37/Brimstone_artwork.png',
    role: 'controller',
    agentNumber: 1,
    agentBio:
        "Joining from the USA, Brimstone's orbital arsenal ensures his squad always has the advantage. His ability to deliver utility precisely and from a distance make him an unmatched boots-on-the-ground commander.",
    selectionVoice: "They think I'm an old dog? Heh, I'll show 'em just how many tricks I know.",
    qAbilityName: 'incendiary',
    qAbilityDescription:
        'EQUIP an incendiary grenade launcher. FIRE to launch a grenade that detonates as it comes to a rest on the floor, creating a lingering fire zone that damages players within the zone.',
    eAbilityName: 'sky smoke',
    eAbilityDescription:
        'EQUIP a tactical map. FIRE to set locations where Brimstone’s smoke clouds will land. ALTERNATE FIRE to confirm, launching long-lasting smoke clouds that block vision in the selected area.',
    cAbilityName: 'stim beacon',
    cAbilityDescription:
        'EQUIP a stim beacon. FIRE to toss the stim beacon in front of Brimstone. Upon landing, the stim beacon will create a field that grants players RapidFire.',
    xAbilityName: 'orbital strike',
    xAbilityDescription:
        'EQUIP a tactical map. FIRE to launch a lingering orbital strike laser at the selected location, dealing high damage-over-time to players caught in the selected area.',
  ),
];
