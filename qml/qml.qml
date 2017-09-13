import QtQuick 2.0
import QtQuick.Controls 1.4

Rectangle {
    property alias idListView: idListView

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
                    if ((idEditLine.champNom && idEditLine.champPrenom && idEditLine.champAge) // champs non nuls
                            && (idEditLine.champNom !== idEditLine.champPrenom)) // Nom != Prénom
                    {
                        Context.sendActionToCpp("ajouterLigne", idEditLine.champNom + ";" + idEditLine.champPrenom + ";" + idEditLine.champAge);
                        idEditLine.champNom = "";
                        idEditLine.champPrenom = "";
                        idEditLine.champAge = "";
                    }
                }
            }

            Button {
                text : "Modifier"
                onClicked : {
                    Context.sendActionToCpp("modifier", idEditLine.champNom + ";" + idEditLine.champPrenom + ";" + idEditLine.champAge, idListView.clicIndex);
                    idEditLine.champNom = "";
                    idEditLine.champPrenom = "";
                    idEditLine.champAge = "";
                }
            }

            Button {
                text : "Supprimer"
                onClicked : {
                    Context.sendActionToCpp("supprimer", "", idListView.clicIndex);
                    idEditLine.champNom = "";
                    idEditLine.champPrenom = "";
                    idEditLine.champAge = "";
                }
            }
        }

        ListView {
            id : idListView

            property alias clicIndex: idListView.currentIndex

            y : 200

            width : 400
            height : 400
            model : UnModelARenseigner
            delegate : MonDelegate {
                property string lesDonnees : modelData

                onLesDonneesChanged : {
                    var tab = lesDonnees.split(";")
                    champNomDelegate = tab[0];
                    champPrenomDelegate = tab[1];
                    champAgeDelegate = tab[2];
                }
                MouseArea {
                    anchors.fill : parent
                    onClicked : {
                        idListView.currentIndex = index;

                        idEditLine.champNom = champNomDelegate;
                        idEditLine.champPrenom = champPrenomDelegate;
                        idEditLine.champAge = champAgeDelegate;
                    }
                }
            }
            highlight : Rectangle {
                z : 2
                width : 3
                height : 3
                color : "#0000ff"
                opacity : 0.1
            }
        }
    }
}
