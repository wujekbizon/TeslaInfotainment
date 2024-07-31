#include "AudioController.h"

AudioController::AudioController(QObject *parent)
    : QObject{parent}
    , m_volumeLevel(1)
{}

int AudioController::volumeLevel() const
{
    return m_volumeLevel;
}

void AudioController::incrementVolume(const int &value)
{
    int newVolumeLevel = m_volumeLevel + value;
    if (newVolumeLevel <= 0) {
        newVolumeLevel = 0;
    }

    if (newVolumeLevel >= 100) {
        newVolumeLevel = 100;
    }

    setVolumeLevel(newVolumeLevel);
}

void AudioController::setVolumeLevel(int newVolumeLevel)
{
    if (m_volumeLevel == newVolumeLevel)
        return;
    m_volumeLevel = newVolumeLevel;
    emit volumeLevelChanged();
}
