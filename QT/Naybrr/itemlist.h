#ifndef ITEMLIST_H
#define ITEMLIST_H

#include "NaybrrItem.h"



class ItemList: public QObject
{
    Q_OBJECT
public:
    ItemList(QObject* parent = nullptr);

    QList<NaybrrItem*> items() const;
    void appendItem(NaybrrItem*  i);
    void setItems(QList<NaybrrItem*>  items);
private:
    QList<NaybrrItem*> mItems;
    bool setItemAt(int index,  NaybrrItem* item);


};

#endif // ITEMLIST_H
