#include "util.h"

Util::Util(QObject *parent) : QObject(parent)
{

}

QString Util::hashPassword(QString data)
{
    QByteArray hash = QCryptographicHash::hash(data.toUtf8(), QCryptographicHash::Md5);
    return QString::fromStdString(hash.toStdString());
}
