import 'package:bloc/bloc.dart';
import 'package:bloc_deno_client/src/data/provider/client_api.dart';
import 'package:bloc_deno_client/src/data/repository/client_repository.dart';
import 'package:flutter/material.dart'; 
import 'src/app.dart';
import 'package:http/http.dart' as http;
import 'src/blocs/simple_bloc_delegate.dart'; 

void main () { 
    final ClientRepository clientRepository = ClientRepository(
    denoApiClient: DenoApiClient(
      httpClient: http.Client(),
    ),
  );
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp (App(clientRepository: clientRepository)); 
}