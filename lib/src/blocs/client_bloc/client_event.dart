part of 'client_bloc.dart';

abstract class ClientEvent extends Equatable {
  const ClientEvent();
}

class GetClients extends ClientEvent {

  @override
  List<Object> get props => [];
}

class AddClient extends ClientEvent{
  final Client client;

  AddClient(this.client) : assert(client != null);

  @override
  List<Object> get props => [client];
}

class DeleteClient extends ClientEvent {
  final String id;

  DeleteClient(this.id) : assert(id != null);

  @override
  List<Object> get props => [id];
}

class UpdateClient extends ClientEvent {
  final Client client;

  UpdateClient(this.client) : assert(client != null);

  @override
  List<Object> get props => [client];
}

