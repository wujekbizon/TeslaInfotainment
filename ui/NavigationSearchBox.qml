import QtQuick

Rectangle {
  id: navigationSearchBox

  topRightRadius: 10
  bottomRightRadius: 10
  color: "#fafafa"

  z: 1
  Image {
    id: searchIcon
    anchors {
      left: parent.left
      leftMargin: 20
      verticalCenter: parent.verticalCenter
    }

    fillMode: Image.PreserveAspectFit
    height: parent.height * .45
    mipmap: true
    source: "assets/icons/loupe.png"
  }

  Text {
    id: navigationPlaceHolderText
    text: "Navigate"
    font.pixelSize: 16
    color: "#454545"

    anchors {
      verticalCenter: parent.verticalCenter
      left: searchIcon.right
      leftMargin: 20
    }

    visible: navigationTextInput.text === ""
  }

  TextInput {
    id: navigationTextInput
    clip: true
    anchors {
      top: parent.top
      bottom: parent.bottom
      right: parent.right
      left: searchIcon.right
      leftMargin: 20
    }
    verticalAlignment: TextInput.AlignVCenter
    font.pixelSize: 18
  }
}
