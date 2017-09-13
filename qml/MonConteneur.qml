import QtQuick 2.7

Rectangle {
    id : root
    property Component contenu

    height : parent.height

    // Le contenu intérieur dynamiquement mis à jour
    onContenuChanged : {
        if (contenu.status == Component.Ready) {
            var cree = contenu.createObject(idContainer);
        }
    }

    border {
        width : 2
        color : "lightgrey"
    }
    color : "lightblue"

    Rectangle {
        id : idContainer
        anchors.margins : 7
        anchors.fill :  parent
        color : "lightblue"
    }
}
