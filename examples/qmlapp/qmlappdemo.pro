TEMPLATE = app
TARGET = virtualkeyboardqmldemo
QT += qml quick
SOURCES += main.cpp
CONFIG += link_pkgconfig

OBJECTS_DIR = .obj
MOC_DIR = .moc

target.path = $$[QT_INSTALL_PLUGINS]/virtualkeyboard
INSTALLS += target


RESOURCES += \
    qmlappdemo.qrc

OTHER_FILES += \
    content/ScrollBar.qml \
    content/TextArea.qml \
    content/TextBase.qml \
    content/TextField.qml \
    Main.qml \
    MainContainer.qml

DESTDIR = $$PWD

DISTFILES += \
    Style.qml
