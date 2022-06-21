import 'package:get/get.dart';

class DemoData {
  static String winnerHeaderImage = 'assets/Rectangle 42.png';

  static List<WinnerList> demoWinnerList = [
    WinnerList(
      imageurl:
          'https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1085&q=80',
      userName: 'Rodrick Decker',
      title: 'May Ads Contest Winner',
      prize: 'Duke 390',
    ),
    WinnerList(
      imageurl:
          'https://images.unsplash.com/photo-1466112928291-0903b80a9466?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1173&q=80',
      userName: 'Jonathan Higgins',
      title: 'Mega Contest Winners',
      prize: 'Mercedes Benz E-Class',
    ),
  ];
  static List<ContestDates> demoContestDatesList = [
    ContestDates(
      imageurl:
          'https://images.unsplash.com/photo-1494905998402-395d579af36f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
      endOn: 'May 31st',
      title: 'May Ads Contest',
      prize: 'Duke 390',
    ),
    ContestDates(
      imageurl:
          'https://images.unsplash.com/photo-1622185135505-2d795003994a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
      endOn: 'May 31st',
      title: 'Mega Contest',
      prize: 'Mercedes Benz E-Class',
    ),
    ContestDates(
      imageurl:
          'https://images.unsplash.com/photo-1591337676887-a217a6970a8a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',
      endOn: 'May 31st',
      title: 'May Ads Contest',
      prize: 'iPhone 13',
    ),
  ];
}

class WinnerList {
  String? imageurl;
  String? userName;
  String? title;
  String? prize;

  WinnerList({
    required this.imageurl,
    this.userName,
    this.title,
    this.prize,
  });
}

class ContestDates {
  String? imageurl;
  String? endOn;
  String? title;
  String? prize;

  ContestDates({
    required this.imageurl,
    this.endOn,
    this.title,
    this.prize,
  });
}
