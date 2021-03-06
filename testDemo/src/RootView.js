import React,{Component} from 'react';
import {
    SafeAreaView,
    StyleSheet,
    View,
    Dimensions,
    Text,
    Button,
    NativeModules,
    StatusBar,
  } from 'react-native';

var {ScreenHeight,ScreenWidth} =  Dimensions.get('window');
import PropTypes from 'prop-types'


const ObjectCTool = NativeModules.ObjectCTool;

class NavigtionBackButton extends React.Component{


    onPressBackAction(){
        ObjectCTool.NavigateBack();
    }

    render (){
        return (
        <Button 
            onPress={()=>{this.onPressBackAction()}}
            title ='back'
        />)
    }
}


export default class RootView extends React.Component {


    static navigationOptions ={
        title:'首页',
        headerLeft:(
            <NavigtionBackButton/>
        ),
    }

    constructor(props){
        super(props);
        this.state = {
            value1: true,
            number: 0,
        }

        /*
        它是组件的构造函数。它的第一个语句必须是 super(props)。
        构造函数将在组件被加载前最先调用，并且仅调用一次。
        */
    }
    componentWillMount(){

        setTimeout(() => {
            
            alert('获取原生传过来的props '+ JSON.stringify(this.props));
        }, 1000);
        /* 在组件的生命周期中，这个函数只会被执行一次*/
        console.log('componentWillMount -准备加载组件')
    }
    
    render (){

        console.log('render 渲染页面')
        return (
        <>
            <SafeAreaView>
            <StatusBar barStyle="dark-content" />
            <View style={style.container}>
                <View style={style.content}>
                    <View style={[style.section1,{flexDirection:'row',alignItems:'center',alignSelf:'center'}]}>

                        <Text>{this.state.number}</Text>
                    </View>
                    <View style={[style.section1,{flexDirection:'row',alignItems:'center',alignSelf:'center'}]}>

                        <Button title="快点我" onPress ={()=>this.onPressButton()}/>
                    </View>
                    <View style={[style.section1,{flexDirection:'column',alignItems:'center',alignSelf:'center'}]}>

                        <Button title="Demo1" onPress ={()=>this.jumpControlFunc(1)}/>
                        <Button title="Demo2" onPress ={()=>this.jumpControlFunc(2)}/>
                        <Button title="Demo3" onPress ={()=>this.jumpControlFunc(3)}/>
                        <Button title="Demo4" onPress ={()=>this.jumpControlFunc(4)}/>
                        <Button title="Demo5" onPress ={()=>this.jumpControlFunc(5)}/>
                    </View>                    
                </View>
            </View>
            </SafeAreaView>
        </>
        )
    }

    componentDidMount(){
        console.log('componentDidMount-----组件加载成功并被成功渲染出来后执行')
    }

    componentWillUnmount(){
        console.log('componentWillUnmount -准备加载组件')
    }

    shouldComponentUpdate(nextProps,nextState){
        console.log('nextProps:'+ JSON.stringify(nextProps))
        console.log('nextState:'+ JSON.stringify(nextState))
        return true;
    }

    componentWillUpdate(){
        console.log('componentWillUpdate -准备加载组件')
    }

    componentDidUpdate(){
        console.log('componentDidUpdate -准备加载组件完成')
    }

    onPressButton (){

        var number = this.state.number+1;
        this.setState({number:number})
    }

    jumpControlFunc (value){

        switch (value) {
            case 1:
                this.props.navigation.navigate('Demo1')
                break;
            case 2:
                this.props.navigation.navigate('Demo2')
                break;
            case 3:
                this.props.navigation.navigate('Demo3')
                break;
            case 4:
                this.props.navigation.navigate('Demo4')
                break;
            case 5:
                this.props.navigation.navigate('Demo5')
                break;
        
            default:
                break;
        }
    }

}


const style = StyleSheet.create({
    container:{
        flex:1,
        backgroundColor: 'white',
    },
    content:{
        flex:1,
        flexDirection:'row',
        flexDirection:'column',
        alignItems: 'flex-start',
        alignItems: 'center',
    },
    section1:{
        width:ScreenWidth,
        height:120,
    },
})