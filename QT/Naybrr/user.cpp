#include "user.h"
#include <QtSql>
User::User(QObject *parent):
    QObject(parent)

{}

void User::appendItem(Item *i){
    items.append(i);
}

int User::itemCount() const{
    return items.count();
}

Item *User::item(int ndx) const{
    return items.at(ndx);
}

void User::clearItems(){
    items.clear();
}

void User::replaceItem(int ndx, Item * i){
    items[ndx] = i;
}

void User::removeLastItem(){
    items.removeLast();
}

QQmlListProperty<Item> User::getInventory(){

    return { this, this,
            &User::appendItem,
            &User::itemCount,
            &User::item,
            &User::clearItems,
            &User::replaceItem,
            &User::removeLastItem
    };
}

void User::appendItem(QQmlListProperty<Item>* list, Item* i){
    reinterpret_cast<User*>(list->data)->appendItem(i);
}

void User::clearItems(QQmlListProperty<Item>* list){
    reinterpret_cast<User*>(list->data)->clearItems();
}

void User::replaceItem(QQmlListProperty<Item>* list, int ndx, Item* i)
{
    reinterpret_cast<User*>(list->data)->replaceItem(ndx,i);
}
void User::removeLastItem(QQmlListProperty<Item>* list){
    reinterpret_cast<User*>(list->data)->removeLastItem();
}
Item* User::item(QQmlListProperty<Item>* list, int ndx){
    return reinterpret_cast<User*>(list->data)->item(ndx);
}
int User::itemCount(QQmlListProperty<Item>* list){
    return reinterpret_cast<User*>(list->data)->itemCount();
}


//TODO: actually connect to the database
bool createConnection()
{
    QSqlDatabase db = QSqlDatabase::addDatabase("QMYSQL");
    db.setHostName("localhost");
    db.setDatabaseName("test");
    db.setUserName("root");
    db.setPassword("******");

    if (!db.open()){
       QObject::tr("Error"),
       db.lastError().text();
       return false;
    }
    return true;
}

bool User::login(QString name, QString password){
    return (name == "test" && password == "test");
}

bool User::registerUser(QString uname, QString pass, QString email,
                        QString addr1, QString addr2, QString city,
                        QString state, QString zip) {

    qDebug() << uname << ' ' << pass << ' ' << email << '\n'
           << addr1 << ' ' << addr2 << '\n'
           << city << ' ' << state << ' ' << zip;

    return true;
}

bool User::registerUser(User* u){
    registerUser(u->getUsername(), u->getPassword(), u->getEmail(),
                 u->getAddr1(), u->getAddr2(), u->getCity(),
                 u->getState(),u->getZip());
}
