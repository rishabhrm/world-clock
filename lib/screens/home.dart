import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late Map place = {};

  @override
  Widget build(BuildContext context) {

    place = place.isNotEmpty ? place : ModalRoute.of(context)?.settings.arguments as Map;

    String bgImage = place['isDayTime'] ? 'day.jpg' : 'night.png';

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/$bgImage'),
            fit: BoxFit.cover
          )
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 100,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      place['location'],
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                        color: place['isDayTime'] ? Colors.black : Colors.white
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                    place['time'],
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: place['isDayTime'] ? Colors.black : Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 150,),
                TextButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/choose');
                    setState(() {
                      place = result;
                    });
                  },
                  icon: const Icon(Icons.edit_location),
                  label: const Text('Choose Location'),
                  style: TextButton.styleFrom(
                      primary: place['isDayTime'] ? Colors.black : Colors.white,
                      backgroundColor: Colors.white12
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
