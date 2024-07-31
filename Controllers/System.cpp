#include "System.h"

#include <QDateTime>

System::System(QObject *parent)
    : QObject{parent}
    , m_carLocked(true)
    , m_outdoorTemp(64)
    , m_userName("Uncle Bizon")
    , m_isCelsius(false)
{
    m_currentTimeTimer = new QTimer(this);
    m_currentTimeTimer->setInterval(500);

    // QTimer will only run once, when the times out it's
    // just going to stop and it won't restart
    m_currentTimeTimer->setSingleShot(true);
    // making connection
    // anytime QTimer has finished 500 millisecond timer
    // it will call this currentTimeTimerTimeout slot
    connect(m_currentTimeTimer, &QTimer::timeout, this, &System::setCurrentTimeTimerTimeout);
    setCurrentTimeTimerTimeout();
}

bool System::carLocked() const
{
    return m_carLocked;
}

void System::setCarLocked(bool newCarLocked)
{
    if (m_carLocked == newCarLocked)
        return;
    m_carLocked = newCarLocked;
    emit carLockedChanged();
}

int System::outdoorTemp() const
{
    return m_outdoorTemp;
}

void System::setOutdoorTemp(int newOutdoorTemp)
{
    if (m_outdoorTemp == newOutdoorTemp)
        return;
    m_outdoorTemp = newOutdoorTemp;
    emit outdoorTempChanged();
}

QString System::userName() const
{
    return m_userName;
}

void System::setUserName(const QString &newUserName)
{
    if (m_userName == newUserName)
        return;
    m_userName = newUserName;
    emit userNameChanged();
}

QString System::currentTime() const
{
    return m_currentTime;
}

void System::setCurrentTime(const QString &newCurrentTime)
{
    if (m_currentTime == newCurrentTime)
        return;
    m_currentTime = newCurrentTime;
    emit currentTimeChanged();
}

void System::setCurrentTimeTimerTimeout()
{
    QDateTime dateTime;
    QString currentTime = dateTime.currentDateTime().toString("hh:mm ap");
    //qDebug() << currentTime;

    setCurrentTime(currentTime);

    m_currentTimeTimer->start();
}

bool System::isCelsius() const
{
    return m_isCelsius;
}

void System::setIsCelsius(bool newIsCelsius)
{
    if (m_isCelsius == newIsCelsius)
        return;
    m_isCelsius = newIsCelsius;
    emit isCelsiusChanged();
}
