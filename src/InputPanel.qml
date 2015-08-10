import QtQuick 2.0
import QtQuick.VirtualKeyboard 1.0

/**
 * This is the QML input panel that provides the virtual keyboard UI
 * The code has been copied from
 * http://tolszak-dev.blogspot.de/2013/04/qplatforminputcontext-and-virtual.html
 */
Item {
    id:root
    objectName: "inputPanel"
    width: parent.width
    height: width / 4
    // Report actual keyboard rectangle to input engine
    onYChanged: InputEngine.setKeyboardRectangle(Qt.rect(x, y, width, height))

    Loader {
        id: keyModel
        source: pimpl.alfaKeyModel
    }

    FontLoader {
        source: "FontAwesome.otf"
    }

    QtObject {
        id:pimpl
        property url alfaKeyModel: "qrc:/KeyModelUS.qml"
        property bool shiftModifier: false
        property bool symbolModifier: false
        property int verticalSpacing: keyboard.height / 40
        property int horizontalSpacing: verticalSpacing
        property int rowHeight: keyboard.height/4 - verticalSpacing
        property int buttonWidth:  (keyboard.width-column.anchors.margins)/12 - horizontalSpacing

        onSymbolModifierChanged: {
            if (symbolModifier)
                keyModel.source = "qrc:/KeyModelSymbols.qml"
            else
                keyModel.source = pimpl.alfaKeyModel
        }
    }

    /**
     * The delegate that paints the key buttons
     */
    Component {
        id: keyButtonDelegate
        KeyButton {
            id: button
            width: pimpl.buttonWidth
            height: pimpl.rowHeight
            text: (pimpl.shiftModifier) ? symbol.toUpperCase() : symbol
            inputPanel: root
        }
    }

    Connections {
        target: InputEngine
        // Switch the keyboard layout to Numeric if the input mode of the InputEngine changes
        onInputModeChanged: {
            pimpl.symbolModifier = ((InputEngine.inputMode == InputEngine.Numeric)
                                 || (InputEngine.inputMode == InputEngine.Dialable))
            if (pimpl.symbolModifier) {
                pimpl.shiftModifier = false
            }
        }
    }

    /**
     * This function shows the character preview popup for each key button
     */
    function showKeyPopup(keyButton)
    {
        console.log("showKeyPopup");
        keyPopup.popup(keyButton, root);
    }

    /**
     * The key popup for character preview
     */
    KeyPopup {
        id: keyPopup
        visible: false
        z: 100
    }


    Rectangle {
        id:keyboard
        color: "black"
        anchors.fill: parent;
        MouseArea {
            anchors.fill: parent
        }

        Column {
            id:column
            anchors.margins: 5
            anchors.fill: parent
            spacing: pimpl.verticalSpacing

            Row {
                height: pimpl.rowHeight
                spacing: pimpl.horizontalSpacing
                anchors.horizontalCenter:parent.horizontalCenter
                Repeater {
                    model: keyModel.item.firstRowModel
                    delegate: keyButtonDelegate
                }
            }
            Row {
                height: pimpl.rowHeight
                spacing: pimpl.horizontalSpacing
                anchors.horizontalCenter:parent.horizontalCenter
                Repeater {
                    model: keyModel.item.secondRowModel
                    delegate: keyButtonDelegate
                }
            }
            Item {
                height: pimpl.rowHeight
                width:parent.width
                KeyButton {
                    id: shiftKey
                    color: (pimpl.shiftModifier)? "#1e6fa7": "#1e1b18"
                    anchors.left: parent.left
                    width: 1.25*pimpl.buttonWidth
                    height: pimpl.rowHeight
                    font.family: "FontAwesome"
                    //text: "\uf062"
                    text: "\u21E7 "
                    functionKey: true
                    onClicked: {
                        if (pimpl.symbolModifier) {
                            pimpl.symbolModifier = false
                        }
                        pimpl.shiftModifier = !pimpl.shiftModifier
                    }
                    inputPanel: root
                }
                Row {
                    height: pimpl.rowHeight
                    spacing: pimpl.horizontalSpacing
                    anchors.horizontalCenter:parent.horizontalCenter
                    Repeater {
                        anchors.horizontalCenter: parent.horizontalCenter
                        model: keyModel.item.thirdRowModel
                        delegate: keyButtonDelegate
                    }
                }
                KeyButton {
                    id: backspaceKey
                    font.family: "FontAwesome"
                    color: "#1e1b18"
                    anchors.right: parent.right
                    width: 1.25*pimpl.buttonWidth
                    height: pimpl.rowHeight
                    text: "\x7F"
                    displayText: "\u232B"
                    inputPanel: root
                    repeat: true
                }
            }
            Row {
                height: pimpl.rowHeight
                spacing: pimpl.horizontalSpacing
                anchors.horizontalCenter:parent.horizontalCenter
                KeyButton {
                    id: hideKey
                    color: "#1e1b18"
                    width: 1.25*pimpl.buttonWidth
                    height: pimpl.rowHeight
                    font.family: "FontAwesome"
                    text: "\uf078"
                    functionKey: true
                    onClicked: {
                        Qt.inputMethod.hide()
                    }
                    inputPanel: root
                    showPreview: false
                }
                KeyButton {
                    id: layoutKey
                    color: "#1e1b18"
                    width: 1.25*pimpl.buttonWidth
                    height: pimpl.rowHeight
                    text: "en/ru"
                    inputPanel: root
                    onClicked: {
                        if (pimpl.alfaKeyModel == "qrc:/KeyModelRU.qml")
                            pimpl.alfaKeyModel = "qrc:/KeyModelUS.qml"
                        else
                            pimpl.alfaKeyModel = "qrc:/KeyModelRU.qml"
                        keyModel.source = pimpl.alfaKeyModel
                        pimpl.symbolModifier = false
                    }
                    functionKey: true
                }
                KeyButton {
                    width: pimpl.buttonWidth
                    height: pimpl.rowHeight
                    text: ","
                    onClicked: InputEngine.sendKeyToFocusItem(text)
                    inputPanel: root
                }
                KeyButton {
                    id: spaceKey
                    width: 3*pimpl.buttonWidth
                    height: pimpl.rowHeight
                    text: " "
                    inputPanel: root
                    showPreview: false
                }
                KeyButton {
                    width: pimpl.buttonWidth
                    height: pimpl.rowHeight
                    text: "."
                    inputPanel: root
                }
                KeyButton {
                    id: symbolKey
                    color: "#1e1b18"
                    width: 1.25*pimpl.buttonWidth
                    height: pimpl.rowHeight
                    text: (!pimpl.symbolModifier)? "12#" : "ABC"
                    functionKey: true
                    onClicked: {
                        if (pimpl.shiftModifier) {
                            pimpl.shiftModifier = false
                        }
                        pimpl.symbolModifier = !pimpl.symbolModifier
                    }
                    inputPanel: root
                }
                KeyButton {
                    id: enterKey
                    color: "#1e1b18"
                    width: 1.25*pimpl.buttonWidth
                    height: pimpl.rowHeight
                    //displayText: "Enter"
                    displayText: "\u23CE"
                    text: "\n"
                    inputPanel: root
                }
            }
        }
    }
}
