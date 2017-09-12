import QtQuick 2.0
import QtQuick.Controls 1.4 //TextFields

Item {
//    property string textNom : ""
//    property string textPrenom : ""
//    property string textAge: ""

    property string champNom : idNom.text
    property string champPrenom : ""
    property string champAge: ""

    height : 60
    width : 400 // à commenter temporairement

    Rectangle {
        Row {
            spacing : 2
            width : 400
            height : 40

            RectField_A {
                id : idNom
                onTextChanged : {
                    var regex = /;/g;
                    var str = idNom.text;
                    str = str.replace(regex, "");
                    champNom = str;
                    idNom.text = str;
                }
            }

            RectField_A {
                id : idPrenom
                onTextChanged : {
                    var regex = /;/g;
                    var str = idPrenom.text;
                    str = str.replace(regex, "");
                    champPrenom = str;
                    idPrenom.text = str;
                }
            }

            RectField_A {
                id : idAge
                onTextChanged : {
                    var regex = /\D/g;
                    var str = idAge.text;
                    str = str.replace(regex, "");
                    champAge = str;
                    idAge.text = str;
                }
            }
        }
    }
}
