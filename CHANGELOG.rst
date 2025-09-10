^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Changelog for package ui_server
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

0.6.0 (2025-09-10)
------------------
* ament_auto_package now requires USE_SCOPED_HEADER_INSTALL_DIR
* Contributors: Séverin Lemaignan

0.5.0 (2025-06-02)
------------------
* make it possible to start in windowed mode
  This is much more convenient when developing/debugging
* Contributors: Séverin Lemaignan

0.4.1 (2025-05-20)
------------------
* depends on libqt5multimedia5-plugins, to ensure we can play videos
* Contributors: Séverin Lemaignan

0.4.0 (2025-05-19)
------------------
* add support for inserting web views in the QML page
  Simple example:
  ros2 service call /ui/set_fragment ui_msgs/srv/SetUiFragment "qml_fragment: 'import QtWebView 1.15;WebView {anchors.fill:parent;url:\"https://lemonde.fr\"}'"
* Contributors: Séverin Lemaignan

0.3.2 (2025-04-04)
------------------
* bring back *some* logging when updating UI state
* Contributors: Séverin Lemaignan

0.3.1 (2025-04-04)
------------------
* less verbose when updating UI state
* Contributors: Séverin Lemaignan

0.3.0 (2025-03-31)
------------------
* fix the UI setting and state updating code
  Updated accordingly the README
* [doc] expand documentation
* Contributors: Séverin Lemaignan

0.2.0 (2024-12-19)
------------------
* fix module: ui_server use ros2 run, not launch
* Contributors: Séverin Lemaignan

0.1.0 (2024-12-12)
------------------
* enable linting tests
* add proprietary license
* remove launch file
  Because the node is primarily a Qt application, launch files can not be easily used
  as Qt does not like ROS arguments passed from the cmd line
* initial implementation
* Initial commit
* Contributors: Séverin Lemaignan
