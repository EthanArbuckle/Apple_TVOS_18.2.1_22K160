@interface AXAggregateStatistics
+ (void)runStatistics;
- (AXAggregateStatistics)init;
- (OS_dispatch_queue)queue;
- (void)_logAdaptiveVoiceShortcutsStatistics;
- (void)_logCameraButtonStatistics;
- (void)_logCommonStatistics;
- (void)_logMagnifierStatistics;
- (void)_logSideButtonClickSpeed;
- (void)_logStatistics;
- (void)_logTextSizes;
- (void)_startLogging;
- (void)setQueue:(id)a3;
@end

@implementation AXAggregateStatistics

+ (void)runStatistics
{
  if (qword_10A68 != -1) {
    dispatch_once(&qword_10A68, &stru_C320);
  }
}

- (AXAggregateStatistics)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___AXAggregateStatistics;
  v2 = -[AXAggregateStatistics init](&v12, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_BACKGROUND, 0);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("ax-aggd-stats", v4);
    -[AXAggregateStatistics setQueue:](v2, "setQueue:", v5);

    v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[AXAggregateStatistics queue](v2, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_4E7C;
    block[3] = &unk_C348;
    v7 = v2;
    v11 = v7;
    dispatch_async(v6, block);

    v8 = v7;
  }

  return v2;
}

- (void)_startLogging
{
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemAXAggregateLogging sharedInstance]( &OBJC_CLASS___AXSubsystemAXAggregateLogging,  "sharedInstance"));
  unsigned __int8 v4 = [v3 ignoreLogging];

  if ((v4 & 1) == 0)
  {
    dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemAXAggregateLogging identifier]( &OBJC_CLASS___AXSubsystemAXAggregateLogging,  "identifier"));
    uint64_t v6 = AXLoggerForFacility();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);

    os_log_type_t v8 = AXOSLogLevelFromAXLogLevel(2LL);
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = AXColorizeFormatLog(2LL, @"Accessibility statistics running");
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      uint64_t v11 = _AXStringForArgs();
      objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v7, v8))
      {
        int v13 = 138543362;
        v14 = v12;
        _os_log_impl(&dword_0, v7, v8, "%{public}@", (uint8_t *)&v13, 0xCu);
      }
    }
  }

  -[AXAggregateStatistics _logStatistics](self, "_logStatistics");
}

- (void)_logMagnifierStatistics
{
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472LL;
  v45[2] = sub_53E8;
  v45[3] = &unk_C370;
  v2 =  -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.Accessibility.Magnifier");
  v46 = v2;
  AnalyticsSendEventLazy(@"com.apple.accessibility.magnifier.peopledetection.usage", v45);
  -[NSUserDefaults setBool:forKey:](v2, "setBool:forKey:", 0LL, @"peopleDetectionEnabledForAnalytics");
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472LL;
  v43[2] = sub_5498;
  v43[3] = &unk_C370;
  dispatch_queue_attr_t v3 = v2;
  v44 = v3;
  AnalyticsSendEventLazy(@"com.apple.accessibility.magnifier.doordetection.usage", v43);
  -[NSUserDefaults setBool:forKey:](v3, "setBool:forKey:", 0LL, @"doorDetectionEnabledForAnalytics");
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472LL;
  v41[2] = sub_5548;
  v41[3] = &unk_C370;
  unsigned __int8 v4 = v3;
  v42 = v4;
  AnalyticsSendEventLazy(@"com.apple.accessibility.magnifier.doordecorations.usage", v41);
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_55F8;
  v39[3] = &unk_C370;
  dispatch_queue_t v5 = v4;
  v40 = v5;
  AnalyticsSendEventLazy(@"com.apple.accessibility.magnifier.doorattributes.usage", v39);
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_56A8;
  v37[3] = &unk_C370;
  uint64_t v6 = v5;
  v38 = v6;
  AnalyticsSendEventLazy(@"com.apple.accessibility.magnifier.doorattributes.values", v37);
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_5A40;
  v35[3] = &unk_C370;
  v7 = v6;
  v36 = v7;
  AnalyticsSendEventLazy(@"com.apple.accessibility.magnifier.pointspeak.usage", v35);
  -[NSUserDefaults setBool:forKey:](v7, "setBool:forKey:", 0LL, @"pointSpeakEnabledForAnalytics");
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_5AF0;
  v33[3] = &unk_C370;
  os_log_type_t v8 = v7;
  v34 = v8;
  AnalyticsSendEventLazy(@"com.apple.accessibility.magnifier.pointspeak.fingerlocation", v33);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_5BEC;
  v31[3] = &unk_C370;
  uint64_t v9 = v8;
  id v32 = v9;
  AnalyticsSendEventLazy(@"com.apple.accessibility.magnifier.textdetection.usage", v31);
  [v9 setBool:0 forKey:@"textDetectionEnabledForAnalytics"];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_5C9C;
  v29[3] = &unk_C370;
  id v10 = v9;
  id v30 = v10;
  AnalyticsSendEventLazy(@"com.apple.accessibility.magnifier.objectunderstanding.usage", v29);
  [v10 setBool:0 forKey:@"objectUnderstandingEnabledForAnalytics"];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_5D4C;
  v27[3] = &unk_C370;
  id v11 = v10;
  id v28 = v11;
  AnalyticsSendEventLazy(@"com.apple.accessibility.magnifier.detectlanguages", v27);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_5DF4;
  v25[3] = &unk_C370;
  id v12 = v11;
  id v26 = v12;
  AnalyticsSendEventLazy(@"com.apple.accessibility.magnifier.save.activity", v25);
  [v12 setBool:0 forKey:@"savedActivityForAnalytics"];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_5EA4;
  v23[3] = &unk_C370;
  id v13 = v12;
  id v24 = v13;
  AnalyticsSendEventLazy(@"com.apple.accessibility.magnifier.switch.activity", v23);
  [v13 setBool:0 forKey:@"switchedActivityForAnalytics"];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_5F54;
  v21[3] = &unk_C370;
  id v14 = v13;
  id v22 = v14;
  AnalyticsSendEventLazy(@"accessibility.magnifier.freezeframereadermode.usage", v21);
  [v14 setBool:0 forKey:@"readerModeEnabledForAnalytics"];
  v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472LL;
  v18 = sub_6004;
  v19 = &unk_C370;
  id v20 = v14;
  id v15 = v14;
  AnalyticsSendEventLazy(@"com.apple.accessibility.magnifier.freezeframereadermodespeech.usage", &v16);
  objc_msgSend(v15, "setBool:forKey:", 0, @"readerModeSpeechEnabledForAnalytics", v16, v17, v18, v19);
}

- (void)_logAdaptiveVoiceShortcutsStatistics
{
}

- (void)_logCameraButtonStatistics
{
  v2 = objc_alloc(&OBJC_CLASS___NSUserDefaults);
  dispatch_queue_attr_t v3 = -[NSUserDefaults initWithSuiteName:](v2, "initWithSuiteName:", AX_CameraBundleName);
  AnalyticsSendEventLazy(@"com.apple.accessibility.camera.control.enabled", &stru_C3F0);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_64E8;
  v14[3] = &unk_C370;
  unsigned __int8 v4 = v3;
  id v15 = v4;
  AnalyticsSendEventLazy(@"com.apple.accessibility.camera.control.lightPress.enabled", v14);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_65C8;
  v12[3] = &unk_C370;
  dispatch_queue_t v5 = v4;
  id v13 = v5;
  AnalyticsSendEventLazy(@"com.apple.accessibility.camera.control.swipe.enabled", v12);
  AnalyticsSendEventLazy(@"com.apple.accessibility.camera.control.lightPress.force", &stru_C410);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_6768;
  v10[3] = &unk_C370;
  uint64_t v6 = v5;
  id v11 = v6;
  AnalyticsSendEventLazy(@"com.apple.accessibility.camera.control.double.lightPress.speed", v10);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_6830;
  v8[3] = &unk_C370;
  uint64_t v9 = v6;
  v7 = v6;
  AnalyticsSendEventLazy(@"com.apple.accessibility.camera.control.double.click.speed", v8);
}

- (void)_logCommonStatistics
{
  uint64_t v2 = AnalyticsSendEventLazy(@"com.apple.accessibility.voiceover.enabled", &stru_C430);
  if (_AXSVoiceOverTouchEnabled(v2))
  {
    AnalyticsSendEventLazy(@"com.apple.accessibility.voiceover.hints.enabled", &stru_C450);
    AnalyticsSendEventLazy(@"com.apple.accessibility.voiceover.speakingrate", &stru_C470);
    AnalyticsSendEventLazy(@"com.apple.accessibility.voiceover.pitchchange.enabled", &stru_C490);
    AnalyticsSendEventLazy(@"com.apple.accessibility.vot.caption.enabled", &stru_C4B0);
    AnalyticsSendEventLazy(@"com.apple.accessibility.voiceover.audio.ducking", &stru_C4D0);
    dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    id v4 = [v3 imageCaptionGenderStrategy];

    else {
      dispatch_queue_t v5 = *(&off_C8D8 + (void)v4);
    }
    v75[0] = _NSConcreteStackBlock;
    v75[1] = 3221225472LL;
    v75[2] = sub_779C;
    v75[3] = &unk_C370;
    v76 = (__CFString *)v5;
    AnalyticsSendEventLazy(@"com.apple.accessibility.vot.caption.gender", v75);
  }

  __int128 v73 = 0u;
  __int128 v74 = 0u;
  __int128 v71 = 0u;
  __int128 v72 = 0u;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance", self));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 voiceOverBrailleDisplays]);

  id v8 = [v7 countByEnumeratingWithState:&v71 objects:v85 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v72;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v72 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v71 + 1) + 8LL * (void)i);
        uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSDictionary);
        if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
        {
          uint64_t v78 = 0LL;
          v79 = &v78;
          uint64_t v80 = 0x2020000000LL;
          id v13 = (id *)qword_10A80;
          uint64_t v81 = qword_10A80;
          if (!qword_10A80)
          {
            v77[0] = _NSConcreteStackBlock;
            v77[1] = 3221225472LL;
            v77[2] = sub_9064;
            v77[3] = &unk_C8A0;
            v77[4] = &v78;
            sub_9064((uint64_t)v77);
            id v13 = (id *)v79[3];
          }

          _Block_object_dispose(&v78, 8);
          if (!v13) {
            sub_9154();
          }
          id v14 = *v13;
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:v14]);

          uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSString);
          if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
          {
            v83 = @"displayidentifier";
            v84 = v15;
            uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v84,  &v83,  1LL));
            AnalyticsSendEvent(@"com.apple.accessibility.braille.display", v17);
          }
        }
      }

      id v8 = [v7 countByEnumeratingWithState:&v71 objects:v85 count:16];
    }

    while (v8);
  }

  if (_AXSGreenRedFilterEnabled())
  {
    v18 = @"green-red";
  }

  else if (_AXSRedGreenFilterEnabled())
  {
    v18 = @"red-green";
  }

  else if (_AXSGrayscaleEnabled())
  {
    v18 = @"grayscale";
  }

  else if (_AXSBlueYellowFilterEnabled())
  {
    v18 = @"blue-yellow";
  }

  else
  {
    v18 = @"color-tint";
  }

  v69[0] = _NSConcreteStackBlock;
  v69[1] = 3221225472LL;
  v69[2] = sub_780C;
  v69[3] = &unk_C370;
  v70 = (__CFString *)v18;
  AnalyticsSendEventLazy(@"com.apple.accessibility.colorfilter.usage", v69);

LABEL_32:
  AnalyticsSendEventLazy(@"com.apple.accessibility.dim.flashing.lights.enabled", &stru_C4F0);
  uint64_t v19 = AnalyticsSendEventLazy(@"com.apple.accessibility.hovertext.enabled", &stru_C510);
  if (_AXSHoverTextEnabled(v19))
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    id v21 = [v20 hoverTextDisplayMode];

    else {
      id v22 = *(&off_C8F0 + (void)v21);
    }
    v67[0] = _NSConcreteStackBlock;
    v67[1] = 3221225472LL;
    v67[2] = sub_79C4;
    v67[3] = &unk_C370;
    v68 = (__CFString *)v22;
    AnalyticsSendEventLazy(@"com.apple.accessibility.hovertext.display.mode", v67);
  }

  AnalyticsSendEventLazy(@"com.apple.accessibility.hovertyping.enabled", &stru_C530);
  LOBYTE(v77[0]) = 0;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v24 = [v23 speechVoiceIdentifierForLanguage:0 sourceKey:AXSpeechSourceKeyVoiceOver exists:v77];

  v65[0] = _NSConcreteStackBlock;
  v65[1] = 3221225472LL;
  v65[2] = sub_7AD8;
  v65[3] = &unk_C550;
  char v66 = v77[0];
  AnalyticsSendEventLazy(@"com.apple.accessibility.voiceover.selectedvoice", v65);
  AnalyticsSendEventLazy(@"com.apple.accessibility.monoaudio.enabled", &stru_C570);
  AnalyticsSendEventLazy(@"com.apple.accessibility.zoom.enabled", &stru_C590);
  AnalyticsSendEventLazy(@"com.apple.accessibility.whiteonblack.enabled", &stru_C5B0);
  AnalyticsSendEventLazy(@"com.apple.accessibility.closed-captioning.enabled", &stru_C5D0);
  AnalyticsSendEventLazy(@"com.apple.accessibility.bolder.text", &stru_C5F0);
  AnalyticsSendEventLazy(@"com.apple.accessibility.increase.contrast", &stru_C610);
  AnalyticsSendEventLazy(@"com.apple.accessibility.differentiate.without.color", &stru_C630);
  AnalyticsSendEventLazy(@"com.apple.accessibility.reduce.motion", &stru_C650);
  AnalyticsSendEventLazy(@"com.apple.accessibility.button.shapes", &stru_C670);
  [obja _logTextSizes];
  uint64_t v25 = AnalyticsSendEventLazy(@"com.apple.accessibility.assistivetouch-switch.enabled", &stru_C690);
  if (_AXSAssistiveTouchScannerEnabled(v25))
  {
    AnalyticsSendEventLazy(@"com.apple.accessibility.switch.control.recipe.count", &stru_C6B0);
    AnalyticsSendEventLazy(@"com.apple.accessibility.switch.control.scanning.style", &stru_C6D0);
    AnalyticsSendEventLazy(@"com.apple.accessibility.switch.control.tap.behavior", &stru_C6F0);
    AnalyticsSendEventLazy(@"com.apple.accessibility.switch.control.speech.enabled", &stru_C710);
    AnalyticsSendEventLazy(@"com.apple.accessibility.switch.control.sound.enabled", &stru_C730);
    AnalyticsSendEventLazy(@"com.apple.accessibility.switch.control.group.items.enabled", &stru_C750);
    AnalyticsSendEventLazy(@"com.apple.accessibility.switch.control.large.cursor.enabled", &stru_C770);
    id v26 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    v27 = (void *)objc_claimAutoreleasedReturnValue([v26 assistiveTouchSwitches]);

    v63[0] = _NSConcreteStackBlock;
    v63[1] = 3221225472LL;
    v63[2] = sub_87A0;
    v63[3] = &unk_C370;
    id v28 = v27;
    id v64 = v28;
    AnalyticsSendEventLazy(@"com.apple.accessibility.switch.control.switch.count", v63);
    __int128 v61 = 0u;
    __int128 v62 = 0u;
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    id objb = v28;
    char v29 = 0;
    char v30 = 0;
    id v31 = [objb countByEnumeratingWithState:&v59 objects:v82 count:16];
    if (v31)
    {
      uint64_t v32 = *(void *)v60;
      uint64_t v33 = SCATSwitchSourceMFI;
      uint64_t v34 = SCATSwitchSourceCamera;
      do
      {
        for (j = 0LL; j != v31; j = (char *)j + 1)
        {
          if (*(void *)v60 != v32) {
            objc_enumerationMutation(objb);
          }
          v36 = *(void **)(*((void *)&v59 + 1) + 8LL * (void)j);
          v37 = (void *)objc_claimAutoreleasedReturnValue([v36 source]);
          unsigned __int8 v38 = [v37 isEqualToString:v33];

          if ((v38 & 1) != 0)
          {
            char v29 = 1;
          }

          else
          {
            v39 = (void *)objc_claimAutoreleasedReturnValue([v36 source]);
            unsigned __int8 v40 = [v39 isEqualToString:v34];

            v30 |= v40;
          }
        }

        id v31 = [objb countByEnumeratingWithState:&v59 objects:v82 count:16];
      }

      while (v31);
    }

    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472LL;
    v57[2] = sub_8848;
    v57[3] = &unk_C550;
    char v58 = v30 & 1;
    AnalyticsSendEventLazy(@"com.apple.accessibility.switch.control.camera.switch.enabled", v57);
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472LL;
    v55[2] = sub_88E8;
    v55[3] = &unk_C550;
    char v56 = v29 & 1;
    AnalyticsSendEventLazy(@"com.apple.accessibility.switch.control.mfi.switch.enabled", v55);
    AnalyticsSendEventLazy(@"com.apple.accessibility.switch.control.multi.device.usage.count", &stru_C790);
  }

  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472LL;
  v53[2] = sub_8A4C;
  v53[3] = &unk_C370;
  id v41 = (id)_AXSTripleClickCopyOptions();
  id v54 = v41;
  AnalyticsSendEventLazy(@"com.apple.accessibility.triple-click-home.enabled", v53);
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  int IsD22 = AXDeviceIsD22();

  if (IsD22)
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    unsigned __int8 v45 = [v44 didTriggerSOSToday];

    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472LL;
    v50[2] = sub_8AF8;
    v50[3] = &unk_C7B8;
    unsigned __int8 v52 = v45;
    id v51 = v41;
    AnalyticsSendEventLazy(@"com.apple.accessibility.accessibility.and.sos.d22", v50);
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    [v46 setDidTriggerSOSToday:0];

    v42 = v51;
LABEL_52:
  }
}

- (void)_logTextSizes
{
  if (qword_10A78 != -1) {
    dispatch_once(&qword_10A78, &stru_C838);
  }
  uint64_t v2 = (const __CFString *)[(id)AXCPSharedResourcesDirectory(self) stringByAppendingPathComponent:@"/Library/Preferences/com.apple.UIKit"];
  dispatch_queue_attr_t v3 = (__CFString *)CFPreferencesCopyAppValue(@"UIPreferredContentSizeCategoryName", v2);
  if (v3) {
    id v4 = v3;
  }
  else {
    id v4 = @"UICTContentSizeCategoryL";
  }
  id v5 = [(id)qword_10A70 indexOfObject:v4];
  if ((-[__CFString isEqualToString:]( v3,  "isEqualToString:",  @"UICTContentSizeCategoryAccessibilityM") & 1) != 0 || (-[__CFString isEqualToString:]( v3,  "isEqualToString:",  @"UICTContentSizeCategoryAccessibilityL") & 1) != 0 || (-[__CFString isEqualToString:]( v3,  "isEqualToString:",  @"UICTContentSizeCategoryAccessibilityXL") & 1) != 0 || (-[__CFString isEqualToString:]( v3,  "isEqualToString:",  @"UICTContentSizeCategoryAccessibilityXXL") & 1) != 0)
  {
    unsigned __int8 v6 = 1;
  }

  else
  {
    unsigned __int8 v6 = -[__CFString isEqualToString:]( v3,  "isEqualToString:",  @"UICTContentSizeCategoryAccessibilityXXXL");
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_8DD8;
  v8[3] = &unk_C550;
  unsigned __int8 v9 = v6;
  AnalyticsSendEventLazy(@"com.apple.accessibility.textsize.accessibility.sizes.enabled", v8);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_8E78;
  v7[3] = &unk_C858;
  v7[4] = v5;
  AnalyticsSendEventLazy(@"com.apple.accessibility.textsize.size", v7);
}

- (void)_logSideButtonClickSpeed
{
}

- (void)_logStatistics
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end