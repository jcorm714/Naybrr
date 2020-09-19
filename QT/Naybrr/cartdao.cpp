#include "cartdao.h"
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QVariant>
CartDAO::CartDAO(QObject *parent) : QObject(parent)
{

}

QList<int> CartDAO::getItemIdsInCart()
{
    QSqlDatabase db = QSqlDatabase::database();
    QList<int> itemIds;
    const QString qry = "SELECT ItemId FROM CartItems";
    QSqlQuery q = QSqlQuery(qry);
    while(q.next()){
        itemIds.append(q.value(0).toInt());
    }
    return itemIds;
}


bool CartDAO::isItemInCart(int itemId)
{
    bool inCart = false;
    QSqlDatabase db = QSqlDatabase::database();
    QSqlQuery q;
    const QString qry ("SELECT count(*) FROM CartItems WHERE ItemId = :id");
    q.prepare(qry);
    q.bindValue(0, itemId);
    q.exec();
    if(q.isSelect() && q.first()){
        int count = q.value(0).toInt();
        if(count > 0)
            inCart = true;
    }
    return inCart;
}

int CartDAO::numberOfItemsInCart()
{
    int count = 0;
    QSqlDatabase db = QSqlDatabase();
    const QString qry = "SELECT count(ItemId) FROM CartItems;";
    QSqlQuery q = QSqlQuery(qry);
    q.exec();
    if(q.isSelect() && q.first()){
        count = q.value(0).toInt();
    }

    return count;
}

void CartDAO::addItemToCart(int itemId)
{
    QSqlDatabase db = QSqlDatabase::database();
    QSqlQuery q;
    const QString ins = "INSERT INTO CartItems (ItemId) VALUES (:id);";
    q.prepare(ins);
    QVariant v(itemId);
    q.bindValue(0,v);
    q.exec();
}

void CartDAO::removeItemFromCart(int itemId)
{
    QSqlDatabase db = QSqlDatabase::database();
    QSqlQuery q;
    const QString del = "DELETE FROM CartItems WHERE ItemId = :id";
    q.prepare(del);
    QVariant v(itemId);
    q.bindValue(0,v);
    q.exec();

}

void CartDAO::dropCreateDatabase()
{
    QString qry = "DROP TABLE CartItems; ";
    qry += " CREATE TABLE IF NOT EXISTS CartItems (ItemId INTEGER);";
    QSqlQuery q = QSqlQuery(qry);
    q.exec();
}
