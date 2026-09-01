import 'package:car_sales_app/core/constants/app_icons.dart';
import 'package:car_sales_app/navigation/app_routes.dart';
import 'package:flutter/material.dart';

/// Drawer navigation (Phase 7.5).
/// Includes all app sections in English + Amharic.
class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(top: 16),
          children: [
            _DrawerItem(
              icon: AppIcons.home,
              label: 'Home',
              amharic: 'መነሻ',
              route: AppRoutes.home,
            ),
            _DrawerItem(
              icon: AppIcons.newCars,
              label: 'New Cars',
              amharic: 'አዲስ መኪኖች',
              route: AppRoutes.newCars,
            ),
            _DrawerItem(
              icon: AppIcons.usedCars,
              label: 'Used Cars',
              amharic: 'ያገለገሉ መኪኖች',
              route: AppRoutes.usedCars,
            ),
            _DrawerItem(
              icon: AppIcons.sell,
              label: 'Sell Your Car',
              amharic: 'መኪናህን ሽጥ',
              route: AppRoutes.sellCars,
            ),
            _DrawerItem(
              icon: AppIcons.carLoan,
              label: 'Car Loan',
              amharic: 'የመኪና ብድር',
              route: AppRoutes.carLoan,
            ),
            _DrawerItem(
              icon: AppIcons.emi,
              label: 'EMI Calculator',
              amharic: 'የEMI ካልኩሌተር',
              route: AppRoutes.emiCalculator,
            ),
            _DrawerItem(
              icon: AppIcons.favoriteBorder,
              label: 'Favourites',
              amharic: 'የተወደዱ',
              route: AppRoutes.favourites,
            ),
            _DrawerItem(
              icon: Icons.phone_outlined,
              label: 'Company Phone Number',
              amharic: 'የኩባንያ ስልክ',
              route: AppRoutes.companyPhone,
            ),
            _DrawerItem(
              icon: Icons.share,
              label: 'Connect With Us',
              amharic: 'ከእኛ ጋር ይገናኙ',
              route: AppRoutes.connectWithUs,
            ),
            _DrawerItem(
              icon: AppIcons.moreHoriz,
              label: 'Others',
              amharic: 'ሌሎች',
              route: AppRoutes.others,
            ),
            _DrawerItem(
              icon: AppIcons.star,
              label: 'Rate Us',
              amharic: 'ደረጃ ይስጡ',
              route: AppRoutes.rateUs,
            ),
            _DrawerItem(
              icon: AppIcons.settings,
              label: 'Settings',
              amharic: 'ቅንብሮች',
              route: AppRoutes.settings,
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  const _DrawerItem({
    required this.icon,
    required this.label,
    required this.amharic,
    required this.route,
  });

  final IconData icon;
  final String label;
  final String amharic;
  final String route;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      visualDensity: VisualDensity.compact,
      leading: Icon(
        icon,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
      title: Text(label, style: Theme.of(context).textTheme.bodyLarge),
      subtitle: Text(amharic, style: Theme.of(context).textTheme.bodySmall),
      onTap: () {
        Navigator.of(context).pop(); // close drawer
        Navigator.of(context).pushNamed(route);
      },
    );
  }
}
