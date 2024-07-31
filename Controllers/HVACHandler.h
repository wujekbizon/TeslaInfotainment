#ifndef HVACHANDLER_H
#define HVACHANDLER_H

#include <QObject>

class HVACHandler : public QObject
{
    Q_OBJECT
    Q_PROPERTY(double targetTemperature READ targetTemperature WRITE setTargetTemperature NOTIFY
                   targetTemperatureChanged)
public:
    explicit HVACHandler(QObject *parent = nullptr);

    double targetTemperature() const;
    Q_INVOKABLE void incrementTargetTemperature(const double &value);
public slots:
    void setTargetTemperature(double newTargetTemperature);
signals:
    void targetTemperatureChanged();

private:
    double m_targetTemperature;
};

#endif // HVACHANDLER_H
