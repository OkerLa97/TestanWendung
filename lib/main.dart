import 'package:burger_shop/models/customize_burger.dart';
import 'package:flutter/material.dart';
import 'package:burger_shop/pages/home_page.dart';
import 'package:burger_shop/models/card_order.dart';
import 'package:burger_shop/pages/payment_page.dart';
import 'package:burger_shop/utils/app_theme.dart';

final ValueNotifier<ThemeMode> themeModeNotifier =
    ValueNotifier(ThemeMode.light);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeModeNotifier,
      builder: (context, mode, _) {
        return MaterialApp(
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: mode,
          home: HomePage(onToggleTheme: () {
            themeModeNotifier.value =
                themeModeNotifier.value == ThemeMode.light
                    ? ThemeMode.dark
                    : ThemeMode.light;
          }),
        );
      },
    );
  }
}

// Альтернативная реализация экрана настройки бургера
class BurgerCustomizerPage extends StatefulWidget {
  const BurgerCustomizerPage({super.key});

  @override
  State<BurgerCustomizerPage> createState() => _BurgerCustomizerPageState();
}

class _BurgerCustomizerPageState extends State<BurgerCustomizerPage> {
  double spiciness = 0.5;
  int portion = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🍔 Бургер (можно заменить на Image.asset / Image.network)
              Expanded(
                flex: 1,
                child: Image.asset(
                  'assets/burger.png',
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.amber.shade200,
                      child: Center(child: Text('Burger Image')),
                    );
                  },
                ),
              ),

              const SizedBox(width: 20),

              // ⚙️ Справа: текст + слайдер + кнопки
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Customize",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: " Your Burger\n"),
                          TextSpan(text: "to Your Tastes. Ultimate Experience"),
                        ],
                      ),
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 30),

                    const Text("Spicy", style: TextStyle(fontSize: 16)),
                    Row(
                      children: [
                        const Text("Mild"),
                        Expanded(
                          child: Slider(
                            value: spiciness,
                            onChanged: (value) {
                              setState(() {
                                spiciness = value;
                              });
                            },
                            min: 0,
                            max: 1,
                            activeColor: AppTheme.primaryColor,
                          ),
                        ),
                        const Text("Hot"),
                      ],
                    ),

                    const SizedBox(height: 30),
                    const Text("Portion", style: TextStyle(fontSize: 16)),

                    const SizedBox(height: 10),

                    Row(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            backgroundColor: AppTheme.primaryColor,
                          ),
                          onPressed: () {
                            setState(() {
                              if (portion > 1) portion--;
                            });
                          },
                          child: const Icon(Icons.remove),
                        ),
                        Text('$portion', style: const TextStyle(fontSize: 18)),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            backgroundColor: AppTheme.primaryColor,
                          ),
                          onPressed: () {
                            setState(() {
                              portion++;
                            });
                          },
                          child: const Icon(Icons.add),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
