/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow strict-local
 */

import React from 'react';
import {
  SafeAreaView,
  StyleSheet,
  ScrollView,
  View,
  Text,
  StatusBar,
  FlatList,
} from 'react-native';

import {
  Header,
  LearnMoreLinks,
  Colors,
  DebugInstructions,
  ReloadInstructions,
} from 'react-native/Libraries/NewAppScreen';

import {Appbar} from 'react-native-paper';

import LottieView from 'lottie-react-native';

const makeExample = (getJson) => ({getJson});

const EXAMPLES = [
  makeExample(() => require('./animations/Mobilo/A.json')),
  makeExample(() => require('./animations/Mobilo/B.json')),
  makeExample(() => require('./animations/Mobilo/C.json')),
  makeExample(() => require('./animations/Mobilo/D.json')),
  makeExample(() => require('./animations/Mobilo/E.json')),
  makeExample(() => require('./animations/Mobilo/F.json')),
  makeExample(() => require('./animations/Mobilo/G.json')),
  makeExample(() => require('./animations/Mobilo/H.json')),
  makeExample(() => require('./animations/Mobilo/I.json')),
  makeExample(() => require('./animations/Mobilo/J.json')),
  makeExample(() => require('./animations/Mobilo/K.json')),
  makeExample(() => require('./animations/Mobilo/L.json')),
  makeExample(() => require('./animations/Mobilo/M.json')),
  makeExample(() => require('./animations/Mobilo/N.json')),
  makeExample(() => require('./animations/Mobilo/O.json')),
  makeExample(() => require('./animations/Mobilo/P.json')),
  makeExample(() => require('./animations/Mobilo/Q.json')),
  makeExample(() => require('./animations/Mobilo/R.json')),
  makeExample(() => require('./animations/Mobilo/S.json')),
  makeExample(() => require('./animations/Mobilo/T.json')),
  makeExample(() => require('./animations/Mobilo/U.json')),
  makeExample(() => require('./animations/Mobilo/V.json')),
  makeExample(() => require('./animations/Mobilo/W.json')),
  makeExample(() => require('./animations/Mobilo/X.json')),
  makeExample(() => require('./animations/Mobilo/Y.json')),
  makeExample(() => require('./animations/Mobilo/Z.json')),
  makeExample(() => require('./animations/Mobilo/Apostrophe.json')),
  makeExample(() => require('./animations/Mobilo/Colon.json')),
  makeExample(() => require('./animations/Mobilo/Comma.json')),
  makeExample(() => require('./animations/Mobilo/BlinkingCursor.json')),
  makeExample(() => require('./animations/Mobilo/yoga_carpet.json')),
  makeExample(() => require('./animations/Mobilo/books.json')),
  makeExample(() => require('./animations/Mobilo/bitcoin_to_the_moon.json')),
  makeExample(() => require('./animations/Mobilo/powerupp_app_onboard.json')),
  makeExample(() => require('./animations/Mobilo/loading_copy.json')),
];

const App: () => React$Node = () => {
  return (
    <>
      <StatusBar barStyle="dark-content" />
      <Appbar.Header>
        <Appbar.Content title="Lottie  react-native" />
      </Appbar.Header>
      <FlatList
        data={EXAMPLES}
        renderItem={({item}) => (
          <View
            style={{
              flex: 1,
              alignItems: 'center',
              justifyContent: 'center',
            }}>
            <LottieView
              autoPlay={true}
              style={[140 && {width: 140, height: 80}]}
              source={item.getJson()}
              loop={true}
              enableMergePathsAndroidForKitKatAndAbove
            />
          </View>
        )}
        numColumns={5}
        keyExtractor={(item, index) => index.toString()}
      />
    </>
  );
};

const styles = StyleSheet.create({
  scrollView: {
    backgroundColor: Colors.lighter,
  },
  engine: {
    position: 'absolute',
    right: 0,
  },
  body: {
    backgroundColor: Colors.white,
  },
  sectionContainer: {
    marginTop: 32,
    paddingHorizontal: 24,
  },
  sectionTitle: {
    fontSize: 24,
    fontWeight: '600',
    color: Colors.black,
  },
  sectionDescription: {
    marginTop: 8,
    fontSize: 18,
    fontWeight: '400',
    color: Colors.dark,
  },
  highlight: {
    fontWeight: '700',
  },
  footer: {
    color: Colors.dark,
    fontSize: 12,
    fontWeight: '600',
    padding: 4,
    paddingRight: 12,
    textAlign: 'right',
  },
});

export default App;
