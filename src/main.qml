// Copyright (c) 2024 PAL Robotics S.L. All rights reserved.
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

import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

import Ros 2.0

ApplicationWindow {
    id: _ui_server
    width: 1280 // tiago pro resolution
    height: 800
    visibility: "FullScreen"
    visible: true
    color: "white"
    title: qsTr("Display manager")
    flags: Qt.WA_TranslucentBackground

    FontLoader { id: inter; source: "qrc://../res/Inter.ttf" }

    Image {
        id: background
        source: "qrc://../res/background.jpg"
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop
    }

    Loader {
        id: user_content
        anchors.fill: parent

    }

    SetUiFragmentService {
        id: qml_content
        service: "/ui/set_fragment"

       onRequestReceived: {
           console.log("Setting QML fragment to: " + qml_fragment)
           var component = Qt.createQmlObject(qml_fragment, _ui_server);
           if (component.status === Component.Ready) {
               user_content.sourceComponent = component;
           } else if (component.status === Component.Error) {
               console.log("Error loading component:", component.errorString());
           }
       }
    }

}
