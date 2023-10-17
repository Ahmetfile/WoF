import QtQuick 6.2

Item {

    id:screensize
    // need anchors.fill: parent if you want to import to the App.qml via calling Ad_drawermenu{}
    // correctly.
    anchors.fill: parent

    // Button to open menu
    Rectangle{

        id:drawermenubutton
        width: parent.width*0.15
        height: parent.height*0.07
        x:parent.width*0
        y:parent.height*0
        color: "maroon"

        MouseArea{
            visible: drawermenupage.x !=0
            anchors.fill: drawermenubutton

            onEntered: {

                draweranimation.start()
                darker.start()
            }
        }
    }

    MouseArea {
        visible: drawermenupage.x == 0 // makes it only visible if menu has been opened

        width: parent.width - drawermenupage.width // the area next to the drawn out menu, needed to close menu
        height: parent.height
        x: drawermenupage.width
        y: 0

        onEntered: {
            drawercloseanimation.start()
            brighter.start()
        }
    }

    // Transparent layer that darkens the layer beneath the menu to show that menu is now on focus
    Rectangle{

        id:transparencyscreen
        visible: drawermenupage.x !=-width
        width: parent.width
        height: parent.height
        x:0
        y:0
        z:99
        color: "black"
        opacity: 0 // allows to adjust the transparency

        PropertyAnimation{

            id:darker
            target: transparencyscreen
            property: "opacity"
            from: 0
            to:0.55
            duration: 250
        }

        PropertyAnimation{

            id:brighter
            target: transparencyscreen
            property: "opacity"
            from: 0.55
            to: 0
            duration: 250
        }
    }


    //This code regulates the actual page of the menu
    Rectangle{

        id:drawermenupage
        width: parent.width*0.75
        height: parent.height
        x:-width
        y:0
        z:100
        color: "maroon"

        // This is the invisible smaller square left to the name of the menupoint/Listelement
        // where the icons will be placed. As of now only done with menupoint 2 (third listElelment)
        Rectangle{
            id:item2
            width: drawermenupage.width*0.20
            height: drawermenupage.height*(3/20)*(screensize.width/screensize.height)
            x: drawermenupage.width*0.05
            // every icon is placed here via adding 0.10 to height*0.10, like height*0.10, height*0.20 etc.
            y:drawermenupage.height*0.20+(drawermenupage.height*0.10 - item2.height)/2
            z:101
            color: "transparent"

            Image {
                id: tagesuebersichtimage
                anchors.fill: parent
                source: "tagesuebersicht.svg" // loading vector image
                // setSourceSize.width/height: parent.witdh/height is explicitly needed.
                sourceSize.width: parent.width
                sourceSize.height: parent.height
            }
        }

        PropertyAnimation{

            id:draweranimation
            target: drawermenupage
            property: "x"
            from: -width
            to: 0
            duration: 250
        }

        PropertyAnimation{

            id:drawercloseanimation
            target: drawermenupage
            property: "x"
            from: 0
            to: -width
            duration: 250
        }

        // This following code deals with placing the menupoint in a ListView. They are define in
        // a ListModel beforehand where ListView takes the data in the ListModel to build the list

        ListModel{
            id:modelmenu

            ListElement{menupoint:"World of Food";itemcolor:"maroon"}
            ListElement{menupoint:"Tagesübersicht";itemcolor:"black"}
            ListElement{menupoint:"Essen eintragen";itemcolor:"maroon"}
            ListElement{menupoint:"Gericht erstellen";itemcolor:"maroon"}
            ListElement{menupoint:"Diät festlegen";itemcolor:"maroon"}
            ListElement{menupoint:"Mein Journal";itemcolor:"maroon"}
            ListElement{menupoint:"Entdecken";itemcolor:"maroon"}
            ListElement{menupoint:"Mein Feed";itemcolor:"maroon"}
            ListElement{menupoint:"Datenbank";itemcolor:"maroon"}
            ListElement{menupoint:"App Info";itemcolor:"maroon"}
        }

        ListView{

            id:listmenupoints
            anchors.fill: parent
            interactive: false
            model:modelmenu
            // delegate is a templet or pattern that is used for every element in the list.
            // This means that the same Component-element is repeated for every Listelement
            // so that they share the same ground attributes and can be specified via the properties
            // in the ListElement{}.
            delegate:
                Component{

                    Item{
                        id:menupointdisplay
                        width: parent.width
                        height: drawermenupage.height*0.10

                        Rectangle{
                            id:menupointbody
                            width: parent.width
                            height:parent.height
                            color: itemcolor

                            Text{
                                text: menupoint
                                anchors.verticalCenter: parent.verticalCenter
                                x: drawermenupage.width*0.30
                                color: "white"
                                font.pixelSize: menupointdisplay.height*0.25
                            }

                            // This code segment deals with highlighting the chosen menupoint
                            MouseArea {


                                anchors.fill: parent
                                onClicked: {
                                    model.currentIndex = index
                                    if(index!==0){
                                        modelmenu.setProperty(index,"itemcolor","black")

                                        if(index===0){
                                        modelmenu.setProperty(index,"itemcolor","maroon")
                                        }
                                        if(index!==1){
                                            modelmenu.setProperty(1,"itemcolor","maroon")
                                        }
                                        if(index!==2){
                                            modelmenu.setProperty(2,"itemcolor","maroon")
                                        }
                                        if(index!==3){
                                            modelmenu.setProperty(3,"itemcolor","maroon")
                                        }
                                        if(index!==4){
                                            modelmenu.setProperty(4,"itemcolor","maroon")
                                        }
                                        if(index!==5){
                                            modelmenu.setProperty(5,"itemcolor","maroon")
                                        }
                                        if(index!==6){
                                            modelmenu.setProperty(6,"itemcolor","maroon")
                                        }
                                        if(index!==7){
                                            modelmenu.setProperty(7,"itemcolor","maroon")
                                            }
                                        if(index!==8){
                                            modelmenu.setProperty(8,"itemcolor","maroon")
                                        }
                                        if(index!==9){
                                            modelmenu.setProperty(9,"itemcolor","maroon")
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

    Rectangle{

        id:drawermenu1stick
        width:drawermenubutton.width*0.5
        height: drawermenubutton.height*0.06
        x:parent.width*0.15*0.25
        y:parent.height*0.07*0.30
        color: "white"
        radius: drawermenu1stick.width*0.08
    }

    Rectangle{

        id:drawermenu2stick
        width:drawermenubutton.width*0.5
        height: drawermenubutton.height*0.06
        x:parent.width*0.15*0.25
        y:parent.height*0.07*0.47
        color:"white"
        radius: drawermenu2stick.width*0.08
    }

    Rectangle{

        id:drawermenu3stick
        width:drawermenubutton.width*0.5
        height: drawermenubutton.height*0.06
        x:parent.width*0.15*0.25
        y:parent.height*0.07*0.64
        radius: drawermenu3stick.width*0.08
    }
}
