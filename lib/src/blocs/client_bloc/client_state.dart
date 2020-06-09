part of 'client_bloc.dart';

abstract class ClientState extends Equatable {
  const ClientState();
}

class ClientsEmpty extends ClientState {
  @override
  List<Object> get props => [];
}

class ClientsLoading extends ClientState {
  @override
  List<Object> get props => [];
}

class ClientsLoaded extends ClientState {
  final List<Client> clients;

  ClientsLoaded(this.clients) : assert(clients != null);

  @override
  List<Object> get props => [clients];
}

class ClientsError extends ClientState {
  @override
  List<Object> get props => [];
}

