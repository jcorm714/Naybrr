#ifndef UTIL_H
#define UTIL_H

#include<QCryptographicHash>
#include <QObject>
#include <QQmlEngine>
class Util: public QObject
{
    Q_OBJECT
    QML_NAMED_ELEMENT(Util)
    QML_SINGLETON
public:
    Util(QObject *parent = nullptr);
    Q_INVOKABLE QString hashPassword(QString data);

};

#endif // UTIL_H
