part of 'package:crypto_app/view/Profile/profile_view.dart';

class _ProfileCard extends StatelessWidget {
  final Future<Profile> profile;

  const _ProfileCard({required this.profile});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Profile>(
      future: profile,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          Profile profileData = snapshot.data!;
          return Positioned(
            top: 30,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.account_circle,
                      size: 60,
                      color: Color(0xFF282159),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'Hello, ${profileData.username}',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  'Name',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF59709D),
                  ),
                ),
                Text(
                  '${profileData.name}',
                  style: const TextStyle(
                    fontSize: 32,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 15),


                  ],
                ),);


        } else {
          // Handle the case when there is no data
          return Text('No profile data available');
        }
      },
    );
  }
}