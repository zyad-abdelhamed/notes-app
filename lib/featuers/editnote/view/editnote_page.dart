
import 'package:flutter/material.dart';
import 'package:memos/core/extentions/textextention.dart';
import 'package:memos/featuers/home/controller/cubit/home_cubit.dart';
import 'package:memos/sqldp.dart';

// ignore: must_be_immutable, camel_case_types
class editnote_page extends StatefulWidget 

 {
   editnote_page({this.n,this.t,this.id});
    String? t ;
    String? n;
    int? id;
  
  
    

  @override
  State<editnote_page> createState() => _editnote_pageState();
}

class _editnote_pageState extends State<editnote_page> {
  TextEditingController titel1 =TextEditingController();
   TextEditingController note1 =TextEditingController();
  GlobalKey k1=GlobalKey<FormState>();
  HomeCubit homeCubit=HomeCubit();
  @override
  void initState() {
    titel1.text=widget.t!;
    note1.text=widget.n!;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar:  AppBar(
               
                leading: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                    )),

                actions: [
                   IconButton(
                      onPressed: () async{
                         await  SqlDb.stobject.updateData('''
                          UPDATE notes SET 
                          note = "${note1.text}" ,
                          titel = "${titel1.text}"
                          WHERE id = ${widget.id}
                        ''');
                        await homeCubit.readdata();
                        Navigator.pushNamedAndRemoveUntil(context, 'home',(route) => false,);
                      },
                      icon: const Icon(
                        Icons.done,
                      ))
                ],    
              ),
          
          
          
            body:   SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Form(
                          key:k1,
                          child: Column(
                            children: [
                              TextFormField(
                                style: context.tStyle.textTheme.displayLarge,
                                controller:titel1,
                                maxLength: 10,
                               // maxLines: 2,
                                readOnly: false,
                                decoration: InputDecoration(
                                    hintText: 'العنوان',
                                    hintStyle: context.tStyle.textTheme.displayLarge ,
                                    border: InputBorder.none),
                              ),
                            
                              
                              TextFormField(
                                style: context.tStyle.textTheme.displaySmall,
                                controller:note1,
                                decoration:  InputDecoration(
                                    hintText: 'دون...',
                                    hintStyle: context.tStyle.textTheme.displaySmall,
                                    border: InputBorder.none),
                                    
                              ),
                            ],
                          )),
                     
                    ],
                  ),
                ),
            )
        ),
        
    );}
        
      }
