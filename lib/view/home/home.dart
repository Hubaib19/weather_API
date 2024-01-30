// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapi/controller/weather_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Consumer<WeatherProvider>(
          builder: (context, value, child) {
            return Container(
              padding: const EdgeInsets.only(
                top: 65,
                left: 30,
                right: 20,
              ),
              height: size.height,
              width: size.width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("asset/download.jpeg"),
              )),
              child: Stack(
                children: [
                  Positioned(
                    top: 50,
                    left: 20,
                    right: 20,
                    child: SizedBox(
                      height: 45,
                      child: TextFormField(
                        onFieldSubmitted: (String place) {
                          value.getData(place);
                        },
                        controller: value.searchController,
                        cursorColor: Colors.black,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.only(top: 18, left: 10),
                          isDense: true,
                          hintText: "Search",
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(7),
                            ),
                          ),
                          prefixIcon: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(
                              Icons.location_searching_sharp,
                              size: 26,
                            ),
                          ),
                          suffixIcon: value.searchController.text.isNotEmpty
                              ? IconButton(
                                  onPressed: () {
                                    value.searchController.clear();
                                  },
                                  icon: const Icon(
                                    Icons.cancel,
                                    color: Colors.grey,
                                  ),
                                )
                              : null,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.location_pin,
                              color: Colors.red,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (value.data != null)
                                  Text(
                                    '${value.data!.cityName}',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18),
                                  ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: const Alignment(0, -0.6),
                    child: SizedBox(
                      height: 300,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              height: 100,
                              width: 100,
                              child: Image.asset(
                                'asset/Sun.png',
                                height: 180,
                              )),
                          if (value.data != null)
                            Text(
                              '${value.data!.temp}°C',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 32),
                            ),
                          Text(
                            DateTime.now().toString(),
                            style: const TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: const Alignment(0.0, 0.75),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20)),
                      height: 180,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              climate(value,
                                  text: 'Temp Min',
                                  image: 'asset/Cold (2).png',
                                  text2: '${value.data!.temp_min}'),
                              const SizedBox(
                                width: 10,
                              ),
                              climate(value,
                                  text: 'Temp Max',
                                  image: 'asset/Heat.png',
                                  text2: '${value.data!.temp_max}'),
                            ],
                          ),
                          const Divider(
                            color: Colors.white,
                            endIndent: 20,
                            thickness: 2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              climate(value,
                                  text: 'Humidity',
                                  image: 'asset/sunny.png',
                                  text2: '${value.data!.humidity}'),
                              const SizedBox(
                                width: 10,
                              ),
                              climate(value,
                                  text: 'Wind',
                                  image: 'asset/images-removebg-preview.png',
                                  text2: '${value.data!.wind}'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Container climate(WeatherProvider value,
      {required String text, required String text2, required String image}) {
    return Container(
        child: Row(
      children: [
        Image.asset(
          image,
          height: 70,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            if (value.data != null)
              Text(
                text2,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
          ],
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    ));
  }
}
