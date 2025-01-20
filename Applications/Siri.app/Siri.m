LABEL_22:
          [a1 _logDummyAssistantUtteranceViewWithDialogIdentifier:v10];
          v17 = (void *)objc_claimAutoreleasedReturnValue( +[SRUIFInstrumentationManager sharedManager]( &OBJC_CLASS___SRUIFInstrumentationManager,  "sharedManager"));
          [v17 storeClientGeneratedDUC:v10];
        }

        else
        {
LABEL_18:
          v16 = (os_log_s *)AFSiriLogContextConnection;
          if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
            sub_100069C8C((uint64_t)v6, v16);
          }
          v11 = 0LL;
        }

        v12 = (void *)objc_claimAutoreleasedReturnValue([a1 _localizedErrorString:v11]);
        break;
    }
  }

  else
  {
    v12 = 0LL;
  }

  return v12;
}

double sub_100005A54(double a1)
{
  double Current = CFAbsoluteTimeGetCurrent();
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
  [v3 systemUptime];
  double v5 = a1 - (Current - v4);

  return v5;
}

void sub_100006600(id a1, BGTask *a2)
{
}

void sub_1000068FC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
}

void sub_100006924(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setTaskCompletedWithSuccess:0];
  v2 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315394;
    double v5 = "+[SRAssetsUtilities _runAssetCheckWithTask:]_block_invoke";
    __int16 v6 = 2048;
    uint64_t v7 = 0x409C200000000000LL;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_INFO,  "%s Download timer expired. Schedule asset check after %lf seconds",  (uint8_t *)&v4,  0x16u);
  }

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 1800.0));
  +[SRAssetsUtilities _scheduleAssetCheckWithEarliestBeginDate:]( &OBJC_CLASS___SRAssetsUtilities,  "_scheduleAssetCheckWithEarliestBeginDate:",  v3);
}

void sub_100006A30(uint64_t a1, uint64_t a2)
{
  if (a2 == 4)
  {
    +[SRNotificationUtility postStorageLowNotification]( &OBJC_CLASS___SRNotificationUtility,  "postStorageLowNotification");
    double v5 = objc_alloc_init(&OBJC_CLASS___SRPreferences);
    -[SRPreferences setHasPresentedSiriAssetsNotification:](v5, "setHasPresentedSiriAssetsNotification:", 1LL);
    [*(id *)(a1 + 32) setTaskCompletedWithSuccess:1];
  }

  else if (a2 == 3)
  {
    [*(id *)(a1 + 32) setTaskCompletedWithSuccess:1];
  }

  else
  {
    v3 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v7 = "+[SRAssetsUtilities _runAssetCheckWithTask:]_block_invoke";
      __int16 v8 = 2048;
      uint64_t v9 = 0x409C200000000000LL;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%s Download not finished. Schedule asset check after %lf seconds",  buf,  0x16u);
    }

    [*(id *)(a1 + 32) setTaskCompletedWithSuccess:0];
    int v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  1800.0));
    +[SRAssetsUtilities _scheduleAssetCheckWithEarliestBeginDate:]( &OBJC_CLASS___SRAssetsUtilities,  "_scheduleAssetCheckWithEarliestBeginDate:",  v4);
  }
}

void sub_100006C90(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_100006F9C(_Unwind_Exception *a1)
{
}

void sub_100006FC0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [*(id *)(a1 + 32) operation];
    id WeakRetained = v3;
  }
}

void sub_100007000(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    int v4 = WeakRetained;
    id v2 = objc_loadWeakRetained(WeakRetained + 2);
    id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 transitionController]);
    [v3 setOperation:0];

    id WeakRetained = v4;
  }
}

LABEL_9:
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideViewController _guideSnippet](self, "_guideSnippet"));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 appPunchOutButton]);

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideViewController _bigButtonViewController](self, "_bigButtonViewController"));
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 view]);
    objc_msgSend(v17, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
    __int16 v8 = v8 + v18 + 8.0;
  }

  return v8;
}
}

  return v4;
}

void sub_100008160(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _iconImageForGuideDomainSnippet:*(void *)(a1 + 40)]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100008244;
  v6[3] = &unk_1000B9FD8;
  int v4 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v2;
  id v8 = v4;
  id v9 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  id v5 = v2;
  [v3 addOperationWithBlock:v6];
}

void sub_100008244(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 8LL);
  int v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) aceId]);
  [v3 setObject:v2 forKey:v4];

  id v5 = *(void **)(a1 + 56);
  __int16 v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 64) aceId]);
  LODWORD(v5) = [v5 isEqualToString:v6];

  if ((_DWORD)v5) {
    [*(id *)(a1 + 64) setIconImage:*(void *)(a1 + 40)];
  }
  id v7 = *(void **)(*(void *)(a1 + 32) + 56LL);
  id v8 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) aceId]);
  [v7 removeObject:v8];
}

LABEL_16:
  if (!v9) {
    id v9 = (id)objc_claimAutoreleasedReturnValue(-[SRGuideViewController _fallbackImage](self, "_fallbackImage"));
  }

  return v9;
}

    v17 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[SRSiriViewController siriSessionDidReceiveOpenLinkCommand:completion:]";
      v23 = 2112;
      v24 = v8;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s Opening URL:%@", buf, 0x16u);
    }

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_1000201B8;
    v18[3] = &unk_1000BA708;
    v20 = v7;
    v19 = v6;
    -[SRSiriViewController _openURL:bundleId:inPlace:conversationId:completion:]( self,  "_openURL:bundleId:inPlace:conversationId:completion:",  v8,  0LL,  0LL,  0LL,  v18);

    v16 = v20;
    goto LABEL_19;
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[SiriUIFreePresentation delegate](self, "delegate"));
  [v21 enableIdleTimerForSiriPresentation:self];
}

uint64_t sub_100008E94(uint64_t result)
{
  *(_BYTE *)(*(void *)(*(void *)(result + 40) + 8LL) + 24LL) = *(_BYTE *)(*(void *)(result + 32) + 8LL);
  return result;
}

void sub_1000093E8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue([*((id *)WeakRetained + 4) outputDevices]);
    if ([v3 count])
    {
      __int128 v13 = 0u;
      __int128 v14 = 0u;
      __int128 v11 = 0u;
      __int128 v12 = 0u;
      id v4 = v3;
      id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5)
      {
        id v6 = v5;
        uint64_t v7 = *(void *)v12;
        do
        {
          for (i = 0LL; i != v6; i = (char *)i + 1)
          {
            if (*(void *)v12 != v7) {
              objc_enumerationMutation(v4);
            }
            unint64_t v9 = (unint64_t)objc_msgSend( *(id *)(*((void *)&v11 + 1) + 8 * (void)i),  "deviceType",  (void)v11);
            if (v9 <= 4 && ((1LL << v9) & 0x13) != 0) {
              v2[8] = 1;
            }
          }

          id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        }

        while (v6);
      }
    }
  }
}

LABEL_30:
    id v8 = 1;
    goto LABEL_31;
  }

  if ((uint64_t)[v3 navigationStackSize] < 2)
  {
    if ([v3 editableUtteranceViewHasContent])
    {
      id v4 = (os_log_s *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        __int128 v12 = 136315138;
        __int128 v13 = "-[SRCompactViewControllerContentTester hasContentForState:]";
        id v5 = "%s #compact:Returning YES because point is in tap2edit view";
        goto LABEL_29;
      }

      goto LABEL_30;
    }

    if ([v3 compactViewHasContent])
    {
      id v4 = (os_log_s *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        __int128 v12 = 136315138;
        __int128 v13 = "-[SRCompactViewControllerContentTester hasContentForState:]";
        id v5 = "%s #compact:Returning YES because point is in Compact View";
        goto LABEL_29;
      }

      goto LABEL_30;
    }

    if ([v3 siriViewControllerIsEditing])
    {
      id v4 = (os_log_s *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        __int128 v12 = 136315138;
        __int128 v13 = "-[SRCompactViewControllerContentTester hasContentForState:]";
        id v5 = "%s #compact:Returning YES because a siri view controller is editing";
        goto LABEL_29;
      }

      goto LABEL_30;
    }

    unint64_t v9 = [v3 contextMenuIsPresented];
    id v4 = (os_log_s *)AFSiriLogContextConnection;
    id v10 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v10)
      {
        __int128 v12 = 136315138;
        __int128 v13 = "-[SRCompactViewControllerContentTester hasContentForState:]";
        id v5 = "%s #compact:Returning YES because a UIContextMenu is currently present";
        goto LABEL_29;
      }

      goto LABEL_30;
    }

    if (v10)
    {
      __int128 v12 = 136315138;
      __int128 v13 = "-[SRCompactViewControllerContentTester hasContentForState:]";
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s #compact:Returning NO because point is outside Siri content",  (uint8_t *)&v12,  0xCu);
    }

    id v8 = 0;
  }

  else
  {
    if (([v3 deviceIsPad] & 1) == 0
      && [v3 navigationBarHasContent])
    {
      id v4 = (os_log_s *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        __int128 v12 = 136315138;
        __int128 v13 = "-[SRCompactViewControllerContentTester hasContentForState:]";
        id v5 = "%s #compact:Returning YES because point is in the navigation bar for multilevel content in phone";
        goto LABEL_29;
      }

      goto LABEL_30;
    }

    id v6 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = v6;
      __int128 v12 = 136315394;
      __int128 v13 = "-[SRCompactViewControllerContentTester hasContentForState:]";
      __int128 v14 = 1024;
      v15 = [v3 multiLevelViewHasContent];
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s #compact:Returning %d because pointis in multi level card",  (uint8_t *)&v12,  0x12u);
    }

    id v8 = [v3 multiLevelViewHasContent];
  }

  result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

  result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

  v55 = [v29 responseViewId];
  v56 = static String._unconditionallyBridgeFromObjectiveC(_:)(v55);
  v58 = v57;

  v59 = [v31 responseViewId];
  v60 = static String._unconditionallyBridgeFromObjectiveC(_:)(v59);
  v62 = v61;

  if (v56 != v60 || v58 != v62)
  {
    v63 = _stringCompareWithSmolCheck(_:_:expecting:)(v56, v58, v60, v62, 0LL);
    swift_bridgeObjectRelease(v58);
    swift_bridgeObjectRelease(v62);

    return v63 & 1;
  }

  swift_bridgeObjectRelease_n(v58, 2LL);

  return 1LL;
}

LABEL_31:
  return v8;
}

  [v14 setText:v27];
  [v14 setSpeakableText:v37];

  return v14;
}

void sub_10000AE38(_Unwind_Exception *a1)
{
}

void sub_10000AE5C(uint64_t a1, int a2)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && a2)
  {
    id v4 = WeakRetained;
    [WeakRetained[6] becomeFirstResponder];
    id WeakRetained = v4;
  }
}

id sub_10000BB84(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

LABEL_13:
        v16 = (char *)v16 + 1;
      }

      while (v14 != v16);
      __int128 v14 = [v11 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }

    while (v14);
  }

  v27 = [v29 copy];
  [v27 setViews:v10];

  return v27;
}

  v21 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setValue:forKey:](v21, "setValue:forKey:", v10, @"certSerial");
  v22 = [v8 isForEyesFree];
  v23 = @"YES";
  if ((v22 & 1) == 0)
  {
    else {
      v23 = @"NO";
    }
  }

  -[NSMutableDictionary setValue:forKey:](v21, "setValue:forKey:", v23, @"isBluetoothCar", (void)v30);
  else {
    v24 = @"NO";
  }
  -[NSMutableDictionary setValue:forKey:](v21, "setValue:forKey:", v24, @"isCarPlay");
  if ([v8 isForStark])
  {
    v25 = (uint64_t)[v8 requestSource];
    if (v25 > 11)
    {
      switch(v25)
      {
        case 44LL:
          goto LABEL_29;
        case 43LL:
          v26 = @"com.apple.siri.steering.wheel";
          goto LABEL_36;
        case 12LL:
LABEL_29:
          v26 = @"com.apple.siri.hs.on.jarvis";
          goto LABEL_36;
      }
    }

    else
    {
      switch(v25)
      {
        case 2LL:
          v26 = @"com.apple.siri.lock.button";
          goto LABEL_36;
        case 8LL:
          v26 = @"com.apple.siri.hs.on.carplay";
          goto LABEL_36;
        case 10LL:
          v26 = @"com.apple.siri.button.on.carplay";
LABEL_36:
          v28 = (os_log_s *)AFSiriLogContextConnection;
          if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            v35 = "+[SRTipKitSignalEmitter _checkAndEmitCarPlayInvocationSourcePerVehicle:forRequestOptions:accessoryManager:]";
            v36 = 2112;
            v37 = v26;
            v38 = 2112;
            v39 = v21;
            _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "%s #tipKitSignalEmitter activation source: %@ userInfo: %@",  buf,  0x20u);
          }

          v29 = [[BMDiscoverabilitySignalEvent alloc] initWithIdentifier:v26 bundleID:@"com.apple.siri" context:0 userInfo:v21];
          [v7 sendEvent:v29];

          goto LABEL_39;
      }
    }

    v27 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      sub_100069F58(v27);
    }
    v26 = &stru_1000BC638;
    goto LABEL_36;
  }

    result = sub_100058248(a5, a6);
    *a1 = v13;
    return result;
  }

  if ((a6 & 0x1000000000000000LL) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000LL) != 0)
  {
    id v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }

  id v8 = _StringObject.sharedUTF8.getter(a5, a6);
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Unexpectedly found nil while unwrapping an Optional value",  57LL,  2LL,  "Swift/StringTesting.swift",  25LL,  2,  151LL,  0);
    __break(1u);
LABEL_17:
    LOBYTE(v14) = 2;
    result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableRawPointer.initializeMemory overlapping range",  58LL,  2LL,  "Swift/UnsafeRawPointer.swift",  28LL,  v14,  1173LL,  0);
    __break(1u);
    return result;
  }

  __break(1u);
}

void sub_10000D19C(uint64_t a1)
{
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[BMStreams discoverabilitySignal](&OBJC_CLASS___BMStreams, "discoverabilitySignal"));
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v8 source]);
  [*(id *)(a1 + 40) _checkAndEmitHSSignalsWithSource:v2 forRequestOptions:*(void *)(a1 + 32)];
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[EAAccessoryManager sharedAccessoryManager]( &OBJC_CLASS___EAAccessoryManager,  "sharedAccessoryManager"));
  [*(id *)(a1 + 40) _checkAndEmitCarPlayInvocationSourcePerVehicle:v2 forRequestOptions:*(void *)(a1 + 32) accessoryManager:v3];
  uint64_t v6 = a1 + 32;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v6 + 8);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[BluetoothManager sharedInstance](&OBJC_CLASS___BluetoothManager, "sharedInstance"));
  [v5 _checkAndEmitBluetoothInvocationSourcePerVehicle:v2 forRequestOptions:v4 btManager:v7];
}

LABEL_39:
}

LABEL_28:
    v22 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v29 = "+[SRTipKitSignalEmitter _checkAndEmitBluetoothInvocationSourcePerVehicle:forRequestOptions:btManager:]";
      v30 = 2112;
      v31 = v20;
      v32 = 2112;
      v33 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "%s #tipKitSignalEmitter bluetooth car activation source: %@ userInfo: %@",  buf,  0x20u);
    }

    v23 = [[BMDiscoverabilitySignalEvent alloc] initWithIdentifier:v20 bundleID:@"com.apple.siri" context:0 userInfo:v18];
    [v7 sendEvent:v23];
  }
}

  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

void sub_10000D9E8( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

id sub_10000DA1C()
{
  return [v0 requestSource];
}

void sub_10000EF98( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

uint64_t sub_10000EFC0()
{
  id v3 = 0LL;
  if (!qword_1000D9AE8)
  {
    __int128 v4 = off_1000BA0C0;
    uint64_t v5 = 0LL;
    qword_1000D9AE8 = _sl_dlopen(&v4, &v3);
  }

  uint64_t v0 = qword_1000D9AE8;
  v1 = v3;
  if (!qword_1000D9AE8)
  {
    v1 = (char *)abort_report_np("%s", v3);
    goto LABEL_7;
  }

  if (v3) {
LABEL_7:
  }
    free(v1);
  return v0;
}

void sub_10000F214( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

void sub_10000F240(uint64_t a1, void *a2, _BYTE *a3)
{
  id v7 = a2;
  objc_opt_class(&OBJC_CLASS___SREditableTextView, v5);
  if ((objc_opt_isKindOfClass(v7, v6) & 1) != 0 && [v7 isFirstResponder])
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
    *a3 = 1;
  }
}

void sub_10000F3C0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16LL));
  [WeakRetained setAlpha:0.0];

  id v3 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24LL));
  [v3 setAlpha:1.0];
}

uint64_t sub_10000F42C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16LL));
  [WeakRetained removeFromSuperview];

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_10000F594(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16LL));
  [WeakRetained setAlpha:1.0];

  id v3 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24LL));
  [v3 setAlpha:0.0];
}

uint64_t sub_10000F600(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24LL));
  [WeakRetained removeFromSuperview];

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_10000FC28(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
  [v2 siriViewControllerHeightDidChange:*(void *)(a1 + 32)];
}

void sub_100010BB4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100010BCC(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v11 = a2;
  if (([v11 isDescendantOfView:*(void *)(a1 + 32)] & 1) != 0
    || [*(id *)(a1 + 32) isDescendantOfView:v11])
  {
    objc_opt_class(&OBJC_CLASS___SREditableTextView, v7);
    if ((objc_opt_isKindOfClass(v11, v8) & 1) != 0
      || (objc_opt_class(&OBJC_CLASS___SRSpeechAlternativeCellView, v9), (objc_opt_isKindOfClass(v11, v10) & 1) != 0))
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = a3;
    }
  }

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) != 0x7FFFFFFFFFFFFFFFLL) {
    *a4 = 1;
  }
}

void sub_100010DD0(uint64_t a1)
{
  *(_BYTE *)(*(void *)(a1 + 32) + 184LL) = 0;
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
  [v2 siriViewControllerHeightDidChange:*(void *)(a1 + 32)];
}

void sub_100010ECC(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
  [v2 siriViewControllerHeightDidChange:*(void *)(a1 + 32)];

  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _privateDelegate]);
  [v3 siriViewControllerRequestToPin:*(void *)(a1 + 32)];
}

int64_t sub_100012138(id a1, id a2, id a3)
{
  uint64_t v4 = AFUserUtteranceConfidenceIndexKey;
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a2 objectForKey:v4]);
  id v7 = [v6 integerValue];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v4]);
  id v9 = [v8 integerValue];

  else {
    return (uint64_t)v7 > (uint64_t)v9;
  }
}

void sub_1000121C4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](&OBJC_CLASS___NSCharacterSet, "whitespaceCharacterSet"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByTrimmingCharactersInSet:v4]);
  unsigned __int8 v6 = [v5 isEqualToString:*(void *)(a1 + 32)];

  if ((v6 & 1) == 0)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) objectForKey:v3]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:AFUserUtteranceConfidenceAverageKey]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:AFUserUtteranceConfidenceIndexKey]);
    v37 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:AFUserUtteranceSourceKey]);
    id v38 = [v37 integerValue];
    BOOL v10 = v38 == (id)2;
    *(_BYTE *)(*(void *)(a1 + 48) + 120LL) |= v10;
    [*(id *)(*(void *)(a1 + 48) + 40) addObject:v3];
    id v11 = objc_alloc_init(&OBJC_CLASS___SRUIFAlternativeInfo);
    [v11 setOriginalRank:v9];
    [v11 setOriginalScore:v8];
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v10));
    [v11 setIsFromDevice:v12];

    [*(id *)(*(void *)(a1 + 48) + 112) setObject:v11 forKey:v3];
    __int128 v13 = objc_alloc(&OBJC_CLASS___NSMutableAttributedString);
    __int128 v14 = v13;
    if (v9)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](&OBJC_CLASS___NSCharacterSet, "whitespaceCharacterSet"));
      v16 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByTrimmingCharactersInSet:v15]);
      v17 = -[NSMutableAttributedString initWithString:attributes:]( v14,  "initWithString:attributes:",  v16,  *(void *)(a1 + 56));

      v36 = v8;
      if (*(_BYTE *)(a1 + 88))
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) _userUtterance]);
        v19 = (void *)objc_claimAutoreleasedReturnValue([v18 speechTokensForUtteranceAtIndex:0]);

        v20 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(a1 + 64),  "speechTokensForUtteranceAtIndex:",  objc_msgSend(v9, "integerValue")));
        v21 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 64) rangeListOfDifferingTextFromTargetTokenList:v20 comparedToBaseTokenList:v19]);
      }

      else
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(a1 + 64),  "rangeListOfDifferingTextFromUtteranceAtIndex:comparedToBaseUtteranceAtIndex:",  objc_msgSend(v9, "integerValue"),  0));
      }

      __int128 v41 = 0u;
      __int128 v42 = 0u;
      __int128 v39 = 0u;
      __int128 v40 = 0u;
      id v22 = v21;
      id v23 = [v22 countByEnumeratingWithState:&v39 objects:v53 count:16];
      if (v23)
      {
        id v24 = v23;
        uint64_t v25 = *(void *)v40;
        do
        {
          for (i = 0LL; i != v24; i = (char *)i + 1)
          {
            if (*(void *)v40 != v25) {
              objc_enumerationMutation(v22);
            }
            id v27 = [*(id *)(*((void *)&v39 + 1) + 8 * (void)i) rangeValue];
            -[NSMutableAttributedString setAttributes:range:]( v17,  "setAttributes:range:",  *(void *)(a1 + 72),  v27,  v28);
          }

          id v24 = [v22 countByEnumeratingWithState:&v39 objects:v53 count:16];
        }

        while (v24);
      }

      uint64_t v8 = v36;
    }

    else
    {
      v17 = -[NSMutableAttributedString initWithString:attributes:]( v13,  "initWithString:attributes:",  v3,  *(void *)(a1 + 72));
    }

    if (*(_BYTE *)(a1 + 89))
    {
      v29 = @"FIDES ";
      if (v38 != (id)2) {
        v29 = &stru_1000BC638;
      }
      v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @" (%@%@)",  v29,  v8));
    }

    else
    {
      v30 = 0LL;
    }

    v31 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      v32 = @"Server";
      *(_DWORD *)buf = 136316162;
      v44 = "-[SRUserUtteranceViewController _processUserUtterance:isCombined:displayedText:withScore:]_block_invoke_2";
      if (v38 == (id)2) {
        v32 = @"Client";
      }
      __int16 v45 = 2112;
      id v46 = v3;
      __int16 v47 = 2112;
      v48 = v32;
      if (v17) {
        v33 = &stru_1000BC638;
      }
      else {
        v33 = @"(removing dupe)";
      }
      __int16 v49 = 2112;
      v50 = v8;
      __int16 v51 = 2112;
      v52 = v33;
      _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "%s Speech alternative utterance: %@ (%@ %@%@)",  buf,  0x34u);
    }

    v34 = v17;
    if (v30)
    {
      v35 = -[NSAttributedString initWithString:attributes:]( objc_alloc(&OBJC_CLASS___NSAttributedString),  "initWithString:attributes:",  v30,  *(void *)(a1 + 72));
      -[NSMutableAttributedString appendAttributedString:](v34, "appendAttributedString:", v35);
    }

    if (v34) {
      [*(id *)(a1 + 80) addObject:v34];
    }
  }
}

LABEL_10:
  return v9;
}

      v17 = (void *)objc_claimAutoreleasedReturnValue([v6 aceId]);
      v18 = objc_claimAutoreleasedReturnValue( +[SACommandFailed sruif_commandFailedWithRefId:]( &OBJC_CLASS___SACommandFailed,  "sruif_commandFailedWithRefId:",  v17));
      goto LABEL_11;
    }
  }

  else
  {
    v19 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 136315394;
      id v22 = "-[SRSiriViewController siriSessionDidReceiveUpdateVisualResponseSnippetCommand:completion:]";
      id v23 = 2112;
      id v24 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%s presentation does not implement didReceiveUpdateVisualResponseCommand for command:%@",  (uint8_t *)&v21,  0x16u);
    }

    if (v7) {
      goto LABEL_10;
    }
  }

void sub_1000136DC(_Unwind_Exception *a1)
{
}

void sub_100013700(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v2 = [WeakRetained operation];
    if (v2 == (id)2)
    {
      [v4 _performPopAnimations];
    }

    else
    {
      BOOL v3 = v2 == (id)1;
      id WeakRetained = v4;
      if (!v3) {
        goto LABEL_8;
      }
      [v4 _performPushAnimations];
    }

    id WeakRetained = v4;
  }

LABEL_8:
}

    v18 = -[SRUIFAnalyticsSupplement computedModeForAceCommand:]( self->_analyticsSupplement,  "computedModeForAceCommand:",  v16);
    goto LABEL_9;
  }

  if (!+[MDDialogTransformer supportsTransformationForAceCommand:]( &OBJC_CLASS___MDDialogTransformer,  "supportsTransformationForAceCommand:",  v16)) {
    goto LABEL_8;
  }
LABEL_7:
  v19 = self->_analyticsSupplement;
  v20 = (void *)objc_claimAutoreleasedReturnValue([v16 refId]);
  v21 = -[SRUIFAnalyticsSupplement computedModeForRefId:](v19, "computedModeForRefId:", v20);

  if (!(_DWORD)v21) {
    goto LABEL_8;
  }
LABEL_10:

  id v22 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _instrumentationManager](self, "_instrumentationManager"));
  [v22 emitUUFRSpokenForAceObject:v23 presentationType:v13 dialogPhase:v12 mode:v21 speakableText:v11 dialogIdentifierOverride:v10];
}

  return (id)a4;
}

void sub_100013758(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  LODWORD(v2) = [v3 isCancelled];

  if ((_DWORD)v2)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _navigationController]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 viewControllers]);
    id v6 = [v5 count];

    if (v6 == (id)2)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained delegate]);
      [v7 blurFromRootNavigationTransitionController:WeakRetained requestBackgroundBlurViewVisible:1];
    }
  }

  [WeakRetained _updateBlurVisibility];
}

id sub_100013CE0(uint64_t a1)
{
  v1 = @"Voice";
  if (a1 == 1) {
    v1 = @"Mixed";
  }
  if (a1 == 2) {
    id v2 = @"Silent";
  }
  else {
    id v2 = v1;
  }
  return [@"SRMode" stringByAppendingString:v2];
}

LABEL_12:
  return v7;
}
}

  v20 = objc_alloc_init(*v9);
  if (!v20)
  {
LABEL_19:
    v21 = 0LL;
    goto LABEL_20;
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue( +[SiriSharedUITranscriptItem transcriptItemWithAceObject:]( &OBJC_CLASS___SiriSharedUITranscriptItem,  "transcriptItemWithAceObject:",  v3));
  [v21 setViewController:v20];
LABEL_20:

  return v21;
}

__CFString *sub_100014244(uint64_t a1)
{
  v1 = @"Voice";
  if (a1 == 1) {
    v1 = @"Mixed";
  }
  if (a1 == 2) {
    return @"Silent";
  }
  else {
    return v1;
  }
}

id sub_10001450C(void *a1)
{
  id v1 = a1;
  id v2 = sub_1000148D8();
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = sub_100014990();
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 setByAddingObjectsFromSet:v5]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v1 name]);
  id v8 = [v6 containsObject:v7];

  return v8;
}

id sub_1000148D8()
{
  v3[0] = UIKeyboardWillShowNotification;
  v3[1] = UIKeyboardWillHideNotification;
  v3[2] = UIKeyboardWillChangeFrameNotification;
  uint64_t v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v3, 3LL));
  id v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v0));

  return v1;
}

id sub_100014990()
{
  v3[0] = UIKeyboardDidShowNotification;
  v3[1] = UIKeyboardDidHideNotification;
  v3[2] = UIKeyboardDidChangeFrameNotification;
  uint64_t v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v3, 3LL));
  id v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v0));

  return v1;
}

  ;
}

void sub_100014A5C(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

BOOL sub_1000158F8(id a1, NSURL *a2, NSError *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
    sub_10006A3AC((uint64_t)v4, (uint64_t)v5, v6);
  }

  return 1;
}

void sub_10001661C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_100016640(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained siriSessionDidReceiveAddViewsCommand:v3 completion:0];
}

void sub_10001686C(id a1, UIViewControllerTransitionCoordinatorContext *a2)
{
}

void sub_1000169F8(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained && WeakRetained[23])
  {
    id v3 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315138;
      id v5 = "-[SRSiriViewController _setupXPCListener]_block_invoke";
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s #xpcSiriApp Resuming XPC Connection",  (uint8_t *)&v4,  0xCu);
    }

    [v2[23] resume];
  }
}

void sub_100016DB0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, id location)
{
}

void sub_100016DE8(uint64_t a1)
{
  id v1 = *(dispatch_queue_s **)(a1 + 32);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100016E60;
  block[3] = &unk_1000B9F38;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  dispatch_async(v1, block);
  objc_destroyWeak(&v3);
}

void sub_100016E60(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _connectionWasInvalidated];
}

void sub_100016E8C(uint64_t a1)
{
  id v1 = *(dispatch_queue_s **)(a1 + 32);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100016F04;
  block[3] = &unk_1000B9F38;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  dispatch_async(v1, block);
  objc_destroyWeak(&v3);
}

void sub_100016F04(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _connectionWasInterrupted];
}

void sub_100017468( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_100017490(uint64_t a1, uint64_t a2, char a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v7 = WeakRetained;
    id v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _host]);
    id v6 = v5;
    if ((a3 & 1) != 0) {
      [v5 serviceDidEnterUITrackingMode];
    }
    else {
      [v5 serviceDidExitUITrackingMode];
    }

    id WeakRetained = v7;
  }
}

LABEL_15:
}
}
  }

  return v6;
}
  }

  return v6;
}
  }

  __int128 v12 = objc_msgSend(v4, "_windowInterfaceOrientation", (void)v16);
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[SRAppDelegate appWindow](self, "appWindow"));
  __int128 v14 = [v13 _windowInterfaceOrientation];

  if (v4 && (objc_opt_respondsToSelector(v4, "invalidate") & 1) != 0 && v12 != v14)
  {
    v15 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v21 = "-[SRAppDelegate invalidateKeyboardWindowIfNeeded]";
      id v22 = 2048;
      id v23 = v12;
      id v24 = 2048;
      uint64_t v25 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%s #keyboardInvalidation: Invalidating keyboard window because orientation (%ld) didn't match our launch orientation (%ld)",  buf,  0x20u);
    }

    [v4 invalidate];
  }
}

  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for Log.LogType);
  __break(1u);
  return result;
}

void sub_100017EDC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_100017EF4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100017F04(uint64_t a1)
{
}

void sub_100017F0C(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v9 = a2;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
  unsigned int v8 = [v7 isEqual:*(void *)(a1 + 32)];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
    *a4 = 1;
  }
}

void sub_100018250(id a1, BOOL a2, NSError *a3)
{
  int v4 = a3;
  if (!a2)
  {
    id v5 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      sub_10006A544((uint64_t)v4, v5, v6);
    }
  }
}

void sub_100018530( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_10001855C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v7 = (os_log_s *)AFSiriLogContextConnection;
  if ((_DWORD)a2)
  {
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      int v14 = 136315650;
      v15 = "-[SRSiriViewController _saveConversationWithCompletion:]_block_invoke";
      __int16 v16 = 2112;
      uint64_t v17 = v8;
      __int16 v18 = 2112;
      uint64_t v19 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s #conversation Conversation successfully saved to store { identifier: %@, conversation: %@ }",  (uint8_t *)&v14,  0x20u);
    }
  }

  else if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    sub_10006A5D4();
  }

  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _presentation]);
  char v11 = objc_opt_respondsToSelector(v10, "attemptedToSaveConversation:withResult:");

  if ((v11 & 1) != 0)
  {
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _presentation]);
    [v12 attemptedToSaveConversation:*(void *)(a1 + 40) withResult:a2];
  }

  uint64_t v13 = *(void *)(a1 + 48);
  if (v13) {
    (*(void (**)(void))(v13 + 16))();
  }
}

id sub_1000187D8(uint64_t a1, void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a2 identifier]);
  id v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

void sub_100018B00( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_100018B24(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100018BF8;
  v9[3] = &unk_1000BA3F8;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v7 = v6;
  id v10 = v7;
  id v8 = v5;
  id v11 = v8;
  SiriUIInvokeOnMainQueue(v9);

  objc_destroyWeak(&v12);
}

void sub_100018BE4(_Unwind_Exception *a1)
{
}

void sub_100018BF8(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    id v3 = (uint64_t *)(a1 + 4);
    if (a1[4])
    {
      id v4 = (os_log_s *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
        sub_10006A64C(v3, v4, v5);
      }
    }

    else
    {
      [a1[5] setDelegate:WeakRetained];
      id v6 = (os_log_s *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = a1[5];
        *(_DWORD *)buf = 136315650;
        id v27 = "-[SRSiriViewController _restorePreviousConversation]_block_invoke";
        __int16 v28 = 2112;
        id v29 = (id)AFUIPreviousConversationIdentifier;
        __int16 v30 = 2112;
        id v31 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s #conversation Loaded previous conversation { identifier: %@, conversation: %@ }",  buf,  0x20u);
      }

      if ([WeakRetained _languageMatchesConversation:a1[5]])
      {
        id v8 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _conversations]);
        [v8 insertObject:a1[5] atIndex:0];

        uint64_t v9 = (os_log_s *)AFSiriLogContextConnection;
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
        {
          id v10 = a1[5];
          *(_DWORD *)buf = 136315394;
          id v27 = "-[SRSiriViewController _restorePreviousConversation]_block_invoke";
          __int16 v28 = 2112;
          id v29 = v10;
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s #conversation Inserted previous conversation into conversation list { conversation: %@ }",  buf,  0x16u);
        }

        id v11 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _presentation]);
        char v12 = objc_opt_respondsToSelector(v11, "conversationListDidChange");

        if ((v12 & 1) != 0)
        {
          uint64_t v13 = (os_log_s *)AFSiriLogContextConnection;
          if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            id v27 = "-[SRSiriViewController _restorePreviousConversation]_block_invoke";
            _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s #conversation Notifying presentation that our conversation list changed",  buf,  0xCu);
          }

          int v14 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _presentation]);
          [v14 conversationListDidChange];
        }

        v15 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _presentation]);
        char v16 = objc_opt_respondsToSelector(v15, "previousConversationDidLoad:");

        if ((v16 & 1) != 0)
        {
          uint64_t v17 = (os_log_s *)AFSiriLogContextConnection;
          if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            id v27 = "-[SRSiriViewController _restorePreviousConversation]_block_invoke";
            _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%s #conversation Notifying presentation that the previous conversation was loaded from disk",  buf,  0xCu);
          }

          __int16 v18 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _presentation]);
          [v18 previousConversationDidLoad:a1[5]];
        }
      }

      else
      {
        uint64_t v19 = (os_log_s *)AFSiriLogContextConnection;
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
        {
          id v20 = a1[5];
          *(_DWORD *)buf = 136315394;
          id v27 = "-[SRSiriViewController _restorePreviousConversation]_block_invoke";
          __int16 v28 = 2112;
          id v29 = v20;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "%s #conversation Previous conversation language doesn't match current language; removing from the store { co"
            "nversation: %@ }",
            buf,
            0x16u);
        }

        v21 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _conversationStore]);
        uint64_t v22 = AFUIPreviousConversationIdentifier;
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472LL;
        v23[2] = sub_100018FD8;
        v23[3] = &unk_1000BA3D0;
        id v24 = a1[5];
        id v25 = a1[4];
        [v21 removeConversationWithIdentifier:v22 completionBlock:v23];
      }
    }
  }
}

void sub_100018FD8(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      sub_10006A6E0(a1, v6, v7);
    }
  }
}

void sub_100019A90(_Unwind_Exception *a1)
{
}

void sub_100019ABC(uint64_t a1)
{
}

void sub_100019AC4(uint64_t a1)
{
}

void sub_100019ACC(uint64_t a1)
{
  id v2 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
    int v6 = 136315394;
    uint64_t v7 = "-[SRSiriViewController siriDidDeactivateWithCompletion:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s Releasing %@", (uint8_t *)&v6, 0x16u);
  }

  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0LL;
}

uint64_t sub_100019BA0(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_10001A718(id a1, NSError *a2)
{
  id v2 = a2;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
    sub_10006A928();
  }
}

LABEL_19:
}
}

    (*((void (**)(id, BOOL))v7 + 2))(v7, v8 != 0LL);
    goto LABEL_20;
  }

  +[SRErrorUtility resetErrorState](&OBJC_CLASS___SRErrorUtility, "resetErrorState");
  if (v7) {
    (*((void (**)(id, void))v7 + 2))(v7, 0LL);
  }
LABEL_21:
}

  v63 = 0LL;
  __int128 v39 = [v4 suspendWithError:&v63];
  __int128 v40 = v63;
  if (v39)
  {
    __int128 v41 = v63;
    if (v23 == 1) {
      goto LABEL_30;
    }
LABEL_28:
    v63 = (id)v23;
    v55 = sub_100058CB4();
    swift_willThrowTypedImpl(&v63, &type metadata for FaceDetectionError, v55);

    *a1 = v23;
    return Current;
  }

  __int128 v42 = v63;
  v43 = _convertNSErrorToError(_:)(v40);

  swift_willThrow();
  if (v7[323] != -1LL) {
    swift_once(&qword_1000D8A18, sub_100057C1C);
  }
  v44 = type metadata accessor for Logger(0LL);
  sub_10004ADF0(v44, (uint64_t)qword_1000DA5D8);
  swift_errorRetain(v43);
  __int16 v45 = swift_errorRetain(v43);
  id v46 = (os_log_s *)Logger.logObject.getter(v45);
  __int16 v47 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v46, v47))
  {
    v57 = v24;
    v60 = v23;
    v48 = swift_slowAlloc(22LL, -1LL);
    __int16 v49 = (void *)swift_slowAlloc(8LL, -1LL);
    v50 = (void *)swift_slowAlloc(32LL, -1LL);
    v63 = v50;
    *(_DWORD *)v48 = 136315394;
    if (qword_1000D8A10 != -1) {
      swift_once(&qword_1000D8A10, sub_1000545C4);
    }
    __int16 v51 = qword_1000D9310;
    v52 = *(void *)algn_1000D9318;
    swift_bridgeObjectRetain(*(void *)algn_1000D9318);
    v62 = (id)sub_100057FC0(v51, v52, (uint64_t *)&v63);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v62, &v63, v48 + 4, v48 + 12);
    swift_bridgeObjectRelease(v52);
    *(_WORD *)(v48 + 12) = 2112;
    swift_errorRetain(v43);
    v53 = (void *)_swift_stdlib_bridgeErrorToNSError(v43);
    v62 = v53;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v62, &v63, v48 + 14, v48 + 22);
    *__int16 v49 = v53;
    swift_errorRelease(v43);
    swift_errorRelease(v43);
    _os_log_impl( (void *)&_mh_execute_header,  v46,  v47,  "#activation #quickTypeGate %s: Failed to suspend attention awareness client with error %@",  (uint8_t *)v48,  0x16u);
    v54 = sub_10004A8E8(&qword_1000D9340);
    swift_arrayDestroy(v49, 1LL, v54);
    swift_slowDealloc(v49, -1LL, -1LL);
    swift_arrayDestroy(v50, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v50, -1LL, -1LL);
    swift_slowDealloc(v48, -1LL, -1LL);

    swift_errorRelease(v43);
    id v24 = v57;
    id v23 = v60;
    if (v60 == 1) {
      goto LABEL_30;
    }
    goto LABEL_28;
  }

  swift_errorRelease(v43);
  swift_errorRelease(v43);
  swift_errorRelease(v43);

  if (v23 != 1) {
    goto LABEL_28;
  }
LABEL_30:
  if (v24) {
    [v24 eventMask];
  }
  double Current = CFAbsoluteTimeGetCurrent();

  return Current;
}

LABEL_35:
    if (v11) {
      v11->invoke(v11, 1LL);
    }
    goto LABEL_47;
  }

  if (v10) {
    v10->invoke(v10, 0LL);
  }
LABEL_48:
}

uint64_t sub_10001B844(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a1 + 32);
  if (v4)
  {
    [v4 willMoveToParentViewController:0];
    [*(id *)(a1 + 32) removeFromParentViewController];
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

void sub_10001BD04( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
}

uint64_t sub_10001BD20(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0LL);
  }
  return result;
}

void sub_10001BD38(uint64_t a1, uint64_t a2)
{
  if ((_DWORD)a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _presentation]);
    char v6 = objc_opt_respondsToSelector(v5, "siriDidOpenURL:bundleId:inPlace:");

    if ((v6 & 1) != 0)
    {
      id v7 = objc_loadWeakRetained((id *)(a1 + 64));
      __int16 v8 = (void *)objc_claimAutoreleasedReturnValue([v7 _presentation]);
      [v8 siriDidOpenURL:*(void *)(a1 + 32) bundleId:*(void *)(a1 + 40) inPlace:*(unsigned __int8 *)(a1 + 72)];
    }
  }

  uint64_t v9 = *(void *)(a1 + 56);
  if (v9) {
    (*(void (**)(uint64_t, uint64_t))(v9 + 16))(v9, a2);
  }
  id v10 = objc_loadWeakRetained((id *)(a1 + 64));
  if (v10 && (_DWORD)a2)
  {
    id v12 = v10;
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[SAUIAppPunchOutEvent sruif_appPunchOutEventWithRefId:URL:appDisplayName:bundleId:]( &OBJC_CLASS___SAUIAppPunchOutEvent,  "sruif_appPunchOutEventWithRefId:URL:appDisplayName:bundleId:",  *(void *)(a1 + 48),  *(void *)(a1 + 32),  0LL,  *(void *)(a1 + 40)));
    [v12 _performGenericAceCommand:v11 turnIdentifier:0 completion:0];
    if (!*(_BYTE *)(a1 + 72))
    {
      [v12 _setRequestActive:0];
      [v12 _checkAndUpdateSiriIdleAndQuietStatusOrRescheduleIdleTimerIfNeeded];
    }

    id v10 = v12;
  }
}

void sub_10001C008(uint64_t a1)
{
  id v2 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 48);
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = v2;
    char v6 = (void *)objc_claimAutoreleasedReturnValue([v4 aceId]);
    int v8 = 136315650;
    uint64_t v9 = "-[SRSiriViewController _delayAceCommandSuccess:forDuration:]_block_invoke";
    __int16 v10 = 2048;
    uint64_t v11 = v3;
    __int16 v12 = 2112;
    uint64_t v13 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s #aceCommandRecord completing scheduled delayed action after %f seconds for command %@",  (uint8_t *)&v8,  0x20u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _didCompleteActionForAceCommand:*(void *)(a1 + 32) success:1];
}

LABEL_11:
}

  return v5;
}

    v18[(v12 >> 6) + 8] |= 1LL << v12;
    *(void *)(v18[6] + 8 * v12) = a3;
    v21 = (void *)(v18[7] + 16 * v12);
    void *v21 = a1;
    v21[1] = a2;
    uint64_t v22 = v18[2];
    id v23 = __OFADD__(v22, 1LL);
    id v24 = v22 + 1;
    if (!v23)
    {
      v18[2] = v24;
      return result;
    }

    goto LABEL_14;
  }

  sub_10006844C(result, a4 & 1);
  uint64_t result = sub_1000683F4(a3);
  if ((v16 & 1) == (v20 & 1))
  {
    __int16 v12 = result;
    __int16 v18 = (void *)*v5;
    if ((v16 & 1) != 0) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }

void sub_10001C90C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
}

uint64_t sub_10001C930(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_10001C944(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 136));
  id v7 = WeakRetained;
  if (!WeakRetained)
  {
LABEL_5:
    (*(void (**)(void))(*(void *)(a1 + 112) + 16LL))();
    goto LABEL_38;
  }

  if (v5)
  {
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      sub_10006AB9C();
    }
    goto LABEL_5;
  }

  [WeakRetained[28] setAudioSessionID:a2];
  if (!*(void *)(a1 + 32))
  {
    int v9 = *(unsigned __int8 *)(a1 + 153);
    uint64_t v10 = (os_log_s *)AFSiriLogContextConnection;
    BOOL v11 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (!v11) {
        goto LABEL_17;
      }
      uint64_t v12 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 136315394;
      v53 = "-[SRSiriViewController _speakText:audioData:ignoreMuteSwitch:identifier:sessionId:preferredVoice:language:ge"
            "nder:provisionally:eligibleAfterDuration:delayed:canUseServerTTS:speakableUtteranceParser:analyticsContext:s"
            "peakableContextInfo:preparation:completion:]_block_invoke";
      __int16 v54 = 2112;
      uint64_t v55 = v12;
      uint64_t v13 = "%s #tts 5 text:%@";
    }

    else
    {
      if (!v11) {
        goto LABEL_17;
      }
      uint64_t v14 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 136315395;
      v53 = "-[SRSiriViewController _speakText:audioData:ignoreMuteSwitch:identifier:sessionId:preferredVoice:language:ge"
            "nder:provisionally:eligibleAfterDuration:delayed:canUseServerTTS:speakableUtteranceParser:analyticsContext:s"
            "peakableContextInfo:preparation:completion:]_block_invoke";
      __int16 v54 = 2117;
      uint64_t v55 = v14;
      uint64_t v13 = "%s #tts 5 text:%{sensitive}@";
    }

    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v13, buf, 0x16u);
LABEL_17:
    char v51 = 0;
    uint64_t v16 = *(void *)(a1 + 56);
    v15 = *(void **)(a1 + 64);
    id v50 = 0LL;
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v15 parseStringWithFormat:v16 error:&v50 containsPrivacySensitiveContents:&v51]);
    id v43 = v50;
    if (!v17)
    {
      int v28 = *(unsigned __int8 *)(a1 + 153);
      id v29 = (os_log_s *)AFSiriLogContextConnection;
      BOOL v30 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR);
      if (v28)
      {
        if (v30) {
          sub_10006AB2C();
        }
      }

      else if (v30)
      {
        sub_10006AAB0(v29, v31, v32, v33, v34, v35, v36, v37);
      }

      (*(void (**)(void))(*(void *)(a1 + 112) + 16LL))();
      goto LABEL_37;
    }

    objc_initWeak(&location, v7);
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472LL;
    v44[2] = sub_10001CE38;
    v44[3] = &unk_1000BA600;
    objc_copyWeak(&v47, &location);
    id v46 = *(id *)(a1 + 128);
    id v45 = v17;
    char v48 = v51;
    __int16 v18 = objc_retainBlock(v44);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 UUIDString]);

    id v21 = v7[6];
    uint64_t v22 = objc_retainBlock(v18);
    [v21 setObject:v22 forKey:v20];

    LODWORD(v21) = *(unsigned __int8 *)(a1 + 153);
    id v23 = (os_log_s *)AFSiriLogContextConnection;
    BOOL v24 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT);
    if ((_DWORD)v21)
    {
      if (v24)
      {
        uint64_t v25 = *(void *)(a1 + 56);
        uint64_t v26 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 136315650;
        v53 = "-[SRSiriViewController _speakText:audioData:ignoreMuteSwitch:identifier:sessionId:preferredVoice:language:"
              "gender:provisionally:eligibleAfterDuration:delayed:canUseServerTTS:speakableUtteranceParser:analyticsConte"
              "xt:speakableContextInfo:preparation:completion:]_block_invoke";
        __int16 v54 = 2112;
        uint64_t v55 = v25;
        __int16 v56 = 2112;
        uint64_t v57 = v26;
        id v27 = "%s #tts 6 Enqueuing %@ identifier=%@";
LABEL_26:
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v27, buf, 0x20u);
      }
    }

    else if (v24)
    {
      uint64_t v38 = *(void *)(a1 + 56);
      uint64_t v39 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 136315651;
      v53 = "-[SRSiriViewController _speakText:audioData:ignoreMuteSwitch:identifier:sessionId:preferredVoice:language:ge"
            "nder:provisionally:eligibleAfterDuration:delayed:canUseServerTTS:speakableUtteranceParser:analyticsContext:s"
            "peakableContextInfo:preparation:completion:]_block_invoke";
      __int16 v54 = 2117;
      uint64_t v55 = v38;
      __int16 v56 = 2112;
      uint64_t v57 = v39;
      id v27 = "%s #tts 6 Enqueuing %{sensitive}@ identifier=%@";
      goto LABEL_26;
    }

    if (*(_BYTE *)(a1 + 153)) {
      BOOL v40 = v51 == 0;
    }
    else {
      BOOL v40 = 0;
    }
    char v41 = v40;
    BYTE3(v42) = v41;
    BYTE2(v42) = *(_BYTE *)(a1 + 154);
    BYTE1(v42) = *(_BYTE *)(a1 + 152);
    LOBYTE(v42) = 0;
    objc_msgSend( v7[28],  "enqueueText:identifier:sessionId:preferredVoice:language:gender:isPhonetic:provisionally:eligibleAfterDuration:del ayed:canUseServerTTS:preparationIdentifier:completion:analyticsContext:speakableContextInfo:",  *(void *)(a1 + 56),  *(void *)(a1 + 40),  *(void *)(a1 + 48),  *(void *)(a1 + 72),  *(void *)(a1 + 80),  *(void *)(a1 + 88),  *(double *)(a1 + 144),  v42,  v20,  *(void *)(a1 + 112),  *(void *)(a1 + 96),  *(void *)(a1 + 104));

    objc_destroyWeak(&v47);
    objc_destroyWeak(&location);
LABEL_37:

    goto LABEL_38;
  }

  int v8 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v53 = "-[SRSiriViewController _speakText:audioData:ignoreMuteSwitch:identifier:sessionId:preferredVoice:language:gend"
          "er:provisionally:eligibleAfterDuration:delayed:canUseServerTTS:speakableUtteranceParser:analyticsContext:speak"
          "ableContextInfo:preparation:completion:]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s #tts 5 audioData", buf, 0xCu);
  }

  [v7[28] enqueueAudioData:*(void *)(a1 + 32) identifier:*(void *)(a1 + 40) sessionId:*(void *)(a1 + 48) provisionally:*(unsigned __int8 *)(a1 + 152) eligibleAfterDuration:*(void *)(a1 + 120) completion:*(double *)(a1 + 144)];
LABEL_38:
}

void sub_10001CE14( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, id location)
{
}

void sub_10001CE38(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v16 = "-[SRSiriViewController _speakText:audioData:ignoreMuteSwitch:identifier:sessionId:preferredVoice:language:gend"
          "er:provisionally:eligibleAfterDuration:delayed:canUseServerTTS:speakableUtteranceParser:analyticsContext:speak"
          "ableContextInfo:preparation:completion:]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s #tts 12", buf, 0xCu);
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10001D044;
  v12[3] = &unk_1000BA5D8;
  objc_copyWeak(&v14, (id *)(a1 + 48));
  id v5 = v3;
  id v13 = v5;
  char v6 = objc_retainBlock(v12);
  uint64_t v7 = *(void *)(a1 + 40);
  int v8 = (os_log_s *)AFSiriLogContextConnection;
  BOOL v9 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v16 = "-[SRSiriViewController _speakText:audioData:ignoreMuteSwitch:identifier:sessionId:preferredVoice:language:ge"
            "nder:provisionally:eligibleAfterDuration:delayed:canUseServerTTS:speakableUtteranceParser:analyticsContext:s"
            "peakableContextInfo:preparation:completion:]_block_invoke";
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s #tts 13 Only if there is a bulletinIdentifier",  buf,  0xCu);
    }

    (*(void (**)(void, void *, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  v6,  v10,  v11);
  }

  else
  {
    if (v9)
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v16 = "-[SRSiriViewController _speakText:audioData:ignoreMuteSwitch:identifier:sessionId:preferredVoice:language:ge"
            "nder:provisionally:eligibleAfterDuration:delayed:canUseServerTTS:speakableUtteranceParser:analyticsContext:s"
            "peakableContextInfo:preparation:completion:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s #tts 13", buf, 0xCu);
    }

    ((void (*)(void *, void, void))v6[2])(v6, *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 56));
  }

  objc_destroyWeak(&v14);
}

void sub_10001D028(_Unwind_Exception *a1)
{
}

void sub_10001D044(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    BOOL v9 = "-[SRSiriViewController _speakText:audioData:ignoreMuteSwitch:identifier:sessionId:preferredVoice:language:gende"
         "r:provisionally:eligibleAfterDuration:delayed:canUseServerTTS:speakableUtteranceParser:analyticsContext:speakab"
         "leContextInfo:preparation:completion:]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s #tts 14", (uint8_t *)&v8, 0xCu);
  }

  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    char v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _repeatablePhrases]);
    [v6 addObject:v3];
  }

  if (*(void *)(a1 + 32))
  {
    uint64_t v7 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      BOOL v9 = "-[SRSiriViewController _speakText:audioData:ignoreMuteSwitch:identifier:sessionId:preferredVoice:language:gen"
           "der:provisionally:eligibleAfterDuration:delayed:canUseServerTTS:speakableUtteranceParser:analyticsContext:spe"
           "akableContextInfo:preparation:completion:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s #tts 15", (uint8_t *)&v8, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
}

LABEL_20:
  }
}

      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "content", *(_OWORD *)v27, *(void *)&v27[16]));
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 speakableTextOverride]);
      if (v23)
      {
LABEL_21:
        int v8 = v23;
LABEL_24:

        break;
      }

      BOOL v24 = (void *)objc_claimAutoreleasedReturnValue([v5 content]);
LABEL_23:
      uint64_t v25 = v24;
      int v8 = (id)objc_claimAutoreleasedReturnValue([v24 text]);

      goto LABEL_24;
    case 1uLL:
      if (v8 == (id)2)
      {
        uint64_t v16 = (void *)AFSiriLogContextConnection;
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
        {
          id v13 = v16;
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v5 dialogIdentifier]);
          *(_DWORD *)id v27 = 136315394;
          *(void *)&v27[4] = "+[SRModeDialogTransformer _speakableTextForDialog:mode:]";
          *(_WORD *)&v27[12] = 2112;
          *(void *)&v27[14] = v14;
          v15 = "%s #modes Transforming Dialog (%@) CONTENT into speakable text for Mixed Mode with Voice Over";
          goto LABEL_19;
        }
      }

      else
      {
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v5 caption]);

        __int16 v18 = (void *)AFSiriLogContextConnection;
        uint64_t v19 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT);
        if (v17)
        {
          if (v19)
          {
            id v20 = v18;
            id v21 = (void *)objc_claimAutoreleasedReturnValue([v5 dialogIdentifier]);
            *(_DWORD *)id v27 = 136315394;
            *(void *)&v27[4] = "+[SRModeDialogTransformer _speakableTextForDialog:mode:]";
            *(_WORD *)&v27[12] = 2112;
            *(void *)&v27[14] = v21;
            _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "%s #modes Transforming Dialog (%@) CAPTION into speakable text for Mixed Mode",  v27,  0x16u);
          }

          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v5 caption]);
          id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 speakableTextOverride]);
          if (v23) {
            goto LABEL_21;
          }
          BOOL v24 = (void *)objc_claimAutoreleasedReturnValue([v5 caption]);
          goto LABEL_23;
        }

        if (v19)
        {
          id v13 = v18;
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v5 dialogIdentifier]);
          *(_DWORD *)id v27 = 136315394;
          *(void *)&v27[4] = "+[SRModeDialogTransformer _speakableTextForDialog:mode:]";
          *(_WORD *)&v27[12] = 2112;
          *(void *)&v27[14] = v14;
          v15 = "%s #modes Transforming Dialog (%@) CONTENT into speakable text for Mixed Mode (Caption is nil)";
          goto LABEL_19;
        }
      }

      goto LABEL_20;
    case 2uLL:
      BOOL v9 = (void *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = v9;
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v5 dialogIdentifier]);
        *(_DWORD *)id v27 = 136315394;
        *(void *)&v27[4] = "+[SRModeDialogTransformer _speakableTextForDialog:mode:]";
        *(_WORD *)&v27[12] = 2112;
        *(void *)&v27[14] = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s #modes IGNORING Dialog (%@) speakable text for Silent Mode",  v27,  0x16u);
      }

      int v8 = 0LL;
      break;
  }

  return v8;
}

  uint64_t v26 = swift_unknownObjectWeakLoadStrong(v3 + OBJC_IVAR___SRCarPlayPresentation_delegate, v16);
  if (v26)
  {
    id v27 = (void *)v26;
    int v28 = swift_bridgeObjectRetain(v6);
    id v29 = sub_100050308(v28);
    swift_bridgeObjectRelease(v6);
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v29);
    [v27 siriPresentation:v3 didPresentConversationItemsWithIdentifiers:isa];

    swift_unknownObjectRelease(v27);
  }

  swift_bridgeObjectRelease(v6);
}

uint64_t sub_10001EE3C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1LL);
  }
  return result;
}

void sub_10001F1A8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_10001F1CC(uint64_t a1, int a2)
{
  uint64_t v4 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(unsigned __int8 *)(a1 + 40);
    int v13 = 136315650;
    id v14 = "-[SRSiriViewController siriSessionDidFinishRequestWithError:]_block_invoke";
    __int16 v15 = 1024;
    int v16 = v5;
    __int16 v17 = 1024;
    int v18 = a2 ^ 1;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s Should start listen after speaking %d %d",  (uint8_t *)&v13,  0x18u);
  }

  if (*(_BYTE *)(a1 + 40) && (a2 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _startListenAfterSpeaking];
  }

  id v7 = objc_loadWeakRetained((id *)(a1 + 32));
  [v7 _setListenAfterSpeakingForRepeatable:*(unsigned __int8 *)(a1 + 40)];

  id v8 = objc_loadWeakRetained((id *)(a1 + 32));
  unsigned __int8 v9 = [v8 _isWaitingForStartRequest];

  if ((v9 & 1) == 0)
  {
    id v10 = objc_loadWeakRetained((id *)(a1 + 32));
    [v10 _setRequestActive:0];
  }

  id v11 = objc_loadWeakRetained((id *)(a1 + 32));
  [v11 _setWaitingForStartRequest:*(unsigned __int8 *)(a1 + 40)];

  id v12 = objc_loadWeakRetained((id *)(a1 + 32));
  [v12 _checkAndUpdateSiriIdleAndQuietStatusOrRescheduleIdleTimerIfNeeded];
}

void sub_10001F664( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_10001F688(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v11 = WeakRetained;
    id v3 = objc_msgSend( WeakRetained,  "_instrumentationPresentationForPresentationOptions:",  objc_msgSend(WeakRetained, "_presentationOptions"));
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[SRUIFInstrumentationManager sharedManager]( &OBJC_CLASS___SRUIFInstrumentationManager,  "sharedManager"));
    objc_msgSend( v4,  "emitUIStateTransitionEventWithFromState:toState:withPresentationType:machAbsoluteTransitionTime:",  objc_msgSend(v11, "_mapSiriTransitionState:", *(void *)(a1 + 40)),  objc_msgSend(v11, "_mapSiriTransitionState:", *(void *)(a1 + 48)),  v3,  *(double *)(a1 + 56));

    BOOL v5 = [v11 _mapSiriTransitionState:*(void *)(a1 + 48)] == 5;
    id WeakRetained = v11;
    if (v5)
    {
      char v6 = (void *)objc_claimAutoreleasedReturnValue([v11 _requestOptions]);
      id v7 = [v6 requestSource];

      id WeakRetained = v11;
      if (v7 == (id)13)
      {
        id v8 = objc_alloc_init(&OBJC_CLASS___SISchemaUEILaunchEnded);
        [v8 setExists:1];
        id v9 = objc_alloc_init(&OBJC_CLASS___SISchemaUEILaunchContext);
        [v9 setEnded:v8];
        id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SRUIFInstrumentationManager sharedManager]( &OBJC_CLASS___SRUIFInstrumentationManager,  "sharedManager"));
        [v10 emitInstrumentation:v9 atTime:(unint64_t)*(double *)(a1 + 56)];

        id WeakRetained = v11;
      }
    }
  }
}

uint64_t sub_10001F7CC(uint64_t a1, uint64_t a2)
{
  else {
    return a2;
  }
}

id sub_10001FEA8(uint64_t a1)
{
  return _[*(id *)(a1 + 32) siriSessionDidChangeNetworkAvailability];
}

LABEL_7:
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SRSiriViewController _presentation](self, "_presentation"));
  if ((objc_opt_respondsToSelector(v12, "trustsURL:") & 1) != 0)
  {
    int v13 = [v12 trustsURL:v8];

    if (v13) {
      goto LABEL_16;
    }
  }

  else
  {
  }

  id v14 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v22 = "-[SRSiriViewController siriSessionDidReceiveOpenLinkCommand:completion:]";
    id v23 = 2112;
    BOOL v24 = v8;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s Ignoring unsafe URL:%@", buf, 0x16u);
  }

  if (v7)
  {
    __int16 v15 = (void *)objc_claimAutoreleasedReturnValue([v6 aceId]);
    int v16 = (void *)objc_claimAutoreleasedReturnValue( +[SACommandFailed sruif_commandFailedWithRefId:]( &OBJC_CLASS___SACommandFailed,  "sruif_commandFailedWithRefId:",  v15));

    [v16 setReason:@"Ignoring potentially unsafe URL"];
    (*((void (**)(id, void *))v7 + 2))(v7, v16);
LABEL_19:
  }
}
}

void sub_1000201B8(uint64_t a1, char a2)
{
  if (*(void *)(a1 + 40))
  {
    id v3 = *(void **)(a1 + 32);
    if ((a2 & 1) != 0)
    {
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 aceId]);
      uint64_t v5 = objc_claimAutoreleasedReturnValue( +[SACommandSucceeded sruif_commandSucceededWithRefId:]( &OBJC_CLASS___SACommandSucceeded,  "sruif_commandSucceededWithRefId:",  v4));
    }

    else
    {
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 aceId]);
      uint64_t v5 = objc_claimAutoreleasedReturnValue( +[SACommandFailed sruif_commandFailedWithRefId:]( &OBJC_CLASS___SACommandFailed,  "sruif_commandFailedWithRefId:",  v4));
    }

    id v6 = (id)v5;

    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

void sub_100020458( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_10002047C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v5 = 136315394;
      id v6 = "-[SRSiriViewController siriSessionOpenURL:completionHandler:]_block_invoke";
      __int16 v7 = 2112;
      uint64_t v8 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s #punchout 8 Performing InPlace punchout %@",  (uint8_t *)&v5,  0x16u);
    }

    WeakRetained[23] = 0;
  }
}

void sub_100021100(_Unwind_Exception *a1)
{
}

void sub_100021124(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if ([v5 length]) {
      BOOL v4 = 0LL;
    }
    else {
      BOOL v4 = *(_BYTE *)(a1 + 40) != 0;
    }
    [WeakRetained _setShowKeyboardIfTextInputEnabled:*(unsigned __int8 *)(a1 + 41) minimized:v4];
    [WeakRetained _setKeyboardLoweredAfterResponse:*(unsigned __int8 *)(a1 + 40)];
  }
}

void sub_100022230( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, id location)
{
}

void sub_100022254(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _presentation]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) requestEndBehavior]);
  [v4 handleRequestEndBehavior:v5 isAttending:a2];
}

uint64_t sub_100022990(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100023010(_Unwind_Exception *a1)
{
}

void sub_100023050(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 8);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000231FC;
  v15[3] = &unk_1000BA7A8;
  objc_copyWeak(&v17, a1 + 8);
  id v16 = a1[4];
  id v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _hostWithErrorHandler:v15]);
  id v6 = a1[4];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10002325C;
  v8[3] = &unk_1000BA7D0;
  objc_copyWeak(&v14, a1 + 8);
  id v9 = a1[4];
  id v10 = a1[5];
  id v11 = a1[6];
  id v12 = a1[7];
  id v7 = v3;
  id v13 = v7;
  [v5 serviceBulletinWithIdentifier:v6 replyHandler:v8];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v17);
}

void sub_1000231D8(_Unwind_Exception *a1)
{
}

void sub_1000231FC(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
    sub_10006AED8(a1, v4, (uint64_t)v3);
  }
}

void sub_10002325C(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    sub_10006B004(a1, v4);
    if (!v3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  if (v3) {
LABEL_3:
  }
    [*(id *)(a1 + 40) setAssistantBulletin:v3];
LABEL_4:
  unsigned __int8 v11 = 0;
  id v5 = *(void **)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  id v10 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 parseStringWithFormat:v6 error:&v10 containsPrivacySensitiveContents:&v11]);
  id v8 = v10;
  if (!v7 && os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
    sub_10006AF94();
  }
  uint64_t v9 = *(void *)(a1 + 64);
  if (v9) {
    (*(void (**)(uint64_t, void *, void))(v9 + 16))(v9, v7, v11);
  }
}

void sub_10002334C(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    int v5 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL);
    uint64_t v6 = (void *)AFSiriLogContextConnection;
    BOOL v7 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        uint64_t v8 = *(void *)(a1 + 32);
        uint64_t v9 = v6;
        uint64_t Name = SRUIFSpeechSynthesisResultGetName(a2);
        unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(Name);
        uint64_t v12 = *(void *)(a1 + 40);
        *(_DWORD *)uint64_t v22 = 136315907;
        *(void *)&v22[4] = "-[SRSiriViewController _configuredSpeakableUtteranceParserForCommand:context:speakableText:"
                             "subCompletion:speakPreparation:speakCompletion:]_block_invoke";
        *(_WORD *)&v22[12] = 2117;
        *(void *)&v22[14] = v8;
        *(_WORD *)&v22[22] = 2112;
        id v23 = v11;
        LOWORD(v24) = 2112;
        *(void *)((char *)&v24 + 2) = v12;
        id v13 = "%s #tts 32 SRUIFSpeechSynthesisCompletion text=%{sensitive}@ result=%@ command=%@";
LABEL_12:
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v13, v22, 0x2Au);
      }
    }

    else if (v7)
    {
      uint64_t v18 = *(void *)(a1 + 32);
      uint64_t v9 = v6;
      uint64_t v19 = SRUIFSpeechSynthesisResultGetName(a2);
      unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(v19);
      uint64_t v20 = *(void *)(a1 + 40);
      *(_DWORD *)uint64_t v22 = 136315906;
      *(void *)&v22[4] = "-[SRSiriViewController _configuredSpeakableUtteranceParserForCommand:context:speakableText:su"
                           "bCompletion:speakPreparation:speakCompletion:]_block_invoke";
      *(_WORD *)&v22[12] = 2112;
      *(void *)&v22[14] = v18;
      *(_WORD *)&v22[22] = 2112;
      id v23 = v11;
      LOWORD(v24) = 2112;
      *(void *)((char *)&v24 + 2) = v20;
      id v13 = "%s #tts 32 SRUIFSpeechSynthesisCompletion text=%@ result=%@ command=%@";
      goto LABEL_12;
    }

    if (a2 == 3) {
      [WeakRetained _setListenAfterSpeakingForRequestFinished:0];
    }
    objc_msgSend( WeakRetained,  "_didCompleteActionForAceCommand:success:",  *(void *)(a1 + 40),  a2 != 3,  *(_OWORD *)v22,  *(void *)&v22[16],  v23,  v24);
    uint64_t v21 = *(void *)(a1 + 48);
    if (v21) {
      (*(void (**)(void))(v21 + 16))();
    }
    goto LABEL_19;
  }

  id v14 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t v22 = 136315138;
    *(void *)&v22[4] = "-[SRSiriViewController _configuredSpeakableUtteranceParserForCommand:context:speakableText:subC"
                         "ompletion:speakPreparation:speakCompletion:]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s #tts 32 FAIL strongSelf", v22, 0xCu);
  }

  int v15 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL);
  id v16 = (void *)AFSiriLogContextConnection;
  BOOL v17 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR);
  if (v15)
  {
    if (v17) {
      sub_10006B164(a1, v16, a2);
    }
  }

  else if (v17)
  {
    sub_10006B0B0(a1, v16, a2);
  }

void sub_100023828(id a1, int64_t a2, NSError *a3)
{
  BOOL v4 = a3;
  int v5 = (os_log_s *)AFSiriLogContextConnection;
  if (v4)
  {
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      sub_10006B21C((uint64_t)v4, a2, v5);
    }
  }

  else if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    BOOL v7 = "-[SRSiriViewController siriSessionDidReceivePlayNotificationSound:completion:]_block_invoke";
    __int16 v8 = 2048;
    int64_t v9 = a2;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s Completed notification sound playback with PlaybackCompletionType: %zd",  (uint8_t *)&v6,  0x16u);
  }
}

void sub_100023A68(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _didCompleteActionForAceCommand:*(void *)(*(void *)(a1 + 32) + 96) success:1];
    BOOL v4 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = v3[12];
      int v6 = 136315394;
      BOOL v7 = "-[SRSiriViewController alertDidBeginPlaying:]_block_invoke";
      __int16 v8 = 2112;
      uint64_t v9 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s Marking notification sound 'complete' for command %@ ",  (uint8_t *)&v6,  0x16u);
    }
  }
}

uint64_t sub_100023E6C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100024238( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, id location, char a36)
{
}

uint64_t sub_1000242A0(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_1000242B4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _didCompleteActionForAceCommand:*(void *)(a1 + 32) success:1];
}

void sub_1000242F4(uint64_t a1)
{
  if (!--*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained _didCompleteActionForAceCommand:*(void *)(a1 + 32) success:1];
  }

void sub_1000246E0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  if (v16) {
    objc_destroyWeak(v17);
  }
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100024708(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _instrumentationManager]);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) punchOutUri]);
    int v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) appId]);
    [v4 emitPunchOutEventWithURL:v5 appID:v6];

    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) aceId]);
    uint64_t v8 = objc_claimAutoreleasedReturnValue( +[SACommandSucceeded sruif_commandSucceededWithRefId:]( &OBJC_CLASS___SACommandSucceeded,  "sruif_commandSucceededWithRefId:",  v7));
  }

  else
  {
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) aceId]);
    uint64_t v8 = objc_claimAutoreleasedReturnValue( +[SACommandFailed sruif_commandFailedWithRefId:]( &OBJC_CLASS___SACommandFailed,  "sruif_commandFailedWithRefId:",  v7));
  }

  id v9 = (id)v8;

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_100024A6C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_100024A90(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v5 = WeakRetained;
  if (!WeakRetained)
  {
LABEL_6:
    uint64_t v10 = *(void *)(a1 + 40);
    if (v10)
    {
      unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) aceId]);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[SACommandSucceeded sruif_commandSucceededWithRefId:]( &OBJC_CLASS___SACommandSucceeded,  "sruif_commandSucceededWithRefId:",  v11));
      (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v12);
    }

    goto LABEL_13;
  }

  if (a2)
  {
    int v6 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v7 = *(void **)(a1 + 32);
      uint64_t v8 = v6;
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 aceId]);
      *(_DWORD *)buf = 136315650;
      BOOL v30 = "-[SRSiriViewController siriSessionDidReceiveCloseAssistantCommand:completion:]_block_invoke";
      __int16 v31 = 2112;
      uint64_t v32 = v7;
      __int16 v33 = 2112;
      uint64_t v34 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s #tts speech queue is empty, performing dismissal command %@, aceId: %@",  buf,  0x20u);
    }

    [v5 _dismissWithReason:*(void *)(a1 + 56)];
    goto LABEL_6;
  }

  if (!WeakRetained[1])
  {
    id v13 = objc_alloc_init(&OBJC_CLASS___AFQueue);
    id v14 = (void *)v5[1];
    v5[1] = v13;
  }

  int v15 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = *(void **)(a1 + 32);
    BOOL v17 = v15;
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v16 aceId]);
    *(_DWORD *)buf = 136315650;
    BOOL v30 = "-[SRSiriViewController siriSessionDidReceiveCloseAssistantCommand:completion:]_block_invoke";
    __int16 v31 = 2112;
    uint64_t v32 = v16;
    __int16 v33 = 2112;
    uint64_t v34 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%s #tts delay enqueue dismissal command %@, aceId: %@",  buf,  0x20u);
  }

  uint64_t v19 = (void *)v5[1];
  uint64_t v21 = _NSConcreteStackBlock;
  uint64_t v22 = 3221225472LL;
  id v23 = sub_100024D2C;
  __int128 v24 = &unk_1000BA8E0;
  id v25 = *(id *)(a1 + 32);
  uint64_t v26 = v5;
  uint64_t v28 = *(void *)(a1 + 56);
  id v27 = *(id *)(a1 + 40);
  uint64_t v20 = objc_retainBlock(&v21);
  objc_msgSend(v19, "enqueueObject:", v20, v21, v22, v23, v24);

LABEL_13:
}

void sub_100024D2C(uint64_t a1)
{
  uint64_t v2 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(a1 + 32);
    BOOL v4 = v2;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 aceId]);
    int v9 = 136315650;
    uint64_t v10 = "-[SRSiriViewController siriSessionDidReceiveCloseAssistantCommand:completion:]_block_invoke";
    __int16 v11 = 2112;
    uint64_t v12 = v3;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s #tts performing delayed dismissal command to %@, aceId: %@",  (uint8_t *)&v9,  0x20u);
  }

  [*(id *)(a1 + 40) _dismissWithReason:*(void *)(a1 + 56)];
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6)
  {
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) aceId]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[SACommandSucceeded sruif_commandSucceededWithRefId:]( &OBJC_CLASS___SACommandSucceeded,  "sruif_commandSucceededWithRefId:",  v7));
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v8);
  }

void sub_100024F8C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_100024FB0(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v13 = WeakRetained;
    [WeakRetained _didReceiveAceCommand:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
    [v13 _didStartActionForAceCommand:*(void *)(a1 + 32)];
    [v13 _didCompleteActionForAceCommand:*(void *)(a1 + 32) success:1];
    id WeakRetained = v13;
    if (a2 != 3)
    {
      uint64_t v5 = objc_alloc(&OBJC_CLASS___SASRequestOptions);
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v13 _uiPresentationIdentifier]);
      BOOL v7 = -[SASRequestOptions initWithRequestSource:uiPresentationIdentifier:]( v5,  "initWithRequestSource:uiPresentationIdentifier:",  9LL,  v6);

      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v13 _requestOptions]);
      int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 originalRequestOptions]);
      if (v9)
      {
        -[SASRequestOptions setOriginalRequestOptions:](v7, "setOriginalRequestOptions:", v9);
      }

      else
      {
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v13 _requestOptions]);
        -[SASRequestOptions setOriginalRequestOptions:](v7, "setOriginalRequestOptions:", v10);
      }

      __int16 v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) aceId]);
      -[SASRequestOptions setServerCommandId:](v7, "setServerCommandId:", v11);

      -[SASRequestOptions setPronunciationRequest:](v7, "setPronunciationRequest:", 1LL);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) context]);
      -[SASRequestOptions setPronunciationContext:](v7, "setPronunciationContext:", v12);

      [v13 _startRequestWithOptions:v7];
      id WeakRetained = v13;
    }
  }
}

void sub_1000259B8(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
    sub_10006B2A8();
  }
}

void sub_100025CBC(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (*(void *)(a1 + 40))
  {
    id v10 = v5;
    if (a2)
    {
      id v6 = objc_alloc_init(&OBJC_CLASS___SACommandSucceeded);
    }

    else
    {
      id v6 = objc_alloc_init(&OBJC_CLASS___SACommandFailed);
      objc_msgSend(v6, "setErrorCode:", objc_msgSend(v10, "code"));
      BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v10 localizedDescription]);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Could not update the guide cache. %@",  v7));
      [v6 setReason:v8];
    }

    int v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) aceId]);
    [v6 setRefId:v9];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
    id v5 = v10;
  }
}

void sub_100026298(_Unwind_Exception *a1)
{
}

void sub_1000262B4(uint64_t a1)
{
  uint64_t v2 = objc_alloc_init(&OBJC_CLASS___SRPreSynthesisTask);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _pendingPreSynthesisTasks]);
  [v4 addObject:v2];

  -[SRPreSynthesisTask setPreSynthesizeTTSCommand:](v2, "setPreSynthesizeTTSCommand:", *(void *)(a1 + 32));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10002641C;
  v9[3] = &unk_1000BA9A0;
  objc_copyWeak(&v11, (id *)(a1 + 48));
  id v10 = *(id *)(a1 + 40);
  id v5 = objc_retainBlock(v9);
  -[SRPreSynthesisTask setCompletion:](v2, "setCompletion:", v5);
  id v8 = 0LL;
  unsigned __int8 v6 = -[SRPreSynthesisTask handlePreSynthesisCommandWithError:](v2, "handlePreSynthesisCommandWithError:", &v8);
  id v7 = v8;
  if ((v6 & 1) == 0 && os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
    sub_10006B384();
  }

  objc_destroyWeak(&v11);
}

void sub_100026404(_Unwind_Exception *a1)
{
}

void sub_10002641C(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue([v7 replyAceCommand]);
      (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
    }

    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _pendingPreSynthesisTasks]);
    [v6 removeObject:v7];
  }
}

uint64_t sub_100026C7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v4;
    uint64_t Name = SRUIFSpeechSynthesisResultGetName(a2);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(Name);
    int v9 = 136315394;
    id v10 = "-[SRSiriViewController siriSessionRequestsPlayPhaticWithCompletion:]_block_invoke";
    __int16 v11 = 2112;
    uint64_t v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s #phatic 8 %@", (uint8_t *)&v9, 0x16u);
  }

  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16LL))(*(void *)(a1 + 32), a2 != 2);
}

void sub_100026FD8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
    sub_10006B400(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  id v15 = objc_alloc_init(&OBJC_CLASS___SACommandFailed);
  if (*(void *)(a1 + 48))
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) aceId]);
    [v15 setRefId:v16];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }
}

void sub_100028590(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
    sub_10006B470();
  }
}

LABEL_34:
LABEL_35:
    goto LABEL_36;
  }

  uint64_t v26 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v71 = "-[SRSiriViewController _siriPresentation:speakTextForConversationItemIdentifier:delayed:]";
    v72 = 2112;
    v73 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "%s Not speaking conversation item:%@. Item doesn't exist in activeConversation.",  buf,  0x16u);
  }

LABEL_36:
}

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

void sub_100028E70(uint64_t a1)
{
  if ((objc_opt_respondsToSelector( *(void *)(a1 + 32),  "siriDidFinishActionsForConversationItemWithIdentifier:inConversation:") & 1) != 0)
  {
    if ([*(id *)(a1 + 40) containsItemWithIdentifier:*(void *)(a1 + 48)])
    {
      uint64_t v2 = *(void **)(a1 + 32);
      id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) identifier]);
      [v2 siriDidFinishActionsForConversationItemWithIdentifier:v3 inConversation:*(void *)(a1 + 40)];
    }

    else if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      sub_10006B4DC();
    }
  }

uint64_t sub_10002996C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_100029A10(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_10002A4EC(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_10002A76C(uint64_t a1, uint64_t a2)
{
  if (a2) {
    a2 = objc_claimAutoreleasedReturnValue(+[UIImage imageWithData:](&OBJC_CLASS___UIImage, "imageWithData:", a2));
  }
  id v3 = (id)a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10002ACB8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    uint64_t v26 = @"metricsContext";
    uint64_t v27 = v3;
    id v4 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v27,  &v26,  1LL));
  }

  else
  {
    id v4 = &__NSDictionary0__struct;
  }

  id v5 = (void **)(a1 + 56);
  id v6 = *(void **)(a1 + 56);
  *(void *)&double v7 = objc_opt_class(&OBJC_CLASS___SAUIAssistantUtteranceView, a2).n128_u64[0];
  if (objc_msgSend(v6, "isSubclassOfClass:", v8, v7))
  {
    uint64_t v10 = 7LL;
LABEL_12:
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_10002AEE4;
    v22[3] = &unk_1000BAA88;
    id v23 = *(id *)(a1 + 40);
    v25[1] = (id)v10;
    id v4 = v4;
    id v24 = v4;
    v25[2] = *(id *)(a1 + 64);
    objc_copyWeak(v25, (id *)(a1 + 48));
    dispatch_async(&_dispatch_main_q, v22);
    objc_destroyWeak(v25);

    goto LABEL_13;
  }

  uint64_t v11 = *v5;
  *(void *)&double v12 = objc_opt_class(&OBJC_CLASS___SACardSnippet, v9).n128_u64[0];
  if (objc_msgSend(v11, "isSubclassOfClass:", v13, v12))
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) aceObject]);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "siriui_eventInfo"));

    if (v16)
    {
      id v17 = [v16 mutableCopy];
      [v17 addEntriesFromDictionary:v4];
      id v18 = [v17 copy];

      id v4 = v18;
    }

    uint64_t v10 = 2LL;
    goto LABEL_12;
  }

  uint64_t v19 = *v5;
  *(void *)&double v20 = objc_opt_class(&OBJC_CLASS___SAUISnippet, v14).n128_u64[0];
  if (objc_msgSend(v19, "isSubclassOfClass:", v21, v20))
  {
    uint64_t v10 = 1LL;
    goto LABEL_12;
  }

  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
    sub_10006B548();
  }
LABEL_13:
}

void sub_10002AEE4(uint64_t a1)
{
  id v2 = objc_alloc(&OBJC_CLASS___AFMetrics);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) aceCommandIdentifier]);
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)(a1 + 64)));
  id v9 = [v2 initWithOriginalCommandId:v3 category:v4 eventInfo:v5 duration:v6];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _session]);
  [v8 recordUIMetrics:v9];
}

void sub_10002B0D8(id a1, NSError *a2)
{
  id v2 = a2;
  if (v2 && os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
    sub_10006B5B4();
  }
}

void sub_10002B1E8(id a1, NSError *a2)
{
  id v2 = a2;
  if (v2 && os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
    sub_10006B620();
  }
}

void sub_10002CAD4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, id location, char a35)
{
}

void sub_10002CB2C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = (id *)(a1 + 48);
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  id v8 = [WeakRetained _readoutResultFromTTSResult:a2 error:v6];

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v8;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_10002CB94(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = (id *)(a1 + 48);
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  id v8 = [WeakRetained _readoutResultFromTTSResult:a2 error:v6];

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v8;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_10002CBFC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained _readoutResultFromTitleResult:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) messageResult:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
    uint64_t v5 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      id v6 = v5;
      uint64_t Name = AFUIBulletinReadoutResultGetName(v4);
      id v8 = (void *)objc_claimAutoreleasedReturnValue(Name);
      int v22 = 136315394;
      id v23 = "-[SRSiriViewController siriSessionRequestsReadoutOfBulletin:completion:]_block_invoke";
      __int16 v24 = 2112;
      id v25 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "%s #cmas #carPlay Synthesis is complete. %@",  (uint8_t *)&v22,  0x16u);
    }

    [v3 _setReadingBulletinContentInCarPlayOutsideOfSiriSession:0];
    id v9 = *(void **)(*(void *)(a1 + 32) + 8LL);
    if (!v9)
    {
      uint64_t v10 = objc_alloc_init(&OBJC_CLASS___AFQueue);
      uint64_t v11 = *(void *)(a1 + 32);
      double v12 = *(void **)(v11 + 8);
      *(void *)(v11 + _Block_object_dispose((const void *)(v36 - 144), 8) = v10;

      id v9 = *(void **)(*(void *)(a1 + 32) + 8LL);
    }

    [v9 enqueueObject:&stru_1000BAB30];
    uint64_t v13 = *(void (**)(void))(*(void *)(a1 + 40) + 16LL);
  }

  else
  {
    uint64_t v14 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      sub_10006B6FC(v14, v15, v16, v17, v18, v19, v20, v21);
    }
    uint64_t v13 = *(void (**)(void))(*(void *)(a1 + 40) + 16LL);
  }

  v13();
}

void sub_10002CDAC(id a1)
{
  uint64_t v1 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v5 = "-[SRSiriViewController siriSessionRequestsReadoutOfBulletin:completion:]_block_invoke";
    _os_log_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEFAULT,  "%s #tts TTS completed after AFUIBulletinReadout. Deactivating AVAudioSession sharedInstance and notifying others on deactivation.",  buf,  0xCu);
  }

  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"));
  uint64_t v3 = 0LL;
  [v2 setActive:0 withOptions:1 error:&v3];
}

void sub_10002D37C(id a1, NSError *a2)
{
  id v2 = a2;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
    sub_10006B88C();
  }
}

void sub_10002E140(_Unwind_Exception *a1)
{
}

void sub_10002E174(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v13 = WeakRetained;
    if ((_DWORD)a2)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _completedCommandAppPunchOutIds]);
      [v6 removeAllObjects];

      uint64_t v7 = *(void *)(a1 + 32);
      id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) punchOutUri]);
      id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) appDisplayName]);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) bundleId]);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[SAUIAppPunchOutEvent sruif_appPunchOutEventWithRefId:URL:appDisplayName:bundleId:]( &OBJC_CLASS___SAUIAppPunchOutEvent,  "sruif_appPunchOutEventWithRefId:URL:appDisplayName:bundleId:",  v7,  v8,  v9,  v10));

      [v13 _performGenericAceCommand:v11 turnIdentifier:0 completion:0];
      uint64_t v5 = v13;
    }

    uint64_t v12 = *(void *)(a1 + 48);
    if (v12)
    {
      (*(void (**)(uint64_t, uint64_t))(v12 + 16))(v12, a2);
      uint64_t v5 = v13;
    }
  }
}

void sub_10002E27C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
    sub_10006BA64();
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_10002E2EC(id *a1, int a2)
{
  if (a2)
  {
    (*((void (**)(void))a1[5] + 2))();
  }

  else
  {
    unsigned __int8 v3 = [a1[4] appAvailableInStorefront];
    id v4 = a1[4];
    if ((v3 & 1) != 0)
    {
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472LL;
      v7[2] = sub_10002E434;
      v7[3] = &unk_1000BAC18;
      id v8 = v4;
      id v9 = a1[5];
      objc_copyWeak(&v10, a1 + 6);
      objc_msgSend(v8, "afui_populateStoreServicesData:", v7);
      objc_destroyWeak(&v10);
    }

    else
    {
      id v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "afui_punchOutAppNotAvailableViews"));
      id WeakRetained = objc_loadWeakRetained(a1 + 6);
      [WeakRetained _performGenericAceCommand:v6 turnIdentifier:0 completion:0];

      (*((void (**)(void))a1[5] + 2))();
    }
  }

void sub_10002E420(_Unwind_Exception *a1)
{
}

void sub_10002E434(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "afui_punchOutFailureViews"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 views]);
  id v4 = [v3 count];

  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained _performGenericAceCommand:v2 turnIdentifier:0 completion:0];

    id v6 = *(void **)(a1 + 32);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_10002E550;
    v7[3] = &unk_1000BABF0;
    objc_copyWeak(&v8, (id *)(a1 + 48));
    objc_msgSend(v6, "afui_getInstallAppPunchoutWithCompletion:", v7);
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
    objc_destroyWeak(&v8);
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }
}

void sub_10002E538(_Unwind_Exception *a1)
{
}

void sub_10002E550(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = a2;
    id v4 = objc_alloc_init(&OBJC_CLASS___SAUIAddViews);
    -[SAUIAddViews setDialogPhase:](v4, "setDialogPhase:", SAUIDialogPhaseCompletionValue);
    id v7 = v3;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v7, 1LL));

    -[SAUIAddViews setViews:](v4, "setViews:", v5);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _performGenericAceCommand:v4 turnIdentifier:0 completion:0];
  }

void sub_10002EE54(id a1, NSError *a2)
{
  id v2 = a2;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
    sub_10006BADC();
  }
}

void sub_10002EF30(_Unwind_Exception *a1)
{
}

void sub_10002EF4C(uint64_t a1, int a2)
{
  id v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained presentation]);

  if ((objc_opt_respondsToSelector(v5, "siriIsIdleAndQuietStatusDidChange:isAttending:") & 1) != 0)
  {
    id v6 = objc_loadWeakRetained(v3);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10002F0B0;
    v9[3] = &unk_1000BAC88;
    char v11 = a2;
    id v10 = v5;
    [v6 _fetchAttendingState:v9];
  }

  id v7 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v13 = "-[SRSiriViewController _checkAndUpdateSiriIdleAndQuietStatusIfNeeded]_block_invoke";
    __int16 v14 = 1024;
    int v15 = a2;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s Notifying presentation that Siri's active request options changed, siriIsIdleAndQuiet=%i",  buf,  0x12u);
  }

  id v8 = objc_loadWeakRetained(v3);
  [v8 _activeRequestOptionsDidChange];
}

id sub_10002F0B0(uint64_t a1, uint64_t a2)
{
  id v4 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(unsigned __int8 *)(a1 + 40);
    int v7 = 136315650;
    id v8 = "-[SRSiriViewController _checkAndUpdateSiriIdleAndQuietStatusIfNeeded]_block_invoke_2";
    __int16 v9 = 1024;
    int v10 = v5;
    __int16 v11 = 1024;
    int v12 = a2;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s #idleTimer Notifying presentation that Siri's idle and quiet status changed, siriIsIdleAndQuiet=%i isAttending: %i",  (uint8_t *)&v7,  0x18u);
  }

  return [*(id *)(a1 + 32) siriIsIdleAndQuietStatusDidChange:*(unsigned __int8 *)(a1 + 40) isAttending:a2];
}

void sub_10002F230(_Unwind_Exception *a1)
{
}

void sub_10002F24C(uint64_t a1, uint64_t a2)
{
  id v4 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    id v8 = "-[SRSiriViewController _scheduleInterruptedAudioResumingIfNeeded]_block_invoke";
    __int16 v9 = 1024;
    int v10 = a2;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s Scheduling interrupted audio to be resumed if needed, isAttending: %d",  (uint8_t *)&v7,  0x12u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained _resumesInterruptedAudioPlaybackForAttendingState:a2])
  {
    double v6 = 1.0;
    if ((_DWORD)a2) {
      double v6 = 0.25;
    }
    [WeakRetained _scheduleAudioResumptionAfterDelayInSec:v6];
  }
}

void sub_10002F48C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained && !WeakRetained[22] && [WeakRetained _isSiriIdleAndQuiet])
  {
    id v3 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      double v6 = "-[SRSiriViewController _scheduleAudioResumptionAfterDelayInSec:]_block_invoke";
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s Resuming interrupted audio",  (uint8_t *)&v5,  0xCu);
    }

    id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 _session]);
    [v4 resumeInterruptedAudioPlaybackIfNeeded];
  }
}

uint64_t sub_10002F934(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1LL);
  }
  return result;
}

uint64_t sub_10002FA98(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1LL);
  }
  return result;
}

void sub_100030180( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_1000301A4(uint64_t a1, int a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _notifyPromptedUserForInput];

    id v4 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      id v8 = "-[SRSiriViewController _startListenAfterSpeaking]_block_invoke";
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s #IntuitiveConversation - not starting Listen After Speaking request because we're already attending.",  (uint8_t *)&v7,  0xCu);
    }
  }

  else
  {
    int v5 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      id v8 = "-[SRSiriViewController _startListenAfterSpeaking]_block_invoke";
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s #IntuitiveConversation - Starting Listen After Speaking request",  (uint8_t *)&v7,  0xCu);
    }

    id v6 = objc_loadWeakRetained((id *)(a1 + 32));
    [v6 _startListenAfterSpeakingRequest];
  }

uint64_t sub_100030368(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_1000305F0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_100030614(uint64_t a1, int a2)
{
  id v4 = (os_log_s *)AFSiriLogContextConnection;
  BOOL v5 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v19 = "-[SRSiriViewController _startListenAfterSpeakingRequest]_block_invoke";
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s #tts TTS queue is empty. Starting new request.",  buf,  0xCu);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained _startRequestWithOptions:*(void *)(a1 + 32)];
  }

  else
  {
    if (v5)
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v19 = "-[SRSiriViewController _startListenAfterSpeakingRequest]_block_invoke";
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s #tts TTS queue is not empty. Scheduling new request after TTS completion.",  buf,  0xCu);
    }

    int v7 = *(void **)(*(void *)(a1 + 40) + 8LL);
    if (!v7)
    {
      id v8 = objc_alloc_init(&OBJC_CLASS___AFQueue);
      uint64_t v9 = *(void *)(a1 + 40);
      int v10 = *(void **)(v9 + 8);
      *(void *)(v9 + _Block_object_dispose((const void *)(v36 - 144), 8) = v8;

      int v7 = *(void **)(*(void *)(a1 + 40) + 8LL);
    }

    int v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472LL;
    __int16 v14 = sub_1000307F8;
    int v15 = &unk_1000BA730;
    objc_copyWeak(&v17, (id *)(a1 + 48));
    id v16 = *(id *)(a1 + 32);
    __int16 v11 = objc_retainBlock(&v12);
    objc_msgSend(v7, "enqueueObject:", v11, v12, v13, v14, v15);

    objc_destroyWeak(&v17);
  }

void sub_1000307DC(_Unwind_Exception *a1)
{
}

void sub_1000307F8(uint64_t a1)
{
  uint64_t v2 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    BOOL v5 = "-[SRSiriViewController _startListenAfterSpeakingRequest]_block_invoke";
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "%s #tts TTS completed. Start listening.",  (uint8_t *)&v4,  0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _startRequestWithOptions:*(void *)(a1 + 32)];
}

Class sub_100031DEC(uint64_t a1)
{
  int v4 = 0LL;
  if (!qword_1000D9B10)
  {
    __int128 v5 = off_1000BACD0;
    uint64_t v6 = 0LL;
    qword_1000D9B10 = _sl_dlopen(&v5, &v4);
    uint64_t v2 = v4;
    if (!qword_1000D9B10)
    {
      abort_report_np("%s", v4);
      goto LABEL_7;
    }

    if (v4) {
      goto LABEL_8;
    }
  }

  while (1)
  {
    Class result = objc_getClass("VTStateManager");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (char *)sub_10006BC9C();
LABEL_8:
    free(v2);
  }

  qword_1000D9B08 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

void sub_100031EE0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void sub_100031F0C(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_100031F18( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

  ;
}

  ;
}

  ;
}

void sub_100031F80( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_100031FB0(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_100031FBC( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

uint64_t sub_100031FE4()
{
  return v0;
}

id sub_100031FF0@<X0>(void *a1@<X1>, uint64_t a2@<X8>)
{
  *(void *)(v2 - 40) = a2;
  return a1;
}

  ;
}

void sub_100032010(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose((const void *)(v36 - 144), 8) = a1;
}

  ;
}

void sub_100032EDC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

uint64_t sub_100032F20(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100032F30(uint64_t a1)
{
}

void sub_100032F38(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v11 = a2;
  int v12 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) length] != 0;
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL)) {
    -[NSMutableString appendString:](v12, "appendString:");
  }
  uint64_t v13 = a3 - a5;
  if (a3 != a5)
  {
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a5, a3 - a5));
    -[NSMutableString appendString:](v12, "appendString:", v14);
  }

  -[NSMutableString appendString:](v12, "appendString:", v11);
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v12];
  uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = 0LL;

  uint64_t v17 = a6 - (v13 + a4);
  if (v17)
  {
    uint64_t v18 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
    uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8LL);
    uint64_t v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;

    uint64_t v21 = *(void **)(a1 + 32);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_1000330C0;
    v22[3] = &unk_1000BAD30;
    void v22[4] = *(void *)(a1 + 48);
    objc_msgSend(v21, "enumerateSubstringsInRange:options:usingBlock:", a3 + a4, v17, 1026, v22);
  }
}

id sub_1000330C0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) appendString:a2];
}

id sub_100033354(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) setAlpha:0.0];
}

void sub_10003336C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0LL;
}

id sub_1000333A8(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) setAlpha:1.0];
}

uint64_t sub_1000333C0(uint64_t result)
{
  *(_BYTE *)(*(void *)(result + 32) + 72LL) = 1;
  return result;
}

void sub_100033948(uint64_t a1)
{
  id v2 = objc_alloc(*(Class *)(a1 + 32));
  id v5 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _defaultURL]);
  id v3 = [v2 initWithURL:v5];
  int v4 = (void *)qword_1000D9B18;
  qword_1000D9B18 = (uint64_t)v3;
}

void sub_100033ADC(id a1)
{
  uint64_t v1 = (void *)qword_1000D9B28;
  qword_1000D9B28 = (uint64_t)&off_1000BEE08;
}

uint64_t sub_100033E00(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = 136315906;
    id v11 = "-[SRSiriPresentationPluginHost _rescanBundles]_block_invoke";
    __int16 v12 = 2114;
    id v13 = v5;
    __int16 v14 = 2114;
    uint64_t v15 = v9;
    __int16 v16 = 2114;
    id v17 = v6;
    _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%s Error encountered enumerating %{public}@ in plugin directory at %{public}@: %{public}@",  (uint8_t *)&v10,  0x2Au);
  }

  return 0LL;
}

void sub_10003427C(uint64_t a1, void *a2, void *a3)
{
  int v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = (id)objc_claimAutoreleasedReturnValue([a3 path]);
  [v4 setObject:v6 forKey:v5];
}

void sub_10003439C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class(&OBJC_CLASS___NSString, v7);
  if ((objc_opt_isKindOfClass(v5, v8) & 1) != 0)
  {
    objc_opt_class(&OBJC_CLASS___NSString, v9);
    if ((objc_opt_isKindOfClass(v6, v10) & 1) != 0)
    {
      id v11 = *(void **)(a1 + 32);
      __int16 v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  v6,  1LL));
      [v11 setObject:v12 forKey:v5];
    }

    else
    {
      __int16 v14 = (void *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
        sub_10006BD40(v14);
      }
    }
  }

  else
  {
    id v13 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      sub_10006BDC8(v13);
    }
  }
}

void sub_1000348A0( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

id sub_1000348B4(id a1)
{
  return a1;
}

uint64_t sub_1000348C8(uint64_t a1, uint64_t a2)
{
  return objc_opt_class(v2, a2);
}

id sub_1000348D4(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 assistantUILocalizedStringForKey:v1 table:0]);

  return v3;
}

uint64_t sub_100034934(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = [v4 count];
  v18[0] = 0LL;
  v18[1] = v18;
  v18[2] = 0x2020000000LL;
  v18[3] = 0LL;
  uint64_t v14 = 0LL;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000LL;
  char v17 = 1;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100034A4C;
  v9[3] = &unk_1000BAE60;
  id v6 = v4;
  id v10 = v6;
  id v11 = v18;
  __int16 v12 = &v14;
  id v13 = v5;
  [v3 enumerateObjectsUsingBlock:v9];
  uint64_t v7 = *((unsigned __int8 *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(v18, 8);

  return v7;
}

void sub_100034A28( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100034A4C(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v9 = a2;
  if ((objc_opt_isKindOfClass( v9,  [*(id *)(a1 + 32) objectAtIndex:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)]) & 1) == 0)
  {
    while (1)
    {
      unint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
      unint64_t v7 = *(void *)(a1 + 56) - 1LL;
      char isKindOfClass = objc_opt_isKindOfClass(v9, [*(id *)(a1 + 32) objectAtIndex:v6]);
      if ((isKindOfClass & 1) != 0 || v6 >= v7) {
        break;
      }
      ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
    }

    if ((isKindOfClass & 1) == 0 && v6 >= v7)
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
      *a4 = 1;
    }
  }
}

id sub_100034C38(void *a1)
{
  id v1 = a1;
  uint64_t v2 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v1 count]);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v3 = v1;
  id v4 = [v3 countByEnumeratingWithState:&v18 objects:v28 count:16];
  if (!v4)
  {

LABEL_18:
    id v14 = v3;
    goto LABEL_19;
  }

  id v6 = v4;
  char v7 = 0;
  uint64_t v8 = *(void *)v19;
  *(void *)&__int128 v5 = 136315650LL;
  __int128 v17 = v5;
  do
  {
    for (i = 0LL; i != v6; i = (char *)i + 1)
    {
      if (*(void *)v19 != v8) {
        objc_enumerationMutation(v3);
      }
      id v10 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
      uint64_t v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sr_sirilandShim", v17, (void)v18));
      if (v11)
      {
        id v12 = (id)v11;
        if ((void *)v11 == v10)
        {
          id v12 = v10;
        }

        else
        {
          id v13 = (os_log_s *)AFSiriLogContextConnection;
          if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v17;
            id v23 = "_SRSirilandShimAceViews";
            __int16 v24 = 2112;
            id v25 = v10;
            __int16 v26 = 2112;
            id v27 = v12;
            _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s Successfully shimmed AceView for the Siriland presentation:\n    AceView: %@\n    Shimmed AceView: %@",  buf,  0x20u);
          }

          char v7 = 1;
        }
      }

      else
      {
        id v12 = v10;
      }

      -[NSMutableArray addObject:](v2, "addObject:", v12);
    }

    id v6 = [v3 countByEnumeratingWithState:&v18 objects:v28 count:16];
  }

  while (v6);

  if ((v7 & 1) == 0) {
    goto LABEL_18;
  }
  id v14 = -[NSMutableArray copy](v2, "copy");
LABEL_19:
  uint64_t v15 = v14;

  return v15;
}

LABEL_42:
LABEL_43:
  BOOL v30 = v54;
LABEL_30:
  __int16 v31 = (void *)objc_claimAutoreleasedReturnValue(-[SAPersonAttribute object](self, "object"));
  uint64_t v32 = objc_alloc_init(&OBJC_CLASS___NSPersonNameComponents);
  __int16 v33 = (void *)objc_claimAutoreleasedReturnValue([v31 firstName]);
  -[NSPersonNameComponents setGivenName:](v32, "setGivenName:", v33);

  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v31 nickName]);
  -[NSPersonNameComponents setNickname:](v32, "setNickname:", v34);

  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v31 middleName]);
  -[NSPersonNameComponents setMiddleName:](v32, "setMiddleName:", v35);

  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v31 lastName]);
  -[NSPersonNameComponents setFamilyName:](v32, "setFamilyName:", v36);

  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v31 prefix]);
  -[NSPersonNameComponents setNamePrefix:](v32, "setNamePrefix:", v37);

  uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v31 suffix]);
  -[NSPersonNameComponents setNameSuffix:](v32, "setNameSuffix:", v38);

  uint64_t v39 = -[INPersonHandle initWithValue:type:label:]( objc_alloc(&OBJC_CLASS___INPersonHandle),  "initWithValue:type:label:",  v11,  v13,  v4);
  BOOL v40 = objc_alloc(&OBJC_CLASS___INPerson);
  char v41 = v4;
  uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue([v31 internalGUID]);
  id v43 = (void *)objc_claimAutoreleasedReturnValue([v31 aceId]);
  v44 = -[INPerson initWithPersonHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:]( v40,  "initWithPersonHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:",  v39,  v32,  v3,  0LL,  v42,  v43);

  return v44;
}

        if ((swift_isUniquelyReferenced_nonNull_native(v8) & 1) == 0) {
          uint64_t v8 = sub_10005C9AC(0LL, *((void *)v8 + 2) + 1LL, 1, v8);
        }
        id v25 = *((void *)v8 + 2);
        __int16 v24 = *((void *)v8 + 3);
        if (v25 >= v24 >> 1) {
          uint64_t v8 = sub_10005C9AC((char *)(v24 > 1), v25 + 1, 1, v8);
        }
        *((void *)v8 + 2) = v25 + 1;
        __int16 v26 = &v8[16 * v25];
        *((void *)v26 + 4) = 0x73616D6323LL;
        *((void *)v26 + 5) = 0xE500000000000000LL;
        if ((a1 & 0x40) == 0)
        {
LABEL_22:
          if ((a1 & 0x80) == 0) {
            goto LABEL_23;
          }
          goto LABEL_52;
        }

void sub_100036560(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class(&OBJC_CLASS___SAPhoneCallHistory, v7);
  if ((objc_opt_isKindOfClass(v5, v8) & 1) == 0) {
    goto LABEL_55;
  }
  uint64_t v96 = a1;
  id v98 = v5;
  id v9 = v5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 faceTime]);
  unsigned int v11 = [v10 BOOLValue];

  if (v11)
  {
    id v12 = objc_alloc_init((Class)&OBJC_CLASS___SFLocalImage);
    id v13 = v12;
    uint64_t v14 = 0LL;
  }

  else
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v9 outgoing]);
    unsigned int v16 = [v15 BOOLValue];

    if (!v16)
    {
      id v13 = objc_alloc_init(&OBJC_CLASS___SFImage);
      goto LABEL_8;
    }

    id v12 = objc_alloc_init((Class)&OBJC_CLASS___SFLocalImage);
    id v13 = v12;
    uint64_t v14 = 1LL;
  }

  [v12 setLocalImageType:v14];
  [v13 setIsTemplate:1];
LABEL_8:
  objc_msgSend(v13, "setSize:", 14.0, 14.0);
  [v13 setSource:2];
  v100 = v6;
  v97 = v13;
  [v6 setImage:v13];
  v99 = v9;
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v9 contact]);
  v101 = (void *)objc_claimAutoreleasedReturnValue([v17 _applicablePhone]);
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 _applicableEmail]);
  uint64_t v19 = objc_claimAutoreleasedReturnValue([v17 displayText]);
  __int128 v20 = (void *)v19;
  if (!v19) {
    uint64_t v19 = objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v90 = (void *)v19;
  v110[0] = v19;
  v95 = v17;
  v92 = (void *)objc_claimAutoreleasedReturnValue([v17 object]);
  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v92 fullName]);
  int v22 = v21;
  if (!v21) {
    int v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v110[1] = v22;
  id v23 = (void *)objc_claimAutoreleasedReturnValue([v101 number]);
  uint64_t v24 = UIFormattedPhoneNumberFromString();
  id v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  __int16 v26 = v25;
  if (!v25) {
    __int16 v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v110[2] = v26;
  v94 = v18;
  id v27 = (void *)objc_claimAutoreleasedReturnValue([v18 emailAddress]);
  uint64_t v28 = v27;
  if (!v27) {
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v110[3] = v28;
  id v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v110, 4LL));
  if (!v27) {

  }
  if (!v25) {
  if (!v21)
  }

  if (!v20) {
  __int128 v104 = 0u;
  }
  __int128 v105 = 0u;
  __int128 v102 = 0u;
  __int128 v103 = 0u;
  id v30 = v29;
  id v31 = [v30 countByEnumeratingWithState:&v102 objects:v109 count:16];
  if (v31)
  {
    id v33 = v31;
    uint64_t v34 = *(void *)v103;
    while (2)
    {
      for (i = 0LL; i != v33; i = (char *)i + 1)
      {
        if (*(void *)v103 != v34) {
          objc_enumerationMutation(v30);
        }
        uint64_t v36 = *(void **)(*((void *)&v102 + 1) + 8LL * (void)i);
        objc_opt_class(&OBJC_CLASS___NSNull, v32);
        if ((objc_opt_isKindOfClass(v36, v37) & 1) == 0 && [v36 length])
        {
          id v38 = v36;
          goto LABEL_35;
        }
      }

      id v33 = [v30 countByEnumeratingWithState:&v102 objects:v109 count:16];
      if (v33) {
        continue;
      }
      break;
    }
  }

  id v38 = 0LL;
LABEL_35:

  uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([v99 callCount]);
  uint64_t v40 = (uint64_t)[v39 integerValue];

  if (v40 >= 2)
  {
    uint64_t v41 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ (%ld)", v38, v40));

    id v38 = (id)v41;
  }

  id v42 = objc_alloc_init(&OBJC_CLASS___SFRichText);
  id v43 = objc_alloc_init(&OBJC_CLASS___SFFormattedText);
  [v43 setText:v38];
  [v43 setIsBold:1];
  v44 = (void *)objc_claimAutoreleasedReturnValue([v99 missed]);
  unsigned int v45 = [v44 BOOLValue];

  if (v45) {
    [v43 setTextColor:1];
  }
  id v108 = v43;
  id v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v108, 1LL));
  [v42 setFormattedTextPieces:v46];

  [v6 setLeadingText:v42];
  id v47 = (void *)objc_claimAutoreleasedReturnValue([v101 label]);
  uint64_t v48 = (uint64_t)v47;
  if (!v47 || ![v47 length])
  {
    __int16 v49 = (void *)v48;
    id v50 = (void *)objc_claimAutoreleasedReturnValue([v99 faceTime]);
    unsigned __int8 v51 = [v50 BOOLValue];

    if ((v51 & 1) != 0)
    {
      v52 = @"FACETIME_VIDEO_LABEL";
    }

    else
    {
      v53 = (void *)objc_claimAutoreleasedReturnValue([v99 faceTimeAudio]);
      unsigned int v54 = [v53 BOOLValue];

      if (v54) {
        v52 = @"FACETIME_AUDIO_LABEL";
      }
      else {
        v52 = @"UNKNOWN_PHONE_LABEL";
      }
    }

    id v55 = sub_1000348D4(v52);
    uint64_t v48 = objc_claimAutoreleasedReturnValue(v55);
  }

  v89 = v43;
  v91 = v42;
  v93 = v38;
  id v56 = objc_alloc_init(&OBJC_CLASS___SFRichText);
  id v57 = objc_alloc_init(&OBJC_CLASS___SFFormattedText);
  v88 = (void *)v48;
  [v57 setText:v48];
  [v57 setTextColor:0];
  v86 = v57;
  id v107 = v57;
  uint64_t v58 = 1LL;
  v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v107, 1LL));
  [v56 setFormattedTextPieces:v59];

  v87 = v56;
  [v6 setLeadingSubtitle:v56];
  [v6 setSeparatorStyle:3];
  v60 = (void *)objc_claimAutoreleasedReturnValue([v99 outgoing]);
  LOBYTE(v56) = [v60 BOOLValue];

  if ((v56 & 1) == 0)
  {
    v61 = (void *)objc_claimAutoreleasedReturnValue([v99 missed]);
    unsigned int v62 = [v61 BOOLValue];

    if (v62) {
      uint64_t v58 = 2LL;
    }
    else {
      uint64_t v58 = 3LL;
    }
  }

  v63 = (void *)objc_claimAutoreleasedReturnValue([v99 faceTime]);
  unsigned int v64 = [v63 BOOLValue];

  if (v64) {
    uint64_t v65 = 2LL;
  }
  else {
    uint64_t v65 = 1LL;
  }
  v66 = objc_alloc(&OBJC_CLASS___INCallRecord);
  v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  v68 = (void *)objc_claimAutoreleasedReturnValue([v67 UUIDString]);
  v69 = (void *)objc_claimAutoreleasedReturnValue([v99 callTime]);
  v70 = (void *)objc_claimAutoreleasedReturnValue([v99 contact]);
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "sr_inPerson"));
  v72 = (void *)objc_claimAutoreleasedReturnValue([v99 isNew]);
  v73 = -[INCallRecord initWithIdentifier:dateCreated:caller:callRecordType:callCapability:callDuration:unseen:]( v66,  "initWithIdentifier:dateCreated:caller:callRecordType:callCapability:callDuration:unseen:",  v68,  v69,  v71,  v58,  v65,  0LL,  v72);

  v74 = v73;
  [*(id *)(v96 + 32) addObject:v73];
  id v75 = objc_alloc_init(&OBJC_CLASS___SAPhoneCall);
  v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  v77 = (void *)objc_claimAutoreleasedReturnValue([v76 UUIDString]);
  [v75 setAceId:v77];

  v78 = (void *)objc_claimAutoreleasedReturnValue([v99 contact]);
  [v75 setCallRecipient:v78];

  v79 = (void *)objc_claimAutoreleasedReturnValue([v99 faceTime]);
  objc_msgSend(v75, "setFaceTime:", objc_msgSend(v79, "BOOLValue"));

  v80 = (void *)objc_claimAutoreleasedReturnValue([v99 faceTimeAudio]);
  objc_msgSend(v75, "setFaceTimeAudio:", objc_msgSend(v80, "BOOLValue"));

  [*(id *)(v96 + 40) addObject:v75];
  id v81 = objc_alloc_init((Class)&OBJC_CLASS___SFAbstractCommand);
  [v81 setType:1];
  id v82 = objc_alloc_init(&OBJC_CLASS___SFCommandValue);
  id v83 = objc_alloc_init(&OBJC_CLASS___SFReferentialCommand);
  v84 = (void *)objc_claimAutoreleasedReturnValue([v75 aceId]);
  [v83 setReferenceIdentifier:v84];

  [v82 setReferentialCommand:v83];
  [v81 setValue:v82];
  id v106 = v81;
  v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v106, 1LL));
  id v6 = v100;
  [v100 setCommands:v85];

  id v5 = v98;
LABEL_55:
}

void sub_1000373A0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_opt_class(&OBJC_CLASS___SAPhoneVoiceMail, v7);
  if ((objc_opt_isKindOfClass(v5, v8) & 1) != 0)
  {
    uint64_t v78 = a1;
    id v83 = v6;
    id v9 = v5;
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 contact]);
    id v82 = (void *)objc_claimAutoreleasedReturnValue([v10 _applicablePhone]);
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 displayText]);
    id v12 = v11;
    if (!v11) {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    }
    id v81 = v9;
    v93[0] = v12;
    v79 = v10;
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 object]);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 fullName]);
    uint64_t v15 = v14;
    if (!v14) {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    }
    id v80 = v5;
    v93[1] = v15;
    unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v82 number]);
    uint64_t v17 = UIFormattedPhoneNumberFromString();
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    uint64_t v19 = v18;
    if (!v18) {
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    }
    v93[2] = v19;
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v93, 3LL));
    if (!v18) {

    }
    if (!v14) {
    if (!v11)
    }

    __int128 v86 = 0u;
    __int128 v87 = 0u;
    __int128 v84 = 0u;
    __int128 v85 = 0u;
    id v21 = v20;
    id v23 = [v21 countByEnumeratingWithState:&v84 objects:v92 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v85;
      while (2)
      {
        for (i = 0LL; i != v23; i = (char *)i + 1)
        {
          if (*(void *)v85 != v24) {
            objc_enumerationMutation(v21);
          }
          __int16 v26 = *(void **)(*((void *)&v84 + 1) + 8LL * (void)i);
          objc_opt_class(&OBJC_CLASS___NSNull, v22);
          if ((objc_opt_isKindOfClass(v26, v27) & 1) == 0 && [v26 length])
          {
            id v23 = v26;
            goto LABEL_25;
          }
        }

        id v23 = [v21 countByEnumeratingWithState:&v84 objects:v92 count:16];
        if (v23) {
          continue;
        }
        break;
      }
    }

LABEL_25:
    id v28 = objc_alloc_init(&OBJC_CLASS___SFRichText);
    id v29 = objc_alloc_init(&OBJC_CLASS___SFFormattedText);
    v77 = v23;
    [v29 setText:v23];
    [v29 setIsBold:1];
    id v75 = v29;
    id v91 = v29;
    id v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v91, 1LL));
    [v28 setFormattedTextPieces:v30];

    v76 = v28;
    [v83 setLeadingText:v28];
    id v31 = (void *)objc_claimAutoreleasedReturnValue([v82 label]);
    uint64_t v32 = v31;
    if (!v31 || ![v31 length])
    {
      id v33 = sub_1000348D4(@"UNKNOWN_PHONE_LABEL");
      uint64_t v34 = objc_claimAutoreleasedReturnValue(v33);

      uint64_t v32 = (void *)v34;
    }

    id v35 = objc_alloc_init(&OBJC_CLASS___SFRichText);
    id v36 = objc_alloc_init(&OBJC_CLASS___SFFormattedText);
    [v36 setText:v32];
    [v36 setTextColor:0];
    v72 = v36;
    id v90 = v36;
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v90, 1LL));
    [v35 setFormattedTextPieces:v37];

    v73 = v35;
    [v83 setLeadingSubtitle:v35];
    uint64_t v38 = objc_claimAutoreleasedReturnValue([v81 length]);
    v71 = (void *)v38;
    if (v38)
    {
      uint64_t v39 = (void *)v38;
      uint64_t v40 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
      -[NSDateFormatter setDateFormat:](v40, "setDateFormat:", @"m:ss");
      id v41 = objc_alloc_init(&OBJC_CLASS___SFRichText);
      id v42 = objc_alloc_init(&OBJC_CLASS___SFFormattedText);
      id v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  (double)(uint64_t)[v39 integerValue]));
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v40, "stringFromDate:", v43));
      [v42 setText:v44];

      [v42 setTextColor:0];
      id v89 = v42;
      unsigned int v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v89, 1LL));
      [v41 setFormattedTextPieces:v45];

      [v83 setTrailingSubtitle:v41];
    }

    id v46 = (void *)objc_claimAutoreleasedReturnValue([v81 isNew]);
    unsigned int v47 = [v46 BOOLValue];

    v74 = v32;
    if (v47)
    {
      id v48 = objc_alloc_init((Class)&OBJC_CLASS___SFLocalImage);
      [v48 setLocalImageType:2];
    }

    else
    {
      id v48 = objc_alloc_init(&OBJC_CLASS___SFImage);
    }

    v70 = v48;
    objc_msgSend(v48, "setSize:", 14.0, 14.0);
    [v48 setSource:2];
    [v83 setImage:v48];
    [v83 setSeparatorStyle:3];
    __int16 v49 = objc_alloc(&OBJC_CLASS___INCallRecord);
    id v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    unsigned __int8 v51 = (void *)objc_claimAutoreleasedReturnValue([v50 UUIDString]);
    v52 = (void *)objc_claimAutoreleasedReturnValue([v81 callTime]);
    v53 = (void *)objc_claimAutoreleasedReturnValue([v81 contact]);
    unsigned int v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "sr_inPerson"));
    id v55 = (void *)objc_claimAutoreleasedReturnValue([v81 isNew]);
    id v56 = -[INCallRecord initWithIdentifier:dateCreated:caller:callRecordType:callCapability:callDuration:unseen:]( v49,  "initWithIdentifier:dateCreated:caller:callRecordType:callCapability:callDuration:unseen:",  v51,  v52,  v54,  5LL,  1LL,  0LL,  v55);

    [*(id *)(v78 + 32) addObject:v56];
    id v57 = (void *)objc_claimAutoreleasedReturnValue([v81 identifier]);
    uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue([v57 URLByDeletingPathExtension]);

    v59 = (void *)objc_claimAutoreleasedReturnValue([v58 lastPathComponent]);
    v60 = objc_alloc_init(&OBJC_CLASS___SAUIAppPunchOut);
    v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    unsigned int v62 = (void *)objc_claimAutoreleasedReturnValue([v61 UUIDString]);
    -[SAUIAppPunchOut setAceId:](v60, "setAceId:", v62);

    v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"vmshow:%@", v59));
    unsigned int v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v63));

    -[SAUIAppPunchOut setAppAvailableInStorefront:](v60, "setAppAvailableInStorefront:", 1LL);
    -[SAUIAppPunchOut setPunchOutUri:](v60, "setPunchOutUri:", v64);
    -[SAUIAppPunchOut setBundleId:](v60, "setBundleId:", @"com.apple.mobilephone");
    [*(id *)(v78 + 40) addObject:v60];
    id v65 = objc_alloc_init((Class)&OBJC_CLASS___SFAbstractCommand);
    [v65 setType:1];
    id v66 = objc_alloc_init(&OBJC_CLASS___SFCommandValue);
    id v67 = objc_alloc_init(&OBJC_CLASS___SFReferentialCommand);
    v68 = (void *)objc_claimAutoreleasedReturnValue(-[SAUIAppPunchOut aceId](v60, "aceId"));
    [v67 setReferenceIdentifier:v68];

    [v66 setReferentialCommand:v67];
    [v65 setValue:v66];
    id v88 = v65;
    v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v88, 1LL));
    [v83 setCommands:v69];

    id v6 = v83;
    id v5 = v80;
  }
}
}

    id v12 = (v24 - 1) & v24;
    uint64_t v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    unsigned int v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
    __int128 v18 = 16 * v15;
    uint64_t v19 = (uint64_t *)(*(void *)(v2 + 56) + v18);
    id v21 = *v19;
    __int128 v20 = v19[1];
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    uint64_t v22 = (void *)(*(void *)(v4 + 56) + v18);
    *uint64_t v22 = v21;
    v22[1] = v20;
    Class result = (void *)swift_bridgeObjectRetain(v20);
  }

  id v25 = v23 + 2;
  if (v25 >= v13) {
    goto LABEL_26;
  }
  uint64_t v24 = *(void *)(v6 + 8 * v25);
  if (v24)
  {
    id v9 = v25;
    goto LABEL_25;
  }

  while (1)
  {
    id v9 = v25 + 1;
    if (__OFADD__(v25, 1LL)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    uint64_t v24 = *(void *)(v6 + 8 * v9);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }

void sub_100038F10(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v11 = (id)objc_claimAutoreleasedReturnValue([v3 topObject]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v11 view]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 view]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 superview]);
  uint64_t v8 = *(void **)(a1 + 40);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) allObjects]);
  LOBYTE(v10) = 0;
  [v8 _performPushTransitionFromViewController:v11 andView:v5 toViewController:v4 andView:v6 inContainerView:v7 recentViewControllers:v9 tran sitionDuration:0.0 animated:v10 transitionCompletion:&stru_1000BAED0 completion:&stru_1000BAEF0];

  [*(id *)(a1 + 32) pushObject:v4];
}

void sub_1000393B8(_Unwind_Exception *a1)
{
}

void sub_1000393D4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _transitionWithContext:*(void *)(a1 + 32) animated:*(unsigned __int8 *)(a1 + 56) completion:*(void *)(a1 + 40)];
}

uint64_t sub_100039414(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100039684( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, id location)
{
}

id sub_1000396A0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) completeTransition:a2];
}

void sub_1000396AC(uint64_t a1, uint64_t a2)
{
  if ((_DWORD)a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _panGestureRecognizer]);

    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 view]);
    [v6 removeGestureRecognizer:v5];

    [*(id *)(a1 + 32) addGestureRecognizer:v5];
  }

  [*(id *)(a1 + 40) completeTransition:a2];
  [*(id *)(a1 + 48) insertSubview:*(void *)(a1 + 56) belowSubview:*(void *)(a1 + 64)];
  uint64_t v7 = (id *)(a1 + 72);
  id v8 = objc_loadWeakRetained(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 _navigationController]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 viewControllers]);
  id v11 = [v10 mutableCopy];
  [v8 _setRecentViewControllers:v11];

  id v12 = objc_loadWeakRetained(v7);
  [v12 setOperation:0];
}

void sub_10003988C(_Unwind_Exception *a1)
{
}

void sub_1000398A8(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 48) + 1LL;
  if (v1 < *(void *)(a1 + 56))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _recursivelyAnimateNextMultiPopKeyframe:v1 outOfTotalKeyframes:*(void *)(a1 + 56) transitionContext:*(void *)(a1 + 32)];
  }

void sub_100039A84( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

uint64_t sub_100039AA0(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 48))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _recentViewControllers]);
    [v3 removeLastObject];
  }

  id v4 = objc_loadWeakRetained((id *)(a1 + 40));
  [v4 setOperation:0];

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_100039D64(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) completeTransition:a2];
}

void sub_100039E8C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
}

uint64_t sub_100039EA8(uint64_t a1, uint64_t a2)
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) fromPlatteredCardView]);
  id v5 = v4;
  if ((_DWORD)a2)
  {
    [v4 setDarkenIntensity:0.0];

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _panGestureRecognizer]);

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 view]);
    [v7 removeGestureRecognizer:v5];

    id v8 = objc_loadWeakRetained((id *)(a1 + 56));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 _navigationController]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 viewControllers]);
    id v11 = [v10 count];

    if ((unint64_t)v11 >= 2)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) fromPlatteredCardView]);
      [v12 addGestureRecognizer:v5];
    }
  }

  else
  {
    [v4 setDarkenIntensity:1.0];
  }

  if (*(_BYTE *)(a1 + 64))
  {
    [*(id *)(a1 + 32) completeTransition:a2];
    id v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) viewForKey:UITransitionContextToViewKey]);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) viewForKey:UITransitionContextFromViewKey]);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) containerView]);
    [v15 insertSubview:v13 belowSubview:v14];

    id v16 = objc_loadWeakRetained((id *)(a1 + 56));
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 _navigationController]);
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 viewControllers]);
    id v19 = [v18 mutableCopy];
    [v16 _setRecentViewControllers:v19];
  }

  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

void sub_10003A35C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, id location)
{
}

id sub_10003A378(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  __int128 v3 = *(_OWORD *)(a1 + 80);
  v6[0] = *(_OWORD *)(a1 + 64);
  v6[1] = v3;
  v6[2] = *(_OWORD *)(a1 + 96);
  [v2 setTransform:v6];
  objc_msgSend( *(id *)(a1 + 40),  "setFrame:",  *(double *)(a1 + 112),  *(double *)(a1 + 120),  *(double *)(a1 + 128),  *(double *)(a1 + 136));
  id v4 = *(void **)(a1 + 32);
  [*(id *)(a1 + 48) percentComplete];
  objc_msgSend(v4, "setDarkenIntensity:");
  return objc_msgSend( *(id *)(a1 + 56),  "setFrame:",  *(double *)(a1 + 144),  *(double *)(a1 + 152),  *(double *)(a1 + 160),  *(double *)(a1 + 168));
}

void sub_10003A3EC(uint64_t a1, int a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    (*(void (**)(uint64_t, void))(v3 + 16))( v3,  a2 & ~[WeakRetained _isCancelling]);
  }

  id v6 = (id *)(a1 + 40);
  id v7 = objc_loadWeakRetained(v6);
  unsigned int v8 = [v7 _isCancelling];

  if (v8)
  {
    id v9 = objc_loadWeakRetained(v6);
    [v9 _setCancelling:0];
  }

uint64_t sub_10003A494(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_10003A4A0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10003AEDC( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

id sub_10003B1B4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) setAlpha:0.0];
}

id sub_10003B1CC(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) setHidden:1];
}

id sub_10003B1E4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) setAlpha:1.0];
}

LABEL_55:
  LOBYTE(v42) = 0;
  return v42;
}

void sub_10003C200( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, id a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29)
{
}

uint64_t sub_10003C238(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10003C248(uint64_t a1)
{
}

void sub_10003C250(uint64_t a1, void *a2)
{
}

void sub_10003C260(uint64_t a1, void *a2)
{
  uint64_t v3 = (id *)(a1 + 48);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained didFinishSynthesisRequest:*(void *)(a1 + 32) withInstrumentMetrics:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) error:v4];
}

void sub_10003C3C0(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) text]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 40) + 48) objectForKeyedSubscript:v2]);
  id v4 = v3;
  if (v3)
  {
    if (*(void *)(a1 + 48))
    {
      id v5 = (os_log_s *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
        sub_10006C608((uint64_t)v2, (uint64_t *)(a1 + 48), v5);
      }
      objc_msgSend( *(id *)(*(void *)(a1 + 40) + 40),  "replaceObjectAtIndex:withObject:",  objc_msgSend(v4, "unsignedIntegerValue"),  &off_1000BEC80);
    }

    else
    {
      id v14 = [v3 unsignedIntegerValue];
      uint64_t v15 = *(void **)(*(void *)(a1 + 40) + 40LL);
      [*(id *)(a1 + 56) audioDuration];
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v16 * 1000.0));
      [v15 replaceObjectAtIndex:v14 withObject:v17];
    }

    [*(id *)(*(void *)(a1 + 40) + 48) removeObjectForKey:v2];
    if (![*(id *)(*(void *)(a1 + 40) + 48) count])
    {
      uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 64LL);
      if (v18) {
        (*(void (**)(void))(v18 + 16))();
      }
    }
  }

  else
  {
    id v6 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      sub_10006C598(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
}

void sub_10003C5D8( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_10003CB50(id a1)
{
  id v1 = -[SASBoardServicesConfiguration _init](objc_alloc(&OBJC_CLASS___SASBoardServicesConfiguration), "_init");
  uint64_t v2 = (void *)qword_1000D9B38;
  qword_1000D9B38 = (uint64_t)v1;
}

void sub_10003D750( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_10003D778(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    [WeakRetained _editableUtteranceViewControllerDidDismiss:WeakRetained[2]];
    uint64_t v3 = v5;
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4)
    {
      (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
      uint64_t v3 = v5;
    }
  }
}

void sub_10003F0A8(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___VRXVisualResponseProvider);
  uint64_t v2 = (void *)qword_1000D9B48;
  qword_1000D9B48 = (uint64_t)v1;
}

LABEL_18:
    __int128 v20 = 0LL;
    goto LABEL_19;
  }

  objc_opt_class(&OBJC_CLASS___SAUIAssistantUtteranceView, v6);
  if ((objc_opt_isKindOfClass(v3, v10) & 1) != 0)
  {
    uint64_t v9 = &off_1000B9230;
    goto LABEL_12;
  }

  objc_opt_class(&OBJC_CLASS___SASSpeechRecognized, v11);
  if ((objc_opt_isKindOfClass(v3, v14) & 1) != 0
    || (objc_opt_class(&OBJC_CLASS___SASSpeechPartialResult, v15), (objc_opt_isKindOfClass(v3, v16) & 1) != 0)
    || (objc_opt_class(&OBJC_CLASS___SAUIUserUtteranceView, v17), (objc_opt_isKindOfClass(v3, v18) & 1) != 0))
  {
    uint64_t v9 = &off_1000B92A0;
  }

  else
  {
    objc_opt_class(&OBJC_CLASS___SAUIShowHelp, v19);
    if ((objc_opt_isKindOfClass(v3, v27) & 1) != 0) {
      goto LABEL_3;
    }
    objc_opt_class(&OBJC_CLASS___SAUIButton, v28);
    if ((objc_opt_isKindOfClass(v3, v29) & 1) != 0)
    {
      uint64_t v9 = off_1000B9210;
    }

    else
    {
      objc_opt_class(&OBJC_CLASS___SAUIListItem, v30);
      if ((objc_opt_isKindOfClass(v3, v31) & 1) == 0) {
        goto LABEL_18;
      }
      uint64_t v9 = off_1000B9218;
    }
  }

    id v30 = 0LL;
    id v31 = 0xE000000000000000LL;
    _StringGuts.grow(_:)(95LL);
    v19._countAndFlagsBits = 0xD000000000000054LL;
    v19._object = (void *)0x800000010008C010LL;
    String.append(_:)(v19);
    if (v4)
    {
      if (v6)
      {
        if (v4 >= 0) {
          id v28 = v4 & 0xFFFFFFFFFFFFFF8LL;
        }
        else {
          id v28 = v4;
        }
        swift_bridgeObjectRetain(v4);
        __int128 v20 = _CocoaArrayWrapper.endIndex.getter(v28);
        swift_bridgeObjectRelease(v4);
      }

      else
      {
        __int128 v20 = *(void *)((v4 & 0xFFFFFFFFFFFFF8LL) + 0x10);
      }
    }

    else
    {
      __int128 v20 = 0LL;
    }

    id v29 = v20;
    v21._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int,  &protocol witness table for Int);
    object = v21._object;
    String.append(_:)(v21);
    swift_bridgeObjectRelease(object);
    v23._countAndFlagsBits = 0x746E656D656C6520LL;
    v23._object = (void *)0xE900000000000073LL;
    String.append(_:)(v23);
    if (qword_1000D8A20 != -1) {
      swift_once(&qword_1000D8A20, sub_100066BF4);
    }
    uint64_t v24 = type metadata accessor for Logger(0LL);
    id v25 = sub_10004ADF0(v24, (uint64_t)qword_1000D9988);
    __int16 v26 = static os_log_type_t.info.getter(v25);
    sub_1000681D8(v26, 0x10uLL, 0x6D6D6F43656B616DLL, 0xEF293A5F28646E61LL, v30, v31);
    swift_bridgeObjectRelease(v31);
    goto LABEL_25;
  }

  if (a1 >= 0) {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFFF8LL;
  }
  else {
    uint64_t v2 = a1;
  }
  swift_bridgeObjectRetain(a1);
  uint64_t v3 = _CocoaArrayWrapper.endIndex.getter(v2);
  swift_bridgeObjectRelease(v4);
  if (v3 != 1) {
    goto LABEL_18;
  }
  swift_bridgeObjectRetain(v4);
  if (!_CocoaArrayWrapper.endIndex.getter(v2))
  {
    swift_bridgeObjectRelease(v4);
    goto LABEL_18;
  }

void sub_10004250C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_10004252C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained identifier]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[SASSignalServer serviceQuality](&OBJC_CLASS___SASSignalServer, "serviceQuality"));
    [v3 setServiceQuality:v8];

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[SASSignalServer interface](&OBJC_CLASS___SASSignalServer, "interface"));
    [v3 setInterface:v9];

    [v3 setInterfaceTarget:v6];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1000426B8;
    v15[3] = &unk_1000BB110;
    id v10 = v7;
    id v16 = v10;
    [v3 setInvalidationHandler:v15];
    [v3 setInterruptionHandler:&stru_1000BB150];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000427FC;
    v12[3] = &unk_1000BB178;
    objc_copyWeak(&v14, v4);
    id v11 = v10;
    id v13 = v11;
    [v3 setActivationHandler:v12];

    objc_destroyWeak(&v14);
  }
}

void sub_1000426A4(_Unwind_Exception *a1)
{
}

void sub_1000426B8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    uint64_t v7 = "-[SiriQuickTypeGestureSource configureConnection]_block_invoke_2";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s #activation BSServiceConnection Invalidated %@",  (uint8_t *)&v6,  0x16u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 remoteTarget]);
  [v5 unregisterNonButtonSourceWithType:&off_1000BEC98 withUUID:*(void *)(a1 + 32)];
}

void sub_1000427A4(id a1, BSServiceConnectionContext *a2)
{
  uint64_t v2 = a2;
  id v3 = (os_log_s *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
    sub_10006C758((uint64_t)v2, v3);
  }
  -[BSServiceConnectionContext activate](v2, "activate");
}

void sub_1000427FC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    int v6 = (os_unfair_lock_s *)&WeakRetained[OBJC_IVAR___SiriActivationSource__lock];
    os_unfair_lock_lock(v6);
    uint64_t v7 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315394;
      id v10 = "-[SiriQuickTypeGestureSource configureConnection]_block_invoke";
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s #activation BSServiceConnection Activated %@",  (uint8_t *)&v9,  0x16u);
    }

    __int16 v8 = (void *)objc_claimAutoreleasedReturnValue([v3 remoteTarget]);
    [v8 registerNonButtonSourceWithType:&off_1000BEC98 withUUID:*(void *)(a1 + 32)];

    os_unfair_lock_unlock(v6);
  }
}

void sub_100042A70( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_100042A98(uint64_t a1)
{
  id WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = (os_unfair_lock_s *)&WeakRetained[OBJC_IVAR___SiriActivationSource__lock];
    uint64_t v4 = WeakRetained;
    os_unfair_lock_lock(v2);
    id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)&v4[OBJC_IVAR___SiriActivationSource__connection] remoteTarget]);
    [v3 cancelPrewarmForFirstTapOfQuickTypeToSiriGesture];

    os_unfair_lock_unlock(v2);
    id WeakRetained = v4;
  }
}

void sub_100042D08( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_100042D44(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _endBackgroundTask];
}

void sub_100043440( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_100043464(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    --WeakRetained[2];
  }
}

void sub_100044348(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (os_log_s *)AFSiriLogContextConnection;
  BOOL v5 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v11 = 136315650;
      id v12 = "+[SRNotificationUtility _postNotificationRequest:notificationCenter:destinations:]_block_invoke";
      __int16 v13 = 2112;
      uint64_t v14 = v6;
      __int16 v15 = 2112;
      id v16 = v3;
      uint64_t v7 = "%s Failed to post notification %@ with error %@";
      __int16 v8 = v4;
      uint32_t v9 = 32;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v11, v9);
    }
  }

  else if (v5)
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v11 = 136315394;
    id v12 = "+[SRNotificationUtility _postNotificationRequest:notificationCenter:destinations:]_block_invoke";
    __int16 v13 = 2112;
    uint64_t v14 = v10;
    uint64_t v7 = "%s Posted notification %@";
    __int16 v8 = v4;
    uint32_t v9 = 22;
    goto LABEL_6;
  }
}

void sub_100045750( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100045774(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v9 = a2;
  if ((objc_opt_isKindOfClass( v9,  [*(id *)(a1 + 32) objectAtIndex:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)]) & 1) == 0)
  {
    while (1)
    {
      unint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
      unint64_t v7 = *(void *)(a1 + 56) - 1LL;
      char isKindOfClass = objc_opt_isKindOfClass(v9, [*(id *)(a1 + 32) objectAtIndex:v6]);
      if ((isKindOfClass & 1) != 0 || v6 >= v7) {
        break;
      }
      ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
    }

    if ((isKindOfClass & 1) == 0 && v6 >= v7)
    {
      *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
      *a4 = 1;
    }
  }
}

void sub_100045DBC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100045E04(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 _convertedCardSections]);
  if ([v4 count])
  {
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v5 = v4;
    id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v18;
      do
      {
        id v9 = 0LL;
        do
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * (void)v9), "setSeparatorStyle:", 4, (void)v17);
          id v9 = (char *)v9 + 1;
        }

        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }

      while (v7);
    }

    objc_opt_class(&OBJC_CLASS___SAGKSourceLinkPod, v10);
    char isKindOfClass = objc_opt_isKindOfClass(v3, v11);
    uint64_t v13 = *(void **)(a1 + 32);
    if ((isKindOfClass & 1) != 0)
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexSet indexSetWithIndex:]( &OBJC_CLASS___NSIndexSet,  "indexSetWithIndex:",  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL)));
      [v13 insertObjects:v5 atIndexes:v14];

      *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
    }

    else
    {
      [*(id *)(a1 + 32) addObjectsFromArray:v5];
    }

    objc_opt_class(&OBJC_CLASS___SAGKSummaryPod, v15);
    if ((objc_opt_isKindOfClass(v3, v16) & 1) != 0) {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) count];
    }
  }
}

void sub_10004615C(_Unwind_Exception *a1)
{
}

void sub_100046178(uint64_t a1)
{
  id WeakRetained = (unsigned int *)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _cleanupAllViews];
    uint64_t v4 = -[SRSiriViewController initWithNibName:bundle:]( objc_alloc(&OBJC_CLASS___SRSiriViewController),  "initWithNibName:bundle:",  0LL,  0LL);
    id v5 = (void *)*((void *)v3 + 1);
    *((void *)v3 + 1) = v4;

    id v6 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = (void *)*((void *)v3 + 1);
      int v19 = 136315394;
      __int128 v20 = "-[SRViewController setUpViews]_block_invoke";
      __int16 v21 = 2048;
      uint64_t v22 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s Created new SRSiriViewController (%p)",  (uint8_t *)&v19,  0x16u);
    }

    [v3 addChildViewController:*((void *)v3 + 1)];
    [*((id *)v3 + 1) didMoveToParentViewController:v3];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 view]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([*((id *)v3 + 1) view]);
    [v8 addSubview:v9];

    uint64_t v10 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = v3[4];
      uint64_t v12 = v10;
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v11));
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v3[4] + 1));
      int v19 = 136315650;
      __int128 v20 = "-[SRViewController setUpViews]_block_invoke";
      __int16 v21 = 2112;
      uint64_t v22 = v13;
      __int16 v23 = 2112;
      uint64_t v24 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%s About to increment _expectedTeardownCounter from %@ to %@",  (uint8_t *)&v19,  0x20u);
    }

    int v15 = v3[4];
    v3[4] = v15 + 1;
    if (v15 <= -2)
    {
      uint64_t v16 = (os_log_s *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
        sub_10006C868(v16);
      }
      v3[4] = 1;
    }

    __int128 v17 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 136315138;
      __int128 v20 = "-[SRViewController setUpViews]_block_invoke";
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%s Added SRSiriViewController to the view hierarchy in Siri.app",  (uint8_t *)&v19,  0xCu);
    }

    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( +[SiriSharedUIReplayUtilityWrapper sharedInstance]( &OBJC_CLASS___SiriSharedUIReplayUtilityWrapper,  "sharedInstance"));
    [v18 addReplayControlTo:*(void *)(a1 + 32)];
  }
}

void sub_1000464C0(_Unwind_Exception *a1)
{
}

void sub_1000464DC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      id v3 = v2;
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained childViewControllers]);
      id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v4 count]));
      *(_DWORD *)buf = 136315394;
      __int16 v21 = "-[SRViewController _cleanupAllViews]_block_invoke";
      __int16 v22 = 2112;
      __int16 v23 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s About to remove all SRSiriViewControllers from the view hierarchy in Siri.app - number of children: %@",  buf,  0x16u);
    }

    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "childViewControllers", 0));
    id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
          [v11 willMoveToParentViewController:0];
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 view]);
          [v12 removeFromSuperview];

          [v11 removeFromParentViewController];
        }

        id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }

      while (v8);
    }

    uint64_t v13 = (void *)WeakRetained[1];
    WeakRetained[1] = 0LL;

    uint64_t v14 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v21 = "-[SRViewController _cleanupAllViews]_block_invoke";
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s Removed all SRSiriViewControllers from the view hierarchy in Siri.app",  buf,  0xCu);
    }
  }
}

void sub_1000467A0(_Unwind_Exception *a1)
{
}

void sub_1000467BC(uint64_t a1)
{
  id WeakRetained = (unsigned int *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = WeakRetained[4];
      uint64_t v4 = v2;
      id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v3));
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", WeakRetained[4] - 1));
      int v10 = 136315650;
      uint64_t v11 = "-[SRViewController tearDownViews]_block_invoke";
      __int16 v12 = 2112;
      uint64_t v13 = v5;
      __int16 v14 = 2112;
      __int128 v15 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s About to decrement _expectedTeardownCounter from %@ to %@",  (uint8_t *)&v10,  0x20u);
    }

    int v7 = WeakRetained[4];
    WeakRetained[4] = v7 - 1;
    if (v7 == 1)
    {
      uint64_t v9 = (os_log_s *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136315138;
        uint64_t v11 = "-[SRViewController tearDownViews]_block_invoke";
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s Expected teardown counter hit 0, calling _cleanupAllViews",  (uint8_t *)&v10,  0xCu);
      }

      [WeakRetained _cleanupAllViews];
    }

    else if (v7 <= 0)
    {
      id v8 = (os_log_s *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136315138;
        uint64_t v11 = "-[SRViewController tearDownViews]_block_invoke";
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s We received more calls to tearDownViews than setupViews - resetting counter to 0.",  (uint8_t *)&v10,  0xCu);
      }

      WeakRetained[4] = 0;
    }
  }
}

LABEL_6:
    id v8 = v6;
LABEL_7:
    a4 = (unint64_t)v8;
    goto LABEL_8;
  }

  if (a4 == 2)
  {
    if ([a1 _alwaysPrintSiriResponse])
    {
      int v10 = (os_log_s *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = 136315138;
        __int16 v14 = "+[SRModeDialogTransformer _transformLegacyAddViews:forMode:]";
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s #modes alwaysPrintSiriResponse = YES",  (uint8_t *)&v13,  0xCu);
      }

      uint64_t v11 = v6;
    }

    else
    {
      uint64_t v11 = (id)objc_claimAutoreleasedReturnValue([a1 _removeRedundantUtteranceViewsFromAddViews:v6 forMode:2]);
    }

    __int16 v12 = v11;
    a4 = objc_claimAutoreleasedReturnValue([a1 _removeSpeakableTextFromAddViews:v11 forMode:2]);
  }

void sub_1000473F4(uint64_t a1, uint64_t a2)
{
  *(void *)&double v2 = objc_opt_class(*(void *)(a1 + 32), a2).n128_u64[0];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", v3, v2));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 pathForResource:@"ModesConfiguration" ofType:@"plist"]);

  uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfFile:](&OBJC_CLASS___NSDictionary, "dictionaryWithContentsOfFile:", v5));
  int v7 = (void *)qword_1000D9B60;
  qword_1000D9B60 = v6;

  if (!qword_1000D9B60)
  {
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      sub_10006C98C();
    }
    id v8 = (void *)qword_1000D9B60;
    qword_1000D9B60 = (uint64_t)&__NSDictionary0__struct;
  }
}

void sub_10004753C(uint64_t a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _configurationDictionary]);
  double v2 = (void *)objc_claimAutoreleasedReturnValue([v1 objectForKeyedSubscript:@"redundantDUCs"]);

  uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v2 count]));
  uint64_t v4 = (void *)qword_1000D9B70;
  qword_1000D9B70 = v3;

  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v5 = v2;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = (void *)qword_1000D9B70;
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * (void)v9), "lowercaseString", (void)v12));
        [v10 addObject:v11];

        uint64_t v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v7);
  }
}

uint64_t start(int a1, char **a2)
{
  uint64_t v4 = objc_autoreleasePoolPush();
  id v6 = (objc_class *)objc_opt_class(&OBJC_CLASS___SRApplication, v5);
  id v7 = NSStringFromClass(v6);
  uint64_t v8 = (NSString *)objc_claimAutoreleasedReturnValue(v7);
  int v10 = (objc_class *)objc_opt_class(&OBJC_CLASS___SRAppDelegate, v9);
  uint64_t v11 = NSStringFromClass(v10);
  __int128 v12 = (NSString *)objc_claimAutoreleasedReturnValue(v11);
  uint64_t v13 = UIApplicationMain(a1, a2, v8, v12);

  objc_autoreleasePoolPop(v4);
  return v13;
}

void sub_100049DBC(_Unwind_Exception *a1)
{
}

void sub_100049DE0(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class(&OBJC_CLASS___AFUIMutableSceneClientSettings, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0) {
    id v6 = v3;
  }
  else {
    id v6 = 0LL;
  }
  id v7 = v6;
  if (v7)
  {
    id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      uint64_t v9 = (void *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = WeakRetained[1];
        uint64_t v11 = v9;
        unsigned int v12 = [v10 _contextId];
        id v13 = WeakRetained[1];
        int v16 = 136315650;
        __int128 v17 = "-[SRAppDelegate _updateDeferral]_block_invoke";
        __int16 v18 = 1024;
        unsigned int v19 = v12;
        __int16 v20 = 2048;
        id v21 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s updating contextID (%u) on window (%p) for HID deferral",  (uint8_t *)&v16,  0x1Cu);
      }

      id v14 = WeakRetained[1];
      if (v14)
      {
        if (![v14 _contextId])
        {
          __int128 v15 = (os_log_s *)AFSiriLogContextConnection;
          if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
            sub_10006CA00(v15);
          }
        }
      }

      objc_msgSend(v7, "setClientWindowContextID:", objc_msgSend(WeakRetained[1], "_contextId"));
    }
  }
}

void sub_10004A3CC()
{
  id v1 = v0;
  v21.receiver = v0;
  v21.super_class = (Class)type metadata accessor for SRCarPlayCardViewController();
  objc_msgSendSuper2(&v21, "viewDidLoad");
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC4Siri27SRCarPlayCardViewController_cardViewController];
  if (v2)
  {
    id v3 = v2;
    id v4 = [v0 view];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = type metadata accessor for SRCarPlayScrollView();
      uint64_t v7 = swift_dynamicCastClass(v5, v6);
      if (v7)
      {
        uint64_t v8 = (char *)v7;
        [v3 willMoveToParentViewController:v1];
        [v1 addChildViewController:v3];
        id v9 = [v3 view];
        sub_100060130(v9, 0);

        [v3 didMoveToParentViewController:v1];
        [v3 formSheetSize];
        id v10 = (double *)&v8[OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_snippetSize];
        *(void *)id v10 = v11;
        v10[1] = v12;
        [*(id *)&v8[OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_heightConstraint] setConstant:v12];
        [*(id *)&v8[OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_widthConstraint] setConstant:*v10];
        [*(id *)&v8[OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_snippetHeightConstraint] setConstant:v10[1]];
        [v8 setNeedsUpdateConstraints];
        id v13 = *(void **)&v1[OBJC_IVAR____TtC4Siri27SRCarPlayCardViewController_cardSnippet];
        id v14 = v5;
        id v15 = [v13 referencedCommands];
        if (!v15)
        {
          __break(1u);
          return;
        }

        int v16 = v15;
        uint64_t v17 = sub_10004A8E8(&qword_1000D8C20);
        uint64_t v18 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v16, v17);

        if ((unint64_t)v18 >> 62)
        {
          if (v18 < 0) {
            uint64_t v20 = v18;
          }
          else {
            uint64_t v20 = v18 & 0xFFFFFFFFFFFFFF8LL;
          }
          swift_bridgeObjectRetain(v18);
          uint64_t v19 = _CocoaArrayWrapper.endIndex.getter(v20);
          swift_bridgeObjectRelease(v18);
        }

        else
        {
          uint64_t v19 = *(void *)((v18 & 0xFFFFFFFFFFFFF8LL) + 0x10);
        }

        swift_bridgeObjectRelease(v18);
        [v8 setUserInteractionEnabled:v19 != 0];
      }
    }
  }

void sub_10004A740()
{
  swift_unknownObjectRelease(*(void *)(v0 + OBJC_IVAR____TtC4Siri27SRCarPlayCardViewController_delegate));
}

id sub_10004A79C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SRCarPlayCardViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t variable initialization expression of SiriQuickTypeGestureActivationManager.previousFaceDetectionResult()
{
  return 0LL;
}

uint64_t variable initialization expression of SiriQuickTypeGestureActivationManager.latestFaceDetectionResultFuture@<X0>( uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10004A8E8(&qword_1000D8A30);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56LL))(a1, 1LL, 1LL, v2);
}

uint64_t sub_10004A8E8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t variable initialization expression of SiriQuickTypeGestureActivationManager.isFaceDetectionInFlight()
{
  return 0LL;
}

id variable initialization expression of SiriQuickTypeGestureActivationManager.attentionAwarenessClient()
{
  id v0 = [objc_allocWithZone(AWAttentionAwarenessClient) init];
  id v1 = [objc_allocWithZone(AWAttentionAwarenessConfiguration) init];
  NSString v2 = String._bridgeToObjectiveC()();
  [v1 setIdentifier:v2];

  [v1 setEventMask:128];
  [v0 setConfiguration:v1];

  return v0;
}

double variable initialization expression of SRFeedbackButton.diameter()
{
  return 50.0;
}

uint64_t type metadata accessor for SRCarPlayCardViewController()
{
  return objc_opt_self(&OBJC_CLASS____TtC4Siri27SRCarPlayCardViewController);
}

__n128 initializeBufferWithCopyOfBuffer for FaceDetectionObservation(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_10004AA28(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t sub_10004AA48(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + _Block_object_dispose((const void *)(v9 - 80), 8) = 0LL;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }

  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }

  *(_BYTE *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

void type metadata accessor for SiriUISiriEvent(uint64_t a1)
{
}

void type metadata accessor for SiriUISiriState(uint64_t a1)
{
}

void *sub_10004AAAC@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(_BYTE *)(a2 + _Block_object_dispose((const void *)(v9 - 80), 8) = 0;
  return result;
}

void sub_10004AABC(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_10004AAC8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for UUID(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v6 = [(id)objc_opt_self(SRUIFInstrumentationManager) sharedManager];
  id v7 = [v6 currentInstrumentationTurnContext];

  id v8 = [v7 turnIdentifier];
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(v8);

  id v9 = [objc_allocWithZone(VRXSnippetRenderingContext) initWithRenderingEvent:a1];
  Class isa = UUID._bridgeToObjectiveC()().super.isa;
  [v9 emitWithTurnIdentifier:isa];

  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

void sub_10004ABF4(double a1, double a2)
{
  id v5 = [v2 view];
  if (v5)
  {
    id v16 = v5;
    uint64_t v6 = type metadata accessor for SRCarPlayScrollView();
    uint64_t v7 = swift_dynamicCastClass(v16, v6);
    if (v7)
    {
      id v8 = (char *)v7;
      uint64_t v18 = 0LL;
      unint64_t v19 = 0xE000000000000000LL;
      _StringGuts.grow(_:)(29LL);
      v9._object = (void *)0x8000000100089600LL;
      v9._countAndFlagsBits = 0xD00000000000001BLL;
      String.append(_:)(v9);
      *(double *)uint64_t v17 = a1;
      *(double *)&v17[1] = a2;
      type metadata accessor for CGSize(0LL);
      _print_unlocked<A, B>(_:_:)( v17,  &v18,  v10,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
      uint64_t v11 = v18;
      unint64_t v12 = v19;
      if (qword_1000D8A20 != -1) {
        swift_once(&qword_1000D8A20, sub_100066BF4);
      }
      uint64_t v13 = type metadata accessor for Logger(0LL);
      sub_10004ADF0(v13, (uint64_t)qword_1000D9988);
      os_log_type_t v14 = static os_log_type_t.info.getter();
      sub_1000681D8(v14, 0x10uLL, 0xD00000000000003DLL, 0x80000001000895C0LL, v11, v12);
      swift_bridgeObjectRelease(v12);
      id v15 = (double *)&v8[OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_snippetSize];
      double *v15 = a1;
      v15[1] = a2;
      [*(id *)&v8[OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_heightConstraint] setConstant:a2];
      [*(id *)&v8[OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_widthConstraint] setConstant:*v15];
      [*(id *)&v8[OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_snippetHeightConstraint] setConstant:v15[1]];
      [v8 setNeedsUpdateConstraints];
    }

    else
    {
    }
  }

uint64_t sub_10004ADF0(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

void type metadata accessor for VRXHostMaterial(uint64_t a1)
{
}

void type metadata accessor for State(uint64_t a1)
{
}

void sub_10004AE30(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata(0LL, a3);
    if (!v5) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }

CALayerCornerCurve sub_10004AE7C()
{
  qword_1000DA5B0 = (uint64_t)kCACornerCurveContinuous;
  return kCACornerCurveContinuous;
}

void sub_10004AE94()
{
  id v0 = [(id)objc_opt_self(UIColor) blackColor];
  id v1 = [v0 CGColor];

  qword_1000DA5B8 = (uint64_t)v1;
}

double sub_10004AEF4()
{
  double result = 0.0;
  xmmword_1000DA5C0 = xmmword_100082D00;
  return result;
}

double sub_10004AF08()
{
  double result = kCALayerCornerRadiusAutomaticPill;
  qword_1000DA5D0 = kCALayerCornerRadiusAutomaticPill;
  return result;
}

id sub_10004AF20()
{
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = [(id)objc_opt_self(CASpringAnimation) animationWithKeyPath:v0];

  id v2 = v1;
  Class isa = Double._bridgeToObjectiveC()().super.super.isa;
  [v2 setFromValue:isa];

  id v4 = v2;
  Class v5 = Double._bridgeToObjectiveC()().super.super.isa;
  [v4 setToValue:v5];

  [v4 setStiffness:1000.0];
  [v4 setMass:3.0];
  [v4 setDamping:500.0];
  [v4 setDuration:0.5];
  [v4 setFillMode:kCAFillModeBoth];
  return v4;
}

id sub_10004B060()
{
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = [(id)objc_opt_self(CASpringAnimation) animationWithKeyPath:v0];

  id v2 = v1;
  Class isa = Double._bridgeToObjectiveC()().super.super.isa;
  [v2 setFromValue:isa];

  id v4 = v2;
  Class v5 = Double._bridgeToObjectiveC()().super.super.isa;
  [v4 setToValue:v5];

  [v4 setStiffness:300.0];
  [v4 setMass:2.0];
  [v4 setDamping:50.0];
  [v4 setDuration:0.8];
  [v4 setFillMode:kCAFillModeBoth];
  return v4;
}

id sub_10004B1A0()
{
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = [(id)objc_opt_self(CASpringAnimation) animationWithKeyPath:v0];

  id v2 = v1;
  Class isa = Double._bridgeToObjectiveC()().super.super.isa;
  [v2 setFromValue:isa];

  id v4 = v2;
  Class v5 = Double._bridgeToObjectiveC()().super.super.isa;
  [v4 setToValue:v5];

  [v4 setStiffness:1000.0];
  [v4 setMass:3.0];
  [v4 setDamping:500.0];
  [v4 setDuration:0.5];
  [v4 setFillMode:kCAFillModeBoth];
  return v4;
}

id sub_10004B2EC()
{
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = [(id)objc_opt_self(CASpringAnimation) animationWithKeyPath:v0];

  id v2 = v1;
  Class isa = Double._bridgeToObjectiveC()().super.super.isa;
  [v2 setFromValue:isa];

  id v4 = v2;
  Class v5 = Double._bridgeToObjectiveC()().super.super.isa;
  [v4 setToValue:v5];

  [v4 setStiffness:300.0];
  [v4 setMass:2.0];
  [v4 setDamping:50.0];
  [v4 setDuration:0.8];
  [v4 setFillMode:kCAFillModeBoth];
  return v4;
}

uint64_t initializeBufferWithCopyOfBuffer for SRCarPlaySiriUnavailableView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

uint64_t destroy for SRCarPlaySiriUnavailableView(void *a1)
{
  return swift_unknownObjectWeakDestroy(a1 + 12);
}

uint64_t initializeWithCopy for SRCarPlaySiriUnavailableView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + _Block_object_dispose((const void *)(v9 - 80), 8) = v4;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v5;
  uint64_t v7 = *(void *)(a2 + 40);
  *(void *)(a1 + 40) = v7;
  *(_BYTE *)(a1 + 4_Block_object_dispose((const void *)(v9 - 80), 8) = *(_BYTE *)(a2 + 48);
  uint64_t v9 = *(void *)(a2 + 56);
  uint64_t v8 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = v9;
  *(void *)(a1 + 64) = v8;
  uint64_t v10 = *(void *)(a2 + 72);
  *(void *)(a1 + 72) = v10;
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  uint64_t v11 = *(void *)(a2 + 88);
  uint64_t v12 = a2 + 96;
  *(void *)(a1 + 8_Block_object_dispose((const void *)(v9 - 80), 8) = v11;
  ((void (*)(void))swift_bridgeObjectRetain)();
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRetain(v9);
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRetain(v11);
  swift_unknownObjectWeakCopyInit(a1 + 96, v12);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  return a1;
}

uint64_t assignWithCopy for SRCarPlaySiriUnavailableView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a1 + 8);
  *(void *)(a1 + _Block_object_dispose((const void *)(v9 - 80), 8) = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a1 + 24);
  *(void *)(a1 + 24) = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a1 + 40);
  *(void *)(a1 + 40) = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  *(_BYTE *)(a1 + 4_Block_object_dispose((const void *)(v9 - 80), 8) = *(_BYTE *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  uint64_t v11 = *(void *)(a1 + 56);
  *(void *)(a1 + 56) = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  uint64_t v12 = *(void *)(a2 + 72);
  uint64_t v13 = *(void *)(a1 + 72);
  *(void *)(a1 + 72) = v12;
  swift_bridgeObjectRetain(v12);
  swift_bridgeObjectRelease(v13);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  uint64_t v14 = *(void *)(a2 + 88);
  uint64_t v15 = *(void *)(a1 + 88);
  *(void *)(a1 + 8_Block_object_dispose((const void *)(v9 - 80), 8) = v14;
  swift_bridgeObjectRetain(v14);
  swift_bridgeObjectRelease(v15);
  swift_unknownObjectWeakCopyAssign(a1 + 96, a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  return a1;
}

uint64_t initializeWithTake for SRCarPlaySiriUnavailableView(uint64_t a1, uint64_t a2)
{
  __int128 v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  __int128 v5 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 4_Block_object_dispose((const void *)(v9 - 80), 8) = v5;
  __int128 v6 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v6;
  swift_unknownObjectWeakTakeInit(a1 + 96, a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  return a1;
}

uint64_t assignWithTake for SRCarPlaySiriUnavailableView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a1 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + _Block_object_dispose((const void *)(v9 - 80), 8) = v4;
  swift_bridgeObjectRelease(v5);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  uint64_t v6 = *(void *)(a1 + 24);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease(v6);
  uint64_t v7 = *(void *)(a2 + 40);
  uint64_t v8 = *(void *)(a1 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v7;
  swift_bridgeObjectRelease(v8);
  *(_BYTE *)(a1 + 4_Block_object_dispose((const void *)(v9 - 80), 8) = *(_BYTE *)(a2 + 48);
  uint64_t v9 = *(void *)(a1 + 56);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRelease(v9);
  uint64_t v10 = *(void *)(a2 + 72);
  uint64_t v11 = *(void *)(a1 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v10;
  swift_bridgeObjectRelease(v11);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  uint64_t v12 = *(void *)(a1 + 88);
  *(void *)(a1 + 8_Block_object_dispose((const void *)(v9 - 80), 8) = *(void *)(a2 + 88);
  swift_bridgeObjectRelease(v12);
  swift_unknownObjectWeakTakeAssign(a1 + 96, a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  return a1;
}

uint64_t getEnumTagSinglePayload for SRCarPlaySiriUnavailableView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 112)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SRCarPlaySiriUnavailableView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 104) = 0LL;
    *(_OWORD *)(result + 8_Block_object_dispose((const void *)(v9 - 80), 8) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + _Block_object_dispose((const void *)(v9 - 80), 8) = 0u;
    *(void *)double result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 112) = 1;
    }
  }

  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + _Block_object_dispose((const void *)(v9 - 80), 8) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 112) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for SRCarPlaySiriUnavailableView()
{
  return &type metadata for SRCarPlaySiriUnavailableView;
}

uint64_t sub_10004B83C(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000B4418, 1LL);
}

uint64_t sub_10004B84C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  v40[1] = a1;
  uint64_t v5 = sub_10004A8E8(&qword_1000D8F40);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = sub_10004A8E8(&qword_1000D8F48);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = sub_10004A8E8(&qword_1000D8F50);
  uint64_t v12 = __chkstk_darwin(v11);
  uint64_t v14 = (char *)v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  *(void *)uint64_t v7 = static HorizontalAlignment.center.getter(v12);
  *((void *)v7 + 1) = 0LL;
  v7[16] = 1;
  uint64_t v15 = sub_10004A8E8(&qword_1000D8F58);
  uint64_t v16 = sub_10004BAAC(a2, &v7[*(int *)(v15 + 44)]);
  uint64_t v17 = static Alignment.center.getter(v16);
  sub_10004C1B4(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v10, 0.0, 1, INFINITY, 0, v17, v18);
  uint64_t v19 = sub_10004E034((uint64_t)v7, &qword_1000D8F40);
  LOBYTE(v7) = static Edge.Set.bottom.getter(v19);
  double v20 = EdgeInsets.init(_all:)(24.0);
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  sub_10004E0B8((uint64_t)v10, (uint64_t)v14, &qword_1000D8F48);
  uint64_t v27 = &v14[*(int *)(v11 + 36)];
  *uint64_t v27 = (char)v7;
  *((double *)v27 + 1) = v20;
  *((void *)v27 + 2) = v22;
  *((void *)v27 + 3) = v24;
  *((void *)v27 + 4) = v26;
  v27[40] = 0;
  uint64_t v28 = sub_10004E034((uint64_t)v10, &qword_1000D8F48);
  char v29 = static Edge.Set.top.getter(v28);
  GeometryProxy.size.getter();
  double v31 = EdgeInsets.init(_all:)(v30 * 0.15);
  uint64_t v33 = v32;
  uint64_t v35 = v34;
  uint64_t v37 = v36;
  sub_10004E0B8((uint64_t)v14, a3, &qword_1000D8F50);
  uint64_t v38 = a3 + *(int *)(sub_10004A8E8(&qword_1000D8F60) + 36);
  *(_BYTE *)uint64_t v38 = v29;
  *(double *)(v38 + _Block_object_dispose((const void *)(v9 - 80), 8) = v31;
  *(void *)(v38 + 16) = v33;
  *(void *)(v38 + 24) = v35;
  *(void *)(v38 + 32) = v37;
  *(_BYTE *)(v38 + 40) = 0;
  return sub_10004E034((uint64_t)v14, &qword_1000D8F50);
}

uint64_t sub_10004BAAC@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  v116 = a2;
  uint64_t v111 = type metadata accessor for DismissButtonStyle(0LL);
  uint64_t v3 = ((uint64_t (*)(void))__chkstk_darwin)();
  v110 = (uint64_t *)&v106[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  __chkstk_darwin(v3);
  v112 = &v106[-v5];
  uint64_t v113 = sub_10004A8E8(&qword_1000D8F68);
  uint64_t v115 = *(void *)(v113 - 8);
  __chkstk_darwin(v113);
  v109 = &v106[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v114 = sub_10004A8E8(&qword_1000D8F70);
  uint64_t v128 = *(void *)(v114 - 8);
  uint64_t v7 = __chkstk_darwin(v114);
  v126 = &v106[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  __chkstk_darwin(v7);
  v127 = &v106[-v9];
  uint64_t v117 = a1;
  uint64_t v10 = *(void *)a1;
  uint64_t v11 = *(void *)(a1 + 8);
  uint64_t v12 = *(unsigned __int8 *)(a1 + 16);
  uint64_t v13 = *(void *)(a1 + 24);
  swift_bridgeObjectRetain(v11);
  swift_bridgeObjectRetain(v13);
  uint64_t v14 = Text.init(_:tableName:bundle:comment:)(v10, v11, v12, v13, 0LL, 0LL, 0LL, 0LL, 0LL, 256);
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  uint64_t v20 = v19 & 1;
  uint64_t v21 = static Font.largeTitle.getter();
  uint64_t v22 = Text.font(_:)(v21, v14, v16, v20, v18);
  uint64_t v24 = v23;
  char v26 = v25;
  uint64_t v28 = v27;
  swift_release(v21);
  sub_10004C870(v14, v16, v20);
  uint64_t v29 = swift_bridgeObjectRelease(v18);
  double v30 = static Font.Weight.medium.getter(v29);
  uint64_t v31 = Text.fontWeight(_:)(*(void *)&v30, 0LL, v22, v24, v26 & 1, v28);
  uint64_t v124 = v32;
  uint64_t v125 = v31;
  uint64_t v123 = v33;
  int v122 = v34 & 1;
  sub_10004C870(v22, v24, v26 & 1);
  swift_bridgeObjectRelease(v28);
  uint64_t v35 = *(void *)(v117 + 32);
  uint64_t v36 = *(void *)(v117 + 40);
  uint64_t v37 = *(unsigned __int8 *)(v117 + 48);
  uint64_t v38 = *(void *)(v117 + 56);
  swift_bridgeObjectRetain(v36);
  swift_bridgeObjectRetain(v38);
  LOWORD(v105) = 256;
  uint64_t v39 = Text.init(_:tableName:bundle:comment:)(v35, v36, v37, v38, 0LL, 0LL, 0LL, 0LL, 0LL, v105);
  uint64_t v41 = v40;
  uint64_t v43 = v42;
  uint64_t v45 = v44 & 1;
  uint64_t v46 = static Font.headline.getter();
  uint64_t v47 = Text.font(_:)(v46, v39, v41, v45, v43);
  uint64_t v49 = v48;
  LOBYTE(v1_Block_object_dispose((const void *)(v9 - 80), 8) = v50;
  uint64_t v52 = v51;
  swift_release(v46);
  sub_10004C870(v39, v41, v45);
  uint64_t v53 = swift_bridgeObjectRelease(v43);
  double v54 = static Font.Weight.regular.getter(v53);
  uint64_t v118 = Text.fontWeight(_:)(*(void *)&v54, 0LL, v47, v49, v18 & 1, v52);
  uint64_t v119 = v55;
  uint64_t v108 = v56;
  int v107 = v57 & 1;
  sub_10004C870(v47, v49, v18 & 1);
  swift_bridgeObjectRelease(v52);
  uint64_t KeyPath = swift_getKeyPath(&unk_100082D90);
  uint64_t v120 = swift_getKeyPath(&unk_100082DC0);
  uint64_t v58 = static Alignment.center.getter();
  sub_10004C370(0.0, 1, 0.0, 1, 0.0, 1, 0.0, 1, (uint64_t)v131, 69.0, 0, 0.0, 1, v58, v59, 0LL, 1);
  uint64_t v60 = v117;
  sub_10004C7A4(v117, (uint64_t)v130);
  uint64_t v61 = swift_allocObject(&unk_1000BB5E8, 128LL, 7LL);
  sub_10004C7DC((uint64_t)v130, v61 + 16);
  v129[2] = v60;
  uint64_t v62 = sub_10004A8E8(&qword_1000D8F78);
  unint64_t v63 = sub_10004D660();
  unsigned int v64 = v109;
  Button.init(action:label:)(sub_10004D650, v61, sub_10004D658, v129, v62, v63);
  uint64_t v65 = swift_getKeyPath(&unk_100082DF0);
  uint64_t v66 = (uint64_t)v110;
  uint64_t *v110 = v65;
  uint64_t v67 = sub_10004A8E8(&qword_1000D8F88);
  swift_storeEnumTagMultiPayload(v66, v67, 0LL);
  uint64_t v68 = v111;
  uint64_t v69 = v66 + *(int *)(v111 + 20);
  *(void *)uint64_t v69 = swift_getKeyPath(&unk_100082E20);
  *(_BYTE *)(v69 + _Block_object_dispose((const void *)(v9 - 80), 8) = 0;
  uint64_t v70 = *(int *)(v68 + 24);
  id v71 = [(id)objc_opt_self(UIColor) _carSystemFocusColor];
  *(void *)(v66 + v70) = Color.init(uiColor:)(v71);
  v72 = v112;
  sub_10004D758(v66, (uint64_t)v112);
  uint64_t v73 = sub_10004E3EC(&qword_1000D8F90, &qword_1000D8F68, (uint64_t)&protocol conformance descriptor for Button<A>);
  uint64_t v74 = sub_10004E3AC(&qword_1000D8F98, type metadata accessor for DismissButtonStyle, (uint64_t)&unk_100082E80);
  id v75 = v126;
  uint64_t v76 = v113;
  View.buttonStyle<A>(_:)(v72, v113, v68, v73, v74);
  sub_10004DFF8((uint64_t)v72, type metadata accessor for DismissButtonStyle);
  (*(void (**)(_BYTE *, uint64_t))(v115 + 8))(v64, v76);
  uint64_t v78 = v127;
  uint64_t v77 = v128;
  uint64_t v79 = v114;
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v128 + 32))(v127, v75, v114);
  LOBYTE(v6_Block_object_dispose((const void *)(v9 - 80), 8) = v122;
  v130[0] = v122;
  id v80 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v77 + 16);
  id v81 = v75;
  uint64_t v82 = v79;
  v80(v81, v78, v79);
  id v83 = v116;
  uint64_t v84 = v125;
  uint64_t v85 = v123;
  void *v116 = v125;
  v83[1] = v85;
  *((_BYTE *)v83 + 16) = v68;
  uint64_t v86 = v124;
  uint64_t v87 = v118;
  v83[3] = v124;
  v83[4] = v87;
  uint64_t v88 = v108;
  v83[5] = v108;
  LOBYTE(v49) = v107;
  *((_BYTE *)v83 + 4_Block_object_dispose((const void *)(v9 - 80), 8) = v107;
  uint64_t v89 = KeyPath;
  v83[7] = v119;
  v83[8] = v89;
  *((_BYTE *)v83 + 72) = 1;
  v83[10] = v120;
  v83[11] = 0LL;
  *((_BYTE *)v83 + 96) = 1;
  *(_WORD *)((char *)v83 + 97) = 256;
  __int128 v90 = v131[0];
  __int128 v91 = v131[1];
  __int128 v92 = v131[2];
  *(_OWORD *)(v83 + 19) = v131[3];
  *(_OWORD *)(v83 + 17) = v92;
  *(_OWORD *)(v83 + 15) = v91;
  *(_OWORD *)(v83 + 13) = v90;
  __int128 v93 = v131[4];
  __int128 v94 = v131[5];
  __int128 v95 = v131[6];
  *(_OWORD *)(v83 + 27) = v131[7];
  *(_OWORD *)(v83 + 25) = v95;
  *(_OWORD *)(v83 + 23) = v94;
  *(_OWORD *)(v83 + 21) = v93;
  uint64_t v96 = sub_10004A8E8(&qword_1000D8FA0);
  v97 = v126;
  v80((_BYTE *)v83 + *(int *)(v96 + 80), v126, v82);
  sub_10004D79C(v84, v85, v122);
  swift_bridgeObjectRetain(v86);
  uint64_t v98 = v118;
  uint64_t v99 = v88;
  LOBYTE(v84) = v49;
  sub_10004D79C(v118, v88, v49);
  v100 = *(void (**)(_BYTE *, uint64_t))(v128 + 8);
  uint64_t v101 = v119;
  swift_bridgeObjectRetain(v119);
  uint64_t v102 = KeyPath;
  swift_retain(KeyPath);
  uint64_t v103 = v120;
  swift_retain(v120);
  v100(v127, v82);
  v100(v97, v82);
  sub_10004C870(v98, v99, v84);
  swift_release(v103);
  swift_release(v102);
  swift_bridgeObjectRelease(v101);
  sub_10004C870(v125, v123, v130[0]);
  return swift_bridgeObjectRelease(v124);
}

__n128 sub_10004C1B4@<Q0>( double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  uint64_t v16 = v15;
  uint64_t v18 = a15;
  double v19 = a12;
  double v20 = a10;
  uint64_t v21 = a2 & 1;
  double v22 = a1;
  if ((_DWORD)v21) {
    double v22 = -INFINITY;
  }
  uint64_t v23 = a4 & 1;
  double v24 = a3;
  if ((a4 & 1) != 0) {
    double v24 = v22;
  }
  uint64_t v25 = a6 & 1;
  uint64_t v26 = a8 & 1;
  double v27 = a5;
  if ((a6 & 1) != 0) {
    double v27 = v24;
  }
  if (v22 > v24 || v24 > v27) {
    goto LABEL_22;
  }
  double v29 = a7;
  if ((a8 & 1) != 0) {
    double v29 = -INFINITY;
  }
  double v30 = a10;
  if ((a11 & 1) != 0) {
    double v30 = v29;
  }
  double v31 = a12;
  if ((a13 & 1) != 0) {
    double v31 = v30;
  }
  if (v29 > v30 || v30 > v31)
  {
LABEL_22:
    double v42 = a5;
    double v43 = a7;
    double v41 = a3;
    double v40 = a1;
    unsigned int v39 = v21;
    uint64_t v33 = static os_log_type_t.fault.getter();
    char v34 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)( v33,  &_mh_execute_header,  v34,  "Contradictory frame constraints specified.",  42LL,  2LL,  _swiftEmptyArrayStorage);

    uint64_t v18 = a15;
    uint64_t v21 = v39;
    a1 = v40;
    double v20 = a10;
    a3 = v41;
    double v19 = a12;
    a5 = v42;
    a7 = v43;
  }

  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)( v44,  *(void *)&a1,  v21,  *(void *)&a3,  v23,  *(void *)&a5,  v25,  *(void *)&a7,  v26,  *(void *)&v20,  a11 & 1,  *(void *)&v19,  a13 & 1,  a14,  v18);
  sub_10004E0B8(v16, a9, &qword_1000D8F40);
  uint64_t v35 = a9 + *(int *)(sub_10004A8E8(&qword_1000D8F48) + 36);
  __int128 v36 = v44[5];
  *(_OWORD *)(v35 + 64) = v44[4];
  *(_OWORD *)(v35 + 80) = v36;
  *(_OWORD *)(v35 + 96) = v44[6];
  __int128 v37 = v44[1];
  *(_OWORD *)uint64_t v35 = v44[0];
  *(_OWORD *)(v35 + 16) = v37;
  __n128 result = (__n128)v44[3];
  *(_OWORD *)(v35 + 32) = v44[2];
  *(__n128 *)(v35 + 4_Block_object_dispose((const void *)(v9 - 80), 8) = result;
  return result;
}

__n128 sub_10004C370@<Q0>( double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  char v18 = a17;
  uint64_t v19 = a15;
  double v20 = a12;
  double v21 = a10;
  uint64_t v22 = a2 & 1;
  double v23 = a1;
  if ((_DWORD)v22) {
    double v23 = -INFINITY;
  }
  uint64_t v24 = a4 & 1;
  double v25 = a3;
  if ((_DWORD)v24) {
    double v25 = v23;
  }
  uint64_t v26 = a6 & 1;
  uint64_t v27 = a8 & 1;
  double v28 = a5;
  if ((a6 & 1) != 0) {
    double v28 = v25;
  }
  if (v23 > v25 || v25 > v28) {
    goto LABEL_22;
  }
  double v30 = a7;
  if ((a8 & 1) != 0) {
    double v30 = -INFINITY;
  }
  double v31 = a10;
  if ((a11 & 1) != 0) {
    double v31 = v30;
  }
  double v32 = a12;
  if ((a13 & 1) != 0) {
    double v32 = v31;
  }
  if (v30 > v31 || v31 > v32)
  {
LABEL_22:
    double v43 = a5;
    double v44 = a7;
    double v41 = a1;
    double v42 = a3;
    unsigned int v39 = v24;
    unsigned int v40 = v22;
    uint64_t v34 = static os_log_type_t.fault.getter();
    uint64_t v35 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)( v34,  &_mh_execute_header,  v35,  "Contradictory frame constraints specified.",  42LL,  2LL,  &_swiftEmptyArrayStorage);

    uint64_t v24 = v39;
    uint64_t v22 = v40;
    uint64_t v19 = a15;
    double v21 = a10;
    double v20 = a12;
    a1 = v41;
    a3 = v42;
    a5 = v43;
    char v18 = a17;
    a7 = v44;
  }

  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)( v45,  *(void *)&a1,  v22,  *(void *)&a3,  v24,  *(void *)&a5,  v26,  *(void *)&a7,  v27,  *(void *)&v21,  a11 & 1,  *(void *)&v20,  a13 & 1,  a14,  v19);
  *(void *)a9 = a16;
  *(_BYTE *)(a9 + _Block_object_dispose((const void *)(v9 - 80), 8) = v18 & 1;
  __int128 v36 = v45[5];
  *(_OWORD *)(a9 + 80) = v45[4];
  *(_OWORD *)(a9 + 96) = v36;
  *(_OWORD *)(a9 + 112) = v45[6];
  __int128 v37 = v45[1];
  *(_OWORD *)(a9 + 16) = v45[0];
  *(_OWORD *)(a9 + 32) = v37;
  __n128 result = (__n128)v45[3];
  *(_OWORD *)(a9 + 4_Block_object_dispose((const void *)(v9 - 80), 8) = v45[2];
  *(__n128 *)(a9 + 64) = result;
  return result;
}

uint64_t sub_10004C518(uint64_t a1)
{
  if (qword_1000D8A20 != -1) {
    swift_once(&qword_1000D8A20, sub_100066BF4);
  }
  uint64_t v2 = type metadata accessor for Logger(0LL);
  uint64_t v3 = sub_10004ADF0(v2, (uint64_t)qword_1000D9988);
  os_log_type_t v4 = static os_log_type_t.info.getter(v3);
  sub_1000681D8(v4, 0x10uLL, 2036625250LL, 0xE400000000000000LL, 0xD000000000000032LL, 0x80000001000896D0LL);
  uint64_t result = swift_unknownObjectWeakLoadStrong(a1 + 96, v5);
  if (result)
  {
    uint64_t v7 = result;
    uint64_t v8 = *(void *)(a1 + 104);
    uint64_t ObjectType = swift_getObjectType(result);
    id v10 = objc_msgSend(objc_allocWithZone(UIViewController), "init", 0);
    (*(void (**)(id, uint64_t, uint64_t, uint64_t))(v8 + 32))(v10, 7LL, ObjectType, v8);

    return swift_unknownObjectRelease(v7);
  }

  return result;
}

double sub_10004C638@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 64);
  uint64_t v4 = *(void *)(a1 + 72);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 80);
  uint64_t v6 = *(void *)(a1 + 88);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v6);
  uint64_t v7 = Text.init(_:tableName:bundle:comment:)(v3, v4, v5, v6, 0LL, 0LL, 0LL, 0LL, 0LL, 256);
  uint64_t v9 = v8;
  LOBYTE(v5) = v10;
  uint64_t v12 = v11;
  uint64_t v13 = static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)(&v20, 0x406E200000000000LL, 0LL, 0x4044000000000000LL, 0LL, v13, v14);
  uint64_t v15 = v20;
  char v16 = v21;
  uint64_t v17 = v22;
  char v18 = v23;
  *(void *)a2 = v7;
  *(void *)(a2 + _Block_object_dispose((const void *)(v9 - 80), 8) = v9;
  *(_BYTE *)(a2 + 16) = v5 & 1;
  *(void *)(a2 + 24) = v12;
  *(void *)(a2 + 32) = v15;
  *(_BYTE *)(a2 + 40) = v16;
  *(void *)(a2 + 4_Block_object_dispose((const void *)(v9 - 80), 8) = v17;
  *(_BYTE *)(a2 + 56) = v18;
  double result = *(double *)&v24;
  *(_OWORD *)(a2 + 64) = v24;
  return result;
}

uint64_t sub_10004C72C()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_10004C744@<X0>(uint64_t (**a1)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)@<X8>)
{
  uint64_t v3 = swift_allocObject(&unk_1000BB5C0, 128LL, 7LL);
  uint64_t result = sub_10004C7DC((uint64_t)v5, v3 + 16);
  *a1 = sub_10004C82C;
  a1[1] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))v3;
  return result;
}

uint64_t sub_10004C7A4(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_10004C7DC(uint64_t a1, uint64_t a2)
{
  __int128 v4 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v4;
  __int128 v5 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a2 + 4_Block_object_dispose((const void *)(v9 - 80), 8) = v5;
  __int128 v6 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(a2 + 80) = v6;
  swift_unknownObjectWeakTakeInit(a2 + 96, a1 + 96);
  *(void *)(a2 + 104) = *(void *)(a1 + 104);
  return a2;
}

uint64_t sub_10004C82C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_10004B84C(a1, v2 + 16, a2);
}

uint64_t type metadata accessor for DismissButtonStyle(uint64_t a1)
{
  uint64_t result = qword_1000D9008;
  if (!qword_1000D9008) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for DismissButtonStyle);
  }
  return result;
}

uint64_t sub_10004C870(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease(a2);
  }
}

uint64_t sub_10004C880@<X0>(uint64_t a1@<X8>)
{
  uint64_t v117 = a1;
  uint64_t v1 = type metadata accessor for Color.RGBColorSpace(0LL);
  uint64_t v112 = *(void *)(v1 - 8);
  uint64_t v113 = v1;
  __chkstk_darwin(v1);
  uint64_t v111 = (char *)&v97 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v107 = type metadata accessor for ColorScheme(0LL);
  uint64_t v106 = *(void *)(v107 - 8);
  uint64_t v3 = __chkstk_darwin(v107);
  int v105 = (char *)&v97 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v3);
  uint64_t v104 = (uint64_t)&v97 - v5;
  uint64_t v6 = sub_10004A8E8(&qword_1000D9060);
  __chkstk_darwin(v6);
  uint64_t v115 = (uint64_t)&v97 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v114 = sub_10004A8E8(&qword_1000D9068);
  __chkstk_darwin(v114);
  uint64_t v116 = (uint64_t)&v97 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v102 = type metadata accessor for RoundedRectangle(0LL);
  uint64_t v9 = __chkstk_darwin(v102);
  uint64_t v118 = (char *)&v97 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v9);
  uint64_t v101 = (char *)&v97 - v11;
  uint64_t v12 = type metadata accessor for ButtonStyleConfiguration.Label(0LL);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v97 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = sub_10004A8E8(&qword_1000D9070);
  __chkstk_darwin(v16);
  char v18 = (char *)&v97 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v98 = sub_10004A8E8(&qword_1000D9078);
  __chkstk_darwin(v98);
  uint64_t v20 = (char *)&v97 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  *(void *)&__int128 v99 = sub_10004A8E8(&qword_1000D9080);
  __chkstk_darwin(v99);
  uint64_t v22 = (char *)&v97 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v110 = (char *)sub_10004A8E8(&qword_1000D9088);
  __chkstk_darwin(v110);
  __int128 v24 = (char *)&v97 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v108 = sub_10004A8E8(&qword_1000D9090);
  uint64_t v25 = __chkstk_darwin(v108);
  v109 = (char *)&v97 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v27 = ButtonStyleConfiguration.label.getter(v25);
  uint64_t v28 = static Font.headline.getter(v27);
  uint64_t KeyPath = swift_getKeyPath(&unk_100082EB8);
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v18, v15, v12);
  double v30 = (uint64_t *)&v18[*(int *)(v16 + 36)];
  uint64_t *v30 = KeyPath;
  v30[1] = v28;
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  uint64_t v100 = type metadata accessor for DismissButtonStyle(0LL);
  uint64_t v31 = v103;
  uint64_t v32 = *(void *)(v103 + *(int *)(v100 + 24));
  uint64_t v33 = swift_getKeyPath(&unk_100082EE8);
  sub_10004E0B8((uint64_t)v18, (uint64_t)v20, &qword_1000D9070);
  uint64_t v34 = (uint64_t *)&v20[*(int *)(v98 + 36)];
  uint64_t *v34 = v33;
  v34[1] = v32;
  swift_retain(v32);
  uint64_t v35 = sub_10004E034((uint64_t)v18, &qword_1000D9070);
  LODWORD(v1_Block_object_dispose((const void *)(v9 - 80), 8) = static HierarchicalShapeStyle.quaternary.getter(v35);
  LOBYTE(v32) = ((uint64_t (*)(void))static Edge.Set.all.getter)();
  sub_10004E0B8((uint64_t)v20, (uint64_t)v22, &qword_1000D9078);
  __int128 v36 = &v22[*(int *)(v99 + 36)];
  *(_DWORD *)__int128 v36 = (_DWORD)v18;
  v36[4] = v32;
  __int128 v37 = v118;
  sub_10004E034((uint64_t)v20, &qword_1000D9078);
  uint64_t v38 = v102;
  unsigned int v39 = v101;
  unsigned int v40 = &v101[*(int *)(v102 + 20)];
  uint64_t v41 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v42 = type metadata accessor for RoundedCornerStyle(0LL);
  double v43 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v42 - 8) + 104LL);
  v43(v40, v41, v42);
  __asm { FMOV            V0.2D, #8.0 }

  __int128 v99 = _Q0;
  *unsigned int v39 = _Q0;
  uint64_t v49 = (uint64_t)&v24[*((int *)v110 + 9)];
  sub_10004DFB4((uint64_t)v39, v49);
  *(_WORD *)(v49 + *(int *)(sub_10004A8E8(&qword_1000D9098) + 36)) = 256;
  v110 = v24;
  sub_10004E0B8((uint64_t)v22, (uint64_t)v24, &qword_1000D9080);
  sub_10004DFF8((uint64_t)v39, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
  sub_10004E034((uint64_t)v22, &qword_1000D9080);
  v43(&v37[*(int *)(v38 + 20)], v41, v42);
  *(_OWORD *)__int128 v37 = v99;
  uint64_t v50 = v104;
  uint64_t v51 = v31;
  sub_10004D0DC(v104);
  uint64_t v52 = enum case for ColorScheme.dark(_:);
  uint64_t v53 = v106;
  double v54 = *(void (**)(char *, uint64_t, uint64_t))(v106 + 104);
  uint64_t v55 = v105;
  uint64_t v56 = v107;
  v54(v105, enum case for ColorScheme.dark(_:), v107);
  LODWORD(v102) = static ColorScheme.== infix(_:_:)(v50, v55);
  char v57 = *(void (**)(char *, uint64_t))(v53 + 8);
  uint64_t v58 = v55;
  v57(v55, v56);
  uint64_t v59 = v50;
  uint64_t v60 = v50;
  uint64_t v61 = v56;
  v57((char *)v60, v56);
  uint64_t v62 = v51 + *(int *)(v100 + 20);
  uint64_t v63 = *(void *)v62;
  LOBYTE(v56) = *(_BYTE *)(v62 + 8);
  sub_10004D8B4(*(void *)v62, v56);
  LOBYTE(v55) = sub_10004D31C(v63, v56);
  sub_10004D944(v63, v56);
  double v64 = 0.0;
  double v65 = 0.0;
  if ((v55 & 1) != 0)
  {
    sub_10004D0DC(v59);
    v54(v58, v52, v61);
    char v66 = static ColorScheme.== infix(_:_:)(v59, v58);
    v57(v58, v61);
    v57((char *)v59, v61);
    if ((v66 & 1) != 0) {
      double v65 = 0.7;
    }
    else {
      double v65 = 0.4;
    }
  }

  if ((v102 & 1) != 0) {
    double v64 = 1.0;
  }
  uint64_t v67 = v111;
  (*(void (**)(char *, void, uint64_t))(v112 + 104))(v111, enum case for Color.RGBColorSpace.sRGB(_:), v113);
  uint64_t v68 = Color.init(_:white:opacity:)(v67, v64, v65);
  StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)( v119,  0LL,  0LL,  _swiftEmptyArrayStorage,  3.0,  10.0,  0.0);
  uint64_t v69 = (uint64_t)v118;
  uint64_t v70 = v115;
  sub_10004DFB4((uint64_t)v118, v115);
  uint64_t v71 = v70 + *(int *)(sub_10004A8E8(&qword_1000D90A0) + 36);
  __int128 v72 = v119[1];
  *(_OWORD *)uint64_t v71 = v119[0];
  *(_OWORD *)(v71 + 16) = v72;
  *(void *)(v71 + 32) = v120;
  uint64_t v73 = sub_10004A8E8(&qword_1000D90A8);
  *(void *)(v70 + *(int *)(v73 + 52)) = v68;
  *(_WORD *)(v70 + *(int *)(v73 + objc_destroyWeak((id *)(v2 - 56)) = 256;
  uint64_t v74 = static Alignment.center.getter(v73);
  uint64_t v76 = v75;
  uint64_t v77 = (uint64_t *)(v70 + *(int *)(sub_10004A8E8(&qword_1000D90B0) + 36));
  uint64_t *v77 = v74;
  v77[1] = v76;
  uint64_t v78 = sub_10004DFF8(v69, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
  LOBYTE(v74) = static Edge.Set.all.getter(v78);
  double v79 = EdgeInsets.init(_all:)(-1.0);
  uint64_t v81 = v80;
  uint64_t v83 = v82;
  uint64_t v85 = v84;
  uint64_t v86 = v116;
  sub_10004E0B8(v70, v116, &qword_1000D9060);
  uint64_t v87 = v86 + *(int *)(v114 + 36);
  *(_BYTE *)uint64_t v87 = v74;
  *(double *)(v87 + _Block_object_dispose((const void *)(v9 - 80), 8) = v79;
  *(void *)(v87 + 16) = v81;
  *(void *)(v87 + 24) = v83;
  *(void *)(v87 + 32) = v85;
  *(_BYTE *)(v87 + 40) = 0;
  uint64_t v88 = sub_10004E034(v70, &qword_1000D9060);
  uint64_t v89 = static Alignment.center.getter(v88);
  uint64_t v91 = v90;
  uint64_t v92 = (uint64_t)v109;
  uint64_t v93 = (uint64_t)&v109[*(int *)(v108 + 36)];
  sub_10004E0B8(v86, v93, &qword_1000D9068);
  __int128 v94 = (uint64_t *)(v93 + *(int *)(sub_10004A8E8(&qword_1000D90B8) + 36));
  uint64_t *v94 = v89;
  v94[1] = v91;
  uint64_t v95 = (uint64_t)v110;
  sub_10004E0B8((uint64_t)v110, v92, &qword_1000D9088);
  sub_10004E034(v86, &qword_1000D9068);
  sub_10004E034(v95, &qword_1000D9088);
  return sub_10004E070(v92, v117);
}

uint64_t sub_10004D0DC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for EnvironmentValues(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = sub_10004A8E8(&qword_1000D8F88);
  __chkstk_darwin(v8);
  uint64_t v10 = (void *)((char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  sub_10004E0B8(v2, (uint64_t)v10, &qword_1000D8F88);
  if (swift_getEnumCaseMultiPayload(v10, v8) == 1)
  {
    uint64_t v11 = type metadata accessor for ColorScheme(0LL);
    return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t))(*(void *)(v11 - 8) + 32LL))(a1, v10, v11);
  }

  else
  {
    uint64_t v13 = *v10;
    os_log_type_t v14 = static os_log_type_t.fault.getter();
    uint64_t v15 = (os_log_s *)static Log.runtimeIssuesLog.getter();
    os_log_type_t v16 = v14;
    if (os_log_type_enabled(v15, v14))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v18 = swift_slowAlloc(32LL, -1LL);
      v20[1] = a1;
      uint64_t v19 = v18;
      uint64_t v22 = v18;
      *(_DWORD *)uint64_t v17 = 136315138;
      uint64_t v21 = sub_100057FC0(0x686353726F6C6F43LL, 0xEB00000000656D65LL, &v22);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, &v22, v17 + 4, v17 + 12);
      _os_log_impl( (void *)&_mh_execute_header,  v15,  v16,  "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.",  v17,  0xCu);
      swift_arrayDestroy(v19, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v19, -1LL, -1LL);
      swift_slowDealloc(v17, -1LL, -1LL);
    }

    EnvironmentValues.init()();
    swift_getAtKeyPath(v7, v13);
    swift_release(v13);
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }

uint64_t sub_10004D31C(uint64_t a1, char a2)
{
  uint64_t v4 = type metadata accessor for EnvironmentValues(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if ((a2 & 1) != 0) {
    return a1 & 1;
  }
  uint64_t v8 = swift_retain(a1);
  os_log_type_t v9 = static os_log_type_t.fault.getter(v8);
  uint64_t v10 = (os_log_s *)static Log.runtimeIssuesLog.getter();
  os_log_type_t v11 = v9;
  if (os_log_type_enabled(v10, v9))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v13 = swift_slowAlloc(32LL, -1LL);
    uint64_t v16 = v13;
    *(_DWORD *)uint64_t v12 = 136315138;
    uint64_t v15 = sub_100057FC0(1819242306LL, 0xE400000000000000LL, &v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v15, &v16, v12 + 4, v12 + 12);
    _os_log_impl( (void *)&_mh_execute_header,  v10,  v11,  "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value an d will not update.",  v12,  0xCu);
    swift_arrayDestroy(v13, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v13, -1LL, -1LL);
    swift_slowDealloc(v12, -1LL, -1LL);
  }

  EnvironmentValues.init()();
  swift_getAtKeyPath(v7, a1);
  sub_10004D944(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v16;
}

uint64_t sub_10004D4D4(uint64_t a1)
{
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t))(v4 + 16))(v3, a1);
  return EnvironmentValues.colorScheme.setter(v3);
}

uint64_t sub_10004D550@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result = EnvironmentValues.multilineTextAlignment.getter();
  *a1 = result;
  return result;
}

uint64_t sub_10004D578(unsigned __int8 *a1)
{
  return EnvironmentValues.multilineTextAlignment.setter(*a1);
}

uint64_t sub_10004D59C@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = EnvironmentValues.lineLimit.getter();
  *(void *)a1 = result;
  *(_BYTE *)(a1 + _Block_object_dispose((const void *)(v9 - 80), 8) = v3 & 1;
  return result;
}

uint64_t sub_10004D5CC(uint64_t a1)
{
  return EnvironmentValues.lineLimit.setter(*(void *)a1, *(unsigned __int8 *)(a1 + 8));
}

uint64_t sub_10004D5FC()
{
  return swift_deallocObject(v0, 128LL, 7LL);
}

uint64_t sub_10004D650()
{
  return sub_10004C518(v0 + 16);
}

double sub_10004D658@<D0>(uint64_t a1@<X8>)
{
  return sub_10004C638(*(void *)(v1 + 16), a1);
}

unint64_t sub_10004D660()
{
  unint64_t result = qword_1000D8F80;
  if (!qword_1000D8F80)
  {
    uint64_t v1 = sub_10004D6C4(&qword_1000D8F78);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000D8F80);
  }

  return result;
}

uint64_t sub_10004D6C4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_10004D708()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t sub_10004D72C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result = EnvironmentValues.isFocused.getter();
  *a1 = result & 1;
  return result;
}

uint64_t sub_10004D758(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DismissButtonStyle(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_10004D79C(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0) {
    return swift_retain(a1);
  }
  else {
    return swift_bridgeObjectRetain(a2);
  }
}

uint64_t *sub_10004D7AC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16LL) & ~(unint64_t)v5));
  }

  else
  {
    uint64_t v7 = sub_10004A8E8(&qword_1000D8F88);
    if (swift_getEnumCaseMultiPayload(a2, v7) == 1)
    {
      uint64_t v8 = type metadata accessor for ColorScheme(0LL);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v8 - 8) + 16LL))(a1, a2, v8);
      os_log_type_t v9 = a1;
      uint64_t v10 = v7;
      uint64_t v11 = 1LL;
    }

    else
    {
      uint64_t v13 = *a2;
      *a1 = *a2;
      swift_retain(v13);
      os_log_type_t v9 = a1;
      uint64_t v10 = v7;
      uint64_t v11 = 0LL;
    }

    swift_storeEnumTagMultiPayload(v9, v10, v11);
    uint64_t v14 = *(int *)(a3 + 20);
    uint64_t v15 = (char *)a1 + v14;
    uint64_t v16 = (char *)a2 + v14;
    uint64_t v17 = *(void *)v16;
    char v18 = v16[8];
    sub_10004D8B4(*(void *)v16, v18);
    *(void *)uint64_t v15 = v17;
    v15[8] = v18;
    uint64_t v19 = *(int *)(a3 + 24);
    uint64_t v12 = *(uint64_t *)((char *)a2 + v19);
    *(uint64_t *)((char *)a1 + v19) = v12;
  }

  swift_retain(v12);
  return a1;
}

uint64_t sub_10004D8B4(uint64_t result, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_retain(result);
  }
  return result;
}

uint64_t sub_10004D8C0(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_10004A8E8(&qword_1000D8F88);
  if (swift_getEnumCaseMultiPayload(a1, v4) == 1)
  {
    uint64_t v5 = type metadata accessor for ColorScheme(0LL);
    (*(void (**)(void *, uint64_t))(*(void *)(v5 - 8) + 8LL))(a1, v5);
  }

  else
  {
    swift_release(*a1);
  }

  sub_10004D944(*(void *)((char *)a1 + *(int *)(a2 + 20)), *((_BYTE *)a1 + *(int *)(a2 + 20) + 8));
  return swift_release(*(void *)((char *)a1 + *(int *)(a2 + 24)));
}

uint64_t sub_10004D944(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_release();
  }
  return result;
}

uint64_t *sub_10004D950(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = sub_10004A8E8(&qword_1000D8F88);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    uint64_t v7 = type metadata accessor for ColorScheme(0LL);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16LL))(a1, a2, v7);
    uint64_t v8 = a1;
    uint64_t v9 = v6;
    uint64_t v10 = 1LL;
  }

  else
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    swift_retain(v11);
    uint64_t v8 = a1;
    uint64_t v9 = v6;
    uint64_t v10 = 0LL;
  }

  swift_storeEnumTagMultiPayload(v8, v9, v10);
  uint64_t v12 = *(int *)(a3 + 20);
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  uint64_t v15 = *(void *)v14;
  char v16 = v14[8];
  sub_10004D8B4(*(void *)v14, v16);
  *(void *)uint64_t v13 = v15;
  v13[8] = v16;
  uint64_t v17 = *(int *)(a3 + 24);
  uint64_t v18 = *(uint64_t *)((char *)a2 + v17);
  *(uint64_t *)((char *)a1 + v17) = v18;
  swift_retain(v18);
  return a1;
}

uint64_t *sub_10004DA30(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_10004E034((uint64_t)a1, &qword_1000D8F88);
    uint64_t v6 = sub_10004A8E8(&qword_1000D8F88);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      uint64_t v7 = type metadata accessor for ColorScheme(0LL);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16LL))(a1, a2, v7);
      uint64_t v8 = a1;
      uint64_t v9 = v6;
      uint64_t v10 = 1LL;
    }

    else
    {
      uint64_t v11 = *a2;
      *a1 = *a2;
      swift_retain(v11);
      uint64_t v8 = a1;
      uint64_t v9 = v6;
      uint64_t v10 = 0LL;
    }

    swift_storeEnumTagMultiPayload(v8, v9, v10);
  }

  uint64_t v12 = *(int *)(a3 + 20);
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  uint64_t v15 = *(void *)v14;
  char v16 = v14[8];
  sub_10004D8B4(*(void *)v14, v16);
  uint64_t v17 = *(void *)v13;
  char v18 = v13[8];
  *(void *)uint64_t v13 = v15;
  v13[8] = v16;
  sub_10004D944(v17, v18);
  uint64_t v19 = *(int *)(a3 + 24);
  uint64_t v20 = *(uint64_t *)((char *)a2 + v19);
  uint64_t v21 = *(uint64_t *)((char *)a1 + v19);
  *(uint64_t *)((char *)a1 + v19) = v20;
  swift_retain(v20);
  swift_release(v21);
  return a1;
}

char *sub_10004DB40(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_10004A8E8(&qword_1000D8F88);
  if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
  {
    uint64_t v7 = type metadata accessor for ColorScheme(0LL);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32LL))(a1, a2, v7);
    swift_storeEnumTagMultiPayload(a1, v6, 1LL);
  }

  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64LL));
  }

  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = *(int *)(a3 + 24);
  uint64_t v10 = &a1[v8];
  uint64_t v11 = &a2[v8];
  *(void *)uint64_t v10 = *(void *)v11;
  v10[8] = v11[8];
  *(void *)&a1[v9] = *(void *)&a2[v9];
  return a1;
}

char *sub_10004DC00(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_10004E034((uint64_t)a1, &qword_1000D8F88);
    uint64_t v6 = sub_10004A8E8(&qword_1000D8F88);
    if (swift_getEnumCaseMultiPayload(a2, v6) == 1)
    {
      uint64_t v7 = type metadata accessor for ColorScheme(0LL);
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32LL))(a1, a2, v7);
      swift_storeEnumTagMultiPayload(a1, v6, 1LL);
    }

    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64LL));
    }
  }

  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v11 = *(void *)v10;
  LOBYTE(v10) = v10[8];
  uint64_t v12 = *(void *)v9;
  char v13 = v9[8];
  *(void *)uint64_t v9 = v11;
  v9[8] = (char)v10;
  sub_10004D944(v12, v13);
  uint64_t v14 = *(int *)(a3 + 24);
  uint64_t v15 = *(void *)&a1[v14];
  *(void *)&a1[v14] = *(void *)&a2[v14];
  swift_release(v15);
  return a1;
}

uint64_t sub_10004DCF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10004DCFC);
}

uint64_t sub_10004DCFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10004A8E8(&qword_1000D8FA8);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  }
  unint64_t v9 = *(void *)(a1 + *(int *)(a3 + 24));
  if (v9 >= 0xFFFFFFFF) {
    LODWORD(v9) = -1;
  }
  return (v9 + 1);
}

uint64_t sub_10004DD7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10004DD88);
}

uint64_t sub_10004DD88(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_10004A8E8(&qword_1000D8FA8);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  }
  *(void *)(a1 + *(int *)(a4 + objc_destroyWeak((id *)(v2 - 24)) = (a2 - 1);
  return result;
}

void sub_10004DE04(uint64_t a1)
{
  if (v3 <= 0x3F)
  {
    v4[0] = *(void *)(v2 - 8) + 64LL;
    v4[1] = "\t";
    v4[2] = (char *)&value witness table for Builtin.NativeObject + 64;
    swift_initStructMetadata(a1, 256LL, 3LL, v4, a1 + 16);
  }

void sub_10004DE84(uint64_t a1)
{
  if (!qword_1000D9018)
  {
    uint64_t v2 = type metadata accessor for ColorScheme(255LL);
    unint64_t v3 = type metadata accessor for Environment.Content(a1, v2);
    if (!v4) {
      atomic_store(v3, (unint64_t *)&qword_1000D9018);
    }
  }

uint64_t sub_10004DED8()
{
  return sub_10004E3EC( &qword_1000D9050,  &qword_1000D9058,  (uint64_t)&protocol conformance descriptor for GeometryReader<A>);
}

uint64_t sub_10004DF04(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000B4440, 1LL);
}

uint64_t sub_10004DF14@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.font.getter();
  *a1 = result;
  return result;
}

uint64_t sub_10004DF3C(void *a1)
{
  uint64_t v1 = swift_retain(*a1);
  return EnvironmentValues.font.setter(v1);
}

uint64_t sub_10004DF64@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.foregroundColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_10004DF8C(void *a1)
{
  uint64_t v1 = swift_retain(*a1);
  return EnvironmentValues.foregroundColor.setter(v1);
}

uint64_t sub_10004DFB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RoundedRectangle(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_10004DFF8(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

uint64_t sub_10004E034(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10004A8E8(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

uint64_t sub_10004E070(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10004A8E8(&qword_1000D9090);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_10004E0B8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10004A8E8(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(a2, a1, v5);
  return a2;
}

unint64_t sub_10004E100()
{
  unint64_t result = qword_1000D90C0;
  if (!qword_1000D90C0)
  {
    uint64_t v1 = sub_10004D6C4(&qword_1000D9090);
    sub_10004E184();
    sub_10004E3EC(&qword_1000D9128, &qword_1000D90B8, (uint64_t)&protocol conformance descriptor for _OverlayModifier<A>);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000D90C0);
  }

  return result;
}

unint64_t sub_10004E184()
{
  unint64_t result = qword_1000D90C8;
  if (!qword_1000D90C8)
  {
    uint64_t v1 = sub_10004D6C4(&qword_1000D9088);
    sub_10004E208();
    sub_10004E3EC(&qword_1000D9120, &qword_1000D9098, (uint64_t)&protocol conformance descriptor for _ClipEffect<A>);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000D90C8);
  }

  return result;
}

unint64_t sub_10004E208()
{
  unint64_t result = qword_1000D90D0;
  if (!qword_1000D90D0)
  {
    uint64_t v1 = sub_10004D6C4(&qword_1000D9080);
    sub_10004E28C();
    sub_10004E3EC( &qword_1000D9110,  &qword_1000D9118,  (uint64_t)&protocol conformance descriptor for _BackgroundStyleModifier<A>);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000D90D0);
  }

  return result;
}

unint64_t sub_10004E28C()
{
  unint64_t result = qword_1000D90D8;
  if (!qword_1000D90D8)
  {
    uint64_t v1 = sub_10004D6C4(&qword_1000D9078);
    sub_10004E310();
    sub_10004E3EC( &qword_1000D9100,  &qword_1000D9108,  (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000D90D8);
  }

  return result;
}

unint64_t sub_10004E310()
{
  unint64_t result = qword_1000D90E0;
  if (!qword_1000D90E0)
  {
    uint64_t v1 = sub_10004D6C4(&qword_1000D9070);
    sub_10004E3AC( &qword_1000D90E8,  (uint64_t (*)(uint64_t))&type metadata accessor for ButtonStyleConfiguration.Label,  (uint64_t)&protocol conformance descriptor for ButtonStyleConfiguration.Label);
    sub_10004E3EC( &qword_1000D90F0,  &qword_1000D90F8,  (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000D90E0);
  }

  return result;
}

uint64_t sub_10004E3AC(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = a2(255LL);
    uint64_t result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_10004E3EC(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = sub_10004D6C4(a2);
    uint64_t result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

id sub_10004E43C()
{
  return sub_10004E610(0LL, type metadata accessor for SRBundleLookupClass);
}

id static SRBundleUtilities.getSiriAppBundle()()
{
  id v0 = [objc_allocWithZone((Class)type metadata accessor for SRBundleLookupClass()) init];
  uint64_t ObjectType = swift_getObjectType(v0);

  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata(ObjectType);
  return [(id)objc_opt_self(NSBundle) bundleForClass:ObjCClassFromMetadata];
}

uint64_t type metadata accessor for SRBundleLookupClass()
{
  return objc_opt_self(&OBJC_CLASS____TtC4SiriP33_F812DF3859921667B5E7BEFF384E699D19SRBundleLookupClass);
}

id GenerativeModelsCompatabilityWrapper.__allocating_init()()
{
  return [objc_allocWithZone(v0) init];
}

id SRBundleUtilities.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SRBundleUtilities();
  return objc_msgSendSuper2(&v2, "init");
}

uint64_t type metadata accessor for SRBundleUtilities()
{
  return objc_opt_self(&OBJC_CLASS____TtC4Siri17SRBundleUtilities);
}

id sub_10004E5C4(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  v5.receiver = a1;
  v5.super_class = (Class)a4(a3);
  return objc_msgSendSuper2(&v5, "init");
}

id SRBundleUtilities.__deallocating_deinit(uint64_t a1)
{
  return sub_10004E610(a1, type metadata accessor for SRBundleUtilities);
}

id sub_10004E610(uint64_t a1, uint64_t (*a2)(void))
{
  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, "dealloc");
}

char *sub_10004E6A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = &v3[OBJC_IVAR___SRCarPlayPresentation_carPlayViewController];
  *uint64_t v7 = 0LL;
  v7[1] = 0LL;
  v3[OBJC_IVAR___SRCarPlayPresentation_siriIsIdleAndQuiet] = 2;
  v3[OBJC_IVAR___SRCarPlayPresentation_shouldResumeMediaOnIdle] = 0;
  *(void *)&v3[OBJC_IVAR___SRCarPlayPresentation_delayDismissalTimeInSec] = 0LL;
  v3[OBJC_IVAR___SRCarPlayPresentation_shouldClearFullscreenSnippet] = 0;
  v3[OBJC_IVAR___SRCarPlayPresentation_shouldRequestStartAttendingAfterTTSStarts] = 0;
  v22.receiver = v3;
  v22.super_class = (Class)type metadata accessor for SRCarPlayPresentation();
  uint64_t v8 = (char *)objc_msgSendSuper2(&v22, "init");
  swift_unknownObjectWeakAssign(&v8[OBJC_IVAR___SRCarPlayPresentation_delegate], a1);
  swift_unknownObjectWeakAssign(&v8[OBJC_IVAR___SRCarPlayPresentation_dataSource], a2);
  uint64_t v9 = (objc_class *)type metadata accessor for SRCarPlayViewController();
  uint64_t v10 = objc_allocWithZone(v9);
  uint64_t v11 = &v10[OBJC_IVAR____TtC4Siri23SRCarPlayViewController_currentSnippetViewController];
  *uint64_t v11 = 0LL;
  v11[1] = 0LL;
  uint64_t v12 = &v10[OBJC_IVAR____TtC4Siri23SRCarPlayViewController_delegate];
  *((void *)v12 + 1) = 0LL;
  swift_unknownObjectWeakInit(v12, 0LL, v13);
  uint64_t v14 = &v10[OBJC_IVAR____TtC4Siri23SRCarPlayViewController_lastFocusIndex];
  v14[8] = 1;
  *(void *)uint64_t v14 = 0LL;
  *(void *)&v10[OBJC_IVAR____TtC4Siri23SRCarPlayViewController_requestOptions] = 0LL;
  *(void *)&v10[OBJC_IVAR____TtC4Siri23SRCarPlayViewController_delayedAceCommands] = 0LL;
  v10[OBJC_IVAR____TtC4Siri23SRCarPlayViewController_isSpeaking] = 0;
  v21.receiver = v10;
  v21.super_class = v9;
  uint64_t v15 = v8;
  char v16 = (char *)objc_msgSendSuper2(&v21, "initWithNibName:bundle:", 0, 0);
  uint64_t v17 = &v16[OBJC_IVAR____TtC4Siri23SRCarPlayViewController_delegate];
  *((void *)v17 + 1) = &off_1000BB688;
  swift_unknownObjectWeakAssign(v17, v15);

  swift_unknownObjectRelease(a1);
  swift_unknownObjectRelease(a2);
  char v18 = &v15[OBJC_IVAR___SRCarPlayPresentation_carPlayViewController];
  uint64_t v19 = *(void **)&v15[OBJC_IVAR___SRCarPlayPresentation_carPlayViewController];
  *(void *)char v18 = v16;
  *((void *)v18 + 1) = &off_1000BBBA0;

  return v15;
}

id sub_10004E9C4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SRCarPlayPresentation();
  return objc_msgSendSuper2(&v2, "dealloc");
}

void *sub_10004EAC0()
{
  uint64_t v1 = v0;
  if (qword_1000D8A20 != -1) {
    swift_once(&qword_1000D8A20, sub_100066BF4);
  }
  uint64_t v2 = type metadata accessor for Logger(0LL);
  uint64_t v3 = sub_10004ADF0(v2, (uint64_t)qword_1000D9988);
  os_log_type_t v4 = static os_log_type_t.info.getter(v3);
  sub_1000681D8(v4, 2uLL, 0x6D7369646F747561LL, 0xED00002928737369LL, 0x697373696D736944LL, 0xEA0000000000676ELL);
  uint64_t result = (void *)swift_unknownObjectWeakLoadStrong(v0 + OBJC_IVAR___SRCarPlayPresentation_delegate, v5);
  if (result)
  {
    uint64_t v7 = result;
    [result dismissSiriPresentation:v1 withReason:4];
    return (void *)swift_unknownObjectRelease(v7);
  }

  return result;
}

uint64_t type metadata accessor for SRCarPlayPresentation()
{
  return objc_opt_self(&OBJC_CLASS___SRCarPlayPresentation);
}

void *sub_10004EC1C(void *a1, id a2)
{
  uint64_t v25 = a1;
  uint64_t v28 = 0LL;
  double v29 = _swiftEmptyArrayStorage;
  char v27 = 0;
  if (a2)
  {
    id v5 = [a2 insertedItemIndexPaths];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = type metadata accessor for IndexPath(0LL);
      uint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v6, v7);

      uint64_t v9 = sub_10004A8E8(&qword_1000D91F8);
      v22[1] = v22;
      __chkstk_darwin(v9);
      uint64_t v11 = (char *)v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      uint64_t v12 = *(void *)(v8 + 16);
      uint64_t v13 = *(void *)(v7 - 8);
      uint64_t v23 = v8;
      if (v12)
      {
        unint64_t v14 = v8 + ((*(unsigned __int8 *)(v13 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80));
        uint64_t v24 = *(void *)(v13 + 72);
        uint64_t v15 = v8;
        char v16 = *(void (**)(char *, unint64_t, uint64_t))(v13 + 16);
        swift_bridgeObjectRetain(v15);
        while (1)
        {
          v16(v11, v14, v7);
          uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56);
          v17(v11, 0LL, 1LL, v7);
          uint64_t v18 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1LL, v7);
          if ((_DWORD)v18 == 1) {
            break;
          }
          __chkstk_darwin(v18);
          uint64_t v20 = (char *)v22 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
          (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v20, v11, v7);
          sub_10004EE68((uint64_t)v20, v25, (unint64_t *)&v29, &v28, v26, &v27);
          (*(void (**)(char *, uint64_t))(v13 + 8))(v20, v7);
          v14 += v24;
          if (!--v12) {
            goto LABEL_10;
          }
        }
      }

      else
      {
        uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56);
        swift_bridgeObjectRetain(v8);
LABEL_10:
        v17(v11, 1LL, 1LL, v7);
      }

      swift_bridgeObjectRelease_n(v23, 2LL);
      return v29;
    }

    else
    {
      return _swiftEmptyArrayStorage;
    }
  }

  else
  {
    __break(1u);
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v2);
    uint64_t result = (void *)swift_bridgeObjectRelease(v23);
    __break(1u);
  }

  return result;
}

void sub_10004EE68(uint64_t a1, void *a2, unint64_t *a3, void **a4, uint64_t a5, _BYTE *a6)
{
  if (!a2)
  {
    __break(1u);
LABEL_25:
    uint64_t v50 = type metadata accessor for UUID(a1);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v50 - 8) + 56LL))(v6, 1LL, 1LL, v50);
    goto LABEL_26;
  }

  NSIndexPath v62 = IndexPath._bridgeToObjectiveC()();
  Class isa = v62.super.isa;
  id v14 = objc_msgSend(a2, "itemAtIndexPath:", v62.super.isa, v62._reserved);

  if (!v14) {
    return;
  }
  uint64_t v59 = 0LL;
  unint64_t v60 = 0xE000000000000000LL;
  _StringGuts.grow(_:)(32LL);
  v15._countAndFlagsBits = 0xD00000000000001ELL;
  v15._object = (void *)0x800000010008A070LL;
  String.append(_:)(v15);
  id v61 = v14;
  uint64_t v16 = sub_10004A8E8(&qword_1000D9200);
  _print_unlocked<A, B>(_:_:)( &v61,  &v59,  v16,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
  uint64_t v17 = v59;
  unint64_t v18 = v60;
  if (qword_1000D8A20 != -1) {
    swift_once(&qword_1000D8A20, sub_100066BF4);
  }
  uint64_t v52 = a6;
  uint64_t v53 = a5;
  char v57 = a4;
  uint64_t v58 = v7;
  uint64_t v19 = type metadata accessor for Logger(0LL);
  uint64_t v20 = sub_10004ADF0(v19, (uint64_t)qword_1000D9988);
  os_log_type_t v21 = static os_log_type_t.info.getter(v20);
  unint64_t v54 = (unint64_t)"overlapping range";
  uint64_t v55 = v20;
  sub_1000681D8(v21, 0x10uLL, 0xD000000000000023LL, 0x800000010008A040LL, v17, v18);
  swift_bridgeObjectRelease(v18);
  id v22 = [v14 identifier];
  uint64_t v23 = sub_10004A8E8(&qword_1000D9208);
  uint64_t v56 = &v51;
  __chkstk_darwin(v23);
  uint64_t v6 = (char *)&v51 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  a1 = 0LL;
  if (!v22) {
    goto LABEL_25;
  }
  uint64_t v25 = type metadata accessor for UUID(0LL);
  uint64_t v26 = *(void *)(v25 - 8);
  __chkstk_darwin(v25);
  uint64_t v28 = (char *)&v51 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(v22);

  double v29 = *(void (**)(char *, char *, uint64_t))(v26 + 32);
  v29(v6, v28, v25);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v26 + 56))(v6, 0LL, 1LL, v25);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v6, 1LL, v25) == 1)
  {
LABEL_26:
    __break(1u);
    return;
  }

  unint64_t v30 = *a3;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*a3);
  *a3 = v30;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    unint64_t v30 = sub_10005CAB8(0, *(void *)(v30 + 16) + 1LL, 1, v30);
    *a3 = v30;
  }

  unint64_t v33 = *(void *)(v30 + 16);
  unint64_t v32 = *(void *)(v30 + 24);
  if (v33 >= v32 >> 1)
  {
    unint64_t v30 = sub_10005CAB8(v32 > 1, v33 + 1, 1, v30);
    *a3 = v30;
  }

  *(void *)(v30 + 16) = v33 + 1;
  v29( (char *)(v30 + ((*(unsigned __int8 *)(v26 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80))
           + *(void *)(v26 + 72) * v33),
    v6,
    v25);
  id v34 = [v14 aceObject];
  uint64_t v35 = v34;
  __int128 v36 = v57;
  if (*v57)
  {
    if (!v34) {
      goto LABEL_22;
    }
  }

  else
  {
    __int128 v37 = sub_10004F354(v34);
    uint64_t v38 = *v36;
    char *v36 = v37;

    if (!v35)
    {
LABEL_22:
      swift_unknownObjectRelease(v14);
      return;
    }
  }

  uint64_t v39 = objc_opt_self(&OBJC_CLASS___SAUIAssistantUtteranceView);
  uint64_t v40 = swift_dynamicCastObjCClass(v35, v39);
  if (!v40)
  {

    goto LABEL_22;
  }

  uint64_t v41 = (void *)v40;
  id v42 = v35;
  id v43 = [v41 preserveResultSpaceIfPossible];
  if (!(_DWORD)v43) {
    goto LABEL_20;
  }
  id v43 = objc_msgSend(v41, "af_dialogIdentifier");
  if (!v43) {
    goto LABEL_20;
  }
  double v44 = v43;
  static String._unconditionallyBridgeFromObjectiveC(_:)(v43);
  uint64_t v46 = v45;

  v47._countAndFlagsBits = 0x6E657645646E6946LL;
  v47._object = (void *)0xEB00000000237374LL;
  LOBYTE(v44) = String.hasPrefix(_:)(v47);
  id v43 = (id)swift_bridgeObjectRelease(v46);
  if ((v44 & 1) != 0)
  {
    os_log_type_t v48 = static os_log_type_t.info.getter(v43);
    sub_1000681D8( v48,  0x10uLL,  0xD000000000000023LL,  v54 | 0x8000000000000000LL,  0xD00000000000005FLL,  0x800000010008A0E0LL);
    swift_unknownObjectRelease(v14);
  }

  else
  {
LABEL_20:
    os_log_type_t v49 = static os_log_type_t.info.getter(v43);
    sub_1000681D8( v49,  0x10uLL,  0xD000000000000023LL,  v54 | 0x8000000000000000LL,  0xD000000000000044LL,  0x800000010008A090LL);
    swift_unknownObjectRelease(v14);

    _BYTE *v52 = 1;
  }

void *sub_10004F354(void *a1)
{
  if (!a1) {
    goto LABEL_46;
  }
  uint64_t v3 = v1;
  uint64_t v4 = objc_opt_self(&OBJC_CLASS___SAAceView);
  uint64_t v5 = swift_dynamicCastObjCClass(a1, v4);
  if (!v5) {
    goto LABEL_13;
  }
  uint64_t v6 = (void *)v5;
  id v7 = a1;
  id v8 = [v6 itemType];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
    uint64_t v12 = v11;

    uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(SAAceViewUIItemTypeItemTypeHintValue);
    uint64_t v15 = v14;
    if (v12)
    {
      if (v10 == v13 && v12 == v14)
      {
        swift_bridgeObjectRelease_n(v12, 2LL);
      }

      else
      {
        char v17 = _stringCompareWithSmolCheck(_:_:expecting:)(v10, v12, v13, v14, 0LL);
        swift_bridgeObjectRelease(v12);
        swift_bridgeObjectRelease(v15);
        if ((v17 & 1) == 0)
        {

          goto LABEL_13;
        }
      }

      if (qword_1000D8A20 != -1) {
        swift_once(&qword_1000D8A20, sub_100066BF4);
      }
      uint64_t v52 = type metadata accessor for Logger(0LL);
      uint64_t v53 = sub_10004ADF0(v52, (uint64_t)qword_1000D9988);
      os_log_type_t v54 = static os_log_type_t.info.getter(v53);
      sub_1000681D8( v54,  0x10uLL,  0xD000000000000021LL,  0x800000010008A140LL,  0xD00000000000003ALL,  0x800000010008A4D0LL);

      return 0LL;
    }
  }

  else
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(SAAceViewUIItemTypeItemTypeHintValue);
    uint64_t v15 = v18;
  }

  swift_bridgeObjectRelease(v15);
LABEL_13:
  uint64_t v19 = objc_opt_self(&OBJC_CLASS___SAUIVisualResponseSnippet);
  uint64_t v20 = swift_dynamicCastObjCClass(a1, v19);
  if (v20)
  {
    os_log_type_t v21 = (void *)v20;
    id v22 = a1;
    _StringGuts.grow(_:)(62LL);
    v23._countAndFlagsBits = 0xD00000000000003CLL;
    v23._object = (void *)0x800000010008A490LL;
    String.append(_:)(v23);
    id v24 = [v21 description];
    uint64_t v25 = static String._unconditionallyBridgeFromObjectiveC(_:)(v24);
    uint64_t v27 = v26;

    v28._countAndFlagsBits = v25;
    v28._object = v27;
    String.append(_:)(v28);
    swift_bridgeObjectRelease(v27);
    unint64_t v29 = 0xE000000000000000LL;
    if (qword_1000D8A20 != -1) {
      swift_once(&qword_1000D8A20, sub_100066BF4);
    }
    uint64_t v30 = type metadata accessor for Logger(0LL);
    uint64_t v31 = sub_10004ADF0(v30, (uint64_t)qword_1000D9988);
    os_log_type_t v32 = static os_log_type_t.info.getter(v31);
    uint64_t v33 = 0LL;
    unint64_t v34 = 0xE000000000000000LL;
LABEL_17:
    sub_1000681D8(v32, 0x10uLL, 0xD000000000000021LL, 0x800000010008A140LL, v33, v34);
    swift_bridgeObjectRelease(v29);
    return v21;
  }

  uint64_t v35 = objc_opt_self(&OBJC_CLASS___SAUIPluginSnippet);
  uint64_t v36 = swift_dynamicCastObjCClass(a1, v35);
  if (!v36)
  {
    uint64_t v55 = objc_opt_self(&OBJC_CLASS___SAUIDisambiguationList);
    uint64_t v56 = swift_dynamicCastObjCClass(a1, v55);
    if (v56)
    {
      char v57 = (void *)v56;
      uint64_t v58 = qword_1000D8A20;
      id v59 = a1;
      if (v58 != -1) {
        swift_once(&qword_1000D8A20, sub_100066BF4);
      }
      uint64_t v60 = type metadata accessor for Logger(0LL);
      uint64_t v61 = sub_10004ADF0(v60, (uint64_t)qword_1000D9988);
      os_log_type_t v62 = static os_log_type_t.info.getter(v61);
      sub_1000681D8( v62,  0x10uLL,  0xD000000000000021LL,  0x800000010008A140LL,  0xD000000000000061LL,  0x800000010008A370LL);
      id v63 = sub_1000526F4(v57);
      goto LABEL_33;
    }

    uint64_t v74 = objc_opt_self(&OBJC_CLASS___SAUIConfirmationView);
    uint64_t v75 = swift_dynamicCastObjCClass(a1, v74);
    if (v75)
    {
      uint64_t v76 = (void *)v75;
      id v59 = a1;
      id v77 = [v76 title];
      if (v77)
      {
        uint64_t v78 = v77;
        uint64_t v79 = static String._unconditionallyBridgeFromObjectiveC(_:)(v77);
        unint64_t v81 = v80;

        swift_bridgeObjectRelease(v81);
        uint64_t v82 = HIBYTE(v81) & 0xF;
        if ((v81 & 0x2000000000000000LL) == 0) {
          uint64_t v82 = v79 & 0xFFFFFFFFFFFFLL;
        }
        if (v82)
        {
          if (qword_1000D8A20 != -1) {
            swift_once(&qword_1000D8A20, sub_100066BF4);
          }
          uint64_t v83 = type metadata accessor for Logger(0LL);
          uint64_t v84 = sub_10004ADF0(v83, (uint64_t)qword_1000D9988);
          os_log_type_t v85 = static os_log_type_t.info.getter(v84);
          uint64_t v86 = 0xD000000000000072LL;
          uint64_t v87 = "SRCarPlayPresentation received SAUIConfirmationView with non-nil title, converting to VisualResponseView in RF 1.0";
LABEL_64:
          sub_1000681D8( v85,  0x10uLL,  0xD000000000000021LL,  0x800000010008A140LL,  v86,  (unint64_t)(v87 - 32) | 0x8000000000000000LL);
          id v63 = sub_10005E6C4();
LABEL_33:
          os_log_type_t v21 = v63;

          return v21;
        }
      }

      id v106 = [v76 subtitle];
      if (v106)
      {
        uint64_t v107 = v106;
        uint64_t v108 = static String._unconditionallyBridgeFromObjectiveC(_:)(v106);
        unint64_t v110 = v109;

        swift_bridgeObjectRelease(v110);
        uint64_t v111 = HIBYTE(v110) & 0xF;
        if ((v110 & 0x2000000000000000LL) == 0) {
          uint64_t v111 = v108 & 0xFFFFFFFFFFFFLL;
        }
        if (v111)
        {
          if (qword_1000D8A20 != -1) {
            swift_once(&qword_1000D8A20, sub_100066BF4);
          }
          uint64_t v112 = type metadata accessor for Logger(0LL);
          uint64_t v113 = sub_10004ADF0(v112, (uint64_t)qword_1000D9988);
          os_log_type_t v85 = static os_log_type_t.info.getter(v113);
          uint64_t v86 = 0xD000000000000075LL;
          uint64_t v87 = "SRCarPlayPresentation received SAUIConfirmationView with non-nil subtitle, converting to VisualResponseView in RF 1.0";
          goto LABEL_64;
        }
      }

      if (qword_1000D8A20 != -1) {
        swift_once(&qword_1000D8A20, sub_100066BF4);
      }
      uint64_t v114 = type metadata accessor for Logger(0LL);
      uint64_t v115 = sub_10004ADF0(v114, (uint64_t)qword_1000D9988);
      os_log_type_t v116 = static os_log_type_t.info.getter(v115);
      sub_1000681D8( v116,  0x10uLL,  0xD000000000000021LL,  0x800000010008A140LL,  0xD00000000000004CLL,  0x800000010008A220LL);

      return 0LL;
    }

LABEL_46:
    uint64_t v120 = &type metadata for SiriUIFeaturesFlags;
    unint64_t v121 = sub_1000532B0();
    char v88 = isFeatureEnabled(_:)(&v118);
    sub_1000532F4(&v118);
    if (a1)
    {
      if ((v88 & 1) != 0)
      {
        uint64_t v89 = objc_opt_self(&OBJC_CLASS___SACardSnippet);
        if (swift_dynamicCastObjCClass(a1, v89))
        {
          uint64_t v90 = qword_1000D8A20;
          id v91 = a1;
          if (v90 != -1) {
            swift_once(&qword_1000D8A20, sub_100066BF4);
          }
          uint64_t v92 = type metadata accessor for Logger(0LL);
          uint64_t v93 = sub_10004ADF0(v92, (uint64_t)qword_1000D9988);
          os_log_type_t v94 = static os_log_type_t.info.getter(v93);
          sub_1000681D8( v94,  0x10uLL,  0xD000000000000021LL,  0x800000010008A140LL,  0xD000000000000066LL,  0x800000010008A1B0LL);
        }
      }
    }

    uint64_t v118 = 0LL;
    unint64_t v119 = 0xE000000000000000LL;
    _StringGuts.grow(_:)(64LL);
    v95._countAndFlagsBits = 0xD00000000000003ELL;
    v95._object = (void *)0x800000010008A170LL;
    String.append(_:)(v95);
    uint64_t v117 = a1;
    id v96 = a1;
    uint64_t v97 = sub_10004A8E8(&qword_1000D9218);
    v98._countAndFlagsBits = String.init<A>(describing:)(&v117, v97);
    object = v98._object;
    String.append(_:)(v98);
    swift_bridgeObjectRelease(object);
    uint64_t v101 = v118;
    unint64_t v100 = v119;
    if (qword_1000D8A20 != -1) {
      swift_once(&qword_1000D8A20, sub_100066BF4);
    }
    uint64_t v102 = type metadata accessor for Logger(0LL);
    uint64_t v103 = sub_10004ADF0(v102, (uint64_t)qword_1000D9988);
    os_log_type_t v104 = static os_log_type_t.info.getter(v103);
    sub_1000681D8(v104, 0x10uLL, 0xD000000000000021LL, 0x800000010008A140LL, v101, v100);
    swift_bridgeObjectRelease(v100);
    return 0LL;
  }

  os_log_type_t v21 = (void *)v36;
  id v37 = a1;
  _StringGuts.grow(_:)(62LL);
  v38._countAndFlagsBits = 0xD00000000000003CLL;
  v38._object = (void *)0x800000010008A3E0LL;
  String.append(_:)(v38);
  id v39 = [v21 description];
  uint64_t v40 = static String._unconditionallyBridgeFromObjectiveC(_:)(v39);
  id v42 = v41;

  v43._countAndFlagsBits = v40;
  v43._object = v42;
  String.append(_:)(v43);
  swift_bridgeObjectRelease(v42);
  if (qword_1000D8A20 != -1) {
    swift_once(&qword_1000D8A20, sub_100066BF4);
  }
  uint64_t v44 = type metadata accessor for Logger(0LL);
  uint64_t v45 = sub_10004ADF0(v44, (uint64_t)qword_1000D9988);
  os_log_type_t v46 = static os_log_type_t.info.getter(v45);
  sub_1000681D8(v46, 0x10uLL, 0xD000000000000021LL, 0x800000010008A140LL, 0LL, 0xE000000000000000LL);
  swift_bridgeObjectRelease(0xE000000000000000LL);
  if ([(id)objc_opt_self(AFFeatureFlags) isSiriLocationServicesPromptingEnabled])
  {
    id v47 = [v21 responseViewId];
    uint64_t v48 = static String._unconditionallyBridgeFromObjectiveC(_:)(v47);
    uint64_t v50 = v49;

    if (v48 == 0xD000000000000033LL && v50 == 0x800000010008A420LL)
    {
      swift_bridgeObjectRelease(0x800000010008A420LL);
    }

    else
    {
      char v64 = _stringCompareWithSmolCheck(_:_:expecting:)(v48, v50, 0xD000000000000033LL, 0x800000010008A420LL, 0LL);
      swift_bridgeObjectRelease(v50);
      if ((v64 & 1) == 0) {
        return v21;
      }
    }

    Strong = (void *)swift_unknownObjectWeakLoadStrong(v3 + OBJC_IVAR___SRCarPlayPresentation_delegate, v51);
    if (Strong)
    {
      char v66 = Strong;
      [Strong siriPresentation:v3 setStatusViewHidden:1];
      swift_unknownObjectRelease(v66);
    }

    _StringGuts.grow(_:)(39LL);
    swift_bridgeObjectRelease(0xE000000000000000LL);
    id v67 = v37;
    id v68 = [v21 description];
    uint64_t v69 = static String._unconditionallyBridgeFromObjectiveC(_:)(v68);
    uint64_t v71 = v70;

    v72._countAndFlagsBits = v69;
    v72._object = v71;
    String.append(_:)(v72);
    uint64_t v73 = swift_bridgeObjectRelease(v71);
    unint64_t v29 = 0x800000010008A460LL;
    os_log_type_t v32 = static os_log_type_t.info.getter(v73);
    uint64_t v33 = 0xD000000000000025LL;
    unint64_t v34 = 0x800000010008A460LL;
    goto LABEL_17;
  }

  return v21;
}

    if (v9 < v3)
    {
      if (__OFSUB__(v9, v13)) {
        goto LABEL_153;
      }
      if (v9 - v13 < v105)
      {
        if (__OFADD__(v13, v105)) {
          goto LABEL_155;
        }
        if (v13 + v105 >= v3) {
          os_log_type_t v32 = v3;
        }
        else {
          os_log_type_t v32 = v13 + v105;
        }
        if (v32 < v13) {
          goto LABEL_156;
        }
        if (v9 != v32)
        {
          uint64_t v33 = (void *)(v10 + 16 * v9);
          do
          {
            unint64_t v34 = (uint64_t *)(v10 + 16 * v9);
            uint64_t v35 = *v34;
            uint64_t v36 = v34[1];
            id v37 = v13;
            Swift::String v38 = v33;
            do
            {
              id v39 = v35 == *(v38 - 2) && v36 == *(v38 - 1);
              if (v39 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
                break;
              }
              if (!v10) {
                goto LABEL_158;
              }
              uint64_t v35 = *v38;
              uint64_t v36 = v38[1];
              *(_OWORD *)Swift::String v38 = *((_OWORD *)v38 - 1);
              *(v38 - 1) = v36;
              *(v38 - 2) = v35;
              v38 -= 2;
              ++v37;
            }

            while (v9 != v37);
            ++v9;
            v33 += 2;
          }

          while (v9 != v32);
          uint64_t v9 = v32;
        }
      }
    }

    if (v9 < v13)
    {
LABEL_148:
      __break(1u);
LABEL_149:
      __break(1u);
LABEL_150:
      __break(1u);
LABEL_151:
      __break(1u);
LABEL_152:
      __break(1u);
LABEL_153:
      __break(1u);
LABEL_154:
      __break(1u);
LABEL_155:
      __break(1u);
LABEL_156:
      __break(1u);
LABEL_157:
      __break(1u);
LABEL_158:
      __break(1u);
LABEL_159:
      __break(1u);
LABEL_160:
      __break(1u);
LABEL_161:
      __break(1u);
      goto LABEL_162;
    }

    if ((swift_isUniquelyReferenced_nonNull_native(v11) & 1) == 0) {
      uint64_t v11 = sub_1000695B4(0LL, *((void *)v11 + 2) + 1LL, 1, v11);
    }
    uint64_t v41 = *((void *)v11 + 2);
    uint64_t v40 = *((void *)v11 + 3);
    uint64_t v12 = v41 + 1;
    if (v41 >= v40 >> 1) {
      uint64_t v11 = sub_1000695B4((char *)(v40 > 1), v41 + 1, 1, v11);
    }
    *((void *)v11 + 2) = v12;
    id v42 = v11 + 32;
    Swift::String v43 = &v11[16 * v41 + 32];
    *(void *)Swift::String v43 = v13;
    *((void *)v43 + 1) = v9;
    if (v41) {
      break;
    }
    uint64_t v12 = 1LL;
LABEL_15:
    uint64_t v3 = v106;
    if (v9 >= v106)
    {
      id v8 = v104;
      goto LABEL_120;
    }
  }

  uint64_t v107 = v9;
  while (1)
  {
    uint64_t v44 = v12 - 1;
    if (v12 >= 4)
    {
      uint64_t v49 = &v42[16 * v12];
      uint64_t v50 = *((void *)v49 - 8);
      uint64_t v51 = *((void *)v49 - 7);
      uint64_t v55 = __OFSUB__(v51, v50);
      uint64_t v52 = v51 - v50;
      if (v55) {
        goto LABEL_137;
      }
      os_log_type_t v54 = *((void *)v49 - 6);
      uint64_t v53 = *((void *)v49 - 5);
      uint64_t v55 = __OFSUB__(v53, v54);
      id v47 = v53 - v54;
      uint64_t v48 = v55;
      if (v55) {
        goto LABEL_138;
      }
      uint64_t v56 = v12 - 2;
      char v57 = &v42[16 * v12 - 32];
      id v59 = *(void *)v57;
      uint64_t v58 = *((void *)v57 + 1);
      uint64_t v55 = __OFSUB__(v58, v59);
      uint64_t v60 = v58 - v59;
      if (v55) {
        goto LABEL_140;
      }
      uint64_t v55 = __OFADD__(v47, v60);
      uint64_t v61 = v47 + v60;
      if (v55) {
        goto LABEL_143;
      }
      if (v61 >= v52)
      {
        uint64_t v79 = &v42[16 * v44];
        unint64_t v81 = *(void *)v79;
        unint64_t v80 = *((void *)v79 + 1);
        uint64_t v55 = __OFSUB__(v80, v81);
        uint64_t v82 = v80 - v81;
        if (v55) {
          goto LABEL_147;
        }
        Swift::String v72 = v47 < v82;
        goto LABEL_105;
      }
    }

    else
    {
      if (v12 != 3)
      {
        uint64_t v73 = *((void *)v11 + 4);
        uint64_t v74 = *((void *)v11 + 5);
        uint64_t v55 = __OFSUB__(v74, v73);
        char v66 = v74 - v73;
        id v67 = v55;
        goto LABEL_99;
      }

      os_log_type_t v46 = *((void *)v11 + 4);
      uint64_t v45 = *((void *)v11 + 5);
      uint64_t v55 = __OFSUB__(v45, v46);
      id v47 = v45 - v46;
      uint64_t v48 = v55;
    }

    if ((v48 & 1) != 0) {
      goto LABEL_139;
    }
    uint64_t v56 = v12 - 2;
    os_log_type_t v62 = &v42[16 * v12 - 32];
    char v64 = *(void *)v62;
    id v63 = *((void *)v62 + 1);
    double v65 = __OFSUB__(v63, v64);
    char v66 = v63 - v64;
    id v67 = v65;
    if (v65) {
      goto LABEL_142;
    }
    id v68 = &v42[16 * v44];
    uint64_t v70 = *(void *)v68;
    uint64_t v69 = *((void *)v68 + 1);
    uint64_t v55 = __OFSUB__(v69, v70);
    uint64_t v71 = v69 - v70;
    if (v55) {
      goto LABEL_145;
    }
    if (__OFADD__(v66, v71)) {
      goto LABEL_146;
    }
    if (v66 + v71 >= v47)
    {
      Swift::String v72 = v47 < v71;
LABEL_105:
      if (v72) {
        uint64_t v44 = v56;
      }
      goto LABEL_107;
    }

id sub_10004FD80()
{
  uint64_t v1 = v0;
  if (qword_1000D8A20 != -1) {
    swift_once(&qword_1000D8A20, sub_100066BF4);
  }
  uint64_t v2 = type metadata accessor for Logger(0LL);
  uint64_t v3 = sub_10004ADF0(v2, (uint64_t)qword_1000D9988);
  os_log_type_t v4 = static os_log_type_t.info.getter(v3);
  sub_1000681D8(v4, 0x10uLL, 0x696E537261656C63LL, 0xEE00292874657070LL, 0xD000000000000034LL, 0x8000000100089FA0LL);
  id result = *(id *)(v0 + OBJC_IVAR___SRCarPlayPresentation_carPlayViewController);
  if (result)
  {
    [result clearSnippet];
    id result = [(id)objc_opt_self(AFFeatureFlags) isSiriLocationServicesPromptingEnabled];
    if ((_DWORD)result)
    {
      id result = (id)swift_unknownObjectWeakLoadStrong(v0 + OBJC_IVAR___SRCarPlayPresentation_delegate, v6);
      if (result)
      {
        id v7 = result;
        [result siriPresentation:v1 setStatusViewHidden:0];
        return (id)swift_unknownObjectRelease(v7);
      }
    }
  }

  else
  {
    __break(1u);
  }

  return result;
}

void sub_10004FE98(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_10004EC1C(a1, a2);
  id v31 = v4;
  if (v4)
  {
    id v7 = *(void **)(v2 + OBJC_IVAR___SRCarPlayPresentation_carPlayViewController);
    if (!v7)
    {
      __break(1u);
      return;
    }

    id v8 = *(void (**)(id))((swift_isaMask & *v7) + 0x120LL);
    id v9 = v4;
    uint64_t v10 = v7;
    v8(v9);

    sub_100052E50(v9);
    if (!v11)
    {

      goto LABEL_20;
    }

    uint64_t v12 = v11;
    Strong = (void *)swift_unknownObjectWeakLoadStrong(v3 + OBJC_IVAR___SRCarPlayPresentation_delegate, v11);
    if (!Strong)
    {

      swift_bridgeObjectRelease(v12);
      goto LABEL_20;
    }

    uint64_t v14 = Strong;
    if ([Strong respondsToSelector:"siriPresentation:didPresentIntentWithBundleId:"])
    {
      NSString v15 = String._bridgeToObjectiveC()();
      [v14 siriPresentation:v3 didPresentIntentWithBundleId:v15];
      swift_bridgeObjectRelease(v12);

      swift_unknownObjectRelease(v14);
      goto LABEL_20;
    }

    swift_bridgeObjectRelease(v12);
    id v22 = v14;
LABEL_19:
    swift_unknownObjectRelease(v22);
    goto LABEL_20;
  }

  if ((v5 & 1) == 0)
  {
    if (qword_1000D8A20 != -1) {
      swift_once(&qword_1000D8A20, sub_100066BF4);
    }
    uint64_t v23 = type metadata accessor for Logger(0LL);
    uint64_t v24 = sub_10004ADF0(v23, (uint64_t)qword_1000D9988);
    os_log_type_t v25 = static os_log_type_t.info.getter(v24);
    sub_1000681D8(v25, 0x10uLL, 0xD00000000000001ELL, 0x8000000100089F30LL, 0xD000000000000045LL, 0x8000000100089F50LL);
    goto LABEL_20;
  }

  if (qword_1000D8A20 != -1) {
    swift_once(&qword_1000D8A20, sub_100066BF4);
  }
  uint64_t v17 = type metadata accessor for Logger(0LL);
  uint64_t v18 = sub_10004ADF0(v17, (uint64_t)qword_1000D9988);
  os_log_type_t v19 = static os_log_type_t.info.getter(v18);
  sub_1000681D8(v19, 0x10uLL, 0xD00000000000001ELL, 0x8000000100089F30LL, 0xD000000000000034LL, 0x8000000100089FA0LL);
  sub_10004FD80();
  if ([(id)objc_opt_self(AFFeatureFlags) isSiriLocationServicesPromptingEnabled])
  {
    uint64_t v20 = (void *)swift_unknownObjectWeakLoadStrong(v2 + OBJC_IVAR___SRCarPlayPresentation_delegate, v16);
    if (v20)
    {
      os_log_type_t v21 = v20;
      [v20 siriPresentation:v3 setStatusViewHidden:0];
      id v22 = v21;
      goto LABEL_19;
    }
  }

void *sub_1000501A0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for SimpleItemStandard(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  char v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  int64_t v6 = *(void *)(a1 + 16);
  id v7 = _swiftEmptyArrayStorage;
  if (v6)
  {
    os_log_type_t v19 = _swiftEmptyArrayStorage;
    sub_100052068(0, v6, 0);
    id v7 = v19;
    uint64_t v8 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    uint64_t v9 = *(void *)(v3 + 72);
    uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    do
    {
      v10(v5, v8, v2);
      os_log_type_t v19 = v7;
      unint64_t v12 = v7[2];
      unint64_t v11 = v7[3];
      if (v12 >= v11 >> 1) {
        sub_100052068(v11 > 1, v12 + 1, 1);
      }
      uint64_t v17 = v2;
      uint64_t v18 = &protocol witness table for SimpleItemStandard;
      uint64_t v13 = (char *)sub_1000533B0(&v16);
      v10(v13, (uint64_t)v5, v2);
      uint64_t v14 = v19;
      v19[2] = v12 + 1;
      sub_1000533EC(&v16, (uint64_t)&v14[5 * v12 + 4]);
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      id v7 = v19;
      v8 += v9;
      --v6;
    }

    while (v6);
  }

  return v7;
}

void *sub_100050308(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = _swiftEmptyArrayStorage;
  if (v1)
  {
    __int128 v16 = _swiftEmptyArrayStorage;
    sub_100052084(0, v1, 0);
    uint64_t v4 = (_OWORD *)type metadata accessor for UUID(0LL);
    char v5 = v4;
    uint64_t v6 = *((void *)v4 - 1);
    uint64_t v7 = a1 + ((*(unsigned __int8 *)(v6 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
    uint64_t v8 = *(void *)(v6 + 64);
    uint64_t v9 = *(void *)(v6 + 72);
    uint64_t v10 = *(void (**)(char *, uint64_t, _OWORD *))(v6 + 16);
    do
    {
      __chkstk_darwin(v4);
      v10((char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL), v7, v5);
      swift_dynamicCast( v15,  (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v5,  (char *)&type metadata for Any + 8,  7LL);
      uint64_t v2 = v16;
      if ((swift_isUniquelyReferenced_nonNull_native(v16) & 1) == 0)
      {
        sub_100052084(0, v2[2] + 1LL, 1);
        uint64_t v2 = v16;
      }

      unint64_t v12 = v2[2];
      unint64_t v11 = v2[3];
      if (v12 >= v11 >> 1)
      {
        sub_100052084(v11 > 1, v12 + 1, 1);
        uint64_t v2 = v16;
      }

      v2[2] = v12 + 1;
      uint64_t v4 = sub_10005329C(v15, &v2[4 * v12 + 4]);
      v7 += v9;
      --v1;
    }

    while (v1);
  }

  return v2;
}

uint64_t sub_1000504F4(uint64_t result)
{
  uint64_t v2 = *(void **)(v1 + OBJC_IVAR___SRCarPlayPresentation_carPlayViewController);
  if (!v2)
  {
    __break(1u);
    goto LABEL_8;
  }

  uint64_t v3 = (void *)result;
  if (!result)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }

  uint64_t v4 = v2;
  id result = (uint64_t)[v3 stateData];
  if (!result)
  {
LABEL_9:
    __break(1u);
    return result;
  }

  char v5 = (void *)result;
  uint64_t v6 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v8 = v7;

  uint64_t v9 = *(void **)&v4[OBJC_IVAR____TtC4Siri23SRCarPlayViewController_currentSnippetViewController];
  if (v9)
  {
    uint64_t v10 = *(void *)&v4[OBJC_IVAR____TtC4Siri23SRCarPlayViewController_currentSnippetViewController + 8];
    uint64_t ObjectType = swift_getObjectType(*(void *)&v4[OBJC_IVAR____TtC4Siri23SRCarPlayViewController_currentSnippetViewController]);
    unint64_t v12 = *(void (**)(uint64_t, unint64_t, uint64_t, uint64_t))(v10 + 80);
    id v13 = v9;
    v12(v6, v8, ObjectType, v10);
  }

  sub_100053258(v6, v8);

  return 1LL;
}

void sub_10005063C()
{
  uint64_t v1 = *(char **)(v0 + OBJC_IVAR___SRCarPlayPresentation_carPlayViewController);
  if (v1)
  {
    uint64_t v2 = *(void **)&v1[OBJC_IVAR____TtC4Siri23SRCarPlayViewController_currentSnippetViewController];
    if (v2)
    {
      uint64_t v3 = *(void *)&v1[OBJC_IVAR____TtC4Siri23SRCarPlayViewController_currentSnippetViewController + 8];
      uint64_t ObjectType = swift_getObjectType(*(void *)&v1[OBJC_IVAR____TtC4Siri23SRCarPlayViewController_currentSnippetViewController]);
      char v5 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
      uint64_t v6 = v1;
      id v7 = v2;
      v5(ObjectType, v3);
    }
  }

  else
  {
    __break(1u);
  }

void sub_100050718(char a1)
{
  uint64_t v2 = v1;
  if ((a1 & 1) != 0)
  {
    if (qword_1000D8A20 != -1) {
      swift_once(&qword_1000D8A20, sub_100066BF4);
    }
    uint64_t v3 = type metadata accessor for Logger(0LL);
    uint64_t v4 = sub_10004ADF0(v3, (uint64_t)qword_1000D9988);
    os_log_type_t v5 = static os_log_type_t.info.getter(v4);
    sub_1000681D8(v5, 2uLL, 0xD000000000000032LL, 0x8000000100089DE0LL, 0xD000000000000034LL, 0x8000000100089E70LL);
    uint64_t v6 = OBJC_IVAR___SRCarPlayPresentation_carPlayViewController;
    id v7 = *(void **)&v1[OBJC_IVAR___SRCarPlayPresentation_carPlayViewController];
    if (v7)
    {
      unint64_t v8 = *(void **)((char *)v7 + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_currentSnippetViewController);
      if (!v8) {
        goto LABEL_7;
      }
      uint64_t v9 = *(void *)((char *)v7 + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_currentSnippetViewController + 8);
      uint64_t ObjectType = swift_getObjectType(*(void *)((char *)v7
                                                 + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_currentSnippetViewController));
      unint64_t v11 = *(void (**)(uint64_t, uint64_t))(v9 + 64);
      unint64_t v12 = v7;
      id v13 = v8;
      v11(ObjectType, v9);

      id v7 = *(void **)&v2[v6];
      if (v7)
      {
LABEL_7:
        uint64_t v14 = (*(uint64_t (**)(void))((swift_isaMask & *v7) + 0x128LL))();
        if ((v14 & 1) != 0)
        {
          os_log_type_t v15 = static os_log_type_t.info.getter(v14);
          sub_1000681D8( v15,  2uLL,  0xD000000000000032LL,  0x8000000100089DE0LL,  0xD000000000000024LL,  0x8000000100089F00LL);
          [(id)objc_opt_self(NSObject) cancelPreviousPerformRequestsWithTarget:v2 selector:"autodismiss" object:0];
          [v2 performSelector:"autodismiss" withObject:0 afterDelay:0.0];
        }

        else
        {
          uint64_t v27 = 0LL;
          unint64_t v28 = 0xE000000000000000LL;
          _StringGuts.grow(_:)(75LL);
          v21._countAndFlagsBits = 0xD000000000000040LL;
          v21._object = (void *)0x8000000100089EB0LL;
          String.append(_:)(v21);
          Double.write<A>(to:)( &v27,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation,  6.0);
          v22._countAndFlagsBits = 0x73646E6F63657320LL;
          v22._object = (void *)0xE90000000000002ELL;
          String.append(_:)(v22);
          uint64_t v23 = v27;
          unint64_t v24 = v28;
          os_log_type_t v26 = static os_log_type_t.info.getter(v25);
          sub_1000681D8(v26, 2uLL, 0xD000000000000032LL, 0x8000000100089DE0LL, v23, v24);
          swift_bridgeObjectRelease(v24);
          [(id)objc_opt_self(NSObject) cancelPreviousPerformRequestsWithTarget:v2 selector:"autodismiss" object:0];
          [v2 performSelector:"autodismiss" withObject:0 afterDelay:6.0];
        }

        return;
      }
    }

    else
    {
      __break(1u);
    }

    __break(1u);
    return;
  }

  if (qword_1000D8A20 != -1) {
    swift_once(&qword_1000D8A20, sub_100066BF4);
  }
  uint64_t v17 = type metadata accessor for Logger(0LL);
  uint64_t v18 = sub_10004ADF0(v17, (uint64_t)qword_1000D9988);
  os_log_type_t v19 = static os_log_type_t.info.getter(v18);
  sub_1000681D8(v19, 2uLL, 0xD000000000000032LL, 0x8000000100089DE0LL, 0xD000000000000047LL, 0x8000000100089E20LL);
  uint64_t v20 = (void *)objc_opt_self(&OBJC_CLASS___NSObject);
  [v20 cancelPreviousPerformRequestsWithTarget:v1 selector:"autodismiss" object:v16];
}

id sub_100050B1C(id result, char a2)
{
  if ((a2 & 1) != 0)
  {
    uint64_t v3 = v2;
    uint64_t v4 = result;
    id v5 = [result minimumAutoDismissalTimeInMs];
    if (v5)
    {
      uint64_t v6 = v5;
      double v7 = (double)(uint64_t)[v5 integerValue] / 1000.0;
      unint64_t v25 = 0LL;
      unint64_t v26 = 0xE000000000000000LL;
      _StringGuts.grow(_:)(51LL);
      v8._countAndFlagsBits = 0xD000000000000029LL;
      v8._object = (void *)0x8000000100089DB0LL;
      String.append(_:)(v8);
      Double.write<A>(to:)( &v25,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation,  v7);
      v9._countAndFlagsBits = 0x73646E6F63657320LL;
      v9._object = (void *)0xE800000000000000LL;
      String.append(_:)(v9);
      uint64_t v10 = v25;
      unint64_t v11 = v26;
      if (qword_1000D8A20 != -1) {
        swift_once(&qword_1000D8A20, sub_100066BF4);
      }
      uint64_t v12 = type metadata accessor for Logger(0LL);
      uint64_t v13 = sub_10004ADF0(v12, (uint64_t)qword_1000D9988);
      os_log_type_t v14 = static os_log_type_t.info.getter(v13);
      sub_1000681D8(v14, 2uLL, 0xD000000000000016LL, 0x8000000100089D90LL, v10, v11);
      swift_bridgeObjectRelease(v11);

      *(double *)(v3 + OBJC_IVAR___SRCarPlayPresentation_delayDismissalTimeInSec) = v7;
    }

    unint64_t v25 = 0LL;
    unint64_t v26 = 0xE000000000000000LL;
    _StringGuts.grow(_:)(27LL);
    swift_bridgeObjectRelease(v26);
    unint64_t v25 = 0xD000000000000019LL;
    unint64_t v26 = 0x8000000100089D70LL;
    unsigned int v15 = [v4 premptivelyResumeMedia];
    BOOL v16 = v15 == 0;
    if (v15) {
      uint64_t v17 = 1702195828LL;
    }
    else {
      uint64_t v17 = 0x65736C6166LL;
    }
    if (v16) {
      unint64_t v18 = 0xE500000000000000LL;
    }
    else {
      unint64_t v18 = 0xE400000000000000LL;
    }
    unint64_t v19 = v18;
    String.append(_:)(*(Swift::String *)&v17);
    swift_bridgeObjectRelease(v18);
    uint64_t v20 = v25;
    unint64_t v21 = v26;
    if (qword_1000D8A20 != -1) {
      swift_once(&qword_1000D8A20, sub_100066BF4);
    }
    uint64_t v22 = type metadata accessor for Logger(0LL);
    uint64_t v23 = sub_10004ADF0(v22, (uint64_t)qword_1000D9988);
    os_log_type_t v24 = static os_log_type_t.info.getter(v23);
    sub_1000681D8(v24, 2uLL, 0xD000000000000016LL, 0x8000000100089D90LL, v20, v21);
    swift_bridgeObjectRelease(v21);
    id result = [v4 premptivelyResumeMedia];
    *(_BYTE *)(v3 + OBJC_IVAR___SRCarPlayPresentation_shouldResumeMediaOnIdle) = (_BYTE)result;
  }

  return result;
}

void sub_100050E38(void (*a1)(void))
{
  uint64_t v2 = *(char **)(v1 + OBJC_IVAR___SRCarPlayPresentation_carPlayViewController);
  if (v2)
  {
    uint64_t v4 = *(void **)&v2[OBJC_IVAR____TtC4Siri23SRCarPlayViewController_currentSnippetViewController];
    if (v4)
    {
      uint64_t v5 = *(void *)&v2[OBJC_IVAR____TtC4Siri23SRCarPlayViewController_currentSnippetViewController + 8];
      uint64_t ObjectType = swift_getObjectType(*(void *)&v2[OBJC_IVAR____TtC4Siri23SRCarPlayViewController_currentSnippetViewController]);
      double v7 = *(void (**)(uint64_t, uint64_t))(v5 + 16);
      Swift::String v8 = v2;
      id v9 = v4;
      v7(ObjectType, v5);
    }

    if (a1)
    {
      a1();
      return;
    }
  }

  else
  {
    __break(1u);
  }

  __break(1u);
}

void sub_100050F7C(uint64_t a1)
{
  uint64_t v2 = *(char **)(v1 + OBJC_IVAR___SRCarPlayPresentation_carPlayViewController);
  if (v2)
  {
    if (*(void *)&v2[OBJC_IVAR____TtC4Siri23SRCarPlayViewController_currentSnippetViewController]) {
      BOOL v3 = a1 == 13;
    }
    else {
      BOOL v3 = 1;
    }
    if (!v3)
    {
      uint64_t v4 = qword_1000D8A20;
      uint64_t v5 = v2;
      id v9 = v5;
      if (v4 != -1) {
        swift_once(&qword_1000D8A20, sub_100066BF4);
      }
      uint64_t v6 = type metadata accessor for Logger(0LL);
      uint64_t v7 = sub_10004ADF0(v6, (uint64_t)qword_1000D9988);
      os_log_type_t v8 = static os_log_type_t.info.getter(v7);
      sub_1000681D8(v8, 0x10uLL, 0xD000000000000030LL, 0x8000000100089CF0LL, 0xD00000000000003ALL, 0x8000000100089D30LL);
      sub_100061C88(0LL, 0LL, 0);
    }
  }

  else
  {
    __break(1u);
  }

void sub_1000510C0(uint64_t a1, uint64_t a2)
{
  if (*(_BYTE *)(v2 + OBJC_IVAR___SRCarPlayPresentation_shouldRequestStartAttendingAfterTTSStarts) == 1)
  {
    if (qword_1000D8A20 != -1) {
      swift_once(&qword_1000D8A20, sub_100066BF4);
    }
    uint64_t v5 = type metadata accessor for Logger(0LL);
    uint64_t v6 = sub_10004ADF0(v5, (uint64_t)qword_1000D9988);
    os_log_type_t v7 = static os_log_type_t.info.getter(v6);
    sub_1000681D8(v7, 1uLL, 0xD000000000000025LL, 0x8000000100089C80LL, 0xD00000000000003ALL, 0x8000000100089CB0LL);
  }

  os_log_type_t v8 = *(_BYTE **)(v2 + OBJC_IVAR___SRCarPlayPresentation_carPlayViewController);
  if (v8)
  {
    v8[OBJC_IVAR____TtC4Siri23SRCarPlayViewController_isSpeaking] = 1;
    id v9 = *(void **)&v8[OBJC_IVAR____TtC4Siri23SRCarPlayViewController_currentSnippetViewController];
    if (v9)
    {
      uint64_t v10 = *(void *)&v8[OBJC_IVAR____TtC4Siri23SRCarPlayViewController_currentSnippetViewController + 8];
      uint64_t ObjectType = swift_getObjectType(*(void *)&v8[OBJC_IVAR____TtC4Siri23SRCarPlayViewController_currentSnippetViewController]);
      uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 48);
      uint64_t v13 = v8;
      id v14 = v9;
      v12(a1, a2, ObjectType, v10);
    }
  }

  else
  {
    __break(1u);
  }

void sub_1000512D4(void *a1)
{
  if (a1)
  {
    uint64_t v2 = v1;
    [(id)objc_opt_self(SRTipKitSignalEmitter) checkAndEmitSignalsForRequestOptions:a1];
    if ([a1 requestSource] == (id)14 || objc_msgSend(a1, "requestSource") == (id)13)
    {
      Strong = (void *)swift_unknownObjectWeakLoadStrong(v2 + OBJC_IVAR___SRCarPlayPresentation_delegate, v4);
      if (Strong)
      {
        uint64_t v6 = Strong;
        if ([Strong respondsToSelector:"siriPresentation:didPresentIntentWithBundleId:"])
        {
          id v7 = [a1 appBundleIdentifier];
          NSString v8 = v7;
          if (v7)
          {
            static String._unconditionallyBridgeFromObjectiveC(_:)(v7);
            uint64_t v10 = v9;

            NSString v8 = String._bridgeToObjectiveC()();
          }

          else
          {
            uint64_t v10 = 0LL;
          }

          [v6 siriPresentation:v2 didPresentIntentWithBundleId:v8];
          swift_bridgeObjectRelease(v10);
          swift_unknownObjectRelease(v6);
        }

        else
        {
          swift_unknownObjectRelease(v6);
        }
      }
    }

    unint64_t v11 = *(void **)(v2 + OBJC_IVAR___SRCarPlayPresentation_carPlayViewController);
    if (v11)
    {
      id v12 = v11;
      sub_100060F88(a1);

      *(_BYTE *)(v2 + OBJC_IVAR___SRCarPlayPresentation_shouldResumeMediaOnIdle) = 0;
      *(void *)(v2 + OBJC_IVAR___SRCarPlayPresentation_delayDismissalTimeInSec) = 0LL;
      return;
    }
  }

  else
  {
    __break(1u);
  }

  __break(1u);
}

void sub_1000514A8(uint64_t a1, uint64_t a2)
{
  BOOL v3 = *(char **)(v2 + OBJC_IVAR___SRCarPlayPresentation_carPlayViewController);
  if (!v3)
  {
    __break(1u);
    goto LABEL_7;
  }

  if (!a2)
  {
LABEL_7:
    __break(1u);
    return;
  }

  uint64_t v5 = *(void **)&v3[OBJC_IVAR____TtC4Siri23SRCarPlayViewController_currentSnippetViewController];
  if (v5)
  {
    uint64_t v7 = *(void *)&v3[OBJC_IVAR____TtC4Siri23SRCarPlayViewController_currentSnippetViewController + 8];
    uint64_t ObjectType = swift_getObjectType(*(void *)&v3[OBJC_IVAR____TtC4Siri23SRCarPlayViewController_currentSnippetViewController]);
    uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56);
    uint64_t v10 = v3;
    id v11 = v5;
    v9(a1, a2, ObjectType, v7);
  }

uint64_t sub_10005158C(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t))
{
  if (a3)
  {
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    uint64_t v8 = v7;
  }

  else
  {
    uint64_t v6 = 0LL;
    uint64_t v8 = 0LL;
  }

  id v9 = a1;
  a4(v6, v8);

  return swift_bridgeObjectRelease(v8);
}

void sub_1000516FC(uint64_t a1, uint64_t a2)
{
  BOOL v3 = v2;
  if ((v2[OBJC_IVAR___SRCarPlayPresentation_siriIsIdleAndQuiet] & 1) != 0)
  {
    if (qword_1000D8A20 != -1) {
      swift_once(&qword_1000D8A20, sub_100066BF4);
    }
    uint64_t v10 = type metadata accessor for Logger(0LL);
    uint64_t v11 = sub_10004ADF0(v10, (uint64_t)qword_1000D9988);
    os_log_type_t v12 = static os_log_type_t.info.getter(v11);
    sub_1000681D8(v12, 2uLL, 0xD00000000000001FLL, 0x8000000100089B00LL, 0xD000000000000054LL, 0x8000000100089C20LL);
    goto LABEL_21;
  }

  Strong = (void *)swift_unknownObjectWeakLoadStrong(&v2[OBJC_IVAR___SRCarPlayPresentation_dataSource], a2);
  if (Strong)
  {
    uint64_t v5 = Strong;
    unint64_t v6 = (unint64_t)[Strong siriStateForSiriPresentation:v3];
    swift_unknownObjectRelease(v5);
    if ((v6 & 0xFFFFFFFFFFFFFFFELL) == 4)
    {
      _StringGuts.grow(_:)(74LL);
      v7._countAndFlagsBits = 0xD000000000000022LL;
      v7._object = (void *)0x8000000100089B60LL;
      String.append(_:)(v7);
      if (v6 == 4)
      {
        unint64_t v16 = 0xE900000000000067LL;
        unint64_t v8 = 0x6E69646E65747441LL;
      }

      else
      {
        if (v6 == 5)
        {
          unint64_t v8 = 0xD000000000000010LL;
          id v9 = "IdleAndAttending";
        }

        else
        {
          if (qword_1000D8A20 != -1) {
            swift_once(&qword_1000D8A20, sub_100066BF4);
          }
          uint64_t v17 = type metadata accessor for Logger(0LL);
          uint64_t v18 = sub_10004ADF0(v17, (uint64_t)qword_1000D9988);
          os_log_type_t v19 = static os_log_type_t.info.getter(v18);
          sub_1000681D8( v19,  0LL,  0x7470697263736564LL,  0xEB000000006E6F69LL,  0xD000000000000017LL,  0x8000000100089B90LL);
          unint64_t v8 = 0xD00000000000001ELL;
          id v9 = "<Unrecognized SiriUISiriState>";
        }

        unint64_t v16 = (unint64_t)(v9 - 32) | 0x8000000000000000LL;
      }

      unint64_t v20 = v16;
      String.append(_:)(*(Swift::String *)&v8);
      swift_bridgeObjectRelease(v16);
      v21._countAndFlagsBits = 0xD000000000000026LL;
      v21._object = (void *)0x8000000100089BD0LL;
      String.append(_:)(v21);
      if (qword_1000D8A20 != -1) {
        swift_once(&qword_1000D8A20, sub_100066BF4);
      }
      uint64_t v22 = type metadata accessor for Logger(0LL);
      uint64_t v23 = sub_10004ADF0(v22, (uint64_t)qword_1000D9988);
      os_log_type_t v24 = static os_log_type_t.info.getter(v23);
      sub_1000681D8(v24, 2uLL, 0xD00000000000001FLL, 0x8000000100089B00LL, 0LL, 0xE000000000000000LL);
      swift_bridgeObjectRelease(0xE000000000000000LL);
LABEL_21:
      [(id)objc_opt_self(NSObject) cancelPreviousPerformRequestsWithTarget:v3 selector:"autodismiss" object:0];
      [v3 performSelector:"autodismiss" withObject:0 afterDelay:0.0];
      return;
    }
  }

  if (qword_1000D8A20 != -1) {
    swift_once(&qword_1000D8A20, sub_100066BF4);
  }
  uint64_t v13 = type metadata accessor for Logger(0LL);
  uint64_t v14 = sub_10004ADF0(v13, (uint64_t)qword_1000D9988);
  os_log_type_t v15 = static os_log_type_t.info.getter(v14);
  sub_1000681D8(v15, 0x20002uLL, 0xD00000000000001FLL, 0x8000000100089B00LL, 0xD000000000000031LL, 0x8000000100089B20LL);
}

void sub_100051AB8(void *a1)
{
  uint64_t v2 = v1;
  id v3 = [a1 description];
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
  unint64_t v6 = v5;

  if (qword_1000D8A20 != -1) {
    swift_once(&qword_1000D8A20, sub_100066BF4);
  }
  uint64_t v7 = type metadata accessor for Logger(0LL);
  uint64_t v8 = sub_10004ADF0(v7, (uint64_t)qword_1000D9988);
  os_log_type_t v9 = static os_log_type_t.info.getter(v8);
  sub_1000681D8(v9, 0x10uLL, 0x72756769666E6F63LL, 0xEF293A726F662865LL, v4, v6);
  swift_bridgeObjectRelease(v6);
  uint64_t v10 = (void *)objc_opt_self(&OBJC_CLASS___AFUISiriSession);
  [v10 availabilityState];
  id v11 = [v10 availabilityState];
  char v12 = [(id)objc_opt_self(AFSystemAssistantExperienceStatusManager) isSAEEnabled];
  char v13 = _s4Siri36GenerativeModelsCompatabilityWrapperC21siriGMAssetsAvailableSbyFZ_0();
  char v14 = AFDeviceSupportsDisablingServerFallbackWhenMissingAsset();
  uint64_t v15 = sub_100052BE0((uint64_t)v11, v12, v13 & 1, v14);
  if ((v15 & 1) != 0)
  {
    os_log_type_t v16 = static os_log_type_t.info.getter(v15);
    sub_1000681D8(v16, 0x10uLL, 0x72756769666E6F63LL, 0xEF293A726F662865LL, 0xD00000000000003DLL, 0x80000001000899C0LL);
    uint64_t v17 = *(void **)(v2 + OBJC_IVAR___SRCarPlayPresentation_carPlayViewController);
    if (v17)
    {
      uint64_t v18 = *(void (**)(void))((swift_isaMask & *v17) + 0x118LL);
      os_log_type_t v19 = v17;
      v18();

      Strong = (void *)swift_unknownObjectWeakLoadStrong(v2 + OBJC_IVAR___SRCarPlayPresentation_delegate, v20);
      if (Strong)
      {
        uint64_t v22 = Strong;
        [Strong siriPresentation:v2 setStatusViewHidden:1];
        swift_unknownObjectRelease(v22);
      }
    }

    else
    {
      __break(1u);
    }
  }

void *sub_100051D0C(uint64_t a1, uint64_t a2)
{
  id result = (void *)swift_unknownObjectWeakLoadStrong(v2 + OBJC_IVAR___SRCarPlayPresentation_delegate, a2);
  if (result)
  {
    uint64_t v4 = result;
    [result siriPresentationDidPresentUserInterface:v2];
    return (void *)swift_unknownObjectRelease(v4);
  }

  return result;
}

void *sub_100051D5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100051DE8(a1, a2, a3, (SEL *)&selRef_siriPresentationDidRequestCancelSpeechSynthesis_);
}

void *sub_100051D6C(uint64_t a1, uint64_t a2)
{
  id result = (void *)swift_unknownObjectWeakLoadStrong(v2 + OBJC_IVAR___SRCarPlayPresentation_delegate, a2);
  if (result)
  {
    unint64_t v5 = result;
    [result dismissSiriPresentation:v2 withReason:a2];
    return (void *)swift_unknownObjectRelease(v5);
  }

  return result;
}

uint64_t sub_100051DD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100052F78(a2, a3);
}

void *sub_100051DDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100051DE8(a1, a2, a3, (SEL *)&selRef_siriPresentationDidRequestRestartSpeechSynthesis_);
}

void *sub_100051DE8(uint64_t a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  id result = (void *)swift_unknownObjectWeakLoadStrong(v4 + OBJC_IVAR___SRCarPlayPresentation_delegate, a2);
  if (result)
  {
    uint64_t v7 = result;
    return (void *)swift_unknownObjectRelease(v7);
  }

  return result;
}

void *sub_100051E60(uint64_t a1, uint64_t a2)
{
  id result = (void *)swift_unknownObjectWeakLoadStrong(v2 + OBJC_IVAR___SRCarPlayPresentation_delegate, a2);
  if (result)
  {
    uint64_t v4 = result;
    [result siriPresentation:v2 setStatusViewHidden:0];
    return (void *)swift_unknownObjectRelease(v4);
  }

  return result;
}

void *sub_100051EB4(void (*a1)(uint64_t *__return_ptr, id *), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  unint64_t v20 = (unint64_t)&_swiftEmptyArrayStorage;
  uint64_t v6 = *(void *)((a3 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  swift_bridgeObjectRetain(a3);
  for (; v6; uint64_t v6 = _CocoaArrayWrapper.endIndex.getter(v16))
  {
    for (uint64_t i = 4LL; ; ++i)
    {
      id v9 = (a3 & 0xC000000000000001LL) != 0
         ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(i - 4, a3)
         : *(id *)(a3 + 8 * i);
      uint64_t v10 = v9;
      uint64_t v11 = i - 3;
      if (__OFADD__(i - 4, 1LL)) {
        break;
      }
      id v19 = v9;
      a1(&v18, &v19);
      if (v4)
      {
        swift_bridgeObjectRelease(a3);

        return (void *)swift_bridgeObjectRelease(v20);
      }

      uint64_t v12 = v18;
      if (v18)
      {
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
        unint64_t v14 = *(void *)((v20 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
        unint64_t v13 = *(void *)((v20 & 0xFFFFFFFFFFFFFF8LL) + 0x18);
        if (v14 >= v13 >> 1) {
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v13 > 1, v14 + 1, 1LL);
        }
        uint64_t v8 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v14, v12);
        specialized Array._endMutation()(v8);
      }

      if (v11 == v6)
      {
        swift_bridgeObjectRelease(a3);
        return (void *)v20;
      }
    }

    __break(1u);
LABEL_17:
    if (a3 < 0) {
      uint64_t v16 = a3;
    }
    else {
      uint64_t v16 = a3 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a3);
  }

  swift_bridgeObjectRelease(a3);
  return &_swiftEmptyArrayStorage;
}

uint64_t sub_10005204C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100052208(a1, a2, a3, (void *)*v3);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_100052068(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000523E8(a1, a2, a3, (void *)*v3);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_100052084(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100052588(a1, a2, a3, *v3);
  uint64_t *v3 = (char *)result;
  return result;
}

uint64_t sub_1000520A0(char a1, int64_t a2, char a3, char *a4)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        goto LABEL_32;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_10004A8E8(&qword_1000D9248);
    uint64_t v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7LL);
    int64_t v12 = j__malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 17;
    }
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * (v13 >> 4);
  }

  else
  {
    uint64_t v11 = (char *)_swiftEmptyArrayStorage;
  }

  unint64_t v14 = v11 + 32;
  uint64_t v15 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v8]) {
      memmove(v14, v15, 16 * v8);
    }
    *((void *)a4 + 2) = 0LL;
    goto LABEL_30;
  }

  if (v15 >= &v14[16 * v8] || v14 >= &v15[16 * v8])
  {
    swift_arrayInitWithCopy(v14);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }

LABEL_32:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

uint64_t sub_100052208(char a1, int64_t a2, char a3, void *a4)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v15 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }

  uint64_t v10 = sub_10004A8E8(&qword_1000D9240);
  uint64_t v11 = *(void *)(type metadata accessor for SimpleItemStandard(0LL) - 8);
  uint64_t v12 = *(void *)(v11 + 72);
  uint64_t v13 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v14 = (v13 + 32) & ~v13;
  uint64_t v15 = (void *)swift_allocObject(v10, v14 + v12 * v9, v13 | 7);
  size_t v16 = j__malloc_size(v15);
  if (!v12)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }

  if (v16 - v14 == 0x8000000000000000LL && v12 == -1) {
    goto LABEL_34;
  }
  _OWORD v15[2] = v8;
  v15[3] = 2 * ((uint64_t)(v16 - v14) / v12);
LABEL_19:
  uint64_t v18 = type metadata accessor for SimpleItemStandard(0LL);
  uint64_t v19 = *(void *)(v18 - 8);
  unint64_t v20 = (*(unsigned __int8 *)(v19 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  Swift::String v21 = (char *)v15 + v20;
  uint64_t v22 = (char *)a4 + v20;
  if ((a1 & 1) != 0)
  {
    if (v15 < a4 || v21 >= &v22[*(void *)(v19 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack(v21, v22, v8, v18);
    }

    else if (v15 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }

    a4[2] = 0LL;
    goto LABEL_32;
  }

  uint64_t v23 = *(void *)(v19 + 72) * v8;
  os_log_type_t v24 = &v21[v23];
  unint64_t v25 = (unint64_t)&v22[v23];
  if (v22 >= v24 || (unint64_t)v21 >= v25)
  {
    swift_arrayInitWithCopy(v21);
LABEL_32:
    swift_release(a4);
    return (uint64_t)v15;
  }

uint64_t sub_1000523E8(char a1, int64_t a2, char a3, void *a4)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        goto LABEL_30;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_10004A8E8(&qword_1000D9230);
    uint64_t v11 = (void *)swift_allocObject(v10, 40 * v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    v11[2] = v8;
    v11[3] = 2 * ((uint64_t)(v12 - 32) / 40);
  }

  else
  {
    uint64_t v11 = _swiftEmptyArrayStorage;
  }

  unint64_t v13 = (unint64_t)(v11 + 4);
  unint64_t v14 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= v14 + 40 * v8) {
      memmove(v11 + 4, a4 + 4, 40 * v8);
    }
    a4[2] = 0LL;
    goto LABEL_28;
  }

  if (v14 >= v13 + 40 * v8 || v13 >= v14 + 40 * v8)
  {
    sub_10004A8E8(&qword_1000D9238);
    swift_arrayInitWithCopy(v11 + 4);
LABEL_28:
    swift_release(a4);
    return (uint64_t)v11;
  }

uint64_t sub_100052588(char a1, int64_t a2, char a3, char *a4)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        goto LABEL_32;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_10004A8E8(&qword_1000D91F0);
    uint64_t v11 = (char *)swift_allocObject(v10, 32 * v9 + 32, 7LL);
    int64_t v12 = j__malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 1;
    }
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * (v13 >> 5);
  }

  else
  {
    uint64_t v11 = (char *)_swiftEmptyArrayStorage;
  }

  unint64_t v14 = v11 + 32;
  uint64_t v15 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[32 * v8]) {
      memmove(v14, v15, 32 * v8);
    }
    *((void *)a4 + 2) = 0LL;
    goto LABEL_30;
  }

  if (v15 >= &v14[32 * v8] || v14 >= &v15[32 * v8])
  {
    swift_arrayInitWithCopy(v14);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }

id sub_1000526F4(void *a1)
{
  uint64_t v2 = type metadata accessor for Response(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  unint64_t v5 = (char *)v42 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v45[3] = &type metadata for DefaultDisambiguationItemConverter;
  v45[4] = &off_1000BBAF8;
  id result = [a1 items];
  if (result)
  {
    int64_t v7 = result;
    unint64_t v8 = sub_100053314();
    uint64_t v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v7, v8);

    __chkstk_darwin(v10);
    v42[-2] = v45;
    uint64_t v11 = sub_100051EB4((void (*)(uint64_t *__return_ptr, id *))sub_100053350, (uint64_t)&v42[-4], v9);
    swift_bridgeObjectRelease(v9);
    int64_t v12 = sub_10005DA10((uint64_t)v11);
    swift_bridgeObjectRelease(v11);
    if (v12[2])
    {
      id v13 = [objc_allocWithZone(SAUIVisualResponseSnippet) init];
      id v14 = [a1 aceId];
      if (v14)
      {
        uint64_t v15 = v14;
        static String._unconditionallyBridgeFromObjectiveC(_:)(v14);
        uint64_t v17 = v16;
      }

      else
      {
        uint64_t v22 = type metadata accessor for UUID(0LL);
        v42[1] = v42;
        uint64_t v44 = v2;
        uint64_t v23 = *(void *)(v22 - 8);
        uint64_t v24 = __chkstk_darwin(v22);
        Swift::String v43 = v5;
        uint64_t v26 = v3;
        uint64_t v27 = (char *)v42 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0LL);
        uint64_t v28 = UUID.init()(v24);
        UUID.uuidString.getter(v28);
        uint64_t v17 = v29;
        uint64_t v30 = *(void (**)(char *, uint64_t))(v23 + 8);
        id v31 = v27;
        uint64_t v3 = v26;
        unint64_t v5 = v43;
        uint64_t v2 = v44;
        v30(v31, v22);
      }

      NSString v32 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v17);
      [v13 setAceId:v32];

      id v33 = v13;
      id v34 = [a1 refId];
      [v33 setRefId:v34];

      id v21 = v33;
      NSString v35 = String._bridgeToObjectiveC()();
      [v21 setViewId:v35];

      uint64_t v36 = sub_1000501A0((uint64_t)v12);
      swift_bridgeObjectRelease(v12);
      Response.init(_:backgrounds:ornaments:hideRedactedElements:)( v36,  _swiftEmptyArrayStorage,  _swiftEmptyArrayStorage,  0LL);
      unint64_t v37 = sub_100053368();
      uint64_t v38 = ProtobufBuilder.serializedData()(v2, v37);
      unint64_t v40 = v39;
      Class isa = Data._bridgeToObjectiveC()().super.isa;
      sub_100053258(v38, v40);
      [v21 setModelData:isa];

      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    }

    else
    {
      swift_bridgeObjectRelease(v12);
      if (qword_1000D8A20 != -1) {
        swift_once(&qword_1000D8A20, sub_100066BF4);
      }
      uint64_t v18 = type metadata accessor for Logger(0LL);
      uint64_t v19 = sub_10004ADF0(v18, (uint64_t)qword_1000D9988);
      os_log_type_t v20 = static os_log_type_t.info.getter(v19);
      sub_1000681D8( v20,  0x10uLL,  0xD00000000000001BLL,  0x800000010008A540LL,  0xD000000000000034LL,  0x800000010008A560LL);
      id v21 = [objc_allocWithZone(SAUIVisualResponseSnippet) init];
    }

    sub_1000532F4(v45);
    return v21;
  }

  else
  {
    __break(1u);
  }

  return result;
}

void sub_100052B18()
{
  if ((v0[OBJC_IVAR___SRCarPlayPresentation_siriIsIdleAndQuiet] & 1) != 0)
  {
    uint64_t v1 = v0;
    uint64_t v2 = *(void **)&v0[OBJC_IVAR___SRCarPlayPresentation_carPlayViewController];
    if (v2)
    {
      if (((*(uint64_t (**)(void))((swift_isaMask & *v2) + 0x128LL))() & 1) == 0)
      {
        [(id)objc_opt_self(NSObject) cancelPreviousPerformRequestsWithTarget:v1 selector:"autodismiss" object:0];
        [v1 performSelector:"autodismiss" withObject:0 afterDelay:6.0];
      }
    }

    else
    {
      __break(1u);
    }
  }

uint64_t sub_100052BE0(uint64_t a1, char a2, char a3, char a4)
{
  v8._countAndFlagsBits = 0xD000000000000015LL;
  v8._object = (void *)0x8000000100089A00LL;
  String.append(_:)(v8);
  unint64_t v9 = 0xE900000000000065LL;
  unint64_t v10 = 0x6C62616C69617661LL;
  switch(a1)
  {
    case 0LL:
      break;
    case 1LL:
      unint64_t v9 = 0xE90000000000006BLL;
      unint64_t v10 = 0x726F7774654E6F6ELL;
      break;
    case 2LL:
      unint64_t v10 = 0xD000000000000014LL;
      unint64_t v9 = 0x8000000100089AE0LL;
      break;
    case 3LL:
      unint64_t v9 = 0xE800000000000000LL;
      unint64_t v10 = 0x7374657373416F6ELL;
      break;
    default:
      unint64_t v9 = 0xE700000000000000LL;
      unint64_t v10 = 0x6E776F6E6B6E75LL;
      break;
  }

  unint64_t v11 = v9;
  String.append(_:)(*(Swift::String *)&v10);
  swift_bridgeObjectRelease(v9);
  v12._object = (void *)0x8000000100089A20LL;
  v12._countAndFlagsBits = 0xD000000000000010LL;
  String.append(_:)(v12);
  if ((a2 & 1) != 0) {
    uint64_t v13 = 1702195828LL;
  }
  else {
    uint64_t v13 = 0x65736C6166LL;
  }
  if ((a2 & 1) != 0) {
    unint64_t v14 = 0xE400000000000000LL;
  }
  else {
    unint64_t v14 = 0xE500000000000000LL;
  }
  unint64_t v15 = v14;
  String.append(_:)(*(Swift::String *)&v13);
  swift_bridgeObjectRelease(v14);
  v16._countAndFlagsBits = 0xD000000000000019LL;
  v16._object = (void *)0x8000000100089A40LL;
  String.append(_:)(v16);
  if ((a3 & 1) != 0) {
    uint64_t v17 = 1702195828LL;
  }
  else {
    uint64_t v17 = 0x65736C6166LL;
  }
  if ((a3 & 1) != 0) {
    unint64_t v18 = 0xE400000000000000LL;
  }
  else {
    unint64_t v18 = 0xE500000000000000LL;
  }
  unint64_t v19 = v18;
  String.append(_:)(*(Swift::String *)&v17);
  swift_bridgeObjectRelease(v18);
  if (qword_1000D8A20 != -1) {
    swift_once(&qword_1000D8A20, sub_100066BF4);
  }
  uint64_t v20 = type metadata accessor for Logger(0LL);
  uint64_t v21 = sub_10004ADF0(v20, (uint64_t)qword_1000D9988);
  os_log_type_t v22 = static os_log_type_t.info.getter(v21);
  sub_1000681D8(v22, 0x10uLL, 0xD00000000000007FLL, 0x8000000100089A60LL, 0LL, 0xE000000000000000LL);
  swift_bridgeObjectRelease(0xE000000000000000LL);
  char v23 = a1 != 0;
  if (!a1 && (a4 & 1) != 0) {
    char v23 = a2 & (a3 ^ 1);
  }
  return v23 & 1;
}

void *sub_100052E50(void *a1)
{
  uint64_t v2 = objc_opt_self(&OBJC_CLASS___SAUIVisualResponseSnippet);
  uint64_t v3 = swift_dynamicCastObjCClass(a1, v2);
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    id v5 = a1;
    id v6 = [v4 sash];
    int64_t v7 = v6;
    if (v6) {
      goto LABEL_6;
    }
LABEL_8:

    return v7;
  }

  uint64_t v8 = objc_opt_self(&OBJC_CLASS___SAUIPluginSnippet);
  int64_t v7 = (void *)swift_dynamicCastObjCClass(a1, v8);
  if (!v7) {
    return v7;
  }
  id v5 = a1;
  id v6 = [v7 sash];
  int64_t v7 = v6;
  if (!v6) {
    goto LABEL_8;
  }
LABEL_6:
  id v9 = [v6 applicationBundleIdentifier];

  if (v9)
  {
    int64_t v7 = (void *)static String._unconditionallyBridgeFromObjectiveC(_:)(v9);
  }

  else
  {

    return 0LL;
  }

  return v7;
}

uint64_t sub_100052F78(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t result = swift_unknownObjectWeakLoadStrong(v2 + OBJC_IVAR___SRCarPlayPresentation_delegate, a2);
  if (result)
  {
    id v6 = (void *)result;
    Class isa = UUID._bridgeToObjectiveC()().super.isa;
    [v6 siriPresentation:v3 performAceCommand:a1 conversationItemIdentifier:0 turnIdentifier:isa completion:0];

    return swift_unknownObjectRelease(v6);
  }

  return result;
}

uint64_t sub_100053000(uint64_t result)
{
  uint64_t v2 = *(void **)(v1 + OBJC_IVAR___SRCarPlayPresentation_carPlayViewController);
  if (!v2)
  {
    __break(1u);
    goto LABEL_16;
  }

  uint64_t v3 = v1;
  uint64_t v4 = result;
  id v5 = v2;
  sub_1000639B8(v4);

  uint64_t result = swift_unknownObjectWeakLoadStrong(v3 + OBJC_IVAR___SRCarPlayPresentation_delegate, v6);
  if (!result) {
    return result;
  }
  int64_t v7 = (void *)result;
  uint64_t v8 = sub_10004A8E8((uint64_t *)&unk_1000D9880);
  __chkstk_darwin(v8);
  unint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_1000531D0(v4, (uint64_t)v10);
  uint64_t v11 = type metadata accessor for URL(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1LL, v11);
  if ((_DWORD)result == 1)
  {
LABEL_16:
    __break(1u);
    return result;
  }

  uint64_t v13 = URL.scheme.getter();
  if (v14)
  {
    uint64_t v15 = v14;
    if (v13 == 0x6D65746970616DLL && v14 == 0xE700000000000000LL) {
      char v17 = 1;
    }
    else {
      char v17 = _stringCompareWithSmolCheck(_:_:expecting:)(v13, v14, 0x6D65746970616DLL, 0xE700000000000000LL, 0LL);
    }
    swift_bridgeObjectRelease(v15);
  }

  else
  {
    char v17 = 0;
  }

  (*(void (**)(char *, uint64_t))(v12 + 8))(v10, v11);
  [v7 siriPresentation:v3 requestsTouchPassThroughEnabled:v17 & 1];
  return swift_unknownObjectRelease(v7);
}

uint64_t sub_100053190(uint64_t a1)
{
  uint64_t v2 = sub_10004A8E8((uint64_t *)&unk_1000D9880);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_1000531D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10004A8E8((uint64_t *)&unk_1000D9880);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_100053218(uint64_t result, uint64_t a2)
{
  if (result) {
    return swift_release(a2);
  }
  return result;
}

uint64_t sub_100053228()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_10005324C()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16LL))();
}

uint64_t sub_100053258(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release(result);
  }

  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

_OWORD *sub_10005329C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_1000532B0()
{
  unint64_t result = qword_1000D9210;
  if (!qword_1000D9210)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000837DC, &type metadata for SiriUIFeaturesFlags);
    atomic_store(result, (unint64_t *)&qword_1000D9210);
  }

  return result;
}

uint64_t sub_1000532F4(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unint64_t sub_100053314()
{
  unint64_t result = qword_1000D9220;
  if (!qword_1000D9220)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___SAUIListItem);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_1000D9220);
  }

  return result;
}

void sub_100053350(uint64_t *a1@<X0>, void *a2@<X8>)
{
}

unint64_t sub_100053368()
{
  unint64_t result = qword_1000D9228;
  if (!qword_1000D9228)
  {
    uint64_t v1 = type metadata accessor for Response(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for Response, v1);
    atomic_store(result, (unint64_t *)&qword_1000D9228);
  }

  return result;
}

void *sub_1000533B0(void *a1)
{
  uint64_t v1 = a1;
  if ((*(_BYTE *)(*(void *)(a1[3] - 8LL) + 82LL) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (void *)v2;
  }

  return v1;
}

uint64_t sub_1000533EC(__int128 *a1, uint64_t a2)
{
  __int128 v2 = *a1;
  __int128 v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_100053404(uint64_t a1)
{
  return a1;
}

uint64_t SiriUISiriState.description.getter(uint64_t a1)
{
  uint64_t result = 1701602377LL;
  switch(a1)
  {
    case 0LL:
      return result;
    case 1LL:
      uint64_t v3 = 0x6E657473694CLL;
      goto LABEL_9;
    case 2LL:
      uint64_t result = 0x676E696B6E696854LL;
      break;
    case 3LL:
      uint64_t result = 0x73736563637553LL;
      break;
    case 4LL:
      uint64_t v3 = 0x646E65747441LL;
LABEL_9:
      uint64_t result = v3 & 0xFFFFFFFFFFFFLL | 0x6E69000000000000LL;
      break;
    case 5LL:
      uint64_t result = 0xD000000000000010LL;
      break;
    default:
      if (qword_1000D8A20 != -1) {
        swift_once(&qword_1000D8A20, sub_100066BF4);
      }
      uint64_t v4 = type metadata accessor for Logger(0LL);
      uint64_t v5 = sub_10004ADF0(v4, (uint64_t)qword_1000D9988);
      os_log_type_t v6 = static os_log_type_t.info.getter(v5);
      sub_1000681D8(v6, 0LL, 0x7470697263736564LL, 0xEB000000006E6F69LL, 0xD000000000000017LL, 0x8000000100089B90LL);
      uint64_t result = 0xD00000000000001ELL;
      break;
  }

  return result;
}

uint64_t sub_100053580()
{
  return SiriUISiriState.description.getter(*v0);
}

unint64_t SiriUISiriEvent.description.getter(uint64_t a1)
{
  unint64_t result = 0xD000000000000012LL;
  switch(a1)
  {
    case 0LL:
      return result;
    case 1LL:
    case 2LL:
      unint64_t result = 0xD000000000000014LL;
      break;
    case 3LL:
      unint64_t result = 0xD000000000000018LL;
      break;
    case 4LL:
      unint64_t result = 0xD000000000000015LL;
      break;
    case 5LL:
      unint64_t result = 0xD000000000000010LL;
      break;
    case 6LL:
    case 7LL:
      unint64_t result = 0x4674736575716552LL;
      break;
    case 8LL:
      unint64_t result = 0x53646E616D6D6F43LL;
      break;
    case 9LL:
    case 10LL:
      unint64_t result = 0x6E69646E65747441LL;
      break;
    case 11LL:
      unint64_t result = 0x6544686365657053LL;
      break;
    case 12LL:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 13LL:
      unint64_t result = 0x694D686365657053LL;
      break;
    case 14LL:
      unint64_t result = 0xD000000000000011LL;
      break;
    case 15LL:
      unint64_t result = 0xD00000000000001ALL;
      break;
    default:
      if (qword_1000D8A20 != -1) {
        swift_once(&qword_1000D8A20, sub_100066BF4);
      }
      uint64_t v3 = type metadata accessor for Logger(0LL);
      uint64_t v4 = sub_10004ADF0(v3, (uint64_t)qword_1000D9988);
      os_log_type_t v5 = static os_log_type_t.info.getter(v4);
      sub_1000681D8(v5, 0LL, 0x7470697263736564LL, 0xEB000000006E6F69LL, 0xD000000000000017LL, 0x800000010008A600LL);
      unint64_t result = 0xD00000000000001ELL;
      break;
  }

  return result;
}

unint64_t sub_1000537D0()
{
  return SiriUISiriEvent.description.getter(*v0);
}

uint64_t sub_1000537DC(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + 16)
    && (uint64_t v4 = *(void *)(a2 + 40),
        uint64_t v5 = type metadata accessor for GenerativeModelsAvailability.Availability.RestrictedInfo.RestrictedReason(0LL),
        uint64_t v6 = sub_10004E3AC( &qword_1000D92E0,  (uint64_t (*)(uint64_t))&type metadata accessor for GenerativeModelsAvailability.Availability.RestrictedInfo.RestrictedReason,  (uint64_t)&protocol conformance descriptor for GenerativeModelsAvailability.Availability.RestrictedInfo.RestrictedReason),  v7 = dispatch thunk of Hashable._rawHashValue(seed:)(v4, v5, v6),  v8 = -1LL << *(_BYTE *)(a2 + 32),  v9 = v7 & ~v8,  v20 = a2 + 56,  ((*(void *)(a2 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v9) & 1) != 0))
  {
    uint64_t v18 = ~v8;
    uint64_t v19 = a1;
    uint64_t v10 = *(void *)(v5 - 8);
    uint64_t v12 = *(void *)(v10 + 64);
    uint64_t v11 = *(void *)(v10 + 72);
    uint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v10 + 16);
    do
    {
      __chkstk_darwin(v7);
      v13((char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL), *(void *)(a2 + 48) + v11 * v9, v5);
      uint64_t v14 = sub_10004E3AC( &qword_1000D92E8,  (uint64_t (*)(uint64_t))&type metadata accessor for GenerativeModelsAvailability.Availability.RestrictedInfo.RestrictedReason,  (uint64_t)&protocol conformance descriptor for GenerativeModelsAvailability.Availability.RestrictedInfo.RestrictedReason);
      char v15 = dispatch thunk of static Equatable.== infix(_:_:)( (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v19,  v5,  v14);
      uint64_t v7 = (*(uint64_t (**)(char *, uint64_t))(v10 + 8))( (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL),  v5);
      if ((v15 & 1) != 0) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v18;
    }

    while (((*(void *)(v20 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v9) & 1) != 0);
  }

  else
  {
    char v15 = 0;
  }

  return v15 & 1;
}

id GenerativeModelsCompatabilityWrapper.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GenerativeModelsCompatabilityWrapper();
  return objc_msgSendSuper2(&v2, "init");
}

id GenerativeModelsCompatabilityWrapper.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GenerativeModelsCompatabilityWrapper();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t _s4Siri36GenerativeModelsCompatabilityWrapperC21siriGMAssetsAvailableSbyFZ_0()
{
  uint64_t v0 = type metadata accessor for GenerativeModelsAvailability.Availability(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = *(void *)(v1 + 64);
  __chkstk_darwin(v0);
  unint64_t v67 = (v2 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v3 = (char *)&v62 - v67;
  uint64_t v4 = type metadata accessor for GenerativeModelsAvailability(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v62 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for GenerativeModelsAvailability.Parameters(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v62 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  GenerativeModelsAvailability.Parameters.init(useCaseIdentifiers:)(&off_1000BB360);
  static GenerativeModelsAvailability.current(parameters:)(v11);
  uint64_t v12 = *(uint64_t (**)(char *, uint64_t))(v9 + 8);
  uint64_t v13 = v3;
  uint64_t v14 = v1;
  uint64_t v15 = v0;
  uint64_t v16 = v12(v11, v8);
  GenerativeModelsAvailability.availability.getter(v16);
  uint64_t v17 = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  __chkstk_darwin(v17);
  uint64_t v18 = (char *)&v62 - v67;
  (*(void (**)(char *, char *, uint64_t))(v14 + 16))((char *)&v62 - v67, v13, v0);
  int v19 = (*(uint64_t (**)(char *, uint64_t))(v14 + 88))(v18, v0);
  if (&enum case for GenerativeModelsAvailability.Availability.restricted(_:)
    && v19 == enum case for GenerativeModelsAvailability.Availability.restricted(_:))
  {
    unint64_t v67 = (unint64_t)v13;
    (*(void (**)(char *, uint64_t))(v14 + 96))(v18, v0);
    uint64_t v20 = type metadata accessor for GenerativeModelsAvailability.Availability.RestrictedInfo(0LL);
    char v66 = &v62;
    __chkstk_darwin(v20);
    os_log_type_t v22 = (char *)&v62 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    uint64_t v64 = v24;
    uint64_t v65 = v23;
    uint64_t v25 = (*(uint64_t (**)(char *, char *))(v24 + 32))(v22, v18);
    uint64_t v63 = GenerativeModelsAvailability.Availability.RestrictedInfo.reasons.getter(v25);
    unint64_t v68 = 0LL;
    unint64_t v69 = 0xE000000000000000LL;
    _StringGuts.grow(_:)(50LL);
    uint64_t v26 = swift_bridgeObjectRelease(v69);
    unint64_t v68 = 0xD000000000000030LL;
    unint64_t v69 = 0x800000010008A7E0LL;
    uint64_t v27 = GenerativeModelsAvailability.Availability.RestrictedInfo.reasons.getter(v26);
    uint64_t v28 = type metadata accessor for GenerativeModelsAvailability.Availability.RestrictedInfo.RestrictedReason(0LL);
    uint64_t v29 = sub_10004E3AC( &qword_1000D92E0,  (uint64_t (*)(uint64_t))&type metadata accessor for GenerativeModelsAvailability.Availability.RestrictedInfo.RestrictedReason,  (uint64_t)&protocol conformance descriptor for GenerativeModelsAvailability.Availability.RestrictedInfo.RestrictedReason);
    v30._countAndFlagsBits = Set.description.getter(v27, v28, v29);
    object = v30._object;
    String.append(_:)(v30);
    swift_bridgeObjectRelease(v27);
    swift_bridgeObjectRelease(object);
    uint64_t v33 = v68;
    unint64_t v32 = v69;
    if (qword_1000D8A20 != -1) {
      swift_once(&qword_1000D8A20, sub_100066BF4);
    }
    uint64_t v34 = type metadata accessor for Logger(0LL);
    uint64_t v35 = sub_10004ADF0(v34, (uint64_t)qword_1000D9988);
    os_log_type_t v36 = static os_log_type_t.info.getter(v35);
    unint64_t v62 = 0x800000010008A780LL;
    sub_1000681D8(v36, 0LL, 0xD000000000000017LL, 0x800000010008A780LL, v33, v32);
    uint64_t v37 = swift_bridgeObjectRelease(v32);
    uint64_t v38 = *(void *)(v28 - 8);
    __chkstk_darwin(v37);
    unint64_t v40 = (char *)&v62 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    (*(void (**)(char *, void, uint64_t))(v38 + 104))( v40,  enum case for GenerativeModelsAvailability.Availability.RestrictedInfo.RestrictedReason.siriAssetIsNotReady(_:),  v28);
    uint64_t v41 = v63;
    char v42 = sub_1000537DC((uint64_t)v40, v63);
    swift_bridgeObjectRelease(v41);
    (*(void (**)(char *, uint64_t))(v38 + 8))(v40, v28);
    uint64_t v43 = (*(uint64_t (**)(char *, uint64_t))(v64 + 8))(v22, v65);
    if ((v42 & 1) != 0)
    {
      (*(void (**)(unint64_t, uint64_t))(v14 + 8))(v67, v15);
      return 0LL;
    }

    os_log_type_t v61 = static os_log_type_t.info.getter(v43);
    sub_1000681D8(v61, 0LL, 0xD000000000000017LL, v62, 0xD000000000000035LL, 0x800000010008A820LL);
    (*(void (**)(unint64_t, uint64_t))(v14 + 8))(v67, v15);
    return 1LL;
  }

  if (!&enum case for GenerativeModelsAvailability.Availability.unavailable(_:)
    || v19 != enum case for GenerativeModelsAvailability.Availability.unavailable(_:))
  {
    if (!&enum case for GenerativeModelsAvailability.Availability.available(_:)
      || v19 != enum case for GenerativeModelsAvailability.Availability.available(_:))
    {
      uint64_t v60 = *(void (**)(char *, uint64_t))(v14 + 8);
      v60(v13, v0);
      v60(v18, v0);
      return 0LL;
    }

    (*(void (**)(char *, uint64_t))(v14 + 8))(v13, v0);
    return 1LL;
  }

  (*(void (**)(char *, uint64_t))(v14 + 96))(v18, v0);
  uint64_t v45 = type metadata accessor for GenerativeModelsAvailability.Availability.UnavailableInfo(0LL);
  uint64_t v46 = *(void *)(v45 - 8);
  __chkstk_darwin(v45);
  uint64_t v48 = (char *)&v62 - ((v47 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, char *, uint64_t))(v46 + 32))(v48, v18, v45);
  unint64_t v68 = 0LL;
  unint64_t v69 = 0xE000000000000000LL;
  _StringGuts.grow(_:)(51LL);
  v49._countAndFlagsBits = 0xD000000000000031LL;
  v49._object = (void *)0x800000010008A7A0LL;
  String.append(_:)(v49);
  uint64_t v50 = GenerativeModelsAvailability.Availability.UnavailableInfo.reasons.getter();
  uint64_t v51 = type metadata accessor for GenerativeModelsAvailability.Availability.UnavailableInfo.UnavailableReason(0LL);
  uint64_t v52 = sub_10004E3AC( &qword_1000D92D8,  (uint64_t (*)(uint64_t))&type metadata accessor for GenerativeModelsAvailability.Availability.UnavailableInfo.UnavailableReason,  (uint64_t)&protocol conformance descriptor for GenerativeModelsAvailability.Availability.UnavailableInfo.UnavailableReason);
  v53._countAndFlagsBits = Set.description.getter(v50, v51, v52);
  os_log_type_t v54 = v53._object;
  String.append(_:)(v53);
  swift_bridgeObjectRelease(v50);
  swift_bridgeObjectRelease(v54);
  uint64_t v55 = v68;
  unint64_t v56 = v69;
  if (qword_1000D8A20 != -1) {
    swift_once(&qword_1000D8A20, sub_100066BF4);
  }
  uint64_t v57 = type metadata accessor for Logger(0LL);
  uint64_t v58 = sub_10004ADF0(v57, (uint64_t)qword_1000D9988);
  os_log_type_t v59 = static os_log_type_t.info.getter(v58);
  sub_1000681D8(v59, 0LL, 0xD000000000000017LL, 0x800000010008A780LL, v55, v56);
  swift_bridgeObjectRelease(v56);
  (*(void (**)(char *, uint64_t))(v46 + 8))(v48, v45);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v13, v0);
  return 0LL;
}

uint64_t type metadata accessor for GenerativeModelsCompatabilityWrapper()
{
  return objc_opt_self(&OBJC_CLASS___GMSCompatabilityWrapper);
}

uint64_t sub_100054064(uint64_t a1)
{
  return sub_1000543CC( a1,  (uint64_t)&type metadata for FaceDetectionObservation,  &qword_1000D93D0,  &qword_1000D92F0,  algn_1000D92F8);
}

uint64_t sub_100054084(char a1, double a2)
{
  if (qword_1000D8A00 != -1) {
    swift_once(&qword_1000D8A00, sub_100054064);
  }
  uint64_t v4 = qword_1000D92F0;
  swift_bridgeObjectRetain(*(void *)algn_1000D92F8);
  swift_bridgeObjectRelease(0xE000000000000000LL);
  v5._object = (void *)0x800000010008A9E0LL;
  v5._countAndFlagsBits = 0xD000000000000011LL;
  String.append(_:)(v5);
  if ((a1 & 1) != 0) {
    uint64_t v6 = 1702195828LL;
  }
  else {
    uint64_t v6 = 0x65736C6166LL;
  }
  if ((a1 & 1) != 0) {
    unint64_t v7 = 0xE400000000000000LL;
  }
  else {
    unint64_t v7 = 0xE500000000000000LL;
  }
  unint64_t v8 = v7;
  String.append(_:)(*(Swift::String *)&v6);
  swift_bridgeObjectRelease(v7);
  v9._countAndFlagsBits = 0x7473656D6974202CLL;
  v9._object = (void *)0xEC0000003A706D61LL;
  String.append(_:)(v9);
  v10._countAndFlagsBits = sub_1000541D0(2LL, a2);
  object = v10._object;
  String.append(_:)(v10);
  swift_bridgeObjectRelease(object);
  v12._countAndFlagsBits = 41LL;
  v12._object = (void *)0xE100000000000000LL;
  String.append(_:)(v12);
  return v4;
}

uint64_t sub_1000541D0(uint64_t a1, double a2)
{
  *(double *)os_log_type_t v22 = a2;
  uint64_t v3 = sub_10004A8E8(&qword_1000D9478);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  unint64_t v7 = (char *)v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v5);
  Swift::String v9 = (char *)v22 - v8;
  uint64_t v10 = type metadata accessor for Locale(0LL);
  uint64_t v11 = __chkstk_darwin(v10);
  uint64_t v13 = (char *)v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static Locale.autoupdatingCurrent.getter(v11);
  unint64_t v14 = sub_100059030();
  FloatingPointFormatStyle.init(locale:)(v13, &type metadata for Double, v14);
  uint64_t v15 = type metadata accessor for NumberFormatStyleConfiguration.Precision(0LL);
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)v22 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static NumberFormatStyleConfiguration.Precision.fractionLength(_:)(a1);
  FloatingPointFormatStyle.precision(_:)(v18, v3);
  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  int v19 = *(void (**)(char *, uint64_t))(v4 + 8);
  v19(v9, v3);
  unint64_t v20 = sub_100059074();
  BinaryFloatingPoint.formatted<A>(_:)(v23, v7, &type metadata for Double, v3, v14, v20);
  v19(v7, v3);
  v22[0] = v23[0];
  v22[1] = v23[1];
  return String.init<A>(_:)( v22,  &type metadata for String,  &protocol witness table for String,  &protocol witness table for String);
}

uint64_t sub_1000543A0()
{
  return sub_100054084(*(_BYTE *)v0, *(double *)(v0 + 8));
}

uint64_t sub_1000543AC(uint64_t a1)
{
  return sub_1000543CC( a1,  (uint64_t)&type metadata for FaceDetectionError,  &qword_1000D93C8,  &qword_1000D9300,  algn_1000D9308);
}

uint64_t sub_1000543CC(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t *a4, void *a5)
{
  uint64_t v10 = a2;
  uint64_t v7 = sub_10004A8E8(a3);
  uint64_t result = String.init<A>(describing:)(&v10, v7);
  *a4 = result;
  *a5 = v9;
  return result;
}

uint64_t sub_100054414(uint64_t a1)
{
  if (a1)
  {
    uint64_t v13 = 0LL;
    unint64_t v14 = 0xE000000000000000LL;
    swift_errorRetain(a1);
    _StringGuts.grow(_:)(29LL);
    if (qword_1000D8A08 != -1) {
      swift_once(&qword_1000D8A08, sub_1000543AC);
    }
    uint64_t v2 = qword_1000D9300;
    uint64_t v3 = *(void **)algn_1000D9308;
    swift_bridgeObjectRetain(*(void *)algn_1000D9308);
    v4._countAndFlagsBits = v2;
    v4._object = v3;
    String.append(_:)(v4);
    swift_bridgeObjectRelease(v3);
    v5._object = (void *)0x800000010008A9C0LL;
    v5._countAndFlagsBits = 0xD000000000000018LL;
    String.append(_:)(v5);
    uint64_t v12 = a1;
    uint64_t v6 = sub_10004A8E8(&qword_1000D93C0);
    _print_unlocked<A, B>(_:_:)( &v12,  &v13,  v6,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
    v7._countAndFlagsBits = 41LL;
    v7._object = (void *)0xE100000000000000LL;
    String.append(_:)(v7);
    swift_errorRelease(a1);
  }

  else
  {
    uint64_t v13 = 0LL;
    _StringGuts.grow(_:)(45LL);
    if (qword_1000D8A08 != -1) {
      swift_once(&qword_1000D8A08, sub_1000543AC);
    }
    uint64_t v9 = qword_1000D9300;
    unint64_t v8 = *(void *)algn_1000D9308;
    swift_bridgeObjectRetain(*(void *)algn_1000D9308);
    swift_bridgeObjectRelease(0xE000000000000000LL);
    uint64_t v13 = v9;
    unint64_t v14 = v8;
    v10._countAndFlagsBits = 0xD00000000000002BLL;
    v10._object = (void *)0x800000010008A990LL;
    String.append(_:)(v10);
  }

  return v13;
}

uint64_t sub_1000545BC()
{
  return sub_100054414(*v0);
}

uint64_t sub_1000545C4()
{
  uint64_t v3 = type metadata accessor for SiriQuickTypeGestureActivationManager(0LL);
  uint64_t v0 = sub_10004A8E8(&qword_1000D94B8);
  uint64_t result = String.init<A>(describing:)(&v3, v0);
  qword_1000D9310 = result;
  *(void *)algn_1000D9318 = v2;
  return result;
}

id SiriQuickTypeGestureActivationManager.__allocating_init()()
{
  return SiriQuickTypeGestureActivationManager.init()();
}

id SiriQuickTypeGestureActivationManager.init()()
{
  *(void *)(v0 + 112) = 0LL;
  *(void *)(v0 + 120) = 0LL;
  *(_BYTE *)(v0 + 12_Block_object_dispose((const void *)(v9 - 80), 8) = -1;
  *(void *)(v0 + 136) = 0LL;
  *(void *)(v0 + 144) = 0LL;
  *(_BYTE *)(v0 + 152) = -1;
  uint64_t v1 = v0 + OBJC_IVAR____TtC4Siri37SiriQuickTypeGestureActivationManager_latestFaceDetectionResultFuture;
  uint64_t v2 = sub_10004A8E8(&qword_1000D8A30);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56LL))(v1, 1LL, 1LL, v2);
  *(_BYTE *)(v0 + OBJC_IVAR____TtC4Siri37SiriQuickTypeGestureActivationManager_isFaceDetectionInFlight) = 0;
  uint64_t v3 = OBJC_IVAR____TtC4Siri37SiriQuickTypeGestureActivationManager_attentionAwarenessClient;
  id v4 = objc_allocWithZone(&OBJC_CLASS___AWAttentionAwarenessClient);
  swift_retain(v0);
  id v5 = [v4 init];
  id v6 = [objc_allocWithZone(AWAttentionAwarenessConfiguration) init];
  NSString v7 = String._bridgeToObjectiveC()();
  [v6 setIdentifier:v7];

  [v6 setEventMask:128];
  [v5 setConfiguration:v6];

  *(void *)(v0 + v3) = v5;
  swift_release(v0);
  v9.receiver = (id)v0;
  v9.super_class = (Class)type metadata accessor for SiriQuickTypeGestureActivationManager(0LL);
  return objc_msgSendSuper2(&v9, "init");
}

uint64_t type metadata accessor for SiriQuickTypeGestureActivationManager(uint64_t a1)
{
  uint64_t result = qword_1000D93A0;
  if (!qword_1000D93A0) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for SiriQuickTypeGestureActivationManager);
  }
  return result;
}

uint64_t SiriQuickTypeGestureActivationManager.deinit()
{
  uint64_t v1 = v0;
  uint64_t v2 = OBJC_IVAR____TtC4Siri37SiriQuickTypeGestureActivationManager_attentionAwarenessClient;
  uint64_t v3 = *(void **)(v0 + OBJC_IVAR____TtC4Siri37SiriQuickTypeGestureActivationManager_attentionAwarenessClient);
  id v23 = 0LL;
  unsigned int v4 = [v3 invalidateWithError:&v23];
  id v5 = v23;
  if (v4)
  {
    id v6 = v23;
  }

  else
  {
    id v7 = v23;
    uint64_t v8 = _convertNSErrorToError(_:)(v5);

    swift_willThrow();
    if (qword_1000D8A18 != -1) {
      swift_once(&qword_1000D8A18, sub_100057C1C);
    }
    uint64_t v9 = type metadata accessor for Logger(0LL);
    sub_10004ADF0(v9, (uint64_t)qword_1000DA5D8);
    swift_errorRetain(v8);
    uint64_t v10 = swift_errorRetain(v8);
    uint64_t v11 = (os_log_s *)Logger.logObject.getter(v10);
    os_log_type_t v12 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = swift_slowAlloc(22LL, -1LL);
      unint64_t v14 = (uint64_t *)swift_slowAlloc(8LL, -1LL);
      unint64_t v20 = (void *)swift_slowAlloc(32LL, -1LL);
      id v23 = v20;
      *(_DWORD *)uint64_t v13 = 136315394;
      if (qword_1000D8A10 != -1) {
        swift_once(&qword_1000D8A10, sub_1000545C4);
      }
      uint64_t v15 = qword_1000D9310;
      unint64_t v16 = *(void *)algn_1000D9318;
      swift_bridgeObjectRetain(*(void *)algn_1000D9318);
      uint64_t v21 = sub_100057FC0(v15, v16, (uint64_t *)&v23);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, &v22, v13 + 4, v13 + 12);
      swift_bridgeObjectRelease(v16);
      *(_WORD *)(v13 + 12) = 2112;
      swift_errorRetain(v8);
      uint64_t v17 = _swift_stdlib_bridgeErrorToNSError(v8);
      uint64_t v21 = v17;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, &v22, v13 + 14, v13 + 22);
      *unint64_t v14 = v17;
      swift_errorRelease(v8);
      swift_errorRelease(v8);
      _os_log_impl( (void *)&_mh_execute_header,  v11,  v12,  "#activation #quickTypeGate %s: attention awareness client invalidation failed with error: %@",  (uint8_t *)v13,  0x16u);
      uint64_t v18 = sub_10004A8E8(&qword_1000D9340);
      swift_arrayDestroy(v14, 1LL, v18);
      swift_slowDealloc(v14, -1LL, -1LL);
      swift_arrayDestroy(v20, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v20, -1LL, -1LL);
      swift_slowDealloc(v13, -1LL, -1LL);

      swift_errorRelease(v8);
    }

    else
    {
      swift_errorRelease(v8);
      swift_errorRelease(v8);
      swift_errorRelease(v8);
    }
  }

  sub_100057C94(*(void *)(v1 + 112), *(void *)(v1 + 120), *(_BYTE *)(v1 + 128));
  sub_100057C94(*(void *)(v1 + 136), *(void *)(v1 + 144), *(_BYTE *)(v1 + 152));
  sub_10004E034( v1 + OBJC_IVAR____TtC4Siri37SiriQuickTypeGestureActivationManager_latestFaceDetectionResultFuture,  &qword_1000D9338);

  swift_defaultActor_destroy(v1);
  return v1;
}

uint64_t SiriQuickTypeGestureActivationManager.__deallocating_deinit()
{
  return swift_defaultActor_deallocate(v0);
}

uint64_t SiriQuickTypeGestureActivationManager.prewarmForFirstTapOfQuickTypeToSiriGesture()()
{
  v1[6] = v0;
  uint64_t v2 = sub_10004A8E8(&qword_1000D9350);
  v1[7] = v2;
  uint64_t v3 = *(void *)(v2 - 8);
  v1[8] = v3;
  v1[9] = swift_task_alloc((*(void *)(v3 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = sub_10004A8E8(&qword_1000D9338);
  v1[10] = swift_task_alloc((*(void *)(*(void *)(v4 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_100054BC8, v0, 0LL);
}

uint64_t sub_100054BC8()
{
  uint64_t v1 = *(void *)(v0 + 48);
  uint64_t v2 = OBJC_IVAR____TtC4Siri37SiriQuickTypeGestureActivationManager_isFaceDetectionInFlight;
  if ((*(_BYTE *)(v1 + OBJC_IVAR____TtC4Siri37SiriQuickTypeGestureActivationManager_isFaceDetectionInFlight) & 1) != 0)
  {
    if (qword_1000D8A18 != -1) {
      swift_once(&qword_1000D8A18, sub_100057C1C);
    }
    uint64_t v3 = type metadata accessor for Logger(0LL);
    uint64_t v4 = sub_10004ADF0(v3, (uint64_t)qword_1000DA5D8);
    id v5 = (os_log_s *)Logger.logObject.getter(v4);
    os_log_type_t v6 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v5, v6))
    {
      id v7 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v8 = swift_slowAlloc(32LL, -1LL);
      uint64_t v25 = v8;
      *(_DWORD *)id v7 = 136315138;
      if (qword_1000D8A10 != -1) {
        swift_once(&qword_1000D8A10, sub_1000545C4);
      }
      uint64_t v9 = qword_1000D9310;
      unint64_t v10 = *(void *)algn_1000D9318;
      swift_bridgeObjectRetain(*(void *)algn_1000D9318);
      *(void *)(v0 + 40) = sub_100057FC0(v9, v10, &v25);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 40, v0 + 48, v7 + 4, v7 + 12);
      swift_bridgeObjectRelease(v10);
      _os_log_impl( (void *)&_mh_execute_header,  v5,  v6,  "#activation #quickTypeGate %s: face detection already in flight - skipping prewarm",  v7,  0xCu);
      swift_arrayDestroy(v8, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v8, -1LL, -1LL);
      swift_slowDealloc(v7, -1LL, -1LL);
    }
  }

  else
  {
    uint64_t v12 = *(void *)(v0 + 72);
    uint64_t v11 = *(void *)(v0 + 80);
    uint64_t v14 = *(void *)(v0 + 56);
    uint64_t v13 = *(void *)(v0 + 64);
    uint64_t v15 = *(void *)(v1 + 136);
    uint64_t v16 = *(void *)(v1 + 144);
    uint64_t v17 = *(void *)(v1 + 112);
    uint64_t v18 = *(void *)(v1 + 120);
    *(void *)(v1 + 112) = v15;
    *(void *)(v1 + 120) = v16;
    unsigned __int8 v19 = *(_BYTE *)(v1 + 152);
    unsigned __int8 v20 = *(_BYTE *)(v1 + 128);
    *(_BYTE *)(v1 + 12_Block_object_dispose((const void *)(v9 - 80), 8) = v19;
    sub_100058600(v15, v16, v19);
    sub_100057C94(v17, v18, v20);
    *(_BYTE *)(v1 + v2) = 1;
    (*(void (**)(uint64_t, void, uint64_t))(v13 + 104))( v12,  enum case for AsyncThrowingStream.Continuation.BufferingPolicy.unbounded<A, B>(_:),  v14);
    AsyncThrowingStream.init<>(_:bufferingPolicy:_:)( &type metadata for FaceDetectionObservation,  v12,  sub_100058624,  v1,  &type metadata for FaceDetectionObservation);
    uint64_t v21 = sub_10004A8E8(&qword_1000D8A30);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56LL))(v11, 0LL, 1LL, v21);
    uint64_t v22 = v1 + OBJC_IVAR____TtC4Siri37SiriQuickTypeGestureActivationManager_latestFaceDetectionResultFuture;
    swift_beginAccess(v22, v0 + 16, 33LL, 0LL);
    sub_10005862C(v11, v22);
    swift_endAccess(v0 + 16);
  }

  uint64_t v23 = *(void *)(v0 + 72);
  swift_task_dealloc(*(void *)(v0 + 80));
  swift_task_dealloc(v23);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100054E84(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10004A8E8(&qword_1000D93E8);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v4);
  id v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = sub_10004A8E8(&qword_1000D93F0);
  __chkstk_darwin(v8);
  unint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56LL))(v10, 1LL, 1LL, v11);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  unint64_t v12 = sub_1000586BC();
  uint64_t v13 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v14 = (v13 + 40) & ~v13;
  uint64_t v15 = (char *)swift_allocObject(&unk_1000BB9D0, v14 + v6, v13 | 7);
  *((void *)v15 + 2) = a2;
  *((void *)v15 + 3) = v12;
  *((void *)v15 + 4) = a2;
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(&v15[v14], v7, v4);
  swift_retain_n(a2, 2LL);
  uint64_t v16 = sub_10005502C((uint64_t)v10, (uint64_t)&unk_1000D9498, (uint64_t)v15);
  return swift_release(v16);
}

uint64_t sub_100054FD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v7 = (void *)swift_task_alloc(dword_1000D93B4);
  *(void *)(v5 + 16) = v7;
  *id v7 = v5;
  v7[1] = sub_10005930C;
  return sub_100056B3C(a5);
}

uint64_t sub_10005502C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1LL, v6) == 1)
  {
    sub_10004E034(a1, &qword_1000D93F0);
    uint64_t v8 = 7168LL;
    uint64_t v9 = *(void *)(a3 + 16);
    if (v9)
    {
LABEL_3:
      uint64_t v10 = *(void *)(a3 + 24);
      uint64_t ObjectType = swift_getObjectType(v9);
      swift_unknownObjectRetain(v9);
      uint64_t v12 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
      uint64_t v14 = v13;
      swift_unknownObjectRelease(v9);
      goto LABEL_6;
    }
  }

  else
  {
    unsigned __int8 v15 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    uint64_t v8 = v15 | 0x1C00LL;
    uint64_t v9 = *(void *)(a3 + 16);
    if (v9) {
      goto LABEL_3;
    }
  }

  uint64_t v12 = 0LL;
  uint64_t v14 = 0LL;
LABEL_6:
  uint64_t v16 = swift_allocObject(&unk_1000BB9F8, 32LL, 7LL);
  *(void *)(v16 + 16) = a2;
  *(void *)(v16 + 24) = a3;
  if (v14 | v12)
  {
    v19[0] = 0LL;
    v19[1] = 0LL;
    uint64_t v17 = v19;
    v19[2] = v12;
    v19[3] = v14;
  }

  else
  {
    uint64_t v17 = 0LL;
  }

  return swift_task_create(v8, v17, (char *)&type metadata for () + 8, &unk_1000D94A8, v16);
}

uint64_t sub_100055298(const void *a1, uint64_t a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  uint64_t v4 = dword_1000D934C;
  swift_retain(a2);
  uint64_t v5 = (void *)swift_task_alloc(v4);
  v2[4] = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1000552F8;
  return SiriQuickTypeGestureActivationManager.prewarmForFirstTapOfQuickTypeToSiriGesture()();
}

uint64_t sub_1000552F8()
{
  uint64_t v1 = *(void (***)(void))(*v0 + 24);
  uint64_t v2 = *(void *)(*v0 + 16);
  uint64_t v4 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 32));
  swift_release(v2);
  v1[2](v1);
  _Block_release(v1);
  return (*(uint64_t (**)(void))(v4 + 8))();
}

uint64_t SiriQuickTypeGestureActivationManager.cancelPrewarmForFirstTapOfQuickTypeToSiriGesture()()
{
  *(void *)(v1 + 72) = v0;
  uint64_t v2 = sub_10004A8E8(&qword_1000D9338);
  *(void *)(v1 + 80) = swift_task_alloc((*(void *)(*(void *)(v2 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_1000553E8, v0, 0LL);
}

uint64_t sub_1000553E8()
{
  uint64_t v1 = *(void *)(v0 + 72);
  uint64_t v2 = OBJC_IVAR____TtC4Siri37SiriQuickTypeGestureActivationManager_isFaceDetectionInFlight;
  if (*(_BYTE *)(v1 + OBJC_IVAR____TtC4Siri37SiriQuickTypeGestureActivationManager_isFaceDetectionInFlight) == 1)
  {
    uint64_t v3 = *(void **)(v1 + OBJC_IVAR____TtC4Siri37SiriQuickTypeGestureActivationManager_attentionAwarenessClient);
    *(void *)(v0 + 4_Block_object_dispose((const void *)(v9 - 80), 8) = 0LL;
    unsigned int v4 = [v3 cancelPollForAttentionWithError:v0 + 48];
    uint64_t v5 = *(void **)(v0 + 48);
    if (v4)
    {
      id v6 = v5;
    }

    else
    {
      id v15 = v5;
      uint64_t v16 = _convertNSErrorToError(_:)(v5);

      swift_willThrow();
      if (qword_1000D8A18 != -1) {
        swift_once(&qword_1000D8A18, sub_100057C1C);
      }
      uint64_t v17 = type metadata accessor for Logger(0LL);
      sub_10004ADF0(v17, (uint64_t)qword_1000DA5D8);
      swift_errorRetain(v16);
      uint64_t v18 = swift_errorRetain(v16);
      unsigned __int8 v19 = (os_log_s *)Logger.logObject.getter(v18);
      os_log_type_t v20 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v19, v20))
      {
        os_log_type_t v34 = v20;
        log = v19;
        id v31 = (uint64_t *)(v0 + 56);
        unint64_t v32 = (uint64_t *)(v0 + 64);
        uint64_t v21 = swift_slowAlloc(22LL, -1LL);
        uint64_t v33 = (uint64_t *)swift_slowAlloc(8LL, -1LL);
        uint64_t v35 = swift_slowAlloc(32LL, -1LL);
        uint64_t v37 = v35;
        *(_DWORD *)uint64_t v21 = 136315394;
        if (qword_1000D8A10 != -1) {
          swift_once(&qword_1000D8A10, sub_1000545C4);
        }
        uint64_t v23 = qword_1000D9310;
        unint64_t v22 = *(void *)algn_1000D9318;
        swift_bridgeObjectRetain(*(void *)algn_1000D9318);
        uint64_t *v31 = sub_100057FC0(v23, v22, &v37);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v31, v32, v21 + 4, v21 + 12);
        swift_bridgeObjectRelease(v22);
        *(_WORD *)(v21 + 12) = 2112;
        swift_errorRetain(v16);
        uint64_t v24 = _swift_stdlib_bridgeErrorToNSError(v16);
        uint64_t *v32 = v24;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v32, v0 + 72, v21 + 14, v21 + 22);
        uint64_t *v33 = v24;
        swift_errorRelease(v16);
        swift_errorRelease(v16);
        _os_log_impl( (void *)&_mh_execute_header,  log,  v34,  "#activation #quickTypeGate %s: error cancelling polling: %@",  (uint8_t *)v21,  0x16u);
        uint64_t v25 = sub_10004A8E8(&qword_1000D9340);
        swift_arrayDestroy(v33, 1LL, v25);
        swift_slowDealloc(v33, -1LL, -1LL);
        swift_arrayDestroy(v35, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v35, -1LL, -1LL);
        swift_slowDealloc(v21, -1LL, -1LL);

        swift_errorRelease(v16);
      }

      else
      {
        swift_errorRelease(v16);
        swift_errorRelease(v16);
        swift_errorRelease(v16);
      }
    }

    uint64_t v27 = *(void *)(v0 + 72);
    uint64_t v26 = *(void *)(v0 + 80);
    uint64_t v28 = sub_10004A8E8(&qword_1000D8A30);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56LL))(v26, 1LL, 1LL, v28);
    uint64_t v29 = v27 + OBJC_IVAR____TtC4Siri37SiriQuickTypeGestureActivationManager_latestFaceDetectionResultFuture;
    swift_beginAccess(v29, v0 + 16, 33LL, 0LL);
    sub_10005862C(v26, v29);
    swift_endAccess(v0 + 16);
    *(_BYTE *)(v1 + v2) = 0;
  }

  else
  {
    if (qword_1000D8A18 != -1) {
      swift_once(&qword_1000D8A18, sub_100057C1C);
    }
    uint64_t v7 = type metadata accessor for Logger(0LL);
    uint64_t v8 = sub_10004ADF0(v7, (uint64_t)qword_1000DA5D8);
    uint64_t v9 = (os_log_s *)Logger.logObject.getter(v8);
    os_log_type_t v10 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v12 = swift_slowAlloc(32LL, -1LL);
      uint64_t v37 = v12;
      *(_DWORD *)uint64_t v11 = 136315138;
      if (qword_1000D8A10 != -1) {
        swift_once(&qword_1000D8A10, sub_1000545C4);
      }
      uint64_t v13 = qword_1000D9310;
      unint64_t v14 = *(void *)algn_1000D9318;
      swift_bridgeObjectRetain(*(void *)algn_1000D9318);
      *(void *)(v0 + 40) = sub_100057FC0(v13, v14, &v37);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 40, v0 + 48, v11 + 4, v11 + 12);
      swift_bridgeObjectRelease(v14);
      _os_log_impl( (void *)&_mh_execute_header,  v9,  v10,  "#activation #quickTypeGate %s: no face detection in-flight - skipping cancel",  v11,  0xCu);
      swift_arrayDestroy(v12, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v12, -1LL, -1LL);
      swift_slowDealloc(v11, -1LL, -1LL);
    }
  }

  swift_task_dealloc(*(void *)(v0 + 80));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100055A0C(const void *a1, uint64_t a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  uint64_t v4 = dword_1000D935C;
  swift_retain(a2);
  uint64_t v5 = (void *)swift_task_alloc(v4);
  v2[4] = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10005931C;
  return SiriQuickTypeGestureActivationManager.cancelPrewarmForFirstTapOfQuickTypeToSiriGesture()();
}

uint64_t SiriQuickTypeGestureActivationManager.canActivate()()
{
  v1[18] = v0;
  uint64_t v2 = sub_10004A8E8(&qword_1000D9368);
  v1[19] = v2;
  uint64_t v3 = *(void *)(v2 - 8);
  v1[20] = v3;
  v1[21] = swift_task_alloc((*(void *)(v3 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t v4 = (*(void *)(*(void *)(sub_10004A8E8(&qword_1000D9338) - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v1[22] = swift_task_alloc(v4);
  v1[23] = swift_task_alloc(v4);
  uint64_t v5 = sub_10004A8E8(&qword_1000D8A30);
  v1[24] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v1[25] = v6;
  v1[26] = swift_task_alloc((*(void *)(v6 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_100055B30, v0, 0LL);
}

uint64_t sub_100055B30()
{
  uint64_t v1 = *(void *)(v0 + 144);
  if ((*(_BYTE *)(v1 + 128) & 1) != 0)
  {
LABEL_4:
    uint64_t v5 = *(void *)(v0 + 192);
    uint64_t v6 = *(void *)(v0 + 200);
    uint64_t v7 = *(void *)(v0 + 184);
    uint64_t v8 = OBJC_IVAR____TtC4Siri37SiriQuickTypeGestureActivationManager_latestFaceDetectionResultFuture;
    *(void *)(v0 + 216) = OBJC_IVAR____TtC4Siri37SiriQuickTypeGestureActivationManager_latestFaceDetectionResultFuture;
    uint64_t v9 = v1 + v8;
    swift_beginAccess(v1 + v8, v0 + 16, 0LL, 0LL);
    sub_100058674(v9, v7);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v7, 1LL, v5) == 1)
    {
      sub_10004E034(*(void *)(v0 + 184), &qword_1000D9338);
      if (qword_1000D8A18 != -1) {
        swift_once(&qword_1000D8A18, sub_100057C1C);
      }
      uint64_t v10 = type metadata accessor for Logger(0LL);
      uint64_t v11 = sub_10004ADF0(v10, (uint64_t)qword_1000DA5D8);
      uint64_t v12 = (os_log_s *)Logger.logObject.getter(v11);
      os_log_type_t v13 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v12, v13))
      {
        unint64_t v14 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        uint64_t v15 = swift_slowAlloc(32LL, -1LL);
        uint64_t v39 = v15;
        *(_DWORD *)unint64_t v14 = 136315138;
        if (qword_1000D8A10 != -1) {
          swift_once(&qword_1000D8A10, sub_1000545C4);
        }
        uint64_t v16 = qword_1000D9310;
        unint64_t v17 = *(void *)algn_1000D9318;
        swift_bridgeObjectRetain(*(void *)algn_1000D9318);
        *(void *)(v0 + 8_Block_object_dispose((const void *)(v9 - 80), 8) = sub_100057FC0(v16, v17, &v39);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 88, v0 + 96, v14 + 4, v14 + 12);
        swift_bridgeObjectRelease(v17);
        _os_log_impl( (void *)&_mh_execute_header,  v12,  v13,  "#activation #quickTypeGate %s: Noticed call to canActivate() without a previous call to prewarmForFirstTapOfQu ickTypeToSiriGesture(). It's recommended to call prewarm prior to canActivate to speed up canActivate.",  v14,  0xCu);
        swift_arrayDestroy(v15, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v15, -1LL, -1LL);
        swift_slowDealloc(v14, -1LL, -1LL);
      }

      uint64_t v18 = (void *)swift_task_alloc(dword_1000D934C);
      *(void *)(v0 + 24_Block_object_dispose((const void *)(v9 - 80), 8) = v18;
      void *v18 = v0;
      v18[1] = sub_100056548;
      return SiriQuickTypeGestureActivationManager.prewarmForFirstTapOfQuickTypeToSiriGesture()();
    }

    else
    {
      uint64_t v20 = *(void *)(v0 + 192);
      uint64_t v21 = *(void *)(v0 + 144);
      (*(void (**)(void, void, uint64_t))(*(void *)(v0 + 200) + 32LL))( *(void *)(v0 + 208),  *(void *)(v0 + 184),  v20);
      AsyncThrowingStream.makeAsyncIterator()(v20);
      unint64_t v22 = sub_1000586BC();
      uint64_t v23 = (void *)swift_task_alloc(_sScs8IteratorV4next9isolationxSgScA_pSgYi_tYaq_YKFTu[1]);
      *(void *)(v0 + 224) = v23;
      *uint64_t v23 = v0;
      v23[1] = sub_100056068;
      return _sScs8IteratorV4next9isolationxSgScA_pSgYi_tYaq_YKF(v0 + 64, v21, v22, *(void *)(v0 + 152), v0 + 80);
    }
  }

  double v2 = *(double *)(v1 + 120);
  uint64_t v3 = *(void *)(v1 + 112);
  double v4 = CFAbsoluteTimeGetCurrent() - v2;
  if (v4 > 0.2)
  {
    uint64_t v1 = *(void *)(v0 + 144);
    goto LABEL_4;
  }

  if (qword_1000D8A18 != -1) {
    swift_once(&qword_1000D8A18, sub_100057C1C);
  }
  uint64_t v24 = type metadata accessor for Logger(0LL);
  uint64_t v25 = sub_10004ADF0(v24, (uint64_t)qword_1000DA5D8);
  uint64_t v26 = (os_log_s *)Logger.logObject.getter(v25);
  os_log_type_t v27 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v26, v27))
  {
    char v38 = v3;
    uint64_t v3 = swift_slowAlloc(22LL, -1LL);
    uint64_t v37 = swift_slowAlloc(64LL, -1LL);
    uint64_t v39 = v37;
    *(_DWORD *)uint64_t v3 = 136315394;
    if (qword_1000D8A10 != -1) {
      swift_once(&qword_1000D8A10, sub_1000545C4);
    }
    uint64_t v29 = qword_1000D9310;
    unint64_t v28 = *(void *)algn_1000D9318;
    swift_bridgeObjectRetain(*(void *)algn_1000D9318);
    *(void *)(v0 + 12_Block_object_dispose((const void *)(v9 - 80), 8) = sub_100057FC0(v29, v28, &v39);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 128, v0 + 136, v3 + 4, v3 + 12);
    swift_bridgeObjectRelease(v28);
    *(_WORD *)(v3 + 12) = 2080;
    uint64_t v30 = sub_1000541D0(2LL, v4 * 1000.0);
    unint64_t v32 = v31;
    *(void *)(v0 + 136) = sub_100057FC0(v30, v31, &v39);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 136, v0 + 144, v3 + 14, v3 + 22);
    swift_bridgeObjectRelease(v32);
    _os_log_impl( (void *)&_mh_execute_header,  v26,  v27,  "#activation #quickTypeGate %s: using previous observation (age: %sms)",  (uint8_t *)v3,  0x16u);
    swift_arrayDestroy(v37, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v37, -1LL, -1LL);
    swift_slowDealloc(v3, -1LL, -1LL);

    LOBYTE(v3) = v38;
  }

  else
  {
  }

  uint64_t v33 = v3 & 1;
  sub_100058704(v3 & 1);
  uint64_t v35 = *(void *)(v0 + 176);
  uint64_t v34 = *(void *)(v0 + 184);
  uint64_t v36 = *(void *)(v0 + 168);
  swift_task_dealloc(*(void *)(v0 + 208));
  swift_task_dealloc(v34);
  swift_task_dealloc(v35);
  swift_task_dealloc(v36);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v33);
}

uint64_t sub_100056068()
{
  uint64_t v2 = *v1;
  swift_task_dealloc(*(void *)(*v1 + 224));
  if (v0) {
    uint64_t v3 = sub_100056628;
  }
  else {
    uint64_t v3 = sub_1000560CC;
  }
  return swift_task_switch(v3, *(void *)(v2 + 144), 0LL);
}

uint64_t sub_1000560CC()
{
  uint64_t v1 = *(unsigned __int8 *)(v0 + 64);
  if (v1 == 2)
  {
    uint64_t v2 = 0LL;
LABEL_12:
    (*(void (**)(void, void))(*(void *)(v0 + 160) + 8LL))(*(void *)(v0 + 168), *(void *)(v0 + 152));
    uint64_t v18 = *(void *)(v0 + 208);
    uint64_t v19 = *(void *)(v0 + 192);
    uint64_t v20 = *(void *)(v0 + 200);
    uint64_t v21 = *(void *)(v0 + 176);
    uint64_t v22 = *(void *)(v0 + 144) + *(void *)(v0 + 216);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56))(v21, 1LL, 1LL, v19);
    swift_beginAccess(v22, v0 + 40, 33LL, 0LL);
    sub_10005862C(v21, v22);
    swift_endAccess(v0 + 40);
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v18, v19);
    uint64_t v24 = *(void *)(v0 + 176);
    uint64_t v23 = *(void *)(v0 + 184);
    uint64_t v25 = *(void *)(v0 + 168);
    swift_task_dealloc(*(void *)(v0 + 208));
    swift_task_dealloc(v23);
    swift_task_dealloc(v24);
    swift_task_dealloc(v25);
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v2);
  }

  double v3 = *(double *)(v0 + 72);
  double v4 = CFAbsoluteTimeGetCurrent() - v3;
  if (v4 <= 0.2)
  {
    uint64_t v2 = v1 & 1;
    sub_100058704(v2);
    goto LABEL_12;
  }

  if (qword_1000D8A18 != -1) {
    swift_once(&qword_1000D8A18, sub_100057C1C);
  }
  uint64_t v5 = type metadata accessor for Logger(0LL);
  uint64_t v6 = sub_10004ADF0(v5, (uint64_t)qword_1000DA5D8);
  uint64_t v7 = (os_log_s *)Logger.logObject.getter(v6);
  os_log_type_t v8 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc(22LL, -1LL);
    uint64_t v10 = swift_slowAlloc(64LL, -1LL);
    uint64_t v26 = v10;
    *(_DWORD *)uint64_t v9 = 136315394;
    if (qword_1000D8A10 != -1) {
      swift_once(&qword_1000D8A10, sub_1000545C4);
    }
    uint64_t v11 = qword_1000D9310;
    unint64_t v12 = *(void *)algn_1000D9318;
    swift_bridgeObjectRetain(*(void *)algn_1000D9318);
    *(void *)(v0 + 112) = sub_100057FC0(v11, v12, &v26);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 112, v0 + 120, v9 + 4, v9 + 12);
    swift_bridgeObjectRelease(v12);
    *(_WORD *)(v9 + 12) = 2080;
    uint64_t v13 = sub_1000541D0(2LL, v4 * 1000.0);
    unint64_t v15 = v14;
    *(void *)(v0 + 120) = sub_100057FC0(v13, v14, &v26);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 120, v0 + 128, v9 + 14, v9 + 22);
    swift_bridgeObjectRelease(v15);
    _os_log_impl( (void *)&_mh_execute_header,  v7,  v8,  "#activation #quickTypeGate %s: Latest face detection observation is old (%sms) -> starting new detection",  (uint8_t *)v9,  0x16u);
    swift_arrayDestroy(v10, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v10, -1LL, -1LL);
    swift_slowDealloc(v9, -1LL, -1LL);
  }

  uint64_t v16 = (void *)swift_task_alloc(dword_1000D934C);
  *(void *)(v0 + 232) = v16;
  void *v16 = v0;
  v16[1] = sub_1000563FC;
  return SiriQuickTypeGestureActivationManager.prewarmForFirstTapOfQuickTypeToSiriGesture()();
}

uint64_t sub_1000563FC()
{
  uint64_t v1 = *v0;
  uint64_t v4 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 232));
  uint64_t v2 = (void *)swift_task_alloc(dword_1000D9364);
  *(void *)(v1 + 240) = v2;
  void *v2 = v4;
  v2[1] = sub_100056460;
  return SiriQuickTypeGestureActivationManager.canActivate()();
}

uint64_t sub_100056460(char a1)
{
  uint64_t v2 = *(void *)(*(void *)v1 + 240LL);
  uint64_t v3 = *(void *)(*(void *)v1 + 144LL);
  *(_BYTE *)(*(void *)v1 + 264LL) = a1;
  swift_task_dealloc(v2);
  return swift_task_switch(sub_1000564C0, v3, 0LL);
}

uint64_t sub_1000564C0()
{
  uint64_t v2 = *(void *)(v0 + 200);
  uint64_t v1 = *(void *)(v0 + 208);
  uint64_t v3 = *(void *)(v0 + 192);
  (*(void (**)(void, void))(*(void *)(v0 + 160) + 8LL))(*(void *)(v0 + 168), *(void *)(v0 + 152));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v4 = *(unsigned __int8 *)(v0 + 264);
  uint64_t v6 = *(void *)(v0 + 176);
  uint64_t v5 = *(void *)(v0 + 184);
  uint64_t v7 = *(void *)(v0 + 168);
  swift_task_dealloc(*(void *)(v0 + 208));
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v4);
}

uint64_t sub_100056548()
{
  uint64_t v1 = *v0;
  uint64_t v4 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 248));
  uint64_t v2 = (void *)swift_task_alloc(dword_1000D9364);
  *(void *)(v1 + 256) = v2;
  void *v2 = v4;
  v2[1] = sub_1000565AC;
  return SiriQuickTypeGestureActivationManager.canActivate()();
}

uint64_t sub_1000565AC(uint64_t a1)
{
  uint64_t v3 = *(void **)v1;
  uint64_t v9 = *(void **)v1;
  swift_task_dealloc(*(void *)(*(void *)v1 + 256LL));
  uint64_t v4 = v3[26];
  uint64_t v6 = v3[22];
  uint64_t v5 = v3[23];
  uint64_t v7 = v3[21];
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  return ((uint64_t (*)(uint64_t))v9[1])(a1);
}

uint64_t sub_100056628()
{
  uint64_t v1 = *(void *)(v0 + 80);
  if (qword_1000D8A18 != -1) {
    swift_once(&qword_1000D8A18, sub_100057C1C);
  }
  uint64_t v2 = type metadata accessor for Logger(0LL);
  sub_10004ADF0(v2, (uint64_t)qword_1000DA5D8);
  swift_errorRetain(v1);
  uint64_t v3 = swift_errorRetain(v1);
  uint64_t v4 = (os_log_s *)Logger.logObject.getter(v3);
  os_log_type_t v5 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = swift_slowAlloc(22LL, -1LL);
    uint64_t v7 = (uint64_t *)swift_slowAlloc(8LL, -1LL);
    uint64_t v21 = swift_slowAlloc(32LL, -1LL);
    uint64_t v22 = v21;
    *(_DWORD *)uint64_t v6 = 136315394;
    if (qword_1000D8A10 != -1) {
      swift_once(&qword_1000D8A10, sub_1000545C4);
    }
    uint64_t v9 = qword_1000D9310;
    unint64_t v8 = *(void *)algn_1000D9318;
    swift_bridgeObjectRetain(*(void *)algn_1000D9318);
    *(void *)(v0 + 96) = sub_100057FC0(v9, v8, &v22);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 96, v0 + 104, v6 + 4, v6 + 12);
    swift_bridgeObjectRelease(v8);
    *(_WORD *)(v6 + 12) = 2112;
    swift_errorRetain(v1);
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError(v1);
    *(void *)(v0 + 104) = v10;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 104, v0 + 112, v6 + 14, v6 + 22);
    *uint64_t v7 = v10;
    swift_errorRelease(v1);
    swift_errorRelease(v1);
    _os_log_impl( (void *)&_mh_execute_header,  v4,  v5,  "#activation #quickTypeGate %s: Forcing canActivate = YES despite error: %@",  (uint8_t *)v6,  0x16u);
    uint64_t v11 = sub_10004A8E8(&qword_1000D9340);
    swift_arrayDestroy(v7, 1LL, v11);
    swift_slowDealloc(v7, -1LL, -1LL);
    swift_arrayDestroy(v21, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v21, -1LL, -1LL);
    swift_slowDealloc(v6, -1LL, -1LL);

    swift_errorRelease(v1);
  }

  else
  {
    swift_errorRelease(v1);
    swift_errorRelease(v1);
    swift_errorRelease(v1);
  }

  uint64_t v12 = *(void *)(v0 + 208);
  uint64_t v13 = *(void *)(v0 + 192);
  uint64_t v14 = *(void *)(v0 + 200);
  uint64_t v15 = *(void *)(v0 + 176);
  uint64_t v16 = *(void *)(v0 + 144) + *(void *)(v0 + 216);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56))(v15, 1LL, 1LL, v13);
  swift_beginAccess(v16, v0 + 40, 33LL, 0LL);
  sub_10005862C(v15, v16);
  swift_endAccess(v0 + 40);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v12, v13);
  uint64_t v17 = *(void *)(v0 + 176);
  uint64_t v18 = *(void *)(v0 + 184);
  uint64_t v19 = *(void *)(v0 + 168);
  swift_task_dealloc(*(void *)(v0 + 208));
  swift_task_dealloc(v18);
  swift_task_dealloc(v17);
  swift_task_dealloc(v19);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(1LL);
}

uint64_t sub_100056A64(const void *a1, uint64_t a2)
{
  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  uint64_t v4 = dword_1000D9364;
  swift_retain(a2);
  os_log_type_t v5 = (void *)swift_task_alloc(v4);
  v2[4] = v5;
  *os_log_type_t v5 = v2;
  v5[1] = sub_100056AC4;
  return SiriQuickTypeGestureActivationManager.canActivate()();
}

uint64_t sub_100056AC4(char a1)
{
  uint64_t v3 = *(void (***)(void, void))(*v1 + 24);
  uint64_t v4 = *(void *)(*v1 + 16);
  uint64_t v6 = *v1;
  swift_task_dealloc(*(void *)(*v1 + 32));
  swift_release(v4);
  v3[2](v3, a1 & 1);
  _Block_release(v3);
  return (*(uint64_t (**)(void))(v6 + 8))();
}

uint64_t sub_100056B3C(uint64_t a1)
{
  v2[12] = a1;
  v2[13] = v1;
  uint64_t v3 = sub_10004A8E8(&qword_1000D93E0);
  v2[14] = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  v2[15] = v4;
  v2[16] = swift_task_alloc((*(void *)(v4 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_100056BA0, 0LL, 0LL);
}

uint64_t sub_100056BA0()
{
  if (qword_1000D8A18 != -1) {
    swift_once(&qword_1000D8A18, sub_100057C1C);
  }
  uint64_t v1 = type metadata accessor for Logger(0LL);
  uint64_t v2 = sub_10004ADF0(v1, (uint64_t)qword_1000DA5D8);
  *(void *)(v0 + 136) = v2;
  uint64_t v3 = (os_log_s *)Logger.logObject.getter(v2);
  os_log_type_t v4 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v3, v4))
  {
    os_log_type_t v5 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v6 = swift_slowAlloc(32LL, -1LL);
    v30[0] = v6;
    *(_DWORD *)os_log_type_t v5 = 136315138;
    if (qword_1000D8A10 != -1) {
      swift_once(&qword_1000D8A10, sub_1000545C4);
    }
    uint64_t v7 = qword_1000D9310;
    unint64_t v8 = *(void *)algn_1000D9318;
    swift_bridgeObjectRetain(*(void *)algn_1000D9318);
    *(void *)(v0 + 8_Block_object_dispose((const void *)(v9 - 80), 8) = sub_100057FC0(v7, v8, v30);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 88, v0 + 96, v5 + 4, v5 + 12);
    swift_bridgeObjectRelease(v8);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "#activation #quickTypeGate %s: starting to poll", v5, 0xCu);
    swift_arrayDestroy(v6, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v6, -1LL, -1LL);
    swift_slowDealloc(v5, -1LL, -1LL);
  }

  double v9 = sub_100057418(&v29);
  *(void *)(v0 + 144) = 0LL;
  char v11 = v10;
  double v12 = v9;
  uint64_t v13 = v0 + 16;
  uint64_t v14 = v0 + 64;
  uint64_t v15 = (os_log_s *)Logger.logObject.getter(v10);
  os_log_type_t v16 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc(22LL, -1LL);
    uint64_t v28 = swift_slowAlloc(64LL, -1LL);
    v30[0] = v28;
    *(_DWORD *)uint64_t v17 = 136315394;
    if (qword_1000D8A10 != -1) {
      swift_once(&qword_1000D8A10, sub_1000545C4);
    }
    uint64_t v18 = qword_1000D9310;
    unint64_t v19 = *(void *)algn_1000D9318;
    swift_bridgeObjectRetain(*(void *)algn_1000D9318);
    *(void *)(v0 + 72) = sub_100057FC0(v18, v19, v30);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 72, v0 + 80, v17 + 4, v17 + 12);
    swift_bridgeObjectRelease(v19);
    *(_WORD *)(v17 + 12) = 2080;
    uint64_t v20 = sub_100054084(v11 & 1, v12);
    unint64_t v22 = v21;
    *(void *)(v0 + 80) = sub_100057FC0(v20, v21, v30);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 80, v0 + 88, v17 + 14, v17 + 22);
    swift_bridgeObjectRelease(v22);
    _os_log_impl( (void *)&_mh_execute_header,  v15,  v16,  "#activation #quickTypeGate %s: polling succeeded with result: %s",  (uint8_t *)v17,  0x16u);
    swift_arrayDestroy(v28, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v28, -1LL, -1LL);
    swift_slowDealloc(v17, -1LL, -1LL);

    uint64_t v13 = v0 + 16;
    uint64_t v14 = v0 + 64;
  }

  else
  {
  }

  uint64_t v24 = *(void *)(v0 + 120);
  uint64_t v23 = *(void *)(v0 + 128);
  uint64_t v25 = *(void *)(v0 + 112);
  *(_BYTE *)(v0 + 16) = v11 & 1;
  *(double *)(v0 + 24) = v12;
  uint64_t v26 = sub_10004A8E8(&qword_1000D93E8);
  AsyncThrowingStream.Continuation.yield(_:)(v13, v26);
  (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v23, v25);
  *(void *)(v0 + 64) = 0LL;
  AsyncThrowingStream.Continuation.finish(throwing:)(v14, v26);
  *(double *)(v0 + 160) = v12;
  *(void *)(v0 + 152) = v11 & 1;
  return swift_task_switch(sub_1000571E0, *(void *)(v0 + 104), 0LL);
}

uint64_t sub_1000571E0()
{
  uint64_t v1 = v0[19];
  uint64_t v2 = v0[20];
  uint64_t v3 = v0[13];
  char v4 = v0[18] != 0LL;
  uint64_t v6 = *(void *)(v3 + 136);
  uint64_t v5 = *(void *)(v3 + 144);
  *(void *)(v3 + 136) = v1;
  *(void *)(v3 + 144) = v2;
  unsigned __int8 v7 = *(_BYTE *)(v3 + 152);
  *(_BYTE *)(v3 + 152) = v4;
  sub_100058618(v1, v2, v4);
  sub_100057C94(v6, v5, v7);
  *(_BYTE *)(v3 + OBJC_IVAR____TtC4Siri37SiriQuickTypeGestureActivationManager_isFaceDetectionInFlight) = 0;
  return swift_task_switch(sub_100057260, 0LL, 0LL);
}

uint64_t sub_100057260(uint64_t a1)
{
  uint64_t v2 = (os_log_s *)Logger.logObject.getter(a1);
  os_log_type_t v3 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v2, v3))
  {
    char v4 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v5 = swift_slowAlloc(32LL, -1LL);
    uint64_t v12 = v5;
    *(_DWORD *)char v4 = 136315138;
    if (qword_1000D8A10 != -1) {
      swift_once(&qword_1000D8A10, sub_1000545C4);
    }
    uint64_t v10 = *(void *)(v1 + 152);
    uint64_t v11 = *(void *)(v1 + 160);
    char v6 = *(void *)(v1 + 144) != 0LL;
    uint64_t v7 = qword_1000D9310;
    unint64_t v8 = *(void *)algn_1000D9318;
    swift_bridgeObjectRetain(*(void *)algn_1000D9318);
    *(void *)(v1 + 32) = sub_100057FC0(v7, v8, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v1 + 32, v1 + 40, v4 + 4, v4 + 12);
    swift_bridgeObjectRelease(v8);
    _os_log_impl( (void *)&_mh_execute_header,  v2,  v3,  "#kcs #activation #quickTypeGate %s: exiting beginPollingWithContinuation",  v4,  0xCu);
    swift_arrayDestroy(v5, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v5, -1LL, -1LL);
    swift_slowDealloc(v4, -1LL, -1LL);

    sub_100057CAC(v10, v11, v6);
  }

  else
  {
    sub_100057CAC(*(void *)(v1 + 152), *(void *)(v1 + 160), *(void *)(v1 + 144) != 0LL);
  }

  swift_task_dealloc(*(void *)(v1 + 128));
  return (*(uint64_t (**)(void))(v1 + 8))();
}

double sub_100057418(uint64_t *a1)
{
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t started = SRUIFInstrumentQuickTypeFaceDetectionPollingStartSignpost();
  char v4 = *(void **)(v1 + OBJC_IVAR____TtC4Siri37SiriQuickTypeGestureActivationManager_attentionAwarenessClient);
  id v63 = 0LL;
  unsigned int v5 = [v4 resumeWithError:&v63];
  id v6 = v63;
  uint64_t v7 = &unk_1000D8000;
  if (v5)
  {
    id v62 = 0LL;
    id v63 = 0LL;
    id v8 = v6;
    unsigned int v9 = [v4 pollForAttentionWithTimeout:&v63 event:&v62 error:0.5];
    id v6 = v63;
    id v10 = v62;
    if (v9)
    {
      id v11 = v6;
      SRUIFInstrumentQuickTypeFaceDetectionPollingEndSignpost(started);
      double v12 = CFAbsoluteTimeGetCurrent();
      if (qword_1000D8A18 != -1) {
        swift_once(&qword_1000D8A18, sub_100057C1C);
      }
      uint64_t v13 = type metadata accessor for Logger(0LL);
      uint64_t v14 = sub_10004ADF0(v13, (uint64_t)qword_1000DA5D8);
      uint64_t v15 = (os_log_s *)Logger.logObject.getter(v14);
      os_log_type_t v16 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v15, v16))
      {
        uint64_t v17 = swift_slowAlloc(22LL, -1LL);
        uint64_t v58 = (void *)swift_slowAlloc(64LL, -1LL);
        id v63 = v58;
        *(_DWORD *)uint64_t v17 = 136315394;
        if (qword_1000D8A10 != -1) {
          swift_once(&qword_1000D8A10, sub_1000545C4);
        }
        uint64_t v19 = qword_1000D9310;
        unint64_t v18 = *(void *)algn_1000D9318;
        swift_bridgeObjectRetain(*(void *)algn_1000D9318);
        id v62 = (id)sub_100057FC0(v19, v18, (uint64_t *)&v63);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v62, &v63, v17 + 4, v17 + 12);
        swift_bridgeObjectRelease(v18);
        *(_WORD *)(v17 + 12) = 2080;
        uint64_t v20 = sub_1000541D0(2LL, (v12 - Current) * 1000.0);
        unint64_t v22 = v21;
        id v62 = (id)sub_100057FC0(v20, v21, (uint64_t *)&v63);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v62, &v63, v17 + 14, v17 + 22);
        swift_bridgeObjectRelease(v22);
        _os_log_impl( (void *)&_mh_execute_header,  v15,  v16,  "#activation #quickTypeGate %s: polling succeeded in %sms",  (uint8_t *)v17,  0x16u);
        swift_arrayDestroy(v58, 2LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v58, -1LL, -1LL);
        swift_slowDealloc(v17, -1LL, -1LL);

        uint64_t v23 = 1LL;
        uint64_t v24 = v6;
        uint64_t v7 = (void *)&unk_1000D8000;
      }

      else
      {

        uint64_t v23 = 1LL;
        uint64_t v24 = v6;
      }

      goto LABEL_19;
    }

    id v25 = v10;
    uint64_t v24 = v6;
  }

  else
  {
    uint64_t v24 = 0LL;
    id v25 = v63;
  }

  id v26 = v6;
  uint64_t v23 = _convertNSErrorToError(_:)(v25);

  swift_willThrow();
  SRUIFInstrumentQuickTypeFaceDetectionPollingEndSignpost(started);
  double v27 = CFAbsoluteTimeGetCurrent();
  if (qword_1000D8A18 != -1) {
    swift_once(&qword_1000D8A18, sub_100057C1C);
  }
  uint64_t v28 = type metadata accessor for Logger(0LL);
  uint64_t v29 = sub_10004ADF0(v28, (uint64_t)qword_1000DA5D8);
  uint64_t v30 = (os_log_s *)Logger.logObject.getter(v29);
  os_log_type_t v31 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v30, v31))
  {
    uint64_t v59 = v23;
    uint64_t v32 = swift_slowAlloc(22LL, -1LL);
    uint64_t v33 = (void *)swift_slowAlloc(64LL, -1LL);
    id v63 = v33;
    *(_DWORD *)uint64_t v32 = 136315394;
    if (qword_1000D8A10 != -1) {
      swift_once(&qword_1000D8A10, sub_1000545C4);
    }
    uint64_t v35 = qword_1000D9310;
    unint64_t v34 = *(void *)algn_1000D9318;
    swift_bridgeObjectRetain(*(void *)algn_1000D9318);
    id v62 = (id)sub_100057FC0(v35, v34, (uint64_t *)&v63);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v62, &v63, v32 + 4, v32 + 12);
    swift_bridgeObjectRelease(v34);
    *(_WORD *)(v32 + 12) = 2080;
    uint64_t v36 = sub_1000541D0(2LL, (v27 - Current) * 1000.0);
    unint64_t v38 = v37;
    id v62 = (id)sub_100057FC0(v36, v37, (uint64_t *)&v63);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v62, &v63, v32 + 14, v32 + 22);
    swift_bridgeObjectRelease(v38);
    _os_log_impl( (void *)&_mh_execute_header,  v30,  v31,  "#activation #quickTypeGate %s: polling cancelled or failed in %sms",  (uint8_t *)v32,  0x16u);
    swift_arrayDestroy(v33, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v33, -1LL, -1LL);
    swift_slowDealloc(v32, -1LL, -1LL);

    uint64_t v23 = v59;
    uint64_t v7 = (void *)&unk_1000D8000;
  }

  else
  {
  }

uint64_t SiriQuickTypeGestureActivationManager.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_100057C1C()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_1000592CC(v0, qword_1000DA5D8);
  sub_10004ADF0(v0, (uint64_t)qword_1000DA5D8);
  return Logger.init(subsystem:category:)( 0x6C7070612E6D6F63LL,  0xEE00697269732E65LL,  0x746E65696C43LL,  0xE600000000000000LL);
}

uint64_t sub_100057C94(uint64_t result, uint64_t a2, unsigned __int8 a3)
{
  if (a3 != 255) {
    return sub_100057CAC(result, a2, a3 & 1);
  }
  return result;
}

uint64_t sub_100057CAC(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0) {
    return swift_errorRelease();
  }
  return result;
}

uint64_t sub_100057CB8(uint64_t a1, int *a2)
{
  id v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  char v4 = (void *)swift_task_alloc(a2[1]);
  *(void *)(v2 + 16) = v4;
  *char v4 = v2;
  v4[1] = sub_100057D1C;
  return v6(a1);
}

uint64_t sub_100057D1C()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100057D68(uint64_t a1, uint64_t a2, int *a3)
{
  id v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  char v4 = (void *)swift_task_alloc(a3[1]);
  *(void *)(v3 + 16) = v4;
  *char v4 = v3;
  v4[1] = sub_10005930C;
  return v6();
}

uint64_t sub_100057DBC(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  unsigned int v5 = (void *)swift_task_alloc(a4[1]);
  *(void *)(v4 + 16) = v5;
  *unsigned int v5 = v4;
  v5[1] = sub_10005930C;
  return v7();
}

uint64_t sub_100057E10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1LL, v6) == 1)
  {
    sub_10004E034(a1, &qword_1000D93F0);
    uint64_t v8 = 7168LL;
    uint64_t v9 = *(void *)(a3 + 16);
    if (v9)
    {
LABEL_3:
      uint64_t v10 = *(void *)(a3 + 24);
      uint64_t ObjectType = swift_getObjectType(v9);
      swift_unknownObjectRetain(v9);
      uint64_t v12 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
      uint64_t v14 = v13;
      swift_unknownObjectRelease(v9);
      goto LABEL_6;
    }
  }

  else
  {
    unsigned __int8 v15 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    uint64_t v8 = v15 | 0x1C00LL;
    uint64_t v9 = *(void *)(a3 + 16);
    if (v9) {
      goto LABEL_3;
    }
  }

  uint64_t v12 = 0LL;
  uint64_t v14 = 0LL;
LABEL_6:
  uint64_t v16 = swift_allocObject(&unk_1000BB8B8, 32LL, 7LL);
  *(void *)(v16 + 16) = a2;
  *(void *)(v16 + 24) = a3;
  if (v14 | v12)
  {
    v19[0] = 0LL;
    v19[1] = 0LL;
    uint64_t v17 = v19;
    v19[2] = v12;
    v19[3] = v14;
  }

  else
  {
    uint64_t v17 = 0LL;
  }

  return swift_task_create(v8, v17, (char *)&type metadata for () + 8, &unk_1000D9430, v16);
}

uint64_t sub_100057F5C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc(a2[1]);
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100059310;
  return v6(a1);
}

uint64_t sub_100057FC0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100058090(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100059290((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }

  else
  {
    uint64_t ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_100059290((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_1000532F4(v12);
  return v7;
}

uint64_t sub_100058090(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000LL) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v12 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v12)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v12] || (char *)__src + v12 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter(0LL, HIBYTE(a6) & 0xF, __dst, a3);
            uint64_t result = 0LL;
            *a1 = (uint64_t)__dst;
            return result;
          }

          goto LABEL_17;
        }
      }
    }

LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000LL) != 0) {
    return 0LL;
  }
  else {
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL);
  }
}

  if ((v4 & 0xC000000000000001LL) != 0)
  {
    uint64_t v3 = specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, v4);
LABEL_8:
    swift_bridgeObjectRelease(v4);
    uint64_t v7 = objc_opt_self(&OBJC_CLASS___SABaseCommand);
    uint64_t v8 = swift_dynamicCastObjCClass(v3, v7);
    if (v8)
    {
      *(void *)a2 = v8;
      *(_BYTE *)(a2 + _Block_object_dispose((const void *)(v9 - 80), 8) = 1;
      uint64_t v9 = enum case for Command.aceCommand(_:);
      uint64_t v10 = type metadata accessor for Command(0LL);
      id v11 = *(void *)(v10 - 8);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 104))(a2, v9, v10);
      return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v11 + 56))(a2, 0LL, 1LL, v10);
    }

    uint64_t v30 = 0LL;
    os_log_type_t v31 = 0xE000000000000000LL;
    _StringGuts.grow(_:)(38LL);
    v13._object = (void *)0x800000010008C070LL;
    v13._countAndFlagsBits = 0xD000000000000012LL;
    String.append(_:)(v13);
    uint64_t v29 = v3;
    int v14 = sub_10004A8E8(&qword_1000D8C20);
    _print_unlocked<A, B>(_:_:)( &v29,  &v30,  v14,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
    v15._object = (void *)0x800000010008C090LL;
    v15._countAndFlagsBits = 0xD000000000000012LL;
    String.append(_:)(v15);
    uint64_t v2 = v30;
    uint64_t v4 = v31;
    if (qword_1000D8A20 == -1) {
      goto LABEL_11;
    }
    goto LABEL_32;
  }

  if (*(void *)((v4 & 0xFFFFFFFFFFFFFF8LL) + 0x10))
  {
    uint64_t v3 = *(void *)(v4 + 32);
    swift_unknownObjectRetain(v3);
    goto LABEL_8;
  }

  __break(1u);
LABEL_32:
  swift_once(&qword_1000D8A20, sub_100066BF4);
LABEL_11:
  uint64_t v16 = type metadata accessor for Logger(0LL);
  uint64_t v17 = sub_10004ADF0(v16, (uint64_t)qword_1000D9988);
  unint64_t v18 = static os_log_type_t.info.getter(v17);
  sub_1000681D8(v18, 0x10uLL, 0x6D6D6F43656B616DLL, 0xEF293A5F28646E61LL, v2, v4);
  swift_bridgeObjectRelease(v4);
  swift_unknownObjectRelease(v3);
LABEL_25:
  double v27 = type metadata accessor for Command(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56LL))( a2,  1LL,  1LL,  v27);
}

uint64_t sub_100058248(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_1000582DC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1000584B4(0, *(void *)(v2 + 16) + 1LL, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1000584B4(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_1000582DC(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000LL) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000LL) != 0) {
    uint64_t v4 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v4 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v4)
  {
    while (1)
    {
      unsigned int v5 = sub_100058450(v4, 0LL);
      if (v4 < 0) {
        break;
      }
      uint64_t v6 = v5;
      uint64_t v7 = _StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
      if ((v8 & 1) != 0) {
        goto LABEL_14;
      }
      if (v7 == v4) {
        return v6;
      }
      LOBYTE(v10) = 2;
      _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "invalid Collection: less than 'count' elements in collection",  60LL,  2LL,  "Swift/ContiguousArrayBuffer.swift",  33LL,  v10,  1122LL,  0);
      __break(1u);
LABEL_10:
      uint64_t v4 = String.UTF8View._foreignCount()();
      if (!v4) {
        return &_swiftEmptyArrayStorage;
      }
    }

    LOBYTE(v10) = 2;
    _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableBufferPointer with negative count",  46LL,  2LL,  "Swift/UnsafeBufferPointer.swift",  31LL,  v10,  71LL,  0);
    __break(1u);
LABEL_14:
    LOBYTE(v10) = 2;
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Insufficient space allocated to copy string contents",  52LL,  2LL,  "Swift/StringUTF8View.swift",  26LL,  v10,  430LL,  0);
    __break(1u);
  }

  else
  {
    return &_swiftEmptyArrayStorage;
  }

  return result;
}

void *sub_100058450(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  uint64_t v4 = sub_10004A8E8(&qword_1000D94B0);
  unsigned int v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_1000584B4(char a1, int64_t a2, char a3, char *a4)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        goto LABEL_30;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_10004A8E8(&qword_1000D94B0);
    id v11 = (char *)swift_allocObject(v10, v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * v12 - 64;
  }

  else
  {
    id v11 = (char *)&_swiftEmptyArrayStorage;
  }

  uint64_t v13 = v11 + 32;
  int v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v8]) {
      memmove(v13, v14, v8);
    }
    *((void *)a4 + 2) = 0LL;
    goto LABEL_28;
  }

  if (v14 >= &v13[v8] || v13 >= &v14[v8])
  {
    memcpy(v13, v14, v8);
LABEL_28:
    swift_bridgeObjectRelease(a4);
    return (uint64_t)v11;
  }

uint64_t sub_100058600(uint64_t result, uint64_t a2, unsigned __int8 a3)
{
  if (a3 != 255) {
    return sub_100058618(result, a2, a3 & 1);
  }
  return result;
}

uint64_t sub_100058618(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0) {
    return swift_errorRetain();
  }
  return result;
}

uint64_t sub_100058624(uint64_t a1)
{
  return sub_100054E84(a1, v1);
}

uint64_t sub_10005862C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10004A8E8(&qword_1000D9338);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_100058674(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10004A8E8(&qword_1000D9338);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

unint64_t sub_1000586BC()
{
  unint64_t result = qword_1000D9370;
  if (!qword_1000D9370)
  {
    uint64_t v1 = type metadata accessor for SiriQuickTypeGestureActivationManager(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for SiriQuickTypeGestureActivationManager, v1);
    atomic_store(result, (unint64_t *)&qword_1000D9370);
  }

  return result;
}

void sub_100058704(char a1)
{
  if (qword_1000D8A18 != -1) {
    swift_once(&qword_1000D8A18, sub_100057C1C);
  }
  uint64_t v2 = type metadata accessor for Logger(0LL);
  uint64_t v3 = sub_10004ADF0(v2, (uint64_t)qword_1000DA5D8);
  oslog = (os_log_s *)Logger.logObject.getter(v3);
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(oslog, v4))
  {
    uint64_t v5 = swift_slowAlloc(32LL, -1LL);
    uint64_t v6 = swift_slowAlloc(96LL, -1LL);
    uint64_t v16 = v6;
    *(_DWORD *)uint64_t v5 = 136315650;
    if (qword_1000D8A10 != -1) {
      swift_once(&qword_1000D8A10, sub_1000545C4);
    }
    uint64_t v7 = qword_1000D9310;
    unint64_t v8 = *(void *)algn_1000D9318;
    swift_bridgeObjectRetain(*(void *)algn_1000D9318);
    uint64_t v15 = sub_100057FC0(v7, v8, &v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v15, &v16, v5 + 4, v5 + 12);
    swift_bridgeObjectRelease(v8);
    *(_WORD *)(v5 + 12) = 2080;
    BOOL v9 = (a1 & 1) == 0;
    if ((a1 & 1) != 0) {
      uint64_t v10 = 0LL;
    }
    else {
      uint64_t v10 = 2117454LL;
    }
    if ((a1 & 1) != 0) {
      unint64_t v11 = 0xE000000000000000LL;
    }
    else {
      unint64_t v11 = 0xE300000000000000LL;
    }
    if (v9) {
      uint64_t v12 = 20302LL;
    }
    else {
      uint64_t v12 = 5457241LL;
    }
    if (v9) {
      unint64_t v13 = 0xE200000000000000LL;
    }
    else {
      unint64_t v13 = 0xE300000000000000LL;
    }
    uint64_t v15 = sub_100057FC0(v10, v11, &v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v15, &v16, v5 + 14, v5 + 22);
    swift_bridgeObjectRelease(v11);
    *(_WORD *)(v5 + 22) = 2080;
    uint64_t v15 = sub_100057FC0(v12, v13, &v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v15, &v16, v5 + 24, v5 + 32);
    swift_bridgeObjectRelease(v13);
    _os_log_impl( (void *)&_mh_execute_header,  oslog,  v4,  "#activation #quickTypeGate %s: %sface detected -> can activate = %s",  (uint8_t *)v5,  0x20u);
    swift_arrayDestroy(v6, 3LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v6, -1LL, -1LL);
    swift_slowDealloc(v5, -1LL, -1LL);
  }

  else
  {
  }

uint64_t sub_10005897C()
{
  return type metadata accessor for SiriQuickTypeGestureActivationManager(0LL);
}

void sub_100058984(uint64_t a1)
{
  v4[1] = &unk_1000830E0;
  v4[2] = &unk_1000830E0;
  sub_100058A20(319LL);
  if (v3 <= 0x3F)
  {
    void v4[3] = *(void *)(v2 - 8) + 64LL;
    v4[4] = &unk_1000830F8;
    v4[5] = (char *)&value witness table for Builtin.UnknownObject + 64;
    swift_updateClassMetadata2(a1, 256LL, 6LL, v4, a1 + 80);
  }

void sub_100058A20(uint64_t a1)
{
  if (!qword_1000D93B8)
  {
    uint64_t v2 = sub_10004D6C4(&qword_1000D8A30);
    unint64_t v3 = type metadata accessor for Optional(a1, v2);
    if (!v4) {
      atomic_store(v3, (unint64_t *)&qword_1000D93B8);
    }
  }

void *initializeBufferWithCopyOfBuffer for FaceDetectionError(void *a1, void *a2)
{
  uint64_t v3 = *a2;
  swift_errorRetain(*a2);
  *a1 = v3;
  return a1;
}

uint64_t destroy for FaceDetectionError(void *a1)
{
  return swift_errorRelease(*a1);
}

uint64_t *assignWithCopy for FaceDetectionError(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a2;
  swift_errorRetain(*a2);
  uint64_t v4 = *a1;
  *a1 = v3;
  swift_errorRelease(v4);
  return a1;
}

void *initializeWithTake for FaceDetectionError(void *result, void *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t *assignWithTake for FaceDetectionError(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  *a1 = *a2;
  swift_errorRelease(v3);
  return a1;
}

uint64_t getEnumTagSinglePayload for FaceDetectionError(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 8)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  else {
    return 0LL;
  }
}

uint64_t storeEnumTagSinglePayload for FaceDetectionError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)unint64_t result = 0LL;
    *(_DWORD *)unint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(_BYTE *)(result + _Block_object_dispose((const void *)(v9 - 80), 8) = 1;
    }
  }

  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(_BYTE *)(result + _Block_object_dispose((const void *)(v9 - 80), 8) = 0;
    }
    if (a2) {
      *(void *)unint64_t result = a2;
    }
  }

  return result;
}

uint64_t sub_100058BC8(uint64_t *a1)
{
  uint64_t v1 = *a1;
  return (v1 + 1);
}

void *sub_100058BE0(void *result, int a2)
{
  if (a2 < 0)
  {
    unsigned int v2 = a2 ^ 0x80000000;
  }

  else
  {
    if (!a2) {
      return result;
    }
    unsigned int v2 = a2 - 1;
  }

  *unint64_t result = v2;
  return result;
}

ValueMetadata *type metadata accessor for FaceDetectionError()
{
  return &type metadata for FaceDetectionError;
}

uint64_t getEnumTagSinglePayload for FaceDetectionObservation(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0xFF && a1[16]) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for FaceDetectionObservation( uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)unint64_t result = a2 - 255;
    *(void *)(result + _Block_object_dispose((const void *)(v9 - 80), 8) = 0LL;
    if (a3 >= 0xFF) {
      *(_BYTE *)(result + 16) = 1;
    }
  }

  else
  {
    if (a3 >= 0xFF) {
      *(_BYTE *)(result + 16) = 0;
    }
    if (a2) {
      *(_BYTE *)unint64_t result = a2 + 1;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for FaceDetectionObservation()
{
  return &type metadata for FaceDetectionObservation;
}

unint64_t sub_100058CB4()
{
  unint64_t result = qword_1000D93D8;
  if (!qword_1000D93D8)
  {
    unint64_t result = swift_getWitnessTable(&unk_10008319C, &type metadata for FaceDetectionError);
    atomic_store(result, (unint64_t *)&qword_1000D93D8);
  }

  return result;
}

uint64_t sub_100058CFC()
{
  unsigned int v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  BOOL v4 = (void *)swift_task_alloc(dword_1000D93FC);
  *(void *)(v1 + 16) = v4;
  *BOOL v4 = v1;
  v4[1] = sub_10005930C;
  return ((uint64_t (*)(const void *, uint64_t))((char *)&dword_1000D93F8 + dword_1000D93F8))(v2, v3);
}

uint64_t sub_100058D64()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  BOOL v4 = (int *)v0[4];
  int v5 = (void *)swift_task_alloc(dword_1000D940C);
  *(void *)(v1 + 16) = v5;
  *int v5 = v1;
  v5[1] = sub_10005930C;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_1000D9408 + dword_1000D9408))(v2, v3, v4);
}

uint64_t sub_100058DE0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc(dword_1000D941C);
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_10005930C;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1000D9418 + dword_1000D9418))( a1,  v4,  v5,  v6);
}

uint64_t sub_100058E64()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_100058E88(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc(dword_1000D942C);
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10005930C;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1000D9428 + dword_1000D9428))(a1, v4);
}

uint64_t sub_100058EFC()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc(dword_1000D943C);
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_10005930C;
  return ((uint64_t (*)(const void *, uint64_t))((char *)&dword_1000D9438 + dword_1000D9438))(v2, v3);
}

uint64_t sub_100058F6C()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_100058F98()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc(dword_1000D945C);
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_10005930C;
  return ((uint64_t (*)(const void *, uint64_t))((char *)&dword_1000D9458 + dword_1000D9458))(v2, v3);
}

uint64_t sub_100059004()
{
  return swift_deallocObject(v0, 48LL, 7LL);
}

unint64_t sub_100059030()
{
  unint64_t result = qword_1000D9480;
  if (!qword_1000D9480)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for Double, &type metadata for Double);
    atomic_store(result, (unint64_t *)&qword_1000D9480);
  }

  return result;
}

unint64_t sub_100059074()
{
  unint64_t result = qword_1000D9488;
  if (!qword_1000D9488)
  {
    uint64_t v1 = sub_10004D6C4(&qword_1000D9478);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for FloatingPointFormatStyle<A>, v1);
    atomic_store(result, &qword_1000D9488);
  }

  return result;
}

uint64_t sub_1000590C0()
{
  uint64_t v1 = sub_10004A8E8(&qword_1000D93E8);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease(*(void *)(v0 + 16));
  swift_release(*(void *)(v0 + 32));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100059140()
{
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(sub_10004A8E8(&qword_1000D93E8) - 8) + 80LL);
  uint64_t v3 = v0 + ((v2 + 40) & ~v2);
  uint64_t v4 = (void *)swift_task_alloc(dword_1000D9494);
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_1000591D8;
  uint64_t v5 = (void *)swift_task_alloc(dword_1000D93B4);
  v4[2] = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_10005930C;
  return sub_100056B3C(v3);
}

uint64_t sub_1000591D8()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100059220(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc(dword_1000D94A4);
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1000591D8;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1000D94A0 + dword_1000D94A0))(a1, v4);
}

uint64_t sub_100059290(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *sub_1000592CC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *(void *)(a1 - 8);
  if ((*(_DWORD *)(v3 + 80) & 0x20000) != 0)
  {
    uint64_t v4 = swift_slowAlloc(*(void *)(v3 + 64), *(_DWORD *)(v3 + 80));
    *a2 = v4;
    return (uint64_t *)v4;
  }

  return a2;
}

uint64_t sub_100059320()
{
  return 1LL;
}

void sub_100059328()
{
  v17.receiver = v0;
  v17.super_class = (Class)swift_getObjectType(v0);
  objc_msgSendSuper2(&v17, "viewDidLoad");
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC4Siri37SRCarPlayVisualResponseViewController_snippet];
  if (v1)
  {
    id v2 = v1;
    id v3 = [v0 view];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = type metadata accessor for SRCarPlayScrollView();
      if (swift_dynamicCastClass(v4, v5))
      {
        id v2 = v2;
        id v6 = [v2 responseViewId];
        uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
        uint64_t v9 = v8;

        if (v7 == 0xD000000000000033LL && v9 == 0x800000010008A420LL)
        {
          swift_bridgeObjectRelease(0x800000010008A420LL);
          char v10 = 1;
        }

        else
        {
          char v10 = _stringCompareWithSmolCheck(_:_:expecting:)(v7, v9, 0xD000000000000033LL, 0x800000010008A420LL, 0LL);
          swift_bridgeObjectRelease(v9);
        }

        sub_100060130(v1, v10 & 1);

LABEL_16:
        return;
      }
    }

    if (qword_1000D8A20 != -1) {
      swift_once(&qword_1000D8A20, sub_100066BF4);
    }
    uint64_t v14 = type metadata accessor for Logger(0LL);
    uint64_t v15 = sub_10004ADF0(v14, (uint64_t)qword_1000D9988);
    os_log_type_t v16 = static os_log_type_t.info.getter(v15);
    sub_1000681D8(v16, 0x10uLL, 0x4C64694477656976LL, 0xED0000292864616FLL, 0xD000000000000027LL, 0x800000010008B2C0LL);
    goto LABEL_16;
  }

  if (qword_1000D8A20 != -1) {
    swift_once(&qword_1000D8A20, sub_100066BF4);
  }
  uint64_t v11 = type metadata accessor for Logger(0LL);
  uint64_t v12 = sub_10004ADF0(v11, (uint64_t)qword_1000D9988);
  os_log_type_t v13 = static os_log_type_t.info.getter(v12);
  sub_1000681D8(v13, 0x10uLL, 0x4C64694477656976LL, 0xED0000292864616FLL, 0xD000000000000025LL, 0x800000010008B290LL);
}

void sub_1000595C8()
{
  sub_100053404(v0 + OBJC_IVAR____TtC4Siri37SRCarPlayVisualResponseViewController_delegate);
}

id sub_100059614()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType(v0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

void sub_1000596A0(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(v2 + OBJC_IVAR____TtC4Siri37SRCarPlayVisualResponseViewController_proceedToNextCommandAtSpeechSynthesisEnd) = 1;
  if (a2)
  {
    id v3 = *(void **)(v2 + OBJC_IVAR____TtC4Siri37SRCarPlayVisualResponseViewController_snippet);
    if (v3)
    {
      id v5 = v3;
      NSString v4 = String._bridgeToObjectiveC()();
      [v5 setPlayerState:0 aceId:v4];
    }
  }

uint64_t sub_100059740(void *a1)
{
  uint64_t ObjectType = swift_getObjectType(v1);
  uint64_t v4 = sub_10004A8E8((uint64_t *)&unk_1000D95F0);
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v82 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v82 - v8;
  uint64_t v10 = type metadata accessor for Response(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  char v88 = (char *)&v82 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v82 - v14;
  uint64_t v16 = OBJC_IVAR____TtC4Siri37SRCarPlayVisualResponseViewController_pluginSnippet;
  objc_super v17 = *(void **)(v1 + OBJC_IVAR____TtC4Siri37SRCarPlayVisualResponseViewController_pluginSnippet);
  if (v17) {
    BOOL v18 = a1 == 0LL;
  }
  else {
    BOOL v18 = 1;
  }
  if (v18 || (uint64_t v27 = swift_dynamicCastClass(a1, ObjectType), !v27 || (v28 = *(void **)(v27 + v16)) == 0LL))
  {
    uint64_t v19 = *(void **)(v1 + OBJC_IVAR____TtC4Siri37SRCarPlayVisualResponseViewController_aceSnippet);
    if (!v19) {
      return 0LL;
    }
    id v20 = [v19 modelData];
    BOOL v21 = (BOOL)v20;
    if (!v20) {
      return v21;
    }
    uint64_t v86 = v7;
    uint64_t v87 = v15;
    uint64_t v22 = v11;
    uint64_t v23 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v20);
    unint64_t v25 = v24;

    sub_10005CE7C(v23, v25);
    unint64_t v26 = sub_100053368();
    ProtobufBuilder.init(serializedData:)(v23, v25, v10, v26);
    unint64_t v83 = v26;
    uint64_t v84 = v23;
    unint64_t v85 = v25;
    uint64_t v37 = v22;
    unint64_t v38 = *(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56);
    v38(v9, 0LL, 1LL, v10);
    unsigned int v39 = *(void (**)(char *, char *, uint64_t))(v37 + 32);
    v39(v87, v9, v10);
    if (a1)
    {
      uint64_t v40 = swift_dynamicCastClass(a1, ObjectType);
      if (v40)
      {
        id v41 = *(void **)(v40 + OBJC_IVAR____TtC4Siri37SRCarPlayVisualResponseViewController_aceSnippet);
        if (v41)
        {
          id v42 = a1;
          id v43 = [v41 modelData];
          if (v43)
          {
            uint64_t v44 = v43;
            uint64_t v45 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v43);
            unint64_t v47 = v46;

            sub_10005CE7C(v45, v47);
            uint64_t v48 = v86;
            ProtobufBuilder.init(serializedData:)(v45, v47, v10, v83);
            v38(v48, 0LL, 1LL, v10);
            v39(v88, v48, v10);
            uint64_t v65 = v87;
            uint64_t v66 = Response.getComponentTypes()();
            uint64_t v67 = Response.getComponentTypes()();
            unint64_t v68 = (void *)v67;
            unint64_t v69 = *(void *)(v66 + 16);
            if (!v69)
            {
LABEL_56:
              sub_100053258(v84, v85);
              sub_100053258(v45, v47);
              swift_bridgeObjectRelease(v66);

              uint64_t v80 = v68[2];
              swift_bridgeObjectRelease(v68);
              BOOL v21 = v80 == 0;
              unint64_t v81 = *(void (**)(char *, uint64_t))(v37 + 8);
              v81(v88, v10);
              v81(v65, v10);
              return v21;
            }

            uint64_t v86 = v42;
            unint64_t v70 = *(void *)(v67 + 16);
            if (!v70) {
              goto LABEL_54;
            }
            uint64_t v71 = v66 + 32;
            unint64_t v72 = 1LL;
            uint64_t v73 = (uint64_t *)(v66 + 32);
            while (2)
            {
              uint64_t v74 = 0LL;
              unint64_t v75 = 0LL;
              uint64_t v76 = *v73;
              while (v68[v74 + 4] != v76)
              {
                unint64_t v77 = v75 + 1;
                if (__OFADD__(v75, 1LL))
                {
                  __break(1u);
                  goto LABEL_58;
                }

                ++v75;
                v74 += 2LL;
                if (v77 == v70)
                {
                  uint64_t v65 = v87;
                  goto LABEL_54;
                }
              }

              uint64_t v82 = v71;
              unint64_t v83 = v69;
              if ((swift_isUniquelyReferenced_nonNull_native(v68) & 1) == 0) {
                unint64_t v68 = sub_10005D0D0(v68);
              }
              unint64_t v78 = v68[2];
              if (v78 <= v75)
              {
LABEL_58:
                __break(1u);
              }

              else
              {
                if ((uint64_t)(~v75 + v78) < 0)
                {
LABEL_60:
                  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.moveInitialize with negative count",  55LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1046LL,  0);
                  __break(1u);
                  return result;
                }

                unint64_t v70 = v78 - 1;
                memmove(&v68[v74 + 4], &v68[v74 + 6], 16 * (~v75 + v78));
                v68[2] = v70;
                unint64_t v69 = v83;
                if (v72 == v83)
                {
                  id v42 = v86;
                  uint64_t v65 = v87;
                  goto LABEL_56;
                }

                uint64_t v65 = v87;
                uint64_t v71 = v82;
                if (v72 < *(void *)(v66 + 16))
                {
                  uint64_t v73 = (uint64_t *)(v82 + 16 * v72++);
                  if (v70) {
                    continue;
                  }
LABEL_54:

                  sub_100053258(v45, v47);
                  sub_100053258(v84, v85);
                  swift_bridgeObjectRelease(v68);
                  swift_bridgeObjectRelease(v66);
                  uint64_t v79 = *(void (**)(char *, uint64_t))(v37 + 8);
                  v79(v88, v10);
                  v79(v65, v10);
                  return 0LL;
                }
              }

              break;
            }

            __break(1u);
            goto LABEL_60;
          }
        }
      }
    }

    sub_100053258(v84, v85);
    (*(void (**)(char *, uint64_t))(v37 + 8))(v87, v10);
    return 0LL;
  }

  id v29 = v17;
  id v30 = a1;
  id v31 = v28;
  id v32 = [v29 bundleName];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = static String._unconditionallyBridgeFromObjectiveC(_:)(v32);
    uint64_t v36 = v35;
  }

  else
  {
    uint64_t v34 = 0LL;
    uint64_t v36 = 0LL;
  }

  id v49 = [v31 bundleName];
  if (!v49)
  {
    if (!v36) {
      goto LABEL_30;
    }
    goto LABEL_26;
  }

  uint64_t v50 = v49;
  uint64_t v51 = static String._unconditionallyBridgeFromObjectiveC(_:)(v49);
  uint64_t v53 = v52;

  if (!v36)
  {
    if (!v53) {
      goto LABEL_30;
    }

    swift_bridgeObjectRelease(v53);
    return 0LL;
  }

  if (!v53)
  {
LABEL_26:

    swift_bridgeObjectRelease(v36);
    return 0LL;
  }

  if (v34 == v51 && v36 == v53)
  {
    swift_bridgeObjectRelease(v36);
    swift_bridgeObjectRelease(v53);
    goto LABEL_30;
  }

  char v54 = _stringCompareWithSmolCheck(_:_:expecting:)(v34, v36, v51, v53, 0LL);
  swift_bridgeObjectRelease(v36);
  swift_bridgeObjectRelease(v53);
  if ((v54 & 1) == 0)
  {

    return 0LL;
  }

uint64_t Response.getComponentTypes()()
{
  uint64_t v1 = type metadata accessor for _ProtoResponse.Component(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v63 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v67 = type metadata accessor for _ProtoResponse.Section(0LL);
  uint64_t v66 = *(void *)(v67 - 8);
  __chkstk_darwin(v67);
  uint64_t v65 = (char *)&v63 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v64 = type metadata accessor for Section(0LL);
  uint64_t v68 = *(void *)(v64 - 8);
  __chkstk_darwin(v64);
  uint64_t v73 = (char *)&v63 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for ComponentGroup(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v63 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v74 = (char *)&v63 - v13;
  uint64_t v63 = v0;
  uint64_t result = Response.group.getter(v12);
  int64_t v15 = 0LL;
  uint64_t v16 = *(void *)(result + 64);
  uint64_t v69 = result + 64;
  uint64_t v76 = result;
  uint64_t v17 = 1LL << *(_BYTE *)(result + 32);
  uint64_t v18 = -1LL;
  if (v17 < 64) {
    uint64_t v18 = ~(-1LL << v17);
  }
  unint64_t v19 = v18 & v16;
  int64_t v72 = (unint64_t)(v17 + 63) >> 6;
  id v20 = _swiftEmptyArrayStorage;
  uint64_t v80 = v2;
  uint64_t v81 = v1;
  uint64_t v79 = v4;
  uint64_t v71 = v7;
  uint64_t v70 = v8;
  unint64_t v75 = v11;
  while (1)
  {
    if (v19)
    {
      uint64_t v77 = (v19 - 1) & v19;
      int64_t v78 = v15;
      unint64_t v21 = __clz(__rbit64(v19)) | (v15 << 6);
      goto LABEL_21;
    }

    BOOL v22 = __OFADD__(v15, 1LL);
    int64_t v23 = v15 + 1;
    if (v22) {
      goto LABEL_51;
    }
    if (v23 >= v72)
    {
LABEL_34:
      uint64_t v41 = swift_release(v76);
      uint64_t v42 = v64;
      uint64_t result = Response.sections.getter(v41);
      id v43 = (char *)result;
      uint64_t v76 = *(void *)(result + 16);
      if (!v76)
      {
LABEL_49:
        swift_bridgeObjectRelease(v43);
        return (uint64_t)v20;
      }

      unint64_t v44 = 0LL;
      uint64_t v45 = v68;
      unint64_t v75 = (char *)(result
                   + ((*(unsigned __int8 *)(v45 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80)));
      uint64_t v74 = (char *)result;
      while (v44 < *((void *)v43 + 2))
      {
        uint64_t v46 = *(void *)(v45 + 72);
        int64_t v78 = v44;
        uint64_t v47 = (*(uint64_t (**)(char *, char *, uint64_t))(v45 + 16))(v73, &v75[v46 * v44], v42);
        uint64_t v48 = v65;
        uint64_t v49 = Section.proto.getter(v47);
        uint64_t v50 = _ProtoResponse.Section.componentList.getter(v49);
        (*(void (**)(char *, uint64_t))(v66 + 8))(v48, v67);
        uint64_t v51 = *(void *)(v50 + 16);
        if (v51)
        {
          unint64_t v52 = (*(unsigned __int8 *)(v2 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
          uint64_t v77 = v50;
          unint64_t v53 = v50 + v52;
          uint64_t v54 = *(void *)(v2 + 72);
          id v55 = *(void (**)(char *, unint64_t, uint64_t))(v2 + 16);
          v55(v4, v50 + v52, v1);
          while (1)
          {
            Component.redactedComponent()(&v83, v1, &protocol witness table for _ProtoResponse.Component);
            sub_1000533EC(&v83, (uint64_t)&v86);
            uint64_t v56 = v87;
            uint64_t v57 = sub_10005A65C(&v86, v87);
            uint64_t DynamicType = swift_getDynamicType(v57, v56, 1LL);
            uint64_t v59 = v88;
            if ((swift_isUniquelyReferenced_nonNull_native(v20) & 1) == 0) {
              id v20 = sub_10005CCC0(0LL, v20[2] + 1LL, 1, v20);
            }
            unint64_t v61 = v20[2];
            unint64_t v60 = v20[3];
            if (v61 >= v60 >> 1) {
              id v20 = sub_10005CCC0((void *)(v60 > 1), v61 + 1, 1, v20);
            }
            void v20[2] = v61 + 1;
            uint64_t v62 = &v20[2 * v61];
            v62[4] = DynamicType;
            v62[5] = v59;
            sub_1000532F4(&v86);
            uint64_t v4 = v79;
            uint64_t v2 = v80;
            uint64_t v1 = v81;
            (*(void (**)(char *, uint64_t))(v80 + 8))(v79, v81);
            v53 += v54;
            if (!--v51) {
              break;
            }
            v55(v4, v53, v1);
          }

          swift_bridgeObjectRelease(v77);
          uint64_t v42 = v64;
          uint64_t v45 = v68;
          id v43 = v74;
        }

        else
        {
          swift_bridgeObjectRelease(v50);
          uint64_t v45 = v68;
        }

        unint64_t v44 = v78 + 1;
        uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v45 + 8))(v73, v42);
        if (v44 == v76) {
          goto LABEL_49;
        }
      }

      __break(1u);
LABEL_51:
      __break(1u);
      goto LABEL_52;
    }

    unint64_t v24 = *(void *)(v69 + 8 * v23);
    if (!v24) {
      break;
    }
LABEL_20:
    uint64_t v77 = (v24 - 1) & v24;
    int64_t v78 = v23;
    unint64_t v21 = __clz(__rbit64(v24)) + (v23 << 6);
LABEL_21:
    unint64_t v26 = v74;
    (*(void (**)(char *, unint64_t, uint64_t))(v8 + 16))( v74,  *(void *)(v76 + 56) + *(void *)(v8 + 72) * v21,  v7);
    uint64_t v27 = (*(uint64_t (**)(char *, char *, uint64_t))(v8 + 32))(v11, v26, v7);
    uint64_t v28 = ComponentGroup.components.getter(v27);
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)(v28 + 16);
    if (v30)
    {
      uint64_t v31 = v28 + 32;
      do
      {
        sub_10005A618(v31, (uint64_t)&v86);
        uint64_t v32 = v87;
        uint64_t v33 = v88;
        sub_10005A65C(&v86, v87);
        Component.redactedComponent()(&v82, v32, v33);
        sub_1000533EC(&v82, (uint64_t)&v83);
        uint64_t v34 = v84;
        uint64_t v35 = sub_10005A65C(&v83, v84);
        uint64_t v36 = swift_getDynamicType(v35, v34, 1LL);
        uint64_t v37 = v85;
        if ((swift_isUniquelyReferenced_nonNull_native(v20) & 1) == 0) {
          id v20 = sub_10005CCC0(0LL, v20[2] + 1LL, 1, v20);
        }
        unint64_t v39 = v20[2];
        unint64_t v38 = v20[3];
        if (v39 >= v38 >> 1) {
          id v20 = sub_10005CCC0((void *)(v38 > 1), v39 + 1, 1, v20);
        }
        void v20[2] = v39 + 1;
        uint64_t v40 = &v20[2 * v39];
        v40[4] = v36;
        v40[5] = v37;
        sub_1000532F4(&v83);
        sub_1000532F4(&v86);
        v31 += 40LL;
        --v30;
      }

      while (v30);
      swift_bridgeObjectRelease(v29);
      uint64_t v7 = v71;
      uint64_t v8 = v70;
    }

    else
    {
      swift_bridgeObjectRelease(v28);
    }

    uint64_t v11 = v75;
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v75, v7);
    uint64_t v2 = v80;
    uint64_t v1 = v81;
    uint64_t v4 = v79;
    int64_t v15 = v78;
    unint64_t v19 = v77;
  }

  int64_t v25 = v23 + 1;
  if (v23 + 1 >= v72) {
    goto LABEL_34;
  }
  unint64_t v24 = *(void *)(v69 + 8 * v25);
  if (v24) {
    goto LABEL_19;
  }
  int64_t v25 = v23 + 2;
  if (v23 + 2 >= v72) {
    goto LABEL_34;
  }
  unint64_t v24 = *(void *)(v69 + 8 * v25);
  if (v24) {
    goto LABEL_19;
  }
  int64_t v25 = v23 + 3;
  if (v23 + 3 >= v72) {
    goto LABEL_34;
  }
  unint64_t v24 = *(void *)(v69 + 8 * v25);
  if (v24) {
    goto LABEL_19;
  }
  int64_t v25 = v23 + 4;
  if (v23 + 4 >= v72) {
    goto LABEL_34;
  }
  unint64_t v24 = *(void *)(v69 + 8 * v25);
  if (v24)
  {
LABEL_19:
    int64_t v23 = v25;
    goto LABEL_20;
  }

  while (1)
  {
    int64_t v23 = v25 + 1;
    if (__OFADD__(v25, 1LL)) {
      break;
    }
    if (v23 >= v72) {
      goto LABEL_34;
    }
    unint64_t v24 = *(void *)(v69 + 8 * v23);
    ++v25;
    if (v24) {
      goto LABEL_20;
    }
  }

LABEL_52:
  __break(1u);
  return result;
}

        if ((swift_isUniquelyReferenced_nonNull_native(v8) & 1) == 0) {
          uint64_t v8 = sub_10005C9AC(0LL, *((void *)v8 + 2) + 1LL, 1, v8);
        }
        uint64_t v31 = *((void *)v8 + 2);
        uint64_t v30 = *((void *)v8 + 3);
        if (v31 >= v30 >> 1) {
          uint64_t v8 = sub_10005C9AC((char *)(v30 > 1), v31 + 1, 1, v8);
        }
        *((void *)v8 + 2) = v31 + 1;
        uint64_t v32 = &v8[16 * v31];
        *((void *)v32 + 4) = 0x6572467365796523LL;
        *((void *)v32 + 5) = 0xE900000000000065LL;
        if ((a1 & 0x100) == 0)
        {
LABEL_24:
          if ((a1 & 0x200) == 0) {
            goto LABEL_25;
          }
          goto LABEL_62;
        }

uint64_t sub_10005A618(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *sub_10005A65C(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

uint64_t sub_10005A680()
{
  return *(unsigned __int8 *)(v0
                            + OBJC_IVAR____TtC4Siri37SRCarPlayVisualResponseViewController_proceedToNextCommandAtSpeechSynthesisEnd);
}

id sub_10005A690()
{
  return sub_10005A748();
}

void sub_10005A698(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = *(void **)(v2 + OBJC_IVAR____TtC4Siri37SRCarPlayVisualResponseViewController_snippet);
    if (v3)
    {
      id v5 = v3;
      NSString v4 = String._bridgeToObjectiveC()();
      [v5 setPlayerState:1 aceId:v4];
    }
  }

void sub_10005A72C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

id sub_10005A740()
{
  return sub_10005A748();
}

id sub_10005A748()
{
  id result = *(id *)(v0 + OBJC_IVAR____TtC4Siri37SRCarPlayVisualResponseViewController_snippet);
  if (result) {
    return objc_msgSend(result, "postSiriEvent:");
  }
  return result;
}

id sub_10005A768()
{
  id result = *(id *)(v0 + OBJC_IVAR____TtC4Siri37SRCarPlayVisualResponseViewController_snippet);
  if (result) {
    return [result postSiriEvent:1];
  }
  return result;
}

void sub_10005A78C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

void sub_10005A7A0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t), SEL *a6)
{
  uint64_t v7 = *(void **)(v6 + OBJC_IVAR____TtC4Siri37SRCarPlayVisualResponseViewController_snippet);
  if (v7)
  {
    id v13 = v7;
    uint64_t v12 = (void *)a5(a1, a2);
    objc_msgSend(v13, *a6, v12);
  }

void sub_10005A8A4()
{
  id v0 = [objc_allocWithZone(SAUIVisualResponseSnippet) init];
  uint64_t v1 = type metadata accessor for UUID(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  __chkstk_darwin(v1);
  unint64_t v4 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  id v5 = v0;
  uint64_t v6 = UUID.init()(v5);
  UUID.uuidString.getter(v6);
  uint64_t v8 = v7;
  uint64_t v9 = *(void (**)(char *, uint64_t))(v2 + 8);
  v9((char *)&v23 - v4, v1);
  NSString v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v8);
  [v5 setAceId:v10];

  Class isa = Data._bridgeToObjectiveC()().super.isa;
  [v5 setModelData:isa];

  id v12 = (id)__chkstk_darwin([objc_allocWithZone(SAUIAddViews) init]);
  uint64_t v13 = UUID.init()(v12);
  UUID.uuidString.getter(v13);
  uint64_t v15 = v14;
  v9((char *)&v23 - v4, v1);
  NSString v16 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v15);
  [v12 setAceId:v16];

  uint64_t v17 = sub_10004A8E8(&qword_1000D97E0);
  uint64_t v18 = swift_allocObject(v17, 40LL, 7LL);
  *(_OWORD *)(v18 + 16) = xmmword_100083230;
  *(void *)(v18 + 32) = v5;
  uint64_t v24 = v18;
  specialized Array._endMutation()(v18);
  uint64_t v19 = v24;
  sub_10005D8D4();
  id v20 = v5;
  Class v21 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v19);
  [v12 setViews:v21];

  id v22 = v12;
  sub_10005D0E4((uint64_t)v22, 1, v23);
}

void sub_10005AD40(double a1, double a2)
{
  uint64_t v3 = v2;
  id v6 = [v2 view];
  if (v6)
  {
    id v33 = v6;
    uint64_t v7 = type metadata accessor for SRCarPlayScrollView();
    uint64_t v8 = swift_dynamicCastClass(v33, v7);
    if (!v8)
    {

      return;
    }

    uint64_t v9 = (char *)v8;
    uint64_t v35 = 0LL;
    unint64_t v36 = 0xE000000000000000LL;
    _StringGuts.grow(_:)(29LL);
    v10._countAndFlagsBits = 0xD00000000000001BLL;
    v10._object = (void *)0x8000000100089600LL;
    String.append(_:)(v10);
    *(double *)uint64_t v34 = a1;
    *(double *)&v34[1] = a2;
    type metadata accessor for CGSize(0LL);
    _print_unlocked<A, B>(_:_:)( v34,  &v35,  v11,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
    uint64_t v12 = v35;
    unint64_t v13 = v36;
    if (qword_1000D8A20 != -1) {
      swift_once(&qword_1000D8A20, sub_100066BF4);
    }
    uint64_t v14 = type metadata accessor for Logger(0LL);
    uint64_t v15 = sub_10004ADF0(v14, (uint64_t)qword_1000D9988);
    os_log_type_t v16 = static os_log_type_t.info.getter(v15);
    sub_1000681D8(v16, 0x10uLL, 0xD00000000000001ALL, 0x800000010008B0C0LL, v12, v13);
    swift_bridgeObjectRelease(v13);
    uint64_t v17 = (double *)&v9[OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_snippetSize];
    double *v17 = a1;
    v17[1] = a2;
    [*(id *)&v9[OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_heightConstraint] setConstant:a2];
    [*(id *)&v9[OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_widthConstraint] setConstant:*v17];
    [*(id *)&v9[OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_snippetHeightConstraint] setConstant:v17[1]];
    [v9 setNeedsUpdateConstraints];
    id v18 = [(id)objc_opt_self(SRCarPlayUIUtilities) deviceSupportsAI];
    if ((v18 & 1) != 0 || a2 <= 0.0 || a2 > 48.0)
    {
      os_log_type_t v19 = static os_log_type_t.info.getter(v18);
      sub_1000681D8( v19,  0x2000010uLL,  0xD00000000000001ALL,  0x800000010008B0C0LL,  0xD000000000000029LL,  0x800000010008B0E0LL);
      uint64_t Strong = swift_unknownObjectWeakLoadStrong( &v3[OBJC_IVAR____TtC4Siri37SRCarPlayVisualResponseViewController_delegate],  v20);
      if (Strong)
      {
        uint64_t v22 = Strong;
        double v23 = 20.0;
LABEL_15:
        sub_100063D3C(v23);

        swift_unknownObjectRelease(v22);
        return;
      }
    }

    else
    {
      uint64_t v35 = 0LL;
      unint64_t v36 = 0xE000000000000000LL;
      _StringGuts.grow(_:)(67LL);
      v24._countAndFlagsBits = 0xD000000000000041LL;
      v24._object = (void *)0x800000010008B110LL;
      String.append(_:)(v24);
      v25._countAndFlagsBits = Double.description.getter(a2);
      object = v25._object;
      String.append(_:)(v25);
      uint64_t v27 = swift_bridgeObjectRelease(object);
      uint64_t v28 = v35;
      unint64_t v29 = v36;
      os_log_type_t v30 = static os_log_type_t.info.getter(v27);
      sub_1000681D8(v30, 0x2000010uLL, 0xD00000000000001ALL, 0x800000010008B0C0LL, v28, v29);
      swift_bridgeObjectRelease(v29);
      uint64_t v32 = swift_unknownObjectWeakLoadStrong( &v3[OBJC_IVAR____TtC4Siri37SRCarPlayVisualResponseViewController_delegate],  v31);
      if (v32)
      {
        uint64_t v22 = v32;
        if (qword_1000D89F8 != -1) {
          swift_once(&qword_1000D89F8, sub_10004AF08);
        }
        double v23 = *(double *)&qword_1000DA5D0;
        goto LABEL_15;
      }
    }
  }

void sub_10005B10C(void *a1)
{
  uint64_t v2 = v1;
  id v4 = [v2 view];
  if (v4)
  {
    id v19 = v4;
    uint64_t v5 = type metadata accessor for SRCarPlayScrollView();
    if (swift_dynamicCastClass(v19, v5)) {
      BOOL v6 = a1 == 0LL;
    }
    else {
      BOOL v6 = 1;
    }
    if (!v6)
    {
      id v7 = a1;
      _StringGuts.grow(_:)(34LL);
      swift_bridgeObjectRelease(0xE000000000000000LL);
      id v8 = [v7 description];
      uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
      uint64_t v11 = v10;

      v12._countAndFlagsBits = v9;
      v12._object = v11;
      String.append(_:)(v12);
      swift_bridgeObjectRelease(v11);
      if (qword_1000D8A20 != -1) {
        swift_once(&qword_1000D8A20, sub_100066BF4);
      }
      uint64_t v13 = type metadata accessor for Logger(0LL);
      uint64_t v14 = sub_10004ADF0(v13, (uint64_t)qword_1000D9988);
      os_log_type_t v15 = static os_log_type_t.info.getter(v14);
      sub_1000681D8( v15,  0x2000010uLL,  0xD00000000000001FLL,  0x800000010008B070LL,  0xD000000000000020LL,  0x800000010008B090LL);
      swift_bridgeObjectRelease(0x800000010008B090LL);
      uint64_t Strong = swift_unknownObjectWeakLoadStrong( &v2[OBJC_IVAR____TtC4Siri37SRCarPlayVisualResponseViewController_delegate],  v16);
      if (Strong)
      {
        uint64_t v18 = Strong;
        sub_100063E48((uint64_t)v7);

        swift_unknownObjectRelease(v18);
      }

      else
      {
      }
    }
  }

void sub_10005B334(uint64_t a1)
{
  id v3 = [v1 view];
  if (v3)
  {
    id v22 = v3;
    uint64_t v4 = type metadata accessor for SRCarPlayScrollView();
    if (!swift_dynamicCastClass(v22, v4))
    {

      return;
    }

    uint64_t v24 = 0LL;
    unint64_t v25 = 0xE000000000000000LL;
    _StringGuts.grow(_:)(37LL);
    v5._countAndFlagsBits = 0xD000000000000023LL;
    v5._object = (void *)0x800000010008AFA0LL;
    String.append(_:)(v5);
    uint64_t v23 = a1;
    type metadata accessor for VRXHostMaterial(0LL);
    _print_unlocked<A, B>(_:_:)( &v23,  &v24,  v6,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
    uint64_t v8 = v24;
    unint64_t v7 = v25;
    if (qword_1000D8A20 != -1) {
      swift_once(&qword_1000D8A20, sub_100066BF4);
    }
    uint64_t v9 = type metadata accessor for Logger(0LL);
    uint64_t v10 = sub_10004ADF0(v9, (uint64_t)qword_1000D9988);
    os_log_type_t v11 = static os_log_type_t.info.getter(v10);
    sub_1000681D8(v11, 0x2000010uLL, 0xD000000000000022LL, 0x800000010008AF70LL, v8, v7);
    swift_bridgeObjectRelease(v7);
    uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong( &v1[OBJC_IVAR____TtC4Siri37SRCarPlayVisualResponseViewController_delegate],  v12);
    if (!Strong)
    {

      return;
    }

    uint64_t v14 = Strong;
    id v15 = [Strong view];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = type metadata accessor for SRCarPlayView();
      uint64_t v18 = swift_dynamicCastClass(v16, v17);
      if (v18)
      {
        id v19 = *(void **)(v18 + OBJC_IVAR____TtC4Siri13SRCarPlayView_currentSnippetPlatterView);
        if (v19)
        {
          id v20 = v19;
          sub_1000649AC(a1);

          swift_unknownObjectRelease(v14);
        }

        else
        {

          swift_unknownObjectRelease(v14);
        }

        return;
      }
    }

    os_log_type_t v21 = static os_log_type_t.info.getter(v15);
    sub_1000681D8(v21, 0x10uLL, 0xD00000000000004CLL, 0x800000010008AFD0LL, 0xD000000000000041LL, 0x800000010008B020LL);

    swift_unknownObjectRelease(v14);
  }

uint64_t sub_10005B708(uint64_t a1)
{
  v3._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int,  &protocol witness table for Int);
  object = v3._object;
  String.append(_:)(v3);
  swift_bridgeObjectRelease(object);
  v5._countAndFlagsBits = 32LL;
  v5._object = (void *)0xE100000000000000LL;
  String.append(_:)(v5);
  if (qword_1000D8A20 != -1) {
    swift_once(&qword_1000D8A20, sub_100066BF4);
  }
  uint64_t v6 = type metadata accessor for Logger(0LL);
  uint64_t v7 = sub_10004ADF0(v6, (uint64_t)qword_1000D9988);
  os_log_type_t v8 = static os_log_type_t.info.getter(v7);
  sub_1000681D8( v8,  0x2000010uLL,  0xD000000000000019LL,  0x800000010008AF20LL,  0xD000000000000020LL,  0x800000010008AF40LL);
  swift_bridgeObjectRelease(0x800000010008AF40LL);
  uint64_t v9 = v1 + OBJC_IVAR____TtC4Siri37SRCarPlayVisualResponseViewController_delegate;
  uint64_t result = swift_unknownObjectWeakLoadStrong( v1 + OBJC_IVAR____TtC4Siri37SRCarPlayVisualResponseViewController_delegate,  v10);
  if (result)
  {
    uint64_t v12 = result;
    uint64_t v13 = *(void *)(v9 + 8);
    uint64_t ObjectType = swift_getObjectType(result);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 + 8) + 72LL))(a1, ObjectType);
    return swift_unknownObjectRelease(v12);
  }

  return result;
}

void sub_10005B8BC(void *a1)
{
  uint64_t v2 = v1;
  _StringGuts.grow(_:)(36LL);
  swift_bridgeObjectRelease(0xE000000000000000LL);
  unint64_t v68 = 0xD000000000000022LL;
  unint64_t v69 = 0x800000010008ADF0LL;
  id v4 = a1;
  id v5 = [v4 description];
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v5);
  os_log_type_t v8 = v7;

  v9._countAndFlagsBits = v6;
  v9._object = v8;
  String.append(_:)(v9);
  swift_bridgeObjectRelease(v8);
  if (qword_1000D8A20 != -1) {
    swift_once(&qword_1000D8A20, sub_100066BF4);
  }
  uint64_t v10 = type metadata accessor for Logger(0LL);
  uint64_t v11 = sub_10004ADF0(v10, (uint64_t)qword_1000D9988);
  os_log_type_t v12 = static os_log_type_t.info.getter(v11);
  sub_1000681D8( v12,  0x2000000uLL,  0xD00000000000001CLL,  0x800000010008ADD0LL,  0xD000000000000022LL,  0x800000010008ADF0LL);
  swift_bridgeObjectRelease(0x800000010008ADF0LL);
  uint64_t v13 = objc_opt_self(&OBJC_CLASS___VRXTurnBasedInstrumentationEvent);
  uint64_t v14 = swift_dynamicCastObjCClass(v4, v13);
  if (v14)
  {
    id v15 = (void *)v14;
    uint64_t v16 = (void *)objc_opt_self(&OBJC_CLASS___SRUIFInstrumentationManager);
    id v17 = v4;
    id v18 = [v16 sharedManager];
    id v19 = [v18 currentInstrumentationTurnContext];

    id v20 = v19;
    if ([v15 requiresNewTurn])
    {
      os_log_type_t v21 = (void *)objc_opt_self(&OBJC_CLASS___AFAnalyticsTurnBasedInstrumentationContext);
      id v22 = [v20 turnIdentifier];
      id v66 = v17;
      uint64_t v67 = v2;
      uint64_t v23 = type metadata accessor for UUID(0LL);
      uint64_t v24 = *(void *)(v23 - 8);
      id v65 = v16;
      uint64_t v25 = *(void *)(v24 + 64);
      __chkstk_darwin(v23);
      unint64_t v63 = (unint64_t)"o hide background.";
      uint64_t v64 = v11;
      unint64_t v59 = (v25 + 15) & 0xFFFFFFFFFFFFFFF0LL;
      unint64_t v26 = (char *)&v58 - v59;
      static UUID._unconditionallyBridgeFromObjectiveC(_:)(v22);

      Class isa = UUID._bridgeToObjectiveC()().super.isa;
      unint64_t v60 = *(void (**)(char *, uint64_t))(v24 + 8);
      v60(v26, v23);
      id v28 = [v21 newTurnBasedContextWithPreviousTurnID:isa];
      id v62 = v28;

      unint64_t v68 = 0LL;
      unint64_t v69 = 0xE000000000000000LL;
      _StringGuts.grow(_:)(47LL);
      swift_bridgeObjectRelease(v69);
      unint64_t v68 = 0xD00000000000001DLL;
      unint64_t v69 = 0x800000010008AE70LL;
      id v29 = [v28 turnIdentifier];
      uint64_t v30 = __chkstk_darwin(v29);
      unint64_t v61 = v15;
      unint64_t v31 = v59;
      static UUID._unconditionallyBridgeFromObjectiveC(_:)(v30);

      unint64_t v32 = sub_10005D88C();
      v33._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(v23, v32);
      object = v33._object;
      String.append(_:)(v33);
      swift_bridgeObjectRelease(object);
      uint64_t v35 = (uint64_t (*)(char *, uint64_t))v60;
      v60((char *)&v58 - v31, v23);
      v36._countAndFlagsBits = 0x646C4F203E2D3C20LL;
      v36._object = (void *)0xEE00206E72755420LL;
      String.append(_:)(v36);
      id v37 = [v20 turnIdentifier];

      __chkstk_darwin(v38);
      unint64_t v39 = (char *)&v58 - v31;
      id v15 = v61;
      static UUID._unconditionallyBridgeFromObjectiveC(_:)(v37);

      v40._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(v23, v32);
      uint64_t v41 = v40._object;
      String.append(_:)(v40);
      swift_bridgeObjectRelease(v41);
      uint64_t v42 = v23;
      id v17 = v66;
      uint64_t v43 = v35(v39, v42);
      uint64_t v44 = v68;
      unint64_t v45 = v69;
      os_log_type_t v46 = static os_log_type_t.info.getter(v43);
      sub_1000681D8(v46, 0x2000000uLL, 0xD00000000000001CLL, v63 | 0x8000000000000000LL, v44, v45);
      swift_bridgeObjectRelease(v45);

      id v20 = v62;
      id v47 = [v65 sharedManager];
      [v47 storeCurrentInstrumentationTurnContext:v20];
    }

    else
    {
    }

    uint64_t v49 = type metadata accessor for RFInteractionPerformed(0LL);
    if (swift_dynamicCastClass(v15, v49))
    {
      id v50 = v17;
      id v51 = sub_10005BE5C();
      dispatch thunk of RFInteractionPerformed.invocation.setter(v51);
    }

    id v52 = [v20 turnIdentifier];
    uint64_t v53 = type metadata accessor for UUID(0LL);
    uint64_t v54 = *(void *)(v53 - 8);
    __chkstk_darwin(v53);
    uint64_t v56 = (char *)&v58 - ((v55 + 15) & 0xFFFFFFFFFFFFFFF0LL);
    static UUID._unconditionallyBridgeFromObjectiveC(_:)(v52);

    Class v57 = UUID._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v54 + 8))(v56, v53);
    [v15 emitWithTurnIdentifier:v57];
  }

  else
  {
    os_log_type_t v48 = static os_log_type_t.info.getter(0LL);
    sub_1000681D8( v48,  0x2000000uLL,  0xD00000000000001CLL,  0x800000010008ADD0LL,  0xD000000000000045LL,  0x800000010008AE20LL);
  }

id sub_10005BE5C()
{
  id v1 = [objc_allocWithZone(SISchemaInvocation) init];
  id v2 = [objc_allocWithZone(SISchemaViewContainer) init];
  Swift::String v3 = v2;
  id v4 = *(void **)(v0 + OBJC_IVAR____TtC4Siri37SRCarPlayVisualResponseViewController_pluginSnippet);
  id v5 = v4;
  if (v4)
  {
    if (v2) {
      goto LABEL_3;
    }
  }

  else
  {
    id v5 = *(void **)(v0 + OBJC_IVAR____TtC4Siri37SRCarPlayVisualResponseViewController_aceSnippet);
    if (!v5)
    {
      id v15 = 0LL;
      if (!v3) {
        goto LABEL_29;
      }
      id v16 = v3;
      id v5 = 0LL;
      NSString v9 = 0LL;
LABEL_11:
      [v3 setViewID:v9];

      if (v5)
      {
        id v17 = (objc_class *)[v5 classForCoder];
        id v18 = v3;
        id v19 = NSStringFromClass(v17);
        if (!v19)
        {
          static String._unconditionallyBridgeFromObjectiveC(_:)(0LL);
          uint64_t v21 = v20;
          id v19 = (NSString *)String._bridgeToObjectiveC()();
          swift_bridgeObjectRelease(v21);
        }

        [v18 setSnippetClass:v19];

        char v14 = 0;
        if (v1) {
          goto LABEL_15;
        }
        goto LABEL_16;
      }

LABEL_29:
      if (qword_1000D8A20 != -1) {
        swift_once(&qword_1000D8A20, sub_100066BF4);
      }
      uint64_t v39 = type metadata accessor for Logger(0LL);
      uint64_t v40 = sub_10004ADF0(v39, (uint64_t)qword_1000D9988);
      os_log_type_t v41 = static os_log_type_t.info.getter(v40);
      sub_1000681D8( v41,  0x10uLL,  0xD000000000000015LL,  0x800000010008AE90LL,  0xD000000000000034LL,  0x800000010008AEB0LL);
      id v5 = 0LL;
      char v14 = 1;
      if (v1) {
        goto LABEL_15;
      }
      goto LABEL_16;
    }

    id v12 = v5;
    if (v3)
    {
LABEL_3:
      id v6 = v4;
      id v7 = v3;
      id v8 = [v5 aceId];
      NSString v9 = v8;
      if (v8)
      {
        static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
        uint64_t v11 = v10;

        NSString v9 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v11);
      }

      goto LABEL_11;
    }
  }

  id v13 = v4;
  [v5 classForCoder];
  char v14 = 0;
  if (v1) {
LABEL_15:
  }
    [v1 setInvocationSource:11];
LABEL_16:
  [v1 setViewContainer:v3];
  id v22 = [objc_allocWithZone(SISchemaCarPlayInvocationContext) init];
  uint64_t v23 = v22;
  if (!v22) {
    goto LABEL_24;
  }
  if ((v14 & 1) != 0)
  {
    id v24 = v22;
  }

  else
  {
    id v26 = v22;
    id v27 = [v5 sash];
    NSString v25 = v27;
    if (!v27) {
      goto LABEL_23;
    }
    id v28 = [v27 applicationBundleIdentifier];

    if (v28)
    {
      static String._unconditionallyBridgeFromObjectiveC(_:)(v28);
      uint64_t v30 = v29;

      NSString v25 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v30);
      goto LABEL_23;
    }
  }

  NSString v25 = 0LL;
LABEL_23:
  [v23 setBundleID:v25];

LABEL_24:
  if (qword_1000D8A20 != -1) {
    swift_once(&qword_1000D8A20, sub_100066BF4);
  }
  uint64_t v31 = type metadata accessor for Logger(0LL);
  uint64_t v32 = sub_10004ADF0(v31, (uint64_t)qword_1000D9988);
  os_log_type_t v33 = static os_log_type_t.info.getter(v32);
  sub_1000681D8(v33, 0x10uLL, 0xD000000000000015LL, 0x800000010008AE90LL, 0xD000000000000024LL, 0x800000010008AEF0LL);
  id v34 = [(id)objc_opt_self(SASSystemState) sharedSystemState];
  if (v23)
  {
    id v35 = v23;
    objc_msgSend( v35,  "setEnhancedVoiceTriggerMode:",  SASCarPlayEnhancedVoiceTriggerModeToSISchemaEnhancedVoiceTriggerMode(objc_msgSend(v34, "carPlayEnhancedVoiceTriggerMode")));

    id v36 = v35;
    objc_msgSend( v36,  "setCarPlayConnection:",  SASCarPlayTransportTypeToSISchemaCarPlayConnection(objc_msgSend(v34, "carPlayTransportType")));
  }

  id v37 = v1;
  [v37 setCarPlayInvocationContext:v23];

  return v1;
}

uint64_t sub_10005C35C()
{
  uint64_t v1 = v0;
  if (qword_1000D8A20 != -1) {
    swift_once(&qword_1000D8A20, sub_100066BF4);
  }
  uint64_t v2 = type metadata accessor for Logger(0LL);
  uint64_t v3 = sub_10004ADF0(v2, (uint64_t)qword_1000D9988);
  os_log_type_t v4 = static os_log_type_t.info.getter(v3);
  sub_1000681D8(v4, 0x10uLL, 0xD00000000000001ALL, 0x800000010008AD80LL, 0xD000000000000022LL, 0x800000010008ADA0LL);
  uint64_t v5 = v0 + OBJC_IVAR____TtC4Siri37SRCarPlayVisualResponseViewController_delegate;
  uint64_t result = swift_unknownObjectWeakLoadStrong( v0 + OBJC_IVAR____TtC4Siri37SRCarPlayVisualResponseViewController_delegate,  v6);
  if (result)
  {
    uint64_t v8 = result;
    uint64_t v9 = *(void *)(v5 + 8);
    uint64_t ObjectType = swift_getObjectType(result);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 + 8) + 56LL))(v1, ObjectType);
    return swift_unknownObjectRelease(v8);
  }

  return result;
}

Swift::Int __swiftcall Response.getNumberOfSimpleItems()()
{
  uint64_t v0 = sub_10004A8E8(&qword_1000D94C8);
  __chkstk_darwin(v0);
  uint64_t v2 = (char *)&v36 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v3 = sub_10004A8E8(&qword_1000D94D0);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for _ProtoResponse.Component(0LL);
  uint64_t v50 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v44 = type metadata accessor for _ProtoResponse.Section(0LL);
  uint64_t v43 = *(void *)(v44 - 8);
  __chkstk_darwin(v44);
  uint64_t v42 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for Section(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  id v47 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  Swift::Int result = Response.sections.getter(v12);
  uint64_t v41 = *(void *)(result + 16);
  if (!v41)
  {
    swift_bridgeObjectRelease(result);
    return 0LL;
  }

  Swift::Int v15 = 0LL;
  unint64_t v16 = 0LL;
  unint64_t v40 = result + ((*(unsigned __int8 *)(v11 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80));
  uint64_t v37 = v10;
  uint64_t v39 = v11;
  Swift::Int v38 = result;
  while (1)
  {
    if (v16 >= *(void *)(result + 16)) {
      goto LABEL_26;
    }
    uint64_t v18 = *(void *)(v11 + 72);
    unint64_t v46 = v16;
    uint64_t v19 = (*(uint64_t (**)(char *, unint64_t, uint64_t))(v11 + 16))(v47, v40 + v18 * v16, v10);
    uint64_t v20 = v42;
    uint64_t v21 = Section.redactedProto.getter(v19);
    uint64_t v22 = _ProtoResponse.Section.componentList.getter(v21);
    (*(void (**)(char *, uint64_t))(v43 + 8))(v20, v44);
    uint64_t v23 = *(void *)(v22 + 16);
    if (v23) {
      break;
    }
    swift_bridgeObjectRelease(v22);
LABEL_4:
    unint64_t v17 = v46 + 1;
    uint64_t v11 = v39;
    (*(void (**)(char *, uint64_t))(v39 + 8))(v47, v10);
    unint64_t v16 = v17;
    Swift::Int result = v38;
    if (v17 == v41)
    {
      swift_bridgeObjectRelease(v38);
      return v15;
    }
  }

  unint64_t v24 = (*(unsigned __int8 *)(v50 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v50 + 80);
  uint64_t v45 = v22;
  unint64_t v25 = v22 + v24;
  id v26 = *(void (**)(char *, unint64_t, uint64_t))(v50 + 16);
  uint64_t v48 = *(void *)(v50 + 72);
  uint64_t v49 = v26;
  v26(v8, v25, v6);
  while (1)
  {
    Component.redactedComponent()(&v55, v6, &protocol witness table for _ProtoResponse.Component);
    (*(void (**)(char *, uint64_t))(v50 + 8))(v8, v6);
    sub_10005CDCC((uint64_t)&v55, (uint64_t)v53);
    if (v54)
    {
      uint64_t v28 = sub_10004A8E8(&qword_1000D94D8);
      uint64_t v29 = type metadata accessor for SimpleItemRich(0LL);
      int v30 = swift_dynamicCast(v5, v53, v28, v29, 6LL);
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56LL))(v5, v30 ^ 1u, 1LL, v29);
    }

    else
    {
      sub_10004E034((uint64_t)v53, &qword_1000D94C0);
      uint64_t v29 = type metadata accessor for SimpleItemRich(0LL);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56LL))(v5, 1LL, 1LL, v29);
    }

    type metadata accessor for SimpleItemRich(0LL);
    int v31 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v29 - 8) + 48LL))(v5, 1LL, v29);
    sub_10005CE14((uint64_t)&v55, (uint64_t)v53);
    if (!v31) {
      break;
    }
    sub_10005CE14((uint64_t)v53, (uint64_t)v51);
    if (v52)
    {
      uint64_t v32 = sub_10004A8E8(&qword_1000D94D8);
      uint64_t v33 = type metadata accessor for SimpleItemStandard(0LL);
      int v34 = swift_dynamicCast(v2, v51, v32, v33, 6LL);
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56LL))(v2, v34 ^ 1u, 1LL, v33);
    }

    else
    {
      sub_10004E034((uint64_t)v51, &qword_1000D94C0);
      uint64_t v33 = type metadata accessor for SimpleItemStandard(0LL);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56LL))(v2, 1LL, 1LL, v33);
    }

    type metadata accessor for SimpleItemStandard(0LL);
    int v35 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v33 - 8) + 48LL))(v2, 1LL, v33);
    sub_10004E034((uint64_t)v2, &qword_1000D94C8);
    Swift::Int result = sub_10004E034((uint64_t)v5, &qword_1000D94D0);
    if (!v35) {
      goto LABEL_9;
    }
LABEL_10:
    v25 += v48;
    if (!--v23)
    {
      swift_bridgeObjectRelease(v45);
      uint64_t v10 = v37;
      goto LABEL_4;
    }

    v49(v8, v25, v6);
  }

  sub_10004E034((uint64_t)v53, &qword_1000D94C0);
  Swift::Int result = sub_10004E034((uint64_t)v5, &qword_1000D94D0);
LABEL_9:
  if (!__OFADD__(v15++, 1LL)) {
    goto LABEL_10;
  }
  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

char *sub_10005C9AC(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }

  unint64_t v6 = *((void *)a4 + 3);
  uint64_t v7 = v6 >> 1;
  if (v7 + 0x4000000000000000LL >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
LABEL_8:
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      uint64_t v10 = sub_10004A8E8(&qword_1000D9248);
      uint64_t v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7LL);
      int64_t v12 = j__malloc_size(v11);
      uint64_t v13 = v12 - 32;
      if (v12 < 32) {
        uint64_t v13 = v12 - 17;
      }
      *((void *)v11 + 2) = v8;
      *((void *)v11 + 3) = 2 * (v13 >> 4);
      char v14 = v11 + 32;
      if ((v5 & 1) != 0) {
        goto LABEL_15;
      }
    }

    else
    {
      uint64_t v11 = (char *)&_swiftEmptyArrayStorage;
      char v14 = (char *)&_swiftEmptyArrayStorage + 32;
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v11 != a4 || v14 >= &a4[16 * v8 + 32]) {
          memmove(v14, a4 + 32, 16 * v8);
        }
        *((void *)a4 + 2) = 0LL;
        goto LABEL_24;
      }
    }

    sub_10005D390(0LL, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }

  __break(1u);
  return result;
}

uint64_t sub_10005CAB8(char a1, int64_t a2, char a3, unint64_t a4)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
LABEL_29:
        uint64_t result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Division by zero",  16LL,  2LL,  "Swift/IntegerTypes.swift",  24LL,  2,  14377LL,  0);
LABEL_31:
        __break(1u);
        return result;
      }

      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    uint64_t v7 = a2;
  }

  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    Swift::Int v15 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }

  uint64_t v10 = sub_10004A8E8(&qword_1000D9688);
  uint64_t v11 = *(void *)(type metadata accessor for UUID(0LL) - 8);
  uint64_t v12 = *(void *)(v11 + 72);
  uint64_t v13 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v14 = (v13 + 32) & ~v13;
  Swift::Int v15 = (void *)swift_allocObject(v10, v14 + v12 * v9, v13 | 7);
  size_t v16 = j__malloc_size(v15);
  if (!v12) {
    goto LABEL_29;
  }
  if (v16 - v14 == 0x8000000000000000LL && v12 == -1)
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Division results in an overflow",  31LL,  2LL,  "Swift/IntegerTypes.swift",  24LL,  2,  14384LL,  0);
    goto LABEL_31;
  }

  _OWORD v15[2] = v8;
  v15[3] = 2 * ((uint64_t)(v16 - v14) / v12);
LABEL_19:
  uint64_t v18 = type metadata accessor for UUID(0LL);
  uint64_t v19 = *(void *)(v18 - 8);
  unint64_t v20 = (*(unsigned __int8 *)(v19 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  unint64_t v21 = (unint64_t)v15 + v20;
  if ((a1 & 1) != 0)
  {
    unint64_t v22 = a4 + v20;
    if ((unint64_t)v15 < a4 || v21 >= v22 + *(void *)(v19 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack((char *)v15 + v20, v22, v8, v18);
    }

    else if (v15 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront((char *)v15 + v20);
    }

    *(void *)(a4 + 16) = 0LL;
  }

  else
  {
    sub_10005D480(0LL, v8, v21, a4);
  }

  swift_bridgeObjectRelease(a4);
  return (uint64_t)v15;
}

void *sub_10005CCC0(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }

  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if (v7 + 0x4000000000000000LL >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      uint64_t v10 = sub_10004A8E8(&qword_1000D9690);
      uint64_t v11 = (void *)swift_allocObject(v10, 16 * v9 + 32, 7LL);
      int64_t v12 = j__malloc_size(v11);
      uint64_t v13 = v12 - 32;
      if (v12 < 32) {
        uint64_t v13 = v12 - 17;
      }
      v11[2] = v8;
      v11[3] = 2 * (v13 >> 4);
      uint64_t v14 = v11 + 4;
      if ((v5 & 1) != 0) {
        goto LABEL_15;
      }
    }

    else
    {
      uint64_t v11 = _swiftEmptyArrayStorage;
      uint64_t v14 = &_swiftEmptyArrayStorage[4];
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v11 != a4 || v14 >= &a4[2 * v8 + 4]) {
          memmove(v14, a4 + 4, 16 * v8);
        }
        a4[2] = 0LL;
        goto LABEL_24;
      }
    }

    sub_10005D598(0LL, v8, (char *)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }

  __break(1u);
  return result;
}

uint64_t sub_10005CDCC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10004A8E8(&qword_1000D94C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_10005CE14(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10004A8E8(&qword_1000D94C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for SRCarPlayVisualResponseViewController()
{
  return objc_opt_self(&OBJC_CLASS____TtC4Siri37SRCarPlayVisualResponseViewController);
}

uint64_t sub_10005CE7C(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain(result);
  }

  return swift_retain(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_10005CEC0(char a1, int64_t a2, char a3, unint64_t a4)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
LABEL_29:
        uint64_t result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Division by zero",  16LL,  2LL,  "Swift/IntegerTypes.swift",  24LL,  2,  14377LL,  0);
LABEL_31:
        __break(1u);
        return result;
      }

      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    uint64_t v7 = a2;
  }

  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    Swift::Int v15 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }

  uint64_t v10 = sub_10004A8E8((uint64_t *)&unk_1000D9660);
  uint64_t v11 = *(void *)(sub_10004A8E8(&qword_1000D9860) - 8);
  uint64_t v12 = *(void *)(v11 + 72);
  uint64_t v13 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v14 = (v13 + 32) & ~v13;
  Swift::Int v15 = (void *)swift_allocObject(v10, v14 + v12 * v9, v13 | 7);
  size_t v16 = j__malloc_size(v15);
  if (!v12) {
    goto LABEL_29;
  }
  if (v16 - v14 == 0x8000000000000000LL && v12 == -1)
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Division results in an overflow",  31LL,  2LL,  "Swift/IntegerTypes.swift",  24LL,  2,  14384LL,  0);
    goto LABEL_31;
  }

  _OWORD v15[2] = v8;
  v15[3] = 2 * ((uint64_t)(v16 - v14) / v12);
LABEL_19:
  uint64_t v18 = sub_10004A8E8(&qword_1000D9860);
  uint64_t v19 = *(void *)(v18 - 8);
  unint64_t v20 = (*(unsigned __int8 *)(v19 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  unint64_t v21 = (unint64_t)v15 + v20;
  if ((a1 & 1) != 0)
  {
    unint64_t v22 = a4 + v20;
    if ((unint64_t)v15 < a4 || v21 >= v22 + *(void *)(v19 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack((char *)v15 + v20, v22, v8, v18);
    }

    else if (v15 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront((char *)v15 + v20);
    }

    *(void *)(a4 + 16) = 0LL;
  }

  else
  {
    sub_10005D680(0LL, v8, v21, a4);
  }

  swift_bridgeObjectRelease(a4);
  return (uint64_t)v15;
}

void *sub_10005D0D0(void *a1)
{
  return sub_10005CCC0(0LL, a1[2], 0, a1);
}

uint64_t sub_10005D0E4(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v37 = 0LL;
  unint64_t v38 = 0xE000000000000000LL;
  _StringGuts.grow(_:)(77LL);
  v6._countAndFlagsBits = 0xD000000000000032LL;
  v6._object = (void *)0x800000010008B1D0LL;
  String.append(_:)(v6);
  uint64_t ObjectType = swift_getObjectType(a1);
  uint64_t v36 = a1;
  uint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for NSObject, ObjectType);
  DefaultStringInterpolation.appendInterpolation<A>(_:)(&v36, ObjectType, WitnessTable);
  v9._object = (void *)0x800000010008B210LL;
  v9._countAndFlagsBits = 0xD000000000000017LL;
  String.append(_:)(v9);
  if ((a2 & 1) != 0) {
    uint64_t v10 = 1702195828LL;
  }
  else {
    uint64_t v10 = 0x65736C6166LL;
  }
  if ((a2 & 1) != 0) {
    unint64_t v11 = 0xE400000000000000LL;
  }
  else {
    unint64_t v11 = 0xE500000000000000LL;
  }
  unint64_t v12 = v11;
  String.append(_:)(*(Swift::String *)&v10);
  swift_bridgeObjectRelease(v11);
  uint64_t v13 = v37;
  unint64_t v14 = v38;
  if (qword_1000D8A20 != -1) {
    swift_once(&qword_1000D8A20, sub_100066BF4);
  }
  uint64_t v15 = type metadata accessor for Logger(0LL);
  uint64_t v16 = sub_10004ADF0(v15, (uint64_t)qword_1000D9988);
  os_log_type_t v17 = static os_log_type_t.info.getter(v16);
  sub_1000681D8(v17, 0x10uLL, 0xD000000000000031LL, 0x800000010008B230LL, v13, v14);
  swift_bridgeObjectRelease(v14);
  uint64_t v18 = type metadata accessor for UUID(0LL);
  uint64_t v19 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  unint64_t v21 = (char *)&v35 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v22 = [(id)objc_opt_self(SRUIFInstrumentationManager) sharedManager];
  id v23 = [v22 currentInstrumentationTurnContext];

  id v24 = [v23 turnIdentifier];
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(v24);

  uint64_t v25 = a3 + OBJC_IVAR____TtC4Siri37SRCarPlayVisualResponseViewController_delegate;
  uint64_t Strong = swift_unknownObjectWeakLoadStrong( a3 + OBJC_IVAR____TtC4Siri37SRCarPlayVisualResponseViewController_delegate,  v26);
  if (Strong)
  {
    uint64_t v29 = Strong;
    uint64_t v30 = *(void *)(v25 + 8);
    uint64_t v31 = swift_getObjectType(Strong);
    (*(void (**)(uint64_t, uint64_t, char *, uint64_t))(*(void *)(v30 + 8) + 40LL))(a3, a1, v21, v31);
    swift_unknownObjectRelease(v29);
  }

  if ((a2 & 1) != 0)
  {
    uint64_t v32 = (void *)swift_unknownObjectWeakLoadStrong(v25, v28);
    if (v32)
    {
      uint64_t v33 = v32;
      [v32 clearSnippet];
      swift_unknownObjectRelease(v33);
    }
  }

  return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v21, v18);
}

uint64_t sub_10005D390(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }

  else
  {
    if (v4 < 0)
    {
      uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
      goto LABEL_9;
    }

    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy(a3);
      return v6;
    }
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_10005D480(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }

  if (v4 < 0)
  {
LABEL_9:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
    goto LABEL_11;
  }

  uint64_t v8 = *(void *)(type metadata accessor for UUID(0LL) - 8);
  uint64_t v9 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = *(void *)(v8 + 72);
  unint64_t v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
  uint64_t v12 = v10 * v4;
  unint64_t v13 = a3 + v12;
  unint64_t v14 = v11 + v12;
  if (v11 >= v13 || v14 <= a3)
  {
    swift_arrayInitWithCopy(a3);
    return v13;
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_11:
  __break(1u);
  return result;
}

char *sub_10005D598(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }

  else
  {
    if (v4 < 0)
    {
      uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
      goto LABEL_9;
    }

    unint64_t v5 = (char *)(a4 + 16 * a1 + 32);
    size_t v6 = 16 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }

  uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_10005D680(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }

  if (v4 < 0)
  {
LABEL_9:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
    goto LABEL_11;
  }

  uint64_t v8 = *(void *)(sub_10004A8E8(&qword_1000D9860) - 8);
  uint64_t v9 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v10 = *(void *)(v8 + 72);
  unint64_t v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
  uint64_t v12 = v10 * v4;
  unint64_t v13 = a3 + v12;
  unint64_t v14 = v11 + v12;
  if (v11 >= v13 || v14 <= a3)
  {
    swift_arrayInitWithCopy(a3);
    return v13;
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_10005D79C()
{
  uint64_t v1 = v0;
  if (qword_1000D8A20 != -1) {
    swift_once(&qword_1000D8A20, sub_100066BF4);
  }
  uint64_t v2 = type metadata accessor for Logger(0LL);
  uint64_t v3 = sub_10004ADF0(v2, (uint64_t)qword_1000D9988);
  os_log_type_t v4 = static os_log_type_t.info.getter(v3);
  sub_1000681D8(v4, 0x10uLL, 0xD000000000000017LL, 0x8000000100089620LL, 0xD000000000000036LL, 0x8000000100089640LL);
  uint64_t v5 = v0 + OBJC_IVAR____TtC4Siri37SRCarPlayVisualResponseViewController_delegate;
  uint64_t result = swift_unknownObjectWeakLoadStrong( v0 + OBJC_IVAR____TtC4Siri37SRCarPlayVisualResponseViewController_delegate,  v6);
  if (result)
  {
    uint64_t v8 = result;
    uint64_t v9 = *(void *)(v5 + 8);
    uint64_t ObjectType = swift_getObjectType(result);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 + 8) + 24LL))(v1, ObjectType);
    return swift_unknownObjectRelease(v8);
  }

  return result;
}

unint64_t sub_10005D88C()
{
  unint64_t result = qword_1000D9670;
  if (!qword_1000D9670)
  {
    uint64_t v1 = type metadata accessor for UUID(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for UUID, v1);
    atomic_store(result, (unint64_t *)&qword_1000D9670);
  }

  return result;
}

unint64_t sub_10005D8D4()
{
  unint64_t result = qword_1000D9680;
  if (!qword_1000D9680)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___SAAceView);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_1000D9680);
  }

  return result;
}

void sub_10005D910(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  id v4 = [objc_allocWithZone(SiriUISnippetManager) init];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = [v4 safeDisambiguationItemForListItem:v3 disambiguationKey:0];
  }

  else
  {
    if (qword_1000D8A20 != -1) {
      swift_once(&qword_1000D8A20, sub_100066BF4);
    }
    uint64_t v7 = type metadata accessor for Logger(0LL);
    uint64_t v8 = sub_10004ADF0(v7, (uint64_t)qword_1000D9988);
    os_log_type_t v9 = static os_log_type_t.fault.getter(v8);
    sub_1000681D8(v9, 0LL, 0xD000000000000018LL, 0x800000010008B380LL, 0xD00000000000002FLL, 0x800000010008B3A0LL);
    id v6 = 0LL;
  }

  *a2 = v6;
}

void *sub_10005DA10(uint64_t a1)
{
  uint64_t v2 = v1;
  unint64_t result = [v1 items];
  if (!result)
  {
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }

  uint64_t v5 = result;
  unint64_t v6 = sub_100053314();
  uint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v5, v6);

  if ((unint64_t)v7 >> 62)
  {
    if (v7 < 0) {
      uint64_t v14 = v7;
    }
    else {
      uint64_t v14 = v7 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v7);
    uint64_t v8 = _CocoaArrayWrapper.endIndex.getter(v14);
    swift_bridgeObjectRelease(v7);
  }

  else
  {
    uint64_t v8 = *(void *)((v7 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  }

  swift_bridgeObjectRelease(v7);
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0) {
      uint64_t v15 = a1;
    }
    else {
      uint64_t v15 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
    uint64_t v16 = _CocoaArrayWrapper.endIndex.getter(v15);
    swift_bridgeObjectRelease(a1);
    if (v8 == v16)
    {
LABEL_6:
      unint64_t result = [v2 items];
      if (result)
      {
        os_log_type_t v9 = result;
        uint64_t v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)(result, v6);

        uint64_t v11 = swift_bridgeObjectRetain(a1);
        sub_10005E0C8(v11, v10);
        unint64_t v13 = v12;
        swift_bridgeObjectRelease(v10);
LABEL_21:
        swift_bridgeObjectRelease(a1);
        return v13;
      }

      goto LABEL_27;
    }
  }

  else if (v8 == *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10))
  {
    goto LABEL_6;
  }

  _StringGuts.grow(_:)(112LL);
  v17._countAndFlagsBits = 0xD000000000000037LL;
  v17._object = (void *)0x800000010008B2F0LL;
  String.append(_:)(v17);
  v18._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int,  &protocol witness table for Int);
  object = v18._object;
  String.append(_:)(v18);
  swift_bridgeObjectRelease(object);
  v20._countAndFlagsBits = 0xD000000000000021LL;
  v20._object = (void *)0x800000010008B330LL;
  String.append(_:)(v20);
  unint64_t result = [v2 items];
  if (result)
  {
    unint64_t v21 = result;
    uint64_t v22 = static Array._unconditionallyBridgeFromObjectiveC(_:)(result, v6);

    if ((unint64_t)v22 >> 62)
    {
      if (v22 < 0) {
        uint64_t v29 = v22;
      }
      else {
        uint64_t v29 = v22 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain(v22);
      _CocoaArrayWrapper.endIndex.getter(v29);
      swift_bridgeObjectRelease(v22);
    }

    swift_bridgeObjectRelease(v22);
    v23._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int,  &protocol witness table for Int);
    id v24 = v23._object;
    String.append(_:)(v23);
    swift_bridgeObjectRelease(v24);
    v25._object = (void *)0x800000010008B360LL;
    v25._countAndFlagsBits = 0xD000000000000014LL;
    String.append(_:)(v25);
    a1 = 0xE000000000000000LL;
    if (qword_1000D8A20 != -1) {
      swift_once(&qword_1000D8A20, sub_100066BF4);
    }
    uint64_t v26 = type metadata accessor for Logger(0LL);
    uint64_t v27 = sub_10004ADF0(v26, (uint64_t)qword_1000D9988);
    os_log_type_t v28 = static os_log_type_t.info.getter(v27);
    sub_1000681D8(v28, 0x10uLL, 0x726628736C6C6563LL, 0xEC000000293A6D6FLL, 0LL, 0xE000000000000000LL);
    unint64_t v13 = _swiftEmptyArrayStorage;
    goto LABEL_21;
  }

id sub_10005DD58(void *a1, void *a2)
{
  uint64_t v4 = sub_10004A8E8((uint64_t *)&unk_1000D9698);
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = __chkstk_darwin(v5);
  uint64_t v10 = (char *)&v39 - v9;
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v39 - v11;
  id v13 = [a2 commands];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = sub_10004A8E8(&qword_1000D8C20);
    uint64_t v16 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v14, v15);
  }

  else
  {
    uint64_t v16 = 0LL;
  }

  sub_100064E78(v16, (uint64_t)v12);
  swift_bridgeObjectRelease(v16);
  id v17 = [a1 headingText];
  if (v17)
  {
    Swift::String v18 = v17;
    uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(v17);
    uint64_t v21 = v20;

    unint64_t v59 = &type metadata for String;
    unint64_t v60 = &protocol witness table for String;
    uint64_t v57 = v19;
    uint64_t v58 = v21;
    uint64_t v56 = 0LL;
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    id v22 = [a1 title];
    if (v22)
    {
      Swift::String v23 = v22;
      uint64_t v24 = static String._unconditionallyBridgeFromObjectiveC(_:)(v22);
      uint64_t v26 = v25;

      *((void *)&v52 + 1) = &type metadata for String;
      uint64_t v53 = &protocol witness table for String;
      *(void *)&__int128 v51 = v24;
      *((void *)&v51 + 1) = v26;
    }

    else
    {
      uint64_t v53 = 0LL;
      __int128 v51 = 0u;
      __int128 v52 = 0u;
    }

    uint64_t v50 = 0LL;
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    uint64_t v47 = 0LL;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    uint64_t v44 = 0LL;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    sub_10005E62C((uint64_t)v12, (uint64_t)v10);
    uint64_t v35 = type metadata accessor for Command(0LL);
    uint64_t v36 = *(void *)(v35 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48))(v10, 1LL, v35) != 1)
    {
      *((void *)&v40 + 1) = v35;
      uint64_t v41 = &protocol witness table for Command;
      uint64_t v37 = sub_1000533B0(&v39);
      (*(void (**)(void *, char *, uint64_t))(v36 + 32))(v37, v10, v35);
      goto LABEL_16;
    }

    uint64_t v34 = (uint64_t)v10;
LABEL_13:
    sub_10005E674(v34);
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    uint64_t v41 = 0LL;
LABEL_16:
    SimpleItemStandard.init(text1:text2:text3:text4:text5:text6:action:componentName:linkIdentifier:)( &v57,  &v54,  &v51,  &v48,  &v45,  &v42,  &v39,  0LL,  0xE000000000000000LL,  0LL,  0LL);
    return (id)sub_10005E674((uint64_t)v12);
  }

  id result = [a1 title];
  if (result)
  {
    os_log_type_t v28 = result;
    uint64_t v29 = static String._unconditionallyBridgeFromObjectiveC(_:)(result);
    uint64_t v31 = v30;

    unint64_t v59 = &type metadata for String;
    unint64_t v60 = &protocol witness table for String;
    uint64_t v57 = v29;
    uint64_t v58 = v31;
    uint64_t v56 = 0LL;
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    uint64_t v53 = 0LL;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    uint64_t v50 = 0LL;
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    uint64_t v47 = 0LL;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    uint64_t v44 = 0LL;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    sub_10005E62C((uint64_t)v12, (uint64_t)v7);
    uint64_t v32 = type metadata accessor for Command(0LL);
    uint64_t v33 = *(void *)(v32 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48))(v7, 1LL, v32) != 1)
    {
      *((void *)&v40 + 1) = v32;
      uint64_t v41 = &protocol witness table for Command;
      unint64_t v38 = sub_1000533B0(&v39);
      (*(void (**)(void *, char *, uint64_t))(v33 + 32))(v38, v7, v32);
      goto LABEL_16;
    }

    uint64_t v34 = (uint64_t)v7;
    goto LABEL_13;
  }

  __break(1u);
  return result;
}

void sub_10005E0C8(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = v2;
  uint64_t v45 = type metadata accessor for SimpleItemStandard(0LL);
  uint64_t v6 = *(void *)(v45 - 8);
  uint64_t v7 = __chkstk_darwin(v45);
  uint64_t v9 = (uint64_t)v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v7);
  uint64_t v11 = (uint64_t)v36 - v10;
  uint64_t v39 = a1;
  unint64_t v40 = (unint64_t)a1 >> 62;
  if (!((unint64_t)a1 >> 62))
  {
    uint64_t v12 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    goto LABEL_3;
  }

  while (1)
  {
    uint64_t v34 = a1 < 0 ? a1 : a1 & 0xFFFFFFFFFFFFFF8LL;
    swift_bridgeObjectRetain(a1);
    uint64_t v12 = _CocoaArrayWrapper.endIndex.getter(v34);
    swift_bridgeObjectRelease(a1);
LABEL_3:
    unint64_t v47 = (unint64_t)a2 >> 62;
    if ((unint64_t)a2 >> 62)
    {
      uint64_t v35 = a2 < 0 ? a2 : a2 & 0xFFFFFFFFFFFFFF8LL;
      swift_bridgeObjectRetain(a2);
      uint64_t v13 = _CocoaArrayWrapper.endIndex.getter(v35);
      swift_bridgeObjectRelease(a2);
    }

    else
    {
      uint64_t v13 = *(void *)((a2 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    }

    uint64_t v14 = v13 >= v12 ? v12 : v13;
    __int128 v49 = _swiftEmptyArrayStorage;
    int64_t v43 = v14 & ~(v14 >> 63);
    sub_10005204C(0, v43, 0);
    if (v14 < 0) {
      break;
    }
    a1 = (uint64_t)v49;
    v36[1] = v3;
    uint64_t v38 = v11;
    if (!v14)
    {
      uint64_t v11 = v39;
      uint64_t v15 = v39 & 0xFFFFFFFFFFFFFF8LL;
      unint64_t v48 = v39 & 0xC000000000000001LL;
      uint64_t v16 = a2 & 0xFFFFFFFFFFFFFF8LL;
      unint64_t v46 = a2 & 0xC000000000000001LL;
      swift_bridgeObjectRetain(v39);
      swift_bridgeObjectRetain(a2);
      goto LABEL_39;
    }

    if (v40)
    {
      uint64_t v11 = v39;
      uint64_t v44 = v39 & 0xFFFFFFFFFFFFFF8LL;
      if (v39 < 0) {
        uint64_t v17 = v39;
      }
      else {
        uint64_t v17 = v39 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain_n(v39, 2LL);
      swift_bridgeObjectRetain(a2);
      uint64_t v42 = _CocoaArrayWrapper.endIndex.getter(v17);
      swift_bridgeObjectRelease(v11);
    }

    else
    {
      uint64_t v11 = v39;
      uint64_t v44 = v39 & 0xFFFFFFFFFFFFFF8LL;
      uint64_t v42 = *(void *)((v39 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
      swift_bridgeObjectRetain(v39);
      swift_bridgeObjectRetain(a2);
    }

    unint64_t v18 = 0LL;
    unint64_t v48 = v11 & 0xC000000000000001LL;
    uint64_t v16 = a2 & 0xFFFFFFFFFFFFFF8LL;
    if (a2 < 0) {
      uint64_t v19 = a2;
    }
    else {
      uint64_t v19 = a2 & 0xFFFFFFFFFFFFFF8LL;
    }
    uint64_t v37 = v19;
    unint64_t v46 = a2 & 0xC000000000000001LL;
    uint64_t v41 = v14;
    while (v43 != v18)
    {
      if (v42 == v18) {
        goto LABEL_71;
      }
      if (v48)
      {
        id v20 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v18, v11);
      }

      else
      {
        if (v18 >= *(void *)(v44 + 16)) {
          goto LABEL_78;
        }
        id v20 = *(id *)(v11 + 8 * v18 + 32);
      }

      uint64_t v14 = (uint64_t)v20;
      if (v47)
      {
        swift_bridgeObjectRetain(a2);
        unint64_t v3 = _CocoaArrayWrapper.endIndex.getter(v37);
        swift_bridgeObjectRelease(a2);
      }

      else
      {
        unint64_t v3 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
      }

      if (v18 == v3) {
        goto LABEL_88;
      }
      if (v46)
      {
        id v21 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v18, a2);
      }

      else
      {
        if (v18 >= *(void *)((a2 & 0xFFFFFFFFFFFFFF8LL) + 0x10)) {
          goto LABEL_72;
        }
        id v21 = *(id *)(a2 + 8 * v18 + 32);
      }

      id v22 = v21;
      sub_10005DD58((void *)v14, v21);

      __int128 v49 = (void *)a1;
      unint64_t v3 = *(void *)(a1 + 16);
      unint64_t v23 = *(void *)(a1 + 24);
      if (v3 >= v23 >> 1)
      {
        sub_10005204C(v23 > 1, v3 + 1, 1);
        a1 = (uint64_t)v49;
      }

      ++v18;
      *(void *)(a1 + 16) = v3 + 1;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v6 + 32))( a1 + ((*(unsigned __int8 *)(v6 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))
      + *(void *)(v6 + 72) * v3,
        v9,
        v45);
      uint64_t v14 = v41;
      if (v41 == v18)
      {
        uint64_t v15 = v44;
LABEL_39:
        if (v11 < 0) {
          int64_t v24 = v11;
        }
        else {
          int64_t v24 = v15;
        }
        int64_t v43 = v24;
        uint64_t v44 = v15;
        if (a2 < 0) {
          uint64_t v25 = a2;
        }
        else {
          uint64_t v25 = v16;
        }
        uint64_t v42 = v25;
        uint64_t v9 = v14 + 4;
        if (!v40)
        {
LABEL_46:
          uint64_t v26 = *(void *)(v44 + 16);
          goto LABEL_48;
        }

        while (1)
        {
          swift_bridgeObjectRetain(v11);
          uint64_t v26 = _CocoaArrayWrapper.endIndex.getter(v43);
          swift_bridgeObjectRelease(v11);
LABEL_48:
          unint64_t v27 = v9 - 4;
          if (v9 - 4 == v26)
          {
            swift_bridgeObjectRelease(a2);
            swift_bridgeObjectRelease(v11);
            return;
          }

          if (v48)
          {
            id v28 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v9 - 4, v11);
          }

          else
          {
            if ((v27 & 0x8000000000000000LL) != 0) {
              goto LABEL_73;
            }
            if (v27 >= *(void *)(v44 + 16)) {
              goto LABEL_74;
            }
            id v28 = *(id *)(v11 + 8 * v9);
          }

          uint64_t v29 = v28;
          if (__OFADD__(v27, 1LL)) {
            goto LABEL_75;
          }
          if (v47)
          {
            swift_bridgeObjectRetain(a2);
            unint64_t v3 = _CocoaArrayWrapper.endIndex.getter(v42);
            swift_bridgeObjectRelease(a2);
            if (v27 == v3)
            {
LABEL_69:
              swift_bridgeObjectRelease(a2);
              swift_bridgeObjectRelease(v11);

              return;
            }
          }

          else
          {
            unint64_t v3 = *(void *)(v16 + 16);
            if (v27 == v3) {
              goto LABEL_69;
            }
          }

          if (v46)
          {
            id v30 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v9 - 4, a2);
          }

          else
          {
            if ((v27 & 0x8000000000000000LL) != 0) {
              goto LABEL_76;
            }
            if (v27 >= *(void *)(v16 + 16)) {
              goto LABEL_77;
            }
            id v30 = *(id *)(a2 + 8 * v9);
          }

          uint64_t v31 = v30;
          uint64_t v32 = v38;
          sub_10005DD58(v29, v30);

          __int128 v49 = (void *)a1;
          unint64_t v3 = *(void *)(a1 + 16);
          unint64_t v33 = *(void *)(a1 + 24);
          if (v3 >= v33 >> 1)
          {
            sub_10005204C(v33 > 1, v3 + 1, 1);
            a1 = (uint64_t)v49;
          }

          *(void *)(a1 + 16) = v3 + 1;
          (*(void (**)(unint64_t, uint64_t, uint64_t))(v6 + 32))( a1 + ((*(unsigned __int8 *)(v6 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))
          + *(void *)(v6 + 72) * v3,
            v32,
            v45);
          ++v9;
          uint64_t v11 = v39;
          if (!v40) {
            goto LABEL_46;
          }
        }
      }
    }

    __break(1u);
LABEL_71:
    __break(1u);
LABEL_72:
    __break(1u);
LABEL_73:
    __break(1u);
LABEL_74:
    __break(1u);
LABEL_75:
    __break(1u);
LABEL_76:
    __break(1u);
LABEL_77:
    __break(1u);
LABEL_78:
    __break(1u);
  }

  __break(1u);
LABEL_88:

  __break(1u);
}

uint64_t sub_10005E62C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10004A8E8((uint64_t *)&unk_1000D9698);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_10005E674(uint64_t a1)
{
  uint64_t v2 = sub_10004A8E8((uint64_t *)&unk_1000D9698);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

ValueMetadata *type metadata accessor for DefaultDisambiguationItemConverter()
{
  return &type metadata for DefaultDisambiguationItemConverter;
}

id sub_10005E6C4()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Response(0LL);
  uint64_t v90 = *(void *)(v2 - 8);
  uint64_t v3 = __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v86 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v3);
  uint64_t v89 = (char *)&v86 - v6;
  uint64_t v7 = type metadata accessor for BinaryButton(0LL);
  uint64_t v109 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v86 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v106 = type metadata accessor for Button.LabelStyle(0LL);
  uint64_t v88 = *(void *)(v106 - 8);
  __chkstk_darwin(v106);
  uint64_t v107 = (char *)&v86 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v104 = type metadata accessor for _ProtoButton.FormAction(0LL);
  uint64_t v91 = *(void *)(v104 - 8);
  __chkstk_darwin(v104);
  int v105 = (char *)&v86 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v103 = type metadata accessor for ButtonRole(0LL);
  uint64_t v12 = *(void *)(v103 - 8);
  __chkstk_darwin(v103);
  uint64_t v14 = (char *)&v86 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v96 = type metadata accessor for Button(0LL);
  uint64_t v95 = *(void *)(v96 - 8);
  uint64_t v15 = __chkstk_darwin(v96);
  os_log_type_t v94 = (char *)&v86 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v93 = (char *)&v86 - v18;
  uint64_t v19 = __chkstk_darwin(v17);
  uint64_t v108 = (char *)&v86 - v20;
  __chkstk_darwin(v19);
  unint64_t v110 = (char *)&v86 - v21;
  uint64_t v102 = type metadata accessor for SystemTextClarificationTitle(0LL);
  uint64_t v101 = *(void *)(v102 - 8);
  __chkstk_darwin(v102);
  unint64_t v23 = (char *)&v86 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_1000D8A20 != -1) {
    swift_once(&qword_1000D8A20, sub_100066BF4);
  }
  uint64_t v87 = v5;
  uint64_t v97 = v2;
  uint64_t v24 = type metadata accessor for Logger(0LL);
  uint64_t v25 = sub_10004ADF0(v24, (uint64_t)qword_1000D9988);
  os_log_type_t v26 = static os_log_type_t.info.getter(v25);
  sub_1000681D8(v26, 0x10uLL, 0xD000000000000019LL, 0x800000010008B3D0LL, 0xD00000000000003ELL, 0x800000010008B3F0LL);
  id v27 = [v1 subtitle];
  if (v27 || (id v27 = [v1 title]) != 0)
  {
    uint64_t v28 = static String._unconditionallyBridgeFromObjectiveC(_:)(v27);
    unint64_t v30 = v29;
  }

  else
  {
    uint64_t v28 = 0LL;
    unint64_t v30 = 0xE000000000000000LL;
  }

  v120[3] = &type metadata for String;
  v120[4] = &protocol witness table for String;
  uint64_t v92 = v28;
  v120[0] = v28;
  v120[1] = v30;
  memset(v119, 0, sizeof(v119));
  swift_bridgeObjectRetain(v30);
  SystemTextClarificationTitle.init(text1:action:)(v120, v119);
  id v31 = [v1 confirmCommands];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = sub_10004A8E8(&qword_1000D8C20);
    uint64_t v34 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v32, v33);
  }

  else
  {
    uint64_t v34 = 0LL;
  }

  sub_10005F15C(v34, v120);
  swift_bridgeObjectRelease(v34);
  id v35 = [v1 denyCommands];
  unint64_t v100 = v23;
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = sub_10004A8E8(&qword_1000D8C20);
    uint64_t v38 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v36, v37);
  }

  else
  {
    uint64_t v38 = 0LL;
  }

  sub_10005F15C(v38, v119);
  swift_bridgeObjectRelease(v38);
  sub_10005A618((uint64_t)v120, (uint64_t)v118);
  id v39 = [v1 confirmText];
  uint64_t v99 = v7;
  Swift::String v98 = v9;
  if (v39)
  {
    unint64_t v40 = v39;
    uint64_t v41 = static String._unconditionallyBridgeFromObjectiveC(_:)(v39);
    unint64_t v43 = v42;

    os_log_type_t v116 = &type metadata for String;
    uint64_t v117 = &protocol witness table for String;
    if (v43) {
      goto LABEL_17;
    }
    uint64_t v41 = 0LL;
  }

  else
  {
    uint64_t v41 = 0LL;
    os_log_type_t v116 = &type metadata for String;
    uint64_t v117 = &protocol witness table for String;
  }

  unint64_t v43 = 0xE000000000000000LL;
LABEL_17:
  uint64_t v44 = v88;
  uint64_t v114 = v41;
  unint64_t v115 = v43;
  uint64_t v113 = 0LL;
  __int128 v112 = 0u;
  __int128 v111 = 0u;
  uint64_t v45 = *(void (**)(char *, void, uint64_t))(v12 + 104);
  v45(v14, enum case for ButtonRole.preferred(_:), v103);
  uint64_t v46 = enum case for _ProtoButton.FormAction.none(_:);
  unint64_t v47 = *(void (**)(char *, uint64_t, uint64_t))(v91 + 104);
  unint64_t v48 = v105;
  v47(v105, enum case for _ProtoButton.FormAction.none(_:), v104);
  uint64_t v49 = enum case for Button.LabelStyle.automatic(_:);
  uint64_t v50 = *(void (**)(char *, uint64_t, uint64_t))(v44 + 104);
  __int128 v51 = v107;
  v50(v107, enum case for Button.LabelStyle.automatic(_:), v106);
  Button.init(action:label:thumbnail:formAction:labelStyle:buttonRole:componentName:linkIdentifier:)( v118,  &v114,  &v111,  v48,  v51,  v14,  0LL,  0xE000000000000000LL,  0LL,  0LL);
  sub_10005A618((uint64_t)v119, (uint64_t)v118);
  id v52 = [v1 denyText];
  if (v52)
  {
    uint64_t v53 = v52;
    uint64_t v54 = static String._unconditionallyBridgeFromObjectiveC(_:)(v52);
    unint64_t v56 = v55;

    os_log_type_t v116 = &type metadata for String;
    uint64_t v117 = &protocol witness table for String;
    if (v56) {
      goto LABEL_22;
    }
    uint64_t v54 = 0LL;
  }

  else
  {
    uint64_t v54 = 0LL;
    os_log_type_t v116 = &type metadata for String;
    uint64_t v117 = &protocol witness table for String;
  }

  unint64_t v56 = 0xE000000000000000LL;
LABEL_22:
  uint64_t v57 = v89;
  uint64_t v114 = v54;
  unint64_t v115 = v56;
  uint64_t v113 = 0LL;
  __int128 v112 = 0u;
  __int128 v111 = 0u;
  uint64_t v58 = v105;
  v47(v105, v46, v104);
  unint64_t v59 = v107;
  v50(v107, v49, v106);
  v45(v14, enum case for ButtonRole.standard(_:), v103);
  unint64_t v60 = v108;
  Button.init(action:label:thumbnail:formAction:labelStyle:buttonRole:componentName:linkIdentifier:)( v118,  &v114,  &v111,  v58,  v59,  v14,  0LL,  0xE000000000000000LL,  0LL,  0LL);
  uint64_t v61 = v95;
  id v62 = *(void (**)(char *, char *, uint64_t))(v95 + 16);
  unint64_t v63 = v93;
  uint64_t v64 = v96;
  v62(v93, v110, v96);
  id v65 = v94;
  v62(v94, v60, v64);
  id v66 = v98;
  BinaryButton.init(primaryButton:secondaryButton:componentName:linkIdentifier:)( v63,  v65,  0xD000000000000020LL,  0x800000010008B430LL,  0LL,  0LL);
  id v67 = [objc_allocWithZone(SAUIVisualResponseSnippet) init];
  swift_bridgeObjectRelease(v30);
  if ((v30 & 0x2000000000000000LL) != 0) {
    uint64_t v68 = HIBYTE(v30) & 0xF;
  }
  else {
    uint64_t v68 = v92 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v69 = sub_10004A8E8(&qword_1000D9230);
  if (v68)
  {
    uint64_t v70 = swift_allocObject(v69, 112LL, 7LL);
    *(_OWORD *)(v70 + 16) = xmmword_100083340;
    uint64_t v71 = v102;
    *(void *)(v70 + 56) = v102;
    *(void *)(v70 + 64) = &protocol witness table for SystemTextClarificationTitle;
    int64_t v72 = sub_1000533B0((void *)(v70 + 32));
    (*(void (**)(void *, char *, uint64_t))(v101 + 16))(v72, v100, v71);
    uint64_t v73 = v99;
    *(void *)(v70 + 96) = v99;
    *(void *)(v70 + 104) = &protocol witness table for BinaryButton;
    uint64_t v74 = sub_1000533B0((void *)(v70 + 72));
    (*(void (**)(void *, char *, uint64_t))(v109 + 16))(v74, v66, v73);
    uint64_t v57 = v87;
  }

  else
  {
    uint64_t v70 = swift_allocObject(v69, 72LL, 7LL);
    *(_OWORD *)(v70 + 16) = xmmword_100083350;
    uint64_t v73 = v99;
    *(void *)(v70 + 56) = v99;
    *(void *)(v70 + 64) = &protocol witness table for BinaryButton;
    unint64_t v75 = sub_1000533B0((void *)(v70 + 32));
    (*(void (**)(void *, char *, uint64_t))(v109 + 16))(v75, v66, v73);
  }

  Response.init(_:backgrounds:ornaments:hideRedactedElements:)( v70,  _swiftEmptyArrayStorage,  _swiftEmptyArrayStorage,  0LL);
  uint64_t v76 = sub_10004E3AC( (unint64_t *)&qword_1000D9228,  (uint64_t (*)(uint64_t))&type metadata accessor for Response,  (uint64_t)&protocol conformance descriptor for Response);
  uint64_t v77 = v97;
  uint64_t v78 = ProtobufBuilder.serializedData()(v97, v76);
  unint64_t v80 = v79;
  (*(void (**)(char *, uint64_t))(v90 + 8))(v57, v77);
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  sub_100053258(v78, v80);
  [v67 setModelData:isa];

  id v82 = v67;
  NSString v83 = String._bridgeToObjectiveC()();
  [v82 setViewId:v83];

  (*(void (**)(char *, uint64_t))(v109 + 8))(v66, v73);
  uint64_t v84 = *(void (**)(char *, uint64_t))(v61 + 8);
  v84(v108, v64);
  v84(v110, v64);
  sub_1000532F4(v119);
  sub_1000532F4(v120);
  (*(void (**)(char *, uint64_t))(v101 + 8))(v100, v102);
  return v82;
}

uint64_t sub_10005F15C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for Command(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v33 - v9;
  uint64_t v11 = *(void (**)(char *, void, uint64_t))(v5 + 104);
  v11((char *)&v33 - v9, enum case for Command.noOp(_:), v4);
  if (!a1) {
    goto LABEL_15;
  }
  if (!((unint64_t)a1 >> 62))
  {
    uint64_t v12 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
    uint64_t result = swift_bridgeObjectRetain(a1);
    if (v12) {
      goto LABEL_4;
    }
LABEL_14:
    swift_bridgeObjectRelease(a1);
LABEL_15:
    uint64_t v19 = sub_10004A8E8(&qword_1000D96A8);
    uint64_t v20 = swift_allocObject(v19, 72LL, 7LL);
    __int128 v33 = xmmword_100083350;
    *(_OWORD *)(v20 + 16) = xmmword_100083350;
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v10, v4);
    uint64_t v21 = sub_10004A8E8(&qword_1000D96B0);
    uint64_t v22 = type metadata accessor for _ProtoIdiom(0LL);
    uint64_t v23 = *(void *)(v22 - 8);
    uint64_t v24 = *(void *)(v23 + 72);
    uint64_t v25 = *(unsigned __int8 *)(v23 + 80);
    uint64_t v34 = v4;
    uint64_t v26 = v5;
    id v27 = v8;
    uint64_t v28 = a2;
    uint64_t v29 = (v25 + 32) & ~v25;
    uint64_t v30 = swift_allocObject(v21, v29 + v24, v25 | 7);
    *(_OWORD *)(v30 + 16) = v33;
    uint64_t v31 = v30 + v29;
    (*(void (**)(uint64_t, void, uint64_t))(v23 + 104))(v31, enum case for _ProtoIdiom.default(_:), v22);
    uint64_t v32 = sub_10005F45C(v30);
    swift_setDeallocating(v30);
    swift_arrayDestroy(v31, 1LL, v22);
    swift_deallocClassInstance(v30, 32LL, 7LL);
    *(void *)(v20 + 56) = type metadata accessor for ActionElement(0LL);
    *(void *)(v20 + 64) = &protocol witness table for ActionElement;
    sub_1000533B0((void *)(v20 + 32));
    ActionElement.init(_:text:idioms:)(v27, _swiftEmptyArrayStorage, v32);
    v28[3] = type metadata accessor for ActionProperty(0LL);
    v28[4] = &protocol witness table for ActionProperty;
    sub_1000533B0(v28);
    ActionProperty.init(_:)(v20);
    return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v10, v34);
  }

  if (a1 >= 0) {
    uint64_t v18 = a1 & 0xFFFFFFFFFFFFFF8LL;
  }
  else {
    uint64_t v18 = a1;
  }
  swift_bridgeObjectRetain(a1);
  uint64_t result = _CocoaArrayWrapper.endIndex.getter(v18);
  if (!result) {
    goto LABEL_14;
  }
LABEL_4:
  if ((a1 & 0xC000000000000001LL) != 0)
  {
    uint64_t v14 = specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, a1);
LABEL_7:
    swift_bridgeObjectRelease(a1);
    uint64_t v15 = objc_opt_self(&OBJC_CLASS___SABaseCommand);
    uint64_t v16 = swift_dynamicCastObjCClass(v14, v15);
    if (v16)
    {
      uint64_t v17 = v16;
      (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
      *(void *)uint64_t v10 = v17;
      v10[8] = 1;
      v11(v10, enum case for Command.aceCommand(_:), v4);
    }

    else
    {
      swift_unknownObjectRelease(v14);
    }

    goto LABEL_15;
  }

  if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8LL) + 0x10))
  {
    uint64_t v14 = *(void *)(a1 + 32);
    swift_unknownObjectRetain(v14);
    goto LABEL_7;
  }

  __break(1u);
  return result;
}

void *sub_10005F45C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for _ProtoIdiom(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v31 - v7;
  uint64_t v9 = *(void *)(a1 + 16);
  if (v9)
  {
    sub_10004A8E8(&qword_1000D96B8);
    uint64_t v10 = static _SetStorage.allocate(capacity:)(v9);
    uint64_t v11 = 0LL;
    uint64_t v12 = *(unsigned __int8 *)(v3 + 80);
    uint64_t v32 = v9;
    uint64_t v33 = a1 + ((v12 + 32) & ~v12);
    uint64_t v13 = *(void *)(v3 + 72);
    id v35 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v36 = v10 + 56;
    v35(v8, v33, v2);
    while (1)
    {
      uint64_t v14 = *(void *)(v10 + 40);
      uint64_t v15 = sub_10004E3AC( &qword_1000D96C0,  (uint64_t (*)(uint64_t))&type metadata accessor for _ProtoIdiom,  (uint64_t)&protocol conformance descriptor for _ProtoIdiom);
      uint64_t v16 = dispatch thunk of Hashable._rawHashValue(seed:)(v14, v2, v15);
      uint64_t v17 = -1LL << *(_BYTE *)(v10 + 32);
      unint64_t v18 = v16 & ~v17;
      unint64_t v19 = v18 >> 6;
      uint64_t v20 = *(void *)(v36 + 8 * (v18 >> 6));
      uint64_t v21 = 1LL << v18;
      if (((1LL << v18) & v20) != 0)
      {
        uint64_t v34 = v11;
        uint64_t v22 = ~v17;
        do
        {
          v35(v6, *(void *)(v10 + 48) + v18 * v13, v2);
          uint64_t v23 = sub_10004E3AC( &qword_1000D96C8,  (uint64_t (*)(uint64_t))&type metadata accessor for _ProtoIdiom,  (uint64_t)&protocol conformance descriptor for _ProtoIdiom);
          char v24 = dispatch thunk of static Equatable.== infix(_:_:)(v6, v8, v2, v23);
          uint64_t v25 = v3;
          uint64_t v26 = *(void (**)(char *, uint64_t))(v3 + 8);
          v26(v6, v2);
          if ((v24 & 1) != 0)
          {
            v26(v8, v2);
            uint64_t v3 = v25;
            uint64_t v9 = v32;
            uint64_t v11 = v34;
            goto LABEL_4;
          }

          unint64_t v18 = (v18 + 1) & v22;
          unint64_t v19 = v18 >> 6;
          uint64_t v20 = *(void *)(v36 + 8 * (v18 >> 6));
          uint64_t v21 = 1LL << v18;
          uint64_t v3 = v25;
        }

        while ((v20 & (1LL << v18)) != 0);
        uint64_t v9 = v32;
        uint64_t v11 = v34;
      }

      *(void *)(v36 + 8 * v19) = v21 | v20;
      uint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))( *(void *)(v10 + 48) + v18 * v13,  v8,  v2);
      uint64_t v28 = *(void *)(v10 + 16);
      BOOL v29 = __OFADD__(v28, 1LL);
      uint64_t v30 = v28 + 1;
      if (v29) {
        break;
      }
      *(void *)(v10 + 16) = v30;
LABEL_4:
      if (++v11 == v9) {
        return (void *)v10;
      }
      v35(v8, v33 + v13 * v11, v2);
    }

    __break(1u);
  }

  else
  {
    return &_swiftEmptySetSingleton;
  }

  return result;
}

void sub_10005F798()
{
  v31.receiver = v0;
  v31.super_class = (Class)type metadata accessor for SRCarPlayScrollViewController();
  objc_msgSendSuper2(&v31, "viewWillLayoutSubviews");
  id v1 = [v0 view];
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = type metadata accessor for SRCarPlayScrollView();
    uint64_t v4 = (char *)swift_dynamicCastClass(v2, v3);
    if (v4)
    {
      uint64_t v6 = v4;
      id v7 =  objc_msgSend( v4,  "accessoryViewAtEdge:",  (*((_BYTE *)v0 + OBJC_IVAR____TtC4Siri29SRCarPlayScrollViewController_isRightHandDrive) ^ ~SiriLanguageIsRTL(v4, v5)) & 1);
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = objc_opt_self(&OBJC_CLASS____UIStaticScrollBar);
        uint64_t v10 = swift_dynamicCastObjCClass(v8, v9);
        if (v10)
        {
          uint64_t v11 = (void *)v10;
          [v6 setDelegate:v0];
          id v12 = [v11 upButton];
          id v13 = [v11 downButton];
          uint64_t v14 = v13;
          if (v12)
          {
            if (v13)
            {
              uint64_t v15 = qword_1000D8A20;
              id v16 = v12;
              id v17 = v14;
              if (v15 != -1) {
                swift_once(&qword_1000D8A20, sub_100066BF4);
              }
              uint64_t v18 = type metadata accessor for Logger(0LL);
              uint64_t v19 = sub_10004ADF0(v18, (uint64_t)qword_1000D9988);
              os_log_type_t v20 = static os_log_type_t.info.getter(v19);
              sub_1000681D8( v20,  0x10uLL,  0xD000000000000018LL,  0x800000010008B6F0LL,  0xD000000000000030LL,  0x800000010008B710LL);
              id v21 = [v6 traitCollection];
              id v22 = [v21 userInterfaceStyle];

              uint64_t v23 = (void *)objc_opt_self(&OBJC_CLASS___UIColor);
              char v24 = &selRef_blackColor;
              if (v22 != (id)1) {
                char v24 = &selRef_whiteColor;
              }
              id v25 = [v23 *v24];
              [v16 setTintColor:v25];

              [v16 setAlpha:0.5];
              id v26 = [v6 traitCollection];
              id v27 = [v26 userInterfaceStyle];

              uint64_t v28 = (void *)objc_opt_self(&OBJC_CLASS___UIColor);
              BOOL v29 = &selRef_blackColor;
              if (v27 != (id)1) {
                BOOL v29 = &selRef_whiteColor;
              }
              id v30 = [v28 *v29];
              [v17 setTintColor:v30];

              [v17 setAlpha:0.5];
              *(void *)&v6[OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_caretMarginOffset] = 0x4041000000000000LL;
              sub_10005FB6C();

              goto LABEL_19;
            }
          }

          else
          {
            id v12 = v8;
            uint64_t v8 = v13;
          }
        }
      }

      *(void *)&v6[OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_caretMarginOffset] = 0LL;
      sub_10005FB6C();
    }

    id v16 = v2;
LABEL_19:
  }

id sub_10005FB40()
{
  return sub_100060840(type metadata accessor for SRCarPlayScrollViewController);
}

uint64_t type metadata accessor for SRCarPlayScrollViewController()
{
  return objc_opt_self(&OBJC_CLASS____TtC4Siri29SRCarPlayScrollViewController);
}

id sub_10005FB6C()
{
  uint64_t v1 = OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_caretMarginOffset;
  uint64_t v2 = OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_isRightHandDrive;
  double v3 = -0.5;
  if (v0[OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_isRightHandDrive]) {
    double v3 = 0.5;
  }
  [*(id *)&v0[OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_snippetCenterXConstraint] setConstant:*(double *)&v0[OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_caretMarginOffset] * v3];
  double v4 = *(double *)&v0[v1];
  int v5 = v0[v2];
  id v6 = *(id *)&v0[OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_snippetLeadingAnchorConstraint];
  uint64_t v8 = v6;
  [v8 setConstant:v4 * v9];

  double v10 = *(double *)&v0[v1];
  int v11 = v0[v2];
  id v12 = *(id *)&v0[OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_snippetTrailingAnchorConstraint];
  uint64_t v14 = v12;
  if (v11 != 1 || (double v15 = -1.0, (SiriLanguageIsRTL(v12, v13) & 1) == 0)) {
    double v15 = 0.0;
  }
  [v14 setConstant:v10 * v15];

  return [v0 setNeedsUpdateConstraints];
}

char *sub_10005FC7C(char a1)
{
  *(void *)&v1[OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_snippet] = 0LL;
  v1[OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_isFullScreen] = 0;
  uint64_t v3 = OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_heightConstraint;
  id v4 = objc_allocWithZone(&OBJC_CLASS___NSLayoutConstraint);
  int v5 = v1;
  *(void *)&v1[v3] = [v4 init];
  uint64_t v6 = OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_widthConstraint;
  *(void *)&v5[v6] = [objc_allocWithZone(NSLayoutConstraint) init];
  uint64_t v7 = OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_snippetHeightConstraint;
  *(void *)&v5[v7] = [objc_allocWithZone(NSLayoutConstraint) init];
  uint64_t v8 = OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_snippetCenterXConstraint;
  *(void *)&v5[v8] = [objc_allocWithZone(NSLayoutConstraint) init];
  uint64_t v9 = OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_snippetLeadingAnchorConstraint;
  *(void *)&v5[v9] = [objc_allocWithZone(NSLayoutConstraint) init];
  uint64_t v10 = OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_snippetTrailingAnchorConstraint;
  *(void *)&v5[v10] = [objc_allocWithZone(NSLayoutConstraint) init];
  *(void *)&v5[OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_caretMarginOffset] = 0LL;
  int v11 = &v5[OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_snippetSize];
  *int v11 = 0LL;
  v11[1] = 0LL;
  v5[OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_isRightHandDrive] = a1;

  v49.receiver = v5;
  v49.super_class = (Class)type metadata accessor for SRCarPlayScrollView();
  id v12 = (char *)objc_msgSendSuper2(&v49, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  [v12 setBouncesHorizontally:0];
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v13 = [v12 widthAnchor];
  id v14 = [v13 constraintEqualToConstant:0.0];

  uint64_t v15 = OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_widthConstraint;
  id v16 = *(void **)&v12[OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_widthConstraint];
  *(void *)&v12[OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_widthConstraint] = v14;

  LODWORD(v17) = 1132068864;
  [*(id *)&v12[v15] setPriority:v17];
  id v18 = [v12 heightAnchor];
  id v19 = [v18 constraintEqualToConstant:0.0];

  uint64_t v20 = OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_heightConstraint;
  id v21 = *(void **)&v12[OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_heightConstraint];
  *(void *)&v12[OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_heightConstraint] = v19;

  LODWORD(v22) = 1132068864;
  [*(id *)&v12[v20] setPriority:v22];
  id v23 = [v12 widthAnchor];
  id v24 = [v23 constraintLessThanOrEqualToConstant:331.0];

  LODWORD(v25) = 1144750080;
  [v24 setPriority:v25];
  id v26 = [v12 widthAnchor];
  id v27 = [v26 constraintGreaterThanOrEqualToConstant:331.0];

  LODWORD(v2_Block_object_dispose((const void *)(v9 - 80), 8) = 1144750080;
  [v27 setPriority:v28];
  id v29 = [v12 heightAnchor];
  id v30 = [v29 constraintLessThanOrEqualToConstant:274.0];

  LODWORD(v31) = 1144750080;
  [v30 setPriority:v31];
  id v32 = [v12 heightAnchor];
  id v33 = [v32 constraintGreaterThanOrEqualToConstant:0.0];

  LODWORD(v34) = 1144750080;
  [v30 setPriority:v34];
  id v35 = (void *)objc_opt_self(&OBJC_CLASS___NSLayoutConstraint);
  uint64_t v36 = sub_10004A8E8(&qword_1000D97E0);
  uint64_t v37 = swift_allocObject(v36, 80LL, 7LL);
  *(_OWORD *)(v37 + 16) = xmmword_100083360;
  uint64_t v38 = *(void **)&v12[v15];
  *(void *)(v37 + 32) = v38;
  id v39 = *(void **)&v12[v20];
  *(void *)(v37 + 40) = v39;
  *(void *)(v37 + 4_Block_object_dispose((const void *)(v9 - 80), 8) = v24;
  *(void *)(v37 + 56) = v27;
  *(void *)(v37 + 64) = v30;
  *(void *)(v37 + 72) = v33;
  uint64_t v48 = v37;
  specialized Array._endMutation()(v37);
  sub_100060918(0LL, (unint64_t *)&qword_1000D97E8, &OBJC_CLASS___NSLayoutConstraint_ptr);
  id v40 = v38;
  id v41 = v39;
  id v42 = v24;
  id v43 = v27;
  id v44 = v30;
  id v45 = v33;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v48);
  [v35 activateConstraints:isa];

  return v12;
}

void sub_100060130(void *a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_snippet;
  uint64_t v7 = *(void **)&v2[OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_snippet];
  if (v7)
  {
    id v8 = v7;
    Class isa = (Class)[v8 constraints];
    if (!isa)
    {
      uint64_t v10 = sub_100060918(0LL, (unint64_t *)&qword_1000D97E8, &OBJC_CLASS___NSLayoutConstraint_ptr);
      uint64_t v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)(0LL, v10);
      Class isa = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v11);
    }

    [(id)objc_opt_self(NSLayoutConstraint) deactivateConstraints:isa];

    [v8 removeFromSuperview];
  }

  if (a1)
  {
    id v12 = a1;
    [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v3 addSubview:v12];
    id v13 = [v12 heightAnchor];
    [*(id *)&v3[OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_heightConstraint] constant];
    id v14 = objc_msgSend(v13, "constraintEqualToConstant:");

    uint64_t v54 = OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_snippetHeightConstraint;
    uint64_t v15 = *(void **)&v3[OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_snippetHeightConstraint];
    *(void *)&v3[OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_snippetHeightConstraint] = v14;

    id v16 = [v12 centerXAnchor];
    id v17 = [v3 centerXAnchor];
    char v55 = a2;
    id v18 = [v16 constraintEqualToAnchor:v17];

    uint64_t v19 = OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_snippetCenterXConstraint;
    uint64_t v20 = *(void **)&v3[OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_snippetCenterXConstraint];
    *(void *)&v3[OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_snippetCenterXConstraint] = v18;

    id v21 = [v12 leadingAnchor];
    id v22 = [v3 leadingAnchor];
    id v23 = [v21 constraintEqualToAnchor:v22];

    uint64_t v24 = OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_snippetLeadingAnchorConstraint;
    double v25 = *(void **)&v3[OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_snippetLeadingAnchorConstraint];
    *(void *)&v3[OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_snippetLeadingAnchorConstraint] = v23;

    id v26 = [v12 trailingAnchor];
    id v27 = [v3 trailingAnchor];
    id v28 = [v26 constraintEqualToAnchor:v27];

    uint64_t v29 = OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_snippetTrailingAnchorConstraint;
    id v30 = *(void **)&v3[OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_snippetTrailingAnchorConstraint];
    *(void *)&v3[OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_snippetTrailingAnchorConstraint] = v28;

    id v53 = (id)objc_opt_self(&OBJC_CLASS___NSLayoutConstraint);
    uint64_t v31 = sub_10004A8E8(&qword_1000D97E0);
    uint64_t v32 = swift_allocObject(v31, 80LL, 7LL);
    id v33 = *(void **)&v3[v19];
    double v34 = *(void **)&v3[v24];
    *(_OWORD *)(v32 + 16) = xmmword_100083360;
    *(void *)(v32 + 32) = v33;
    *(void *)(v32 + 40) = v34;
    id v35 = *(void **)&v3[v29];
    *(void *)(v32 + 4_Block_object_dispose((const void *)(v9 - 80), 8) = v35;
    id v36 = v33;
    id v37 = v34;
    id v38 = v35;
    id v39 = [v12 topAnchor];
    id v40 = [v3 contentLayoutGuide];
    id v41 = [v40 topAnchor];

    id v42 = [v39 constraintEqualToAnchor:v41];
    *(void *)(v32 + 56) = v42;
    id v43 = [v12 bottomAnchor];
    id v44 = [v3 contentLayoutGuide];
    id v45 = [v44 bottomAnchor];

    id v46 = [v43 constraintEqualToAnchor:v45];
    unint64_t v47 = *(void **)&v3[v54];
    *(void *)(v32 + 64) = v46;
    *(void *)(v32 + 72) = v47;
    specialized Array._endMutation()(v48);
    sub_100060918(0LL, (unint64_t *)&qword_1000D97E8, &OBJC_CLASS___NSLayoutConstraint_ptr);
    id v49 = v47;
    Class v50 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v32);
    [v53 activateConstraints:v50];

    a2 = v55;
  }

  __int128 v51 = *(void **)&v3[v6];
  *(void *)&v3[v6] = a1;
  id v52 = a1;

  v3[OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_isFullScreen] = a2 & 1;
}

void sub_100060640()
{
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_snippet];
  if (!v1)
  {
    uint64_t v10 = sub_10004A8E8(&qword_1000D97E0);
    uint64_t v11 = swift_allocObject(v10, 40LL, 7LL);
    *(_OWORD *)(v11 + 16) = xmmword_100083230;
    *(void *)(v11 + 32) = v0;
    specialized Array._endMutation()(v11);
    id v12 = v0;
    return;
  }

  id v2 = v1;
  id v3 = [v2 subviews];
  uint64_t v4 = sub_100060918(0LL, &qword_1000D97F8, &OBJC_CLASS___UIView_ptr);
  uint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v3, v4);

  if ((unint64_t)v5 >> 62)
  {
    if (v5 < 0) {
      uint64_t v13 = v5;
    }
    else {
      uint64_t v13 = v5 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v5);
    uint64_t v14 = _CocoaArrayWrapper.endIndex.getter(v13);
    swift_bridgeObjectRelease(v5);
    if (v14) {
      goto LABEL_4;
    }
LABEL_13:
    swift_bridgeObjectRelease(v5);
    uint64_t v15 = sub_10004A8E8(&qword_1000D97E0);
    uint64_t v16 = swift_allocObject(v15, 40LL, 7LL);
    *(_OWORD *)(v16 + 16) = xmmword_100083230;
    *(void *)(v16 + 32) = v2;
    specialized Array._endMutation()(v16);
    return;
  }

  if (!*(void *)((v5 & 0xFFFFFFFFFFFFF8LL) + 0x10)) {
    goto LABEL_13;
  }
LABEL_4:
  if ((v5 & 0xC000000000000001LL) != 0)
  {
    id v6 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, v5);
    goto LABEL_7;
  }

  if (*(void *)((v5 & 0xFFFFFFFFFFFFF8LL) + 0x10))
  {
    id v6 = *(id *)(v5 + 32);
LABEL_7:
    id v7 = v6;
    swift_bridgeObjectRelease(v5);
    uint64_t v8 = sub_10004A8E8(&qword_1000D97E0);
    uint64_t v9 = swift_allocObject(v8, 40LL, 7LL);
    *(_OWORD *)(v9 + 16) = xmmword_100083230;
    *(void *)(v9 + 32) = v7;
    specialized Array._endMutation()(v9);

    return;
  }

  __break(1u);
}

id sub_100060834()
{
  return sub_100060840(type metadata accessor for SRCarPlayScrollView);
}

id sub_100060840(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t type metadata accessor for SRCarPlayScrollView()
{
  return objc_opt_self(&OBJC_CLASS____TtC4Siri19SRCarPlayScrollView);
}

uint64_t sub_100060918(uint64_t a1, unint64_t *a2, void *a3)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    uint64_t v5 = objc_opt_self(*a3);
    uint64_t result = swift_getObjCClassMetadata(v5);
    atomic_store(result, a2);
  }

  return result;
}

void sub_100060950()
{
  *(void *)&v0[OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_snippet] = 0LL;
  v0[OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_isFullScreen] = 0;
  uint64_t v1 = OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_heightConstraint;
  *(void *)&v0[v1] = [objc_allocWithZone(NSLayoutConstraint) init];
  uint64_t v2 = OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_widthConstraint;
  *(void *)&v0[v2] = [objc_allocWithZone(NSLayoutConstraint) init];
  uint64_t v3 = OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_snippetHeightConstraint;
  *(void *)&v0[v3] = [objc_allocWithZone(NSLayoutConstraint) init];
  uint64_t v4 = OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_snippetCenterXConstraint;
  *(void *)&v0[v4] = [objc_allocWithZone(NSLayoutConstraint) init];
  uint64_t v5 = OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_snippetLeadingAnchorConstraint;
  *(void *)&v0[v5] = [objc_allocWithZone(NSLayoutConstraint) init];
  uint64_t v6 = OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_snippetTrailingAnchorConstraint;
  *(void *)&v0[v6] = [objc_allocWithZone(NSLayoutConstraint) init];
  *(void *)&v0[OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_caretMarginOffset] = 0LL;
  id v7 = &v0[OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_snippetSize];
  *id v7 = 0LL;
  v7[1] = 0LL;

  _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x800000010008B670LL,  "Siri/SRCarPlayScrollViewController.swift",  40LL,  2LL,  123LL,  0);
  __break(1u);
}

void sub_100060A98(uint64_t a1, uint64_t a2, char a3)
{
  *(_BYTE *)(v3 + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_isSpeaking) = 0;
  uint64_t v5 = *(void **)(v3 + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_currentSnippetViewController);
  if (v5)
  {
    uint64_t v8 = *(void *)(v3 + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_currentSnippetViewController + 8);
    uint64_t ObjectType = swift_getObjectType(*(void *)(v3
                                               + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_currentSnippetViewController));
    uint64_t v10 = *(void (**)(uint64_t, uint64_t, void, uint64_t, uint64_t))(v8 + 32);
    id v11 = v5;
    v10(a1, a2, a3 & 1, ObjectType, v8);
  }

  if ((a3 & 1) != 0)
  {
    id v12 = (uint64_t *)(v55 + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_delayedAceCommands);
    swift_beginAccess(v55 + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_delayedAceCommands, v67, 1LL, 0LL);
    uint64_t v13 = *v12;
    if (*v12)
    {
      id v53 = v12;
      unint64_t v14 = 0xD000000000000039LL;
      swift_bridgeObjectRetain(v13);
      _StringGuts.grow(_:)(28LL);
      swift_bridgeObjectRelease(0xE000000000000000LL);
      unint64_t v65 = 0xD000000000000019LL;
      unint64_t v66 = 0x800000010008B8B0LL;
      swift_bridgeObjectRetain(v13);
      uint64_t v61 = sub_10004A8E8(&qword_1000D9860);
      uint64_t v15 = Array.description.getter(v13);
      id v17 = v16;
      swift_bridgeObjectRelease(v13);
      v18._countAndFlagsBits = v15;
      v18._object = v17;
      String.append(_:)(v18);
      swift_bridgeObjectRelease(v17);
      v19._countAndFlagsBits = 46LL;
      v19._object = (void *)0xE100000000000000LL;
      String.append(_:)(v19);
      id v21 = (uint64_t *)0xD000000000000019LL;
      uint64_t v20 = (char *)0x800000010008B8B0LL;
      if (qword_1000D8A20 != -1) {
LABEL_18:
      }
        swift_once(&qword_1000D8A20, sub_100066BF4);
      uint64_t v22 = type metadata accessor for Logger(0LL);
      uint64_t v23 = sub_10004ADF0(v22, (uint64_t)qword_1000D9988);
      os_log_type_t v24 = static os_log_type_t.info.getter(v23);
      unint64_t v59 = (unint64_t)"elayed Ace commands ";
      uint64_t v60 = v23;
      sub_1000681D8(v24, 0x10uLL, 0xD000000000000039LL, 0x800000010008B870LL, (uint64_t)v21, (unint64_t)v20);
      swift_bridgeObjectRelease(v20);
      uint64_t v25 = sub_10004A8E8(&qword_1000D9868);
      uint64_t v52 = (uint64_t)&v52;
      uint64_t v26 = __chkstk_darwin(v25);
      unint64_t v62 = (v27 + 15) & 0xFFFFFFFFFFFFFFF0LL;
      uint64_t v63 = v27;
      id v28 = (void **)((char *)&v52 - v62);
      unint64_t v29 = 0LL;
      uint64_t v54 = v13;
      unint64_t v30 = *(void *)(v13 + 16);
      uint64_t v58 = v55 + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_delegate;
      unint64_t v56 = 0x800000010008B8D0LL;
      unint64_t v57 = v14 - 26;
      while (1)
      {
        id v21 = &v52;
        __chkstk_darwin(v26);
        unint64_t v14 = v61;
        uint64_t v20 = (char *)&v52 - v62;
        if (v29 == v30)
        {
          uint64_t v34 = *(void *)(v61 - 8);
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v34 + 56))((char *)&v52 - v62, 1LL, 1LL, v61);
          unint64_t v29 = v30;
        }

        else
        {
          if (v29 >= *(void *)(v54 + 16))
          {
            __break(1u);
            goto LABEL_18;
          }

          uint64_t v34 = *(void *)(v61 - 8);
          sub_10004E0B8( v54 + ((*(unsigned __int8 *)(v34 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80))
          + *(void *)(v34 + 72) * v29++,
            (uint64_t)&v52 - v62,
            &qword_1000D9860);
          (*(void (**)(char *, void, uint64_t, unint64_t))(v34 + 56))(v20, 0LL, 1LL, v14);
        }

        sub_100064098((uint64_t)v20, (uint64_t)v28, &qword_1000D9868);
        uint64_t v13 = type metadata accessor for UUID(0LL);
        uint64_t v35 = *(void *)(v13 - 8);
        __chkstk_darwin(v13);
        id v37 = (char *)&v52 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0LL);
        id v38 = *v28;
        (*(void (**)(char *, char *, uint64_t))(v35 + 32))(v37, (char *)v28 + *(int *)(v14 + 48), v13);
        unint64_t v65 = 0LL;
        unint64_t v66 = 0xE000000000000000LL;
        _StringGuts.grow(_:)(34LL);
        swift_bridgeObjectRelease(v66);
        unint64_t v65 = v57;
        unint64_t v66 = v56;
        uint64_t v39 = swift_getObjectType(v38);
        uint64_t v64 = v38;
        uint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v39);
        v41._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(v39, WitnessTable);
        object = v41._object;
        String.append(_:)(v41);
        swift_bridgeObjectRelease(object);
        v43._countAndFlagsBits = 46LL;
        v43._object = (void *)0xE100000000000000LL;
        String.append(_:)(v43);
        uint64_t v44 = v65;
        unint64_t v45 = v66;
        os_log_type_t v47 = static os_log_type_t.info.getter(v46);
        sub_1000681D8(v47, 0x10uLL, 0xD000000000000039LL, v59 | 0x8000000000000000LL, v44, v45);
        swift_bridgeObjectRelease(v45);
        uint64_t v48 = v58;
        uint64_t Strong = swift_unknownObjectWeakLoadStrong(v58, v49);
        if (Strong)
        {
          uint64_t v31 = Strong;
          uint64_t v32 = *(void *)(v48 + 8);
          uint64_t v33 = swift_getObjectType(Strong);
          (*(void (**)(uint64_t, void *, char *, uint64_t, uint64_t))(v32 + 40))(v55, v38, v37, v33, v32);

          swift_unknownObjectRelease(v31);
          uint64_t v26 = (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v37, v13);
        }

        else
        {
          (*(void (**)(char *, uint64_t))(v35 + 8))(v37, v13);
        }
      }

      swift_bridgeObjectRelease(v54);
      uint64_t v51 = *v53;
      uint64_t *v53 = 0LL;
      swift_bridgeObjectRelease(v51);
    }
  }

void sub_100060F88(void *a1)
{
  uint64_t v2 = v1;
  v24[0] = 0LL;
  v24[1] = 0xE000000000000000LL;
  _StringGuts.grow(_:)(71LL);
  uint64_t v25 = 0LL;
  unint64_t v26 = 0xE000000000000000LL;
  v4._countAndFlagsBits = 0xD000000000000044LL;
  v4._object = (void *)0x800000010008B820LL;
  String.append(_:)(v4);
  uint64_t v5 = (uint64_t *)(v1 + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_delayedAceCommands);
  swift_beginAccess(v1 + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_delayedAceCommands, v24, 1LL, 0LL);
  uint64_t v23 = *v5;
  swift_bridgeObjectRetain(v23);
  uint64_t v6 = sub_10004A8E8(&qword_1000D9858);
  v7._countAndFlagsBits = String.init<A>(describing:)(&v23, v6);
  object = v7._object;
  String.append(_:)(v7);
  swift_bridgeObjectRelease(object);
  v9._countAndFlagsBits = 46LL;
  v9._object = (void *)0xE100000000000000LL;
  String.append(_:)(v9);
  uint64_t v10 = v25;
  unint64_t v11 = v26;
  if (qword_1000D8A20 != -1) {
    swift_once(&qword_1000D8A20, sub_100066BF4);
  }
  uint64_t v12 = type metadata accessor for Logger(0LL);
  uint64_t v13 = sub_10004ADF0(v12, (uint64_t)qword_1000D9988);
  os_log_type_t v14 = static os_log_type_t.info.getter(v13);
  sub_1000681D8(v14, 0x10uLL, 0xD00000000000001BLL, 0x800000010008B800LL, v10, v11);
  swift_bridgeObjectRelease(v11);
  uint64_t v15 = *v5;
  *uint64_t v5 = 0LL;
  swift_bridgeObjectRelease(v15);
  uint64_t v16 = *(void **)(v2 + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_requestOptions);
  *(void *)(v2 + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_requestOptions) = a1;
  id v17 = a1;

  Swift::String v18 = *(void **)(v2 + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_currentSnippetViewController);
  if (v18)
  {
    uint64_t v19 = *(void *)(v2 + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_currentSnippetViewController + 8);
    uint64_t ObjectType = swift_getObjectType(v18);
    id v21 = *(void (**)(void *, uint64_t, uint64_t))(v19 + 72);
    id v22 = v18;
    v21(a1, ObjectType, v19);
  }

void *sub_10006114C(uint64_t a1)
{
  return &j__swift_endAccess;
}

void sub_1000614B0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_delegate;
  uint64_t Strong = swift_unknownObjectWeakLoadStrong(v3, a2);
  uint64_t v4 = *(void *)(v3 + 8);
  id v5 = objc_allocWithZone((Class)type metadata accessor for SRCarPlaySiriUnavailableViewController(0LL));
  v39[0] = LocalizedStringKey.init(stringLiteral:)(0xD00000000000001DLL, 0x800000010008BCF0LL);
  v39[1] = v6;
  char v40 = v7 & 1;
  uint64_t v41 = v8;
  uint64_t v42 = LocalizedStringKey.init(stringLiteral:)(0xD000000000000037LL, 0x800000010008BD10LL);
  uint64_t v43 = v9;
  char v44 = v10 & 1;
  uint64_t v45 = v11;
  uint64_t v46 = LocalizedStringKey.init(stringLiteral:)(0xD000000000000013LL, 0x800000010008BD50LL);
  uint64_t v47 = v12;
  char v48 = v13 & 1;
  uint64_t v49 = v14;
  v50[1] = v4;
  swift_unknownObjectWeakInit(v50, Strong, v13);
  sub_10004C7A4((uint64_t)v39, (uint64_t)v38);
  id v15 = (id)UIHostingController.init(rootView:)(v38);
  id v16 = [v15 view];
  if (!v16)
  {
    __break(1u);
    goto LABEL_9;
  }

  id v17 = v16;
  id v18 = [(id)objc_opt_self(UIColor) clearColor];
  [v17 setBackgroundColor:v18];

  id v19 = [v15 view];
  if (!v19)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }

  [v19 setAutoresizingMask:18];
  swift_unknownObjectRelease(Strong);

  sub_1000640DC(v39);
  [v36 addChildViewController:v15];
  id v20 = [v36 view];
  if (!v20)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }

  id v21 = v20;
  id v22 = [v15 view];
  if (!v22)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }

  uint64_t v23 = v22;
  [v21 addSubview:v22];

  [v15 didMoveToParentViewController:v36];
  id v24 = [v15 view];
  if (!v24)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }

  uint64_t v25 = v24;
  id v26 = [v36 view];
  if (v26)
  {
    uint64_t v27 = v26;
    [v26 bounds];
    double v29 = v28;
    double v31 = v30;
    double v33 = v32;
    double v35 = v34;

    objc_msgSend(v25, "setFrame:", v29, v31, v33, v35);
    return;
  }

void sub_1000617C8(void *a1)
{
  uint64_t v2 = v1;
  _StringGuts.grow(_:)(31LL);
  swift_bridgeObjectRelease(0xE000000000000000LL);
  unint64_t v57 = 0xD00000000000001DLL;
  unint64_t v58 = 0x800000010008BAD0LL;
  id v4 = [a1 description];
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
  char v7 = v6;

  v8._countAndFlagsBits = v5;
  v8._object = v7;
  String.append(_:)(v8);
  swift_bridgeObjectRelease(v7);
  if (qword_1000D8A20 != -1) {
    swift_once(&qword_1000D8A20, sub_100066BF4);
  }
  uint64_t v9 = type metadata accessor for Logger(0LL);
  uint64_t v10 = sub_10004ADF0(v9, (uint64_t)qword_1000D9988);
  os_log_type_t v11 = static os_log_type_t.info.getter(v10);
  sub_1000681D8(v11, 0x10uLL, 0xD00000000000001ALL, 0x800000010008BAB0LL, 0xD00000000000001DLL, 0x800000010008BAD0LL);
  swift_bridgeObjectRelease(0x800000010008BAD0LL);
  uint64_t v12 = objc_opt_self(&OBJC_CLASS___SAUIVisualResponseSnippet);
  uint64_t v13 = swift_dynamicCastObjCClass(a1, v12);
  if (v13)
  {
    uint64_t v14 = *(void **)&v2[OBJC_IVAR____TtC4Siri23SRCarPlayViewController_requestOptions];
    if (v14)
    {
      id v15 = (void *)v13;
      id v16 = a1;
      id v17 = v14;
      char v18 = [v17 isRightHandDrive];
      uint64_t v19 = *(void *)&v2[OBJC_IVAR____TtC4Siri23SRCarPlayViewController_lastFocusIndex];
      char v20 = v2[OBJC_IVAR____TtC4Siri23SRCarPlayViewController_lastFocusIndex + 8];
      id v21 = objc_allocWithZone((Class)type metadata accessor for SRCarPlayVisualResponseViewController());
      id v22 = sub_100062900(v15, v18, v2, v19, v20, v21);
LABEL_9:
      double v30 = v22;
      double v31 = &off_1000BBA58;
      goto LABEL_10;
    }
  }

  uint64_t v23 = objc_opt_self(&OBJC_CLASS___SAUIPluginSnippet);
  uint64_t v24 = swift_dynamicCastObjCClass(a1, v23);
  if (v24)
  {
    uint64_t v25 = *(void **)&v2[OBJC_IVAR____TtC4Siri23SRCarPlayViewController_requestOptions];
    if (v25)
    {
      id v26 = (void *)v24;
      id v27 = a1;
      id v17 = v25;
      char v28 = [v17 isRightHandDrive];
      double v29 = objc_allocWithZone((Class)type metadata accessor for SRCarPlayVisualResponseViewController());
      id v22 = sub_100062C8C(v26, v28, v2, v29);
      goto LABEL_9;
    }
  }

  uint64_t v34 = objc_opt_self(&OBJC_CLASS___SACardSnippet);
  uint64_t v35 = swift_dynamicCastObjCClass(a1, v34);
  if (!v35 || (id v36 = *(void **)&v2[OBJC_IVAR____TtC4Siri23SRCarPlayViewController_requestOptions]) == 0LL)
  {
    unint64_t v57 = 0LL;
    unint64_t v58 = 0xE000000000000000LL;
    _StringGuts.grow(_:)(66LL);
    v41._countAndFlagsBits = 0xD000000000000027LL;
    v41._object = (void *)0x800000010008BAF0LL;
    String.append(_:)(v41);
    id v42 = [a1 description];
    uint64_t v43 = static String._unconditionallyBridgeFromObjectiveC(_:)(v42);
    uint64_t v45 = v44;

    v46._countAndFlagsBits = v43;
    v46._object = v45;
    String.append(_:)(v46);
    swift_bridgeObjectRelease(v45);
    v47._countAndFlagsBits = 0xD000000000000016LL;
    v47._object = (void *)0x800000010008BB20LL;
    String.append(_:)(v47);
    uint64_t v56 = *(void *)&v2[OBJC_IVAR____TtC4Siri23SRCarPlayViewController_requestOptions];
    uint64_t v48 = sub_10004A8E8(&qword_1000D9878);
    _print_unlocked<A, B>(_:_:)( &v56,  &v57,  v48,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
    v49._countAndFlagsBits = 46LL;
    v49._object = (void *)0xE100000000000000LL;
    String.append(_:)(v49);
    uint64_t v50 = v57;
    unint64_t v51 = v58;
    os_log_type_t v53 = static os_log_type_t.info.getter(v52);
    sub_1000681D8(v53, 0x10uLL, 0xD00000000000001ALL, 0x800000010008BAB0LL, v50, v51);
    uint64_t v33 = swift_bridgeObjectRelease(v51);
    goto LABEL_15;
  }

  id v37 = (void *)v35;
  id v38 = a1;
  id v17 = v36;
  char v39 = [v17 isRightHandDrive];
  char v40 = (char *)objc_allocWithZone((Class)type metadata accessor for SRCarPlayCardViewController());
  double v30 = sub_10006313C(v37, v39, v2, v40);
  double v31 = &off_1000BB450;
LABEL_10:

  double v32 = v30;
  sub_100061C88(v30, (uint64_t)v31, 1);

LABEL_15:
  os_log_type_t v54 = static os_log_type_t.info.getter(v33);
  sub_1000681D8( v54,  0x2000010uLL,  0xD00000000000001CLL,  0x800000010008BB40LL,  0xD0000000000000A4LL,  0x800000010008BB60LL);
  uint64_t v55 = &v2[OBJC_IVAR____TtC4Siri23SRCarPlayViewController_lastFocusIndex];
  *(void *)uint64_t v55 = 0LL;
  v55[8] = 1;
}

BOOL sub_100061C24()
{
  if (*(void *)(v0 + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_currentSnippetViewController)) {
    return 0LL;
  }
  uint64_t v2 = (void *)(v0 + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_delayedAceCommands);
  swift_beginAccess(v0 + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_delayedAceCommands, v3, 0LL, 0LL);
  return *v2 == 0LL;
}

void sub_100061C88(void *a1, uint64_t a2, char a3)
{
  id v4 = v3;
  if (!a1)
  {
    if (qword_1000D8A20 != -1) {
      swift_once(&qword_1000D8A20, sub_100066BF4);
    }
    uint64_t v36 = type metadata accessor for Logger(0LL);
    uint64_t v37 = sub_10004ADF0(v36, (uint64_t)qword_1000D9988);
    os_log_type_t v38 = static os_log_type_t.info.getter(v37);
    sub_1000681D8(v38, 0x10uLL, 0xD000000000000031LL, 0x800000010008BA20LL, 0xD00000000000002ALL, 0x800000010008BA60LL);
    char v39 = &v3[OBJC_IVAR____TtC4Siri23SRCarPlayViewController_currentSnippetViewController];
    char v40 = *(void **)&v3[OBJC_IVAR____TtC4Siri23SRCarPlayViewController_currentSnippetViewController];
    id v41 = v40;
    id v42 = [v3 view];
    if (!v42)
    {
      uint64_t v43 = v41;
      goto LABEL_21;
    }

    uint64_t v43 = v42;
    uint64_t v44 = type metadata accessor for SRCarPlayView();
    if (swift_dynamicCastClass(v43, v44))
    {
      sub_100065398(0LL, a3 & 1);
      if (!v40)
      {
LABEL_21:

        uint64_t v48 = *(void **)v39;
        *(void *)char v39 = 0LL;
        *((void *)v39 + 1) = 0LL;

        return;
      }

      [v41 willMoveToParentViewController:0];
      [v41 removeFromParentViewController];
    }

    goto LABEL_21;
  }

  uint64_t v52 = 0LL;
  unint64_t v53 = 0xE000000000000000LL;
  id v6 = a1;
  _StringGuts.grow(_:)(43LL);
  v7._countAndFlagsBits = 0xD00000000000001FLL;
  v7._object = (void *)0x800000010008BA90LL;
  String.append(_:)(v7);
  uint64_t ObjectType = swift_getObjectType(v6);
  id v51 = v6;
  uint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for NSObject, ObjectType);
  DefaultStringInterpolation.appendInterpolation<A>(_:)(&v51, ObjectType, WitnessTable);
  v10._countAndFlagsBits = 0x203A77656976202CLL;
  v10._object = (void *)0xE800000000000000LL;
  String.append(_:)(v10);
  id v51 = [v6 view];
  uint64_t v11 = sub_10004A8E8(&qword_1000D9870);
  v12._countAndFlagsBits = String.init<A>(describing:)(&v51, v11);
  object = v12._object;
  String.append(_:)(v12);
  swift_bridgeObjectRelease(object);
  uint64_t v14 = v52;
  unint64_t v15 = v53;
  if (qword_1000D8A20 != -1) {
    swift_once(&qword_1000D8A20, sub_100066BF4);
  }
  uint64_t v16 = type metadata accessor for Logger(0LL);
  uint64_t v17 = sub_10004ADF0(v16, (uint64_t)qword_1000D9988);
  os_log_type_t v18 = static os_log_type_t.info.getter(v17);
  sub_1000681D8(v18, 0x10uLL, 0xD000000000000031LL, 0x800000010008BA20LL, v14, v15);
  swift_bridgeObjectRelease(v15);
  id v19 = [v6 view];
  char v20 = &v4[OBJC_IVAR____TtC4Siri23SRCarPlayViewController_currentSnippetViewController];
  id v21 = *(void **)&v4[OBJC_IVAR____TtC4Siri23SRCarPlayViewController_currentSnippetViewController];
  uint64_t v22 = *(void *)&v4[OBJC_IVAR____TtC4Siri23SRCarPlayViewController_currentSnippetViewController + 8];
  uint64_t v23 = *(uint64_t (**)(void *, uint64_t, uint64_t))(a2 + 88);
  id v24 = v21;
  uint64_t v25 = a2;
  id v26 = v24;
  uint64_t v50 = v25;
  char v27 = v23(v21, v22, ObjectType);

  id v28 = *(id *)v20;
  id v29 = *(id *)v20;
  id v30 = v6;
  id v31 = [v4 view];
  if (v31)
  {
    id v32 = v31;
    uint64_t v33 = type metadata accessor for SRCarPlayView();
    if (swift_dynamicCastClass(v32, v33))
    {
      uint64_t v34 = v19;
      sub_100065398(v19, (v27 ^ 1) & 1);
      if (v28)
      {
        [v29 willMoveToParentViewController:0];
        [v29 removeFromParentViewController];
      }

      id v30 = v30;
      [v4 addChildViewController:v30];
      [v30 didMoveToParentViewController:v4];

      id v29 = v32;
      id v32 = v30;
    }

    else
    {
      uint64_t v34 = v19;
    }

    Swift::String v46 = a1;

    id v29 = v30;
    id v30 = v32;
    uint64_t v45 = v50;
  }

  else
  {
    uint64_t v34 = v19;
    Swift::String v46 = a1;
    uint64_t v45 = v50;
  }

  id v47 = *(id *)v20;
  *(void *)char v20 = v46;
  *((void *)v20 + 1) = v45;
}

id sub_100062108()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SRCarPlayViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SRCarPlayViewController()
{
  return objc_opt_self(&OBJC_CLASS____TtC4Siri23SRCarPlayViewController);
}

uint64_t sub_1000621B0()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_currentSnippetViewController);
  if (!v1) {
    return 1LL;
  }
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_currentSnippetViewController + 8);
  uint64_t ObjectType = swift_getObjectType(*(void *)(v0
                                             + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_currentSnippetViewController));
  id v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8);
  id v5 = v1;
  char v6 = v4(ObjectType, v2);

  return v6 & 1;
}

void sub_100062228()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_currentSnippetViewController);
  if (v1)
  {
    uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_currentSnippetViewController + 8);
    uint64_t ObjectType = swift_getObjectType(*(void *)(v0
                                               + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_currentSnippetViewController));
    id v4 = *(void (**)(uint64_t, uint64_t))(v2 + 16);
    id v5 = v1;
    v4(ObjectType, v2);
  }

void sub_1000622B8(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(v2 + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_isSpeaking) = 1;
  uint64_t v3 = *(void **)(v2 + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_currentSnippetViewController);
  if (v3)
  {
    uint64_t v6 = *(void *)(v2 + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_currentSnippetViewController + 8);
    uint64_t ObjectType = swift_getObjectType(*(void *)(v2
                                               + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_currentSnippetViewController));
    Swift::String v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 48);
    id v9 = v3;
    v8(a1, a2, ObjectType, v6);
  }

void sub_100062374(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(v2 + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_currentSnippetViewController);
  if (v3)
  {
    uint64_t v6 = *(void *)(v2 + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_currentSnippetViewController + 8);
    uint64_t ObjectType = swift_getObjectType(*(void *)(v2
                                               + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_currentSnippetViewController));
    Swift::String v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56);
    id v9 = v3;
    v8(a1, a2, ObjectType, v6);
  }

void sub_100062420()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_currentSnippetViewController);
  if (v1)
  {
    uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_currentSnippetViewController + 8);
    uint64_t ObjectType = swift_getObjectType(*(void *)(v0
                                               + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_currentSnippetViewController));
    id v4 = *(void (**)(uint64_t, uint64_t))(v2 + 64);
    id v5 = v1;
    v4(ObjectType, v2);
  }

void sub_1000624B0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(v2 + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_currentSnippetViewController);
  if (v3)
  {
    uint64_t v6 = *(void *)(v2 + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_currentSnippetViewController + 8);
    uint64_t ObjectType = swift_getObjectType(*(void *)(v2
                                               + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_currentSnippetViewController));
    Swift::String v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 80);
    id v9 = v3;
    v8(a1, a2, ObjectType, v6);
  }

uint64_t sub_10006255C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_delegate;
  uint64_t result = swift_unknownObjectWeakLoadStrong(v2 + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_delegate, a2);
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = *(void *)(v3 + 8);
    uint64_t ObjectType = swift_getObjectType(result);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 8))(v2, ObjectType, v6);
    return swift_unknownObjectRelease(v5);
  }

  return result;
}

uint64_t sub_1000625CC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_delegate;
  uint64_t result = swift_unknownObjectWeakLoadStrong(v2 + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_delegate, a2);
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = *(void *)(v3 + 8);
    uint64_t ObjectType = swift_getObjectType(result);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v2, ObjectType, v6);
    return swift_unknownObjectRelease(v5);
  }

  return result;
}

uint64_t sub_10006263C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_delegate;
  uint64_t result = swift_unknownObjectWeakLoadStrong(v2 + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_delegate, a2);
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = *(void *)(v3 + 8);
    uint64_t ObjectType = swift_getObjectType(result);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 24))(v2, ObjectType, v6);
    return swift_unknownObjectRelease(v5);
  }

  return result;
}

uint64_t sub_1000626AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_delegate;
  uint64_t result = swift_unknownObjectWeakLoadStrong(v2 + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_delegate, a2);
  if (result)
  {
    uint64_t v6 = result;
    uint64_t v7 = *(void *)(v4 + 8);
    uint64_t ObjectType = swift_getObjectType(result);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 32))(v2, a2, ObjectType, v7);
    return swift_unknownObjectRelease(v6);
  }

  return result;
}

uint64_t sub_100062724(uint64_t a1, void *a2, uint64_t a3)
{
  return sub_100063528(a2, a3);
}

uint64_t sub_100062730(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_delegate;
  uint64_t result = swift_unknownObjectWeakLoadStrong(v2 + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_delegate, a2);
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = *(void *)(v3 + 8);
    uint64_t ObjectType = swift_getObjectType(result);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v2, ObjectType, v6);
    return swift_unknownObjectRelease(v5);
  }

  return result;
}

uint64_t sub_1000627A4(uint64_t a1)
{
  uint64_t result = NSNotFound.getter();
  if (result == a1) {
    uint64_t v4 = 0LL;
  }
  else {
    uint64_t v4 = a1;
  }
  uint64_t v5 = v1 + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_lastFocusIndex;
  *(void *)uint64_t v5 = v4;
  *(_BYTE *)(v5 + _Block_object_dispose((const void *)(v9 - 80), 8) = result == a1;
  return result;
}

uint64_t sub_1000627E4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_delegate;
  uint64_t result = swift_unknownObjectWeakLoadStrong(v2 + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_delegate, a2);
  if (result)
  {
    uint64_t v5 = result;
    uint64_t v6 = *(void *)(v3 + 8);
    uint64_t ObjectType = swift_getObjectType(result);
    (*(void (**)(uint64_t, uint64_t))(v6 + 80))(ObjectType, v6);
    return swift_unknownObjectRelease(v5);
  }

  return result;
}

char *sub_100062900(void *a1, char a2, void *a3, uint64_t a4, char a5, _BYTE *a6)
{
  uint64_t v12 = OBJC_IVAR____TtC4Siri37SRCarPlayVisualResponseViewController_aceSnippet;
  *(void *)&a6[OBJC_IVAR____TtC4Siri37SRCarPlayVisualResponseViewController_aceSnippet] = 0LL;
  *(void *)&a6[OBJC_IVAR____TtC4Siri37SRCarPlayVisualResponseViewController_pluginSnippet] = 0LL;
  uint64_t v13 = &a6[OBJC_IVAR____TtC4Siri37SRCarPlayVisualResponseViewController_delegate];
  *((void *)v13 + 1) = 0LL;
  swift_unknownObjectWeakInit(v13, 0LL, a3);
  a6[OBJC_IVAR____TtC4Siri37SRCarPlayVisualResponseViewController_proceedToNextCommandAtSpeechSynthesisEnd] = 1;
  id v14 = objc_allocWithZone((Class)type metadata accessor for VisualResponseProvider(0LL));
  unint64_t v15 = a6;
  id v16 = [v14 init];
  *((void *)v13 + 1) = &off_1000BBB08;
  swift_unknownObjectWeakAssign(v13, a3);
  uint64_t v17 = *(void **)&a6[v12];
  *(void *)&a6[v12] = a1;
  id v18 = a1;

  sub_10004AAC8(0LL);
  uint64_t result = (char *)[v18 modelData];
  if (!result)
  {
    __break(1u);
    goto LABEL_18;
  }

  char v20 = result;
  uint64_t v21 = static Data._unconditionallyBridgeFromObjectiveC(_:)(result);
  unint64_t v23 = v22;

  uint64_t v24 = VisualResponseProvider.view(for:mode:overload:)(v21, v23, 0LL, 0LL);
  sub_100053258(v21, v23);
  *(void *)&v15[OBJC_IVAR____TtC4Siri37SRCarPlayVisualResponseViewController_snippet] = v24;

  if (!v24) {
    sub_10004AAC8(1LL);
  }
  v15[OBJC_IVAR____TtC4Siri29SRCarPlayScrollViewController_isRightHandDrive] = a2 & 1;
  v43.receiver = v15;
  v43.super_class = (Class)type metadata accessor for SRCarPlayScrollViewController();
  uint64_t v25 = (char *)objc_msgSendSuper2(&v43, "initWithNibName:bundle:", 0, 0);
  id v26 = v25;
  uint64_t v27 = OBJC_IVAR____TtC4Siri37SRCarPlayVisualResponseViewController_snippet;
  id v28 = *(void **)&v25[OBJC_IVAR____TtC4Siri37SRCarPlayVisualResponseViewController_snippet];
  if (!v28)
  {
    uint64_t v35 = v25;
    goto LABEL_11;
  }

  id v29 = v25;
  [v28 setBackgroundMaterial:1];
  id v30 = *(void **)&v26[v27];
  if (!v30) {
    goto LABEL_11;
  }
  [v30 setInteractionDelegate:v29];
  id v31 = *(void **)&v26[v27];
  if (!v31) {
    goto LABEL_11;
  }
  [v31 setCurrentIdiom:4];
  id v32 = *(void **)&v26[v27];
  if (!v32) {
    goto LABEL_11;
  }
  id v33 = v32;
  uint64_t result = (char *)[v18 viewId];
  if (!result)
  {
LABEL_18:
    __break(1u);
    return result;
  }

  uint64_t v34 = result;
  [v33 setViewId:result];

LABEL_11:
  if ((a5 & 1) == 0)
  {
    _StringGuts.grow(_:)(45LL);
    swift_bridgeObjectRelease(0xE000000000000000LL);
    v36._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int,  &protocol witness table for Int);
    object = v36._object;
    String.append(_:)(v36);
    swift_bridgeObjectRelease(object);
    if (qword_1000D8A20 != -1) {
      swift_once(&qword_1000D8A20, sub_100066BF4);
    }
    uint64_t v38 = type metadata accessor for Logger(0LL);
    uint64_t v39 = sub_10004ADF0(v38, (uint64_t)qword_1000D9988);
    os_log_type_t v40 = static os_log_type_t.info.getter(v39);
    sub_1000681D8( v40,  0x2000010uLL,  0xD00000000000003DLL,  0x800000010008BC10LL,  0xD00000000000002BLL,  0x800000010008BC50LL);
    swift_bridgeObjectRelease(0x800000010008BC50LL);
    id v41 = *(void **)&v26[v27];
    if (v41)
    {
      id v42 = v41;
      [v42 setInitialFocusIndex:a4];

      id v16 = v42;
    }
  }

  return v26;
}

char *sub_100062C8C(void *a1, char a2, void *a3, _BYTE *a4)
{
  *(void *)&a4[OBJC_IVAR____TtC4Siri37SRCarPlayVisualResponseViewController_aceSnippet] = 0LL;
  uint64_t v7 = OBJC_IVAR____TtC4Siri37SRCarPlayVisualResponseViewController_pluginSnippet;
  *(void *)&a4[OBJC_IVAR____TtC4Siri37SRCarPlayVisualResponseViewController_pluginSnippet] = 0LL;
  Swift::String v8 = &a4[OBJC_IVAR____TtC4Siri37SRCarPlayVisualResponseViewController_delegate];
  *((void *)v8 + 1) = 0LL;
  swift_unknownObjectWeakInit(v8, 0LL, a3);
  a4[OBJC_IVAR____TtC4Siri37SRCarPlayVisualResponseViewController_proceedToNextCommandAtSpeechSynthesisEnd] = 1;
  id v9 = objc_allocWithZone((Class)type metadata accessor for VisualResponseProvider(0LL));
  Swift::String v10 = a4;
  id v11 = [v9 init];
  *((void *)v8 + 1) = &off_1000BBB08;
  swift_unknownObjectWeakAssign(v8, a3);
  uint64_t v12 = *(void **)&a4[v7];
  *(void *)&a4[v7] = a1;
  id v13 = a1;

  sub_10004AAC8(0LL);
  id v14 = [v13 modelData];
  if (v14)
  {
    unint64_t v15 = v14;
    static Data._unconditionallyBridgeFromObjectiveC(_:)(v14);
    uint64_t v17 = v16;

    __asm { BR              X10 }
  }

  if (qword_1000D8A20 != -1) {
    swift_once(&qword_1000D8A20, sub_100066BF4);
  }
  uint64_t v18 = type metadata accessor for Logger(0LL);
  uint64_t v19 = sub_10004ADF0(v18, (uint64_t)qword_1000D9988);
  os_log_type_t v20 = static os_log_type_t.info.getter(v19);
  sub_1000681D8(v20, 0LL, 0xD00000000000002ELL, 0x800000010008BC80LL, 0xD00000000000001BLL, 0x800000010008BCD0LL);
  id v21 = [v13 bundleName];
  if (v21)
  {
    unint64_t v22 = v21;
    uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)(v21);
    unint64_t v25 = v24;
  }

  else
  {
    uint64_t v23 = 0LL;
    unint64_t v25 = 0xE000000000000000LL;
  }

  uint64_t v26 = HIBYTE(v25) & 0xF;
  if ((v25 & 0x2000000000000000LL) == 0) {
    uint64_t v26 = v23 & 0xFFFFFFFFFFFFLL;
  }
  if (!v26)
  {
    if (qword_1000D8A20 != -1) {
      swift_once(&qword_1000D8A20, sub_100066BF4);
    }
    uint64_t v27 = type metadata accessor for Logger(0LL);
    uint64_t v28 = sub_10004ADF0(v27, (uint64_t)qword_1000D9988);
    os_log_type_t v29 = static os_log_type_t.info.getter(v28);
    sub_1000681D8(v29, 0LL, 0xD00000000000002ELL, 0x800000010008BC80LL, 0xD000000000000014LL, 0x800000010008BCB0LL);
  }

  id v30 = v11;
  uint64_t v31 = VisualResponseProvider.view(for:bundleName:mode:)(0LL, 0xC000000000000000LL, v23, v25, 0LL);
  swift_bridgeObjectRelease(v25);
  *(void *)&v10[OBJC_IVAR____TtC4Siri37SRCarPlayVisualResponseViewController_snippet] = v31;

  if (!v31) {
    sub_10004AAC8(1LL);
  }
  v10[OBJC_IVAR____TtC4Siri29SRCarPlayScrollViewController_isRightHandDrive] = a2 & 1;
  v52.receiver = v10;
  v52.super_class = (Class)type metadata accessor for SRCarPlayScrollViewController();
  id v32 = (char *)objc_msgSendSuper2(&v52, "initWithNibName:bundle:", 0, 0);
  id v33 = v32;
  uint64_t v34 = OBJC_IVAR____TtC4Siri37SRCarPlayVisualResponseViewController_snippet;
  uint64_t v35 = *(void **)&v32[OBJC_IVAR____TtC4Siri37SRCarPlayVisualResponseViewController_snippet];
  if (!v35)
  {
    uint64_t v48 = v32;
LABEL_26:

    sub_100053258(0LL, 0xC000000000000000LL);
    goto LABEL_27;
  }

  Swift::String v36 = v32;
  [v35 setBackgroundMaterial:1];
  uint64_t v37 = *(void **)&v33[v34];
  if (!v37) {
    goto LABEL_26;
  }
  [v37 setInteractionDelegate:v36];
  uint64_t v38 = *(void **)&v33[v34];
  if (!v38) {
    goto LABEL_26;
  }
  [v38 setCurrentIdiom:4];
  uint64_t v39 = *(void **)&v33[v34];
  if (!v39) {
    goto LABEL_26;
  }
  id v40 = v39;
  id v41 = [v13 viewId];
  if (!v41)
  {
    __break(1u);
    JUMPOUT(0x10006312CLL);
  }

  id v42 = v41;
  [v40 setViewId:v41];

  objc_super v43 = *(void **)&v33[v34];
  if (!v43) {
    goto LABEL_26;
  }
  id v44 = v43;
  NSString v45 = [v13 responseViewId];
  if (!v45)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(0LL);
    uint64_t v47 = v46;
    NSString v45 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v47);
  }

  objc_msgSend(v44, "setResponseViewId:", v45, a3);

  sub_100053258(0LL, 0xC000000000000000LL);
LABEL_27:

  return v33;
}

char *sub_10006313C(void *a1, char a2, void *a3, char *a4)
{
  *(void *)&a4[OBJC_IVAR____TtC4Siri27SRCarPlayCardViewController_cardViewController] = 0LL;
  uint64_t v8 = OBJC_IVAR____TtC4Siri27SRCarPlayCardViewController_widthConstraint;
  id v9 = objc_allocWithZone(&OBJC_CLASS___NSLayoutConstraint);
  Swift::String v10 = a4;
  *(void *)&a4[v8] = [v9 init];
  uint64_t v11 = OBJC_IVAR____TtC4Siri27SRCarPlayCardViewController_heightConstraint;
  *(void *)&v10[v11] = [objc_allocWithZone(NSLayoutConstraint) init];
  *(void *)&v10[OBJC_IVAR____TtC4Siri27SRCarPlayCardViewController_cardSnippet] = a1;
  uint64_t v12 = &v10[OBJC_IVAR____TtC4Siri27SRCarPlayCardViewController_delegate];
  *(void *)uint64_t v12 = a3;
  *((void *)v12 + 1) = &off_1000BBB48;
  id v13 = a1;
  id v14 = a3;

  sub_10004AAC8(0LL);
  v10[OBJC_IVAR____TtC4Siri29SRCarPlayScrollViewController_isRightHandDrive] = a2;
  v21.receiver = v10;
  v21.super_class = (Class)type metadata accessor for SRCarPlayScrollViewController();
  unint64_t v15 = (char *)objc_msgSendSuper2(&v21, "initWithNibName:bundle:", 0, 0);
  uint64_t v16 = v15;
  uint64_t v17 = *(void **)&v15[OBJC_IVAR____TtC4Siri27SRCarPlayCardViewController_cardViewController];
  if (v17)
  {
    uint64_t v18 = v15;
    id v19 = v17;
    [v19 setDelegate:v18];
  }

  return v16;
}

char *sub_1000632B4(void *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v5 = &a2[OBJC_IVAR____TtC4Siri13SRCarPlayView_delegate];
  *((void *)v5 + 1) = 0LL;
  swift_unknownObjectWeakInit(v5, 0LL, a3);
  *(void *)&a2[OBJC_IVAR____TtC4Siri13SRCarPlayView_dismissalView] = 0LL;
  *(void *)&a2[OBJC_IVAR____TtC4Siri13SRCarPlayView_backgroundView] = 0LL;
  *(void *)&a2[OBJC_IVAR____TtC4Siri13SRCarPlayView_currentSnippetContainerView] = 0LL;
  *(void *)&a2[OBJC_IVAR____TtC4Siri13SRCarPlayView_currentSnippetPlatterView] = 0LL;
  a2[OBJC_IVAR____TtC4Siri13SRCarPlayView_isUsingOpaqueBackground] = 0;
  uint64_t v6 = OBJC_IVAR____TtC4Siri13SRCarPlayView_showIntelligentLightAnimation;
  uint64_t v7 = (void *)objc_opt_self(&OBJC_CLASS___SRCarPlayUIUtilities);
  uint64_t v8 = a2;
  a2[v6] = [v7 deviceSupportsAI];
  v8[OBJC_IVAR____TtC4Siri13SRCarPlayView_touchPassThrough] = 0;

  v22.receiver = v8;
  v22.super_class = (Class)type metadata accessor for SRCarPlayView();
  id v9 = (char *)objc_msgSendSuper2(&v22, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  Swift::String v10 = &v9[OBJC_IVAR____TtC4Siri13SRCarPlayView_delegate];
  *((void *)v10 + 1) = &off_1000BBB38;
  swift_unknownObjectWeakAssign(v10, a1);
  id v11 = objc_allocWithZone(&OBJC_CLASS___UITapGestureRecognizer);
  uint64_t v12 = v9;
  id v13 = [v11 initWithTarget:v12 action:"didTapToDismissWithSender:"];
  id v14 = [objc_allocWithZone(UIView) init];
  uint64_t v15 = OBJC_IVAR____TtC4Siri13SRCarPlayView_dismissalView;
  uint64_t v16 = *(void **)&v12[OBJC_IVAR____TtC4Siri13SRCarPlayView_dismissalView];
  *(void *)&v12[OBJC_IVAR____TtC4Siri13SRCarPlayView_dismissalView] = v14;

  uint64_t v17 = *(void **)&v12[v15];
  if (v17)
  {
    id v18 = v17;
    [v18 setAutoresizingMask:18];
    [v12 bounds];
    objc_msgSend(v18, "setFrame:");
    [v18 addGestureRecognizer:v13];
    [v12 addSubview:v18];
  }

  id v19 = [(id)objc_opt_self(AFPreferences) sharedPreferences];
  unsigned __int8 v20 = [v19 getShowAppsBehindSiriInCarPlayEnabled];

  if (*(void *)&v12[v15])
  {
    [*(id *)&v12[OBJC_IVAR____TtC4Siri13SRCarPlayView_backgroundView] removeFromSuperview];
    v12[OBJC_IVAR____TtC4Siri13SRCarPlayView_isUsingOpaqueBackground] = v20 ^ 1;
  }

  return v12;
}

uint64_t sub_100063528(void *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  if (*(_BYTE *)(v2 + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_isSpeaking) == 1)
  {
    uint64_t v51 = 0LL;
    unint64_t v52 = 0xE000000000000000LL;
    _StringGuts.grow(_:)(61LL);
    v6._countAndFlagsBits = 0xD000000000000015LL;
    v6._object = (void *)0x800000010008B980LL;
    String.append(_:)(v6);
    uint64_t ObjectType = swift_getObjectType(a1);
    v53[0] = a1;
    uint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for NSObject, ObjectType);
    DefaultStringInterpolation.appendInterpolation<A>(_:)(v53, ObjectType, WitnessTable);
    v9._countAndFlagsBits = 0xD000000000000026LL;
    v9._object = (void *)0x800000010008B9A0LL;
    String.append(_:)(v9);
    if (qword_1000D8A20 != -1) {
      swift_once(&qword_1000D8A20, sub_100066BF4);
    }
    uint64_t v10 = type metadata accessor for Logger(0LL);
    uint64_t v11 = sub_10004ADF0(v10, (uint64_t)qword_1000D9988);
    os_log_type_t v12 = static os_log_type_t.info.getter(v11);
    sub_1000681D8(v12, 0x8000010uLL, 0xD00000000000004CLL, 0x800000010008B8F0LL, 0LL, 0xE000000000000000LL);
    swift_bridgeObjectRelease(0xE000000000000000LL);
    id v13 = (void *)(v2 + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_delayedAceCommands);
    swift_beginAccess(v3 + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_delayedAceCommands, v53, 1LL, 0LL);
    if (!*v13)
    {
      *id v13 = _swiftEmptyArrayStorage;
      swift_bridgeObjectRelease(0LL);
    }

    uint64_t v15 = (void (*)(uint64_t *, void))sub_10006114C((uint64_t)&v51);
    if (*v14)
    {
      uint64_t v16 = v14;
      uint64_t v17 = sub_10004A8E8(&qword_1000D9860);
      uint64_t v18 = *(void *)(v17 - 8);
      uint64_t v19 = __chkstk_darwin(v17);
      objc_super v21 = (uint64_t *)((char *)&v50 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL));
      objc_super v22 = (char *)v21 + *(int *)(v19 + 48);
      void *v21 = a1;
      uint64_t v23 = type metadata accessor for UUID(0LL);
      (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v23 - 8) + 16LL))(v22, a2, v23);
      unint64_t v24 = *v16;
      id v25 = a1;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v24);
      unint64_t *v16 = v24;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        unint64_t v24 = sub_10005CEC0(0, *(void *)(v24 + 16) + 1LL, 1, v24);
        unint64_t *v16 = v24;
      }

      unint64_t v28 = *(void *)(v24 + 16);
      unint64_t v27 = *(void *)(v24 + 24);
      if (v28 >= v27 >> 1)
      {
        unint64_t v24 = sub_10005CEC0(v27 > 1, v28 + 1, 1, v24);
        unint64_t *v16 = v24;
      }

      *(void *)(v24 + 16) = v28 + 1;
      sub_100064098( (uint64_t)v21,  v24 + ((*(unsigned __int8 *)(v18 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80))
      + *(void *)(v18 + 72) * v28,
        &qword_1000D9860);
      v15(&v51, 0LL);
    }

    else
    {
      v15(&v51, 0LL);
    }

    uint64_t v46 = v3 + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_delegate;
    uint64_t result = swift_unknownObjectWeakLoadStrong(v3 + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_delegate, v29);
    if (result)
    {
      uint64_t v47 = result;
      uint64_t v48 = *(void *)(v46 + 8);
      uint64_t v49 = swift_getObjectType(result);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v48 + 16))(v3, v49, v48);
      return swift_unknownObjectRelease(v47);
    }
  }

  else
  {
    uint64_t v51 = 0LL;
    unint64_t v52 = 0xE000000000000000LL;
    _StringGuts.grow(_:)(55LL);
    v30._countAndFlagsBits = 0xD000000000000034LL;
    v30._object = (void *)0x800000010008B940LL;
    String.append(_:)(v30);
    uint64_t v31 = swift_getObjectType(a1);
    v53[0] = a1;
    uint64_t v32 = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v31);
    DefaultStringInterpolation.appendInterpolation<A>(_:)(v53, v31, v32);
    v33._countAndFlagsBits = 46LL;
    v33._object = (void *)0xE100000000000000LL;
    String.append(_:)(v33);
    if (qword_1000D8A20 != -1) {
      swift_once(&qword_1000D8A20, sub_100066BF4);
    }
    uint64_t v34 = type metadata accessor for Logger(0LL);
    uint64_t v35 = sub_10004ADF0(v34, (uint64_t)qword_1000D9988);
    os_log_type_t v36 = static os_log_type_t.info.getter(v35);
    sub_1000681D8(v36, 0x8000010uLL, 0xD00000000000004CLL, 0x800000010008B8F0LL, 0LL, 0xE000000000000000LL);
    swift_bridgeObjectRelease(0xE000000000000000LL);
    uint64_t v37 = v2 + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_delegate;
    uint64_t Strong = swift_unknownObjectWeakLoadStrong(v2 + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_delegate, v38);
    if (Strong)
    {
      uint64_t v40 = Strong;
      uint64_t v41 = *(void *)(v37 + 8);
      uint64_t v42 = swift_getObjectType(Strong);
      (*(void (**)(uint64_t, void *, uint64_t, uint64_t, uint64_t))(v41 + 40))(v3, a1, a2, v42, v41);
      swift_unknownObjectRelease(v40);
    }

    objc_super v43 = (uint64_t *)(v3 + OBJC_IVAR____TtC4Siri23SRCarPlayViewController_delayedAceCommands);
    swift_beginAccess(v43, &v51, 1LL, 0LL);
    uint64_t v44 = *v43;
    *objc_super v43 = 0LL;
    return swift_bridgeObjectRelease(v44);
  }

  return result;
}

void sub_1000639B8(uint64_t a1)
{
  uint64_t v2 = v1;
  id v4 = [v1 view];
  if (v4)
  {
    id v34 = v4;
    uint64_t v5 = type metadata accessor for SRCarPlayView();
    uint64_t v6 = swift_dynamicCastClass(v34, v5);
    if (v6)
    {
      uint64_t v7 = v6;
      sub_100061C88(0LL, 0LL, 1);
      uint64_t v8 = sub_10004A8E8((uint64_t *)&unk_1000D9880);
      __chkstk_darwin(v8);
      uint64_t v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      sub_10004E0B8(a1, (uint64_t)v10, (uint64_t *)&unk_1000D9880);
      uint64_t v11 = type metadata accessor for URL(0LL);
      uint64_t v12 = *(void *)(v11 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1LL, v11) == 1)
      {
        __break(1u);
      }

      else
      {
        uint64_t v13 = URL.scheme.getter();
        if (v14)
        {
          uint64_t v15 = v14;
          if (v13 == 0x6D65746970616DLL && v14 == 0xE700000000000000LL) {
            char v17 = 1;
          }
          else {
            char v17 = _stringCompareWithSmolCheck(_:_:expecting:)(v13, v14, 0x6D65746970616DLL, 0xE700000000000000LL, 0LL);
          }
          swift_bridgeObjectRelease(v15);
        }

        else
        {
          char v17 = 0;
        }

        (*(void (**)(char *, uint64_t))(v12 + 8))(v10, v11);
        uint64_t v18 = OBJC_IVAR____TtC4Siri13SRCarPlayView_touchPassThrough;
        *(_BYTE *)(v7 + OBJC_IVAR____TtC4Siri13SRCarPlayView_touchPassThrough) = v17 & 1;
        if ((v17 & 1) != 0)
        {
          if (qword_1000D8A20 != -1) {
            swift_once(&qword_1000D8A20, sub_100066BF4);
          }
          uint64_t v19 = type metadata accessor for Logger(0LL);
          uint64_t v20 = sub_10004ADF0(v19, (uint64_t)qword_1000D9988);
          os_log_type_t v21 = static os_log_type_t.info.getter(v20);
          sub_1000681D8( v21,  0x10uLL,  0xD000000000000010LL,  0x800000010008BE70LL,  0xD00000000000002CLL,  0x800000010008BE90LL);
        }

        objc_super v22 = *(void **)(v7 + OBJC_IVAR____TtC4Siri13SRCarPlayView_dismissalView);
        if (v22)
        {
          id v23 = [v22 layer];
          [v23 setAllowsHitTesting:(*(_BYTE *)(v7 + v18) & 1) == 0];
        }

        if (![(id)objc_opt_self(AFFeatureFlags) isSiriLocationServicesPromptingEnabled]) {
          goto LABEL_25;
        }
        if (qword_1000D8A20 != -1) {
          swift_once(&qword_1000D8A20, sub_100066BF4);
        }
        uint64_t v24 = type metadata accessor for Logger(0LL);
        uint64_t v25 = sub_10004ADF0(v24, (uint64_t)qword_1000D9988);
        os_log_type_t v26 = static os_log_type_t.info.getter(v25);
        sub_1000681D8( v26,  0x10uLL,  0xD000000000000020LL,  0x800000010008BE10LL,  0xD000000000000024LL,  0x800000010008BE40LL);
        sub_100061C88(0LL, 0LL, 1);
        unint64_t v27 = &v2[OBJC_IVAR____TtC4Siri23SRCarPlayViewController_delegate];
        uint64_t Strong = swift_unknownObjectWeakLoadStrong(v27, v28);
        if (Strong)
        {
          uint64_t v30 = Strong;
          uint64_t v31 = *((void *)v27 + 1);
          uint64_t ObjectType = swift_getObjectType(Strong);
          (*(void (**)(uint64_t, uint64_t))(v31 + 80))(ObjectType, v31);

          swift_unknownObjectRelease(v30);
        }

        else
        {
LABEL_25:
        }
      }
    }

    else
    {
    }
  }

void sub_100063D3C(double a1)
{
  id v3 = [v1 view];
  if (v3)
  {
    id v10 = v3;
    uint64_t v4 = type metadata accessor for SRCarPlayView();
    uint64_t v5 = swift_dynamicCastClass(v10, v4);
    if (v5 && (uint64_t v6 = *(char **)(v5 + OBJC_IVAR____TtC4Siri13SRCarPlayView_currentSnippetPlatterView)) != 0LL)
    {
      uint64_t v7 = *(void **)&v6[OBJC_IVAR____TtC4Siri27SRCarPlaySnippetPlatterView_coloredPlatterView];
      uint64_t v8 = v6;
      if (v7)
      {
        id v9 = [v7 layer];
        [v9 setCornerRadius:a1];
      }

      [*(id *)&v6[OBJC_IVAR____TtC4Siri27SRCarPlaySnippetPlatterView_materialView] _setContinuousCornerRadius:a1];
    }

    else
    {
    }
  }

void sub_100063E48(uint64_t a1)
{
  id v3 = [v1 view];
  if (v3)
  {
    id v19 = v3;
    uint64_t v4 = type metadata accessor for SRCarPlayView();
    uint64_t v5 = swift_dynamicCastClass(v19, v4);
    if (v5)
    {
      uint64_t v6 = *(char **)(v5 + OBJC_IVAR____TtC4Siri13SRCarPlayView_currentSnippetPlatterView);
      if (!v6)
      {
        uint64_t v15 = v19;
LABEL_15:

        return;
      }

      uint64_t v7 = OBJC_IVAR____TtC4Siri27SRCarPlaySnippetPlatterView_coloredPlatterView;
      uint64_t v8 = *(void **)&v6[OBJC_IVAR____TtC4Siri27SRCarPlaySnippetPlatterView_coloredPlatterView];
      char v17 = v6;
      if (v8)
      {
        id v9 = v6;
        [v8 setBackgroundColor:a1];
        id v10 = v17;
        uint64_t v11 = *(void **)&v17[v7];
        if (!v11)
        {
LABEL_14:
          objc_msgSend( *(id *)&v10[OBJC_IVAR____TtC4Siri27SRCarPlaySnippetPlatterView_materialView],  "setHidden:",  1,  v17);

          uint64_t v15 = v18;
          goto LABEL_15;
        }

        [v11 setHidden:0];
      }

      else
      {
        uint64_t v16 = v6;
      }

      id v10 = v17;
      goto LABEL_14;
    }
  }

  if (qword_1000D8A20 != -1) {
    swift_once(&qword_1000D8A20, sub_100066BF4);
  }
  uint64_t v12 = type metadata accessor for Logger(0LL);
  uint64_t v13 = sub_10004ADF0(v12, (uint64_t)qword_1000D9988);
  os_log_type_t v14 = static os_log_type_t.info.getter(v13);
  sub_1000681D8(v14, 0x10uLL, 0xD000000000000049LL, 0x800000010008BDC0LL, 0xD000000000000041LL, 0x800000010008B020LL);
}

void sub_100063FE8()
{
  id v1 = [v0 view];
  if (v1)
  {
    id v5 = v1;
    uint64_t v2 = type metadata accessor for SRCarPlayView();
    uint64_t v3 = swift_dynamicCastClass(v5, v2);
    if (v3)
    {
      uint64_t v4 = v3;
      if (*(void *)(v3 + OBJC_IVAR____TtC4Siri13SRCarPlayView_dismissalView))
      {
        [*(id *)(v3 + OBJC_IVAR____TtC4Siri13SRCarPlayView_backgroundView) removeFromSuperview];
        *(_BYTE *)(v4 + OBJC_IVAR____TtC4Siri13SRCarPlayView_isUsingOpaqueBackground) = 1;
      }

      sub_100065838(0);
    }
  }

uint64_t sub_100064098(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10004A8E8(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32LL))(a2, a1, v5);
  return a2;
}

void *sub_1000640DC(void *a1)
{
  return a1;
}

void sub_100064110(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = &v3[OBJC_IVAR____TtC4Siri23SRCarPlayViewController_currentSnippetViewController];
  *uint64_t v4 = 0LL;
  v4[1] = 0LL;
  uint64_t v5 = &v3[OBJC_IVAR____TtC4Siri23SRCarPlayViewController_delegate];
  *((void *)v5 + 1) = 0LL;
  swift_unknownObjectWeakInit(v5, 0LL, a3);
  uint64_t v6 = &v3[OBJC_IVAR____TtC4Siri23SRCarPlayViewController_lastFocusIndex];
  *(void *)uint64_t v6 = 0LL;
  v6[8] = 1;
  *(void *)&v3[OBJC_IVAR____TtC4Siri23SRCarPlayViewController_requestOptions] = 0LL;
  *(void *)&v3[OBJC_IVAR____TtC4Siri23SRCarPlayViewController_delayedAceCommands] = 0LL;
  v3[OBJC_IVAR____TtC4Siri23SRCarPlayViewController_isSpeaking] = 0;

  _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x800000010008B670LL,  "Siri/SRCarPlayViewController.swift",  34LL,  2LL,  40LL,  0);
  __break(1u);
}

double SRFeedbackButton.sizeThatFits(_:)()
{
  return 50.0;
}

void sub_1000642F8()
{
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [(id)objc_opt_self(UIImage) _systemImageNamed:v1];

  [v0 setImage:v2 forState:0];
  id v3 = [(id)objc_opt_self(UIColor) systemDarkGrayColor];
  [v0 setTintColor:v3];

  id v4 = [v0 layer];
  [v4 setCornerRadius:25.0];

  id v5 = [v0 layer];
  [v5 setMasksToBounds:1];
}

id SRFeedbackButton.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SRFeedbackButton();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SRFeedbackButton()
{
  return objc_opt_self(&OBJC_CLASS____TtC4Siri16SRFeedbackButton);
}

char *sub_10006451C(double a1, double a2, double a3, double a4)
{
  *(void *)&v4[OBJC_IVAR____TtC4Siri27SRCarPlaySnippetPlatterView_coloredPlatterView] = 0LL;
  uint64_t v9 = OBJC_IVAR____TtC4Siri27SRCarPlaySnippetPlatterView_materialView;
  id v10 = objc_allocWithZone(&OBJC_CLASS___UIVisualEffectView);
  uint64_t v11 = v4;
  *(void *)&v4[v9] = [v10 initWithEffect:0];

  v34.receiver = v11;
  v34.super_class = (Class)type metadata accessor for SRCarPlaySnippetPlatterView();
  id v12 = objc_msgSendSuper2(&v34, "initWithFrame:", a1, a2, a3, a4);
  uint64_t v13 = objc_opt_self(&OBJC_CLASS___UIVisualEffectView);
  uint64_t v14 = swift_dynamicCastObjCClass(v12, v13);
  uint64_t v15 = (char *)v12;
  uint64_t v16 = v15;
  if (v14)
  {
    [v15 _setContinuousCornerRadius:20.0];
  }

  else
  {
    id v17 = [v15 layer];
    [v17 setCornerRadius:20.0];

    id v18 = [v16 layer];
    if (qword_1000D89E0 != -1) {
      swift_once(&qword_1000D89E0, sub_10004AE7C);
    }
    [v18 setCornerCurve:qword_1000DA5B0];
  }

  [v16 setAutoresizingMask:18];
  objc_msgSend(v16, "setFrame:", a1, a2, a3, a4);

  id v19 = [objc_allocWithZone(UIView) init];
  uint64_t v20 = objc_opt_self(&OBJC_CLASS___UIVisualEffectView);
  if (swift_dynamicCastObjCClass(v19, v20))
  {
    [v19 _setContinuousCornerRadius:20.0];
  }

  else
  {
    id v21 = [v19 layer];
    [v21 setCornerRadius:20.0];

    id v22 = [v19 layer];
    if (qword_1000D89E0 != -1) {
      swift_once(&qword_1000D89E0, sub_10004AE7C);
    }
    [v22 setCornerCurve:qword_1000DA5B0];
  }

  [v19 setAutoresizingMask:18];
  objc_msgSend(v19, "setFrame:", a1, a2, a3, a4);
  [v19 setHidden:1];
  [v16 addSubview:v19];
  id v23 = *(void **)&v16[OBJC_IVAR____TtC4Siri27SRCarPlaySnippetPlatterView_coloredPlatterView];
  *(void *)&v16[OBJC_IVAR____TtC4Siri27SRCarPlaySnippetPlatterView_coloredPlatterView] = v19;
  id v24 = v19;

  uint64_t v25 = OBJC_IVAR____TtC4Siri27SRCarPlaySnippetPlatterView_materialView;
  os_log_type_t v26 = *(void **)&v16[OBJC_IVAR____TtC4Siri27SRCarPlaySnippetPlatterView_materialView];
  uint64_t v27 = objc_opt_self(&OBJC_CLASS___UIVisualEffectView);
  uint64_t v28 = swift_dynamicCastObjCClass(v26, v27);
  id v29 = v26;
  uint64_t v30 = v29;
  if (v28)
  {
    [v29 _setContinuousCornerRadius:20.0];
  }

  else
  {
    id v31 = [v29 layer];
    [v31 setCornerRadius:20.0];

    id v32 = [v30 layer];
    if (qword_1000D89E0 != -1) {
      swift_once(&qword_1000D89E0, sub_10004AE7C);
    }
    [v32 setCornerCurve:qword_1000DA5B0];
  }

  [v30 setAutoresizingMask:18];
  objc_msgSend(v30, "setFrame:", a1, a2, a3, a4);

  [*(id *)&v16[v25] setHidden:1];
  [*(id *)&v16[v25] setOpaque:0];
  [v16 addSubview:*(void *)&v16[v25]];
  [(id)objc_opt_self(SRCarPlayUIUtilities) deviceSupportsAI];

  return v16;
}

id sub_1000649AC(uint64_t a1)
{
  else {
    uint64_t v2 = *(void *)&asc_100083480[8 * a1 - 16];
  }
  uint64_t v3 = OBJC_IVAR____TtC4Siri27SRCarPlaySnippetPlatterView_materialView;
  id v4 = *(void **)(v1 + OBJC_IVAR____TtC4Siri27SRCarPlaySnippetPlatterView_materialView);
  id v5 = (void *)objc_opt_self(&OBJC_CLASS___UIBlurEffect);
  id v6 = v4;
  id v7 = [v5 effectWithStyle:v2];
  [v6 setEffect:v7];

  [*(id *)(v1 + v3) setOpaque:0];
  [*(id *)(v1 + v3) setHidden:0];
  id result = *(id *)(v1 + OBJC_IVAR____TtC4Siri27SRCarPlaySnippetPlatterView_coloredPlatterView);
  if (result) {
    return [result setHidden:1];
  }
  return result;
}

void sub_100064AA8(void *a1)
{
  uint64_t v2 = v1;
  [v2 insertSubview:a1 aboveSubview:*(void *)&v2[OBJC_IVAR____TtC4Siri27SRCarPlaySnippetPlatterView_materialView]];
  id v4 = (void *)objc_opt_self(&OBJC_CLASS___NSLayoutConstraint);
  uint64_t v5 = sub_10004A8E8(&qword_1000D97E0);
  uint64_t v6 = swift_allocObject(v5, 80LL, 7LL);
  *(_OWORD *)(v6 + 16) = xmmword_100083360;
  id v7 = [v2 leadingAnchor];
  id v8 = [a1 leadingAnchor];
  id v9 = [v7 constraintEqualToAnchor:v8];

  *(void *)(v6 + 32) = v9;
  id v10 = [v2 trailingAnchor];
  id v11 = [a1 trailingAnchor];
  id v12 = [v10 constraintEqualToAnchor:v11];

  *(void *)(v6 + 40) = v12;
  id v13 = [v2 topAnchor];
  id v14 = [a1 topAnchor];
  id v15 = [v13 constraintEqualToAnchor:v14];

  *(void *)(v6 + 4_Block_object_dispose((const void *)(v9 - 80), 8) = v15;
  id v16 = [v2 bottomAnchor];
  id v17 = [a1 bottomAnchor];
  id v18 = [v16 constraintEqualToAnchor:v17];

  *(void *)(v6 + 56) = v18;
  id v19 = [v2 centerXAnchor];
  id v20 = [a1 centerXAnchor];
  id v21 = [v19 constraintEqualToAnchor:v20];

  *(void *)(v6 + 64) = v21;
  id v22 = [v2 centerYAnchor];
  id v23 = [a1 centerYAnchor];
  id v24 = [v22 constraintEqualToAnchor:v23];

  *(void *)(v6 + 72) = v24;
  specialized Array._endMutation()(v25);
  sub_100064E3C();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v6);
  [v4 activateConstraints:isa];
}

id sub_100064DB4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SRCarPlaySnippetPlatterView();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SRCarPlaySnippetPlatterView()
{
  return objc_opt_self(&OBJC_CLASS____TtC4Siri27SRCarPlaySnippetPlatterView);
}

unint64_t sub_100064E3C()
{
  unint64_t result = qword_1000D97E8;
  if (!qword_1000D97E8)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___NSLayoutConstraint);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_1000D97E8);
  }

  return result;
}

uint64_t sub_100064E78@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  int64_t v4 = a1;
  unint64_t v6 = (unint64_t)a1 >> 62;
  if (!a1) {
    goto LABEL_18;
  }
  if (!v6)
  {
    if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8LL) + 0x10) == 1LL)
    {
      swift_bridgeObjectRetain(a1);
      goto LABEL_5;
    }

id sub_100065324()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SystemAssistantPromptEntryView();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SystemAssistantPromptEntryView()
{
  return objc_opt_self(&OBJC_CLASS____TtC4Siri30SystemAssistantPromptEntryView);
}

void sub_100065398(void *a1, char a2)
{
  uint64_t v4 = OBJC_IVAR____TtC4Siri13SRCarPlayView_currentSnippetContainerView;
  unint64_t v5 = *(void *)&v2[OBJC_IVAR____TtC4Siri13SRCarPlayView_currentSnippetContainerView];
  if (a1)
  {
    uint64_t v7 = type metadata accessor for SRCarPlayScrollView();
    uint64_t v8 = swift_dynamicCastClass(a1, v7);
    if (v8 && (uint64_t v9 = (void *)v8, *(_BYTE *)(v8 + OBJC_IVAR____TtC4Siri19SRCarPlayScrollView_isFullScreen) == 1))
    {
      id v10 = (id)v5;
      id v11 = a1;
      id v12 = sub_100065AD8(v9);
    }

    else
    {
      id v13 = (id)v5;
      id v11 = a1;
      id v12 = sub_100065F9C(v11);
    }

    unint64_t v14 = (unint64_t)v12;
  }

  else
  {
    id v15 = (id)v5;
    unint64_t v14 = 0LL;
  }

  uint64_t v16 = *(void **)&v2[v4];
  *(void *)&v2[v4] = v14;
  id v17 = (id)v14;

  if (v5 | v14)
  {
    os_log_type_t v18 = (void *)objc_opt_self(&OBJC_CLASS___CATransaction);
    [v18 begin];
    if (v5)
    {
      uint64_t v19 = swift_allocObject(&unk_1000BBC30, 24LL, 7LL);
      *(void *)(v19 + 16) = v5;
      v46[4] = sub_100066AF0;
      uint64_t v47 = v19;
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 1107296256LL;
      v46[2] = sub_10006580C;
      v46[3] = &unk_1000BBC48;
      uint64_t v20 = _Block_copy(v46);
      uint64_t v21 = v47;
      id v22 = (id)v5;
      swift_release(v21);
      [v18 setCompletionBlock:v20];
      _Block_release(v20);

      if (v14)
      {
        id v23 = v22;
        id v24 = v17;
        [v2 insertSubview:v24 belowSubview:v23];
        if ((a2 & 1) != 0)
        {
          sub_1000668F0(v23, 2u);
          sub_1000668F0(v24, 1u);
        }

        else
        {
          id v28 = [v24 layer];
          LODWORD(v29) = 1.0;
          [v28 setOpacity:v29];

          id v30 = [v23 layer];
          LODWORD(v31) = 0;
          [v30 setOpacity:v31];
        }

        goto LABEL_30;
      }

      if ((a2 & 1) == 0)
      {
        uint64_t v37 = *(void **)&v2[OBJC_IVAR____TtC4Siri13SRCarPlayView_backgroundView];
        id v38 = v22;
        if (v37)
        {
          id v39 = [v37 layer];
          LODWORD(v40) = 0;
          [v39 setOpacity:v40];
        }

        id v44 = [v22 layer];
        LODWORD(v45) = 0;
        [v44 setOpacity:v45];

        goto LABEL_30;
      }

      id v25 = v22;
      sub_100065838(1);
      os_log_type_t v26 = v25;
      unsigned __int8 v27 = 3;
    }

    else
    {
      if (!v14) {
        goto LABEL_30;
      }
      if ((a2 & 1) == 0)
      {
        id v32 = *(void **)&v2[OBJC_IVAR____TtC4Siri13SRCarPlayView_backgroundView];
        if (v32)
        {
          id v33 = v17;
          id v34 = [v32 layer];
          uint64_t v35 = v34;
          LODWORD(v36) = 0.5;
          if (v2[OBJC_IVAR____TtC4Siri13SRCarPlayView_isUsingOpaqueBackground]) {
            *(float *)&double v36 = 1.0;
          }
          [v34 setOpacity:v36];
        }

        else
        {
          id v41 = v17;
        }

        id v42 = [v17 layer];
        LODWORD(v43) = 1.0;
        [v42 setOpacity:v43];

        goto LABEL_30;
      }

      id v25 = v17;
      sub_100065838(0);
      os_log_type_t v26 = v25;
      unsigned __int8 v27 = 0;
    }

    sub_1000668F0(v26, v27);

LABEL_30:
    [v18 commit];

    if (v2[OBJC_IVAR____TtC4Siri13SRCarPlayView_showIntelligentLightAnimation] == 1) {
      v2[OBJC_IVAR____TtC4Siri13SRCarPlayView_showIntelligentLightAnimation] = 0;
    }
  }

id sub_100065774(void *a1)
{
  Class isa = (Class)[a1 constraints];
  if (!isa)
  {
    unint64_t v3 = sub_100064E3C();
    uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(0LL, v3);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v4);
  }

  [(id)objc_opt_self(NSLayoutConstraint) deactivateConstraints:isa];

  return [a1 removeFromSuperview];
}

uint64_t sub_10006580C(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = swift_retain(v2);
  v1(v3);
  return swift_release(v2);
}

void sub_100065838(char a1)
{
  if ((a1 & 1) != 0)
  {
    uint64_t v18 = OBJC_IVAR____TtC4Siri13SRCarPlayView_backgroundView;
    uint64_t v19 = *(void **)(v1 + OBJC_IVAR____TtC4Siri13SRCarPlayView_backgroundView);
    if (v19)
    {
      id v20 = [v19 layer];
      uint64_t v21 = v20;
      LODWORD(v22) = 0.5;
      if (*(_BYTE *)(v1 + OBJC_IVAR____TtC4Siri13SRCarPlayView_isUsingOpaqueBackground)) {
        *(float *)&double v22 = 1.0;
      }
      [v20 setOpacity:v22];
    }

    id v23 = sub_10004B060();
    double v24 = 0.5;
    if (*(_BYTE *)(v1 + OBJC_IVAR____TtC4Siri13SRCarPlayView_isUsingOpaqueBackground)) {
      double v24 = 1.0;
    }
    id v32 = &type metadata for Double;
    *(double *)double v31 = v24;
    id v25 = sub_10005A65C(v31, (uint64_t)&type metadata for Double);
    id v6 = v23;
    uint64_t v26 = _bridgeAnythingToObjectiveC<A>(_:)(v25, &type metadata for Double);
    sub_1000532F4(v31);
    [v6 setFromValue:v26];

    swift_unknownObjectRelease(v26);
    unsigned __int8 v27 = *(void **)(v1 + v18);
    if (v27)
    {
      id v28 = [v27 layer];
      [v28 addAnimation:v6 forKey:0];

      double v29 = *(void **)(v1 + v18);
      if (v29)
      {
        id v16 = [v29 layer];
        LODWORD(v30) = 0;
        [v16 setOpacity:v30];
LABEL_19:
      }
    }
  }

  else
  {
    id v2 = sub_10004AF20();
    uint64_t v3 = OBJC_IVAR____TtC4Siri13SRCarPlayView_isUsingOpaqueBackground;
    double v4 = 0.5;
    if (*(_BYTE *)(v1 + OBJC_IVAR____TtC4Siri13SRCarPlayView_isUsingOpaqueBackground)) {
      double v4 = 1.0;
    }
    id v32 = &type metadata for Double;
    *(double *)double v31 = v4;
    unint64_t v5 = sub_10005A65C(v31, (uint64_t)&type metadata for Double);
    id v6 = v2;
    uint64_t v7 = _bridgeAnythingToObjectiveC<A>(_:)(v5, &type metadata for Double);
    sub_1000532F4(v31);
    [v6 setToValue:v7];

    swift_unknownObjectRelease(v7);
    uint64_t v8 = OBJC_IVAR____TtC4Siri13SRCarPlayView_backgroundView;
    uint64_t v9 = *(void **)(v1 + OBJC_IVAR____TtC4Siri13SRCarPlayView_backgroundView);
    if (v9)
    {
      id v10 = [v9 layer];
      LODWORD(v11) = 0;
      [v10 setOpacity:v11];

      id v12 = *(void **)(v1 + v8);
      if (v12)
      {
        id v13 = [v12 layer];
        [v13 addAnimation:v6 forKey:0];

        unint64_t v14 = *(void **)(v1 + v8);
        if (v14)
        {
          id v15 = [v14 layer];
          id v16 = v15;
          LODWORD(v17) = 0.5;
          if (*(_BYTE *)(v1 + v3)) {
            *(float *)&double v17 = 1.0;
          }
          [v15 setOpacity:v17];
          goto LABEL_19;
        }
      }
    }
  }
}

id sub_100065AD8(void *a1)
{
  id v3 = [objc_allocWithZone(UIView) init];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v1 addSubview:v3];
  id v38 = (id)objc_opt_self(&OBJC_CLASS___NSLayoutConstraint);
  uint64_t v4 = sub_10004A8E8(&qword_1000D97E0);
  uint64_t v5 = swift_allocObject(v4, 72LL, 7LL);
  *(_OWORD *)(v5 + 16) = xmmword_1000834D0;
  id v6 = [v3 centerXAnchor];
  id v7 = [v1 safeAreaLayoutGuide];
  id v8 = [v7 centerXAnchor];

  id v9 = [v6 constraintEqualToAnchor:v8];
  *(void *)(v5 + 32) = v9;
  id v10 = [v3 topAnchor];
  id v11 = [v1 safeAreaLayoutGuide];
  id v12 = [v11 topAnchor];

  id v13 = [v10 constraintEqualToAnchor:v12 constant:0.0];
  *(void *)(v5 + 40) = v13;
  id v14 = [v3 bottomAnchor];
  id v15 = [v1 safeAreaLayoutGuide];
  id v16 = [v15 bottomAnchor];

  id v17 = [v14 constraintEqualToAnchor:v16 constant:0.0];
  *(void *)(v5 + 4_Block_object_dispose((const void *)(v9 - 80), 8) = v17;
  id v18 = [v3 leadingAnchor];
  id v19 = [v1 safeAreaLayoutGuide];
  id v20 = [v19 leadingAnchor];

  id v21 = [v18 constraintEqualToAnchor:v20];
  *(void *)(v5 + 56) = v21;
  id v22 = [v3 trailingAnchor];
  id v23 = [v1 safeAreaLayoutGuide];
  id v24 = [v23 trailingAnchor];

  id v25 = [v22 constraintEqualToAnchor:v24];
  *(void *)(v5 + 64) = v25;
  specialized Array._endMutation()(v26);
  sub_100064E3C();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v5);
  [v38 activateConstraints:isa];

  [a1 setClipsToBounds:1];
  [a1 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 addSubview:a1];
  uint64_t v28 = swift_allocObject(v4, 48LL, 7LL);
  *(_OWORD *)(v28 + 16) = xmmword_1000834E0;
  id v29 = [v3 centerXAnchor];
  id v30 = [a1 centerXAnchor];
  id v31 = [v29 constraintEqualToAnchor:v30];

  *(void *)(v28 + 32) = v31;
  id v32 = [v3 centerYAnchor];
  id v33 = [a1 centerYAnchor];
  id v34 = [v32 constraintEqualToAnchor:v33];

  *(void *)(v28 + 40) = v34;
  specialized Array._endMutation()(v35);
  Class v36 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v28);
  [v38 activateConstraints:v36];

  return v3;
}

id sub_100065F9C(void *a1)
{
  id v2 = v1;
  id v4 = [objc_allocWithZone(UIView) init];
  id v5 = [v4 layer];
  if (qword_1000D89E0 != -1) {
    swift_once(&qword_1000D89E0, sub_10004AE7C);
  }
  [v5 setCornerCurve:qword_1000DA5B0];

  id v6 = [v4 layer];
  LODWORD(v7) = 0.5;
  [v6 setShadowOpacity:v7];

  id v8 = [v4 layer];
  if (qword_1000D89E8 != -1) {
    swift_once(&qword_1000D89E8, sub_10004AE94);
  }
  [v8 setShadowColor:qword_1000DA5B8];

  id v9 = [v4 layer];
  [v9 setShadowRadius:20.0];

  id v10 = [v4 layer];
  if (qword_1000D89F0 != -1) {
    swift_once(&qword_1000D89F0, sub_10004AEF4);
  }
  [v10 setShadowOffset:xmmword_1000DA5C0];

  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v2 addSubview:v4];
  else {
    double v11 = 68.0;
  }
  id v45 = (id)objc_opt_self(&OBJC_CLASS___NSLayoutConstraint);
  uint64_t v12 = sub_10004A8E8(&qword_1000D97E0);
  uint64_t v13 = swift_allocObject(v12, 72LL, 7LL);
  *(_OWORD *)(v13 + 16) = xmmword_1000834D0;
  id v14 = [v4 centerXAnchor];
  id v15 = [v2 safeAreaLayoutGuide];
  id v16 = [v15 centerXAnchor];

  id v17 = [v14 constraintEqualToAnchor:v16];
  *(void *)(v13 + 32) = v17;
  id v18 = [v4 topAnchor];
  id v19 = [v2 safeAreaLayoutGuide];
  id v20 = [v19 topAnchor];

  id v21 = [v18 constraintGreaterThanOrEqualToAnchor:v20 constant:12.0];
  *(void *)(v13 + 40) = v21;
  id v22 = [v4 bottomAnchor];
  id v23 = [v2 safeAreaLayoutGuide];
  id v24 = [v23 bottomAnchor];

  id v25 = [v22 constraintEqualToAnchor:v24 constant:-v11];
  *(void *)(v13 + 4_Block_object_dispose((const void *)(v9 - 80), 8) = v25;
  id v26 = [v4 leadingAnchor];
  id v27 = [v2 safeAreaLayoutGuide];
  id v28 = [v27 leadingAnchor];

  id v29 = [v26 constraintGreaterThanOrEqualToAnchor:v28 constant:12.0];
  *(void *)(v13 + 56) = v29;
  id v30 = [v4 trailingAnchor];
  id v31 = [v2 safeAreaLayoutGuide];
  id v32 = [v31 trailingAnchor];

  id v33 = [v30 constraintLessThanOrEqualToAnchor:v32 constant:-12.0];
  *(void *)(v13 + 64) = v33;
  specialized Array._endMutation()(v34);
  sub_100064E3C();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v13);
  [v45 activateConstraints:isa];

  [v4 bounds];
  id v40 = objc_msgSend( objc_allocWithZone((Class)type metadata accessor for SRCarPlaySnippetPlatterView()),  "initWithFrame:",  v36,  v37,  v38,  v39);
  sub_1000649AC(2LL);
  [v4 addSubview:v40];
  [a1 setClipsToBounds:1];
  [a1 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v41 = [a1 layer];
  [v41 setCornerRadius:20.0];

  id v42 = [a1 layer];
  [v42 setCornerCurve:qword_1000DA5B0];

  sub_100064AA8(a1);
  double v43 = *(void **)&v2[OBJC_IVAR____TtC4Siri13SRCarPlayView_currentSnippetPlatterView];
  *(void *)&v2[OBJC_IVAR____TtC4Siri13SRCarPlayView_currentSnippetPlatterView] = v40;

  return v4;
}

char *sub_1000665C8(void *a1)
{
  uint64_t v22 = 0LL;
  unint64_t v23 = 0xE000000000000000LL;
  _StringGuts.grow(_:)(40LL);
  v3._countAndFlagsBits = 0xD000000000000025LL;
  v3._object = (void *)0x800000010008C2F0LL;
  String.append(_:)(v3);
  id v21 = [a1 state];
  type metadata accessor for State(0LL);
  _print_unlocked<A, B>(_:_:)( &v21,  &v22,  v4,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
  v5._countAndFlagsBits = 46LL;
  v5._object = (void *)0xE100000000000000LL;
  String.append(_:)(v5);
  uint64_t v7 = v22;
  unint64_t v6 = v23;
  if (qword_1000D8A20 != -1) {
    swift_once(&qword_1000D8A20, sub_100066BF4);
  }
  uint64_t v8 = type metadata accessor for Logger(0LL);
  uint64_t v9 = sub_10004ADF0(v8, (uint64_t)qword_1000D9988);
  os_log_type_t v10 = static os_log_type_t.info.getter(v9);
  sub_1000681D8(v10, 0x10uLL, 0xD000000000000018LL, 0x800000010008C2D0LL, v7, v6);
  swift_bridgeObjectRelease(v6);
  unint64_t result = (char *)[a1 state];
  if (result == (char *)3)
  {
    os_log_type_t v12 = static os_log_type_t.info.getter(3LL);
    sub_1000681D8(v12, 0x10uLL, 0xD000000000000018LL, 0x800000010008C2D0LL, 0xD000000000000038LL, 0x800000010008C320LL);
    unint64_t result = (char *)swift_unknownObjectWeakLoadStrong(v1 + OBJC_IVAR____TtC4Siri13SRCarPlayView_delegate, v13);
    if (result)
    {
      id v15 = result;
      id v16 = &result[OBJC_IVAR____TtC4Siri23SRCarPlayViewController_delegate];
      uint64_t Strong = swift_unknownObjectWeakLoadStrong(&result[OBJC_IVAR____TtC4Siri23SRCarPlayViewController_delegate], v14);
      if (Strong)
      {
        uint64_t v18 = Strong;
        uint64_t v19 = *((void *)v16 + 1);
        uint64_t ObjectType = swift_getObjectType(Strong);
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 32))(v15, 7LL, ObjectType, v19);
        swift_unknownObjectRelease(v15);
        id v15 = (char *)v18;
      }

      return (char *)swift_unknownObjectRelease(v15);
    }
  }

  return result;
}

id sub_100066838()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SRCarPlayView();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SRCarPlayView()
{
  return objc_opt_self(&OBJC_CLASS____TtC4Siri13SRCarPlayView);
}

void sub_1000668F0(void *a1, unsigned __int8 a2)
{
  int v4 = a2 & 0xFE;
  id v5 = [a1 layer];
  uint64_t v7 = v5;
  if (v4 == 2)
  {
    int v8 = a2;
    LODWORD(swift_unknownObjectWeakInit(&v3[OBJC_IVAR___SRCarPlayPresentation_dataSource], 0LL, v6) = 1.0;
    [v5 setOpacity:v6];

    id v9 = [a1 layer];
    id v10 = sub_10004B060();
    [v9 addAnimation:v10 forKey:0];

    if (v8 == 2)
    {
      id v11 = [a1 layer];
      id v12 = sub_10004B2EC();
      [v11 addAnimation:v12 forKey:0];
    }

    id v19 = [a1 layer];
    LODWORD(v13) = 0;
    [v19 setOpacity:v13];
  }

  else
  {
    LODWORD(swift_unknownObjectWeakInit(&v3[OBJC_IVAR___SRCarPlayPresentation_dataSource], 0LL, v6) = 0;
    [v5 setOpacity:v6];

    id v14 = [a1 layer];
    id v15 = sub_10004AF20();
    [v14 addAnimation:v15 forKey:0];

    id v16 = [a1 layer];
    id v17 = sub_10004B1A0();
    [v16 addAnimation:v17 forKey:0];

    id v19 = [a1 layer];
    LODWORD(v1_Block_object_dispose((const void *)(v9 - 80), 8) = 1.0;
    [v19 setOpacity:v18];
  }
}

uint64_t sub_100066ACC()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

id sub_100066AF0()
{
  return sub_100065774(*(void **)(v0 + 16));
}

uint64_t sub_100066AF8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100066B08(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

void sub_100066B10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v4 = &v3[OBJC_IVAR____TtC4Siri13SRCarPlayView_delegate];
  *((void *)v4 + 1) = 0LL;
  swift_unknownObjectWeakInit(v4, 0LL, a3);
  *(void *)&v3[OBJC_IVAR____TtC4Siri13SRCarPlayView_dismissalView] = 0LL;
  *(void *)&v3[OBJC_IVAR____TtC4Siri13SRCarPlayView_backgroundView] = 0LL;
  *(void *)&v3[OBJC_IVAR____TtC4Siri13SRCarPlayView_currentSnippetContainerView] = 0LL;
  *(void *)&v3[OBJC_IVAR____TtC4Siri13SRCarPlayView_currentSnippetPlatterView] = 0LL;
  v3[OBJC_IVAR____TtC4Siri13SRCarPlayView_isUsingOpaqueBackground] = 0;
  uint64_t v5 = OBJC_IVAR____TtC4Siri13SRCarPlayView_showIntelligentLightAnimation;
  v3[v5] = [(id)objc_opt_self(SRCarPlayUIUtilities) deviceSupportsAI];
  v3[OBJC_IVAR____TtC4Siri13SRCarPlayView_touchPassThrough] = 0;

  _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD000000000000025LL,  0x800000010008B670LL,  "Siri/SRCarPlayView.swift",  24LL,  2LL,  64LL,  0);
  __break(1u);
}

uint64_t sub_100066BF4()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_1000592CC(v0, qword_1000D9988);
  uint64_t result = sub_10004ADF0(v0, (uint64_t)qword_1000D9988);
  if (AFSiriLogContextConnection) {
    return Logger.init(_:)(AFSiriLogContextConnection);
  }
  __break(1u);
  return result;
}

void sub_100066C58()
{
  off_1000D99A0 = &_swiftEmptyDictionarySingleton;
}

uint64_t sub_100066C6C(Swift::UInt a1)
{
  if (qword_1000D8A28 != -1) {
    swift_once(&qword_1000D8A28, sub_100066C58);
  }
  swift_beginAccess(&off_1000D99A0, v117, 32LL, 0LL);
  uint64_t v2 = off_1000D99A0;
  if (!*((void *)off_1000D99A0 + 2) || (unint64_t v3 = sub_1000683F4(a1), (v4 & 1) == 0))
  {
    swift_endAccess(v117);
    if ((a1 & 1) != 0)
    {
      int v8 = sub_10005C9AC(0LL, 1LL, 1, (char *)_swiftEmptyArrayStorage);
      unint64_t v10 = *((void *)v8 + 2);
      unint64_t v9 = *((void *)v8 + 3);
      if (v10 >= v9 >> 1) {
        int v8 = sub_10005C9AC((char *)(v9 > 1), v10 + 1, 1, v8);
      }
      *((void *)v8 + 2) = v10 + 1;
      id v11 = &v8[16 * v10];
      *((void *)v11 + 4) = 0x7461766974636123LL;
      *((void *)v11 + 5) = 0xEB000000006E6F69LL;
      if ((a1 & 2) == 0)
      {
LABEL_17:
        if ((a1 & 4) != 0)
        {
          if ((swift_isUniquelyReferenced_nonNull_native(v8) & 1) == 0) {
            int v8 = sub_10005C9AC(0LL, *((void *)v8 + 2) + 1LL, 1, v8);
          }
          unint64_t v16 = *((void *)v8 + 2);
          unint64_t v15 = *((void *)v8 + 3);
          if (v16 >= v15 >> 1) {
            int v8 = sub_10005C9AC((char *)(v15 > 1), v16 + 1, 1, v8);
          }
          *((void *)v8 + 2) = v16 + 1;
          id v17 = &v8[16 * v16];
          *((void *)v17 + 4) = 0x736472616323LL;
          *((void *)v17 + 5) = 0xE600000000000000LL;
          if ((a1 & 8) == 0)
          {
LABEL_19:
            if ((a1 & 0x10) == 0) {
              goto LABEL_20;
            }
            goto LABEL_37;
          }
        }

        else if ((a1 & 8) == 0)
        {
          goto LABEL_19;
        }

        if ((swift_isUniquelyReferenced_nonNull_native(v8) & 1) == 0) {
          int v8 = sub_10005C9AC(0LL, *((void *)v8 + 2) + 1LL, 1, v8);
        }
        unint64_t v19 = *((void *)v8 + 2);
        unint64_t v18 = *((void *)v8 + 3);
        if (v19 >= v18 >> 1) {
          int v8 = sub_10005C9AC((char *)(v18 > 1), v19 + 1, 1, v8);
        }
        *((void *)v8 + 2) = v19 + 1;
        id v20 = &v8[16 * v19];
        *((void *)v20 + 4) = 0x646E4472616323LL;
        *((void *)v20 + 5) = 0xE700000000000000LL;
        if ((a1 & 0x10) == 0)
        {
LABEL_20:
          if ((a1 & 0x20) == 0) {
            goto LABEL_21;
          }
          goto LABEL_42;
        }

LABEL_37:
        if ((swift_isUniquelyReferenced_nonNull_native(v8) & 1) == 0) {
          int v8 = sub_10005C9AC(0LL, *((void *)v8 + 2) + 1LL, 1, v8);
        }
        unint64_t v22 = *((void *)v8 + 2);
        unint64_t v21 = *((void *)v8 + 3);
        if (v22 >= v21 >> 1) {
          int v8 = sub_10005C9AC((char *)(v21 > 1), v22 + 1, 1, v8);
        }
        *((void *)v8 + 2) = v22 + 1;
        unint64_t v23 = &v8[16 * v22];
        *((void *)v23 + 4) = 0x79616C5072616323LL;
        *((void *)v23 + 5) = 0xE800000000000000LL;
        if ((a1 & 0x20) == 0)
        {
LABEL_21:
          if ((a1 & 0x40) == 0) {
            goto LABEL_22;
          }
          goto LABEL_47;
        }

LABEL_47:
        if ((swift_isUniquelyReferenced_nonNull_native(v8) & 1) == 0) {
          int v8 = sub_10005C9AC(0LL, *((void *)v8 + 2) + 1LL, 1, v8);
        }
        unint64_t v28 = *((void *)v8 + 2);
        unint64_t v27 = *((void *)v8 + 3);
        if (v28 >= v27 >> 1) {
          int v8 = sub_10005C9AC((char *)(v27 > 1), v28 + 1, 1, v8);
        }
        *((void *)v8 + 2) = v28 + 1;
        id v29 = &v8[16 * v28];
        *((void *)v29 + 4) = 0x746361706D6F6323LL;
        *((void *)v29 + 5) = 0xE800000000000000LL;
        if ((a1 & 0x80) == 0)
        {
LABEL_23:
          if ((a1 & 0x100) == 0) {
            goto LABEL_24;
          }
          goto LABEL_57;
        }

LABEL_57:
        if ((swift_isUniquelyReferenced_nonNull_native(v8) & 1) == 0) {
          int v8 = sub_10005C9AC(0LL, *((void *)v8 + 2) + 1LL, 1, v8);
        }
        unint64_t v34 = *((void *)v8 + 2);
        unint64_t v33 = *((void *)v8 + 3);
        if (v34 >= v33 >> 1) {
          int v8 = sub_10005C9AC((char *)(v33 > 1), v34 + 1, 1, v8);
        }
        *((void *)v8 + 2) = v34 + 1;
        uint64_t v35 = &v8[16 * v34];
        *((void *)v35 + 4) = 0x7375636F6623LL;
        *((void *)v35 + 5) = 0xE600000000000000LL;
        if ((a1 & 0x200) == 0)
        {
LABEL_25:
          if ((a1 & 0x400) == 0) {
            goto LABEL_72;
          }
          goto LABEL_67;
        }

LABEL_62:
        if ((swift_isUniquelyReferenced_nonNull_native(v8) & 1) == 0) {
          int v8 = sub_10005C9AC(0LL, *((void *)v8 + 2) + 1LL, 1, v8);
        }
        unint64_t v37 = *((void *)v8 + 2);
        unint64_t v36 = *((void *)v8 + 3);
        if (v37 >= v36 >> 1) {
          int v8 = sub_10005C9AC((char *)(v36 > 1), v37 + 1, 1, v8);
        }
        *((void *)v8 + 2) = v37 + 1;
        double v38 = &v8[16 * v37];
        *((void *)v38 + 4) = 0x656C646923LL;
        *((void *)v38 + 5) = 0xE500000000000000LL;
        if ((a1 & 0x400) == 0)
        {
LABEL_72:
          if ((a1 & 0x800) != 0)
          {
            if ((swift_isUniquelyReferenced_nonNull_native(v8) & 1) == 0) {
              int v8 = sub_10005C9AC(0LL, *((void *)v8 + 2) + 1LL, 1, v8);
            }
            unint64_t v43 = *((void *)v8 + 2);
            unint64_t v42 = *((void *)v8 + 3);
            if (v43 >= v42 >> 1) {
              int v8 = sub_10005C9AC((char *)(v42 > 1), v43 + 1, 1, v8);
            }
            *((void *)v8 + 2) = v43 + 1;
            id v44 = &v8[16 * v43];
            *((void *)v44 + 4) = 0xD000000000000015LL;
            *((void *)v44 + 5) = 0x800000010008C460LL;
            if ((a1 & 0x1000) == 0)
            {
LABEL_74:
              if ((a1 & 0x2000) == 0) {
                goto LABEL_75;
              }
              goto LABEL_106;
            }
          }

          else if ((a1 & 0x1000) == 0)
          {
            goto LABEL_74;
          }

          if ((swift_isUniquelyReferenced_nonNull_native(v8) & 1) == 0) {
            int v8 = sub_10005C9AC(0LL, *((void *)v8 + 2) + 1LL, 1, v8);
          }
          unint64_t v46 = *((void *)v8 + 2);
          unint64_t v45 = *((void *)v8 + 3);
          if (v46 >= v45 >> 1) {
            int v8 = sub_10005C9AC((char *)(v45 > 1), v46 + 1, 1, v8);
          }
          *((void *)v8 + 2) = v46 + 1;
          uint64_t v47 = &v8[16 * v46];
          *((void *)v47 + 4) = 0x736B636F6C23LL;
          *((void *)v47 + 5) = 0xE600000000000000LL;
          if ((a1 & 0x2000) == 0)
          {
LABEL_75:
            if ((a1 & 0x4000) == 0) {
              goto LABEL_76;
            }
            goto LABEL_111;
          }

LABEL_106:
          if ((swift_isUniquelyReferenced_nonNull_native(v8) & 1) == 0) {
            int v8 = sub_10005C9AC(0LL, *((void *)v8 + 2) + 1LL, 1, v8);
          }
          unint64_t v49 = *((void *)v8 + 2);
          unint64_t v48 = *((void *)v8 + 3);
          if (v49 >= v48 >> 1) {
            int v8 = sub_10005C9AC((char *)(v48 > 1), v49 + 1, 1, v8);
          }
          *((void *)v8 + 2) = v49 + 1;
          uint64_t v50 = &v8[16 * v49];
          *((void *)v50 + 4) = 0x7365646F6D23LL;
          *((void *)v50 + 5) = 0xE600000000000000LL;
          if ((a1 & 0x4000) == 0)
          {
LABEL_76:
            if ((a1 & 0x8000) == 0) {
              goto LABEL_77;
            }
            goto LABEL_116;
          }

LABEL_111:
          if ((swift_isUniquelyReferenced_nonNull_native(v8) & 1) == 0) {
            int v8 = sub_10005C9AC(0LL, *((void *)v8 + 2) + 1LL, 1, v8);
          }
          unint64_t v52 = *((void *)v8 + 2);
          unint64_t v51 = *((void *)v8 + 3);
          if (v52 >= v51 >> 1) {
            int v8 = sub_10005C9AC((char *)(v51 > 1), v52 + 1, 1, v8);
          }
          *((void *)v8 + 2) = v52 + 1;
          unint64_t v53 = &v8[16 * v52];
          *((void *)v53 + 4) = 0x64616972796D23LL;
          *((void *)v53 + 5) = 0xE700000000000000LL;
          if ((a1 & 0x8000) == 0)
          {
LABEL_77:
            if ((a1 & 0x10000) == 0) {
              goto LABEL_78;
            }
            goto LABEL_121;
          }

LABEL_116:
          if ((swift_isUniquelyReferenced_nonNull_native(v8) & 1) == 0) {
            int v8 = sub_10005C9AC(0LL, *((void *)v8 + 2) + 1LL, 1, v8);
          }
          unint64_t v55 = *((void *)v8 + 2);
          unint64_t v54 = *((void *)v8 + 3);
          if (v55 >= v54 >> 1) {
            int v8 = sub_10005C9AC((char *)(v54 > 1), v55 + 1, 1, v8);
          }
          *((void *)v8 + 2) = v55 + 1;
          uint64_t v56 = &v8[16 * v55];
          *((void *)v56 + 4) = 0x5564616972796D23LL;
          *((void *)v56 + 5) = 0xE900000000000049LL;
          if ((a1 & 0x10000) == 0)
          {
LABEL_78:
            if ((a1 & 0x20000) == 0) {
              goto LABEL_79;
            }
            goto LABEL_126;
          }

LABEL_121:
          if ((swift_isUniquelyReferenced_nonNull_native(v8) & 1) == 0) {
            int v8 = sub_10005C9AC(0LL, *((void *)v8 + 2) + 1LL, 1, v8);
          }
          unint64_t v58 = *((void *)v8 + 2);
          unint64_t v57 = *((void *)v8 + 3);
          if (v58 >= v57 >> 1) {
            int v8 = sub_10005C9AC((char *)(v57 > 1), v58 + 1, 1, v8);
          }
          *((void *)v8 + 2) = v58 + 1;
          unint64_t v59 = &v8[16 * v58];
          *((void *)v59 + 4) = 0xD000000000000014LL;
          *((void *)v59 + 5) = 0x800000010008C440LL;
          if ((a1 & 0x20000) == 0)
          {
LABEL_79:
            if ((a1 & 0x40000) == 0) {
              goto LABEL_80;
            }
            goto LABEL_131;
          }

LABEL_126:
          if ((swift_isUniquelyReferenced_nonNull_native(v8) & 1) == 0) {
            int v8 = sub_10005C9AC(0LL, *((void *)v8 + 2) + 1LL, 1, v8);
          }
          unint64_t v61 = *((void *)v8 + 2);
          unint64_t v60 = *((void *)v8 + 3);
          if (v61 >= v60 >> 1) {
            int v8 = sub_10005C9AC((char *)(v60 > 1), v61 + 1, 1, v8);
          }
          *((void *)v8 + 2) = v61 + 1;
          unint64_t v62 = &v8[16 * v61];
          *((void *)v62 + 4) = 0x7973696F6E23LL;
          *((void *)v62 + 5) = 0xE600000000000000LL;
          if ((a1 & 0x40000) == 0)
          {
LABEL_80:
            if ((a1 & 0x80000) == 0) {
              goto LABEL_81;
            }
            goto LABEL_136;
          }

LABEL_131:
          if ((swift_isUniquelyReferenced_nonNull_native(v8) & 1) == 0) {
            int v8 = sub_10005C9AC(0LL, *((void *)v8 + 2) + 1LL, 1, v8);
          }
          unint64_t v64 = *((void *)v8 + 2);
          unint64_t v63 = *((void *)v8 + 3);
          if (v64 >= v63 >> 1) {
            int v8 = sub_10005C9AC((char *)(v63 > 1), v64 + 1, 1, v8);
          }
          *((void *)v8 + 2) = v64 + 1;
          unint64_t v65 = &v8[16 * v64];
          *((void *)v65 + 4) = 0xD000000000000011LL;
          *((void *)v65 + 5) = 0x800000010008C420LL;
          if ((a1 & 0x80000) == 0)
          {
LABEL_81:
            if ((a1 & 0x100000) == 0) {
              goto LABEL_82;
            }
            goto LABEL_141;
          }

LABEL_136:
          if ((swift_isUniquelyReferenced_nonNull_native(v8) & 1) == 0) {
            int v8 = sub_10005C9AC(0LL, *((void *)v8 + 2) + 1LL, 1, v8);
          }
          unint64_t v67 = *((void *)v8 + 2);
          unint64_t v66 = *((void *)v8 + 3);
          if (v67 >= v66 >> 1) {
            int v8 = sub_10005C9AC((char *)(v66 > 1), v67 + 1, 1, v8);
          }
          *((void *)v8 + 2) = v67 + 1;
          uint64_t v68 = &v8[16 * v67];
          *((void *)v68 + 4) = 0x7765695662724F23LL;
          *((void *)v68 + 5) = 0xE800000000000000LL;
          if ((a1 & 0x100000) == 0)
          {
LABEL_82:
            if ((a1 & 0x200000) == 0) {
              goto LABEL_83;
            }
            goto LABEL_146;
          }

LABEL_141:
          if ((swift_isUniquelyReferenced_nonNull_native(v8) & 1) == 0) {
            int v8 = sub_10005C9AC(0LL, *((void *)v8 + 2) + 1LL, 1, v8);
          }
          unint64_t v70 = *((void *)v8 + 2);
          unint64_t v69 = *((void *)v8 + 3);
          if (v70 >= v69 >> 1) {
            int v8 = sub_10005C9AC((char *)(v69 > 1), v70 + 1, 1, v8);
          }
          *((void *)v8 + 2) = v70 + 1;
          uint64_t v71 = &v8[16 * v70];
          strcpy(v71 + 32, "#presynthesize");
          v71[47] = -18;
          if ((a1 & 0x200000) == 0)
          {
LABEL_83:
            if ((a1 & 0x400000) == 0) {
              goto LABEL_84;
            }
            goto LABEL_151;
          }

LABEL_146:
          if ((swift_isUniquelyReferenced_nonNull_native(v8) & 1) == 0) {
            int v8 = sub_10005C9AC(0LL, *((void *)v8 + 2) + 1LL, 1, v8);
          }
          unint64_t v73 = *((void *)v8 + 2);
          unint64_t v72 = *((void *)v8 + 3);
          if (v73 >= v72 >> 1) {
            int v8 = sub_10005C9AC((char *)(v72 > 1), v73 + 1, 1, v8);
          }
          *((void *)v8 + 2) = v73 + 1;
          uint64_t v74 = &v8[16 * v73];
          strcpy(v74 + 32, "#sceneHosting");
          *((_WORD *)v74 + 23) = -4864;
          if ((a1 & 0x400000) == 0)
          {
LABEL_84:
            if ((a1 & 0x800000) == 0) {
              goto LABEL_85;
            }
            goto LABEL_156;
          }

LABEL_151:
          if ((swift_isUniquelyReferenced_nonNull_native(v8) & 1) == 0) {
            int v8 = sub_10005C9AC(0LL, *((void *)v8 + 2) + 1LL, 1, v8);
          }
          unint64_t v76 = *((void *)v8 + 2);
          unint64_t v75 = *((void *)v8 + 3);
          if (v76 >= v75 >> 1) {
            int v8 = sub_10005C9AC((char *)(v75 > 1), v76 + 1, 1, v8);
          }
          *((void *)v8 + 2) = v76 + 1;
          uint64_t v77 = &v8[16 * v76];
          *((void *)v77 + 4) = 0xD000000000000015LL;
          *((void *)v77 + 5) = 0x800000010008C400LL;
          if ((a1 & 0x800000) == 0)
          {
LABEL_85:
            if ((a1 & 0x1000000) == 0) {
              goto LABEL_86;
            }
            goto LABEL_161;
          }

LABEL_156:
          if ((swift_isUniquelyReferenced_nonNull_native(v8) & 1) == 0) {
            int v8 = sub_10005C9AC(0LL, *((void *)v8 + 2) + 1LL, 1, v8);
          }
          unint64_t v79 = *((void *)v8 + 2);
          unint64_t v78 = *((void *)v8 + 3);
          if (v79 >= v78 >> 1) {
            int v8 = sub_10005C9AC((char *)(v78 > 1), v79 + 1, 1, v8);
          }
          *((void *)v8 + 2) = v79 + 1;
          unint64_t v80 = &v8[16 * v79];
          *((void *)v80 + 4) = 0xD000000000000017LL;
          *((void *)v80 + 5) = 0x800000010008C3E0LL;
          if ((a1 & 0x1000000) == 0)
          {
LABEL_86:
            if ((a1 & 0x2000000) == 0) {
              goto LABEL_87;
            }
            goto LABEL_166;
          }

LABEL_161:
          if ((swift_isUniquelyReferenced_nonNull_native(v8) & 1) == 0) {
            int v8 = sub_10005C9AC(0LL, *((void *)v8 + 2) + 1LL, 1, v8);
          }
          unint64_t v82 = *((void *)v8 + 2);
          unint64_t v81 = *((void *)v8 + 3);
          if (v82 >= v81 >> 1) {
            int v8 = sub_10005C9AC((char *)(v81 > 1), v82 + 1, 1, v8);
          }
          *((void *)v8 + 2) = v82 + 1;
          NSString v83 = &v8[16 * v82];
          *((void *)v83 + 4) = 0x4449486972697323LL;
          *((void *)v83 + 5) = 0xE800000000000000LL;
          if ((a1 & 0x2000000) == 0)
          {
LABEL_87:
            if ((a1 & 0x4000000) == 0) {
              goto LABEL_88;
            }
            goto LABEL_171;
          }

LABEL_166:
          if ((swift_isUniquelyReferenced_nonNull_native(v8) & 1) == 0) {
            int v8 = sub_10005C9AC(0LL, *((void *)v8 + 2) + 1LL, 1, v8);
          }
          unint64_t v85 = *((void *)v8 + 2);
          unint64_t v84 = *((void *)v8 + 3);
          if (v85 >= v84 >> 1) {
            int v8 = sub_10005C9AC((char *)(v84 > 1), v85 + 1, 1, v8);
          }
          *((void *)v8 + 2) = v85 + 1;
          uint64_t v86 = &v8[16 * v85];
          *((void *)v86 + 4) = 0x74657070696E7323LL;
          *((void *)v86 + 5) = 0xEA00000000006975LL;
          if ((a1 & 0x4000000) == 0)
          {
LABEL_88:
            if ((a1 & 0x8000000) == 0) {
              goto LABEL_89;
            }
            goto LABEL_176;
          }

LABEL_171:
          if ((swift_isUniquelyReferenced_nonNull_native(v8) & 1) == 0) {
            int v8 = sub_10005C9AC(0LL, *((void *)v8 + 2) + 1LL, 1, v8);
          }
          unint64_t v88 = *((void *)v8 + 2);
          unint64_t v87 = *((void *)v8 + 3);
          if (v88 >= v87 >> 1) {
            int v8 = sub_10005C9AC((char *)(v87 > 1), v88 + 1, 1, v8);
          }
          *((void *)v8 + 2) = v88 + 1;
          uint64_t v89 = &v8[16 * v88];
          *((void *)v89 + 4) = 0x7263736E61727423LL;
          *((void *)v89 + 5) = 0xEB00000000747069LL;
          if ((a1 & 0x8000000) == 0)
          {
LABEL_89:
            if ((a1 & 0x10000000) == 0) {
              goto LABEL_90;
            }
            goto LABEL_181;
          }

LABEL_176:
          if ((swift_isUniquelyReferenced_nonNull_native(v8) & 1) == 0) {
            int v8 = sub_10005C9AC(0LL, *((void *)v8 + 2) + 1LL, 1, v8);
          }
          unint64_t v91 = *((void *)v8 + 2);
          unint64_t v90 = *((void *)v8 + 3);
          if (v91 >= v90 >> 1) {
            int v8 = sub_10005C9AC((char *)(v90 > 1), v91 + 1, 1, v8);
          }
          *((void *)v8 + 2) = v91 + 1;
          uint64_t v92 = &v8[16 * v91];
          *((void *)v92 + 4) = 1937011747LL;
          *((void *)v92 + 5) = 0xE400000000000000LL;
          if ((a1 & 0x10000000) == 0)
          {
LABEL_90:
            if ((a1 & 0x20000000) == 0) {
              goto LABEL_91;
            }
            goto LABEL_186;
          }

LABEL_181:
          if ((swift_isUniquelyReferenced_nonNull_native(v8) & 1) == 0) {
            int v8 = sub_10005C9AC(0LL, *((void *)v8 + 2) + 1LL, 1, v8);
          }
          unint64_t v94 = *((void *)v8 + 2);
          unint64_t v93 = *((void *)v8 + 3);
          if (v94 >= v93 >> 1) {
            int v8 = sub_10005C9AC((char *)(v93 > 1), v94 + 1, 1, v8);
          }
          *((void *)v8 + 2) = v94 + 1;
          uint64_t v95 = &v8[16 * v94];
          *((void *)v95 + 4) = 0x6972695343505823LL;
          *((void *)v95 + 5) = 0xEB00000000707041LL;
          if ((a1 & 0x20000000) == 0)
          {
LABEL_91:
            if ((a1 & 0x40000000) == 0) {
              goto LABEL_92;
            }
            goto LABEL_191;
          }

LABEL_186:
          if ((swift_isUniquelyReferenced_nonNull_native(v8) & 1) == 0) {
            int v8 = sub_10005C9AC(0LL, *((void *)v8 + 2) + 1LL, 1, v8);
          }
          unint64_t v97 = *((void *)v8 + 2);
          unint64_t v96 = *((void *)v8 + 3);
          if (v97 >= v96 >> 1) {
            int v8 = sub_10005C9AC((char *)(v96 > 1), v97 + 1, 1, v8);
          }
          *((void *)v8 + 2) = v97 + 1;
          Swift::String v98 = &v8[16 * v97];
          *((void *)v98 + 4) = 1819048483LL;
          *((void *)v98 + 5) = 0xE400000000000000LL;
          if ((a1 & 0x40000000) == 0)
          {
LABEL_92:
            if ((a1 & 0x80000000) == 0) {
              goto LABEL_93;
            }
            goto LABEL_196;
          }

LABEL_191:
          if ((swift_isUniquelyReferenced_nonNull_native(v8) & 1) == 0) {
            int v8 = sub_10005C9AC(0LL, *((void *)v8 + 2) + 1LL, 1, v8);
          }
          unint64_t v100 = *((void *)v8 + 2);
          unint64_t v99 = *((void *)v8 + 3);
          if (v100 >= v99 >> 1) {
            int v8 = sub_10005C9AC((char *)(v99 > 1), v100 + 1, 1, v8);
          }
          *((void *)v8 + 2) = v100 + 1;
          uint64_t v101 = &v8[16 * v100];
          *((void *)v101 + 4) = 0x416D657473797323LL;
          *((void *)v101 + 5) = 0xEF65727574726570LL;
          if ((a1 & 0x80000000) == 0)
          {
LABEL_93:
            if ((a1 & 0x100000000LL) == 0) {
              goto LABEL_94;
            }
            goto LABEL_201;
          }

LABEL_196:
          if ((swift_isUniquelyReferenced_nonNull_native(v8) & 1) == 0) {
            int v8 = sub_10005C9AC(0LL, *((void *)v8 + 2) + 1LL, 1, v8);
          }
          unint64_t v103 = *((void *)v8 + 2);
          unint64_t v102 = *((void *)v8 + 3);
          if (v103 >= v102 >> 1) {
            int v8 = sub_10005C9AC((char *)(v102 > 1), v103 + 1, 1, v8);
          }
          *((void *)v8 + 2) = v103 + 1;
          uint64_t v104 = &v8[16 * v103];
          *((void *)v104 + 4) = 0xD000000000000015LL;
          *((void *)v104 + 5) = 0x800000010008C3C0LL;
          if ((a1 & 0x100000000LL) == 0)
          {
LABEL_94:
            if (!*((void *)v8 + 2))
            {
              swift_bridgeObjectRelease(v8);
              return 0LL;
            }

LABEL_206:
            v117[0] = (uint64_t)v8;
            swift_bridgeObjectRetain(v8);
            sub_100068AB4(v117);
            swift_bridgeObjectRelease(v8);
            uint64_t v108 = v117[0];
            uint64_t v109 = sub_10004A8E8(&qword_1000D99A8);
            unint64_t v110 = sub_100068B1C();
            uint64_t v6 = BidirectionalCollection<>.joined(separator:)(32LL, 0xE100000000000000LL, v109, v110);
            uint64_t v112 = v111;
            swift_release(v108);
            swift_beginAccess(&off_1000D99A0, v117, 33LL, 0LL);
            swift_bridgeObjectRetain(v112);
            char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(off_1000D99A0);
            os_log_type_t v116 = off_1000D99A0;
            off_1000D99A0 = (_UNKNOWN *)0x8000000000000000LL;
            sub_100068730(v6, v112, a1, isUniquelyReferenced_nonNull_native);
            uint64_t v114 = off_1000D99A0;
            off_1000D99A0 = v116;
            swift_bridgeObjectRelease(v114);
            swift_endAccess(v117);
            return v6;
          }

LABEL_201:
          if ((swift_isUniquelyReferenced_nonNull_native(v8) & 1) == 0) {
            int v8 = sub_10005C9AC(0LL, *((void *)v8 + 2) + 1LL, 1, v8);
          }
          unint64_t v106 = *((void *)v8 + 2);
          unint64_t v105 = *((void *)v8 + 3);
          if (v106 >= v105 >> 1) {
            int v8 = sub_10005C9AC((char *)(v105 > 1), v106 + 1, 1, v8);
          }
          *((void *)v8 + 2) = v106 + 1;
          uint64_t v107 = &v8[16 * v106];
          *((void *)v107 + 4) = 0xD000000000000013LL;
          *((void *)v107 + 5) = 0x800000010008C3A0LL;
          goto LABEL_206;
        }

LABEL_67:
        if ((swift_isUniquelyReferenced_nonNull_native(v8) & 1) == 0) {
          int v8 = sub_10005C9AC(0LL, *((void *)v8 + 2) + 1LL, 1, v8);
        }
        unint64_t v40 = *((void *)v8 + 2);
        unint64_t v39 = *((void *)v8 + 3);
        if (v40 >= v39 >> 1) {
          int v8 = sub_10005C9AC((char *)(v39 > 1), v40 + 1, 1, v8);
        }
        *((void *)v8 + 2) = v40 + 1;
        id v41 = &v8[16 * v40];
        *((void *)v41 + 4) = 0x6D6954656C646923LL;
        *((void *)v41 + 5) = 0xEA00000000007265LL;
        goto LABEL_72;
      }
    }

    else
    {
      int v8 = (char *)_swiftEmptyArrayStorage;
      if ((a1 & 2) == 0) {
        goto LABEL_17;
      }
    }

    if ((swift_isUniquelyReferenced_nonNull_native(v8) & 1) == 0) {
      int v8 = sub_10005C9AC(0LL, *((void *)v8 + 2) + 1LL, 1, v8);
    }
    unint64_t v13 = *((void *)v8 + 2);
    unint64_t v12 = *((void *)v8 + 3);
    if (v13 >= v12 >> 1) {
      int v8 = sub_10005C9AC((char *)(v12 > 1), v13 + 1, 1, v8);
    }
    *((void *)v8 + 2) = v13 + 1;
    id v14 = &v8[16 * v13];
    strcpy(v14 + 32, "#autodismiss");
    v14[45] = 0;
    *((_WORD *)v14 + 23) = -5120;
    goto LABEL_17;
  }

  uint64_t v5 = (uint64_t *)(v2[7] + 16 * v3);
  uint64_t v6 = *v5;
  uint64_t v7 = v5[1];
  swift_endAccess(v117);
  swift_bridgeObjectRetain(v7);
  return v6;
}

void *sub_100067F44@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

Swift::Int sub_100067F50()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)(v3, 0LL);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_100067F94()
{
}

Swift::Int sub_100067FBC(uint64_t a1)
{
  Swift::UInt v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

void sub_100067FFC(void *a1@<X8>)
{
  *a1 = 0LL;
}

void *sub_100068004@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_100068018@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_10006802C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_100068040(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_100068070@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(_BYTE *)(a2 + _Block_object_dispose((const void *)(v9 - 80), 8) = v3 == 0;
  return result;
}

uint64_t *sub_10006809C@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(_BYTE *)(a2 + _Block_object_dispose((const void *)(v9 - 80), 8) = v5 == 0;
  return result;
}

void *sub_1000680C0(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_1000680D4(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_1000680E8(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_1000680FC@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_100068110(void *a1)
{
  return (*v1 & ~*a1) == 0LL;
}

BOOL sub_100068124(void *a1)
{
  return (*v1 & *a1) == 0LL;
}

BOOL sub_100068138(void *a1)
{
  return (*a1 & ~*v1) == 0LL;
}

BOOL sub_10006814C()
{
  return *v0 == 0LL;
}

uint64_t sub_10006815C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return SetAlgebra.init<A>(_:)(a1, a4, a2, a5, a3);
}

void *sub_100068174(void *result)
{
  *v1 &= ~*result;
  return result;
}

BOOL sub_100068188(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_10006819C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = sub_1000698BC(a1);
  uint64_t result = swift_bridgeObjectRelease(a1);
  *a2 = v4;
  return result;
}

void sub_1000681D8( os_log_type_t a1, Swift::UInt a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v27 = a3;
  unint64_t v28 = a4;
  swift_bridgeObjectRetain(a4);
  uint64_t v10 = sub_100066C6C(a2);
  if (v11)
  {
    uint64_t v12 = v11;
    unint64_t v25 = 0xE100000000000000LL;
    String.append(_:)(*(Swift::String *)&v10);
    swift_bridgeObjectRelease(v12);
    v13._countAndFlagsBits = 32LL;
    v13._object = (void *)0xE100000000000000LL;
    String.append(_:)(v13);
    swift_bridgeObjectRelease(0xE100000000000000LL);
  }

  if (a6)
  {
    uint64_t v14 = HIBYTE(a6) & 0xF;
    if ((a6 & 0x2000000000000000LL) == 0) {
      uint64_t v14 = a5 & 0xFFFFFFFFFFFFLL;
    }
    if (v14)
    {
      unint64_t v25 = 0xE100000000000000LL;
      v15._countAndFlagsBits = a5;
      v15._object = (void *)a6;
      String.append(_:)(v15);
      v16._countAndFlagsBits = 32LL;
      v16._object = (void *)0xE100000000000000LL;
      String.append(_:)(v16);
      swift_bridgeObjectRelease(0xE100000000000000LL);
    }
  }

  uint64_t v18 = v27;
  unint64_t v17 = v28;
  uint64_t v19 = swift_bridgeObjectRetain(v28);
  os_log_type_t v20 = a1;
  log = (os_log_s *)Logger.logObject.getter(v19);
  if (os_log_type_enabled(log, a1))
  {
    unint64_t v21 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v22 = swift_slowAlloc(32LL, -1LL);
    uint64_t v24 = v22;
    *(_DWORD *)unint64_t v21 = 136315138;
    swift_bridgeObjectRetain(v17);
    uint64_t v26 = sub_100057FC0(v18, v17, &v24);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v26, &v27, v21 + 4, v21 + 12);
    swift_bridgeObjectRelease_n(v17, 3LL);
    _os_log_impl((void *)&_mh_execute_header, log, v20, "%s", v21, 0xCu);
    swift_arrayDestroy(v22, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v22, -1LL, -1LL);
    swift_slowDealloc(v21, -1LL, -1LL);
  }

  else
  {
    swift_bridgeObjectRelease_n(v28, 2LL);
  }

unint64_t sub_1000683F4(Swift::UInt a1)
{
  Swift::Int v3 = Hasher._finalize()();
  return sub_10006886C(a1, v3);
}

Swift::Int sub_10006844C(uint64_t a1, uint64_t a2)
{
  Swift::Int v3 = v2;
  Swift::Int v5 = *v2;
  if (*(void *)(*v2 + 24) <= a1) {
    uint64_t v6 = a1;
  }
  else {
    uint64_t v6 = *(void *)(*v2 + 24);
  }
  sub_10004A8E8(&qword_1000D99B8);
  char v36 = a2;
  Swift::Int result = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  Swift::Int v8 = result;
  if (*(void *)(v5 + 16))
  {
    unint64_t v33 = v3;
    int64_t v9 = 0LL;
    uint64_t v35 = (void *)(v5 + 64);
    uint64_t v10 = 1LL << *(_BYTE *)(v5 + 32);
    if (v10 < 64) {
      uint64_t v11 = ~(-1LL << v10);
    }
    else {
      uint64_t v11 = -1LL;
    }
    unint64_t v12 = v11 & *(void *)(v5 + 64);
    int64_t v34 = (unint64_t)(v10 + 63) >> 6;
    Swift::Int v13 = result + 64;
    while (1)
    {
      if (v12)
      {
        unint64_t v19 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v20 = v19 | (v9 << 6);
      }

      else
      {
        int64_t v21 = v9 + 1;
        if (__OFADD__(v9, 1LL))
        {
LABEL_44:
          __break(1u);
LABEL_45:
          __break(1u);
          return result;
        }

        Swift::Int result = v5 + 64;
        if (v21 >= v34) {
          goto LABEL_36;
        }
        unint64_t v22 = v35[v21];
        ++v9;
        if (!v22)
        {
          int64_t v9 = v21 + 1;
          if (v21 + 1 >= v34) {
            goto LABEL_36;
          }
          unint64_t v22 = v35[v9];
          if (!v22)
          {
            int64_t v23 = v21 + 2;
            if (v23 >= v34)
            {
LABEL_36:
              if ((v36 & 1) == 0)
              {
                Swift::Int result = swift_release(v5);
                Swift::Int v3 = v33;
                goto LABEL_43;
              }

              uint64_t v32 = 1LL << *(_BYTE *)(v5 + 32);
              if (v32 >= 64) {
                bzero(v35, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
              }
              else {
                void *v35 = -1LL << v32;
              }
              Swift::Int v3 = v33;
              *(void *)(v5 + 16) = 0LL;
              break;
            }

            unint64_t v22 = v35[v23];
            if (!v22)
            {
              while (1)
              {
                int64_t v9 = v23 + 1;
                if (__OFADD__(v23, 1LL)) {
                  goto LABEL_45;
                }
                if (v9 >= v34) {
                  goto LABEL_36;
                }
                unint64_t v22 = v35[v9];
                ++v23;
                if (v22) {
                  goto LABEL_33;
                }
              }
            }

            int64_t v9 = v23;
          }
        }

LABEL_33:
        unint64_t v12 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v9 << 6);
      }

      Swift::UInt v28 = *(void *)(*(void *)(v5 + 48) + 8 * v20);
      id v29 = (uint64_t *)(*(void *)(v5 + 56) + 16 * v20);
      uint64_t v30 = *v29;
      uint64_t v31 = v29[1];
      if ((v36 & 1) == 0) {
        swift_bridgeObjectRetain(v31);
      }
      Hasher.init(_seed:)(v37, *(void *)(v8 + 40));
      Hasher._combine(_:)(v28);
      Swift::Int result = Hasher._finalize()();
      uint64_t v14 = -1LL << *(_BYTE *)(v8 + 32);
      unint64_t v15 = result & ~v14;
      unint64_t v16 = v15 >> 6;
      if (((-1LL << v15) & ~*(void *)(v13 + 8 * (v15 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1LL << v15) & ~*(void *)(v13 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0LL;
      }

      else
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_44;
          }

          BOOL v26 = v16 == v25;
          if (v16 == v25) {
            unint64_t v16 = 0LL;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v13 + 8 * v16);
        }

        while (v27 == -1);
        unint64_t v17 = __clz(__rbit64(~v27)) + (v16 << 6);
      }

      *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v17;
      *(void *)(*(void *)(v8 + 48) + 8 * v17) = v28;
      uint64_t v18 = (void *)(*(void *)(v8 + 56) + 16 * v17);
      void *v18 = v30;
      v18[1] = v31;
      ++*(void *)(v8 + 16);
    }
  }

  Swift::Int result = swift_release(v5);
LABEL_43:
  Swift::Int *v3 = v8;
  return result;
}

uint64_t sub_100068730(uint64_t a1, uint64_t a2, Swift::UInt a3, char a4)
{
  Swift::Int v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_1000683F4(a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t result = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }

  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= result && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= result && (a4 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_100068908();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      unint64_t v19 = (void *)(v18[7] + 16 * v12);
      uint64_t result = swift_bridgeObjectRelease(v19[1]);
      void *v19 = a1;
      v19[1] = a2;
      return result;
    }

unint64_t sub_10006886C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if (((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8LL)) >> result) & 1) != 0)
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(void *)(v7 + 8 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8LL)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(void *)(v7 + 8 * result) == a1) {
          break;
        }
      }
    }
  }

  return result;
}

void *sub_100068908()
{
  uint64_t v1 = v0;
  sub_10004A8E8(&qword_1000D99B8);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    unint64_t result = (void *)swift_release(v2);
    uint64_t *v1 = v4;
    return result;
  }

  unint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1LL << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  int64_t v9 = 0LL;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1LL << *(_BYTE *)(v2 + 32);
  uint64_t v11 = -1LL;
  if (v10 < 64) {
    uint64_t v11 = ~(-1LL << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }

    int64_t v23 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_28;
    }

    if (v23 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      int64_t v9 = v23 + 1;
      if (v23 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v6 + 8 * v9);
      if (!v24) {
        break;
      }
    }

Swift::Int sub_100068AB4(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native(*a1) & 1) == 0) {
    uint64_t v2 = sub_100069768(v2);
  }
  uint64_t v3 = *(void *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  Swift::Int result = sub_100068B68(v5);
  *a1 = v2;
  return result;
}

unint64_t sub_100068B1C()
{
  unint64_t result = qword_1000D99B0;
  if (!qword_1000D99B0)
  {
    uint64_t v1 = sub_10004D6C4(&qword_1000D99A8);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_1000D99B0);
  }

  return result;
}

Swift::Int sub_100068B68(uint64_t *a1)
{
  Swift::Int v3 = a1[1];
  Swift::Int result = _minimumMergeRunLength(_:)(v3);
  if (result >= v3)
  {
    if ((v3 & 0x8000000000000000LL) == 0)
    {
      if (v3) {
        return sub_100069250(0LL, v3, 1LL, a1);
      }
      return result;
    }

    goto LABEL_154;
  }

  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1)
  {
LABEL_162:
    Swift::Int result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Can't construct Array with count < 0",  36LL,  2LL,  "Swift/Array.swift",  17LL,  2,  936LL,  0);
    __break(1u);
    return result;
  }

  Swift::Int v105 = result;
  unint64_t v102 = a1;
  if (v3 < 2)
  {
    uint64_t v8 = &_swiftEmptyArrayStorage;
    __dst = (char *)&_swiftEmptyArrayStorage + 32;
    if (v3 != 1)
    {
      unint64_t v12 = *((void *)&_swiftEmptyArrayStorage + 2);
      uint64_t v11 = (char *)&_swiftEmptyArrayStorage;
LABEL_120:
      uint64_t v95 = v11;
      uint64_t v104 = v8;
      if (v12 < 2) {
        goto LABEL_117;
      }
      uint64_t v96 = *v102;
      while (1)
      {
        unint64_t v97 = v12 - 2;
        if (v12 < 2) {
          goto LABEL_149;
        }
        if (!v96) {
          goto LABEL_161;
        }
        unint64_t v94 = v95;
        uint64_t v98 = *(void *)&v95[16 * v97 + 32];
        uint64_t v99 = *(void *)&v95[16 * v12 + 24];
        sub_10006931C( (char *)(v96 + 16 * v98),  (char *)(v96 + 16LL * *(void *)&v95[16 * v12 + 16]),  v96 + 16 * v99,  __dst);
        if (v1) {
          goto LABEL_116;
        }
        if (v99 < v98) {
          goto LABEL_150;
        }
        if ((swift_isUniquelyReferenced_nonNull_native(v94) & 1) == 0) {
          unint64_t v94 = sub_100069754((uint64_t)v94);
        }
        if (v97 >= *((void *)v94 + 2)) {
          goto LABEL_151;
        }
        unint64_t v100 = &v94[16 * v97 + 32];
        *(void *)unint64_t v100 = v98;
        *((void *)v100 + 1) = v99;
        unint64_t v101 = *((void *)v94 + 2);
        if (v12 > v101) {
          goto LABEL_152;
        }
        memmove(&v94[16 * v12 + 16], &v94[16 * v12 + 32], 16 * (v101 - v12));
        uint64_t v95 = v94;
        *((void *)v94 + 2) = v101 - 1;
        unint64_t v12 = v101 - 1;
        if (v101 <= 2) {
          goto LABEL_117;
        }
      }
    }

    uint64_t v104 = &_swiftEmptyArrayStorage;
  }

  else
  {
    uint64_t v6 = v5 >> 1;
    uint64_t v7 = static Array._allocateBufferUninitialized(minimumCapacity:)(v5 >> 1, &type metadata for String);
    *(void *)(v7 + 16) = v6;
    uint64_t v104 = (void *)v7;
    __dst = (char *)(v7 + 32);
  }

  Swift::Int v9 = 0LL;
  uint64_t v10 = *a1;
  uint64_t v103 = v10 + 8;
  uint64_t v11 = (char *)&_swiftEmptyArrayStorage;
  Swift::Int v106 = v3;
  while (1)
  {
    Swift::Int v13 = v9++;
    if (v9 >= v3) {
      goto LABEL_46;
    }
    unint64_t v14 = (uint64_t *)(v10 + 16 * v9);
    uint64_t v15 = *v14;
    uint64_t v16 = v14[1];
    uint64_t v17 = (void *)(v10 + 16 * v13);
    if (v15 == *v17 && v16 == v17[1])
    {
      Swift::Int v20 = v13 + 2;
      if (v13 + 2 >= v3) {
        goto LABEL_45;
      }
      int v19 = 0;
    }

    else
    {
      int v19 = _stringCompareWithSmolCheck(_:_:expecting:)();
      Swift::Int v20 = v13 + 2;
      if (v13 + 2 >= v3) {
        goto LABEL_36;
      }
    }

    uint64_t v21 = (void *)(v103 + 16 * v20);
    do
    {
      int64_t v23 = (void *)(v10 + 16 * v9);
      if (*(v21 - 1) == *v23 && *v21 == v23[1])
      {
        if ((v19 & 1) != 0) {
          goto LABEL_37;
        }
      }

      else if (((v19 ^ _stringCompareWithSmolCheck(_:_:expecting:)()) & 1) != 0)
      {
        goto LABEL_36;
      }

      v21 += 2;
      Swift::Int v22 = v20 + 1;
      Swift::Int v9 = v20;
      Swift::Int v20 = v22;
    }

    while (v22 < v3);
    Swift::Int v20 = v22;
LABEL_36:
    Swift::Int v9 = v20;
    if ((v19 & 1) != 0)
    {
LABEL_37:
      if (v20 < v13) {
        goto LABEL_157;
      }
      if (v13 < v20)
      {
        uint64_t v25 = 16 * v20;
        uint64_t v26 = 16 * v13;
        Swift::Int v27 = v20;
        Swift::Int v28 = v13;
        do
        {
          if (v28 != --v27)
          {
            if (!v10) {
              goto LABEL_160;
            }
            uint64_t v29 = v10 + v25;
            uint64_t v30 = *(void *)(v10 + v26);
            uint64_t v31 = *(void *)(v10 + v26 + 8);
            *(_OWORD *)(v10 + v26) = *(_OWORD *)(v10 + v25 - 16);
            *(void *)(v29 - 16) = v30;
            *(void *)(v29 - _Block_object_dispose((const void *)(v9 - 80), 8) = v31;
          }

          ++v28;
          v25 -= 16LL;
          v26 += 16LL;
        }

        while (v28 < v27);
      }

LABEL_45:
      Swift::Int v9 = v20;
    }

LABEL_99:
    if ((v67 & 1) != 0) {
      goto LABEL_141;
    }
    unint64_t v75 = &v42[16 * v44];
    uint64_t v77 = *(void *)v75;
    uint64_t v76 = *((void *)v75 + 1);
    BOOL v55 = __OFSUB__(v76, v77);
    uint64_t v78 = v76 - v77;
    if (v55) {
      goto LABEL_144;
    }
    if (v78 < v66) {
      goto LABEL_15;
    }
LABEL_107:
    unint64_t v83 = v44 - 1;
    if (v44 - 1 >= v12)
    {
      __break(1u);
LABEL_134:
      __break(1u);
LABEL_135:
      __break(1u);
LABEL_136:
      __break(1u);
LABEL_137:
      __break(1u);
LABEL_138:
      __break(1u);
LABEL_139:
      __break(1u);
LABEL_140:
      __break(1u);
LABEL_141:
      __break(1u);
LABEL_142:
      __break(1u);
LABEL_143:
      __break(1u);
LABEL_144:
      __break(1u);
LABEL_145:
      __break(1u);
LABEL_146:
      __break(1u);
LABEL_147:
      __break(1u);
      goto LABEL_148;
    }

    uint64_t v84 = v10;
    if (!v10) {
      goto LABEL_159;
    }
    unint64_t v85 = v11;
    uint64_t v86 = &v42[16 * v83];
    uint64_t v87 = *(void *)v86;
    unint64_t v88 = v42;
    unint64_t v89 = v44;
    unint64_t v90 = &v42[16 * v44];
    uint64_t v91 = *((void *)v90 + 1);
    uint64_t v92 = v84;
    sub_10006931C((char *)(v84 + 16LL * *(void *)v86), (char *)(v84 + 16LL * *(void *)v90), v84 + 16 * v91, __dst);
    if (v1) {
      break;
    }
    if (v91 < v87) {
      goto LABEL_134;
    }
    if (v89 > *((void *)v85 + 2)) {
      goto LABEL_135;
    }
    *(void *)uint64_t v86 = v87;
    *(void *)&v88[16 * v83 + 8] = v91;
    unint64_t v93 = *((void *)v85 + 2);
    if (v89 >= v93) {
      goto LABEL_136;
    }
    uint64_t v11 = v85;
    unint64_t v12 = v93 - 1;
    memmove(v90, v90 + 16, 16 * (v93 - 1 - v89));
    unint64_t v42 = v88;
    *((void *)v85 + 2) = v93 - 1;
    uint64_t v10 = v92;
    Swift::Int v9 = v107;
    if (v93 <= 2) {
      goto LABEL_15;
    }
  }

  unint64_t v94 = v85;
LABEL_116:
  uint64_t v95 = v94;
LABEL_117:
  swift_bridgeObjectRelease(v95);
  *((void *)v104 + 2) = 0LL;
  return swift_bridgeObjectRelease(v104);
}

uint64_t sub_100069250(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v6 = result;
    uint64_t v7 = *a4;
    uint64_t v8 = *a4 + 16 * a3;
LABEL_5:
    Swift::Int v9 = (uint64_t *)(v7 + 16 * v4);
    Swift::Int result = *v9;
    uint64_t v10 = v9[1];
    uint64_t v11 = v6;
    unint64_t v12 = (uint64_t *)v8;
    while (1)
    {
      BOOL v13 = result == *(v12 - 2) && v10 == *(v12 - 1);
      if (v13 || (Swift::Int result = _stringCompareWithSmolCheck(_:_:expecting:)(), (result & 1) == 0))
      {
LABEL_4:
        ++v4;
        v8 += 16LL;
        if (v4 == a2) {
          return result;
        }
        goto LABEL_5;
      }

      if (!v7) {
        break;
      }
      Swift::Int result = *v12;
      uint64_t v10 = v12[1];
      *(_OWORD *)unint64_t v12 = *((_OWORD *)v12 - 1);
      *(v12 - 1) = v10;
      *(v12 - 2) = result;
      v12 -= 2;
      if (v4 == ++v11) {
        goto LABEL_4;
      }
    }

    __break(1u);
  }

  return result;
}

uint64_t sub_10006931C(char *__src, char *a2, unint64_t a3, char *__dst)
{
  uint64_t v4 = __dst;
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = a2 - __src;
  int64_t v9 = a2 - __src + 15;
  if (a2 - __src >= 0) {
    int64_t v9 = a2 - __src;
  }
  uint64_t v10 = v9 >> 4;
  uint64_t v11 = a3 - (void)a2;
  uint64_t v12 = a3 - (void)a2 + 15;
  uint64_t v13 = v12 >> 4;
  Swift::Int v27 = __src;
  uint64_t v26 = __dst;
  if (v10 >= v12 >> 4)
  {
    if (v11 >= -15)
    {
      if (__dst != a2 || &a2[16 * v13] <= __dst) {
        memmove(__dst, a2, 16 * v13);
      }
      uint64_t v17 = &v4[16 * v13];
      uint64_t v25 = v17;
      Swift::Int v27 = v6;
      if (v7 < v6 && v11 >= 16)
      {
        uint64_t v18 = (char *)(a3 - 16);
        int v19 = v6;
        while (1)
        {
          Swift::Int v20 = v18 + 16;
          uint64_t v21 = *((void *)v19 - 2);
          uint64_t v22 = *((void *)v19 - 1);
          v19 -= 16;
          BOOL v23 = *((void *)v17 - 2) == v21 && *((void *)v17 - 1) == v22;
          if (v23 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
          {
            uint64_t v25 = v17 - 16;
            if (v20 < v17 || v18 >= v17 || v20 != v17) {
              *(_OWORD *)uint64_t v18 = *((_OWORD *)v17 - 1);
            }
            int v19 = v6;
            v17 -= 16;
            if (v6 <= v7) {
              goto LABEL_50;
            }
          }

          else
          {
            if (v20 != v6 || v18 >= v6) {
              *(_OWORD *)uint64_t v18 = *(_OWORD *)v19;
            }
            Swift::Int v27 = v19;
            if (v19 <= v7) {
              goto LABEL_50;
            }
          }

          v18 -= 16;
          uint64_t v6 = v19;
          if (v17 <= v4) {
            goto LABEL_50;
          }
        }
      }

      goto LABEL_50;
    }
  }

  else if (v8 >= -15)
  {
    if (__dst != __src || &__src[16 * v10] <= __dst) {
      memmove(__dst, __src, 16 * v10);
    }
    unint64_t v14 = &v4[16 * v10];
    uint64_t v25 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 16)
    {
      do
      {
        BOOL v15 = *(void *)v6 == *(void *)v4 && *((void *)v6 + 1) == *((void *)v4 + 1);
        if (v15 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
        {
          if (v7 != v4) {
            *(_OWORD *)uint64_t v7 = *(_OWORD *)v4;
          }
          v4 += 16;
          uint64_t v26 = v4;
          uint64_t v16 = v6;
        }

        else
        {
          uint64_t v16 = v6 + 16;
          if (v7 < v6 || v7 >= v16 || v7 != v6) {
            *(_OWORD *)uint64_t v7 = *(_OWORD *)v6;
          }
        }

        v7 += 16;
        if (v4 >= v14) {
          break;
        }
        uint64_t v6 = v16;
      }

      while ((unint64_t)v16 < a3);
      Swift::Int v27 = v7;
    }

LABEL_50:
    sub_1000696AC((void **)&v27, (const void **)&v26, &v25);
    return 1LL;
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.moveInitialize with negative count",  55LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1046LL,  0);
  __break(1u);
  return result;
}

char *sub_1000695B4(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        return result;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_10004A8E8(&qword_1000D99C0);
    uint64_t v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7LL);
    int64_t v12 = j__malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 17;
    }
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * (v13 >> 4);
  }

  else
  {
    uint64_t v11 = (char *)&_swiftEmptyArrayStorage;
  }

  unint64_t v14 = v11 + 32;
  BOOL v15 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v8]) {
      memmove(v14, v15, 16 * v8);
    }
    *((void *)a4 + 2) = 0LL;
  }

  else
  {
    memcpy(v14, v15, 16 * v8);
  }

  swift_bridgeObjectRelease(a4);
  return v11;
}

char *sub_1000696AC(void **a1, const void **a2, void *a3)
{
  Swift::Int v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 15;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -16)
  {
    char v9 = 2;
    uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.moveInitialize with negative count",  55LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  v9,  1046LL,  0);
    __break(1u);
  }

  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 4;
    if (result != v3 || result >= &v3[16 * v7]) {
      return (char *)memmove(result, v3, 16 * v7);
    }
  }

  return result;
}

char *sub_100069754(uint64_t a1)
{
  return sub_1000695B4(0LL, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_100069768(uint64_t a1)
{
  return sub_1000520A0(0, *(void *)(a1 + 16), 0, (char *)a1);
}

ValueMetadata *type metadata accessor for Log()
{
  return &type metadata for Log;
}

ValueMetadata *type metadata accessor for Log.LogType()
{
  return &type metadata for Log.LogType;
}

unint64_t sub_1000697A0()
{
  unint64_t result = qword_1000D99C8;
  if (!qword_1000D99C8)
  {
    unint64_t result = swift_getWitnessTable(&unk_100083554, &type metadata for Log.LogType);
    atomic_store(result, (unint64_t *)&qword_1000D99C8);
  }

  return result;
}

unint64_t sub_1000697E8()
{
  unint64_t result = qword_1000D99D0;
  if (!qword_1000D99D0)
  {
    unint64_t result = swift_getWitnessTable(&unk_100083524, &type metadata for Log.LogType);
    atomic_store(result, (unint64_t *)&qword_1000D99D0);
  }

  return result;
}

unint64_t sub_100069830()
{
  unint64_t result = qword_1000D99D8;
  if (!qword_1000D99D8)
  {
    unint64_t result = swift_getWitnessTable(&unk_10008357C, &type metadata for Log.LogType);
    atomic_store(result, (unint64_t *)&qword_1000D99D8);
  }

  return result;
}

unint64_t sub_100069878()
{
  unint64_t result = qword_1000D99E0;
  if (!qword_1000D99E0)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000835B4, &type metadata for Log.LogType);
    atomic_store(result, (unint64_t *)&qword_1000D99E0);
  }

  return result;
}

uint64_t sub_1000698BC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0LL;
  }
  uint64_t result = 0LL;
  uint64_t v4 = (uint64_t *)(a1 + 32);
  do
  {
    uint64_t v6 = *v4++;
    uint64_t v5 = v6;
    if ((v6 & ~result) == 0) {
      uint64_t v5 = 0LL;
    }
    result |= v5;
    --v1;
  }

  while (v1);
  return result;
}

uint64_t type metadata accessor for SRCarPlaySiriUnavailableViewController(uint64_t a1)
{
  uint64_t result = qword_1000D99E8;
  if (!qword_1000D99E8) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for SRCarPlaySiriUnavailableViewController);
  }
  return result;
}

uint64_t sub_100069934(uint64_t a1)
{
  return swift_initClassMetadata2(a1, 0LL, 0LL, v2, a1 + qword_1000DA5F0);
}

void sub_100069970()
{
}

void sub_1000699C8()
{
}

void sub_1000699F4()
{
}

id sub_100069A20()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SRCarPlaySiriUnavailableViewController(0LL);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100069A54()
{
  return type metadata accessor for SRCarPlaySiriUnavailableViewController(0LL);
}

uint64_t getEnumTagSinglePayload for SiriUIFeaturesFlags(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  else {
    int v2 = 2;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

uint64_t storeEnumTagSinglePayload for SiriUIFeaturesFlags(uint64_t a1, int a2, int a3)
{
  else {
    int v3 = 2;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2) {
    return ((uint64_t (*)(void))((char *)sub_100069AF0 + 4 * byte_100083750[v4]))();
  }
  else {
    return ((uint64_t (*)(void))((char *)sub_100069B10 + 4 * byte_100083755[v4]))();
  }
}

_BYTE *sub_100069AF0(_BYTE *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

_BYTE *sub_100069B10(_BYTE *result)
{
  *uint64_t result = 0;
  return result;
}

_DWORD *sub_100069B18(_DWORD *result, int a2)
{
  *uint64_t result = a2;
  return result;
}

_WORD *sub_100069B20(_WORD *result, __int16 a2)
{
  *uint64_t result = a2;
  return result;
}

_WORD *sub_100069B28(_WORD *result)
{
  *uint64_t result = 0;
  return result;
}

_DWORD *sub_100069B30(_DWORD *result)
{
  *uint64_t result = 0;
  return result;
}

ValueMetadata *type metadata accessor for SiriUIFeaturesFlags()
{
  return &type metadata for SiriUIFeaturesFlags;
}

unint64_t sub_100069B50()
{
  unint64_t result = qword_1000D9A38;
  if (!qword_1000D9A38)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000837B4, &type metadata for SiriUIFeaturesFlags);
    atomic_store(result, (unint64_t *)&qword_1000D9A38);
  }

  return result;
}

Swift::Int sub_100069B94()
{
  return Hasher._finalize()();
}

void sub_100069BD4()
{
}

Swift::Int sub_100069BF8(uint64_t a1)
{
  return Hasher._finalize()();
}

const char *sub_100069C34()
{
  return "ResponseFramework";
}

const char *sub_100069C48()
{
  return "SMART";
}

uint64_t sub_100069C5C()
{
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(&OBJC_CLASS____TtC4SiriP33_315436D0A63DAE5398BB62B9697643F819ResourceBundleClass);
}

void sub_100069C8C(uint64_t a1, os_log_s *a2)
{
  int v2 = 136315394;
  int v3 = "+[SRErrorUtility userStringForError:reflectionDialogWasPlayed:]";
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "%s #errorHandling received unhandled error: %{public}@",  (uint8_t *)&v2,  0x16u);
}

void sub_100069D14(os_log_s *a1, uint64_t a2, uint64_t a3)
{
  int v3 = 136315394;
  __int16 v4 = "+[SRAssetsUtilities setupBackgroundAssetCheck]";
  __int16 v5 = 2112;
  uint64_t v6 = @"com.apple.siri.CheckAssetStatus";
  sub_100006C90( (void *)&_mh_execute_header,  a1,  a3,  "%s Failed to register background task with identifier %@",  (uint8_t *)&v3);
}

void sub_100069DA0(void *a1, void *a2)
{
  int v3 = a1;
  __int16 v4 = (void *)objc_claimAutoreleasedReturnValue([a2 localizedDescription]);
  int v6 = 136315394;
  uint64_t v7 = "+[SRAssetsUtilities _scheduleAssetCheckWithEarliestBeginDate:]";
  __int16 v8 = 2112;
  char v9 = v4;
  sub_100006C90((void *)&_mh_execute_header, v3, v5, "%s Failed to submit background task request: %@", (uint8_t *)&v6);
}

void sub_100069E50(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "-[SRBarSlideNavigationTransitionController configureWithNavigationController:]";
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "%s Navigation controller should be SiriUINavigationController",  (uint8_t *)&v1,  0xCu);
}

void sub_100069ED0(uint64_t a1, os_log_s *a2)
{
  int v2 = 136315394;
  int v3 = "-[SRGuideViewController collectionView:numberOfItemsInSection:]";
  __int16 v4 = 2050;
  uint64_t v5 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "%s More than three sections in Guide is invalid: %{public}ld",  (uint8_t *)&v2,  0x16u);
}

void sub_100069F58(void *a1)
{
  id v2 = a1;
  sub_10000DA1C();
  sub_10000DA08();
  sub_10000D9E8( (void *)&_mh_execute_header,  v3,  v4,  "%s #tipKitSignalEmitter Unsupported requestSource: %ld",  v5,  v6,  v7,  v8,  2u);

  sub_10000D9FC();
}

void sub_100069FD8(void *a1)
{
  id v2 = a1;
  sub_10000DA1C();
  sub_10000DA08();
  sub_10000D9E8( (void *)&_mh_execute_header,  v3,  v4,  "%s #tipKitSignalEmitter Unsupported bluetooth car requestSource: %ld",  v5,  v6,  v7,  v8,  2u);

  sub_10000D9FC();
}

uint64_t sub_10006A058()
{
  uint64_t v0 = dlerror();
  int v1 = (os_log_s *)abort_report_np("%s", v0);
  return sub_10006A078(v1);
}

void sub_10006A078(os_log_t log)
{
  int v1 = 136315138;
  id v2 = "-[SRUserUtteranceViewController speechAlternativeHighlightListWithScore:]";
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "%s No utterance text existed for base utterance!!",  (uint8_t *)&v1,  0xCu);
}

void sub_10006A0F8(uint64_t a1, os_log_s *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "-[SRModeProvider internalModeOverride]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "%s #modes Invalid mode override value: %@",  (uint8_t *)&v2,  0x16u);
}

void sub_10006A180()
{
  v2[0] = 136315394;
  sub_100014A48();
  sub_100014A5C( (void *)&_mh_execute_header,  v0,  v1,  "%s Unexpectedly passed a notification that is not a known keyboard notification. Returning _SRKeyboardNotificationOr derBefore. { notification: %@ }",  (uint8_t *)v2);
}

void sub_10006A1F4(void *a1, void *a2)
{
  uint64_t v3 = a1;
  __int16 v4 = (void *)objc_claimAutoreleasedReturnValue([a2 name]);
  v6[0] = 136315394;
  sub_100014A48();
  sub_100014A5C( (void *)&_mh_execute_header,  v3,  v5,  "%s Notification not supported; returning nil { notificationName: %@ }",
    (uint8_t *)v6);

  sub_10000D9FC();
}

void sub_10006A290(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "-[SRCompactKeyboardAnimation initWithKeyboardNotification:]";
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "%s Returning nil because the duration in the notification is 0, so there is no animation occurring",  (uint8_t *)&v1,  0xCu);
}

void sub_10006A310(void *a1, void *a2)
{
  uint64_t v3 = a1;
  __int16 v4 = (void *)objc_claimAutoreleasedReturnValue([a2 name]);
  v6[0] = 136315394;
  sub_100014A48();
  sub_100014A5C( (void *)&_mh_execute_header,  v3,  v5,  "%s Notification not supported; returning nil { notificationName: %@ }",
    (uint8_t *)v6);

  sub_10000D9FC();
}

void sub_10006A3AC(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 136315650;
  __int16 v4 = "-[SRFullScreenEffects _fullscreenEffectMap]_block_invoke";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "%s Couldn't enumerate %@: %@",  (uint8_t *)&v3,  0x20u);
}

void sub_10006A440( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10006A4B0()
{
  int v3 = 136315650;
  __int16 v4 = "-[SRSiriViewController _connectionWasInterrupted]";
  __int16 v5 = 1024;
  int v6 = v0;
  __int16 v7 = 2112;
  uint64_t v8 = v1;
  _os_log_error_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_ERROR,  "%s #xpcSiriApp Connection from SpringBoard/CarPlay was interrupted pid=%d _connection=%@",  (uint8_t *)&v3,  0x1Cu);
  sub_100031F54();
}

void sub_10006A544(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  int v3 = 136315650;
  __int16 v4 = "-[SRSiriViewController _removePreviousConversationFromStore]_block_invoke";
  __int16 v5 = 2114;
  uint64_t v6 = AFUIPreviousConversationIdentifier;
  __int16 v7 = 2114;
  uint64_t v8 = a1;
  sub_100031F0C( (void *)&_mh_execute_header,  a2,  a3,  "%s Unable to remove conversation (identifier=%{public}@) from store: %{public}@",  (uint8_t *)&v3);
  sub_100031F54();
}

void sub_10006A5D4()
{
  v1[0] = 136315650;
  sub_100031F90();
  sub_100031F0C( (void *)&_mh_execute_header,  v0,  (uint64_t)v0,  "%s #conversation Unable to save conversation to store { conversation: %@, error: %{public}@ }",  (uint8_t *)v1);
  sub_100031F54();
}

void sub_10006A64C(uint64_t *a1, os_log_s *a2, uint64_t a3)
{
  uint64_t v3 = *a1;
  int v4 = 136315650;
  __int16 v5 = "-[SRSiriViewController _restorePreviousConversation]_block_invoke_2";
  __int16 v6 = 2114;
  uint64_t v7 = AFUIPreviousConversationIdentifier;
  __int16 v8 = 2114;
  uint64_t v9 = v3;
  sub_100031F0C( (void *)&_mh_execute_header,  a2,  a3,  "%s #conversation Unable to load previous conversation from store { identifier: %{public}@, error: %{public}@ }",  (uint8_t *)&v4);
  sub_100031F54();
}

void sub_10006A6E0(uint64_t a1, os_log_s *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  int v5 = 136315650;
  __int16 v6 = "-[SRSiriViewController _restorePreviousConversation]_block_invoke";
  __int16 v7 = 2112;
  uint64_t v8 = v3;
  __int16 v9 = 2114;
  uint64_t v10 = v4;
  sub_100031F0C( (void *)&_mh_execute_header,  a2,  a3,  "%s #conversation Unable to remove conversation with mismatched language from store { conversation: %@, error: %{public}@",  (uint8_t *)&v5);
  sub_100031F54();
}

void sub_10006A76C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10006A7DC(uint64_t a1, void *a2, uint64_t a3)
{
  double v5 = *(double *)(a1 + 144);
  id v6 = a2;
  id v7 = [(id)sub_100031FE4() numberWithDouble:v5];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  __int16 v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", *(double *)(a3 + 40)));
  sub_100031F38();
  sub_100031FBC((void *)&_mh_execute_header, v10, v11, "%s Type2Siri: keyboard height %@=>%@", v12, v13, v14, v15, 2u);
}

void sub_10006A8B8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10006A928()
{
}

void sub_10006A994(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = a1;
  uint64_t v6 = sub_100031FE4();
  uint64_t v7 = SiriSharedUIGestureEventDescription(v6);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = SiriSharedUIGestureEventRegionDescription(a3);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  sub_100031F38();
  sub_100031FBC( (void *)&_mh_execute_header,  v11,  v12,  "%s #dismissal SpringBoard has notified us of gesture event %@, in region %@",  v13,  v14,  v15,  v16,  2u);

  sub_100031F28();
}

void sub_10006AA40( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10006AAB0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10006AB2C()
{
}

void sub_10006AB9C()
{
}

void sub_10006AC08()
{
}

void sub_10006AC74( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10006ACE4(void *a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a2 turnIdentifier]);
  v5[0] = 136315394;
  sub_100014A48();
  _os_log_error_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "%s #instrumentation unable to link previous turn with new turn: %@ as previousTurnIdentifier is nil.",  (uint8_t *)v5,  0x16u);

  sub_100031F54();
}

void sub_10006AD8C(void *a1, os_log_s *a2)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([a1 aceId]);
  id v5 = (id)objc_claimAutoreleasedReturnValue([a1 refId]);
  int v7 = 136315650;
  uint64_t v8 = "-[SRSiriViewController siriSessionDidReceiveAddViewsCommand:completion:]";
  __int16 v9 = 2112;
  id v10 = v4;
  __int16 v11 = 2112;
  id v12 = v5;
  sub_100031F0C( (void *)&_mh_execute_header,  a2,  v6,  "%s Received an empty SAUIAddViews aceID:%@ refID:%@. Marking command as SACommandSucceeded",  (uint8_t *)&v7);

  sub_100031F28();
}

void sub_10006AE5C(void *a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a2 = 136315394;
  *(void *)(a2 + 4) = "-[SRSiriViewController _configuredSpeakableUtteranceParserForCommand:context:speakableText:subCo"
                        "mpletion:speakPreparation:speakCompletion:]";
  *(_WORD *)(a2 + 12) = 2112;
  *(void *)(a2 + swift_unknownObjectWeakDestroy(v0 + 14) = a1;
  id v5 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a3,  OS_LOG_TYPE_ERROR,  "%s context is not of expected type AceObject, but is %@",  (uint8_t *)a2,  0x16u);
}

void sub_10006AED8(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = (id *)(a1 + 40);
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  v10[0] = 136315906;
  sub_100031FD0();
  __int16 v11 = 2112;
  uint64_t v12 = v7;
  __int16 v13 = v8;
  uint64_t v14 = a3;
  sub_100031FB0( (void *)&_mh_execute_header,  v5,  v9,  "%s %{public}@ unable to obtain bulletin with identifier %@ from the host: %{public}@",  (uint8_t *)v10);

  sub_100031F70();
}

void sub_10006AF94()
{
}

void sub_10006B004(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (id *)sub_100031FE4();
  id WeakRetained = objc_loadWeakRetained(v4);
  v8[0] = 136315650;
  sub_100031FD0();
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  sub_100031F0C( (void *)&_mh_execute_header,  v2,  v7,  "%s %{public}@ found bulletin with identifier %@ in preparationCompletion block",  (uint8_t *)v8);

  sub_100031F28();
}

void sub_10006B0B0(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = (os_log_s *)sub_100031FF0(a2, __stack_chk_guard);
  uint64_t Name = SRUIFSpeechSynthesisResultGetName(a3);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(Name);
  int v9 = 136315906;
  uint64_t v10 = "-[SRSiriViewController _configuredSpeakableUtteranceParserForCommand:context:speakableText:subCompletion:speakPr"
        "eparation:speakCompletion:]_block_invoke";
  __int16 v11 = 2112;
  uint64_t v12 = v3;
  sub_10003201C();
  sub_100031FB0( (void *)&_mh_execute_header,  v5,  v8,  "%s #tts SRUIFSpeechSynthesisCompletion error strongSelf=nil text=%@ result=%@ command=%@",  (uint8_t *)&v9);

  sub_100031F70();
}

void sub_10006B164(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = (os_log_s *)sub_100031FF0(a2, __stack_chk_guard);
  uint64_t Name = SRUIFSpeechSynthesisResultGetName(a3);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(Name);
  int v9 = 136315907;
  uint64_t v10 = "-[SRSiriViewController _configuredSpeakableUtteranceParserForCommand:context:speakableText:subCompletion:speakPr"
        "eparation:speakCompletion:]_block_invoke";
  __int16 v11 = 2117;
  uint64_t v12 = v3;
  sub_10003201C();
  sub_100031FB0( (void *)&_mh_execute_header,  v5,  v8,  "%s #tts SRUIFSpeechSynthesisCompletion error strongSelf=nil text=%{sensitive}@ result=%@ command=%@",  (uint8_t *)&v9);

  sub_100031F70();
}

void sub_10006B21C(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  int v3 = 136315650;
  uint64_t v4 = "-[SRSiriViewController siriSessionDidReceivePlayNotificationSound:completion:]_block_invoke";
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  __int16 v7 = 2112;
  uint64_t v8 = a1;
  sub_100031F0C( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "%s Failed notification sound playback with PlaybackCompletionType: %zd, error: %@",  (uint8_t *)&v3);
  sub_100031F54();
}

void sub_10006B2A8()
{
}

void sub_10006B314( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10006B384()
{
  v3[0] = 136315650;
  sub_100031F5C();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  sub_100031F0C( (void *)&_mh_execute_header,  v2,  (uint64_t)v2,  "%s Unable to handle PreSynthesisTTS command: %@, error: %@",  (uint8_t *)v3);
  sub_100031F54();
}

void sub_10006B400( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10006B470()
{
}

void sub_10006B4DC()
{
  sub_100031EE0( (void *)&_mh_execute_header,  v0,  v1,  "%s Item corresponding to identifier=%@ removed from active conversation already. Do not call siriDidFinishActionsFor ConversationItemWithIdentifier:inConversation: to avoid a rare crash!",  v2,  v3,  v4,  v5,  2u);
  sub_100031EF0();
}

void sub_10006B548()
{
}

void sub_10006B5B4()
{
}

void sub_10006B620()
{
}

void sub_10006B68C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10006B6FC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10006B76C()
{
}

void sub_10006B7D8(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = a1;
  uint64_t v6 = sub_100031FE4();
  uint64_t Name = AFUIBulletinReadoutResultGetName(v6);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(Name);
  uint64_t v9 = AFUIBulletinReadoutResultGetName(a3);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v12[0] = 136315650;
  sub_100031F38();
  sub_100031F0C( (void *)&_mh_execute_header,  v3,  v11,  "%s unhandled combination of titleResult: %@ and messageResult: %@",  (uint8_t *)v12);

  sub_100031F28();
}

void sub_10006B88C()
{
}

void sub_10006B8F8()
{
}

void sub_10006B964()
{
  v1[0] = 136315394;
  sub_100031F5C();
  _os_log_debug_impl( (void *)&_mh_execute_header,  v0,  OS_LOG_TYPE_DEBUG,  "%s Presentation indicates that we %@ punch out in place",  (uint8_t *)v1,  0x16u);
  sub_100031EF0();
}

void sub_10006B9F4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10006BA64()
{
  v1[0] = 136315650;
  sub_100031F90();
  sub_100031F0C( (void *)&_mh_execute_header,  v0,  (uint64_t)v0,  "%s Unable to perform punch out %@: %{public}@",  (uint8_t *)v1);
  sub_100031F54();
}

void sub_10006BADC()
{
}

void sub_10006BB48()
{
}

void sub_10006BBB4()
{
}

void sub_10006BC20()
{
  v3[0] = 136315650;
  sub_100014A48();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  sub_100031F0C( (void *)&_mh_execute_header,  v2,  (uint64_t)v2,  "%s Error building PunchOut MetricsContext for ace id = %@, error = %@",  (uint8_t *)v3);
  sub_100031F54();
}

uint64_t sub_10006BC9C()
{
  __int16 v0 = (os_log_s *)abort_report_np("Unable to find class %s", "VTStateManager");
  return sub_10006BCC0(v0);
}

void sub_10006BCC0(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[SRWindowSceneDelegate scene:willConnectToSession:options:]";
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "%s Scene connecting without window",  (uint8_t *)&v1,  0xCu);
}

void sub_10006BD40(void *a1)
{
  id v2 = a1;
  __int16 v4 = (void *)sub_1000348C8((uint64_t)v2, v3);
  id v5 = sub_1000348B4(v4);
  sub_10000D9E8( (void *)&_mh_execute_header,  v6,  v7,  "%s expected stored bundle path to be a string, but it was a %{public}@",  v8,  v9,  v10,  v11,  2u);

  sub_10000D9FC();
}

void sub_10006BDC8(void *a1)
{
  id v2 = a1;
  __int16 v4 = (void *)sub_1000348C8((uint64_t)v2, v3);
  id v5 = sub_1000348B4(v4);
  sub_10000D9E8( (void *)&_mh_execute_header,  v6,  v7,  "%s expected stored bundle identifier to be a string, but it was a %{public}@",  v8,  v9,  v10,  v11,  2u);

  sub_10000D9FC();
}

void sub_10006BE50(void *a1, void *a2)
{
  id v3 = a2;
  __int16 v4 = (void *)objc_claimAutoreleasedReturnValue([a1 _URL]);
  sub_10003487C();
  sub_1000348A0( (void *)&_mh_execute_header,  v5,  v6,  "%s %{public}@ unable to read on-disk cache at %{public}@: %{public}@",  v7,  v8,  v9,  v10,  2u);

  sub_100031F70();
}

void sub_10006BEEC(void *a1, void *a2)
{
  id v3 = a2;
  __int16 v4 = (void *)objc_claimAutoreleasedReturnValue([a1 _URL]);
  sub_10003487C();
  sub_1000348A0( (void *)&_mh_execute_header,  v5,  v6,  "%s %{public}@ unable to read property list from data at %{public}@: %{public}@",  v7,  v8,  v9,  v10,  2u);

  sub_100031F70();
}

void sub_10006BF88()
{
}

void sub_10006BFF4()
{
}

void sub_10006C060()
{
}

void sub_10006C0CC(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[SRCardStackNavigationTransitionContext completeTransition:]";
  _os_log_fault_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_FAULT,  "%s Transition is already completed; returning",
    (uint8_t *)&v1,
    0xCu);
  sub_100031EF0();
}

void sub_10006C148()
{
}

void sub_10006C1B4()
{
}

void sub_10006C220()
{
}

void sub_10006C28C(uint64_t *a1, os_log_s *a2)
{
  uint64_t v2 = *a1;
  int v3 = 136315394;
  uint64_t v4 = "-[SRPreSynthesisTask replyAceCommand]";
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "%s #presynthesize PreSynthesizeTTS command (%@) failed",  (uint8_t *)&v3,  0x16u);
  sub_100031EF0();
}

void sub_10006C314( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10006C384( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10006C3F4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10006C464(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "-[SRPreSynthesisTask handlePreSynthesisCommandWithError:]";
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "%s #presynthesize Presynthesizing failed: No speakable text",  buf,  0xCu);
}

void sub_10006C4B0(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[SRPreSynthesisTask handlePreSynthesisCommandWithError:]";
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "%s #presynthesize handlePreSynthesisCommandWithError",  (uint8_t *)&v1,  0xCu);
  sub_100031EF0();
}

void sub_10006C52C()
{
}

void sub_10006C598( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10006C608(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3 = *a2;
  int v4 = 136315650;
  uint64_t v5 = "-[SRPreSynthesisTask didFinishSynthesisRequest:withInstrumentMetrics:error:]_block_invoke";
  __int16 v6 = 2112;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  uint64_t v9 = v3;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "%s #presynthesize Unable to determine dialog string duration for %@, error: %@",  (uint8_t *)&v4,  0x20u);
}

void sub_10006C6A0(void **a1, void *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a2;
  int v4 = (void *)objc_claimAutoreleasedReturnValue([v2 dictionary]);
  int v5 = 136315394;
  __int16 v6 = "-[SRPlayContentViewController initWithPlayContent:]";
  __int16 v7 = 2112;
  __int16 v8 = v4;
  _os_log_error_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "%s No player from SAVCSPlayContent\n    Play content command: %@",  (uint8_t *)&v5,  0x16u);
}

void sub_10006C758(uint64_t a1, os_log_s *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "-[SiriQuickTypeGestureSource configureConnection]_block_invoke";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "%s #activation BSServiceConnection Interrupted, re-activating %@",  (uint8_t *)&v2,  0x16u);
}

void sub_10006C7E0(uint64_t a1, os_log_s *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "-[AceObject(MapsSession) _afui_updateMapsAnalytics]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "%s Missing values for extSessionGuid or extSessionGuidCreatedTimestamp from %@",  (uint8_t *)&v2,  0x16u);
}

void sub_10006C868(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "-[SRViewController setUpViews]_block_invoke";
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "%s Too many uncleaned up SRSiriViewControllers. Resetting counter.",  (uint8_t *)&v1,  0xCu);
}

void sub_10006C8E8(void *a1, void *a2)
{
  uint64_t v3 = a1;
  __int16 v4 = (void *)objc_claimAutoreleasedReturnValue([a2 aceId]);
  v6[0] = 136315394;
  sub_100014A48();
  sub_100006C90( (void *)&_mh_execute_header,  v3,  v5,  "%s #modes Invalid AddViews (aceId = %@). Both AssistantUtteranceView and Dialog on the same AddViews is unsupported.",  (uint8_t *)v6);
}

void sub_10006C98C()
{
  v2[0] = 136315394;
  sub_100014A48();
  sub_100006C90((void *)&_mh_execute_header, v0, v1, "%s #modes Failed to load configuration file: %@", (uint8_t *)v2);
}

void sub_10006CA00(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "-[SRAppDelegate _updateDeferral]_block_invoke";
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "%s window lacked contextID, sending back 0",  (uint8_t *)&v1,  0xCu);
}

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return _[a1 CGImage];
}

id objc_msgSend_CGPointValue(void *a1, const char *a2, ...)
{
  return _[a1 CGPointValue];
}

id objc_msgSend_CGRectValue(void *a1, const char *a2, ...)
{
  return _[a1 CGRectValue];
}

id objc_msgSend_URLByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return _[a1 URLByDeletingPathExtension];
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend__FBSScene(void *a1, const char *a2, ...)
{
  return _[a1 _FBSScene];
}

id objc_msgSend__MDModeToSRModeConverter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_MDModeToSRModeConverter:");
}

id objc_msgSend__URL(void *a1, const char *a2, ...)
{
  return _[a1 _URL];
}

id objc_msgSend__aceCommandRecords(void *a1, const char *a2, ...)
{
  return _[a1 _aceCommandRecords];
}

id objc_msgSend__aceCommandWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_aceCommandWithIdentifier:");
}

id objc_msgSend__activateConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_activateConversation:");
}

id objc_msgSend__activeConversation(void *a1, const char *a2, ...)
{
  return _[a1 _activeConversation];
}

id objc_msgSend__activeConversationItemAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_activeConversationItemAtIndexPath:");
}

id objc_msgSend__activeRequestOptionsDidChange(void *a1, const char *a2, ...)
{
  return _[a1 _activeRequestOptionsDidChange];
}

id objc_msgSend__addErrorUtterance_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addErrorUtterance:");
}

id objc_msgSend__addViewsForAddDialogs_views_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addViewsForAddDialogs:views:");
}

id objc_msgSend__adjustLineSpacing(void *a1, const char *a2, ...)
{
  return _[a1 _adjustLineSpacing];
}

id objc_msgSend__afui_mapsRelatedChild(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_afui_mapsRelatedChild");
}

id objc_msgSend__afui_mapsRelatedChildren(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_afui_mapsRelatedChildren");
}

id objc_msgSend__afui_updateMapsAnalytics(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_afui_updateMapsAnalytics");
}

id objc_msgSend__allowsTextToWrap(void *a1, const char *a2, ...)
{
  return _[a1 _allowsTextToWrap];
}

id objc_msgSend__alternativesTableView(void *a1, const char *a2, ...)
{
  return _[a1 _alternativesTableView];
}

id objc_msgSend__alwaysPrintSiriResponse(void *a1, const char *a2, ...)
{
  return _[a1 _alwaysPrintSiriResponse];
}

id objc_msgSend__analytics(void *a1, const char *a2, ...)
{
  return _[a1 _analytics];
}

id objc_msgSend__animateMultiPopKeyframe_outOfTotalKeyframes_transitionContext_completion_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_animateMultiPopKeyframe:outOfTotalKeyframes:transitionContext:completion:");
}

id objc_msgSend__animateOnePopTransition_originalContext_andComplete_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_animateOnePopTransition:originalContext:andComplete:completion:");
}

id objc_msgSend__animatePushTransition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_animatePushTransition:");
}

id objc_msgSend__animateTransitionForOperation_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_animateTransitionForOperation:context:");
}

id objc_msgSend__applicableEmail(void *a1, const char *a2, ...)
{
  return _[a1 _applicableEmail];
}

id objc_msgSend__applicablePhone(void *a1, const char *a2, ...)
{
  return _[a1 _applicablePhone];
}

id objc_msgSend__applicationIconImageForBundleIdentifier_format_scale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_applicationIconImageForBundleIdentifier:format:scale:");
}

id objc_msgSend__applicationKeyWindow(void *a1, const char *a2, ...)
{
  return _[a1 _applicationKeyWindow];
}

id objc_msgSend__attributedStringForTip(void *a1, const char *a2, ...)
{
  return _[a1 _attributedStringForTip];
}

id objc_msgSend__audioMessagePlayer(void *a1, const char *a2, ...)
{
  return _[a1 _audioMessagePlayer];
}

id objc_msgSend__backgroundEmptyPlatterViewOriginalFrame(void *a1, const char *a2, ...)
{
  return _[a1 _backgroundEmptyPlatterViewOriginalFrame];
}

id objc_msgSend__backgroundPlatteredCardViewForOperation_recentViewControllers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_backgroundPlatteredCardViewForOperation:recentViewControllers:");
}

id objc_msgSend__bigButtonViewController(void *a1, const char *a2, ...)
{
  return _[a1 _bigButtonViewController];
}

id objc_msgSend__builtInPresentationWithIdentifier_delegate_dataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_builtInPresentationWithIdentifier:delegate:dataSource:");
}

id objc_msgSend__bundleURLsByBundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 _bundleURLsByBundleIdentifier];
}

id objc_msgSend__cachedURLForBundleWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cachedURLForBundleWithIdentifier:");
}

id objc_msgSend__calculateMoveFromPlatteredCardViewToBackgroundAffineTransformForPercentComplete_withSemanticContentAttribute_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "_calculateMoveFromPlatteredCardViewToBackgroundAffineTransformForPercentComplete:withSemanticContentAttribute:");
}

id objc_msgSend__callHistoryRowsForCalls_callOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_callHistoryRowsForCalls:callOperation:");
}

id objc_msgSend__cancelCurrentAudioMessagePlayback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cancelCurrentAudioMessagePlayback:");
}

id objc_msgSend__cancelCurrentTTS_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cancelCurrentTTS:");
}

id objc_msgSend__cancelIdleTimer(void *a1, const char *a2, ...)
{
  return _[a1 _cancelIdleTimer];
}

id objc_msgSend__cancelLastRootProvisionalSnippetFromLastRequestInConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cancelLastRootProvisionalSnippetFromLastRequestInConversation:");
}

id objc_msgSend__cancelSpeechSynthesis(void *a1, const char *a2, ...)
{
  return _[a1 _cancelSpeechSynthesis];
}

id objc_msgSend__cancelTimeout(void *a1, const char *a2, ...)
{
  return _[a1 _cancelTimeout];
}

id objc_msgSend__cellTypeForIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cellTypeForIndexPath:");
}

id objc_msgSend__checkAndEmitBluetoothInvocationSourcePerVehicle_forRequestOptions_btManager_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_checkAndEmitBluetoothInvocationSourcePerVehicle:forRequestOptions:btManager:");
}

id objc_msgSend__checkAndEmitCarPlayInvocationSourcePerVehicle_forRequestOptions_accessoryManager_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_checkAndEmitCarPlayInvocationSourcePerVehicle:forRequestOptions:accessoryManager:");
}

id objc_msgSend__checkAndEmitHSSignalsWithSource_forRequestOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_checkAndEmitHSSignalsWithSource:forRequestOptions:");
}

id objc_msgSend__checkAndUpdateSiriIdleAndQuietStatusIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _checkAndUpdateSiriIdleAndQuietStatusIfNeeded];
}

id objc_msgSend__checkAndUpdateSiriIdleAndQuietStatusOrRescheduleIdleTimerIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _checkAndUpdateSiriIdleAndQuietStatusOrRescheduleIdleTimerIfNeeded];
}

id objc_msgSend__checkAndUpdateSiriIsIdleAndQuietStatusWithChangeHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_checkAndUpdateSiriIsIdleAndQuietStatusWithChangeHandler:");
}

id objc_msgSend__checkUpdatedSizingForEditableTextView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_checkUpdatedSizingForEditableTextView:");
}

id objc_msgSend__circleToLabelHeightDifference(void *a1, const char *a2, ...)
{
  return _[a1 _circleToLabelHeightDifference];
}

id objc_msgSend__classNameForBuiltInPresentationWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_classNameForBuiltInPresentationWithIdentifier:");
}

id objc_msgSend__cleanupAllViews(void *a1, const char *a2, ...)
{
  return _[a1 _cleanupAllViews];
}

id objc_msgSend__compactResultView(void *a1, const char *a2, ...)
{
  return _[a1 _compactResultView];
}

id objc_msgSend__completedCommandAppPunchOutIds(void *a1, const char *a2, ...)
{
  return _[a1 _completedCommandAppPunchOutIds];
}

id objc_msgSend__completion(void *a1, const char *a2, ...)
{
  return _[a1 _completion];
}

id objc_msgSend__configurationDictionary(void *a1, const char *a2, ...)
{
  return _[a1 _configurationDictionary];
}

id objc_msgSend__configuredSpeakableUtteranceParserForCommand_context_speakableText_subCompletion_speakPreparation_speakCompletion_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "_configuredSpeakableUtteranceParserForCommand:context:speakableText:subCompletion:speakPreparation:speakCompletion:");
}

id objc_msgSend__connectionWasInterrupted(void *a1, const char *a2, ...)
{
  return _[a1 _connectionWasInterrupted];
}

id objc_msgSend__connectionWasInvalidated(void *a1, const char *a2, ...)
{
  return _[a1 _connectionWasInvalidated];
}

id objc_msgSend__contextId(void *a1, const char *a2, ...)
{
  return _[a1 _contextId];
}

id objc_msgSend__conversationStore(void *a1, const char *a2, ...)
{
  return _[a1 _conversationStore];
}

id objc_msgSend__conversationWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_conversationWithIdentifier:");
}

id objc_msgSend__conversations(void *a1, const char *a2, ...)
{
  return _[a1 _conversations];
}

id objc_msgSend__convertedCardSection(void *a1, const char *a2, ...)
{
  return _[a1 _convertedCardSection];
}

id objc_msgSend__convertedCardSections(void *a1, const char *a2, ...)
{
  return _[a1 _convertedCardSections];
}

id objc_msgSend__convertedImageOfSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_convertedImageOfSize:");
}

id objc_msgSend__convertedLocation(void *a1, const char *a2, ...)
{
  return _[a1 _convertedLocation];
}

id objc_msgSend__convertedPunchout(void *a1, const char *a2, ...)
{
  return _[a1 _convertedPunchout];
}

id objc_msgSend__coordinateTransitionWithTransitionCoordination_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_coordinateTransitionWithTransitionCoordination:");
}

id objc_msgSend__correctionIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 _correctionIdentifier];
}

id objc_msgSend__createReusableViewWithClass_snippetViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createReusableViewWithClass:snippetViewController:");
}

id objc_msgSend__createSpeechAlternativeViewsIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _createSpeechAlternativeViewsIfNecessary];
}

id objc_msgSend__createVisualEffectBackgroundViewForTextView_topOffset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createVisualEffectBackgroundViewForTextView:topOffset:");
}

id objc_msgSend__currentAVRecordRoute(void *a1, const char *a2, ...)
{
  return _[a1 _currentAVRecordRoute];
}

id objc_msgSend__debugDescriptionForProperty_BOOLValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_debugDescriptionForProperty:BOOLValue:");
}

id objc_msgSend__debugDescriptionForProperty_formattedValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_debugDescriptionForProperty:formattedValue:");
}

id objc_msgSend__debugDescriptionForProperty_integerValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_debugDescriptionForProperty:integerValue:");
}

id objc_msgSend__defaultURL(void *a1, const char *a2, ...)
{
  return _[a1 _defaultURL];
}

id objc_msgSend__delayedConversationItemRevisionIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 _delayedConversationItemRevisionIdentifiers];
}

id objc_msgSend__delegate(void *a1, const char *a2, ...)
{
  return _[a1 _delegate];
}

id objc_msgSend__deleteConversationWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_deleteConversationWithIdentifier:");
}

id objc_msgSend__deletePreviousConversation(void *a1, const char *a2, ...)
{
  return _[a1 _deletePreviousConversation];
}

id objc_msgSend__deviceSpecificImageNamed_inBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_deviceSpecificImageNamed:inBundle:");
}

id objc_msgSend__deviceSpecificStringForDefaultString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_deviceSpecificStringForDefaultString:");
}

id objc_msgSend__dialogModeToVisualModeConverter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dialogModeToVisualModeConverter:");
}

id objc_msgSend__didCompleteActionForAceCommand_success_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_didCompleteActionForAceCommand:success:");
}

id objc_msgSend__didPresentItemsAtIndexPaths_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_didPresentItemsAtIndexPaths:");
}

id objc_msgSend__didReceiveAceCommand_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_didReceiveAceCommand:");
}

id objc_msgSend__didReceiveAceCommand_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_didReceiveAceCommand:completion:");
}

id objc_msgSend__didShowTip(void *a1, const char *a2, ...)
{
  return _[a1 _didShowTip];
}

id objc_msgSend__didStartActionForAceCommand_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_didStartActionForAceCommand:");
}

id objc_msgSend__didStartActionForItemAtIndexPath_inConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_didStartActionForItemAtIndexPath:inConversation:");
}

id objc_msgSend__didUpdateShowTipCount(void *a1, const char *a2, ...)
{
  return _[a1 _didUpdateShowTipCount];
}

id objc_msgSend__dismissFromTimeoutAfterDelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dismissFromTimeoutAfterDelay:");
}

id objc_msgSend__dismissWithReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dismissWithReason:");
}

id objc_msgSend__displayNotReadyError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_displayNotReadyError:");
}

id objc_msgSend__domainObjectStorageConnection(void *a1, const char *a2, ...)
{
  return _[a1 _domainObjectStorageConnection];
}

id objc_msgSend__domainSnippetForEnabledIntentSupportedAppAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_domainSnippetForEnabledIntentSupportedAppAtIndex:");
}

id objc_msgSend__domainSnippetForHelpDomainAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_domainSnippetForHelpDomainAtIndex:");
}

id objc_msgSend__domainSnippetForIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_domainSnippetForIndexPath:");
}

id objc_msgSend__downloadAssetsNotificationRequest(void *a1, const char *a2, ...)
{
  return _[a1 _downloadAssetsNotificationRequest];
}

id objc_msgSend__downloadSiriAdvancedFeaturesAssetsNotificationRequest(void *a1, const char *a2, ...)
{
  return _[a1 _downloadSiriAdvancedFeaturesAssetsNotificationRequest];
}

id objc_msgSend__edgeInsets(void *a1, const char *a2, ...)
{
  return _[a1 _edgeInsets];
}

id objc_msgSend__editableUtteranceViewControllerDidDismiss_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_editableUtteranceViewControllerDidDismiss:");
}

id objc_msgSend__editableUtteranceViewControllerWillBePresentedWithSheetPresentationController_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_editableUtteranceViewControllerWillBePresentedWithSheetPresentationController:");
}

id objc_msgSend__emitRenderingEnded(void *a1, const char *a2, ...)
{
  return _[a1 _emitRenderingEnded];
}

id objc_msgSend__endBackgroundTask(void *a1, const char *a2, ...)
{
  return _[a1 _endBackgroundTask];
}

id objc_msgSend__endTrackingGuideShowTimeIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _endTrackingGuideShowTimeIfNecessary];
}

id objc_msgSend__enumerateDescendentViews_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_enumerateDescendentViews:");
}

id objc_msgSend__expectedPopCountForTransitionContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_expectedPopCountForTransitionContext:");
}

id objc_msgSend__exportedInterface(void *a1, const char *a2, ...)
{
  return _[a1 _exportedInterface];
}

id objc_msgSend__fallbackImage(void *a1, const char *a2, ...)
{
  return _[a1 _fallbackImage];
}

id objc_msgSend__fetchAttendingState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchAttendingState:");
}

id objc_msgSend__fetchConnectedAudioAccessoryState(void *a1, const char *a2, ...)
{
  return _[a1 _fetchConnectedAudioAccessoryState];
}

id objc_msgSend__firstSnippetInViews_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_firstSnippetInViews:");
}

id objc_msgSend__flatImageWithColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_flatImageWithColor:");
}

id objc_msgSend__font(void *a1, const char *a2, ...)
{
  return _[a1 _font];
}

id objc_msgSend__fromPlatteredCardViewGivenFromViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fromPlatteredCardViewGivenFromViewController:");
}

id objc_msgSend__fromPlatteredCardViewOriginalFrame(void *a1, const char *a2, ...)
{
  return _[a1 _fromPlatteredCardViewOriginalFrame];
}

id objc_msgSend__getUpdatedErrorCount(void *a1, const char *a2, ...)
{
  return _[a1 _getUpdatedErrorCount];
}

id objc_msgSend__guideSnippet(void *a1, const char *a2, ...)
{
  return _[a1 _guideSnippet];
}

id objc_msgSend__handleRequestError_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleRequestError:completion:");
}

id objc_msgSend__hasInexpensiveNetwork(void *a1, const char *a2, ...)
{
  return _[a1 _hasInexpensiveNetwork];
}

id objc_msgSend__hasSufficientDiskSpaceForDownload(void *a1, const char *a2, ...)
{
  return _[a1 _hasSufficientDiskSpaceForDownload];
}

id objc_msgSend__hasTitle(void *a1, const char *a2, ...)
{
  return _[a1 _hasTitle];
}

id objc_msgSend__headerViewEdgeInsets(void *a1, const char *a2, ...)
{
  return _[a1 _headerViewEdgeInsets];
}

id objc_msgSend__heightOfRowForDomainSnippet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_heightOfRowForDomainSnippet:");
}

id objc_msgSend__hideEditableUtteranceView(void *a1, const char *a2, ...)
{
  return _[a1 _hideEditableUtteranceView];
}

id objc_msgSend__host(void *a1, const char *a2, ...)
{
  return _[a1 _host];
}

id objc_msgSend__hostWithErrorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_hostWithErrorHandler:");
}

id objc_msgSend__iconImageForGuideDomainSnippet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_iconImageForGuideDomainSnippet:");
}

id objc_msgSend__idleTimer(void *a1, const char *a2, ...)
{
  return _[a1 _idleTimer];
}

id objc_msgSend__indentWidth(void *a1, const char *a2, ...)
{
  return _[a1 _indentWidth];
}

id objc_msgSend__init(void *a1, const char *a2, ...)
{
  return _[a1 _init];
}

id objc_msgSend__initialHeaderText(void *a1, const char *a2, ...)
{
  return _[a1 _initialHeaderText];
}

id objc_msgSend__insertUserUtteranceViewForSuggestion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_insertUserUtteranceViewForSuggestion:");
}

id objc_msgSend__insertUserUtteranceViewForText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_insertUserUtteranceViewForText:");
}

id objc_msgSend__instrumentation(void *a1, const char *a2, ...)
{
  return _[a1 _instrumentation];
}

id objc_msgSend__instrumentationManager(void *a1, const char *a2, ...)
{
  return _[a1 _instrumentationManager];
}

id objc_msgSend__instrumentationPresentationForPresentationOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_instrumentationPresentationForPresentationOptions:");
}

id objc_msgSend__instrumentationResponseModeForMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_instrumentationResponseModeForMode:");
}

id objc_msgSend__invalidateConnection(void *a1, const char *a2, ...)
{
  return _[a1 _invalidateConnection];
}

id objc_msgSend__isAcousticIdAllowed(void *a1, const char *a2, ...)
{
  return _[a1 _isAcousticIdAllowed];
}

id objc_msgSend__isAudioPlayerPlaying(void *a1, const char *a2, ...)
{
  return _[a1 _isAudioPlayerPlaying];
}

id objc_msgSend__isCancelling(void *a1, const char *a2, ...)
{
  return _[a1 _isCancelling];
}

id objc_msgSend__isCompleted(void *a1, const char *a2, ...)
{
  return _[a1 _isCompleted];
}

id objc_msgSend__isGesturing(void *a1, const char *a2, ...)
{
  return _[a1 _isGesturing];
}

id objc_msgSend__isIdleTimerEnabled(void *a1, const char *a2, ...)
{
  return _[a1 _isIdleTimerEnabled];
}

id objc_msgSend__isKeyboardLoweredAfterResponse(void *a1, const char *a2, ...)
{
  return _[a1 _isKeyboardLoweredAfterResponse];
}

id objc_msgSend__isLoaded(void *a1, const char *a2, ...)
{
  return _[a1 _isLoaded];
}

id objc_msgSend__isReadingBulletinContentInCarPlayOutsideOfSiriSession(void *a1, const char *a2, ...)
{
  return _[a1 _isReadingBulletinContentInCarPlayOutsideOfSiriSession];
}

id objc_msgSend__isRequestActive(void *a1, const char *a2, ...)
{
  return _[a1 _isRequestActive];
}

id objc_msgSend__isSiriIdleAndQuiet(void *a1, const char *a2, ...)
{
  return _[a1 _isSiriIdleAndQuiet];
}

id objc_msgSend__isSpeechSynthesisSpeaking(void *a1, const char *a2, ...)
{
  return _[a1 _isSpeechSynthesisSpeaking];
}

id objc_msgSend__isStartRequestAceCommandSent(void *a1, const char *a2, ...)
{
  return _[a1 _isStartRequestAceCommandSent];
}

id objc_msgSend__isToday(void *a1, const char *a2, ...)
{
  return _[a1 _isToday];
}

id objc_msgSend__isUserUtteranceTapToEditInProgress(void *a1, const char *a2, ...)
{
  return _[a1 _isUserUtteranceTapToEditInProgress];
}

id objc_msgSend__isWaitingForStartRequest(void *a1, const char *a2, ...)
{
  return _[a1 _isWaitingForStartRequest];
}

id objc_msgSend__isWikiSnippet(void *a1, const char *a2, ...)
{
  return _[a1 _isWikiSnippet];
}

id objc_msgSend__isWithinTheLastTimePeriodInDays_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isWithinTheLastTimePeriodInDays:");
}

id objc_msgSend__isYesterday(void *a1, const char *a2, ...)
{
  return _[a1 _isYesterday];
}

id objc_msgSend__language(void *a1, const char *a2, ...)
{
  return _[a1 _language];
}

id objc_msgSend__languageMatchesConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_languageMatchesConversation:");
}

id objc_msgSend__leadingHorizontalOffsetWithLayoutMargins_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_leadingHorizontalOffsetWithLayoutMargins:");
}

id objc_msgSend__load(void *a1, const char *a2, ...)
{
  return _[a1 _load];
}

id objc_msgSend__loadFromObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadFromObject:");
}

id objc_msgSend__loadFromPropertyListRepresentation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadFromPropertyListRepresentation:");
}

id objc_msgSend__localizedErrorString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_localizedErrorString:");
}

id objc_msgSend__logAceObjectPresented_dialogPhase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_logAceObjectPresented:dialogPhase:");
}

id objc_msgSend__logAceObjectSpoken_dialogPhase_speakableText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_logAceObjectSpoken:dialogPhase:speakableText:");
}

id objc_msgSend__logDummyAssistantUtteranceViewWithDialogIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_logDummyAssistantUtteranceViewWithDialogIdentifier:");
}

id objc_msgSend__logModeComputationForAceCommand_mode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_logModeComputationForAceCommand:mode:");
}

id objc_msgSend__logPatternExecutedEventForAddViewsCommand_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_logPatternExecutedEventForAddViewsCommand:");
}

id objc_msgSend__logRevealSpeechCommandReceived_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_logRevealSpeechCommandReceived:");
}

id objc_msgSend__mapSiriTransitionState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_mapSiriTransitionState:");
}

id objc_msgSend__metricsContextForItemWithAceCommandId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_metricsContextForItemWithAceCommandId:");
}

id objc_msgSend__mockSiriAssetState(void *a1, const char *a2, ...)
{
  return _[a1 _mockSiriAssetState];
}

id objc_msgSend__modeForSiriSettings(void *a1, const char *a2, ...)
{
  return _[a1 _modeForSiriSettings];
}

id objc_msgSend__nameLabelFont(void *a1, const char *a2, ...)
{
  return _[a1 _nameLabelFont];
}

id objc_msgSend__navigationController(void *a1, const char *a2, ...)
{
  return _[a1 _navigationController];
}

id objc_msgSend__notifyPromptedUserForInput(void *a1, const char *a2, ...)
{
  return _[a1 _notifyPromptedUserForInput];
}

id objc_msgSend__nudgeHeaderText(void *a1, const char *a2, ...)
{
  return _[a1 _nudgeHeaderText];
}

id objc_msgSend__numberOfHelpDomains(void *a1, const char *a2, ...)
{
  return _[a1 _numberOfHelpDomains];
}

id objc_msgSend__numberOfIntentEnabledApps(void *a1, const char *a2, ...)
{
  return _[a1 _numberOfIntentEnabledApps];
}

id objc_msgSend__numberOfSections(void *a1, const char *a2, ...)
{
  return _[a1 _numberOfSections];
}

id objc_msgSend__openURL_bundleId_inPlace_conversationId_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_openURL:bundleId:inPlace:conversationId:completion:");
}

id objc_msgSend__panGestureRecognizer(void *a1, const char *a2, ...)
{
  return _[a1 _panGestureRecognizer];
}

id objc_msgSend__pendingPreSynthesisTasks(void *a1, const char *a2, ...)
{
  return _[a1 _pendingPreSynthesisTasks];
}

id objc_msgSend__performAppPunchOutCommand_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performAppPunchOutCommand:completion:");
}

id objc_msgSend__performAppPunchOutCommand_conversationItemIdentifier_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performAppPunchOutCommand:conversationItemIdentifier:completion:");
}

id objc_msgSend__performGenericAceCommand_turnIdentifier_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performGenericAceCommand:turnIdentifier:completion:");
}

id objc_msgSend__performPopAnimations(void *a1, const char *a2, ...)
{
  return _[a1 _performPopAnimations];
}

id objc_msgSend__performPushAnimations(void *a1, const char *a2, ...)
{
  return _[a1 _performPushAnimations];
}

id objc_msgSend__performPushTransitionFromViewController_andView_toViewController_andView_inContainerView_recentViewControllers_transitionDuration_animated_transitionCompletion_completion_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "_performPushTransitionFromViewController:andView:toViewController:andView:inContainerView:recentViewControlle rs:transitionDuration:animated:transitionCompletion:completion:");
}

id objc_msgSend__performSayItCommand_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performSayItCommand:");
}

id objc_msgSend__phraseForIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_phraseForIndexPath:");
}

id objc_msgSend__popTransitionContextGivenOriginalContext_revealedViewController_poppedViewController_duration_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "_popTransitionContextGivenOriginalContext:revealedViewController:poppedViewController:duration:");
}

id objc_msgSend__postNotificationRequest_notificationCenter_destinations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_postNotificationRequest:notificationCenter:destinations:");
}

id objc_msgSend__preferences(void *a1, const char *a2, ...)
{
  return _[a1 _preferences];
}

id objc_msgSend__preferredFontForTextStyle_variant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_preferredFontForTextStyle:variant:");
}

id objc_msgSend__prepareBackgroundEmptyPlatteredViewForTransitionInContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_prepareBackgroundEmptyPlatteredViewForTransitionInContext:");
}

id objc_msgSend__prepareFromPlatteredCardViewForTransitionWithContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_prepareFromPlatteredCardViewForTransitionWithContext:");
}

id objc_msgSend__prepareSiriEnabledAppList(void *a1, const char *a2, ...)
{
  return _[a1 _prepareSiriEnabledAppList];
}

id objc_msgSend__prepareToPlatteredCardViewForTransitionInContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_prepareToPlatteredCardViewForTransitionInContext:");
}

id objc_msgSend__presentAuthenticationDialogWithText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_presentAuthenticationDialogWithText:");
}

id objc_msgSend__presentation(void *a1, const char *a2, ...)
{
  return _[a1 _presentation];
}

id objc_msgSend__presentationAllowsRecordingActionCompletedForSpeechSynthesisCommand_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_presentationAllowsRecordingActionCompletedForSpeechSynthesisCommand:");
}

id objc_msgSend__presentationOptions(void *a1, const char *a2, ...)
{
  return _[a1 _presentationOptions];
}

id objc_msgSend__presentationSupportsConversationDidChangeWithTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_presentationSupportsConversationDidChangeWithTransaction:");
}

id objc_msgSend__presentationViewController(void *a1, const char *a2, ...)
{
  return _[a1 _presentationViewController];
}

id objc_msgSend__presentedConversationItemRevisionIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 _presentedConversationItemRevisionIdentifiers];
}

id objc_msgSend__previousConversation(void *a1, const char *a2, ...)
{
  return _[a1 _previousConversation];
}

id objc_msgSend__privateDelegate(void *a1, const char *a2, ...)
{
  return _[a1 _privateDelegate];
}

id objc_msgSend__processAddViewsCommand_forMode_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processAddViewsCommand:forMode:completion:");
}

id objc_msgSend__processUserUtterance_isCombined_displayedText_withScore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processUserUtterance:isCombined:displayedText:withScore:");
}

id objc_msgSend__propertyListRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 _propertyListRepresentation];
}

id objc_msgSend__punchoutMetricsAceCommandIdForItemWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_punchoutMetricsAceCommandIdForItemWithIdentifier:");
}

id objc_msgSend__readoutResultFromTTSResult_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_readoutResultFromTTSResult:error:");
}

id objc_msgSend__readoutResultFromTitleResult_messageResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_readoutResultFromTitleResult:messageResult:");
}

id objc_msgSend__recentViewControllers(void *a1, const char *a2, ...)
{
  return _[a1 _recentViewControllers];
}

id objc_msgSend__recursivelyAnimateNextMultiPopKeyframe_outOfTotalKeyframes_transitionContext_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_recursivelyAnimateNextMultiPopKeyframe:outOfTotalKeyframes:transitionContext:");
}

id objc_msgSend__redundantDUCIds(void *a1, const char *a2, ...)
{
  return _[a1 _redundantDUCIds];
}

id objc_msgSend__reflectionDialogHasBeenPlayed(void *a1, const char *a2, ...)
{
  return _[a1 _reflectionDialogHasBeenPlayed];
}

id objc_msgSend__reflectionDialogHasBeenPlayed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_reflectionDialogHasBeenPlayed:");
}

id objc_msgSend__remoteViewControllerInterface(void *a1, const char *a2, ...)
{
  return _[a1 _remoteViewControllerInterface];
}

id objc_msgSend__removePreviousConversationFromStore(void *a1, const char *a2, ...)
{
  return _[a1 _removePreviousConversationFromStore];
}

id objc_msgSend__removeRedundantUtteranceViewsFromAddViews_forMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeRedundantUtteranceViewsFromAddViews:forMode:");
}

id objc_msgSend__removeSpeakableTextFromAddViews_forMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeSpeakableTextFromAddViews:forMode:");
}

id objc_msgSend__removeUtteranceViewsFromAddViews_forMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeUtteranceViewsFromAddViews:forMode:");
}

id objc_msgSend__repeatablePhrases(void *a1, const char *a2, ...)
{
  return _[a1 _repeatablePhrases];
}

id objc_msgSend__requestOptions(void *a1, const char *a2, ...)
{
  return _[a1 _requestOptions];
}

id objc_msgSend__rescanBundles(void *a1, const char *a2, ...)
{
  return _[a1 _rescanBundles];
}

id objc_msgSend__rescheduleIdleTimerIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _rescheduleIdleTimerIfNeeded];
}

id objc_msgSend__resetContext(void *a1, const char *a2, ...)
{
  return _[a1 _resetContext];
}

id objc_msgSend__responseModeToMDModeConverter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_responseModeToMDModeConverter:");
}

id objc_msgSend__restorePreviousConversation(void *a1, const char *a2, ...)
{
  return _[a1 _restorePreviousConversation];
}

id objc_msgSend__resumesInterruptedAudioPlaybackForAttendingState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_resumesInterruptedAudioPlaybackForAttendingState:");
}

id objc_msgSend__rootSheetPresentationController(void *a1, const char *a2, ...)
{
  return _[a1 _rootSheetPresentationController];
}

id objc_msgSend__runScrollRosterTestWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_runScrollRosterTestWithOptions:");
}

id objc_msgSend__safelyExtractSnippetPlatterViewControllerFromViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_safelyExtractSnippetPlatterViewControllerFromViewController:");
}

id objc_msgSend__save(void *a1, const char *a2, ...)
{
  return _[a1 _save];
}

id objc_msgSend__saveConversationWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_saveConversationWithCompletion:");
}

id objc_msgSend__sayItForDialog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sayItForDialog:");
}

id objc_msgSend__scaledSiriTapToEditViewLeading(void *a1, const char *a2, ...)
{
  return _[a1 _scaledSiriTapToEditViewLeading];
}

id objc_msgSend__scaledValueForValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scaledValueForValue:");
}

id objc_msgSend__scheduleAssetCheckWithEarliestBeginDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scheduleAssetCheckWithEarliestBeginDate:");
}

id objc_msgSend__scheduleAudioResumptionAfterDelayInSec_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scheduleAudioResumptionAfterDelayInSec:");
}

id objc_msgSend__scheduleIdleTimer(void *a1, const char *a2, ...)
{
  return _[a1 _scheduleIdleTimer];
}

id objc_msgSend__scheduleInterruptedAudioResumingIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _scheduleInterruptedAudioResumingIfNeeded];
}

id objc_msgSend__searchCallHistoryIntentForVoicemail_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_searchCallHistoryIntentForVoicemail:");
}

id objc_msgSend__searchCallHistoryIntentResponseForCallRecords_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_searchCallHistoryIntentResponseForCallRecords:");
}

id objc_msgSend__session(void *a1, const char *a2, ...)
{
  return _[a1 _session];
}

id objc_msgSend__setAcousticIdAllowed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setAcousticIdAllowed:");
}

id objc_msgSend__setAlternativesTableView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setAlternativesTableView:");
}

id objc_msgSend__setAudioPlayerIsPlaying_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setAudioPlayerIsPlaying:");
}

id objc_msgSend__setBackgroundEmptyPlatterViewOriginalFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setBackgroundEmptyPlatterViewOriginalFrame:");
}

id objc_msgSend__setCancelling_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setCancelling:");
}

id objc_msgSend__setCompleted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setCompleted:");
}

id objc_msgSend__setCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setCompletion:");
}

id objc_msgSend__setContinuousCornerRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setContinuousCornerRadius:");
}

id objc_msgSend__setCurrentAVRecordRoute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setCurrentAVRecordRoute:");
}

id objc_msgSend__setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setDelegate:");
}

id objc_msgSend__setDictationResult_withCorrectionIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setDictationResult:withCorrectionIdentifier:");
}

id objc_msgSend__setDidUpdateShowTipCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setDidUpdateShowTipCount:");
}

id objc_msgSend__setForcedUserInterfaceLayoutDirection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setForcedUserInterfaceLayoutDirection:");
}

id objc_msgSend__setFromPlatteredCardViewOriginalFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setFromPlatteredCardViewOriginalFrame:");
}

id objc_msgSend__setGesturing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setGesturing:");
}

id objc_msgSend__setHyphenationFactor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setHyphenationFactor:");
}

id objc_msgSend__setIdleTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setIdleTimer:");
}

id objc_msgSend__setIdleTimerEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setIdleTimerEnabled:");
}

id objc_msgSend__setKeyboardLoweredAfterResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setKeyboardLoweredAfterResponse:");
}

id objc_msgSend__setListenAfterSpeakingForRepeatable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setListenAfterSpeakingForRepeatable:");
}

id objc_msgSend__setListenAfterSpeakingForRequestFinished_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setListenAfterSpeakingForRequestFinished:");
}

id objc_msgSend__setLoaded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setLoaded:");
}

id objc_msgSend__setNavigationController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setNavigationController:");
}

id objc_msgSend__setQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setQueue:");
}

id objc_msgSend__setReadingBulletinContentInCarPlayOutsideOfSiriSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setReadingBulletinContentInCarPlayOutsideOfSiriSession:");
}

id objc_msgSend__setRecentViewControllers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setRecentViewControllers:");
}

id objc_msgSend__setRequestActive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setRequestActive:");
}

id objc_msgSend__setRequestOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setRequestOptions:");
}

id objc_msgSend__setShouldScaleDownBehindDescendantSheets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setShouldScaleDownBehindDescendantSheets:");
}

id objc_msgSend__setShowKeyboardIfTextInputEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setShowKeyboardIfTextInputEnabled:");
}

id objc_msgSend__setShowKeyboardIfTextInputEnabled_minimized_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setShowKeyboardIfTextInputEnabled:minimized:");
}

id objc_msgSend__setStartRequestAceCommandSent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setStartRequestAceCommandSent:");
}

id objc_msgSend__setTextView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setTextView:");
}

id objc_msgSend__setUpIcons(void *a1, const char *a2, ...)
{
  return _[a1 _setUpIcons];
}

id objc_msgSend__setUserUtterance_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setUserUtterance:");
}

id objc_msgSend__setUserUtteranceTapToEditInProgress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setUserUtteranceTapToEditInProgress:");
}

id objc_msgSend__setUtteranceToSpeakAfterClearScreenCommand_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setUtteranceToSpeakAfterClearScreenCommand:");
}

id objc_msgSend__setWaitingForStartRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setWaitingForStartRequest:");
}

id objc_msgSend__setWasSiriIdleAndQuiet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setWasSiriIdleAndQuiet:");
}

id objc_msgSend__setWindowInterfaceOrientation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setWindowInterfaceOrientation:");
}

id objc_msgSend__setupAlternativesTableView(void *a1, const char *a2, ...)
{
  return _[a1 _setupAlternativesTableView];
}

id objc_msgSend__setupConstraints(void *a1, const char *a2, ...)
{
  return _[a1 _setupConstraints];
}

id objc_msgSend__setupTextView(void *a1, const char *a2, ...)
{
  return _[a1 _setupTextView];
}

id objc_msgSend__setupXPCListener(void *a1, const char *a2, ...)
{
  return _[a1 _setupXPCListener];
}

id objc_msgSend__sharePatternIdFromAddViewsCommand_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sharePatternIdFromAddViewsCommand:");
}

id objc_msgSend__shouldLowerKeyboardForAddViewsCommand_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldLowerKeyboardForAddViewsCommand:");
}

id objc_msgSend__shouldScaleDownBehindDescendantSheets(void *a1, const char *a2, ...)
{
  return _[a1 _shouldScaleDownBehindDescendantSheets];
}

id objc_msgSend__shouldShowAlternativesTableView(void *a1, const char *a2, ...)
{
  return _[a1 _shouldShowAlternativesTableView];
}

id objc_msgSend__shouldShowTip(void *a1, const char *a2, ...)
{
  return _[a1 _shouldShowTip];
}

id objc_msgSend__shouldTransformLegacyAddViews(void *a1, const char *a2, ...)
{
  return _[a1 _shouldTransformLegacyAddViews];
}

id objc_msgSend__showHeaderText_subheaderText_largeSubheaderText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showHeaderText:subheaderText:largeSubheaderText:");
}

id objc_msgSend__showsCategoriesForSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showsCategoriesForSection:");
}

id objc_msgSend__siriIsShowingPasscodeUnlock(void *a1, const char *a2, ...)
{
  return _[a1 _siriIsShowingPasscodeUnlock];
}

id objc_msgSend__siriPresentation_speakTextForConversationItemIdentifier_delayed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_siriPresentation:speakTextForConversationItemIdentifier:delayed:");
}

id objc_msgSend__siriPresentation_speakTextForConversationItemIdentifierDidBecomeReady_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_siriPresentation:speakTextForConversationItemIdentifierDidBecomeReady:");
}

id objc_msgSend__siriPresentationPluginBundleWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_siriPresentationPluginBundleWithIdentifier:");
}

id objc_msgSend__siriState(void *a1, const char *a2, ...)
{
  return _[a1 _siriState];
}

id objc_msgSend__siriUnavailableViewController(void *a1, const char *a2, ...)
{
  return _[a1 _siriUnavailableViewController];
}

id objc_msgSend__siriUnvailableNotificationRequest(void *a1, const char *a2, ...)
{
  return _[a1 _siriUnvailableNotificationRequest];
}

id objc_msgSend__speakText_audioData_ignoreMuteSwitch_identifier_sessionId_preferredVoice_language_gender_provisionally_eligibleAfterDuration_delayed_canUseServerTTS_speakableUtteranceParser_analyticsContext_speakableContextInfo_preparation_completion_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "_speakText:audioData:ignoreMuteSwitch:identifier:sessionId:preferredVoice:language:gender:provisionally:eligi bleAfterDuration:delayed:canUseServerTTS:speakableUtteranceParser:analyticsContext:speakableContextInfo:prepa ration:completion:");
}

id objc_msgSend__speakText_identifier_sessionId_preferredVoice_provisionally_eligibleAfterDuration_delayed_canUseServerTTS_speakableUtteranceParser_analyticsContext_speakableContextInfo_preparation_completion_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "_speakText:identifier:sessionId:preferredVoice:provisionally:eligibleAfterDuration:delayed:canUseServerTTS:sp eakableUtteranceParser:analyticsContext:speakableContextInfo:preparation:completion:");
}

id objc_msgSend__speakableTextForDialog_mode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_speakableTextForDialog:mode:");
}

id objc_msgSend__speechIdentifierForConversationItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_speechIdentifierForConversationItem:");
}

id objc_msgSend__splitVisualResponse_forVisualResponseSnippet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_splitVisualResponse:forVisualResponseSnippet:");
}

id objc_msgSend__sr_playerForHighResolutionPlayback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sr_playerForHighResolutionPlayback:");
}

id objc_msgSend__startListenAfterSpeaking(void *a1, const char *a2, ...)
{
  return _[a1 _startListenAfterSpeaking];
}

id objc_msgSend__startListenAfterSpeakingRequest(void *a1, const char *a2, ...)
{
  return _[a1 _startListenAfterSpeakingRequest];
}

id objc_msgSend__startNewConversation(void *a1, const char *a2, ...)
{
  return _[a1 _startNewConversation];
}

id objc_msgSend__startRequestWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startRequestWithOptions:");
}

id objc_msgSend__streamingTextMaxYToTapToEditOriginDistance(void *a1, const char *a2, ...)
{
  return _[a1 _streamingTextMaxYToTapToEditOriginDistance];
}

id objc_msgSend__suppressTTSForErrorsAndInterstitials(void *a1, const char *a2, ...)
{
  return _[a1 _suppressTTSForErrorsAndInterstitials];
}

id objc_msgSend__synthesizePhoneticText_identifier_sessionId_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_synthesizePhoneticText:identifier:sessionId:completion:");
}

id objc_msgSend__synthesizeSpeechWithText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_synthesizeSpeechWithText:");
}

id objc_msgSend__synthesizeText_identifier_sessionId_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_synthesizeText:identifier:sessionId:completion:");
}

id objc_msgSend__tagPhraseLabelFont(void *a1, const char *a2, ...)
{
  return _[a1 _tagPhraseLabelFont];
}

id objc_msgSend__textView(void *a1, const char *a2, ...)
{
  return _[a1 _textView];
}

id objc_msgSend__titleForSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_titleForSection:");
}

id objc_msgSend__toPlatteredCardViewGivenToViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_toPlatteredCardViewGivenToViewController:");
}

id objc_msgSend__trailingHorizontalOffsetWithLayoutMargins_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_trailingHorizontalOffsetWithLayoutMargins:");
}

id objc_msgSend__transformDialogAddViews_forMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_transformDialogAddViews:forMode:");
}

id objc_msgSend__transformLegacyAddViews_forMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_transformLegacyAddViews:forMode:");
}

id objc_msgSend__transitionDurationForOperation_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_transitionDurationForOperation:context:");
}

id objc_msgSend__transitionWithContext_animated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_transitionWithContext:animated:completion:");
}

id objc_msgSend__typeOfAddViews_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_typeOfAddViews:");
}

id objc_msgSend__uiPresentationIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 _uiPresentationIdentifier];
}

id objc_msgSend__updateBlurVisibility(void *a1, const char *a2, ...)
{
  return _[a1 _updateBlurVisibility];
}

id objc_msgSend__updateDeferral(void *a1, const char *a2, ...)
{
  return _[a1 _updateDeferral];
}

id objc_msgSend__updateKeyboardState_minimized_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateKeyboardState:minimized:");
}

id objc_msgSend__updateKeyboardStateWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateKeyboardStateWithError:");
}

id objc_msgSend__updateKeyboardStatusForAddViewsCommand_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateKeyboardStatusForAddViewsCommand:");
}

id objc_msgSend__updateLanguageCode(void *a1, const char *a2, ...)
{
  return _[a1 _updateLanguageCode];
}

id objc_msgSend__updateViewWithChangeUtteranceIfNeeded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateViewWithChangeUtteranceIfNeeded:");
}

id objc_msgSend__updateViewWithUserUtterance_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateViewWithUserUtterance:");
}

id objc_msgSend__userNotificationCenter(void *a1, const char *a2, ...)
{
  return _[a1 _userNotificationCenter];
}

id objc_msgSend__userUtterance(void *a1, const char *a2, ...)
{
  return _[a1 _userUtterance];
}

id objc_msgSend__usesEventDrivenIdleAndQuietUpdates(void *a1, const char *a2, ...)
{
  return _[a1 _usesEventDrivenIdleAndQuietUpdates];
}

id objc_msgSend__utteranceToSpeakAfterClearScreenCommand(void *a1, const char *a2, ...)
{
  return _[a1 _utteranceToSpeakAfterClearScreenCommand];
}

id objc_msgSend__utteranceViewForDialog_mode_printedOnly_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_utteranceViewForDialog:mode:printedOnly:");
}

id objc_msgSend__utterancesForSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_utterancesForSection:");
}

id objc_msgSend__voicemailPlayer(void *a1, const char *a2, ...)
{
  return _[a1 _voicemailPlayer];
}

id objc_msgSend__wasSiriIdleAndQuiet(void *a1, const char *a2, ...)
{
  return _[a1 _wasSiriIdleAndQuiet];
}

id objc_msgSend__windowInterfaceOrientation(void *a1, const char *a2, ...)
{
  return _[a1 _windowInterfaceOrientation];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return _[a1 absoluteString];
}

id objc_msgSend_ac_isBluetoothVehicle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ac_isBluetoothVehicle");
}

id objc_msgSend_ac_isEyesFree(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ac_isEyesFree");
}

id objc_msgSend_accessibilityContrast(void *a1, const char *a2, ...)
{
  return _[a1 accessibilityContrast];
}

id objc_msgSend_aceAudioData(void *a1, const char *a2, ...)
{
  return _[a1 aceAudioData];
}

id objc_msgSend_aceCommandIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 aceCommandIdentifier];
}

id objc_msgSend_aceCommandWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aceCommandWithIdentifier:");
}

id objc_msgSend_aceDialogPhaseValue(void *a1, const char *a2, ...)
{
  return _[a1 aceDialogPhaseValue];
}

id objc_msgSend_aceDisplayColorGamut(void *a1, const char *a2, ...)
{
  return _[a1 aceDisplayColorGamut];
}

id objc_msgSend_aceDisplayColorScheme(void *a1, const char *a2, ...)
{
  return _[a1 aceDisplayColorScheme];
}

id objc_msgSend_aceDisplayContrast(void *a1, const char *a2, ...)
{
  return _[a1 aceDisplayContrast];
}

id objc_msgSend_aceDynamicTypeSize(void *a1, const char *a2, ...)
{
  return _[a1 aceDynamicTypeSize];
}

id objc_msgSend_aceId(void *a1, const char *a2, ...)
{
  return _[a1 aceId];
}

id objc_msgSend_aceObject(void *a1, const char *a2, ...)
{
  return _[a1 aceObject];
}

id objc_msgSend_aceObjectWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aceObjectWithDictionary:");
}

id objc_msgSend_aceTextLegibilityWeight(void *a1, const char *a2, ...)
{
  return _[a1 aceTextLegibilityWeight];
}

id objc_msgSend_acousticIDRequestDidFinishWithSuccess_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acousticIDRequestDidFinishWithSuccess:");
}

id objc_msgSend_acousticIDRequestDidStart(void *a1, const char *a2, ...)
{
  return _[a1 acousticIDRequestDidStart];
}

id objc_msgSend_acousticIdEnabled(void *a1, const char *a2, ...)
{
  return _[a1 acousticIdEnabled];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return _[a1 activate];
}

id objc_msgSend_activationEvent(void *a1, const char *a2, ...)
{
  return _[a1 activationEvent];
}

id objc_msgSend_activationRequestFromSimpleActivation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activationRequestFromSimpleActivation:");
}

id objc_msgSend_activeInterfaceOrientation(void *a1, const char *a2, ...)
{
  return _[a1 activeInterfaceOrientation];
}

id objc_msgSend_activeKeyboard(void *a1, const char *a2, ...)
{
  return _[a1 activeKeyboard];
}

id objc_msgSend_activeRequestOptionsDidChange(void *a1, const char *a2, ...)
{
  return _[a1 activeRequestOptionsDidChange];
}

id objc_msgSend_addAdditionalSpeechInterpretation_refId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAdditionalSpeechInterpretation:refId:");
}

id objc_msgSend_addAttribute_value_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAttribute:value:range:");
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addChildViewController:");
}

id objc_msgSend_addConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addConstraint:");
}

id objc_msgSend_addConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addConstraints:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addGestureRecognizer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addGestureRecognizer:");
}

id objc_msgSend_addItemForMusicStartSessionCommand_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addItemForMusicStartSessionCommand:");
}

id objc_msgSend_addItemForPartialResultCommand_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addItemForPartialResultCommand:");
}

id objc_msgSend_addItemForSpeechRecognizedCommand_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addItemForSpeechRecognizedCommand:");
}

id objc_msgSend_addItemsForAddViewsCommand_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addItemsForAddViewsCommand:");
}

id objc_msgSend_addItemsForShowHelpCommand_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addItemsForShowHelpCommand:");
}

id objc_msgSend_addNotificationRequest_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addNotificationRequest:withCompletionHandler:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addOperationWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addOperationWithBlock:");
}

id objc_msgSend_addRecognitionUpdateWithPhrases_utterances_refId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRecognitionUpdateWithPhrases:utterances:refId:");
}

id objc_msgSend_addReplayControlTo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addReplayControlTo:");
}

id objc_msgSend_addSelectionResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSelectionResponse:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_addTarget_action_forControlEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTarget:action:forControlEvents:");
}

id objc_msgSend_additionalSpeechInterpretationsForRefId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "additionalSpeechInterpretationsForRefId:");
}

id objc_msgSend_address(void *a1, const char *a2, ...)
{
  return _[a1 address];
}

id objc_msgSend_af_bestTextInterpretation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "af_bestTextInterpretation");
}

id objc_msgSend_af_dialogPhase(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "af_dialogPhase");
}

id objc_msgSend_af_userUtteranceValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "af_userUtteranceValue");
}

id objc_msgSend_af_userUtteranceValueWithRefId_sessionId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "af_userUtteranceValueWithRefId:sessionId:");
}

id objc_msgSend_afui_assistantUIFrameworkBundle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "afui_assistantUIFrameworkBundle");
}

id objc_msgSend_afui_getInstallAppPunchoutWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "afui_getInstallAppPunchoutWithCompletion:");
}

id objc_msgSend_afui_isRemoteHeadsetActivation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "afui_isRemoteHeadsetActivation");
}

id objc_msgSend_afui_isTVFollowUpHearstActivation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "afui_isTVFollowUpHearstActivation");
}

id objc_msgSend_afui_populateStoreServicesData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "afui_populateStoreServicesData:");
}

id objc_msgSend_afui_punchOutAppNotAvailableViews(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "afui_punchOutAppNotAvailableViews");
}

id objc_msgSend_afui_punchOutFailureViews(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "afui_punchOutFailureViews");
}

id objc_msgSend_alertWithConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alertWithConfiguration:");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_allPhrases(void *a1, const char *a2, ...)
{
  return _[a1 allPhrases];
}

id objc_msgSend_allRecognitionStringsAndScores(void *a1, const char *a2, ...)
{
  return _[a1 allRecognitionStringsAndScores];
}

id objc_msgSend_allWindowsIncludingInternalWindows_onlyVisibleWindows_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allWindowsIncludingInternalWindows:onlyVisibleWindows:");
}

id objc_msgSend_alternativePunchOut(void *a1, const char *a2, ...)
{
  return _[a1 alternativePunchOut];
}

id objc_msgSend_animateAlongsideTransition_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateAlongsideTransition:completion:");
}

id objc_msgSend_animateOutWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateOutWithCompletion:");
}

id objc_msgSend_animateToDisplayWithDuration_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateToDisplayWithDuration:completion:");
}

id objc_msgSend_animateToEditWithDuration_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateToEditWithDuration:completion:");
}

id objc_msgSend_animateWithDuration_animations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateWithDuration:animations:");
}

id objc_msgSend_animateWithDuration_animations_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateWithDuration:animations:completion:");
}

id objc_msgSend_animateWithDuration_delay_usingSpringWithDamping_initialSpringVelocity_options_animations_completion_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:");
}

id objc_msgSend_animatedDisappearanceDidBeginWithDuration_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animatedDisappearanceDidBeginWithDuration:reason:");
}

id objc_msgSend_animation(void *a1, const char *a2, ...)
{
  return _[a1 animation];
}

id objc_msgSend_appAvailableInStorefront(void *a1, const char *a2, ...)
{
  return _[a1 appAvailableInStorefront];
}

id objc_msgSend_appDisplayName(void *a1, const char *a2, ...)
{
  return _[a1 appDisplayName];
}

id objc_msgSend_appIcon(void *a1, const char *a2, ...)
{
  return _[a1 appIcon];
}

id objc_msgSend_appId(void *a1, const char *a2, ...)
{
  return _[a1 appId];
}

id objc_msgSend_appPunchOut(void *a1, const char *a2, ...)
{
  return _[a1 appPunchOut];
}

id objc_msgSend_appPunchOutButton(void *a1, const char *a2, ...)
{
  return _[a1 appPunchOutButton];
}

id objc_msgSend_appWindow(void *a1, const char *a2, ...)
{
  return _[a1 appWindow];
}

id objc_msgSend_appendAttributedString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendAttributedString:");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendSeparatorToViewControllers_forNextViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendSeparatorToViewControllers:forNextViewController:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendString:");
}

id objc_msgSend_applyInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyInfo:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByAddingObjectsFromArray:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_ascender(void *a1, const char *a2, ...)
{
  return _[a1 ascender];
}

id objc_msgSend_assetsDownloading(void *a1, const char *a2, ...)
{
  return _[a1 assetsDownloading];
}

id objc_msgSend_assetsNeedSpace(void *a1, const char *a2, ...)
{
  return _[a1 assetsNeedSpace];
}

id objc_msgSend_assistantIsEnabled(void *a1, const char *a2, ...)
{
  return _[a1 assistantIsEnabled];
}

id objc_msgSend_assistantUILocalizedStringForKey_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assistantUILocalizedStringForKey:table:");
}

id objc_msgSend_attachmentURLForExpression_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attachmentURLForExpression:");
}

id objc_msgSend_attemptedToSaveConversation_withResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attemptedToSaveConversation:withResult:");
}

id objc_msgSend_attribute_atIndex_effectiveRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attribute:atIndex:effectiveRange:");
}

id objc_msgSend_attributeForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributeForKey:");
}

id objc_msgSend_attributedStringAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributedStringAtIndex:");
}

id objc_msgSend_attributedText(void *a1, const char *a2, ...)
{
  return _[a1 attributedText];
}

id objc_msgSend_audioBuffer(void *a1, const char *a2, ...)
{
  return _[a1 audioBuffer];
}

id objc_msgSend_audioData(void *a1, const char *a2, ...)
{
  return _[a1 audioData];
}

id objc_msgSend_audioDuration(void *a1, const char *a2, ...)
{
  return _[a1 audioDuration];
}

id objc_msgSend_audioMessagePlayer(void *a1, const char *a2, ...)
{
  return _[a1 audioMessagePlayer];
}

id objc_msgSend_audioPlayer_didFinishPlayback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "audioPlayer:didFinishPlayback:");
}

id objc_msgSend_autoDismissalIdleTimeout(void *a1, const char *a2, ...)
{
  return _[a1 autoDismissalIdleTimeout];
}

id objc_msgSend_availabilityState(void *a1, const char *a2, ...)
{
  return _[a1 availabilityState];
}

id objc_msgSend_backgroundPlatteredCardView(void *a1, const char *a2, ...)
{
  return _[a1 backgroundPlatteredCardView];
}

id objc_msgSend_backgroundPlatteredCardViewOriginalFrame(void *a1, const char *a2, ...)
{
  return _[a1 backgroundPlatteredCardViewOriginalFrame];
}

id objc_msgSend_backingStore(void *a1, const char *a2, ...)
{
  return _[a1 backingStore];
}

id objc_msgSend_baselineOffsetFromBottom(void *a1, const char *a2, ...)
{
  return _[a1 baselineOffsetFromBottom];
}

id objc_msgSend_becomeFirstResponder(void *a1, const char *a2, ...)
{
  return _[a1 becomeFirstResponder];
}

id objc_msgSend_beginBackgroundTaskWithExpirationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginBackgroundTaskWithExpirationHandler:");
}

id objc_msgSend_beginEditing(void *a1, const char *a2, ...)
{
  return _[a1 beginEditing];
}

id objc_msgSend_beginningOfDocument(void *a1, const char *a2, ...)
{
  return _[a1 beginningOfDocument];
}

id objc_msgSend_bestSupportedLanguageCodeForLanguageCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bestSupportedLanguageCodeForLanguageCode:");
}

id objc_msgSend_bestTextInterpretation(void *a1, const char *a2, ...)
{
  return _[a1 bestTextInterpretation];
}

id objc_msgSend_bluetoothPreferredCarAudioRoute(void *a1, const char *a2, ...)
{
  return _[a1 bluetoothPreferredCarAudioRoute];
}

id objc_msgSend_blurFromRootNavigationTransitionController_requestBackgroundBlurViewVisible_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "blurFromRootNavigationTransitionController:requestBackgroundBlurViewVisible:");
}

id objc_msgSend_blurFromRootNavigationTransitionController_requestHostBlurVisible_requestPresentationBlurVisible_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "blurFromRootNavigationTransitionController:requestHostBlurVisible:requestPresentationBlurVisible:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_boostQueuedMessagesAndPerformOnQueueCompletion_timeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "boostQueuedMessagesAndPerformOnQueueCompletion:timeout:");
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return _[a1 bottomAnchor];
}

id objc_msgSend_boundingRectWithSize_options_attributes_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "boundingRectWithSize:options:attributes:context:");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _[a1 bounds];
}

id objc_msgSend_broadcastCardSnippet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "broadcastCardSnippet:");
}

id objc_msgSend_broadcastVisualResponseSnippet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "broadcastVisualResponseSnippet:");
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_bundleId(void *a1, const char *a2, ...)
{
  return _[a1 bundleId];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_bundleWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleWithIdentifier:");
}

id objc_msgSend_bundleWithURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleWithURL:");
}

id objc_msgSend_button(void *a1, const char *a2, ...)
{
  return _[a1 button];
}

id objc_msgSend_buttonWithImageTemplate_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buttonWithImageTemplate:style:");
}

id objc_msgSend_buttonWithMediumWeightFont(void *a1, const char *a2, ...)
{
  return _[a1 buttonWithMediumWeightFont];
}

id objc_msgSend_cachedGuideSnippet(void *a1, const char *a2, ...)
{
  return _[a1 cachedGuideSnippet];
}

id objc_msgSend_callCount(void *a1, const char *a2, ...)
{
  return _[a1 callCount];
}

id objc_msgSend_callTime(void *a1, const char *a2, ...)
{
  return _[a1 callTime];
}

id objc_msgSend_calls(void *a1, const char *a2, ...)
{
  return _[a1 calls];
}

id objc_msgSend_canBeRefreshed(void *a1, const char *a2, ...)
{
  return _[a1 canBeRefreshed];
}

id objc_msgSend_canSaveConversations(void *a1, const char *a2, ...)
{
  return _[a1 canSaveConversations];
}

id objc_msgSend_canUseServerTTS(void *a1, const char *a2, ...)
{
  return _[a1 canUseServerTTS];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return _[a1 cancel];
}

id objc_msgSend_cancelInteractiveTransition(void *a1, const char *a2, ...)
{
  return _[a1 cancelInteractiveTransition];
}

id objc_msgSend_cancelItemWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelItemWithIdentifier:");
}

id objc_msgSend_cancelPrewarmForFirstTapOfQuickTypeToSiriGesture(void *a1, const char *a2, ...)
{
  return _[a1 cancelPrewarmForFirstTapOfQuickTypeToSiriGesture];
}

id objc_msgSend_cancelSpeechRequest(void *a1, const char *a2, ...)
{
  return _[a1 cancelSpeechRequest];
}

id objc_msgSend_caption(void *a1, const char *a2, ...)
{
  return _[a1 caption];
}

id objc_msgSend_cardData(void *a1, const char *a2, ...)
{
  return _[a1 cardData];
}

id objc_msgSend_cardSnippet(void *a1, const char *a2, ...)
{
  return _[a1 cardSnippet];
}

id objc_msgSend_caseInsensitiveCompare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "caseInsensitiveCompare:");
}

id objc_msgSend_certSerial(void *a1, const char *a2, ...)
{
  return _[a1 certSerial];
}

id objc_msgSend_changeUtterance_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "changeUtterance:");
}

id objc_msgSend_checkAssetsWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkAssetsWithCompletion:");
}

id objc_msgSend_chevronHasBeenShown(void *a1, const char *a2, ...)
{
  return _[a1 chevronHasBeenShown];
}

id objc_msgSend_chevronTrailingMargin(void *a1, const char *a2, ...)
{
  return _[a1 chevronTrailingMargin];
}

id objc_msgSend_childViewControllers(void *a1, const char *a2, ...)
{
  return _[a1 childViewControllers];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return _[a1 clearColor];
}

id objc_msgSend_clearContext(void *a1, const char *a2, ...)
{
  return _[a1 clearContext];
}

id objc_msgSend_clearCurrentSuggestions(void *a1, const char *a2, ...)
{
  return _[a1 clearCurrentSuggestions];
}

id objc_msgSend_closestPositionToPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "closestPositionToPoint:");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_collectionView(void *a1, const char *a2, ...)
{
  return _[a1 collectionView];
}

id objc_msgSend_collectionViewContentSize(void *a1, const char *a2, ...)
{
  return _[a1 collectionViewContentSize];
}

id objc_msgSend_collectionViewLayout(void *a1, const char *a2, ...)
{
  return _[a1 collectionViewLayout];
}

id objc_msgSend_colorWithWhite_alpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorWithWhite:alpha:");
}

id objc_msgSend_combinedRank(void *a1, const char *a2, ...)
{
  return _[a1 combinedRank];
}

id objc_msgSend_combinedScore(void *a1, const char *a2, ...)
{
  return _[a1 combinedScore];
}

id objc_msgSend_commands(void *a1, const char *a2, ...)
{
  return _[a1 commands];
}

id objc_msgSend_compactResultView(void *a1, const char *a2, ...)
{
  return _[a1 compactResultView];
}

id objc_msgSend_compactResultViewController(void *a1, const char *a2, ...)
{
  return _[a1 compactResultViewController];
}

id objc_msgSend_compactViewHasContent(void *a1, const char *a2, ...)
{
  return _[a1 compactViewHasContent];
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:");
}

id objc_msgSend_completeTransition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "completeTransition:");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_computedModeForAceCommand_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "computedModeForAceCommand:");
}

id objc_msgSend_computedModeForRefId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "computedModeForRefId:");
}

id objc_msgSend_confidenceScore(void *a1, const char *a2, ...)
{
  return _[a1 confidenceScore];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return _[a1 configuration];
}

id objc_msgSend_configureConnection(void *a1, const char *a2, ...)
{
  return _[a1 configureConnection];
}

id objc_msgSend_configureConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureConnection:");
}

id objc_msgSend_configureForRequestOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureForRequestOptions:");
}

id objc_msgSend_configureOptionsForImminentRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureOptionsForImminentRequest:");
}

id objc_msgSend_configureReusableFooterView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureReusableFooterView:");
}

id objc_msgSend_confirmationOptions(void *a1, const char *a2, ...)
{
  return _[a1 confirmationOptions];
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conformsToProtocol:");
}

id objc_msgSend_connectedAccessories(void *a1, const char *a2, ...)
{
  return _[a1 connectedAccessories];
}

id objc_msgSend_connectedDevices(void *a1, const char *a2, ...)
{
  return _[a1 connectedDevices];
}

id objc_msgSend_connectionWithEndpoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectionWithEndpoint:");
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToAnchor:");
}

id objc_msgSend_constraintEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToAnchor:constant:");
}

id objc_msgSend_constraintEqualToConstant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToConstant:");
}

id objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:");
}

id objc_msgSend_constraints(void *a1, const char *a2, ...)
{
  return _[a1 constraints];
}

id objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintsWithVisualFormat:options:metrics:views:");
}

id objc_msgSend_contact(void *a1, const char *a2, ...)
{
  return _[a1 contact];
}

id objc_msgSend_containerView(void *a1, const char *a2, ...)
{
  return _[a1 containerView];
}

id objc_msgSend_containsItemForAceViewWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsItemForAceViewWithIdentifier:");
}

id objc_msgSend_containsItemWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsItemWithIdentifier:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return _[a1 content];
}

id objc_msgSend_contentPlatterView(void *a1, const char *a2, ...)
{
  return _[a1 contentPlatterView];
}

id objc_msgSend_contentPlatterViewController(void *a1, const char *a2, ...)
{
  return _[a1 contentPlatterViewController];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return _[a1 contentView];
}

id objc_msgSend_contentWidthForForSiriPresentation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentWidthForForSiriPresentation:");
}

id objc_msgSend_contentWidthForSuggestionsViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentWidthForSuggestionsViewController:");
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return _[a1 context];
}

id objc_msgSend_contextMenuIsPresented(void *a1, const char *a2, ...)
{
  return _[a1 contextMenuIsPresented];
}

id objc_msgSend_contingency(void *a1, const char *a2, ...)
{
  return _[a1 contingency];
}

id objc_msgSend_conversation_didChangePresentationStateForItemsAtIndexPaths_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversation:didChangePresentationStateForItemsAtIndexPaths:");
}

id objc_msgSend_conversation_didChangeWithTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversation:didChangeWithTransaction:");
}

id objc_msgSend_conversation_didInsertItemsAtIndexPaths_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversation:didInsertItemsAtIndexPaths:");
}

id objc_msgSend_conversation_didRemoveItemsWithIdentifiers_atIndexPaths_parentItemIdentifiers_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversation:didRemoveItemsWithIdentifiers:atIndexPaths:parentItemIdentifiers:");
}

id objc_msgSend_conversation_didUpdateItemsAtIndexPaths_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversation:didUpdateItemsAtIndexPaths:");
}

id objc_msgSend_conversationIdentifiersForSiriPresentation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversationIdentifiersForSiriPresentation:");
}

id objc_msgSend_conversationItemIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 conversationItemIdentifier];
}

id objc_msgSend_conversationListDidChange(void *a1, const char *a2, ...)
{
  return _[a1 conversationListDidChange];
}

id objc_msgSend_convertRect_fromView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertRect:fromView:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_correctionIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 correctionIdentifier];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createEditableUtteranceView(void *a1, const char *a2, ...)
{
  return _[a1 createEditableUtteranceView];
}

id objc_msgSend_createViewArray(void *a1, const char *a2, ...)
{
  return _[a1 createViewArray];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return _[a1 currentCalendar];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return _[a1 currentDevice];
}

id objc_msgSend_currentIdiom(void *a1, const char *a2, ...)
{
  return _[a1 currentIdiom];
}

id objc_msgSend_currentInstrumentationTurnContext(void *a1, const char *a2, ...)
{
  return _[a1 currentInstrumentationTurnContext];
}

id objc_msgSend_currentSnippetContainsFooterButtons(void *a1, const char *a2, ...)
{
  return _[a1 currentSnippetContainsFooterButtons];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return _[a1 data];
}

id objc_msgSend_dataSource(void *a1, const char *a2, ...)
{
  return _[a1 dataSource];
}

id objc_msgSend_dataType(void *a1, const char *a2, ...)
{
  return _[a1 dataType];
}

id objc_msgSend_dataWithContentsOfURL_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithContentsOfURL:options:error:");
}

id objc_msgSend_dataWithJSONObject_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithJSONObject:options:error:");
}

id objc_msgSend_dataWithPropertyList_format_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithPropertyList:format:options:error:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateByAddingUnit_value_toDate_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateByAddingUnit:value:toDate:options:");
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceNow:");
}

id objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceReferenceDate:");
}

id objc_msgSend_debugButtonIsEnabled(void *a1, const char *a2, ...)
{
  return _[a1 debugButtonIsEnabled];
}

id objc_msgSend_defaultBrowserBundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 defaultBrowserBundleIdentifier];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultHeight(void *a1, const char *a2, ...)
{
  return _[a1 defaultHeight];
}

id objc_msgSend_defaultInsets(void *a1, const char *a2, ...)
{
  return _[a1 defaultInsets];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_defaultSynchedKnowledgeStore(void *a1, const char *a2, ...)
{
  return _[a1 defaultSynchedKnowledgeStore];
}

id objc_msgSend_deferredRendering(void *a1, const char *a2, ...)
{
  return _[a1 deferredRendering];
}

id objc_msgSend_delayDismissalAfterIdleFires_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "delayDismissalAfterIdleFires:");
}

id objc_msgSend_delayDismissalMs(void *a1, const char *a2, ...)
{
  return _[a1 delayDismissalMs];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_dequeueReusableCellWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dequeueReusableCellWithIdentifier:");
}

id objc_msgSend_dequeueReusableCellWithReuseIdentifier_forIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dequeueReusableCellWithReuseIdentifier:forIndexPath:");
}

id objc_msgSend_dequeueReusableSupplementaryViewOfKind_withReuseIdentifier_forIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:");
}

id objc_msgSend_descender(void *a1, const char *a2, ...)
{
  return _[a1 descender];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_descriptionForAceView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptionForAceView:");
}

id objc_msgSend_descriptionForSayIt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptionForSayIt:");
}

id objc_msgSend_deselectItemAtIndexPath_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deselectItemAtIndexPath:animated:");
}

id objc_msgSend_deviceIsPad(void *a1, const char *a2, ...)
{
  return _[a1 deviceIsPad];
}

id objc_msgSend_deviceSpecificKeyForDefaultKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceSpecificKeyForDefaultKey:");
}

id objc_msgSend_deviceType(void *a1, const char *a2, ...)
{
  return _[a1 deviceType];
}

id objc_msgSend_dialog(void *a1, const char *a2, ...)
{
  return _[a1 dialog];
}

id objc_msgSend_dialogIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 dialogIdentifier];
}

id objc_msgSend_dialogPhase(void *a1, const char *a2, ...)
{
  return _[a1 dialogPhase];
}

id objc_msgSend_dialogPhaseForAceDialogPhase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dialogPhaseForAceDialogPhase:");
}

id objc_msgSend_dialogPhaseForAceObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dialogPhaseForAceObject:");
}

id objc_msgSend_dialogStrings(void *a1, const char *a2, ...)
{
  return _[a1 dialogStrings];
}

id objc_msgSend_dialogs(void *a1, const char *a2, ...)
{
  return _[a1 dialogs];
}

id objc_msgSend_dictationResult(void *a1, const char *a2, ...)
{
  return _[a1 dictationResult];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithCapacity:");
}

id objc_msgSend_dictionaryWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithContentsOfFile:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didBecomeActiveHandler(void *a1, const char *a2, ...)
{
  return _[a1 didBecomeActiveHandler];
}

id objc_msgSend_didComputeMode_forAceCommand_generatedAceCommands_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didComputeMode:forAceCommand:generatedAceCommands:");
}

id objc_msgSend_didDetectGestureEvent_inRegion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didDetectGestureEvent:inRegion:");
}

id objc_msgSend_didFinishSynthesisRequest_withInstrumentMetrics_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didFinishSynthesisRequest:withInstrumentMetrics:error:");
}

id objc_msgSend_didMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didMoveToParentViewController:");
}

id objc_msgSend_didPresentResponseFullyInApp(void *a1, const char *a2, ...)
{
  return _[a1 didPresentResponseFullyInApp];
}

id objc_msgSend_didReceiveAddViewsDialogPhaseForSuggestions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didReceiveAddViewsDialogPhaseForSuggestions:");
}

id objc_msgSend_didReceiveAddViewsSignalForSuggestions_currentMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didReceiveAddViewsSignalForSuggestions:currentMode:");
}

id objc_msgSend_didReceiveBugButtonLongPress(void *a1, const char *a2, ...)
{
  return _[a1 didReceiveBugButtonLongPress];
}

id objc_msgSend_didReceiveHelpAction(void *a1, const char *a2, ...)
{
  return _[a1 didReceiveHelpAction];
}

id objc_msgSend_didReceiveOrbViewTapToCancelRequest(void *a1, const char *a2, ...)
{
  return _[a1 didReceiveOrbViewTapToCancelRequest];
}

id objc_msgSend_didReceivePaginateListCommand_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didReceivePaginateListCommand:completion:");
}

id objc_msgSend_didReceiveReportBugAction(void *a1, const char *a2, ...)
{
  return _[a1 didReceiveReportBugAction];
}

id objc_msgSend_didReceiveRevealRecognizedSpeechCommand_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didReceiveRevealRecognizedSpeechCommand:");
}

id objc_msgSend_didReceiveUpdateVisualResponseCommand_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didReceiveUpdateVisualResponseCommand:");
}

id objc_msgSend_didResignFirstResponderFromUtterancePresenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didResignFirstResponderFromUtterancePresenter:");
}

id objc_msgSend_didResignFirstResponderFromUtteranceView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didResignFirstResponderFromUtteranceView:");
}

id objc_msgSend_didResignFirstResponderFromUtteranceViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didResignFirstResponderFromUtteranceViewController:");
}

id objc_msgSend_disableIdleTimerForSiriPresentation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disableIdleTimerForSiriPresentation:");
}

id objc_msgSend_disableTouchIDFaceIDIfNecessaryForDucID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disableTouchIDFaceIDIfNecessaryForDucID:");
}

id objc_msgSend_discoverabilitySignal(void *a1, const char *a2, ...)
{
  return _[a1 discoverabilitySignal];
}

id objc_msgSend_dismissEditableUtteranceViewControllerAndShouldStartNewRequest_completion_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissEditableUtteranceViewControllerAndShouldStartNewRequest:completion:");
}

id objc_msgSend_dismissRecordingOverlayAndHideSnippets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissRecordingOverlayAndHideSnippets:");
}

id objc_msgSend_dismissSiriPresentation_withReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissSiriPresentation:withReason:");
}

id objc_msgSend_dismissSiriResults(void *a1, const char *a2, ...)
{
  return _[a1 dismissSiriResults];
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_dismissalUserInfo(void *a1, const char *a2, ...)
{
  return _[a1 dismissalUserInfo];
}

id objc_msgSend_displayGamut(void *a1, const char *a2, ...)
{
  return _[a1 displayGamut];
}

id objc_msgSend_displayText(void *a1, const char *a2, ...)
{
  return _[a1 displayText];
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return _[a1 distantPast];
}

id objc_msgSend_dockFrameDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dockFrameDidChange:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _[a1 domain];
}

id objc_msgSend_domainDisplayName(void *a1, const char *a2, ...)
{
  return _[a1 domainDisplayName];
}

id objc_msgSend_domainObjectForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "domainObjectForIdentifier:");
}

id objc_msgSend_domainObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "domainObjectForKey:");
}

id objc_msgSend_domainObjectStoreForSiriPresentation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "domainObjectStoreForSiriPresentation:");
}

id objc_msgSend_domainSnippets(void *a1, const char *a2, ...)
{
  return _[a1 domainSnippets];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_downloadSiriAssetsIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 downloadSiriAssetsIfNeeded];
}

id objc_msgSend_dryRun(void *a1, const char *a2, ...)
{
  return _[a1 dryRun];
}

id objc_msgSend_duckTTSVolumeTo_rampTime_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "duckTTSVolumeTo:rampTime:completion:");
}

id objc_msgSend_edgeInsets(void *a1, const char *a2, ...)
{
  return _[a1 edgeInsets];
}

id objc_msgSend_editableTextViewRequestKeyboardForTapToEditWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "editableTextViewRequestKeyboardForTapToEditWithCompletion:");
}

id objc_msgSend_editableTextViewTextDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "editableTextViewTextDidChange:");
}

id objc_msgSend_editableTextViewTextDidFinishCorrecting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "editableTextViewTextDidFinishCorrecting:");
}

id objc_msgSend_editableTextViewTextDidReceiveReturnKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "editableTextViewTextDidReceiveReturnKey:");
}

id objc_msgSend_editableTextViewTextDidResignFirstResponder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "editableTextViewTextDidResignFirstResponder:");
}

id objc_msgSend_editableTextViewTextShouldPreventCorrection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "editableTextViewTextShouldPreventCorrection:");
}

id objc_msgSend_editableTextViewTextWillBeginCorrecting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "editableTextViewTextWillBeginCorrecting:");
}

id objc_msgSend_editableUtterancePresenter_didFinishEditingWithText_selectionResults_shouldStartNewRequest_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "editableUtterancePresenter:didFinishEditingWithText:selectionResults:shouldStartNewRequest:");
}

id objc_msgSend_editableUtterancePresenter_openURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "editableUtterancePresenter:openURL:");
}

id objc_msgSend_editableUtterancePresenter_requestsKeyboardWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "editableUtterancePresenter:requestsKeyboardWithCompletion:");
}

id objc_msgSend_editableUtteranceView_didFinishEditingWithText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "editableUtteranceView:didFinishEditingWithText:");
}

id objc_msgSend_editableUtteranceView_requestsKeyboardWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "editableUtteranceView:requestsKeyboardWithCompletion:");
}

id objc_msgSend_editableUtteranceViewController_alternativeSelectedAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "editableUtteranceViewController:alternativeSelectedAtIndex:");
}

id objc_msgSend_editableUtteranceViewController_didFinishEditingWithText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "editableUtteranceViewController:didFinishEditingWithText:");
}

id objc_msgSend_editableUtteranceViewController_openURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "editableUtteranceViewController:openURL:");
}

id objc_msgSend_editableUtteranceViewController_requestsKeyboardWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "editableUtteranceViewController:requestsKeyboardWithCompletion:");
}

id objc_msgSend_editableUtteranceViewHasContent(void *a1, const char *a2, ...)
{
  return _[a1 editableUtteranceViewHasContent];
}

id objc_msgSend_effectiveContentFrame(void *a1, const char *a2, ...)
{
  return _[a1 effectiveContentFrame];
}

id objc_msgSend_emailAddress(void *a1, const char *a2, ...)
{
  return _[a1 emailAddress];
}

id objc_msgSend_emails(void *a1, const char *a2, ...)
{
  return _[a1 emails];
}

id objc_msgSend_emitFinalSpeechTranscriptionEventForAceObjectWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "emitFinalSpeechTranscriptionEventForAceObjectWithIdentifier:");
}

id objc_msgSend_emitInstrumentation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "emitInstrumentation:");
}

id objc_msgSend_emitInstrumentation_atTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "emitInstrumentation:atTime:");
}

id objc_msgSend_emitPartialSpeechTranscriptionEventForAceObjectWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "emitPartialSpeechTranscriptionEventForAceObjectWithIdentifier:");
}

id objc_msgSend_emitPunchOutEventWithURL_appID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "emitPunchOutEventWithURL:appID:");
}

id objc_msgSend_emitRequestFailedWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "emitRequestFailedWithError:");
}

id objc_msgSend_emitRevealSpeechTranscriptionEventForAceObjectWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "emitRevealSpeechTranscriptionEventForAceObjectWithIdentifier:");
}

id objc_msgSend_emitUIStateTransitionEventWithFromState_toState_withPresentationType_machAbsoluteTransitionTime_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "emitUIStateTransitionEventWithFromState:toState:withPresentationType:machAbsoluteTransitionTime:");
}

id objc_msgSend_emitUIStateTransitionForSiriDismissalWithReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "emitUIStateTransitionForSiriDismissalWithReason:");
}

id objc_msgSend_emitUUFRShownForAceObject_presentationType_dialogPhase_mode_viewRegion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "emitUUFRShownForAceObject:presentationType:dialogPhase:mode:viewRegion:");
}

id objc_msgSend_emitUUFRSpokenForAceObject_presentationType_dialogPhase_mode_speakableText_dialogIdentifierOverride_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "emitUUFRSpokenForAceObject:presentationType:dialogPhase:mode:speakableText:dialogIdentifierOverride:");
}

id objc_msgSend_emitUserBargeInEventForBargedInTurn(void *a1, const char *a2, ...)
{
  return _[a1 emitUserBargeInEventForBargedInTurn];
}

id objc_msgSend_emitWithTurnIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "emitWithTurnIdentifier:");
}

id objc_msgSend_enableIdleTimerForSiriPresentation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enableIdleTimerForSiriPresentation:");
}

id objc_msgSend_encodedClassName(void *a1, const char *a2, ...)
{
  return _[a1 encodedClassName];
}

id objc_msgSend_endBackgroundTask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endBackgroundTask:");
}

id objc_msgSend_endEditingAndCorrect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endEditingAndCorrect:");
}

id objc_msgSend_endingFrame(void *a1, const char *a2, ...)
{
  return _[a1 endingFrame];
}

id objc_msgSend_endpointForMachName_service_instance_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endpointForMachName:service:instance:");
}

id objc_msgSend_enqueueAudioData_identifier_sessionId_provisionally_eligibleAfterDuration_completion_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enqueueAudioData:identifier:sessionId:provisionally:eligibleAfterDuration:completion:");
}

id objc_msgSend_enqueueObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enqueueObject:");
}

id objc_msgSend_enqueuePhaticWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enqueuePhaticWithCompletion:");
}

id objc_msgSend_enqueueText_identifier_sessionId_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enqueueText:identifier:sessionId:completion:");
}

id objc_msgSend_enqueueText_identifier_sessionId_language_gender_isPhonetic_provisionally_eligibleAfterDuration_delayed_canUseServerTTS_preparationIdentifier_completion_analyticsContext_speakableContextInfo_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "enqueueText:identifier:sessionId:language:gender:isPhonetic:provisionally:eligibleAfterDuration:delayed:canUs eServerTTS:preparationIdentifier:completion:analyticsContext:speakableContextInfo:");
}

id objc_msgSend_enqueueText_identifier_sessionId_preferredVoice_language_gender_isPhonetic_provisionally_eligibleAfterDuration_delayed_canUseServerTTS_preparationIdentifier_completion_analyticsContext_speakableContextInfo_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "enqueueText:identifier:sessionId:preferredVoice:language:gender:isPhonetic:provisionally:eligibleAfterDuratio n:delayed:canUseServerTTS:preparationIdentifier:completion:analyticsContext:speakableContextInfo:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_enumerateSubstringsInRange_options_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:");
}

id objc_msgSend_enumeratorAtURL_includingPropertiesForKeys_options_errorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_exceptionWithName_reason_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exceptionWithName:reason:userInfo:");
}

id objc_msgSend_extSessionGuid(void *a1, const char *a2, ...)
{
  return _[a1 extSessionGuid];
}

id objc_msgSend_extSessionGuidCreatedTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 extSessionGuidCreatedTimestamp];
}

id objc_msgSend_extraDisambiguationSubText(void *a1, const char *a2, ...)
{
  return _[a1 extraDisambiguationSubText];
}

id objc_msgSend_extraDisambiguationText(void *a1, const char *a2, ...)
{
  return _[a1 extraDisambiguationText];
}

id objc_msgSend_faceTime(void *a1, const char *a2, ...)
{
  return _[a1 faceTime];
}

id objc_msgSend_faceTimeAudio(void *a1, const char *a2, ...)
{
  return _[a1 faceTimeAudio];
}

id objc_msgSend_feedbackForm(void *a1, const char *a2, ...)
{
  return _[a1 feedbackForm];
}

id objc_msgSend_fetchAttendingState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAttendingState:");
}

id objc_msgSend_fetchConversationWithIdentifier_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchConversationWithIdentifier:completionBlock:");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_fileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:isDirectory:");
}

id objc_msgSend_finishInteractiveTransition(void *a1, const char *a2, ...)
{
  return _[a1 finishInteractiveTransition];
}

id objc_msgSend_finishedIPTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishedIPTest:");
}

id objc_msgSend_firstLineBaselineOffsetFromTop(void *a1, const char *a2, ...)
{
  return _[a1 firstLineBaselineOffsetFromTop];
}

id objc_msgSend_firstName(void *a1, const char *a2, ...)
{
  return _[a1 firstName];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _[a1 floatValue];
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return _[a1 font];
}

id objc_msgSend_fontDescriptor(void *a1, const char *a2, ...)
{
  return _[a1 fontDescriptor];
}

id objc_msgSend_fontDescriptorWithSymbolicTraits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fontDescriptorWithSymbolicTraits:");
}

id objc_msgSend_fontWithDescriptor_size_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fontWithDescriptor:size:");
}

id objc_msgSend_footerViewClass(void *a1, const char *a2, ...)
{
  return _[a1 footerViewClass];
}

id objc_msgSend_forceAudioSessionActive(void *a1, const char *a2, ...)
{
  return _[a1 forceAudioSessionActive];
}

id objc_msgSend_forceAudioSessionActiveWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "forceAudioSessionActiveWithCompletion:");
}

id objc_msgSend_forceAudioSessionInactive(void *a1, const char *a2, ...)
{
  return _[a1 forceAudioSessionInactive];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _[a1 frame];
}

id objc_msgSend_frameForApplication_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "frameForApplication:");
}

id objc_msgSend_fromPlatteredCardView(void *a1, const char *a2, ...)
{
  return _[a1 fromPlatteredCardView];
}

id objc_msgSend_fromPlatteredCardViewOriginalFrame(void *a1, const char *a2, ...)
{
  return _[a1 fromPlatteredCardViewOriginalFrame];
}

id objc_msgSend_fullName(void *a1, const char *a2, ...)
{
  return _[a1 fullName];
}

id objc_msgSend_gender(void *a1, const char *a2, ...)
{
  return _[a1 gender];
}

id objc_msgSend_getScreenshotWithReplyHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getScreenshotWithReplyHandler:");
}

id objc_msgSend_guideSections(void *a1, const char *a2, ...)
{
  return _[a1 guideSections];
}

id objc_msgSend_guideUtterances(void *a1, const char *a2, ...)
{
  return _[a1 guideUtterances];
}

id objc_msgSend_handleChangeUtteranceCommand_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleChangeUtteranceCommand:");
}

id objc_msgSend_handleFeedbackForm_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFeedbackForm:");
}

id objc_msgSend_handleGetResponseAlternativesPlayback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleGetResponseAlternativesPlayback:");
}

id objc_msgSend_handlePasscodeUnlockWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handlePasscodeUnlockWithCompletion:");
}

id objc_msgSend_handlePlayContentCommand_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handlePlayContentCommand:completion:");
}

id objc_msgSend_handlePreSynthesisCommandWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handlePreSynthesisCommandWithError:");
}

id objc_msgSend_handleRequestEndBehavior_isAttending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleRequestEndBehavior:isAttending:");
}

id objc_msgSend_handleSelectRow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleSelectRow:");
}

id objc_msgSend_handleShowSpeechAlternativesCommand_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleShowSpeechAlternativesCommand:");
}

id objc_msgSend_hasContentAtPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasContentAtPoint:");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasPresentedSiriAssetsNotification(void *a1, const char *a2, ...)
{
  return _[a1 hasPresentedSiriAssetsNotification];
}

id objc_msgSend_hasStarColumn(void *a1, const char *a2, ...)
{
  return _[a1 hasStarColumn];
}

id objc_msgSend_hasSufficientDiskSpaceForDownload(void *a1, const char *a2, ...)
{
  return _[a1 hasSufficientDiskSpaceForDownload];
}

id objc_msgSend_hashedRouteId(void *a1, const char *a2, ...)
{
  return _[a1 hashedRouteId];
}

id objc_msgSend_headerText(void *a1, const char *a2, ...)
{
  return _[a1 headerText];
}

id objc_msgSend_headingText(void *a1, const char *a2, ...)
{
  return _[a1 headingText];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return _[a1 heightAnchor];
}

id objc_msgSend_heightOfCellWithName_tagPhrase_width_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "heightOfCellWithName:tagPhrase:width:");
}

id objc_msgSend_hideAcousticIDSpinner(void *a1, const char *a2, ...)
{
  return _[a1 hideAcousticIDSpinner];
}

id objc_msgSend_hideSnippets(void *a1, const char *a2, ...)
{
  return _[a1 hideSnippets];
}

id objc_msgSend_hiresTrailerUri(void *a1, const char *a2, ...)
{
  return _[a1 hiresTrailerUri];
}

id objc_msgSend_hitTest_withEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hitTest:withEvent:");
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return _[a1 host];
}

id objc_msgSend_hostApplicationDidBecomeActive(void *a1, const char *a2, ...)
{
  return _[a1 hostApplicationDidBecomeActive];
}

id objc_msgSend_hostApplicationWillEnterForeground(void *a1, const char *a2, ...)
{
  return _[a1 hostApplicationWillEnterForeground];
}

id objc_msgSend_hostApplicationWillResignActive(void *a1, const char *a2, ...)
{
  return _[a1 hostApplicationWillResignActive];
}

id objc_msgSend_hostDidBecomeActive(void *a1, const char *a2, ...)
{
  return _[a1 hostDidBecomeActive];
}

id objc_msgSend_hostWillResignActive(void *a1, const char *a2, ...)
{
  return _[a1 hostWillResignActive];
}

id objc_msgSend_iconDisplayIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 iconDisplayIdentifier];
}

id objc_msgSend_iconNeedsProcessing(void *a1, const char *a2, ...)
{
  return _[a1 iconNeedsProcessing];
}

id objc_msgSend_iconResourceName(void *a1, const char *a2, ...)
{
  return _[a1 iconResourceName];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_identifierForService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identifierForService:");
}

id objc_msgSend_identifierOfItemAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identifierOfItemAtIndexPath:");
}

id objc_msgSend_idleTimerInterval(void *a1, const char *a2, ...)
{
  return _[a1 idleTimerInterval];
}

id objc_msgSend_imageNamed_inBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageNamed:inBundle:");
}

id objc_msgSend_imageResource(void *a1, const char *a2, ...)
{
  return _[a1 imageResource];
}

id objc_msgSend_imageView(void *a1, const char *a2, ...)
{
  return _[a1 imageView];
}

id objc_msgSend_imageWithCGImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageWithCGImage:");
}

id objc_msgSend_imageWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageWithData:");
}

id objc_msgSend_imageWithHorizontallyFlippedOrientation(void *a1, const char *a2, ...)
{
  return _[a1 imageWithHorizontallyFlippedOrientation];
}

id objc_msgSend_imageWithRenderingMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageWithRenderingMode:");
}

id objc_msgSend_inTextInputModeForSuggestionsViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inTextInputModeForSuggestionsViewController:");
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObject:");
}

id objc_msgSend_indexOfObjectPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObjectPassingTest:");
}

id objc_msgSend_indexPathForItemWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathForItemWithIdentifier:");
}

id objc_msgSend_indexPathWithIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathWithIndex:");
}

id objc_msgSend_indexPathsForSelectedItems(void *a1, const char *a2, ...)
{
  return _[a1 indexPathsForSelectedItems];
}

id objc_msgSend_indexSetWithIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexSetWithIndex:");
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return _[a1 init];
}

id objc_msgSend_initWithActivationEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithActivationEvent:");
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_initWithBase64EncodedString_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBase64EncodedString:options:");
}

id objc_msgSend_initWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:");
}

id objc_msgSend_initWithCallRecordFilter_callRecordToCallBack_audioRoute_destinationType_contacts_callCapability_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithCallRecordFilter:callRecordToCallBack:audioRoute:destinationType:contacts:callCapability:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithCardData_responseViewId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCardData:responseViewId:");
}

id objc_msgSend_initWithCode_localizedFailureReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCode:localizedFailureReason:");
}

id objc_msgSend_initWithCode_userActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCode:userActivity:");
}

id objc_msgSend_initWithCode_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCode:userInfo:");
}

id objc_msgSend_initWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCompletion:");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_initWithDateCreated_recipient_callCapabilities_callTypes_unseen_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDateCreated:recipient:callCapabilities:callTypes:unseen:");
}

id objc_msgSend_initWithDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:");
}

id objc_msgSend_initWithDelegate_dataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:dataSource:");
}

id objc_msgSend_initWithDeviceIsPad_navigationStackIsPopping_navigationStackSize_navigationBarHasContent_multiLevelViewHasContent_editableUtteranceViewHasContent_compactViewHasContent_siriViewControllerIsEditing_keyboardHasContent_contextMenuIsPresented_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithDeviceIsPad:navigationStackIsPopping:navigationStackSize:navigationBarHasContent:multiLevelViewHasCon tent:editableUtteranceViewHasContent:compactViewHasContent:siriViewControllerIsEditing:keyboardHasContent:con textMenuIsPresented:");
}

id objc_msgSend_initWithDuration_curve_beginningFrame_endingFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDuration:curve:beginningFrame:endingFrame:");
}

id objc_msgSend_initWithEffect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEffect:");
}

id objc_msgSend_initWithFacade_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFacade:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithFrame_animation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:animation:");
}

id objc_msgSend_initWithFrame_collectionViewLayout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:collectionViewLayout:");
}

id objc_msgSend_initWithFrame_presentationStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:presentationStyle:");
}

id objc_msgSend_initWithFrame_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:style:");
}

id objc_msgSend_initWithFrame_userUtterance_delegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:userUtterance:delegate:");
}

id objc_msgSend_initWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:");
}

id objc_msgSend_initWithIdentifier_bundleID_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:bundleID:context:");
}

id objc_msgSend_initWithIdentifier_bundleID_context_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:bundleID:context:userInfo:");
}

id objc_msgSend_initWithIdentifier_dateCreated_caller_callRecordType_callCapability_callDuration_unseen_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:dateCreated:caller:callRecordType:callCapability:callDuration:unseen:");
}

id objc_msgSend_initWithIdentifier_reference_reason_timestamp_invalidationBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:reference:reason:timestamp:invalidationBlock:");
}

id objc_msgSend_initWithIdentifier_startDate_endDate_metadata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:startDate:endDate:metadata:");
}

id objc_msgSend_initWithImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithImage:");
}

id objc_msgSend_initWithKeyboardNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithKeyboardNotification:");
}

id objc_msgSend_initWithKnowledgeStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithKnowledgeStore:");
}

id objc_msgSend_initWithLanguage_name_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLanguage:name:");
}

id objc_msgSend_initWithLanguageCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLanguageCode:");
}

id objc_msgSend_initWithLocale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLocale:");
}

id objc_msgSend_initWithLocaleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLocaleIdentifier:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithName_options_queue_delegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:options:queue:delegate:");
}

id objc_msgSend_initWithNibName_bundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNibName:bundle:");
}

id objc_msgSend_initWithOriginalCommandId_category_duration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithOriginalCommandId:category:duration:");
}

id objc_msgSend_initWithOriginalCommandId_category_eventInfo_duration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithOriginalCommandId:category:eventInfo:duration:");
}

id objc_msgSend_initWithPackageName_inBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPackageName:inBundle:");
}

id objc_msgSend_initWithPatternId_patternType_responseViewId_responseMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPatternId:patternType:responseViewId:responseMode:");
}

id objc_msgSend_initWithPersonHandle_nameComponents_displayName_image_contactIdentifier_customIdentifier_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPersonHandle:nameComponents:displayName:image:contactIdentifier:customIdentifier:");
}

id objc_msgSend_initWithRegularString_compactString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRegularString:compactString:");
}

id objc_msgSend_initWithRenderingEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRenderingEvent:");
}

id objc_msgSend_initWithRequestSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRequestSource:");
}

id objc_msgSend_initWithRequestSource_uiPresentationIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRequestSource:uiPresentationIdentifier:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithString_attributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:attributes:");
}

id objc_msgSend_initWithString_correctionIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:correctionIdentifier:");
}

id objc_msgSend_initWithSuiteName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSuiteName:");
}

id objc_msgSend_initWithTarget_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTarget:action:");
}

id objc_msgSend_initWithText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithText:");
}

id objc_msgSend_initWithText_identifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithText:identifier:");
}

id objc_msgSend_initWithText_visualEffect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithText:visualEffect:");
}

id objc_msgSend_initWithText_voice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithText:voice:");
}

id objc_msgSend_initWithTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTitle:");
}

id objc_msgSend_initWithTitle_font_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTitle:font:");
}

id objc_msgSend_initWithType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithType:");
}

id objc_msgSend_initWithURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:");
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUUIDString:");
}

id objc_msgSend_initWithUserUtterance_backingAceObject_isFinal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUserUtterance:backingAceObject:isFinal:");
}

id objc_msgSend_initWithUserUtterance_delegate_dataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUserUtterance:delegate:dataSource:");
}

id objc_msgSend_initWithUserUtterance_delegate_dataSource_preferences_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUserUtterance:delegate:dataSource:preferences:");
}

id objc_msgSend_initWithValue_type_label_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithValue:type:label:");
}

id objc_msgSend_initialView(void *a1, const char *a2, ...)
{
  return _[a1 initialView];
}

id objc_msgSend_inputType(void *a1, const char *a2, ...)
{
  return _[a1 inputType];
}

id objc_msgSend_inputTypeDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inputTypeDidChange:");
}

id objc_msgSend_insertItemsForAceViews_withDialogPhase_atIndexPaths_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertItemsForAceViews:withDialogPhase:atIndexPaths:");
}

id objc_msgSend_insertObject_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertObject:atIndex:");
}

id objc_msgSend_insertObjects_atIndexes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertObjects:atIndexes:");
}

id objc_msgSend_insertSubview_below_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertSubview:below:");
}

id objc_msgSend_insertSubview_belowSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertSubview:belowSubview:");
}

id objc_msgSend_insertedItemIndexPaths(void *a1, const char *a2, ...)
{
  return _[a1 insertedItemIndexPaths];
}

id objc_msgSend_integerForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "integerForKey:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_intentDescription(void *a1, const char *a2, ...)
{
  return _[a1 intentDescription];
}

id objc_msgSend_intentEnabledAppSnippets(void *a1, const char *a2, ...)
{
  return _[a1 intentEnabledAppSnippets];
}

id objc_msgSend_interface(void *a1, const char *a2, ...)
{
  return _[a1 interface];
}

id objc_msgSend_interfaceOrientation(void *a1, const char *a2, ...)
{
  return _[a1 interfaceOrientation];
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_internalGUID(void *a1, const char *a2, ...)
{
  return _[a1 internalGUID];
}

id objc_msgSend_internalModeOverride(void *a1, const char *a2, ...)
{
  return _[a1 internalModeOverride];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_invalidateKeyboardWindowIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 invalidateKeyboardWindowIfNeeded];
}

id objc_msgSend_invalidateLayout(void *a1, const char *a2, ...)
{
  return _[a1 invalidateLayout];
}

id objc_msgSend_isAMOSIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 isAMOSIdentifier];
}

id objc_msgSend_isAnnounceRequest(void *a1, const char *a2, ...)
{
  return _[a1 isAnnounceRequest];
}

id objc_msgSend_isAppIcon(void *a1, const char *a2, ...)
{
  return _[a1 isAppIcon];
}

id objc_msgSend_isAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isAvailable];
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return _[a1 isCancelled];
}

id objc_msgSend_isCancelledDialogPhase(void *a1, const char *a2, ...)
{
  return _[a1 isCancelledDialogPhase];
}

id objc_msgSend_isConfirmationDialogPhase(void *a1, const char *a2, ...)
{
  return _[a1 isConfirmationDialogPhase];
}

id objc_msgSend_isConfirmedDialogPhase(void *a1, const char *a2, ...)
{
  return _[a1 isConfirmedDialogPhase];
}

id objc_msgSend_isConnectedToAudioAccessory(void *a1, const char *a2, ...)
{
  return _[a1 isConnectedToAudioAccessory];
}

id objc_msgSend_isConnectedToCarPlay(void *a1, const char *a2, ...)
{
  return _[a1 isConnectedToCarPlay];
}

id objc_msgSend_isDateInToday_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDateInToday:");
}

id objc_msgSend_isDateInYesterday_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDateInYesterday:");
}

id objc_msgSend_isDescendantOfView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDescendantOfView:");
}

id objc_msgSend_isDeviceSilentMode(void *a1, const char *a2, ...)
{
  return _[a1 isDeviceSilentMode];
}

id objc_msgSend_isEditable(void *a1, const char *a2, ...)
{
  return _[a1 isEditable];
}

id objc_msgSend_isEditedTextSameAsUtterance_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEditedTextSameAsUtterance:");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isErrorDialogPhase(void *a1, const char *a2, ...)
{
  return _[a1 isErrorDialogPhase];
}

id objc_msgSend_isExpensive(void *a1, const char *a2, ...)
{
  return _[a1 isExpensive];
}

id objc_msgSend_isExpository(void *a1, const char *a2, ...)
{
  return _[a1 isExpository];
}

id objc_msgSend_isEyesFree(void *a1, const char *a2, ...)
{
  return _[a1 isEyesFree];
}

id objc_msgSend_isFirstResponder(void *a1, const char *a2, ...)
{
  return _[a1 isFirstResponder];
}

id objc_msgSend_isForAppleTV(void *a1, const char *a2, ...)
{
  return _[a1 isForAppleTV];
}

id objc_msgSend_isForBluetoothCar(void *a1, const char *a2, ...)
{
  return _[a1 isForBluetoothCar];
}

id objc_msgSend_isForCarDND(void *a1, const char *a2, ...)
{
  return _[a1 isForCarDND];
}

id objc_msgSend_isForEyesFree(void *a1, const char *a2, ...)
{
  return _[a1 isForEyesFree];
}

id objc_msgSend_isForStark(void *a1, const char *a2, ...)
{
  return _[a1 isForStark];
}

id objc_msgSend_isFromDevice(void *a1, const char *a2, ...)
{
  return _[a1 isFromDevice];
}

id objc_msgSend_isGuideHidden(void *a1, const char *a2, ...)
{
  return _[a1 isGuideHidden];
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return _[a1 isHidden];
}

id objc_msgSend_isInHardwareKeyboardMode(void *a1, const char *a2, ...)
{
  return _[a1 isInHardwareKeyboardMode];
}

id objc_msgSend_isInitialBringUp(void *a1, const char *a2, ...)
{
  return _[a1 isInitialBringUp];
}

id objc_msgSend_isLastRow(void *a1, const char *a2, ...)
{
  return _[a1 isLastRow];
}

id objc_msgSend_isLoaded(void *a1, const char *a2, ...)
{
  return _[a1 isLoaded];
}

id objc_msgSend_isNLServerFallbackDisabled(void *a1, const char *a2, ...)
{
  return _[a1 isNLServerFallbackDisabled];
}

id objc_msgSend_isNetworkAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isNetworkAvailable];
}

id objc_msgSend_isNew(void *a1, const char *a2, ...)
{
  return _[a1 isNew];
}

id objc_msgSend_isPresentingUIFromRemoteDevice(void *a1, const char *a2, ...)
{
  return _[a1 isPresentingUIFromRemoteDevice];
}

id objc_msgSend_isReflectionDialogPhase(void *a1, const char *a2, ...)
{
  return _[a1 isReflectionDialogPhase];
}

id objc_msgSend_isRequestEmergencyCall(void *a1, const char *a2, ...)
{
  return _[a1 isRequestEmergencyCall];
}

id objc_msgSend_isRequestMadeWithPhysicalDeviceInteraction(void *a1, const char *a2, ...)
{
  return _[a1 isRequestMadeWithPhysicalDeviceInteraction];
}

id objc_msgSend_isSAEEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isSAEEnabled];
}

id objc_msgSend_isScreenOffBeforeRequest(void *a1, const char *a2, ...)
{
  return _[a1 isScreenOffBeforeRequest];
}

id objc_msgSend_isSiriSafeForLockScreen(void *a1, const char *a2, ...)
{
  return _[a1 isSiriSafeForLockScreen];
}

id objc_msgSend_isSpeechSynthesisErrorUserCancelled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSpeechSynthesisErrorUserCancelled:");
}

id objc_msgSend_isSubclassOfClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSubclassOfClass:");
}

id objc_msgSend_isSuggestionSourceWithTextInput(void *a1, const char *a2, ...)
{
  return _[a1 isSuggestionSourceWithTextInput];
}

id objc_msgSend_isSynchronizedWithServer(void *a1, const char *a2, ...)
{
  return _[a1 isSynchronizedWithServer];
}

id objc_msgSend_isSynthesisQueueEmpty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSynthesisQueueEmpty:");
}

id objc_msgSend_isTemporary(void *a1, const char *a2, ...)
{
  return _[a1 isTemporary];
}

id objc_msgSend_isTypeToSiriRequest(void *a1, const char *a2, ...)
{
  return _[a1 isTypeToSiriRequest];
}

id objc_msgSend_isViewLoaded(void *a1, const char *a2, ...)
{
  return _[a1 isViewLoaded];
}

id objc_msgSend_isVirgin(void *a1, const char *a2, ...)
{
  return _[a1 isVirgin];
}

id objc_msgSend_isVoiceOverTouchEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isVoiceOverTouchEnabled];
}

id objc_msgSend_isVoiceTriggerRequest(void *a1, const char *a2, ...)
{
  return _[a1 isVoiceTriggerRequest];
}

id objc_msgSend_item(void *a1, const char *a2, ...)
{
  return _[a1 item];
}

id objc_msgSend_itemAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemAtIndexPath:");
}

id objc_msgSend_itemWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemWithIdentifier:");
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return _[a1 items];
}

id objc_msgSend_keyboardHasContent(void *a1, const char *a2, ...)
{
  return _[a1 keyboardHasContent];
}

id objc_msgSend_keyline(void *a1, const char *a2, ...)
{
  return _[a1 keyline];
}

id objc_msgSend_keysSortedByValueUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keysSortedByValueUsingComparator:");
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return _[a1 label];
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return _[a1 labelColor];
}

id objc_msgSend_labelWithLightWeightRegularFont(void *a1, const char *a2, ...)
{
  return _[a1 labelWithLightWeightRegularFont];
}

id objc_msgSend_labelWithMediumWeightSubtextFont(void *a1, const char *a2, ...)
{
  return _[a1 labelWithMediumWeightSubtextFont];
}

id objc_msgSend_language(void *a1, const char *a2, ...)
{
  return _[a1 language];
}

id objc_msgSend_languageCode(void *a1, const char *a2, ...)
{
  return _[a1 languageCode];
}

id objc_msgSend_lastItem(void *a1, const char *a2, ...)
{
  return _[a1 lastItem];
}

id objc_msgSend_lastName(void *a1, const char *a2, ...)
{
  return _[a1 lastName];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 lastPathComponent];
}

id objc_msgSend_latitude(void *a1, const char *a2, ...)
{
  return _[a1 latitude];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return _[a1 layer];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 leadingAnchor];
}

id objc_msgSend_legibilityWeight(void *a1, const char *a2, ...)
{
  return _[a1 legibilityWeight];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_lightTextColor(void *a1, const char *a2, ...)
{
  return _[a1 lightTextColor];
}

id objc_msgSend_lineHeight(void *a1, const char *a2, ...)
{
  return _[a1 lineHeight];
}

id objc_msgSend_listenAfterSpeaking(void *a1, const char *a2, ...)
{
  return _[a1 listenAfterSpeaking];
}

id objc_msgSend_listenAfterSpeakingBehavior(void *a1, const char *a2, ...)
{
  return _[a1 listenAfterSpeakingBehavior];
}

id objc_msgSend_listenAfterSpeakingDisabled(void *a1, const char *a2, ...)
{
  return _[a1 listenAfterSpeakingDisabled];
}

id objc_msgSend_load(void *a1, const char *a2, ...)
{
  return _[a1 load];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return _[a1 location];
}

id objc_msgSend_logClientFeedbackPresented_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logClientFeedbackPresented:");
}

id objc_msgSend_logClientFeedbackPresented_dialogIdentifierProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logClientFeedbackPresented:dialogIdentifierProvider:");
}

id objc_msgSend_logDisambiguationItemSelected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logDisambiguationItemSelected:");
}

id objc_msgSend_logEventWithType_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logEventWithType:context:");
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return _[a1 longValue];
}

id objc_msgSend_longitude(void *a1, const char *a2, ...)
{
  return _[a1 longitude];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return _[a1 lowercaseString];
}

id objc_msgSend_lowresTrailerUri(void *a1, const char *a2, ...)
{
  return _[a1 lowresTrailerUri];
}

id objc_msgSend_machServiceIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 machServiceIdentifier];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _[a1 mainBundle];
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return _[a1 mainQueue];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return _[a1 mainScreen];
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return _[a1 makeKeyAndVisible];
}

id objc_msgSend_makeKeyWindow(void *a1, const char *a2, ...)
{
  return _[a1 makeKeyWindow];
}

id objc_msgSend_maxSizeForSnippet(void *a1, const char *a2, ...)
{
  return _[a1 maxSizeForSnippet];
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return _[a1 message];
}

id objc_msgSend_messageType(void *a1, const char *a2, ...)
{
  return _[a1 messageType];
}

id objc_msgSend_metricsContext(void *a1, const char *a2, ...)
{
  return _[a1 metricsContext];
}

id objc_msgSend_middleName(void *a1, const char *a2, ...)
{
  return _[a1 middleName];
}

id objc_msgSend_minimumAutoDismissalTimeInMs(void *a1, const char *a2, ...)
{
  return _[a1 minimumAutoDismissalTimeInMs];
}

id objc_msgSend_missed(void *a1, const char *a2, ...)
{
  return _[a1 missed];
}

id objc_msgSend_model(void *a1, const char *a2, ...)
{
  return _[a1 model];
}

id objc_msgSend_modelData(void *a1, const char *a2, ...)
{
  return _[a1 modelData];
}

id objc_msgSend_multiLevelViewHasContent(void *a1, const char *a2, ...)
{
  return _[a1 multiLevelViewHasContent];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_navigationBar(void *a1, const char *a2, ...)
{
  return _[a1 navigationBar];
}

id objc_msgSend_navigationBarHasContent(void *a1, const char *a2, ...)
{
  return _[a1 navigationBarHasContent];
}

id objc_msgSend_navigationStackIsPopping(void *a1, const char *a2, ...)
{
  return _[a1 navigationStackIsPopping];
}

id objc_msgSend_navigationStackSize(void *a1, const char *a2, ...)
{
  return _[a1 navigationStackSize];
}

id objc_msgSend_nickName(void *a1, const char *a2, ...)
{
  return _[a1 nickName];
}

id objc_msgSend_notifyClientStateManagerSpeakingEnded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyClientStateManagerSpeakingEnded:");
}

id objc_msgSend_notifyStateManagerSpeakingEnded(void *a1, const char *a2, ...)
{
  return _[a1 notifyStateManagerSpeakingEnded];
}

id objc_msgSend_notifyVoiceTriggeredSiriSessionCancelled(void *a1, const char *a2, ...)
{
  return _[a1 notifyVoiceTriggeredSiriSessionCancelled];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return _[a1 now];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _[a1 null];
}

id objc_msgSend_number(void *a1, const char *a2, ...)
{
  return _[a1 number];
}

id objc_msgSend_numberOfAlternativeUtterances(void *a1, const char *a2, ...)
{
  return _[a1 numberOfAlternativeUtterances];
}

id objc_msgSend_numberOfChildrenForItemAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfChildrenForItemAtIndexPath:");
}

id objc_msgSend_numberOfChildrenForItemWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfChildrenForItemWithIdentifier:");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return _[a1 object];
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_offsetFromPosition_toPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "offsetFromPosition:toPosition:");
}

id objc_msgSend_openURL_bundleId_inPlace_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openURL:bundleId:inPlace:completion:");
}

id objc_msgSend_operation(void *a1, const char *a2, ...)
{
  return _[a1 operation];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return _[a1 options];
}

id objc_msgSend_originalRank(void *a1, const char *a2, ...)
{
  return _[a1 originalRank];
}

id objc_msgSend_originalRequestOptions(void *a1, const char *a2, ...)
{
  return _[a1 originalRequestOptions];
}

id objc_msgSend_originalScore(void *a1, const char *a2, ...)
{
  return _[a1 originalScore];
}

id objc_msgSend_outgoing(void *a1, const char *a2, ...)
{
  return _[a1 outgoing];
}

id objc_msgSend_outputDevices(void *a1, const char *a2, ...)
{
  return _[a1 outputDevices];
}

id objc_msgSend_outputVoice(void *a1, const char *a2, ...)
{
  return _[a1 outputVoice];
}

id objc_msgSend_paragraphStyleForCurrentScaleWithTextAlignment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "paragraphStyleForCurrentScaleWithTextAlignment:");
}

id objc_msgSend_parentOfItemWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parentOfItemWithIdentifier:");
}

id objc_msgSend_parentViewController(void *a1, const char *a2, ...)
{
  return _[a1 parentViewController];
}

id objc_msgSend_parseStringWithFormat_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parseStringWithFormat:error:");
}

id objc_msgSend_parseStringWithFormat_error_containsPrivacySensitiveContents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parseStringWithFormat:error:containsPrivacySensitiveContents:");
}

id objc_msgSend_parsedUtteranceFromText_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parsedUtteranceFromText:context:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return _[a1 pathExtension];
}

id objc_msgSend_pathForResource_ofType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathForResource:ofType:");
}

id objc_msgSend_patternId(void *a1, const char *a2, ...)
{
  return _[a1 patternId];
}

id objc_msgSend_patternType(void *a1, const char *a2, ...)
{
  return _[a1 patternType];
}

id objc_msgSend_pendingAddViewsWithReflectionDialogPhaseWithRefId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pendingAddViewsWithReflectionDialogPhaseWithRefId:");
}

id objc_msgSend_percentComplete(void *a1, const char *a2, ...)
{
  return _[a1 percentComplete];
}

id objc_msgSend_performAceCommand_turnIdentifier_machAbsoluteTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performAceCommand:turnIdentifier:machAbsoluteTime:");
}

id objc_msgSend_performIntentEnabledAppAuthorizationCheck(void *a1, const char *a2, ...)
{
  return _[a1 performIntentEnabledAppAuthorizationCheck];
}

id objc_msgSend_performSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSelector:");
}

id objc_msgSend_phones(void *a1, const char *a2, ...)
{
  return _[a1 phones];
}

id objc_msgSend_placesImageAboveText(void *a1, const char *a2, ...)
{
  return _[a1 placesImageAboveText];
}

id objc_msgSend_playTrailer(void *a1, const char *a2, ...)
{
  return _[a1 playTrailer];
}

id objc_msgSend_playWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playWithCompletionHandler:");
}

id objc_msgSend_playbackCommand(void *a1, const char *a2, ...)
{
  return _[a1 playbackCommand];
}

id objc_msgSend_pods(void *a1, const char *a2, ...)
{
  return _[a1 pods];
}

id objc_msgSend_popObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "popObjectsUsingBlock:");
}

id objc_msgSend_popTopObject(void *a1, const char *a2, ...)
{
  return _[a1 popTopObject];
}

id objc_msgSend_popViewControllerAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "popViewControllerAnimated:");
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:");
}

id objc_msgSend_postStorageLowNotification(void *a1, const char *a2, ...)
{
  return _[a1 postStorageLowNotification];
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return _[a1 preferredContentSizeCategory];
}

id objc_msgSend_preferredFontForTextStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredFontForTextStyle:");
}

id objc_msgSend_preferredSpeakableTextVoice(void *a1, const char *a2, ...)
{
  return _[a1 preferredSpeakableTextVoice];
}

id objc_msgSend_preferredStatusBarStyle(void *a1, const char *a2, ...)
{
  return _[a1 preferredStatusBarStyle];
}

id objc_msgSend_prefix(void *a1, const char *a2, ...)
{
  return _[a1 prefix];
}

id objc_msgSend_preloadPresentationBundleWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preloadPresentationBundleWithIdentifier:");
}

id objc_msgSend_preloadProviders(void *a1, const char *a2, ...)
{
  return _[a1 preloadProviders];
}

id objc_msgSend_premptivelyResumeMedia(void *a1, const char *a2, ...)
{
  return _[a1 premptivelyResumeMedia];
}

id objc_msgSend_prepareAddViewsCommandForConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareAddViewsCommandForConversation:");
}

id objc_msgSend_prepareUpdateViewsCommandForConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareUpdateViewsCommandForConversation:");
}

id objc_msgSend_presentPhotoPicker_withSearchString_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentPhotoPicker:withSearchString:completion:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_presentViewController_fromViewController_animateAlongsideTransition_completion_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentViewController:fromViewController:animateAlongsideTransition:completion:");
}

id objc_msgSend_presentation(void *a1, const char *a2, ...)
{
  return _[a1 presentation];
}

id objc_msgSend_presentationController(void *a1, const char *a2, ...)
{
  return _[a1 presentationController];
}

id objc_msgSend_presentationDidPresentKeyboard(void *a1, const char *a2, ...)
{
  return _[a1 presentationDidPresentKeyboard];
}

id objc_msgSend_presentationDomain(void *a1, const char *a2, ...)
{
  return _[a1 presentationDomain];
}

id objc_msgSend_presentationIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 presentationIdentifier];
}

id objc_msgSend_presentationState(void *a1, const char *a2, ...)
{
  return _[a1 presentationState];
}

id objc_msgSend_presentationStateChangedItemIndexPaths(void *a1, const char *a2, ...)
{
  return _[a1 presentationStateChangedItemIndexPaths];
}

id objc_msgSend_presentationStateUpdatedFromPresentationState_toPresentationState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentationStateUpdatedFromPresentationState:toPresentationState:");
}

id objc_msgSend_presentationWithIdentifier_delegate_dataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentationWithIdentifier:delegate:dataSource:");
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return _[a1 presentedViewController];
}

id objc_msgSend_previousConversationDidLoad_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "previousConversationDidLoad:");
}

id objc_msgSend_previousSiriRequestErrorTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 previousSiriRequestErrorTimestamp];
}

id objc_msgSend_prewarmForFirstTapOfQuickTypeToSiriGesture(void *a1, const char *a2, ...)
{
  return _[a1 prewarmForFirstTapOfQuickTypeToSiriGesture];
}

id objc_msgSend_prewarmIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 prewarmIfNeeded];
}

id objc_msgSend_principalClass(void *a1, const char *a2, ...)
{
  return _[a1 principalClass];
}

id objc_msgSend_printedOnly(void *a1, const char *a2, ...)
{
  return _[a1 printedOnly];
}

id objc_msgSend_processData_usingProcedure_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processData:usingProcedure:completion:");
}

id objc_msgSend_processDelayedItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processDelayedItem:");
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 processIdentifier];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return _[a1 processInfo];
}

id objc_msgSend_processSessionEvent_isSpeechSynthesisSpeaking_machAbsoluteTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processSessionEvent:isSpeechSynthesisSpeaking:machAbsoluteTime:");
}

id objc_msgSend_promptedUserForInput(void *a1, const char *a2, ...)
{
  return _[a1 promptedUserForInput];
}

id objc_msgSend_propertyList(void *a1, const char *a2, ...)
{
  return _[a1 propertyList];
}

id objc_msgSend_propertyListWithData_options_format_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyListWithData:options:format:error:");
}

id objc_msgSend_pulseHelpButton(void *a1, const char *a2, ...)
{
  return _[a1 pulseHelpButton];
}

id objc_msgSend_punchOut(void *a1, const char *a2, ...)
{
  return _[a1 punchOut];
}

id objc_msgSend_punchOutName(void *a1, const char *a2, ...)
{
  return _[a1 punchOutName];
}

id objc_msgSend_punchOutUri(void *a1, const char *a2, ...)
{
  return _[a1 punchOutUri];
}

id objc_msgSend_pushObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pushObject:");
}

id objc_msgSend_rangeEnclosingPosition_withGranularity_inDirection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeEnclosingPosition:withGranularity:inDirection:");
}

id objc_msgSend_rangeListOfDifferingTextFromTargetTokenList_comparedToBaseTokenList_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeListOfDifferingTextFromTargetTokenList:comparedToBaseTokenList:");
}

id objc_msgSend_rangeListOfDifferingTextFromUtteranceAtIndex_comparedToBaseUtteranceAtIndex_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeListOfDifferingTextFromUtteranceAtIndex:comparedToBaseUtteranceAtIndex:");
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfString:");
}

id objc_msgSend_rangeOfString_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfString:options:");
}

id objc_msgSend_rangeValue(void *a1, const char *a2, ...)
{
  return _[a1 rangeValue];
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return _[a1 reason];
}

id objc_msgSend_receivedCommand_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receivedCommand:");
}

id objc_msgSend_recognition(void *a1, const char *a2, ...)
{
  return _[a1 recognition];
}

id objc_msgSend_recordActionCompletedForAceCommand_success_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordActionCompletedForAceCommand:success:");
}

id objc_msgSend_recordActionStartedForAceCommand_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordActionStartedForAceCommand:");
}

id objc_msgSend_recordActionStoppedForAceCommand_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordActionStoppedForAceCommand:");
}

id objc_msgSend_recordEvent_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordEvent:completionHandler:");
}

id objc_msgSend_recordUIMetrics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordUIMetrics:");
}

id objc_msgSend_recursive_setSemanticContentAttribute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recursive_setSemanticContentAttribute:");
}

id objc_msgSend_ref(void *a1, const char *a2, ...)
{
  return _[a1 ref];
}

id objc_msgSend_refId(void *a1, const char *a2, ...)
{
  return _[a1 refId];
}

id objc_msgSend_refreshUnderstandingOnDeviceAssetsAvailableAsync(void *a1, const char *a2, ...)
{
  return _[a1 refreshUnderstandingOnDeviceAssetsAvailableAsync];
}

id objc_msgSend_registerAceCommand_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerAceCommand:completion:");
}

id objc_msgSend_registerClass_forCellReuseIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerClass:forCellReuseIdentifier:");
}

id objc_msgSend_registerClass_forCellWithReuseIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerClass:forCellWithReuseIdentifier:");
}

id objc_msgSend_registerClass_forSupplementaryViewOfKind_withReuseIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:");
}

id objc_msgSend_registerForTaskWithIdentifier_usingQueue_launchHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerForTaskWithIdentifier:usingQueue:launchHandler:");
}

id objc_msgSend_registerNonButtonSourceWithType_withUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerNonButtonSourceWithType:withUUID:");
}

id objc_msgSend_registerProvider_forNamespace_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerProvider:forNamespace:");
}

id objc_msgSend_registerReplayCallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerReplayCallback:");
}

id objc_msgSend_regularString(void *a1, const char *a2, ...)
{
  return _[a1 regularString];
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return _[a1 reloadData];
}

id objc_msgSend_remoteTarget(void *a1, const char *a2, ...)
{
  return _[a1 remoteTarget];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeAlternativeFeatureViews_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAlternativeFeatureViews:");
}

id objc_msgSend_removeConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeConstraints:");
}

id objc_msgSend_removeConversationWithIdentifier_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeConversationWithIdentifier:completionBlock:");
}

id objc_msgSend_removeFromParentViewController(void *a1, const char *a2, ...)
{
  return _[a1 removeFromParentViewController];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return _[a1 removeFromSuperview];
}

id objc_msgSend_removeGestureRecognizer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeGestureRecognizer:");
}

id objc_msgSend_removeItemsAtIndexPaths_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemsAtIndexPaths:");
}

id objc_msgSend_removeItemsFollowingItemAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemsFollowingItemAtIndexPath:");
}

id objc_msgSend_removeItemsWithIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemsWithIdentifiers:");
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return _[a1 removeLastObject];
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_removeSpeechAlternativeViewAndUpdateUtteranceTextIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 removeSpeechAlternativeViewAndUpdateUtteranceTextIfNecessary];
}

id objc_msgSend_removeSpeechAlternatives(void *a1, const char *a2, ...)
{
  return _[a1 removeSpeechAlternatives];
}

id objc_msgSend_removeTarget_action_forControlEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeTarget:action:forControlEvents:");
}

id objc_msgSend_removeTransientItems(void *a1, const char *a2, ...)
{
  return _[a1 removeTransientItems];
}

id objc_msgSend_replaceObjectAtIndex_withObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replaceObjectAtIndex:withObject:");
}

id objc_msgSend_replyAceCommand(void *a1, const char *a2, ...)
{
  return _[a1 replyAceCommand];
}

id objc_msgSend_requestContext(void *a1, const char *a2, ...)
{
  return _[a1 requestContext];
}

id objc_msgSend_requestDidPresentViewForErrorCommand_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestDidPresentViewForErrorCommand:");
}

id objc_msgSend_requestDidPresentViewForUICommand_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestDidPresentViewForUICommand:");
}

id objc_msgSend_requestEndBehavior(void *a1, const char *a2, ...)
{
  return _[a1 requestEndBehavior];
}

id objc_msgSend_requestHandlingStatus(void *a1, const char *a2, ...)
{
  return _[a1 requestHandlingStatus];
}

id objc_msgSend_requestHostBlurVisible_reason_fence_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestHostBlurVisible:reason:fence:");
}

id objc_msgSend_requestInfo(void *a1, const char *a2, ...)
{
  return _[a1 requestInfo];
}

id objc_msgSend_requestOptions(void *a1, const char *a2, ...)
{
  return _[a1 requestOptions];
}

id objc_msgSend_requestSource(void *a1, const char *a2, ...)
{
  return _[a1 requestSource];
}

id objc_msgSend_requestWithIdentifier_content_trigger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestWithIdentifier:content:trigger:");
}

id objc_msgSend_resetContextTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetContextTypes:");
}

id objc_msgSend_resetErrorState(void *a1, const char *a2, ...)
{
  return _[a1 resetErrorState];
}

id objc_msgSend_resetViewsAndClearASR_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetViewsAndClearASR:");
}

id objc_msgSend_resignFirstResponder(void *a1, const char *a2, ...)
{
  return _[a1 resignFirstResponder];
}

id objc_msgSend_resourceUrl(void *a1, const char *a2, ...)
{
  return _[a1 resourceUrl];
}

id objc_msgSend_responseMode(void *a1, const char *a2, ...)
{
  return _[a1 responseMode];
}

id objc_msgSend_responseName(void *a1, const char *a2, ...)
{
  return _[a1 responseName];
}

id objc_msgSend_responseType(void *a1, const char *a2, ...)
{
  return _[a1 responseType];
}

id objc_msgSend_responseViewId(void *a1, const char *a2, ...)
{
  return _[a1 responseViewId];
}

id objc_msgSend_restoreOriginalEditTextContents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "restoreOriginalEditTextContents:");
}

id objc_msgSend_resultDidChangeForAceCommand_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resultDidChangeForAceCommand:");
}

id objc_msgSend_resultDidChangeForAceCommand_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resultDidChangeForAceCommand:completion:");
}

id objc_msgSend_resultForAceCommand_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resultForAceCommand:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_resumeInterruptedAudioPlaybackIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 resumeInterruptedAudioPlaybackIfNeeded];
}

id objc_msgSend_reuseIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 reuseIdentifier];
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 reverseObjectEnumerator];
}

id objc_msgSend_revisionIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 revisionIdentifier];
}

id objc_msgSend_rollbackClearContext(void *a1, const char *a2, ...)
{
  return _[a1 rollbackClearContext];
}

id objc_msgSend_rootViewController(void *a1, const char *a2, ...)
{
  return _[a1 rootViewController];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return _[a1 row];
}

id objc_msgSend_runPPTWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runPPTWithOptions:");
}

id objc_msgSend_runSiriKitExecutorCommandWithContext_payload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runSiriKitExecutorCommandWithContext:payload:");
}

id objc_msgSend_safeAreaInsets(void *a1, const char *a2, ...)
{
  return _[a1 safeAreaInsets];
}

id objc_msgSend_saveConversation_withIdentifier_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveConversation:withIdentifier:completionBlock:");
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return _[a1 scale];
}

id objc_msgSend_scaleFactor(void *a1, const char *a2, ...)
{
  return _[a1 scaleFactor];
}

id objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:");
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return _[a1 scheme];
}

id objc_msgSend_screen(void *a1, const char *a2, ...)
{
  return _[a1 screen];
}

id objc_msgSend_secondaryLabelColor(void *a1, const char *a2, ...)
{
  return _[a1 secondaryLabelColor];
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return _[a1 section];
}

id objc_msgSend_sectionName(void *a1, const char *a2, ...)
{
  return _[a1 sectionName];
}

id objc_msgSend_selectedBackgroundView(void *a1, const char *a2, ...)
{
  return _[a1 selectedBackgroundView];
}

id objc_msgSend_selectionResponse(void *a1, const char *a2, ...)
{
  return _[a1 selectionResponse];
}

id objc_msgSend_selectionResultsForAlternateTextAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectionResultsForAlternateTextAtIndex:");
}

id objc_msgSend_selectionResultsForEditedText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectionResultsForEditedText:");
}

id objc_msgSend_selectionText(void *a1, const char *a2, ...)
{
  return _[a1 selectionText];
}

id objc_msgSend_semanticContentAttribute(void *a1, const char *a2, ...)
{
  return _[a1 semanticContentAttribute];
}

id objc_msgSend_sendBTCarInvocationContext(void *a1, const char *a2, ...)
{
  return _[a1 sendBTCarInvocationContext];
}

id objc_msgSend_sendEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendEvent:");
}

id objc_msgSend_separatorColor(void *a1, const char *a2, ...)
{
  return _[a1 separatorColor];
}

id objc_msgSend_serviceBulletinWithIdentifier_replyHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceBulletinWithIdentifier:replyHandler:");
}

id objc_msgSend_serviceCancelHIDEventDefferal(void *a1, const char *a2, ...)
{
  return _[a1 serviceCancelHIDEventDefferal];
}

id objc_msgSend_serviceDidDetectMicButtonLongPressBegan(void *a1, const char *a2, ...)
{
  return _[a1 serviceDidDetectMicButtonLongPressBegan];
}

id objc_msgSend_serviceDidDetectMicButtonLongPressEnded(void *a1, const char *a2, ...)
{
  return _[a1 serviceDidDetectMicButtonLongPressEnded];
}

id objc_msgSend_serviceDidDetectMicButtonTap(void *a1, const char *a2, ...)
{
  return _[a1 serviceDidDetectMicButtonTap];
}

id objc_msgSend_serviceDidDismissBugReporter(void *a1, const char *a2, ...)
{
  return _[a1 serviceDidDismissBugReporter];
}

id objc_msgSend_serviceDidDismissViewControllerWithStatusBarStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceDidDismissViewControllerWithStatusBarStyle:");
}

id objc_msgSend_serviceDidEndEditing(void *a1, const char *a2, ...)
{
  return _[a1 serviceDidEndEditing];
}

id objc_msgSend_serviceDidEnterUITrackingMode(void *a1, const char *a2, ...)
{
  return _[a1 serviceDidEnterUITrackingMode];
}

id objc_msgSend_serviceDidExitUITrackingMode(void *a1, const char *a2, ...)
{
  return _[a1 serviceDidExitUITrackingMode];
}

id objc_msgSend_serviceDidPresentBugReporter(void *a1, const char *a2, ...)
{
  return _[a1 serviceDidPresentBugReporter];
}

id objc_msgSend_serviceDidPresentConversationFromBreadcrumb(void *a1, const char *a2, ...)
{
  return _[a1 serviceDidPresentConversationFromBreadcrumb];
}

id objc_msgSend_serviceDidPresentUserInterface(void *a1, const char *a2, ...)
{
  return _[a1 serviceDidPresentUserInterface];
}

id objc_msgSend_serviceDidPresentViewControllerWithStatusBarStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceDidPresentViewControllerWithStatusBarStyle:");
}

id objc_msgSend_serviceDidRequestCurrentTextInput_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceDidRequestCurrentTextInput:");
}

id objc_msgSend_serviceDidRequestKeyboard_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceDidRequestKeyboard:");
}

id objc_msgSend_serviceDidRequestKeyboard_minimized_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceDidRequestKeyboard:minimized:");
}

id objc_msgSend_serviceDidResetTextInput(void *a1, const char *a2, ...)
{
  return _[a1 serviceDidResetTextInput];
}

id objc_msgSend_servicePresentationDidChangePeekMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "servicePresentationDidChangePeekMode:");
}

id objc_msgSend_servicePresentationDidChangeVisualState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "servicePresentationDidChangeVisualState:");
}

id objc_msgSend_servicePresentedIntentWithBundleId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "servicePresentedIntentWithBundleId:");
}

id objc_msgSend_serviceQuality(void *a1, const char *a2, ...)
{
  return _[a1 serviceQuality];
}

id objc_msgSend_serviceRequestsDismissalWithUserInfo_withReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceRequestsDismissalWithUserInfo:withReason:");
}

id objc_msgSend_serviceRequestsHIDEventDefferal(void *a1, const char *a2, ...)
{
  return _[a1 serviceRequestsHIDEventDefferal];
}

id objc_msgSend_serviceStartGuidedAccess(void *a1, const char *a2, ...)
{
  return _[a1 serviceStartGuidedAccess];
}

id objc_msgSend_serviceStartRequestWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceStartRequestWithOptions:");
}

id objc_msgSend_serviceViewControllerRequestsDismissalWithDismissalReason_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceViewControllerRequestsDismissalWithDismissalReason:completion:");
}

id objc_msgSend_serviceViewControllerRequestsKeyboardWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceViewControllerRequestsKeyboardWithCompletion:");
}

id objc_msgSend_serviceViewControllerRequestsPresentation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceViewControllerRequestsPresentation:");
}

id objc_msgSend_serviceViewControllerWillChangeKeyboardVisibility_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceViewControllerWillChangeKeyboardVisibility:");
}

id objc_msgSend_serviceWillBeginEditing(void *a1, const char *a2, ...)
{
  return _[a1 serviceWillBeginEditing];
}

id objc_msgSend_serviceWillDismissViewControllerWithStatusBarStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceWillDismissViewControllerWithStatusBarStyle:");
}

id objc_msgSend_serviceWillPresentViewControllerWithStatusBarStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceWillPresentViewControllerWithStatusBarStyle:");
}

id objc_msgSend_sessionId(void *a1, const char *a2, ...)
{
  return _[a1 sessionId];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setAccessibilityDifferentiateWithoutColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessibilityDifferentiateWithoutColor:");
}

id objc_msgSend_setAccessibilityIgnoresInvertColors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessibilityIgnoresInvertColors:");
}

id objc_msgSend_setAccessibilityInvertColors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessibilityInvertColors:");
}

id objc_msgSend_setAccessibilityReduceMotion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessibilityReduceMotion:");
}

id objc_msgSend_setAccessibilityReduceTransparency_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessibilityReduceTransparency:");
}

id objc_msgSend_setAceId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAceId:");
}

id objc_msgSend_setAceObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAceObject:");
}

id objc_msgSend_setAcousticIdEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAcousticIdEnabled:");
}

id objc_msgSend_setActivationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivationHandler:");
}

id objc_msgSend_setActive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActive:");
}

id objc_msgSend_setActive_withOptions_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActive:withOptions:error:");
}

id objc_msgSend_setAlertContext(void *a1, const char *a2, ...)
{
  return _[a1 setAlertContext];
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlpha:");
}

id objc_msgSend_setAlphaComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlphaComponent:");
}

id objc_msgSend_setAnimationDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnimationDuration:");
}

id objc_msgSend_setAppAvailableInStorefront_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppAvailableInStorefront:");
}

id objc_msgSend_setAppWindow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppWindow:");
}

id objc_msgSend_setApplicationBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setApplicationBundleIdentifier:");
}

id objc_msgSend_setApproximateSpeechDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setApproximateSpeechDuration:");
}

id objc_msgSend_setAssistantBulletin_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAssistantBulletin:");
}

id objc_msgSend_setAttributedText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttributedText:");
}

id objc_msgSend_setAttributes_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttributes:range:");
}

id objc_msgSend_setAudioSessionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAudioSessionID:");
}

id objc_msgSend_setAutoresizingMask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutoresizingMask:");
}

id objc_msgSend_setAuxiliaryView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAuxiliaryView:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBackgroundPlatteredCardView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundPlatteredCardView:");
}

id objc_msgSend_setBackgroundPlatteredCardViewOriginalFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundPlatteredCardViewOriginalFrame:");
}

id objc_msgSend_setBackingStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackingStore:");
}

id objc_msgSend_setBlendEffectEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBlendEffectEnabled:");
}

id objc_msgSend_setBlueValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBlueValue:");
}

id objc_msgSend_setBluetoothCarInvocationContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBluetoothCarInvocationContext:");
}

id objc_msgSend_setBody_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBody:");
}

id objc_msgSend_setBottomContentInset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBottomContentInset:");
}

id objc_msgSend_setBounces_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBounces:");
}

id objc_msgSend_setBoundingMapRegion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBoundingMapRegion:");
}

id objc_msgSend_setBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBounds:");
}

id objc_msgSend_setBugReportingAvailable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBugReportingAvailable:");
}

id objc_msgSend_setBundleId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBundleId:");
}

id objc_msgSend_setBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBundleIdentifier:");
}

id objc_msgSend_setByAddingObjectsFromSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setByAddingObjectsFromSet:");
}

id objc_msgSend_setCallRecipient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCallRecipient:");
}

id objc_msgSend_setCallRecords_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCallRecords:");
}

id objc_msgSend_setCanBeRefreshed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCanBeRefreshed:");
}

id objc_msgSend_setCanUseServerTTS_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCanUseServerTTS:");
}

id objc_msgSend_setCardData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCardData:");
}

id objc_msgSend_setCardId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCardId:");
}

id objc_msgSend_setCardSectionId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCardSectionId:");
}

id objc_msgSend_setCardSections_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCardSections:");
}

id objc_msgSend_setChevronHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setChevronHidden:");
}

id objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:");
}

id objc_msgSend_setClientStateManagerDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClientStateManagerDelegate:");
}

id objc_msgSend_setClientWindowContextID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClientWindowContextID:");
}

id objc_msgSend_setClipsToBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClipsToBounds:");
}

id objc_msgSend_setCombinedRank_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCombinedRank:");
}

id objc_msgSend_setCombinedScore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCombinedScore:");
}

id objc_msgSend_setCommands_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCommands:");
}

id objc_msgSend_setCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompletion:");
}

id objc_msgSend_setConfirmationOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfirmationOptions:");
}

id objc_msgSend_setConstant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConstant:");
}

id objc_msgSend_setContainerView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContainerView:");
}

id objc_msgSend_setContentCompressionResistancePriority_forAxis_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentCompressionResistancePriority:forAxis:");
}

id objc_msgSend_setContentHuggingPriority_forAxis_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentHuggingPriority:forAxis:");
}

id objc_msgSend_setContentViewControllers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentViewControllers:");
}

id objc_msgSend_setContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContext:");
}

id objc_msgSend_setContextInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContextInfo:");
}

id objc_msgSend_setContextMenuIsPresented_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContextMenuIsPresented:");
}

id objc_msgSend_setConversationItemIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConversationItemIdentifier:");
}

id objc_msgSend_setCornerRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCornerRadius:");
}

id objc_msgSend_setCornerRoundingStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCornerRoundingStyle:");
}

id objc_msgSend_setCurrentScene_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentScene:");
}

id objc_msgSend_setCustomBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCustomBackgroundColor:");
}

id objc_msgSend_setCustomLeftPadding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCustomLeftPadding:");
}

id objc_msgSend_setCustomRightPadding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCustomRightPadding:");
}

id objc_msgSend_setDarkenIntensity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDarkenIntensity:");
}

id objc_msgSend_setData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setData:");
}

id objc_msgSend_setDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDataSource:");
}

id objc_msgSend_setDateFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDateFormat:");
}

id objc_msgSend_setDateStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDateStyle:");
}

id objc_msgSend_setDefaultActionURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDefaultActionURL:");
}

id objc_msgSend_setDefaultColorForTemplate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDefaultColorForTemplate:");
}

id objc_msgSend_setDefaultViewInsets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDefaultViewInsets:");
}

id objc_msgSend_setDeferredRendering_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeferredRendering:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDelegateClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegateClass:");
}

id objc_msgSend_setDescriptionText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDescriptionText:");
}

id objc_msgSend_setDestinations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDestinations:");
}

id objc_msgSend_setDialogIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDialogIdentifier:");
}

id objc_msgSend_setDialogIdentifiers_forAceViewSpeakableTextWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDialogIdentifiers:forAceViewSpeakableTextWithIdentifier:");
}

id objc_msgSend_setDialogPhase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDialogPhase:");
}

id objc_msgSend_setDictationResult_withCorrectionIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDictationResult:withCorrectionIdentifier:");
}

id objc_msgSend_setDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDictionary:");
}

id objc_msgSend_setDidReportInstrument_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDidReportInstrument:");
}

id objc_msgSend_setDisplayColorScheme_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisplayColorScheme:");
}

id objc_msgSend_setDisplayContrast_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisplayContrast:");
}

id objc_msgSend_setDisplayGamut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisplayGamut:");
}

id objc_msgSend_setDisplayView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisplayView:");
}

id objc_msgSend_setDomainObject_forIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDomainObject:forIdentifier:");
}

id objc_msgSend_setDomainObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDomainObject:forKey:");
}

id objc_msgSend_setDynamicTypeSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDynamicTypeSize:");
}

id objc_msgSend_setEarliestBeginDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEarliestBeginDate:");
}

id objc_msgSend_setEdgeInsets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEdgeInsets:");
}

id objc_msgSend_setEditable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEditable:");
}

id objc_msgSend_setEndTextColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEndTextColor:");
}

id objc_msgSend_setEnded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnded:");
}

id objc_msgSend_setError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setError:");
}

id objc_msgSend_setErrorCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setErrorCode:");
}

id objc_msgSend_setErrorDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setErrorDomain:");
}

id objc_msgSend_setEstimatedVisibleSnippetDisplaySize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEstimatedVisibleSnippetDisplaySize:");
}

id objc_msgSend_setExclusiveTouch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExclusiveTouch:");
}

id objc_msgSend_setExists_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExists:");
}

id objc_msgSend_setExpandText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExpandText:");
}

id objc_msgSend_setExpirationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExpirationHandler:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setFaceTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFaceTime:");
}

id objc_msgSend_setFaceTimeAudio_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFaceTimeAudio:");
}

id objc_msgSend_setFamilyName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFamilyName:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setFormattedTextPieces_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFormattedTextPieces:");
}

id objc_msgSend_setFormattingContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFormattingContext:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setFromPlatteredCardView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFromPlatteredCardView:");
}

id objc_msgSend_setFromPlatteredCardViewOriginalFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFromPlatteredCardViewOriginalFrame:");
}

id objc_msgSend_setFrontMostAppOrientation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrontMostAppOrientation:");
}

id objc_msgSend_setFullScreenDimmingLayerVisible_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFullScreenDimmingLayerVisible:animated:");
}

id objc_msgSend_setGender_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGender:");
}

id objc_msgSend_setGivenName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGivenName:");
}

id objc_msgSend_setGreenValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGreenValue:");
}

id objc_msgSend_setGuideHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGuideHidden:");
}

id objc_msgSend_setGuideHidden_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGuideHidden:animated:");
}

id objc_msgSend_setHandleTTSCodes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHandleTTSCodes:");
}

id objc_msgSend_setHandledIntent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHandledIntent:");
}

id objc_msgSend_setHasChevron_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasChevron:");
}

id objc_msgSend_setHasDefaultAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasDefaultAction:");
}

id objc_msgSend_setHasPresentedSiriAssetsNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasPresentedSiriAssetsNotification:");
}

id objc_msgSend_setHeaderText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHeaderText:");
}

id objc_msgSend_setHeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHeight:");
}

id objc_msgSend_setHelpButtonEmphasized_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHelpButtonEmphasized:");
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidden:");
}

id objc_msgSend_setHighlightColorForTemplate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHighlightColorForTemplate:");
}

id objc_msgSend_setHighlighted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHighlighted:");
}

id objc_msgSend_setHitTestsAsOpaque_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHitTestsAsOpaque:");
}

id objc_msgSend_setHyphenationFactor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHyphenationFactor:");
}

id objc_msgSend_setIconImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIconImage:");
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImage:");
}

id objc_msgSend_setImageIsRightAligned_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImageIsRightAligned:");
}

id objc_msgSend_setImageView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImageView:");
}

id objc_msgSend_setInsertionPointColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInsertionPointColor:");
}

id objc_msgSend_setIntentMessageData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIntentMessageData:");
}

id objc_msgSend_setIntentMessageName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIntentMessageName:");
}

id objc_msgSend_setIntentMetadata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIntentMetadata:");
}

id objc_msgSend_setIntentResponseMessageData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIntentResponseMessageData:");
}

id objc_msgSend_setIntentResponseMessageName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIntentResponseMessageName:");
}

id objc_msgSend_setInteractionId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInteractionId:");
}

id objc_msgSend_setInteractive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInteractive:");
}

id objc_msgSend_setInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterface:");
}

id objc_msgSend_setInterface_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterface:forSelector:argumentIndex:ofReply:");
}

id objc_msgSend_setInterfaceTarget_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterfaceTarget:");
}

id objc_msgSend_setInterpretations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterpretations:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setIsBold_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsBold:");
}

id objc_msgSend_setIsCentered_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsCentered:");
}

id objc_msgSend_setIsDeviceLocked_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsDeviceLocked:");
}

id objc_msgSend_setIsForBluetoothCar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsForBluetoothCar:");
}

id objc_msgSend_setIsFromDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsFromDevice:");
}

id objc_msgSend_setIsTemplate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsTemplate:");
}

id objc_msgSend_setItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setItem:");
}

id objc_msgSend_setItemType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setItemType:");
}

id objc_msgSend_setItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setItems:");
}

id objc_msgSend_setKeyboardAppearance_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeyboardAppearance:");
}

id objc_msgSend_setKeylineCustomBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeylineCustomBackgroundColor:");
}

id objc_msgSend_setKeylineType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeylineType:");
}

id objc_msgSend_setLanguageCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLanguageCode:");
}

id objc_msgSend_setLanguageString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLanguageString:");
}

id objc_msgSend_setLargeSubheaderText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLargeSubheaderText:");
}

id objc_msgSend_setLastKnownInterfaceOrientation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastKnownInterfaceOrientation:");
}

id objc_msgSend_setLat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLat:");
}

id objc_msgSend_setLaunchId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLaunchId:");
}

id objc_msgSend_setLeadingSubtitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLeadingSubtitle:");
}

id objc_msgSend_setLeadingText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLeadingText:");
}

id objc_msgSend_setLineFragmentPadding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLineFragmentPadding:");
}

id objc_msgSend_setLineSpacing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLineSpacing:");
}

id objc_msgSend_setListenAfterSpeaking_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setListenAfterSpeaking:");
}

id objc_msgSend_setListenAfterSpeakingBehavior_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setListenAfterSpeakingBehavior:");
}

id objc_msgSend_setLng_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLng:");
}

id objc_msgSend_setLocalImageType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocalImageType:");
}

id objc_msgSend_setLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocation:");
}

id objc_msgSend_setMachServiceIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMachServiceIdentifier:");
}

id objc_msgSend_setMaxConcurrentOperationCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaxConcurrentOperationCount:");
}

id objc_msgSend_setMaxLines_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaxLines:");
}

id objc_msgSend_setMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMessage:");
}

id objc_msgSend_setMetricsContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetricsContext:");
}

id objc_msgSend_setMiddleName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMiddleName:");
}

id objc_msgSend_setMinimumInteritemSpacing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinimumInteritemSpacing:");
}

id objc_msgSend_setMinimumLineSpacing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinimumLineSpacing:");
}

id objc_msgSend_setModalPresentationCapturesStatusBarAppearance_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModalPresentationCapturesStatusBarAppearance:");
}

id objc_msgSend_setModalPresentationStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModalPresentationStyle:");
}

id objc_msgSend_setModelData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModelData:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setName:");
}

id objc_msgSend_setNamePrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNamePrefix:");
}

id objc_msgSend_setNameSuffix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNameSuffix:");
}

id objc_msgSend_setNavigationBarHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNavigationBarHidden:");
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsLayout];
}

id objc_msgSend_setNeedsStatusBarAppearanceUpdate(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsStatusBarAppearanceUpdate];
}

id objc_msgSend_setNeedsUpdateConstraints(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsUpdateConstraints];
}

id objc_msgSend_setNickname_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNickname:");
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberOfLines:");
}

id objc_msgSend_setObject_atIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:atIndexedSubscript:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOnDeviceUtterancesPresent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOnDeviceUtterancesPresent:");
}

id objc_msgSend_setOpaque_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOpaque:");
}

id objc_msgSend_setOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOperation:");
}

id objc_msgSend_setOrientation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOrientation:");
}

id objc_msgSend_setOriginalRank_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOriginalRank:");
}

id objc_msgSend_setOriginalRequestOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOriginalRequestOptions:");
}

id objc_msgSend_setOriginalScore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOriginalScore:");
}

id objc_msgSend_setPatternId_forViewId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPatternId:forViewId:");
}

id objc_msgSend_setPercentComplete_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPercentComplete:");
}

id objc_msgSend_setPhrases_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPhrases:");
}

id objc_msgSend_setPinBehavior_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPinBehavior:");
}

id objc_msgSend_setPinColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPinColor:");
}

id objc_msgSend_setPlaybackCommand_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaybackCommand:");
}

id objc_msgSend_setPlaybackObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaybackObserver:");
}

id objc_msgSend_setPlayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayer:");
}

id objc_msgSend_setPreSynthesizeTTSCommand_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreSynthesizeTTSCommand:");
}

id objc_msgSend_setPresentation_animated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPresentation:animated:completion:");
}

id objc_msgSend_setPresentationDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPresentationDomain:");
}

id objc_msgSend_setPresentationIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPresentationIdentifier:");
}

id objc_msgSend_setPresentationMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPresentationMode:");
}

id objc_msgSend_setPreviousInteractionInputType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreviousInteractionInputType:");
}

id objc_msgSend_setPreviousSiriRequestErrorTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreviousSiriRequestErrorTimestamp:");
}

id objc_msgSend_setPreviousTurnID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreviousTurnID:");
}

id objc_msgSend_setPreviousTurnIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreviousTurnIdentifier:");
}

id objc_msgSend_setPreviousUtterance_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreviousUtterance:");
}

id objc_msgSend_setPriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPriority:");
}

id objc_msgSend_setPronunciationContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPronunciationContext:");
}

id objc_msgSend_setPronunciationRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPronunciationRequest:");
}

id objc_msgSend_setPunchOutUri_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPunchOutUri:");
}

id objc_msgSend_setPunchoutOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPunchoutOptions:");
}

id objc_msgSend_setQualityOfService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQualityOfService:");
}

id objc_msgSend_setReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReason:");
}

id objc_msgSend_setRecognition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecognition:");
}

id objc_msgSend_setRedComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRedComponent:");
}

id objc_msgSend_setRedValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRedValue:");
}

id objc_msgSend_setRefId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRefId:");
}

id objc_msgSend_setReferenceIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReferenceIdentifier:");
}

id objc_msgSend_setReferencedCommands_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReferencedCommands:");
}

id objc_msgSend_setReferentialCommand_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReferentialCommand:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setRequestHandlingStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequestHandlingStatus:");
}

id objc_msgSend_setRequestInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequestInfo:");
}

id objc_msgSend_setRequestOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequestOptions:");
}

id objc_msgSend_setRequestSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequestSource:");
}

id objc_msgSend_setRequiresExternalPower_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequiresExternalPower:");
}

id objc_msgSend_setRequiresNetworkConnectivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequiresNetworkConnectivity:");
}

id objc_msgSend_setReturnKeyType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReturnKeyType:");
}

id objc_msgSend_setRole_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRole:");
}

id objc_msgSend_setRootViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRootViewController:");
}

id objc_msgSend_setRoute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRoute:");
}

id objc_msgSend_setSash_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSash:");
}

id objc_msgSend_setScale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScale:");
}

id objc_msgSend_setScrollEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScrollEnabled:");
}

id objc_msgSend_setSelectable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectable:");
}

id objc_msgSend_setSelected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelected:");
}

id objc_msgSend_setSelectionStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectionStyle:");
}

id objc_msgSend_setSelectionText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectionText:");
}

id objc_msgSend_setSeparatorColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSeparatorColor:");
}

id objc_msgSend_setSeparatorStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSeparatorStyle:");
}

id objc_msgSend_setSeparatorType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSeparatorType:");
}

id objc_msgSend_setServerCommandId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setServerCommandId:");
}

id objc_msgSend_setServiceQuality_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setServiceQuality:");
}

id objc_msgSend_setSessionCreationTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSessionCreationTime:");
}

id objc_msgSend_setSessionId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSessionId:");
}

id objc_msgSend_setSharedMapsUserSessionEntity_shareSessionIDWithMaps_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSharedMapsUserSessionEntity:shareSessionIDWithMaps:");
}

id objc_msgSend_setShouldIgnoreDoNotDisturb_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldIgnoreDoNotDisturb:");
}

id objc_msgSend_setShouldIgnoreRingerSwitch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldIgnoreRingerSwitch:");
}

id objc_msgSend_setShouldSuppressDefaultAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldSuppressDefaultAction:");
}

id objc_msgSend_setShouldSuppressErrorTTS_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldSuppressErrorTTS:");
}

id objc_msgSend_setShowsSensitiveUI_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsSensitiveUI:");
}

id objc_msgSend_setShowsVerticalScrollIndicator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsVerticalScrollIndicator:");
}

id objc_msgSend_setSignalDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSignalDomain:");
}

id objc_msgSend_setSignalIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSignalIdentifier:");
}

id objc_msgSend_setSiriIsActive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSiriIsActive:");
}

id objc_msgSend_setSiriRequestErrorCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSiriRequestErrorCount:");
}

id objc_msgSend_setSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSize:");
}

id objc_msgSend_setSizeFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSizeFormat:");
}

id objc_msgSend_setSnippetViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSnippetViewController:");
}

id objc_msgSend_setSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSource:");
}

id objc_msgSend_setSpeakableContextInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpeakableContextInfo:");
}

id objc_msgSend_setSpeakableDelimiter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpeakableDelimiter:");
}

id objc_msgSend_setSpeakableFinalDelimiter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpeakableFinalDelimiter:");
}

id objc_msgSend_setSpeakableSuffix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpeakableSuffix:");
}

id objc_msgSend_setSpeakableText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpeakableText:");
}

id objc_msgSend_setSpeechRequestOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpeechRequestOptions:");
}

id objc_msgSend_setStartRecordingSoundId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStartRecordingSoundId:");
}

id objc_msgSend_setStartedOrChanged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStartedOrChanged:");
}

id objc_msgSend_setState_animated_transitionSpeed_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setState:animated:transitionSpeed:completion:");
}

id objc_msgSend_setStatusBarHidden_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStatusBarHidden:animated:");
}

id objc_msgSend_setStatusBarHidden_animated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStatusBarHidden:animated:completion:");
}

id objc_msgSend_setStatusViewDisabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStatusViewDisabled:");
}

id objc_msgSend_setStatusViewHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStatusViewHidden:");
}

id objc_msgSend_setStatusViewUserInteractionEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStatusViewUserInteractionEnabled:");
}

id objc_msgSend_setSubheaderText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSubheaderText:");
}

id objc_msgSend_setSubtitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSubtitle:");
}

id objc_msgSend_setSummaryTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSummaryTitle:");
}

id objc_msgSend_setSynchronizedWithServer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSynchronizedWithServer:");
}

id objc_msgSend_setSystemExtensionBundleId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSystemExtensionBundleId:");
}

id objc_msgSend_setTagPhrase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTagPhrase:");
}

id objc_msgSend_setTaskCompletedWithSuccess_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTaskCompletedWithSuccess:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setText:");
}

id objc_msgSend_setTextAlignment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextAlignment:");
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextColor:");
}

id objc_msgSend_setTextContainerInset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextContainerInset:");
}

id objc_msgSend_setTextContainerStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextContainerStyle:");
}

id objc_msgSend_setTextDirection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextDirection:");
}

id objc_msgSend_setTextLegibilityWeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextLegibilityWeight:");
}

id objc_msgSend_setTimeStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeStyle:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTitle_forState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:forState:");
}

id objc_msgSend_setToPlatteredCardView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setToPlatteredCardView:");
}

id objc_msgSend_setTokens_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTokens:");
}

id objc_msgSend_setTopContentInset_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTopContentInset:animated:");
}

id objc_msgSend_setTopPadding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTopPadding:");
}

id objc_msgSend_setTrailingSubtitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTrailingSubtitle:");
}

id objc_msgSend_setTrailingText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTrailingText:");
}

id objc_msgSend_setTransform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransform:");
}

id objc_msgSend_setTransitionDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransitionDuration:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setType:");
}

id objc_msgSend_setTypeName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTypeName:");
}

id objc_msgSend_setTypeToSiriViewHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTypeToSiriViewHidden:");
}

id objc_msgSend_setUpViews(void *a1, const char *a2, ...)
{
  return _[a1 setUpViews];
}

id objc_msgSend_setUrlValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUrlValue:");
}

id objc_msgSend_setUrls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUrls:");
}

id objc_msgSend_setUserData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserData:");
}

id objc_msgSend_setUserInteractionEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInteractionEnabled:");
}

id objc_msgSend_setUtteranceSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUtteranceSource:");
}

id objc_msgSend_setUtteranceUserInteractionEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUtteranceUserInteractionEnabled:");
}

id objc_msgSend_setValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setView:");
}

id objc_msgSend_setViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setViewController:");
}

id objc_msgSend_setViewId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setViewId:");
}

id objc_msgSend_setViews_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setViews:");
}

id objc_msgSend_setVisualMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVisualMode:");
}

id objc_msgSend_setWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWidth:");
}

id objc_msgSend_setWindowScene_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWindowScene:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithCapacity:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_setWords_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWords:");
}

id objc_msgSend_settings(void *a1, const char *a2, ...)
{
  return _[a1 settings];
}

id objc_msgSend_setupBackgroundAssetCheck(void *a1, const char *a2, ...)
{
  return _[a1 setupBackgroundAssetCheck];
}

id objc_msgSend_sf_isChinaRegionCellularDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sf_isChinaRegionCellularDevice");
}

id objc_msgSend_sharedAVSystemController(void *a1, const char *a2, ...)
{
  return _[a1 sharedAVSystemController];
}

id objc_msgSend_sharedAccessoryManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedAccessoryManager];
}

id objc_msgSend_sharedAnalytics(void *a1, const char *a2, ...)
{
  return _[a1 sharedAnalytics];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return _[a1 sharedApplication];
}

id objc_msgSend_sharedDefaultEvaluator(void *a1, const char *a2, ...)
{
  return _[a1 sharedDefaultEvaluator];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedManager];
}

id objc_msgSend_sharedObserver(void *a1, const char *a2, ...)
{
  return _[a1 sharedObserver];
}

id objc_msgSend_sharedPreferences(void *a1, const char *a2, ...)
{
  return _[a1 sharedPreferences];
}

id objc_msgSend_sharedScheduler(void *a1, const char *a2, ...)
{
  return _[a1 sharedScheduler];
}

id objc_msgSend_sharedSiriPresentationPluginHost(void *a1, const char *a2, ...)
{
  return _[a1 sharedSiriPresentationPluginHost];
}

id objc_msgSend_sharedSystemAudioContext(void *a1, const char *a2, ...)
{
  return _[a1 sharedSystemAudioContext];
}

id objc_msgSend_shortTapActionWithRequestOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shortTapActionWithRequestOptions:");
}

id objc_msgSend_shouldAllowTouchPassThrough(void *a1, const char *a2, ...)
{
  return _[a1 shouldAllowTouchPassThrough];
}

id objc_msgSend_shouldDismissForIdling(void *a1, const char *a2, ...)
{
  return _[a1 shouldDismissForIdling];
}

id objc_msgSend_shouldEnableInteractionForSiriViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldEnableInteractionForSiriViewController:");
}

id objc_msgSend_shouldPlayHighResolutionContent(void *a1, const char *a2, ...)
{
  return _[a1 shouldPlayHighResolutionContent];
}

id objc_msgSend_shouldPunchOutInPlace(void *a1, const char *a2, ...)
{
  return _[a1 shouldPunchOutInPlace];
}

id objc_msgSend_shouldRedactSpeakableTextForAceObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldRedactSpeakableTextForAceObject:");
}

id objc_msgSend_shouldResumeInterruptedAudioPlaybackForAttendingState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldResumeInterruptedAudioPlaybackForAttendingState:");
}

id objc_msgSend_shouldUseEventDrivenIdleAndQuietUpdates(void *a1, const char *a2, ...)
{
  return _[a1 shouldUseEventDrivenIdleAndQuietUpdates];
}

id objc_msgSend_showAcousticIDSpinner(void *a1, const char *a2, ...)
{
  return _[a1 showAcousticIDSpinner];
}

id objc_msgSend_showEmptyView(void *a1, const char *a2, ...)
{
  return _[a1 showEmptyView];
}

id objc_msgSend_showFullScreenEffect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showFullScreenEffect:");
}

id objc_msgSend_showRequestHandlingStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showRequestHandlingStatus:");
}

id objc_msgSend_showSpeechAlternatives_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showSpeechAlternatives:");
}

id objc_msgSend_showTapToEditTipCount(void *a1, const char *a2, ...)
{
  return _[a1 showTapToEditTipCount];
}

id objc_msgSend_showsFavoriteStar(void *a1, const char *a2, ...)
{
  return _[a1 showsFavoriteStar];
}

id objc_msgSend_showtimeSnippet(void *a1, const char *a2, ...)
{
  return _[a1 showtimeSnippet];
}

id objc_msgSend_signalDomain(void *a1, const char *a2, ...)
{
  return _[a1 signalDomain];
}

id objc_msgSend_signalIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 signalIdentifier];
}

id objc_msgSend_signalWithInlineStreaming_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signalWithInlineStreaming:");
}

id objc_msgSend_siriAudioRecordingDidChangePowerLevel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriAudioRecordingDidChangePowerLevel:");
}

id objc_msgSend_siriAudioRecordingDidChangePowerLevel_peakLevel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriAudioRecordingDidChangePowerLevel:peakLevel:");
}

id objc_msgSend_siriDidActivateFromSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriDidActivateFromSource:");
}

id objc_msgSend_siriDidBeginTaskWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriDidBeginTaskWithIdentifier:");
}

id objc_msgSend_siriDidDeactivate(void *a1, const char *a2, ...)
{
  return _[a1 siriDidDeactivate];
}

id objc_msgSend_siriDidDeactivateWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriDidDeactivateWithCompletion:");
}

id objc_msgSend_siriDidDetectMusic(void *a1, const char *a2, ...)
{
  return _[a1 siriDidDetectMusic];
}

id objc_msgSend_siriDidEnterLatencyState(void *a1, const char *a2, ...)
{
  return _[a1 siriDidEnterLatencyState];
}

id objc_msgSend_siriDidFinishActionsForConversationItemWithIdentifier_inConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriDidFinishActionsForConversationItemWithIdentifier:inConversation:");
}

id objc_msgSend_siriDidHidePasscodeUnlock(void *a1, const char *a2, ...)
{
  return _[a1 siriDidHidePasscodeUnlock];
}

id objc_msgSend_siriDidOpenURL_bundleId_inPlace_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriDidOpenURL:bundleId:inPlace:");
}

id objc_msgSend_siriDidReceiveAdditionalContent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriDidReceiveAdditionalContent:");
}

id objc_msgSend_siriDidReceiveLatencyInformation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriDidReceiveLatencyInformation:");
}

id objc_msgSend_siriDidReceiveStartGenAIEnablementFlowCommand_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriDidReceiveStartGenAIEnablementFlowCommand:completion:");
}

id objc_msgSend_siriDidReceiveStartImmersiveExperienceCommand_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriDidReceiveStartImmersiveExperienceCommand:completion:");
}

id objc_msgSend_siriDidStartNewConversationWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriDidStartNewConversationWithIdentifier:");
}

id objc_msgSend_siriDidStartSpeakingWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriDidStartSpeakingWithIdentifier:");
}

id objc_msgSend_siriDidStopSpeakingWithIdentifier_speechQueueIsEmpty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriDidStopSpeakingWithIdentifier:speechQueueIsEmpty:");
}

id objc_msgSend_siriDidTransitionFromState_event_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriDidTransitionFromState:event:");
}

id objc_msgSend_siriDidUpdateASRWithRecognition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriDidUpdateASRWithRecognition:");
}

id objc_msgSend_siriEnabledAppListForSiriViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriEnabledAppListForSiriViewController:");
}

id objc_msgSend_siriGMAssetsAvailable(void *a1, const char *a2, ...)
{
  return _[a1 siriGMAssetsAvailable];
}

id objc_msgSend_siriIdleAndQuietStatusDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriIdleAndQuietStatusDidChange:");
}

id objc_msgSend_siriIsActive(void *a1, const char *a2, ...)
{
  return _[a1 siriIsActive];
}

id objc_msgSend_siriIsIdleAndQuietStatusDidChange_isAttending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriIsIdleAndQuietStatusDidChange:isAttending:");
}

id objc_msgSend_siriIsShowingPasscodeUnlock(void *a1, const char *a2, ...)
{
  return _[a1 siriIsShowingPasscodeUnlock];
}

id objc_msgSend_siriNetworkAvailabilityDidChange(void *a1, const char *a2, ...)
{
  return _[a1 siriNetworkAvailabilityDidChange];
}

id objc_msgSend_siriPresentation_conversationWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriPresentation:conversationWithIdentifier:");
}

id objc_msgSend_siriPresentation_didCorrectRecognition_correctionIdentifier_forConversationItemWithIdentifier_userSelectionResults_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "siriPresentation:didCorrectRecognition:correctionIdentifier:forConversationItemWithIdentifier:userSelectionResults:");
}

id objc_msgSend_siriPresentation_didPresentConversationItemsWithIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriPresentation:didPresentConversationItemsWithIdentifiers:");
}

id objc_msgSend_siriPresentation_handleStartLocalRequest_turnIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriPresentation:handleStartLocalRequest:turnIdentifier:");
}

id objc_msgSend_siriPresentation_synthesizeSpeechWithText_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriPresentation:synthesizeSpeechWithText:completion:");
}

id objc_msgSend_siriPresentation_viewDidAppearWithClassDescriptor_identifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriPresentation:viewDidAppearWithClassDescriptor:identifier:");
}

id objc_msgSend_siriPresentationDidPresentUserInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriPresentationDidPresentUserInterface:");
}

id objc_msgSend_siriRequestErrorCount(void *a1, const char *a2, ...)
{
  return _[a1 siriRequestErrorCount];
}

id objc_msgSend_siriRequestWillStartWithRequestOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriRequestWillStartWithRequestOptions:");
}

id objc_msgSend_siriResponseModeDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriResponseModeDidChange:");
}

id objc_msgSend_siriResponseShouldAlwaysPrint(void *a1, const char *a2, ...)
{
  return _[a1 siriResponseShouldAlwaysPrint];
}

id objc_msgSend_siriResultsDidDismissInTamale(void *a1, const char *a2, ...)
{
  return _[a1 siriResultsDidDismissInTamale];
}

id objc_msgSend_siriSessionAudioRecordingDidChangePowerLevel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriSessionAudioRecordingDidChangePowerLevel:");
}

id objc_msgSend_siriSessionDidInitializeSessionInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriSessionDidInitializeSessionInfo:");
}

id objc_msgSend_siriSessionDidReceiveAddViewsCommand_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriSessionDidReceiveAddViewsCommand:completion:");
}

id objc_msgSend_siriSessionDidReceiveSpeechPartialResultCommand_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriSessionDidReceiveSpeechPartialResultCommand:");
}

id objc_msgSend_siriSessionDidReceiveSpeechRecognizedCommand_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriSessionDidReceiveSpeechRecognizedCommand:");
}

id objc_msgSend_siriSessionDidStartNewTurn_associatedLaunchStartContext_machAbsoluteTime_linkPreviousTurn_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriSessionDidStartNewTurn:associatedLaunchStartContext:machAbsoluteTime:linkPreviousTurn:");
}

id objc_msgSend_siriSessionDidUpdateSessionInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriSessionDidUpdateSessionInfo:");
}

id objc_msgSend_siriSnippetViewController_didShowGuideStartDate_endDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriSnippetViewController:didShowGuideStartDate:endDate:");
}

id objc_msgSend_siriSnippetViewController_pushSirilandSnippets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriSnippetViewController:pushSirilandSnippets:");
}

id objc_msgSend_siriSnippetViewControllerIsVisible_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriSnippetViewControllerIsVisible:");
}

id objc_msgSend_siriUIDidPresentDynamicSnippetWithInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriUIDidPresentDynamicSnippetWithInfo:");
}

id objc_msgSend_siriUILocalizedStringForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriUILocalizedStringForKey:");
}

id objc_msgSend_siriUILocalizedStringForKey_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriUILocalizedStringForKey:table:");
}

id objc_msgSend_siriUILocalizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriUILocalizedStringForKey:value:table:");
}

id objc_msgSend_siriViewController_addSelectionResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriViewController:addSelectionResponse:");
}

id objc_msgSend_siriViewController_performAceCommands_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriViewController:performAceCommands:");
}

id objc_msgSend_siriViewController_startCorrectedSpeechRequestWithText_correctionIdentifier_userSelectionResults_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "siriViewController:startCorrectedSpeechRequestWithText:correctionIdentifier:userSelectionResults:");
}

id objc_msgSend_siriViewControllerDidEndEditing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriViewControllerDidEndEditing:");
}

id objc_msgSend_siriViewControllerDidResignFirstResponder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriViewControllerDidResignFirstResponder:");
}

id objc_msgSend_siriViewControllerExpectedWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriViewControllerExpectedWidth:");
}

id objc_msgSend_siriViewControllerHeightDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriViewControllerHeightDidChange:");
}

id objc_msgSend_siriViewControllerHeightDidChange_pinTopOfSnippet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriViewControllerHeightDidChange:pinTopOfSnippet:");
}

id objc_msgSend_siriViewControllerIsEditing(void *a1, const char *a2, ...)
{
  return _[a1 siriViewControllerIsEditing];
}

id objc_msgSend_siriViewControllerRequestKeyboardForTapToEditWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriViewControllerRequestKeyboardForTapToEditWithCompletion:");
}

id objc_msgSend_siriViewControllerRequestTearDownEditingViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriViewControllerRequestTearDownEditingViewController:");
}

id objc_msgSend_siriViewControllerRequestToPin_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriViewControllerRequestToPin:");
}

id objc_msgSend_siriViewControllerShouldPreventUserInteraction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriViewControllerShouldPreventUserInteraction:");
}

id objc_msgSend_siriViewControllerWillBeginEditing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriViewControllerWillBeginEditing:");
}

id objc_msgSend_siriWillActivateFromSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriWillActivateFromSource:");
}

id objc_msgSend_siriWillBePresented_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriWillBePresented:");
}

id objc_msgSend_siriWillBeginTearDownForDismissalReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriWillBeginTearDownForDismissalReason:");
}

id objc_msgSend_siriWillBeginTearDownForDismissalReason_withOriginalDismissalOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriWillBeginTearDownForDismissalReason:withOriginalDismissalOptions:");
}

id objc_msgSend_siriWillDismissWithReason_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriWillDismissWithReason:completion:");
}

id objc_msgSend_siriWillHidePasscodeUnlock(void *a1, const char *a2, ...)
{
  return _[a1 siriWillHidePasscodeUnlock];
}

id objc_msgSend_siriWillProcessAppLaunchWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriWillProcessAppLaunchWithBundleIdentifier:");
}

id objc_msgSend_siriWillShowPasscodeUnlock(void *a1, const char *a2, ...)
{
  return _[a1 siriWillShowPasscodeUnlock];
}

id objc_msgSend_siriWillShowPasscodeUnlockAndCancelRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriWillShowPasscodeUnlockAndCancelRequest:");
}

id objc_msgSend_siriWillStartTextInputRequest(void *a1, const char *a2, ...)
{
  return _[a1 siriWillStartTextInputRequest];
}

id objc_msgSend_siriui_blendEffectColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriui_blendEffectColor");
}

id objc_msgSend_siriui_eventInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriui_eventInfo");
}

id objc_msgSend_siriui_lightHighlightColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriui_lightHighlightColor");
}

id objc_msgSend_siriui_lightInsertionPointColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriui_lightInsertionPointColor");
}

id objc_msgSend_siriui_lightKeylineColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriui_lightKeylineColor");
}

id objc_msgSend_siriui_lightTextColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriui_lightTextColor");
}

id objc_msgSend_siriui_lightWeightBodySubtextSizeFont(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriui_lightWeightBodySubtextSizeFont");
}

id objc_msgSend_siriui_lightWeightFontWithSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriui_lightWeightFontWithSize:");
}

id objc_msgSend_siriui_maskingColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriui_maskingColor");
}

id objc_msgSend_siriui_mediumWeightBodySizeFont(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriui_mediumWeightBodySizeFont");
}

id objc_msgSend_siriui_mediumWeightFontWithSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriui_mediumWeightFontWithSize:");
}

id objc_msgSend_siriui_serverTipFont(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriui_serverTipFont");
}

id objc_msgSend_siriui_serverTipPrefixFont(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriui_serverTipPrefixFont");
}

id objc_msgSend_siriui_serverUtteranceCorrectionPromptFont(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriui_serverUtteranceCorrectionPromptFont");
}

id objc_msgSend_siriui_serverUtteranceFont(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriui_serverUtteranceFont");
}

id objc_msgSend_siriui_setBlendEffectEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriui_setBlendEffectEnabled:");
}

id objc_msgSend_siriui_tapToEditColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriui_tapToEditColor");
}

id objc_msgSend_siriui_tapToEditMaskingColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriui_tapToEditMaskingColor");
}

id objc_msgSend_siriui_userUtteranceEditModeVibrancyEffect(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriui_userUtteranceEditModeVibrancyEffect");
}

id objc_msgSend_siriui_userUtteranceFont(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriui_userUtteranceFont");
}

id objc_msgSend_sizeThatFits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sizeThatFits:");
}

id objc_msgSend_sizeThatFits_text_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sizeThatFits:text:");
}

id objc_msgSend_sizeThatFits_text_edgeInsets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sizeThatFits:text:edgeInsets:");
}

id objc_msgSend_sizeThatFits_text_font_textContainerStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sizeThatFits:text:font:textContainerStyle:");
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return _[a1 sizeToFit];
}

id objc_msgSend_smallSystemFontSize(void *a1, const char *a2, ...)
{
  return _[a1 smallSystemFontSize];
}

id objc_msgSend_snippet(void *a1, const char *a2, ...)
{
  return _[a1 snippet];
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return _[a1 source];
}

id objc_msgSend_speakableContextInfo(void *a1, const char *a2, ...)
{
  return _[a1 speakableContextInfo];
}

id objc_msgSend_speakableDelimiter(void *a1, const char *a2, ...)
{
  return _[a1 speakableDelimiter];
}

id objc_msgSend_speakableFinalDelimiter(void *a1, const char *a2, ...)
{
  return _[a1 speakableFinalDelimiter];
}

id objc_msgSend_speakableProviderForObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "speakableProviderForObject:");
}

id objc_msgSend_speakableSuffix(void *a1, const char *a2, ...)
{
  return _[a1 speakableSuffix];
}

id objc_msgSend_speakableText(void *a1, const char *a2, ...)
{
  return _[a1 speakableText];
}

id objc_msgSend_speakableTextOverride(void *a1, const char *a2, ...)
{
  return _[a1 speakableTextOverride];
}

id objc_msgSend_speechAlternativeHighlightListWithScore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "speechAlternativeHighlightListWithScore:");
}

id objc_msgSend_speechRecognized_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "speechRecognized:");
}

id objc_msgSend_speechRecordingDidBeginOnRecordRoute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "speechRecordingDidBeginOnRecordRoute:");
}

id objc_msgSend_speechRecordingDidCancelForRequest_onAVRecordRoute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "speechRecordingDidCancelForRequest:onAVRecordRoute:");
}

id objc_msgSend_speechRecordingDidDetectSpeechStartpoint(void *a1, const char *a2, ...)
{
  return _[a1 speechRecordingDidDetectSpeechStartpoint];
}

id objc_msgSend_speechRecordingDidEndForRequest_onAVRecordRoute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "speechRecordingDidEndForRequest:onAVRecordRoute:");
}

id objc_msgSend_speechRecordingDidFailForRequest_onAVRecordRoute_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "speechRecordingDidFailForRequest:onAVRecordRoute:withError:");
}

id objc_msgSend_speechRequestOptions(void *a1, const char *a2, ...)
{
  return _[a1 speechRequestOptions];
}

id objc_msgSend_speechTokensForUtteranceAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "speechTokensForUtteranceAtIndex:");
}

id objc_msgSend_spokenLanguageCode(void *a1, const char *a2, ...)
{
  return _[a1 spokenLanguageCode];
}

id objc_msgSend_spokenOnly(void *a1, const char *a2, ...)
{
  return _[a1 spokenOnly];
}

id objc_msgSend_sr_applySnippetProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sr_applySnippetProperties:");
}

id objc_msgSend_sr_inPerson(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sr_inPerson");
}

id objc_msgSend_sr_sirilandShim(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sr_sirilandShim");
}

id objc_msgSend_sruif_aceCommandType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sruif_aceCommandType");
}

id objc_msgSend_sruif_appPunchOutEventWithRefId_URL_appDisplayName_bundleId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sruif_appPunchOutEventWithRefId:URL:appDisplayName:bundleId:");
}

id objc_msgSend_sruif_combinedSpeakableText(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sruif_combinedSpeakableText");
}

id objc_msgSend_sruif_commandFailedWithRefId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sruif_commandFailedWithRefId:");
}

id objc_msgSend_sruif_commandSucceededWithRefId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sruif_commandSucceededWithRefId:");
}

id objc_msgSend_sruif_dialogPhase(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sruif_dialogPhase");
}

id objc_msgSend_sruif_hasExternalDomainsForStringWithFormat_shouldRedactLog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sruif_hasExternalDomainsForStringWithFormat:shouldRedactLog:");
}

id objc_msgSend_sruif_ignoresMuteSwitch(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sruif_ignoresMuteSwitch");
}

id objc_msgSend_sruif_setRecognitionWithCorrectedSpeech_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sruif_setRecognitionWithCorrectedSpeech:");
}

id objc_msgSend_sruif_speakableUtteranceParserForCurrentLanguage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sruif_speakableUtteranceParserForCurrentLanguage");
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _[a1 start];
}

id objc_msgSend_startAlertSoundID(void *a1, const char *a2, ...)
{
  return _[a1 startAlertSoundID];
}

id objc_msgSend_startAttendingWithDeviceID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startAttendingWithDeviceID:");
}

id objc_msgSend_startCorrectedRequestWithText_correctionIdentifier_userSelectionResults_turnIdentifier_machAbsoluteTime_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "startCorrectedRequestWithText:correctionIdentifier:userSelectionResults:turnIdentifier:machAbsoluteTime:");
}

id objc_msgSend_startNewConversation(void *a1, const char *a2, ...)
{
  return _[a1 startNewConversation];
}

id objc_msgSend_startPlaying(void *a1, const char *a2, ...)
{
  return _[a1 startPlaying];
}

id objc_msgSend_startRequestForSuggestion_inputType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startRequestForSuggestion:inputType:");
}

id objc_msgSend_startRequestForText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startRequestForText:");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _[a1 state];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return _[a1 status];
}

id objc_msgSend_statusBarFrameDidChange(void *a1, const char *a2, ...)
{
  return _[a1 statusBarFrameDidChange];
}

id objc_msgSend_statusBarFrameForSiriPresentation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "statusBarFrameForSiriPresentation:");
}

id objc_msgSend_statusBarFrameForSuggestionsViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "statusBarFrameForSuggestionsViewController:");
}

id objc_msgSend_statusBarOrientation(void *a1, const char *a2, ...)
{
  return _[a1 statusBarOrientation];
}

id objc_msgSend_statusViewHeightDidChange(void *a1, const char *a2, ...)
{
  return _[a1 statusViewHeightDidChange];
}

id objc_msgSend_statusViewHeightForSiriPresentation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "statusViewHeightForSiriPresentation:");
}

id objc_msgSend_statusViewHeightForSuggestionsViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "statusViewHeightForSuggestionsViewController:");
}

id objc_msgSend_stopAttending(void *a1, const char *a2, ...)
{
  return _[a1 stopAttending];
}

id objc_msgSend_stopPlaying(void *a1, const char *a2, ...)
{
  return _[a1 stopPlaying];
}

id objc_msgSend_stopRecordingSpeech(void *a1, const char *a2, ...)
{
  return _[a1 stopRecordingSpeech];
}

id objc_msgSend_storeClientGeneratedDUC_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeClientGeneratedDUC:");
}

id objc_msgSend_storeCurrentInstrumentationTurnContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeCurrentInstrumentationTurnContext:");
}

id objc_msgSend_storeDialogPhasesForItemsAtIndexPaths_forConversation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeDialogPhasesForItemsAtIndexPaths:forConversation:");
}

id objc_msgSend_streamIds(void *a1, const char *a2, ...)
{
  return _[a1 streamIds];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return _[a1 string];
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingFormat:");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByTrimmingCharactersInSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByTrimmingCharactersInSet:");
}

id objc_msgSend_stringForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForKey:");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithString:");
}

id objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithValidatedFormat:validFormatSpecifiers:error:");
}

id objc_msgSend_submitTaskRequest_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "submitTaskRequest:error:");
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringWithRange:");
}

id objc_msgSend_subtitle(void *a1, const char *a2, ...)
{
  return _[a1 subtitle];
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return _[a1 subviews];
}

id objc_msgSend_suffix(void *a1, const char *a2, ...)
{
  return _[a1 suffix];
}

id objc_msgSend_suggestionsViewController_didHideVibrantView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "suggestionsViewController:didHideVibrantView:");
}

id objc_msgSend_suggestionsViewDidShowSuggestions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "suggestionsViewDidShowSuggestions:");
}

id objc_msgSend_summaryTitle(void *a1, const char *a2, ...)
{
  return _[a1 summaryTitle];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return _[a1 superview];
}

id objc_msgSend_supportsCarPlay(void *a1, const char *a2, ...)
{
  return _[a1 supportsCarPlay];
}

id objc_msgSend_supportsTextInput(void *a1, const char *a2, ...)
{
  return _[a1 supportsTextInput];
}

id objc_msgSend_supportsTransformationForAceCommand_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportsTransformationForAceCommand:");
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return _[a1 synchronize];
}

id objc_msgSend_synthesizeWithRequest_didFinish_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "synthesizeWithRequest:didFinish:");
}

id objc_msgSend_systemBackgroundColor(void *a1, const char *a2, ...)
{
  return _[a1 systemBackgroundColor];
}

id objc_msgSend_systemFillColor(void *a1, const char *a2, ...)
{
  return _[a1 systemFillColor];
}

id objc_msgSend_systemFontOfSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemFontOfSize:");
}

id objc_msgSend_systemUptime(void *a1, const char *a2, ...)
{
  return _[a1 systemUptime];
}

id objc_msgSend_tagPhrase(void *a1, const char *a2, ...)
{
  return _[a1 tagPhrase];
}

id objc_msgSend_tallParagraphStyleForCurrentScaleWithTextAlignment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tallParagraphStyleForCurrentScaleWithTextAlignment:");
}

id objc_msgSend_tearDownViews(void *a1, const char *a2, ...)
{
  return _[a1 tearDownViews];
}

id objc_msgSend_testingContext(void *a1, const char *a2, ...)
{
  return _[a1 testingContext];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return _[a1 text];
}

id objc_msgSend_textAlignment(void *a1, const char *a2, ...)
{
  return _[a1 textAlignment];
}

id objc_msgSend_textColor(void *a1, const char *a2, ...)
{
  return _[a1 textColor];
}

id objc_msgSend_textContainer(void *a1, const char *a2, ...)
{
  return _[a1 textContainer];
}

id objc_msgSend_textInputEnabled(void *a1, const char *a2, ...)
{
  return _[a1 textInputEnabled];
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return _[a1 textLabel];
}

id objc_msgSend_textOfUtteranceAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textOfUtteranceAtIndex:");
}

id objc_msgSend_textRequestSuggestionsButton_didEnableSuggestions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textRequestSuggestionsButton:didEnableSuggestions:");
}

id objc_msgSend_textWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textWithString:");
}

id objc_msgSend_theaterShowtimeListSnippet(void *a1, const char *a2, ...)
{
  return _[a1 theaterShowtimeListSnippet];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceNow];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_tipPrefix(void *a1, const char *a2, ...)
{
  return _[a1 tipPrefix];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return _[a1 title];
}

id objc_msgSend_titleBoldedRange(void *a1, const char *a2, ...)
{
  return _[a1 titleBoldedRange];
}

id objc_msgSend_toPlatteredCardView(void *a1, const char *a2, ...)
{
  return _[a1 toPlatteredCardView];
}

id objc_msgSend_toggle(void *a1, const char *a2, ...)
{
  return _[a1 toggle];
}

id objc_msgSend_toggleHomeAffordanceHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "toggleHomeAffordanceHidden:");
}

id objc_msgSend_toggleSiriHomeAffordanceGestureControl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "toggleSiriHomeAffordanceGestureControl:");
}

id objc_msgSend_tokenizer(void *a1, const char *a2, ...)
{
  return _[a1 tokenizer];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return _[a1 topAnchor];
}

id objc_msgSend_topObject(void *a1, const char *a2, ...)
{
  return _[a1 topObject];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 trailingAnchor];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return _[a1 traitCollection];
}

id objc_msgSend_transcriptItemWithAceObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transcriptItemWithAceObject:");
}

id objc_msgSend_transformAddViews_forMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transformAddViews:forMode:");
}

id objc_msgSend_transformModel_mode_currentIdiom_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transformModel:mode:currentIdiom:");
}

id objc_msgSend_transformVisualResponse_forMode_idiom_shouldHideSnippet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transformVisualResponse:forMode:idiom:shouldHideSnippet:");
}

id objc_msgSend_transitionController(void *a1, const char *a2, ...)
{
  return _[a1 transitionController];
}

id objc_msgSend_transitionCoordinator(void *a1, const char *a2, ...)
{
  return _[a1 transitionCoordinator];
}

id objc_msgSend_transitionDuration(void *a1, const char *a2, ...)
{
  return _[a1 transitionDuration];
}

id objc_msgSend_transitionDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transitionDuration:");
}

id objc_msgSend_transitionFromViewController_toViewController_duration_options_animations_completion_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transitionFromViewController:toViewController:duration:options:animations:completion:");
}

id objc_msgSend_translationInView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "translationInView:");
}

id objc_msgSend_trustsURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trustsURL:");
}

id objc_msgSend_turnIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 turnIdentifier];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_typedData(void *a1, const char *a2, ...)
{
  return _[a1 typedData];
}

id objc_msgSend_uiPresentationIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 uiPresentationIdentifier];
}

id objc_msgSend_understandingOnDeviceAssetsAvailable(void *a1, const char *a2, ...)
{
  return _[a1 understandingOnDeviceAssetsAvailable];
}

id objc_msgSend_unregisterNonButtonSourceWithType_withUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unregisterNonButtonSourceWithType:withUUID:");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_updateCacheWithGuideUpdate_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateCacheWithGuideUpdate:completion:");
}

id objc_msgSend_updateClientSettingsWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateClientSettingsWithBlock:");
}

id objc_msgSend_updateConstraintConstants(void *a1, const char *a2, ...)
{
  return _[a1 updateConstraintConstants];
}

id objc_msgSend_updateDictationResult_withAlternativeUtteranceAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateDictationResult:withAlternativeUtteranceAtIndex:");
}

id objc_msgSend_updateEdgeLightWindowLevel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateEdgeLightWindowLevel:");
}

id objc_msgSend_updateFeedbackFormWithSpeakableText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateFeedbackFormWithSpeakableText:");
}

id objc_msgSend_updateInteractiveTransition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateInteractiveTransition:");
}

id objc_msgSend_updateKeyboardInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateKeyboardInfo:");
}

id objc_msgSend_updateSessionIDFromUUIDString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateSessionIDFromUUIDString:");
}

id objc_msgSend_updateSpeechRecognitionHypothesisForSuggestion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateSpeechRecognitionHypothesisForSuggestion:");
}

id objc_msgSend_updateSuggestedUtterances_forLanguage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateSuggestedUtterances:forLanguage:");
}

id objc_msgSend_updateWithUpdateViewsCommand_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithUpdateViewsCommand:");
}

id objc_msgSend_updatedItemIndexPaths(void *a1, const char *a2, ...)
{
  return _[a1 updatedItemIndexPaths];
}

id objc_msgSend_updatedUserUtteranceForRefId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatedUserUtteranceForRefId:");
}

id objc_msgSend_updatedUserUtteranceForSiriViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatedUserUtteranceForSiriViewController:");
}

id objc_msgSend_uppercaseStringWithLocale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uppercaseStringWithLocale:");
}

id objc_msgSend_useDeviceSpeakerForTTS(void *a1, const char *a2, ...)
{
  return _[a1 useDeviceSpeakerForTTS];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceStyle];
}

id objc_msgSend_userSelectionResults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userSelectionResults:");
}

id objc_msgSend_userStringForError_reflectionDialogWasPlayed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userStringForError:reflectionDialogWasPlayed:");
}

id objc_msgSend_userTouchedSnippet(void *a1, const char *a2, ...)
{
  return _[a1 userTouchedSnippet];
}

id objc_msgSend_userTypedInSiri(void *a1, const char *a2, ...)
{
  return _[a1 userTypedInSiri];
}

id objc_msgSend_userUtterance(void *a1, const char *a2, ...)
{
  return _[a1 userUtterance];
}

id objc_msgSend_utteranceIndex(void *a1, const char *a2, ...)
{
  return _[a1 utteranceIndex];
}

id objc_msgSend_utteranceTextDidBecomeFirstResponder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "utteranceTextDidBecomeFirstResponder:");
}

id objc_msgSend_utteranceTextDidReceiveReturnKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "utteranceTextDidReceiveReturnKey:");
}

id objc_msgSend_utteranceTextDidResignFirstResponder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "utteranceTextDidResignFirstResponder:");
}

id objc_msgSend_utterances(void *a1, const char *a2, ...)
{
  return _[a1 utterances];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return _[a1 value];
}

id objc_msgSend_valueAnnotation(void *a1, const char *a2, ...)
{
  return _[a1 valueAnnotation];
}

id objc_msgSend_velocityInView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "velocityInView:");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _[a1 view];
}

id objc_msgSend_viewController(void *a1, const char *a2, ...)
{
  return _[a1 viewController];
}

id objc_msgSend_viewControllerForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewControllerForKey:");
}

id objc_msgSend_viewControllers(void *a1, const char *a2, ...)
{
  return _[a1 viewControllers];
}

id objc_msgSend_viewForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewForKey:");
}

id objc_msgSend_viewId(void *a1, const char *a2, ...)
{
  return _[a1 viewId];
}

id objc_msgSend_viewRegionForPresentedAceObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewRegionForPresentedAceObject:");
}

id objc_msgSend_views(void *a1, const char *a2, ...)
{
  return _[a1 views];
}

id objc_msgSend_visualResponse(void *a1, const char *a2, ...)
{
  return _[a1 visualResponse];
}

id objc_msgSend_voiceFeedbackSetting(void *a1, const char *a2, ...)
{
  return _[a1 voiceFeedbackSetting];
}

id objc_msgSend_voiceName(void *a1, const char *a2, ...)
{
  return _[a1 voiceName];
}

id objc_msgSend_voicemailPlayer(void *a1, const char *a2, ...)
{
  return _[a1 voicemailPlayer];
}

id objc_msgSend_wakeSystemForReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wakeSystemForReason:");
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return _[a1 whiteColor];
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 whitespaceAndNewlineCharacterSet];
}

id objc_msgSend_whitespaceCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 whitespaceCharacterSet];
}

id objc_msgSend_willBeginEditingFromUtterancePresenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willBeginEditingFromUtterancePresenter:");
}

id objc_msgSend_willBeginEditingFromUtteranceView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willBeginEditingFromUtteranceView:");
}

id objc_msgSend_willBeginEditingFromUtteranceViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willBeginEditingFromUtteranceViewController:");
}

id objc_msgSend_willDismissEditableUtterancePresenter_transitionCoordinator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willDismissEditableUtterancePresenter:transitionCoordinator:");
}

id objc_msgSend_willEnterForegroundHandler(void *a1, const char *a2, ...)
{
  return _[a1 willEnterForegroundHandler];
}

id objc_msgSend_willMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willMoveToParentViewController:");
}

id objc_msgSend_willResignActiveHandler(void *a1, const char *a2, ...)
{
  return _[a1 willResignActiveHandler];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return _[a1 window];
}

id objc_msgSend_windowScene(void *a1, const char *a2, ...)
{
  return _[a1 windowScene];
}

id objc_msgSend_words(void *a1, const char *a2, ...)
{
  return _[a1 words];
}

id objc_msgSend_wrapCommandInStartLocalRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wrapCommandInStartLocalRequest:");
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToURL:options:error:");
}

id objc_msgSend_zoomLevel(void *a1, const char *a2, ...)
{
  return _[a1 zoomLevel];
}