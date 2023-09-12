import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CV App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        hintColor: Colors.teal, // Define an accent color
        fontFamily: 'Roboto', // Define a custom font family
        textTheme: TextTheme(
          headline6: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
          bodyText2: TextStyle(
            fontSize: 16.0,
            color: Colors.black54,
          ),
        ),
      ),
      home: MyCV(),
    );
  }
}

class MyCV extends StatefulWidget {
  @override
  _MyCVState createState() => _MyCVState();
}

class _MyCVState extends State<MyCV> {
  String fullName = "Clement Yeboah";
  String slackUsername = "Clement Yeboah (10811590)";
  String githubHandle = "baafik";
  String bio =
      "My journey in app development began with a fascination for transforming creative ideas into user-friendly solutions. When not coding, I contribute to open-source projects and stay updated with the latest mobile tech trends. I believe in continuous learning to stay at the for. Maintaining a balanced life enhances my creativity and keeps me motivated. I'm excited to showcase my skills through this CV app and connect with fellow tech enthusiasts. Feel free to reach out on Slack or GitHub for collaboration or tech discussions.";

  TextEditingController nameController = TextEditingController();
  TextEditingController slackController = TextEditingController();
  TextEditingController githubController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = fullName;
    slackController.text = slackUsername;
    githubController.text = githubHandle;
    bioController.text = bio;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('CV'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'View'),
              Tab(text: 'Edit'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CVView(
              fullName: fullName,
              slackUsername: slackUsername,
              githubHandle: githubHandle,
              bio: bio,
            ),
            CVEdit(
              nameController: nameController,
              slackController: slackController,
              githubController: githubController,
              bioController: bioController,
              onSave: () {
                setState(() {
                  fullName = nameController.text;
                  slackUsername = slackController.text;
                  githubHandle = githubController.text;
                  bio = bioController.text;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CVView extends StatelessWidget {
  final String fullName;
  final String slackUsername;
  final String githubHandle;
  final String bio;

  CVView({
    required this.fullName,
    required this.slackUsername,
    required this.githubHandle,
    required this.bio,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Full Name:',
            style: Theme.of(context).textTheme.headline6,
          ),
          Text(
            fullName,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          Text(
            'Slack Username:',
            style: Theme.of(context).textTheme.headline6,
          ),
          Text(
            slackUsername,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          Text(
            'GitHub Handle:',
            style: Theme.of(context).textTheme.headline6,
          ),
          Text(
            githubHandle,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          Divider(),
          Text(
            'Bio:',
            style: Theme.of(context).textTheme.headline6,
          ),
          Text(
            bio,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ],
      ),
    );
  }
}

class CVEdit extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController slackController;
  final TextEditingController githubController;
  final TextEditingController bioController;
  final VoidCallback onSave;

  CVEdit({
    required this.nameController,
    required this.slackController,
    required this.githubController,
    required this.bioController,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Full Name',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          TextFormField(
            controller: nameController,
            decoration: InputDecoration(
              hintText: 'Enter your full name',
            ),
          ),
          Text(
            'Slack Username',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          TextFormField(
            controller: slackController,
            decoration: InputDecoration(
              hintText: 'Enter your Slack username',
            ),
          ),
          Text(
            'GitHub Handle',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          TextFormField(
            controller: githubController,
            decoration: InputDecoration(
              hintText: 'Enter your GitHub handle',
            ),
          ),
          Text(
            'Bio',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          TextFormField(
            controller: bioController,
            decoration: InputDecoration(
              hintText: 'Enter a brief personal bio',
            ),
            maxLines: null,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: onSave,
            child: Text("Save"),
          ),
        ],
      ),
    );
  }
}
