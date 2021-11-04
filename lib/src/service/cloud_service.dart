import 'dart:convert';

import 'package:http/http.dart' as http;
import '../cloud_models/user.dart';
import '../cloud_models/event.dart';
import '../cloud_models/tag.dart';
import '../cloud_models/threat_dict.dart';
import '../cloud_models/threat_weights.dart';
import '../cloud_models/translation.dart';


class CloudService {

  final String uri = "http://37.48.101.252:10002/geiger-cloud/api";

  CloudService();
  
  // CREATE EVENT
  Future<void> createEvent(String username, Event event) async {
    print('CREATED USER EVENT');
    final String userUri = '/store/user/$username/event';
    final response = await http.post(
      Uri.parse(uri + userUri),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'accept': 'application/json',
      },
      body: event,
    );
    print('USER EVENT CREATED');
  }
  // UPDATE EVENT
  Future<void> updateEvent(String username, String eventId, Event event) async {
    print('UPDATE USER EVENT');
    final String userUri = '/store/user/$username/event/$eventId';
    final response = await http.put(
      Uri.parse(uri + userUri),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'accept': 'application/json',
      },
      body: event,
    );
    print('USER EVENT CREATED');
  }
  //CHECK IF A USER EXIST
  /*Future<bool> userExists(String username) async {
    print('CHECK USER');
    try {
      final String userUri = '/store/user/anyRandomUserId';
      final String finalUri = uri + userUri;
      var url = Uri.parse(finalUri);
      http.Response response = await http.get(
        url,
        headers: <String,String>{
          'accept': 'application/json',
          'content-type': 'application/json',
        }
      );
      if (response.statusCode == 200) {
        print('USER EXISTS');
        return Future<bool>.value(true);
      } else {
        if (response.statusCode == 404 ) {
          return Future<bool>.value(false);
        } else {
          print(response.statusCode.toString());
          throw Exception;
        }
      }
    } catch (e) {
      print(e);
      return Future<bool>.value(false);
    }
  }*/
  Future<bool> userExists(String username) async {
    print('CHECK USER');
    try {
      final String userUri = '/store/user/anyRandomUserId';
      final String finalUri = uri + userUri;
      var url = Uri.parse(finalUri);
      http.Response response = await http.get(url, headers: <String, String>{
        'accept': 'application/json',
        'content-type': 'application/json',
      });
      if (response.statusCode == 200) {
        print('USER EXISTS');
        return true;
      } else {
        if (response.statusCode == 404) {
          return false;
        } else {
          print(response.statusCode.toString());
          throw Exception;
        }
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  //CREATE A NEW USER
  Future<void> createUser(String username) async {
    print('CREATE USER');
    final String userUri = '/store/user';
    final response = await http.post(
      Uri.parse(uri + userUri),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'accept': 'application/json',
      },
      body: User(idUser: username, name: '', access: "USER", email: "", expires: null, publicKey: ""),
    );
    if (response.statusCode == 200) {
      print("USER CREATED");
    } else {
      throw Exception;
    }
    print('USER CREATED');
  }

  //GET LIST OF USERS
  Future<List<User>> getUsers() async {
    print('GET USER LIST');
    final String userUri = '/store/user';
    final response = await http.get(
      Uri.parse(uri + userUri),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      var object = jsonDecode(response.body) as List;
      List<User> allUsers = object.map((e) => User.fromJson(e)).toList();
      return allUsers;
    } else {
      throw Exception;
    }
  }

  //GET TLP WHITE EVENTS
  Future<List<Event>> getTLPWhiteEvents() async {
    print('TLP WHITE EVENTS');
    final String eventUri = '/store/event';
    final response = await http.get(
      Uri.parse(uri + eventUri),
      headers: <String, String>{
        'accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      var object = jsonDecode(response.body) as List;
      List<Event> allEvents = object.map((e) => Event.fromJson(e)).toList();
      return allEvents;
    } else {
      throw Exception;
    }
  }

  //GET TLP WHITE EVENTS
  //FILTERED BY DATE
  Future<List<Event>> getTLPWhiteEventsDateFilter(String timestamp) async {
    print('TIMESTAMP FILTERED TLP WHITE EVENTS');
    final String eventUri = '/store/event';
    final response = await http.get(
      Uri.parse(uri + eventUri),
      headers: <String, String>{
        'accept': 'application/json',
        'modified_since': timestamp.toString(),
      },
    );
    if (response.statusCode == 200) {
      var object = jsonDecode(response.body) as List;
      List<Event> allEvents = object.map((e) => Event.fromJson(e)).toList();
      return allEvents;
    } else {
      throw Exception;
    }
  }

  //GET LIST OF USER EVENTS
  Future<List<String>> getUserEvents(String userId) async {
    print('GET USER EVENT LIST');
    final String eventUri = '/store/$userId/event';
    final response = await http.get(
      Uri.parse(uri + eventUri),
      headers: <String, String>{
        'accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      var object = response.body;
      List<String> allEvents = (jsonDecode(object) as List<dynamic>).cast<String>();
      return allEvents;
    } else {
      throw Exception;
    }
  }

  //GET LIST OF USER EVENTS
  //FILTERED BY DATE
  Future<List<String>> getUserEventsDateFilter(String userId, String fromTimestamp) async {
    print('TIMETAMP FILTERED GET USER EVENT LIST');
    final String eventUri = '/store/$userId/event';
    final response = await http.get(
      Uri.parse(uri + eventUri),
      headers: <String, String>{
        'accept': 'application/json',
        'modified_since': fromTimestamp,
      },
    );
    if (response.statusCode == 200) {
      var object = response.body;
      List<String> allEvents = (jsonDecode(object) as List<dynamic>).cast<String>();
      return allEvents;
    } else {
      throw Exception;
    }
  }

  //GET USER EVENT
  Future<Event> getSingleUserEvent(String userId, String eventId) async {
    print('GET SINGLE USER EVENT');
    final String eventUri = '/store/$userId/event/$eventId';
    final response = await http.get(
      Uri.parse(uri + eventUri),
      headers: <String, String>{
        'accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      var object = jsonDecode(response.body);
      Event singleEvent = Event.fromJson(object);
      return singleEvent;
    } else {
      throw Exception;
    }
  }

  //DELETE USER EVENT
  Future<void> deleteEvent(String username, String eventId) async {
    print('DELETE EVENT');
    final String eventUri = '/store/$username/event/$eventId';
    final response = await http.delete(
      Uri.parse(uri + eventUri),
      headers: <String, String>{
        'accept': 'application/json',
      },
    );
    if (response.statusCode != 200) {
      throw Exception;
    }
  }

  //GET THREAT WEIGHTS
  Future<List<ThreatWeights>> getThreatWeights() async {
    print('GET THREAT WEIGHTS');
    final String threatUri = 'threatweights';
    final response = await http.get(
      Uri.parse(uri + threatUri),
      headers: <String, String>{
        'accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      var object = jsonDecode(response.body) as List;
      List<ThreatWeights> allWeights = object.map((e) => ThreatWeights.fromJson(e)).toList();
      return allWeights;
    } else {
      throw Exception;
    }
  }

}