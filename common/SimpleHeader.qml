import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0

ToolBar {
    Material.foreground: "white"
    id: titleToolBar
    property alias text: titleLabel.text

    RowLayout {
        spacing: 20
        anchors.fill: parent

        ToolButton {
            contentItem: Image {
                fillMode: Image.Pad
                horizontalAlignment: Image.AlignHCenter
                verticalAlignment: Image.AlignVCenter
                source: stackView.depth > 1 ? "qrc:/images/back.png" : "qrc:/images/drawer.png"
            }
            onClicked: {
                if (stackView.depth > 1) {
                    stackView.pop()
                    listView.currentIndex = -1
                } else {
                    drawer.open()
                }
            }
        }

        Label {
            id: titleLabel
            text: listView.currentItem ? listView.currentItem.text : "Navit"
            font.pixelSize: 16
            elide: Label.ElideRight
            horizontalAlignment: Qt.AlignHCenter
            verticalAlignment: Qt.AlignVCenter
            Layout.fillWidth: true
        }

        ToolButton {
            contentItem: Image {
                fillMode: Image.Pad
                horizontalAlignment: Image.AlignHCenter
                verticalAlignment: Image.AlignVCenter
                source: "qrc:/images/menu.png"
            }
            onClicked: optionsMenu.open()

            Menu {
                id: optionsMenu
                x: parent.width - width
                transformOrigin: Menu.TopRight

                MenuItem {
                    text: "About"
                    onTriggered: aboutDialog.open()
                }
            }
        }
    }



    Popup {
        id: aboutDialog
        modal: true
        focus: true
        x: (window.width - width) / 2
        y: window.height / 6
        width: Math.min(window.width, window.height) / 3 * 2
        contentHeight: aboutColumn.height

        Column {
            id: aboutColumn
            spacing: 20

            Label {
                text: "Navit - Open source navigation"
                font.bold: true
                font.pixelSize: 12
            }

            Label {
                width: aboutDialog.availableWidth
                text: "Navit is a car navigation system with routing engine. \n\n"
                     + "Navit's modular design is capable of using vector maps of various formats for routing "
                     + "and rendering on the screen. It's even possible to use multiple maps at the same time."
                wrapMode: Label.Wrap
                font.pixelSize: 12
            }

            Label {
                width: aboutDialog.availableWidth
                text: "Points of Interest of various formats are displayed on the map. \n\n"
                      + "The current vehicle position is either read from gpsd or directly from NMEA GPS sensors.\n\n"
                      + "The routing engine not only calculates an optimal route to your destination, "
                      + " but also generates directions and even speaks to you using espeak."
                wrapMode: Label.Wrap
                font.pixelSize: 12
            }
        }
    }
} // end ToolBar


