import QtQuick
import com.company.PlayerController
import com.company.AudioSearchModel

Rectangle {
  id: root

  property bool hidden: true

  color: "#333333"

  ListView {
    id: listView

    anchors {
      fill: playlistPanel
      margins: 20
    }

    spacing: 20
    clip: true
    model: AudioSearchModel

    visible: !AudioSearchModel.isSearching

    delegate: Rectangle {
      id: delegate

      required property string audioName
      required property string audioAuthor
      required property url audioImageSource
      required property url audioSource
      required property int index

      width: listView.width
      height: 50

      color: "#1e1e1e"

      Image {
        id: audioImage

        anchors {
          left: parent.left
          leftMargin: 5
          verticalCenter: parent.verticalCenter
        }

        width: 32
        height: 32

        source: delegate.audioImageSource
      }

      Column {
        anchors {
          left: audioImage.right
          right: parent.right
          top: parent.top

          margins: 5
        }

        spacing: 5

        Text {
          width: parent.width
          text: delegate.audioName
          color: "white"

          fontSizeMode: Text.Fit
          minimumPixelSize: 12
          elide: Text.ElideRight

          font {
            pixelSize: 16
            bold: true
          }
        }

        Text {
          width: parent.width
          text: delegate.audioAuthor
          color: "gray"

          fontSizeMode: Text.Fit
          minimumPixelSize: 8
          elide: Text.ElideRight

          font {
            pixelSize: 12
          }
        }
      }

      MouseArea {
        anchors.fill: parent
        onClicked: {
          root.hidden = true
          PlayerController.addAudio(delegate.audioName, delegate.audioAuthor,
                                    delegate.audioSource,
                                    delegate.audioImageSource)
        }
      }
    }
  }

  Text {
    anchors.centerIn: parent
    color: "gray"
    visible: AudioSearchModel.isSearching || listView.count === 0

    text: if (AudioSearchModel.isSearching) {
            return "Searching..."
          } else if (listView.count === 0) {
            return "No results"
          } else {
            return ""
          }
    font {
      pixelSize: 24
      bold: true
    }
  }

  SearchField {
    anchors {
      top: parent.top
      left: parent.left
      right: closeSearchButton.left
      verticalCenter: parent.verticalCenter
      margins: 10
    }

    height: 30

    visible: !searchPanel.hidden
    enabled: !AudioSearchModel.isSearchng

    onAccepted: value => {
                  AudioSearchModel.searchSong(value)
                  //topbar.forceActiveFocus()
                }
  }

  ImageButton {
    id: closeSearchButton

    anchors {
      top: parent.top
      right: parent.right
      verticalCenter: parent.verticalCenter
      rightMargin: 20
    }

    height: 32
    width: 32

    source: "assets/icons/close_icon.png"
    visible: !searchPanel.hidden

    onClicked: {
      searchPanel.hidden = true
    }
  }

  Behavior on y {
    PropertyAnimation {
      easing.type: Easing.InOutQuad
      duration: 200
    }
  }
}
