import QtQuick 2.0

Rectangle {
  id: delegateItem
  width: parent.width
  height: 40
  color: "white"

  Image {
    id: imageItem
    height: parent.height; width: 40
    anchors.left: parent.left
    source: imagePath
  }

  Text {
    id: textItem
    anchors.left: imageItem.right
    anchors.leftMargin: 20
    anchors.verticalCenter: parent.verticalCenter
    font.pixelSize: 12
    text: title
  }

  MouseArea {
      anchors.fill: parent
      onClicked: {
          //backend.setSearchContext(context)
          listView.currentIndex = index
          //console.debug("clicked:"+ index)
          stackView.push(target)
          drawer.close()
      }
  }
}
