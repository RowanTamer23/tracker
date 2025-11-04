import 'package:flutter/material.dart';
import 'package:tracker/core/shared/shared_appbar.dart';
import 'package:tracker/features/bullet/view/widgets/bullet_card.dart';

class BulletScreen extends StatefulWidget {
  const BulletScreen({super.key});

  @override
  State<BulletScreen> createState() => _BulletScreenState();
}

class _BulletScreenState extends State<BulletScreen> {
  final List<bool> _visibleList = [
    false,
    false,
    false,
    false,
    false,
  ]; // One flag per card

  @override
  void initState() {
    super.initState();
    _animateCards();
  }

  void _animateCards() async {
    // Animate each card one after another with delay
    for (int i = 0; i < _visibleList.length; i++) {
      await Future.delayed(const Duration(milliseconds: 70));
      if (mounted) {
        setState(() {
          _visibleList[i] = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final cards = [
      BulletCard(
        title: 'Water',
        iconColor: const Color(0xff2196F3),
        icon: const Icon(Icons.water_drop),
        backgroundColor: const Color.fromARGB(255, 13, 63, 98),
      ),
      BulletCard(
        title: 'Save',
        icon: const Icon(Icons.money_off_sharp),
        iconColor: const Color.fromARGB(255, 229, 138, 1),
        backgroundColor: const Color.fromARGB(255, 150, 109, 28),
      ),
      BulletCard(
        title: 'Quit',
        icon: const Icon(Icons.stop_circle),
        iconColor: const Color(0xff4CAF50),
        backgroundColor: const Color.fromARGB(255, 13, 98, 34),
      ),
      BulletCard(
        title: 'Sleep',
        icon: const Icon(Icons.bedtime),
        iconColor: const Color(0xff9C27B0),
        backgroundColor: const Color.fromARGB(255, 75, 28, 98),
      ),
      BulletCard(
          iconColor: Color.fromARGB(255, 176, 124, 105),
          title: 'Create your own',
          icon: Icon(Icons.create),
          backgroundColor: Color.fromARGB(255, 68, 48, 41)),
    ];

    return Scaffold(
      appBar: SharedAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: List.generate(cards.length, (index) {
              return AnimatedSlide(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
                offset: _visibleList[index] ? Offset.zero : const Offset(1, 2),
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 400),
                  opacity: _visibleList[index] ? 1 : 0,
                  curve: Curves.easeOut,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: cards[index],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
