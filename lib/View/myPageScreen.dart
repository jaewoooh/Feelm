// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Mypagescreen extends StatefulWidget {
  const Mypagescreen({super.key});

  @override
  _MypagescreenState createState() => _MypagescreenState();
}

class _MypagescreenState extends State<Mypagescreen> {
  String movieImage = 'assets/movie.png';
  String calendarImage = 'assets/calendar.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF9ACBFF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF9ACBFF),
        elevation: 0,
        actions: [
          Spacer(),
          MouseRegion(
            onEnter: (_) => setState(() => movieImage = 'assets/movieTouch.png'),
            onExit: (_) => setState(() => movieImage = 'assets/movie.png'),
            child: IconButton(
              icon: Image.asset(movieImage),
              onPressed: () {
                // 여기에 동작 추가
              },
            ),
          ),
          const SizedBox(width: 120), // 간격 조정
          MouseRegion(
            onEnter: (_) => setState(() => calendarImage = 'assets/calendarTouch.png'),
            onExit: (_) => setState(() => calendarImage = 'assets/calendar.png'),
            child: IconButton(
              icon: Image.asset(calendarImage),
              onPressed: () {
                // 여기에 동작 추가
              },
            ),
          ),
          const SizedBox(width: 120), // 간격 조정
          IconButton(
            icon: Image.asset('assets/myPage.png'),
            onPressed: () {
              // 여기에 동작 추가
            },
          ),
          Spacer(),
        ],

      ),
      body: Container(
        color: const Color(0xFFE5ECF5),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 프로필 섹션
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/profile.png'), // 프로필 이미지 경로
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          '안희영',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text('gmlud8009@gmail.com'),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                '즐겨 찾기',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              // 즐겨찾기 영화 목록
              Expanded(
                child: ListView(
                  children: [
                    _buildFavoriteMovieCard(
                      'Spiderman',
                      'assets/spiderman.png',
                      9.5,
                      'Action',
                      2019,
                      139,
                    ),
                    _buildFavoriteMovieCard(
                      'Spider-Man: No Way Home',
                      'assets/spiderman_no_way_home.png',
                      8.5,
                      'Action',
                      2021,
                      139,
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

  Widget _buildFavoriteMovieCard(String title, String imagePath, double rating, String genre, int year, int minutes) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(
              imagePath,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.orange, size: 16),
                      const SizedBox(width: 4),
                      Text(rating.toString()),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(genre),
                  const SizedBox(height: 4),
                  Text('$year'),
                  const SizedBox(height: 4),
                  Text('$minutes minutes'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
