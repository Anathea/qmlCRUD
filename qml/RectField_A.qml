import QtQuick 2.0
import QtQuick.Controls 1.4 //TextFields

Rectangle {
    property alias text : idTextF.text

    width : 160
    height : parent.height
    border { width : 2; color : "lightgrey"}
    color : "lightblue"
    y:6
    TextField{
        id : idTextF

        property int a : 8
        x : a
        y : a

        height : parent.height - 2*a
        width : parent.width - 2*a

        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignLeft
    }
}
