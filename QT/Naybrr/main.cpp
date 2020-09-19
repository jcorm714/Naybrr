#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QStandardPaths>
#include <QSqlDatabase>
#include <QSqlQuery>
int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QString basePath = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation);
    basePath += "/CartItems";
    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName(basePath);
    bool ok = db.open();
    qDebug() << basePath << '\n';
    qDebug() << "DB OPEN: " << ok;

    const QString qry = "CREATE TABLE IF NOT EXISTS CartItems (ItemId INTEGER) ";
    QSqlQuery createTableIfNotExists;
    createTableIfNotExists.exec(qry);

    QGuiApplication app(argc, argv);
    QQuickStyle::setStyle("material");
    QQmlApplicationEngine engine;
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
