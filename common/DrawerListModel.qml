import QtQuick 2.0

ListModel {
    ListElement { imagePath: "qrc:/images/navit.png"; title: "Home"; target: "qrc:/pages/HomePage.qml" }
    ListElement { imagePath: "qrc:/images/world-1.png"; title: "Back to map"; target: "qrc:/pages/MapPage.qml" }
    ListElement { imagePath: "qrc:/images/location-3.png"; title: "Around Me"; target: "qrc:/pages/AroundMePage.qml" }
    ListElement { imagePath: "qrc:/images/document-3.png"; title: "Bookmarks"; target: "qrc:/pages/BookmarkPage.qml" }
    ListElement { imagePath: "qrc:/images/car.png"; title: "Vehicle"; target: "qrc:/pages/VehiclePage.qml" }
    ListElement { imagePath: "qrc:/images/settong.png"; title: "Settings"; target: "qrc:/pages/SettingsPage.qml" }
}
