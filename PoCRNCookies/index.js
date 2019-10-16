import React from 'react';
import {AppRegistry, StyleSheet, Text, Button, View} from 'react-native';
import CookieManager from 'react-native-cookies';

class RNRequest extends React.Component {
    render() {
        return (
            <View style={styles.container}>
                <Text style={styles.text}>Vue React Native</Text>
                <Button title="Call Request" onPress={this.callRequest}></Button>
                <Button title="Change Cookie Value" onPress={this.modifyCookieValue}></Button>
            </View>
        );
    }

    callRequest() {
        return fetch('https://jsonplaceholder.typicode.com/posts/')
        .then((response) => response.json())
        .then((responseJson) => {
            console.log(responseJson)
        })
        .catch((error) => {
            console.error(error)
        })
    }

    modifyCookieValue() {
        // CookieManager.setFromResponse('https://jsonplaceholder.typicode.com/posts', '__cfduid=modified; expires=Thu, 15-Oct-20 12:59:50 GMT; path=/; domain=.typicode.com; HttpOnly')
        // .then((res) => {
        //     console.log("changed cookie value. Response => ", res)
        // })

        CookieManager.clearByName('__cfduid')
        .then((res) => {
            console.log('CookieManager.clearByName =>', res);
        });

        CookieManager.set({
            name: '__cfduid',
            value: 'modified',
            domain: '.typicode.com',
            origin: 'https://jsonplaceholder.typicode.com/posts',
            path: '/',
            version: '1',
            expiration: '2020-10-16T12:59:50.00-05:00'
          }).then((res) => {
            console.log('CookieManager.set =>', res);
          });

        CookieManager.getAll()
        .then((res) => {
            console.log('CookieManager.getAll =>', res);
        });

    }
}
const styles = StyleSheet.create({
    container: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
        backgroundColor: '#FFFFFF',
    },
    text: {
        textAlign: 'center',
        color: '#333333',
        marginBottom: 5,
    }
});

AppRegistry.registerComponent("RNRequest", () => RNRequest);
