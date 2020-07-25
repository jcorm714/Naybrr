#ifndef USER_H
#define USER_H
#include<QString>
#include<QObject>
#include<QtQml>
#include "item.h"


class User: public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString msername READ getUsername)
    Q_PROPERTY(QString password READ getPassword)
    Q_PROPERTY(QString email READ getEmail)
    Q_PROPERTY(QQmlListProperty<Item> inventory READ getInventory)
    QML_ELEMENT
public:
    User(QObject *parent=nullptr);




    bool Login();
    bool Register();
    void appendItem(Item* i);
    Item *item(int) const;
    int itemCount() const;
    void clearItems();
    void replaceItem(int, Item*);
    void removeLastItem();

    //gets and sets
    int getUserId(){return mUserId;}
    QString getUsername(){return mUserName;}
    QString getPassword(){return mPassword;}
    QString getEmail(){return mEmail;}
    QQmlListProperty<Item> getInventory();


private:
    int mUserId;
    QString mUserName;
    QString mPassword;
    QString mEmail;
    QVector<Item*> items;

    static void appendItem(QQmlListProperty<Item>*, Item*);
    static int itemCount(QQmlListProperty<Item>*);
    static void clearItems(QQmlListProperty<Item>*);
    static void replaceItem(QQmlListProperty<Item>*, int, Item*);
    static void removeLastItem(QQmlListProperty<Item>*);
    static Item* item(QQmlListProperty<Item>*, int);




};

#endif // USER_H
