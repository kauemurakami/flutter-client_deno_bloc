import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_deno_client/src/blocs/blocs.dart';
import 'package:bloc_deno_client/src/data/models/client_model.dart';
import 'package:bloc_deno_client/src/data/repository/client_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'client_event.dart';
part 'client_state.dart';

class ClientBloc extends Bloc<ClientEvent, ClientState> {
  final ClientRepository clientRepository;

  ClientBloc({@required this.clientRepository}) : assert(clientRepository != null);

  @override
  ClientState get initialState => ClientsEmpty();

  @override
  Stream<ClientState> mapEventToState(ClientEvent event,) async* {
    if(event is ClientsEmpty){
      yield ClientsLoading();
      try{
        final List<Client> clients = await clientRepository.getUsers();
        yield ClientsLoaded(clients);
      }catch(_){
        yield ClientsError();
      }
    }
    if(event is ClientsLoaded){
      final clients = await clientRepository.getUsers();
      yield clients.isEmpty ? clients : ClientsLoaded(clients);
    }
    if(event is AddClient){
      yield await clientRepository.addUser(event.client);
    }
  }
}
