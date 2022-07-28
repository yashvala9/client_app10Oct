import 'dart:convert';
import 'dart:io';

import 'package:get/get_utils/get_utils.dart';
import 'package:http/http.dart' as http;
import 'package:reel_ro/models/contest_model.dart';
import 'package:reel_ro/models/photo_model.dart';
import 'package:reel_ro/models/winner_model.dart';
import 'package:reel_ro/utils/colors.dart';

import '../models/profile_model.dart';
import '../models/reel_model.dart';
import '../utils/base.dart';
import '../utils/snackbar.dart';

class GiveawayRepository {
  Future<void> createGiveaway(
      Map<String, dynamic> giveawayData, String token) async {
    print(jsonEncode(giveawayData));
    final response = await http.post(
      Uri.parse(Base.giveaway),
      headers: <String, String>{
        HttpHeaders.authorizationHeader: "Bearer $token",
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(giveawayData),
    );

    print('21212121 ${Base.giveaway}');
    print('21212121 ${response.statusCode}');
    final body = jsonDecode(response.body);

    print('21212121 ${response.body}');
    if (response.statusCode == 201) {
      showSnackBar("Giveaway created successfully!");
    } else {
      showSnackBar("Giveaway creation failed! please try again.");
    }
  }

  Future<String> getAdsEntryCountByUserId(int profileId, String token) async {
    final response = await http.get(
      Uri.parse("${Base.giveaway}$profileId/entries"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: "Bearer $token",
      },
    );
    final body = jsonDecode(response.body);
    print('list21213 ' + body.toString());

    if (response.statusCode == 200) {
      return body['ad_count'].toString();
    } else {
      return Future.error(body['message']);
    }
  }

  Future<String> getReferralsEntryCountByUserId(
      int profileId, String token) async {
    final response = await http.get(
      Uri.parse("${Base.giveaway}$profileId/entries"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: "Bearer $token",
      },
    );
    final body = jsonDecode(response.body);
    print('list212131 ' + body.toString());

    if (response.statusCode == 200) {
      return body['referral_count'].toString();
    } else {
      return Future.error(body['message']);
    }
  }

  Future<String> getTotalEntryCountByUserId(int profileId, String token) async {
    final response = await http.get(
      Uri.parse("${Base.giveaway}$profileId/entries"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: "Bearer $token",
      },
    );
    final body = jsonDecode(response.body);
    print('list212133 ' + body.toString());

    if (response.statusCode == 200) {
      return body['total'].toString();
    } else {
      return Future.error(body['detail']);
    }
  }

  Future<List<String>> getBuddyPairByUserId(int profileId, String token) async {
    List<String> list = [];
    final response = await http.get(
      Uri.parse(Base.getBuddyPairByUserId),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: "Bearer $token",
      },
    );
    final body = jsonDecode(response.body);
    // print('list2121 ' + body.toString());

    if (response.statusCode == 200) {
      list.add(body['profileUrl'].toString());
      list.add(body['fullname'].toString());
      return list;
    } else {
      list.add('');
      list.add('Not available');
      return list;
    }
  }

  Future<List<ContestModel>> getContests(int profileId, String token) async {
    final response = await http.get(
      Uri.parse(Base.giveaway),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: "Bearer $token",
      },
    );
    final body = jsonDecode(response.body);
    print('list212121body $body');
    if (response.statusCode == 200) {
      Iterable list = body;
      return list.map((e) => ContestModel.fromMap(e)).toList();
    } else {
      return Future.error(body);
    }
  }

  Future<ContestModel> getContestsByUserId(int profileId, String token) async {
    final response = await http.get(
      Uri.parse('${Base.giveaway}'),
      // user?user_id=$profileId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: "Bearer $token",
      },
    );
    final body = jsonDecode(response.body);
    print('list212121body2');
    print('list212121body2 $body');
    if (response.statusCode == 200) {
      return ContestModel.fromMap(json.decode(response.body)[0]);
    } else {
      return Future.error(body);
    }
  }

  Future<List<WinnerModel>> getWinners(int profileId, String token) async {
    List<WinnerModel> winners = [];
    final response = await http.get(
      Uri.parse(Base.winners),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: "Bearer $token",
      },
    );
    final body = jsonDecode(response.body);
    print('list212121winnerbody $body');
    if (response.statusCode == 200) {
      final Iterable list = body;
      return list.map((e) => WinnerModel.fromMap(e)).toList();
    } else {
      return Future.error(body);
    }
  }

  Future<Map<String, dynamic>> addPhoto(File file, String token) async {
    printInfo(info: "File path: ${file.path}");
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(Base.imageUpload),
    );
    var headers = <String, String>{
      'Content-Type': 'multipart/form-data; charset=UTF-8',
      HttpHeaders.authorizationHeader: "Bearer $token",
    };
    request.headers.addAll(headers);
    request.files.add(
      await http.MultipartFile.fromPath('files', file.path),
    );

    var res = await request.send();
    var responsed = await http.Response.fromStream(res);
    var resData = json.decode(responsed.body);
    printInfo(info: resData.toString());
    Map<String, dynamic> map = {
      'id': resData[0]['id'],
      'url': resData[0]['formats']['large']['url']
    };
    if (res.statusCode == 200) {
      return map;
    } else {
      return Future.error(resData['message']);
    }
  }

  Future<List<ProfileModel>> getReferrals(int profileId, String token) async {
    final response = await http.get(
      Uri.parse(Base.referrals),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: "Bearer $token",
      },
    );
    final body = jsonDecode(response.body);
    print('list212121winnerbody $body');
    if (response.statusCode == 200) {
      final Iterable list = body;
      return list.map((e) => ProfileModel.fromMap(e)).toList();
    } else {
      return Future.error(body);
    }
  }
}