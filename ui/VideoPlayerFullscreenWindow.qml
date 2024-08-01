import QtQuick
import QtMultimedia
import com.company.AudioController
import com.company.PlayerController

Rectangle {
  id: fullscreenVideoRoot
  property bool isHidden: true

  height: rightScreen.height
  width: rightScreen.width

  color: "black"

  Image {
    id: fullscreenImage

    anchors.fill: parent
    source: !!PlayerController.currentSong ? PlayerController.currentSong.imageSource : ""
  }

  Video {
    id: fullscreenVideo
    anchors.fill: parent

    loops: MediaPlayer.Infinite
    volume: AudioController.volumeLevel * 0.01
    source: !!PlayerController.currentSong ? PlayerController.currentSong.videoSource : ""

    onSourceChanged: {
      if (source !== "") {
        play()
      } else {
        stop()
      }
    }
  }

  ImageButton {
    id: closeFullscreenIcon

    anchors {
      right: parent.right
      bottom: parent.bottom
      margins: 10
    }

    height: 25
    width: 25

    source: "assets/icons/expand.png"

    onClicked: fullscreenVideoRoot.isHidden = true
  }

  Behavior on x {
    PropertyAnimation {
      easing.type: Easing.InOutQuad
      duration: 200
    }
  }
}
