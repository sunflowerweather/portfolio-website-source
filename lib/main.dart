import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfoliowebsite/widgets/image_gallery.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const backgroundColor = Color(0xFF0A1419);
    const surfaceColor = Color(0xFF102027);
    const borderColor = Color(0xFF213A40);
    const accentColor = Color(0xFF45B7B0);
    const primaryTextColor = Color(0xFFE5F0EF);
    const secondaryTextColor = Color(0xFF91A6A8);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tymur Yukhnovets | Software Developer',

      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: backgroundColor,
        colorScheme: ColorScheme.fromSeed(
          seedColor: accentColor,
          brightness: Brightness.dark,
        ),
        textTheme: GoogleFonts.openSansTextTheme(
          ThemeData.dark().textTheme,
        ).apply(
          bodyColor: primaryTextColor,
          displayColor: primaryTextColor,
        ),
        dividerColor: borderColor,
        cardColor: surfaceColor,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  static const List<String> cityboxImages = [
    'assets/citybox/citybox_1.png',
    'assets/citybox/citybox_2.png',
    'assets/citybox/citybox_3.png',
    'assets/citybox/citybox_4.png',
    'assets/citybox/citybox_5.png',
    'assets/citybox/citybox_6.png',
    'assets/citybox/citybox_7.png',
    'assets/citybox/citybox_8.png',
  ];

  static const List<String> holonotesImages = [
    'assets/holo_notes/holo_notes_1.png',
    'assets/holo_notes/holo_notes_2.png',
    'assets/holo_notes/holo_notes_3.png',
  ];

  static const String email = 'timuryu2009@gmail.com';

  Future<void> openEmail() async {
    final uri = Uri(
      scheme: 'mailto',
      path: email,
    );

    await _openUri(uri);
  }

  Future<void> openLink(String url) async {
    await _openUri(Uri.parse(url));
  }

  Future<void> _openUri(Uri uri) async {
    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.platformDefault,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 700;

          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 20 : 40,
              vertical: isMobile ? 50 : 80,
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildHero(context, isMobile),

                    const SizedBox(height: 40),

                    _buildSectionTitle(context, 'Contact'),

                    const SizedBox(height: 16),

                    _buildContactSection(context, isMobile),

                    const SizedBox(height: 70),

                    _buildSectionTitle(context, 'About Me'),

                    const SizedBox(height: 20),

                    _buildAboutSection(context),

                    const SizedBox(height: 70),

                    _buildProjectSection(
                      context,
                      title: 'Holo Notes',
                      description:
                      'A fully offline notes and diary application '
                          'built with Flutter and Dart.',
                      images: holonotesImages,
                    ),

                    const SizedBox(height: 70),

                    _buildProjectSection(
                      context,
                      title: 'Citybox',
                      description:
                      'A fun sandbox game I developed with a friend using '
                          'Unity and C#, featuring multiple maps, vehicles, '
                          'weapons, customization, and gameplay mechanics.',
                      images: cityboxImages,
                    ),

                    const SizedBox(height: 70),

                    _buildSectionTitle(context, 'My Skills'),

                    const SizedBox(height: 20),

                    _buildSkillsSection(context, isMobile),

                    const SizedBox(height: 70),

                    _buildSectionTitle(context, 'Some of My Projects'),

                    const SizedBox(height: 20),

                    _buildProjectsSection(context, isMobile),

                    const SizedBox(height: 60),

                    Text(
                      '© ${DateTime.now().year} Tymur Yukhnovets\nMade with Flutter',
                      style: const TextStyle(
                        color: Color(0xFF71878A),
                        fontSize: 13,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHero(BuildContext context, bool isMobile) {
    return Column(
      children: [
        Text(
          "Hi, I'm Tymur Yukhnovets.",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
            fontWeight: FontWeight.w700,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 14),
        Text(
          'I\'m a Programmer interested in Flutter, Python, '
              'and software development.',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: const Color(0xFF91A6A8),
            fontWeight: FontWeight.w400,
            height: 1.5,
          ),
        ),

      ],
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
        fontWeight: FontWeight.w400,
        letterSpacing: 0.2,
      ),
    );
  }

  Widget _buildContactSection(BuildContext context, bool isMobile) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 14,
      runSpacing: 14,
      children: [
        _buildInfoCard(
          context,
          icon: 'assets/githubicon.png',
          title: 'GitHub',
          subtitle: 'My projects and source code',
          isMobile: isMobile,
          onTapped: () => openLink(
            'https://github.com/sunflowerweather',
          ),
        ),
        _buildInfoCard(
          context,
          icon: 'assets/gmailicon.png',
          title: 'Email',
          subtitle: email,
          isMobile: isMobile,
          onTapped: openEmail,
        ),
        _buildInfoCard(
          context,
          icon: 'assets/linkedinicon.png',
          title: 'LinkedIn',
          subtitle: 'Professional profile (soon)',
          isMobile: isMobile,
          onTapped: null,
        ),
      ],
    );
  }

  Widget _buildAboutSection(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 28,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF0F1E24),
        borderRadius: BorderRadius.circular(3),
        border: Border.all(
          color: const Color(0xFF1D343A),
        ),
      ),
      child: Text(
        "I'm a student studying Applied Informatics at the Slovak University "
            "of Technology in Bratislava.\n\n"
            "I enjoy creating all kinds of programming projects, from small "
            "utilities to larger and more complex applications.\n\n"
            "I started programming at the age of 8, when I wrote my first "
            "program in Python. Since then, I've built various applications "
            "and tools using Python and Dart/Flutter.",
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: const Color(0xFFB8C7C8),
          height: 1.5,
          fontSize: 17,
        ),
      ),
    );
  }

  Widget _buildProjectSection(
      BuildContext context, {
        required String title,
        required String description,
        required List<String> images,
      }) {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 10),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: const Color(0xFF91A6A8),
              height: 1.6,
            ),
          ),
        ),
        const SizedBox(height: 20),
        ImageGallery(images: images),
      ],
    );
  }

  Widget _buildSkillsSection(BuildContext context, bool isMobile) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 14,
      runSpacing: 14,
      children: [
        _buildInfoCard(
          context,
          icon: 'assets/fluttericon.png',
          title: 'Flutter & Dart',
          subtitle: 'Mobile, web, and desktop application development',
          isMobile: isMobile,
        ),
        _buildInfoCard(
          context,
          icon: 'assets/pythonicon.png',
          title: 'Python',
          subtitle: 'Desktop tools, automation, file management, and scripting',
          isMobile: isMobile,
        ),
        _buildInfoCard(
          context,
          icon: 'assets/unityicon.png',
          title: 'Unity & C#',
          subtitle: 'Game development, animation, and interactive mechanics',
          isMobile: isMobile,
        ),
      ],
    );
  }

  Widget _buildProjectsSection(BuildContext context, bool isMobile) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 14,
      runSpacing: 14,
      children: [
        _buildInfoCard(
          context,
          icon: 'assets/holonotesicon.png',
          title: 'Holo Notes',
          subtitle:
          'Simple, fully offline notes and diary app for Android and Windows',
          isMobile: isMobile,
          onTapped: () => openLink(
            'https://github.com/sunflowerweather/holo-notes',
          ),
        ),

        _buildInfoCard(
          context,
          icon: 'assets/holobudgetericon.png',
          title: 'Holo Budgeter',
          subtitle:
          'Simple, fully offline budgeting app for Android and Windows',
          isMobile: isMobile,
          onTapped: () => openLink(
            'https://github.com/sunflowerweather/holo-budgeter',
          ),
        ),

        _buildInfoCard(
          context,
          icon: 'assets/fileorganizericon.png',
          title: 'File Organizer',
          subtitle: 'Quick Python file sorter',
          isMobile: isMobile,
          onTapped: () => openLink(
            'https://github.com/sunflowerweather/file-organizer',
          ),
        ),
      ],
    );
  }

  Widget _buildInfoCard(
      BuildContext context, {
        required String icon,
        required String title,
        required String subtitle,
        required bool isMobile,
        VoidCallback? onTapped,
      }) {
    final isClickable = onTapped != null;

    return SizedBox(
      width: isMobile ? double.infinity : 350,
      height: 96,
      child: Material(
        color: const Color(0xFF102027),
        borderRadius: BorderRadius.circular(3),
        child: InkWell(
          onTap: onTapped,
          mouseCursor: isClickable
              ? SystemMouseCursors.click
              : SystemMouseCursors.basic,
          borderRadius: BorderRadius.circular(3),
          hoverColor: isClickable
              ? const Color(0xFF162B32)
              : Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              border: Border.all(
                color: const Color(0xFF213A40),
              ),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 58,
                  height: 58,
                  child: Image.asset(
                    icon,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Color(0xFFE5F0EF),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        subtitle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Color(0xFF91A6A8),
                          fontSize: 13,
                          height: 1.3,
                        ),
                      ),
                    ],
                  ),
                ),
                if (isClickable) ...[
                  const SizedBox(width: 8),
                  const Icon(
                    Icons.arrow_outward,
                    size: 17,
                    color: Color(0xFF45B7B0),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}