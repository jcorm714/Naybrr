#ifndef NAYBRR_ITEM_H
#define NAYBRR_ITEM_H

#include<QObject>
#include<QString>
#include<QtQml>
#include <QNetworkAccessManager>
#include<QStandardItemModel>
#include<QAbstractItemModel>

class NaybrrItem : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int dbId READ getId)
    Q_PROPERTY(int quantity READ getQuantity WRITE setQuantity)
    Q_PROPERTY(float price READ getPrice WRITE setPrice)
    Q_PROPERTY(QString name READ getName WRITE setName)
    Q_PROPERTY(QString desc READ getDesc WRITE setDesc)
    Q_PROPERTY(QString imgPath READ getImagePath WRITE setImagePath)
    QML_ELEMENT


public:

    Q_INVOKABLE static NaybrrItem* findItemInDB(int id);

    static QList<NaybrrItem*> db;

    // for constructing from db call
    NaybrrItem(int id);
    NaybrrItem(QObject *parent=nullptr);
    NaybrrItem(int, int, float, QString, QString, QString);

    bool mImageReady;
    QFile* mFile;
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


    //the following two functions allow for us to download images, and display them
    void downloadImage(const QString &url, const QString &filePath);
    void onImageReady(QNetworkReply * reply);



private:
    int mItemId;
    int mAccountId;
    int mItemQuantity;
    float mItemPrice;
    QString mItemName;
    QString mItemDesc;
    QString mImagePath;



signals:
    void onImageGet();
};

#endif // ITEM_H
