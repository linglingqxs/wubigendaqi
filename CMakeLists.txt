cmake_minimum_required(VERSION 3.16)
project(wubigendaqi VERSION 1.0 LANGUAGES C CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOUIC ON)

find_package(QT NAMES Qt5 Qt6 REQUIRED COMPONENTS Core)
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Core5Compat Gui Sql)
find_package(Qt${QT_VERSION_MAJOR} OPTIONAL_COMPONENTS PrintSupport Widgets)

qt_standard_project_setup()

qt_add_executable(wubigendaqi WIN32 MACOSX_BUNDLE
    main.cpp
    mainwindow.cpp mainwindow.h mainwindow.ui
    qcustomplot.cpp qcustomplot.h
    wdb.cpp wdb.h
    wfileinfo.cpp wfileinfo.h
    wfilepipi.cpp wfilepipi.h
    wfileterform.cpp wfileterform.h wfileterform.ui
    wfiltercentence.cpp wfiltercentence.h wfiltercentence.ui
    wfilterstatement.cpp wfilterstatement.h wfilterstatement.ui
    wfilterword.cpp wfilterword.h wfilterword.ui
    wuserrecord.cpp wuserrecord.h wuserrecord.ui
)
target_link_libraries(wubigendaqi PRIVATE
    Qt::Core
    Qt::Core5Compat
    Qt::Gui
    Qt::Sql
)


# Resources:
set(source_resource_files
    "data/db_user_record.txt"
    "data/di.txt"
    "img/bg.jpg"
    "img/file.png"
    "img/icon.icns"
    "img/icon.ico"
    "style/style_default.qss"
)

qt_add_resources(wubigendaqi "source"
    PREFIX
        "/source"
    FILES
        ${source_resource_files}
)

if((QT_VERSION_MAJOR GREATER 4))
    target_link_libraries(wubigendaqi PRIVATE
        Qt::PrintSupport
        Qt::Widgets
    )
endif()

install(TARGETS wubigendaqi
    BUNDLE DESTINATION .
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

qt_generate_deploy_app_script(
    TARGET wubigendaqi
    OUTPUT_SCRIPT deploy_script
    NO_UNSUPPORTED_PLATFORM_ERROR
)
install(SCRIPT ${deploy_script})
