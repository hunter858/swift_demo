import React,{Component} from 'react';
import { RectButton } from 'react-native-gesture-handler';
import ImageButton from './ImageButton'
export default class HeaderView extends Rect.Component{

    render(){
        return(
            <View style={style.container}>
                <ImageButton title="left"/>
                    <Text>哇哈哈</Text>
                <ImageButton title="right"/>
            </View>
        )
    }

}

const style =StyleSheet.create({
    container:{
        flexDirection: 'row',
        alignContent: 'center',
        alignSelf: 'center',
    }
})