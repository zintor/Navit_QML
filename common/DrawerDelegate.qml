import QtQuick 2.0

Rectangle {
  id: delegateItem
  width: parent.width; height: 40
  color: "white"

  Image {
    id: imageItem
    //height: parent.height;
    height: 30
    fillMode: Image.PreserveAspectFit
    anchors.left: parent.left
    source: imagePath
  }

  Text {
    id: itexItem
    anchors.left: imageItem.right
    anchors.leftMargin: 20
    anchors.verticalCenter: parent.verticalCenter
    font.pixelSize: 12
    text: title
  }

  MouseArea {
      anchors.fill: parent
      onClicked: {
          listView.currentIndex = index
          //console.debug("clicked:"+ index)
          if (target == "qrc:/pages/HomePage.qml")
              {
          console.debug("clicked:"+ target)
              stackView.push(target)
              stackView.pop(null)
              stackView.index = 0
              }
          else
          {console.debug("test:")}


          stackView.push(target)
          drawer.close()
      }
  }
}
