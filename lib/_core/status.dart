import 'package:equatable/equatable.dart';

abstract class Status extends Equatable {
  final String? message;
  final String? messageId;

  const Status({this.messageId, this.message}) : super();

  @override
  List<Object?> get props => [messageId, message];

  @override
  String toString() {
    return 'Status{message: $message, messageId: $messageId}';
  }
}

class ProgressStatus extends Status {
  final double progress;

  int get percentageProgress => (progress * 100).toInt();

  const ProgressStatus(this.progress, {messageId, message})
      : super(message: message, messageId: messageId);

  @override
  String toString() {
    return 'ProgressStatus{progress: $progress}';
  }

  @override
  List<Object?> get props => super.props..add(progress);
}

class Success extends Status {
  const Success({messageId, message})
      : super(message: message, messageId: messageId);
}

class Failure extends Status {
  String get id => uID ?? messageId ?? "";

  final String? uID;

  const Failure({messageId, message, this.uID})
      : super(message: message, messageId: messageId);

  Failure.fromException(Exception e)
      : this(messageId: null, message: e.toString());
}
