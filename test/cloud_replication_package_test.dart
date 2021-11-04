import 'package:cloud_replication_package/src/service/replication_service.dart';
import 'package:test/test.dart';

import 'package:cloud_replication_package/cloud_replication_package.dart';

import 'package:geiger_localstorage/geiger_localstorage.dart' as toolboxAPI;
import 'package:http/http.dart' as http;
import 'package:cloud_replication_package/src/service/cloud_service.dart';

void replicationTests() async {
  test('Full Replication', ()  {
    ReplicationController rep = ReplicationService();
    rep.geigerReplication();
  });
  test('User Exist', ()  async {
    var cloud = CloudService();
    bool response = await cloud.userExists('anyRandomUserId');
    print(response);
  });
}

void main() {
  print("START MAIN");
  replicationTests();
}
