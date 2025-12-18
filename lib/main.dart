import 'dart:ffi';
import 'dart:io';
import 'package:flutter/material.dart';

typedef add_func = Int32 Function(Int32 a, Int32 b);
typedef Add = int Function(int a, int b);

void main() {
  final lib = Platform.isAndroid
      ? DynamicLibrary.open("/home/runner/work/my_flutter_app/my_flutter_app/android/app/src/main/jniLibs/armeabi-v7a/libhello-lib.so")
      : DynamicLibrary.process();

  final Add add = lib.lookupFunction<add_func, Add>("add");

  print("2 + 3 = ${add(2, 3)}");

  runApp(MaterialApp(
      home: Scaffold(
          body: Center(child: Text('Hello NDK + Flutter! 2+3=${add(2,3)}')))));
}
