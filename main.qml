import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.4 as QQC2
QQC2.ApplicationWindow {
    id: window
    visible: true
    flags: Qt.FramelessWindowHint
    width: Screen.width
    height: Screen.height
    visibility: Window.FullScreen

    Component.onCompleted:
    {
        var component = Qt.createComponent("qrc:/FoodSelf.qml");
        var object = component.createObject(window);
    }
    property int timeout: 0
    background: Image {
        id:back
        source: "qrc:/background1.jpg"
        width: parent.width
        height: parent.height
        anchors.fill: parent
    }

    QQC2.StackView {
        id: stackView
        focus: true
        property real offset: 10

        anchors.fill: parent
        initialItem: SelectBackground {
//            onLaunched: stackView.push(page)
        }

        pushEnter: Transition {
               PropertyAnimation {
                   property: "opacity"
                   from: 0
                   to:1
                   duration: 200
               }
           }
       pushExit: Transition {
           PropertyAnimation {
               property: "opacity"
               from: 1
               to:0
               duration: 200
           }
       }
       popEnter: Transition {
           PropertyAnimation {
               property: "opacity"
               from: 0
               to:1
               duration: 200
           }
       }
       popExit: Transition {
           PropertyAnimation {
               property: "opacity"
               from: 1
               to:0
               duration: 200
           }
       }


    }

    Connections {
        target: stackView.currentItem
        onSendbackground : back.source = url
    }

}
