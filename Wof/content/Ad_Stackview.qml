import QtQuick 6.2
import QtQuick.Controls 2.15
Item {
    id:root
    anchors.fill: parent
    property alias stack: stackview

    StackView{
        id:stackview
        anchors.fill: parent
        initialItem: "Ad_Tagesuebersicht.qml"

    }
}
