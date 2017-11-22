import QtQuick 2.0
import "../common"

Item {
    Rectangle {

        width: parent.width
        height: parent.height
        id: search

        SearchPageListModel {
          id: searchModel
        }

        ListView {
          id: searchList
          anchors.fill: parent
          anchors.topMargin: 20
          anchors.leftMargin: 10
          model: searchModel
          delegate: SearchPageDelegate { }
          spacing: 10
        }
    }
}
