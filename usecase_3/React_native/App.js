/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow strict-local
 */

import React, {useEffect} from 'react';
import {StyleSheet, FlatList, Dimensions} from 'react-native';
import FastImage from 'react-native-fast-image';
import Animated, {
  cancelAnimation,
  Easing,
  repeat,
  useAnimatedStyle,
  useSharedValue,
  withTiming,
} from 'react-native-reanimated';

const IMAGES = {
  image0: require('./images/0.jpeg'),
  image1: require('./images/1.jpeg'),
  image2: require('./images/2.jpeg'),
  image3: require('./images/3.jpeg'),
  image4: require('./images/4.jpeg'),
  image5: require('./images/5.jpeg'),
  image6: require('./images/6.jpeg'),
  image7: require('./images/7.jpeg'),
  image8: require('./images/8.jpeg'),
  image9: require('./images/9.jpeg'),
  image10: require('./images/10.jpeg'),
  image11: require('./images/11.jpeg'),
  image12: require('./images/12.jpeg'),
  image13: require('./images/13.jpeg'),
  image14: require('./images/14.jpeg'),
  image15: require('./images/15.jpeg'),
  image16: require('./images/16.jpeg'),
  image17: require('./images/17.jpeg'),
  image18: require('./images/18.jpeg'),
  image19: require('./images/19.jpeg'),
};

function getImage(num) {
  return IMAGES['image' + (num % 20)];
}

let data = Array(200);
for (var i = 0; i < data.length; i++) {
  data[i] = {
    key: String(i),
    src: getImage(i),
  };
}

const App = () => (
  <>
    <FlatList
      data={data}
      numColumns={10}
      keyExtractor={(_, index) => index.toString()}
      renderItem={({item}) => {
        let index = item.key % 3;
        return (
          <Tile
            data={item}
            isSpin={index === 0}
            isScale={index === 1}
            isFade={index === 2}
          />
        );
      }}
    />
  </>
);

const Tile = ({data, isSpin, isScale, isFade}) => {
  const anim = useSharedValue(0);

  const animatedStyle = useAnimatedStyle(() => {
    return {
      transform: isSpin
        ? [{rotate: `${anim.value}deg`}]
        : isScale
        ? [{scale: anim.value}]
        : undefined,
      opacity: isFade ? anim.value : undefined,
    };
  });

  useEffect(() => {
    anim.value = repeat(
      withTiming(isSpin ? 360 : 1, {duration: 5000, easing: Easing.linear}),
      -1,
      !isSpin,
    );
  }, []);

  useEffect(() => {
    return () => {
      cancelAnimation(anim);
    };
  }, []);

  return (
    <Animated.View
      style={[
        {
          height: Dimensions.get('window').width / 10,
          width: Dimensions.get('window').width / 10,
          backgroundColor: 'powderblue',
        },
        animatedStyle,
      ]}>
      <FastImage
        style={styles.imageThumbnail}
        source={data.src}
        resizeMode="cover"
        fadeDuration={0}
      />
    </Animated.View>
  );
};

const styles = StyleSheet.create({
  imageThumbnail: {
    justifyContent: 'center',
    alignItems: 'center',
    width: Dimensions.get('window').width / 10,
    height: Dimensions.get('window').width / 10,
  },
});

export default App;
