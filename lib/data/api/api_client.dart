import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:simple_app/data/models/top_stories.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://api.nytimes.com/svc/topstories/v2/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("/{section}.json")
  Future<TopStories> getTopStories(
      @Path("section") String section, @Query("api-key") String apiKey);
}
