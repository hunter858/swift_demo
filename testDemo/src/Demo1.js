import React,{Component} from 'react';
import {
    SafeAreaView,
    StyleSheet,
    View,
    Dimensions,
    Text,
    StatusBar,
  } from 'react-native';

var {ScreenHeight,ScreenWidth} =  Dimensions.get('window');

export default class Demo1 extends Component {


    
    render (){
        return (
           <>
                <StatusBar barStyle="dark-content" />
                <SafeAreaView style={{flex:1}}>
                <View style={style.container}>
                    <View style={style.content}>
                        <View style={style.section1}></View>
                        <View style={style.section2}></View>
                        <View style={style.section3}></View>
                        <View style={style.section4}></View>
                    </View>
                </View>
                </SafeAreaView>
            </>
        )
    }
}


const style = StyleSheet.create({
    container:{
        flex:1,
        backgroundColor: 'white',
        // backgroundColor: '#3269CF',
    },
    content:{
        flex:1,
        flexDirection:'row',
        flexDirection:'column',
        backgroundColor: '#3269CF',
        // justifyContent :'flex-start',
        // justifyContent :'center',
        // justifyContent :'flex-end',
        // justifyContent :'space-around',
        // justifyContent :'space-between',
        alignItems: 'flex-start',
        alignItems: 'center',
        alignItems: 'flex-end',
        alignItems: 'stretch',

        // backgroundColor: '#3269CF',
    },
    section1:{
        width:ScreenWidth,
        flex:2,
        backgroundColor:"red"
    },
    section2:{
        flex:1,
        width:ScreenWidth,
        backgroundColor:"green"
    },
    section3:{
        flex:1,
        width:ScreenWidth,
        backgroundColor:"orange"
    },
    section4:{
        flex:1,
        width:ScreenWidth,
        backgroundColor:"blue"
    },


})