// Copyright (c) 2018 Ultimaker B.V.
// Toolbox is released under the terms of the LGPLv3 or higher.

import QtQuick 2.2
import QtQuick.Dialogs 1.1
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

// TODO: Switch to QtQuick.Controls 2.x and remove QtQuick.Controls.Styles

import UM 1.1 as UM

Rectangle {

    width: parent.width
    color: "transparent"
    height: childrenRect.height

    Row
    {
        spacing: 12
        height: childrenRect.height
        width: childrenRect.width
        anchors.left: parent.left
        anchors.leftMargin: UM.Theme.getSize("default_margin").width

        Button
        {
            text: "Plugins"
            style: ButtonStyle
            {
                background: Rectangle
                {
                    color: "transparent"
                    implicitWidth: 96
                    implicitHeight: 48
                    Rectangle
                    {
                        visible: toolbox.viewCategory == "plugin"
                        color: UM.Theme.getColor("primary")
                        anchors.bottom: parent.bottom
                        width: parent.width
                        height: 3
                    }
                }
                label: Text
                {
                    text: control.text
                    color: UM.Theme.getColor("text")
                    font.pixelSize: 15
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }
            }
            onClicked:
            {
                toolbox.filterPackages("type", "plugin")
                toolbox.filterAuthors("type", "plugin")
                toolbox.viewCategory = "plugin"
                toolbox.viewPage = "overview"
            }
        }

        Button
        {
            text: "Materials"
            style: ButtonStyle
            {
                background: Rectangle
                {
                    color: "transparent"
                    implicitWidth: 96
                    implicitHeight: 48
                    Rectangle
                    {
                        visible: toolbox.viewCategory == "material"
                        color: UM.Theme.getColor("primary")
                        anchors.bottom: parent.bottom
                        width: parent.width
                        height: 3
                    }
                }
                label: Text
                {
                    text: control.text
                    color: UM.Theme.getColor("text")
                    font.pixelSize: 15
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }
            }
            onClicked:
            {
                toolbox.filterPackages("type", "material")
                toolbox.filterAuthors("type", "material")
                toolbox.viewCategory = "material"
                toolbox.viewPage = "overview"
            }
        }
    }

    Button
    {
        text: "Installed"
        anchors.right: parent.right
        anchors.rightMargin: UM.Theme.getSize("default_margin").width
        style: ButtonStyle
        {
            background: Rectangle
            {
                color: "transparent"
                implicitWidth: 96
                implicitHeight: 48
                Rectangle {
                    visible: toolbox.viewCategory == "installed"
                    color: UM.Theme.getColor("primary")
                    anchors.bottom: parent.bottom
                    width: parent.width
                    height: 3
                }
            }
            label: Text
            {
                text: control.text
                color: UM.Theme.getColor("text")
                font.pixelSize: 15
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }
        }
        onClicked: toolbox.viewCategory = "installed"
    }
}
