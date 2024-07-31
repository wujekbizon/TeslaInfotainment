import QtQuick
import com.company.PlayerController

Rectangle {
  id: playlistPanelRoot

  property bool hidden: true
  signal searchRequested

  height: rightScreen.height - bottomBar.height * 1.8 + 1
  width: rightScreen.width
  z: 1

  gradient: Gradient {
    GradientStop {
      position: 0.0
      color: "black"
    }

    GradientStop {
      position: 1.0
      color: "#1e1e1e"
    }
  }

  Text {
    id: playlistText

    anchors {
      top: parent.top
      margins: 10
      horizontalCenter: parent.horizontalCenter
    }

    text: "Multimedia Panel Playlist"
    color: "white"
    font {
      bold: true
      pixelSize: 20
    }
  }

  ListView {
    id: listView

    anchors {
      top: playlistText.bottom
      bottom: addButton.top
      left: parent.left
      right: parent.right
      margins: 40
    }

    clip: true
    model: PlayerController
    spacing: 10

    delegate: Rectangle {
      id: delegate

      required property string audioTitle
      required property string audioAuthorName
      required property url audioSource
      required property url audioImageSource
      required property url audioVideoSource
      required property int index

      width: listView.width
      height: 70
      radius: 10
      color: "#1e1e1e"

      Image {
        id: delegateImage

        anchors {
          left: parent.left
          right: textsColumn.right
          leftMargin: 15
          verticalCenter: parent.verticalCenter
        }

        fillMode: Image.PreserveAspectCrop
        height: 50
        opacity: delegeteMouseArea.containsMouse ? 1 : 0.5
        mipmap: true
        source: delegate.audioImageSource
      }

      Column {
        id: textsColumn

        anchors {
          top: parent.top
          left: parent.left
          right: removeButton.left
          margins: 15
          leftMargin: 40
        }

        spacing: 5

        Text {
          width: textsColumn.width
          elide: Text.ElideRight
          fontSizeMode: Text.Fit
          minimumPixelSize: 10
          color: "white"
          text: delegate.audioTitle

          font {
            pixelSize: 17
            bold: true
          }
        }

        Text {
          width: textsColumn.width
          elide: Text.ElideRight
          fontSizeMode: Text.Fit
          minimumPixelSize: 6
          color: "gray"
          text: delegate.audioAuthorName

          font {
            pixelSize: 13
          }
        }
      }

      MouseArea {
        id: delegeteMouseArea

        anchors.fill: parent
        cursorShape: "PointingHandCursor"

        hoverEnabled: true
        onClicked: {
          PlayerController.switchToAudioByIndex(delegate.index)
        }
      }

      ImageButton {
        id: removeButton

        anchors {
          right: parent.right
          verticalCenter: parent.verticalCenter
          rightMargin: 15
        }

        width: 30
        height: 30

        source: "assets/icons/delete.png"

        onClicked: {
          PlayerController.removeAudio(delegate.index)
          console.log("Song removed from playlist")
        }
      }
    }
  }

  ImageButton {
    id: addButton

    anchors {
      left: parent.left
      bottom: parent.bottom
      margins: 20
    }

    source: "assets/icons/add.png"

    width: 32
    height: 32

    onClicked: {
      playlistPanelRoot.searchRequested()
      playlistPanelRoot.hidden = true
    }
  }

  Behavior on x {
    PropertyAnimation {
      easing.type: Easing.InOutQuad
      duration: 300
    }
  }
}
