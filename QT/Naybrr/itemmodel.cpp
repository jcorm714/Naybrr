#include "itemmodel.h"

ItemModel::ItemModel(QObject *parent)
    : QAbstractListModel(parent)
{
}


int ItemModel::rowCount(const QModelIndex &parent) const
{
    // For list models only the root node (an invalid parent) should return the list's size. For all
    // other (valid) parents, rowCount() should return 0 so that it does not become a tree model.
    if (parent.isValid())
        return 0;
    return mItemList->items().count();

    // FIXME: Implement me!
}

QVariant ItemModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant();
    // was writing code for list model
    //but gotta sleep
    NaybrrItem* item = mItemList->items().at(index.row());
    switch (role) {
        case NameRole:
            return QVariant(item->getName());
        case DescriptionRole:
            return QVariant(item->getDesc());
        case PriceRole:
            return QVariant(item->getPrice());
        case IdRole:
            return QVariant(item->getPrice());

    }

    // FIXME: Implement me!
    return QVariant();
}

QHash<int, QByteArray> ItemModel::roleNames() const
{
    QHash<int, QByteArray> names;
    names[NameRole] = "name";
    names[DescriptionRole] = "description";
    names[PriceRole] = "price";
    names[IdRole] = "db_id";
    return names;
 }

ItemList* ItemModel::items()
{
    return mItemList;
}

void ItemModel::setList(ItemList* l)
{
    beginResetModel();
    mItemList = l;
    endResetModel();
}
