import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tapme/features/counter/cubit/counter_cubit.dart';
import 'package:tapme/features/counter/view/details_screen.dart';
import 'package:tapme/features/language_logic/data/models/language.dart';
import 'package:tapme/features/language_logic/presentation/bloc/local_language_bloc.dart';
import 'package:tapme/l10n/l10n.dart';


class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const CounterView(),
    );
  }
}

class CounterView extends StatelessWidget {
  const CounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.balance)),
      body: Column(
        children: [
          const Center(child: CounterText()),

          const SizedBox(height: 20,),
          Text(
            '1',
            style: Theme.of(context).textTheme.headline2,
          ),
          const SizedBox(height: 20,),
          Text(
            '3',
            style: Theme.of(context).textTheme.headline2,
          ),
          Expanded(
            child: OpenContainer(
              closedElevation: 0,
              openElevation: 0,
              transitionDuration: const Duration(milliseconds: 1000),
              closedBuilder: (context, action) => Image.asset('assets/images/photo.jpeg', fit: BoxFit.fill),
              openBuilder: (context, action) => const DetailsScreen(),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(),
          ),

        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<LocalLanguageBloc>(context).add(
                  ToggleLanguageEvent(Languages.languages[2]));
              context.read<CounterCubit>().increment();
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<LocalLanguageBloc>(context).add(
                  ToggleLanguageEvent(Languages.languages[1]));
              context.read<CounterCubit>().decrement();
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }

  Column buildMovieCard(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.green,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            'asdasd',
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(Icons.dangerous),
            const SizedBox(width: 20),
            Text(
              '10',
              style: Theme
                  .of(context)
                  .textTheme
                  .bodyText2,
            )
          ],
        )
      ],
    );
  }
}

class CounterText extends StatelessWidget {
  const CounterText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final count = context.select((CounterCubit cubit) => cubit.state);
    return Text('$count', style: theme.textTheme.headline1);
  }
}
