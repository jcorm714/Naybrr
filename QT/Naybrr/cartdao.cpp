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

void CartDAO::addItemToCart(int itemId)
{
    QSqlDatabase db = QSqlDatabase::database();
    QSqlQuery q;
    const QString ins = "INSERT INTO CartItems (ItemId) VALUES (:id)";
    q.prepare(ins);
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
