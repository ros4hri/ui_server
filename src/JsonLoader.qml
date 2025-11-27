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

// taken from https://stackoverflow.com/questions/75287733/setting-text-from-qrc-in-qml-textarea
// As such, the code of this function is licensed under CC BY-SA 4.0.
// (c) Stephen Quan, 2023
import QtQuick 2.15
Item {
    id: textLoader
    property var target: parent
    property string property: "text"
    property string url
    onUrlChanged: Qt.callLater(load)
    function load() {
        if (!url) return;
        let xhr = new XMLHttpRequest();
        xhr.open("GET", url); 
        xhr.onreadystatechange = () => {
            if (xhr.readyState !== 4) return;
            if (xhr.status !== 0 && (xhr.status < 200 || xhr.status >= 400)) return;
            target[property] = JSON.parse(xhr.responseText);
        }
        xhr.send();
    }
    Component.onCompleted: Qt.callLater(load)
}
