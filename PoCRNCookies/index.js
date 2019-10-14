import React from 'react';
import {AppRegistry, StyleSheet, Text, Button, View} from 'react-native';

class RNRequest extends React.Component {
    render() {
        return (
            <View style={styles.container}>
                <Text style={styles.text}>Vue React Native</Text>
                <Button title="Call Request" onPress={this.callRequest}></Button>
            </View>
        );
    }

    callRequest() {
        return fetch('https://jsonplaceholder.typicode.com/posts/')
        .then((response) => response.json())
        .then((responseJson) => {
            console.log(responseJson);
        })
        .catch((error) => {
            console.error(error);
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
