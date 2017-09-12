import QtQuick 2.0
import QtQuick.Controls 1.4 //TextFields

Item {
//    property string textNom : ""
//    property string textPrenom : ""
//    property string textAge: ""

    property alias champNom : idNom.text
    property alias champPrenom : idPrenom.text
    property alias champAge: idAge.text

//    property string champNom : "" // idNom.text
//    property string champPrenom : "" // idPrenom.text
//    property string champAge : "" // idAge.text

    height : 60
    width : 400 // à commenter temporairement

    Rectangle {
        Row {
            spacing : 2
            width : 400
            height : 40

            RectField_A {
                id : idNom
            }

            RectField_A {
                id : idPrenom
            }

            RectField_A {
                id : idAge
                nameTextF.validator: IntValidator {bottom: 0; top: 200;}
            }
        }
    }
}
