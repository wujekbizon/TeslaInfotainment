import QtQuick
import com.company.SystemHandler

Item {

  property string fontColor: "#ebebed"
  property var hvacController

  width: 136 * (parent.width / 1280)

  Rectangle {
    id: decrementButton

    anchors {
      left: parent.left
      top: parent.top
      bottom: parent.bottom
    }

    width: height / 2
    color: "transparent"

    Text {
      id: decrementText
      color: fontColor
      anchors.centerIn: parent
      text: "<"
      font.pixelSize: 18
    }

    MouseArea {
      anchors.fill: parent
      onClicked: {
        hvacController.incrementTargetTemperature(-0.5)
      }
    }
  }

  Text {
    id: targetTemperatureText
    anchors {
      left: decrementButton.right
      verticalCenter: parent.verticalCenter
      leftMargin: 10
    }

    color: fontColor
    font.pixelSize: 28
    font.bold: true
    text: SystemHandler.isCelsius ? ((hvacController.targetTemperature - 32) * 5 / 9).toFixed(
                                      1) : (hvacController.targetTemperature).toFixed(
                                      1)
  }

  Rectangle {
    id: incrementButton

    anchors {
      left: targetTemperatureText.right
      top: parent.top
      bottom: parent.bottom
      leftMargin: 10
    }

    width: height / 2
    color: "transparent"

    Text {
      id: incrementText
      color: fontColor
      anchors.centerIn: parent
      text: ">"
      font.pixelSize: 18
    }

    MouseArea {
      anchors.fill: parent
      onClicked: {
        hvacController.incrementTargetTemperature(0.5)
      }
    }
  }
}
