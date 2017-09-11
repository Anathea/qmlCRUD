import QtQuick 2.0
import QtQuick.Controls 1.4 //TextFields

Item {
    id : idEditLine

    property alias champNom : idNom.text
    property alias champPrenom : idPrenom.text
    property alias champAge: idAge.text

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
                    console.log(str)
                }
            }

            RectField_A {
                id : idPrenom
                onTextChanged : {
                    var regex = /;/g;
                    var str = idPrenom.text;
                    str = str.replace(regex, "");
                    console.log(str)
                }
            }

            RectField_A {
                id : idAge
                onTextChanged : {
                    var regex = /\D/g;
                    var str = idAge.text;
                    str = str.replace(regex, "");
                    console.log(str)
                }
            }
        }
    }
}
