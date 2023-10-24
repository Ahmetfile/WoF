// This code regulates the drawermenu that opens after the user clicks on the menu button in the
// upper left corner.
// The icons were created by me thorugh the usage of "Inkscape"

import QtQuick 6.2
import QtQuick.Controls 2.15

Item {

    id:screensize
    // need anchors.fill: parent if you want to import to the App.qml via calling Ad_drawermenu{}
    // correctly.

    // Need those to let drawermenu know which menupoint to highlight via insertion in the ListElement





    anchors.fill: parent

    // Button to open menu
    Rectangle{

        id:drawermenubutton
        width: parent.width*0.15
        height: parent.height*0.07
        x:parent.width*0
        y:parent.height*0
        color: "maroon"

        // Drawermenu symbol that is widely recognized
        Image {
            id: drawermenubuttonimage
            anchors.fill: parent
            source: "drawermenubuttonimage.svg"
            sourceSize.width: parent.width
            sourceSize.height: parent.height
        }

        MouseArea{
            id:maone
            visible: drawermenupage.x !=0 // this mouseArea is visible if menupage is open
            anchors.fill: drawermenubutton

            onEntered: {

                draweranimation.start() // starts drawermenu animation (defined further below)
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
        visible: drawermenupage.x !=-width // darkening of screen under menupage will only start
        // being visible after the x positon of the menupage starts changing to the right.
        width: parent.width
        height: parent.height
        x:0
        y:0
        z:99
        color: "black"
        opacity: 0 // allows to adjust the transparency

        // smooth darkening animation after menupage comes out
        PropertyAnimation{

            id:darker
            target: transparencyscreen
            property: "opacity"
            from: 0
            to:0.55
            duration: 250
        }

        // smooth lightening animation after menupages goes away
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

        //The following 9 rectangles are the invisible smaller squares left to the name of the
        //menupoints/Listelements where the icons will be placed. They are needed to fill the icons in them.



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

            ListElement{menupoint:"World of Food";itemcolor:"maroon";}
            ListElement{menupoint:"Tagesübersicht";itemcolor:"black";imagesource:"tagesuebersicht.svg"}
            ListElement{menupoint:"Essen eintragen";itemcolor:"maroon";imagesource:"esseneintragen.svg"}
            ListElement{menupoint:"Gericht erstellen";itemcolor:"maroon";imagesource:"gerichterstellen.svg"}
            ListElement{menupoint:"Diät festlegen";itemcolor:"maroon";imagesource:"diaetfestlegen.svg"}
            ListElement{menupoint:"Mein Journal";itemcolor:"maroon";imagesource:"meinjournal.svg"}
            ListElement{menupoint:"Entdecken";itemcolor:"maroon";imagesource:"entdecken.svg"}
            ListElement{menupoint:"Mein Feed";itemcolor:"maroon";imagesource:"meinfeed.svg"}
            ListElement{menupoint:"Datenbank";itemcolor:"maroon";imagesource:"datenbank.svg"}
            ListElement{menupoint:"App Info";itemcolor:"maroon";imagesource:"info.svg"}
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

                        signal stackorder

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

                            Rectangle{
                                id:rectangleimage
                                width: drawermenupage.width*0.20
                                height: drawermenupage.height*(3/20)*(screensize.width/screensize.height)
                                x: drawermenupage.width*0.05
                                anchors.verticalCenter: parent.verticalCenter
                                z:101
                                color: "transparent"

                                Image{
                                    id: iconimage
                                    anchors.fill: parent
                                    source: imagesource
                                    sourceSize.width: parent.height
                                    sourceSize.height: parent.width
                                }
                            }


                            // This code segment deals with highlighting the chosen menupoint
                            MouseArea {
                                id:matwo

                                anchors.fill: parent


                                onClicked: {


                                    model.currentIndex = index

                                    // Here the actual pages corresponding to the menupoint that has been
                                    // clicked are coded to open via the replace methode. The reason
                                    // why no push methode is used, is because this app does not need
                                    // the befinits of that methode since there is no "pages history"
                                    // This in turn makes the pop methode also redundant because
                                    // replace only works with one layer to begin with that is replaced
                                    // each time a menupoint in the drawermenu is clicked.


                                    if(index!==0){

                                        if(index===1){
                                            stackview.pop()
                                            stackview.push("Ad_Tagesuebersicht.qml")
                                        }
                                        if(index===2){
                                            stackview.pop()
                                            stackview.push("Ad_Esseneintragen.qml")
                                        }
                                        if(index===3){
                                            stackview.pop()
                                            stackview.push("Ad_Gerichterstellen.qml")
                                        }
                                        if(index===4){
                                            stackview.pop()
                                            stackview.push("Ad_Diaetfestlegen.qml")
                                        }
                                        if(index===5){
                                            stackview.pop()
                                            stackview.push("Ad_Meinjournal.qml")
                                        }
                                        if(index===6){
                                            stackview.pop()
                                            stackview.push("Ad_Entdecken.qml")
                                        }
                                        if(index===7){
                                            stackview.pop()
                                            stackview.push("Ad_Meinfeed.qml")
                                        }
                                        if(index===8){
                                            stackview.pop()
                                            stackview.push("Ad_Datenbank.qml")
                                        }
                                        if(index===9){
                                            stackview.pop()
                                            stackview.push("Ad_Appinfo.qml")
                                        }
                                        modelmenu.setProperty(index,"itemcolor","black")

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

}
