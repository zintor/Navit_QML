import QtQuick 2.0

Rectangle {
    id: map

    Image {
       anchors.fill: parent
       source: "qrc:/images/map.png"
       width: parent.width
       fillMode: Image.PreserveAspectFit

    }
}
