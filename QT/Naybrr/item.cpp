#include "item.h"
Item::Item(QObject* parent):
    QObject(parent)
{

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
