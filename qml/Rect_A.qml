import QtQuick 2.0

Rectangle {
    id : root
    property string text

    width : 160
    height : parent.height
    border { width : 2; color : "lightgrey"}
    color : "lightblue"

    Text{
        text : root.text
        x: 10
        height : parent.height
        width : parent.width

        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignLeft
    }
}
