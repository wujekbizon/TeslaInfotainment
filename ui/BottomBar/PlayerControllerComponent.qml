import QtQuick
import com.company.PlayerController

Rectangle {

  property bool hidden: true

  height: parent.height * 1.8
  width: parent.width * 0.60
  topLeftRadius: 10
  topRightRadius: 10
  z: -1

  gradient: Gradient {
    GradientStop {
      position: 0.0
      color: "#1e1e1e"
    }

    GradientStop {
      position: 1.0
      color: "black"
    }
  }

  AudioInfoBox {
    id: songInfo

    anchors {
      left: parent.left
      verticalCenter: parent.verticalCenter
      margins: 20
    }
  }

  Row {
    id: buttonsRow
    anchors {
      right: parent.right
      verticalCenter: parent.verticalCenter
      rightMargin: 50
    }

    spacing: 50

    enabled: !!PlayerController.currentSong
    opacity: enabled ? 1 : 0.3

    ImageButton {
      id: previousButton

      width: 20
      height: 20

      source: "../assets/icons/previous.png"
      onClicked: PlayerController.switchToPreviousSong()
    }

    ImageButton {
      id: playPauseButton

      width: 20
      height: 20

      source: PlayerController.playing ? "../assets/icons/pause.png" : "../assets/icons/play.png"
      onClicked: PlayerController.playPause()
    }

    ImageButton {
      id: nextButton

      width: 20
      height: 20

      source: "../assets/icons/next.png"

      onClicked: PlayerController.switchToNextSong()
    }
  }

  Behavior on y {
    PropertyAnimation {
      easing.type: Easing.InOutQuad
      duration: 300
    }
  }
}
