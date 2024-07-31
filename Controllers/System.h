#ifndef SYSTEM_H
#define SYSTEM_H

#include <QObject>
#include <QTimer>

class System : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool carLocked READ carLocked WRITE setCarLocked NOTIFY carLockedChanged)
    Q_PROPERTY(int outdoorTemp READ outdoorTemp WRITE setOutdoorTemp NOTIFY outdoorTempChanged)
    Q_PROPERTY(bool isCelsius READ isCelsius WRITE setIsCelsius NOTIFY isCelsiusChanged)
    Q_PROPERTY(QString userName READ userName WRITE setUserName NOTIFY userNameChanged)
    Q_PROPERTY(QString currentTime READ currentTime WRITE setCurrentTime NOTIFY currentTimeChanged)

public:
    explicit System(QObject *parent = nullptr);
    bool carLocked() const;
    int outdoorTemp() const;
    QString userName() const;
    QString currentTime() const;
    bool isCelsius() const;

public slots:
    void setCarLocked(bool newCarLocked);
    void setOutdoorTemp(int newOutdoorTemp);
    void setUserName(const QString &newUserName);
    void setCurrentTime(const QString &newCurrentTime);
    void setCurrentTimeTimerTimeout();
    void setIsCelsius(bool newIsCelsius);

signals:
    void carLockedChanged();
    void outdoorTempChanged();
    void userNameChanged();
    void currentTimeChanged();

    void isCelsiusChanged();

private:
    bool m_carLocked;
    int m_outdoorTemp;
    QString m_userName;
    QString m_currentTime;
    QTimer *m_currentTimeTimer;
    bool m_isCelsius;
};

#endif // SYSTEM_H
