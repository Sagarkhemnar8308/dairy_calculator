import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sagf_state.dart';

class SagfCubit extends Cubit<SagfState> {
  SagfCubit() : super(SagfInitial());
}
