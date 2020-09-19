#ifndef CARTDAO_H
#define CARTDAO_H

#include <QObject>
#include <QList>
#include <QQmlEngine>
class CartDAO : public QObject
{
    Q_OBJECT
    QML_NAMED_ELEMENT(Cart)
    QML_SINGLETON
public:
    explicit CartDAO(QObject *parent = nullptr);
    Q_INVOKABLE QList<int> getItemIdsInCart();
    Q_INVOKABLE bool isItemInCart(int);
    Q_INVOKABLE int numberOfItemsInCart();




public slots:
        void addItemToCart(int itemId);
        void removeItemFromCart(int itemId);
        void dropCreateDatabase();
};

#endif // CARTDAO_H
