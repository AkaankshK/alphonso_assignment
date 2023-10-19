import 'dart:io';

import 'package:alphonso_assignment/modules/data/home_state.dart';
import 'package:alphonso_assignment/shared/globals.dart';
import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class HomeController extends Cubit<HomeState> {
  HomeController() : super(HomeState());

  void inputCsvFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['csv'],
    );
    if (result?.files != null) {
      emit(state.copyWith(
        isLoading: true,
      ));
      final input = File(result?.files.first.path ?? '').readAsStringSync();
      final fields = const CsvToListConverter().convert(input);
      Map<String, dynamic> outputMap = {};
      for (List<dynamic> data in fields) {
        if (outputMap.containsKey(data[0])) {
          int count = outputMap[data[0]][2];
          count++;
          outputMap[data[0]] = [
            data[0],
            (outputMap[data[0]][1] + data[1]),
            count,
          ];
        } else {
          outputMap[data[0]] = [data[0], data[1] ?? 0, 1];
        }
      }
      final outputList = outputMap.values.toList();
      outputList.sort((a, b) => b[2].compareTo(a[2]));
      final outputCsv =
          const ListToCsvConverter().convert(outputList.cast<List?>());
      emit(state.copyWith(
        isLoading: false,
        outputCsv: outputCsv,
      ));
    }
  }

  void exportCsv() async {
    final path = (await getExternalStorageDirectory())?.path ?? "";
    final filePath = '$path/${DateTime.now().millisecondsSinceEpoch}.csv';
    final file = File(filePath);
    file.writeAsStringSync(state.outputCsv);
    final res = await OpenFile.open(filePath);
    if (res.type != ResultType.done) {
      snackbarKey.currentState
          ?.showSnackBar(SnackBar(content: Text(res.message)));
    }
  }
}
