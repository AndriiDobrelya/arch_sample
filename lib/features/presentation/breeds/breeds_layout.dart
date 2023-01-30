import 'package:arch_sample/features/presentation/breeds/bloc/breeds_bloc.dart';
import 'package:arch_sample/widgets/organizm/dogs_breed_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BreedsLayout extends StatefulWidget {
  const BreedsLayout({super.key});

  @override
  State<BreedsLayout> createState() => _BreedsLayoutState();
}

class _BreedsLayoutState extends State<BreedsLayout> {
  @override
  void initState() {
    super.initState();
    context.read<BreedsBloc>().add(const BreedsEvent.loaded());
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
            return state.when(
              initial: () => const Center(
                child: Text('expectation'),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              loaded: (breeds) => DogBreedListWidget(breeds: breeds),
              error: (error) => Center(
                child: Text('$error'),
              ),
            );
          },
        ),
      ),
    );
  }
}
