import QtQuick 6.2


Item {

    id:basicbutton
    property double w: 0
    property double h: 0
    property double xPos: 0
    property double yPos: 0
    property double borderthickness: buttonbody.height*0.01
    property string normalcolor:Qt.rgba(61/255, 61/255, 61/255, 1.0) // color when button isn't pressed.
    property string onpresscolor: Qt.rgba(87/255, 87/255, 87/255, 1.0) // color while button is being pressed.
    property string bordercolor: Qt.rgba(255/255, 0/255, 0/255, 1.0)
    property string buttontext:"Buttontext"
    property string buttontextcolor: Qt.rgba(255/255, 0/255, 0/255, 1.0)
    property double buttontextsize: buttonbody.height*0.55
    property double buttontextsizeanimation: buttonbody.height*0.40

    signal clicked()
    signal released()


    property alias getMousearea: mA
    // This allows to change the commands that are being excecuted while clicking on the mouse ares
    // for each button individually without forcing the other buttons to do the same.
    // Good, because most buttons have similiar properties but some could need special features
    // which have to be added manually without changing the main Button qml code

    Rectangle{
        id: buttonbody
        width:basicbutton.w
        height:basicbutton.h
        x:basicbutton.xPos
        y:basicbutton.yPos
        color:basicbutton.normalcolor
        radius:basicbutton.w*0.10


        border{
            width:basicbutton.borderthickness
            color:basicbutton.bordercolor
        }

        Text {
            id: buttontext
            anchors.centerIn: parent
            text: basicbutton.buttontext
            color: basicbutton.buttontextcolor
            font.pixelSize: buttontextsize // enables dynamical scaling of buttontextsize.

            PropertyAnimation{

                id:textanimation1
                target: buttontext
                property: "font.pixelSize"
                from: basicbutton.buttontextsize
                to: basicbutton.buttontextsizeanimation
                duration: 300
        }

        PropertyAnimation{

            id:textanimation2
            target: buttontext
            property: "font.pixelSize"
            from: basicbutton.buttontextsizeanimation
            to: basicbutton.buttontextsize
            duration: 300
        }
    }

        MouseArea{
            id:mA
            anchors.fill: buttonbody

            onEntered: {

            buttonbody.color = basicbutton.onpresscolor
            buttontext.color = "white"
            basicbutton.clicked()
            textanimation1.start()
         }

            onReleased: {
                buttonbody.color = normalcolor
                buttontext.color = basicbutton.buttontextcolor
                basicbutton.released()
                textanimation2.start()
            }
        }
    }
}
