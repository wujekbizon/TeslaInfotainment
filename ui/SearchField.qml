import QtQuick

Rectangle {
  id: root

  signal accepted(string value)

  color: "#1e1e1e"
  border.color: searchInput.activeFocus ? Qt.lighter("#5F8575") : "transparent"
  border.width: 1

  opacity: enabled ? 1 : 0.6

  TextInput {
    id: searchInput

    anchors {
      top: parent.top
      left: parent.left
      right: parent.right
    }

    height: 30

    font.pixelSize: 14
    color: "white"

    leftPadding: 30
    verticalAlignment: TextInput.AlignVCenter

    Image {
      anchors {
        left: parent.left
        leftMargin: 5
        verticalCenter: parent.verticalCenter
      }

      width: 16
      height: 16

      mipmap: true
      source: "assets/icons/search_icon.png"
    }

    onAccepted: {
      root.accepted(text)
    }
  }
}
