import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:reel_ro/models/comment_model.dart';
import 'package:reel_ro/models/nessted_comment_model.dart';

import '../utils/base.dart';

class CommentRepository {
  Future<List<CommentModel>> getCommentById(int id, String token,
      {bool isPhoto = false}) async {
    print('21212121');
    final response = await http.get(
      isPhoto
          ? Uri.parse("${Base.getCommentByPhotoId}$id")
          : Uri.parse("${Base.getCommentByReelId}$id"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: "Bearer $token",
      },
    );
    // Get.snackbar('title', response.body);
    final body = jsonDecode(response.body);
    print('21212121 + body');
    if (response.statusCode == 201) {
      final Iterable list = body;
      return list.map((e) => CommentModel.fromMap(e)).toList();
    } else {
      return Future.error(body['message']);
    }
  }
  // Future<List<CommentModel>> getCommentByReelId(
  //     int reelId, String token) async {
  //   final response = await http.get(
  //     Uri.parse("${Base.getCommentByReelId}/$reelId"),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //       HttpHeaders.authorizationHeader: "Bearer $token",
  //     },
  //   );
  //   final body = jsonDecode(response.body);
  //   if (response.statusCode == 200 || response.statusCode == 201) {
  //     final Iterable list = body;
  //     return list.map((e) => CommentModel.fromMap(e)).toList();
  //   } else {
  //     return Future.error(body['detail']);
  //   }
  // }

  Future<List<NestedCommentModel>> getNestedCommentByCommentId(
      int commentId, String token, bool isPhoto) async {
    final response = await http.get(
      isPhoto
          ? Uri.parse("${Base.nestedPostComment}/$commentId/replies")
          : Uri.parse("${Base.nestedComment}/$commentId/responses"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: "Bearer $token",
      },
    );
    final body = jsonDecode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      final Iterable list = body;
      return list.map((e) => NestedCommentModel.fromMap(e)).toList();
    } else {
      return Future.error(body['detail']);
    }
  }

  Future<CommentModel> addCommentToById(
      String token, Map<String, dynamic> data, int id,
      {bool isPhoto = false}) async {
    final response = await http.post(
      isPhoto
          ? Uri.parse("${Base.addCommentToPhotoId}/$id")
          : Uri.parse("${Base.addCommentToReelId}/$id"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: "Bearer $token",
      },
      body: jsonEncode(data),
    );
    final body = jsonDecode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return CommentModel.fromMap(body);
    } else {
      return Future.error(body['detail']);
    }
  }

  Future<NestedCommentModel> addNestedComment(
      int commentId, String comment, String token,
      {bool isPhoto = false}) async {
    final response = await http.post(
      isPhoto
          ? Uri.parse("${Base.nestedPostComment}/$commentId/replies")
          : Uri.parse("${Base.nestedComment}/$commentId/responses"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: "Bearer $token",
      },
      body: jsonEncode({
        'response': comment,
      }),
    );
    final body = jsonDecode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return NestedCommentModel.fromMap(body);
    } else {
      return Future.error(body['detail']);
    }
  }

  Future<int> getCommentCountByReelId(int reelId, String token) async {
    final response = await http.get(
      Uri.parse("${Base.getCommentCount}/$reelId"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: "Bearer $token",
      },
    );
    final body = jsonDecode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return body['comment_count'] as int;
    } else {
      print(body['meesage']);
      return Future.error(body['message']);
    }
  }

  Future<int> getCommentCountByPostId(int id, String token) async {
    final response = await http.get(
      Uri.parse("${Base.getPostCommentCount}/$id"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: "Bearer $token",
      },
    );
    final body = jsonDecode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return body['comment_count'] as int;
    } else {
      print(body['meesage']);
      return Future.error(body['message']);
    }
  }

  Future<void> toggleCommentLike(int id, String token,
      {bool isPhoto = false}) async {
    final response = await http.post(
      isPhoto
          ? Uri.parse("${Base.togglePhotoCommentLike}/$id")
          : Uri.parse("${Base.toggleCommentLike}/$id"),
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

  Future<void> deleteComment(int commentId, String token,
      {bool isPhoto = false}) async {
    final response = await http.delete(
      isPhoto
          ? Uri.parse("${Base.deletePostComment}/$commentId")
          : Uri.parse("${Base.deleteComment}/$commentId"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: "Bearer $token",
      },
    );
    final body = jsonDecode(response.body);
    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return;
    } else {
      return Future.error(body['detail']);
    }
  }
}
