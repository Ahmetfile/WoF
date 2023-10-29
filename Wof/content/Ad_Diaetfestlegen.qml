import QtQuick 6.2

Item {

    id:screensize
    property double yPosAdddiet: parent.height*0.10 // variable to push add button down the app when new diets have been added.
    property var mydiet: null


    // This function creates the instances of Ad_Adddiet dynamically in order to have a more efficient app
    function createMyDiet(){
        if(mydiet===null){
            var component = Qt.createComponent("Ad_Adddiet.qml")
            mydiet= component.createObject(screensize,{"w":parent.width*0.96,"h":parent.height*0.20,"xPos":parent.width*0.02,"yPos":parent.height*0.16})
            if(mydiet !== null){
                mydiet.deletion.connect(destroyMyDiet) // connection signal to a slot
            }
        }
    }

    // This function is to allow the deletion of dietviews that aren't wanted anymore
    function destroyMyDiet(){
        mydiet.destroy()
        mydiet= null
    }

    Ad_Display{

        // Creates top banner in the app
        id:bannertext4
        w:parent.width*0.85
        h:parent.height*0.07
        x:parent.width*0.15
        y:parent.height*0
        displaycolor: "maroon"
        bordercolor: "maroon"
        displayradius: 0
        displaytext: "Diät festlegen"
        displaytextsize: bannertext4.h*0.40
    }

    Rectangle{

        // This is the outer container of the add diet function
        id: adddietbutton
        width: parent.width*0.96
        height: parent.height*0.05
        anchors.horizontalCenter: parent.horizontalCenter
        y: yPosAdddiet
        color: "transparent"

        Rectangle{
            // This is the Rectangle that contains the plus/add symbole
            width: adddietbutton.width*0.07
            height: screensize.height*0.07*0.96*(screensize.width/screensize.height) // this is to always have a rectangle regardless of resolution
            x:parent.width*0.03
            anchors.verticalCenter: parent.verticalCenter
            color: "transparent"

            Image{
                id:addplusdiet
                anchors.fill: parent
                sourceSize.width: parent.width
                sourceSize.height: parent.height
                source: "addsymbole.svg"
            }

            MouseArea{
                id:mAplus
                anchors.fill: parent

                onClicked: createMyDiet() // creating dynamical dietview object
            }
        }

        Rectangle{
            // This Rectangle contains the text
            width: adddietbutton.width*0.25
            height: adddietbutton.height
            x: adddietbutton.width*0.10
            anchors.verticalCenter: parent.verticalCenter
            color: "transparent"

            Text{
                anchors.centerIn: parent
                color: "white"
                text: "Neue Diät"
                font.pixelSize: parent.height*0.40
            }
        }
    }

    Ad_Drawermenu{
    }
}
