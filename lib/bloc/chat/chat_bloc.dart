import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mediagram/model/user.dart';
import 'package:mediagram/service/Firebase/auth.dart';
import 'package:mediagram/service/Firebase/curd_user_database.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent,ChatState>{
  ChatBloc() : super(ChatInitial()){
    on<ChatEvent>((event, emit) async {
      if(event is ChatStatusEvent){
        emit(CreateCoupleLoadingState());
        bool value = event.user.chat.any((element)=>
          element.couple == FirebaseAuthenticationService.user.uid);
        if(value) {
          for(var item in event.user.chat){
            if(item.couple == FirebaseAuthenticationService.user.uid){
              emit(
                CreateCoupleState(
                  chatID: item.chatid,
                ),
              );
            }
          }
        }else{
          String id = await FirebaseDatabaseCollection.createChatForUser(
            event.user.uid,
          );
          emit(
            CreateCoupleState(
              chatID: id,
            )
          );
        }
      }
    });
  }
}