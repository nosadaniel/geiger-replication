import 'translation.dart';

class Event {
  String idEvent;
  String tlp;
  String? type;
  String? encoding;
  List<String>? tags;
  DateTime? lastModified;
  DateTime? expires;
  String? language;
  String? owner;
  String? content;
  List<Translation>? translation;
   
 

	Event({
    required this.idEvent, 
    required this.tlp, 
    this.type, 
    this.encoding, 
    this.tags, 
    this.lastModified, 
    this.expires, 
    this.language, 
    this.owner, 
    this.content, 
    this.translation,
  });

	factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      idEvent: json['id_event'] as String,
      tlp : json['tlp'] as String,
      type: json['type'] as String,
      encoding: json['encoding'] as String,
      tags: json['tags'] as List<String>,
      lastModified: json['last_modified'] as DateTime,
      expires: json['expires'] as DateTime,
      language: json['language'] as String,
      owner: json['owner'] as String,
      content: json['content'] as String,
      translation: json['translation'] as List<Translation>,
    );
	}

	Map<String, dynamic> toJson() {
		final  Map<String, dynamic> data = <String, dynamic>{};
		data['id_event'] = idEvent;
		data['tlp'] = tlp;
		data['type'] = type;
		data['encoding'] = encoding;
		data['tags'] = tags;
		data['last_modified'] = lastModified;
		data['expires'] = expires;
		data['language'] = language;
		data['owner'] = owner;
		data['content'] = content;
		if (translation != null) {
      data['translation'] = translation!.map((v) => v.toJson()).toList();
    }
		return data;
	}

  String get getIdEvent => idEvent;
  set setIdEvent(String idEvent) => this.idEvent = idEvent;

  String get getTlp => tlp;
  set setTlp(String tlp) => this.tlp = tlp;

  String? get getType => type;
  set setType(String type) => this.type = type;

  String? get getEncoding => encoding;
  set setEncoding(String encoding) => this.encoding = encoding;

  List<String>? get getTags => tags;
  set setTags(List<String> tags) => this.tags = tags;

  DateTime? get getLastModified => lastModified;
  set setLastModified(DateTime lastModified) => this.lastModified = lastModified;

  DateTime? get getExpires => expires;
  set setExpires(DateTime expires) => this.expires = expires;

  String? get getLanguage => language;
  set setLanguage(String language) => this.language = language;

  String? get getOwner => owner;
  set setOwner(String owner) => this.owner = owner;

  String? get getContent => content;
  set setContent(String	content) => this.content = content;

  List<Translation>? get getTranslation => translation;
  set setTranslation(List<Translation> translation) => this.translation = translation;

}
