import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import "."
import VirtualKeyboard 1.0

/**
 * This is the QML input panel that provides the virtual keyboard UI
 * The code has been copied from
 * http://tolszak-dev.blogspot.de/2013/04/qplatforminputcontext-and-virtual.html
 */
Item {
    id:root
    objectName: "inputPanel"
    width: parent.width
    height: parent.height
    // Report actual keyboard rectangle to input engine
    onYChanged: InputEngine.setKeyboardRectangle(Qt.rect(x, y, width, height))

    property string font: "FontAwesome"

    Loader {
        id: keyModel
        source: pimpl.alfaKeyModel
    }

    FontLoader {
        source: "FontAwesome.otf"
    }

    QtObject {
        id:pimpl
        property url alfaKeyModel: "qrc:/KeyModelRU.qml"
        property bool shiftModifier: false
        property bool symbolModifier: false
        property int verticalSpacing: keyboard.height / 40
        property int horizontalSpacing: verticalSpacing
        property int rowHeight: keyboard.height/5 - verticalSpacing
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
            font.family: root.font
            color: "#fcfcfc"
            textColor: "#2a2928"
            inputPanel: root
            showPreview: false
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
        color: "transparent"
        anchors.fill: parent;
        MouseArea {
            anchors.fill: parent
        }

        Column {
            id:column
            anchors.margins: 5
            anchors.fill: parent
            spacing: pimpl.verticalSpacing

            Item {
                height: pimpl.rowHeight
                width: parent.width

                TextField {
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.right: backspaceKey.left
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 25

                    font.pointSize: 20
                    font.family: root.font
                    focus: true

                    style: TextFieldStyle {
                        background: Rectangle {
                            radius: 10
                            border.color: "#2a2928"
                            border.width: 1
                        }
                    }
                }

                KeyButton {
                    id: backspaceKey
                    font.family: root.font
                    color: "#717170"
                    textColor: "#fcfcfc"
                    anchors.right: parent.right
                    width: pimpl.buttonWidth
                    height: pimpl.rowHeight
                    text: "\x7F"
                    displayText: "\u232B"
                    inputPanel: root
                    repeat: true
                    showPreview: false
                }
            }

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
                Row {
                    height: pimpl.rowHeight
                    spacing: pimpl.horizontalSpacing
                    anchors.horizontalCenter:parent.horizontalCenter

                    KeyButton {
                        id: shiftKey
                        color: "#717170"
                        textColor: "#fcfcfc"
                        width: pimpl.buttonWidth
                        height: pimpl.rowHeight
                        font.family: root.font
                        //text: "\uf062"
                        text: "\u21E7 "
                        functionKey: true
                        visible: !pimpl.symbolModifier
                        onClicked: {
                            if (pimpl.symbolModifier) {
                                pimpl.symbolModifier = false
                            }
                            pimpl.shiftModifier = !pimpl.shiftModifier
                        }
                        inputPanel: root
                        showPreview: false
                    }

                    Repeater {
                        anchors.horizontalCenter: parent.horizontalCenter
                        model: keyModel.item.thirdRowModel
                        delegate: keyButtonDelegate
                    }
                }
            }
            Row {
                height: pimpl.rowHeight
                spacing: pimpl.horizontalSpacing
                anchors.horizontalCenter:parent.horizontalCenter
                KeyButton {
                    id: symbolKey
                    color: "#717170"
                    textColor: "#fcfcfc"
                    width: 1.25*pimpl.buttonWidth
                    height: pimpl.rowHeight
                    text: (!pimpl.symbolModifier)? "?123" : "ABC"
                    functionKey: true
                    font.family: root.font
                    onClicked: {
                        if (pimpl.shiftModifier) {
                            pimpl.shiftModifier = false
                        }
                        pimpl.symbolModifier = !pimpl.symbolModifier
                    }
                    inputPanel: root
                    showPreview: false
                }
                KeyButton {
                    id: commaKey
                    width: pimpl.buttonWidth
                    height: pimpl.rowHeight
                    color: "#fcfcfc"
                    textColor: "#2a2928"
                    text: ","
                    font.family: root.font
                    onClicked: InputEngine.sendKeyToFocusItem(text)
                    inputPanel: root
                    showPreview: false
                }
                KeyButton {
                    id: spaceKey
                    width: 4*pimpl.buttonWidth
                    height: pimpl.rowHeight
                    color: "#fcfcfc"
                    textColor: "#2a2928"
                    text: " "
                    displayText: "\u2423"
                    font.family: root.font
                    inputPanel: root
                    showPreview: false
                }
                KeyButton {
                    id: dotKey
                    width: pimpl.buttonWidth
                    height: pimpl.rowHeight
                    color: "#fcfcfc"
                    textColor: "#2a2928"
                    text: "."
                    font.family: root.font
                    inputPanel: root
                    showPreview: false
                }
                KeyButton {
                    id: layoutKey
                    width: 1.25*pimpl.buttonWidth
                    height: pimpl.rowHeight
                    color: "#717170"
                    textColor: "#fcfcfc"
                    text: pimpl.alfaKeyModel == "qrc:/KeyModelRU.qml" ? "EN" : "RU"
                    font.family: root.font
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
                    showPreview: false
                }
            }
        }
    }
}
