import 'package:meta/meta.dart';

import '../provider/client_api.dart';

class ClientRepository {
  final DenoApiClient denoApiClient;

  ClientRepository({@required this.denoApiClient})
      : assert(denoApiClient != null);

  getUsers() {
    return denoApiClient.getUsers();
  }

  getUser(id) {
    return denoApiClient.getUser(id);
  }

  deleteUser(id) {
    return denoApiClient.deleteUser(id);
  }

  editUser(client) {
    return denoApiClient.editUser(client);
  }

  addUser(client) {
    return denoApiClient.addUser(client);
  }
}
