import 'package:json_annotation/json_annotation.dart';

part 'add_transaction_response.g.dart';

@JsonSerializable()
class AddTransactionResponse {
  bool status;
  String? message;
  String? data;

  AddTransactionResponse({
    required this.status,
    this.message,
    this.data,
  });

  factory AddTransactionResponse.fromJson(Map<String, dynamic> json) =>
      _$AddTransactionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AddTransactionResponseToJson(this);
}
