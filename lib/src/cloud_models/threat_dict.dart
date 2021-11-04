class ThreatDict {
  List<int> botnets;
  List<int> dataBreach;
  List<int> denialOfService;
  List<int> externalEnvironmentThreats;
  List<int> insiderThreats;
  List<int> malware;
  List<int> phishing;
  List<int> physicalThreats;
  List<int> ransomware;
  List<int> spam;
  List<int> webApplicationThreats;
  List<int> webBasedThreats;

  ThreatDict({
    required this.botnets,
    required this.dataBreach,
    required this.denialOfService,
    required this.externalEnvironmentThreats,
    required this.insiderThreats,
    required this.malware,
    required this.phishing,
    required this.physicalThreats,
    required this.ransomware,
    required this.spam,
    required this.webApplicationThreats,
    required this.webBasedThreats
  });

  factory ThreatDict.fromJson(Map<String, dynamic> json) {
    return ThreatDict(
      botnets: json['botnets'] as List<int>,
      dataBreach: json['data breach'] as List<int>,
      denialOfService: json['denial of service'] as List<int>,
      externalEnvironmentThreats: json['external environment threats'] as List<int>,
      insiderThreats: json['insider threats'] as List<int>,
      malware: json['malware'] as List<int>,
      phishing: json['phishing'] as List<int>,
      physicalThreats: json['physical threats'] as List<int>,
      ransomware: json['ransomware'] as List<int>,
      spam: json['spam'] as List<int>,
      webApplicationThreats: json['web application threats'] as List<int>,
      webBasedThreats: json['web-based threats'] as List<int>,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['botnets'] = botnets;
    data['data breach'] = dataBreach;
    data['denial of service'] = denialOfService;
    data['external environment threats'] = externalEnvironmentThreats;
    data['insider threats'] = insiderThreats;
    data['malware'] = malware;
    data['phishing'] = phishing;
    data['physical threats'] = physicalThreats;
    data['ransomware'] = ransomware;
    data['spam'] = spam;
    data['web application threats'] = webApplicationThreats;
    data['web-based threats'] = webBasedThreats;
    return data;
  }
}