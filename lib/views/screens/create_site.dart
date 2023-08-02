import 'package:flutter/material.dart';

class CreateSite extends StatefulWidget {
  const CreateSite({Key? key}) : super(key: key);

  @override
  State<CreateSite> createState() => _CreateSiteState();
}

class _CreateSiteState extends State<CreateSite> {
  String? name;
  GlobalKey<FormState> nameKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Create Site",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.close,
                color: Colors.black,
              ))
        ],
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: nameKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Site Name",
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                onSaved: (val) {
                  name = val!;
                },
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Site name must not be empty..";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Eg: Residential , Commercial"),
              ),
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "0/50",
                ),
              ),
              const Text(
                "Organisation",
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: "My Organisation"),
              ),
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "0/50",
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  if (nameKey.currentState!.validate()) {
                    nameKey.currentState!.save();

                    Navigator.of(context)
                        .pushNamed('page_view', arguments: name);
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff283c86),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 120, vertical: 15)),
                child: const Text("Create Site"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
