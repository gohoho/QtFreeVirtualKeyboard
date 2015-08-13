#-------------------------------------------------
#
# Project created by QtCreator 2013-04-04T23:11:38
#
#-------------------------------------------------

QT       += qml quick quick-private gui-private widgets

CONFIG += plugin

TARGET = VirtualKeyboard
TEMPLATE = lib

OBJECTS_DIR = .obj
MOC_DIR = .moc

SOURCES += VirtualKeyboardInputContextPlugin.cpp \
    VirtualKeyboardInputContext.cpp \
    DeclarativeInputEngine.cpp

HEADERS += VirtualKeyboardInputContextPlugin.h\
    VirtualKeyboardInputContext.h \
    DeclarativeInputEngine.h

deployment.files = *.qml FontAwesome.otf qmldir

deployment.path = $$[QT_INSTALL_QML]/QtQuick/VirtualKeyboard
target.path = $$[QT_INSTALL_PLUGINS]/platforminputcontexts

INSTALLS += target \
    deployment

OTHER_FILES += \
    InputPanel.qml \
    KeyModel.qml \
    KeyModelRu.qml \
    KeyButton.qml \
    KeyPopup.qml

RESOURCES += \
    virtualkeyboard.qrc
