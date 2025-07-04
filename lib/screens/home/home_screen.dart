import 'package:flutter/material.dart';
import 'package:meem/config/routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const ProjectsPage(),
    const BotPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
          BottomNavigationBarItem(icon: Icon(Icons.folder), label: 'مشاريعي'),
          BottomNavigationBarItem(
            icon: Icon(Icons.smart_toy),
            label: 'بوت ميم',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'الملف الشخصي',
          ),
        ],
      ),
    );
  }
}

// الصفحة الرئيسية
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        title: Row(
          children: [
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  'ميم',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            const Text(
              'مرحباً بك في ميم',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.notificationsRoute);
            },
          ),
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.searchRoute);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // بطاقة الترحيب
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).primaryColor,
                    Theme.of(context).primaryColor.withOpacity(0.8),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).primaryColor.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'ابدأ رحلتك في ريادة الأعمال',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'استخدم أدوات ميم الذكية لتحويل فكرتك إلى مشروع ناجح',
                    style: TextStyle(fontSize: 14, color: Colors.white70),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.createProjectRoute,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'إنشاء مشروع جديد',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // عنوان الخدمات
            const Text(
              'خدمات ميم',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 16),

            // شبكة الخدمات الرئيسية
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.1,
              children: [
                _buildServiceCard(
                  context,
                  'بوت ميم الذكي',
                  'استشارات فورية بالذكاء الاصطناعي',
                  Icons.smart_toy,
                  Colors.blue,
                  () => Navigator.pushNamed(context, AppRoutes.botRoute),
                ),
                _buildServiceCard(
                  context,
                  'دراسة الجدوى',
                  'تحليل شامل لجدوى مشروعك',
                  Icons.analytics,
                  Colors.green,
                  () => Navigator.pushNamed(
                    context,
                    AppRoutes.feasibilityQuestionnaireRoute,
                  ),
                ),
                _buildServiceCard(
                  context,
                  'التسويق الذكي',
                  'حملات إعلانية وتحليل منافسين',
                  Icons.campaign,
                  Colors.orange,
                  () => Navigator.pushNamed(
                    context,
                    AppRoutes.marketingDashboardRoute,
                  ),
                ),
                _buildServiceCard(
                  context,
                  'فرص التمويل',
                  'اكتشف مصادر التمويل المناسبة',
                  Icons.account_balance,
                  Colors.purple,
                  () =>
                      Navigator.pushNamed(context, AppRoutes.fundingListRoute),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // عنوان الأدوات السريعة
            const Text(
              'أدوات سريعة',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 16),

            // قائمة الأدوات السريعة
            Column(
              children: [
                _buildQuickToolTile(
                  context,
                  'مولد الإعلانات',
                  'إنشاء إعلانات احترافية بالذكاء الاصطناعي',
                  Icons.auto_awesome,
                  () =>
                      Navigator.pushNamed(context, AppRoutes.adGeneratorRoute),
                ),
                _buildQuickToolTile(
                  context,
                  'تحليل المنافسين',
                  'دراسة شاملة للمنافسين في السوق',
                  Icons.trending_up,
                  () => Navigator.pushNamed(
                    context,
                    AppRoutes.competitorAnalysisRoute,
                  ),
                ),
                _buildQuickToolTile(
                  context,
                  'الاستثمار الداخلي',
                  'فرص الاستثمار من داخل منصة ميم',
                  Icons.savings,
                  () => Navigator.pushNamed(
                    context,
                    AppRoutes.internalInvestmentRoute,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceCard(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: color, size: 28),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickToolTile(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    VoidCallback onTap,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        onTap: onTap,
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: Theme.of(context).primaryColor),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.grey[400],
        ),
        tileColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}

// صفحة المشاريع (مؤقتة)
class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('مشاريعي'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: const Center(
        child: Text(
          'صفحة المشاريع قيد التطوير',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

// صفحة البوت (مؤقتة)
class BotPage extends StatelessWidget {
  const BotPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('بوت ميم'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: const Center(
        child: Text('صفحة بوت ميم قيد التطوير', style: TextStyle(fontSize: 18)),
      ),
    );
  }
}

// صفحة الملف الشخصي (مؤقتة)
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الملف الشخصي'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: const Center(
        child: Text(
          'صفحة الملف الشخصي قيد التطوير',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
