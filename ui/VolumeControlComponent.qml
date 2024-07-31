import QtQuick
import com.company.AudioController

Item {
  property string fontColor: "#ebebed"

  Connections {
    target: AudioController
    function onVolumeLevelChanged() {
      visibileTimer.stop()
      volumeLevelIcon.visible = false
      visibileTimer.start()
    }
  }

  Timer {
    id: visibileTimer
    interval: 500
    repeat: false
    onTriggered: {
      volumeLevelIcon.visible = true
    }
  }

  width: 104 * (parent.width / 1280)

  Rectangle {
    id: volumeDownButton

    anchors {
      right: volumeLevelIcon.left
      top: parent.top
      bottom: parent.bottom
      rightMargin: 10
    }

    width: height / 2
    color: "transparent"

    ImageButton {
      id: volumeDownIcon
      anchors.centerIn: parent
      source: "assets/icons/left-arrow.png"

      height: parent.height * .20
      fillMode: Image.PreserveAspectFit
      opacity: 0.6
      onClicked: {
        AudioController.incrementVolume(-1)
      }
    }
  }

  Image {
    id: volumeLevelIcon

    anchors {
      right: volumeUpButton.left
      verticalCenter: parent.verticalCenter
      rightMargin: 10
    }

    height: parent.height * .30
    fillMode: Image.PreserveAspectFit

    source: {
      if (AudioController.volumeLevel < 1)
        return "assets/icons/mute.png"
      else if (AudioController.volumeLevel <= 35)
        return "assets/icons/volume1.png"
      else if (AudioController.volumeLevel <= 70)
        return "assets/icons/volume2.png"
      else
        return "assets/icons/volume3.png"
    }
  }

  Text {
    id: volumeTextLabel
    visible: !volumeLevelIcon.visible
    anchors {
      centerIn: volumeLevelIcon
    }

    color: fontColor
    font.pixelSize: 28
    font.bold: true
    text: AudioController.volumeLevel
  }

  Rectangle {
    id: volumeUpButton

    anchors {
      right: parent.right
      top: parent.top
      bottom: parent.bottom
      rightMargin: 25
    }

    width: height / 2
    color: "transparent"

    ImageButton {
      id: volumeUpIcon
      anchors.centerIn: parent
      source: "assets/icons/right-arrow.png"

      height: parent.height * .20
      fillMode: Image.PreserveAspectFit
      opacity: 0.6
      onClicked: {
        AudioController.incrementVolume(1)
      }
    }
  }
}
