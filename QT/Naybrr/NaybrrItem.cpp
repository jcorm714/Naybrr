#include "NaybrrItem.h"
NaybrrItem::NaybrrItem(QObject* parent):
    QObject(parent)
{

}

NaybrrItem::NaybrrItem(int id, int quantity, float price, QString name, QString desc, QString imPath):
    mItemId(id),
    mItemQuantity(quantity),
    mItemPrice(price),
    mItemName(name),
    mItemDesc(desc),
    mImagePath(imPath)

{}



NaybrrItem::NaybrrItem(int id){
    this->mItemId = id;
    this->mItemName = NaybrrItem::db[id]->getName();
    this->mItemDesc = NaybrrItem::db[id]->getDesc();
    this->mItemPrice = NaybrrItem::db[id]->getPrice();
    this->mItemQuantity = NaybrrItem::db[id]->getQuantity();
    this->mImagePath = NaybrrItem::db[id]->getImagePath();
}


void NaybrrItem::downloadImage(const QString &url, const QString &filePath){
    if(!mImageReady){
        return;
    }
    mImageReady = false;

    //returns the end of a url, which should be the image object
    const QString fileName = filePath + url.right(url.size() - url.lastIndexOf("/"));
    mFile = new QFile();
    mFile->setFileName(fileName);
    mFile->open(QIODevice::WriteOnly);
    if(!mFile->isOpen()){
        mImageReady = true;
        return;
    }



    QNetworkAccessManager *manager = new QNetworkAccessManager();
    QNetworkRequest req;
    req.setUrl(url);
    connect(manager, SIGNAL(finished(QNetworkReply* )), this, SLOT(onDownloadFileComplete(QNetworkReply*)));

}

void NaybrrItem::onImageReady(QNetworkReply *reply){
    if(!mFile->isWritable()){
        mImageReady = true;
        return;
    }

    mFile->write(reply->readAll());
    mFile->close();
    mImageReady = true;
}

/*
The following init() function is used to fill the "db"
which is just a list for the time being.
*/

QList<NaybrrItem*> init(){
    QList<NaybrrItem*> tmp;
    tmp.append( new NaybrrItem(0, 2, 4.99, "Salt", "Lorem Ipsum", ""));
    tmp.append( new NaybrrItem(1, 2, 4.99, "Sugar", "Lorem Ipsum", ""));
    tmp.append( new NaybrrItem(2, 2, 4.99, "Water", "Lorem Ipsum", ""));
    return tmp;
}

QList<NaybrrItem*> NaybrrItem::db(init());

NaybrrItem* NaybrrItem::findItemInDB(int id){
    return new NaybrrItem(id);
}


