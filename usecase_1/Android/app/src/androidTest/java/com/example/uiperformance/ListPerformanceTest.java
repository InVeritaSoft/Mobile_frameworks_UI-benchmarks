package com.example.uiperformance;


import android.content.Intent;
import android.view.View;
import android.widget.TextView;

import androidx.recyclerview.widget.RecyclerView;
import androidx.test.core.app.ActivityScenario;
import androidx.test.espresso.NoMatchingViewException;
import androidx.test.espresso.UiController;
import androidx.test.espresso.ViewAction;
import androidx.test.espresso.action.GeneralLocation;
import androidx.test.espresso.action.GeneralSwipeAction;
import androidx.test.espresso.action.Press;
import androidx.test.espresso.action.Swipe;
import androidx.test.espresso.contrib.RecyclerViewActions;
import androidx.test.espresso.intent.rule.IntentsTestRule;
import androidx.test.espresso.matcher.ViewMatchers;
import androidx.test.filters.LargeTest;
import androidx.test.runner.AndroidJUnit4;

import junit.framework.AssertionFailedError;

import org.hamcrest.Matcher;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;

import static androidx.test.espresso.Espresso.onView;
import static androidx.test.espresso.action.ViewActions.actionWithAssertions;
import static androidx.test.espresso.action.ViewActions.click;
import static androidx.test.espresso.action.ViewActions.scrollTo;
import static androidx.test.espresso.action.ViewActions.swipeDown;
import static androidx.test.espresso.action.ViewActions.swipeUp;
import static androidx.test.espresso.assertion.ViewAssertions.matches;
import static androidx.test.espresso.contrib.RecyclerViewActions.actionOnItemAtPosition;
import static androidx.test.espresso.matcher.ViewMatchers.isAssignableFrom;
import static androidx.test.espresso.matcher.ViewMatchers.isDisplayed;
import static androidx.test.espresso.matcher.ViewMatchers.isRoot;
import static androidx.test.espresso.matcher.ViewMatchers.withId;
import static androidx.test.espresso.matcher.ViewMatchers.withText;

@RunWith(AndroidJUnit4.class)
@LargeTest
public class ListPerformanceTest {

    private static final int PAUSE_SCROOL = 2300;

    protected ActivityScenario<MainActivity> recyclerViewActivityScenario;

    @Before
    public void setUp() {
        recyclerViewActivityScenario = ActivityScenario.launch(MainActivity.class);
    }


    @Test
    public void scroolTest(){
        for(int i = 0; i < 1 ;i++){
            forward();
            revert();
        }
    }

    public void forward(){

        while (true) {
            onView(withId(R.id.recyclerview)).perform(
                    swipeUp()
            );
            onView(isRoot()).perform(waitFor(PAUSE_SCROOL));
        }
//
//        Boolean isVisible = false;
//        while (!isVisible) {
//            onView(withId(R.id.recyclerview)).perform(
//                swipeUp()
//            );
//            onView(isRoot()).perform(waitFor(PAUSE_SCROOL));
//            try {
//                onView(withText("1000")).check(matches(isDisplayed()));
//                isVisible = true;
//            } catch (NoMatchingViewException e) {
//                isVisible = false;
//            }
//        }


    }

    public void revert(){
        Boolean isVisible = false;
        while (!isVisible) {
            onView(withId(R.id.recyclerview)).perform(
                swipeDown()
            );
            onView(isRoot()).perform(waitFor(PAUSE_SCROOL));
            try {
                onView(withText("0")).check(matches(isDisplayed()));
                isVisible = true;
            } catch (NoMatchingViewException e) {
                isVisible = false;
            }
        }
    }

    public static ViewAction swipeUp() {
        return actionWithAssertions(
                new GeneralSwipeAction(
                        Swipe.SLOW,
                        GeneralLocation.BOTTOM_CENTER,
                        GeneralLocation.TOP_CENTER,
                        Press.FINGER));
    }

    public static ViewAction swipeDown() {
        return actionWithAssertions(
                new GeneralSwipeAction(
                        Swipe.SLOW,
                        GeneralLocation.TOP_CENTER,
                        GeneralLocation.BOTTOM_CENTER,
                        Press.FINGER));
    }




    public static ViewAction waitFor(final long delay) {
        return new ViewAction() {
            @Override public Matcher<View> getConstraints() {
                return isRoot();
            }

            @Override public String getDescription() {
                return "wait for " + delay + "milliseconds";
            }

            @Override public void perform(UiController uiController, View view) {
                uiController.loopMainThreadForAtLeast(delay);
            }
        };
    }

}
