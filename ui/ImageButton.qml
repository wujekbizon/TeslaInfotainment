import QtQuick

Image {
  id: imageButton

  signal clicked

  opacity: buttonMouseArea.containsMouse ? 0.75 : 1
  mipmap: true
  fillMode: Image.PreserveAspectFit

  MouseArea {
    id: buttonMouseArea
    anchors.fill: parent

    hoverEnabled: true
    cursorShape: "PointingHandCursor"
    onClicked: {
      imageButton.clicked()
    }
  }
}
