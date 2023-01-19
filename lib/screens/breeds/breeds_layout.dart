import 'package:arch_sample/screens/breeds/bloc/breeds_bloc.dart';
import 'package:arch_sample/widgets/dogs_breed_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class BreedsLayout extends StatefulWidget {
  const BreedsLayout({Key? key}) : super(key: key);

  @override
  State<BreedsLayout> createState() => _BreedsLayoutState();
}

class _BreedsLayoutState extends State<BreedsLayout> {
  @override
  void initState() {
    super.initState();
    context.read<BreedsBloc>().add(LoadedContentEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Breed list"),
      ),
      body: Center(
        child: BlocBuilder<BreedsBloc, BreedsState>(
          builder: (context, state) {
            if (state is InitialState) {
              return const Center(child: Text('expectation'));
            } else if (state is LoadingHome) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is LoadedHome) {
              return DogBreedListWidget(breeds: state.fetchedDogs);
            } else {
              throw Exception('unprocessed state $state in LayoutContent');
            }
          },
        ),
      ),
    );
  }
}
