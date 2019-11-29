import React from 'react';
import { createAppContainer } from 'react-navigation';
import { createStackNavigator } from 'react-navigation-stack';
import Demo1 from './Demo1';
import Demo2 from './Demo2';
import Demo3 from './Demo3';
import Demo4 from './Demo4';
import RootView from './RootView';


const AppNavigator = createStackNavigator({
    Home: {
        screen: RootView,
        navigationOptions:{
            title:'this is title'
        }
    },
    Demo1: {
        screen: Demo1,
        navigationOptions: {
            title: 'demo1'
        }
    },
    Demo2: {
        screen: Demo2,
    },
    Demo3: {
        screen: Demo3,
    },
    Demo4: {
        screen: Demo4,
    },
    
});


export default createAppContainer(AppNavigator);