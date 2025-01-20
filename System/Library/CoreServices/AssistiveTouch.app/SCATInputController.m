@interface SCATInputController
- (AXAccessQueue)queue;
- (AXDispatchTimer)inputHoldTimer;
- (AXDispatchTimer)inputLongPressTimer;
- (AXDispatchTimer)inputRepeatTimer;
- (AXSSInterDeviceCommunicator)interDeviceCommunicator;
- (AXSwitchRecipe)recipe;
- (AXUIClient)userInterfaceClient;
- (BOOL)_handleHoldAtPointForActionIdentifier:(id)a3 start:(BOOL)a4;
- (BOOL)_hasExternalSwitchConfigured;
- (BOOL)_isSwitchWithSource:(id)a3 isEnabled:(id)a4;
- (BOOL)_switchConfigurationHasScreenSwitch;
- (BOOL)_switchConfigurationRendersDeviceUnusable;
- (BOOL)hasInitializedInputSources;
- (BOOL)isEnabledSwitchWithSource:(id)a3;
- (BOOL)isInputCoalesceEnabled;
- (BOOL)isInputHoldEnabled;
- (BOOL)isInputRepeatEnabled;
- (BOOL)isSwitchWithSource:(id)a3;
- (BOOL)isValid;
- (BOOL)shouldForwardSwitchEventsForInputSource:(id)a3;
- (NSMutableSet)availableDevices;
- (SCATATVRemoteInputSource)atvRemoteInputSource;
- (SCATAccessibilityEventInputSource)accessibilityEventInputSource;
- (SCATGamepadInputSource)gamepadInputSource;
- (SCATInputController)initWithInterDeviceCommunicator:(id)a3;
- (SCATInputControllerDelegate)delegate;
- (SCATInterDeviceInputSource)interDeviceInputSource;
- (SCATKeyboardInputSource)keyboardInputSource;
- (SCATMFIInputSource)mfiInputSource;
- (SCATMIDIInputSource)midiInputSource;
- (SCATRemoteControlInputSource)remoteControlInputSource;
- (SCATScreenInputSource)screenInputSource;
- (double)timeIntervalBeforeSendAction;
- (double)timeIntervalBeforeSendLongPressAction;
- (double)timeIntervalBeforeSendRepeatAction;
- (double)timeIntervalBetweenDidSendActions;
- (double)timeIntervalSinceDidSendAction;
- (id)_allSwitchesInUse;
- (int64_t)role;
- (void)_configureMFIAccessoryIfNecessary:(id)a3;
- (void)_didReceiveActionWithIdentifier:(id)a3 start:(BOOL)a4 ignoreInputHold:(BOOL)a5;
- (void)_endAction;
- (void)_hideAlertForSource:(unint64_t)a3;
- (void)_hideAlerts;
- (void)_hideStateForSource:(unint64_t)a3;
- (void)_removeInputSource:(id)a3;
- (void)_removeInputSources;
- (void)_removeInputTimers;
- (void)_sendActionWithIdentifier:(id)a3;
- (void)_setupInputTimers;
- (void)_sharedInit;
- (void)_showAlert:(id)a3 forSource:(unint64_t)a4;
- (void)_showState:(id)a3 forSource:(unint64_t)a4;
- (void)_updateATVRemoteInputSource;
- (void)_updateAccessibilityEventInputSource;
- (void)_updateActionsForSource:(id)a3;
- (void)_updateGamepadInputSource;
- (void)_updateInputSources;
- (void)_updateInterDeviceInputSource;
- (void)_updateIsInputCoalesceEnabled;
- (void)_updateIsInputHoldEnabled;
- (void)_updateIsInputRepeatEnabled;
- (void)_updateKeyboardInputSource;
- (void)_updateMFIInputSource;
- (void)_updateMIDIInputSource;
- (void)_updateRemoteControlInputSource;
- (void)_updateScreenInputSource;
- (void)_updateTimeIntervalBeforeSendAction;
- (void)_updateTimeIntervalBeforeSendRepeatAction;
- (void)_updateTimeIntervalBetweenDidSendActions;
- (void)accessibilityEventInputSource:(id)a3 didReceiveActionWithIdentifier:(id)a4 start:(BOOL)a5 ignoreInputHold:(BOOL)a6;
- (void)dealloc;
- (void)didBeginLongPressForInputSource:(id)a3;
- (void)didEndLongPressForInputSource:(id)a3;
- (void)didReceiveSwitchEvent:(id)a3 forDeviceWithName:(id)a4;
- (void)handleInterDeviceBailOutForInputSource:(id)a3;
- (void)hardwareInputSource:(id)a3 didReceiveActionWithIdentifier:(id)a4 start:(BOOL)a5 ignoreInputHold:(BOOL)a6;
- (void)hardwareInputSource:(id)a3 didUpdateAvailability:(BOOL)a4 withDetail:(unint64_t)a5;
- (void)inputSource:(id)a3 forwardSwitchEvent:(id)a4;
- (void)interDeviceInputSource:(id)a3 didReceiveActionWithIdentifier:(id)a4 start:(BOOL)a5 ignoreInputHold:(BOOL)a6;
- (void)performSysdiagnose;
- (void)remoteControlInputSource:(id)a3 didReceiveActionWithIdentifier:(id)a4 start:(BOOL)a5 ignoreInputHold:(BOOL)a6;
- (void)screenInputSource:(id)a3 didReceiveActionWithIdentifier:(id)a4 start:(BOOL)a5 ignoreInputHold:(BOOL)a6;
- (void)setAccessibilityEventInputSource:(id)a3;
- (void)setAtvRemoteInputSource:(id)a3;
- (void)setAvailableDevices:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegate:(id)a3 queue:(id)a4;
- (void)setGamepadInputSource:(id)a3;
- (void)setHasInitializedInputSources:(BOOL)a3;
- (void)setInputHoldTimer:(id)a3;
- (void)setInputLongPressTimer:(id)a3;
- (void)setInputRepeatTimer:(id)a3;
- (void)setInterDeviceInputSource:(id)a3;
- (void)setIsInputCoalesceEnabled:(BOOL)a3;
- (void)setIsInputHoldEnabled:(BOOL)a3;
- (void)setIsInputRepeatEnabled:(BOOL)a3;
- (void)setKeyboardInputSource:(id)a3;
- (void)setMfiInputSource:(id)a3;
- (void)setMidiInputSource:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRecipe:(id)a3;
- (void)setRemoteControlInputSource:(id)a3;
- (void)setScreenInputSource:(id)a3;
- (void)setTimeIntervalBeforeSendAction:(double)a3;
- (void)setTimeIntervalBeforeSendLongPressAction:(double)a3;
- (void)setTimeIntervalBeforeSendRepeatAction:(double)a3;
- (void)setTimeIntervalBetweenDidSendActions:(double)a3;
- (void)setTimeIntervalSinceDidSendAction:(double)a3;
- (void)setValid:(BOOL)a3;
- (void)updateWhetherSwitchConfigurationHasScreenSwitch;
@end

@implementation SCATInputController

- (void)_updateActionsForSource:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SCATInputController _allSwitchesInUse](self, "_allSwitchesInUse"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputController recipe](self, "recipe"));
  [v4 updateWithSwitches:v6 recipe:v5];
}

- (BOOL)_hasExternalSwitchConfigured
{
  if (-[SCATInputController isEnabledSwitchWithSource:](self, "isEnabledSwitchWithSource:", SCATSwitchSourceKeyboard)
    || -[SCATInputController isEnabledSwitchWithSource:](self, "isEnabledSwitchWithSource:", SCATSwitchSourceGamepad)
    || -[SCATInputController isEnabledSwitchWithSource:](self, "isEnabledSwitchWithSource:", SCATSwitchSourceMIDI)
    || -[SCATInputController isEnabledSwitchWithSource:](self, "isEnabledSwitchWithSource:", SCATSwitchSourceMFI))
  {
    return 1;
  }

  else
  {
    return -[SCATInputController isEnabledSwitchWithSource:](self, "isEnabledSwitchWithSource:", SCATSwitchSourceRemote);
  }

- (BOOL)_handleHoldAtPointForActionIdentifier:(id)a3 start:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (![v6 action])
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 shortcutIdentifier]);

    if (!v7) {
      goto LABEL_10;
    }
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputController recipe](self, "recipe"));

  if (!v8) {
    goto LABEL_10;
  }
  uint64_t v32 = 0x7FFFFFFFFFFFFFFFLL;
  BOOL v31 = 0;
  SCATGetRecipeMappingIndexAndLongPressVariant(v6, &v32, &v31);
  unint64_t v9 = v32;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputController recipe](self, "recipe"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 mappings]);
  id v12 = [v11 count];

  if (v9 >= (unint64_t)v12)
  {
    uint64_t v13 = v32;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputController recipe](self, "recipe"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 mappings]);
    id v29 = v6;
    id v30 = [v15 count];
    uint64_t v28 = v13;
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATInputController.m",  226LL,  "-[SCATInputController _handleHoldAtPointForActionIdentifier:start:]",  @"Incorrect mapping index for recipe. Index %lu, action identifier %ld, mappings count %lu");
  }

  unint64_t v16 = v32;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputController recipe](self, "recipe", v28, v29, v30));
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 mappings]);
  id v19 = [v18 count];

  if (v16 < (unint64_t)v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputController recipe](self, "recipe"));
    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 mappings]);
    v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectAtIndexedSubscript:v32]);

    if (v31
      || (v23 = (void *)objc_claimAutoreleasedReturnValue([v22 action]),
          unsigned int v24 = [v23 isEqualToString:AXSwitchRecipeMappingActionHoldAtPoint],
          v23,
          !v24))
    {
      BOOL v26 = 0;
    }

    else
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputController delegate](self, "delegate"));
      [v22 holdPoint];
      objc_msgSend(v25, "inputController:didReceiveRecipeHoldAtPoint:isDown:", self, v4);

      BOOL v26 = 1;
    }
  }

  else
  {
LABEL_10:
    BOOL v26 = 0;
  }

  return v26;
}

- (void)_didReceiveActionWithIdentifier:(id)a3 start:(BOOL)a4 ignoreInputHold:(BOOL)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  if (!-[SCATInputController _handleHoldAtPointForActionIdentifier:start:]( self,  "_handleHoldAtPointForActionIdentifier:start:",  v8,  v6))
  {
    if (v6)
    {
      v11 = _NSConcreteStackBlock;
      uint64_t v12 = 3221225472LL;
      uint64_t v13 = sub_10004AD64;
      v14 = &unk_100122168;
      v15 = self;
      id v16 = v8;
      unint64_t v9 = objc_retainBlock(&v11);
      if (!-[SCATInputController isInputHoldEnabled](self, "isInputHoldEnabled", v11, v12, v13, v14, v15) || a5)
      {
        ((void (*)(void ***))v9[2])(v9);
      }

      else
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputController inputHoldTimer](self, "inputHoldTimer"));
        -[SCATInputController timeIntervalBeforeSendAction](self, "timeIntervalBeforeSendAction");
        objc_msgSend(v10, "afterDelay:processBlock:", v9);
      }
    }

    else
    {
      -[SCATInputController _endAction](self, "_endAction");
    }
  }
}

- (void)_endAction
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[SCATInputController inputHoldTimer](self, "inputHoldTimer"));
  [v4 cancel];
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputController inputRepeatTimer](self, "inputRepeatTimer"));
  [v3 cancel];
}

- (void)_sendActionWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputController delegate](self, "delegate"));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputController queue](self, "queue"));
  uint64_t v7 = objc_claimAutoreleasedReturnValue(-[SCATInputController queue](self, "queue"));
  if (v7)
  {
    id v8 = (void *)v7;
    id v9 = v4;
    if ([v9 action])
    {
    }

    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue([v9 shortcutIdentifier]);

      if (!v10) {
        goto LABEL_15;
      }
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputController recipe](self, "recipe"));

    if (!v11)
    {
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472LL;
      v30[2] = sub_10004B170;
      v30[3] = &unk_1001220B8;
      id v31 = v5;
      uint64_t v32 = self;
      id v21 = v9;
      id v33 = v21;
      [v6 performAsynchronousWritingBlock:v30];
      if (-[SCATInputController isInputRepeatEnabled](self, "isInputRepeatEnabled")
        && ((unint64_t)[v21 action] & 0xFFFFFFFFFFFFFFFELL) == 0x68)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputController inputRepeatTimer](self, "inputRepeatTimer"));
        -[SCATInputController timeIntervalBeforeSendRepeatAction](self, "timeIntervalBeforeSendRepeatAction");
        double v24 = v23;
        objc_initWeak(&location, self);
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472LL;
        v27[2] = sub_10004B180;
        v27[3] = &unk_100122120;
        objc_copyWeak(&v29, &location);
        id v28 = v21;
        [v22 afterDelay:v27 processBlock:v24];

        objc_destroyWeak(&v29);
        objc_destroyWeak(&location);
      }

      v20 = v31;
      goto LABEL_14;
    }

    id location = (id)0x7FFFFFFFFFFFFFFFLL;
    BOOL v39 = 0;
    SCATGetRecipeMappingIndexAndLongPressVariant(v9, (uint64_t *)&location, &v39);
    id v12 = location;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputController recipe](self, "recipe"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 mappings]);
    id v15 = [v14 count];

    if (v12 >= v15)
    {
      id v25 = location;
      BOOL v26 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputController recipe](self, "recipe"));
      _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATInputController.m",  312LL,  "-[SCATInputController _sendActionWithIdentifier:]",  @"Mapping index %lu was out of bounds for recipe %@");
    }

    id v16 = location;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputController recipe](self, "recipe", v25, v26));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 mappings]);
    id v19 = [v18 count];

    if (v16 < v19)
    {
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472LL;
      v34[2] = sub_10004B15C;
      v34[3] = &unk_100123610;
      id v35 = v5;
      v36 = self;
      id v37 = location;
      BOOL v38 = v39;
      [v6 performAsynchronousWritingBlock:v34];
      v20 = v35;
LABEL_14:
    }
  }

- (void)_updateTimeIntervalBeforeSendAction
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v3 assistiveTouchInputHoldDuration];
  -[SCATInputController setTimeIntervalBeforeSendAction:](self, "setTimeIntervalBeforeSendAction:");
}

- (void)_updateTimeIntervalBeforeSendRepeatAction
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v3 assistiveTouchActionRepeatInterval];
  -[SCATInputController setTimeIntervalBeforeSendRepeatAction:](self, "setTimeIntervalBeforeSendRepeatAction:");
}

- (void)_updateTimeIntervalBetweenDidSendActions
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v3 assistiveTouchInputCoalescingDuration];
  -[SCATInputController setTimeIntervalBetweenDidSendActions:](self, "setTimeIntervalBetweenDidSendActions:");
}

- (void)_updateIsInputHoldEnabled
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  -[SCATInputController setIsInputHoldEnabled:]( self,  "setIsInputHoldEnabled:",  [v3 assistiveTouchInputHoldEnabled]);
}

- (void)_updateIsInputRepeatEnabled
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  -[SCATInputController setIsInputRepeatEnabled:]( self,  "setIsInputRepeatEnabled:",  [v3 assistiveTouchActionRepeatEnabled]);
}

- (void)_updateIsInputCoalesceEnabled
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  -[SCATInputController setIsInputCoalesceEnabled:]( self,  "setIsInputCoalesceEnabled:",  [v3 assistiveTouchInputCoalescingEnabled]);
}

- (void)didBeginLongPressForInputSource:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[SCATInputController delegate](self, "delegate", a3));
  [v4 didBeginLongPressForInputController:self];
}

- (void)didEndLongPressForInputSource:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[SCATInputController delegate](self, "delegate", a3));
  [v4 didEndLongPressForInputController:self];
}

- (BOOL)shouldForwardSwitchEventsForInputSource:(id)a3
{
  return (id)-[SCATInputController role](self, "role", a3) == (id)1;
}

- (void)inputSource:(id)a3 forwardSwitchEvent:(id)a4
{
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SCATInputController interDeviceCommunicator](self, "interDeviceCommunicator"));
  [v6 forwardSwitchEvent:v5];
}

- (void)handleInterDeviceBailOutForInputSource:(id)a3
{
  uint64_t v4 = AXSSLogForCategory(1LL, a2, a3);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Inter-device bail out.", buf, 2u);
  }

  if (CFPreferencesGetAppBooleanValue( @"GatherAnalyticsOnBailOut",  @"com.apple.Accessibility.SwitchControl",  0LL))
  {
    uint64_t v8 = AXSSLogForCategory(1LL, v6, v7);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Performing sysdiagnose on forwarder and receiver.",  v13,  2u);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputController delegate](self, "delegate"));
    [v10 performSysdiagnoseForInputController:self];

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputController interDeviceCommunicator](self, "interDeviceCommunicator"));
    [v11 performSysdiagnoseOnReceiver];
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputController interDeviceCommunicator](self, "interDeviceCommunicator"));
  [v12 stop];
}

- (void)hardwareInputSource:(id)a3 didReceiveActionWithIdentifier:(id)a4 start:(BOOL)a5 ignoreInputHold:(BOOL)a6
{
}

- (void)hardwareInputSource:(id)a3 didUpdateAvailability:(BOOL)a4 withDetail:(unint64_t)a5
{
  BOOL v6 = a4;
  uint64_t v8 = (NSMutableSet *)a3;
  v10 = v8;
  if (self->_availableDevices)
  {
    if (!v8) {
      goto LABEL_11;
    }
  }

  else
  {
    v11 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    availableDevices = self->_availableDevices;
    self->_availableDevices = v11;

    if (!v10)
    {
LABEL_11:
      if (v10)
      {
        uint64_t v20 = SWCHLogHW(v8, v9);
        id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          int v29 = 138412290;
          id v30 = v10;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_INFO,  "Removing Hardware Input Source to available devices: %@",  (uint8_t *)&v29,  0xCu);
        }

        id v22 = -[NSMutableSet removeObject:](self->_availableDevices, "removeObject:", v10);
        uint64_t v24 = SWCHLogHW(v22, v23);
        id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          BOOL v26 = self->_availableDevices;
          int v29 = 138412290;
          id v30 = v26;
          _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_INFO,  "We now have %@ availableDevices",  (uint8_t *)&v29,  0xCu);
        }
      }

      -[SCATInputController _endAction](self, "_endAction");
      goto LABEL_18;
    }
  }

  if (!v6) {
    goto LABEL_11;
  }
  uint64_t v13 = SWCHLogHW(v8, v9);
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    int v29 = 138412290;
    id v30 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "Adding Hardware Input Source to available devices: %@",  (uint8_t *)&v29,  0xCu);
  }

  id v15 = -[NSMutableSet addObject:](self->_availableDevices, "addObject:", v10);
  uint64_t v17 = SWCHLogHW(v15, v16);
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    id v19 = self->_availableDevices;
    int v29 = 138412290;
    id v30 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "We now have %@ availableDevices",  (uint8_t *)&v29,  0xCu);
  }

  -[SCATInputController _configureMFIAccessoryIfNecessary:](self, "_configureMFIAccessoryIfNecessary:", v10);
  -[SCATInputController _hideAlertForSource:](self, "_hideAlertForSource:", 2LL);
LABEL_18:
  if (!-[NSMutableSet count](self->_availableDevices, "count")
    && -[SCATInputController _hasExternalSwitchConfigured](self, "_hasExternalSwitchConfigured"))
  {
    id v27 = SCATHardwareInputSourceAvailabilityDetailLocalizedDescription(a5);
    id v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    -[SCATInputController _showAlert:forSource:](self, "_showAlert:forSource:", v28, 2LL);
  }

  -[SCATInputController updateWhetherSwitchConfigurationRendersDeviceUnusable]( self,  "updateWhetherSwitchConfigurationRendersDeviceUnusable");
}

- (void)screenInputSource:(id)a3 didReceiveActionWithIdentifier:(id)a4 start:(BOOL)a5 ignoreInputHold:(BOOL)a6
{
}

- (void)interDeviceInputSource:(id)a3 didReceiveActionWithIdentifier:(id)a4 start:(BOOL)a5 ignoreInputHold:(BOOL)a6
{
}

- (void)accessibilityEventInputSource:(id)a3 didReceiveActionWithIdentifier:(id)a4 start:(BOOL)a5 ignoreInputHold:(BOOL)a6
{
}

- (void)remoteControlInputSource:(id)a3 didReceiveActionWithIdentifier:(id)a4 start:(BOOL)a5 ignoreInputHold:(BOOL)a6
{
}

- (void)_configureMFIAccessoryIfNecessary:(id)a3
{
  id v27 = a3;
  unsigned int v4 = [v27 isMFIInputSource];
  id v5 = v27;
  if (v4)
  {
    id v6 = v27;
    uint64_t v7 = SCATSwitchSourceMFI;
    unsigned int v8 = -[SCATInputController isEnabledSwitchWithSource:](self, "isEnabledSwitchWithSource:", SCATSwitchSourceMFI);
    char v9 = v8;
    NSLog(@"Attempting MFI autoconfigure : %d", v8);
    if ((v9 & 1) != 0)
    {
LABEL_19:

      id v5 = v27;
      goto LABEL_20;
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 assistiveTouchSwitches]);
    id v12 = (NSMutableSet *)[v11 mutableCopy];

    if (!v12) {
      id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    }
    NSLog(@"Available buttons: %d", [v6 availableButtons]);
    if ((uint64_t)[v6 availableButtons] < 1)
    {
      id v15 = 0LL;
    }

    else
    {
      id v13 = sub_10002B014(@"MadeForIphone_HardwareSwitch_Select");
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      id v15 = (void *)objc_claimAutoreleasedReturnValue( +[AXSwitch switchWithAction:name:source:type:]( &OBJC_CLASS___AXSwitch,  "switchWithAction:name:source:type:",  103LL,  v14,  v7,  SCATSwitchTypeRequired));

      [v15 setButtonNumber:1];
      -[NSMutableSet addObject:](v12, "addObject:", v15);
    }

    if ((uint64_t)[v6 availableButtons] <= 1)
    {
      v18 = 0LL;
      if (!v15) {
        goto LABEL_14;
      }
    }

    else
    {
      id v16 = sub_10002B014(@"MadeForIphone_HardwareSwitch_MoveToNextItem");
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue( +[AXSwitch switchWithAction:name:source:type:]( &OBJC_CLASS___AXSwitch,  "switchWithAction:name:source:type:",  104LL,  v17,  v7,  SCATSwitchTypeRequired));

      [v18 setButtonNumber:2];
      -[NSMutableSet addObject:](v12, "addObject:", v18);
      if (!v15) {
        goto LABEL_14;
      }
    }

    if (!v18)
    {
      id v19 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
      uint64_t v20 = v19;
      uint64_t v21 = 0LL;
      goto LABEL_17;
    }

- (void)_removeInputSource:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = v3;
    [v3 stopRunning];
    [v4 setDelegate:0 queue:0];
  }

- (void)_removeInputSources
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputController keyboardInputSource](self, "keyboardInputSource"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputController mfiInputSource](self, "mfiInputSource"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputController atvRemoteInputSource](self, "atvRemoteInputSource"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputController midiInputSource](self, "midiInputSource"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputController gamepadInputSource](self, "gamepadInputSource"));
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray axArrayByIgnoringNilElementsWithCount:]( &OBJC_CLASS___NSArray,  "axArrayByIgnoringNilElementsWithCount:",  5LL,  v3,  v4,  v5,  v6,  v7));

  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      id v13 = 0LL;
      do
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)v13);
        if (v14)
        {
          [*(id *)(*((void *)&v23 + 1) + 8 * (void)v13) stopRunning];
          [v14 setDelegate:0 queue:0];
          -[SCATInputController _hideAlertForSource:](self, "_hideAlertForSource:", 2LL);
        }

        id v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }

    while (v11);
  }

  -[SCATInputController setKeyboardInputSource:](self, "setKeyboardInputSource:", 0LL);
  -[SCATInputController setMfiInputSource:](self, "setMfiInputSource:", 0LL);
  -[SCATInputController setAtvRemoteInputSource:](self, "setAtvRemoteInputSource:", 0LL);
  -[SCATInputController setMidiInputSource:](self, "setMidiInputSource:", 0LL);
  -[SCATInputController setGamepadInputSource:](self, "setGamepadInputSource:", 0LL);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputController screenInputSource](self, "screenInputSource"));
  id v16 = v15;
  if (v15)
  {
    [v15 stopRunning];
    [v16 setDelegate:0 queue:0];
    -[SCATInputController setScreenInputSource:](self, "setScreenInputSource:", 0LL);
  }

  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputController interDeviceInputSource](self, "interDeviceInputSource"));
  [v17 stopRunning];

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputController interDeviceInputSource](self, "interDeviceInputSource"));
  [v18 setDelegate:0 queue:0];

  -[SCATInputController setInterDeviceInputSource:](self, "setInterDeviceInputSource:", 0LL);
  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputController accessibilityEventInputSource](self, "accessibilityEventInputSource"));
  uint64_t v20 = v19;
  if (v19)
  {
    [v19 stopRunning];
    [v20 setDelegate:0 queue:0];
    -[SCATInputController setAccessibilityEventInputSource:](self, "setAccessibilityEventInputSource:", 0LL);
  }

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputController remoteControlInputSource](self, "remoteControlInputSource"));
  id v22 = v21;
  if (v21)
  {
    [v21 stopRunning];
    [v22 setDelegate:0 queue:0];
    -[SCATInputController setRemoteControlInputSource:](self, "setRemoteControlInputSource:", 0LL);
  }
}

- (void)_updateATVRemoteInputSource
{
  id v9 = (SCATATVRemoteInputSource *)objc_claimAutoreleasedReturnValue(-[SCATInputController atvRemoteInputSource](self, "atvRemoteInputSource"));
  unsigned int v3 = -[SCATInputController isEnabledSwitchWithSource:](self, "isEnabledSwitchWithSource:", SCATSwitchSourceATVRemote);
  if (v3) {
    BOOL v4 = v9 == 0LL;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4)
  {
    id v9 = objc_alloc_init(&OBJC_CLASS___SCATATVRemoteInputSource);
    -[SCATInputController setAtvRemoteInputSource:](self, "setAtvRemoteInputSource:", v9);
    -[SCATInputController _updateActionsForSource:](self, "_updateActionsForSource:", v9);
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[AXAccessQueue mainAccessQueue](&OBJC_CLASS___AXAccessQueue, "mainAccessQueue"));
    -[SCATHardwareInputSource setDelegate:queue:](v9, "setDelegate:queue:", self, v8);

    -[SCATHardwareInputSource startRunning](v9, "startRunning");
    goto LABEL_19;
  }

  if (v3) {
    BOOL v5 = v9 == 0LL;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    -[SCATInputController _updateActionsForSource:](self, "_updateActionsForSource:", v9);
LABEL_19:
    uint64_t v7 = v9;
    goto LABEL_20;
  }

  if (v9) {
    char v6 = v3;
  }
  else {
    char v6 = 1;
  }
  if (v3) {
    uint64_t v7 = v9;
  }
  else {
    uint64_t v7 = 0LL;
  }
  if ((v6 & 1) == 0)
  {
    -[SCATHardwareInputSource stopRunning](v9, "stopRunning");
    -[SCATHardwareInputSource setDelegate:queue:](v9, "setDelegate:queue:", 0LL, 0LL);
    -[SCATInputController setAtvRemoteInputSource:](self, "setAtvRemoteInputSource:", 0LL);
    -[SCATInputController _hideAlertForSource:](self, "_hideAlertForSource:", 2LL);
    goto LABEL_19;
  }

- (void)_updateKeyboardInputSource
{
  unsigned int v8 = (SCATKeyboardInputSource *)objc_claimAutoreleasedReturnValue(-[SCATInputController keyboardInputSource](self, "keyboardInputSource"));
  unsigned int v3 = -[SCATInputController isEnabledSwitchWithSource:](self, "isEnabledSwitchWithSource:", SCATSwitchSourceKeyboard);
  BOOL v4 = v8;
  if (v3) {
    BOOL v5 = v8 == 0LL;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    unsigned int v8 = objc_opt_new(&OBJC_CLASS___SCATKeyboardInputSource);
    -[SCATInputController setKeyboardInputSource:](self, "setKeyboardInputSource:", v8);
    -[SCATInputController _updateActionsForSource:](self, "_updateActionsForSource:", v8);
    char v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXAccessQueue mainAccessQueue](&OBJC_CLASS___AXAccessQueue, "mainAccessQueue"));
    -[SCATHardwareInputSource setDelegate:queue:](v8, "setDelegate:queue:", self, v6);

    -[SCATHardwareInputSource startRunning](v8, "startRunning");
    goto LABEL_14;
  }

  if (v8 && ((v3 ^ 1) & 1) == 0)
  {
    -[SCATInputController _updateActionsForSource:](self, "_updateActionsForSource:", v8);
LABEL_14:
    BOOL v4 = v8;
    goto LABEL_15;
  }

  if (v8) {
    char v7 = v3;
  }
  else {
    char v7 = 1;
  }
  if ((v7 & 1) == 0)
  {
    -[SCATHardwareInputSource stopRunning](v8, "stopRunning");
    -[SCATHardwareInputSource setDelegate:queue:](v8, "setDelegate:queue:", 0LL, 0LL);
    -[SCATInputController setKeyboardInputSource:](self, "setKeyboardInputSource:", 0LL);
    -[SCATInputController _hideAlertForSource:](self, "_hideAlertForSource:", 2LL);
    goto LABEL_14;
  }

- (void)_updateMIDIInputSource
{
  id v9 = (SCATMIDIInputSource *)objc_claimAutoreleasedReturnValue(-[SCATInputController midiInputSource](self, "midiInputSource"));
  BOOL v3 = -[SCATInputController isEnabledSwitchWithSource:](self, "isEnabledSwitchWithSource:", SCATSwitchSourceMIDI);
  char v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v9 != 0LL));
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3));
  AXPrintLine(6LL, @"isMIDIInputSource: %@. isSwitchWithMIDISource: %@.");

  BOOL v4 = v9;
  char v5 = !v3;
  if (!v9 && v3)
  {
    id v9 = objc_opt_new(&OBJC_CLASS___SCATMIDIInputSource);
    -[SCATInputController setMidiInputSource:](self, "setMidiInputSource:", v9);
    -[SCATInputController _updateActionsForSource:](self, "_updateActionsForSource:", v9);
    char v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXAccessQueue mainAccessQueue](&OBJC_CLASS___AXAccessQueue, "mainAccessQueue"));
    -[SCATHardwareInputSource setDelegate:queue:](v9, "setDelegate:queue:", self, v6);

    -[SCATHardwareInputSource startRunning](v9, "startRunning");
LABEL_10:
    BOOL v4 = v9;
    goto LABEL_11;
  }

  if (!v9) {
    char v5 = 1;
  }
  if ((v5 & 1) == 0)
  {
    -[SCATInputController _updateActionsForSource:](self, "_updateActionsForSource:", v9);
    goto LABEL_10;
  }

  if (v9 != 0LL && !v3)
  {
    -[SCATHardwareInputSource stopRunning](v9, "stopRunning");
    -[SCATHardwareInputSource setDelegate:queue:](v9, "setDelegate:queue:", 0LL, 0LL);
    -[SCATInputController setMidiInputSource:](self, "setMidiInputSource:", 0LL);
    -[SCATInputController _hideAlertForSource:](self, "_hideAlertForSource:", 2LL);
    goto LABEL_10;
  }

- (void)_updateMFIInputSource
{
  char v6 = (SCATMFIInputSource *)objc_claimAutoreleasedReturnValue(-[SCATInputController mfiInputSource](self, "mfiInputSource"));
  unsigned int v3 = -[SCATInputController isEnabledSwitchWithSource:](self, "isEnabledSwitchWithSource:", SCATSwitchSourceMFI);
  BOOL v4 = v6;
  if (!v6)
  {
    char v6 = objc_opt_new(&OBJC_CLASS___SCATMFIInputSource);
    -[SCATInputController setMfiInputSource:](self, "setMfiInputSource:", v6);
    -[SCATInputController _updateActionsForSource:](self, "_updateActionsForSource:", v6);
    char v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXAccessQueue mainAccessQueue](&OBJC_CLASS___AXAccessQueue, "mainAccessQueue"));
    -[SCATHardwareInputSource setDelegate:queue:](v6, "setDelegate:queue:", self, v5);

    -[SCATHardwareInputSource startRunning](v6, "startRunning");
    goto LABEL_5;
  }

  if (v3)
  {
    -[SCATInputController _updateActionsForSource:](self, "_updateActionsForSource:", v6);
LABEL_5:
    BOOL v4 = v6;
  }
}

- (void)_updateScreenInputSource
{
  id v9 = (SCATScreenInputSource *)objc_claimAutoreleasedReturnValue(-[SCATInputController screenInputSource](self, "screenInputSource"));
  unsigned int v3 = -[SCATInputController isEnabledSwitchWithSource:](self, "isEnabledSwitchWithSource:", SCATSwitchSourceScreen);
  if (v3) {
    BOOL v4 = v9 == 0LL;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4)
  {
    id v9 = objc_opt_new(&OBJC_CLASS___SCATScreenInputSource);
    -[SCATInputController setScreenInputSource:](self, "setScreenInputSource:", v9);
    -[SCATInputController _updateActionsForSource:](self, "_updateActionsForSource:", v9);
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[AXAccessQueue mainAccessQueue](&OBJC_CLASS___AXAccessQueue, "mainAccessQueue"));
    -[SCATScreenInputSource setDelegate:queue:](v9, "setDelegate:queue:", self, v8);

    -[SCATScreenInputSource startRunning](v9, "startRunning");
  }

  else
  {
    if (v3) {
      BOOL v5 = v9 == 0LL;
    }
    else {
      BOOL v5 = 1;
    }
    if (v5)
    {
      if (v9) {
        char v6 = v3;
      }
      else {
        char v6 = 1;
      }
      if (v3) {
        char v7 = v9;
      }
      else {
        char v7 = 0LL;
      }
      if ((v6 & 1) != 0)
      {
        id v9 = v7;
      }

      else
      {
        -[SCATScreenInputSource stopRunning](v9, "stopRunning");
        -[SCATScreenInputSource setDelegate:queue:](v9, "setDelegate:queue:", 0LL, 0LL);
        -[SCATInputController setScreenInputSource:](self, "setScreenInputSource:", 0LL);
      }
    }

    else
    {
      -[SCATInputController _updateActionsForSource:](self, "_updateActionsForSource:", v9);
    }
  }

  -[SCATInputController updateWhetherSwitchConfigurationHasScreenSwitch]( self,  "updateWhetherSwitchConfigurationHasScreenSwitch");
  -[SCATInputController updateWhetherSwitchConfigurationRendersDeviceUnusable]( self,  "updateWhetherSwitchConfigurationRendersDeviceUnusable");
}

- (void)_updateGamepadInputSource
{
  id v9 = (SCATGamepadInputSource *)objc_claimAutoreleasedReturnValue(-[SCATInputController gamepadInputSource](self, "gamepadInputSource"));
  unsigned int v3 = -[SCATInputController isEnabledSwitchWithSource:](self, "isEnabledSwitchWithSource:", SCATSwitchSourceGamepad);
  BOOL v4 = v9;
  if (v3) {
    BOOL v5 = v9 == 0LL;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    id v9 = objc_opt_new(&OBJC_CLASS___SCATGamepadInputSource);
    -[SCATInputController setGamepadInputSource:](self, "setGamepadInputSource:", v9);
    -[SCATInputController _updateActionsForSource:](self, "_updateActionsForSource:", v9);
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[AXAccessQueue mainAccessQueue](&OBJC_CLASS___AXAccessQueue, "mainAccessQueue"));
    -[SCATHardwareInputSource setDelegate:queue:](v9, "setDelegate:queue:", self, v8);

    -[SCATHardwareInputSource startRunning](v9, "startRunning");
    goto LABEL_16;
  }

  if (v3) {
    BOOL v6 = v9 == 0LL;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    -[SCATInputController _updateActionsForSource:](self, "_updateActionsForSource:", v9);
LABEL_16:
    BOOL v4 = v9;
    goto LABEL_17;
  }

  if (v9) {
    char v7 = v3;
  }
  else {
    char v7 = 1;
  }
  if ((v7 & 1) == 0)
  {
    -[SCATHardwareInputSource stopRunning](v9, "stopRunning");
    -[SCATHardwareInputSource setDelegate:queue:](v9, "setDelegate:queue:", 0LL, 0LL);
    -[SCATInputController setGamepadInputSource:](self, "setGamepadInputSource:", 0LL);
    -[SCATInputController _hideAlertForSource:](self, "_hideAlertForSource:", 2LL);
    goto LABEL_16;
  }

- (void)_updateInterDeviceInputSource
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputController interDeviceInputSource](self, "interDeviceInputSource"));

  if (!v3)
  {
    BOOL v4 = objc_opt_new(&OBJC_CLASS___SCATInterDeviceInputSource);
    -[SCATInputController setInterDeviceInputSource:](self, "setInterDeviceInputSource:", v4);
    -[SCATInputController _updateActionsForSource:](self, "_updateActionsForSource:", v4);
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXAccessQueue mainAccessQueue](&OBJC_CLASS___AXAccessQueue, "mainAccessQueue"));
    -[SCATInterDeviceInputSource setDelegate:queue:](v4, "setDelegate:queue:", self, v5);

    -[SCATInputSource startRunning](v4, "startRunning");
  }

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SCATInputController interDeviceInputSource](self, "interDeviceInputSource"));
  -[SCATInputController _updateActionsForSource:](self, "_updateActionsForSource:", v6);
}

- (void)_updateAccessibilityEventInputSource
{
  char v7 = (SCATAccessibilityEventInputSource *)objc_claimAutoreleasedReturnValue( -[SCATInputController accessibilityEventInputSource]( self,  "accessibilityEventInputSource"));
  if (-[SCATInputController isEnabledSwitchWithSource:]( self,  "isEnabledSwitchWithSource:",  SCATSwitchSourceAccessibility)
    || -[SCATInputController isEnabledSwitchWithSource:]( self,  "isEnabledSwitchWithSource:",  SCATSwitchSourceHandGestures)
    || -[SCATInputController isEnabledSwitchWithSource:](self, "isEnabledSwitchWithSource:", SCATSwitchSourceGamepad))
  {
    unsigned int v3 = 1;
  }

  else
  {
    unsigned int v3 = -[SCATInputController isEnabledSwitchWithSource:]( self,  "isEnabledSwitchWithSource:",  SCATSwitchSourceAutomation);
  }

  BOOL v4 = v7;
  if (v3 && !v7)
  {
    char v7 = objc_opt_new(&OBJC_CLASS___SCATAccessibilityEventInputSource);
    -[SCATInputController setAccessibilityEventInputSource:](self, "setAccessibilityEventInputSource:", v7);
    -[SCATInputController _updateActionsForSource:](self, "_updateActionsForSource:", v7);
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXAccessQueue mainAccessQueue](&OBJC_CLASS___AXAccessQueue, "mainAccessQueue"));
    -[SCATAccessibilityEventInputSource setDelegate:queue:](v7, "setDelegate:queue:", self, v5);

    -[SCATAccessibilityEventInputSource startRunning](v7, "startRunning");
LABEL_16:
    BOOL v4 = v7;
    goto LABEL_17;
  }

  if (v7) {
    unsigned int v6 = v3;
  }
  else {
    unsigned int v6 = 0;
  }
  if (v6 == 1)
  {
    -[SCATInputController _updateActionsForSource:](self, "_updateActionsForSource:", v7);
    goto LABEL_16;
  }

  if ((v3 & 1) == 0 && v7)
  {
    -[SCATAccessibilityEventInputSource stopRunning](v7, "stopRunning");
    -[SCATAccessibilityEventInputSource setDelegate:queue:](v7, "setDelegate:queue:", 0LL, 0LL);
    -[SCATInputController setAccessibilityEventInputSource:](self, "setAccessibilityEventInputSource:", 0LL);
    goto LABEL_16;
  }

- (void)_updateRemoteControlInputSource
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputController remoteControlInputSource](self, "remoteControlInputSource"));

  if (!v3)
  {
    BOOL v4 = objc_opt_new(&OBJC_CLASS___SCATRemoteControlInputSource);
    -[SCATInputController setRemoteControlInputSource:](self, "setRemoteControlInputSource:", v4);

    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputController remoteControlInputSource](self, "remoteControlInputSource"));
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXAccessQueue mainAccessQueue](&OBJC_CLASS___AXAccessQueue, "mainAccessQueue"));
    [v5 setDelegate:self queue:v6];

    id v7 = (id)objc_claimAutoreleasedReturnValue(-[SCATInputController remoteControlInputSource](self, "remoteControlInputSource"));
    [v7 startRunning];
  }

- (void)_updateInputSources
{
}

- (BOOL)_switchConfigurationRendersDeviceUnusable
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputController _allSwitchesInUse](self, "_allSwitchesInUse"));
  uint64_t v67 = 0LL;
  v68 = &v67;
  uint64_t v69 = 0x2020000000LL;
  char v70 = 0;
  uint64_t v63 = 0LL;
  v64 = &v63;
  uint64_t v65 = 0x2020000000LL;
  char v66 = 0;
  uint64_t v59 = 0LL;
  v60 = &v59;
  uint64_t v61 = 0x2020000000LL;
  char v62 = 0;
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472LL;
  v54[2] = sub_10004CE38;
  v54[3] = &unk_100123638;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v55 = v4;
  v56 = &v67;
  v57 = &v63;
  v58 = &v59;
  [v3 enumerateObjectsUsingBlock:v54];
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputController recipe](self, "recipe"));
  if (v5)
  {
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputController recipe](self, "recipe"));
    unsigned __int8 v7 = [v6 shouldContinueScanning];

    if ((v7 & 1) == 0) {
      goto LABEL_57;
    }
  }

  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v9 = [v8 switchControlScanningStyle];

  if (!v9) {
    goto LABEL_61;
  }
  if (v9 == (id)1)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputController keyboardInputSource](self, "keyboardInputSource"));
    id v11 = [v10 numberOfDevicesConnected];

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputController mfiInputSource](self, "mfiInputSource"));
    id v13 = [v12 numberOfDevicesConnected];

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputController midiInputSource](self, "midiInputSource"));
    id v52 = [v14 numberOfDevicesConnected];

    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputController gamepadInputSource](self, "gamepadInputSource"));
    id v51 = [v15 numberOfDevicesConnected];

    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputController interDeviceCommunicator](self, "interDeviceCommunicator"));
    unsigned int v17 = [v16 isReceivingSwitchEvents];

    unsigned int v49 = v17;
    if (*((_BYTE *)v68 + 24))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:SCATSwitchSourceScreen]);
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 firstObject]);
      if ([v19 BOOLValue])
      {
        int v20 = 1;
      }

      else
      {
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:SCATSwitchSourceKeyboard]);
        id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 firstObject]);
        if ([v22 BOOLValue] && v11)
        {
          int v20 = 1;
        }

        else
        {
          __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:SCATSwitchSourceMFI]);
          v47 = (void *)objc_claimAutoreleasedReturnValue([v23 firstObject]);
          if ([v47 BOOLValue] && v13)
          {
            int v20 = 1;
          }

          else
          {
            v45 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:SCATSwitchSourceMIDI]);
            v43 = (void *)objc_claimAutoreleasedReturnValue([v45 firstObject]);
            if ([v43 BOOLValue] && v52)
            {
              int v20 = 1;
            }

            else
            {
              v41 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:SCATSwitchSourceRemote]);
              v40 = (void *)objc_claimAutoreleasedReturnValue([v41 firstObject]);
              if ([v40 BOOLValue] & v17)
              {
                int v20 = 1;
              }

              else
              {
                BOOL v39 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:SCATSwitchSourceGamepad]);
                BOOL v38 = (void *)objc_claimAutoreleasedReturnValue([v39 firstObject]);
                unsigned int v24 = [v38 BOOLValue];
                if (v51) {
                  int v20 = v24;
                }
                else {
                  int v20 = 0;
                }
              }
            }
          }
        }
      }
    }

    else
    {
      int v20 = 0;
    }

    if (!*((_BYTE *)v64 + 24)) {
      goto LABEL_57;
    }
    __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:SCATSwitchSourceScreen]);
    __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v25 lastObject]);
    if ([v26 BOOLValue])
    {
      int v27 = 1;
    }

    else
    {
      id v28 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:SCATSwitchSourceKeyboard]);
      int v29 = (void *)objc_claimAutoreleasedReturnValue([v28 lastObject]);
      if ([v29 BOOLValue] && v11)
      {
        int v27 = 1;
      }

      else
      {
        id v30 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:SCATSwitchSourceMFI]);
        id v31 = (void *)objc_claimAutoreleasedReturnValue([v30 lastObject]);
        if ([v31 BOOLValue] && v13)
        {
          uint64_t v32 = v31;
          int v27 = 1;
        }

        else
        {
          id v33 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:SCATSwitchSourceMIDI]);
          v48 = (void *)objc_claimAutoreleasedReturnValue([v33 lastObject]);
          v46 = v30;
          if ([v48 BOOLValue] && v52)
          {
            v34 = v33;
            uint64_t v32 = v31;
            int v27 = 1;
          }

          else
          {
            v53 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:SCATSwitchSourceRemote]);
            v44 = (void *)objc_claimAutoreleasedReturnValue([v53 lastObject]);
            if ([v44 BOOLValue] & v49)
            {
              v34 = v33;
              uint64_t v32 = v31;
              int v27 = 1;
            }

            else
            {
              v50 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:SCATSwitchSourceGamepad]);
              v42 = (void *)objc_claimAutoreleasedReturnValue([v50 lastObject]);
              unsigned int v35 = [v42 BOOLValue];
              v34 = v33;
              uint64_t v32 = v31;
              int v27 = v51 ? v35 : 0;
            }
          }

          id v30 = v46;
        }
      }
    }

    if ((v20 & v27 & 1) == 0) {
      goto LABEL_57;
    }
    goto LABEL_56;
  }

  if (v9 != (id)2)
  {
LABEL_57:
    BOOL v36 = *((_BYTE *)v60 + 24) != 0;
    goto LABEL_58;
  }

  if (!*((_BYTE *)v64 + 24))
  {
LABEL_61:
    if (!*((_BYTE *)v68 + 24)) {
      goto LABEL_57;
    }
  }

- (BOOL)_switchConfigurationHasScreenSwitch
{
  return -[SCATInputController isEnabledSwitchWithSource:](self, "isEnabledSwitchWithSource:", SCATSwitchSourceScreen);
}

- (void)_removeInputTimers
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SCATInputController inputHoldTimer](self, "inputHoldTimer"));
  if (v5)
  {
    [v5 cancel];
    -[SCATInputController setInputHoldTimer:](self, "setInputHoldTimer:", 0LL);
  }

  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputController inputRepeatTimer](self, "inputRepeatTimer"));
  id v4 = v3;
  if (v3)
  {
    [v3 cancel];
    -[SCATInputController setInputRepeatTimer:](self, "setInputRepeatTimer:", 0LL);
  }
}

- (void)_setupInputTimers
{
  id v4 = (AXDispatchTimer *)objc_claimAutoreleasedReturnValue(-[SCATInputController inputHoldTimer](self, "inputHoldTimer"));
  if (!v4)
  {
    id v4 = -[AXDispatchTimer initWithTargetSerialQueue:]( objc_alloc(&OBJC_CLASS___AXDispatchTimer),  "initWithTargetSerialQueue:",  &_dispatch_main_q);
    -[AXDispatchTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:]( v4,  "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:",  1LL);
    -[AXDispatchTimer setLabel:](v4, "setLabel:", @"input hold timer");
    -[SCATInputController setInputHoldTimer:](self, "setInputHoldTimer:", v4);
  }

  unsigned int v3 = (AXDispatchTimer *)objc_claimAutoreleasedReturnValue(-[SCATInputController inputRepeatTimer](self, "inputRepeatTimer"));
  if (!v3)
  {
    unsigned int v3 = -[AXDispatchTimer initWithTargetSerialQueue:]( objc_alloc(&OBJC_CLASS___AXDispatchTimer),  "initWithTargetSerialQueue:",  &_dispatch_main_q);
    -[AXDispatchTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:]( v3,  "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:",  1LL);
    -[AXDispatchTimer setLabel:](v3, "setLabel:", @"input repeat timer");
    -[SCATInputController setInputRepeatTimer:](self, "setInputRepeatTimer:", v3);
  }
}

- (void)dealloc
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", self));
  [v3 unregisterUpdateBlockForRetrieveSelector:"assistiveTouchInputHoldDuration" withListenerID:v4];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", self));
  [v5 unregisterUpdateBlockForRetrieveSelector:"assistiveTouchInputHoldEnabled" withListenerID:v6];

  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", self));
  [v7 unregisterUpdateBlockForRetrieveSelector:"assistiveTouchActionRepeatInterval" withListenerID:v8];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", self));
  [v9 unregisterUpdateBlockForRetrieveSelector:"assistiveTouchActionRepeatEnabled" withListenerID:v10];

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", self));
  [v11 unregisterUpdateBlockForRetrieveSelector:"assistiveTouchInputCoalescingDuration" withListenerID:v12];

  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", self));
  [v13 unregisterUpdateBlockForRetrieveSelector:"assistiveTouchInputCoalescingEnabled" withListenerID:v14];

  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", self));
  [v15 unregisterUpdateBlockForRetrieveSelector:"assistiveTouchSwitches" withListenerID:v16];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10004D3DC;
  v19[3] = &unk_100121D18;
  v19[4] = self;
  AXPerformBlockSynchronouslyOnMainThread(v19);
  -[AXSSInterDeviceCommunicator setActionReceiver:](self->_interDeviceCommunicator, "setActionReceiver:", 0LL);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___SCATInputController;
  -[SCATInputController dealloc](&v18, "dealloc");
}

- (SCATInputController)initWithInterDeviceCommunicator:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SCATInputController;
  unsigned int v6 = -[SCATInputController init](&v9, "init");
  unsigned __int8 v7 = v6;
  if (v6)
  {
    -[SCATInputController _sharedInit](v6, "_sharedInit");
    objc_storeStrong((id *)&v7->_interDeviceCommunicator, a3);
    -[AXSSInterDeviceCommunicator setActionReceiver:](v7->_interDeviceCommunicator, "setActionReceiver:", v7);
  }

  return v7;
}

- (void)_sharedInit
{
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_10004D814;
  v26[3] = &unk_100121D18;
  v26[4] = self;
  AXPerformBlockAsynchronouslyOnMainThread(v26);
  objc_initWeak(&location, self);
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10004D878;
  v23[3] = &unk_100121EE8;
  objc_copyWeak(&v24, &location);
  [v3 registerUpdateBlock:v23 forRetrieveSelector:"assistiveTouchInputHoldDuration" withListener:self];

  objc_destroyWeak(&v24);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10004D928;
  v21[3] = &unk_100121EE8;
  objc_copyWeak(&v22, &location);
  [v4 registerUpdateBlock:v21 forRetrieveSelector:"assistiveTouchInputHoldEnabled" withListener:self];

  objc_destroyWeak(&v22);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10004D9D8;
  v19[3] = &unk_100121EE8;
  objc_copyWeak(&v20, &location);
  [v5 registerUpdateBlock:v19 forRetrieveSelector:"assistiveTouchActionRepeatInterval" withListener:self];

  objc_destroyWeak(&v20);
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10004DA88;
  v17[3] = &unk_100121EE8;
  objc_copyWeak(&v18, &location);
  [v6 registerUpdateBlock:v17 forRetrieveSelector:"assistiveTouchActionRepeatEnabled" withListener:self];

  objc_destroyWeak(&v18);
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10004DB38;
  v15[3] = &unk_100121EE8;
  objc_copyWeak(&v16, &location);
  [v7 registerUpdateBlock:v15 forRetrieveSelector:"assistiveTouchInputCoalescingDuration" withListener:self];

  objc_destroyWeak(&v16);
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10004DBE8;
  v13[3] = &unk_100121EE8;
  objc_copyWeak(&v14, &location);
  [v8 registerUpdateBlock:v13 forRetrieveSelector:"assistiveTouchInputCoalescingEnabled" withListener:self];

  objc_destroyWeak(&v14);
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10004DC98;
  v11[3] = &unk_100121EE8;
  objc_copyWeak(&v12, &location);
  [v9 registerUpdateBlock:v11 forRetrieveSelector:"assistiveTouchSwitches" withListener:self];

  objc_destroyWeak(&v12);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver( DarwinNotifyCenter,  self,  (CFNotificationCallback)sub_10004DD48,  kAXSContinuityDisplayStateChangedNotification,  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
  objc_destroyWeak(&location);
}

- (id)_allSwitchesInUse
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 assistiveTouchSwitches]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputController recipe](self, "recipe"));

  if (v5)
  {
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputController recipe](self, "recipe"));
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v6 mappings]);
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableSet setWithCapacity:]( NSMutableSet,  "setWithCapacity:",  [v7 count]));

    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputController recipe](self, "recipe"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 mappings]);

    id v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v24;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
          id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 switchUUID]);

          if (v16)
          {
            unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([v15 switchUUID]);
            [v8 addObject:v17];
          }
        }

        id v12 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }

      while (v12);
    }

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_10004DFB0;
    v21[3] = &unk_100123660;
    id v22 = v8;
    id v18 = v8;
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v4 objectsPassingTest:v21]);
  }

  else
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v4 objectsPassingTest:&stru_1001236A0]);
  }

  return v19;
}

- (int64_t)role
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputController interDeviceCommunicator](self, "interDeviceCommunicator"));
  unsigned __int8 v4 = [v3 isReceivingSwitchEvents];

  if ((v4 & 1) != 0) {
    return 2LL;
  }
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputController interDeviceCommunicator](self, "interDeviceCommunicator"));
  unsigned int v7 = [v6 isForwardingSwitchEvents];

  return v7;
}

- (void)setRecipe:(id)a3
{
  id v5 = (AXSwitchRecipe *)a3;
  if (self->_recipe != v5)
  {
    unsigned int v7 = v5;
    objc_storeStrong((id *)&self->_recipe, a3);
    unsigned int v6 = -[SCATInputController hasInitializedInputSources](self, "hasInitializedInputSources");
    id v5 = v7;
    if (v6)
    {
      -[SCATInputController _updateInputSources](self, "_updateInputSources");
      id v5 = v7;
    }
  }
}

- (BOOL)isSwitchWithSource:(id)a3
{
  return -[SCATInputController _isSwitchWithSource:isEnabled:](self, "_isSwitchWithSource:isEnabled:", a3, 0LL);
}

- (BOOL)isEnabledSwitchWithSource:(id)a3
{
  return -[SCATInputController _isSwitchWithSource:isEnabled:]( self,  "_isSwitchWithSource:isEnabled:",  a3,  &__kCFBooleanTrue);
}

- (BOOL)_isSwitchWithSource:(id)a3 isEnabled:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputController _allSwitchesInUse](self, "_allSwitchesInUse"));
  uint64_t v16 = 0LL;
  unsigned int v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  char v19 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10004E1EC;
  v12[3] = &unk_1001236C8;
  id v9 = v6;
  id v13 = v9;
  id v10 = v7;
  id v14 = v10;
  id v15 = &v16;
  [v8 enumerateObjectsUsingBlock:v12];
  LOBYTE(v7) = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)v7;
}

- (void)updateWhetherSwitchConfigurationHasScreenSwitch
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[AXBackBoardServer server](&OBJC_CLASS___AXBackBoardServer, "server"));
  objc_msgSend( v3,  "setSwitchControlHasScreenSwitch:",  -[SCATInputController _switchConfigurationHasScreenSwitch](self, "_switchConfigurationHasScreenSwitch"));
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  id v6 = a4;
  -[SCATInputController setDelegate:](self, "setDelegate:", a3);
  -[SCATInputController setQueue:](self, "setQueue:", v6);
}

- (AXUIClient)userInterfaceClient
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputController delegate](self, "delegate"));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 userInterfaceClientForInputController:self]);

  return (AXUIClient *)v4;
}

- (void)_hideAlerts
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[SCATInputController userInterfaceClient](self, "userInterfaceClient"));
  [v2 sendAsynchronousMessage:0 withIdentifier:9 targetAccessQueue:0 completion:0];
}

- (void)_hideAlertForSource:(unint64_t)a3
{
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SCATInputController userInterfaceClient](self, "userInterfaceClient"));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v4,  @"input source",  0LL));

  [v6 sendAsynchronousMessage:v5 withIdentifier:3 targetAccessQueue:0 completion:0];
}

- (void)_hideStateForSource:(unint64_t)a3
{
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SCATInputController userInterfaceClient](self, "userInterfaceClient"));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v4,  @"input source",  0LL));

  [v6 sendAsynchronousMessage:v5 withIdentifier:5 targetAccessQueue:0 completion:0];
}

- (void)_showAlert:(id)a3 forSource:(unint64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned int v8 = [v7 switchControlIgnoreInvalidSwitchConfiguration];

  if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 2 && v8)
  {
    uint64_t v9 = SWCHLogCommon();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
      *(_DWORD *)buf = 138412546;
      id v15 = v11;
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Not showing alert because switchControlIgnoreInvalidSwitchConfiguration is enabled. Input Source: %@. Alert: %@",  buf,  0x16u);
    }
  }

  else
  {
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SCATInputController userInterfaceClient](self, "userInterfaceClient"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v12,  @"input source",  v6,  @"input alert",  0LL));

    -[os_log_s sendAsynchronousMessage:withIdentifier:targetAccessQueue:completion:]( v10,  "sendAsynchronousMessage:withIdentifier:targetAccessQueue:completion:",  v13,  4LL,  0LL,  0LL);
  }
}

- (void)_showState:(id)a3 forSource:(unint64_t)a4
{
  id v6 = a3;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[SCATInputController userInterfaceClient](self, "userInterfaceClient"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v7,  @"input source",  v6,  @"input state",  0LL));

  [v9 sendAsynchronousMessage:v8 withIdentifier:6 targetAccessQueue:0 completion:0];
}

- (void)didReceiveSwitchEvent:(id)a3 forDeviceWithName:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[SCATInputController interDeviceInputSource](self, "interDeviceInputSource"));
  [v8 handleReceivedSwitchEvent:v7 deviceName:v6];
}

- (void)performSysdiagnose
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[SCATInputController delegate](self, "delegate"));
  [v3 performSysdiagnoseForInputController:self];
}

- (AXSwitchRecipe)recipe
{
  return self->_recipe;
}

- (SCATKeyboardInputSource)keyboardInputSource
{
  return self->_keyboardInputSource;
}

- (void)setKeyboardInputSource:(id)a3
{
}

- (BOOL)isValid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (SCATInputControllerDelegate)delegate
{
  return (SCATInputControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (AXAccessQueue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (SCATMFIInputSource)mfiInputSource
{
  return self->_mfiInputSource;
}

- (void)setMfiInputSource:(id)a3
{
}

- (SCATScreenInputSource)screenInputSource
{
  return self->_screenInputSource;
}

- (void)setScreenInputSource:(id)a3
{
}

- (SCATATVRemoteInputSource)atvRemoteInputSource
{
  return self->_atvRemoteInputSource;
}

- (void)setAtvRemoteInputSource:(id)a3
{
}

- (SCATMIDIInputSource)midiInputSource
{
  return self->_midiInputSource;
}

- (void)setMidiInputSource:(id)a3
{
}

- (SCATGamepadInputSource)gamepadInputSource
{
  return self->_gamepadInputSource;
}

- (void)setGamepadInputSource:(id)a3
{
}

- (SCATRemoteControlInputSource)remoteControlInputSource
{
  return self->_remoteControlInputSource;
}

- (void)setRemoteControlInputSource:(id)a3
{
}

- (AXSSInterDeviceCommunicator)interDeviceCommunicator
{
  return self->_interDeviceCommunicator;
}

- (SCATInterDeviceInputSource)interDeviceInputSource
{
  return self->_interDeviceInputSource;
}

- (void)setInterDeviceInputSource:(id)a3
{
}

- (SCATAccessibilityEventInputSource)accessibilityEventInputSource
{
  return self->_accessibilityEventInputSource;
}

- (void)setAccessibilityEventInputSource:(id)a3
{
}

- (double)timeIntervalBeforeSendAction
{
  return self->_timeIntervalBeforeSendAction;
}

- (void)setTimeIntervalBeforeSendAction:(double)a3
{
  self->_timeIntervalBeforeSendAction = a3;
}

- (double)timeIntervalBeforeSendLongPressAction
{
  return self->_timeIntervalBeforeSendLongPressAction;
}

- (void)setTimeIntervalBeforeSendLongPressAction:(double)a3
{
  self->_timeIntervalBeforeSendLongPressAction = a3;
}

- (double)timeIntervalBeforeSendRepeatAction
{
  return self->_timeIntervalBeforeSendRepeatAction;
}

- (void)setTimeIntervalBeforeSendRepeatAction:(double)a3
{
  self->_timeIntervalBeforeSendRepeatAction = a3;
}

- (double)timeIntervalBetweenDidSendActions
{
  return self->_timeIntervalBetweenDidSendActions;
}

- (void)setTimeIntervalBetweenDidSendActions:(double)a3
{
  self->_timeIntervalBetweenDidSendActions = a3;
}

- (double)timeIntervalSinceDidSendAction
{
  return self->_timeIntervalSinceDidSendAction;
}

- (void)setTimeIntervalSinceDidSendAction:(double)a3
{
  self->_timeIntervalSinceDidSendAction = a3;
}

- (BOOL)isInputHoldEnabled
{
  return self->_isInputHoldEnabled;
}

- (void)setIsInputHoldEnabled:(BOOL)a3
{
  self->_isInputHoldEnabled = a3;
}

- (BOOL)isInputRepeatEnabled
{
  return self->_isInputRepeatEnabled;
}

- (void)setIsInputRepeatEnabled:(BOOL)a3
{
  self->_isInputRepeatEnabled = a3;
}

- (BOOL)isInputCoalesceEnabled
{
  return self->_isInputCoalesceEnabled;
}

- (void)setIsInputCoalesceEnabled:(BOOL)a3
{
  self->_isInputCoalesceEnabled = a3;
}

- (AXDispatchTimer)inputHoldTimer
{
  return self->_inputHoldTimer;
}

- (void)setInputHoldTimer:(id)a3
{
}

- (AXDispatchTimer)inputRepeatTimer
{
  return self->_inputRepeatTimer;
}

- (void)setInputRepeatTimer:(id)a3
{
}

- (AXDispatchTimer)inputLongPressTimer
{
  return self->_inputLongPressTimer;
}

- (void)setInputLongPressTimer:(id)a3
{
}

- (BOOL)hasInitializedInputSources
{
  return self->_hasInitializedInputSources;
}

- (void)setHasInitializedInputSources:(BOOL)a3
{
  self->_hasInitializedInputSources = a3;
}

- (NSMutableSet)availableDevices
{
  return self->_availableDevices;
}

- (void)setAvailableDevices:(id)a3
{
}

- (void).cxx_destruct
{
}

@end