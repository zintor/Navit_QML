TEMPLATE = app
TARGET = Navit_Qml
QT += quick quickcontrols2

SOURCES += \
    Navit_Qml.cpp

OTHER_FILES += \
    Navit_Qml.qml \
    common/*.qml \
    pages/*.qml

RESOURCES += \
    Navit_Qml.qrc

DISTFILES += \
    common/DrawerDelegate.qml \
    pages/HomePage.qml \
    common/SearchPageDelegate.qml \
    common/SearchPageListModel.qml \
    common/Search.qml \
    common/SearchResultDelegate.qml \
    common/FloatingActionButton.qml \
    pages/GetHomePage.qml
