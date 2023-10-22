import QtQuick 6.2

Item {

    Window {

        visible: true
        color: "black"

        Ad_Display{

            // Creates top banner of the page
            id:bannertext
            w:parent.width*0.85
            h:parent.height*0.07
            x:parent.width*0.15
            y:parent.height*0
            displaycolor: "maroon"
            bordercolor: "maroon"
            displayradius: 0
            displaytext: "Gericht erstellen"
            displaytextsize: bannertext.h*0.40
        }

        // Need to access the drawermenu from every stacked page. Also placement must be at the bottom
        // of the code for the layers to go underneath eachother like envisioned.
        // One small problem: cannot access ListElement with index 3 via ListModel.set methode, because
        // Qt doesn't allow access to ids of a separate qml file. If now solution is found, Ad_Drawermenu
        // code can be copied and pastes here to ensure access to ListModel id in order to set start
        // color of current menupoint to "black".

        Ad_Drawermenu{
        }
    }
}
