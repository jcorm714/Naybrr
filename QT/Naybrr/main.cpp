#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>

#include "NaybrrItem.h"
#include "itemlist.h"
#include "itemmodel.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);


    //added Types for qml
    qmlRegisterType<ItemModel>("Items", 1, 0, "ItemsModel");
    qmlRegisterUncreatableType<ItemList>("Items", 1,0, "ItemsList", QStringLiteral("Items List should not be created in QML"));
    ItemList itemsList;
    //use google's material design
    QQuickStyle::setStyle("material");
    itemsList.setItems(NaybrrItem::db);


    QQmlApplicationEngine engine;

//    add Items to root context
    engine.rootContext()->setContextProperty(QStringLiteral("ItemsList"), &itemsList);

    engine.addImportPath("qrc:/");



    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
