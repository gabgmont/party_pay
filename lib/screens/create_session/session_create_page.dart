import 'package:flutter/material.dart';
import 'package:partypay/model/user/user_model.dart';
import 'package:partypay/screens/home/widgets/round_restaurant_card_widget.dart';
import 'package:partypay/screens/session/session_page.dart';
import 'package:partypay/shared/utils/AppColors.dart';

import 'controller/create_session_controller.dart';
import 'widget/cpf_add_form_field_widget.dart';
import 'widget/create_session_confirm_button.dart';
import 'widget/user_round_card_widget.dart';

const addUser = 'Adicionar usuário na mesa';
const createSession = 'Criar Sessão';
const selectRestaurant = 'Selecione o restaurante';
const table = 'Mesa';

class SessionCreatePage extends StatefulWidget {
  final UserModel user;

  const SessionCreatePage({Key? key, required this.user}) : super(key: key);

  @override
  State<SessionCreatePage> createState() => _SessionCreatePageState();
}

class _SessionCreatePageState extends State<SessionCreatePage> {
  final textController = TextEditingController();
  final sessionController = CreateSessionController();
  var tables = [10, 12, 14, 16, 18, 20, 22, 24, 26];
  int dropdownValue = 10;

  int selected = 0;

  void checkOption(int index) {
    setState(() {
      selected = index;
      sessionController.restaurant =
          sessionController.restaurantList[selected - 1]['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    sessionController.init(widget.user);
    sessionController.table = dropdownValue;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(createSession),
        backgroundColor: AppColors.primary,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  selectRestaurant,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: SizedBox(
                  height: 160,
                  width: size.width,
                  child: GridView.count(
                      crossAxisSpacing: 4,
                      crossAxisCount: 4,
                      children: <Widget>[
                        for (var i = 0;
                            i < sessionController.restaurantList.length;
                            i++)
                          RoundRestaurantCardWidget(
                            restaurant: sessionController.restaurantList[i],
                            shape: Shape.SQUARE,
                            onTap: () => checkOption(i + 1),
                            selected: i + 1 == selected,
                          ),
                      ]),
                ),
              ),
              const Divider(
                thickness: 1,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(addUser, style: TextStyle(fontSize: 18))),
              ),
              CpfAddFormFieldWidget(
                textController: textController,
                onTap: () async {
                  var user = await sessionController.getUser(
                      context, textController.text);
                  if (user != null) {
                    setState(() {
                      sessionController.userCardList.add(
                        UserRoundCardWidget(
                          initials: user.getInitials(),
                          photo: user.photo,
                        ),
                      );
                    });
                  }
                },
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              SizedBox(
                height: size.height * 0.07,
                width: size.width * 0.9,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: sessionController.userCardList,
                  ),
                ),
              ),
              const Divider(
                thickness: 1,
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              // Icon(Icons.table),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.restaurant,
                    color: AppColors.primary,
                    size: 36,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      table,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  DropdownButton(
                    value: dropdownValue,
                    icon: const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: AppColors.secondary,
                    ),
                    underline: Container(
                      height: 2,
                      color: AppColors.primary,
                    ),
                    items: tables
                        .map<DropdownMenuItem<int>>((table) => DropdownMenuItem(
                              value: table,
                              child: Text('$table'),
                            ))
                        .toList(),
                    onChanged: (int? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.06,
              ),
              CreateSessionConfirmButton(
                onTap: () async {
                  var sessionModel =
                      await sessionController.startSession(context);
                  if (sessionModel != null) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SessionPage(sessionModel: sessionModel),
                      ),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
