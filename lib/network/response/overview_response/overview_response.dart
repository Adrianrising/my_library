import 'package:json_annotation/json_annotation.dart';
import 'package:my_library/network/response/overview_response/results/results.dart';
part 'overview_response.g.dart';
@JsonSerializable()
class OverviewResponse{
  @JsonKey(name: 'status')
  String ? status;

  @JsonKey(name: 'copyright')
  String ? copyright;

  @JsonKey(name: 'num_results')
  int ? numResults;

  @JsonKey(name: 'results')
  Results ? results;


  OverviewResponse(
      this.status, this.copyright, this.numResults, this.results);

  factory OverviewResponse.fromJson(Map<String,dynamic>json)=>_$OverviewResponseFromJson(json);
  Map<String,dynamic>toJson()=>_$OverviewResponseToJson(this);
}
