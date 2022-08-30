import 'package:flutter/material.dart';
import 'package:mvvm_pattren/data/response/status.dart';
import 'package:mvvm_pattren/model/home_model.dart';
import 'package:mvvm_pattren/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel homeViewModel = HomeViewModel();

  @override
  void initState() {
    // TODO: implement initState
    homeViewModel.fetchMovieData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          // automaticallyImplyLeading: false,
          actions: const [
            Center(child: Text("Logout")),
            SizedBox(
              width: 20,
            )
          ],
        ),
        body: ChangeNotifierProvider<HomeViewModel>(
          create: (BuildContext context) => homeViewModel,
          child: Consumer<HomeViewModel>(
            builder: (context, value, _) {
              switch (value.moveilist.status) {
                case Status.LAODING:
                  return const CircularProgressIndicator();
                case Status.ERROR:
                  return Text(value.moveilist.message.toString());
                case Status.COMPLETED:
                  return Expanded(
                    child: ListView.builder(
                        itemCount: value.moveilist.data!.entries.length,
                        itemBuilder: (ctx, index){
                      return Card(
                        child: Text(value.moveilist.data!.count.toString()),
                      );
                    }),
                  );
              }
              return const Text("data match");
            },
          ),
        ),
      ),
    );
  }
}
