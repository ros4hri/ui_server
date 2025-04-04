^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Changelog for package ui_server
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

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
