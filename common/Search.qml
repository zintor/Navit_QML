import QtQuick 2.0

Item {
    Rectangle {
        width: parent.width
        height: parent.height
        id: searchResults

        ListView {
            anchors.fill: parent
            id: listView
            focus: true
            //model: backend.searchresults
            delegate: SearchResultDelegate { }

            Component.onCompleted: {
                //backend.updateSearch("")
            }
        }
    }

    Rectangle {
        id: searchRectangle
        x: 16
        y: 16
        width: parent.width-32
        height: 50
        color: "#35322f"
        radius: 3
        border.width: 1


        Image {
            id: image
            width: 64
            height: 48
            fillMode: Image.PreserveAspectFit

            //source: backend.get_country_icon("")
        }


        TextEdit {
            id: searchTextEdit
            cursorVisible: true
            height: 20
            width: parent.with
            color: "#ffffff"
            text: qsTr("")
            focus: true
            horizontalAlignment: Text.AlignLeft
            anchors.verticalCenter: parent.verticalCenter
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.topMargin: 15
            font.pixelSize: 20
            onTextChanged: {
                //backend.updateSearch(searchTextEdit.text)
            }
            onFocusChanged: console.log("Focus changed " + focus)
        }
    }

}
