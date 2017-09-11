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
                Item {
                    property string lesDonnees : modelData
                    id : root
                    height : 40
                    width : 400 // à supprimer

                    Rectangle {

                        Row {
                            spacing : 2
                            width : 400
                            height : 40

                            Rect_A {
                                text : lesDonnees.split(";")[0]
                            }

                            Rect_A {
                                text : lesDonnees.split(";")[1]
                            }

                            Rect_A {
                                text : lesDonnees.split(";")[2]
                            }
                        }
                    }
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
