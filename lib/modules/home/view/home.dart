import 'package:alphonso_assignment/modules/controllers/home_controller.dart';
import 'package:alphonso_assignment/modules/data/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final HomeController _homeController;

  @override
  void initState() {
    _homeController = HomeController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Alphanso Assignment',
        ),
      ),
      body: BlocBuilder<HomeController, HomeState>(
          bloc: _homeController,
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: state.isLoading
                            ? null
                            : _homeController.inputCsvFile,
                        child: state.isLoading
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                            : const Text('Input .csv file',
                                style: TextStyle(fontSize: 20))),
                  ],
                ),
                if (state.outputCsv.isNotEmpty) ...[
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: _homeController.exportCsv,
                      child: const Text('Open CSV',
                          style: TextStyle(fontSize: 20))),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text('Output csv string:',
                      style: TextStyle(fontSize: 20)),
                  const SizedBox(
                    height: 20,
                  ),
                  Flexible(
                      child: SingleChildScrollView(
                    child: Text(state.outputCsv,
                        style: const TextStyle(
                          fontSize: 16,
                        )),
                  ))
                ],
              ],
            );
          }),
    );
  }
}
