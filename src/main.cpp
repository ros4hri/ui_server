// Copyright 2025 PAL Robotics S.L.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtWebView/QtWebView>

#include <QLocale>
#include <QString>
#include <QTranslator>

int main(int argc, char * argv[])
{
  qputenv("QML_XHR_ALLOW_FILE_READ", QString("1").toUtf8());

  QtWebView::initialize();

#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
  QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
  QGuiApplication app(argc, argv);

  QTranslator translator;
  const QStringList uiLanguages = QLocale::system().uiLanguages();
  for (const QString & locale : uiLanguages) {
    const QString baseName = "ui_server_" + QLocale(locale).name();
    if (translator.load(":/i18n/" + baseName)) {
      app.installTranslator(&translator);
      break;
    }
  }

  QQmlApplicationEngine engine;
  const QUrl url(QStringLiteral("qrc:/main.qml"));
  QObject::connect(
    &engine, &QQmlApplicationEngine::objectCreated, &app,
    [url](QObject * obj, const QUrl & objUrl) {
      if (!obj && url == objUrl) {
        QCoreApplication::exit(-1);
      }
    },
    Qt::QueuedConnection);
  engine.load(url);

  return app.exec();
}
