/****************************************************************************
** Meta object code from reading C++ file 'util.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../../Naybrr/util.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'util.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_Util_t {
    QByteArrayData data[7];
    char stringdata0[55];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_Util_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_Util_t qt_meta_stringdata_Util = {
    {
QT_MOC_LITERAL(0, 0, 4), // "Util"
QT_MOC_LITERAL(1, 5, 11), // "QML.Element"
QT_MOC_LITERAL(2, 17, 13), // "QML.Singleton"
QT_MOC_LITERAL(3, 31, 4), // "true"
QT_MOC_LITERAL(4, 36, 12), // "hashPassword"
QT_MOC_LITERAL(5, 49, 0), // ""
QT_MOC_LITERAL(6, 50, 4) // "data"

    },
    "Util\0QML.Element\0QML.Singleton\0true\0"
    "hashPassword\0\0data"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_Util[] = {

 // content:
       8,       // revision
       0,       // classname
       2,   14, // classinfo
       1,   18, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // classinfo: key, value
       1,    0,
       2,    3,

 // methods: name, argc, parameters, tag, flags
       4,    1,   23,    5, 0x02 /* Public */,

 // methods: parameters
    QMetaType::QString, QMetaType::QString,    6,

       0        // eod
};

void Util::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<Util *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: { QString _r = _t->hashPassword((*reinterpret_cast< QString(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        default: ;
        }
    }
}

QT_INIT_METAOBJECT const QMetaObject Util::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_Util.data,
    qt_meta_data_Util,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *Util::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *Util::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_Util.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int Util::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 1)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 1;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 1)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 1;
    }
    return _id;
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
