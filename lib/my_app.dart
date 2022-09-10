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
        body: const WidgetTest(),
      ),
    );
  }
}

class WidgetTest extends StatelessWidget {
  const WidgetTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Model provider = Provider.of<Model>(context,listen: true);
    return Center(
      child: Column(
        children: [
          //listen = false     listen ? rebuild ui ? = true : false
          //Text(context.read<Model>().name),
          //lister = true
          Text(context.watch()<Model>().name),
          const SizedBox(height: 20),
          MaterialButton(
              color: Colors.blue,
              child: const Text('Change'),
              onPressed: () {
                //listen = false
                //context.read<Model>().changeName();
                //listen = true
                context.watch()<Model>().changeName();
              }),
        ],
      ),
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
}
