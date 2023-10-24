import QtQuick 6.2

Item {

    Ad_Display{

        // Creates top banner in the app
        id:bannertext7
        w:parent.width*0.85
        h:parent.height*0.07
        x:parent.width*0.15
        y:parent.height*0
        displaycolor: "maroon"
        bordercolor: "maroon"
        displayradius: 0
        displaytext: "Mein Feed"
        displaytextsize: bannertext7.h*0.40
    }

    Ad_Drawermenu{
    }
}
