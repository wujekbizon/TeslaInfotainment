cmake_minimum_required(VERSION 3.16)

project(TeslaInfotainment VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS Quick Location Positioning Multimedia)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appTeslaInfotainment
    main.cpp
    Controllers/PlayerController.h Controllers/PlayerController.cpp
)

qt_add_qml_module(appTeslaInfotainment
    URI TeslaInfotainment
    VERSION 1.0
    QML_FILES
    Main.qml
    ui/BottomBar.qml
    ui/MapComponent.qml
    ui/RightScreen.qml
    ui/LeftScreen.qml
    ui/NavigationSearchBox.qml
    ui/ImageButton.qml
    ui/VolumeControlComponent.qml
    ui/PlayerControllerComponent.qml
    ui/AudioInfoBox.qml
    ui/PlaylistPanel.qml
    ui/HVACComponent.qml

    SOURCES

    Controllers/HVACHandler.h Controllers/HVACHandler.cpp
    Controllers/System.h Controllers/System.cpp
    Controllers/AudioSearchModel.h Controllers/AudioSearchModel.cpp
    Controllers/AudioInfo.h Controllers/AudioInfo.cpp
    Controllers/AudioController.h Controllers/AudioController.cpp

    RESOURCES

    ui/assets/images/tesla1.png
    ui/assets/images/tesla2.jpg
    ui/assets/images/song_1.png
    ui/assets/images/song_2.png
    ui/assets/images/song_3.png

    ui/assets/icons/electric_car_icon.png
    ui/assets/icons/car.png
    ui/assets/icons/lock.png
    ui/assets/icons/unlock.png
    ui/assets/icons/user.png
    ui/assets/icons/loupe.png
    ui/assets/icons/call.png
    ui/assets/icons/radio.png
    ui/assets/icons/lens.png
    ui/assets/icons/menu.png
    ui/assets/icons/more.png
    ui/assets/icons/calendar.png
    ui/assets/icons/settings.png
    ui/assets/icons/left-arrow.png
    ui/assets/icons/right-arrow.png
    ui/assets/icons/volume1.png
    ui/assets/icons/volume2.png
    ui/assets/icons/volume3.png
    ui/assets/icons/mute.png
    ui/assets/icons/next.png
    ui/assets/icons/previous.png
    ui/assets/icons/play.png
    ui/assets/icons/pause.png
    ui/assets/icons/delete.png
    ui/assets/icons/add.png
    ui/assets/icons/playlist.png

    ui/assets/audio/air_on_the_g_string.mp3
    ui/assets/audio/eine_kleine_nachtmusik.mp3
    ui/assets/audio/symphony_no_5.mp3

    ui/assets/videos/video_1.mp4
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appTeslaInfotainment PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appTeslaInfotainment
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appTeslaInfotainment
    PRIVATE Qt6::Quick Qt6::Location Qt6::Positioning Qt6::Multimedia
)

include(GNUInstallDirs)
install(TARGETS appTeslaInfotainment
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
