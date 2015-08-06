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
        ListElement { letter: "й"; firstSymbol: "1"}
        ListElement { letter: "ц"; firstSymbol: "2"}
        ListElement { letter: "у"; firstSymbol: "3"}
        ListElement { letter: "к"; firstSymbol: "4"}
        ListElement { letter: "е"; firstSymbol: "5"}
        ListElement { letter: "н"; firstSymbol: "6"}
        ListElement { letter: "г"; firstSymbol: "7"}
        ListElement { letter: "ш"; firstSymbol: "8"}
        ListElement { letter: "щ"; firstSymbol: "9"}
        ListElement { letter: "з"; firstSymbol: "0"}
        ListElement { letter: "х"; firstSymbol: "0"}
        ListElement { letter: "ъ"; firstSymbol: "0"}
    }
    ListModel {
        id:second
        ListElement { letter: "ф"; firstSymbol: "!"}
        ListElement { letter: "ы"; firstSymbol: "@"}
        ListElement { letter: "в"; firstSymbol: "#"}
        ListElement { letter: "а"; firstSymbol: "$"}
        ListElement { letter: "п"; firstSymbol: "%"}
        ListElement { letter: "р"; firstSymbol: "&"}
        ListElement { letter: "о"; firstSymbol: "*"}
        ListElement { letter: "л"; firstSymbol: "?"}
        ListElement { letter: "д"; firstSymbol: "/"}
        ListElement { letter: "ж"; firstSymbol: "/"}
        ListElement { letter: "э"; firstSymbol: "/"}
    }
    ListModel {
        id:third
        ListElement { letter: "я"; firstSymbol: "_"}
        ListElement { letter: "ч"; firstSymbol: "\""}
        ListElement { letter: "с"; firstSymbol: "'"}
        ListElement { letter: "м"; firstSymbol: "("}
        ListElement { letter: "и"; firstSymbol: ")"}
        ListElement { letter: "т"; firstSymbol: "-"}
        ListElement { letter: "ь"; firstSymbol: "+"}
        ListElement { letter: "ю"; firstSymbol: "+"}
    }
}
