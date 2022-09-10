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
                child: Column(
                  children: [
                    Selector<Model, String>(
                      selector: (context, provider) => provider.name,
                      builder: (context, value, child) {
                        return Text(value);
                      },
                    ),
                    Selector<Model, String>(
                      selector: (context, provider) => provider.name2,
                      builder: (context, value, child) {
                        return Text(value);
                      },
                    ),
                    const SizedBox(height: 20),
                    Consumer<Model>(
                      builder: (context, provider, child) {
                        return MaterialButton(
                            color: Colors.blue,
                            child: const Text('Change'),
                            onPressed: () {
                              provider.changeName();
                            });
                      },
                    ),
                    Consumer<Model>(
                      builder: (context, provider, child) {
                        return MaterialButton(
                            color: Colors.blue,
                            child: const Text('Change Two'),
                            onPressed: () {
                              provider.changeNameTow();
                            });
                      },
                    ),
                  ],
                )),
          )),
    );
  }
}

class Model with ChangeNotifier {
  String name = 'Ahmed';
  String name2 = 'Mohammed';

  get nameONe => name;

  get nameTwo => name2;

  void changeName() {
    name = 'state changed';
    print('build Name one');
    notifyListeners();
  }

  void changeNameTow() {
    name2 = 'state changed two';
    print('build Name tow');
    notifyListeners();
  }
}
