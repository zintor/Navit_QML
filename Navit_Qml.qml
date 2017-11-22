import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
import "common"
import "pages"

ApplicationWindow {
    id: window
    width: 360
    height: 520
    visible: true
    title: "Navit"

    Loader { id: pageLoader }

    FloatingActionButton {
        z: 1
        anchors.margins: 16
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        imageSource: "qrc:/images/world-1.png"
        opacity: stackView.depth > 1 ? 0.1 : 1

        onClicked: {
            stackView.pop(null)
            stackView.push("qrc:/pages/MapPage.qml")
            }
        }

    header: ToolBar {
        background: Rectangle {
            color: "brown"
        }

        RowLayout {
            spacing: 20
            anchors.fill: parent

            ToolButton {
                contentItem: Image {
                    fillMode: Image.Pad
                    horizontalAlignment: Image.AlignHCenter
                    verticalAlignment: Image.AlignVCenter
                    source: stackView.depth > 1 ? "images/back.png" : "images/drawer.png"
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
                text: qsTr("Navit - Open Source Navigation")
                font.pixelSize: 12
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
                    MenuItem {
                        text: "Team"
                        onTriggered: teamDialog.open()
                    }

                }
            }
        }
    }
    

    Drawer {
        id: drawer
        width: Math.min(window.width, window.height) / 3 * 2
        height: window.height
        dragMargin: stackView.depth > 1 ? 0 : undefined

        DrawerListModel {
          id: drawerModel
        }

        ListView {
          id: listView
          anchors.fill: parent
          anchors.topMargin: 20
          anchors.leftMargin: 10
          model: drawerModel
          delegate: DrawerDelegate { }
          spacing: 10
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

    Popup {
        id: teamDialog
        modal: true
        focus: true
        x: (window.width - width) / 2
        y: window.height / 6
        width: Math.min(window.width, window.height) / 3 * 2
        contentHeight: aboutColumn.height

        Column {
            id: teamColumn
            spacing: 20

            Label {
                text: "Navit - The team"
                font.bold: true
                font.pixelSize: 12
            }

            Label {
                width: teamDialog.availableWidth
                text: "Martin Schaller (Project manager and contact for commercial inquiries): \n\n"
                     + "cp15@navit-project.org \n\n"
                      + "Michael Farmbauer \n\n"
                      + "horwitz@navit-project.org \n\n"
                      + "Pierre Grandin \n\n"
                      + "kazer@navit-project.org \n\n"
                      + "Nick Geoghegan (Press & Media): \n\n"
                      + "number6@navit-project.org \n\n"

                wrapMode: Label.Wrap
                font.pixelSize: 12
            }

        }
    }

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: pageOne
    }
        Component {
            id: pageOne
            HomePage {
            }
        }
}
