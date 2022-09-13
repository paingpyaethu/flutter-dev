import 'package:api/models/message.dart';
import 'package:api/models/post.dart';
import 'package:api/models/user.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'api_client.g.dart';

@RestApi(baseUrl: "http://192.168.1.2:8000/api/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @POST("create-user")
  Future<Message> register(@Body() User user);

  @POST("login")
  Future<Message> login(@Body() User user);

  @GET("posts")
  Stream<List<Post>> getAllPosts(@Header('Authorization') String authApi);

  @POST("create-post")
  Future<Message> createPost(
      @Header('Authorization') String authApi, @Body() Post post);

  @GET("post/{id}")
  Future<Post> getPostById(
      @Header('Authorization') String authApi, @Path() int id);

  @PUT("posts/edit/{id}")
  Future<Message> updatePostById(
    @Header('Authorization') String authApi,
    @Body() Post post,
    @Path() int id,
  );

  @DELETE("posts/delete/{id}")
  Future<Message> deletePostById(
      @Header('Authorization') String authApi, @Path() int id);
}
