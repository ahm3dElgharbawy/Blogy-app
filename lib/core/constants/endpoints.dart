abstract class EndPoints {
  static const baseUrl = "http://192.168.64.10:8000/api";

  // Auth
  static const login = "$baseUrl/login";
  static const register = "$baseUrl/register";
  static const logout = "$baseUrl/logout";

  // Password Reset
  static const checkEmail = "$baseUrl/password/email";
  static const checkOtp = "$baseUrl/password/code/check";
  static const resetPassword = "$baseUrl/password/reset";

  // create article
  static const homeArticles = "$baseUrl/articles";
  static const createArticle = "$baseUrl/articles";
  static String updateArticle(int id) => "$baseUrl/articles/$id";
  static String deleteArticle(int id) => "$baseUrl/articles/$id";

  // categories
  static const categories = "$baseUrl/categories";

  // reactions
  static addReaction(int articleId) => "$baseUrl/articles/$articleId/reactions";
  static removeReaction(int reactionId) => "$baseUrl/reactions/$reactionId";

  // comments
  static getComments(int articleId) =>
      "$baseUrl/articles/$articleId/comments"; // get
  static addComment(int articleId) =>
      "$baseUrl/articles/$articleId/comments"; // post
  static updateComment(int commentId) => "$baseUrl/comments/$commentId"; // post
  static deleteComment(int commentId) =>
      "$baseUrl/comments/$commentId"; // delete
}
