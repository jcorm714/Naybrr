#include "user.h"
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
