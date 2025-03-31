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

    Item {
        id: user_content

        anchors.fill: parent

        function reset() {
            for (var i = 0; i < user_content.children.length; i++) {
                user_content.children[i].destroy();
            }
        }

        function updateState(qml_fragment) {
            if (user_content.children.length == 0) {
                console.log("No QML content to update -- have you set the UI fragment yet?");
                return;
            }

            console.log("Updating QML state with: " + qml_fragment);
            var user_object = user_content.children[0];

            (new Function(qml_fragment)).call(user_object);
        }

    }

    SetUiFragmentService {
        id: qml_content
        service: "/ui/set_fragment"

       onRequestReceived: {
           user_content.reset();
           console.log("Setting QML fragment to:\n===============\n" +
                       qml_fragment + "\n===============\n");
           Qt.createQmlObject(qml_fragment, user_content);
       }
    }

    SetUiFragmentService {
        id: update_state
        service: "/ui/update_state"

       onRequestReceived: {
           user_content.updateState(qml_fragment);
       }
    }

}
