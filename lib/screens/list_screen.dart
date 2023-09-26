// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:flutter_generics_sample/entities/pet.dart';
import 'package:flutter_generics_sample/entities/user.dart';
import 'package:flutter_generics_sample/repositories/pet_repository.dart';
import 'package:flutter_generics_sample/repositories/user_repository.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final UserRepository userRepository = UserRepository();
  final PetRepository petRepository = PetRepository();
  List<User> users = [];
  List<Pet> pets = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generic Demo'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: users.isEmpty
                ? Center(
                    child: ElevatedButton(
                      onPressed: _loadUsers,
                      child: const Text('Load Users'),
                    ),
                  )
                : ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      return UserTile(user: users[index]);
                    },
                  ),
          ),
          Expanded(
            flex: 1,
            child: pets.isEmpty
                ? Center(
                    child: ElevatedButton(
                      onPressed: _loadPets,
                      child: const Text('Load pets'),
                    ),
                  )
                : ListView.builder(
                    itemCount: pets.length,
                    itemBuilder: (context, index) {
                      return PetTile(pet: pets[index]);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  void _loadUsers() async {
    final loadedUsers = await userRepository.all();
    setState(() {
      users = loadedUsers;
    });
  }

  void _loadPets() async {
    final loadedPets = await petRepository.all();
    setState(() {
      pets = loadedPets;
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
