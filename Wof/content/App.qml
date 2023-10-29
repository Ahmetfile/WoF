// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

// This will be a fitness app that counts your calory intake as well as disecting it into the basic
// energy components protein, carbs and fats.

import QtQuick 6.2
import QtQuick.Window
import QtQuick.Controls 2.15



Window {

    visible: true
    color: "black"

    // This stacks the pages chosen in the drawermenu via the pop and push commands in the drawermenu.qml
    StackView{
        id:stackedview
        anchors.fill: parent
        initialItem: "Ad_Tagesuebersicht.qml"

        // This code enables a fast and smooth change transition animation for when the pages are swaped/stacked

        popEnter: Transition {
            XAnimator {
                from: (control.mirrored ? -1 : 1) * -control.width
                to: 0
                duration: 15
                easing.type: Easing.InCubic
            }
        }

        popExit: Transition {
            XAnimator {
                from: 0
                to: (control.mirrored ? -1 : 1) * control.width
                duration: 15
                easing.type: Easing.InCubic
            }
        }
    }
}
