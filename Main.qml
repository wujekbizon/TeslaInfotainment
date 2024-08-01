import QtQuick
import QtQuick.Controls
import "ui"

Window {
  id: root
  width: 1280
  height: 720
  visible: true
  title: qsTr("Tesla Infotainment")

  Pane {
    anchors.fill: parent
    focusPolicy: Qt.ClickFocus
  }

  LeftScreen {
    id: leftScreen
  }

  RightScreen {
    id: rightScreen
  }

  BottomBar {
    id: bottomBar
  }
}
