import QtQuick 2.5

Item {
    property QtObject firstRowModel: first
    property QtObject secondRowModel: second
    property QtObject thirdRowModel: third


    ListModel {
        id:first
        ListElement { symbol: "й"}
        ListElement { symbol: "ц"}
        ListElement { symbol: "у"}
        ListElement { symbol: "к"}
        ListElement { symbol: "е"}
        ListElement { symbol: "н"}
        ListElement { symbol: "г"}
        ListElement { symbol: "ш"}
        ListElement { symbol: "щ"}
        ListElement { symbol: "з"}
        ListElement { symbol: "х"}
        ListElement { symbol: "ъ"}
    }
    ListModel {
        id:second
        ListElement { symbol: "ф"}
        ListElement { symbol: "ы"}
        ListElement { symbol: "в"}
        ListElement { symbol: "а"}
        ListElement { symbol: "п"}
        ListElement { symbol: "р"}
        ListElement { symbol: "о"}
        ListElement { symbol: "л"}
        ListElement { symbol: "д"}
        ListElement { symbol: "ж"}
        ListElement { symbol: "э"}
    }
    ListModel {
        id:third
        ListElement { symbol: "я"}
        ListElement { symbol: "ч"}
        ListElement { symbol: "с"}
        ListElement { symbol: "м"}
        ListElement { symbol: "и"}
        ListElement { symbol: "т"}
        ListElement { symbol: "ь"}
        ListElement { symbol: "б"}
        ListElement { symbol: "ю"}
    }
}
