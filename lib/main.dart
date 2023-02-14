import 'package:add_transaction/add_transaction.dart';
import 'package:category/category.dart';
import 'package:feature/feature.dart';
import 'package:business/business.dart';
import 'package:home/home.dart';

import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  //Init DI
  MainModule();
  //Init Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // This will let us observe any change that is happening in the Bloc
  Bloc.observer = AppBlocObserver();
  //Launch app
  runApp(const BudgetApp());
}

class BudgetApp extends StatelessWidget {
  const BudgetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AuthenticationBloc()..add(AuthenticationStarted()),
        ),
        BlocProvider<DatePickerCubit>(
          create: (context) => DatePickerCubit(),
        ),
        BlocProvider<HomePageNavCubit>(
          create: (context) => HomePageNavCubit(),
        ),
        BlocProvider<AddTransactionBloc>(
          create: (context) => AddTransactionBloc(),
        ),
        BlocProvider<BottomSheetCubit>(
          create: (context) => BottomSheetCubit(),
        ),
        BlocProvider<CategoriesListBloc>(
          create: (context) => CategoriesListBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        initialRoute: "/",
        routes: {
          "/": (context) => const HomePageView(),
          "/addTransaction": (context) => const AddTransactionView(),
          "/addTransOrSettings/categories_list": (context) =>
              const CategoriesListView()
        },
      ),
    );
  }
}
