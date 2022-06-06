import 'package:agents_of_valorant/data/model/agent_model.dart';
import 'package:agents_of_valorant/repositories/agent_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.agentRepository) : super(HomeInitial()) {
    getApiResult();
  }
  final AgentRepository agentRepository;

  Future<void> getApiResult() async {
    final apiResult = await agentRepository.getAllAgents();
    if (apiResult == null) {
      emit(HomeError());
    } else {
      emit(HomeLoaded(apiResult));
    }
  }
}
