import QtQuick
import com.company.SystemHandler

Rectangle {
  id: rightScreen

  anchors {
    top: parent.top
    bottom: bottomBar.top
    right: parent.right
  }

  width: parent.width * 0.60

  NavigationSearchBox {
    id: navigationSearchBox

    anchors {
      top: lockIcon.bottom
      left: lockIcon.left
      topMargin: 15
    }

    width: parent.width * 1 / 3
    height: parent.height * 1 / 12

    onAccepted: value => {
                  console.log(value)
                  leftScreen.forceActiveFocus()
                }
  }

  Image {
    id: lockIcon
    anchors {
      left: parent.left
      top: parent.top
      margins: 20
    }
    z: 1
    width: parent.width / 35
    fillMode: Image.PreserveAspectFit

    source: (SystemHandler.carLocked ? "assets/icons/lock.png" : "assets/icons/unlock.png")

    MouseArea {
      anchors.fill: parent
      onClicked: SystemHandler.carLocked = !SystemHandler.carLocked
    }
  }

  Text {
    id: dateTimeDisplay

    anchors {
      left: lockIcon.right
      leftMargin: 40
      bottom: lockIcon.bottom
    }
    z: 1
    font.pixelSize: 16
    font.bold: true
    color: "#1e1e1e"

    text: SystemHandler.currentTime
  }

  Text {
    id: outdoorTemperatureDisplay

    anchors {
      left: dateTimeDisplay.right
      leftMargin: 40
      bottom: lockIcon.bottom
    }
    z: 1
    font.pixelSize: 16
    font.bold: true
    color: "#1e1e1e"

    text: SystemHandler.isCelsius ? ((SystemHandler.outdoorTemp - 32) * 5 / 9).toFixed(
                                      1) + "°C" : SystemHandler.outdoorTemp + "°F"

    MouseArea {
      anchors.fill: parent

      onClicked: SystemHandler.isCelsius = !SystemHandler.isCelsius
    }
  }

  Image {
    id: userIcon

    anchors {
      right: userNameDisplay.left
      rightMargin: 5
      bottom: lockIcon.bottom
    }
    z: 1
    width: parent.width / 35
    fillMode: Image.PreserveAspectFit

    source: "assets/icons/user.png"
  }

  Text {
    id: userNameDisplay

    anchors {
      right: parent.right
      rightMargin: 40
      bottom: lockIcon.bottom
    }
    z: 1
    font.pixelSize: 16
    font.bold: true
    color: "#1e1e1e"

    text: SystemHandler.userName
  }

  MapComponent {
    id: mapWrapper
    anchors.fill: parent
  }
}
