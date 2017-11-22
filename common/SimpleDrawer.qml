import QtQuick 2.6
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0

Drawer {
    id: drawer
    width: Math.min(window.width, window.height) / 3 * 2
    height: window.height
    dragMargin: stackView.depth > 1 ? 0 : undefined

    ListView {
        id: listView
        currentIndex: -1
        anchors.fill: parent

        delegate: ItemDelegate {
            width: parent.width
            text: model.title
            highlighted: ListView.isCurrentItem
            onClicked: {
                if (listView.currentIndex != index) {
                    listView.currentIndex = index
                    stackView.push(model.source)
                }
                drawer.close()
            }
        }

        model: ListModel {
            ListElement { title: "BusyIndicator"; source: "qrc:/pages/BusyIndicatorPage.qml" }
            ListElement { title: "Button"; source: "qrc:/pages/ButtonPage.qml" }

        }

        ScrollIndicator.vertical: ScrollIndicator { }
    }
}
