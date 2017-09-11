import QtQuick 2.0
import QtQuick.Controls 1.4 //TextFields


Item {
    property string champNom: ""
    property string champPrenom: ""
    property string champAge: ""

    id : root
    height : 40
    width : 400 // à supprimer

    Rectangle {

        Row {
            spacing : 2
            width : 400
            height : 40

            Rect_A {
                text : root.champNom
            }

            Rect_A {
                text : root.champPrenom
            }

            Rect_A {
                text : root.champAge
            }
        }
    }
}
