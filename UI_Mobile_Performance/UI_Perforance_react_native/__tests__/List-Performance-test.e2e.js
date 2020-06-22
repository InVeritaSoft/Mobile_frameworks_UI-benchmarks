import wd from 'wd';
import config from '../e2e-config';

const port = 4723;
const driver = wd.promiseChainRemote('localhost', port);
jasmine.DEFAULT_TIMEOUT_INTERVAL = 60 * 60 * 1000; // одна  година

describe('UI Performance Example', () => {
  beforeAll(async () => {
    try {
      await driver.init(config);
      await driver.sleep(4000);
    } catch (err) {
      console.log(err);
    }
  });
  afterAll(async () => await driver.quit());

  test('render home screen Android ', async () => {
    // let list = await driver.elementByAccessibilityId('long_list');
    // var size = await driver.getWindowSize();
    // var starty = size.height * 0.8;
    // var endy = size.height * 0.2;
    // var startx = size.width / 2;
    // driver.swipe(startx, starty, startx, endy, 3000);
    // //let list = await driver.getElementById('long_list');
    // var isVisible = false;
    // while (!isVisible) {
    //   await driver.execute('mobile: swipe', {element: list, direction: 'up'});
    //   //await driver.execute('mobile: scroll', {direction: 'down'});
    // }
    var isVisible = false;
    while (!isVisible) {
      var size = await driver.getWindowSize();
      var starty = size.height * 0.8;
      var endy = size.height * 0.2;
      var touchAction = new wd.TouchAction(driver)
        .longPress({x: 0, y: starty})
        .moveTo({x: 0, y: endy})
        .release();
      await touchAction.perform();
      await driver.sleep(1210);
    }
    let item0 = await driver.elementByAccessibilityId('0');
    expect(await item0.text()).toBe('0');
  });

  // test('render home screen ios ', async () => {
  //   let list = await driver.elementByAccessibilityId('long_list');
  //   //let list = await driver.getElementById('long_list');
  //   var isVisible = false;
  //   while (!isVisible) {
  //     await driver.execute('mobile: swipe', {element: list, direction: 'up'});
  //     //await driver.execute('mobile: scroll', {direction: 'down'});
  //   }
  //   // let item100 = await driver.elementByAccessibilityId('100');
  //   // expect(await item100.text()).toBe('100');
  // });
});
