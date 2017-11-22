import QtQuick 2.0

ListModel {
  ListElement { imagePath: "qrc:/images/country_DE.svg"; title: "Country"; target: "qrc:/common/Search.qml"; context: "country"}
  ListElement { imagePath: "qrc:/images/town.png"; title: "City"; target: "qrc:/common/Search.qml"; context: "town" }
  ListElement { imagePath: "qrc:/images/street.png"; title: "Street"; target: "qrc:/common/Search.qml"; context: "street" }
}
