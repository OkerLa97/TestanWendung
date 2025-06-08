import 'package:flutter/material.dart';
import 'package:burger_shop/utils/app_theme.dart';

// Главный виджет страницы оплаты
class PaymentPage extends StatelessWidget {
  final double order;
  final double taxes;
  final double deliveryFees;
  final double total;

  // Конструктор с параметрами (можно передавать суммы)
  const PaymentPage({
    super.key,
    this.order = 16.48,
    this.taxes = 0.3,
    this.deliveryFees = 1.5,
    this.total = 18.19,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Сводка заказа
            Text(
              'Order summary',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Order'), Text('\$${order.toStringAsFixed(2)}')],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Taxes'), Text('\$${taxes.toStringAsFixed(2)}')],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Delivery fees'),
                Text('\$${deliveryFees.toStringAsFixed(2)}'),
              ],
            ),
            Divider(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  '\$${total.toStringAsFixed(2)}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Estimated delivery time:',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Text(
                  '15 - 30mins',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(height: 30),
            // Методы оплаты
            Text(
              'Payment methods',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 16),
            _buildPaymentMethod(
              context,
              selected: true,
              logo: 'assets/images/mastercard.png',
              title: 'Credit card',
              number: '5105 **** **** 0505',
            ),
            SizedBox(height: 16),
            _buildPaymentMethod(
              context,
              selected: false,
              logo: 'assets/images/visa.png',
              title: 'Debit card',
              number: '3566 **** **** 0505',
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Checkbox(value: true, onChanged: (v) {}),
                Text('Save card details for future payments'),
              ],
            ),
            Spacer(),
            // Итоговая цена и кнопка оплаты
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Total price', style: TextStyle(fontSize: 16)),
                    Text(
                      '\$${total.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.primaryColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 180,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      // Здесь можно добавить обработку оплаты
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.accentDark,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    child: Text(
                      'Pay Now',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Метод для отображения карточки способа оплаты
  Widget _buildPaymentMethod(
    BuildContext context, {
    required bool selected,
    required String logo,
    required String title,
    required String number,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: selected ? AppTheme.accentDark : Colors.grey[100],
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          if (selected)
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      child: Row(
        children: [
          Image.asset(
            logo,
            width: 48,
            height: 32,
            errorBuilder: (c, e, s) => Icon(Icons.credit_card),
          ),
          SizedBox(width: 18),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: selected ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  number,
                  style: TextStyle(
                    color: selected ? Colors.white70 : Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            selected ? Icons.radio_button_checked : Icons.radio_button_off,
            color: selected ? Colors.white : Colors.black38,
          ),
        ],
      ),
    );
  }
}
