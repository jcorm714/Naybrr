#ifndef ITEM_H
#define ITEM_H

#include<QObject>
#include<QString>
#include<QtQml>

class Item : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int quantity READ getQuantity WRITE setQuantity)
    Q_PROPERTY(float price READ getPrice WRITE setPrice)
    Q_PROPERTY(QString name READ getName WRITE setName)
    Q_PROPERTY(QString desc READ getDesc WRITE setDesc)
    Q_PROPERTY(QString imgPath READ getImagePath WRITE setImagePath)
    QML_ELEMENT
public:
    Item(QObject *parent=nullptr);


    //gets and sets
    int getId() { return mItemId;}
    int getQuantity() {return mItemQuantity;}
    void setQuantity(int v) {mItemQuantity = v;}
    float getPrice(){return mItemPrice;}
    void setPrice(float v){mItemPrice = v;}
    QString getName() {return mItemName;}
    void setName(QString name){mItemName = name;}
    QString getDesc(){return mItemDesc;}
    void setDesc(QString d){mItemDesc = d;}
    QString getImagePath(){return mImagePath;}
    void setImagePath(QString p){mImagePath = p;}


private:
    int mItemId;
    int mAccountId;
    int mItemQuantity;
    float mItemPrice;
    QString mItemName;
    QString mItemDesc;
    QString mImagePath;


signals:
    void onImageUpdated();
};

#endif // ITEM_H
