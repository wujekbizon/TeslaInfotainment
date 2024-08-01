#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "Controllers/AudioController.h"
#include "Controllers/AudioSearchModel.h"
#include "Controllers/PlayerController.h"

#include <Controllers/HVACHandler.h>
#include <Controllers/System.h>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    System *m_systemHandler = new System(&app);
    qmlRegisterSingletonInstance("com.company.SystemHandler", 1, 0, "SystemHandler", m_systemHandler);

    HVACHandler *m_driverHVACHandler = new HVACHandler(&app);
    qmlRegisterSingletonInstance("com.company.DriverHVAC", 1, 0, "DriverHVAC", m_driverHVACHandler);

    HVACHandler *passengerHVACHandler = new HVACHandler(&app);
    qmlRegisterSingletonInstance("com.company.PassengerHVAC",
                                 1,
                                 0,
                                 "PassengerHVAC",
                                 passengerHVACHandler);

    AudioController *m_audioController = new AudioController(&app);
    qmlRegisterSingletonInstance("com.company.AudioController",
                                 1,
                                 0,
                                 "AudioController",
                                 m_audioController);

    PlayerController *playerController = new PlayerController(&app);
    qmlRegisterSingletonInstance("com.company.PlayerController",
                                 1,
                                 0,
                                 "PlayerController",
                                 playerController);

    AudioSearchModel *audioSearchModel = new AudioSearchModel(&app);
    qmlRegisterSingletonInstance("com.company.AudioSearchModel",
                                 1,
                                 0,
                                 "AudioSearchModel",
                                 audioSearchModel);

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("TeslaInfotainment", "Main");

    return app.exec();
}
