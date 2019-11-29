import React,{Component} from 'react';
import {
    SafeAreaView,
    StyleSheet,
    View,
    ScrollView,
    Dimensions,
    TextInput,
    Text,
    Image,
    Switch,
    Button,
    CheckBox,
    Select,
    ImageBackground,
    Touchable,
    Lable,
    TouchableHighlight,
    Modal,
    StatusBar,
  } from 'react-native';

var {ScreenHeight,ScreenWidth} =  Dimensions.get('window');


export default class Demo2 extends React.Component {


    static navigationOptions = ({ navigation }) => {
        return {

        title: '我是标题', // 设置头部标题
        headerStyle:{
            backgroundColor:'#F7D05E',
        },
        headerTintColor: '#fff',
        headerTitleStyle: {
            fontWeight: 'bold',
        },
        headerRight:(
            <View style={{flexDirection:'row'}}>
                <Button 
                onPress={()=>{alert('click left button')}}
                title ='right1'
                />
                <Button 
                onPress={()=>{alert('click left button')}}
                title ='right2'
                />
            </View>
        ),
        headerLeft:(
            <Button 
            onPress={()=>{navigation.pop()}}
            title ='back'
            />
        ),
        }
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
            <View style={style.container}>
                <StatusBar barStyle="dark-content" />
                <SafeAreaView></SafeAreaView>
                <ScrollView style={style.content}>
                    {/* label */}
                    <View style={style.section1}>
                        <Text>hello world</Text>
                        
                    </View>
                    <View style={style.bottomLine}/>
                    {/* Button */}
                    <View style={[style.section2,{flexDirection:'row'}]}>
                        <Button title="button1" onPress={this.onPressButton}/>
                        <Button title="button2" onPress={this.onPressButton}/>
                    </View>
                    <View style={style.bottomLine}/>
                    {/* Image */}
                    <View style={[style.section1,{flexDirection:'row',alignItems:'center'}]}>
                        <Image style ={{width:80,height:80,backgroundColor:'red'}} source={require('./resource/luoxi3.gif')}/>
                        <Image style={style.imageLogo} source={{uri: 'http://gss0.baidu.com/94o3dSag_xI4khGko9WTAnF6hhy/zhidao/pic/item/6159252dd42a28344caed5825eb5c9ea15cebf2b.jpg'}}/>
                    </View>
                    <View style={style.bottomLine}/>
                    <View style={style.section2}>
                        <CheckBox  onChange ={this.checkBoxFunc}/>
                    </View>
                    <View style={style.bottomLine}/>
                    <View style={style.section1}>
                        <Switch onValueChange={(value)=>this.switchFunc(value)} value ={this.state.switchStatus}/>
                    </View>
                    <View style={style.bottomLine}/>
                </ScrollView>
            </View>
        )
    }

    onPressButton (){
        alert('点击了buutton')
    }

    checkBoxFunc(){
        alert('checkBoxFunc') 
    }

    jumpToDemo3(){

        this.props.n
    }
    switchFunc(value){

        var switchStatus = !this.state.switchStatus;
        this.setState({switchStatus:switchStatus});
    }
}


const style = StyleSheet.create({
    container:{
        flex:1,
        // backgroundColor: 'white',
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
        height:100,
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