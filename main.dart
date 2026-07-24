import 'package:flutter/material.dart';

void main() {
  runApp(const KleBcaApp());
}

class KleBcaApp extends StatelessWidget {
  const KleBcaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "K.L.E. Society's GH BCA College, Haveri",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF003366), // KLE Navy Blue
          primary: const Color(0xFF003366),
          secondary: const Color(0xFFD4AF37), // KLE Gold
          surface: const Color(0xFFF9FAFC),
        ),
        scaffoldBackgroundColor: const Color(0xFFF4F6F9),
        cardTheme: CardThemeData(
          elevation: 2,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: Colors.grey.shade200),
          ),
        ),
      ),
      home: const KleHomePage(),
    );
  }
}

// -----------------------------------------------------------------------------
// Data Models
// -----------------------------------------------------------------------------
class StudentPlaced {
  final String name;
  final String company;
  final String imageUrl;

  const StudentPlaced({
    required this.name,
    required this.company,
    required this.imageUrl,
  });
}

class Founder {
  final String name;
  final String title;
  final String imageUrl;

  const Founder({
    required this.name,
    required this.title,
    required this.imageUrl,
  });
}

final List<StudentPlaced> samplePlacements = [
  const StudentPlaced(
    name: "TEJASHWINI PAWAR",
    company: "TCS",
    imageUrl: "https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?auto=format&fit=crop&q=80&w=400",
  ),
  const StudentPlaced(
    name: "ANUSHA HIREMATH",
    company: "TCS",
    imageUrl: "https://th.bing.com/th/id/OIP.SXdusAb2P5kf8tBFv_RjPQHaE8?w=282&h=188&c=7&r=0&o=7&pid=1.7&rm=3",
  ),
  const StudentPlaced(
    name: "SHUBHAM.K",
    company: "TCS",
    imageUrl: "https://th.bing.com/th/id/OIP.BKFWF9i9YiVnH64ifhqn2AHaHa?w=167&h=180&c=7&r=0&o=7&pid=1.7&rm=3",
  ),
  const StudentPlaced(
    name: "VARUNI MOKASHI",
    company: "TCS",
    imageUrl: "https://images.unsplash.com/photo-1517841905240-472988babdf9?auto=format&fit=crop&q=80&w=400",
  ),
  const StudentPlaced(
    name: "SAHANA DODDAMANI",
    company: "TCS",
    imageUrl: "https://images.unsplash.com/photo-1524504388940-b1c1722653e1?auto=format&fit=crop&q=80&w=400",
  ),
  const StudentPlaced(
    name: "DHANYASHREE UPPAR",
    company: "COGNIZANT",
    imageUrl: "https://th.bing.com/th/id/OIP.p2kPLyoE6J-uAR-Y1Y0lLwHaEO?w=320&h=182&c=7&r=0&o=7&pid=1.7&rm=3",
  ),
];

final List<Founder> saptarishis = [
  const Founder(name: "Shri. S. S. Basvanal", title: "Founder Life Member", imageUrl: "https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&q=80&w=300"),
  const Founder(name: "Shri. M. R. Sakhare", title: "Founder Life Member", imageUrl: "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&q=80&w=300"),
  const Founder(name: "Shri. B. B. Mamadapur", title: "Founder Life Member", imageUrl: "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&q=80&w=300"),
  const Founder(name: "Shri. H. F. Kattimani", title: "Founder Life Member", imageUrl: "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?auto=format&fit=crop&q=80&w=300"),
  const Founder(name: "Shri. P. R. Chikodi", title: "Founder Life Member", imageUrl: "https://images.unsplash.com/photo-1519085360753-af0119f7cbe7?auto=format&fit=crop&q=80&w=300"),
  const Founder(name: "Shri. H. S. Hanchanal", title: "Founder Life Member", imageUrl: "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?auto=format&fit=crop&q=80&w=300"),
  const Founder(name: "Shri. V. V. Patil", title: "Founder Life Member", imageUrl: "https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?auto=format&fit=crop&q=80&w=300"),
];

// -----------------------------------------------------------------------------
// Home Page Screen
// -----------------------------------------------------------------------------

class KleHomePage extends StatefulWidget {
  const KleHomePage({super.key});

  @override
  State<KleHomePage> createState() => _KleHomePageState();
}

class _KleHomePageState extends State<KleHomePage> {
  final ScrollController _scrollController = ScrollController();
  bool _showBackToTop = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset > 300 && !_showBackToTop) {
        setState(() => _showBackToTop = true);
      } else if (_scrollController.offset <= 300 && _showBackToTop) {
        setState(() => _showBackToTop = false);
      }
    });
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                // Top Contact Information Bar
                const TopHeaderBar(),

                // Header Main Banner
                const HeaderBannerWidget(),

                // Main Navigation Bar with Dropdowns
                const CollegeNavigationBar(),

                // Animated News Ticker
                const NewsTickerWidget(),

                const SizedBox(height: 24),

                // Content Container
                Center(
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 1200),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: const [
                        // Placements Grid
                        PlacementsSection(),
                        SizedBox(height: 40),

                        // History & Saptarishis (Founders) Section
                        HistoryAndFoundersSection(),
                        SizedBox(height: 40),

                        // KLE Emblem & Values Deep-Dive
                        EmblemSection(),
                        SizedBox(height: 40),

                        // About Us & Vision/Mission Section
                        AboutVisionSection(),
                        SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),

                // Dark Navy Comprehensive Footer
                FooterSection(onQuickLinkTap: (destination) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Navigating to $destination...")),
                  );
                }),
              ],
            ),
          ),

          // Scroll To Top Floating Button
          if (_showBackToTop)
            Positioned(
              bottom: 24,
              right: 24,
              child: FloatingActionButton.small(
                onPressed: _scrollToTop,
                backgroundColor: const Color(0xFF0F1A28),
                child: const Icon(Icons.keyboard_arrow_up, color: Colors.white),
              ),
            ),
        ],
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// TOP CONTACT & UTILITY HEADER BAR
// -----------------------------------------------------------------------------

class TopHeaderBar extends StatelessWidget {
  const TopHeaderBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF0F1A28),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center, // Fixed parameter name
            spacing: 16,
            runSpacing: 8,
            children: [
              // Contact details
              Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.phone_in_talk, size: 14, color: Color(0xFFD4AF37)),
                  SizedBox(width: 6),
                  Text("08375-232287, 9019703209", style: TextStyle(color: Colors.white70, fontSize: 12)),
                  SizedBox(width: 16),
                  Icon(Icons.email, size: 14, color: Color(0xFFD4AF37)),
                  SizedBox(width: 6),
                  Text("cbkph342@gmail.com", style: TextStyle(color: Colors.white70, fontSize: 12)),
                ],
              ),
              // Social Links
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("Follow Us: ", style: TextStyle(color: Colors.white54, fontSize: 12)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.facebook, size: 16, color: Colors.white70), constraints: const BoxConstraints()),
                  const SizedBox(width: 8),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.camera_alt, size: 16, color: Colors.white70), constraints: const BoxConstraints()),
                  const SizedBox(width: 8),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.language, size: 16, color: Colors.white70), constraints: const BoxConstraints()),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// HEADER BANNER WIDGET
// -----------------------------------------------------------------------------

class HeaderBannerWidget extends StatelessWidget {
  const HeaderBannerWidget({super.key});
  
  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 800;

    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: isDesktop
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 64,
                          height: 64,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: const Color(0xFF003366), width: 2),
                          ),
                          child: const Icon(Icons.school, color: Color(0xFF003366), size: 38),
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "K.L.E. SOCIETY'S",
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900, color: Color(0xFF003366), letterSpacing: 0.5),
                            ),
                            Text(
                              "GH BCA COLLEGE, HAVERI",
                              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: Color(0xFF003366)),
                            ),
                            SizedBox(height: 2),
                            Text(
                              "(Affiliated to Haveri University, Haveri & Approved by AICTE, New Delhi)",
                              style: TextStyle(fontSize: 11, color: Colors.black87, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue.shade100),
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.blue.shade50.withAlpha(100),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text("K.L.E Society's", style: TextStyle(fontSize: 10, color: Color(0xFF003366), fontWeight: FontWeight.bold)),
                          Text("bca", style: TextStyle(fontSize: 26, color: Color(0xFF0066CC), fontWeight: FontWeight.w900, fontStyle: FontStyle.italic)),
                          Text("G.H. College Campus", style: TextStyle(fontSize: 9, color: Color(0xFF003366))),
                        ],
                      ),
                    )
                  ],
                )
              : Column(
                  children: const [
                    Text("K.L.E. SOCIETY'S GH BCA COLLEGE, HAVERI", textAlign: TextAlign.center, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF003366))),
                    SizedBox(height: 2),
                    Text("Ph.: 08375-232287, E-mail: cbkph342@gmail.com", textAlign: TextAlign.center, style: TextStyle(fontSize: 7)),
                  ],
                ),
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// COMPREHENSIVE NAVIGATION BAR
// -----------------------------------------------------------------------------

class CollegeNavigationBar extends StatelessWidget {
  const CollegeNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF003366),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildNavItem(context, "Home", isSelected: true),
                _buildNavDropdown(context, "About Us", [
                  "About College",
                  "Our History",
                  "Management & Trustees",
                  "Chairman's Desk",
                  "Principal's Desk"
                ]),
                _buildNavDropdown(context, "Admissions", [
                  "Admission Procedure",
                  "Courses Offered",
                  "Documents Required"
                ]),
                _buildNavDropdown(context, "Academics", [
                  "Staff Profile",
                  "Syllabus (NEP)",
                  "Academic Calendar"
                ]),
                _buildNavItem(context, "Departments"),
                _buildNavDropdown(context, "Facilities", [
                  "Infrastructure",
                  "Library",
                  "Ladies Hostel",
                  "Sports Pavilion & Gym",
                  "Language Lab"
                ]),
                _buildNavItem(context, "Training & Placement"),
                _buildNavItem(context, "Activities"),
                _buildNavItem(context, "Gallery"),
                _buildNavItem(context, "Achievements"),
                _buildNavDropdown(context, "Alumni", [
                  "Alumni Register",
                  "Alumni Login",
                  "Alumni List"
                ]),
                _buildNavItem(context, "Contact Us"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, String title, {bool isSelected = false}) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        color: isSelected ? const Color(0xFFD4AF37) : Colors.transparent,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 13,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            color: isSelected ? const Color(0xFF003366) : Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildNavDropdown(BuildContext context, String title, List<String> items) {
    return PopupMenuButton<String>(
      tooltip: title,
      offset: const Offset(0, 42),
      onSelected: (val) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Navigating to $val")));
      },
      itemBuilder: (context) {
        return items.map((item) {
          return PopupMenuItem<String>(
            value: item,
            child: Text(item, style: const TextStyle(fontSize: 13)),
          );
        }).toList();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title, style: const TextStyle(fontSize: 13, color: Colors.white, fontWeight: FontWeight.w500)),
            const SizedBox(width: 4),
            const Icon(Icons.arrow_drop_down, size: 16, color: Colors.white70),
          ],
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// NEWS TICKER / MARQUEE BANNER
// -----------------------------------------------------------------------------

class NewsTickerWidget extends StatelessWidget {
  const NewsTickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFD4AF37),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF003366),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  "NEWS",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11),
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    "🎓 Admissions are Open for the Academic Year 2026-27  |  ✨ Placement Drive: TCS & Cognizant Registrations Active  |  🏆 Annual Sports & Cultural Meet Announced!",
                    style: TextStyle(color: Color(0xFF003366), fontWeight: FontWeight.w600, fontSize: 13),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// HISTORY & SAPTARISHIS (FOUNDERS) SECTION
// -----------------------------------------------------------------------------

class HistoryAndFoundersSection extends StatelessWidget {
  const HistoryAndFoundersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionHeading("Our History", "KLE Society's Educational Legacy"),
            const Text(
              "In 1916, Karnataka Lingayat Education (K.L.E.) Society was founded by Seven Founder Life Members, lovingly addressed as 'Saptarishis' [Seven Saints]. From 1984 onwards, K.L.E. Society expanded into Dental, Nursing, IT, Computer Applications, Hotel Management, and Polytechnics across India. Today, under the dynamic leadership of Dr. Prabhakar Kore, the KLE Society runs over 210 institutions.",
              style: TextStyle(fontSize: 13, color: Color(0xFF555555), height: 1.6),
            ),
            const SizedBox(height: 24),
            const Text(
              "Founders - The Saptarishis",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF003366)),
            ),
            const SizedBox(height: 12),
            
            // Founders Grid
            LayoutBuilder(
              builder: (context, constraints) {
                final count = constraints.maxWidth > 900 ? 7 : (constraints.maxWidth > 600 ? 4 : 2);
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: saptarishis.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: count,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.8,
                  ),
                  itemBuilder: (context, index) {
                    final founder = saptarishis[index];
                    return Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade50,
                        border: Border.all(color: Colors.grey.shade200),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 28,
                            backgroundImage: NetworkImage(founder.imageUrl),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            founder.name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF003366)),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            founder.title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 9, color: Colors.grey),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeading(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF003366))),
        Text(subtitle, style: const TextStyle(fontSize: 12, color: Color(0xFFD4AF37), fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
      ],
    );
  }
}

// -----------------------------------------------------------------------------
// EMBLEM & PHILOSOPHY EXPLORER
// -----------------------------------------------------------------------------

class EmblemSection extends StatelessWidget {
  const EmblemSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("The KLE Emblem & Interpretations", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF003366))),
            const SizedBox(height: 6),
            const Text(
              "Symbolic representation of Truth, Love, Service, and Sacrifice",
              style: TextStyle(fontSize: 12, color: Color(0xFFD4AF37), fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            
            LayoutBuilder(
              builder: (context, constraints) {
                final isWide = constraints.maxWidth > 700;
                return isWide
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: _buildEmblemItem(Icons.pets, "The Sacred Bull", "Symbolic of self-less service and cultivation support, representing piety and dedication.")),
                          const SizedBox(width: 12),
                          Expanded(child: _buildEmblemItem(Icons.flight_takeoff, "The Flying Bird", "Represents awakened youth power committed to taking up challenges for societal upliftment.")),
                          const SizedBox(width: 12),
                          Expanded(child: _buildEmblemItem(Icons.brightness_7, "Ishtalinga & Halo", "Denotes spreading the light of knowledge to dispel ignorance and enlighten humanity.")),
                        ],
                      )
                    : Column(
                        children: [
                          _buildEmblemItem(Icons.pets, "The Sacred Bull", "Symbolic of self-less service and cultivation support, representing piety and dedication."),
                          const SizedBox(height: 12),
                          _buildEmblemItem(Icons.flight_takeoff, "The Flying Bird", "Represents awakened youth power committed to taking up challenges for societal upliftment."),
                          const SizedBox(height: 12),
                          _buildEmblemItem(Icons.brightness_7, "Ishtalinga & Halo", "Denotes spreading the light of knowledge to dispel ignorance and enlighten humanity."),
                        ],
                      );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmblemItem(IconData icon, String title, String desc) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFC),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFF003366), size: 28),
          const SizedBox(height: 10),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF003366), fontSize: 14)),
          const SizedBox(height: 6),
          Text(desc, style: const TextStyle(fontSize: 12, color: Colors.black87, height: 1.4)), // Fixed Colors.black70 to Colors.black87
        ],
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// STUDENT PLACEMENTS GRID
// -----------------------------------------------------------------------------

class PlacementsSection extends StatelessWidget {
  const PlacementsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text("Top Placements & Achievers", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF003366))),
            Text("View All", style: TextStyle(color: Color(0xFF0066CC), fontWeight: FontWeight.bold, fontSize: 12)),
          ],
        ),
        const SizedBox(height: 12),
        LayoutBuilder(
          builder: (context, constraints) {
            final crossAxisCount = constraints.maxWidth > 900
                ? 6
                : constraints.maxWidth > 600
                    ? 3
                    : 2;

            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: samplePlacements.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                childAspectRatio: 0.72,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemBuilder: (context, index) {
                final item = samplePlacements[index];
                return Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.network(
                          item.imageUrl,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Container(
                            color: Colors.grey.shade300,
                            child: const Icon(Icons.person, size: 40, color: Colors.grey),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              item.name,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF003366)),
                            ),
                            const Text("✻", style: TextStyle(fontSize: 8, color: Colors.grey)),
                            Text(
                              item.company,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 11, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, color: Color(0xFFD4AF37)),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}

// -----------------------------------------------------------------------------
// ABOUT US & VISION / MISSION SECTION
// -----------------------------------------------------------------------------

class AboutVisionSection extends StatelessWidget {
  const AboutVisionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth > 800;

        return isWide
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _buildCard("About Us", _aboutText)),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      children: [
                        _buildCard("Vision", _visionText),
                        const SizedBox(height: 16),
                        _buildCard("Mission", _missionText),
                      ],
                    ),
                  ),
                ],
              )
            : Column(
                children: [
                  _buildCard("About Us", _aboutText),
                  const SizedBox(height: 16),
                  _buildCard("Vision", _visionText),
                  const SizedBox(height: 16),
                  _buildCard("Mission", _missionText),
                ],
              );
      },
    );
  }

  Widget _buildCard(String title, String content) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF003366))),
            Container(margin: const EdgeInsets.symmetric(vertical: 6), width: 30, height: 2, color: const Color(0xFFD4AF37)),
            const SizedBox(height: 8),
            Text(content, style: const TextStyle(fontSize: 12.5, color: Color(0xFF555555), height: 1.5)),
          ],
        ),
      ),
    );
  }

  static const String _aboutText =
      "The KLE Society’s BCA College was started in the year 2007. Our College is a hub for dedicated, talented and experienced teachers who motivate students to achieve the best. The college provides professional IT education with equal focus on theory and practical skills.";

  static const String _visionText =
      "To become a source of enlightenment and empowerment for the seekers of Knowledge.";

  static const String _missionText =
      "To motivate the students to become socially responsible, productive and useful citizens of the globalized world.";
}

// -----------------------------------------------------------------------------
// DARK FOOTER & HOW TO REACH
// -----------------------------------------------------------------------------

class FooterSection extends StatelessWidget {
  final Function(String) onQuickLinkTap;

  const FooterSection({super.key, required this.onQuickLinkTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF0F1A28),
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth > 850;

              return isWide
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: _buildFooterAbout()),
                        const SizedBox(width: 24),
                        Expanded(child: _buildHowToReach()),
                        const SizedBox(width: 24),
                        Expanded(child: _buildQuickLinks()),
                        const SizedBox(width: 24),
                        Expanded(child: _buildContactDetails()),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildFooterAbout(),
                        const SizedBox(height: 24),
                        _buildHowToReach(),
                        const SizedBox(height: 24),
                        _buildQuickLinks(),
                        const SizedBox(height: 24),
                        _buildContactDetails(),
                      ],
                    );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildFooterAbout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text("ABOUT US", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white)),
        SizedBox(height: 10),
        Text(
          "KLE Society's BCA College, Haveri offers top-tier computer application education empowering students with cutting-edge technical expertise.",
          style: TextStyle(fontSize: 12, color: Colors.white70, height: 1.5),
        ),
      ],
    );
  }

  Widget _buildHowToReach() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text("HOW TO REACH", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white)),
        SizedBox(height: 10),
        Text("🚆 Railway Station: SMM Haveri - 2.9 Kms", style: TextStyle(fontSize: 12, color: Colors.white70)),
        SizedBox(height: 4),
        Text("🚌 Bus Station: Haveri Bus Stand - 2.1 Kms", style: TextStyle(fontSize: 12, color: Colors.white70)),
        SizedBox(height: 4),
        Text("✈️ Airport: Hubballi Airport - 86 Kms", style: TextStyle(fontSize: 12, color: Colors.white70)),
      ],
    );
  }

  Widget _buildQuickLinks() {
    final links = ["Courses Offered", "Admission Procedure", "Activities", "Alumni Register", "Contact Us"];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("USEFUL LINKS", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white)),
        const SizedBox(height: 10),
        ...links.map((link) => InkWell(
              onTap: () => onQuickLinkTap(link),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: Text("» $link", style: const TextStyle(fontSize: 12, color: Colors.white70)),
              ),
            )),
      ],
    );
  }

  Widget _buildContactDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text("CONTACT DETAILS", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white)),
        SizedBox(height: 10),
        Text(
          "K.L.E’s GH BCA College Campus,\nP. B. Road, Haveri – 581110.\nPhone: 08375-232287, 9019703209\nMail: cbkph342@gmail.com",
          style: TextStyle(fontSize: 12, color: Colors.white70, height: 1.5),
        ),
      ],
    );
  }
}