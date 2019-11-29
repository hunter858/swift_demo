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


var {ScreenHeight,ScreenWidth} =  Dimensions.get('window');
export default class Demo5 extends Component {


    static navigationOptions = {
        title: '高阶', // 设置头部标题
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

                            <Button title =" Promise.all()" onPress ={()=>this.testFunc1()}/>
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

    testFunc1(){
        var p1 = new Promise((resolve,reject) =>{
            resolve("success1");
        });
        var p2 = new Promise((resolve,reject) =>{
            resolve("success2");
        });
        var p3 = new Promise((resolve,reject) =>{
            reject("success3");
        });

        Promise.all([p1,p2,p3]).then((result) =>{
            console.log('[success] ' +result)

        }).catch((error)=>{
            console.log(JSON.stringify(error));
        });

    }
    
    testFunc2(){

    }

    testFunc3(){
       
    }
    testFunc4(){
       
    }
    
    testFunc5(){
        
    }
    testFunc6(){
       
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
})