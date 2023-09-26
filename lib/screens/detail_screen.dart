// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:flutter_generics_sample/entities/pet.dart';
import 'package:flutter_generics_sample/entities/user.dart';
import 'package:flutter_generics_sample/repositories/pet_repository.dart';
import 'package:flutter_generics_sample/repositories/user_repository.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final UserRepository userRepository = UserRepository();
  final PetRepository petRepository = PetRepository();
  User? user;
  Pet? pet;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generic Demo Detail'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: user == null
                ? Center(
                    child: ElevatedButton(
                      onPressed: _loadUser,
                      child: const Text('Load User'),
                    ),
                  )
                : UserTile(user: user!),
          ),
          Expanded(
            flex: 1,
            child: pet == null
                ? Center(
                    child: ElevatedButton(
                      onPressed: _loadPet,
                      child: const Text('Load Pet'),
                    ),
                  )
                : PetTile(pet: pet!),
          ),
        ],
      ),
    );
  }

  void _loadUser() async {
    final loadedUser = await userRepository.find(1);
    setState(() {
      user = loadedUser;
    });
  }

  void _loadPet() async {
    final loadedPet = await petRepository.find(1);
    setState(() {
      pet = loadedPet;
    });
  }
}

class UserTile extends StatelessWidget {
  const UserTile({Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('${user.givenName} ${user.familyName}'),
      subtitle: Text('ID: ${user.id}'),
    );
  }
}

class PetTile extends StatelessWidget {
  const PetTile({Key? key, required this.pet}) : super(key: key);
  final Pet pet;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(pet.name),
      subtitle: Text('ID: ${pet.id}/ Age: ${pet.age}'),
    );
  }
}
