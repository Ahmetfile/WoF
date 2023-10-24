import QtQuick 6.2

Item {

    Ad_Display{

        // Creates top banner in the app
        id:bannertext2
        w:parent.width*0.85
        h:parent.height*0.07
        x:parent.width*0.15
        y:parent.height*0
        displaycolor: "maroon"
        bordercolor: "maroon"
        displayradius: 0
        displaytext: "Essen eintragen"
        displaytextsize: bannertext2.h*0.40
    }


    // Unfortunately the ListModel in Ad_Drawermenu.qml doesn't allow the properties to be anything except literal "" strings.
    // So can't save current loaded page in a string property like property item2string: "black" and let the ListElements be
    // variables like  ListElement{menupoint:"Essen eintragen";itemcolor:item2string;imagesource:"esseneintragen.svg"}.
    // It can only insert literal strings.
    // There is a (ugly) solution. Take the Code of Ad_Drawermenu and paster it directly here instead of instanciating like here now.
    // This way one could just write the strings in ListModel here like it should be shown after drawermenu is shown.
    // And so accordingly in every page qml file also pasting the Ad_Drawermenu code and writing the needed strings in ListModel.
    // For now to keep code clear, it is not chosen to do so.
    Ad_Drawermenu{
    }
}
