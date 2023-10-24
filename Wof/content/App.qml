// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

// This will be a fitness app that counts your calory intake as well as disecting it into the basic
// energy components protein, carbs and fats.

import QtQuick 6.2
import QtQuick.Window


Window {

    visible: true
    color: "black"




    Loader{

        id:pageloader
        anchors{
            left: parent.left
            right: parent.right
            top: parent.top
            bottom: parent.bottom
        }

        source: "Ad_Stackview.qml"
    }



}
