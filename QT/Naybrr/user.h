#ifndef USER_H
#define USER_H
#include<QString>
#include<QObject>
#include<QtQml>
#include<QtDebug>



class User: public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString username READ getUsername WRITE setUsername)
    Q_PROPERTY(QString password READ getPassword WRITE setPassword)
    Q_PROPERTY(QString email READ getEmail WRITE setEmail)
    Q_PROPERTY(QString addr1 READ getAddr1 WRITE setAddr1)
    Q_PROPERTY(QString addr2 READ getAddr2 WRITE setAddr2)
    Q_PROPERTY(QString city READ getCity WRITE setCity)
    Q_PROPERTY(QString state READ getState WRITE setState)
    Q_PROPERTY(QString zip READ getZip WRITE setState)
    Q_PROPERTY(int uId READ getUserId WRITE setUserId)
    QML_ELEMENT
public:
    User(QObject *parent=nullptr);


    //gets
    int getUserId(){return mUserId;}
    QString getUsername(){return mUserName;}
    QString getPassword(){return mPassword;}
    QString getEmail(){return mEmail;}
    QString getAddr1(){return mAddr1;}
    QString getAddr2(){return mAddr2;}
    QString getCity(){return mCity;}
    QString getState(){return mState;}
    QString getZip(){return mZip;}


    //Sets
    void setUserId(int id) {mUserId = id;}
    void setUsername(QString newValue){mUserName = newValue;}
    void setPassword(QString newValue){mPassword = newValue;}
    void setEmail(QString newValue){mEmail = newValue;}
    void setAddr1(QString newValue){mAddr1 = newValue;}
    void setAddr2(QString newValue){mAddr2 = newValue;}
    void setCity(QString newValue){mCity = newValue;}
    void setState(QString newValue){mState = newValue;}
    void setZip(QString newValue){mZip = newValue;}

private:
    int mUserId;
    QString mUserName;
    QString mPassword;
    QString mEmail;
    QString mAddr1;
    QString mAddr2;
    QString mCity;
    QString mState;
    QString mZip;

};

#endif // USER_H
