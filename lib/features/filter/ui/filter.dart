import 'package:TamrielTrade/features/filter/bloc/filter_bloc.dart';
import 'package:TamrielTrade/features/filter/ui/filter_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Filter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FilterBloc(context),
      child: FilterBody(),
    );
  }
}
