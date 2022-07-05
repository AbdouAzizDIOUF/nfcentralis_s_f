import 'package:flutter/material.dart';
import 'package:nfcentralis/components/header.dart';
import 'package:nfcentralis/components/loading_spinner.dart';
import 'package:nfcentralis/components/step_intervention_card.dart';
import 'package:nfcentralis/constants.dart';
import 'package:nfcentralis/models_test_debug_solo/etape.dart';
import 'package:nfcentralis/models_test_debug_solo/interventions.dart';
import 'package:nfcentralis/responsive.dart';
import 'package:xml/xml.dart';

class DetailIntervention extends StatefulWidget {
  final Intervention intervention;
  const DetailIntervention({
    Key? key,
    required this.intervention,
  }) : super(key: key);

  @override
  DetailInterventionState createState() => DetailInterventionState();
}

class DetailInterventionState extends State<DetailIntervention> {
  @override
  void initState() {
    super.initState();
  }

  Future<List<Etape>> getInterventionStepFromXML(BuildContext context) async {
    String xmlString = await DefaultAssetBundle.of(context)
        .loadString("assets/data/maintenance_chaudiere.xml");

    var raw = XmlDocument.parse(xmlString);
    var steps = raw.findAllElements("step");

    return steps
        .map((element) => Etape(
            id: int.parse(element.attributes.first.value),
            comment: element.getElement("comment")?.text,
            data: element
                .findAllElements("data")
                .map((data) => data.text)
                .toList(),
            internal_validation:
                element.getElement("internal_validation")?.text,
            validation: element.getElement("validation")?.text))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        children: [
          if (Responsive.isDesktop(context))
            Header(title: widget.intervention.name!),
          const SizedBox(),
          FutureBuilder<List<Etape>>(
              future: getInterventionStepFromXML(context),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Etape>? step = snapshot.data;

                  return ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (BuildContext context, i) =>
                        const SizedBox(height: defaultPadding),
                    itemCount: step!.length,
                    itemBuilder: (context, index) {
                      final etape = step[index];
                      return buildStep(etape);
                    },
                  );
                }
                {
                  return const Center(child: LoadingSpinner());
                }
              }),
        ],
      ),
    ));
  }

  Widget buildStep(Etape etape) => StepInterventionCard(
        id: etape.id!,
        comment: etape.comment!,
        data: etape.data ?? [""].toList(),
        validation: etape.validation ?? "",
        internal_validation: etape.internal_validation ?? "",
        pressValidateStep: () {},
        //pressDelete: () {},
        //pressEdit: () {}
      );
}
