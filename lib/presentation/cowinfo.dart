import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CowInfo extends StatefulWidget {
  const CowInfo({Key? key}) : super(key: key);

  @override
  State<CowInfo> createState() => _CowInfoState();
}

class _CowInfoState extends State<CowInfo> {
  PageController controller =
      PageController(viewportFraction: 1, keepPage: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_outlined),
            onPressed: () {
              context.pop();
            }),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0.9,
        onPressed: () {
          final nextPage = controller.page! + 1;
          if (nextPage < 5) {
            controller.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.ease,
            );
          }
        },
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.arrow_forward,
          color: Colors.black,
        ),
      ),
      body: PageView.builder(
        itemCount: 3,
        controller: controller,
        itemBuilder: (BuildContext context, int itemIndex) {
          if (itemIndex == 0) {
            return firstScreen(context);
          } else if (itemIndex == 1) {
            return secondScreen(context);
          }
          return Column();
        },
      ),
    );
  }

  firstScreen(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            "दुधाळ गाईची काळजी, व्यवस्थापन",
            style: TextStyle(
                color: Colors.black,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
              height: 150.h,
              width: 250.w,
              decoration: const BoxDecoration(),
              child: Image.asset(
                "asset/milkcow.jpg",
                fit: BoxFit.fill,
              )),
          SizedBox(
            height: 30.h,
          ),
          Text(
            "गोठ्यामधे दुधाळ गाईसाठी वेगळी व पुरेशी जागा असावी.गोठ्यातील तळ/जमीन निसरडी नसावी. जमिनीचा उतार १.५ इंच असावा.गव्हाणी चुन्याने रंगवावी, म्हणजे गोचीड व इतर किटक लगेच नजरेस दिसतात.गोठ्यामध्ये व परिसरामध्ये स्वच्छता ठेवावी, हवा खेळती असावी व पुरेसा सूर्यप्रकाश गोठ्यामध्ये असावा.गोठा कोरडा असावा, ओलसरपणामुळे जनावरे आजारी पडू शकतात.ठराविक दिवसानंतर गोठ्यामध्ये जंतुनाशक फवारणी करावी.दुग्धव्यवसाय परवडण्यासाठी दोन वेतांमधील अंतर कमी असणे गरजेचे आहे. तसेच भाकडकाळ २ महिने असावा.गाईच्या पिण्याच्या पाण्यामध्ये ब्लीचिंग पावडर टाकावी, तसेच पाण्याची तपासणी केलेली असावी.",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 18.sp),
          )
        ],
      ),
    );
  }

  secondScreen(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              "स्वच्छ दूध उत्पादन",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold),
            ),
            Container(
                height: 150.h,
                width: 250.w,
                decoration: const BoxDecoration(),
                child: Image.asset(
                  "asset/milkcow.jpg",
                  fit: BoxFit.fill,
                )),
                 SizedBox(
              height: 30.h,
            ),
            Text(
              "दूध काढण्यासाठी वेगळ्या खोलीची व्यवस्था असावी व खोलीचा तळ स्वच्छ असावा.दूध काढताना गाईना हळुवारपणे व काळजीने हाताळावे, पाठीवरून हात फिरवावा.दूध काढण्यासाठी वेळ ठरवून त्यावेळीच दूध काढावे. दूध दिवसातून दोन वेळा काढावे. जास्त दूध देणाऱ्या‍या गाईचे दिवसातून तीन वेळा दूध काढावे.दूध काढण्यासाठी वापरायची भांडी स्वच्छ असावीत.कास धुण्यासाठी कोमट पाण्याचा वापर करावा, तसेच त्यामधे पोटॅशिअम परमॅग्नेट चा वापर करावा.दूध काढणाऱ्या व्यक्तीचे हात स्वच्छ असावेत, हाताला जखमा नसाव्यात, नखे कापलेली असावीत, त्या व्यक्तीस त्वचेचा आजार नसावा व तो धूम्रपान करणारा नसावा.सुरवातीचे दूध काढून टाकून द्यावे कारण त्यामधे जीवणूंचे प्रमाण जास्त असते. ५ ते ७ मिनिटांमधे सगळे दूध काढावे. कासेमधे दूध शिल्लक ठेवू नये त्यामुळे कासदाह होऊ शकतो.",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 18.sp),
            )
          ],
        ),
      ),
    );
  }
}
