import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class GetDataScreen extends StatefulWidget {
  const GetDataScreen({super.key});

  @override
  State<GetDataScreen> createState() => _GetDataScreenState();
}

class _GetDataScreenState extends State<GetDataScreen> {
  Dio dio = Dio();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: []),
        );
    }
}