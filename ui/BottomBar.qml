import QtQuick
import com.company.DriverHVAC
import com.company.PassengerHVAC

Rectangle {
  id: bottomBar

  anchors {
    left: parent.left
    right: parent.right
    bottom: parent.bottom
  }
  z: 1
  height: parent.height / 10
  color: "black"

  ImageButton {
    id: carSettingsIcon

    anchors {
      left: parent.left
      verticalCenter: parent.verticalCenter
      leftMargin: 30
    }

    height: parent.height * .50
    fillMode: Image.PreserveAspectFit

    source: "assets/icons/car.png"
  }

  HVACComponent {
    id: driverHVACControl
    anchors {
      top: parent.top
      bottom: parent.bottom
      left: carSettingsIcon.right
      leftMargin: bottomBar.width / 13
    }

    hvacController: DriverHVAC
  }

  ImageButton {
    id: phoneIcon

    anchors {
      left: parent.left
      verticalCenter: parent.verticalCenter
      leftMargin: bottomBar.width / 3
    }

    height: parent.height * .40
    fillMode: Image.PreserveAspectFit

    source: "assets/icons/call.png"
  }

  ImageButton {
    id: radioIconButton

    anchors {
      left: phoneIcon.right
      verticalCenter: parent.verticalCenter
      leftMargin: 35
    }
    source: "assets/icons/radio.png"
    height: parent.height * .40
    fillMode: Image.PreserveAspectFit

    onClicked: {
      musicPlayer.hidden = !musicPlayer.hidden
      playlistPanel.hidden = true
    }
  }

  ImageButton {
    id: cameraIcon

    anchors {
      left: radioIconButton.right
      verticalCenter: parent.verticalCenter
      leftMargin: 35
    }

    height: parent.height * .45
    fillMode: Image.PreserveAspectFit

    source: "assets/icons/lens.png"
  }

  ImageButton {
    id: moreIconButton

    anchors {
      left: cameraIcon.right
      verticalCenter: parent.verticalCenter
      leftMargin: 35
    }

    height: parent.height * .40
    fillMode: Image.PreserveAspectFit

    source: "assets/icons/more.png"
  }

  ImageButton {
    id: menuIcon

    anchors {
      left: moreIconButton.right
      verticalCenter: parent.verticalCenter
      leftMargin: 35
    }

    height: parent.height * .40
    fillMode: Image.PreserveAspectFit

    source: "assets/icons/menu.png"
  }

  ImageButton {
    id: settingsIcon

    anchors {
      left: menuIcon.right
      verticalCenter: parent.verticalCenter
      leftMargin: 35
    }

    height: parent.height * .45
    fillMode: Image.PreserveAspectFit

    source: "assets/icons/settings.png"
  }

  ImageButton {
    id: calendarIcon

    anchors {
      left: settingsIcon.right
      verticalCenter: parent.verticalCenter
      leftMargin: 35
    }

    height: parent.height * .40
    fillMode: Image.PreserveAspectFit

    source: "assets/icons/calendar.png"
  }

  HVACComponent {
    id: passengerHVACControl
    anchors {
      top: parent.top
      bottom: parent.bottom
      right: volumeLevelController.left
      rightMargin: bottomBar.width / 13
    }

    hvacController: PassengerHVAC
  }

  VolumeControlComponent {
    id: volumeLevelController

    anchors {
      right: parent.right
      top: parent.top
      bottom: parent.bottom
    }
  }

  PlayerControllerComponent {
    id: musicPlayer

    anchors {
      right: parent.right
    }

    y: hidden ? parent.height : parent.height - height - bottomBar.height
  }

  PlaylistPanel {
    id: playlistPanel

    anchors {
      bottom: bottomBar.top
      bottomMargin: (bottomBar.height * 1.8) - 1
    }

    x: hidden ? parent.width : parent.width - width

    // onSearchRequested: {
    //   searchPanel.hidden = false
    // }
  }
}
