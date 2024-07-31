#include "AudioSearchModel.h"
#include <QJsonArray>
#include <QJsonDocument>
#include <QJsonObject>
#include <QNetworkReply>
#include <QUrlQuery>
#include "AudioInfo.h"

namespace {
const QString &k_requestUrl = "https://api.jamendo.com/v3.0/tracks/";
const QString &k_clientId = "1a3e35eb";
} // namespace

AudioSearchModel::AudioSearchModel(QObject *parent)
    : QAbstractListModel{parent}
{}

int AudioSearchModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_audioList.length();
}

QVariant AudioSearchModel::data(const QModelIndex &index, int role) const
{
    if (index.isValid() && index.row() >= 0 && index.row() < m_audioList.length()) {
        AudioInfo *audioInfo = m_audioList[index.row()];

        switch ((Role) role) {
        case AudioNameRole:
            return audioInfo->title();
        case AudioAuthorRole:
            return audioInfo->authorName();
        case AudioImageSourceRole:
            return audioInfo->imageSource();
        case AudioSourceRole:
            return audioInfo->audioSource();
        }
    }

    return {};
}

QHash<int, QByteArray> AudioSearchModel::roleNames() const
{
    QHash<int, QByteArray> names;

    names[AudioNameRole] = "audioName";
    names[AudioAuthorRole] = "audioAuthor";
    names[AudioImageSourceRole] = "audioImageSource";
    names[AudioSourceRole] = "audioSource";

    return names;
}

void AudioSearchModel::searchSong(const QString &name)
{
    if (!name.trimmed().isEmpty()) {
        if (m_reply) {
            m_reply->abort();
            m_reply->deleteLater();
            m_reply = nullptr;
        }

        QUrlQuery query;
        query.addQueryItem("client_id", k_clientId);
        query.addQueryItem("namesearch", name);
        query.addQueryItem("format", "json");
        query.addQueryItem("limit", "30");

        setIsSearching(true);
        m_reply = m_networkManager.get(QNetworkRequest(k_requestUrl + "?" + query.toString()));
        connect(m_reply, &QNetworkReply::finished, this, &AudioSearchModel::parseData);
    }
}

void AudioSearchModel::parseData()
{
    if (m_reply->error() == QNetworkReply::NoError) {
        beginResetModel();

        qDeleteAll(m_audioList);
        m_audioList.clear();

        QByteArray data = m_reply->readAll();

        QJsonDocument jsonDocument = QJsonDocument::fromJson(data);

        QJsonObject headers = jsonDocument["headers"].toObject();

        if (headers["status"].toString() == "success") {
            QJsonArray results = jsonDocument["results"].toArray();

            for (const auto &result : results) {
                QJsonObject entry = result.toObject();

                if (entry["audiodownload_allowed"].toBool()) {
                    qDebug() << "This audio can be downloaded";
                }
                AudioInfo *audioInfo = new AudioInfo(this);

                audioInfo->setTitle(entry["name"].toString());
                audioInfo->setAuthorName(entry["artist_name"].toString());
                audioInfo->setImageSource(entry["album_image"].toString());
                audioInfo->setAudioSource(entry["audiodownload"].toString());

                m_audioList << audioInfo;
            }

        } else {
            qWarning() << headers["error_string"];
        }

        endResetModel();
    } else if (m_reply->error() == QNetworkReply::OperationCanceledError) {
        qCritical() << "Reply failed, error:" << m_reply->errorString();
    }

    setIsSearching(false);
    m_reply->deleteLater();
    m_reply = nullptr;
}

bool AudioSearchModel::isSearching() const
{
    return m_isSearching;
}

void AudioSearchModel::setIsSearching(bool newIsSearching)
{
    if (m_isSearching == newIsSearching)
        return;
    m_isSearching = newIsSearching;
    emit isSearchingChanged();
}
