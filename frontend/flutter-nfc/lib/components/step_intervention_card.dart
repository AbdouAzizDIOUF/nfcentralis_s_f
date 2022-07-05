import 'package:flutter/material.dart';
import 'package:nfcentralis/constants.dart';

class StepInterventionCard extends StatelessWidget {
  final int id;
  final String comment;
  final List<String> data;
  final String internal_validation;
  final String validation;
  final VoidCallback pressValidateStep;

  const StepInterventionCard(
      {Key? key,
      required this.id,
      required this.comment,
      required this.data,
      required this.internal_validation,
      required this.validation,
      required this.pressValidateStep})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: secondaryColor,
      clipBehavior: Clip.antiAlias,
      elevation: 16,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("Étape: " + id.toString(),
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                  fontWeight: FontWeight.normal,
                )),
            ListTile(
                leading: const Icon(
                  Icons.comment,
                  color: Colors.white70,
                ),
                title: RichText(
                  text: TextSpan(
                    text: 'Commentaire:\n',
                    style: const TextStyle(
                      fontSize: 8,
                      color: Colors.white70,
                      fontWeight: FontWeight.normal,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: comment,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white70,
                            fontWeight: FontWeight.normal,
                          )),
                    ],
                  ),
                )),
            for (var data in data)
              Stack(children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  height: 48,
                  decoration: BoxDecoration(
                    color: primaryColorLight,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                ListTile(
                  title: TextField(
                    enabled: false,
                    decoration: InputDecoration(
                      errorStyle: const TextStyle(
                          fontSize: 14,
                          color: thirdColor,
                          fontWeight: FontWeight.normal),
                      hintText: data,
                      border: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                    ),
                  ),
                  subtitle: const Text("Données",
                      style: TextStyle(
                        fontSize: 8,
                        color: Colors.white70,
                        fontWeight: FontWeight.normal,
                      )),
                ),
              ]),
            if (validation != "")
              ListTile(
                leading: validation.isEmpty
                    ? const Icon(
                        Icons.assignment_late,
                        color: Colors.redAccent,
                      )
                    : const Icon(
                        Icons.assignment_turned_in,
                        color: Colors.greenAccent,
                      ),
                title: Text(
                    validation.isEmpty ? "Pas encore validé !" : validation,
                    style: TextStyle(
                        fontSize: validation.isEmpty ? 12 : 16,
                        color: Colors.white70,
                        fontWeight: FontWeight.normal,
                        fontStyle: validation.isEmpty
                            ? FontStyle.italic
                            : FontStyle.normal)),
              ),
            if (internal_validation != "")
              ListTile(
                leading: internal_validation.isEmpty
                    ? const Icon(
                        Icons.assignment_late,
                        color: Colors.redAccent,
                      )
                    : const Icon(
                        Icons.assignment_turned_in,
                        color: Colors.greenAccent,
                      ),
                title: Text(
                    internal_validation == ""
                        ? "Pas encore validé par le chef !"
                        : internal_validation,
                    style: TextStyle(
                        fontSize: internal_validation.isEmpty ? 12 : 16,
                        color: Colors.white70,
                        fontWeight: FontWeight.normal,
                        fontStyle: internal_validation.isEmpty
                            ? FontStyle.italic
                            : FontStyle.normal)),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                if (internal_validation == "" && validation == "") ...[
                  TextButton(
                    child: const Text("Prochaine étape"),
                    onPressed: pressValidateStep,
                  ),
                ] else ...[
                  TextButton(
                    child: const Text("Faire valider"),
                    onPressed: pressValidateStep,
                  ),
                ]
              ],
            ),
          ],
        ),
      ),
    );
  }
}
