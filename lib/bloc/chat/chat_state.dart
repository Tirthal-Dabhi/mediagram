part of 'chat_bloc.dart';

@immutable
abstract class ChatState {}
class ChatInitial extends ChatState {}
class ChatMessageState extends ChatState {}
class CreateCoupleLoadingState extends ChatState {}
class CreateCoupleState extends ChatState {
  final String chatID;
    CreateCoupleState({required this.chatID});
}

