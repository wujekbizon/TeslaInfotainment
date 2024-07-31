import QtQuick

Rectangle {
  id: searchFieldRoot

  signal accepted(string value)

  color: "#1e1e1e"
  border.color: searchInput.activeFocus ? Qt.lighter("#1e1e1e") : "transparent"
  border.width: 1

  opacity: enabled ? 1 : 0.6

  TextInput {
    id: searchInput

    anchors {
      left: parent.left
      right: parent.right
      verticalCenter: parent.verticalCenter
    }

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
      searchFieldRoot.accepted(text)
    }
  }
}
