import QtQuick 2.0

/**
 * This is quick and dirty model for the keys of the InputPanel *
 * The code has been copied from
 * http://tolszak-dev.blogspot.de/2013/04/qplatforminputcontext-and-virtual.html
 */
Item {
    property QtObject firstRowModel: first
    property QtObject secondRowModel: second
    property QtObject thirdRowModel: third


    ListModel {
        id:first
        ListElement { symbol: "1"}
        ListElement { symbol: "2"}
        ListElement { symbol: "3"}
        ListElement { symbol: "4"}
        ListElement { symbol: "5"}
        ListElement { symbol: "6"}
        ListElement { symbol: "7"}
        ListElement { symbol: "8"}
        ListElement { symbol: "9"}
        ListElement { symbol: "0"}
    }
    ListModel {
        id:second
        ListElement { symbol: "@"}
        ListElement { symbol: "#"}
        ListElement { symbol: "$"}
        ListElement { symbol: "%"}
        ListElement { symbol: "&"}
        ListElement { symbol: "-"}
        ListElement { symbol: "+"}
        ListElement { symbol: "("}
        ListElement { symbol: ")"}
    }
    ListModel {
        id:third
        ListElement { symbol: "*"}
        ListElement { symbol: "\""}
        ListElement { symbol: "'"}
        ListElement { symbol: ":"}
        ListElement { symbol: ";"}
        ListElement { symbol: "!"}
        ListElement { symbol: "?"}
    }
}
