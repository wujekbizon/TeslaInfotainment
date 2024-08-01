import QtQuick

Rectangle {
  id: leftScreen
  anchors {
    top: parent.top
    bottom: bottomBar.top
    left: parent.left
    right: rightScreen.left
  }
  color: "#1e1e1e"

  Image {
    id: carRender
    anchors.centerIn: parent
    width: parent.width * .80
    fillMode: Image.PreserveAspectFit
    source: "assets/images/tesla1.png"
  }
}
