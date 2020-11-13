import 'package:TamrielTrade/features/home/bloc/home_bloc.dart';
import 'package:TamrielTrade/views/input.dart';
import 'package:TamrielTrade/views/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:TamrielTrade/values/values.dart';

class HomeSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimensions.padding16),
      child: Column(
        children: [
          Row(children: [
            Expanded(
                child: Input(
              onChange: (value) => context.read<HomeBloc>().setSearch(value),
              hint: "Search",
            )),
            IconButton(
                icon: Icon(Icons.filter_list_rounded),
                onPressed: () => context.read<HomeBloc>().openFilter()),
          ]),
          Container(
            height: Dimensions.padding6,
          ),
          RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50.0))),
              color: Colors.black87,
              onPressed: () => context.read<HomeBloc>().restartSearch(),
              child: Text("Search", style: TextStyle(color: Colors.white))),
          Container(
            height: Dimensions.padding6,
          ),
          AnimatedOpacity(
            opacity: context.watch<HomeBloc>().isWaiting ? 1 : 0,
            duration: Duration(milliseconds: 100),
            child: ProgressBar(),
          )
        ],
      ),
    );
  }
}
