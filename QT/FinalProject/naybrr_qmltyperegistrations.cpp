/****************************************************************************
** Generated QML type registration code
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <QtQml/qqml.h>
#include <QtQml/qqmlmoduleregistration.h>

#include <NaybrrItem.h>
#include <cartdao.h>
#include <user.h>
#include <util.h>

void qml_register_types_Naybrr()
{
    qmlRegisterTypesAndRevisions<CartDAO>("Naybrr", 1);
    qmlRegisterTypesAndRevisions<NaybrrItem>("Naybrr", 1);
    qmlRegisterTypesAndRevisions<User>("Naybrr", 1);
    qmlRegisterTypesAndRevisions<Util>("Naybrr", 1);
    qmlRegisterModule("Naybrr", 1, 0);
}

static const QQmlModuleRegistration registration("Naybrr", 1, qml_register_types_Naybrr);
