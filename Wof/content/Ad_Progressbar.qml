import QtQuick 6.2


Item {
    id:progressbar

    property double w: 0
    property double h: 0
    property double w_loading: 0
    property double h_loading: 0
    property double xPos: 0
    property double yPos: 0
    property double xPos_loading: 0
    property double yPos_loading: 0
    property double borderthickness: progressbackground.height*0.01
    property string bordercolor: "white"
    property string backgroundcolor: "black"
    property string loadingbarcolor: "green"
    property string percentagetextcolor: "white"
    property string percentage:"0%"
    property double percentagetextsize: progressbackground.height*0.50
    property double progressbarradius : progressbar.w*0.04




    Rectangle{
        id: progressbackground
        color: progressbar.backgroundcolor
        width: progressbar.w
        height: progressbar.h
        x: progressbar.xPos
        y: progressbar.yPos
        radius: progressbar.progressbarradius

        border{
            width: progressbar.borderthickness
            color: progressbar.bordercolor
        }


        Rectangle{

            id:loadingbar
            //Just leave positions x,y and width and height of a rectangle inside another rectangle empty
            // and the inner rectangle automatically fills the outer one.
            color: progressbar.loadingbarcolor
            width: progressbar.w_loading
            height: progressbar.h
            radius: progressbar.progressbarradius

        }

        Text{

            id:progressbartext
            text: progressbar.percentage
            anchors.centerIn: parent
            color: progressbar.percentagetextcolor
            font.pixelSize: progressbar.percentagetextsize
        }

    }

}

