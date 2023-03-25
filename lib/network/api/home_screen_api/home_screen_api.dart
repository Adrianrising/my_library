
import 'package:dio/dio.dart';
import 'package:my_library/constants/api_constants.dart';
import 'package:my_library/network/response/overview_response/overview_response.dart';
import 'package:retrofit/http.dart';

part 'home_screen_api.g.dart';
@RestApi(baseUrl: kHomeScreenBaseUrl)
abstract class HomeScreenApi{
  factory HomeScreenApi(Dio dio)=_HomeScreenApi;

  @GET(kHomeScreeenEndPoint)
  Future<OverviewResponse> getOverviewBooks(
      @Query(kPublishedDateText) String publishedDate,
      @Query(kApiKeyText) String apiKey
      );
}