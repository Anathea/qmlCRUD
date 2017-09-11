import QtQuick 2.0
import QtQuick.Controls 1.4

Rectangle {
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
                    Context.sendActionToCpp("ajouterLigne", idEditLine.champNom + ";" + idEditLine.champPrenom + ";" + idEditLine.champAge)
                }
            }

            Button {
                text : "Modifier"
                onClicked : console.log("modifier")
            }

            Button {
                text : "Supprimer"
                onClicked : console.log("supprimer")
            }
        }

        ListView {
            y : 200

            width : 400
            height : 400
            model : UnModelARenseigner
            delegate : MonDelegate {
                property string lesDonnees : modelData
                onLesDonneesChanged : {
                    console.log(lesDonnees.split(";"));
                }
            }
        }
    }

    //        color : "papayawhip"
    //        border{width : 1; color : "papayawhip"}
//    var regex = /\S+/g; // \S pour les non-espaces, + pour 1 ou plus, g pour toutes les occurences des \S
//    var result = str.match(regex);
//    if (result === null) {
//        return [];
//    }
}
