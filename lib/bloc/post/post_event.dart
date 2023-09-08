part of 'post_bloc.dart';

@immutable
abstract class PostEvent {}
class CreatePostEvent extends PostEvent {
  final Post post;
  final Uint8List? postImage;
  CreatePostEvent({required this.post,required this.postImage});
}

class DeletedPostEvent extends PostEvent {
  final String postID;
  final bool haveImage;
  DeletedPostEvent({required this.postID,required this.haveImage});
}

class SolutionPostEvent extends PostEvent {
  final Solution solution;
  SolutionPostEvent({required this.solution});
}
