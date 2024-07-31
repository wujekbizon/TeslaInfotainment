#include "HVACHandler.h"

HVACHandler::HVACHandler(QObject *parent)
    : QObject{parent}
    , m_targetTemperature(70.0)
{}

double HVACHandler::targetTemperature() const
{
    return m_targetTemperature;
}

void HVACHandler::incrementTargetTemperature(const double &value)
{
    double newTargetTemp = m_targetTemperature + value;
    setTargetTemperature(newTargetTemp);
}

void HVACHandler::setTargetTemperature(double newTargetTemperature)
{
    if (qFuzzyCompare(m_targetTemperature, newTargetTemperature))
        return;
    m_targetTemperature = newTargetTemperature;
    emit targetTemperatureChanged();
}
