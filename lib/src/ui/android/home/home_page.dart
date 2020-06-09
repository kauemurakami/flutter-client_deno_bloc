import 'package:bloc_deno_client/src/blocs/client_bloc/client_bloc.dart';
import 'package:bloc_deno_client/src/data/provider/client_api.dart';
import 'package:bloc_deno_client/src/data/repository/client_repository.dart';
import 'package:bloc_deno_client/src/ui/android/widgets/load_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  final ClientRepository clientRepository = ClientRepository(
      denoApiClient: DenoApiClient(
    httpClient: http.Client(),
  ));

  @override
  Widget build(BuildContext context) {
   BlocProvider.of<ClientBloc>(context).add(GetClients());
    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc"),
      ),
      body: Container(
          child: BlocBuilder<ClientBloc, ClientState>(
        builder: (context, state) {
          if(state is ClientsLoading){
            return LoadWidget();
          }
          if(state is ClientsLoaded){
            if(state.clients.isEmpty){
              return ErrorWidget('Nenhum Cliente');
            }
            return ListView.builder(
              itemBuilder: (context, index){
                return ListTile(
                  title: Text(state.clients[index].name),
                  subtitle: Text(state.clients[index].email),
                );
              },
              itemCount: state.clients.length,
              );
          }
          return Container();
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          BlocProvider.of(context).add(AddClient);
      }),
    );
  }
}
