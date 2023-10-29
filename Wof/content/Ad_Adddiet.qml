// This qml file will be used to dynamically create diets in the Ad_Diaetfestlegen.qml file

import QtQuick 6.2

Item {
    id:diet
    property double w
    property double h
    property double xPos
    property var yPos
    property string dietname: "Standard-Diät"
    property string kalorien: "2000 kcal"
    property string eiweiß: "146g"
    property string kohlenhydrate: "220g"
    property string fett: "53g"

    signal clicked()
    signal deletion()

    Rectangle{
        id:dietoverview
        width: w
        height: h
        x: xPos
        y: yPos
        z: 0
        color: "maroon"
        radius: dietoverview.width*0.02

        border{
            color: "white"
            width: dietoverview.width*0.003
        }


        // Regulates the dietname
        Rectangle{
            id:dietnamerec
            anchors.left: parent.left
            anchors.top: parent.top
            width: parent.width*0.80
            height: parent.height*0.20
            color: "transparent"

            Text {
                anchors.verticalCenter: parent.verticalCenter
                x: parent.width*0.03
                text: dietname // will take on user's set name for his/her diet
                color: "white"
                font.pixelSize: dietoverview.height*0.15

            }
        }

        Rectangle{
            id:caloryrec
            anchors.left: parent.left
            anchors.top: dietnamerec.bottom
            width: parent.width*0.80
            height: parent.height*0.20
            color: "transparent"

            Text{
                anchors.top: parent.top
                x: parent.width*0.03
                text: "Kalorien: "+kalorien // will take on user's set colories for his/her diet
                color: "white"
                font.pixelSize: dietoverview.height*0.15

            }
        }

        Rectangle{
            id:proteinrec
            anchors.left: parent.left
            anchors.top: caloryrec.bottom
            width: parent.width
            height: parent.height*0.20
            color: "transparent"

            Text{
                anchors.top: parent.top
                x: parent.width*0.03
                text: "Eiweiß: "+eiweiß // will take on user's set proteins amount for his/her diet
                color: "white"
                font.pixelSize: dietoverview.height*0.13
            }
        }

        Rectangle{
            id:carbsrec
            anchors.left: parent.left
            anchors.top: proteinrec.bottom
            width: parent.width*0.75
            height: parent.height*0.20
            color: "transparent"

            Text{
                anchors.top: parent.top
                x: parent.width*0.03
                text: "Kohlenhydrate: "+kohlenhydrate // will take on user's set carbs for his/her diet
                color: "white"
                font.pixelSize: dietoverview.height*0.13
            }
        }

        Rectangle{
            id:fatrec
            anchors.left: parent.left
            anchors.top: carbsrec.bottom
            width: parent.width
            height: parent.height*0.20
            color: "transparent"

            Text{
                anchors.top: parent.top
                x: parent.width*0.03
                text: "Fett: "+fett // will take on user's set fats for his/her diet
                color: "white"
                font.pixelSize: dietoverview.height*0.13
            }
        }

        Rectangle{
            id:activationbox
            width: dietoverview.width*0.10
            height: dietoverview.width*0.10
            anchors.left: caloryrec.right
            anchors.bottom: proteinrec.top
            color: Qt.rgba(59/255,59/255,59/255)
            radius: dietoverview.width*0.005
            border{
                color: "white"
                width: dietoverview.width*0.002
            }

            Image {
                id: haken
                visible: false
                anchors.fill: parent
                sourceSize.width: parent.width
                sourceSize.height: parent.height
                source: "haken.svg"
            }

            MouseArea{
                id:mAimage
                anchors.fill: parent

                onClicked: {
                    haken.visible = true
                }
            }
        }

        Text{
            text: "Aktiv"
            color: "white"
            anchors.bottom: activationbox.top
            anchors.left: caloryrec.right
            font.pixelSize: activationbox.width*0.40

        }

        Ad_Button{
            w: parent.width*0.18
            h: parent.height*0.18
            anchors.left: carbsrec.right
            anchors.top: proteinrec.bottom
            buttontext: "Löschen"
            bordercolor: "white"
            borderthickness: dietoverview.width*0.002

            onClicked: diet.deletion() // when the Button "Löschen" is clicked, we emit a signal to connect it to a slot
            // with the destroyMyDiet function in order to delete the dynamically created dietview
        }

    }
}
