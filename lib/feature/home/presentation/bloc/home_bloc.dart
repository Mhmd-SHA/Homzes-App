import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:homzes_app/feature/home/domain/usecases/home_fetch_property.dart';

import '../../domain/entities/property.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeFetchProperties homeFetchProperties;

  HomeBloc({required this.homeFetchProperties}) : super(HomeInitial()) {
    on<FetchPropertiesEvent>((event, emit) async {
      emit(HomeLoading());
      print(
          "==============================called==============================");
      try {
        final properties = await homeFetchProperties();
        emit(HomeLoaded(properties));
      } catch (e) {
        emit(HomeError('Failed to load properties: $e'));
      }
    });
  }
}
