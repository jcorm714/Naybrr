#include "item.h"
Item::Item(QObject* parent):
    QObject(parent)
{

}

Item::Item(int id, int quantity, float price, QString name, QString desc, QString imPath):
    mItemId(id),
    mItemQuantity(quantity),
    mItemPrice(price),
    mItemName(name),
    mItemDesc(desc),
    mImagePath(imPath)

{}

Item::Item(int id){
    this->mItemId = id;
    this->mItemName = Item::db[id]->getName();
    this->mItemDesc = Item::db[id]->getDesc();
    this->mItemPrice = Item::db[id]->getPrice();
    this->mItemQuantity = Item::db[id]->getQuantity();
    this->mImagePath = Item::db[id]->getImagePath();
}


void Item::downloadImage(const QString &url, const QString &filePath){
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

void Item::onImageReady(QNetworkReply *reply){
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

QList<Item*> init(){
    QList<Item*> tmp;
    tmp.append( new Item(0, 2, 4.99, "Salt", "Lorem Ipsum", ""));
    tmp.append( new Item(1, 2, 4.99, "Sugar", "Lorem Ipsum", ""));
    tmp.append( new Item(2, 2, 4.99, "Water", "Lorem Ipsum", ""));
    return tmp;
}

QList<Item*> Item::db(init());

Item* Item::findItemInDB(int id){
    return new Item(id);
}
