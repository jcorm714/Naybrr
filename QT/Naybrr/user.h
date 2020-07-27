#ifndef USER_H
#define USER_H
#include<QString>
#include<QObject>
#include<QtQml>
#include<QtDebug>
#include "item.h"


class User: public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString username READ getUsername WRITE setUsername)
    Q_PROPERTY(QString password READ getPassword WRITE setPassword)
    Q_PROPERTY(QString email READ getEmail WRITE setEmail)
    Q_PROPERTY(QString addr1 READ getAddr1 WRITE setAddr1)
    Q_PROPERTY(QString addr2 READ getAddr2 WRITE setAddr2)
    Q_PROPERTY(QString city READ getCity WRITE setCity)
    Q_PROPERTY(QString state READ getState WRITE setState)
    Q_PROPERTY(QString zip READ getZip WRITE setState)
    Q_PROPERTY(QQmlListProperty<Item> inventory READ getInventory)
    QML_ELEMENT
public:
    User(QObject *parent=nullptr);




    Q_INVOKABLE static bool login(QString, QString);
    Q_INVOKABLE static bool registerUser(User*);
    Q_INVOKABLE static bool registerUser(QString uname, QString pass, QString email,
                                         QString addr1, QString addr2, QString city,
                                         QString state, QString zip);
    void appendItem(Item* i);
    Item *item(int) const;
    int itemCount() const;
    void clearItems();
    void replaceItem(int, Item*);
    void removeLastItem();

    //gets
    int getUserId(){return mUserId;}
    QString getUsername(){return mUserName;}
    QString getPassword(){return mPassword;}
    QString getEmail(){return mEmail;}
    QString getAddr1(){return mAddr1;}
    QString getAddr2(){return mAddr2;}
    QString getCity(){return mCity;}
    QString getState(){return mState;}
    QString getZip(){return mZip;}
    QQmlListProperty<Item> getInventory();

    //Sets
    void setUsername(QString newValue){mUserName = newValue;}
    void setPassword(QString newValue){mPassword = newValue;}
    void setEmail(QString newValue){mEmail = newValue;}
    void setAddr1(QString newValue){mAddr1 = newValue;}
    void setAddr2(QString newValue){mAddr2 = newValue;}
    void setCity(QString newValue){mCity = newValue;}
    void setState(QString newValue){mState = newValue;}
    void setZip(QString newValue){mZip = newValue;}

private:
    int mUserId;
    QString mUserName;
    QString mPassword;
    QString mEmail;
    QString mAddr1;
    QString mAddr2;
    QString mCity;
    QString mState;
    QString mZip;
    QVector<Item*> items;

    static void appendItem(QQmlListProperty<Item>*, Item*);
    static int itemCount(QQmlListProperty<Item>*);
    static void clearItems(QQmlListProperty<Item>*);
    static void replaceItem(QQmlListProperty<Item>*, int, Item*);
    static void removeLastItem(QQmlListProperty<Item>*);
    static Item* item(QQmlListProperty<Item>*, int);




};

#endif // USER_H
