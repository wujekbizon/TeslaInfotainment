import QtQuick

Item {
  id: imageButton

  signal clicked

  opacity: buttonMouseArea.containsMouse ? 0.75 : 1
  mipmap: true
  fillMode: Image.PreserveAspectFit

  MouseArea {
    id: buttonMouseArea

    anchors.fill: parent

    hoverEnabled: true

    onClicked: {
      imageButton.clicked()
    }
  }
}
