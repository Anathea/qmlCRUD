#include <QApplication>
#include <QDebug>

#include "cpp/wmanager.h"

WManager                            *WManager::_singleton = nullptr;

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    WManager::getInstance()->load();

    return a.exec();
}
