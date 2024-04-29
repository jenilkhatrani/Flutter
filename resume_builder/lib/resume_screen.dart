import 'package:flutter/material.dart';
import 'package:splash_screen/veriable.dart';

class resume extends StatefulWidget {
  resume({super.key});

  @override
  State<resume> createState() => _resumeState();

}

List<sets> listset =[
  sets(
      icons: Icons.quick_contacts_mail_outlined,
      title: 'Contact Info',
    rout: 'contact',
  ),
  sets(
      icons: Icons.card_travel_outlined,
      title: 'Carrier Objective',
    rout: 'carrier',
  ),
  sets(
      icons: Icons.person,
      title: 'Personal Details',
    rout: 'contact',
  ),
sets(
      icons: Icons.e_mobiledata,
      title: 'Education',
  rout: 'education',
  ),
sets(
      icons: Icons.menu_book,
      title: 'Experiences',
  rout: 'resume',
  ),
sets(
      icons: Icons.science,
      title: 'Technical Skills',
  rout: 'resume',
  ),
sets(
      icons: Icons.book_online,
      title: 'Interest/Hobbies',
  rout: 'resume',
  ),
sets(
      icons: Icons.bookmark_add_outlined,
      title: 'Projects',
  rout: 'resume',
  ),
sets(
      icons: Icons.collections_bookmark_sharp,
      title: 'Achievements',
  rout: 'resume',
  ),
sets(
      icons: Icons.handshake_outlined,
      title: 'Refrences',
  rout: 'Refrences',
  ),
sets(
      icons: Icons.video_collection_sharp,
      title: 'Declaration',
  rout: 'resume',
  ),

];

class _resumeState extends State<resume> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        leading: Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 80),
          child: IconButton(
            onPressed: (){Navigator.pop(context);
          },
              icon: Icon(Icons.arrow_back_ios_new,size: 40,),)
          ),
          title: Center(
            child: Column(
              children: [
                Text('resume Workspace',
                  style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                SizedBox(height:50,),
                Text('Build Optionss',
                  style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
              ],
            ),
          ),
          toolbarHeight: 150,
        ),
        body: ListView.builder(
          itemCount: listset.length ,
          itemBuilder: (context, index){

            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: (){

                      Navigator.pushNamed(context,  listset[index].rout);
                },
                child: ListTile(
                  leading:Icon(listset[index].icons,size: 50,),

                  title: Text(listset[index].title,style: TextStyle(fontSize: 25),),
                  trailing: IconButton(
                    onPressed: (){
                      Navigator.pushNamed(context,  listset[index].rout);
                    },
                    icon: Icon(Icons.chevron_right_rounded,size: 50,),
                  )
                ),
              ),
            );
          },

        ),
    );
  }
}