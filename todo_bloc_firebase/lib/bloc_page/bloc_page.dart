import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc_firebase/bloc_page/bloc_event.dart';
import 'package:todo_bloc_firebase/bloc_page/bloc_state.dart';

class BlocPage extends Bloc<BlocEvent, BlocState> {
  BlocPage() : super(InitialState());

  @override
  Stream<BlocState> mapEventToState(BlocEvent event) async* {
    if (event is LoginEvent) {
      yield LoginState();
    } else if (event is RegisterEvent) {
      yield RegisterState();
    }
  }
}
