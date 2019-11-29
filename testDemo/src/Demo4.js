import React,{Component} from 'react';
import {NativeModules} from 'react-native';
import {
    SafeAreaView,
    StyleSheet,
    View,
    ScrollView,
    Dimensions,
    Button,
    StatusBar,
  } from 'react-native';

const ObjectCTool = NativeModules.ObjectCTool;

var {ScreenHeight,ScreenWidth} =  Dimensions.get('window');
export default class Demo4 extends Component {


    static navigationOptions = {
        title: 'OC和React-Native交互', // 设置头部标题
        headerStyle:{
            backgroundColor:'#F7D05E',
        },
        headerTintColor: '#fff',
        headerTitleStyle: {
            fontWeight: 'bold',
        },
    };


    

    constructor(props){
        super(props);
        this.state = {
            switchStatus: true,
            
        }

        /*
        它是组件的构造函数。它的第一个语句必须是 super(props)。
        构造函数将在组件被加载前最先调用，并且仅调用一次。
        */
    }


    render (){
        return (
            <SafeAreaView style={{flex:1}}>
                <View style={style.container}>
                
                    <StatusBar barStyle="dark-content" />
                    <ScrollView style={style.content}>
                        <View style={style.section1}>

                            <Button title =" showMessage()" onPress ={()=>this.testFunc1()}/>
                            <Button title =" baseInfomation()" onPress ={()=>this.testFunc2()}/>
                            <Button title ="blockCallbackEvent(callback)" onPress ={()=>this.testFunc3()}/>
                            <Button title ="调用 方法4" onPress ={()=>this.testFunc4()}/>
                            <Button title ="获取app 版本信息" onPress ={()=>this.testFunc5()}/>
                            <Button title ="requestWithAPI(callback)" onPress ={()=>this.testFunc6()}/>

                        </View>
                        <View style={style.bottomLine}/>
                    </ScrollView>
                </View>
            </SafeAreaView>
        )
    }

    getAppVersion (){
        
        
        console.log("getAppVersion-1");
        ObjectCTool.getAppVersion2((appInfo)=>{
            console.log(JSON.stringify(appInfo));
            alert("3")
        });
        console.log("getAppVersion-2");

    }

    testFunc1(){
        ObjectCTool.showMessage("消息推送","local");
    }
    
    testFunc2(){
         ObjectCTool.testFunction();
    }

    testFunc3(){
        ObjectCTool.blockCallbackEvent((error,value)=>{
            alert(JSON.stringify(value));
            console.log('blockCallbackEvent func info :' + JSON.stringify(value));
        });
    }
    testFunc4(){
        ObjectCTool.jumpToSettingWithType(1,"我是React Native 传参数给RN");
    }
    
    testFunc5(){
        ObjectCTool.getAPPVersion((error,value)=>{
            alert('getAPPVersion func info :' + JSON.stringify(value));
        });
    }
    testFunc6(){
        ObjectCTool.requestWithAPI("http://www.baidu.com","/user").then((data)=>{
            alert('success: '+JSON.stringify(data));
        }).catch((code,message,error)=>{
            alert('error: '+JSON.stringify(error));
        });

    }


}


const style = StyleSheet.create({
    container:{
        flex:1,
        backgroundColor: 'white',
        backgroundColor: '#3269CF',
    },
    content:{
        flex:1,
        flexDirection:'row',
        flexDirection:'column',
        backgroundColor: 'white',
    },
    section1:{
        width:ScreenWidth,
        // flex:1,
        // height:100,
    },
    section2:{
        // flex:1,
        height:100,
        width:ScreenWidth,
    },
    bottomLine:{
        width:ScreenWidth,
        height:0.4,
        backgroundColor:"lightgray"
    },
    imageLogo:{
        width:80,
        height:80,
    }
    


})