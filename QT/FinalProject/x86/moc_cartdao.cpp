/****************************************************************************
** Meta object code from reading C++ file 'cartdao.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../../Naybrr/cartdao.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'cartdao.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_CartDAO_t {
    QByteArrayData data[14];
    char stringdata0[165];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_CartDAO_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_CartDAO_t qt_meta_stringdata_CartDAO = {
    {
QT_MOC_LITERAL(0, 0, 7), // "CartDAO"
QT_MOC_LITERAL(1, 8, 11), // "QML.Element"
QT_MOC_LITERAL(2, 20, 4), // "Cart"
QT_MOC_LITERAL(3, 25, 13), // "QML.Singleton"
QT_MOC_LITERAL(4, 39, 4), // "true"
QT_MOC_LITERAL(5, 44, 13), // "addItemToCart"
QT_MOC_LITERAL(6, 58, 0), // ""
QT_MOC_LITERAL(7, 59, 6), // "itemId"
QT_MOC_LITERAL(8, 66, 18), // "removeItemFromCart"
QT_MOC_LITERAL(9, 85, 18), // "dropCreateDatabase"
QT_MOC_LITERAL(10, 104, 16), // "getItemIdsInCart"
QT_MOC_LITERAL(11, 121, 10), // "QList<int>"
QT_MOC_LITERAL(12, 132, 12), // "isItemInCart"
QT_MOC_LITERAL(13, 145, 19) // "numberOfItemsInCart"

    },
    "CartDAO\0QML.Element\0Cart\0QML.Singleton\0"
    "true\0addItemToCart\0\0itemId\0"
    "removeItemFromCart\0dropCreateDatabase\0"
    "getItemIdsInCart\0QList<int>\0isItemInCart\0"
    "numberOfItemsInCart"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_CartDAO[] = {

 // content:
       8,       // revision
       0,       // classname
       2,   14, // classinfo
       6,   18, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // classinfo: key, value
       1,    2,
       3,    4,

 // slots: name, argc, parameters, tag, flags
       5,    1,   48,    6, 0x0a /* Public */,
       8,    1,   51,    6, 0x0a /* Public */,
       9,    0,   54,    6, 0x0a /* Public */,

 // methods: name, argc, parameters, tag, flags
      10,    0,   55,    6, 0x02 /* Public */,
      12,    1,   56,    6, 0x02 /* Public */,
      13,    0,   59,    6, 0x02 /* Public */,

 // slots: parameters
    QMetaType::Void, QMetaType::Int,    7,
    QMetaType::Void, QMetaType::Int,    7,
    QMetaType::Void,

 // methods: parameters
    0x80000000 | 11,
    QMetaType::Bool, QMetaType::Int,    6,
    QMetaType::Int,

       0        // eod
};

void CartDAO::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<CartDAO *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->addItemToCart((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 1: _t->removeItemFromCart((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 2: _t->dropCreateDatabase(); break;
        case 3: { QList<int> _r = _t->getItemIdsInCart();
            if (_a[0]) *reinterpret_cast< QList<int>*>(_a[0]) = std::move(_r); }  break;
        case 4: { bool _r = _t->isItemInCart((*reinterpret_cast< int(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = std::move(_r); }  break;
        case 5: { int _r = _t->numberOfItemsInCart();
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = std::move(_r); }  break;
        default: ;
        }
    }
}

QT_INIT_METAOBJECT const QMetaObject CartDAO::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_CartDAO.data,
    qt_meta_data_CartDAO,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *CartDAO::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *CartDAO::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_CartDAO.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int CartDAO::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 6)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 6;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 6)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 6;
    }
    return _id;
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
