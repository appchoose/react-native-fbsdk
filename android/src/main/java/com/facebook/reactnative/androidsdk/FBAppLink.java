package com.facebook.reactnative.androidsdk;


import com.facebook.react.bridge.NativeModule;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

import com.facebook.react.bridge.Promise;

import java.util.Map;
import java.util.HashMap;

import com.facebook.applinks.AppLinkData;

public class FBAppLink extends ReactContextBaseJavaModule {

  public FBAppLink(ReactApplicationContext reactContext) {
    super(reactContext);
  }
   @Override
  public String getName() {
    return "FBAppLink";
  }

  @ReactMethod
  public void get(final Promise promise) {
    try {
        System.out.println("Get AppLink 1");
      AppLinkData.fetchDeferredAppLinkData(getCurrentActivity(),
        new AppLinkData.CompletionHandler() {
          @Override
          public void onDeferredAppLinkDataFetched(AppLinkData appLinkData) {

              System.out.println("Get AppLink 2");

              if (appLinkData != null && appLinkData.getTargetUri() != null){
                promise.resolve(appLinkData.getTargetUri().toString());
              }else{
                 promise.reject("no_url");
              }
          }
      }
      );
    } catch (Exception e) {
         System.out.println("Get AppLink error");
          System.out.println(e.getMessage());
      promise.reject(e.getMessage());
    }
  }

}