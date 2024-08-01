import QtQuick
import QtMultimedia
import com.company.PlayerController
import com.company.AudioController
import TeslaInfotainment

Item {
  id: audioInfoBox

  visible: !!PlayerController.currentSong

  Image {
    id: albumImage

    anchors {
      verticalCenter: parent.verticalCenter
      left: parent.left
    }

    width: 150
    height: 80

    source: !!PlayerController.currentSong ? PlayerController.currentSong.imageSource : ""
  }

  Video {
    id: albumVideo

    anchors {
      verticalCenter: parent.verticalCenter
      left: parent.left
    }

    width: 150
    height: 80

    loops: MediaPlayer.Infinite
    // volume is a float between 0 and 1
    // to convert my volumeLevel to volume need to * by 0.01
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

  Text {
    id: titleText

    anchors {
      bottom: parent.verticalCenter
      left: albumImage.right
      margins: 5
      leftMargin: 20
      right: parent.right
    }

    color: "white"
    wrapMode: Text.WrapAtWordBoundaryOrAnywhere
    text: !!PlayerController.currentSong ? PlayerController.currentSong.title : "Unknown title"

    font {
      pixelSize: 15
      bold: true
    }
  }

  Text {
    id: authorText

    anchors {
      top: parent.verticalCenter
      left: albumImage.right
      right: parent.right
      leftMargin: 20
    }

    color: "gray"
    wrapMode: Text.WrapAtWordBoundaryOrAnywhere
    text: !!PlayerController.currentSong ? PlayerController.currentSong.authorName : "Unknown artist"

    font {
      pixelSize: 12
    }
  }

  onVisibleChanged: {
    if (visible) {
      albumVideo.play()
    } else {
      albumVideo.seek(0)
      albumVideo.stop()
    }
  }
}
