/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow strict-local
 */
import React, {createRef, useEffect} from 'react';
import {
  FlatList,
  StyleSheet,
  Text,
  View,
  Button,
  TouchableOpacity,
} from 'react-native';
import FastImage from 'react-native-fast-image';
import Animated, {
  useSharedValue,
  useAnimatedStyle,
  withTiming,
  Easing,
  repeat,
  cancelAnimation,
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

const getImage = (num) => {
  return IMAGES['image' + (num % 20)];
};

let data = Array(1001);
for (var i = 0; i < data.length; i++) {
  let color =
    'rgb(' +
    Math.floor(Math.random() * 256) +
    ',' +
    Math.floor(Math.random() * 256) +
    ',' +
    Math.floor(Math.random() * 256) +
    ')';
  data[i] = {
    key: String(i),
    color: color,
    image: getImage(i),
  };
}

const FlatListBasics = () => {
  let timerId;
  let currentOffset = 0;
  const intervalTime = 300;
  const flatListRef = createRef();

  const scrollOffset = () => {
    if (currentOffset >= data.length * (styles.item.height + 16)) {
      stopAutoPlay();
    }
    flatListRef.current.scrollToOffset({
      offset: currentOffset,
      animated: true,
    });
    currentOffset = currentOffset + 410;
  };

  const startAutoPlay = () => {
    timerId = setInterval(scrollOffset, intervalTime);
  };

  const stopAutoPlay = () => {
    if (timerId) {
      clearInterval(timerId);
      timerId = null;
    }
  };

  useEffect(() => {
    stopAutoPlay();
  }, []);

  useEffect(() => {
    return () => {
      stopAutoPlay();
    };
  }, []);

  return (
    <View style={styles.container}>
      <TouchableOpacity style={[{marginTop: 25}]} />
      <Button
        style={[{position: 'absolute', top: 50, left: 0}]}
        onPress={startAutoPlay}
        title="Start scroll"
        color="grey"
      />
      <FlatList
        ref={flatListRef}
        testID={'long_list'}
        accessibilityLabel={'long_list'}
        data={data}
        ItemSeparatorComponent={() => (
          <View style={{height: 16, width: '100%', backgroundColor: '#FFF'}} />
        )}
        keyExtractor={(item) => item.key}
        renderItem={({item}) => <CustomRow data={item} />}
      />
    </View>
  );
};

const CustomRow = ({data}) => {
  const spin = useSharedValue(0);

  const animatedStyle = useAnimatedStyle(() => {
    return {
      transform: [{rotate: `${spin.value}deg`}],
    };
  });

  useEffect(() => {
    spin.value = repeat(
      withTiming(360, {duration: 5000, easing: Easing.linear}),
      -1,
    );
  }, []);

  useEffect(() => {
    return () => {
      cancelAnimation(spin);
    };
  }, []);

  return (
    <View style={[styles.item_container, {backgroundColor: data.color}]}>
      <FastImage
        style={styles.image}
        source={data.image}
        resizeMode={'stretch'}
      />
      <Animated.View style={animatedStyle}>
        <FastImage
          style={styles.image}
          source={data.image}
          resizeMode={'stretch'}
          fadeDuration={0}
        />
      </Animated.View>
      <Text accessibilityLabel={data.index} style={styles.item}>
        {data.index}
      </Text>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  item_container: {
    height: 100,
    flexDirection: 'row',
  },
  image: {
    height: 100,
    width: 100,
  },
  item: {
    textAlign: 'center',
    textAlignVertical: 'center',
    justifyContent: 'center',
    fontSize: 18,
    height: 100,
  },
});

export default FlatListBasics;
