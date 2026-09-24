abstract class NewsState {}
class LoadingNews extends NewsState{
  bool isLoading=true;
}
class ArticaleState extends NewsState{

}
class ErrorState extends NewsState{

}