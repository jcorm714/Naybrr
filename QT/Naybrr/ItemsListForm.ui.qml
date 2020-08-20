import QtQuick 2.4
import QtQuick.Controls 2.15

Item {
    id: element
    width: 400
    height: 400
    property alias stackView: stackView
    StackView {
        id: stackView
        anchors.fill: parent
    }
}
