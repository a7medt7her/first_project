import 'package:flutter/material.dart';
import 'package:me/screens/Loginpage.dart';
import 'package:me/screens/add_note_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});
  static const String routs = 'Homepage';
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Map<String, String>> savecontant = [];
  @override
  Widget build(BuildContext context) {
    final arg =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    String? username = arg?['username'];
    String? email = arg?['email'];
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsetsGeometry.only(top: 20, right: 20, left: 10),
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/b.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Column(
                  children: [
                    SizedBox(height: 20),
                    Text(
                      '$username',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      '$email',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 88, 89, 90),
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Divider(
              color: const Color.fromARGB(255, 160, 157, 157),
              thickness: 1.5,
            ),
            SizedBox(height: 20),
            ListTile(
              splashColor: const Color.fromARGB(255, 223, 221, 221),

              onTap: () {
                setState(() {
                  print('Home tapped');
                });
              },
              subtitle: Text('Home page'),
              title: Text(
                'Home',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
              ),
              leading: Icon(Icons.home, size: 30),
            ),
            SizedBox(height: 20),
            ListTile(
              selected: true,
              selectedColor: const Color.fromARGB(255, 243, 2, 163),
              splashColor: const Color.fromARGB(255, 223, 221, 221),
              onTap: () {},
              title: Text(
                'Home',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
              ),
              leading: Icon(Icons.home, size: 30),
            ),
            SizedBox(height: 20),
            ListTile(
              splashColor: const Color.fromARGB(255, 223, 221, 221),
              onTap: () {},
              title: Text(
                'Settings',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
              ),
              leading: Icon(Icons.settings, size: 30),
            ),
            SizedBox(height: 20),
            ListTile(
              splashColor: const Color.fromARGB(255, 223, 221, 221),
              onTap: () {},
              title: Text(
                'Support',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
              ),
              leading: Icon(Icons.contact_support, size: 30),
            ),
            SizedBox(height: 20),

            ListTile(
              splashColor: const Color.fromARGB(255, 223, 221, 221),
              onTap: () {},
              title: Text(
                'contact with us',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
              ),
              leading: Icon(Icons.contact_page, size: 30),
            ),
            SizedBox(height: 20),
            ListTile(
              splashColor: const Color.fromARGB(255, 223, 221, 221),
              onTap: () {},
              title: Text(
                'Support',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
              ),
              leading: Icon(Icons.contact_support, size: 30),
            ),
            SizedBox(height: 150),
            Divider(
              color: const Color.fromARGB(255, 160, 157, 157),
              thickness: 1.5,
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.only(right: 90),
              padding: EdgeInsets.only(right: 40),
              width: 200,
              child: ListTile(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, Loginpage.routs);
                },
                splashColor: const Color.fromARGB(255, 223, 221, 221),
                title: Text(
                  'Log Out',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 253, 17, 0),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                trailing: Icon(
                  Icons.logout_rounded,
                  color: const Color.fromARGB(255, 253, 17, 0),
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: const Color.fromARGB(255, 255, 255, 255),
        ),

        title: const Text(
          'Your Notes',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(0, 238, 238, 238),
        elevation: 3,
      ),
      body: savecontant.isEmpty
          ? Center(
              child: Text(
                'No notes yet',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: savecontant.length,
              itemBuilder: (context, index) {
                final note = savecontant[index];
                return Card(
                  color: const Color.fromARGB(66, 136, 134, 134),
                  margin: EdgeInsets.all(8),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    title: Text(
                      note['title'] ?? '',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    subtitle: Text(
                      note['note'] ?? '',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 197, 194, 194),
                      ),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        elevation: 9,
        backgroundColor: Color.fromARGB(255, 228, 118, 8),
        onPressed: () async {
          // هنا نروح لصفحة الإضافة ونستقبل النتيجة لما المستخدم يضغط "Save"
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNotePage()),
          );
          print('Result from AddNotePage: $result');

          // لو المستخدم رجع بحاجة (يعني مش داس Back بس)
          if (result != null) {
            setState(() {
              savecontant.add(result);
            });
          }

          print('Result from AddNotePage: $savecontant');
        },

        shape: CircleBorder(),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
