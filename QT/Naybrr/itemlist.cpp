#include "itemlist.h"
ItemList::ItemList(QObject* parent): QObject(parent){

}

QList<NaybrrItem *> ItemList::items() const
{
    return  mItems;
}

bool ItemList::setItemAt(int index, NaybrrItem *item)
{
    if (index < 0 || index >= mItems.size())
            return false;

    mItems[index] = item;
    return true;
}

void ItemList::appendItem(NaybrrItem* item)
{

    mItems.append(item);
}

void ItemList::setItems(QList<NaybrrItem *> items)
{
    mItems = items;
}


