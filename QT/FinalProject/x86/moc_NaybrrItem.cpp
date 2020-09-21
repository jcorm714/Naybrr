/****************************************************************************
** Meta object code from reading C++ file 'NaybrrItem.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../../Naybrr/NaybrrItem.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'NaybrrItem.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_NaybrrItem_t {
    QByteArrayData data[15];
    char stringdata0[112];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_NaybrrItem_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_NaybrrItem_t qt_meta_stringdata_NaybrrItem = {
    {
QT_MOC_LITERAL(0, 0, 10), // "NaybrrItem"
QT_MOC_LITERAL(1, 11, 11), // "QML.Element"
QT_MOC_LITERAL(2, 23, 4), // "auto"
QT_MOC_LITERAL(3, 28, 10), // "onImageGet"
QT_MOC_LITERAL(4, 39, 0), // ""
QT_MOC_LITERAL(5, 40, 12), // "findItemInDB"
QT_MOC_LITERAL(6, 53, 11), // "NaybrrItem*"
QT_MOC_LITERAL(7, 65, 2), // "id"
QT_MOC_LITERAL(8, 68, 4), // "dbId"
QT_MOC_LITERAL(9, 73, 8), // "quantity"
QT_MOC_LITERAL(10, 82, 5), // "accId"
QT_MOC_LITERAL(11, 88, 5), // "price"
QT_MOC_LITERAL(12, 94, 4), // "name"
QT_MOC_LITERAL(13, 99, 4), // "desc"
QT_MOC_LITERAL(14, 104, 7) // "imgPath"

    },
    "NaybrrItem\0QML.Element\0auto\0onImageGet\0"
    "\0findItemInDB\0NaybrrItem*\0id\0dbId\0"
    "quantity\0accId\0price\0name\0desc\0imgPath"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_NaybrrItem[] = {

 // content:
       8,       // revision
       0,       // classname
       1,   14, // classinfo
       2,   16, // methods
       7,   30, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       1,       // signalCount

 // classinfo: key, value
       1,    2,

 // signals: name, argc, parameters, tag, flags
       3,    0,   26,    4, 0x06 /* Public */,

 // methods: name, argc, parameters, tag, flags
       5,    1,   27,    4, 0x02 /* Public */,

 // signals: parameters
    QMetaType::Void,

 // methods: parameters
    0x80000000 | 6, QMetaType::Int,    7,

 // properties: name, type, flags
       8, QMetaType::Int, 0x00095003,
       9, QMetaType::Int, 0x00095103,
      10, QMetaType::Int, 0x00095103,
      11, QMetaType::Float, 0x00095103,
      12, QMetaType::QString, 0x00095103,
      13, QMetaType::QString, 0x00095103,
      14, QMetaType::QString, 0x00095003,

       0        // eod
};

void NaybrrItem::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<NaybrrItem *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->onImageGet(); break;
        case 1: { NaybrrItem* _r = _t->findItemInDB((*reinterpret_cast< int(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< NaybrrItem**>(_a[0]) = std::move(_r); }  break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (NaybrrItem::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&NaybrrItem::onImageGet)) {
                *result = 0;
                return;
            }
        }
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty) {
        auto *_t = static_cast<NaybrrItem *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< int*>(_v) = _t->getId(); break;
        case 1: *reinterpret_cast< int*>(_v) = _t->getQuantity(); break;
        case 2: *reinterpret_cast< int*>(_v) = _t->getAccId(); break;
        case 3: *reinterpret_cast< float*>(_v) = _t->getPrice(); break;
        case 4: *reinterpret_cast< QString*>(_v) = _t->getName(); break;
        case 5: *reinterpret_cast< QString*>(_v) = _t->getDesc(); break;
        case 6: *reinterpret_cast< QString*>(_v) = _t->getImagePath(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        auto *_t = static_cast<NaybrrItem *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setItemId(*reinterpret_cast< int*>(_v)); break;
        case 1: _t->setQuantity(*reinterpret_cast< int*>(_v)); break;
        case 2: _t->setAccId(*reinterpret_cast< int*>(_v)); break;
        case 3: _t->setPrice(*reinterpret_cast< float*>(_v)); break;
        case 4: _t->setName(*reinterpret_cast< QString*>(_v)); break;
        case 5: _t->setDesc(*reinterpret_cast< QString*>(_v)); break;
        case 6: _t->setImagePath(*reinterpret_cast< QString*>(_v)); break;
        default: break;
        }
    } else if (_c == QMetaObject::ResetProperty) {
    }
#endif // QT_NO_PROPERTIES
}

QT_INIT_METAOBJECT const QMetaObject NaybrrItem::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_NaybrrItem.data,
    qt_meta_data_NaybrrItem,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *NaybrrItem::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *NaybrrItem::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_NaybrrItem.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int NaybrrItem::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 2)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 2;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 2)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 2;
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 7;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 7;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 7;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 7;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 7;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 7;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void NaybrrItem::onImageGet()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
