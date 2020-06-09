import 'package:bloc_deno_client/src/ui/android/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/blocs.dart';
import 'data/repository/client_repository.dart';

class App extends StatelessWidget {
  final ClientRepository clientRepository;

  const App({Key key, this.clientRepository}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      initialRoute: '/',
      home: BlocProvider(create: (_) => ClientBloc(clientRepository: clientRepository), child: HomePage(),),
    );
  }
}
