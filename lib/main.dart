import 'package:budget_manager/business/di/main_module.dart';

import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

import 'feature/bloc/app_bloc_observer.dart';
import 'feature/bloc/auth/auth_bloc.dart';
import 'home_page/feature/bloc/navigation/navigation_cubit.dart';
import 'home_page/home_page.dart';
import 'add_transaction_page/feature/add_tansaction_page_view.dart';
import 'add_transaction_page/feature/bloc/bloc.dart';

void main() async {
  //Init DI
  MainModule();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // This will let us observe any change that is happening in the Bloc
  Bloc.observer = AppBlocObserver();
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
        },
      ),
    );
  }
}
