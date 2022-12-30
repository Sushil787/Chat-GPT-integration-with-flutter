  //  child: Consumer<GptDataProvider>(
  //                 builder: (context, value, child) {
  //                   return ListView.builder(
  //                     shrinkWrap: true,
  //                     itemCount: value.getAnswerList.length,
  //                     itemBuilder: ((context, index) {
  //                       if (value.getAnswerList.toString().isEmpty) {
  //                         return const Text("How can i help you? ");
  //                       }
  //                       return Card(
  //                         child: Column(
  //                           mainAxisAlignment: MainAxisAlignment.start,
  //                           mainAxisSize: MainAxisSize.min,
  //                           children: [
  //                             Container(
  //                                 width: width,
  //                                 child: Text(
  //                                   value.getQuestionList[index].toString(),
                                    // style: const TextStyle(
                                    //     fontSize: 18,
                                    //     fontWeight: FontWeight.bold,
                                    //     color:
                                    //         Color.fromARGB(255, 199, 195, 195)),
                                  // )),
  //                             Text(value.getAnswerList[index].toString()),
  //                           ],
  //                         ),
  //                       );
  //                     }),
  //                   );
  //                 },
  //               )
                
  //               class FontWeight {
  //               }



   // holdData(String query) {
  //   _questionList.add(query);
  //   notifyListeners();
  // }