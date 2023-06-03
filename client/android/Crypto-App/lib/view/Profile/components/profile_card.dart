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
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Username: ${profileData.username}',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Name: ${profileData.name}',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Email: ${profileData.email}',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 8),
                ],
              ),
            ),
          );
        } else {
          // Handle the case when there is no data
          return Text('No profile data available');
        }
      },
    );
  }
}
