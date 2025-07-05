#-------------------------------------------------
#
# Project created by QtCreator 2016-08-29T17:33:30
#
#-------------------------------------------------

QT += core gui sql core5compat

CONFIG += ninja

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets printsupport

TARGET = wubigendaqi

TEMPLATE = app

INCLUDEPATH += include

SOURCES += \
    $$files(src/*.cpp) \
    $$files(src/Menu/*.cpp) \


HEADERS  += \
    $$files(include/*.h) \
    $$files(include/Menu/*.h)\

FORMS += \
    $$files(ui/*.ui) \
    $$files(ui/Menu/*.ui) \

RESOURCES += \
    res/res.qrc \

# UI_DIR=./UI
