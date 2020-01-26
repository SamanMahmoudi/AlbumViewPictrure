import QtQuick 2.9
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import QtQuick.Window 2.3
 Item {
     signal sendbackground(string url)
     MouseArea {
         anchors.fill: parent
         onClicked: timeout = 0
     }
     Rectangle {
         width: parent.width
         height: parent.height / 8
         color: "transparent"
         Label {
             anchors.fill: parent
             text: qsTr("Change Background Picture")
             verticalAlignment: Text.AlignVCenter
             horizontalAlignment: Text.AlignHCenter
             anchors.centerIn: parent
             font.bold: true
             font.pixelSize:  (parent.height + parent.width / 2 )* 0.1
             font.family: webFont.name
             color: "#e0f7fa"
         }
     }
     function getname(index)
     {
         if (index === 0)
             return "qrc:/background1.jpg"             // backGround1
         else if (index === 1)
             return "qrc:/background2.jpg"            // backGround2
         else if (index === 2)
             return "qrc:/background3.jpg"            // backGround3
         else if (index === 3)
             return "qrc:/background4.jpg"            // backGround4
         else
             return "qrc:/background5.jpg"            // backGround5
     }
        id:backGround
        FontLoader { id: webFont; source: "qrc:/Kayhan/XB KayhanBd.ttf" }
        Component {
                id: delegate
                Item {
                    width: 200; height: 200
                    scale: PathView.iconScale
                    opacity: PathView.iconOpacity
                    z: PathView.iconOrder
                    Image { anchors.fill: parent; source: modelData }
                }
            }

            PathView {
                id: view
                anchors.fill: parent
                anchors.bottomMargin: 150
                anchors.topMargin: 50
                pathItemCount: 7
                preferredHighlightBegin: 0.5
                preferredHighlightEnd: 0.5
                highlightRangeMode: PathView.StrictlyEnforceRange
                model:ListModel{
                    id: model;
                    ListElement{ name :"qrc:/background1.jpg";}
                    ListElement{ name :"qrc:/background2.jpg";}
                    ListElement{ name :"qrc:/background3.jpg";}
                    ListElement{ name :"qrc:/background4.jpg";}
                    ListElement{ name :"qrc:/background5.jpg";}
                }

                delegate: delegate
                path: Path {
                    startX: 0; startY: view.height/2
                    PathAttribute { name: "iconScale"; value: 0.2 }
                    PathAttribute { name: "iconOpacity"; value: 10.2 }
                    PathAttribute { name: "iconOrder"; value: 0 }
                    PathLine {x: view.width / 2; y: view.height/2 }
                    PathAttribute { name: "iconScale"; value: 1.2 }
                    PathAttribute { name: "iconOpacity"; value: 1 }
                    PathAttribute { name: "iconOrder"; value: 8 }
                    PathLine {x:view.width; y: view.height/2 }
                }
        }

        Button {
            text: qsTr("Change")
            id:editPr
            visible: true
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            height: 100
            onClicked: {
                sendbackground(getname(view.currentIndex))
            }
        }
}
