// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

// This will be a fitness app that counts your calory intake as well as disecting it into the basic
// energy components protein, carbs and fats.

import QtQuick 6.2
import QtQuick.Window


Window {

    visible: true
    color: "black"


    // This following code is the specified display code of the abstracted "Ad_Display" code

    Ad_Display{

        // Creates top banner in the app
        id:bannertext
        w:parent.width*0.85
        h:parent.height*0.07
        x:parent.width*0.15
        y:parent.height*0
        displaycolor: "maroon"
        bordercolor: "maroon"
        displayradius: 0
        displaytext: "WoF - Dein Kalorienzähler"
        displaytextsize: bannertext.h*0.40
    }

    Ad_Display{

        // Not final design, but basically explains the purpose of the page "Tagesübersicht"
        id:welcometext
        w:parent.width*0.94
        h:parent.height*0.13
        x:parent.width*0.03
        y:parent.height*0.09
        displaycolor: Qt.rgba(59/255,59/255,59/255)
        displayradius: welcometext.w*0.10
        bordercolor: "white"
        displaytext: "Willkommen bei World of Food! \nHier kannst du deinen Fortschritt sehen. \nDeine Tagesübersicht:"
        displaytextsize: welcometext.h*0.18
    }


    Ad_Display{

        // "home" stands for the home page and "kalorientext" that it is the text(box) of the displayed "Kalorien"
        // text

        id:homekalorientext
        w:parent.width*0.26
        h:parent.height*0.04
        xPos:parent.width*0.03
        yPos:parent.height*0.24
        displaycolor: "black"
        bordercolor: "white"
        displaytext: "Kalorien:"
        displaytextsize: homekalorientext.h*0.65
    }

    // This following code is the specified progressbar code of the abstracted "Ad_Progressbar" code

    Ad_Progressbar{

        id:homekalorienbar
        w:parent.width*0.94
        h:parent.height*0.05
        xPos:parent.width*0.03
        yPos:parent.height*0.30
        w_loading: homekalorienbar.w*0.49
        percentage: "49%"
    }

    // Each progressbar is followed by 3 displays, that represent the intake of that energysource, a splash
    // to separate them and the last one the maximum amount of that energysource that should be taken in
    // declared by the user. So the app can access the first one to adjust meal intake and the third one to
    // declare the maximum through users choice,

    Ad_Display{

        id:homekaloriencounter_nenner
        w:parent.width*0.12
        h:parent.height*0.03
        xPos:parent.width*0.87
        yPos:parent.height*0.36
        displaytext: "2000 / "
        displaycolor: "black"
        bordercolor: "black"
        displaytextsize: homekaloriencounter_nenner.h*0.65
    }


    Ad_Display{

        id:homekaloriencounter_zaehler
        w:parent.width*0.12
        h:parent.height*0.03
        xPos:parent.width*0.74
        yPos:parent.height*0.36
        displaytext: "992"
        displaycolor: "black"
        bordercolor: "black"
        displaytextsize: homekaloriencounter_zaehler.h*0.65
    }


    Ad_Display{

        id:homekaloriencounter_slash
        w:parent.width*0.03
        h:parent.height*0.03
        xPos:parent.width*0.85
        yPos:parent.height*0.36
        displaytext: "/"
        displaycolor: "black"
        bordercolor: "black"
        displaytextsize: homekaloriencounter_slash.h*0.65
    }

    Ad_Display{

        id:homemakrostext
        w:parent.width*0.26
        h:parent.height*0.04
        xPos:parent.width*0.37
        yPos:parent.height*0.40
        displaycolor: "black"
        bordercolor: "white"
        displaytext: "Makros:"
        displaytextsize: homemakrostext.h*0.65
    }

    Ad_Display{

        id:homeeiweißtext
        w:parent.width*0.26
        h:parent.height*0.04
        xPos:parent.width*0.03
        yPos:parent.height*0.46
        displaycolor: "black"
        bordercolor: "white"
        displaytext: "Eiweiß:"
        displaytextsize: homeeiweißtext.h*0.65
    }

    Ad_Progressbar{

        id:homeeiweißbar
        w:parent.width*0.94
        h:parent.height*0.05
        xPos:parent.width*0.03
        yPos:parent.height*0.52
        w_loading: homeeiweißbar.w*0.50
        percentage: "50%"
    }

    Ad_Display{

        id:homeeiweißcounter_nenner
        w:parent.width*0.12
        h:parent.height*0.03
        xPos:parent.width*0.87
        yPos:parent.height*0.58
        displaytext: "146g"
        displaycolor: "black"
        bordercolor: "black"
        displaytextsize: homeeiweißcounter_nenner.h*0.65
    }



    Ad_Display{

        id:homeeiweißcounter_zaehler
        w:parent.width*0.12
        h:parent.height*0.03
        xPos:parent.width*0.74
        yPos:parent.height*0.58
        displaytext: "73g"
        displaycolor: "black"
        bordercolor: "black"
        displaytextsize: homeeiweißcounter_zaehler.h*0.65
    }


    Ad_Display{

        id:homeeiweißcounter_slash
        w:parent.width*0.03
        h:parent.height*0.03
        xPos:parent.width*0.85
        yPos:parent.height*0.58
        displaytext: "/"
        displaycolor: "black"
        bordercolor: "black"
        displaytextsize: homeeiweißcounter_slash.h*0.65
    }

    Ad_Display{

        id:homekohlenhydratetext
        w:parent.width*0.40
        h:parent.height*0.04
        xPos:parent.width*0.03
        yPos:parent.height*0.62
        displaycolor: "black"
        bordercolor: "white"
        displaytext: "Kohlenhydrate:"
        displaytextsize: homekohlenhydratetext.h*0.65
        displayradius: homekohlenhydratetext.w*0.07
    }

    Ad_Progressbar{

        id:homekohlenhydratebar
        w:parent.width*0.94
        h:parent.height*0.05
        xPos:parent.width*0.03
        yPos:parent.height*0.68
        w_loading: homekohlenhydratebar.w*0.50
        percentage: "50%"

    }

    Ad_Display{

        id:homekohlenhydratecounter_nenner
        w:parent.width*0.12
        h:parent.height*0.03
        xPos:parent.width*0.87
        yPos:parent.height*0.74
        displaytext: "220g"
        displaycolor: "black"
        bordercolor: "black"
        displaytextsize: homekohlenhydratecounter_nenner.h*0.65
    }



    Ad_Display{

        id:homekohlenhydratecounter_zaehler
        w:parent.width*0.12
        h:parent.height*0.03
        xPos:parent.width*0.74
        yPos:parent.height*0.74
        displaytext: "110g"
        displaycolor: "black"
        bordercolor: "black"
        displaytextsize: homekohlenhydratecounter_zaehler.h*0.65
    }


    Ad_Display{

        id:homekohlenhydratecounter_slash
        w:parent.width*0.03
        h:parent.height*0.03
        xPos:parent.width*0.85
        yPos:parent.height*0.74
        displaytext: "/"
        displaycolor: "black"
        bordercolor: "black"
        displaytextsize: homekohlenhydratecounter_slash.h*0.65
    }

    Ad_Display{

        id:homefetttext
        w:parent.width*0.26
        h:parent.height*0.04
        xPos:parent.width*0.03
        yPos:parent.height*0.78
        displaycolor: "black"
        bordercolor: "white"
        displaytext: "Fett:"
        displaytextsize: homefetttext.h*0.65
    }

    Ad_Progressbar{

        id:homefettbar
        w:parent.width*0.94
        h:parent.height*0.05
        xPos:parent.width*0.03
        yPos:parent.height*0.84
        w_loading: homefettbar.w*0.49
        percentage: "49%"
    }

    Ad_Display{

        id:homefettcounter_nenner
        w:parent.width*0.12
        h:parent.height*0.03
        xPos:parent.width*0.87
        yPos:parent.height*0.90
        displaytext: "53g"
        displaycolor: "black"
        bordercolor: "black"
        displaytextsize: homefettcounter_nenner.h*0.65
    }



    Ad_Display{

        id:homefettcounter_zaehler
        w:parent.width*0.12
        h:parent.height*0.03
        xPos:parent.width*0.74
        yPos:parent.height*0.90
        displaytext: "26g"
        displaycolor: "black"
        bordercolor: "black"
        displaytextsize: homefettcounter_zaehler.h*0.65
    }


    Ad_Display{

        id:homefettcounter_slash
        w:parent.width*0.03
        h:parent.height*0.03
        xPos:parent.width*0.85
        yPos:parent.height*0.90
        displaytext: "/"
        displaycolor: "black"
        bordercolor: "black"
        displaytextsize: homefettcounter_slash.h*0.65
    }

    // Need to put it here last, because the z values in the Ad_Drawermenu-file cannot put order in right
    // place like when the code of the drawermenu would be here in App.qml
    // This is the specified code of the abstracted "Ad_Drawermenu" code
    Ad_Drawermenu{
    }

}



