

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memos/featuers/home/view/page/hom_page.dart';
import 'package:memos/sqldp.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

part 'add_state.dart';

class AddCubit extends Cubit<AddState> {
  AddCubit() : super(AddInitial());
 

   TextEditingController titel =TextEditingController();
  TextEditingController note =TextEditingController();
  GlobalKey k=GlobalKey<FormState>();
  SqlDb sqlDb =SqlDb();
  addf(BuildContext context)async{
     int res=  await sqlDb.insertData(
                  '''
                   INSERT INTO notes ('note','titel')
                   VALUES ("${note.text}","${titel.text}")
          
                  '''
                );
                if(res > 0){
              
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {
                    return const home_page();
                  },), (route) => false);
                  note.text='';
                  titel.text='';
                }
  }

}
