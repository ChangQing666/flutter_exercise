import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_provider/models/city_model.dart';

class CityPage extends StatefulWidget {
  const CityPage({super.key});

  @override
  State<CityPage> createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('城市'),
      ),
      body: Column(
        children: [
          const Center(
            child: Text('城市'),
          ),
          ElevatedButton(
            onPressed: () {
              getCity();
            },
            child: const Text('获取城市'),
          ),
          FutureBuilder(
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return const Text('Error');
                  } else {
                    return Text(snapshot.data.zpData!.hotCityList[1].name!);
                  }
                } else {
                  return const CircularProgressIndicator();
                }
              },
              future: getCity()),
        ],
      ),
    );
  }
}

getCity() async {
  debugPrint('获取城市');
  final dio = Dio();
  Response response =
      await dio.get('https://www.zhipin.com/wapi/zpCommon/data/city.json');

  CityModel cityData = CityModel.fromJson(response.data);
  debugPrint(cityData.zpData!.hotCityList[0].name!);
  return cityData;
}
