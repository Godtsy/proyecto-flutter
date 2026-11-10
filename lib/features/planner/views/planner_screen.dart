import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mi_app_prueba/core/errors/failure.dart';
import 'package:mi_app_prueba/core/network/bloc/base_bloc.dart';
import 'package:mi_app_prueba/features/planner/bloc/planner_bloc.dart';
import 'package:mi_app_prueba/features/planner/models/group_model.dart';
import 'package:mi_app_prueba/shared/loader/loader.dart';

import '../widgets/appbar.dart';
import '../widgets/bottombar.dart';
import '../widgets/custom_selector.dart';
import 'mi_dia.dart';
import 'mis_planes.dart';
import 'mis_tareas.dart';

class PlannerScreen extends StatefulWidget {
  const PlannerScreen({super.key});

  @override
  State<PlannerScreen> createState() => _PlannerScreenState();
}

class _PlannerScreenState extends State<PlannerScreen> {
  int _currentSubViewIndex = 0;

  final List<Widget> _plannerSubViews = const [
    MiDiaView(),
    MisTareasView(),
    MisPlanesView(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocListener<PlannerBloc, BaseState>(
      listener: (context, state) {
        switch (state) {
          case GroupsObtained(:final List<GroupModel> groups):
            print('resultado groups: $groups');
            break;

          case PlannerError(:final String error):
            print('Error: $error');
            break;

          case NetworkException(:final Failure failure):
            print('${failure.message}');
            break;
        }
      },
      child: Stack(
        children: [
          Scaffold(
            appBar: const CustomAppBar(),

            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 12.0,
                  ),
                  child: CustomSelector(
                    selectedIndex: _currentSubViewIndex,
                    onTabSelected: (index) {
                      setState(() {
                        _currentSubViewIndex = index;
                      });
                    },
                  ),
                ),

                Expanded(child: _plannerSubViews[_currentSubViewIndex]),
              ],
            ),

            bottomNavigationBar: CustomBottomBar(onTap: _getMyGroups),
          ),

          BlocBuilder<PlannerBloc, BaseState>(
            builder: (context, state) {
              if (state is PlannerInProgres) {
                return Loader();
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }

  void _getMyGroups() {
    context.read<PlannerBloc>().add(MyGroupRequested());
  }
}
