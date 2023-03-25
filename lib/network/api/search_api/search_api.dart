import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../../constants/api_constants.dart';
import '../../response/search_response/search_response.dart';
part 'search_api.g.dart';
@RestApi(baseUrl: kSearchBaseUrl)
abstract class SearchApi{
  factory SearchApi(Dio dio)=_SearchApi;

  @GET(kSearchEndPoint)
  Future<SearchResponse> getSearchBooks(
      @Query(kQ) String q
      );
}