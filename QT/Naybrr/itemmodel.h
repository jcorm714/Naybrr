#ifndef ITEMMODEL_H
#define ITEMMODEL_H

#include "NaybrrItem.h"
#include "itemlist.h"
#include <QAbstractListModel>

class ItemList;
class ItemModel : public QAbstractListModel
{
    Q_OBJECT
    Q_PROPERTY(ItemList* items READ items WRITE setList)
public:
    explicit ItemModel(QObject *parent = nullptr);

    enum{
        NameRole = Qt::UserRole,
        DescriptionRole,
        PriceRole,
        IdRole

    };

    // Basic functionality:
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;

    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;

    virtual QHash<int, QByteArray> roleNames() const override;

    ItemList* items() ;
    void setList(ItemList* l);

private:
    ItemList* mItemList;
};

#endif // ITEMMODEL_H
