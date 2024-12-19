# UI Server

ROS 2 UI 'server' that manage user interfaces.

Uses QML as UI description language.

The node exposes

## ROS API

### Usage

```bash
ros2 run ui_server ui_server
```

### Services

- `/ui/set_fragment` (`ui_msgs/SetUiFragment`): instructs the UI server to
  render the provided QML snippet onto the display. This service has two fields:
   - `qml_import_path` (optional): path to a QML module that is added to the import
     path of the qml engine.
   - `qml_fragment` (optional): a QML string, to be rendered.

The qml fragment must include all required imports. It can optionally include
QML components defined in the `qml_import_path` (if provided).

Note that import paths are not removed at the end of the service call. As such
you can for instance load one (or several) QML modules (for instance, with a
library of QML components you want to share across several applications), and
then refer to these components without having to re-import the path everytime.

## Testing

Once running, executing the following service call should display a red
rectangle, 150x150px, in the top left corner of the external display:

```
ros2 service call /ui/set_fragment ui_msgs/srv/SetUiFragment "qml_import_path: ''
qml_fragment: 'import QtQuick 2.15; Rectangle{color:\"red\";width:150;height:150}'"
```
