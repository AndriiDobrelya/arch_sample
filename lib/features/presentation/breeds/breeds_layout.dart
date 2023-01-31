import 'package:arch_sample/configs/app_router.dart';
import 'package:arch_sample/features/presentation/breeds/bloc/breeds_bloc.dart';
import 'package:arch_sample/widgets/organizm/dogs_breed_list.dart';
import 'package:auto_route/auto_route.dart';
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
        child: BlocConsumer<BreedsBloc, BreedsState>(
          listener: (BuildContext context, state) {
            state.mapOrNull(
              showInfo: (breedInfo) => context.router.push(BreedInfoRoute(breedInfo: breedInfo.breedInfo)),
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
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
              orElse: () => const Center(
                child: Text('text'),
              ),
            );
          },
        ),
      ),
    );
  }
}
