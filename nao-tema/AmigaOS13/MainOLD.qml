import QtQuick 2.8
import QtQuick.Controls 2.8
import QtQuick.Controls 1.4 as Q1
import QtQuick.Controls.Styles 1.4
import SddmComponents 2.0
import "."
Rectangle {
    id : container
    LayoutMirroring.enabled : Qt.locale().textDirection == Qt.RightToLeft
    LayoutMirroring.childrenInherit : true
    property int sessionIndex : session.index


    /*
        CHAR_WIDTH x CHAR_HEIGHT
        17 x 47

        FONT SIZE CALCULATION:
        Pixel Size to Font Point Size Conversion:
        1 Pixel Size = 0.75 Font Point Size

        SCREEN_WIDTH x SCREEN_HEIGHT
        SCREEN_WIDTH / 40 (columns) = CHARACTER_PIXEL_SIZE
        CHARACTER_PIXEL_SIZE * 0.75 = FONT_POINT_SIZE

        2560 x 1600
        2560 / 40 = 64
        64 * 0.75 = 48 (Font Point Size)

        1920 x 1200
        1920 / 40 = 48
        48 * 0.75 = 36 (Font Point Size)

    */

    //SET DEFAULTS FOR 1920 x 1200 RESOLUTION --> BORDER IS 1920 x 1200 --> BACKGROUND IS 1600 x 1000
    property int defaultscale : setdefaultScale() //5
    property int defaultspritescale : setdefaultspriteScale() //10

    property int targetscreenwidth : container.width //1920
    property int targetscreenheight : container.height //1200

    property int defaultscreenwidth : 320 * defaultscale
    property int defaultscreenheight : 200 * defaultscale

    property int defaultspritewidth : setdefaultspriteWidth() //24 * defaultspritescale
    property int defaultspriteheight : setdefaultspriteHeight() //21 * defaultspritescale

    property int defaultcharwidth : 8 * defaultscale
    property int defaultcharheight : 8 * defaultscale

    property string amigablack : "#000000"
    property string amigablue : "#0055aa"
    property string amigabrown : "#8d4300"
    property string amigacyan : "#7ee7d0"
    property string amigadarkgrey : "#616161"
    property string amigagreen : "#76bb61"
    property string amigagrey : "#939393"
    property string amigalightblue : "#5796ec"
    property string amigalightgreen : "#cbffb6"
    property string amigalightgrey : "#cbcbcb"
    property string amigalightred : "#eb8499"
    property string amigaorange : "#ff8800"
    property string amigapurple : "#8f5abb"
    property string amigared : "#ad465c"
    property string amigawhite : "#ffffff"
    property string amigayellow : "#fff793"

    //BORDER SECTION
    property string borderimage : "AmigaOSBackground.png"


    //WB Title Bar
    property string titlebarimage : "tbarblank.svg"
    property int bgwidth : parent.width
    property int bgheight : 35


    //WB Title Bar Text
    property string titlebartextimage : "tbartext.svg"
    property int titlebartextwidth : 700
    property int titlebartextheight : 35


    //WB Title Bar BackForth Gadget
    property string backforthimage : "BackForth.svg"
    property int backforthwidth : 120
    property int backforthheight : 35


    //FONT SECTION (1 px = .75 pt)
    property string fontstyle : "TopazPlus_a1200_v1.0.ttf"
    property int fsize : 30
    property int fheight : 45


    //CBM DIALOG BOX SECTION
    property int dialogboxtoppadding : 3
    property int dialogboxleftpadding : 10

    property string dialogboxtext : "SYSTEM LOGIN"
    property bool dialogboxtextvisible : true
    property string dialogboxtextcolor : amigablue
    property int dialogboxtextsize : 20

    property string dialogboxtitleimage : "AmigaOSTitleBar.svg"
    property int dialogboxtitlewidth : 800
    property int dialogboxtitleheight : 31

    property string dialogboximage : "AmigaOSDBox.svg"
    property int dialogboximagewidth : 800
    property int dialogboximageheight : 300


    //AVATAR SECTION
    property int avatarleftpadding : 60
    property int avatartoppadding : 60
    property string cbmavatar : "AmigaOSAvatar.svg"
    property int avatarwidth : 24*7
    property int avatarheight : 21*7


    //RESTART BUTTON SECTION
    property int restartbuttonleftpadding : 40
    property int restartbuttontoppadding : 230
    property int restartbuttonimagewidth : 175
    property int restartbuttonimageheight : 35
    property string restartbuttonup : "AmigaOSRestartButtonUp.svg"
    property string restartbuttondown : "AmigaOSRestartButtonDown.svg"
    property string restartbuttonhover : "AmigaOSRestartButtonUp.svg"
    property string restartbuttontext : "RESTART"
    property string restartbuttoncolor : amigablue
    property int restartbuttonfontsize : 20


    //SHUTDOWN BUTTON SECTION
    property int shutdownleftpadding : 325
    property int shutdowntoppadding : 230
    property int shutdownimagewidth : 175
    property int shutdownimageheight : 35
    property string shutdownbuttonup : "AmigaOSShutdownButtonUp.svg"
    property string shutdownbuttondown : "AmigaOSShutdownButtonDown.svg"
    property string shutdownbuttonhover : "AmigaOSShutdownButtonUp.svg"
    property string shutdownbuttontext : "SHUTDOWN"
    property string shutdownbuttoncolor : amigablue
    property int shutdownbuttonfontsize : 20


    //LOGIN BUTTON SECTION
    property int loginbuttonleftpadding : 585
    property int loginbuttontoppadding : 230
    property int loginbuttonimagewidth : 175
    property int loginbuttonimageheight : 35
    property string loginbuttonup : "AmigaOSButtonUp.svg"
    property string loginbuttondown : "AmigaOSButtonDown.svg"
    property string loginbuttonhover : "AmigaOSButtonUp.svg"
    property string loginbuttontext : "LOGIN"
    property string loginbuttoncolor : amigablue
    property int loginbuttonfontsize : 20


    //USERNAME TEXT
    property int usernameleftpadding : 295
    property int usernametoppadding : 70
    property int usernamewidth : 400
    property int usernameheight : 35
    property string usernametext : "USERNAME: "
    property string usernamecolor : amigawhite
    property int usernamefontsize : 25


    //USERNAME TEXTBOX
    property int usernametextboxleftpadding : 450
    property int usernametextboxtoppadding : 65
    property int usernametextboxwidth : 310
    property int usernametextboxheight : 40
    property string usernametextboximage : "AmigaOSUsernameBox.svg"
    property string usernametextboxcolor : amigablack
    property int usernametextboxfontsize : 20


    //PASSWORD TEXT
    property int passwordleftpadding : 295
    property int passwordtoppadding : 135
    property int passwordwidth : 400
    property int passwordheight : 35
    property string passwordtext : "PASSWORD: "
    property string passwordcolor : amigawhite
    property int passwordfontsize : 25


    //PASSWORD TEXTBOX
    property int passwordtextboxleftpadding : 450
    property int passwordtextboxtoppadding : 130
    property int passwordtextboxwidth : 310
    property int passwordtextboxheight : 40
    property string passwordtextboximage : "AmigaOSPasswordBox.svg"
    property string passwordtextboxcolor : amigablack
    property int passwordtextboxfontsize : 20


    //COMBOBOX
    property int comboboxleftpadding : 560
    property int comboboxtoppadding : 180
    property string comboboxcolor : amigablue
    property string comboboxbordercolor : amigaorange
    property string comboboxhovercolor : amigaorange
    property string comboboxfocuscolor : amigablue
    property string comboboxtextcolor : amigawhite
    property string comboboxmenucolor : amigablue
    property string comboboxarrowcolor : "transparent"
    property int comboboxfontsize : 20
    property int comboboxwidth : 200
    property int comboboxheight : 35
    property string comboboximage : "AmigaOSArrow.svg"
    property bool comboboxvisible : true


    //Set Scale
    function setdefaultScale()
    {
        var setscale = 5

        //Set UHD
        if (container.width > 1920)
        {
            setscale = 8
        }

        return setscale
    }


    //Set Sprite Scale
    function setdefaultspriteScale()
    {
        var setspritescale = 10

        //Set UHD
        if (container.width > 1920)
        {
            setspritescale = 12
        }

        return setspritescale
    }

    //Set Default Sprite Width
    function setdefaultspriteWidth()
    {
        var setwidth = 24 * defaultspritescale

        //Set UHD
        if (container.width > 1920)
        {
            setwidth = (24 * defaultspritescale) *1.5
        }

        return setwidth
    }


    //Set Default Sprite Height
    function setdefaultspriteHeight()
    {
        var setheight = 21 * defaultspritescale

        //Set UHD
        if (container.width > 1920)
        {
            setheight = (21 * defaultspritescale) *1.5
        }

        return setheight
    }


    //Set Default CBM Header Top Padding
    function setcbmheadertoppadding()
    {
        var cbmheader = 2

        //Set UHD
        if (container.width > 1920)
        {
            cbmheader = 6
        }

        return cbmheader
    }

    TextConstants {
        id : textConstants
    }

    FontLoader {
        id : loginfont
        source : fontstyle
    }

    Connections {
        target : sddm
        onLoginSucceeded : {
            errorMessage.color = "green"
            errorMessage.text = textConstants.loginSucceeded
        }
        onLoginFailed : {
            password.text = ""
            errorMessage.color = "red"
            errorMessage.text = textConstants.loginFailed
            errorMessage.bold = true
        }
    }
    color : "#4c719e"
    anchors.fill : parent

    Background {
        anchors.fill: parent
        source: borderimage
        fillMode: Image.Stretch
        onStatusChanged: {
            if (status == Image.Error && source != config.defaultBackground) {
                source = config.defaultBackground
            }
        }
    }

    //SET WB Title Bar
    Image {
        id : backgroundImage1
        anchors.top : parent.top
        anchors.horizontalCenter : container.horizontalCenter
        width : bgwidth //parent.width
        height : bgheight
        source : titlebarimage
    }

    //SET WB Title Bar Text
    Image {
        id : backgroundImage2
        anchors.left : parent.left //anchors.top : parent.top
        width : titlebartextwidth
        height : titlebartextheight
        source : titlebartextimage
    }

    //SET WB Title Bar BackForth Gadget
    Image {
        id : backgroundImage3
        anchors.right : parent.right //anchors.top : parent.top
        width : backforthwidth
        height : backforthheight
        source : backforthimage
    }


    //SET DIALOG WINDOW BOX
    Image {
        anchors.centerIn : parent
        id : dialogbox
        source : dialogboximage
        width : dialogboximagewidth
        height : dialogboximageheight
        visible : true


        Image {
        anchors.left : parent.left
        id : dialogboxtop
        source : dialogboxtitleimage
        width : dialogboxtitlewidth
        height : dialogboxtitleheight
        visible : true

            Column {
                id : entryColumn4
                anchors.left : parent.left
                topPadding : dialogboxtoppadding
                leftPadding : dialogboxleftpadding
                Text {
                    color : dialogboxtextcolor
                    text : dialogboxtext
                    visible : dialogboxtextvisible
                    font.family : loginfont.name
                    font.italic : false
                    font.pointSize : dialogboxtextsize
                }
            }
        }



/*
        id : dialogboxtop
        source : dialogboxtitleimage //dialogboximage
        width : 1000 //dialogboximagewidth
        height : 25 //dialogboximageheight
        visible : true

        Column {
            id : entryColumn4
            anchors.left : parent.left
            topPadding : dialogboxtoppadding
            leftPadding : dialogboxleftpadding
            Text {
                color : dialogboxtextcolor
                text : dialogboxtext
                visible : true
                font.family : loginfont.name
                font.italic : false
                font.pointSize : dialogboxtextsize
            }
        }


        Image {
        anchors.left : parent
        id : dialogboxbottom
        source : dialogboximage
        width : dialogboximagewidth
        height : dialogboximageheight
        visible : true
        }









        id : dialogboxtop
        source : "AmigaOSDBox.svg" //dialogboximage
        width : 1000 //dialogboximagewidth
        height : 100 //dialogboximageheight
        visible : true






        id : dialogboxtop
        source : dialogboxtitleimage
        width : dialogboxtitlewidth
        height : dialogboxtitleheight
        visible : true




        //SET SYSTEM LOGIN
        Column {
            id : entryColumn4
            anchors.left : parent.left
            topPadding : dialogboxtoppadding
            leftPadding : dialogboxleftpadding
            Text {
                color : dialogboxtextcolor
                text : dialogboxtext
                visible : true
                font.family : loginfont.name
                font.italic : false
                font.pointSize : dialogboxtextsize
            }
        }


        Image {
        anchors.left : parent
        id : dialogboxbottom
        source : dialogboximage
        width : dialogboximagewidth
        height : dialogboximageheight
        visible : true




        //SET SYSTEM LOGIN
        Column {
            id : entryColumn499
            anchors.left : parent.left
            topPadding : 10
            leftPadding : dialogboxleftpadding
            Text {
                color : dialogboxtextcolor
                text : dialogboxtext
                visible : dialogboxtextvisible
                font.family : loginfont.name
                font.italic : false
                font.pointSize : 30
            }
        }

        }
*/
        //SET AVATAR
        Column {
            id : entryColumn0
            anchors.left : parent.entryColumn4
            leftPadding : avatarleftpadding
            topPadding : avatartoppadding
            Row {
                Image {
                    id : avatar
                    source : cbmavatar
                    width : avatarwidth
                    height : avatarheight
                    visible : true
                }
            }
        }

        //SET RESTART BUTTON
        Column {
                id : entryColumn2
                anchors.left : parent.entryColumn4
                leftPadding : restartbuttonleftpadding
                topPadding : restartbuttontoppadding

                Image {
                    id : restartButton
                    source : restartbuttonup
                    width : restartbuttonimagewidth
                    height : restartbuttonimageheight
                    visible : true
                    anchors.right : parent.right
                    MouseArea {
                        anchors.fill : parent
                        hoverEnabled : true
                        onEntered : {
                            parent.source = restartbuttonhover
                        }
                        onExited : {
                            parent.source = restartbuttonup
                        }
                        onPressed : {
                            parent.source = restartbuttondown
                            sddm.reboot()
                        }
                        onReleased : {
                            parent.source = restartbuttonup
                        }
                    }
                    Text {
                        verticalAlignment : Text.AlignVCenter
                        text : restartbuttontext
                        anchors.centerIn : parent
                        font.family : loginfont.name
                        font.italic : false
                        font.pointSize : restartbuttonfontsize
                        color : restartbuttoncolor
                    }
                KeyNavigation.backtab : password
                KeyNavigation.tab : shutdownButton
                }
            }

        //SET SHUTDOWN BUTTON
        Column {
                id : entryColumn3
                anchors.left : parent.entryColumn4
                leftPadding : shutdownleftpadding
                topPadding : shutdowntoppadding

                Image {
                    id : shutdownButton
                    source : shutdownbuttonup
                    width : shutdownimagewidth
                    height : shutdownimageheight
                    visible : true
                    anchors.right : parent.right
                    MouseArea {
                        anchors.fill : parent
                        hoverEnabled : true
                        onEntered : {
                            parent.source = shutdownbuttonhover
                        }
                        onExited : {
                            parent.source = shutdownbuttonup
                        }
                        onPressed : {
                            parent.source = shutdownbuttondown
                            sddm.powerOff()
                        }
                        onReleased : {
                            parent.source = shutdownbuttonup
                        }
                    }
                    Text {
                        text : shutdownbuttontext
                        anchors.centerIn : parent
                        font.family : loginfont.name
                        font.italic : false
                        font.pointSize : shutdownbuttonfontsize
                        color : shutdownbuttoncolor
                    }
                KeyNavigation.backtab : password
                KeyNavigation.tab : shutdownButton
                }
            }

        //SET USERNAME TEXT
        Column {
            id : entryColumn5
                anchors.left : parent.entryColumn4
                leftPadding : usernameleftpadding
                topPadding : usernametoppadding

            Text {
                    id : lblLoginName
                    width : usernamewidth
                    height : usernameheight
                    visible : true
                    text : usernametext
                    font.pointSize : usernamefontsize
                    font.italic : false
                    verticalAlignment : Text.AlignVCenter
                    color : usernamecolor
                    font.family : loginfont.name
                }
        }

        //SET USERNAME BOX
        Column {
            id : entryColumn6
                anchors.left : parent.entryColumn4
                leftPadding : usernametextboxleftpadding
                topPadding : usernametextboxtoppadding

           TextField {
                    id : name
                    font.family : loginfont.name
                    font.italic : false
                    width : usernametextboxwidth
                    height : usernametextboxheight
                    text : userModel.lastUser
                    font.pointSize : usernametextboxfontsize
                    //verticalAlignment : Text.verticalAlignment
                    color : usernametextboxcolor
                    background : Image {
                        source : usernametextboximage
                    }
                    KeyNavigation.tab : password
                    Keys.onPressed : {
                        if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                            password.focus = true
                            event.accepted = true
                        }
                    }
            }
        }


        //SET PASSWORD TEXT
        Column {
            id : entryColumn7
                anchors.left : parent.entryColumn4
                leftPadding : passwordleftpadding
                topPadding : passwordtoppadding

            Text {
                id : lblLoginPassword
                width : passwordwidth
                height : passwordheight
                visible : true
                text : passwordtext
                verticalAlignment : Text.AlignVCenter
                color : passwordcolor
                font.pointSize : passwordfontsize
                font.italic : false
                font.family : loginfont.name
            }
        }


        //SET PASSWORD BOX
        Column {
            id : entryColumn8
                anchors.left : parent.entryColumn4
                leftPadding : passwordtextboxleftpadding
                topPadding : passwordtextboxtoppadding
                TextField {
                    id : password

                    font.family : loginfont.name
                    font.italic : false
                    width : passwordtextboxwidth
                    height : passwordtextboxheight
                    echoMode : TextInput.Password
                    font.pointSize : passwordtextboxfontsize
                    verticalAlignment : Text.verticalAlignment
                    color : passwordtextboxcolor
                    background : Image {
                        source : passwordtextboximage
                    }
                    KeyNavigation.backtab : name
                    KeyNavigation.tab : loginButton
                    focus : true
                    Keys.onPressed : {
                        if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                            sddm.login(name.text, password.text, sessionIndex)
                            event.accepted = true
                        }
                    }
                }
            }

            //SET LOGIN BUTTON
            Column {
                id : entryColumn9
                anchors.left : parent.entryColumn4
                leftPadding : loginbuttonleftpadding
                topPadding : loginbuttontoppadding
                Image {
                    id : loginButton
                    source : loginbuttonup
                    width : loginbuttonimagewidth
                    height : loginbuttonimageheight
                    visible : true
                    anchors.right : parent.right
                    MouseArea {
                        anchors.fill : parent
                        hoverEnabled : true
                        onEntered : {
                            parent.source = loginbuttonhover
                        }
                        onExited : {
                            parent.source = loginbuttonup
                        }
                        onPressed : {
                            parent.source = loginbuttondown
                            sddm.login(name.text, password.text, sessionIndex)
                        }
                        onReleased : {
                            parent.source = loginbuttonup
                        }
                    }
                    Text {
                        text : loginbuttontext
                        anchors.centerIn : parent
                        font.family : loginfont.name
                        font.italic : false
                        font.pointSize : loginbuttonfontsize
                        color : loginbuttoncolor
                    }
                KeyNavigation.backtab : password
                KeyNavigation.tab : shutdownButton
                }
            }

        //SET COMBOBOX
        Column {
            id : entryColumn1
            anchors.left   : parent.promptbox
            leftPadding : comboboxleftpadding
            topPadding : comboboxtoppadding

            ComboBox {
                id : session
                color : comboboxcolor
                borderColor : comboboxbordercolor
                hoverColor : comboboxhovercolor
                focusColor : comboboxfocuscolor
                textColor : comboboxtextcolor
                menuColor : comboboxmenucolor
                arrowColor: comboboxarrowcolor
                width : comboboxwidth
                height : comboboxheight
                visible : comboboxvisible
                font.pointSize : comboboxfontsize
                font.italic : false
                font.family : loginfont.name
                arrowIcon : comboboximage
                model : sessionModel
                index : sessionModel.lastIndex
                KeyNavigation.backtab : name
                KeyNavigation.tab : password
            }
        }
    }
}
