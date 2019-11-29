import React,{Component} from 'react';
import PropTypes from 'prop-types'
import {
    SafeAreaView,
    StyleSheet,
    View,
    Image,
    Dimensions,
    TouchableHighlight,
    Text,
    Button,
    StatusBar,
  } from 'react-native';

export default class HeaderView extends Rect.Component{

    constructor(props){
        super(props);
        this.state={
            normalImage:this.props.normalImage,
            highlightImage:this.props.normalImage,
            title:this.props.title,
            onPress:this.props.onPress,
        }
    }

    render(){
        return(
            <TouchableHighlight onPress={this.props.onPress}>
                <image source={require(this.state.normalImage)}/>
            </TouchableHighlight>
        )
    }

}

HeaderView.propTypes={
    normalImage:PropTypes.string,
    highlightImage:PropTypes.string,
    title:PropTypes.string,
    title:PropTypes.func,
}