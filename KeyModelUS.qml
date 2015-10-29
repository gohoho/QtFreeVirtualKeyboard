import QtQuick 2.5

Item {
    property QtObject firstRowModel: first
    property QtObject secondRowModel: second
    property QtObject thirdRowModel: third


    ListModel {
        id:first
        ListElement { symbol: "q"}
        ListElement { symbol: "w"}
        ListElement { symbol: "e"}
        ListElement { symbol: "r"}
        ListElement { symbol: "t"}
        ListElement { symbol: "y"}
        ListElement { symbol: "u"}
        ListElement { symbol: "i"}
        ListElement { symbol: "o"}
        ListElement { symbol: "p"}
    }
    ListModel {
        id:second
        ListElement { symbol: "a"}
        ListElement { symbol: "s"}
        ListElement { symbol: "d"}
        ListElement { symbol: "f"}
        ListElement { symbol: "g"}
        ListElement { symbol: "h"}
        ListElement { symbol: "j"}
        ListElement { symbol: "k"}
        ListElement { symbol: "l"}
    }
    ListModel {
        id:third
        ListElement { symbol: "z"}
        ListElement { symbol: "x"}
        ListElement { symbol: "c"}
        ListElement { symbol: "v"}
        ListElement { symbol: "b"}
        ListElement { symbol: "n"}
        ListElement { symbol: "m"}
    }
}
