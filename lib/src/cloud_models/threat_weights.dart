import 'threat_dict.dart';

class ThreatWeights {
  String idThreatweights;
  ThreatDict threatDict;

  ThreatWeights({
    required this.idThreatweights, 
    required this.threatDict
  });

  factory ThreatWeights.fromJson(Map<String, dynamic> json) {
    return ThreatWeights(
      idThreatweights: json['id_threatweights'] as String,
      threatDict: json['threat_dict'] as ThreatDict,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_threatweights'] = idThreatweights;
    data['threat_dict'] = threatDict.toJson();
    return data;
  }

  String get getIdThreatweights => idThreatweights;
  set getIdThreatweights(String idThreatweights) => this.idThreatweights = idThreatweights;

  ThreatDict get getThreatDict => threatDict;
  set setThreatDict(ThreatDict threatDict) => this.threatDict = threatDict;
}

