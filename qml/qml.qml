import QtQuick 2.0
import QtQuick.Controls 1.4

Rectangle {
    property alias idListView: idListView
    property alias clicIndex: idListView.currentIndex

    width : 400
    height : 400
    color : "lavender"
    id : root
    property int largeurBouton : 140

    Column {
        spacing : 2

        EditLine {
            id : idEditLine
        }

        Row {
            spacing : 20

            Button {
                text : "Ajouter"
                onClicked : {
                    //                    if ((idEditLine.champNom && idEditLine.champPrenom && idEditLine.champAge) // champs non nuls
                    //                            && (idEditLine.champNom !== idEditLine.champPrenom)) // Nom != Prénom
                    //                    {
                    Context.sendActionToCpp("ajouterLigne", idEditLine.champNom + ";" + idEditLine.champPrenom + ";" + idEditLine.champAge);
//                    idEditLine.champNom = "";
//                    idEditLine.champPrenom = "";
//                    idEditLine.champAge = "";
                    //                    }
                }
            }

            Button {
                text : "Modifier"
                onClicked : {
//                    idEditLine.champNom =
                }
            }

            Button {
                text : "Supprimer"
                onClicked : console.log("supprimer")
            }
        }

        ListView {
            id : idListView
            y : 200

            width : 400
            height : 400
            model : UnModelARenseigner
            delegate : MonDelegate {
                property string lesDonnees : modelData
                onLesDonneesChanged : {
                    var t = lesDonnees.split(";")
                    champNom = t[0];
                    champPrenom = t[1];
                    champAge = t[2];

                    console.log("modelData = " + modelData);
                }
                MouseArea {
                    anchors.fill : parent
                    onClicked : {
                        console.log(idListView.currentIndex);
                        idListView.currentIndex = index;
                        console.log(idListView.currentIndex);

                        idEditLine.champNom = idListView.currentItem.champNom;
                        console.log(idListView.currentItem.champNom);
                    }
                }
            }
            highlight : Rectangle {
                z : 2
                width : 120
                height : 20
                color : "#0000ff"
                opacity : 0.1
            }
        }
    }
}
