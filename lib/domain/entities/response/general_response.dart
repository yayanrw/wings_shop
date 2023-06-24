import 'package:equatable/equatable.dart';

class GeneralResponse extends Equatable {
  final bool status;
  final String message;

  const GeneralResponse({
    required this.status,
    required this.message,
  });

  @override
  List<Object?> get props => [status, message];
}