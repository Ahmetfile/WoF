// This is an abstraction for a display, which displaces things like results, inputs, properties etc.
import QtQuick 6.2

Item {
    id:displayresult

    property double w: 0
    property double h: 0
    property double xPos: 0
    property double yPos: 0
    property double borderthickness: displaybody.height*0.01
    property string bordercolor: "white"
    property string displaycolor: Qt.rgba(87/255, 87/255, 87/255, 1.0)
    property string displaytext
    property string displaytextcolor: "white"
    property double displaytextsize: displaybody.height*0.25
    property double displayradius : displayresult.w*0.10

    Rectangle{

        id: displaybody
        color: displayresult.displaycolor
        width: displayresult.w
        height: displayresult.h
        x: displayresult.xPos
        y: displayresult.yPos
        radius: displayradius

        border{
            width: displayresult.borderthickness
            color: displayresult.bordercolor
        }

        Text {
            id: displaytexttext
            text: displayresult.displaytext
            anchors.centerIn: parent
            color: displayresult.displaytextcolor
            font.pixelSize: displaytextsize
        }
    }
}
