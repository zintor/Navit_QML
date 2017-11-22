import QtQuick 2.0

Rectangle {
    color: "white"
    id: rectangle



    ListModel {
        id: homepageModel
        ListElement { title: "Back to Map"; imagePath: "qrc:/images/ic_map_24px.svg"; target: "qrc:/pages/SearchPage.qml"}
        ListElement { title: "Homepage2"; imagePath: "qrc:/images/ic_search_24px.svg"; target: "qrc:/pages/HomePage2.qml"}
        ListElement { title: "Search"; imagePath: "qrc:/images/ic_search_24px.svg"; target: "qrc:/pages/SearchPage.qml"}
        ListElement { title: "GetHome"; imagePath: "qrc:/images/home-1.svg"; target: "qrc:/pages/GetHomePage.qml"}
        ListElement { title: "Around Me"; imagePath: "qrc:/images/ic_near_me_24px.svg"; target: "qrc:/pages/AoundMePage.qml"}
        ListElement { title: "Bookmarks"; imagePath: "qrc:/images/ic_collections_bookmark_24px.svg"; target: "qrc:/pages/BookmarkPage.qml"}
    }

    ListView {
        id: view
        anchors.fill: parent
        anchors.horizontalCenter: parent.horizontalCenter

        anchors.verticalCenter: parent.verticalCenter

        spacing: 4
        clip: true

        focus: true
        model: homepageModel

        delegate: Item {
            width: view.width/2; height: view.height/3

            Image {
                id: icon

                //anchors.horizontalCenter: parent.horizontalCenter
                //anchors.verticalCenter: parent.verticalCenter
                width: view.width/8;  height: view.height/12
                source: imagePath
            }
            Text {
                //anchors { top: icon.bottom; horizontalCenter: parent.horizontalCenter }
                text: title
            }
            MouseArea {
                //anchors.fill: parent
                onClicked: {
                    parent.GridView.view.currentIndex = index
                     stackView.push(target)
                }
            }
        }


    }
}
