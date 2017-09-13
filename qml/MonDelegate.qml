import QtQuick 2.0
import QtQuick.Controls 1.4 //TextFields


Item {
    property alias champNomDelegate : idChampNomDelegate.text
    property alias champPrenomDelegate : idChampPrenomDelegate.text
    property alias champAgeDelegate : idChampAgeDelegate.text

    id : root
    height : 40
    width : 485 // à supprimer

    Rectangle {

        Row {
            spacing : 2
            width : 485
            height : 40

            Rect_A {
                id : idChampNomDelegate
                text : "root.champNomDelegate"
            }

            Rect_A {
                id : idChampPrenomDelegate
                text : "root.champPrenomDelegate"
            }

            Rect_A {
                id : idChampAgeDelegate
                text : "root.champAgeDelegate"
            }
        }
    }
}
