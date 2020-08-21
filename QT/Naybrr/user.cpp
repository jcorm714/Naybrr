#include "user.h"
User::User(QObject *parent):
    QObject(parent)

{}

void User::appendItem(NaybrrItem *i){
    items.append(i);
}

int User::itemCount() const{
    return items.count();
}

NaybrrItem *User::item(int ndx) const{
    return items.at(ndx);
}

void User::clearItems(){
    items.clear();
}

void User::replaceItem(int ndx, NaybrrItem * i){
    items[ndx] = i;
}

void User::removeLastItem(){
    items.removeLast();
}

QQmlListProperty<NaybrrItem> User::getInventory(){

    return { this, this,
            &User::appendItem,
            &User::itemCount,
            &User::item,
            &User::clearItems,
            &User::replaceItem,
            &User::removeLastItem
    };
}

void User::appendItem(QQmlListProperty<NaybrrItem>* list, NaybrrItem* i){
    reinterpret_cast<User*>(list->data)->appendItem(i);
}

void User::clearItems(QQmlListProperty<NaybrrItem>* list){
    reinterpret_cast<User*>(list->data)->clearItems();
}

void User::replaceItem(QQmlListProperty<NaybrrItem>* list, int ndx, NaybrrItem* i)
{
    reinterpret_cast<User*>(list->data)->replaceItem(ndx,i);
}
void User::removeLastItem(QQmlListProperty<NaybrrItem>* list){
    reinterpret_cast<User*>(list->data)->removeLastItem();
}
NaybrrItem* User::item(QQmlListProperty<NaybrrItem>* list, int ndx){
    return reinterpret_cast<User*>(list->data)->item(ndx);
}
int User::itemCount(QQmlListProperty<NaybrrItem>* list){
    return reinterpret_cast<User*>(list->data)->itemCount();
}


//TODO: actually connect to the database
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
    return registerUser(u->getUsername(), u->getPassword(), u->getEmail(),
                 u->getAddr1(), u->getAddr2(), u->getCity(),
                 u->getState(),u->getZip());

}

bool User::updateUser(int id, User * u){
    return updateUser(id ,u->getUsername(), u->getPassword(), u->getEmail(),
                 u->getAddr1(), u->getAddr2(), u->getCity(),
                 u->getState(),u->getZip());


}

bool User::updateUser(int id, QString uname,
                      QString pass, QString email, QString addr1, QString addr2,
                      QString city, QString state, QString zip)
{


    qDebug() << id << ' ' << uname << ' ' << pass << ' ' << email << '\n'
           << addr1 << ' ' << addr2 << '\n'
           << city << ' ' << state << ' ' << zip;


}

