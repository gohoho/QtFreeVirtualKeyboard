//============================================================================
/// \file   main.cpp
/// \author Uwe Kindler
/// \date   08.01.2015
/// \brief  main of virtual keyboard example application
//============================================================================

//============================================================================
//                                   INCLUDES
//============================================================================
#include <QQuickWidget>
#include <QApplication>
#include <QQmlEngine>
#include <QQmlContext>
#include <QDebug>
#include <QScreen>


int main(int argc, char *argv[])
{
    // Load virtualkeyboard input context plugin
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

    QApplication app(argc, argv);

    QQuickWidget view;
    view.setSource(QString("Main.qml"));
    view.engine()->rootContext()->setContextProperty("screenPixelDensity",
        QApplication::primaryScreen()->physicalDotsPerInch());
    view.resize(800, 480);
    view.setResizeMode(QQuickWidget::SizeRootObjectToView);
    view.show();

    return app.exec();
}
