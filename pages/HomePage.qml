import QtQuick 2.0

Rectangle {
    color: "white"
    id: rectangle


    ListModel {
        id: appModel
        ListElement { title: "Search"; imagePath: "qrc:/images/search.png"; target: "qrc:/pages/SearchPage.qml"}
        ListElement { title: "GetHome"; imagePath: "qrc:/images/home-1.png"; target: "qrc:/pages/GetHomePage.qml"}
        ListElement { title: "Around Me"; imagePath: "qrc:/images/location-3.png"; target: "qrc:/pages/AroundMePage.qml"}
        ListElement { title: "Bookmarks"; imagePath: "qrc:/images/document-3.png"; target: "qrc:/pages/BookmarkPage.qml"}
    }

    Text
    {
        id:txtWhoAmI
        width: parent.width
        height: 100
        anchors.fill: parent
        anchors.leftMargin: 10
        anchors.topMargin: 10
        text: "You are on on street xy, postalcode city"
    }

    GridView {
        id: grid
        anchors.fill: parent
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        cellWidth: grid.width/2
        cellHeight: grid.height/2
        focus: true
        model: appModel

        delegate: Item {
            width: grid.width/2; height: grid.height/2

            Image {
                id: icon

                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                source: imagePath
            }
            Text {
                anchors { top: icon.bottom; horizontalCenter: parent.horizontalCenter }
                text: title
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                     parent.GridView.view.currentIndex = index
                     stackView.push(target)
                }
            }
        }
    }
}
