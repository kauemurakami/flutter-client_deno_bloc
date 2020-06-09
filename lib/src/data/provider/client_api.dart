import 'dart:convert';
import 'package:bloc_deno_client/src/data/models/client_model.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

const baseUrl = "http://192.168.1.5:3333/clients/";

class DenoApiClient {
  final http.Client httpClient;

  DenoApiClient({@required this.httpClient});

  getUsers() async {
    try {
      var response = await httpClient.get(baseUrl);
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        List<Client> clients = jsonResponse['clients'].map<Client>((map) {
          return Client.fromJson(map);
        }).toList();
        return clients;
      } else
        print('erro ao recuperar usuários');
    } finally { }
  }

  getUser(id) async {
    try {
      var response = await httpClient.get('$baseUrl/$id');
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        Client client = jsonResponse['client'].map<Client>((map) {
          return Client.fromJson(map);
        }).toList();
        return client;
      } else
        print('erro ao recuperar usuário');
    } finally { disposeClient();}
  }

  addUser(client) async {
    print(client);
    try {
      var response = await httpClient.post(baseUrl, headers: {"Content-Type":"application/json"}, body: jsonEncode(client));
      if (response.statusCode == 200) {
        return client;
      } else
        print('erro ao adicionar usuário');
    } finally { }
  }

  deleteUser(id) async {
    try {
      var response = await httpClient.delete('$baseUrl$id');
      if (response.statusCode == 200) {
        return "Usuário excluido";
      } else {
        return "erro ao excluir usuário";
      }
    } finally { disposeClient();}
  }

  editUser(client) async{
    try {
      var id = client.id;
      var response = await httpClient.put('$baseUrl$id', headers: {"Content-Type":"application/json"}, body: jsonEncode(client));
      print('$baseUrl$id');
      print(response.statusCode);
      if (response.statusCode == 200) {
        return "usuario alterado";
      } else {
        return "erro ao alterar usuário";
      }
    } finally { }
  }

  disposeClient() {
    this.httpClient.close();
  }
}