import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:reel_ro/services/communication_services.dart';
import 'package:reel_ro/utils/constants.dart';

import '../utils/base.dart';

class AuthRepository {
  User? user = FirebaseAuth.instance.currentUser;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final _googleSignIn = GoogleSignIn();
  final _storage = GetStorage();

  Future<String> signIn(
      {required String email, required String password}) async {
    var request = http.MultipartRequest('POST', Uri.parse(Base.login));
    request.fields.addAll({'username': email, 'password': password});

    http.StreamedResponse response = await request.send();
    var body = jsonDecode(await response.stream.bytesToString());
    if (response.statusCode == 200 || response.statusCode == 201) {
      if (body['status'] == Constants.unverified) {
        return Constants.unverified;
      } else {
        log("signInBody: $body");
        var map = {
          Constants.jwt: body['access_token'],
        };
        await _storage.write(Constants.token, map);

        CommunicationService.to.saveStreamAccessToken(body['chat_token']);

        return "Login successful";
      }
    } else {
      if (body['detail'] == 'User is unverified') {
        return Constants.unverified;
      }
      return Future.error(body['detail']);
    }
  }

  Future<void> signUp(Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse(Base.register),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    final body = jsonDecode(response.body);
    log("SignUpBody: $body");
    if (response.statusCode == 200 || response.statusCode == 201) {
      return;
    } else {
      return Future.error(body['detail']);
    }
  }

  Future<Map<String, dynamic>> verifyOtp(Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse(Base.verifyOtp),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    final body = jsonDecode(response.body);
    if (response.statusCode == 200) {
      var map = {
        Constants.jwt: body['jwt'],
        Constants.userId: body['user']['id'],
      };
      return map;
    } else {
      return Future.error(body['message']);
    }
  }

  Future<void> sendVerifyEmailLink(String email) async {
    var request =
        http.MultipartRequest('POST', Uri.parse(Base.sendVeifyEmailLink));
    request.fields.addAll({'email': email});

    http.StreamedResponse response = await request.send();
    var body = jsonDecode(await response.stream.bytesToString());
    if (response.statusCode == 200 || response.statusCode == 201) {
      return;
    } else {
      return Future.error(body['detail']);
    }
  }

  Future<void> sendPasswordResetLink(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  Future<void> signInWithGoogle() async {
    await _googleSignIn.disconnect();

    final GoogleSignInAccount? googleSignInAccount =
        await _googleSignIn.signIn();

    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    await _auth.signInWithCredential(credential);
  }

  Future<String> generateForgetPassword(String email) async {
    final response = await http.post(
      Uri.parse(Base.generateForgetPasswordToken),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "email": email,
      }),
    );
    final body = jsonDecode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return body;
    } else {
      return Future.error(body['detail']);
    }
  }

  Future<String> validateForgetPasswordtoken(String email, String token) async {
    final response = await http.post(
      Uri.parse(Base.validateForgetPasswordtoken),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "email": email,
        'token': token,
      }),
    );
    final body = jsonDecode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return body;
    } else {
      return Future.error(body['detail']);
    }
  }

  Future<void> addToken(String fcmToken, String token) async {
    final response = await http.post(
      Uri.parse(Base.fcmRegister),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: "Bearer $token",
      },
      body: jsonEncode({
        'token': fcmToken,
        "device_info": {},
      }),
    );
    final body = jsonDecode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return body;
    } else {
      return Future.error(body['detail']);
    }
  }

  Future<bool> getRefferalStatus(int userId, String token) async {
    final response = await http.get(
      Uri.parse("${Base.getsetReferralStatus}/$userId/referral/"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: "Bearer $token",
      },
    );
    final body = jsonDecode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return body['skip_referrer_check'];
    } else {
      return Future.error(body['detail']);
    }
  }

  Future<void> setRefferalStatus(String userId, String token) async {
    final response = await http.put(
      Uri.parse("${Base.getsetReferralStatus}/$userId/referral/"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: "Bearer $token",
      },
    );
    final body = jsonDecode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return;
    } else {
      return Future.error(body['detail']);
    }
  }

  Future<String> setForgetPassword(
      String email, String token, String newPassword) async {
    final response = await http.post(
      Uri.parse(Base.setForgetPassword),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          {"email": email, 'token': token, 'new_password': newPassword}),
    );
    final body = jsonDecode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return body;
    } else {
      return Future.error(body['detail']);
    }
  }

  Future<void> addReferrer(String userId, String token) async {
    final response = await http.put(
      Uri.parse(Base.addReferral),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: "Bearer $token",
      },
      body: jsonEncode({
        'referrer_id': userId,
      }),
    );
    final body = jsonDecode(response.body);
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 202) {
      return body;
    } else {
      return Future.error(body);
    }
  }

  Future<void> removeToken(
    String deviceToken,
    String token,
  ) async {
    final response = await http.post(
      Uri.parse("${Base.logout}/"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: "Bearer $token",
      },
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return;
    } else {
      return;
    }
  }

  Future<void> signOut(String deviceToken, String token) async {
    log("deletetingToken: ${_storage.read(Constants.token)}");
    await _storage.remove(Constants.token);
  }
}
