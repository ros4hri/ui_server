// taken from https://stackoverflow.com/questions/75287733/setting-text-from-qrc-in-qml-textarea
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
