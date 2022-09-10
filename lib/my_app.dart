import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => Model(),
      child: Scaffold(
          appBar: AppBar(),
          body: Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Consumer<Model>(
                builder: (context, provider, child) {
                  return Column(
                    children: [
                      Text(provider.name),
                      const SizedBox(height: 20),
                      MaterialButton(
                          color: Colors.blue,
                          child: const Text('Change'),
                          onPressed: () {
                            provider.changeName();
                            print(provider.name);
                          })
                    ],
                  );
                },
              ),
            ),
          )),
    );
  }
}

class Model with ChangeNotifier {
  String name = 'Ahmed';

  void changeName() {
    name = 'Mohammed';
    notifyListeners();
  }
}
