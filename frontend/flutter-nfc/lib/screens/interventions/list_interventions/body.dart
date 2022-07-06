import 'package:flutter/material.dart';
import 'package:nfcentralis/components/admin/admin_intervention_card.dart';
import 'package:nfcentralis/components/header.dart';
import 'package:nfcentralis/components/search_widget.dart';
import 'package:nfcentralis/constants.dart';
import 'package:nfcentralis/models_test_debug_solo/interventions.dart';
import 'package:nfcentralis/responsive.dart';

class ListInterventions extends StatefulWidget {
  const ListInterventions({Key? key}) : super(key: key);

  @override
  ListInterventionState createState() => ListInterventionState();
}

class ListInterventionState extends State<ListInterventions> {
  late List interventionListFiltered;
  String query = '';

  @override
  void initState() {
    super.initState();

    interventionListFiltered = interventionList;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            if (Responsive.isDesktop(context))
              const Header(title: "Liste des interventions"),
            const SizedBox(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: Column(
                  children: [
                    SearchWidget(
                        text: query,
                        onChanged: filterList,
                        hintText: "Rechercher"),
                    ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.all(8),
                        separatorBuilder: (BuildContext context, i) =>
                            const SizedBox(height: defaultPadding),
                        itemCount: interventionListFiltered.length,
                        itemBuilder: (BuildContext context, index) {
                          final intervention = interventionListFiltered[index];

                          return buildIntervention(intervention);
                        })
                  ],
                ))
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildIntervention(Intervention intervention) => AdminInterventionCard(
        name: intervention.name!,
        user: intervention.user!.firstName!,
        installation: intervention.installation!.adress! +
            ", " +
            intervention.installation!.zipcode!,
        status: intervention.status!,
        press: () {
          Navigator.pushNamed(context, '/detail-intervention',
              arguments: intervention);
        },
        //pressDelete: () {},
        //pressEdit: () {}
      );

  void filterList(String query) {
    final list = interventionList.where((c) {
      final nameLower = c.name.toLowerCase();
      final userLower = c.user.firstName.toLowerCase();
      final installationLower = c.installation.adress.toLowerCase();
      final searchLower = query.toLowerCase();

      return nameLower.contains(searchLower) ||
          userLower.contains(searchLower) ||
          installationLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      interventionListFiltered = list;
    });
  }
}
