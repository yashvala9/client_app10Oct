class Base {
  static const _url = 'https://reelro-strapi.herokuapp.com';

  static const register = "$_url/auth/register/sendOTP";
  static const login = '$_url/auth/local/';
  // static const createProfile = '$_url/profiles';
  static const forgetPassword = '$_url/auth/forgot-password';
  static const verifyOtp = '$_url/auth/register/verifyOTP';
  static const getProfileId =  '$_url/users/me';
  static const getProfilebyId = '$_url/user-profiles';
  static const getReelsbyId = '$_url/getReelsByUserId';
  static const createProfile = '$_url/user-profiles';
  static const searchUser = '$_url/searchByUserName';

  //Reels
  static const getReelsByUserId = '$_url/getReelsByUserId';
  static const getFeedsByUserId ='$_url/getFeed';
  static const getPhotosByUserId ='$_url/getPhotosByUserId';
  static const addReel = '$_url/addReelByUserId';

  //Upload Video and photo
  static const uploadVideo = '$_url/upload';

  //Like
  static const toggleLike = '$_url/toggleLike';
  static const getLikeFlag = '$_url/getLikeFlag';

  //Comment
  static const getCommentByReelId = '$_url/getCommentsByReelId';
  static const addCommentToReelId = '$_url/addComment';
  static const toggleCommentLike = '$_url/toggleCommentLike';

  //Follow UnFollow
  static const toggleFollow = '${_url}/sendFollowRequest';

  //Giveaway
  static const giveaway = '$_url/contests';
  static const CreateGiveaway = '$_url/createContest';
  static const getAdsEntryCountByUserId = '$_url/ads-histories/count';
  static const getReferralsEntryCountByUserId = '$_url/referrals/count';
  static const getTotalEntryCountByUserId = '$_url/totalEntries';
  static const getBuddyPairByUserId = '$_url/getBuddy';
  static const imageUpload = '$_url/upload';
  static const winners = '$_url/winners';
  
  



}
