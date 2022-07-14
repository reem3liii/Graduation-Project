import 'package:flutter/material.dart';
import 'package:saas/main.dart';
import 'package:saas/shared/items/components.dart';
import 'package:saas/shared/design/colors.dart';

class GPACalculator extends StatefulWidget {
  var initialCount;

  //int initialCount;
  GPACalculator({
    this.initialCount = 4,
  });

  @override
  _GPACalculatorState createState() => _GPACalculatorState();
}

class _GPACalculatorState extends State<GPACalculator> {
  int initialCount = 4;
  int fieldCount = 0;
  int nextIndex = 0;
  double semesterPoints = 0, semesterHours = 0;
  double res = 0, cumulativeGpa = 0;

  List<TextEditingController> gpaControllers = <TextEditingController>[];
  List<TextEditingController> creditControllers = <TextEditingController>[];

  // create the list of TextFields, based off the list of TextControllers
  List<Widget> _buildList1() {
    int i;
    // fill in keys if the list is not long enough (in case we added one)
    if (gpaControllers.length < fieldCount) {
      for (i = gpaControllers.length; i < fieldCount; i++) {
        gpaControllers.add(TextEditingController());
      }
    }

    i = 0;
    // cycle through the controllers, and recreate each, one per available controller
    return gpaControllers.map<Widget>((
      TextEditingController controller,
    ) {
      int displayNumber = i + 1;
      i++;
      return Row(
        children: [
          widthSpace(),
          widthSpace(),
          Expanded(
            child: Text(
              isArabic ? 'مقرر $displayNumber' : 'Course $displayNumber',
              style: isArabic
                  ? arTitleStyle(
                      size: 17,
                      color: defaultGreenColor,
                    )
                  : titleStyle(
                      size: 17,
                      color: defaultGreenColor,
                    ),
            ),
          ),
          //const Spacer(),
          widthSpace(),
          widthSpace(),
          Expanded(
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              maxLength: 6,
              decoration: InputDecoration(
                labelText: isArabic ? 'تقدير المقرر' : "GPA",
                labelStyle: const TextStyle(
                  color: Colors.grey,
                ),
                counterText: "",
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      );
    }).toList(); // convert to a list
  }

  List<Widget> _buildList2() {
    int i;
    // fill in keys if the list is not long enough (in case we added one)
    if (creditControllers.length < fieldCount) {
      for (i = creditControllers.length; i < fieldCount; i++) {
        creditControllers.add(TextEditingController());
      }
    }
    i = 0;
    // cycle through the controllers, and recreate each, one per available controller
    return creditControllers.map<Widget>((
      TextEditingController controller1,
    ) {
      int displayNumber = i + 1;
      i++;
      return Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller1,
              keyboardType: TextInputType.number,
              maxLength: 6,
              decoration: InputDecoration(
                labelText: isArabic ? 'عدد الساعات' : "Credit",
                labelStyle: const TextStyle(
                  color: Colors.grey,
                ),
                counterText: "",
                border: InputBorder.none,
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear,color: Colors.grey,),
                  onPressed: () {
                    setState(() {
                      if (fieldCount > 0) {
                        fieldCount--;
                        creditControllers.removeAt(displayNumber - 1);
                        gpaControllers.removeAt(displayNumber - 1);
                      }
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    // generate the list of TextFields
    final List<Widget> children = _buildList1();
    final List<Widget> children2 = _buildList2();
    TextEditingController cumulativeGPA = TextEditingController();
    TextEditingController creditsEarned = TextEditingController();

    // build the ListView
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isArabic ? 'حساب المعدل الاكاديمي' : 'GPA Calculator',
          style: isArabic
              ? arTitleStyle(
                  size: 20, color: Colors.white, weight: FontWeight.w600)
              : titleStyle(
                  color: Colors.white, size: 24, weight: FontWeight.w600),
        ),
        automaticallyImplyLeading: false,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: defaultColor,
        onPressed: () {
          setState(() {
            fieldCount++;
          });
        },
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  start: 20,
                  end: 20,
                  bottom: 10
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text('Cumulative GPA',style: titleStyle(
                            size: 18,
                            color: defaultGreenColor,
                          ),),
                          TextField(
                            controller: cumulativeGPA,
                            keyboardType: TextInputType.number,
                            maxLength: 6,
                            decoration: const InputDecoration(
                              labelText: "Cumulative GPA",
                              labelStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              counterText: "",
                              border: InputBorder.none,
                            ),
                          ),
                        ],
                        //mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                    ),
                    widthSpace(),
                    widthSpace(),
                    Expanded(
                      child: Column(
                        children: [
                          Text('Credits earned',style: titleStyle(
                            size: 18,
                            color: defaultGreenColor,
                          ),),
                          TextField(
                            controller: creditsEarned,
                            keyboardType: TextInputType.number,
                            maxLength: 6,
                            decoration: const InputDecoration(
                              labelText: "Credits earned",
                              labelStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              counterText: "",
                              border: InputBorder.none,
                            ),
                          ),
                        ],
                        //mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  widthSpace(),
                  widthSpace(),
                  Expanded(
                    child: Text(
                      isArabic ? 'المقرر' : 'Courses',
                      style: isArabic
                          ? arTitleStyle(
                              size: 18.0,
                              color: defaultOrangeColor.shade300,
                            )
                          : titleStyle(
                              size: 18.0,
                              color: defaultOrangeColor.shade300,
                            ),
                    ),
                  ),
                  widthSpace(),
                  widthSpace(),
                  Expanded(
                    child: Text(
                      isArabic ? 'التقدير' : 'GPA',
                      style: isArabic
                          ? arTitleStyle(
                              size: 18.0,
                              color: defaultOrangeColor.shade300,
                            )
                          : titleStyle(
                              size: 18.0,
                              color: defaultOrangeColor.shade300,
                            ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      isArabic ? 'الساعات' : 'Credits',
                      style: isArabic
                          ? arTitleStyle(
                              size: 18.0,
                              color: defaultOrangeColor.shade300,
                            )
                          : titleStyle(
                              size: 18.0,
                              color: defaultOrangeColor.shade300,
                            ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                child: Row(
                  children: [
                    Expanded(
                      child: ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: children,
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      child: ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: children2,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: defaultButton(
                  width: 150,
                  function: () {
                    if(gpaControllers.length == 0){

                    }
                    for (int j = 0; j < fieldCount; j++) {
                      if (gpaControllers[j].text.toString() != "") {
                        semesterHours += double.parse(
                            creditControllers[j].text.toString());
                        if (double.parse(gpaControllers[j].text.toString()) >= 1.0) {
                          semesterPoints +=
                              (double.parse(gpaControllers[j].text.toString()) *
                                  double.parse(
                                      creditControllers[j].text.toString()));
                        }
                      }
                    }
                    res = (semesterPoints / semesterHours);
                    //print(semesterHours.toString());
                    //print(semesterPoints.toString());
                    print(semesterPoints / semesterHours);
                    if(cumulativeGPA.text.toString() != "" && creditsEarned.text.toString() != ""){
                      cumulativeGpa = (
                          (
                              (
                                  double.parse(cumulativeGPA.text.toString())
                                  *
                                  double.parse(creditsEarned.text.toString())
                              )
                              +
                              semesterPoints
                          )
                          /
                          (double.parse(creditsEarned.text.toString())+semesterHours)
                      );
                    }
                    //print((double.parse(cumulativeGPA.text.toString())+2).toString());
                    setState(() {
                      res = res;
                      cumulativeGpa = cumulativeGpa;
                    });
                    if(res.isNaN){
                      showToast('Please Enter your GPA and credit\.', ToastStates.Warning);
                    }
                  },
                  text: isArabic ? 'احسب' : 'CALCULATE',
                ),
              ),
              // ignore: unnecessary_string_interpolations
              heightSpace(),
              heightSpace(),
              Text(
                isArabic
                    ? "المعدل الاكاديمي : ${res.toStringAsFixed(2)}"
                    : "Semester GPA: ${res.toStringAsFixed(2)}",
                style: isArabic
                    ? arTitleStyle(
                        size: 20,
                        color: semesterPoints == 0 && semesterHours == 0
                            ? Colors.white.withOpacity(0)
                            : defaultOrangeColor,
                      )
                    : titleStyle(
                        size: 20,
                        color: semesterPoints == 0 && semesterHours == 0
                            ? Colors.white.withOpacity(0)
                            : defaultOrangeColor,
                      ),
              ),
              Text(
                isArabic
                    ? "المعدل الاكاديمي : ${cumulativeGpa.toStringAsFixed(2)}"
                    : "Cumulative GPA: ${cumulativeGpa.toStringAsFixed(2)}",
                style: isArabic
                    ? arTitleStyle(
                  size: 20,
                  color: cumulativeGpa == 0
                      ? Colors.white.withOpacity(0)
                      : defaultOrangeColor,
                )
                    : titleStyle(
                  size: 20,
                  color: cumulativeGpa == 0
                      ? Colors.white.withOpacity(0)
                      : defaultOrangeColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    fieldCount = widget.initialCount;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didUpdateWidget(GPACalculator oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  } // convert to a list
}


  /*alert()  {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title:  const Text('Please enter number of courses to calculate GPA'),
          actions: <Widget>[
            FlatButton(
              child:  const Icon(Icons.clear,size: 40.0,),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}*/