class MyService {
  static final MyService _instance = MyService._internal();

  // passes the instantiation to the _instance object
  factory MyService() => _instance;
  late double _heightMultiplier;
  late double _widthMultiplier;

  //short getter for my variable
  double get heightMultiplier => _heightMultiplier;

  double get widthMultiplier => _widthMultiplier;

  //short setter for my variable
  set heightMultiplier(double value) => _heightMultiplier = value;

  set widthMultiplier(double value) => _widthMultiplier = value;

  MyService._internal() {
    _heightMultiplier = 0;
    _widthMultiplier = 0;
  }

// static MyService _internal() {
//   if(_instance == null){
//     _instance = new MyService();
//   }
// }

}
