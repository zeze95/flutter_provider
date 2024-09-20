import 'package:flutter/material.dart';
import 'package:providertest/screen/future_provider_screen.dart';
import 'package:providertest/screen/select_provider_screen.dart';
import 'package:providertest/screen/state_notifier_provider.dart';
import 'package:providertest/screen/state_provider_screen.dart';
import 'package:providertest/screen/stream_provider_screen.dart';

import '../layout/riverpod_defalut_layout.dart';
import 'auto_dispose_modifier_screen.dart';
import 'family_modifier_screen.dart';
import 'listen_provider_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RiverpodDefalutLayout(
        title: 'home Screen',
        body: ListView(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => StateProviderScreen()));
                },
                child: Text('StateProvierScreen')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => StateNotifierProvider()));
                },
                child: Text('StateNotifierProvider')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => FutureProviderScreen()));
                },
                child: Text('FutureProviderScreen')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => StreamProviderScreen()));
                },
                child: Text('StreamProviderScreen')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => FamilyModifierScreen()));
                },
                child: Text('FamilyModifierProvider')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => AutoDisposeModifierScreen()));
                },
                child: Text('AutoDisposeModifierScreen')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => ListenProviderScreen()));
                },
                child: Text('ListenProviderScreen')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => SelectProviderScreen()));
                },
                child: Text('SelectProviderScreen')),
          ],
        ));
  }
}
