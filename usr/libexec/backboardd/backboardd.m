id *sub_100005584(id *a1)
{
  if (a1) {
    a1 = [a1[6] allValues];
  }
  return a1;
}
}

void sub_1000075A4(id a1)
{
  BKDisplayController *v1 = [[BKDisplayController alloc] init];
  v2 = (void *)qword_1000DBEE8;
  qword_1000DBEE8 = (uint64_t)v1;
}

id sub_1000075CC(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10000762C;
  v2[3] = &unk_1000B55B0;
  v2[4] = a1;
  return [BKSHIDEventHitTestLayerInformation build:v2];
}

void sub_10000762C(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(_OWORD **)(a1 + 32);
  __int128 v5 = v4[7];
  __int128 v24 = v4[6];
  __int128 v25 = v5;
  __int128 v6 = v4[9];
  __int128 v26 = v4[8];
  __int128 v27 = v6;
  __int128 v7 = v4[3];
  __int128 v20 = v4[2];
  __int128 v21 = v7;
  __int128 v8 = v4[5];
  __int128 v22 = v4[4];
  __int128 v23 = v8;
  [v3 setCumulativeLayerTransform:v20];
  v9 = *(_OWORD **)(a1 + 32);
  __int128 v10 = v9[15];
  __int128 v24 = v9[14];
  __int128 v25 = v10;
  __int128 v11 = v9[17];
  __int128 v26 = v9[16];
  __int128 v27 = v11;
  __int128 v12 = v9[11];
  __int128 v20 = v9[10];
  __int128 v21 = v12;
  __int128 v13 = v9[13];
  __int128 v22 = v9[12];
  __int128 v23 = v13;
  [v3 setCumulativeContentsTransform:&v20];
  LODWORD(v14) = *(_DWORD *)(*(void *)(a1 + 32) + 24LL);
  [v3 setCumulativeOpacity:v14];
  [v3 setHasInsecureFilter:*(unsigned __int8 *)(*(void *)(a1 + 32) + 289)];
  [v3 setDetectedOcclusion:*(unsigned __int8 *)(*(void *)(a1 + 32) + 288)];
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = *(void *)(v16 + 16);
  if ((v17 & 8) != 0)
  {
    LODWORD(v15) = *(_DWORD *)(v16 + 292);
    [v3 setBackgroundAverage:v15];
    LODWORD(v18) = *(_DWORD *)(*(void *)(a1 + 32) + 296LL);
    [v3 setBackgroundStandardDeviation:v18];
    LODWORD(v19) = *(_DWORD *)(*(void *)(a1 + 32) + 300LL);
    [v3 setBackgroundAverageContrastThreshold:v19];
    uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 16LL);
  }

  [v3 setValidMask:v17];
}

NSMutableDictionary *sub_100007730(uint64_t a1, int a2, int a3, void *a4, void *a5)
{
  id v9 = a4;
  id v10 = a5;
  objc_opt_self(a1);
  id v11 = [v9 hitTestInformationMask];
  id v12 = [v10 count];
  uint64_t v13 = (uint64_t)v12;
  if ((a2 & 1) != 0 || v11 || v12 || a3)
  {
    NSMutableDictionary *v15 = [[NSMutableDictionary alloc] init];
    double v14 = v15;
    if (v11)
    {
      if ((v11 & 2) != 0) {
        [v15 setObject:&__kCFBooleanTrue forKeyedSubscript:kCAWindowServerHitTestCumulativeOpacity];
      }
      if ((v11 & 0x31) != 0) {
        [v14 setObject:&__kCFBooleanTrue forKeyedSubscript:kCAWindowServerHitTestCumulativeTransform];
      }
      if ((v11 & 4) != 0) {
        [v14 setObject:&__kCFBooleanTrue forKey:kCAWindowServerHitTestIsInsecureFiltered];
      }
      if ((v11 & 8) != 0)
      {
        [v14 setObject:&__kCFBooleanTrue forKey:kCAWindowServerHitTestWantsLayerBackgroundStatistics];
        unint64_t v16 = (unint64_t)[v9 backgroundStatisticsRegion];
        unint64_t v17 = HIWORD(v16);
        double v18 = [NSNumber numberWithUnsignedShort:v16];
        [v14 setObject:v18 forKey:kCAWindowServerHitTestLayerBackgroundTopEdgeInset];

        double v19 = [NSNumber numberWithUnsignedShort:WORD1(v16)];
        [v14 setObject:v19 forKey:kCAWindowServerHitTestLayerBackgroundLeftEdgeInset];

        NSNumber *v20 = [NSNumber numberWithUnsignedShort:WORD2(v16)];
        [v14 setObject:v20 forKey:kCAWindowServerHitTestLayerBackgroundBottomEdgeInset];

        __int128 v21 = (void *)[NSNumber numberWithUnsignedShort:v17];
        [v14 setObject:v21 forKey:kCAWindowServerHitTestLayerBackgroundRightEdgeInset];

        [v9 backgroundStatisticsForeground];
        NSNumber *v22 = @(v17);
        [v14 setObject:v22 forKey:@"hitTestBackgroundForeground"];

        [v9 backgroundStatisticsPassingContrast];
        __int128 v23 = [NSNumber numberWithFloat:];
        [v14 setObject:v23 forKeyedSubscript:@"hitTestBackgroundPassingContrast"];

        [v9 backgroundStatisticsFailingContrast];
        __int128 v24 = [NSNumber numberWithFloat:];
        [v14 setObject:v24 forKeyedSubscript:@"hitTestBackgroundFailingContrast"];
      }
    }

    if (a3) {
      [v14 setObject:&__kCFBooleanTrue forKeyedSubscript:kCAWindowServerHitTestWantsContextSecurityAnalysis];
    }
    if (a2) {
      [v14 setObject:@YES forKey:kCAWindowServerHitTestIgnoreBlankingContext];
    }
    if (v13 >= 1) {
      [v14 setObject:v10 forKeyedSubscript:kCAWindowServerHitTestOptionExcludedContextIds];
    }
  }

  else
  {
    double v14 = 0LL;
  }

  return v14;
}

void sub_100007A38(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a1)
  {
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v6 = [*(id *)(a1 + 8) context];
    id v7 = [v6 countByEnumeratingWithState:v11 objects:v15 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        id v10 = 0LL;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) display:v5 didBecomeBlank:a3];
          id v10 = (char *)v10 + 1;
        }

        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:v11 objects:v15 count:16];
      }

      while (v8);
    }
  }
}

void sub_100007C10(uint64_t a1, void *a2, unsigned int a3, int64_t a4, CGFloat *a5, int64_t a6)
{
  if (a1)
  {
    BKHitTestResultPathLocation *v12 = [[BKHitTestResultPathLocation alloc] init];
    unint64_t v16 = v12;
    if (v12)
    {
      v12->_pathIndex = a4;
      __int128 v13 = *(_OWORD *)a5;
      __int128 v14 = *((_OWORD *)a5 + 1);
      __int128 v15 = *((_OWORD *)a5 + 2);
      v12->_pathLocation.preciseLocation.y = a5[6];
      v12->_pathLocation.hitTestLocation.y = v15;
      v12->_pathLocation.location.y = v14;
      v12->_pathLocation.locationsAreValid = v13;
      v12->_contextRelationship = a6;
    }

    sub_100007CB0(a1, a2, a3, (uint64_t)v12);
  }

void sub_100007CB0(uint64_t a1, void *a2, unsigned int a3, uint64_t a4)
{
  BKHitTestResultKey *v12 = [[BKHitTestResultKey alloc] init];
  if (v12)
  {
    [v12 setDestination:a2];
    if (a3) {
      v12->_userIdentifier = a3;
    }
  }

  uint64_t v9 = *(void **)(a1 + 24);
  if (!v9)
  {
    BSMutableOrderedDictionary *v10 = [[BSMutableOrderedDictionary alloc] init];
    __int128 v11 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = v10;

    uint64_t v9 = *(void **)(a1 + 24);
  }

  [v9 addObject:a4 toCollectionClass:[NSMutableArray class] forKey:v12];
}

void *sub_100007D60(void *result, uint64_t a2)
{
  if (result)
  {
    v2 = (void *)result[3];
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_100007DB8;
    v3[3] = &unk_1000B55F8;
    v3[4] = a2;
    return [v2 enumerateKeysAndObjectsWithIndexesUsingBlock:v3];
  }

  return result;
}

void sub_100007DB8(uint64_t a1, id *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2) {
    a2 = (id *)a2[2];
  }
  id v3 = a2;
  (*(void (**)(uint64_t))(v2 + 16))(v2);
}

LABEL_17:
      return 0LL;
    case 12:
      __int128 v21 = self->_localDefaults;
      double v19 = self->_cameraLog;
      if ((-[BKSLocalDefaults disableStudyLogALSLogging](v21, "disableStudyLogALSLogging") & 1) == 0)
      {
        v32 = _NSConcreteStackBlock;
        v33 = 3221225472LL;
        v34 = sub_100008EB0;
        v35 = &unk_1000B56D8;
        v36 = v6;
        __int128 v20 = @"com.apple.backboard.hid.als";
        goto LABEL_16;
      }

      goto LABEL_17;
    case 3:
      cameraLog = self->_cameraLog;
      uint64_t v9 = self->_localDefaults;
      id v10 = self->_keyboardLog;
      __int128 v11 = cameraLog;
      __int128 v12 = v9;
      if ((-[BKSLocalDefaults disableStudyLogButtonLogging](v12, "disableStudyLogButtonLogging") & 1) != 0)
      {
LABEL_36:
        unint64_t v17 = 0LL;
        goto LABEL_37;
      }

      IntegerValue = IOHIDEventGetIntegerValue(v6, 196608LL);
      __int128 v14 = IOHIDEventGetIntegerValue(v6, 196609LL);
      __int128 v15 = IOHIDEventGetIntegerValue(v6, 196610LL);
      unint64_t v16 = v15 != 0;
      if (IntegerValue == 144)
      {
        if ((-[BKSLocalDefaults disableStudyLogCameraKeyLogging](v12, "disableStudyLogCameraKeyLogging") & 1) != 0
          || v14 != 33LL)
        {
          goto LABEL_35;
        }

        [v11 setActive:1];
        __int128 v27 = _NSConcreteStackBlock;
        v28 = 3221225472LL;
        v29 = sub_1000088D0;
        v30 = &unk_1000B5678;
        LOWORD(v31) = v14;
        BYTE2(v31) = v16;
        __int128 v22 = @"com.apple.backboard.hid.camera";
        __int128 v23 = &v27;
        __int128 v24 = v11;
        goto LABEL_34;
      }

      if (IntegerValue != 12)
      {
        if (IntegerValue == 7)
        {
          if ((-[BKSLocalDefaults disableStudyLogBTKeyboardEventLogging]( v12,  "disableStudyLogBTKeyboardEventLogging") & 1) == 0)
          {
            __int128 v27 = _NSConcreteStackBlock;
            v28 = 3221225472LL;
            v29 = sub_100008540;
            v30 = &unk_1000B5678;
            LOWORD(v31) = v14;
            BYTE2(v31) = v16;
            [SLGLog logBlock:v27 domain:@"com.apple.backboard.hid.keyboard"];
          }

          if ((-[BKSLocalDefaults disableStudyLogBTKeyboardEventRedirection]( v12,  "disableStudyLogBTKeyboardEventRedirection") & 1) == 0)
          {
            unint64_t v17 = 1LL;
LABEL_37:

            return v17;
          }
        }

        goto LABEL_35;
      }

      switch(v14)
      {
        case 48:
          if ((-[BKSLocalDefaults disableStudyLogPowerButtonLogging]( v12,  "disableStudyLogPowerButtonLogging") & 1) == 0)
          {
            __int128 v27 = _NSConcreteStackBlock;
            v28 = 3221225472LL;
            v29 = sub_1000087F8;
            v30 = &unk_1000B63D0;
            LOBYTE(v31) = v16;
            __int128 v22 = @"com.apple.backboard.hid.power";
LABEL_32:
            __int128 v23 = &v27;
LABEL_33:
            __int128 v24 = v10;
LABEL_34:
            [v24 logBlock:v23 domain:v22 withContext:v27 withUserInfo:v28 withError:v29 withParameters:v30 withResult:v31];
          }

          break;
        case 233:
          if ((-[BKSLocalDefaults disableStudyLogVolumeKeyLogging]( v12,  "disableStudyLogVolumeKeyLogging") & 1) == 0)
          {
            __int128 v27 = _NSConcreteStackBlock;
            v28 = 3221225472LL;
            v29 = sub_100008720;
            v30 = &unk_1000B63D0;
            LOBYTE(v31) = v16;
            __int128 v22 = @"com.apple.backboard.hid.volume";
            goto LABEL_32;
          }

          break;
        case 234:
          __int128 v25 = v15;
          if ((-[BKSLocalDefaults disableStudyLogVolumeKeyLogging]( v12,  "disableStudyLogVolumeKeyLogging") & 1) != 0) {
            break;
          }
          __int128 v27 = _NSConcreteStackBlock;
          v28 = 3221225472LL;
          v29 = sub_100008648;
          v30 = &unk_1000B63D0;
          LOBYTE(v31) = v16;
          [v10 logBlock:v27 domain:@"com.apple.backboard.hid.volume"];
          if (!v25) {
            break;
          }
          __int128 v23 = (void ***)&stru_1000B56B8;
          __int128 v22 = @"com.apple.backboard.hid.volume";
          goto LABEL_33;
        default:
          break;
      }

  if (v58)
  {
    if (v62) {
      v33 = 2LL;
    }
    else {
      v33 = 3LL;
    }
    goto LABEL_47;
  }

  if (v62)
  {
    if (!v25) {
      goto LABEL_37;
    }
  }

  else
  {
    v34 = BKLogKeyboard(ModifierState);
    os_log_s *v35 = v34;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v69 = v20;
      _os_log_error_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_ERROR,  "missing a sequence for %{public}@",  buf,  0xCu);
    }

    v28 = v60;
    if (!v25) {
      goto LABEL_37;
    }
  }

  v36 = [v26 sequenceForKeyCommand:v25 sender:v61 processor:v22 dispatcher:v24 additionalContext:v31];
  if (v36)
  {
    v29 = (void *)v36;
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v37 = v22->_keyCommandsToAuthenticate;
    [v37 countByEnumeratingWithState:v63 objects:v67 count:16];
    if (v38)
    {
      v39 = v38;
      v50 = v20;
      v52 = v23;
      v59 = v29;
      v40 = v25;
      v41 = *(void *)v64;
      while (2)
      {
        for (i = 0LL; i != v39; i = (char *)i + 1)
        {
          if (*(void *)v64 != v41) {
            objc_enumerationMutation(v37);
          }
          v43 = *(void **)(*((void *)&v63 + 1) + 8LL * (void)i);
          v44 = [v43 keyCommand:v50];
          if ([v44 describes:v40] == (id)3)
          {
            if (v31) {
              v31->_authenticationSpecification = v43;
            }

            goto LABEL_41;
          }
        }

        [v37 countByEnumeratingWithState:v63 objects:v67 count:16];
        if (v39) {
          continue;
        }
        break;
      }

    goto LABEL_18;
  }

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    double v18 = 138543362;
    v19[0] = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Freezing overlay:%{public}@",  (uint8_t *)&v18,  0xCu);
  }

  [v4 freeze];
  uint64_t v9 = [BKDisplayRenderOverlayManager _updateWindowServerUpdatesForOverlays:self->_overlaysDisablingUpdates];
  [self _lock_setOverlaysDisablingUpdates:v9];

  if ([v4 disablesDisplayUpdates])
  {
    uint64_t v8 = (os_log_s *)[v4 display];
    id v10 = [os_log_s displayId];
    if ((-[NSMutableIndexSet containsIndex:]( self->_frozenDisplayIDs,  "containsIndex:",  v10) & 1) != 0)
    {
      __int128 v11 = sub_10003F368();
      os_log_s *v12 = [v11 autorelease];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        double v18 = 67109378;
        LODWORD(v19[0]) = (_DWORD)v10;
        WORD2(v19[0]) = 2114;
        *(void *)((char *)v19 + 6) = v4;
        _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Display %d previously frozen; ignoring freeze request for overlay:%{public}@",
          (uint8_t *)&v18,
          0x12u);
      }
    }

    else
    {
      frozenDisplayIDs = self->_frozenDisplayIDs;
      if (!frozenDisplayIDs)
      {
        NSMutableIndexSet *v14 = [[NSMutableIndexSet alloc] init];
        __int128 v15 = self->_frozenDisplayIDs;
        self->_frozenDisplayIDs = v14;

        frozenDisplayIDs = self->_frozenDisplayIDs;
      }

      [frozenDisplayIDs addIndex:v10];
      os_log_s *v12 = [self->_windowServer displayWithDisplayId:v10];
      if (v12)
      {
        unint64_t v16 = sub_10003F368();
        unint64_t v17 = [v16 autorelease];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          double v18 = 138543362;
          v19[0] = v12;
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Freezing display: %{public}@",  (uint8_t *)&v18,  0xCu);
        }

        [os_log_s freeze];
      }
    }

    goto LABEL_17;
  }

LABEL_35:
      v32 = _NSConcreteStackBlock;
      v33 = 3221225472LL;
      v34 = sub_100008AB8;
      v35 = &unk_1000B56D8;
      v36 = v6;
      [SLGLog logBlock:v32 domain:@"com.apple.backboard.hid.keyboard"];
      goto LABEL_36;
  }

  return 0LL;
}

id sub_100008540(uint64_t a1)
{
  uint64_t v9 = @"keyboardHIDEvent";
  uint64_t v2 = [NSString stringWithFormat:@"0x%02x", *(unsigned __int16 *)(a1 + 32), @"usage"];
  v7[1] = @"down";
  v8[0] = v2;
  id v3 = [NSNumber numberWithInt:*(unsigned __int8 *)(a1 + 34)];
  v8[1] = v3;
  v4 = [NSDictionary dictionaryWithObjects:forKeys:count:v8, v7, 2LL];
  id v10 = v4;
  id v5 = [NSDictionary dictionaryWithObjects:forKeys:count:v10, v9, 1LL];

  return v5;
}

id sub_100008648(uint64_t a1)
{
  id v7 = @"volumeDownButtonEvent";
  id v5 = @"down";
  v1 = [NSNumber numberWithInt:*(unsigned __int8 *)(a1 + 32)];
  __int128 v6 = v1;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  uint64_t v8 = v2;
  BOOL v3 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:1];

  return v3;
}

id sub_100008720(uint64_t a1)
{
  id v7 = @"volumeUpButtonEvent";
  id v5 = @"down";
  v1 = [NSNumber numberWithInt:*(unsigned __int8 *)(a1 + 32)];
  __int128 v6 = v1;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  uint64_t v8 = v2;
  BOOL v3 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:1];

  return v3;
}

id sub_1000087F8(uint64_t a1)
{
  id v7 = @"PowerButtonEvent";
  id v5 = @"down";
  v1 = [NSNumber numberWithInt:*(unsigned __int8 *)(a1 + 32)];
  __int128 v6 = v1;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
  uint64_t v8 = v2;
  BOOL v3 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:1];

  return v3;
}

id sub_1000088D0(uint64_t a1)
{
  float v2 = *(float *)&dword_1000DBF94;
  os_unfair_lock_unlock(&stru_1000DBF90);
  BOOL v3 = v2 == 0.0;
  BKDisplayBrightnessController *v4 = [BKDisplayBrightnessController sharedInstance];
  [v4 brightnessLevel];
  int v6 = v5;

  __int128 v20 = @"cameraShutterButtonEvent";
  v18[0] = @"event";
  id v7 = [NSString stringWithFormat:@"0x%02x" usage:*(unsigned __int16 *)(a1 + 32)];
  v16[1] = @"down";
  v17[0] = v7;
  uint64_t v8 = [NSNumber numberWithInt:*(unsigned __int8 *)(a1 + 34)];
  v17[1] = v8;
  uint64_t v9 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
  v19[0] = v9;
  v18[1] = @"displayBrightness";
  LODWORD(v10) = v6;
  __int128 v11 = (void *)[NSNumber numberWithFloat:v10];
  v19[1] = v11;
  v18[2] = @"backlight";
  NSNumber *v12 = [NSNumber numberWithBool:v3];
  v19[2] = v12;
  __int128 v13 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:3];
  __int128 v21 = v13;
  __int128 v14 = [NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];

  return v14;
}

id sub_100008AB8(uint64_t a1)
{
  unsigned __int16 IntegerValue = IOHIDEventGetIntegerValue(*(void *)(a1 + 32), 196608LL);
  unsigned __int16 v3 = IOHIDEventGetIntegerValue(*(void *)(a1 + 32), 196609LL);
  BOOL v4 = IOHIDEventGetIntegerValue(*(void *)(a1 + 32), 196610LL) != 0;
  NSMutableDictionary *v5 = [NSMutableDictionary dictionary];
  NSString *v6 = [NSString stringWithFormat:@"0x%02x", IntegerValue];
  [v5 setObject:v6 forKeyedSubscript:@"usagePage"];

  id v7 = [NSString stringWithFormat:@"0x%02x" v3];
  [v5 setObject:v7 forKeyedSubscript:@"usage"];

  uint64_t v8 = (void *)[NSNumber numberWithInt:v4];
  [v5 setObject:v8 forKeyedSubscript:@"down"];

  uint64_t v9 = [NSNumber numberWithInt:IOHIDEventGetIntegerValue(*(void *)(a1 + 32), 196612LL)];
  double v10 = [v9 doubleValue];
  [v5 setObject:v10 forKeyedSubscript:@"count"];

  NSNumber *v11 = [NSNumber numberWithInt:IOHIDEventGetIntegerValue(*(void *)(a1 + 32), 196613LL)];
  __int128 v12 = [v11 autorelease];
  [v5 setObject:v12 forKeyedSubscript:@"longPress"];

  uint64_t Phase = IOHIDEventGetPhase(*(void *)(a1 + 32));
  if ((_DWORD)Phase)
  {
    __int128 v14 = (void *)[NSNumber numberWithUnsignedShort:Phase];
    [v5 setObject:v14 forKeyedSubscript:@"phase"];
  }

  unint64_t v17 = @"buttonEvent";
  double v18 = v5;
  __int128 v15 = [NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];

  return v15;
}

id sub_100008CFC(uint64_t a1)
{
  double FloatValue = IOHIDEventGetFloatValue(*(void *)(a1 + 32), 1310720LL);
  double v3 = IOHIDEventGetFloatValue(*(void *)(a1 + 32), 1310721LL);
  double v4 = IOHIDEventGetFloatValue(*(void *)(a1 + 32), 1310720LL);
  uint64_t IntegerValue = IOHIDEventGetIntegerValue(*(void *)(a1 + 32), 1310723LL);
  __int128 v15 = @"gyro";
  v13[0] = @"x";
  NSNumber *v6 = [NSNumber numberWithDouble:FloatValue];
  v14[0] = v6;
  v13[1] = @"y";
  id v7 = [NSNumber numberWithDouble:v3];
  v14[1] = v7;
  v13[2] = @"z";
  uint64_t v8 = (void *)[NSNumber numberWithDouble:v4];
  v14[2] = v8;
  v13[3] = @"type";
  uint64_t v9 = (void *)[NSNumber numberWithUnsignedInt:IntegerValue];
  v14[3] = v9;
  double v10 = [NSDictionary dictionaryWithObjects:forKeys:count:v14, v13, 4LL];
  unint64_t v16 = v10;
  __int128 v11 = [NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];

  return v11;
}

id sub_100008EB0(uint64_t a1)
{
  double FloatValue = IOHIDEventGetFloatValue(*(void *)(a1 + 32), 786432LL);
  uint64_t v8 = @"ambientLightSensor";
  int v6 = @"level";
  float v2 = [NSNumber numberWithDouble:FloatValue];
  id v7 = v2;
  double v3 = [NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  uint64_t v9 = v3;
  double v4 = [NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];

  return v4;
}

id sub_100008F8C(id a1)
{
  return @"Volume down pressed; possible user problem";
}

void sub_100008F98(id a1, SLGActivatableLogging *a2)
{
}

void sub_100008FA4(id a1, SLGActivatableLogging *a2)
{
}

void sub_1000090F0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 unsignedLongLongValue];
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = (void *)[NSString stringWithFormat:@"0x%llX" v6];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000091C8;
  v10[3] = &unk_1000B8030;
  id v11 = v5;
  id v12 = *(id *)(a1 + 32);
  id v9 = v5;
  [v7 appendBodySectionWithName:v8 multilinePrefix:0 block:v10];
}

void sub_1000091C8(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100009230;
  v2[3] = &unk_1000B5700;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 enumerateKeysAndObjectsUsingBlock:v2];
}

void sub_100009230(uint64_t a1, void *a2, void *a3)
{
  id v9 = a3;
  unsigned int v5 = [a2 unsignedIntValue];
  id v6 = *(void **)(a1 + 32);
  id v7 = [NSString stringWithFormat:@"page:0x%X usage:0x%X", HIWORD(v5), (unsigned __int16)v5];
  id v8 = [v6 appendObject:v9 withName:v7];
}

void sub_1000092B8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v9 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v9)
  {
    [v9 removeObjectForKey:v8];
    if (![v9 count]) {
      [*(id *)(a1 + 8) removeObjectForKey:v7];
    }
  }
}

LABEL_11:
  return v15;
}

  result = [*(id *)(a1 + 32) _queue_annotateTouch:*(unsigned int *)(a1 + 64) withUniqueString:@"swipe-pending"];
  id v3 = *(_DWORD *)(a1 + 68);
  if ((v3 & 0x1000000) == 0)
  {
LABEL_5:
    if ((v3 & 0x4000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
}

LABEL_12:
    LOBYTE(v16) = 0;
    return v16;
  }

  MatchingServices = IOServiceGetMatchingServices(kIOMainPortDefault, v7, &existing);
  if ((_DWORD)MatchingServices)
  {
    id v9 = MatchingServices;
    double v10 = BKLogCommon(MatchingServices);
    os_log_s *v11 = [v10 autorelease];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      __int128 v24 = v9;
      id v12 = "IOServiceGetMatchingServices failed: 0x%x\n";
      __int128 v13 = v11;
      __int128 v14 = 8;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
      goto LABEL_11;
    }

    goto LABEL_11;
  }

  while (1)
  {
    unint64_t v16 = IOIteratorNext(existing);
    if (!v16) {
      break;
    }
    unint64_t v17 = v16;
    if (!IORegistryEntryGetParentEntry(v16, "IOService", (io_registry_entry_t *)buf))
    {
      if (IOObjectConformsTo(*(io_object_t *)buf, "AppleUSBEthernetDevice")
        && (double v18 = IORegistryEntrySearchCFProperty(v17, "IOService", @"BSD Name", kCFAllocatorDefault, 0)) != 0LL)
      {
        double v19 = v18;
        BOOL v20 = [self _serviceExists:v18];
        CFRelease(v19);
        IOObjectRelease(v17);
        unint64_t v17 = *(_DWORD *)buf;
        if (v20)
        {
          IOObjectRelease(*(io_object_t *)buf);
          LOBYTE(v16) = 1;
          return v16;
        }
      }

      else
      {
        IOObjectRelease(v17);
        unint64_t v17 = *(_DWORD *)buf;
      }
    }

    IOObjectRelease(v17);
  }

  return v16;
}

    __int128 v15 = 0;
    goto LABEL_12;
  }

  unint64_t v17 = [NSXPCInterface interfaceWithProtocol:[BKSAlternateSystemAppClientProtocol class]];
  [v8 setRemoteObjectInterface:v17];

  double v18 = [NSXPCInterface interfaceWithProtocol:[BKSAlternateSystemAppServerProtocol class]];
  [v8 setExportedInterface:v18];

  [v8 setExportedObject:self];
  objc_initWeak((id *)buf, self);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_100062CA8;
  v24[3] = &unk_1000B7B58;
  [v25 copy];
  [v8 setInterruptionHandler:v24];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100062CD4;
  v22[3] = &unk_1000B7B58;
  [v23 copy];
  [v8 setInvalidationHandler:v22];
  [v8 resume];
  double v19 = [BKAlternateSystemAppServer setClientConnection:v8];
  os_log_s *v20 = v19;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 v21 = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "[Server] Accepted connection request", v21, 2u);
  }

  [v23 release];
  [v25 release];
  objc_destroyWeak((id *)buf);
  __int128 v15 = 1;
LABEL_12:

  return v15;
}

    double v10 = 0;
  }

  os_unfair_lock_unlock(p_lock);
  return v7;
}

    goto LABEL_12;
  }

  if (self->_overlay)
  {
    NSString *v15 = [NSString stringWithFormat:@"overlay should have been removed"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      unint64_t v16 = NSStringFromSelector(a2);
      unint64_t v17 = [v16 autorelease];
      double v19 = [self class];
      __int128 v20 = NSStringFromClass(v19);
      __int128 v21 = (void *)[v20 autorelease];
      *(_DWORD *)buf = 138544642;
      *(void *)__int128 v26 = v17;
      *(_WORD *)&v26[8] = 2114;
      *(void *)&v26[10] = v21;
      __int128 v27 = 2048;
      v28 = self;
      v29 = 2114;
      v30 = @"BKBootUIPresenter.m";
      v31 = 1024;
      v32 = 373;
      v33 = 2114;
      v34 = v15;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
    }

    _bs_set_crash_log_message([v15 UTF8String]);
    __break(0);
    JUMPOUT(0x10006FB84LL);
  }

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_10006FE38;
  v22[3] = &unk_1000B8168;
  v22[4] = self;
  __int128 v23 = v5;
  __int128 v24 = v8;
  [self _queue_acquireActivityAssertionForReason:v23 generation:v8 continuation:v22];

LABEL_12:
}

  unsigned int v5 = [NSNumber numberWithBool:v2];
  return v5;
}

  *(NDR_record_t *)(a2 + 24) = v6;
}

void sub_100009E1C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) delegate];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void sub_100009E60(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  id v4 = [NSString stringWithFormat:@"0x%x" a2];
  id v3 = [v2 appendObject:v4 withName:@"port"];
}

id sub_100009EC4(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_queue_invalidate");
}

uint64_t sub_100009ECC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100009EDC(uint64_t a1)
{
}

void sub_100009EE4(uint64_t a1)
{
}

void sub_100009EF8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  unsigned int v5 = *(void **)(v2 + 16);
  id v4 = (id *)(v2 + 16);
  if (v5 != v3) {
    objc_storeStrong(v4, v3);
  }
}

void sub_100009F18(void *a1)
{
  uint64_t v2 = *(void *)(a1[4] + 8LL);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0LL;

  uint64_t v4 = *(void *)(a1[5] + 8LL);
  unsigned int v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0LL;

  uint64_t v6 = *(void *)(a1[6] + 8LL);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0LL;
}

void sub_100009F6C(uint64_t a1)
{
  uint64_t v2 = BKLogDetailed();
  id v3 = (os_log_s *)v2;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v9 = v5;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "BKHIDEventClient died (pid): %{public}@",  buf,  0xCu);
  }

  uint64_t v4 = *(void **)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000A158;
  v6[3] = &unk_1000B5750;
  id v7 = v4;
  [v7 _queue_performDelegateCallout:v6];
}

void sub_10000A05C(uint64_t a1)
{
  uint64_t v2 = BKLogDetailed();
  id v3 = (os_log_s *)v2;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v9 = v5;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "BKHIDEventClient died (port): %{public}@",  buf,  0xCu);
  }

  uint64_t v4 = *(void **)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10000A14C;
  v6[3] = &unk_1000B5750;
  id v7 = v4;
  [v7 _queue_performDelegateCallout:v6];
}

id sub_10000A14C(uint64_t a1, void *a2)
{
  return _[a2 clientDied:*(void *)(a1 + 32)];
}

id sub_10000A158(uint64_t a1, void *a2)
{
  return _[a2 clientDied:*(void *)(a1 + 32)];
}

LABEL_14:
    __int128 v22 = BKLogSystemShell();
    os_log_s *v23 = [v22 autorelease];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      NSString *v24 = [NSString stringWithFormat:@"<unknown:%lX>", v14];
      *(_DWORD *)buf = 138543362;
      v33 = v24;
      _os_log_error_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "we don't handle this watchdogType:%{public}@",  buf,  0xCu);
    }

    goto LABEL_17;
  }

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_10000B324;
  v25[3] = &unk_1000B57C8;
  __int128 v26 = v11;
  __int128 v27 = v10;
  v28 = v9;
  v30 = v13;
  v31 = v14;
  __int128 v15 = v6;
  v29 = v15;
  unint64_t v16 = [BKSystemShellDescriptor build:v25];
  [self->_systemShellSentinel systemShellDidConnect:v16 connection:v15];
  [v15 activate];

LABEL_18:
}

  result = [*(id *)(a1 + 32) _queue_annotateTouch:*(unsigned int *)(a1 + 64) withUniqueString:@"swipe down"];
  if ((*(_DWORD *)(a1 + 68) & 0x8000000) != 0) {
    return [*(id *)(a1 + 32) _queue_annotateTouch:*(unsigned int *)(a1 + 64) withUniqueString:@"swipe right"];
  }
  return result;
}

        return 0;
      }

      __int128 v14 = IOIteratorNext(existing);
      if (v14)
      {
        __int128 v15 = v14;
        unint64_t v16 = IOServiceOpen(v14, mach_task_self_, 0, p_demoCardConnection);
        unint64_t v17 = IOObjectRelease(v15);
        if (!v16) {
          return *p_demoCardConnection;
        }
        double v18 = BKLogCommon(v17);
        uint64_t v6 = [os_log_s class];
        if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_14;
        }
        *(_DWORD *)buf = 136315394;
        __int128 v23 = [BKTetherController _demoCardConnection];
        __int128 v24 = 2082;
        __int128 v25 = "AppleTetheredDevice";
        id v7 = "%s IOServiceOpen failed for class '%{public}s'";
      }

      else
      {
        double v19 = ((uint64_t (*)(void))BKLogCommon)();
        uint64_t v6 = [v19 autorelease];
        if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_14;
        }
        *(_DWORD *)buf = 136315394;
        __int128 v23 = [BKTetherController _demoCardConnection];
        __int128 v24 = 2082;
        __int128 v25 = "AppleTetheredDevice";
        id v7 = "%s No %{public}s instance found";
      }
    }

    else
    {
      __int128 v13 = ((uint64_t (*)(void))BKLogCommon)();
      uint64_t v6 = v13;
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_14;
      }
      *(_DWORD *)buf = 136315394;
      __int128 v23 = [BKTetherController _demoCardConnection];
      __int128 v24 = 2082;
      __int128 v25 = "AppleTetheredDevice";
      id v7 = "%s IOServiceMatching failed for %{public}s";
    }

    id v8 = v6;
    uint64_t v9 = 22;
    goto LABEL_13;
  }

  return result;
}

void sub_10000AC84(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)[*(id *)(a1 + 32) remoteProcess];
  unsigned int v5 = [v4 pid];
  uint64_t v6 = [BSObjCProtocol protocolForProtocol:&BKSSystemShellClientInterface];
  id v7 = [BSObjCProtocol protocolForProtocol:[BKSSystemShellServerInterface class]];
  id v8 = [BSMutableServiceInterface interfaceWithIdentifier:BKSSystemShellShellServiceName];
  [v8 setServer:v7];
  [v8 setClient:v6];
  uint64_t v9 = [BSServiceQuality userInitiated];
  [v3 setServiceQuality:v9];

  [v3 setInterface:v8];
  [v3 setInterfaceTarget:*(void *)(*(void *)(a1 + 40) + 24)];
  [v3 setTargetQueue:*(void *)(*(void *)(a1 + 40) + 32)];
  location = *(id *)(a1 + 40);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10000AE94;
  v13[3] = &unk_1000B5838;
  [location retain];
  unsigned int v15 = v5;
  [v3 setInterruptionHandler:v13];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10000AF64;
  v10[3] = &unk_1000B5838;
  [v11 copy];
  unsigned int v12 = v5;
  [v3 setInvalidationHandler:v10];
  v11 = nil;
  v14 = nil;
  [location release];
}

void sub_10000AE68( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, id location)
{
}

void sub_10000AE94(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v3 = BKLogSystemShell();
    uint64_t v4 = v3;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = *(_DWORD *)(a1 + 40);
      v6[0] = 67109120;
      v6[1] = v5;
      _os_log_error_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "[Shell] interrupted connection pid:%d",  (uint8_t *)v6,  8u);
    }

    [WeakRetained[3] systemShellDidTerminate:*(unsigned int *)(a1 + 40)];
  }
}

void sub_10000AF64(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v3 = BKLogSystemShell();
    uint64_t v4 = [v3];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = *(_DWORD *)(a1 + 40);
      v6[0] = 67109120;
      v6[1] = v5;
      _os_log_error_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "[Shell] invalidated connection pid:%d",  (uint8_t *)v6,  8u);
    }

    [WeakRetained[3] systemShellDidTerminate:*(unsigned int *)(a1 + 40)];
  }
}

void sub_10000B034(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  int v5 = [v3 remoteProcess];
  unsigned int v6 = [v5 pid];
  id v7 = [BSObjCProtocol protocolForProtocol:&BKSSystemShellDataMigrationCheckInClientInterface];
  id v8 = [BSObjCProtocol protocolForProtocol:[BKSSystemShellDataMigrationCheckInServerInterface class]];
  uint64_t v9 = [BSMutableServiceInterface interfaceWithIdentifier:BKSSystemShellDataMigrationCheckInServiceName];
  [v9 setServer:v8];
  [v9 setClient:v7];
  double v10 = [BSServiceQuality userInitiated];
  [v4 setServiceQuality:v10];

  [v4 setInterface:v9];
  [v4 setInterfaceTarget:*(void *)(*(void *)(a1 + 40) + 24)];
  id v11 = [BKSystemShellSentinel dataMigrationQueue];
  [v4 setTargetQueue:v11];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10000B1DC;
  v14[3] = &unk_1000B57E8;
  unsigned int v15 = v6;
  [v4 setInterruptionHandler:v14];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10000B280;
  v12[3] = &unk_1000B57E8;
  unsigned int v13 = v6;
  [v4 setInvalidationHandler:v12];
}

void sub_10000B1DC(uint64_t a1)
{
  uint64_t v2 = BKLogSystemShell();
  os_log_s *v3 = v2;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = *(_DWORD *)(a1 + 32);
    v5[0] = 67109120;
    v5[1] = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "[DataMigrationCheckIn] connection terminated pid:%d",  (uint8_t *)v5,  8u);
  }
}

void sub_10000B280(uint64_t a1)
{
  uint64_t v2 = BKLogSystemShell();
  uint64_t v3 = v2;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = *(_DWORD *)(a1 + 32);
    v5[0] = 67109120;
    v5[1] = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "[DataMigrationCheckIn] connection invalidated pid:%d",  (uint8_t *)v5,  8u);
  }
}

void sub_10000B324(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setBundleIdentifier:v3];
  [v4 setBundlePath:*(void *)(a1 + 40)];
  [v4 setJobLabel:*(void *)(a1 + 48)];
  [v4 setSystemIdleSleepInterval:*(double *)(a1 + 64)];
  [v4 setWatchdogType:*(void *)(a1 + 72)];
  id v5 = [*(id *)(a1 + 56) remoteProcess];
  [v4 setPid:[v5 pid]];
}

void sub_10000B3BC(uint64_t a1, void *a2)
{
  uint64_t v3 = BKSSystemShellServiceDomainName;
  id v4 = a2;
  [v4 setDomain:v3];
  [v4 setService:BKSSystemShellShellServiceName];
  [v4 setDelegate:*(void *)(a1 + 32)];
}

void sub_10000B420(uint64_t a1, void *a2)
{
  uint64_t v3 = BKSSystemShellServiceDomainName;
  id v4 = a2;
  [v4 setDomain:v3];
  [v4 setService:BKSSystemShellDataMigrationCheckInServiceName];
  [v4 setDelegate:*(void *)(a1 + 32)];
}

uint64_t _linkguard_warnlisted_image_handler(const char *a1, const char *a2)
{
  id v4 = getenv("BACKBOARDD_ALLOW_RISKY_UIKIT_LINKING");
  if (!v4 || (uint64_t result = atoi(v4), (int)result < 1))
  {
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    *(_OWORD *)__str = 0u;
    __int128 v11 = 0u;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      id v7 = a1;
      __int16 v8 = 2082;
      uint64_t v9 = a2;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "you may not link <%{public}s> into backboardd (source:%{public}s)",  buf,  0x16u);
    }

    snprintf(__str, 0x100uLL, "you may not link <%s> into backboardd (source:%s)", a1, a2);
    abort_with_reason(23LL, 2857740885LL, __str, 2LL);
  }

  return result;
}

void sub_10000B5A8(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7 = a2;
  __int16 v8 = a4;
  if (a1)
  {
    double v9 = ((double (*)(void))BSContinuousMachTimeNow)();
    uint64_t v10 = BKLogCommon();
    os_log_s *v11 = [v10 autorelease];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138543362;
      id v18 = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "start %{public}@...", (uint8_t *)&v17, 0xCu);
    }

    if (a3)
    {
      kdebug_trace(a3 | 1u, 0LL, 0LL, 0LL, 0LL);
      v8[2];
      uint64_t v12 = kdebug_trace(a3 | 2u, 0LL, 0LL, 0LL, 0LL);
    }

    else
    {
      uint64_t v12 = ((uint64_t (*)(void))v8[2])(v8);
    }

    double v13 = BSContinuousMachTimeNow(v12);
    double v14 = *(double *)(a1 + 8);
    uint64_t v15 = BKLogCommon();
    os_log_s *v16 = [v15 autorelease];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138543874;
      id v18 = v7;
      __int16 v19 = 2048;
      double v20 = v13 - v9;
      __int16 v21 = 2048;
      double v22 = v13 - v14;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "      %{public}@ ready in %gs. overall %gs",  (uint8_t *)&v17,  0x20u);
    }
  }
}

void sub_10000B75C(uint64_t a1)
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(33LL, 0LL);
  uint64_t v3 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000B7E4;
  block[3] = &unk_1000B8058;
  id v5 = *(id *)(a1 + 32);
  dispatch_async(v3, block);
}

void sub_10000B7E4(uint64_t a1)
{
  id v2 = [[RBSTerminateRequest alloc] initForAllManagedWithReason:*(void *)(a1 + 32)];
  id v9 = 0LL;
  unsigned __int8 v3 = [v2 execute:v9];
  id v4 = v9;
  id v5 = v4;
  if ((v3 & 1) == 0)
  {
    uint64_t v6 = BKLogCommon(v4);
    id v7 = v6;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v11 = v8;
      __int16 v12 = 2114;
      double v13 = v5;
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "failed to clear the board for %{public}@ : %{public}@",  buf,  0x16u);
    }
  }
}

id sub_10000B8E0(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) isRequired];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = (_BYTE)result;
  return result;
}

void sub_10000B910(uint64_t a1)
{
  dispatch_block_t v2 = dispatch_block_create((dispatch_block_flags_t)0LL, &stru_1000B5858);
  unsigned __int8 v3 = *(void **)(a1 + 32);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  _DWORD v5[2] = sub_10000B9B8;
  v5[3] = &unk_1000B58C0;
  id v6 = v3;
  id v7 = v2;
  id v4 = v2;
  [v6 launchPreboardWithCompletion:v5];
  dispatch_block_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
}

void sub_10000B9B8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = BKLogCommon(v3);
    os_log_s *v6 = [v5 autorelease];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138543362;
      uint64_t v8 = v4;
      _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "LA PreBoard launch failed: %{public}@",  (uint8_t *)&v7,  0xCu);
    }

    [*(id *)(a1 + 32) terminateWithCompletion:&stru_1000B5898];
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_10000BA90(id a1, NSError *a2)
{
  dispatch_block_t v2 = a2;
  uint64_t v3 = BKLogCommon();
  os_log_s *v4 = v3;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543362;
    id v6 = v2;
    _os_log_error_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "LA PreBoard termination failed: %{public}@",  (uint8_t *)&v5,  0xCu);
  }
}

void sub_10000BB40(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  if (objc_opt_class(&OBJC_CLASS___LAPreboard, v3))
  {
    uint64_t v17 = 0LL;
    id v18 = &v17;
    uint64_t v19 = 0x2020000000LL;
    char v20 = 0;
    *(void *)buf = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472LL;
    double v13 = sub_10000B8E0;
    double v14 = &unk_1000B8080;
    __int128 v16 = &v17;
    id v4 = [LAPreboard sharedInstance];
    id v15 = v4;
    if (v2) {
      sub_10000B5A8((uint64_t)v2, @"Check for Local Authentication", 0, buf);
    }
    if (*((_BYTE *)v18 + 24))
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472LL;
      v9[2] = sub_10000B910;
      v9[3] = &unk_1000B8058;
      id v5 = v4;
      id v10 = v5;
      if (v2)
      {
        sub_10000B5A8((uint64_t)v2, @"LA PreBoard launch", 0, v9);
        id v5 = v10;
      }
    }

    _Block_object_dispose(&v17, 8);
  }

  else
  {
    uint64_t v6 = BKLogCommon(0LL);
    int v7 = (os_log_s *)v6;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "LA PreBoard not available", buf, 2u);
    }
  }

  sub_10000B5A8(*(void *)(a1 + 32), @"Data Migration", 730464504, &stru_1000B58E0);
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    sub_10000B5A8(v8, @"Bootstrap system shells", 0, &stru_1000B5900);
  }
}

void sub_10000BD18(_Unwind_Exception *a1)
{
}

void sub_10000BD30(id a1)
{
  BKSystemShellSentinel *v1 = [BKSystemShellSentinel sharedInstance];
  [v1 dataMigratorDidComplete];
}

void sub_10000BD64(id a1)
{
  BKMigrator *v1 = [[BKMigrator alloc] init];
  [v1 migrateIfNecessary];
}

uint64_t start(uint64_t a1, CFIndex *a2)
{
  uint64_t v2 = _set_user_dir_suffix("com.apple.backboardd");
  uint64_t v3 = pthread_set_fixedpriority_self(v2);
  int v4 = v3;
  if ((_DWORD)v3)
  {
    uint64_t v5 = BKLogCommon(v3);
    os_log_s *v6 = v5;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v51 = *__error();
      LODWORD(v63.version) = 67109120;
      HIDWORD(v63.version) = v51;
      _os_log_error_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "pthread_set_fixedpriority_self failed: %{darwin.errno}d",  (uint8_t *)&v63,  8u);
    }
  }

  int v7 = pthread_self();
  uint64_t qos_class_np = pthread_get_qos_class_np(v7, &__qos_class, &__relative_priority);
  if ((_DWORD)qos_class_np
    || (uint64_t qos_class_np = pthread_set_qos_class_self_np(QOS_CLASS_USER_INTERACTIVE, 0), (_DWORD)qos_class_np))
  {
    uint64_t v9 = BKLogCommon(qos_class_np);
    os_log_s *v10 = v9;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v50 = *__error();
      LODWORD(v63.version) = 67109120;
      HIDWORD(v63.version) = v50;
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "pthread_set_qos failed: %{darwin.errno}d",  (uint8_t *)&v63,  8u);
    }

    int v11 = 0;
  }

  else
  {
    int v11 = 1;
  }

  uint64_t v12 = setiopolicy_np(9, 0, 1);
  if ((v12 & 0x80000000) != 0)
  {
    uint64_t v13 = BKLogCommon(v12);
    double v14 = [v13 autorelease];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v52 = *__error();
      LODWORD(v63.version) = 67109120;
      HIDWORD(v63.version) = v52;
      _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "setiopolicy_np failed: %{darwin.errno}d",  (uint8_t *)&v63,  8u);
    }
  }

  id v15 = objc_autoreleasePoolPush();
  BKIgnition *v16 = [[BKIgnition alloc] init];
  id v17 = [NSString stringWithUTF8String:a2];
  if (v16)
  {
    v63.version = (CFIndex)v16;
    v63.info = [BKIgnition class];
    CFRunLoopObserverContext *v18 = [[CFRunLoopObserverContext alloc] init];
    __int128 v16 = (BKIgnition *)v18;
    if (v18)
    {
      uint64_t v19 = BKLogCommon(v18);
      char v20 = [v19 autorelease];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v17;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "starting %{public}@...", buf, 0xCu);
      }

      v16->_startTime = BSContinuousMachTimeNow(v21);
    }
  }

  double v22 = v16;
  __int128 v23 = (void *)[BKFirstBootDetector sharedInstance];
  unsigned __int8 v24 = [v23 isFirstBoot];

  if ((v24 & 1) == 0)
  {
    __int128 v25 = [NSString stringWithFormat:@"%s respawn" a2];
    NSString *v26 = [NSString stringWithFormat:@"clearing the board for %@", v25];
    v63.version = (CFIndex)_NSConcreteStackBlock;
    v63.info = (void *)3221225472LL;
    v63.retain = (const void *(__cdecl *)(const void *))sub_10000B75C;
    v63.release = (void (__cdecl *)(const void *))&unk_1000B8058;
    __int128 v27 = v25;
    v63.copyDescription = v27;
    copyDescription = v27;
    if (v22)
    {
      sub_10000B5A8((uint64_t)v22, v26, 0, &v63);
      copyDescription = v63.copyDescription;
    }
  }

  v63.version = 0LL;
  v63.info = &v63;
  v63.retain = (const void *(__cdecl *)(const void *))0x3032000000LL;
  v63.release = (void (__cdecl *)(const void *))sub_10000C6EC;
  v63.copyDescription = (CFStringRef (__cdecl *)(const void *))sub_10000C6FC;
  id v64 = 0LL;
  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472LL;
  v58[2] = sub_10000C704;
  v58[3] = &unk_1000B8080;
  v29 = v22;
  v59 = v29;
  v60 = &v63;
  sub_10000B5A8((uint64_t)v29, @"HID system", 730464468, v58);
  if (v29) {
    sub_10000B5A8((uint64_t)v29, @"AttentionAwareness", 0, &stru_1000B5920);
  }
  sub_10000B5A8((uint64_t)v29, @"GS", 730464472, &stru_1000B5940);
  BKSecurityManager *v30 = [BKSecurityManager sharedInstance];
  sub_10000B5A8((uint64_t)v29, @"window server", 730464476, &stru_1000B5960);
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472LL;
  v57[2] = sub_10000C7BC;
  v57[3] = &unk_1000B70D0;
  v57[4] = &v63;
  sub_10000B5A8((uint64_t)v29, @"HID connection manager", 730464480, v57);
  sub_10000B5A8((uint64_t)v29, @"backlight", 730464484, &stru_1000B5980);
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472LL;
  v56[2] = sub_10000C7CC;
  v56[3] = &unk_1000B70D0;
  v56[4] = &v63;
  sub_10000B5A8((uint64_t)v29, @"HID event processing", 730464492, v56);
  sub_10000B5A8((uint64_t)v29, @"ALS sync", 730464496, &stru_1000B59A0);
  sub_10000B5A8((uint64_t)v29, @"display MiG server", 730464500, &stru_1000B59C0);
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472LL;
  v55[2] = sub_10000C7DC;
  v55[3] = &unk_1000B70D0;
  v55[4] = &v63;
  if (v29)
  {
    sub_10000B5A8((uint64_t)v29, @"HID server", 0, v55);
    sub_10000B5A8((uint64_t)v29, @"OS watchdog", 0, &stru_1000B59E0);
  }

  v31 = [BKUserEventTimer sharedInstance];
  _BKHIDSetUserEventNotifier();

  if (v29) {
    sub_10000B5A8((uint64_t)v29, @"system shell servers", 0, &stru_1000B5A00);
  }
  v32 = v29;
  v33 = [BKSystemShellSentinel dataMigrationQueue];
  *(void *)buf = _NSConcreteStackBlock;
  *(void *)&uint8_t buf[8] = 3221225472LL;
  *(void *)&buf[16] = sub_10000BB40;
  v66 = &unk_1000B8058;
  v67 = v32;
  v34 = v32;
  dispatch_async(v33, buf);

  BKSystemShellSentinel *v35 = [[BKSystemShellSentinel sharedInstance] autorelease];
  [v35 startServerWithDataMigration];

  sub_10000B5A8((uint64_t)v34, @"Accessibility", 730464508, &stru_1000B5A20);
  if (v29)
  {
    sub_10000B5A8((uint64_t)v34, @"misc services", 0, &stru_1000B5A40);
    uint64_t v36 = BKLogCommon(@"startup complete");
    v37 = [os_log logWithCategory:v36];
    BOOL v38 = os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
    if (v38)
    {
      double v39 = BSContinuousMachTimeNow(v38) - v34[1];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = @"startup complete";
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = v39;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%{public}@. %gs elapsed", buf, 0x16u);
    }
  }

  else
  {
    v53 = @"startup complete";
  }

  _Block_object_dispose(&v63, 8);
  objc_autoreleasePoolPop(v15);
  if (v11) {
    uint64_t v40 = pthread_set_qos_class_self_np(__qos_class, __relative_priority);
  }
  if (!v4) {
    pthread_set_timeshare_self(v40);
  }
  kdebug_trace(730464458LL, 0LL, 0LL, 0LL, 0LL);
  CFRunLoopGetCurrent();
  if (!_CFRunLoopSetPerCalloutAutoreleasepoolEnabled(1LL))
  {
    Current = CFRunLoopGetCurrent();
    CFMutableArrayRef Mutable = CFArrayCreateMutable(0LL, 0LL, 0LL);
    v63.version = 0LL;
    v63.info = Mutable;
    v63.retain = (const void *(__cdecl *)(const void *))&_CFRetain;
    v63.release = (void (__cdecl *)(const void *))&_CFRelease;
    v63.copyDescription = (CFStringRef (__cdecl *)(const void *))&CFCopyDescription;
    v43 = CFRunLoopObserverCreate(0LL, 1uLL, 1u, -2147483647LL, (CFRunLoopObserverCallBack)sub_100053958, &v63);
    v44 = CFRunLoopObserverCreate(0LL, 0xA0uLL, 1u, 0x7FFFFFFFLL, (CFRunLoopObserverCallBack)sub_100053958, &v63);
    CFRunLoopAddObserver(Current, v43, kCFRunLoopCommonModes);
    CFRunLoopAddObserver(Current, v44, kCFRunLoopCommonModes);
    CFRelease(Mutable);
    if (!CFRunLoopContainsObserver(Current, v43, kCFRunLoopDefaultMode))
    {
      CFRunLoopAddObserver(Current, v43, kCFRunLoopDefaultMode);
      CFRunLoopAddObserver(Current, v44, kCFRunLoopDefaultMode);
    }

    if (v43) {
      CFRelease(v43);
    }
    if (v44) {
      CFRelease(v44);
    }
  }

  do
    uint64_t v45 = CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.79769313e308, 0);
  while ((v45 - 3) < 0xFFFFFFFE);
  uint64_t v46 = BKLogCommon(v45);
  v47 = os_log_create(v46, "");
  if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
  {
    CFIndex v49 = *a2;
    LODWORD(v63.version) = 136446210;
    *(CFIndex *)((char *)&v63.version + 4) = v49;
    _os_log_error_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_ERROR,  "%{public}s exiting...\n",  (uint8_t *)&v63,  0xCu);
  }

  return 0LL;
}

void sub_10000C6CC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, char a33)
{
}

uint64_t sub_10000C6EC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10000C6FC(uint64_t a1)
{
}

void sub_10000C704(uint64_t a1)
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  _DWORD v6[2] = sub_10000CE54;
  v6[3] = &unk_1000B70D0;
  uint64_t v2 = *(void *)(a1 + 32);
  void v6[4] = *(void *)(a1 + 40);
  if (v2)
  {
    sub_10000B5A8(v2, @"HID system open", 0, v6);
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    _DWORD v5[2] = sub_10000CE90;
    v5[3] = &unk_1000B70D0;
    void v5[4] = v4;
    if (v3) {
      sub_10000B5A8(v3, @"HID system start", 0, v5);
    }
  }

id sub_10000C7BC(uint64_t a1)
{
  return _[*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) startEventRouting];
}

id sub_10000C7CC(uint64_t a1)
{
  return _[*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) startEventProcessing];
}

id sub_10000C7DC(uint64_t a1)
{
  return _[*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) startServer];
}

void sub_10000C7EC(id a1)
{
  BKSecureDrawingMonitor *v1 = [BKSecureDrawingMonitor sharedInstance];
  [v1 startMonitoringSecureDrawing];

  uint64_t v2 = (void *)[BKTouchDeliveryPolicyServer sharedServer];
  [v2 run];

  BKTouchDeliveryObservationManager *v3 = [BKTouchDeliveryObservationManager sharedInstance];
}

void sub_10000C850(id a1)
{
  if (qword_1000DC180 != -1) {
    dispatch_once(&qword_1000DC180, &stru_1000B7228);
  }
}

void sub_10000C878(id a1)
{
  BKSystemShellSentinel *v1 = [BKSystemShellSentinel sharedInstance];
  [v1 startServerWithoutDataMigration];

  BKAlternateSystemAppServer *v2 = [[BKAlternateSystemAppServer sharedInstance] autorelease];
  [v2 run];
}

void sub_10000C8D0(id a1)
{
  BKWatchdogService *v1 = [[BKWatchdogService alloc] init];
  wd_endpoint_register("com.apple.backboard.oswatchdog");
  [v1 registerClientsForMonitoring];
  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472LL;
  uint64_t v12 = sub_10001D494;
  uint64_t v13 = &unk_1000B6050;
  id v14 = v1;
  id v2 = v1;
  uint64_t v3 = wd_endpoint_set_alive_func(&v10);
  wd_endpoint_activate(v3);

  unsigned int v4 = GSRegisterPurpleNamedPort("com.apple.backboard.watchdog");
  BSDispatchQueueAttributes *v5 = [BSDispatchQueueAttributes serial];
  uint64_t v6 = (void *)[v5 serviceClass:25];
  int v7 = (dispatch_queue_s *)BSDispatchQueueCreate(@"com.apple.backboard.watchdog", v6);

  uint64_t v8 = dispatch_source_create(v4, v4, 0LL, v7);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_1000615A8;
  handler[3] = &unk_1000B7AF0;
  unsigned int v16 = v4;
  dispatch_source_set_cancel_handler(v8, handler);
  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472LL;
  uint64_t v12 = sub_1000615C8;
  uint64_t v13 = &unk_1000B8058;
  id v14 = v8;
  uint64_t v9 = v8;
  dispatch_source_set_event_handler(v9, v10);
  dispatch_resume(v9);
}

void sub_10000CA5C(id a1)
{
  id v1 = sub_10002153C( "BKDisplayServices MiG Server",  (uint64_t)"com.apple.backboard.display.services",  (uint64_t)&off_1000B9238);
  uint64_t v2 = [v1 autorelease];
  uint64_t v3 = (void *)qword_1000DBF20;
  qword_1000DBF20 = v2;
}

void sub_10000CA98(id a1)
{
  BKDisplayBrightnessUpdateTransactionManager *v1 = [BKDisplayBrightnessUpdateTransactionManager sharedInstance];
  [v1 synchronizeALSPreferencesAndSystemDisplayBrightness];
}

void sub_10000CACC(id a1)
{
  BKDisplayBrightnessController *v1 = [BKDisplayBrightnessController sharedInstance];
  uint64_t v2 = (void *)qword_1000DBF88;
  qword_1000DBF88 = (uint64_t)v1;
  id v3 = v1;

  unsigned int v4 = (void *)[v3 propertyForKey:@"DisplayBrightnessFactor"];
  NSNumber *v6 = v5;

  id v7 = v4;
  uint64_t v8 = v7;
  if (v6)
  {
    if ((objc_opt_isKindOfClass(v7, v6) & 1) != 0) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0LL;
    }
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  id v10 = v9;

  if (v10)
  {
    os_unfair_lock_lock(&stru_1000DBF90);
    [v10 floatValue];
    dword_1000DBF94 = v11;
    os_unfair_lock_unlock(&stru_1000DBF90);
  }

  v23[0] = BKDefaultKeyALSEnabled;
  v23[1] = @"BKALSWeightMax";
  v24[0] = @"DisplayBrightnessAuto";
  v24[1] = @"DisplayBrightnessAutoWeightMax";
  v23[2] = @"BKALSWeightMin";
  v23[3] = @"BKALSIntPeriod";
  v24[2] = @"DisplayBrightnessAutoWeightMin";
  v24[3] = @"ALSIntPeriod";
  v23[4] = @"BKALSIntPeriodOrientationEnabled";
  v23[5] = @"BKALSIntPeriodOrientationLandscape";
  v24[4] = @"ALSIntPeriodOrientationEnabled";
  v24[5] = @"ALSIntPeriodOrientationLandscape";
  v23[6] = @"BKALSIntPeriodOrientationPortrait";
  v23[7] = @"BKALSIntPeriodOrientationPortraitInv";
  v24[6] = @"ALSIntPeriodOrientationPortrait";
  v24[7] = @"ALSIntPeriodOrientationPortraitInv";
  v23[8] = @"BKHIDSessionLogLevel";
  v23[9] = @"BKALSFadeSlope";
  v24[8] = @"LogLevel";
  v24[9] = @"DisplayBrightnessFadeSlope";
  v23[10] = @"BKHIDALSInternalSettings";
  v24[10] = @"ALSInternalSettings";
  uint64_t v12 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:11];
  uint64_t v13 = (void *)qword_1000DC1E0;
  qword_1000DC1E0 = v12;

  BKSDefaults *v14 = [BKSDefaults localDefaults];
  id v15 = [v14 ALSEpoch];
  if ((uint64_t)v15 <= 0)
  {
    id v16 = v15;
    uint64_t v17 = BKLogDetailed();
    os_log_s *v18 = v17;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      id v26 = v16;
      __int16 v27 = 2048;
      uint64_t v28 = 1LL;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "Resetting ALS preferences on upgrade from epoch %ld to %ld",  buf,  0x16u);
    }

    [v14 setALSUserPreferences:0];
    [v14 setALSEnabled:1];
    [v14 setALSEpoch:1];
    sub_1000537E8();
  }

  sub_1000538D0();
  sub_10005367C(0LL);
  uint64_t v19 = [BKSDefaults localDefaults];
  char v20 = (void *)[NSString stringWithUTF8String:@"ALSEnabled"];
  id v21 = [v19 observeDefault:v20 onQueue:&_dispatch_main_q withBlock:&stru_1000B7690];

  BKDisplayBrightnessController *v22 = [BKDisplayBrightnessController sharedInstance];
}

void sub_10000CE24(id a1)
{
  if (qword_1000DBF48 != -1) {
    dispatch_once(&qword_1000DBF48, &stru_1000B5F48);
  }
}

void sub_10000CE54(uint64_t a1)
{
  uint64_t v2 = [BKHIDSystemInterface sharedInstance];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8LL);
  unsigned int v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

id sub_10000CE90(uint64_t a1)
{
  return _[*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) startHIDSystem];
}

LABEL_2:
  BKSHIDEventDigitizerAttributes *v12 = [[BKSHIDEventDigitizerAttributes alloc] init];
  uint64_t v13 = (void *)[v9 senderInfo];
  id v14 = [v10 environment];
  [v12 setEnvironment:v14];

  id v15 = [v10 display];
  [v12 setDisplay:v15];

  id v16 = [v10 token];
  [v12 setToken:v16];

  [v9 maxForce];
  [v12 setMaximumForce:];
  [v12 setSource:[v13 eventSource]];
  Copy = (const void *)IOHIDEventCreateCopy(kCFAllocatorDefault, a3);
  [v9 digitizerSurfaceDimensions];
  [v12 setDigitizerSurfaceSize:];
  BKSHIDEventSetDigitizerAttributes(Copy, v12);
  IOHIDEventSetSenderID(Copy, [v13 senderID]);
  char v20 = BKLogTouchEvents(v18, v19);
  os_log_s *v21 = v20;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    ConciseDescription = BKSHIDEventGetConciseDescription(Copy);
    __int128 v23 = (void *)ConciseDescription;
    id v26 = 138543362;
    __int16 v27 = v23;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEBUG,  "touchpad %{public}@",  (uint8_t *)&v26,  0xCu);
  }

  [v11 postEvent:Copy toDestination:v10];
  CFRelease(Copy);
}

void sub_10000E350(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = BKLogTouchEvents(v3, v4);
  uint64_t v6 = [v5 autorelease];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543362;
    id v11 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Found a new touchpad %{public}@",  (uint8_t *)&v10,  0xCu);
  }

  id v7 = [BKTouchPadInfo initWithService:v3];
  uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 16LL);
  uint64_t v9 = [NSNumber numberWithUnsignedLongLong:[v3 senderID]];
  [v8 setObject:v7 forKey:v9];

  [v3 addDisappearanceObserver:*(void *)(a1 + 32) queue:*(void *)(*(void *)(a1 + 32) + 8)];
}

id sub_10000E478(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 16);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10000E4D0;
  v4[3] = &unk_1000B5AD8;
  v4[4] = v1;
  return [v2 enumerateKeysAndObjectsUsingBlock:v4];
}

id sub_10000E4D0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _queue_sendCancelEventForTouchPad:];
}

void sub_10000E4D8(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 16LL);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  _DWORD v6[2] = sub_10000E54C;
  v6[3] = &unk_1000B5AB0;
  id v4 = v2;
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = v4;
  uint64_t v8 = v5;
  [v3 enumerateKeysAndObjectsUsingBlock:v6];
}

void sub_10000E54C(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  id v4 = [v6 senderInfo];
  uint64_t v5 = (void *)[v4 displayUUID];
}

void sub_10000E5C8(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16LL);
  id v3 = [NSNumber numberWithUnsignedLongLong:*((unsigned long long *)((char *)a1 + 40))];
  id v4 = [v2 objectForKey:v3];

  if (v4
    || (uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 16) allValues]),
        id v4 = (void *)objc_claimAutoreleasedReturnValue([v5 firstObject]),
        v5,
        v4))
  {
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = (void *)[v4 overrideSenderDescriptor];
    uint64_t v9 = v8;
    if (v7)
    {
      int v10 = (void *)[v8 associatedDisplay];
      char v11 = BSEqualObjects(v10, *(void *)(a1 + 48));

      if ((v11 & 1) == 0)
      {
        uint64_t v12 = (void *)[*(id *)(a1 + 40) senderDescriptor];
        id v13 = [v12 mutableCopy];

        [v13 setAssociatedDisplay:*(void *)(a1 + 48)];
        [v4 setOverrideSenderDescriptor:v13];
      }
    }

    else
    {

      if (v9) {
        [v4 setOverrideSenderDescriptor:0];
      }
    }

    [ *(id *)(a1 + 32) _queue_handleEvent:*(void *)(a1 + 64) fromTouchPad:v4 dispatcher:*(void *)(a1 + 56)];
  }

  else
  {
    uint64_t v14 = BKLogCommon(v6);
    id v4 = v14;
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
    {
      id v15 = [*(id *)(a1 + 40) senderID];
      int v16 = 134217984;
      id v17 = v15;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v4,  OS_LOG_TYPE_ERROR,  "unknown touch pad sender 0x%llX",  (uint8_t *)&v16,  0xCu);
    }
  }
}

void sub_10000E7D0(id a1)
{
  BKTouchPadManager *v1 = [[BKTouchPadManager alloc] init];
  uint64_t v2 = (void *)qword_1000DBEF0;
  qword_1000DBEF0 = (uint64_t)v1;
}

void sub_10000EEDC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

id sub_10000F008(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) removeIndex:*(int *)(a1 + 40)];
}

void sub_10000F01C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = (uint64_t)[*(id *)(a1 + 48) count];
    v3[2];
    id v5 = [*(id *)(a1 + 48) count];
    BOOL v6 = (uint64_t)v5 > 0;
    if (v4 < 1 == v6)
    {
      uint64_t v7 = (uint64_t)v5;
      if (![*(id *)(a1 + 40) count])
      {
        id v8 = sub_10003F124();
        uint64_t v9 = [os_log_s class];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = NSStringFromBKSHIDTouchSensitiveButtonIdentifier(1LL);
          char v11 = [v10 autorelease];
          *(_DWORD *)buf = 67109378;
          BOOL v23 = v6;
          __int16 v24 = 2114;
          __int128 v25 = v11;
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "setScanningActive:%{BOOL}u button:%{public}@-- no services (yet?), pending",  buf,  0x12u);
        }
      }

      __int128 v19 = 0u;
      __int128 v20 = 0u;
      __int128 v17 = 0u;
      __int128 v18 = 0u;
      id v12 = *(id *)(a1 + 40);
      id v13 = [v12 countByEnumeratingWithState:v17 objects:v21 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v18;
        do
        {
          for (i = 0LL; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v18 != v15) {
              objc_enumerationMutation(v12);
            }
            sub_10000F1E4(a1, v7 > 0, *(void **)(*((void *)&v17 + 1) + 8LL * (void)i));
          }

          id v14 = [v12 countByEnumeratingWithState:v17 objects:v21 count:16];
        }

        while (v14);
      }
    }
  }
}

void sub_10000F1E4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a1)
  {
    id v6 = sub_10003F124();
    uint64_t v7 = [v6 autorelease];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = NSStringFromBKSHIDTouchSensitiveButtonIdentifier(1LL);
      uint64_t v9 = [v8 autorelease];
      *(_DWORD *)buf = 67109634;
      int v15 = a2;
      __int16 v16 = 2114;
      __int128 v17 = v9;
      __int16 v18 = 2114;
      id v19 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "setScanningActive:%{BOOL}u button:%{public}@ posting to service %{public}@",  buf,  0x1Cu);
    }

    uint64_t v10 = [NSNumber numberWithBool:a2];
    id v13 = v10;
    char v11 = [NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    [v5 asyncSetProperty:v11 forKey:@"HostStateNotification"];
  }
}

void sub_10000F32C(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = a3;
  if (([v7 containsObject:a2] & 1) == 0)
  {
    *a4 = 1;
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }

  uint64_t v10 = [NSNumber class];
  char isKindOfClass = objc_opt_isKindOfClass(v8, v10);

  if ((isKindOfClass & 1) == 0)
  {
    *a4 = 1;
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }

void sub_10000F3C8(id a1, BKSMutableHIDEventSenderDescriptor *a2)
{
}

void sub_10000F3D8(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 44);
  id v3 = *(void **)(*(void *)(a1 + 32) + 48LL);
  uint64_t v4 = *(int *)(a1 + 40);
  if (v2)
  {
    if (([v3 containsIndex:v4] & 1) == 0)
    {
      [*(id *)(*(void *)(a1 + 32) + 48) addIndex:*(int *)(a1 + 40)];
      BSProcessDeathWatcher *v5 = [[BSProcessDeathWatcher alloc] initWithPID:v1 queue:v2 deathHandler:v3];
      id v6 = *(void **)(*(void *)(a1 + 32) + 32LL);
      uint64_t v7 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
      [v6 setObject:v5 forKey:v7];
    }
  }

  else
  {
    [v3 removeIndex:v4];
    id v8 = *(void **)(*(void *)(a1 + 32) + 32LL);
    uint64_t v9 = (void *)[NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
    uint64_t v10 = (void *)[v8 objectForKey:v9];
    [v10 invalidate];

    char v11 = *(void **)(*(void *)(a1 + 32) + 32LL);
    id v12 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
    [v11 removeObjectForKey:v12];
  }

id sub_10000F544(uint64_t a1)
{
  return _[*(id *)(a1 + 32) processDidTerminate:*(unsigned int *)(a1 + 40)];
}

void sub_10000F5C8(uint64_t a1, uint64_t a2)
{
  [BSProtobufSerialization buildSchemaForClass:[a2 class] builder:&stru_1000B5BC8];
  uint64_t v3 = v2;
  uint64_t v4 = (void *)qword_1000DBF00;
  qword_1000DBF00 = v3;
}

void sub_10000F614(id a1, BSProtobufSchemaBuilder *a2)
{
  uint64_t v3 = a2;
  [v3 addRepeatingField:@"_props" containsClass:[BKSHIDKeyboardDeviceProperties class]];
}

void sub_10000F680(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    os_unfair_lock_lock(&stru_1000DBF90);
    int v2 = dword_1000DBF94;
    os_unfair_lock_unlock(&stru_1000DBF90);
    **(_DWORD **)(a1 + 32) = v2;
  }

void sub_10000F6D4(uint64_t a1)
{
  float v1 = fminf(*(float *)(a1 + 32), 1.0);
  if (v1 >= 0.0) {
    float v2 = v1;
  }
  else {
    float v2 = 0.0;
  }
  uint64_t v3 = BKLogBacklight(a1);
  uint64_t v4 = [v3];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    double v9 = v2;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Setting backlight factor pending: %f",  (uint8_t *)&v8,  0xCu);
  }

  id v5 = (void *)qword_1000DBF88;
  *(float *)&double v6 = v2;
  uint64_t v7 = [NSNumber numberWithFloat:v6];
  [v5 setProperty:v7 forKey:@"DisplayBrightnessFactorPending"];

  sub_100023D10(1, v2);
}

void sub_10000F7D8(uint64_t a1)
{
  sub_100023ED8(1LL, *(_BYTE *)(a1 + 40) != 0, *(_BYTE *)(a1 + 41) != 0, *(float *)(a1 + 32), *(float *)(a1 + 36));
}

void sub_10000F7FC(uint64_t a1)
{
  sub_100023ED8( *(_BYTE *)(a1 + 40) != 0,  *(_BYTE *)(a1 + 41) != 0,  *(_BYTE *)(a1 + 42) != 0,  *(float *)(a1 + 32),  *(float *)(a1 + 36));
}

void sub_10000F82C(uint64_t a1)
{
  BKDisplayBrightnessController *v4 = [BKDisplayBrightnessController sharedInstance];
  LODWORD(v2) = *(_DWORD *)(a1 + 32);
  LODWORD(v3) = *(_DWORD *)(a1 + 36);
  [v4 setMinimumBrightnessLevel:v2 fadeDuration:v3];
}

uint64_t sub_10000F870(uint64_t a1, int a2, __int128 *a3)
{
  v5[1] = 3221225472LL;
  __int128 v3 = a3[1];
  __int128 v7 = *a3;
  v5[0] = _NSConcreteStackBlock;
  _DWORD v5[2] = sub_10000F8FC;
  v5[3] = &unk_1000B6190;
  int v6 = a2;
  void v5[4] = a1;
  __int128 v8 = v3;
  sub_10000F8FC((uint64_t)v5);
  return 0LL;
}

void sub_10000F8FC(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 40))
  {
    double v2 = [NSData initWithBytesNoCopy:a1 length:*(unsigned int *)(a1 + 40) freeWhenDone:0LL];
    uint64_t v10 = 0LL;
    BKSBacklightFeatures *v4 = [BSProtobufSerialization decodeObjectOfClass:[BKSBacklightFeatures class] fromData:v2 error:&v10];
    id v5 = v4;
    if (v5)
    {
      uint64_t v6 = BSPIDForAuditToken(a1 + 44);
      BKDisplayBrightnessController *v7 = [BKDisplayBrightnessController sharedInstance];
      [v7 setBacklightFeatures:v5 forPID:v6];
    }

    else
    {
      uint64_t v9 = BKLogBacklight(0LL);
      __int128 v7 = [v9 autorelease];
      if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v12 = 0LL;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v7,  OS_LOG_TYPE_ERROR,  "cannot decode backlight features mode: %{public}@",  buf,  0xCu);
      }
    }
  }

  else
  {
    uint64_t v8 = BKLogBacklight(a1);
    double v2 = [v8 doubleValue];
    if (os_log_type_enabled((os_log_t)v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v2,  OS_LOG_TYPE_ERROR,  "bad size for mode data",  buf,  2u);
    }
  }
}

void sub_10000FA84(uint64_t a1)
{
  BKDisplayBrightnessController *v2 = [BKDisplayBrightnessController sharedInstance];
  **(_BYTE **)(a1 + 32) = [v2 isAutoBrightnessAvailable];
}

void sub_10000FACC(uint64_t a1)
{
  BKDisplayBrightnessController *v2 = [BKDisplayBrightnessController sharedInstance];
  **(_BYTE **)(a1 + 32) = [v2 isBrightnessLevelControlAvailable];
}

void sub_10000FB14(uint64_t a1)
{
  BKDisplayBrightnessController *v2 = [BKDisplayBrightnessController sharedInstance];
  **(_BYTE **)(a1 + 32) = [v2 isALSSupported];
}

void sub_10000FB5C(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 32);
  NSMutableDictionary *v2 = [[NSMutableDictionary alloc] init];
  [v2 setObject:@YES forKey:@"DisplayAutoBrightnessActive"];
  if (!v1)
  {
    BKSDefaults *v4 = [BKSDefaults localDefaults];
    [v4 ALSDelayOnUnlock];
    float v6 = v5;

    if (v6 > 0.0)
    {
      *(float *)&double v7 = v6;
      uint64_t v8 = (void *)[NSNumber numberWithFloat:v7];
      [v2 setObject:v8 forKey:@"DisplayAutoBrightnessDelay"];
    }
  }

  uint64_t v9 = BKLogBacklight(v3);
  uint64_t v10 = [v9];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 67109378;
    v12[1] = v1 != 0;
    __int16 v13 = 2114;
    id v14 = v2;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "BKAmbientLightSensorEnableAutoBrightness userInteractedWithUI:%{BOOL}u %{public}@",  (uint8_t *)v12,  0x12u);
  }

  BKDisplayBrightnessController *v11 = [BKDisplayBrightnessController sharedInstance];
  [v11 setProperty:v2 forKey:@"DisplayAutoBrightnessStatus"];
  if (v1) {
    [v11 setProperty:&__kCFBooleanTrue forKey:@"UserInteractedWithUI"];
  }
}

void sub_10000FCE8()
{
  uint64_t v0 = BKLogUISensor();
  int v1 = (os_log_s *)v0;
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEFAULT,  "RequestProximityStatusEvent ignored on this OS",  v2,  2u);
  }
}

void sub_10000FD4C(uint64_t a1)
{
  BKHIDEventProcessorRegistry *v2 = [BKHIDEventProcessorRegistry sharedInstance];
  BKHIDProximityEventProcessor *v4 = [v2 eventProcessorOfClass:[BKHIDProximityEventProcessor class]];
  id v5 = v4;

  [v5 setShouldSuppressTouchesWhileObjectWithinProximity:*(_BYTE *)(a1 + 32) != 0];
}

void sub_10000FDC0()
{
  uint64_t v0 = BKLogUISensor();
  int v1 = [os_log_s class];
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "RequestUISensorMode ignored on this OS", v2, 2u);
  }
}

uint64_t sub_10000FE24(_BYTE *a1, int a2, uint64_t a3)
{
  int v5 = BSPIDForAuditToken(a3);
  if (!*a1)
  {
    float v6 = 0LL;
    goto LABEL_7;
  }

  float v6 = [NSString stringWithUTF8String:a1];
  if (v6)
  {
LABEL_7:
    uint64_t v10 = [BKTouchDeliveryGenericGestureFocusObserver sharedInstance];
    __int16 v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472LL;
    int v15 = sub_10000FF74;
    __int16 v16 = &unk_1000B5B88;
    id v17 = v6;
    int v18 = v5;
    int v19 = a2;
    uint64_t v8 = v6;
    char v11 = [BKSHIDEventDeferringResolution build:v13];
    [v10 setEventDestination:v11 forDisplayUUID:v8 v13, v14, v15, v16];

    uint64_t v9 = 0LL;
    goto LABEL_8;
  }

  uint64_t v7 = BKLogCommon(0LL);
  uint64_t v8 = (os_log_s *)v7;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "ClaimGenericGestureFocus: could not convert UUID to UTF-8",  buf,  2u);
  }

  uint64_t v9 = 5LL;
LABEL_8:

  return v9;
}

void sub_10000FF74(uint64_t a1, void *a2)
{
  id v6 = a2;
  [v6 setPid:*(unsigned int *)(a1 + 40)];
  if (*(void *)(a1 + 32)) {
    BKSHIDEventDisplay *v3 = [BKSHIDEventDisplay displayWithHardwareIdentifier:];
  }
  else {
    uint64_t v3 = [BKSHIDEventDisplay builtinDisplay];
  }
  id v4 = (void *)v3;
  [v6 setDisplay:v3];
  if (*(_DWORD *)(a1 + 44))
  {
    BKSHIDEventDeferringToken *v5 = [BKSHIDEventDeferringToken tokenForIdentifierOfCAContext:];
    [v6 setToken:v5];
  }
}

uint64_t sub_100010010( objc_class *a1, int a2, objc_class *a3, int a4, objc_class *a5, objc_class *a6, uint64_t a7)
{
  if (a5 && a6)
  {
    a5->isa = 0LL;
    LODWORD(a6->isa) = 0;
    v10[0].super.isa = (Class)_NSConcreteStackBlock;
    v10[1].super.isa = (Class)3221225472LL;
    v10[2].super.isa = (Class)sub_1000100F0;
    v10[3].super.isa = (Class)&unk_1000B6170;
    int v11 = a2;
    int v12 = a4;
    v10[4].super.isa = a1;
    v10[5].super.isa = a3;
    v10[6].super.isa = a5;
    v10[7].super.isa = a6;
    if (sub_100013818(BKEventResolutionEntitlement, a7))
    {
      sub_1000100F0(v10);
      return 0LL;
    }
  }

  else
  {
    uint64_t v8 = BKLogEventDelivery(a1);
    uint64_t v9 = [v8 autorelease];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "expected a valid place to put the description data",  buf,  2u);
    }
  }

  return 5LL;
}

void sub_1000100F0(NSData *a1)
{
  int v1 = a1;
  if (LODWORD(a1[8].super.isa))
  {
    a1 = [NSData initWithBytesNoCopy:a1[4].super.isa length:LODWORD(a1[8].super.isa) freeWhenDone:0LL];
    id v2 = a1;
  }

  else
  {
    id v2 = 0LL;
  }

  if (HIDWORD(v1[8].super.isa))
  {
    a1 = [NSData initWithBytesNoCopy:v1[5].super.isa length:HIDWORD(v1[8].super.isa) freeWhenDone:0LL];
    uint64_t v3 = a1;
    if (v2) {
      goto LABEL_6;
    }
LABEL_10:
    uint64_t v7 = BKLogEventDelivery(a1);
    uint64_t v8 = [v7 autorelease];
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    LOWORD(v17) = 0;
    uint64_t v9 = "_BKHIDXXGetEventResolutionDescription: no event descriptor";
LABEL_14:
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v17, 2u);
    goto LABEL_21;
  }

  uint64_t v3 = 0LL;
  if (!v2) {
    goto LABEL_10;
  }
LABEL_6:
  uint64_t v4 = [BKSHIDEventDescriptor bs_secureDecodedFromData:v2];
  if (!v4)
  {
    uint64_t v10 = BKLogEventDelivery(0LL);
    uint64_t v8 = [os_log_s class];
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    LOWORD(v17) = 0;
    uint64_t v9 = "_BKHIDXXGetEventResolutionDescription: failed to decode event descriptor";
    goto LABEL_14;
  }

  int v5 = (void *)v4;
  if (v3) {
    BKSHIDEventSenderDescriptor *v6 = [BKSHIDEventSenderDescriptor bs_secureDecodedFromData:v3];
  }
  else {
    id v6 = 0LL;
  }
  int v11 = [BKHIDSystemInterface sharedInstance];
  int v12 = (void *)[v11 deliveryManager];

  uint64_t v8 = (os_log_s *)[v12 descriptionOfResolutionPathForEventDescriptor:v5 senderDescriptor:v6];
  uint64_t v13 = [os_log_s bs_secureEncoded];
  if (v13)
  {
    uint64_t v14 = (void *)v13;

    v1[6].super.isa->isa = (Class)[v14 bs_bytesForMIG];
    LODWORD(v1[7].super.isa->isa) = [v14 bs_lengthForMIG];
    uint64_t v8 = (os_log_s *)v14;
  }

  else
  {
    uint64_t v15 = BKLogEventDelivery(0LL);
    os_log_s *v16 = [v15 autorelease];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v17 = 138543362;
      int v18 = v8;
      _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "_BKHIDXXGetEventResolutionDescription: cannot encode %{public}@",  (uint8_t *)&v17,  0xCu);
    }
  }

LABEL_21:
}
}
}

uint64_t sub_10001035C( objc_class *a1, int a2, objc_class *a3, int a4, objc_class *a5, objc_class *a6, uint64_t a7)
{
  if (a5 && a6)
  {
    a5->isa = 0LL;
    LODWORD(a6->isa) = 0;
    v10[0].super.isa = (Class)_NSConcreteStackBlock;
    v10[1].super.isa = (Class)3221225472LL;
    v10[2].super.isa = (Class)sub_10001043C;
    v10[3].super.isa = (Class)&unk_1000B6170;
    int v11 = a2;
    int v12 = a4;
    v10[4].super.isa = a1;
    v10[5].super.isa = a3;
    v10[6].super.isa = a5;
    v10[7].super.isa = a6;
    if (sub_100013818(BKEventResolutionEntitlement, a7))
    {
      sub_10001043C(v10);
      return 0LL;
    }
  }

  else
  {
    uint64_t v8 = BKLogEventDelivery(a1);
    uint64_t v9 = [os_log_s autorelease];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "expected a valid place to put the description data",  buf,  2u);
    }
  }

  return 5LL;
}

void sub_10001043C(NSData *a1)
{
  int v1 = a1;
  if (LODWORD(a1[8].super.isa))
  {
    a1 = [NSData initWithBytesNoCopy:a1[4].super.isa length:LODWORD(a1[8].super.isa) freeWhenDone:0LL];
    id v2 = a1;
  }

  else
  {
    id v2 = 0LL;
  }

  if (HIDWORD(v1[8].super.isa))
  {
    a1 = [NSData initWithBytesNoCopy:v1[5].super.isa length:HIDWORD(v1[8].super.isa) freeWhenDone:0LL];
    uint64_t v3 = a1;
    if (v2) {
      goto LABEL_6;
    }
LABEL_10:
    uint64_t v7 = BKLogEventDelivery(a1);
    uint64_t v8 = [v7 autorelease];
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    LOWORD(v17) = 0;
    uint64_t v9 = "_BKHIDXXGetEventResolutionDescription: no event descriptor";
LABEL_14:
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v17, 2u);
    goto LABEL_21;
  }

  uint64_t v3 = 0LL;
  if (!v2) {
    goto LABEL_10;
  }
LABEL_6:
  uint64_t v4 = [BKSHIDEventKeyCommand bs_secureDecodedFromData:v2];
  if (!v4)
  {
    uint64_t v10 = BKLogEventDelivery(0LL);
    uint64_t v8 = [os_log_s class];
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    LOWORD(v17) = 0;
    uint64_t v9 = "_BKHIDXXGetEventResolutionDescription: failed to decode event descriptor";
    goto LABEL_14;
  }

  int v5 = (void *)v4;
  if (v3) {
    id v6 = [BKSHIDEventSenderDescriptor bs_secureDecodedFromData:v3];
  }
  else {
    id v6 = 0LL;
  }
  int v11 = [BKHIDSystemInterface sharedInstance];
  int v12 = (void *)[v11 deliveryManager];

  uint64_t v8 = (os_log_s *)[v12 descriptionOfResolutionPathForKeyCommand:v5 senderDescriptor:v6];
  uint64_t v13 = [os_log_s bs_secureEncoded];
  if (v13)
  {
    uint64_t v14 = (void *)v13;

    v1[6].super.isa->isa = [v14 bs_bytesForMIG];
    LODWORD(v1[7].super.isa->isa) = [v14 bs_lengthForMIG];
    uint64_t v8 = (os_log_s *)v14;
  }

  else
  {
    uint64_t v15 = BKLogEventDelivery(0LL);
    os_log_s *v16 = v15;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v17 = 138543362;
      int v18 = v8;
      _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "_BKHIDXXGetEventResolutionDescription: cannot encode %{public}@",  (uint8_t *)&v17,  0xCu);
    }
  }

uint64_t sub_1000106A8(uint64_t a1, int a2, uint64_t a3)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100010724;
  v4[3] = &unk_1000B5BE8;
  int v5 = a2;
  v4[4] = a1;
  if (!sub_100013818(BKSetAuthenticatedKeyCommandsEntitlement, a3)) {
    return 5LL;
  }
  sub_100010724((uint64_t)v4);
  return 0LL;
}

void sub_100010724(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 40))
  {
    NSData *v1 = [NSData dataWithBytesNoCopy:a1 length:*(unsigned int *)(a1 + 40) freeWhenDone:NO];
    v16[0] = [NSSet class];
    v16[1] = [BKSHIDAuthenticatedKeyCommandSpecification class];
    uint64_t v4 = [NSArray arrayWithObjects:v16 count:2];
    NSSet *v5 = [NSSet setWithArray:v4];
    id v6 = [NSSet bs_secureObjectFromData:v1 ofClasses:v5];

    if (v6)
    {
      uint64_t v8 = [BKHIDEventProcessorRegistry sharedInstance];
      BKKeyboardHIDEventProcessor *v10 = [v8 eventProcessorOfClass:[BKKeyboardHIDEventProcessor class]];
      int v11 = [v10 autorelease];

      [v11 setKeyCommandsToAuthenticate:v6];
    }

    else
    {
      uint64_t v13 = BKLogKeyboard(v7);
      int v11 = (void *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR))
      {
        int v14 = 138543362;
        uint64_t v15 = v1;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v11,  OS_LOG_TYPE_ERROR,  "cannot decode authenticated key commands: %{public}@",  (uint8_t *)&v14,  0xCu);
      }
    }
  }

  else
  {
    uint64_t v12 = BKLogKeyboard(a1);
    NSData *v1 = v12;
    if (os_log_type_enabled((os_log_t)v1, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v14) = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v1,  OS_LOG_TYPE_ERROR,  "bad size for authenticated key command data",  (uint8_t *)&v14,  2u);
    }
  }
}

uint64_t sub_100010904(uint64_t a1, uint64_t a2)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100010978;
  v3[3] = &unk_1000B7108;
  v3[4] = a1;
  if (!sub_100013818(BKBackBoardClientEntitlement, a2)) {
    return 5LL;
  }
  sub_100010978((uint64_t)v3);
  return 0LL;
}

void sub_100010978(uint64_t a1)
{
  if (**(_BYTE **)(a1 + 32)) {
    id v5 = [NSString stringWithUTF8String:];
  }
  else {
    id v5 = 0LL;
  }
  BKHIDEventProcessorRegistry *v1 = [BKHIDEventProcessorRegistry sharedInstance];
  BKHIDDirectTouchEventProcessor *v3 = [v1 eventProcessorOfClass:[BKHIDDirectTouchEventProcessor class]];
  uint64_t v4 = v3;

  [v4 cancelTouchesOnDisplay:v5];
}

uint64_t sub_100010A0C(uint64_t a1, int a2, uint64_t a3)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100010A9C;
  v4[3] = &unk_1000B5BE8;
  int v5 = a2;
  v4[4] = a1;
  if (!sub_1000139E4( (uint64_t)"_BKHIDXXCancelTouchesWithIdentifiers",  BKCancelTouchesEntitlement,  BKBackBoardClientEntitlement,  a3)) {
    return 5LL;
  }
  sub_100010A9C((uint64_t)v4);
  return 0LL;
}

void sub_100010A9C(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 40) && *(void *)(a1 + 32))
  {
    NSData *v1 = [NSData initWithBytesNoCopy:*(void *)(a1 + 32) length:*(unsigned int *)(a1 + 40) freeWhenDone:0LL];
    NSArray *v3 = [NSArray class];
    NSSet *v5 = [NSSet setWithObjects:v3, [NSNumber numberWithInt:v4], nil];
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    uint64_t v7 = [NSObject bs_secureObjectFromData:v1 ofClasses:v6];

    if (v7)
    {
      uint64_t v9 = [BKHIDEventProcessorRegistry sharedInstance];
      BKHIDDirectTouchEventProcessor *v11 = [v9 eventProcessorOfClass:[BKHIDDirectTouchEventProcessor class]];
      uint64_t v12 = [v11 autorelease];
      [v12 cancelTouchesWithIdentifiers:v7];
    }

    else
    {
      uint64_t v13 = BKLogCommon(v8);
      uint64_t v9 = [v13 autorelease];
      if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v9,  OS_LOG_TYPE_DEFAULT,  "Error unarchiving touchIdentifiers",  buf,  2u);
      }
    }
  }

uint64_t sub_100010BEC(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  _DWORD v5[2] = sub_100010C68;
  v5[3] = &unk_1000B6110;
  int v6 = a2;
  void v5[4] = a3;
  void v5[5] = a1;
  if (!sub_100013818(BKBackBoardClientEntitlement, a4)) {
    return 5LL;
  }
  sub_100010C68((uint64_t)v5);
  return 0LL;
}

void sub_100010C68(uint64_t a1)
{
  if (**(_BYTE **)(a1 + 32)) {
    NSString *v2 = [NSString stringWithUTF8String:];
  }
  else {
    uint64_t v2 = 0LL;
  }
  if (*(_DWORD *)(a1 + 48) && *(void *)(a1 + 40))
  {
    uint64_t v3 = [NSData initWithBytesNoCopy:*(void *)(a1 + 40) length:*(unsigned int *)(a1 + 48) freeWhenDone:0LL];
    NSArray *v5 = [NSArray class];
    uint64_t v7 = [NSSet setWithObjects:v5, [BKSHitTestRegion class], nil];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    uint64_t v9 = [NSObject bs_secureObjectFromData:v3 ofClasses:v8];

    if (v9)
    {
      BKHIDEventProcessorRegistry *v11 = [BKHIDEventProcessorRegistry sharedInstance];
      BKHIDDirectTouchEventProcessor *v13 = [v11 eventProcessorOfClass:[BKHIDDirectTouchEventProcessor class]];
      int v14 = [v13 autorelease];

      [v14 setHitTestRegions:v9 forDisplay:v2];
    }

    else
    {
      uint64_t v15 = BKLogCommon(v10);
      os_log_s *v16 = v15;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Error unarchiving hittestRegions", buf, 2u);
      }
    }
  }
}

uint64_t sub_100010DF8(uint64_t a1, int a2, __int128 *a3)
{
  v5[1] = 3221225472LL;
  __int128 v3 = a3[1];
  __int128 v7 = *a3;
  v5[0] = _NSConcreteStackBlock;
  _DWORD v5[2] = sub_100010E80;
  v5[3] = &unk_1000B6190;
  int v6 = a2;
  void v5[4] = a1;
  __int128 v8 = v3;
  sub_100010E80((uint64_t)v5);
  return 0LL;
}

void sub_100010E80(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 40) && *(void *)(a1 + 32))
  {
    uint64_t v2 = [NSData initWithBytesNoCopy:a1 length:*(unsigned int *)(a1 + 40) freeWhenDone:0LL];
    uint64_t v4 = [NSArray class];
    NSSet *v6 = [NSSet setWithObjects:v4, [NSNumber numberWithInt:v5], nil];
    __int128 v7 = [v6 autorelease];
    NSObject *v8 = [NSObject bs_secureObjectFromData:v2 ofClasses:v7];

    if (!v8)
    {
      uint64_t v10 = BKLogCommon(v9);
      id v11 = v10;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)&uint8_t buf[4] = "_BKHIDXXExcludeCAContextsFromHitTestingForZoomSenders_block_invoke";
        _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%{public}s: error unarchiving contextIDs",  buf,  0xCu);
      }
    }
  }

  else
  {
    __int128 v8 = 0LL;
  }

  uint64_t v12 = [BKHIDEventProcessorRegistry sharedInstance];
  BKHIDDirectTouchEventProcessor *v14 = [v12 eventProcessorOfClass:[BKHIDDirectTouchEventProcessor class]];
  uint64_t v15 = [v14 autorelease];
  __int128 v16 = *(_OWORD *)(a1 + 60);
  *(_OWORD *)buf = *(_OWORD *)(a1 + 44);
  __int128 v18 = v16;
  [v15 setExcludedZoomContextIDs:v8 fromVersionedPID:BSVersionedPIDForAuditToken(buf)];
}

void sub_100011040(uint64_t a1, unsigned int a2, uint64_t a3)
{
  if (a1 && a2)
  {
    NSData *v4 = [NSData dataWithBytesNoCopy:a1 length:a2 freeWhenDone:NO];
    BKSHIDHapticFeedbackRequest *v6 = [NSObject bs_secureObjectFromData:v4 ofClass:[BKSHIDHapticFeedbackRequest class]];
    __int128 v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    if (v7)
    {
      BKHIDHapticFeedbackController *v8 = [BKHIDHapticFeedbackController sharedInstance];
      [v8 postHapticFeedbackRequest:v7 forAuditToken:a3];
    }

    else
    {
      uint64_t v10 = BKLogCommon(0LL);
      os_log_s *v11 = v10;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v12 = 136315138;
        uint64_t v13 = "_BKHIDXXRequestHapticFeedback";
        _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%s: Error unarchiving feedback request",  (uint8_t *)&v12,  0xCu);
      }
    }
  }

  else
  {
    uint64_t v9 = BKLogCommon(a1);
    uint64_t v4 = [v9 bytes];
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315138;
      uint64_t v13 = "_BKHIDXXRequestHapticFeedback";
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v4,  OS_LOG_TYPE_DEFAULT,  "%s: no data received",  (uint8_t *)&v12,  0xCu);
    }
  }
}

void sub_1000111DC(uint64_t a1, unsigned int a2, uint64_t a3)
{
  if (a1 && a2)
  {
    uint64_t v4 = [NSData initWithBytesNoCopy:a1 length:a2 freeWhenDone:0LL];
    NSArray *v6 = [NSArray class];
    NSSet *v8 = [NSSet setWithObjects:v6, [BKSTouchAnnotation class], nil];
    uint64_t v9 = [v8 autorelease];
    uint64_t v10 = [NSObject bs_secureObjectFromData:v4 ofClasses:v9];

    if (v10)
    {
      uint64_t v12 = BSPIDForAuditToken(a3);
      uint64_t v13 = [BKHIDEventProcessorRegistry sharedInstance];
      BKHIDDirectTouchEventProcessor *v15 = [v13 eventProcessorOfClass:[BKHIDDirectTouchEventProcessor class]];
      __int128 v16 = [v15 autorelease];

      [v16 postTouchAnnotations:v10 sourcePID:v12];
    }

    else
    {
      uint64_t v18 = BKLogCommon(v11);
      os_log_s *v19 = v18;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        id v21 = "_BKHIDXXPostTouchAnnotations";
        _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%s: Error unarchiving touch annotations",  buf,  0xCu);
      }
    }
  }

  else
  {
    uint64_t v17 = BKLogCommon(a1);
    NSData *v4 = v17;
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v21 = "_BKHIDXXPostTouchAnnotations";
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v4,  OS_LOG_TYPE_ERROR,  "%s: no data received",  buf,  0xCu);
    }
  }
}

uint64_t sub_1000113E8(int a1, uint64_t a2, int a3, char a4, uint64_t a5, __int128 *a6)
{
  v8[1] = 3221225472LL;
  __int128 v6 = a6[1];
  __int128 v10 = *a6;
  v8[0] = _NSConcreteStackBlock;
  void v8[2] = sub_100011490;
  v8[3] = &unk_1000B5C08;
  v8[4] = a2;
  v8[5] = a5;
  int v9 = a1;
  __int128 v11 = v6;
  int v12 = a3;
  char v13 = a4;
  if (!sub_1000139E4( (uint64_t)"_BKHIDXXTouchStreamCreate",  BKTouchStreamsEntitlement,  BKBackBoardClientEntitlement,  (uint64_t)a6)) {
    return 5LL;
  }
  sub_100011490((uint64_t)v8);
  return 0LL;
}

void sub_100011490(uint64_t a1)
{
  if (**(_BYTE **)(a1 + 32)) {
    uint64_t v2 = [NSString stringWithUTF8String:];
  }
  else {
    uint64_t v2 = 0LL;
  }
  BKHIDEventProcessorRegistry *v3 = [BKHIDEventProcessorRegistry sharedInstance];
  BKHIDDirectTouchEventProcessor *v5 = [v3 eventProcessorOfClass:[BKHIDDirectTouchEventProcessor class]];
  __int128 v6 = v5;

  uint64_t v7 = *(unsigned int *)(a1 + 48);
  __int128 v8 = *(_OWORD *)(a1 + 68);
  v9[0] = *(_OWORD *)(a1 + 52);
  v9[1] = v8;
  **(_DWORD **)(a1 + 40) = [v6 addTouchStreamForContextID:v7 display:v2 versionedPID:BSVersionedPIDForAuditToken(v9) identifier:*(unsigned int *)(a1 + 84) shouldSendAmbiguit yRecommendations:*(_BYTE *)(a1 + 88) != 0];
}

void sub_100011568(uint64_t a1)
{
  BKHIDEventProcessorRegistry *v2 = [BKHIDEventProcessorRegistry sharedInstance];
  BKHIDDirectTouchEventProcessor *v4 = [v2 eventProcessorOfClass:[BKHIDDirectTouchEventProcessor class]];
  id v5 = v4;

  [v5 setEventDispatchMode:*(unsigned __int8 *)(a1 + 44) ambiguityRecommendation:*(unsigned __int8 *)(a1 + 45) lastTouchTimestamp:*(unsigned int *)(a1 + 40) forTouchStreamIdentifier:*(double *)(a1 + 32)];
}

void sub_1000115E0(uint64_t a1)
{
  uint64_t v2 = [BKHIDEventProcessorRegistry sharedInstance];
  BKHIDDirectTouchEventProcessor *v4 = [v2 eventProcessorOfClass:[BKHIDDirectTouchEventProcessor class]];
  id v5 = v4;

  [v5 invalidateTouchStreamReference:*(unsigned int *)(a1 + 32)];
}

uint64_t sub_10001164C( uint64_t a1, int a2, int a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, float a8, float a9)
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000116EC;
  v10[3] = &unk_1000B6190;
  void v10[4] = a4;
  v10[5] = a6;
  v10[6] = a1;
  int v11 = a5;
  int v12 = a2;
  int v13 = a3;
  float v14 = a8;
  float v15 = a9;
  if (!sub_1000139E4( (uint64_t)"_BKHIDXXDigitizerTouchDetach",  BKDetachTouchesEntitlement,  BKBackBoardClientEntitlement,  a7)) {
    return 5LL;
  }
  sub_1000116EC((uint64_t)v10);
  return 0LL;
}

void sub_1000116EC(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 56) && *(void *)(a1 + 32))
  {
    uint64_t v2 = [NSData initWithBytesNoCopy:a1 length:*(unsigned int *)(a1 + 56) freeWhenDone:0LL];
    uint64_t v3 = [BKSHIDTouchRoutingPolicy bs_secureDecodedFromData:v2];
    if (v3)
    {
      BKHIDEventProcessorRegistry *v4 = [BKHIDEventProcessorRegistry sharedInstance];
      BKHIDDirectTouchEventProcessor *v6 = [v4 eventProcessorOfClass:[BKHIDDirectTouchEventProcessor class]];
      uint64_t v7 = [v6 autorelease];

      **(_BYTE **)(a1 + 40) = [v7 detachTouchIdentifiers:*(void *)(a1 + 48) count:*(unsigned int *)(a1 + 60) assignUserIdentifier:*(unsigned int *)(a1 + 64) policy:v3 offset:CGPointMake(*(float *)(a1 + 68), *(float *)(a1 + 72))];
    }

    else
    {
      uint64_t v10 = BKLogCommon(0LL);
      int v11 = [v10 autorelease];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v12 = 136315138;
        int v13 = "_BKHIDXXDigitizerTouchDetach_block_invoke";
        _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%s: Error unarchiving policy",  (uint8_t *)&v12,  0xCu);
      }
    }
  }

  else
  {
    uint64_t v8 = BKLogCommon(a1);
    int v9 = (os_log_s *)v8;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315138;
      int v13 = "_BKHIDXXDigitizerTouchDetach_block_invoke";
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%s: no policy data received",  (uint8_t *)&v12,  0xCu);
    }

    **(_BYTE **)(a1 + 40) = 0;
  }

void sub_1000118CC(uint64_t a1)
{
  uint64_t v2 = [BKHIDEventProcessorRegistry sharedInstance];
  BKHIDDirectTouchEventProcessor *v4 = [v2 eventProcessorOfClass:[BKHIDDirectTouchEventProcessor class]];
  id v5 = v4;

  [v5 setOffset:CGPointMake(*(unsigned int *)(a1 + 40),  *(float *)(a1 + 32),  *(float *)(a1 + 36)) forTouchesWithUserIdentifier:];
}

uint64_t sub_100011944(int a1, uint64_t a2, int a3, uint64_t a4)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  _DWORD v5[2] = sub_1000119D4;
  v5[3] = &unk_1000B60D0;
  void v5[4] = a2;
  int v6 = a3;
  int v7 = a1;
  if (!sub_1000139E4( (uint64_t)"_BKHIDXXDigitizerTouchSetRoutingPolicy",  BKDetachTouchesEntitlement,  BKBackBoardClientEntitlement,  a4)) {
    return 5LL;
  }
  sub_1000119D4((uint64_t)v5);
  return 0LL;
}

void sub_1000119D4(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 40) && *(void *)(a1 + 32))
  {
    uint64_t v2 = [NSData initWithBytesNoCopy:*(void *)(a1 + 32) length:*(unsigned int *)(a1 + 40) freeWhenDone:0LL];
    BKSHIDTouchRoutingPolicy *v4 = [BKSHIDTouchRoutingPolicy class];
    NSArray *v6 = [NSArray class];
    NSSet *v8 = [NSSet setWithObjects:v4, v6, [BSSettings class], nil];
    fail
    uint64_t v10 = [NSObject bs_secureObjectFromData:v2 ofClasses:v9];

    if (v10)
    {
      BKHIDEventProcessorRegistry *v12 = [BKHIDEventProcessorRegistry sharedInstance];
      BKHIDDirectTouchEventProcessor *v14 = [v12 eventProcessorOfClass:[BKHIDDirectTouchEventProcessor class]];
      float v15 = [v14 autorelease];

      [v15 setRoutingPolicy:v10 forTouchesWithUserIdentifier:*(unsigned int *)(a1 + 44)];
    }

    else
    {
      uint64_t v17 = BKLogCommon(v11);
      uint64_t v18 = [v17];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        __int128 v20 = "_BKHIDXXDigitizerTouchSetRoutingPolicy_block_invoke";
        _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "%s: Error unarchiving policy",  buf,  0xCu);
      }
    }
  }

  else
  {
    uint64_t v16 = BKLogCommon(a1);
    uint64_t v2 = [v16 bytes];
    if (os_log_type_enabled((os_log_t)v2, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      __int128 v20 = "_BKHIDXXDigitizerTouchSetRoutingPolicy_block_invoke";
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v2,  OS_LOG_TYPE_ERROR,  "%s: no policy data received",  buf,  0xCu);
    }
  }
}

void sub_100011BE8(uint64_t a1)
{
  BKUserEventTimer *v2 = [BKUserEventTimer sharedInstance];
  [v2 resetTimer:*(unsigned int *)(a1 + 40) mode:*(double *)(a1 + 32)];
}

void sub_100011C30(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    BKUserEventTimer *v3 = [[BKUserEventTimer sharedInstance] autorelease];
    [v3 lastUserEventTime];
    **(void **)(a1 + 32) = v2;
  }

void sub_100011C90(uint64_t a1)
{
  id v2 = sub_100065B98();
  uint64_t v3 = v2;
  uint64_t v4 = (void *)v3;
  if (v3)
  {
    uint64_t v5 = *(unsigned __int8 *)(a1 + 32);
    uint64_t v6 = *(dispatch_queue_s **)(v3 + 8);
    block[1] = 3221225472LL;
    block[2] = sub_1000664CC;
    block[3] = &unk_1000B7ED8;
    void block[4] = v4;
    block[5] = v5;
    uint64_t v7 = v4;
    block[0] = _NSConcreteStackBlock;
    dispatch_async(v6, block);
    uint64_t v4 = v7;
  }
}

void sub_100011D10(uint64_t a1)
{
  id v2 = sub_100065B98();
  id v3 = v2;
  sub_100067088((uint64_t)v3, *(unsigned __int8 *)(a1 + 32));
}

uint64_t sub_100011D54(uint64_t a1, char a2, __int128 *a3)
{
  v5[1] = 3221225472LL;
  __int128 v3 = a3[1];
  __int128 v6 = *a3;
  v5[0] = _NSConcreteStackBlock;
  _DWORD v5[2] = sub_100011DE0;
  v5[3] = &unk_1000B6150;
  void v5[4] = a1;
  char v8 = a2;
  __int128 v7 = v3;
  sub_100011DE0((uint64_t)v5);
  return 0LL;
}

void sub_100011DE0(uint64_t a1)
{
  if (**(_BYTE **)(a1 + 32)) {
    id v3 = [NSString stringWithUTF8String:];
  }
  else {
    id v3 = 0LL;
  }
  BKAccelerometerInterface *v2 = [BKAccelerometerInterface sharedInstance];
  [v2 systemAppSetOrientationEventsClient:v3 wantsOrientationEvents:*(_BYTE *)(a1 + 72) != 0 auditToken:a1 + 40];
}

void sub_100011E60(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 68)) {
    uint64_t v2 = 1LL;
  }
  else {
    uint64_t v2 = 2LL;
  }
  id v3 = sub_100065B98();
  uint64_t v4 = v3;
  uint64_t v5 = *(int *)(a1 + 32);
  __int128 v6 = *(_OWORD *)(a1 + 52);
  v8[0] = *(_OWORD *)(a1 + 36);
  v8[1] = v6;
  uint64_t v7 = BSVersionedPIDForAuditToken(v8);
  sub_100066A38((uint64_t)v4, v2, v5, v7);
}

void sub_100011EE0(uint64_t a1)
{
  id v2 = sub_100065B98();
  id v3 = v2;
  __int128 v4 = *(_OWORD *)(a1 + 48);
  v6[0] = *(_OWORD *)(a1 + 32);
  v6[1] = v4;
  uint64_t v5 = BSVersionedPIDForAuditToken(v6);
  sub_100067018((uint64_t)v3, 3LL, v5);
}

void sub_100011F3C(uint64_t a1)
{
  uint64_t v4 = 0LL;
  id v2 = sub_100065B98();
  id v3 = v2;
  **(_DWORD **)(a1 + 32) = sub_100066954((uint64_t)v3, (uint64_t)&v4);

  **(_DWORD **)(a1 + 40) = v4;
}

void sub_100011F98(uint64_t a1, uint64_t a2, double a3, float a4, float a5, float a6)
{
  BSMachPortSendRight *v15 = [[BSMachPortSendRight alloc] initWithPort:a1];
  if (-[BSMachPortSendRight isUsable](v15, "isUsable"))
  {
    uint64_t v11 = [BKAccelerometerInterface sharedInstance];
    float v12 = a4;
    *(float *)&double v13 = a5;
    *(float *)&double v14 = a6;
    [v11 bksAccelerometerClientRequestedAccelerometerEvents:v15 updateInterval:a2 xThreshold:a3 yThreshold:v12 zThreshold:v13 auditToken:v14];
  }
}

void sub_100012038(uint64_t a1, int a2, int a3, uint64_t a4)
{
  BSMachPortSendRight *v8 = [[BSMachPortSendRight alloc] initWithPort:a1];
  if (-[BSMachPortSendRight isUsable](v8, "isUsable"))
  {
    uint64_t v7 = [BKAccelerometerInterface sharedInstance];
    [v7 bksAccelerometerClientRequestedOrientationEvents:v8 enabled:a2 != 0 passiveEvents:a3 != 0 auditToken:a4];
  }
}

uint64_t sub_1000120C8(uint64_t a1, _OWORD *a2)
{
  __int128 v3 = a2[1];
  *(_OWORD *)buf = *a2;
  __int128 v23 = v3;
  uint64_t v4 = [BSAuditToken tokenFromAuditToken:buf];
  uint64_t v5 = [BSProcessHandle processHandleForAuditToken:v4];

  BSMachPortSendRight *v6 = [[BSMachPortSendRight alloc] initWithPort:a1];
  BOOL v7 = [v6 isUsable];
  int v8 = (int)v7;
  uint64_t v9 = BKLogBacklight(v7);
  uint64_t v10 = [v9 autorelease];
  uint64_t v11 = v10;
  if (v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Beginning explicit brightness transaction on behalf of %{public}@",  buf,  0xCu);
    }

    double v12 = [v5 name];
    double v13 = v12;
    if (!v12) {
      double v13 = [v5 bundleIdentifier];
    }
    NSString *v11 = [NSString stringWithFormat:@"%@:%d", v13, [v5 pid]];
    if (!v12) {

    }
    BKDisplayBrightnessUpdateTransaction *v14 = [[BKDisplayBrightnessUpdateTransaction alloc] init];
    BKDisplayBrightnessUpdateTransactionManager *v15 = [BKDisplayBrightnessUpdateTransactionManager sharedInstance];
    uint64_t v16 = [BKDisplayBrightnessUpdateTransaction initWithIdentifier:v11 transactionManager:v15];

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_100012334;
    v20[3] = &unk_1000B8058;
    id v21 = v16;
    uint64_t v17 = v16;
    [BSPortDeathSentinel monitorSendRight:v6 withHandler:v20];

    uint64_t v18 = 0LL;
  }

  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v5;
      _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Ignoring explicit brightness transaction request because sender is invalid: %{public}@",  buf,  0xCu);
    }

    uint64_t v18 = 5LL;
  }

  return v18;
}

id sub_100012334(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

void sub_10001233C(uint64_t a1)
{
  BKDisplayBrightnessUpdateTransactionManager *v3 = [BKDisplayBrightnessUpdateTransactionManager sharedInstance];
  LODWORD(v2) = *(_DWORD *)(a1 + 32);
  [v3 setDisplayBrightness:*(_BYTE *)(a1 + 36) != 0 permanently:v2];
}

void sub_10001238C(uint64_t a1)
{
  BKDisplayBrightnessController *v2 = [BKDisplayBrightnessController sharedInstance];
  [v2 setDisplayBrightnessCurve:*(unsigned __int8 *)(a1 + 32)];
}

void sub_1000123D0(uint64_t a1)
{
  BKDisplayBrightnessController *v2 = [BKDisplayBrightnessController sharedInstance];
  [v2 setAutoBrightnessEnabled:*(_BYTE *)(a1 + 32) != 0];
}

uint64_t sub_10001241C(uint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4, _OWORD *a5)
{
  id v10 = sub_100012814((uint64_t)a5);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  if ([v11 count])
  {
    uint64_t v13 = [BKSHIDEventSenderDescriptor class];
    id v14 = sub_1000128B4((uint64_t)"SetPersistentServiceProperties", v13, a1, a2);
    uint64_t v16 = [v14 autorelease];
    if (v16)
    {
      int v51 = v11;
      NSDictionary *v52 = [NSDictionary class];
      uint64_t v18 = [NSNumber numberWithBool:v17];
      uint64_t v20 = [NSDate class];
      NSData *v22 = [NSData class];
      NSString *v24 = [NSString class];
      uint64_t v26 = [NSSet class];
      NSArray *v28 = [NSArray class];
      NSSet *v30 = [NSSet setWithObjects:v18, v20, v22, v24, v26, v28, [NSDictionary dictionaryWithObjects:v29 forKeys:v29 count:1]];
      v31 = [v30 autorelease];
      id v32 = sub_100012AAC((uint64_t)"SetPersistentServiceProperties", v52, v31, a3, a4);
      v33 = v32;

      if (v33 && CFPropertyListIsValid(v33, kCFPropertyListXMLFormat_v1_0))
      {
        id v34 = sub_10003F280();
        v35 = (os_log_s *)v34;
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          __int128 v36 = a5[1];
          *(_OWORD *)buf = *a5;
          *(_OWORD *)&uint8_t buf[16] = v36;
          uint64_t v37 = BSVersionedPIDForAuditToken(buf);
          uint64_t v38 = BSProcessDescriptionForPID(v37);
          double v39 = [v38 doubleValue];
          *(_DWORD *)buf = 138543874;
          *(void *)&uint8_t buf[4] = v39;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v33;
          *(_WORD *)&buf[22] = 2114;
          _BYTE buf[24] = v16;
          _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "SetPersistentServiceProperties process:%{public}@ set:%{public}@ for senders matching:%{public}@",  buf,  0x20u);
        }

        __int128 v55 = 0u;
        __int128 v56 = 0u;
        __int128 v53 = 0u;
        __int128 v54 = 0u;
        uint64_t v11 = v51;
        id v40 = v51;
        uint64_t v41 = [v40 countByEnumeratingWithState:v53 objects:v57 count:16];
        if (v41)
        {
          uint64_t v42 = *(void *)v54;
          do
          {
            for (uint64_t i = 0LL; i != v41; ++i)
            {
              if (*(void *)v54 != v42) {
                objc_enumerationMutation(v40);
              }
              [*(id *)(*((void *)&v53 + 1) + 8 * i) setPersistentProperties:v33 forSenderDescriptor:v16];
            }

            uint64_t v41 = (uint64_t)[v40 countByEnumeratingWithState:v53 objects:v57 count:16];
          }

          while (v41);
        }
      }

      else
      {
        id v45 = sub_10003F280();
        id v40 = [v45 autorelease];
        if (os_log_type_enabled((os_log_t)v40, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v33;
          _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v40,  OS_LOG_TYPE_ERROR,  "SetPersistentServiceProperties: bad properties %{public}@",  buf,  0xCu);
        }

        uint64_t v41 = 5LL;
        uint64_t v11 = v51;
      }
    }

    else
    {
      id v46 = sub_10003F280();
      v33 = [v46 autorelease];
      if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v33,  OS_LOG_TYPE_ERROR,  "SetPersistentServiceProperties failed to decode sender descriptor",  buf,  2u);
      }

      uint64_t v41 = 5LL;
    }
  }

  else
  {
    id v44 = sub_10003F280();
    uint64_t v16 = [v44 autorelease];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v48 = BSPIDForAuditToken(a5);
      uint64_t v49 = BSProcessDescriptionForPID(v48);
      int v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v50;
      _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "SetPersistentServiceProperties: %{public}@ is not entitled",  buf,  0xCu);
    }

    uint64_t v41 = 5LL;
  }

  return v41;
}

id sub_100012814(uint64_t a1)
{
  id v2 = [BKIOHIDServicePersistentPropertyController sharedInstances];
  if ((sub_100013898(BKBackBoardClientEntitlement, a1) & 1) == 0)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    _DWORD v5[2] = sub_100012C80;
    v5[3] = &unk_1000B5CA8;
    void v5[4] = a1;
    uint64_t v3 = [v2 bs_filter:v5];

    id v2 = (void *)v3;
  }

  return v2;
}

id sub_1000128B4(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  if (a3 && a4)
  {
    NSData *v6 = [NSData initWithBytesNoCopy:a3 length:a4 freeWhenDone:NO];
    if (v6)
    {
      id v14 = 0LL;
      id v7 = [BSProtobufSerialization decodeObjectOfClass:a2 fromData:v6 error:&v14];
      int v8 = (os_log_s *)v14;
      if (v7)
      {
LABEL_14:

        goto LABEL_15;
      }

      id v9 = sub_10003F280();
      os_log_s *v10 = v9;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        uint64_t v16 = a1;
        __int16 v17 = 2114;
        uint64_t v18 = a2;
        __int16 v19 = 2114;
        uint64_t v20 = v8;
        __int16 v21 = 2114;
        uint64_t v22 = v6;
        _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%{public}s: %{public}@ failed to protobuf decode (error:%{public}@) %{public}@",  buf,  0x2Au);
      }
    }

    else
    {
      id v12 = sub_10003F280();
      os_log_s *v10 = v12;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446210;
        uint64_t v16 = a1;
        _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%{public}s: could not get data",  buf,  0xCu);
      }

      int v8 = 0LL;
    }

    id v7 = 0LL;
    goto LABEL_14;
  }

  id v11 = sub_10003F280();
  int v8 = [v11];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v16 = a1;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}s: not specified", buf, 0xCu);
  }

  id v7 = 0LL;
LABEL_15:

  return v7;
}

id sub_100012AAC(uint64_t a1, void *a2, void *a3, uint64_t a4, unsigned int a5)
{
  id v9 = a3;
  if (!a4 || !a5)
  {
    id v13 = sub_10003F280();
    os_log_s *v10 = [v13 autorelease];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v21 = 136446210;
      uint64_t v22 = a1;
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%{public}s: not specified",  (uint8_t *)&v21,  0xCu);
    }

    goto LABEL_12;
  }

  NSData *v10 = [NSData initWithBytesNoCopy:a4 length:a5 freeWhenDone:0LL];
  if (!v10)
  {
    id v14 = sub_10003F280();
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    if (!os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
    {
LABEL_11:

LABEL_12:
      id v12 = 0LL;
      goto LABEL_13;
    }

    int v21 = 136446210;
    uint64_t v22 = a1;
    uint64_t v16 = "%{public}s: could not get data";
    __int16 v17 = (os_log_s *)v15;
    uint32_t v18 = 12;
LABEL_15:
    _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v21, v18);
    goto LABEL_11;
  }

  uint64_t v11 = [a2 bs_secureDecodedFromData:v10 withAdditionalClasses:v9];
  if (!v11)
  {
    id v19 = sub_10003F280();
    uint64_t v15 = v19;
    if (!os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    int v21 = 136446722;
    uint64_t v22 = a1;
    __int16 v23 = 2114;
    uint64_t v24 = a2;
    __int16 v25 = 2114;
    uint64_t v26 = v10;
    uint64_t v16 = "%{public}s: %{public}@ failed to secure decode %{public}@";
    __int16 v17 = (os_log_s *)v15;
    uint32_t v18 = 32;
    goto LABEL_15;
  }

  id v12 = (void *)v11;
LABEL_13:

  return v12;
}

BOOL sub_100012C80(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)[a2 clientEntitlement];
  BOOL v4 = sub_100013818(v3, *(void *)(a1 + 32));

  return v4;
}

uint64_t sub_100012CC0( uint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4, void *a5, _DWORD *a6, uint64_t a7)
{
  id v14 = sub_100012814(a7);
  uint64_t v15 = [v14 autorelease];
  if ([v15 count])
  {
    __int128 v53 = a6;
    uint64_t v17 = [BKSHIDEventSenderDescriptor class];
    id v18 = sub_1000128B4((uint64_t)"GetPersistentServiceProperties", v17, a1, a2);
    os_log_s *v19 = [v18 autorelease];
    NSSet *v21 = [NSSet class];
    NSSet *v23 = [NSSet setWithObject:[NSString stringWithFormat:@"%@", v22]];
    uint64_t v24 = [v23 autorelease];
    id v25 = sub_100012AAC((uint64_t)"GetPersistentServiceProperties", v21, v24, a3, a4);
    uint64_t v26 = [v25 autorelease];

    id v27 = [v26 count];
    __int128 v58 = 0u;
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    __int128 v61 = 0u;
    id v28 = v26;
    id v29 = [v28 countByEnumeratingWithState:v58 objects:v63 count:16];
    if (v29)
    {
      id v31 = v29;
      uint64_t v32 = *(void *)v59;
      while (2)
      {
        for (uint64_t i = 0LL; i != v31; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v59 != v32) {
            objc_enumerationMutation(v28);
          }
          uint64_t v34 = *(void *)(*((void *)&v58 + 1) + 8LL * (void)i);
          NSString *v35 = [NSString class];
          if ((objc_opt_isKindOfClass(v34, v35) & 1) == 0)
          {

            goto LABEL_26;
          }
        }

        id v31 = [v28 countByEnumeratingWithState:v58 objects:v63 count:16];
        if (v31) {
          continue;
        }
        break;
      }
    }

    if (v27)
    {
      if (!v19)
      {
LABEL_29:

        uint64_t v46 = 0LL;
        goto LABEL_33;
      }

      __int128 v56 = 0u;
      __int128 v57 = 0u;
      __int128 v54 = 0u;
      __int128 v55 = 0u;
      id v36 = v15;
      id v37 = [v36 countByEnumeratingWithState:v54 objects:v62 count:16];
      if (v37)
      {
        id v38 = v37;
        uint64_t v39 = *(void *)v55;
        while (2)
        {
          for (j = 0LL; j != v38; j = (char *)j + 1)
          {
            if (*(void *)v55 != v39) {
              objc_enumerationMutation(v36);
            }
            uint64_t v41 = [v54 persistentPropertiesForKeys:v28 forSenderDescriptor:v19];
            if ([v41 count])
            {
              uint64_t v42 = [v41 bs_secureEncoded];
              if (v42)
              {
                uint64_t v49 = v42;
                *a5 = [v42 bs_bytesForMIG];
                _DWORD *v53 = [v49 bs_lengthForMIG];

                goto LABEL_28;
              }

              id v43 = sub_10003F280();
              os_log_s *v44 = v43;
              if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_error_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_ERROR,  "GetPersistentServiceProperties failed to encode properties",  buf,  2u);
              }
            }
          }

          id v38 = [v36 countByEnumeratingWithState:v54 objects:v62 count:16];
          if (v38) {
            continue;
          }
          break;
        }
      }
    }

    else
    {
LABEL_26:
      id v45 = sub_10003F280();
      id v36 = [v45 autorelease];
      if (os_log_type_enabled((os_log_t)v36, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v65 = v28;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v36,  OS_LOG_TYPE_ERROR,  "GetPersistentServiceProperties: bad property keys %{public}@",  buf,  0xCu);
      }
    }

LABEL_28:
    goto LABEL_29;
  }

  id v47 = sub_10003F280();
  os_log_s *v19 = [v47 autorelease];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    uint64_t v50 = BSPIDForAuditToken(a7);
    uint64_t v51 = BSProcessDescriptionForPID(v50);
    int v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
    *(_DWORD *)buf = 138543362;
    id v65 = v52;
    _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "GetPersistentServiceProperties: %{public}@ is not entitled",  buf,  0xCu);
  }

  uint64_t v46 = 5LL;
LABEL_33:

  return v46;
}
}

void sub_1000130A8(uint64_t a1, unsigned int a2, _OWORD *a3)
{
  BOOL v6 = [BKSecurityManager hasEntitlement:BKSetAuthenticatedTouchesEntitlement forAuditToken:a3];
  __int128 v7 = a3[1];
  *(_OWORD *)buf = *a3;
  *(_OWORD *)&uint8_t buf[16] = v7;
  uint64_t v8 = BSVersionedPIDForAuditToken(buf);
  if (!a1 || !a2)
  {
    uint64_t v32 = BKLogTouchEvents(v8, v9);
    os_log_s *v12 = v32;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "_BKHIDXXTouchAddAuthenticationSpecifications";
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s: nil authspec data", buf, 0xCu);
    }

    goto LABEL_25;
  }

  uint64_t v10 = v8;
  NSData *v12 = [NSData initWithBytesNoCopy:a1 length:a2 freeWhenDone:NO];
  if (!v12)
  {
    uint64_t v35 = BKLogTouchEvents(0LL, v11);
    uint64_t v17 = v35;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "_BKHIDXXTouchAddAuthenticationSpecifications";
      _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%s: invalid authentication spec data received",  buf,  0xCu);
    }

    goto LABEL_24;
  }

  uint64_t v13 = [NSSet class];
  uint64_t v15 = [NSSet setWithObjects:v13, [BKSTouchAuthenticationSpecification class], nil];
  uint64_t v16 = [v15 autorelease];
  uint64_t v17 = [NSObject bs_secureObjectFromData:v12 ofClasses:v16];

  uint64_t v19 = [NSSet class];
  uint64_t isKindOfClass = objc_opt_isKindOfClass(v17, v19);
  if ((isKindOfClass & 1) == 0 || (uint64_t isKindOfClass = (uint64_t)-[os_log_s count](v17, "count")) == 0)
  {
    uint64_t v33 = BKLogTouchEvents(isKindOfClass, v21);
    uint64_t v34 = [v33];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "_BKHIDXXTouchAddAuthenticationSpecifications";
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v17;
      _os_log_error_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_ERROR,  "%s: error corrupt authspec structure (%{public}@)",  buf,  0x16u);
    }

LABEL_24:
    goto LABEL_25;
  }

  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  uint64_t v22 = v17;
  [v22 countByEnumeratingWithState:v46 objects:v50 count:16];
  if (v23)
  {
    id v25 = v23;
    uint64_t v26 = *(void *)v47;
    while (2)
    {
      for (uint64_t i = 0LL; i != v25; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v47 != v26) {
          objc_enumerationMutation(v22);
        }
        id v28 = *(void **)(*((void *)&v46 + 1) + 8LL * (void)i);
        uint64_t v29 = [BKSTouchAuthenticationSpecification class];
        id v30 = v28;
        id v31 = v30;
        if (!v29 || (objc_opt_isKindOfClass(v30, v29) & 1) == 0)
        {

          goto LABEL_27;
        }

        if (!v31) {
          goto LABEL_27;
        }
      }

      [v22 countByEnumeratingWithState:v46 objects:v50 count:16];
      if (v25) {
        continue;
      }
      break;
    }
  }

LABEL_27:
  BKHIDEventProcessorRegistry *v36 = [BKHIDEventProcessorRegistry sharedInstance];
  BKHIDDirectTouchEventProcessor *v38 = [v36 eventProcessorOfClass:[BKHIDDirectTouchEventProcessor class]];
  uint64_t v39 = [v38 autorelease];

  uint64_t v42 = BKLogTouchEvents(v40, v41);
  os_log_s *v43 = v42;
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v44 = NSStringFromBSVersionedPID(v10);
    id v45 = v44;
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v45;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v6;
    *(_WORD *)&buf[18] = 2114;
    *(void *)&buf[20] = v22;
    _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "pid:%{public}@ adding (entitled:%{BOOL}u) slot registrations %{public}@",  buf,  0x1Cu);
  }

  [v39 addTouchAuthenticationSpecifications:v22 registrantEntitled:v6];
  id v12 = v22;
LABEL_25:
}

  *a5 = v23;

  return v22;
}

void sub_1000134BC(uint64_t a1)
{
  uint64_t v2 = BSPIDForAuditToken(a1 + 32);
  if ((int)v2 >= 2)
  {
    uint64_t v3 = v2;
    BOOL v4 = [BKHIDEventProcessorRegistry sharedInstance];
    BKHIDTouchSensitiveButtonEventProcessor *v6 = [v4 eventProcessorOfClass:[BKHIDTouchSensitiveButtonEventProcessor class]];
    id v7 = v6;

    [v7 setScanningActive:*(_DWORD *)(a1 + 64) != 0 buttonIdentifier:*(unsigned int *)(a1 + 68) forPID:v3];
  }

void sub_100013564(uint64_t a1, unsigned int a2, unsigned int *a3, uint64_t a4)
{
  BOOL v8 = sub_100013818(BKMessageAuthenticationVerificationEntitlement, a4);
  if (v8 || (BOOL v8 = sub_100013818(BKMessageAuthenticationKeyEntitlement, a4)))
  {
    if (a1 && a2)
    {
      uint64_t v10 = [NSData initWithBytesNoCopy:a1 length:a2 freeWhenDone:0LL];
      if (v10)
      {
        id v22 = 0LL;
        BKSHIDEventAuthenticationMessage *v11 = [BSProtobufSerialization decodeObjectOfClass:[BKSHIDEventAuthenticationMessage class] fromData:v10 error:&v22];
        id v12 = v11;
        uint64_t v13 = (os_log_s *)v22;
        uint64_t v14 = v13;
        if (v12)
        {
          uint64_t v15 = [BKHIDSystemInterface sharedInstance];
          uint64_t v16 = (void *)[v15 deliveryManager];

          uint64_t v17 = (void *)[v16 authenticationOriginator];
          unsigned int v18 = [v17 validateMessage:v12];
        }

        else
        {
          uint64_t v21 = BKLogCommon(v13);
          uint64_t v16 = v21;
          if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            uint64_t v24 = "_BKHIDXXVerifyEventAuthenticationMessage";
            __int16 v25 = 2114;
            uint64_t v26 = v14;
            _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v16,  OS_LOG_TYPE_ERROR,  "%s: Error decoding message (%{public}@)",  buf,  0x16u);
          }

          unsigned int v18 = 0;
        }
      }

      else
      {
        uint64_t v20 = BKLogCommon(0LL);
        uint64_t v14 = v20;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          uint64_t v24 = "_BKHIDXXVerifyEventAuthenticationMessage";
          __int16 v25 = 2114;
          uint64_t v26 = 0LL;
          _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%s: Cannot create data from message (%{public}@)",  buf,  0x16u);
        }

        unsigned int v18 = 0;
      }
    }

    else
    {
      uint64_t v19 = BKLogCommon(v8);
      uint64_t v10 = [v19 bytes];
      if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v24 = "_BKHIDXXVerifyEventAuthenticationMessage";
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v10,  OS_LOG_TYPE_ERROR,  "%s: no data received",  buf,  0xCu);
      }

      unsigned int v18 = 0;
    }

    if (a3) {
      goto LABEL_22;
    }
  }

  else
  {
    unsigned int v18 = 0;
    if (a3) {
LABEL_22:
    }
      *a3 = v18;
  }

BOOL sub_100013818(void *a1, uint64_t a2)
{
  id v3 = a1;
  BOOL v4 = v3;
  if (!a2)
  {
    if (!v3)
    {
      BOOL v7 = 1LL;
      goto LABEL_8;
    }

    goto LABEL_6;
  }

  int v5 = BSPIDForAuditToken(a2);
  pid_t v6 = getpid();
  BOOL v7 = 1LL;
  if (v4 && v5 != v6) {
LABEL_6:
  }
    BOOL v7 = [BKSecurityManager hasEntitlement:v4 forAuditToken:a2];
LABEL_8:

  return v7;
}

id sub_100013898(void *a1, uint64_t a2)
{
  if (!sub_100013818(a1, a2)) {
    return 0LL;
  }
  id v3 = [BKSystemShellSentinel sharedInstance];
  id v4 = [v3 auditTokenRepresentsSystemApp:a2];

  return v4;
}

id sub_1000138EC(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = sub_100013898(v5, a3);
  id v7 = v6;
  if ((v6 & 1) == 0)
  {
    uint64_t v8 = BKLogCommon(v6);
    uint64_t v9 = [v8 autorelease];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138543874;
      id v12 = v5;
      __int16 v13 = 2082;
      uint64_t v14 = a1;
      __int16 v15 = 1024;
      int v16 = BSPIDForAuditToken(a3);
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Only system apps with entitlement %{public}@ may use %{public}s; ignoring request from pid %d",
        (uint8_t *)&v11,
        0x1Cu);
    }
  }

  return v7;
}

uint64_t sub_1000139E4(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  if (sub_100013818(v7, a4)
    || (BOOL v9 = +[BKSecurityManager hasEntitlement:forAuditToken:]( &OBJC_CLASS___BKSecurityManager,  "hasEntitlement:forAuditToken:",  v8,  a4))
    && (uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[BKSystemShellSentinel sharedInstance](&OBJC_CLASS___BKSystemShellSentinel, "sharedInstance")),
        unsigned __int8 v11 = [v10 auditTokenRepresentsSystemApp:a4],
        v10,
        (v11 & 1) != 0))
  {
    uint64_t v12 = 1LL;
  }

  else
  {
    uint64_t v13 = BKLogCommon(v9);
    uint64_t v14 = (os_log_s *)v13;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v16 = 138544130;
      id v17 = v8;
      __int16 v18 = 2114;
      id v19 = v7;
      __int16 v20 = 2082;
      uint64_t v21 = a1;
      __int16 v22 = 1024;
      int v23 = BSPIDForAuditToken(a4);
      _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Only system apps with entitlement %{public}@ or processes with entitlement %{public}@ may use %{public}s; ignori"
        "ng request from pid %d",
        (uint8_t *)&v16,
        0x26u);
    }

    uint64_t v12 = 0LL;
  }

  return v12;
}

__CFString *sub_100015B70(uint64_t a1)
{
  if (!a1) {
    return @"silent";
  }
  if (a1 == 1) {
    int v1 = @"tone1";
  }
  else {
    NSString *v1 = [NSString stringWithFormat:@"unknown:%lX", a1];
  }
  return v1;
}

void sub_1000161F8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0LL;
}

void sub_100016250(uint64_t a1)
{
  v15[0] = kCAContextDisplayable;
  v15[1] = kCAContextSecure;
  v16[0] = kCFBooleanTrue;
  v16[1] = kCFBooleanTrue;
  v15[2] = kCAContextDisplayId;
  uint64_t v2 = [NSNumber numberWithUnsignedInt:v1];
  void v16[2] = v2;
  id v3 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:3];

  uint64_t v4 = [+[CAContext remoteContextWithOptions:] v3];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v4;

  LODWORD(v7) = 2139095039;
  [*(id *)(*(void *)(a1 + 32) + 16) setLevel:v7];
  id v8 = [CALayer layer];
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  __int128 v13 = xmmword_10008C320;
  __int128 v14 = unk_10008C330;
  if (DeviceRGB)
  {
    uint64_t v10 = DeviceRGB;
    CGColorRef v11 = [CGColor colorWithRed:v13 green:v14 blue:v15 alpha:v16];
    if (v11)
    {
      CGColorRef v12 = v11;
      [v8 setBackgroundColor:CGColorMake(v11, v13, v14)];
      CFRelease(v12);
    }

    CFRelease(v10);
  }

  [*(id *)(*(void *)(a1 + 32) + 16) setLayer:v8];
  [*(id *)(a1 + 32) _updateBounds];
}

void sub_100016784(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100016980( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  _Unwind_Resume(a1);
}

void sub_100016B64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100016BC0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _didRespondToTouchDelivery];
}

void sub_100016BF4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_100016D68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100016F00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100017064(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100017208(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100017368(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001747C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_10001756C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000177FC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_1000179AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100017A58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100017AC8(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_queue_postUpdate:toProcessPID:", *(void *)(a1 + 40), a2);
}

id sub_100017AD8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _queue_postUpdate:*(void *)(a1 + 40) toProcessPID:a2];
}

id sub_100017AE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _queue_postUpdate:a3 forTouchIdentifier:a2];
}

id sub_100017AF4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _queue_postPendingUpdates];
}

void sub_100017AFC(uint64_t a1)
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    do
    {
      uint64_t v5 = 0LL;
      do
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void *)(*((void *)&v9 + 1) + 8LL * (void)v5);
        if (v6)
        {
          if ((*(_BYTE *)(v6 + 32) & 1) != 0)
          {
            id v7 = [*(id *)(a1 + 40) _pidForClientPort:*(unsigned int *)(v6 + 12)];
            if ((_DWORD)v7 != -1)
            {
              BKSTouchDeliveryUpdate *v8 = [[BKSTouchDeliveryUpdate alloc] init];
              [v8 setType:2];
              [v8 setPid:v7];
              [v8 setContextID:*(unsigned int *)(v6 + 8)];
              [v8 setIsDetached:1];
              [*(id *)(a1 + 40) _queue_postUpdate:v8 forTouchIdentifier:*(unsigned int *)(a1 + 48)];
            }
          }
        }

        uint64_t v5 = (char *)v5 + 1;
      }

      while (v3 != v5);
      id v3 = [v2 countByEnumeratingWithState:v9 objects:v13 count:16];
    }

    while (v3);
  }
}

void sub_100017C70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100017CA4(uint64_t a1)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKey:*(unsigned int *)(a1 + 40)];
  if ([v3 count])
  {
    id v2 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKey:*(unsigned int *)(a1 + 40)];

    if (v2) {
      return;
    }
    BKSTouchDeliveryUpdate *v3 = [[BKSTouchDeliveryUpdate alloc] init];
    [v3 setType:1];
    [v3 setPid:0xFFFFFFFFLL];
    [v3 setTouchIdentifier:*(unsigned int *)(a1 + 40)];
    [v3 setIsDetached:*(unsigned __int8 *)(a1 + 44)];
    [*(id *)(a1 + 32) _queue_pendUpdate:v3];
  }
}

void sub_100017D6C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

id sub_100017D84(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 removeIndex:*(int *)(a1 + 32)];
}

void sub_100017D94(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _pidForClientPort:*(unsigned int *)(a1 + 40)];
  if ((_DWORD)v2 != -1)
  {
    id v3 = v2;
    BKSTouchDeliveryUpdate *v4 = [[BKSTouchDeliveryUpdate alloc] init];
    [v4 setType:1];
    [v4 setTouchIdentifier:*(unsigned int *)(a1 + 44)];
    [v4 setPid:v3];
    [v4 setContextID:*(unsigned int *)(a1 + 48)];
    [v4 setIsDetached:*(unsigned __int8 *)(a1 + 52)];
    [*(id *)(a1 + 32) _queue_pendUpdate:v4];
  }

void sub_100017E38( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_100017E8C(id a1)
{
  BKTouchDeliveryObservationManager *v1 = [[BKTouchDeliveryObservationManager alloc] init];
  id v2 = (void *)qword_1000DBF10;
  qword_1000DBF10 = (uint64_t)v1;
}

__CFString *sub_100017EB4(uint64_t a1)
{
  if (a1 >= 5) {
    return [NSString stringWithFormat:@"<invalid:%X>", a1];
  }
  else {
    return off_1000B5E18[a1];
  }
}

void sub_100017F04(uint64_t a1, void *a2)
{
  uint64_t v3 = **(unsigned int **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = sub_100017EB4(v3);
  id v6 = v5;
  [v4 appendFormat:@"%@ (%d)", v6, **(unsigned int **)(a1 + 32)];
}

id sub_100017F74(uint64_t a1, int a2, int a3, void *a4)
{
  if (a2 == 65280 && a3 == 102)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100018020;
    v10[3] = &unk_1000B6028;
    void v10[4] = a1;
    uint64_t v5 = v10;
  }

  else
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    void v7[2] = sub_100018050;
    v7[3] = &unk_1000B5DD0;
    v7[4] = a1;
    int v8 = a2;
    int v9 = a3;
    uint64_t v5 = v7;
  }

  return [a4 appendCustomFormatWithName:0 block:v5];
}

id sub_100018020(uint64_t a1, void *a2)
{
  return [a2 appendFormat:@"%llX/Tostada" arguments:*(void *)(a1 + 32)];
}

id sub_100018050(uint64_t a1, void *a2)
{
  return [a2 appendFormat:@"%llX/%X/%X" : *(void *)(a1 + 32) : *(unsigned int *)(a1 + 40) : *(unsigned int *)(a1 + 44)];
}

uint64_t sub_100018088(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t TouchSensitiveButtonEvent = IOHIDEventCreateTouchSensitiveButtonEvent( kCFAllocatorDefault,  a4,  a3,  a2,  0LL,  0LL,  0.0,  0.0);
  IOHIDEventSetSenderID(TouchSensitiveButtonEvent, a1);
  ForceStageEvent = (const void *)IOHIDEventCreateForceStageEvent( kCFAllocatorDefault,  a4,  a6,  a5,  0LL,  NAN,  NAN,  NAN,  NAN,  NAN);
  __n128 v12 = IOHIDEventSetSenderID(ForceStageEvent, a1);
  IOHIDEventAppendEvent(TouchSensitiveButtonEvent, ForceStageEvent, 0LL, v12);
  CFRelease(ForceStageEvent);
  return TouchSensitiveButtonEvent;
}

void sub_100018150(uint64_t a1)
{
  id v2 =  [*(id *)(a1 + 32) appendDouble:@"positionDelta" withName:4 decimalPrecision:***(double ***)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v11 = *(id *)(a1 + 32);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  _DWORD v12[2] = sub_100017F04;
  v12[3] = &unk_1000B6028;
  void v12[4] = v3;
  [v11 appendCustomFormatWithName:@"stage" block:v12];
  uint64_t v4 = NSStringFromBKSHIDForceStageTransition(*(unsigned int *)(v3 + 4));
  uint64_t v5 = [v4 autorelease];
  [v11 appendString:v5 withName:@"transition"];

  id v6 = [v11 appendDouble:@"nextThreshold" withName:4 decimalPrecision:*(double *)(v3 + 8)];
  id v7 =  [v11 appendDouble:@"pressedThreshold" withName:4 decimalPrecision:*(double *)(v3 + 16)];
  id v8 =  [v11 appendDouble:@"releasedThreshold" withName:4 decimalPrecision:*(double *)(v3 + 24)];
  id v9 = [v11 appendDouble:@"forceProgress" withName:4 decimalPrecision:*(double *)(v3 + 32)];
  id v10 =  [v11 appendDouble:@"forceProgressVelocity" withName:4 decimalPrecision:*(double *)(v3 + 40)];
}

id sub_1000182EC(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 96);
  uint64_t v3 = *(void **)(a1 + 32);
  if (v2 == 42)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10001848C;
    v13[3] = &unk_1000B6028;
    void v13[4] = *(void *)(a1 + 40);
    [v3 appendCustomFormatWithName:0 block:v13];
  }

  else
  {
    id v4 = [v3 appendInteger:*(void *)(a1 + 40) withName:@"stage"];
  }

  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = NSStringFromBKSHIDForceStageTransition(*(unsigned int *)(a1 + 48));
  v7 = v6;
  [v5 appendString:v7 withName:@"transition"];

  if (!*(_BYTE *)(a1 + 100)) {
    id v8 =  [*(id *)(a1 + 32) appendDouble:@"nextThreshold" withName:4 decimalPrecision:*(double *)(a1 + 56)];
  }
  if (!*(_BYTE *)(a1 + 101)) {
    id v9 =  [*(id *)(a1 + 32) appendDouble:@"pressedThreshold" withName:4 decimalPrecision:*(double *)(a1 + 64)];
  }
  if (!*(_BYTE *)(a1 + 102)) {
    id v10 =  [*(id *)(a1 + 32) appendDouble:@"releasedThreshold" withName:4 decimalPrecision:*(double *)(a1 + 72)];
  }
  id v11 =  [*(id *)(a1 + 32) appendDouble:@"progress" withName:4 decimalPrecision:*(double *)(a1 + 80)];
  return  [*(id *)(a1 + 32) appendDouble:@"progressVelocity" withName:4 decimalPrecision:*(double *)(a1 + 88)];
}

id sub_100018478(uint64_t a1)
{
  return [*(id *)(a1 + 32) appendBodySectionWithName:@"force" block:*(void *)(a1 + 40)];
}

void sub_10001848C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned int *)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = sub_100017EB4(v3);
  id v6 = v5;
  [v4 appendFormat:@"%@ (%d)", v6, *(void *)(a1 + 32)];
}

id sub_1000184F4(uint64_t a1)
{
  uint64_t SenderID = IOHIDEventGetSenderID(*(void *)(a1 + 40));
  int IntegerValue = IOHIDEventGetIntegerValue(*(void *)(a1 + 40), 0x10000LL);
  int v4 = IOHIDEventGetIntegerValue(*(void *)(a1 + 40), 65537LL);
  return sub_100017F74(SenderID, IntegerValue, v4, *(void **)(a1 + 32));
}

uint64_t sub_100018550(uint64_t a1, uint64_t a2)
{
  else {
    return 0LL;
  }
}

uint64_t sub_1000185C0(uint64_t a1)
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  uint64_t Children = IOHIDEventGetChildren(a1);
  int v2 = (void *)Children;
  id v3 = [v2 countByEnumeratingWithState:v10 objects:v14 count:16];
  if (v3)
  {
    id v5 = v3;
    uint64_t v6 = *(void *)v11;
LABEL_3:
    uint64_t v7 = 0LL;
    while (1)
    {
      if (*(void *)v11 != v6) {
        objc_enumerationMutation(v2);
      }
      uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * v7);
      if (v5 == (id)++v7)
      {
        id v5 = [v2 countByEnumeratingWithState:v10 objects:v14 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }

  else
  {
LABEL_9:
    uint64_t v8 = 0LL;
  }

  return v8;
}

__CFString *sub_1000186BC(uint64_t a1, uint64_t a2)
{
  if (IOHIDEventGetType(a1, a2) == 42)
  {
    BSDescriptionStream *v3 = [[BSDescriptionStream alloc] init];
    uint64_t SenderID = IOHIDEventGetSenderID(a1);
    int IntegerValue = IOHIDEventGetIntegerValue(a1, 2752513LL);
    int v6 = IOHIDEventGetIntegerValue(a1, 2752512LL);
    sub_100017F74(SenderID, IntegerValue, v6, v3);
    int v7 = IOHIDEventGetIntegerValue(a1, 2752517LL);
    double DoubleValue = IOHIDEventGetDoubleValue(a1, 2752519LL);
    double v9 = IOHIDEventGetDoubleValue(a1, 2752515LL);
    double v10 = IOHIDEventGetDoubleValue(a1, 2752518LL);
    double v11 = IOHIDEventGetDoubleValue(a1, 2752514LL);
    uint64_t v12 = IOHIDEventGetIntegerValue(a1, 2752516LL);
    if (v7)
    {
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472LL;
      v48[2] = sub_100018D30;
      v48[3] = &unk_1000B6008;
      int v49 = v7;
      [v3 appendCustomFormatWithName:@"eventMask" block:v48];
    }

    else
    {
      [v3 appendString:@"()" withName:@"eventMask"];
    }

    [v3 appendPoint:v10 withName:@"position"];
    id v26 = [v3 appendPoint:@"positionDelta" withName:DoubleValue v9];
    id v27 = [v3 appendBool:v12 > 0 withName:@"touch"];
    uint64_t v28 = sub_1000185C0(a1);
    if (v28)
    {
      uint64_t v29 = v28;
      id v30 = v3;
      if (IOHIDEventGetType(v29, v31) == 41)
      {
        double v32 = IOHIDEventGetDoubleValue(v29, 2686978LL);
        double v33 = IOHIDEventGetDoubleValue(v29, 2686979LL);
        double v34 = IOHIDEventGetDoubleValue(v29, 2686980LL);
        double v35 = IOHIDEventGetDoubleValue(v29, 2686981LL);
        double v36 = IOHIDEventGetDoubleValue(v29, 2686982LL);
        uint64_t v37 = IOHIDEventGetIntegerValue(v29, 2686977LL);
        uint64_t v38 = IOHIDEventGetIntegerValue(v29, 2686976LL);
        __int128 v57 = _NSConcreteStackBlock;
        uint64_t v58 = 3221225472LL;
        __int128 v59 = sub_1000182EC;
        __int128 v60 = &unk_1000B5DF8;
        int v69 = 42;
        id v39 = v30;
        id v61 = v39;
        v62 = (void *)v38;
        uint64_t v63 = v37;
        char v70 = 0;
        char v71 = 0;
        double v64 = v32;
        double v65 = v33;
        char v72 = 0;
        double v66 = v34;
        double v67 = v35;
        double v68 = v36;
        uint64_t v40 = objc_retainBlock(&v57);
        [v39 appendBodySectionWithName:@"force" block:v40];
      }

      else
      {
        [v30 appendString:@"not a ForceStage event" withName:0];
      }
    }

    else
    {
      [v3 appendString:@"<missing force subevent>" withName:0];
    }

    id v43 = [v3 description];
LABEL_32:

    return v43;
  }

  uint64_t v50 = 0LL;
  id v51 = 0LL;
  uint64_t v13 = sub_100018550(a1, 8LL);
  if (v13)
  {
    uint64_t v14 = v13;
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    uint64_t Children = IOHIDEventGetChildren(a1);
    int v16 = (void *)Children;
    id v17 = [v16 countByEnumeratingWithState:v52 objects:v57 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v53;
      while (2)
      {
        for (uint64_t i = 0LL; i != v18; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v53 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v52 + 1) + 8LL * (void)i);
          unsigned __int16 v22 = IOHIDEventGetIntegerValue(v21, 0x10000LL);
          uint64_t v23 = (unsigned __int16)IOHIDEventGetIntegerValue(v21, 65537LL);
          if (v22 == 65280LL && v23 == 17)
          {
            id v18 = (id)sub_100018550(v21, 48LL);
            goto LABEL_18;
          }
        }

        id v18 = [v16 countByEnumeratingWithState:&v52 objects:&v57 count:16];
        if (v18) {
          continue;
        }
        break;
      }

LABEL_18:
      uint64_t v50 = v14;
      id v51 = v18;
    }

    else
    {

      uint64_t v50 = v14;
      id v51 = 0LL;
    }

    BSDescriptionStream *v44 = [[BSDescriptionStream alloc] init];
    *(void *)&__int128 v52 = _NSConcreteStackBlock;
    *((void *)&v52 + 1) = 3221225472LL;
    *(void *)&__int128 v53 = sub_1000184F4;
    *((void *)&v53 + 1) = &unk_1000B7ED8;
    *(void *)&__int128 v54 = v44;
    *((void *)&v54 + 1) = a1;
    id v45 = v44;
    [v45 appendProem:0 block:&v52];
    id v46 = v45;
    __int128 v57 = _NSConcreteStackBlock;
    uint64_t v58 = 3221225472LL;
    __int128 v59 = sub_100018150;
    __int128 v60 = &unk_1000B7ED8;
    id v61 = v46;
    v62 = &v50;
    id v3 = v46;
    [v3 appendBodySectionWithName:0 block:&v57];

    id v43 = [v3 description];
    goto LABEL_32;
  }

  id v41 = sub_10003F124();
  os_log_s *v42 = [v41 autorelease];
  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_ERROR,  "data for TouchSensitiveButton event is corrupt",  buf,  2u);
  }

  id v43 = @"<not a TouchSensitiveButton event>";
  return v43;
}

        *a5 |= v14;
        goto LABEL_19;
    }
  }

  uint64_t v14 = 0LL;
LABEL_24:

  return v14;
}

        id v26 = 0LL;
        TimeStamp = 0LL;
        uint64_t v28 = 0LL;
        uint64_t v29 = 0LL;
LABEL_46:
        kdebug_trace(730465058LL, TimeStamp, v28, v26, v29);
        [v9 postEvent:v10 fromSender:v8];
        if (!(_DWORD)v25)
        {
LABEL_55:
          __int16 v15 = 1LL;
          goto LABEL_56;
        }

        __int128 v56 = 0u;
        __int128 v57 = 0u;
        __int128 v54 = 0u;
        __int128 v55 = 0u;
        id v17 = [self->_observerAssertion context];
        id v43 = [v17 countByEnumeratingWithState:v54 objects:v58 count:16];
        if (v43)
        {
          id v44 = v43;
          id v45 = *(void *)v55;
          do
          {
            for (uint64_t i = 0LL; i != v44; uint64_t i = (char *)i + 1)
            {
              if (*(void *)v55 != v45) {
                objc_enumerationMutation(v17);
              }
              [*(id *)(*((void *)&v54 + 1) + 8 * (void)i) smartCoverStateDidChange:v25];
            }

            id v44 = [v17 countByEnumeratingWithState:v54 objects:v58 count:16];
          }

          while (v44);
        }
}

  *(NDR_record_t *)(a2 + 24) = v11;
  return result;
}

  *(NDR_record_t *)(a2 + 24) = v11;
  return result;
}

void sub_100018D30(uint64_t a1, void *a2)
{
  id v6 = a2;
  [v6 appendString:@"("];
  int v3 = *(_DWORD *)(a1 + 32);
  if ((v3 & 1) == 0)
  {
    if ((v3 & 2) == 0)
    {
      uint64_t v4 = v6;
      if ((v3 & 4) == 0)
      {
        if ((v3 & 8) == 0) {
          goto LABEL_16;
        }
        goto LABEL_15;
      }

      goto LABEL_12;
    }

    goto LABEL_10;
  }

  [v6 appendString:@"fastSwipe"];
  int v5 = *(_DWORD *)(a1 + 32);
  if ((v5 & 2) != 0)
  {
    [v6 appendString:@"|"];
LABEL_10:
    [v6 appendString:@"lowSNRSwipe"];
    uint64_t v4 = v6;
    int v5 = *(_DWORD *)(a1 + 32);
    if ((v5 & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_11;
  }

  uint64_t v4 = v6;
  if ((v5 & 4) != 0)
  {
LABEL_11:
    [v6 appendString:@"|"];
LABEL_12:
    [v6 appendString:@"liftOffPredicted"];
    uint64_t v4 = v6;
    int v5 = *(_DWORD *)(a1 + 32);
  }

LABEL_13:
  if ((v5 & 8) != 0)
  {
    [v6 appendString:@"|"];
LABEL_15:
    [v6 appendString:@"clickDownPredicted"];
    uint64_t v4 = v6;
  }

  id result = [*(id *)(a1 + 32) _queue_annotateTouch:*(unsigned int *)(a1 + 64) withUniqueString:@"swipe left"];
  int v3 = *(_DWORD *)(a1 + 68);
  if ((v3 & 0x2000000) == 0)
  {
LABEL_7:
    if ((v3 & 0x8000000) == 0) {
      return result;
    }
    return [*(id *)(a1 + 32) _queue_annotateTouch:*(unsigned int *)(a1 + 64) withUniqueString:@"swipe right"];
  }

      return;
    }
  }

  uint64_t v8 = IOMobileFramebufferOpen(MatchingService, mach_task_self_, 0LL, v21);
  double v9 = IOObjectRelease(MatchingService);
  if (v8)
  {
    double v10 = BKLogCommon(v9);
    double v11 = [v10 doubleValue];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v12 = "Couldn't open framebuffer service";
      uint64_t v13 = buf;
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v12, v13, 2u);
      goto LABEL_13;
    }

    goto LABEL_13;
  }

  uint64_t v14 = IOMobileFramebufferSetDebugFlags(*(void *)v21, v3, 32LL, v20);
  __int16 v15 = v14;
  int v16 = BKLogCommon(v14);
  os_log_s *v17 = v16;
  id v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (v15)
  {
    if (v18)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Couldn't set debug flags", buf, 2u);
    }
  }

  else
  {
    if (v18)
    {
      *(_DWORD *)buf = 67109120;
      uint64_t v23 = v3;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Tether dithering: %d", buf, 8u);
    }

    if (*(void *)v21) {
      CFRelease(*(CFTypeRef *)v21);
    }
  }

      __int16 v15 = sub_10003F124();
      os_log_s *v16 = [v15 autorelease];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        supportedSensors = v11->_supportedSensors;
        id v18 = sub_100055DA0(supportedSensors);
        uint64_t v19 = [v18 autorelease];
        __int16 v20 = sub_100055DA0(v11->_disengagedSensors);
        uint64_t v21 = v20;
        unsigned __int16 v22 = sub_100055DA0(v11->_sensorsRequiredForOpenState);
        uint64_t v23 = [v22 autorelease];
        uint64_t v24 = (void *)v23;
        LODWORD(buf) = 67110146;
        id v25 = (uint8x8_t)vcnt_s8((int8x8_t)supportedSensors);
        v25.i16[0] = vaddlv_u8(v25);
        state = v11->_state;
        HIDWORD(buf) = v25.i32[0];
        uint64_t v37 = 2114;
        uint64_t v38 = v19;
        if (state == 2) {
          id v27 = @"closed";
        }
        else {
          id v27 = @"open";
        }
        id v39 = 2114;
        uint64_t v40 = v21;
        id v41 = 2114;
        uint64_t v42 = v23;
        id v43 = 2114;
        id v44 = v27;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "SmartCover sensor count:%d available:%{public}@ disengaged:%{public}@ trigger:%{public}@; effective state:%{public}@",
          (uint8_t *)&buf,
          0x30u);
      }

      goto LABEL_24;
    }

    if ((_DWORD)a3)
    {
      uint64_t v14 = 1LL;
      if ((a4 & a3) == 0) {
        uint64_t v14 = 2LL;
      }
      v10->_state = v14;
      goto LABEL_13;
    }

    goto LABEL_20;
  }
}

  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
}

  *(NDR_record_t *)(a2 + 24) = v10;
  return result;
}

  *(NDR_record_t *)(a2 + 24) = v10;
  return result;
}

  *(NDR_record_t *)(a2 + 24) = v10;
  return result;
}

  *(NDR_record_t *)(a2 + 24) = v10;
  return result;
}

LABEL_16:
  [v4 appendString:@""]);
}

    id v26 = 0;
    goto LABEL_17;
  }

  if (!self->_imageRef)
  {
    v86 = v8;
    v87 = v10;
    uint64_t v29 = v10;
    uint64_t v31 = [CADisplay class];
    if ((objc_opt_isKindOfClass(v29, v31) & 1) == 0)
    {
      v74 = (objc_class *)[v29 classForCoder];
      if (!v74) {
        v74 = [v29 class];
      }
      v76 = NSStringFromClass(v74);
      v77 = v76;
      CADisplay *v79 = [CADisplay class];
      v80 = NSStringFromClass(v79);
      v81 = v80;
      v82 = [NSString stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.",  @"display",  v77,  v81];

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v83 = [NSString stringWithUTF8String:"CGImageRef BKDisplayCaptureImage(CADisplay *__strong)"];
        LODWORD(v97.a) = 138544130;
        v97.a = v83;
        WORD2(v97.b) = 2114;
        v97.b = @"BKDisplay.m";
        HIWORD(v97.c) = 1024;
        LODWORD(v97.d) = 888;
        WORD2(v97.d) = 2114;
        *(void *)((char *)&v97.d + 6) = v82;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ (%{public}@:%i) : %{public}@",  (uint8_t *)&v97,  0x26u);
      }

      _bs_set_crash_log_message([v82 UTF8String]);
      __break(0);
      JUMPOUT(0x10001C098LL);
    }

    [CATransaction flush];
    [CATransaction synchronize];
    sx = 1.0;
    v93 = 0;
    double v32 = [v29 uniqueId];
    sub_100019B10(v32, &v96, &v95, &sx, &v93, 0LL);

    v85 = v29;
    v84 = [v29 name];
    Scale = CGAffineTransformMakeScale(sx, sx);
    double v34 = BSDegreesToRadians(Scale, (double)(90 * v93));
    v92 = v97;
    CGAffineTransformRotate(&v100, &v92, v34);
    v97 = v100;
    v101.size.width = v96 / sx;
    v101.size.height = v95 / sx;
    v101.origin.x = 0.0;
    v101.origin.y = 0.0;
    v102 = CGRectApplyAffineTransform(v101, v100);
    height = v102.size.height;
    width = (unint64_t)v102.size.width;
    AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow( 4 * (unint64_t)v102.size.width,  (__n128)v102.origin,  *(__n128 *)&v102.origin.y);
    uint64_t v38 = (void *)[NSNumber numberWithUnsignedLong:width];
    id v39 = [NSNumber numberWithUnsignedLong:height];
    uint64_t v40 = [NSNumber numberWithUnsignedLong:AlignedBytesPerRow];
    id v41 = [NSNumber numberWithUnsignedLong:AlignedBytesPerRow * (unint64_t)height];
    uint64_t v42 = [NSDictionary dictionaryWithObjectsAndKeys:v38, kIOSurfaceWidth, v39, kIOSurfaceHeight, v40, kIOSurfaceBytesPerRow, v41, kIOSurfaceAllocSize, &off_1000C0420, kIOSurfaceBytesPerElement, &off_1000C0438, kIOSurfacePixelFormat, 0LL];

    id v43 = IOSurfaceCreate(v42);
    if (v43)
    {
      id v44 = v43;
      IOSurfaceLock(v43, 0, 0LL);
      CARenderServerRenderDisplay(0LL, v84, v44, 0LL, 0LL);
      IOSurfaceUnlock(v44, 0, 0LL);
      IOSurfaceLock(v44, 0, 0LL);
      BaseAddress = IOSurfaceGetBaseAddress(v44);
      BytesPerRow = IOSurfaceGetBytesPerRow(v44);
      __int128 v47 = IOSurfaceGetWidth(v44);
      __int128 v48 = IOSurfaceGetHeight(v44);
      AllocSize = IOSurfaceGetAllocSize(v44);
      uint64_t v50 = CGDataProviderCreateWithData(v44, BaseAddress, AllocSize, (CGDataProviderReleaseDataCallback)sub_10001B1D4);
      CFRetain(v44);
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      __int128 v52 = CGImageCreate( v47,  v48,  8uLL,  0x20uLL,  BytesPerRow,  DeviceRGB,  0x2006u,  v50,  0LL,  1,  kCGRenderingIntentDefault);
      CGDataProviderRelease(v50);
      CGColorSpaceRelease(DeviceRGB);
      uint64_t v8 = v86;
      if (v52)
      {
        CFRelease(v44);

        self->_imageRef = v52;
        double v10 = v87;
        goto LABEL_4;
      }

      __int128 v57 = v42;
      uint64_t v58 = BKLogCommon(v53);
      os_log_s *v59 = [v58 autorelease];
      double v10 = v87;
      __int128 v56 = v85;
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(v100.a) = 136315138;
        v100.a = "BKDisplayCaptureImage";
        _os_log_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_DEFAULT,  "%s Unable to create CGImageRef from IOSurface!",  (uint8_t *)&v100,  0xCu);
      }

      CFRelease(v44);
    }

    else
    {
      __int128 v54 = BKLogCommon(0LL);
      os_log_s *v55 = [os_log_s class];
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(v100.a) = 136315394;
        v100.a = @"BKDisplayCaptureImage";
        WORD2(v100.b) = 2114;
        v100.b[6] = v42;
        _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_DEFAULT,  "%s Unable to create IOSurface with properties: %{public}@",  (uint8_t *)&v100,  0x16u);
      }

      uint64_t v8 = v86;
      double v10 = v87;
      __int128 v56 = v85;
    }

    self->_imageRef = 0LL;
    id v61 = BKLogDisplay(v60);
    v62 = v61;
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v97.a) = 138543362;
      v97.a = v56;
      _os_log_error_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_ERROR,  "[BKDisplayRenderOverlay] Unable to capture display image for display! %{public}@",  (uint8_t *)&v97,  0xCu);
    }

    if (self->_imageRef) {
      goto LABEL_4;
    }
    uint64_t v63 = sub_10003F368();
    uint64_t v13 = [v63 autorelease];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v97.a) = 0;
      double v64 = "No image";
      double v65 = v13;
      double v66 = 2;
LABEL_34:
      _os_log_error_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_ERROR, v64, (uint8_t *)&v97, v66);
      goto LABEL_16;
    }

    goto LABEL_16;
  }

__CFString *sub_100018F98(unsigned int a1)
{
  if (a1 >= 4) {
    return [NSString stringWithFormat:@"(%i)", a1];
  }
  else {
    return *(off_1000B5FA8 + a1);
  }
}

void sub_100019104( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_10001914C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10001915C(uint64_t a1)
{
}

void sub_100019164(uint64_t a1, void *a2)
{
  int v3 = (void *)[a2 context];
  id v4 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) mutableCopy];
  [v4 minusSet:v3];
  id v5 = [v3 mutableCopy];
  [v5 minusSet:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), v3);
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:v20 objects:v25 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      double v10 = 0LL;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        sub_10001934C(*(void **)(*((void *)&v20 + 1) + 8LL * (void)v10), 1LL);
        double v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }

    while (v8);
  }

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v11 = v4;
  id v12 = [v11 countByEnumeratingWithState:v16 objects:v24 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      __int16 v15 = 0LL;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        sub_10001934C(*(void **)(*((void *)&v16 + 1) + 8LL * (void)v15), 0LL);
        __int16 v15 = (char *)v15 + 1;
      }

      while (v13 != v15);
      id v13 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }

    while (v13);
  }
}

void sub_10001934C(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (!v3
    || (id v7 = v3,
        unsigned int v4 = [v3 isEqualToString:BKSDisplayUUIDMainKey],
        v7,
        id v3 = v7,
        v4))
  {

    id v3 = 0LL;
  }

  id v8 = v3;
  id v5 = sub_1000193D4(v3, (uint64_t)"_BKDisplaySetDisabled");
  id v6 = [v5 autorelease];
  [v6 setDisabled:a2];
}

id sub_1000193D4(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (sub_1000194E4(v3))
  {
    id v4 = sub_1000195F8();
    id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    if (v5) {
      goto LABEL_8;
    }
  }

  else
  {
    v6 = [CAWindowServer serverIfRunning];
    id v5 = [v6 displayWithUniqueId:v3];

    if (v5) {
      goto LABEL_8;
    }
  }

  uint64_t v7 = BKLogDisplay();
  id v8 = v7;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    int v10 = 136446466;
    uint64_t v11 = a2;
    __int16 v12 = 2114;
    id v13 = v3;
    _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%{public}s: unknown displayUUID:%{public}@ ",  (uint8_t *)&v10,  0x16u);
  }

LABEL_8:
  return v5;
}

uint64_t sub_1000194E4(void *a1)
{
  id v1 = a1;
  uint64_t v8 = 0LL;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  uint64_t v11 = sub_10001914C;
  __int16 v12 = sub_10001915C;
  id v13 = 0LL;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  void v7[2] = sub_100019748;
  v7[3] = &unk_1000B5E70;
  v7[4] = &v8;
  sub_1000196F4(v7);
  int v2 = (void *)v9[5];
  if (v2)
  {
    uint64_t v3 = (uint64_t)[v2 isEqualToString:v1];
  }

  else
  {
    id v4 = v1;
    id v5 = v4;
    if (v4) {
      uint64_t v3 = (uint64_t)[v4 isEqualToString:BKSDisplayUUIDMainKey];
    }
    else {
      uint64_t v3 = 1LL;
    }
  }

  _Block_object_dispose(&v8, 8);

  return v3;
}

void sub_1000195E0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

id sub_1000195F8()
{
  uint64_t v3 = 0LL;
  id v4 = &v3;
  uint64_t v5 = 0x3032000000LL;
  id v6 = sub_10001914C;
  uint64_t v7 = sub_10001915C;
  id v8 = 0LL;
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1000196BC;
  v2[3] = &unk_1000B5E70;
  void v2[4] = &v3;
  sub_1000196F4(v2);
  id v0 = (id)v4[5];
  _Block_object_dispose(&v3, 8);

  return v0;
}

void sub_1000196A4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1000196BC(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 windowServerDisplay];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_1000196F4(void *a1)
{
  id v1 = a1;
  os_unfair_lock_assert_not_owner((os_unfair_lock_t)&unk_1000DBF58);
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000DBF58);
  v1[2](v1, qword_1000DBF50);

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000DBF58);
}

void sub_100019748(uint64_t a1, void *a2)
{
  id v10 = a2;
  if ([v10 isExternal])
  {
    uint64_t v3 = (void *)[v10 windowServerDisplay];
    uint64_t v4 = [v3 uniqueId];
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }

  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100019834;
    block[3] = &unk_1000B8058;
    id v7 = v10;
    id v12 = v7;
    if (qword_1000DBF30 == -1)
    {
      uint64_t v3 = v7;
    }

    else
    {
      dispatch_once(&qword_1000DBF30, block);
      uint64_t v3 = v12;
    }

    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8LL);
    id v9 = (id)qword_1000DBF28;
    id v6 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v9;
  }
}

void sub_100019834(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) windowServerDisplay];
  uint64_t v1 = [v3 uniqueId];
  int v2 = (void *)qword_1000DBF28;
  qword_1000DBF28 = v1;
}

id sub_100019878(void *a1)
{
  id v1 = a1;
  uint64_t v14 = 0LL;
  __int16 v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  __int128 v17 = sub_10001914C;
  __int128 v18 = sub_10001915C;
  id v19 = 0LL;
  int v2 = [CADisplay displays];
  uint64_t v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472LL;
  id v10 = sub_1000199B0;
  uint64_t v11 = &unk_1000B5E48;
  id v3 = v1;
  id v12 = v3;
  id v13 = &v14;
  [v2 enumerateObjectsUsingBlock:&v8];

  if (!v15[5] && sub_1000194E4(v3))
  {
    uint64_t v4 = [CADisplay mainDisplay];
    uint64_t v5 = (void *)v15[5];
    v15[5] = v4;
  }

  id v6 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v6;
}

void sub_100019998( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_1000199B0(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7 = a2;
  uint64_t v8 = *(void **)(a1 + 32);
  id v10 = v7;
  uint64_t v9 = (void *)[v7 uniqueId];
  LODWORD(v_Block_object_dispose(va, 8) = [v8 isEqualToString:v9];

  if ((_DWORD)v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
    *a4 = 1;
  }
}

void sub_100019A3C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v12 = v3;
  if (*(void *)(a1 + 32))
  {
    [v3 size];
    id v3 = v12;
    **(void **)(a1 + 32) = v4;
  }

  if (*(void *)(a1 + 40))
  {
    [v12 size];
    id v3 = v12;
    **(void **)(a1 + 40) = v5;
  }

  if (*(void *)(a1 + 48))
  {
    [v12 scale];
    id v3 = v12;
    **(void **)(a1 + 4_Block_object_dispose(va, 8) = v6;
  }

  if (*(void *)(a1 + 56))
  {
    **(_BYTE **)(a1 + 56) = [v12 nativeRotation];
    id v3 = v12;
  }

  id v7 = *(void **)(a1 + 64);
  if (v7)
  {
    [v12 normalizedDigitizerRect];
    id v3 = v12;
    *id v7 = v8;
    v7[1] = v9;
    void v7[2] = v10;
    v7[3] = v11;
  }

  if (*(void *)(a1 + 72))
  {
    **(_BYTE **)(a1 + 72) = [v12 isExternal];
    id v3 = v12;
  }
}

void sub_100019B10(void *a1, void *a2, void *a3, double *a4, _BYTE *a5, uint64_t a6)
{
  id v24 = a1;
  if (sub_1000194E4(v24))
  {
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_100019A3C;
    v25[3] = &unk_1000B5E90;
    v25[4] = a2;
    v25[5] = a3;
    v25[6] = a4;
    v25[7] = a5;
    v25[8] = a6;
    v25[9] = 0LL;
    sub_1000196F4(v25);
  }

  else
  {
    id v11 = sub_100019878(v24);
    id v12 = [v11 autorelease];
    [v12 bounds];
    uint64_t v14 = v13;
    uint64_t v16 = v15;
    BKSDisplayServicesGetExternalDisplayScale(v12);
    if (a2) {
      *a2 = v14;
    }
    if (a3) {
      *a3 = v16;
    }
    if (a4) {
      *a4 = v17;
    }
    if (a5)
    {
      __int128 v18 = (void *)[v12 nativeOrientation];
      *a5 = sub_100019C28(v18);
    }

    if (a6)
    {
      *(void *)a6 = 0LL;
      *(void *)(a6 + _Block_object_dispose(va, 8) = 0LL;
      __asm { FMOV            V0.2D, #1.0 }

      *(_OWORD *)(a6 + 16) = _Q0;
    }
  }
}

uint64_t sub_100019C28(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:kCADisplayOrientationRotation90])
  {
    uint64_t v2 = 3LL;
  }

  else if ([v1 isEqualToString:kCADisplayOrientationRotation180])
  {
    uint64_t v2 = 2LL;
  }

  else
  {
    uint64_t v2 = (uint64_t)[v1 isEqualToString:kCADisplayOrientationRotation270];
  }

  return v2;
}

void sub_100019CA4(uint64_t a1, void *a2)
{
  unsigned int v3 = *(unsigned __int8 *)(a1 + 56);
  CGFloat v4 = *(double *)(a1 + 32);
  CGFloat v5 = *(double *)(a1 + 40);
  id v6 = a2;
  sub_100019D08(v3, v4, v5);
  [v6 setSize:];
  [v6 setScale:*(double *)(a1 + 48)];
}

void sub_100019D08(unsigned int a1, CGFloat a2, CGFloat a3)
{
  if ((a1 & 0xFFFFFFFD) == 1)
  {
    uint64_t v6 = BKLogDisplay();
    os_log_s *v7 = v6;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = sub_100018F98(a1);
      uint64_t v9 = [v8 autorelease];
      v16.width = a3;
      v16.height = a2;
      uint64_t v10 = NSStringFromSize(v16);
      id v11 = v10;
      int v12 = 138543618;
      uint64_t v13 = v9;
      __int16 v14 = 2114;
      uint64_t v15 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Actually swapping the size because the display orientation is %{public}@ - new size:  %{public}@",  (uint8_t *)&v12,  0x16u);
    }
  }

void sub_100019E18(id a1)
{
  int valuePtr = 0;
  id v1 = (const __CFNumber *)MGCopyAnswer(@"MainDisplayRotation", 0LL);
  if (v1)
  {
    uint64_t v2 = v1;
    CFNumberGetValue(v1, kCFNumberSInt32Type, &valuePtr);
    CFRelease(v2);
    int v3 = 11651 * ((360 - valuePtr) % 360);
    double v4 = (double)(int)((v3 >> 20) + (v3 >> 31));
  }

  else
  {
    double v4 = 0.0;
  }

  qword_1000DBF60 = *(void *)&v4;
}

uint64_t sub_100019EBC(uint64_t result)
{
  uint64_t v1 = result;
  LODWORD(result) = dword_1000DA910;
  if (dword_1000DA910 != -1
    || (notify_register_check("com.apple.springboard.hasBlankedScreen", &dword_1000DA910),
        id result = dword_1000DA910,
        dword_1000DA910 != -1))
  {
    notify_set_state(result, *(unsigned __int8 *)(v1 + 32));
    return notify_post("com.apple.springboard.hasBlankedScreen");
  }

  return result;
}

void sub_100019F28(id a1)
{
  id v4 = [BSDispatchQueueAttributes serial];
  uint64_t v1 = (void *)[v4 serviceClass:33];
  uint64_t v2 = BSDispatchQueueCreate(@"com.apple.backboardd.libnotify-workaround", v1);
  int v3 = (void *)qword_1000DBF70;
  qword_1000DBF70 = v2;
}

void sub_100019F94(uint64_t a1)
{
  // fail
  uint64_t v2 = (void *)qword_1000DBF40;
  qword_1000DBF40 = (uint64_t)v1;
}

void sub_100019FB8(uint64_t a1)
{
  uint64_t v2 = BKLogDisplay(a1);
  int v3 = (os_log_s *)v2;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    int v7 = 138543618;
    uint64_t v8 = v4;
    __int16 v9 = 2114;
    uint64_t v10 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%{public}@ exited with display-disabled assertion on %{public}@, releasing",  (uint8_t *)&v7,  0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  sub_10001A0B0(WeakRetained, *(void *)(a1 + 48), 0LL, *(void *)(a1 + 64));
}

id sub_10001A088(uint64_t a1)
{
  return [*(id *)(a1 + 40) invalidate];
}

BOOL sub_10001A0B0(id *a1, void *a2, int a3, void *a4)
{
  if (!a1) {
    return 0LL;
  }
  int v7 = (os_unfair_lock_s *)(a1 + 1);
  id v8 = a2;
  os_unfair_lock_lock(v7);
  id v9 = v8;
  os_unfair_lock_assert_owner(v7);
  id v10 = v9;
  id v11 = [v10 length];
  int v12 = (void *)BKSDisplayUUIDMainKey;
  if (v11) {
    int v12 = v10;
  }
  id v13 = v12;

  __int16 v14 = [NSNumber numberWithLongLong:a4];
  uint64_t v15 = NSStringFromBSVersionedPID(a4);
  id v41 = [v15 autorelease];
  NSSize v16 = [a1[2] objectForKeyedSubscript:v14];
  float v17 = v16;
  if (a3)
  {
    if (!v16)
    {
      float v17 = [NSMutableDictionary dictionary];
      [a1[2] setObject:v17 forKeyedSubscript:v14];
    }

    __int128 v18 = (void *)[v17 objectForKeyedSubscript:v13];

    if (v18)
    {
      uint64_t v20 = BKLogDisplay(v19);
      os_log_s *v21 = [v20 autorelease];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v41;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v13;
        _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "%{public}@ requested to disable %{public}@, but had existing assertion!",  buf,  0x16u);
      }

      BOOL v43 = 0;
    }

    else
    {
      [location release];
location = a1;
[location retain];
      BSProcessDeathWatcher *v26 = [[BSProcessDeathWatcher alloc] init];
      id v27 = &_dispatch_main_q;
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&uint8_t buf[8] = 3221225472LL;
      *(void *)&uint8_t buf[16] = sub_100019FB8;
      int v49 = &unk_1000B5F00;
      id v40 = v41;
      id v50 = v40;
      id v28 = v13;
      id v51 = v28;
      [v53 copy];
      id v52 = v10;
      v53[1] = a4;
      uint64_t v29 = [BSProcessDeathWatcher initWithPID:a4 queue:_dispatch_main_q deathHandler:buf];

      uint64_t v31 = BKLogDisplay(v30);
      double v32 = [v31 autorelease];
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)id v44 = 138543618;
        *(void *)&v44[4] = v40;
        *(_WORD *)&v44[12] = 2114;
        *(void *)&v44[14] = v28;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEBUG,  "%{public}@ acquiring display-disabled assertion on %{public}@",  v44,  0x16u);
      }

      double v33 = [a1[3] acquireForReason:v40 withContext:v28];
      BSSimpleAssertion *v34 = [[BSSimpleAssertion alloc] init];
      *(void *)id v44 = _NSConcreteStackBlock;
      *(void *)&v44[8] = 3221225472LL;
      *(void *)&v44[16] = sub_10001A088;
      id v45 = &unk_1000B5F28;
      double v35 = v29;
      id v46 = v35;
      id v36 = v33;
      id v47 = v36;
      id v37 = [v34 initWithIdentifier:v28 forReason:v40 invalidationBlock:v44];
      [v17 setObject:v37 forKeyedSubscript:v28];

      BOOL v43 = 1;
      objc_destroyWeak(v53);

      [location release];
    }
  }

  else
  {
    __int128 v22 = (void *)[v16 objectForKeyedSubscript:v13];
    uint64_t v23 = BKLogDisplay(v22);
    os_log_s *v24 = v23;
    id v25 = v24;
    if (v22)
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v41;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v13;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEBUG,  "%{public}@ releasing display-disabled assertion on %{public}@",  buf,  0x16u);
      }

      [v22 invalidate];
      else {
        [v17 removeObjectForKey:v13];
      }
    }

    else
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v41;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v13;
        _os_log_error_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "%{public}@ requested to enable %{public}@ without previously disabling it!",  buf,  0x16u);
      }
    }

    BOOL v43 = v22 != 0LL;
  }

  BOOL v38 = v43;
  os_unfair_lock_unlock(v7);
  return v38;
}

void sub_10001A5C4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, id a13)
{
}

void sub_10001A604(void *a1)
{
  id v1 = sub_1000193D4(a1, (uint64_t)"BKDisplayResetFlipBookEnabled");
  uint64_t v2 = [v1 autorelease];
  unsigned int v3 = [v2 isFlipBookEnabled];
  uint64_t v4 = BKLogDisplay();
  uint64_t v5 = [v4 autorelease];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "BKDisplayResetFlipBookEnabled flipBookIsEnabled:%{BOOL}u",  (uint8_t *)v6,  8u);
  }

  if (v3)
  {
    [v2 setFlipBookEnabled:0];
    [v2 setFlipBookEnabled:1];
  }
}

void sub_10001A6E4(void *a1)
{
  uint64_t v3 = 0LL;
  uint64_t v4 = 0LL;
  uint64_t v2 = 0x3FF0000000000000LL;
  char v1 = 0;
  sub_100019B10(a1, v3, v4, v2, v1, 0LL);
}

void sub_10001A778(void *a1)
{
  uint64_t v3 = 0LL;
  uint64_t v4 = 0LL;
  uint64_t v2 = 0x3FF0000000000000LL;
  char v1 = 0;
  sub_100019B10(a1, &v3, &v4, (double *)&v2, &v1, 0LL);
}

double sub_10001A824(uint64_t a1, void *a2, double a3, double a4)
{
  id v7 = sub_1000193D4(a2, (uint64_t)"BKDisplayConvertCAScreenLocationToContext");
  v8 = v7;
  [v8 convertPoint:a1 toContextId:a3];
  double v10 = v9;

  return v10;
}

id sub_10001A890(uint64_t a1)
{
  uint64_t v2 = [CAWindowServer serverIfRunning];
  id v3 = [v2 taskNamePortOfContextId:a1];

  return v3;
}

BOOL sub_10001A8D4()
{
  uint64_t v3 = 0LL;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x3032000000LL;
  uint64_t v6 = sub_10001914C;
  id v7 = sub_10001915C;
  id v8 = 0LL;
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10001A998;
  v2[3] = &unk_1000B5E70;
  void v2[4] = &v3;
  sub_1000196F4(v2);
  BOOL v0 = v4[5] == 0;
  _Block_object_dispose(&v3, 8);

  return v0;
}

void sub_10001A980( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_10001A998(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v9 = v3;
  if (!v3)
  {
    id v7 = [NSAssertionHandler currentHandler];
    NSString *v8 = [NSString stringWithUTF8String: @"BOOL BKDisplayIsHeadless(void)_block_invoke"];
    [v7 handleFailureInFunction:v8 file:@"BKDisplay.m" lineNumber:682 description:@"please invoke BKDisplayStartWindowServer before BKDisplayIsHeadless"];

    id v3 = 0LL;
  }

  uint64_t v4 = [v3 windowServerDisplay];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void sub_10001AA50(id a1)
{
  BKDisplayInfo *v1 = [[BKDisplayInfo alloc] init];
  uint64_t v2 = [BSPathProviderFactory pathProviderForSystemContainerForCurrentProcess];
  id v3 = [v2 cachesPath];
  uint64_t v4 = (void *)[v3 path];

  uint64_t v5 = ((uint64_t (*)(void))BKLogDisplay)();
  uint64_t v6 = [v5 autorelease];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)v73 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "StartWindowServer: Initializing shader cache path: %{public}@",  buf,  0xCu);
  }

  if (v4)
  {
    uint64_t v7 = MTLSetShaderCachePath(v4);
    MTLMakeShaderCacheWritableByAllUsers(v7);
  }

  id v8 = v1;
  uint64_t v70 = kCAWindowServerDisableUpdatesOnMainDisplay;
  char v71 = &__kCFBooleanTrue;
  BOOL v9 = [NSDictionary dictionaryWithObjects:v70 forKeys:v71 count:1];
  double v10 = [CAWindowServer serverWithOptions:v9];

  [v10 setRendererFlags:3];
  id v11 = [CADisplay mainDisplay];
  int v12 = [v10 displayWithDisplayId:[v11 displayId]];
  uint64_t v13 = ((uint64_t (*)(void))BKLogDisplay)();
  os_log_s *v14 = [v13 autorelease];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    unsigned int v15 = [v12 displayId];
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v73 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "StartWindowServer: disabling framebuffer changes on display (%d) at boot until we are ready for them.",  buf,  8u);
  }

  if (v11 && v12)
  {
    id v16 = v11;
    id v17 = v12;
    __int128 v18 = v8;
    [v18 setWindowServerDisplay:v17];
    [v18 setExternal:[v16 isExternal]];
    [v17 bounds];
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    double v23 = (double)(unint64_t)[v16 pointScale];
    id v24 = [v16 currentMode];
    double v25 = (double)(unint64_t)[v24 preferredScale];

    uint64_t v26 = ((uint64_t (*)(void))BKLogDisplay)();
    os_log_s *v27 = v26;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      *(double *)v73 = v23;
      *(_WORD *)&v73[8] = 2048;
      double v74 = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "StartWindowServer: MG scale:%g display preferredScale:%g",  buf,  0x16u);
    }

    if (-[_BKDisplayInfo isExternal](v18, "isExternal"))
    {
      id v28 = [v16 currentMode];

      if (v28) {
        double v23 = v25;
      }
    }

    if (BSFloatLessThanFloat(v23, 1.0))
    {
      uint64_t v29 = ((uint64_t (*)(void))BKLogDisplay)();
      uint64_t v30 = v29;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(double *)v73 = v23;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "StartWindowServer: Invalid point scale from CADisplay: %g; assuming 1.0",
          buf,
          0xCu);
      }

      double v23 = 1.0;
    }

    int v69 = v8;
    if (qword_1000DBF68 != -1) {
      dispatch_once(&qword_1000DBF68, &stru_1000B5F68);
    }
    uint64_t v31 = (int)*(double *)&qword_1000DBF60;
    double v32 = [v16 nativeOrientation];
    unsigned int v33 = sub_100019C28(v32);

    uint64_t v34 = ((uint64_t (*)(void))BKLogDisplay)();
    double v35 = [v34 autorelease];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      id v36 = sub_100018F98(v31);
      id v37 = [v36 autorelease];
      BOOL v38 = sub_100018F98(v33);
      id v39 = v38;
      *(_DWORD *)buf = 138543618;
      *(void *)v73 = v37;
      *(_WORD *)&v73[8] = 2114;
      double v74 = v39;
      _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "StartWindowServer: digitizerToPanelRotation=%{public}@ layoutRotation=%{public}@",  buf,  0x16u);
    }

    id v40 = [v17 touchScales];
    double v43 = 1.0 - v42;
    if ((_DWORD)v31 == 1) {
      double v44 = 1.0 - v42;
    }
    else {
      double v44 = 0.0;
    }
    if ((_DWORD)v31 == 1) {
      double v45 = v42;
    }
    else {
      double v45 = v41;
    }
    if ((_DWORD)v31 == 1) {
      double v46 = v41;
    }
    else {
      double v46 = v42;
    }
    if ((_DWORD)v31 == 2) {
      double v44 = 1.0 - v41;
    }
    else {
      double v43 = 0.0;
    }
    if ((_DWORD)v31 == 2)
    {
      double v45 = v41;
      double v46 = v42;
    }

    if ((_DWORD)v31 == 3) {
      double v47 = 0.0;
    }
    else {
      double v47 = v44;
    }
    if ((_DWORD)v31 == 3) {
      double v48 = 1.0 - v41;
    }
    else {
      double v48 = v43;
    }
    if ((_DWORD)v31 == 3) {
      double v49 = v42;
    }
    else {
      double v49 = v45;
    }
    if ((_DWORD)v31 == 3) {
      double v50 = v41;
    }
    else {
      double v50 = v46;
    }
    uint64_t v51 = BKLogDisplay(v40);
    os_log_s *v52 = v51;
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      v77.width = v20;
      v77.height = v22;
      __int128 v53 = NSStringFromSize(v77);
      __int128 v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
      __int128 v55 = (void *)[NSNumber numberWithDouble:v23];
      *(_DWORD *)buf = 138543618;
      *(void *)v73 = v54;
      *(_WORD *)&v73[8] = 2114;
      double v74 = v55;
      _os_log_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEFAULT,  "StartWindowServer: initial main screen size:%{public}@ scale:%{public}@",  buf,  0x16u);
    }

    id v8 = v69;

    sub_100019D08(v31, v20, v22);
    [v18 setSize:CGSizeMake(v18, v18)];
    [v18 setScale:v23];
    [v18 setNativeRotation:v31];
    [v18 setNormalizedDigitizerRect:CGRectMake(v47, v48, v49, v50)];
    BKSDefaults *v56 = [BKSDefaults localDefaults];
    __int128 v57 = (void *)[v56 forceMirroredOrientation];

    if (v57) {
      id v58 = [v17 setOrientation:v57];
    }
    uint64_t v59 = BKLogDisplay(v58);
    os_log_s *v60 = [v59 autorelease];
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      *(void *)v73 = v18;
      *(_WORD *)&v73[8] = 2114;
      double v74 = v16;
      __int16 v75 = 2114;
      id v76 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v60,  OS_LOG_TYPE_DEFAULT,  "StartWindowServer: main display info:%{public}@ -- display:%{public}@ serverDisplay:%{public}@",  buf,  0x20u);
    }
  }

  else
  {
    uint64_t v61 = ((uint64_t (*)(void))BKLogDisplay)();
    id v16 = [v61 autorelease];
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v73 = v11 == 0LL;
      *(_WORD *)&v73[4] = 1024;
      *(_DWORD *)&v73[6] = v12 == 0LL;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v16,  OS_LOG_TYPE_ERROR,  "StartWindowServer: headless (display:%{BOOL}u/server:%{BOOL}u)",  buf,  0xEu);
    }
  }

  v62 = v8;
  os_unfair_lock_assert_not_owner((os_unfair_lock_t)&unk_1000DBF58);
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000DBF58);
  uint64_t v63 = (void *)qword_1000DBF50;
  qword_1000DBF50 = (uint64_t)v62;

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000DBF58);
  BKDisplayRenderOverlayManager *v64 = [BKDisplayRenderOverlayManager sharedInstance];
  BKBootUIPresenter *v65 = [BKBootUIPresenter sharedInstance];
  id v66 = sub_100044434();
  double v67 = [v66 autorelease];
  [self _handleIapServerConnectionDied];

  double v68 = [BKTetherController sharedInstance];
  [v68 updatePreferencesIfNeeded];
}

void sub_10001B1A0()
{
  BKDisplayRenderOverlayManager *v0 = [BKDisplayRenderOverlayManager sharedInstance];
  [v0 prepareForRestart];
}

void sub_10001B1D4(__IOSurface *a1)
{
}

id *sub_10001B23C(id *a1)
{
  char v1 = a1;
  if (a1)
  {
    id v2 = [a1[4] count];
    if (v2)
    {
      if (v2 == (id)1)
      {
        id v3 = [v1[4] anyObject];
        uint64_t v4 = (__CFString *)[v3 description];
      }

      else
      {
        uint64_t v4 = [v1[4] bs_map:&stru_1000B5FE8];
      }
    }

    else
    {
      uint64_t v4 = @"<none>";
    }

    [NSDate timeIntervalSinceReferenceDate];
    double v6 = v5 - *((double *)v1 + 5);
    if (v6 < 0.001) {
      double v6 = 0.0;
    }
    char v1 = [NSString stringWithFormat:@"firstDown:%.3gs ago b%ue%uu%u destinations:%@", *(void *)&v6, *((unsigned __int8 *)v1 + 8), *((unsigned __int8 *)v1 + 9), *((unsigned __int8 *)v1 + 10), v4];
  }

  return v1;
}

id sub_10001B32C(id a1, BKSHIDEventDeferringResolution *a2)
{
  return [BKSHIDEventDeferringResolution description];
}

LABEL_4:
  [CATransaction activate];
  int v12 = [CALayer layer];
  uint64_t v13 = v12;
  __int16 v14 = v88 & 0xFD;
  if (v14 == 1) {
    unsigned int v15 = v90;
  }
  else {
    unsigned int v15 = v91;
  }
  if (v14 == 1) {
    id v16 = v91;
  }
  else {
    id v16 = v90;
  }
  [v12 setFrame:CGRectMake(0.0, 0.0, v15, v16)];
  [v13 setContents:self->_imageRef];
  id v17 = [BKDisplayRenderOverlay name];
  NSString *v18 = [NSString stringWithFormat:@"BKDisplayRenderOverlayImage:%@", v17];
  [v13 setName:v18];

  [v13 setHidden:0LL];
  double v19 = [BSColor blackColor];
  [v13 setBackgroundColor:[v19 CGColor]];

  CGFloat v20 = [NSMutableDictionary dictionary];
  [v20 setObject:kCFBooleanTrue forKey:kCAContextDisableGroupOpacity];
  [v20 setObject:kCFBooleanTrue forKey:kCAContextIgnoresHitTest];
  [v20 setObject:kCFBooleanTrue forKey:kCAContextDisplayable];
  [v20 setObject:kCFBooleanTrue forKey:kCAContextSecure];
  double v21 = (void *)[v10 name];
  if (v21) {
    [v20 setObject:v21 forKey:kCAContextDisplayName];
  }
  CGFloat v22 = [CAContext remoteContextWithOptions:v20];
  context = self->_context;
  self->_context = v22;

  id v24 = self->_context;
  [self level];
  [v24 setLevel:];
  [self->_context setLayer:v13];
  if (v6)
  {
    double v25 = [self _animationForKeyPath:@"opacity" withSettings:v6];
    [v25 setFromValue:&off_1000C0578];
    [v25 setToValue:&off_1000C0588];
    [v13 addAnimation:v25 forKey:@"opacity"];
  }

  uint64_t v26 = 1;
LABEL_17:

  return v26;
}

  *(NDR_record_t *)(a2 + 24) = v4;
}

id sub_10001C898(uint64_t a1)
{
  return sub_100017F74( *(void *)(*(void *)(a1 + 32) + 16LL),  *(unsigned __int16 *)(*(void *)(a1 + 32) + 8LL),  *(unsigned __int16 *)(*(void *)(a1 + 32) + 10LL),  *(void **)(a1 + 40));
}

void sub_10001C9A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10001CA5C(uint64_t a1)
{
  id result =  [*(id *)(a1 + 32) appendInteger:*(void *)(*(void *)(a1 + 40) + 128) withName:@"generation"];
  for (uint64_t i = 2LL; i != 32; ++i)
  {
    int v4 = *(_DWORD *)(*(void *)(a1 + 40) + 4 * i);
    if (v4)
    {
      double v5 = *(void **)(a1 + 32);
      void v6[4] = i - 2;
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472LL;
      void v7[2] = sub_10001CB3C;
      v7[3] = &unk_1000B6008;
      int v8 = v4;
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472LL;
      _DWORD v6[2] = sub_10001CB6C;
      v6[3] = &unk_1000B6028;
      id result = [v5 appendCustomFormatForValue:v7 withCustomFormatForName:v6];
    }
  }

  return result;
}

id sub_10001CB3C(uint64_t a1, void *a2)
{
  return [a2 appendFormat:@"%X" withInt:*(unsigned int *)(a1 + 32)];
}

id sub_10001CB6C(uint64_t a1, void *a2)
{
  return [a2 appendFormat:@"%d" : *(void *)(a1 + 32)];
}

uint64_t sub_10001CBE4(uint64_t a1, uint64_t a2)
{
  if (a2 >= 30)
  {
    int v4 = [NSString stringWithFormat:@"%d >= 32", a2];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      double v5 = NSStringFromSelector("updateMaskForPathIndex:");
      id v6 = v5;
      int v8 = [a1 class];
      id v9 = NSStringFromClass(v8);
      double v10 = [v9 doubleValue];
      *(_DWORD *)buf = 138544642;
      id v12 = v6;
      __int16 v13 = 2114;
      __int16 v14 = v10;
      __int16 v15 = 2048;
      uint64_t v16 = a1;
      __int16 v17 = 2114;
      __int128 v18 = @"BKDirectTouchUpdateEvents.mm";
      __int16 v19 = 1024;
      int v20 = 76;
      __int16 v21 = 2114;
      CGFloat v22 = v4;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
    }

    _bs_set_crash_log_message([v4 UTF8String]);
    __break(0);
    JUMPOUT(0x10001CD40LL);
  }

  return *(unsigned int *)(a1 + 4 * a2 + 8);
}

void sub_10001CD48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10001CD74(uint64_t result, int a2, uint64_t a3)
{
  uint64_t v3 = result;
  if (a3 >= 30)
  {
    int v4 = [NSString stringWithFormat:@"%d >= 32" a3];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      double v5 = NSStringFromSelector("setUpdateMask:forPathIndex:");
      id v6 = v5;
      int v8 = [v3 class];
      id v9 = NSStringFromClass(v8);
      double v10 = [v9 doubleValue];
      *(_DWORD *)buf = 138544642;
      id v12 = v6;
      __int16 v13 = 2114;
      __int16 v14 = v10;
      __int16 v15 = 2048;
      uint64_t v16 = v3;
      __int16 v17 = 2114;
      __int128 v18 = @"BKDirectTouchUpdateEvents.mm";
      __int16 v19 = 1024;
      int v20 = 81;
      __int16 v21 = 2114;
      CGFloat v22 = v4;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
    }

    _bs_set_crash_log_message([v4 UTF8String]);
    __break(0);
    JUMPOUT(0x10001CED0LL);
  }

  *(_DWORD *)(result + 4 * a3 + _Block_object_dispose(va, 8) = a2;
  return result;
}

void sub_10001CED8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *sub_10001CF04(uint64_t a1, uint64_t a2)
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v3 = *(id *)(a1 + 8);
  id v4 = [v3 countByEnumeratingWithState:v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v13;
    do
    {
      id v6 = 0LL;
      do
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)v6);
        if (v7) {
          uint64_t v8 = v7[16];
        }
        else {
          uint64_t v8 = 0LL;
        }
        if (v8 == a2)
        {
          double v10 = v7;
          goto LABEL_15;
        }

        id v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v9 = [v3 countByEnumeratingWithState:v12 objects:v16 count:16];
      id v4 = v9;
    }

    while (v9);
  }

  double v10 = 0LL;
LABEL_15:

  return v10;
}

void sub_10001D01C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10001D03C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (uint64_t)[*(id *)(a1 + 8) count];
  if (v4 < 1)
  {
LABEL_9:
    uint64_t v8 = 0LL;
  }

  else
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0LL;
    while (1)
    {
      uint64_t v7 = (void *)[*(id *)(a1 + 8) objectAtIndex:v6];
      uint64_t v8 = v7;
      uint64_t v9 = v7 ? v7[16] : 0LL;
      if (v9 == a2) {
        break;
      }

      if (v5 == ++v6) {
        goto LABEL_9;
      }
    }

    [*(id *)(a1 + 8) removeObjectAtIndex:v6];
  }

  return v8;
}

void sub_10001D0DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10001D0EC(uint64_t a1)
{
  if (a1)
  {
    id v2 = *(id *)(a1 + 16);
    id v3 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0LL;
  }

  else
  {
    id v2 = 0LL;
  }

  return v2;
}

uint64_t sub_10001D130(uint64_t a1)
{
  if (!a1)
  {
    id v2 = [NSString stringWithFormat:@"passing a NULL IOHIDEventRef is not recommended"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      id v3 = [NSString stringWithUTF8String:CFIndex BKDigitizerUpdateGenerationCount(IOHIDEventRef)];
      int v4 = 138544130;
      uint64_t v5 = v3;
      __int16 v6 = 2114;
      uint64_t v7 = @"BKDirectTouchUpdateEvents.mm";
      __int16 v8 = 1024;
      int v9 = 174;
      __int16 v10 = 2114;
      id v11 = v2;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ (%{public}@:%i) : %{public}@",  (uint8_t *)&v4,  0x26u);
    }

    _bs_set_crash_log_message([v2 UTF8String]);
    __break(0);
    JUMPOUT(0x10001D248LL);
  }

  return IOHIDEventGetIntegerValue(a1, 720923LL);
}

void sub_10001D250(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

const __CFArray **sub_10001D26C(const __CFArray **a1, uint64_t a2)
{
  *a1 = 0LL;
  a1[1] = 0LL;
  a1[2] = 0LL;
  if (a2)
  {
    uint64_t Children = (const __CFArray *)IOHIDEventGetChildren(a2);
    *a1 = Children;
    if (Children) {
      a1[2] = (const __CFArray *)CFArrayGetCount(Children);
    }
  }

  return a1;
}

unint64_t sub_10001D2B0(unint64_t result)
{
  char v1 = (void *)result;
  CFIndex v2 = *(void *)(result + 16);
  if (v2
    && (CFIndex v3 = *(void *)(result + 8), v3 < v2)
    && (id result = (unint64_t)CFArrayGetValueAtIndex(*(CFArrayRef *)result, v3)) != 0)
  {
    unint64_t v4 = result;
    ++v1[1];
    uint64_t Type = IOHIDEventGetType();
    if ((_DWORD)Type == 1)
    {
LABEL_16:
      v1[3] = 0LL;
      v1[4] = 0x7FFFFFFFFFFFFFFFLL;
      return sub_10001D2B0(v1);
    }

    uint64_t v6 = Type;
    if ((_DWORD)Type != 11)
    {
      uint64_t v11 = BKLogTouchEvents();
      int v9 = [v11 autorelease];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v13 = 136446210;
        uint64_t TypeString = IOHIDEventGetTypeString(v6);
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "skipping subevent of type %{public}s",  (uint8_t *)&v13,  0xCu);
      }

      goto LABEL_15;
    }

    id result = IOHIDEventGetIntegerValue(v4, 720901LL);
    int v7 = result;
    if ((result & 0x8000000000000000LL) != 0)
    {
      uint64_t v12 = BKLogTouchEvents();
      int v9 = (os_log_s *)v12;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v13 = 67109120;
        LODWORD(TypeString) = v7;
        __int16 v10 = "%d < 0";
        goto LABEL_19;
      }

LABEL_15:
      goto LABEL_16;
    }

    if (result >= 0x1E)
    {
      uint64_t v8 = BKLogTouchEvents();
      int v9 = (os_log_s *)v8;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v13 = 67109120;
        LODWORD(TypeString) = v7;
        __int16 v10 = "%d >= MAX_PATH_COUNT";
LABEL_19:
        _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v13, 8u);
        goto LABEL_15;
      }

      goto LABEL_15;
    }

    v1[3] = v4;
    v1[4] = result;
  }

  else
  {
    v1[3] = 0LL;
    v1[4] = 0x7FFFFFFFFFFFFFFFLL;
  }

  return result;
}

  os_unfair_lock_unlock(p_lock);
  return (char)v9;
}

void sub_10001D47C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10001D494(uint64_t a1)
{
  return [*(id *)(a1 + 32) isAlive];
}

uint64_t sub_10001D49C(uint64_t a1, int a2)
{
  uint64_t v4 = BKLogSystemShell();
  uint64_t v5 = (os_log_s *)v4;
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v6)
    {
      int v8 = 136446210;
      uint64_t v9 = a1;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "START WATCHDOG for %{public}s",  (uint8_t *)&v8,  0xCu);
    }

    return wd_endpoint_begin_watchdog_monitoring_for_service(a1);
  }

  else
  {
    if (v6)
    {
      int v8 = 136446210;
      uint64_t v9 = a1;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "STOP WATCHDOG for %{public}s",  (uint8_t *)&v8,  0xCu);
    }

    return wd_endpoint_disable_monitoring_for_service(a1);
  }

void sub_10001E6E0(int a1, CGContextRef c)
{
  v3[0] = xmmword_10008C3D0;
  v3[1] = unk_10008C3E0;
  CGContextSetFillColor(c, (const CGFloat *)v3);
  v4.origin.x = 0.0;
  v4.origin.y = 0.0;
  v4.size.width = 16.0;
  v4.size.height = 1.0;
  CGContextFillRect(c, v4);
  v5.origin.x = 0.0;
  v5.origin.y = 0.0;
  v5.size.width = 1.0;
  v5.size.height = 16.0;
  CGContextFillRect(c, v5);
}

CGColorRef sub_10001E980(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  if (!DeviceRGB) {
    return 0LL;
  }
  uint64_t v9 = DeviceRGB;
  components[0] = a1;
  components[1] = a2;
  components[2] = a3;
  components[3] = a4;
  CGColorRef v10 = CGColorCreate(DeviceRGB, components);
  CFRelease(v9);
  return v10;
}

void sub_10001EACC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    NSMutableArray *v2 = [[NSMutableArray alloc] init];
    CFIndex v3 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = v2;

    CGRect v4 = [NSMutableDictionary alloc] init];
    CGRect v5 = *(void **)(a1 + 8);
    *(void *)(a1 + _Block_object_dispose(va, 8) = v4;
  }

void sub_10001EB28(uint64_t a1, __IOHIDEvent *a2, void *a3, void *a4)
{
  if (a1)
  {
    int v7 = a4;
    context = a3;
    sub_10001EACC(a1);
    BKHIDCollectedEvent *v9 = [[BKHIDCollectedEvent alloc] init];
    __int128 v18 = v9;
    if (v9)
    {
      CGColorRef v10 = v9;
      event = v9->_event;
      if (event != a2)
      {
        if (event) {
          CFRelease(event);
        }
        uint64_t v12 = (__IOHIDEvent *)CFRetain(a2);
        CGColorRef v10 = v18;
        v18->_event = v12;
      }

      [v10 setAttributes:a3];

      int v13 = v7;
      context = v18->_context;
      v18->_context = (BKCAContextDestination *)v13;
    }

    if (v7) {
      uint64_t v14 = v7[3];
    }
    else {
      uint64_t v14 = 0LL;
    }

    __int128 v15 = [NSNumber numberWithUnsignedInt:v14];
    uint64_t v16 = (void *)[*(id *)(a1 + 8) objectForKeyedSubscript:v15];
    NSNumber *v17 = [NSNumber numberWithInteger:([v16 integerValue] + 1)];
    [*(id *)(a1 + 8) setObject:v17 forKeyedSubscript:v15];

    [*(id *)(a1 + 16) addObject:v18];
  }

void sub_10001EC6C(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v13 = a3;
  BOOL v6 = a4;
  int v7 = v6;
  if (v6) {
    uint64_t v8 = v6[3];
  }
  else {
    uint64_t v8 = 0LL;
  }
  uint64_t v9 = [NSNumber numberWithUnsignedInt:v8];
  CGColorRef v10 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:v9];
  uint64_t v11 = (uint64_t)[v10 integerValue];

  if (v11 >= 2)
  {
    uint64_t v12 = [NSNumber numberWithInteger:v11 - 1];
    [*(id *)(*(void *)(a1 + 32) + 8) setObject:v12 forKeyedSubscript:v9];

    [v13 setOptions:[v13 options] | 0x200];
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_10001ED74(uint64_t a1, void *a2)
{
  CFIndex v3 = a2;
  if (a1)
  {
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    id v4 = *(id *)(a1 + 16);
    id v5 = [v4 countByEnumeratingWithState:v14 objects:v18 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v15;
      do
      {
        uint64_t v8 = 0LL;
        do
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)v8);
          if (v9)
          {
            uint64_t v10 = *(void *)(v9 + 8);
            id v11 = *(id *)(v9 + 16);
            uint64_t v12 = *(void *)(v9 + 24);
          }

          else
          {
            id v11 = 0LL;
            uint64_t v10 = 0LL;
            uint64_t v12 = 0LL;
          }

          v3[2](v3, v10, v11, v12);

          uint64_t v8 = (char *)v8 + 1;
        }

        while (v6 != v8);
        id v13 = [v4 countByEnumeratingWithState:v14 objects:v18 count:16];
        id v6 = v13;
      }

      while (v13);
    }
  }
}

uint64_t sub_10001EEBC(uint64_t a1, char a2, char a3, uint64_t a4)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  _DWORD v5[2] = sub_10001EF44;
  v5[3] = &unk_1000B60B0;
  void v5[4] = a1;
  char v6 = a2;
  char v7 = a3;
  sub_10001EF44((uint64_t)v5);
  return 0LL;
}

void sub_10001EF44(uint64_t a1)
{
  if (**(_BYTE **)(a1 + 32)) {
    CFIndex v2 = [NSString stringWithUTF8String:];
  }
  else {
    CFIndex v2 = 0LL;
  }
  int v3 = *(unsigned __int8 *)(a1 + 40);
  int v4 = *(unsigned __int8 *)(a1 + 41);
  id v22 = v2;
  uint64_t v5 = sub_1000194E4(v22);
  if ((_DWORD)v5)
  {
    uint64_t v6 = BKLogDisplay(v5);
    char v7 = [v6 autorelease];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = "Set";
      if (!v4) {
        uint64_t v8 = "Notify";
      }
      uint64_t v9 = @"YES";
      if (!v3) {
        uint64_t v9 = @"NO";
      }
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = v8;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Blanked: %@", buf, 0x16u);
    }

    if (v4)
    {
      id v10 = sub_1000195F8();
      v11 = v10;
      [v11 setBlanked:v3 != 0];
    }

    uint64_t v12 = [BKDisplayController sharedInstance];
    sub_100007A38((uint64_t)v12, 0LL, v3 != 0);

    if (qword_1000DBF78 != -1) {
      dispatch_once(&qword_1000DBF78, &stru_1000B5F88);
    }
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&uint8_t buf[8] = 3221225472LL;
    *(void *)&uint8_t buf[16] = sub_100019EBC;
    id v24 = (const __CFString *)&unk_1000B7E00;
    BOOL v25 = v3 != 0;
    dispatch_async((dispatch_queue_t)qword_1000DBF70, buf);
  }

  else
  {
    uint64_t v13 = BKLogDisplay(v5);
    os_log_s *v14 = [v13 autorelease];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v15 = "Set";
      if (!v4) {
        __int128 v15 = "Notify";
      }
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = v15;
      if (v3) {
        __int128 v16 = @"YES";
      }
      else {
        __int128 v16 = @"NO";
      }
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v22;
      *(_WORD *)&buf[22] = 2112;
      id v24 = v16;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s %{public}@ Blanked: %@", buf, 0x20u);
    }

    id v17 = sub_1000193D4(v22, (uint64_t)"BKDisplayNotifySetDisplayBlanked");
    __int128 v18 = [v17 autorelease];
    __int16 v19 = v18;
    if (v4) {
      [v18 setBlanked:v3 != 0];
    }
    BOOL v20 = v3 != 0;
    BKDisplayController *v21 = [BKDisplayController sharedInstance];
    sub_100007A38((uint64_t)v21, v22, v20);
  }
}

uint64_t sub_10001F22C(uint64_t a1, uint64_t a2)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  _OWORD v3[2] = sub_10001F2A8;
  v3[3] = &unk_1000B7108;
  v3[4] = a1;
  sub_10001F2A8((uint64_t)v3);
  return 0LL;
}

void sub_10001F2A8(uint64_t a1)
{
  if (**(_BYTE **)(a1 + 32)) {
    char v1 = [NSString stringWithUTF8String:];
  }
  else {
    char v1 = 0LL;
  }
  uint64_t v8 = v1;
  id v2 = sub_1000193D4(v8, (uint64_t)"BKDisplayWillUnblank");
  uint64_t v3 = v2;
  int v4 = (void *)v3;
  if (v3)
  {
    uint64_t v5 = BKLogDisplay(v3);
    uint64_t v6 = v5;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      char v7 = @"Main";
      if (v8) {
        char v7 = v8;
      }
      *(_DWORD *)buf = 138543362;
      id v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%{public}@ will unblank", buf, 0xCu);
    }

    [v4 willUnblank];
  }
}

uint64_t sub_10001F3B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10001F440;
  v4[3] = &unk_1000B60D0;
  v4[4] = a1;
  void v4[5] = a2;
  if (!sub_1000139E4( (uint64_t)"_BKDisplayXXGetBlankingRemovesPower",  BKDisableDisplaysEntitlement,  BKBackBoardClientEntitlement,  a3)) {
    return 5LL;
  }
  sub_10001F440((uint64_t)v4);
  return 0LL;
}

void sub_10001F440(uint64_t a1)
{
  if (**(_BYTE **)(a1 + 32)) {
    id v2 = [NSString stringWithUTF8String:];
  }
  else {
    id v2 = 0LL;
  }
  **(_BYTE **)(a1 + 40) = 0;
}

uint64_t sub_10001F488(uint64_t a1, char a2, uint64_t a3)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10001F518;
  v4[3] = &unk_1000B60F0;
  v4[4] = a1;
  char v5 = a2;
  if (!sub_1000139E4( (uint64_t)"_BKDisplayXXSetBlankingRemovesPower",  BKDisableDisplaysEntitlement,  BKBackBoardClientEntitlement,  a3)) {
    return 5LL;
  }
  sub_10001F518((uint64_t)v4);
  return 0LL;
}

void sub_10001F518(uint64_t a1)
{
  uint64_t v1 = a1;
  if (**(_BYTE **)(a1 + 32))
  {
    a1 = [NSString stringWithUTF8String:];
    id v5 = (id)a1;
  }

  else
  {
    id v5 = 0LL;
  }

  int v2 = *(unsigned __int8 *)(v1 + 40);
  uint64_t v3 = BKLogDisplay(a1);
  int v4 = [v3 autorelease];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v7 = v2 != 0;
    _os_log_error_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "unsupported on this platform: BKDisplaySetBlankingRemovesPower setBlankingRemovesPower:%{BOOL}u",  buf,  8u);
  }
}

uint64_t sub_10001F5F4(_BYTE *a1, void *a2, _DWORD *a3, uint64_t a4)
{
  if (sub_1000138EC((uint64_t)"_BKDisplayXXGetSystemIdentifiers", BKBackBoardClientEntitlement, a4))
  {
    if (*a1) {
      BOOL v7 = [NSString stringWithUTF8String:a1];
    }
    else {
      BOOL v7 = 0LL;
    }
    id v9 = sub_1000193D4(v7, (uint64_t)"BKDisplayGetSystemIdentifiers");
    id v10 = [v9 autorelease];
    id v11 = [v10 systemIdentifiers];

    if (v11)
    {
      uint64_t v13 = [v11 bs_secureEncoded];
      if (v13)
      {
        __int128 v14 = v13;
        *a2 = [v13 bs_bytesForMIG];
        *a3 = [v14 bs_lengthForMIG];

        uint64_t v8 = 0LL;
LABEL_14:

        return v8;
      }

      uint64_t v17 = BKLogDisplay(0LL);
      os_log_s *v16 = [v17 autorelease];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "GetSystemIdentifiers failed to encode system identifiers",  buf,  2u);
      }
    }

    else
    {
      uint64_t v15 = BKLogDisplay(v12);
      os_log_s *v16 = [v15 autorelease];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int16 v19 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "GetSystemIdentifiers: no active system identifiers",  v19,  2u);
      }
    }

    uint64_t v8 = 5LL;
    goto LABEL_14;
  }

  return 5LL;
}

uint64_t sub_10001F77C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  _DWORD v5[2] = sub_10001F80C;
  v5[3] = &unk_1000B6110;
  int v6 = a3;
  void v5[4] = a1;
  void v5[5] = a2;
  if (!sub_1000139E4( (uint64_t)"_BKDisplayXXSetSystemIdentifiers",  BKDisableDisplaysEntitlement,  BKBackBoardClientEntitlement,  a4)) {
    return 5LL;
  }
  sub_10001F80C((uint64_t)v5);
  return 0LL;
}

void sub_10001F80C(uint64_t a1)
{
  if (**(_BYTE **)(a1 + 32)) {
    int v2 = [NSString stringWithUTF8String:];
  }
  else {
    int v2 = 0LL;
  }
  if (!*(_DWORD *)(a1 + 48) || !*(void *)(a1 + 40))
  {
    id v9 = 0LL;
LABEL_31:
    id v9 = v9;
    id v26 = sub_1000193D4(v2, (uint64_t)"BKDisplaySetSystemIdentifiers");
    id v27 = v26;
    [v27 setSystemIdentifiers:v9];

    goto LABEL_32;
  }

  uint64_t v3 = [NSData initWithBytesNoCopy:*(void *)(a1 + 40) length:*(unsigned int *)(a1 + 48) freeWhenDone:0LL];
  NSSet *v5 = [NSSet class];
  BOOL v7 = [NSSet setWithObjects:v5, [NSString stringWithUTF8String:v6], nil];
  uint64_t v8 = v7;
  id v9 = [NSObject bs_secureObjectFromData:v3 ofClasses:v8];

  NSSet *v11 = [NSSet class];
  uint64_t isKindOfClass = objc_opt_isKindOfClass(v9, v11);
  BOOL v13 = 0;
  if ((isKindOfClass & 1) != 0)
  {
    uint64_t isKindOfClass = (uint64_t)[v9 count];
    BOOL v13 = isKindOfClass != 0;
    if (isKindOfClass)
    {
      __int128 v33 = 0u;
      __int128 v34 = 0u;
      __int128 v31 = 0u;
      __int128 v32 = 0u;
      id v14 = v9;
      id v15 = [v14 countByEnumeratingWithState:v31 objects:v35 count:16];
      if (v15)
      {
        id v17 = v15;
        uint64_t v18 = *(void *)v32;
        uint64_t v29 = v3;
        BOOL v28 = v13;
        while (2)
        {
          for (uint64_t i = 0LL; i != v17; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v32 != v18) {
              objc_enumerationMutation(v14);
            }
            BOOL v20 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)i);
            uint64_t v21 = [NSString class];
            id v22 = v20;
            double v23 = v22;
            if (!v21 || (objc_opt_isKindOfClass(v22, v21) & 1) == 0)
            {

LABEL_23:
              BOOL v13 = 0;
              uint64_t v3 = v29;
              goto LABEL_24;
            }

            if (!v23) {
              goto LABEL_23;
            }
          }

          id v17 = [v14 countByEnumeratingWithState:&v31 objects:v35 count:16];
          uint64_t v3 = v29;
          BOOL v13 = v28;
          if (v17) {
            continue;
          }
          break;
        }
      }

      if (v14)
      {
        BOOL v13 = 1;
        goto LABEL_27;
      }
    }

    else
    {
      BOOL v13 = 0;
    }
  }

LABEL_24:
  uint64_t v24 = BKLogDisplay(isKindOfClass);
  BOOL v25 = [os_log_s autorelease];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "Error unarchiving system identifiers",  buf,  2u);
  }

LABEL_27:
  if (v9 && v13 || !*(_DWORD *)(a1 + 48) || !*(void *)(a1 + 40)) {
    goto LABEL_31;
  }
LABEL_32:
}

        goto LABEL_25;
      }

  return v25;
}

uint64_t sub_10001FAE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10001FB74;
  v4[3] = &unk_1000B60D0;
  v4[4] = a1;
  void v4[5] = a2;
  if (!sub_1000139E4( (uint64_t)"_BKDisplayXXIsFlipBookEnabled",  BKDisableDisplaysEntitlement,  BKBackBoardClientEntitlement,  a3)) {
    return 5LL;
  }
  sub_10001FB74((uint64_t)v4);
  return 0LL;
}

void sub_10001FB74(uint64_t a1)
{
  if (**(_BYTE **)(a1 + 32)) {
    int v2 = [NSString stringWithUTF8String:];
  }
  else {
    int v2 = 0LL;
  }
  id v7 = v2;
  id v3 = sub_1000193D4(v2, (uint64_t)"BKDisplayIsFlipBookEnabled");
  uint64_t v4 = [v3 autorelease];
  uint64_t v5 = v4;
  if (v4) {
    unsigned __int8 v6 = [v4 isFlipBookEnabled];
  }
  else {
    unsigned __int8 v6 = 0;
  }

  **(_BYTE **)(a1 + 40) = v6;
}

uint64_t sub_10001FC04(uint64_t a1, char a2, uint64_t a3)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10001FC94;
  v4[3] = &unk_1000B60F0;
  v4[4] = a1;
  char v5 = a2;
  if (!sub_1000139E4( (uint64_t)"_BKDisplayXXSetFlipBookEnabled",  BKDisableDisplaysEntitlement,  BKBackBoardClientEntitlement,  a3)) {
    return 5LL;
  }
  sub_10001FC94((uint64_t)v4);
  return 0LL;
}

void sub_10001FC94(uint64_t a1)
{
  if (**(_BYTE **)(a1 + 32)) {
    int v2 = [NSString stringWithUTF8String:];
  }
  else {
    int v2 = 0LL;
  }
  int v3 = *(unsigned __int8 *)(a1 + 40);
  id v8 = v2;
  id v4 = sub_1000193D4(v2, (uint64_t)"BKDisplaySetFlipBookEnabled");
  char v5 = [v4 autorelease];
  uint64_t v6 = BKLogDisplay(v5);
  id v7 = [os_log_s logWithName:v6];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v10 = v3 != 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "BKDisplaySetFlipBookEnabled setFlipBookEnabled:%{BOOL}u",  buf,  8u);
  }

  [v5 setFlipBookEnabled:v3 != 0];
}

uint64_t sub_10001FDA0(uint64_t a1, int a2, int a3, uint64_t a4)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  _DWORD v5[2] = sub_10001FE30;
  v5[3] = &unk_1000B60D0;
  void v5[4] = a1;
  int v6 = a2;
  int v7 = a3;
  if (!sub_1000139E4( (uint64_t)"_BKDisplayXXSetCalibrationPhase",  BKDisableDisplaysEntitlement,  BKBackBoardClientEntitlement,  a4)) {
    return 5LL;
  }
  sub_10001FE30((uint64_t)v5);
  return 0LL;
}

void sub_10001FE30(uint64_t a1)
{
  if (**(_BYTE **)(a1 + 32)) {
    uint64_t v1 = [NSString stringWithUTF8String:];
  }
  else {
    uint64_t v1 = 0LL;
  }
}

uint64_t sub_10001FE64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10001FEF0;
  v4[3] = &unk_1000B60D0;
  v4[4] = a1;
  void v4[5] = a2;
  if (!sub_1000139E4( (uint64_t)"_BKDisplayXXIsFlipBookSuppressed",  BKDisableDisplaysEntitlement,  BKBackBoardClientEntitlement,  a3)) {
    return 5LL;
  }
  sub_10001FEF0((uint64_t)v4);
  return 0LL;
}

void sub_10001FEF0(uint64_t a1)
{
  if (**(_BYTE **)(a1 + 32)) {
    NSString *v2 = [NSString stringWithUTF8String:];
  }
  else {
    int v2 = 0LL;
  }
  **(_BYTE **)(a1 + 40) = 0;
}

uint64_t sub_10001FF38(uint64_t a1, char a2, uint64_t a3)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10001FFC8;
  v4[3] = &unk_1000B60F0;
  v4[4] = a1;
  char v5 = a2;
  if (!sub_1000139E4( (uint64_t)"_BKDisplayXXSetFlipBookSuppressed",  BKDisableDisplaysEntitlement,  BKBackBoardClientEntitlement,  a3)) {
    return 5LL;
  }
  sub_10001FFC8((uint64_t)v4);
  return 0LL;
}

void sub_10001FFC8(uint64_t a1)
{
  if (**(_BYTE **)(a1 + 32)) {
    NSString *v1 = [NSString stringWithUTF8String:];
  }
  else {
    uint64_t v1 = 0LL;
  }
}

uint64_t sub_10001FFFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100020088;
  v4[3] = &unk_1000B60D0;
  v4[4] = a1;
  void v4[5] = a2;
  if (!sub_1000139E4( (uint64_t)"_BKDisplayXXIsDisabled",  BKDisableDisplaysEntitlement,  BKBackBoardClientEntitlement,  a3)) {
    return 5LL;
  }
  sub_100020088((uint64_t)v4);
  return 0LL;
}

void sub_100020088(uint64_t a1)
{
  if (**(_BYTE **)(a1 + 32)) {
    NSString *v2 = [NSString stringWithUTF8String:];
  }
  else {
    int v2 = 0LL;
  }
  id v7 = v2;
  id v3 = sub_1000193D4(v2, (uint64_t)"BKDisplayIsDisabled");
  v4 = v3;
  char v5 = v4;
  if (v4) {
    unsigned __int8 v6 = [v4 disabled];
  }
  else {
    unsigned __int8 v6 = 1;
  }

  **(_BYTE **)(a1 + 40) = v6;
}

uint64_t sub_100020118(uint64_t a1, char a2, uint64_t a3, __int128 *a4)
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  _DWORD v6[2] = sub_1000201B4;
  v6[3] = &unk_1000B6130;
  void v6[4] = a1;
  void v6[5] = a3;
  char v9 = a2;
  __int128 v4 = a4[1];
  __int128 v7 = *a4;
  __int128 v8 = v4;
  if (!sub_1000139E4( (uint64_t)"_BKDisplayXXSetDisabled",  BKDisableDisplaysEntitlement,  BKBackBoardClientEntitlement,  (uint64_t)a4)) {
    return 5LL;
  }
  sub_1000201B4((uint64_t)v6);
  return 0LL;
}

void sub_1000201B4(uint64_t a1)
{
  if (**(_BYTE **)(a1 + 32)) {
    int v2 = [NSString stringWithUTF8String:];
  }
  else {
    int v2 = 0LL;
  }
  int v3 = *(unsigned __int8 *)(a1 + 80);
  __int128 v4 = *(_OWORD *)(a1 + 64);
  __int128 v11 = *(_OWORD *)(a1 + 48);
  __int128 v12 = v4;
  char v5 = (void *)BSVersionedPIDForAuditToken(&v11);
  id v6 = v2;
  uint64_t v7 = [BKDisplayDisabledAssertions disabledAssertions];
  *(void *)&__int128 v11 = _NSConcreteStackBlock;
  *((void *)&v11 + 1) = 3221225472LL;
  *(void *)&__int128 v12 = sub_100019F94;
  *((void *)&v12 + 1) = &unk_1000B7108;
  uint64_t v13 = v7;
  if (qword_1000DBF38 != -1) {
    dispatch_once(&qword_1000DBF38, &v11);
  }
  BOOL v8 = v3 != 0;
  char v9 = (id *)(id)qword_1000DBF40;
  BOOL v10 = sub_10001A0B0(v9, v6, v8, v5);

  **(_BYTE **)(a1 + 40) = v10;
}

uint64_t sub_1000202D4(uint64_t a1, char a2, __int128 *a3)
{
  v5[1] = 3221225472LL;
  __int128 v3 = a3[1];
  __int128 v6 = *a3;
  v5[0] = _NSConcreteStackBlock;
  _DWORD v5[2] = sub_10002035C;
  v5[3] = &unk_1000B6150;
  void v5[4] = a1;
  char v8 = a2;
  __int128 v7 = v3;
  sub_10002035C((uint64_t)v5);
  return 0LL;
}

void sub_10002035C(uint64_t a1)
{
  if (**(_BYTE **)(a1 + 32))
  {
    unint64_t v2 = *(unsigned __int8 *)(a1 + 72);
    if (v2 >= 4)
    {
      uint64_t v11 = BKLogDisplay(a1);
      os_log_s *v12 = [v11 autorelease];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v13 = *(unsigned __int8 *)(a1 + 72);
        LODWORD(block[0]) = 67109120;
        HIDWORD(block[0]) = v13;
        _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "SetCloneMirroringModeForDestinationDisplay: unknown mode value %X",  (uint8_t *)block,  8u);
      }
    }

    else
    {
      int v3 = BSPIDForAuditToken(a1 + 40);
      __int128 v4 = [NSString stringWithUTF8String:*(void *)(a1 + 32)];
      id v5 = sub_100044434();
      __int128 v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      id v7 = v4;
      id v14 = v7;
      if (v6)
      {
        char v8 = (dispatch_queue_s *)v6[1];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_1000444F8;
        block[3] = &unk_1000B6F68;
        void block[4] = v6;
        unint64_t v17 = v2;
        id v16 = v7;
        int v18 = v3;
        dispatch_async(v8, block);

        id v7 = v14;
      }
    }
  }

  else
  {
    uint64_t v9 = BKLogDisplay(a1);
    BOOL v10 = [v9 autorelease];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(block[0]) = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "SetCloneMirroringModeForDestinationDisplay: empty displayUUID not allowed",  (uint8_t *)block,  2u);
    }
  }

uint64_t sub_10002054C(uint64_t a1, __int128 *a2)
{
  v4[1] = 3221225472LL;
  __int128 v2 = a2[1];
  __int128 v5 = *a2;
  v4[0] = _NSConcreteStackBlock;
  v4[2] = sub_1000205CC;
  v4[3] = &unk_1000B6170;
  v4[4] = a1;
  __int128 v6 = v2;
  sub_1000205CC((uint64_t)v4);
  return 0LL;
}

void sub_1000205CC(uint64_t a1)
{
  if (**(_BYTE **)(a1 + 32))
  {
    int v2 = BSPIDForAuditToken(a1 + 40);
    NSString *v3 = [NSString stringWithUTF8String:*(char *)(a1 + 32)];
    id v4 = sub_100044434();
    __int128 v5 = [v4 autorelease];
    id v9 = v3;
    if (v5)
    {
      __int128 v6 = (dispatch_queue_s *)v5[1];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100044510;
      block[3] = &unk_1000B80A8;
      void block[4] = v5;
      id v11 = v9;
      int v12 = v2;
      dispatch_async(v6, block);
    }
  }

  else
  {
    uint64_t v7 = BKLogDisplay(a1);
    char v8 = (os_log_s *)[v7 autorelease];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(block[0]) = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "RemoveCloneMirroringModeForDestinationDisplay: empty displayUUID not allowed",  (uint8_t *)block,  2u);
    }
  }

void sub_10002070C(uint64_t a1)
{
  BKTetherController *v2 = [[BKTetherController sharedInstance] autorelease];
  **(_BYTE **)(a1 + 32) = [v2 isTethered];
}

void sub_100020754(uint64_t a1)
{
  id v3 = [BKTetherController sharedInstance];
  if ([v3 isTethered])
  {
    BKSDefaults *v2 = [BKSDefaults localDefaults];
    **(_BYTE **)(a1 + 32) = [v2 ignoreTetheringPreferences] ^ 1;
  }

  else
  {
    **(_BYTE **)(a1 + 32) = 0;
  }
}

void sub_1000207CC(uint64_t a1)
{
  BKTetherController *v2 = [BKTetherController sharedInstance];
  [v2 setOrientationNotificationDisabled:*(_BYTE *)(a1 + 32) != 0];
}

void sub_100020818(uint64_t a1)
{
  BKTetherController *v2 = [BKTetherController sharedInstance];
}

void sub_100020868(uint64_t a1)
{
  BKSDefaults *v2 = [BKSDefaults localDefaults];
  uint64_t v3 = BKLogDisplay(v2);
  os_log_s *v4 = v3;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = BSDeviceOrientationDescription(*(unsigned __int8 *)(a1 + 32));
    __int128 v6 = [v5 autorelease];
    int v33 = 138543362;
    id v34 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "UpdateMirroredDisplayOrientationWithInterfaceOrientation:%{public}@ ",  (uint8_t *)&v33,  0xCu);
  }

  uint64_t v7 = [BKTetherController sharedInstance];
  unsigned int v8 = [v7 isTethered];
  unsigned int v9 = [v7 usesDisplayPortTethering];
  id v10 = [v2 isSteveNoteRotationEnabled];
  if (v8) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11 || (v10 & 1) != 0)
  {
    __int16 v19 = (void *)[v2 forceMirroredOrientation];

    if (!v19)
    {
      double v23 = [CAWindowServer serverIfRunning];
      int v13 = (void *)[v23 displays];

      if ([v13 count])
      {
        id v15 = kCAWindowServerOrientation_Portrait;
        if (*(unsigned __int8 *)(a1 + 32) - 2 <= 2)
        {
          id v24 = *(id *)*(&off_1000B61D8 + (*(_BYTE *)(a1 + 32) - 2));

          id v15 = v24;
        }

        BOOL v25 = [v13 objectAtIndex:0];
        id v26 = [v25 orientation];
        id v27 = [v26 isEqualToString:v15];
        char v28 = (char)v27;
        uint64_t v29 = BKLogDisplay(v27);
        uint64_t v30 = v29;
        BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
        if ((v28 & 1) != 0)
        {
          if (v31)
          {
            int v33 = 138543362;
            id v34 = v15;
            _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Ignoring request to update to same display interface orientation (%{public}@)",  (uint8_t *)&v33,  0xCu);
          }
        }

        else
        {
          if (v31)
          {
            int v33 = 138543618;
            id v34 = v26;
            __int16 v35 = 2114;
            *(void *)id v36 = v15;
            _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Updating external display interface orientation from %{public}@ to %{public}@",  (uint8_t *)&v33,  0x16u);
          }

          [v25 setOrientation:v15];
        }

        goto LABEL_27;
      }

      uint64_t v32 = BKLogDisplay(0LL);
      id v15 = v32;
      if (!os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT))
      {
LABEL_27:

        goto LABEL_28;
      }

      LOWORD(v33) = 0;
      id v16 = "Ignoring request to update to same display interface orientation because there are no CADisplays";
      unint64_t v17 = (os_log_s *)v15;
      uint32_t v18 = 2;
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v33, v18);
      goto LABEL_27;
    }

    uint64_t v21 = BKLogDisplay(v20);
    int v13 = [v21 autorelease];
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = BSDeviceOrientationDescription(*(unsigned __int8 *)(a1 + 32));
      id v15 = v22;
      int v33 = 138543362;
      id v34 = v15;
      id v16 = "ignoring mirrored display orientation update to %{public}@ because (forceMirroredOrientation:YES)";
      unint64_t v17 = (os_log_s *)v13;
      uint32_t v18 = 12;
      goto LABEL_13;
    }
  }

  else
  {
    uint64_t v12 = BKLogDisplay(v10);
    int v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = BSDeviceOrientationDescription(*(unsigned __int8 *)(a1 + 32));
      id v15 = [v14 autorelease];
      int v33 = 138544130;
      id v34 = v15;
      __int16 v35 = 1024;
      *(_DWORD *)id v36 = 1;
      *(_WORD *)&v36[4] = 1024;
      *(_DWORD *)&v36[6] = 1;
      __int16 v37 = 1024;
      int v38 = 0;
      id v16 = "ignoring mirrored display orientation update to %{public}@ because (tethered:%{BOOL}u displayPortTethering:%"
            "{BOOL}u stevenoteRotationEnabled:%{BOOL}u)";
      unint64_t v17 = (os_log_s *)v13;
      uint32_t v18 = 30;
      goto LABEL_13;
    }
  }

void sub_100020C24()
{
  uint64_t v0 = BKLogDisplay();
  uint64_t v1 = [v0 autorelease];
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v2 = 0;
    _os_log_error_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_ERROR,  "DisplaySetArrangement not supported on this platform",  v2,  2u);
  }
}

uint64_t sub_100020C8C(uint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5)
{
  id v9 = sub_100020DC8(a1, a2);
  id v10 = v9;
  id v11 = sub_100020E50(a3, a4);
  uint64_t v12 = v11;
  if (v10)
  {
    int v13 = (void *)[v10 displayUUID];
    id v14 = sub_100020EB4(v13);
    id v15 = v14;

    BKDisplayRenderOverlayManager *v16 = [BKDisplayRenderOverlayManager sharedInstance];
    [v16 removeOverlay:v15 withAnimationSettings:0];

    BKDisplayRenderOverlayImage *v17 = [[BKDisplayRenderOverlayImage alloc] init];
    LODWORD(v1_Block_object_dispose(va, 8) = 2139095039;
    BKDisplayRenderOverlayImage *v19 = [[BKDisplayRenderOverlayImage alloc] initWithOverlayDescriptor:v10 level:v18];
    uint64_t v20 = [BKDisplayRenderOverlayManager sharedInstance];
    unsigned int v21 = [v20 applyOverlay:v19 withAnimationSettings:v12];

    if (v21) {
      uint64_t v22 = 0LL;
    }
    else {
      uint64_t v22 = 5LL;
    }
  }

  else
  {
    uint64_t v22 = 4LL;
  }

  return v22;
}

id sub_100020DC8(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    id v2 = [NSData dataWithBytesNoCopy:a1 length:a2 freeWhenDone:0LL];
    uint64_t v3 = [BKSDisplayRenderOverlayDescriptor _classesRequiredToDecode];
    BKSDisplayRenderOverlayDescriptor *v4 = [BKSDisplayRenderOverlayDescriptor bs_secureDecodedFromData:v2 withAdditionalClasses:v3];
  }

  else
  {
    id v4 = 0LL;
  }

  return v4;
}

id sub_100020E50(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    id v2 = [NSData dataWithBytesNoCopy:a1 length:a2 freeWhenDone:0LL];
    BSAnimationSettings *v3 = [BSAnimationSettings bs_secureDecodedFromData:v2];
  }

  else
  {
    uint64_t v3 = 0LL;
  }

  return v3;
}

id sub_100020EB4(void *a1)
{
  id v1 = a1;
  BKDisplayRenderOverlayManager *v2 = [BKDisplayRenderOverlayManager sharedInstance];
  uint64_t v3 = (void *)[v2 activeOverlays];

  uint64_t v10 = 0LL;
  id v11 = v10;
  uint64_t v12 = 0x3032000000LL;
  int v13 = sub_100020FC8;
  id v14 = sub_100020FD8;
  id v15 = 0LL;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  void v7[2] = sub_100020FE0;
  v7[3] = &unk_1000B61B8;
  id v4 = v1;
  id v8 = v4;
  id v9 = v10;
  [v3 enumerateObjectsUsingBlock:v7];
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

void sub_100020FB0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_100020FC8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100020FD8(uint64_t a1)
{
}

void sub_100020FE0(uint64_t a1, void *a2, _BYTE *a3)
{
  id v9 = a2;
  if ([v9 type] == (id)1)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = (void *)[v9 descriptor];
    id v8 = [v7 displayUUID];
    LODWORD(v6) = BSEqualStrings(v6, v8);

    if ((_DWORD)v6)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
      *a3 = 1;
    }
  }
}

uint64_t sub_10002108C(uint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5)
{
  id v9 = sub_100020DC8(a1, a2);
  uint64_t v10 = [v9 autorelease];
  id v11 = sub_100020E50(a3, a4);
  uint64_t v12 = v11;
  if (v10)
  {
    int v13 = [BKDisplayRenderOverlayManager sharedInstance];
    id v14 = [v13 activeOverlayWithDescriptor:v10];
    else {
      uint64_t v15 = 5LL;
    }
  }

  else
  {
    uint64_t v15 = 4LL;
  }

  return v15;
}

uint64_t sub_10002117C(uint64_t a1, unsigned int a2, uint64_t a3)
{
  id v5 = sub_100020DC8(a1, a2);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (v6)
  {
    uint64_t v7 = [BKDisplayRenderOverlayManager sharedInstance];
    id v8 = (void *)[v7 activeOverlayWithDescriptor:v6];
    else {
      uint64_t v9 = 5LL;
    }
  }

  else
  {
    uint64_t v9 = 4LL;
  }

  return v9;
}

uint64_t sub_10002123C(_BYTE *a1, void *a2, _DWORD *a3, uint64_t a4)
{
  if (*a1) {
    uint64_t v7 = (void *)[NSString stringWithUTF8String:a1];
  }
  else {
    uint64_t v7 = 0LL;
  }
  id v9 = sub_100019878(v7);
  uint64_t v10 = [v9 autorelease];
  if (v10 && (id v11 = sub_100020EB4(v7), (v12 = (void *)objc_claimAutoreleasedReturnValue(v11)) != 0LL))
  {
    int v13 = v12;
    id v14 = [v12 descriptor];
    uint64_t v15 = [v14 bs_secureEncoded];

    if (a2 && a3)
    {
      *a2 = [v15 bs_bytesForMIG];
      *a3 = [v15 bs_lengthForMIG];
    }

    uint64_t v8 = 0LL;
  }

  else
  {
    uint64_t v8 = 5LL;
  }

  return v8;
}

uint64_t sub_10002134C(uint64_t a1, int a2, __int128 *a3)
{
  v5[1] = 3221225472LL;
  __int128 v3 = a3[1];
  __int128 v7 = *a3;
  v5[0] = _NSConcreteStackBlock;
  _DWORD v5[2] = sub_1000213D8;
  v5[3] = &unk_1000B6190;
  void v5[4] = a1;
  int v6 = a2;
  __int128 v8 = v3;
  if (!sub_1000138EC( (uint64_t)"_BKDisplayXXDismissInterstitialRenderOverlay",  BKBackBoardClientEntitlement,  (uint64_t)a3)) {
    return 5LL;
  }
  sub_1000213D8((uint64_t)v5);
  return 0LL;
}

void sub_1000213D8(uint64_t a1)
{
  id v2 = sub_100020E50(*(void *)(a1 + 32), *(_DWORD *)(a1 + 40));
  id v4 = [v2 autorelease];
  BKBootUIPresenter *v3 = [BKBootUIPresenter sharedInstance];
  [v3 dismissOverlayWithAnimationSettings:v4 requstedByPID:BSPIDForAuditToken(a1 + 44)];
}

void sub_100021444(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 32);
  BOOL v2 = *(_BYTE *)(a1 + 32) != 0;
  BKSecureDrawingMonitor *v3 = [BKSecureDrawingMonitor sharedInstance];
  [v3 setSecureModeEnabled:v2];

  uint64_t v5 = BKLogDisplay(v4);
  int v6 = [v5 autorelease];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v9[0] = 67109120;
    v9[1] = v1 != 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Setting display secure mode: %u",  (uint8_t *)v9,  8u);
  }

  id v7 = sub_1000195F8();
  __int128 v8 = [v7 autorelease];
  [v8 setSecure:v1 != 0];
}

id sub_10002153C(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = GSRegisterPurpleNamedPort(a2);
  integer_t port_info = 16;
  mach_port_set_attributes(mach_task_self_, v5, 1, &port_info, 1u);
  dispatch_workloop_t inactive = dispatch_workloop_create_inactive(a1);
  dispatch_set_qos_class_fallback(inactive, 33LL);
  dispatch_workloop_set_scheduler_priority(inactive, 53LL, 1LL);
  dispatch_activate(inactive);
  f = (void *)dispatch_mach_create_f(a1, inactive, a3, sub_100021604);

  dispatch_mach_connect(f, v5, 0LL, 0LL);
  return f;
}

void sub_100021604(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v7 = a1;
  if (a2 == 2 && (dispatch_mach_mig_demux(0LL, &v7, 1LL, v5) & 1) == 0)
  {
    msg = (mach_msg_header_t *)dispatch_mach_msg_get_msg(v5, 0LL);
    mach_msg_destroy(msg);
  }
}

void sub_10002254C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, id a40)
{
}

uint64_t sub_100022920(uint64_t a1)
{
  uint64_t v2 = BKLogAlternateSystemApp();
  os_log_s *v3 = v2;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = 134217984;
    uint64_t v11 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "launchFailed: %p", (uint8_t *)&v10, 0xCu);
  }

  [*(id *)(*(void *)(a1 + 32) + 32) invalidate];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = 0LL;

  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = 0LL;

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_100022A04(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = (dispatch_queue_s **)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v7 = WeakRetained[5];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    _OWORD v8[2] = sub_100022AA0;
    v8[3] = &unk_1000B8030;
    v8[4] = WeakRetained;
    id v9 = v4;
    dispatch_async(v7, v8);
  }
}

id sub_100022AA0(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _noteExitedWithContext:*(void *)(a1 + 40)];
}

id sub_100022AAC(uint64_t a1)
{
  id v2 =  [*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 8) withName:@"bundleID"];
  return  [*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 16) withName:@"options" skipIfNil:1];
}

void sub_1000233C4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

id sub_1000239E4(uint64_t a1)
{
  id v2 =  [*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 36) withName:@"visible"];
  return  [*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 8) withName:@"descriptor"];
}

id sub_100023A3C(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _dismissWithAnimationSettings:*(void *)(a1 + 40)];
}

id sub_100023A70(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _freeze];
}

id sub_100023A78(uint64_t a1)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) _presentWithAnimationSettings:*(void *)(a1 + 40)];
  id result = [*(id *)(a1 + 32) animates];
  if ((_DWORD)result) {
    return _[*(id *)(a1 + 32) _startAnimating];
  }
  return result;
}

id sub_100023AC8(uint64_t a1)
{
  int v1 = *(_BYTE **)(a1 + 32);
  if (v1[38]) {
    return _[v1 _startAnimating];
  }
  else {
    return [v1 _stopAnimating];
  }
}

void sub_100023D10(int a1, float a2)
{
  uint64_t v4 = kdebug_trace(730464736LL, (unint64_t)(float)(a2 * 100.0), 0LL, 0LL, 0LL);
  if (a1)
  {
    uint64_t v5 = BKLogBacklight(v4);
    uint64_t v6 = [v5 autorelease];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 134217984;
      double v16 = a2;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Update last requested backlight factor: %g permanently:YES",  (uint8_t *)&v15,  0xCu);
    }

    os_unfair_lock_lock(&stru_1000DBF90);
    dword_1000DBF94 = LODWORD(a2);
    os_unfair_lock_unlock(&stru_1000DBF90);
    BOOL v7 = a2 < 1.0 && _AXSVoiceOverTouchEnabled() == 0;
    os_unfair_lock_lock(&stru_1000DBF90);
    if (!v7 || qword_1000DBF80)
    {
      if (qword_1000DBF80) {
        char v14 = v7;
      }
      else {
        char v14 = 1;
      }
      if ((v14 & 1) != 0) {
        goto LABEL_16;
      }
      [(id)qword_1000DBF80 invalidate];
      uint64_t v11 = (void *)qword_1000DBF80;
      qword_1000DBF80 = 0LL;
    }

    else
    {
      __int128 v8 = [BKHIDEventProcessorRegistry sharedInstance];
      BKHIDDirectTouchEventProcessor *v10 = [v8 eventProcessorOfClass:[BKHIDDirectTouchEventProcessor class]];
      uint64_t v11 = [v10 autorelease];

      uint64_t v12 = [v11 cancelAndSuppressTouchesOnDisplay:0 reason:@"backlight dim/off"];
      int v13 = (void *)qword_1000DBF80;
      qword_1000DBF80 = v12;
    }

LABEL_16:
    os_unfair_lock_unlock(&stru_1000DBF90);
  }

void sub_100023ED8(uint64_t a1, int a2, char a3, float a4, float a5)
{
  int v7 = a1;
  float v10 = fminf(a4, 1.0);
  if (v10 >= 0.0) {
    float v11 = v10;
  }
  else {
    float v11 = 0.0;
  }
  uint64_t v12 = BKLogBacklight(a1);
  int v13 = (os_log_s *)v12;
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v14)
    {
      *(_DWORD *)buf = 134218240;
      double v26 = v11;
      __int16 v27 = 2048;
      double v28 = a5;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Setting CoreBrightness backlight factor:%f with fade duration:%f",  buf,  0x16u);
    }

    id v15 = (id)qword_1000DBF88;
    if (a5 <= 0.0)
    {
      *(float *)&double v16 = v11;
      int v13 = [NSNumber numberWithFloat:v16];
      __int16 v19 = @"DisplayBrightnessFactor";
    }

    else
    {
      *(float *)&double v16 = a5;
      unint64_t v17 = [NSNumber numberWithFloat:v16];
      [v15 setProperty:v17 forKey:@"DisplayBrightnessFadePeriod"];

      *(float *)&double v18 = v11;
      int v13 = [NSNumber numberWithFloat:v18];
      __int16 v19 = @"DisplayBrightnessFactorWithFade";
    }

    [v15 setProperty:v13 forKey:v19];
  }

  else if (v14)
  {
    *(_DWORD *)buf = 134218240;
    double v26 = v11;
    __int16 v27 = 2048;
    double v28 = a5;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Notifying (but not setting) CoreBrightness backlight factor:%f with fade duration:%f",  buf,  0x16u);
  }

  if (dword_1000DAAF8 == -1) {
    notify_register_check("com.apple.backboardd.backlight.changed", &dword_1000DAAF8);
  }
  sub_100023D10(a2, v11);
  if (dword_1000DAAF8 != -1 && (a3 & 1) == 0)
  {
    if (a4 <= 0.9) {
      int64_t v20 = (uint64_t)(float)(a5 * 1000000000.0);
    }
    else {
      int64_t v20 = 0LL;
    }
    dispatch_time_t v21 = dispatch_time(0LL, v20);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100024168;
    block[3] = &unk_1000B7108;
    float v23 = v11;
    float v24 = a4;
    dispatch_after(v21, &_dispatch_main_q, block);
  }

void sub_100024168(uint64_t a1)
{
  float v2 = *(float *)&dword_1000DBF94;
  os_unfair_lock_unlock(&stru_1000DBF90);
  if (v2 == *(float *)(a1 + 32))
  {
    notify_set_state( dword_1000DAAF8,  (int)(float)(*(float *)(a1 + 36) * 100.0) & ~((int)(float)(*(float *)(a1 + 36) * 100.0) >> 31));
    notify_post("com.apple.backboardd.backlight.changed");
  }

void sub_100025590(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v1 + 9))
  {
    [*(id *)(v1 + 16) removeAnnotationsForKeyPath:@"hit-test-rgns"];
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    id obj = *(id *)(a1 + 40);
    id v33 = [obj countByEnumeratingWithState:v35 objects:v39 count:16];
    if (v33)
    {
      uint64_t v34 = 0LL;
      uint64_t v32 = *(void *)v36;
      do
      {
        for (uint64_t i = 0LL; i != v33; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v36 != v32) {
            objc_enumerationMutation(obj);
          }
          uint64_t v4 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)i);
          [v4 rect];
          double v6 = v5;
          double v8 = v7;
          double v10 = v9;
          double v12 = v11;
          [v4 _exclusiveTouchNormalizedSubRectInReferenceSpace];
          double v14 = v13;
          double v16 = v15;
          double v18 = v17;
          double v20 = v19;
          BKDisplayAnnotation *v21 = [BKDisplayAnnotation annotationWithRectangleSize:CGSizeMake(v10, v12)];
          uint64_t v22 = [BKDisplayAnnotationLocation relativeToTopLeftOfSuper:v6];
          [v22 setDefinedInReferenceSpace:1];
          [v21 setLocation:v22];
          float v23 = [BKDisplayAnnotationStyle colorVariationStyleWithIndex:i];
          [v21 setStyleModifier:v23];

          float v24 = [BKDisplayAnnotation annotationWithRectangleSize:CGSizeMake(v18, v20)];
          BOOL v25 = [BKDisplayAnnotationLocation relativeToTopLeftOfSuper:v14 v16];
          [v25 setDefinedInReferenceSpace:1];
          [v24 setLocation:v25];
          double v26 = [BKDisplayAnnotationStyle crosshatchedBackgroundStyle];
          [v24 setStyleModifier:v26];

          __int16 v27 = *(void **)(*(void *)(a1 + 32) + 16LL);
          NSString *v28 = [NSString stringWithFormat:@"hit-test-rgns.%d.full",  (char *)i + v34];
          [v27 setAnnotation:v21 forKeyPath:v28];

          uint64_t v29 = *(void **)(*(void *)(a1 + 32) + 16LL);
          uint64_t v30 = [NSString stringWithFormat:@"hit-test-rgns.%d.exclusive", (char *)i + v34];
          [v29 setAnnotation:v24 forKeyPath:v30];
        }

        v34 += (uint64_t)i;
        id v33 = [obj countByEnumeratingWithState:v35 objects:v39 count:16];
      }

      while (v33);
    }
  }

id sub_100025878(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_queue_touchWasSoftCanceled:", *(unsigned int *)(a1 + 40));
}

void sub_100025888(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) _stringDescribingContextID:*(unsigned int *)(a1 + 40) clientPort:*(unsigned int *)(a1 + 44)];
  float v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(unsigned int *)(a1 + 48);
  uint64_t v4 = [NSString stringWithFormat:@"always %@", v6];
  double v5 = [NSString stringWithFormat:@"always-ctx.%X" , *(unsigned int *)(a1 + 40)];
  [v2 _queue_annotateTouch:v3 withString:v4 uniqueIdentifier:v5 fromPID:0xFFFFFFFFLL];
}

id sub_100025940(uint64_t a1)
{
  return [*(id *)(a1 + 32) _queue_touchWasHardCanceled:*(unsigned int *)(a1 + 40)];
}

void sub_100025950(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 16LL);
  id v2 = [*(id *)(a1 + 32) _keyPathForTouchIdentifier:*(unsigned int *)(a1 + 40)];
  [v1 removeAnnotationsForKeyPath:v2];
}

id sub_10002599C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _queue_removeAnnotationForTouch:*(unsigned int *)(a1 + 40) withUniqueIdentifier:@"detached"];
}

uint64_t sub_1000259DC(uint64_t a1)
{
  uint64_t result = BSFloatIsZero( [*(id *)(a1 + 32) _queue_setCenter:forTouchIdentifier: *(unsigned int *)(a1 + 72),  *(double *)(a1 + 40),  *(double *)(a1 + 48)),  *(double *)(a1 + 56));
  if ((result & 1) == 0) {
    return (uint64_t)[*(id *)(a1 + 32) _queue_updateHoverStateForTouchIdentifier:*(unsigned int *)(a1 + 72) z:*(double *)(a1 + 64) maxZ:*(double *)(a1 + 56)];
  }
  return result;
}

void sub_100025A2C(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 48);
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    uint64_t v2 = *(unsigned int *)(v2 + 8);
  }
  id v4 = [NSString stringWithFormat:@"transferred to %X" v2];
  [v3 _queue_annotateTouch:v1 withUniqueString:v4];
}

id sub_100025A94(uint64_t a1)
{
  return [*(id *)(a1 + 32) _queue_annotateTouch:*(unsigned int *)(a1 + 40) withUniqueString:@"detached"];
}

void sub_100025AAC(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3)
  {
    uint64_t v4 = *(unsigned int *)(v3 + 8);
    uint64_t v5 = *(unsigned int *)(v3 + 12);
  }

  else
  {
    uint64_t v4 = 0LL;
    uint64_t v5 = 0LL;
  }

  id v9 = [v2 _stringDescribingContextID:v4 clientPort:v5];
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(unsigned int *)(a1 + 56);
  double v8 = [NSString stringWithFormat:@"ctx.%d", *(void *)(a1 + 48)];
  [v6 _queue_annotateTouch:v7 withString:v9 uniqueIdentifier:v8 fromPID:0xFFFFFFFFLL];
}

id sub_100025B4C(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) _queue_annotateTouch:*(unsigned int *)(a1 + 64) withString:@"touch down" uniqueIdentifier:@"touchDown" fromPID:0xFFFFFFFFLL];
  int v3 = *(_DWORD *)(a1 + 68);
  if ((v3 & 0x800) != 0)
  {
    id result = [*(id *)(a1 + 32) _queue_annotateTouch:*(unsigned int *)(a1 + 64) withUniqueString:@"from edge"];
    int v3 = *(_DWORD *)(a1 + 68);
    if ((v3 & 0x40000) == 0)
    {
LABEL_3:
      if ((v3 & 0x2000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }

  else if ((v3 & 0x40000) == 0)
  {
    goto LABEL_3;
  }

  id result = [*(id *)(a1 + 32) _queue_annotateTouch:*(unsigned int *)(a1 + 64) withUniqueString:@"swipe-locked"];
  int v3 = *(_DWORD *)(a1 + 68);
  if ((v3 & 0x2000) == 0)
  {
LABEL_4:
    if ((v3 & 0x1000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }

LABEL_12:
  id result = [*(id *)(a1 + 32) _queue_annotateTouch:*(unsigned int *)(a1 + 64) withUniqueString:@"swipe up"];
  int v3 = *(_DWORD *)(a1 + 68);
  if ((v3 & 0x4000000) == 0)
  {
LABEL_6:
    if ((v3 & 0x2000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_14;
  }

  return (char)v3;
}

    double v11 = 0;
    goto LABEL_13;
  }

  if ((v10 & 1) == 0)
  {
    double v12 = sub_10003F3DC();
    double v13 = [v12 autorelease];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      double v17 = 138543618;
      double v18 = v6;
      double v19 = 1024;
      double v20 = v7;
      double v14 = "Haptic feedback request %{public}@ from pid %d could not be validated due to missing entitlement";
LABEL_15:
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v17, 0x12u);
      goto LABEL_12;
    }

    goto LABEL_12;
  }
}

  id result = vdivq_f64(v17, v16);
  *(_BYTE *)a1 = 1;
  *(_BYTE *)(a1 + 1) = v23;
  *(_BYTE *)(a1 + 2) = *(_BYTE *)(a2 + 205);
  *(float64x2_t *)(a1 + _Block_object_dispose(va, 8) = v18;
  *(double *)(a1 + 24) = v20;
  *(double *)(a1 + 32) = v24;
  *(float64x2_t *)(a1 + 40) = result;
  return result;
}

  return v10;
}

  os_unfair_lock_unlock(p_lock);
  return (char)v5;
}

id sub_100025C8C(uint64_t a1)
{
  return _objc_msgSend( *(id *)(a1 + 32),  "_queue_updateHoverStateForTouchIdentifier:z:maxZ:",  *(unsigned int *)(a1 + 80),  *(double *)(a1 + 64),  *(double *)(a1 + 72));
}

id sub_100025CD4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _queue_annotateTouch:*(unsigned int *)(a1 + 56) withString:*(void *)(a1 + 40) uniqueIdentifier:*(void *)(a1 + 48) fromPID:*(unsigned int *)(a1 + 60)];
}

id sub_100025CE8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _queue_annotateTouch:*(unsigned int *)(a1 + 56) withString:*(void *)(a1 + 40) uniqueIdentifier:*(void *)(a1 + 48) fromPID:0xFFFFFFFFLL];
}

id sub_100025D00(uint64_t a1)
{
  return [*(id *)(a1 + 32) _queue_annotateTouch:*(unsigned int *)(a1 + 48) withUniqueString:*(void *)(a1 + 40)];
}

void *sub_100025D10(void *result)
{
  uint64_t v1 = result[4];
  int v2 = *((unsigned __int8 *)result + 40);
  if (*(unsigned __int8 *)(v1 + 9) != v2)
  {
    *(_BYTE *)(v1 + 9) = v2;
    if (!*((_BYTE *)result + 40)) {
      return [*(id *)(result[4] + 16) removeAnnotationsForKeyPath:@"hit-test-rgns"];
    }
  }

  return result;
}

void *sub_100025D48(void *result)
{
  uint64_t v1 = result[4];
  int v2 = *((unsigned __int8 *)result + 40);
  if (*(unsigned __int8 *)(v1 + 8) != v2)
  {
    *(_BYTE *)(v1 + _Block_object_dispose(va, 8) = v2;
    if (!*((_BYTE *)result + 40)) {
      return [*(id *)(result[4] + 16) removeAnnotationsForKeyPath:@"touch"];
    }
  }

  return result;
}

uint64_t sub_100025D80(uint64_t result)
{
  *(_BYTE *)(*(void *)(*(void *)(result + 40) + 8LL) + 24LL) = *(_BYTE *)(*(void *)(result + 32) + 9LL);
  return result;
}

uint64_t sub_100025D94(uint64_t result)
{
  *(_BYTE *)(*(void *)(*(void *)(result + 40) + 8LL) + 24LL) = *(_BYTE *)(*(void *)(result + 32) + 8LL);
  return result;
}

void sub_100025DE8(id a1)
{
  uint64_t v1 = BSDispatchQueueCreateWithQualityOfService("BKTouchAnnotationController", 0LL, 33LL, 0LL);
  int v2 = (void *)qword_1000DBF98;
  qword_1000DBF98 = v1;
}

id sub_100026348(uint64_t a1)
{
  return [*(id *)(a1 + 32) appendSuccinctDescriptionToFormatter:*(void *)(a1 + 40)];
}

void sub_100026A18( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_100026A64(id *a1)
{
}

void sub_100026A9C(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 16);
  uint64_t v2 = *(void *)(a1 + 8);
  if (v2) {
    *(_DWORD *)(v2 + _Block_object_dispose(va, 8) = v1;
  }
  int v3 = *(_DWORD *)(a1 + 20);
  if (v3 == 2)
  {
    uint64_t v5 = *(void **)(a1 + 8);
    if (v5) {
      uint64_t v5 = (void *)v5[2];
    }
    uint64_t v7 = v5;
    [v7 removeIndex:v1];
  }

  else if (v3 == 1)
  {
    uint64_t v4 = *(void **)(a1 + 8);
    if (v4) {
      uint64_t v4 = (void *)v4[2];
    }
    id v6 = v4;
    [v6 addIndex:v1];
  }

void sub_100026B30(uint64_t a1, uint64_t a2, uint64_t a3, int a4, void *a5, void *a6)
{
  id v11 = a5;
  id v12 = a6;
  if (a1)
  {
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    id v31 = [v11 countByEnumeratingWithState:v32 objects:v40 count:16];
    if (v31)
    {
      uint64_t v13 = *(void *)v33;
      os_log_type_t type = 2 * (a4 == 0);
      uint64_t v29 = *(void *)v33;
      do
      {
        for (uint64_t i = 0LL; i != v31; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v33 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = *(void *)(*((void *)&v32 + 1) + 8LL * (void)i);
          Copy = (const void *)IOHIDEventCreateCopy(kCFAllocatorSystemDefault, a2);
          double v17 = [BKSHIDEventBaseAttributes baseAttributesFromProvider:v15];
          BKSHIDEventSetAttributes(Copy, v17);
          id v18 = sub_10003F124();
          os_log_s *v19 = v18;
          double v20 = v19;
          if ((_DWORD)a3)
          {
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v22 = sub_1000186BC((uint64_t)Copy, v21);
              uint64_t v23 = a2;
              id v24 = v12;
              id v25 = v11;
              uint64_t v26 = a3;
              __int16 v27 = [v22 autorelease];
              *(_DWORD *)buf = 138543618;
              uint64_t v37 = (uint64_t)v27;
              __int16 v38 = 2114;
              uint64_t v39 = v15;
              _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "out %{public}@ -> %{public}@",  buf,  0x16u);

              a3 = v26;
              id v11 = v25;
              id v12 = v24;
              a2 = v23;
              uint64_t v13 = v29;
            }
          }

          else if (os_log_type_enabled(v19, type))
          {
            uint64_t TimeStamp = IOHIDEventGetTimeStamp(a2);
            *(_DWORD *)buf = 134218242;
            uint64_t v37 = TimeStamp;
            __int16 v38 = 2114;
            uint64_t v39 = v15;
            _os_log_impl((void *)&_mh_execute_header, v20, type, "out %llX -> %{public}@", buf, 0x16u);
          }

          [v12 postEvent:Copy toDestination:v15];
          CFRelease(Copy);
        }

        id v31 = [v11 countByEnumeratingWithState:&v32 objects:v40 count:16];
      }

      while (v31);
    }
  }
}

void sub_100026DC0(void *a1, uint64_t a2, uint64_t a3)
{
  id v6 = *(id *)(a3 + 8);
  id v7 = v6;
  if (v6)
  {
    if (v6[2] > 3u) {
      goto LABEL_22;
    }
    double v8 = (void *)*((void *)v6 + 3);
  }

  else
  {
    double v8 = 0LL;
  }

  id v9 = v8;
  double v10 = [*(id *)(a3 + 48) destinationsForEvent:a2 fromSender:*(void *)(a3 + 40)];
  if (([v10 isEqual:v9] & 1) == 0 && v7)
  {
    if (*((_DWORD *)v7 + 2))
    {
      id v11 = [v9 mutableCopy];
      [v11 minusSet:v10];
      id v12 = sub_10003F124();
      uint64_t v13 = [v12];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = *(id *)a3;
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v14;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%{public}@: removed destinations: %{public}@",  buf,  0x16u);
      }

      id v53 = v11;
      __int128 v55 = a1;
      if ([v11 count])
      {
        uint64_t v15 = *(void **)(a3 + 48);
        id v16 = v11;
        id v17 = v15;
        id v18 = *(id *)a3;
        double v19 = (id *)*(id *)(a3 + 8);
        if (!v19 || (double v20 = v19, !*((_DWORD *)v19 + 2)))
        {
          uint64_t v39 = [NSString stringWithFormat:@"bug: shouldn't have a record at idle stage"];
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            id v40 = NSStringFromSelector("_postCancelEventToDestinations:locals:dispatcher:");
            double v41 = [v40 autorelease];
            double v43 = [v55 class];
            double v44 = NSStringFromClass(v43);
            double v45 = [v44 autorelease];
            *(_DWORD *)buf = 138544642;
            *(void *)&uint8_t buf[4] = v41;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v45;
            *(_WORD *)&buf[22] = 2048;
            __int128 v57 = v55;
            LOWORD(v5_Block_object_dispose(va, 8) = 2114;
            *(void *)((char *)&v58 + 2) = @"BKHIDTouchSensitiveButtonEventProcessor.m";
            WORD5(v5_Block_object_dispose(va, 8) = 1024;
            HIDWORD(v5_Block_object_dispose(va, 8) = 277;
            LOWORD(v59) = 2114;
            *(void *)((char *)&v59 + 2) = v39;
            _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
          }

          _bs_set_crash_log_message([v39 UTF8String]);
          __break(0);
          JUMPOUT(0x100027250LL);
        }

        id v21 = v19[2];
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&uint8_t buf[8] = 3221225472LL;
        *(void *)&uint8_t buf[16] = sub_1000273F8;
        __int128 v57 = &unk_1000B6308;
        uint64_t v60 = a3;
        *(void *)&__int128 v58 = v18;
        *((void *)&v58 + 1) = v55;
        id v22 = v16;
        *(void *)&__int128 v59 = v22;
        id v23 = v17;
        *((void *)&v59 + 1) = v23;
        id v24 = v18;
        [v21 enumerateIndexesWithOptions:2 usingBlock:buf];

        id v11 = v53;
      }

      id v25 = [v10 mutableCopy];
      [v25 minusSet:v9];
      id v26 = sub_10003F124();
      os_log_s *v27 = v26;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        id v28 = *(id *)a3;
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v28;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v25;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "%{public}@: added destinations: %{public}@",  buf,  0x16u);
      }

      if ([v25 count])
      {
        uint64_t v29 = *(void **)(a3 + 48);
        id v30 = v25;
        id v31 = v29;
        id v32 = *(id *)a3;
        __int128 v33 = (id *)*(id *)(a3 + 8);
        if (!v33 || (__int128 v34 = v33, !*((_DWORD *)v33 + 2)))
        {
          NSString *v46 = [NSString stringWithFormat:@"bug: shouldn't have a record at idle stage"];
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            double v47 = NSStringFromSelector("_postEnterEventToDestinations:locals:dispatcher:");
            double v48 = [v47 autorelease];
            double v50 = (v55 ?: v49);
            uint64_t v51 = NSStringFromClass(v50);
            id v52 = v51;
            *(_DWORD *)buf = 138544642;
            *(void *)&uint8_t buf[4] = v48;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v52;
            *(_WORD *)&buf[22] = 2048;
            __int128 v57 = v55;
            LOWORD(v5_Block_object_dispose(va, 8) = 2114;
            *(void *)((char *)&v58 + 2) = @"BKHIDTouchSensitiveButtonEventProcessor.m";
            WORD5(v5_Block_object_dispose(va, 8) = 1024;
            HIDWORD(v5_Block_object_dispose(va, 8) = 262;
            LOWORD(v59) = 2114;
            *(void *)((char *)&v59 + 2) = v46;
            _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
          }

          _bs_set_crash_log_message([v46 UTF8String]);
          __break(0);
          JUMPOUT(0x100027344LL);
        }

        id v35 = v33[2];
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&uint8_t buf[8] = 3221225472LL;
        *(void *)&uint8_t buf[16] = sub_100027354;
        __int128 v57 = &unk_1000B6308;
        uint64_t v60 = a3;
        *(void *)&__int128 v58 = v32;
        *((void *)&v58 + 1) = v55;
        id v36 = v30;
        *(void *)&__int128 v59 = v36;
        id v37 = v31;
        *((void *)&v59 + 1) = v37;
        id v38 = v32;
        [v35 enumerateIndexesUsingBlock:buf];

        id v11 = v54;
      }
    }

    objc_storeStrong((id *)v7 + 3, v10);
  }

LABEL_22:
}

void sub_100027354(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = **(void **)(a1 + 64);
  if (v4) {
    uint64_t v5 = *(void *)(v4 + 16);
  }
  else {
    uint64_t v5 = 0LL;
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6)
  {
    uint64_t v7 = *(unsigned __int16 *)(v6 + 8);
    uint64_t v8 = *(unsigned __int16 *)(v6 + 10);
  }

  else
  {
    uint64_t v7 = 0LL;
    uint64_t v8 = 0LL;
  }

  uint64_t v9 = mach_absolute_time();
  double v10 = (const void *)sub_100018088(v5, v7, v8, v9, 1LL, a2);
  sub_100026B30( *(void *)(a1 + 40),  (uint64_t)v10,  1LL,  *(_DWORD *)(*(void *)(a1 + 64) + 20LL),  *(void **)(a1 + 48),  *(void **)(a1 + 56));
  CFRelease(v10);
}

void sub_1000273F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = **(void **)(a1 + 64);
  if (v4) {
    uint64_t v5 = *(void *)(v4 + 16);
  }
  else {
    uint64_t v5 = 0LL;
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6)
  {
    uint64_t v7 = *(unsigned __int16 *)(v6 + 8);
    uint64_t v8 = *(unsigned __int16 *)(v6 + 10);
  }

  else
  {
    uint64_t v7 = 0LL;
    uint64_t v8 = 0LL;
  }

  uint64_t v9 = mach_absolute_time();
  double v10 = (const void *)sub_100018088(v5, v7, v8, v9, 2LL, a2);
  IOHIDEventSetPhase(v10, 8LL);
  sub_100026B30( *(void *)(a1 + 40),  (uint64_t)v10,  1LL,  *(_DWORD *)(*(void *)(a1 + 64) + 20LL),  *(void **)(a1 + 48),  *(void **)(a1 + 56));
  CFRelease(v10);
}

void sub_1000277C0(uint64_t a1)
{
  BKGSEventSystem *v2 = [[BKGSEventSystem sharedInstance] autorelease];
  [v2 _handleEvent:a1];
}

void sub_100027878(uint64_t a1)
{
  BKSHIDEventDigitizerPathAttributes *v1 = [[BKSHIDEventDigitizerPathAttributes alloc] init];
  id v2 = (void *)qword_1000DBFA8;
  qword_1000DBFA8 = (uint64_t)v1;
}

id sub_100028154(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _processDidTerminate:*(void *)(a1 + 40)];
}

void sub_100028260(id a1)
{
  BKSecurityManager *v1 = [[BKSecurityManager alloc] init];
  id v2 = (void *)qword_1000DBFB8;
  qword_1000DBFB8 = (uint64_t)v1;
}

void sub_10002831C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(_DWORD *)(v2 + 8) && !*(void *)(v2 + 16))
  {
    uint64_t v7 = *(void **)(a1 + 40);
    uint64_t v6 = @"default";
    uint64_t v8 = 0LL;
    goto LABEL_6;
  }

  int v3 = *(void **)(a1 + 40);
  uint64_t v4 = NSStringFromBSVersionedPID();
  uint64_t v5 = [v4 autorelease];
  [v3 appendString:v5 withName:@"pid"];

  uint64_t v6 = *(const __CFString **)(*(void *)(a1 + 32) + 16LL);
  if (v6)
  {
    uint64_t v7 = *(void **)(a1 + 40);
    uint64_t v8 = @"displayUUID";
LABEL_6:
    [v7 appendString:v6 withName:v8];
  }

  uint64_t v9 = *(void **)(a1 + 40);
  uint64_t v10 = NSStringFromBKSDisplayServicesCloneMirroringMode(*(void *)(*(void *)(a1 + 32) + 24LL));
  id v11 = v10;
  [v9 appendString:v11 withName:@"mode"];
}

void sub_1000286E4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    uint64_t v2 = *(unsigned int *)(a1 + 40);
    int v3 = (os_unfair_lock_s *)(v1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(v1 + 8));
    uint64_t v5 = BKLogDisplay(v4);
    uint64_t v6 = v5;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v14[0] = 67109120;
      v14[1] = v2;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "clone mirror remove all for pid %d",  (uint8_t *)v14,  8u);
    }

    uint64_t v7 = (void *)[NSNumber numberWithInt:v2];
    uint64_t v8 = (void *)[*(id *)(v1 + 32) objectForKey:v7];
    uint64_t v9 = v8;
    if (v8)
    {
      uint64_t v10 = *(void **)(v1 + 40);
      id v11 = [v8 allValues];
      [v10 removeObjectsInArray:v11];

      [*(id *)(v1 + 32) removeObjectForKey:v7];
    }

    id v12 = [*(id *)(v1 + 48) objectForKey:v7];
    [v12 invalidate];

    [*(id *)(v1 + 48) removeObjectForKey:v7];
    [v1 _lock_rebuildModeCache];
    id WeakRetained = objc_loadWeakRetained((id *)(v1 + 16));
    os_unfair_lock_unlock(v3);
    [WeakRetained cloneMirroringRequestsDidChange];
  }

void sub_100028860(id a1)
{
  BKDisplayCloneMirrorRequestClient *v1 = [[BKDisplayCloneMirrorRequestClient alloc] init];
  uint64_t v2 = (void *)qword_1000DBFC8;
  qword_1000DBFC8 = (uint64_t)v1;

  if (qword_1000DBFC8) {
    *(void *)(qword_1000DBFC8 + 24) = 0LL;
  }
}

void sub_100029278( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, id location)
{
}

void sub_10002A454(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 8), a2);
  }
}

void sub_10002A464(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setTimestamp:v3];
  [v4 setDetectionMask:*(unsigned int *)(a1 + 40)];
  [v4 setMode:*(unsigned int *)(a1 + 44)];
}

id sub_10002A4B8(uint64_t a1)
{
  id v4 = @"objectInProximity";
  uint64_t v1 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
  uint64_t v5 = v1;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

void sub_10002A558(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10002A75C;
  v4[3] = &unk_1000B76D8;
  id v5 = a1[32];
  [v3 logBlock:v4 domain:@"com.apple.backboard.hid.proximity"];
  [v5 release];
}

void sub_10002A5EC(_Unwind_Exception *a1)
{
}

void sub_10002A600(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10002A6A8;
  v4[3] = &unk_1000B76D8;
  [v5 copy];
  [v3 logBlock:v4 domain:@"com.apple.backboard.hid.proximity"];
  [v5 release];
}

void sub_10002A694(_Unwind_Exception *a1)
{
}

id sub_10002A6A8(uint64_t a1)
{
  id WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = @"objectInProximity";
  uint64_t v2 = (void *)[NSNumber numberWithBool:WeakRetained[27]];
  uint64_t v6 = v2;
  BOOL v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:1];

  return v3;
}

id sub_10002A75C(uint64_t a1)
{
  id WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = @"objectInProximity";
  uint64_t v2 = (void *)[NSNumber numberWithBool:WeakRetained[27]];
  uint64_t v6 = v2;
  BOOL v4 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:1];

  return v3;
}

void sub_10002A810(id a1, BKSMutableProximityEvent *a2)
{
  uint64_t v2 = a2;
  [v2 setMode:0LL];
  [v2 setDetectionMask:0LL];
  [v2 setTimestamp:mach_absolute_time()];
}

void sub_10002A858(void *a1, uint64_t a2)
{
  v147 = a1;
  id v3 = @"FromHID";
  uint64_t v144 = a2;
  sub_10001D26C(v154, a2);
  sub_10001D2B0((unint64_t)v154);
  if (v155)
  {
    uint64_t IntegerValue = IOHIDEventGetIntegerValue(a2, 720923LL);
    v145 = [NSMutableDictionary dictionary];
    uint64_t Data = IOHIDEventCreateData(0LL, v144);
    cf = (void *)Data;
    uint64_t v6 = (void *)[cf base64EncodedStringWithOptions:16];
    [v145 setObject:v6 forKeyedSubscript:@"RawCollectionData"];

    CFRelease(cf);
    [v145 setObject:@"FromHID" forKeyedSubscript:@"description"];
    uint64_t v8 = [NSNumber numberWithUnsignedInt:IOHIDEventGetType(v144, v7)];
    uint64_t v9 = [v8 autorelease];
    [v145 setObject:v9 forKeyedSubscript:@"type"];

    uint64_t v10 = (void *)[NSNumber numberWithInteger:v155];
    [v145 setObject:v10 forKeyedSubscript:@"pathCount"];

    id v11 = v147;
    if (v147) {
      id v11 = (id **)v147[1];
    }
    id v12 = v11;
    uint64_t v13 = (void *)[v12 displayUUID];
    [v145 setObject:v13 forKeyedSubscript:@"displayUUID"];

    id v14 = [NSNumber numberWithLong:IntegerValue];
    [v145 setObject:v14 forKeyedSubscript:@"generation"];

    uint64_t v15 = [NSNumber numberWithUnsignedLongLong:IOHIDEventGetTimeStamp(v144)];
    id v16 = [v15 autorelease];
    [v145 setObject:v16 forKeyedSubscript:@"timestamp"];

    NSNumber *v17 = [NSNumber numberWithUnsignedLongLong:IOHIDEventGetSenderID(v144)];
    id v18 = v17;
    [v145 setObject:v18 forKeyedSubscript:@"senderID"];

    NSNumber *v19 = [NSNumber numberWithUnsignedInt:IOHIDEventGetEventFlags(v144)];
    double v20 = [v19 doubleValue];
    [v145 setObject:v20 forKeyedSubscript:@"flags"];

    uint64_t v21 = IOHIDEventGetIntegerValue(v144, 720900LL);
    id v22 = [NSNumber numberWithUnsignedInt:v21];
    [v145 setObject:v22 forKeyedSubscript:@"transducerType"];

    else {
      id v23 = *(v21 + off_1000B6410);
    }
    [v145 setObject:v23 forKeyedSubscript:@"transducerTypeName"];
    NSNumber *v24 = [NSNumber numberWithLong:IOHIDEventGetIntegerValue(v144, 720901LL)];
    id v25 = [v24 autorelease];
    [v145 setObject:v25 forKeyedSubscript:@"transducerIndex"];

    uint64_t v26 = IOHIDEventGetIntegerValue(v144, 720903LL);
    LODWORD(v25) = v26;
    __int16 v27 = [NSNumber numberWithUnsignedInt:v26];
    [v145 setObject:v27 forKeyedSubscript:@"eventMask"];

    id v28 = sub_10002BE00((int)v25);
    uint64_t v29 = v28;
    [v145 setObject:v29 forKeyedSubscript:@"eventMaskName"];

    NSNumber *v30 = [NSNumber numberWithLong:IOHIDEventGetIntegerValue(v144, 720899LL)];
    id v31 = v30;
    [v145 setObject:v31 forKeyedSubscript:@"buttonMask"];

    NSNumber *v32 = [NSNumber numberWithLong:IOHIDEventGetIntegerValue(v144, 720905LL)];
    __int128 v33 = [v32 autorelease];
    [v145 setObject:v33 forKeyedSubscript:@"touch"];

    NSNumber *v34 = [NSNumber numberWithLong:IOHIDEventGetIntegerValue(v144, 720904LL)];
    id v35 = v34;
    [v145 setObject:v35 forKeyedSubscript:@"range"];

    NSNumber *v36 = [NSNumber numberWithDouble:IOHIDEventGetFloatValue(v144, 720906LL)];
    v37 = [v36 autorelease];
    [v145 setObject:v37 forKeyedSubscript:@"pressure"];

    NSNumber *v38 = [NSNumber numberWithDouble:IOHIDEventGetFloatValue(v144, 720907LL)];
    uint64_t v39 = [v38 autorelease];
    [v145 setObject:v39 forKeyedSubscript:@"auxilliaryPressure"];

    NSNumber *v40 = [NSNumber numberWithDouble:IOHIDEventGetFloatValue(v144, 720908LL)];
    double v41 = [v40 autorelease];
    [v145 setObject:v41 forKeyedSubscript:@"twist"];

    uint64_t v42 = [NSNumber numberWithLong:IOHIDEventGetIntegerValue(v144, 720923LL)];
    double v43 = [v42 autorelease];
    [v145 setObject:v43 forKeyedSubscript:@"generationCount"];

    NSNumber *v44 = [NSNumber numberWithLong:IOHIDEventGetIntegerValue(v144, 720924LL)];
    double v45 = [v44 autorelease];
    [v145 setObject:v45 forKeyedSubscript:@"willUpdateMask"];

    NSNumber *v46 = [NSNumber numberWithLong:IOHIDEventGetIntegerValue(v144, 720925LL)];
    double v47 = [v46 doubleValue];
    [v145 setObject:v47 forKeyedSubscript:@"didUpdateMask"];

    v166[0] = @"x";
    NSNumber *v48 = [NSNumber numberWithDouble:IOHIDEventGetFloatValue(v144, 720896LL)];
    uint64_t v49 = [v48 autorelease];
    v167[0] = v49;
    v166[1] = @"y";
    double v50 = [NSNumber numberWithDouble:IOHIDEventGetFloatValue(v144, 720897LL)];
    uint64_t v51 = [v50 autorelease];
    v167[1] = v51;
    v166[2] = @"z";
    NSNumber *v52 = [NSNumber numberWithDouble:IOHIDEventGetFloatValue(v144, 720898LL)];
    id v53 = v52;
    v167[2] = v53;
    __int128 v54 = [NSDictionary dictionaryWithObjects:v167 forKeys:v166 count:3];
    [v145 setObject:v54 forKeyedSubscript:@"location"];

    v164[0] = @"x";
    NSNumber *v55 = [NSNumber numberWithDouble:IOHIDEventGetFloatValue(v144, 720909LL)];
    __int128 v56 = [v55 autorelease];
    v164[1] = @"y";
    v165[0] = v56;
    NSNumber *v57 = [NSNumber numberWithDouble:IOHIDEventGetFloatValue(v144, 720910LL)];
    __int128 v58 = [v57 autorelease];
    v165[1] = v58;
    __int128 v59 = [NSDictionary dictionaryWithObjects:v165 forKeys:v164 count:2];
    [v145 setObject:v59 forKeyedSubscript:@"tilt"];

    v146 = [NSMutableArray array];
    [v145 setObject:forKeyedSubscript:];
    sub_10001D26C((const __CFArray **)v152, v144);
    sub_10001D2B0((unint64_t)v152);
    __int128 v148 = v152[0];
    __int128 v149 = v152[1];
    __int128 v150 = v152[2];
    uint64_t v151 = v153;
    while (1)
    {
      uint64_t v60 = *((void *)&v149 + 1);
      if (!*((void *)&v149 + 1)) {
        break;
      }
      uint64_t v61 = v150;
      *((void *)&v150 + 1) = *((void *)&v149 + 1);
      uint64_t v151 = v150;
      v62 = [NSMutableDictionary dictionary];
      [v146 addObject:v62];
      uint64_t v63 = (void *)[NSNumber numberWithInteger:v61];
      [v62 setObject:v63 forKeyedSubscript:@"pathIndex"];

      NSNumber *v65 = [NSNumber numberWithUnsignedInt:IOHIDEventGetType(v60, v64)];
      id v66 = v65;
      [v62 setObject:v66 forKeyedSubscript:@"type"];

      double v67 = sub_1000456F0(v147[14], v61);
      double v68 = (unsigned int)v67;
      if (v68) {
        uint64_t v69 = v68[4];
      }
      else {
        uint64_t v69 = 0LL;
      }

      uint64_t v70 = (void *)[NSNumber numberWithUnsignedInt:v69];
      [v62 setObject:v70 forKeyedSubscript:@"touchID"];

      NSNumber *v71 = [NSNumber numberWithUnsignedInt:IOHIDEventGetEventFlags(v60)];
      char v72 = (void *)v71;
      [v62 setObject:v72 forKeyedSubscript:@"flags"];

      v73 = [NSNumber numberWithLong:IOHIDEventGetIntegerValue(v60, 720902LL)];
      double v74 = [v73 doubleValue];
      [v62 setObject:v74 forKeyedSubscript:@"identity"];

      uint64_t v75 = IOHIDEventGetIntegerValue(v60, 720900LL);
      id v76 = [NSNumber numberWithUnsignedInt:v75];
      [v62 setObject:v76 forKeyedSubscript:@"transducerType"];

      NSSize v77 = &stru_1000BB628;
      [v62 setObject:v77 forKeyedSubscript:@"transducerTypeName"];
      NSNumber *v78 = [NSNumber numberWithLong:IOHIDEventGetIntegerValue(v60, 720901LL)];
      v79 = v78;
      [v62 setObject:v79 forKeyedSubscript:@"transducerIndex"];

      uint64_t v80 = IOHIDEventGetIntegerValue(v60, 720903LL);
      LODWORD(v79) = v80;
      v81 = [NSNumber numberWithUnsignedInt:v80];
      [v62 setObject:v81 forKeyedSubscript:@"eventMask"];

      id v82 = sub_10002BE00((int)v79);
      v83 = v82;
      [v62 setObject:v83 forKeyedSubscript:@"eventMaskName"];

      uint64_t v84 = IOHIDEventGetIntegerValue(v60, 720923LL);
      if (v84)
      {
        v85 = [NSNumber numberWithLong:v84];
        [v62 setObject:v85 forKeyedSubscript:@"generation"];

        NSNumber *v86 = [NSNumber numberWithLong:IOHIDEventGetIntegerValue(v60, 720924LL)];
        v87 = [v86 autorelease];
        [v62 setObject:v87 forKeyedSubscript:@"willUpdateMask"];

        NSNumber *v88 = [NSNumber numberWithLong:IOHIDEventGetIntegerValue(v60, 720925LL)];
        v89 = v88;
        [v62 setObject:v89 forKeyedSubscript:@"didUpdateMask"];
      }

      v90 = [NSNumber numberWithLong:IOHIDEventGetIntegerValue(v60, 720899LL)];
      v91 = [v90 autorelease];
      [v62 setObject:v91 forKeyedSubscript:@"buttonMask"];

      NSNumber *v92 = [NSNumber numberWithLong:IOHIDEventGetIntegerValue(v60, 720905LL)];
      v93 = [v92 autorelease];
      [v62 setObject:v93 forKeyedSubscript:@"touch"];

      v94 = [NSNumber numberWithLong:IOHIDEventGetIntegerValue(v60, 720904LL)];
      v95 = [v94 autorelease];
      [v62 setObject:v95 forKeyedSubscript:@"range"];

      NSNumber *v96 = [NSNumber numberWithDouble:IOHIDEventGetFloatValue(v60, 720906LL)];
      v97 = [v96 autorelease];
      [v62 setObject:v97 forKeyedSubscript:@"pressure"];

      v98 = [NSNumber numberWithDouble:IOHIDEventGetFloatValue(v60, 720907LL)];
      v99 = [v98 autorelease];
      [v62 setObject:v99 forKeyedSubscript:@"auxilliaryPressure"];

      v100 = [NSNumber numberWithDouble:IOHIDEventGetFloatValue(v60, 720908LL)];
      v101 = v100;
      [v62 setObject:v101 forKeyedSubscript:@"twist"];

      v102 = [NSNumber numberWithLong:IOHIDEventGetIntegerValue(v60, 720923LL)];
      v103 = v102;
      [v62 setObject:v103 forKeyedSubscript:@"generationCount"];

      NSNumber *v104 = [NSNumber numberWithLong:IOHIDEventGetIntegerValue(v60, 720924LL)];
      v105 = v104;
      [v62 setObject:v105 forKeyedSubscript:@"willUpdateMask"];

      v106 = [NSNumber numberWithLong:IOHIDEventGetIntegerValue(v60, 720925LL)];
      v107 = v106;
      [v62 setObject:v107 forKeyedSubscript:@"didUpdateMask"];

      v162[0] = @"x";
      NSNumber *v108 = [NSNumber numberWithDouble:IOHIDEventGetFloatValue(v60, 720896LL)];
      v109 = v108;
      v163[0] = v109;
      v162[1] = @"y";
      NSNumber *v110 = [NSNumber numberWithDouble:IOHIDEventGetFloatValue(v60, 720897LL)];
      v111 = v110;
      v163[1] = v111;
      v162[2] = @"z";
      NSNumber *v112 = [NSNumber numberWithDouble:IOHIDEventGetFloatValue(v60, 720898LL)];
      v113 = v112;
      v163[2] = v113;
      v114 = [NSDictionary dictionaryWithObjects:v163 forKeys:v162 count:3];
      [v62 setObject:v114 forKeyedSubscript:@"location"];

      NSNumber *v115 = [NSNumber numberWithDouble:IOHIDEventGetFloatValue(v60, 720913LL)];
      v116 = [v115 autorelease];
      [v62 setObject:v116 forKeyedSubscript:@"quality"];

      v117 = [NSNumber numberWithDouble:IOHIDEventGetFloatValue(v60, 720914LL)];
      v118 = [v117 autorelease];
      [v62 setObject:v118 forKeyedSubscript:@"density"];

      NSNumber *v119 = [NSNumber numberWithDouble:IOHIDEventGetFloatValue(v60, 720915LL)];
      v120 = v119;
      [v62 setObject:v120 forKeyedSubscript:@"irregularity"];

      NSNumber *v121 = [NSNumber numberWithDouble:IOHIDEventGetFloatValue(v60, 720916LL)];
      v122 = [v121 autorelease];
      [v62 setObject:v122 forKeyedSubscript:@"majorRadius"];

      v123 = [NSNumber numberWithDouble:IOHIDEventGetFloatValue(v60, 720917LL)];
      v124 = v123;
      [v62 setObject:v124 forKeyedSubscript:@"minorRadius"];

      v125 = [NSNumber numberWithDouble:IOHIDEventGetFloatValue(v60, 720922LL)];
      v126 = [v125 autorelease];
      [v62 setObject:v126 forKeyedSubscript:@"accuracy"];

      double FloatValue = IOHIDEventGetFloatValue(v60, 720896LL);
      double v128 = IOHIDEventGetFloatValue(v60, 720897LL);
      v160[0] = @"precise";
      v158[0] = @"x";
      v129 = [NSNumber numberWithDouble:FloatValue];
      v158[1] = @"y";
      v159[0] = v129;
      v130 = [NSNumber numberWithDouble:v128];
      v159[1] = v130;
      v131 = [NSDictionary dictionaryWithObjects:v159 forKeys:v158 count:2];
      v161[0] = v131;
      v160[1] = @"rounded";
      v156[0] = @"x";
      v132 = [NSNumber numberWithDouble:FloatValue];
      v156[1] = @"y";
      v157[0] = v132;
      v133 = [NSNumber numberWithDouble:v128];
      v157[1] = v133;
      v134 = [NSDictionary dictionaryWithObjects:v157 forKeys:v156 count:2];
      v161[1] = v134;
      v135 = [NSDictionary dictionaryWithObjects:v161 forKeys:v160 count:2];
      [v62 setObject:v135 forKeyedSubscript:@"digitizerPoints"];

      sub_10001D2B0((unint64_t)&v148);
    }

    uint64_t DigitizerAttributes = BKSHIDEventGetDigitizerAttributes(v144);
    v137 = (void *)DigitizerAttributes;
    id v138 = [v137 systemGestureStateChange];
    unint64_t v139 = IOHIDEventGetIntegerValue(v144, 720903LL);
    v140 = [NSNumber numberWithBool:v138];
    [v145 setObject:v140 forKeyedSubscript:@"systemGesturesPossible"];

    v141 = [NSNumber numberWithBool:((v139 >> 7) & 1)];
    [v145 setObject:v141 forKeyedSubscript:@"isCancelling"];

    v142 = [SLGLog sharedInstance];
    [v142 log:v145];
  }
}

void sub_10002BA04( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_10002BE00(int a1)
{
  NSMutableArray *v2 = [NSMutableArray array];
  id v3 = v2;
  if ((a1 & 0x20000) != 0) {
    [v2 addObject:@"Tap"];
  }
  if ((a1 & 0x10) != 0) {
    [v3 addObject:@"Peak"];
  }
  if ((a1 & 8) != 0) {
    [v3 addObject:@"Stop"];
  }
  if ((a1 & 1) != 0) {
    [v3 addObject:@"Range"];
  }
  if ((a1 & 0x100) != 0) {
    [v3 addObject:@"Start"];
  }
  if ((a1 & 2) != 0) {
    [v3 addObject:@"Touch"];
  }
  if ((a1 & 0x80) != 0) {
    [v3 addObject:@"Cancel"];
  }
  if ((a1 & 0x200) != 0) {
    [v3 addObject:@"Resting"];
  }
  if ((a1 & 0x1000000) != 0) {
    [v3 addObject:@"SwipeUp"];
  }
  if ((a1 & 0x2000000) != 0) {
    [v3 addObject:@"SwipeDown"];
  }
  if ((a1 & 0x4000000) != 0) {
    [v3 addObject:@"SwipeLeft"];
  }
  if ((a1 & 0x8000000) != 0) {
    [v3 addObject:@"SwipeRight"];
  }
  if ((a1 & 0x40000) != 0) {
    [v3 addObject:@"SwipeLocked"];
  }
  if ((a1 & 0x2000) != 0) {
    [v3 addObject:@"SwipePending"];
  }
  if ((a1 & 0x20) != 0) {
    [v3 addObject:@"Identity"];
  }
  if ((a1 & 4) != 0) {
    [v3 addObject:@"Position"];
  }
  if ((a1 & 0x40) != 0) {
    [v3 addObject:@"Attribute"];
  }
  if ((a1 & 0x1000) != 0) {
    [v3 addObject:@"FromCorner"];
  }
  if ((a1 & 0x800) != 0) {
    [v3 addObject:@"FromEdgeTip"];
  }
  if ((a1 & 0x400) != 0) {
    [v3 addObject:@"FromEdgeFlat"];
  }
  if ((a1 & 0x8000) != 0) {
    [v3 addObject:@"FromEdgeForceActive"];
  }
  if ((a1 & 0x4000) != 0) {
    [v3 addObject:@"FromEdgeForcePending"];
  }
  if ((a1 & 0x20000000) != 0) {
    [v3 addObject:@"EstimatedAzimuth"];
  }
  if ((a1 & 0x10000000) != 0) {
    [v3 addObject:@"EstimatedAltitude"];
  }
  if ((a1 & 0x40000000) != 0) {
    [v3 addObject:@"EstimatedPressure"];
  }
  id v4 = [v3 componentsJoinedByString:@" "];

  return v4;
}

void sub_10002C044(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10002D1E8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_10002D23C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10002D24C(uint64_t a1)
{
}

id sub_10002D254(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    id v3 = *(void **)(a3 + 16);
  }
  else {
    id v3 = 0LL;
  }
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  _DWORD v5[2] = sub_10002D2BC;
  v5[3] = &unk_1000B6480;
  void v5[4] = *(void *)(a1 + 32);
  return [v3 enumerateKeysAndObjectsUsingBlock:v5];
}

void sub_10002D2BC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v7 = [v6 countByEnumeratingWithState:v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)v10);
        id v12 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
        if (!v12)
        {
          NSMutableDictionary *v13 = [[NSMutableDictionary alloc] init];
          uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 8LL);
          uint64_t v15 = *(void **)(v14 + 40);
          *(void *)(v14 + 40) = v13;

          id v12 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
        }

        [v12 setObject:v5 forKey:v11];
        uint64_t v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:v16 objects:v20 count:16];
    }

    while (v8);
  }
}

id sub_10002D40C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = *(void **)(a1 + 32);
  if (a3) {
    a3 = *(void *)(a3 + 8);
  }
  return _[v3 addEntriesFromDictionary:a3];
}

id sub_10002D41C()
{
  if (qword_1000DBFD8 != -1) {
    dispatch_once(&qword_1000DBFD8, &stru_1000B6430);
  }
  return (id)qword_1000DBFE0;
}

void sub_10002D460(id a1)
{
  BKTouchEventServer *v1 = [[BKTouchEventServer alloc] init];
  uint64_t v2 = (void *)qword_1000DBFE0;
  qword_1000DBFE0 = (uint64_t)v1;
}

id sub_10002D9C8()
{
  if (qword_1000DBFE8 != -1) {
    dispatch_once(&qword_1000DBFE8, &stru_1000B64C8);
  }
  return (id)qword_1000DBFF0;
}

void sub_10002DA0C(id a1)
{
  BKDisplayAnnotationDisplayController *v1 = [[BKDisplayAnnotationDisplayController alloc] init];
  uint64_t v2 = (void *)qword_1000DBFF0;
  qword_1000DBFF0 = (uint64_t)v1;
}

uint64_t sub_10002DA34(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_10002DB38(uint64_t a1, mach_port_t a2, double a3, double a4, double a5)
{
  LODWORD(a3) = *(_DWORD *)(a1 + 56);
  LODWORD(a4) = *(_DWORD *)(a1 + 60);
  LODWORD(a5) = *(_DWORD *)(a1 + 64);
  id result = [*(id *)(a1 + 32) _shouldSendSampleEventWithTimestamp:*(double *)(a1 + 40) samplingInterval:*(double *)(a1 + 48)];
  if ((_DWORD)result)
  {
    sub_10007A340(a2, 0, *(double *)(a1 + 40), *(float *)(a1 + 56), *(float *)(a1 + 60), *(float *)(a1 + 64));
    return _[*(id *)(a1 + 32) _setLastAccelerometerEventTimestamp:*(double *)(a1 + 40)];
  }

  return result;
}

__CFString *sub_10002E518(void *a1)
{
  id v1 = a1;
  if ((sub_1000194E4(v1) & 1) != 0)
  {
    uint64_t v2 = @"mainDisplay";
  }

  else if (v1)
  {
    uint64_t v2 = (__CFString *)v1;
  }

  else
  {
    uint64_t v2 = @"testDisplay";
  }

  return v2;
}

void sub_10002E56C(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 8LL);
  id v3 = sub_10002E518(*(void **)(a1 + 40));
  id v4 = v3;
  id v9 = [v2 objectForKey:v4];

  id v5 = *(_BYTE **)(a1 + 48);
  if (v9)
  {
    if (v5) {
      **(_BYTE **)(a1 + 4_Block_object_dispose(va, 8) = [v9 humanIsPresent];
    }
    if (*(void *)(a1 + 56))
    {
      [v9 proximityInCentimeters];
      **(void **)(a1 + 56) = v6;
    }

    if (*(void *)(a1 + 64)) {
      **(void **)(a1 + 64) = [v9 status];
    }
  }

  else
  {
    if (v5) {
      *id v5 = 0;
    }
    id v7 = *(void **)(a1 + 56);
    if (v7) {
      *id v7 = 0LL;
    }
    id v8 = *(void **)(a1 + 64);
    if (v8) {
      *id v8 = 0LL;
    }
  }
}

void sub_10002E63C(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 8) objectForKey:*(void *)(a1 + 40)];
  id v3 = v2;
  if (v2)
  {
    [v2 setHumanIsPresent:*(unsigned __int8 *)(a1 + 48)];
  }

  else
  {
    uint64_t v4 = BKLogCommon(0LL);
    os_log_s *v5 = v4;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v7 = [*(void *)(a1 + 32) class];
      uint64_t v8 = *(void *)(a1 + 40);
      int v10 = 138543618;
      uint64_t v11 = v7;
      __int16 v12 = 2114;
      uint64_t v13 = v8;
      id v9 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%{public}@: missing sensor record for displayUUID %{public}@",  (uint8_t *)&v10,  0x16u);
    }
  }
}

void sub_10002E734(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKey:[*(id *)(a1 + 40) autorelease]];
  id v3 = v2;
  if (v2)
  {
    [v2 setProximityInCentimeters:*(double *)(a1 + 48)];
  }

  else
  {
    uint64_t v4 = BKLogCommon(0LL);
    os_log_s *v5 = v4;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v7 = [*(void *)(a1 + 32) class];
      uint64_t v8 = *(void *)(a1 + 40);
      int v10 = 138543618;
      uint64_t v11 = v7;
      __int16 v12 = 2114;
      uint64_t v13 = v8;
      id v9 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%{public}@: missing sensor record for displayUUID %{public}@",  (uint8_t *)&v10,  0x16u);
    }
  }
}

void sub_10002E9F8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

id sub_10002F154(uint64_t a1)
{
  id v2 = sub_10003F2F4();
  os_log_s *v3 = v2;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    double v4 = *(double *)(a1 + 40);
    int v15 = 134217984;
    double v16 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Checkpoint after interval: %gs",  (uint8_t *)&v15,  0xCu);
  }

  [*(id *)(a1 + 32) _queue_clearTimer];
  id v5 = *(_DWORD **)(a1 + 32);
  if (v5[11] == 1)
  {
    uint64_t v6 = &kBKSHIDServicesUserEventPresenceExpired;
    return [v5 _queue_postNotification:*v6];
  }

  CFTimeInterval v7 = CACurrentMediaTime();
  uint64_t v8 = *(void *)(a1 + 32);
  double v9 = *(double *)(v8 + 8);
  double v10 = v7 - *(double *)(v8 + 16);
  if (v10 >= v9)
  {
    *(_BYTE *)(v8 + 40) = 1;
    id v5 = *(_DWORD **)(a1 + 32);
    uint64_t v6 = &kBKSHIDServicesUserEventIdled;
    return [v5 _queue_postNotification:*v6];
  }

  double v11 = v9 - v10;
  id v12 = sub_10003F2F4();
  uint64_t v13 = v12;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 134218240;
    double v16 = v11;
    __int16 v17 = 2048;
    double v18 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Rescheduling checkpoint with new interval: %gs (last user event was %gs ago)",  (uint8_t *)&v15,  0x16u);
  }

  return [*(id *)(a1 + 32) _queue_scheduleTimerWithTimeInterval:v11];
}

uint64_t sub_10002F2C8(uint64_t result)
{
  *(_BYTE *)(*(void *)(result + 32) + 56LL) = 1;
  return result;
}

_BYTE *sub_10002F2D8(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 16LL) = *(void *)(a1 + 40);
  id v2 = *(_DWORD **)(a1 + 32);
  int v3 = v2[11];
  if ((v3 - 2) >= 2)
  {
    if (v3 == 1) {
      [v2 _queue_userEventOccurredInPresenceMode];
    }
  }

  else
  {
    [v2 _queue_userEventOccurredInIdleMode];
  }

  id result = *(_BYTE **)(a1 + 32);
  if (result[56])
  {
    id result = [result _queue_postNotification:kBKSHIDServicesUserEventOccurred];
    *(_BYTE *)(*(void *)(a1 + 32) + 56LL) = 0;
  }

  return result;
}

id sub_10002F34C(uint64_t a1)
{
  id v2 = sub_10003F2F4();
  os_log_s *v3 = v2;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = NSStringFromBKSHIDServicesUserEventTimerMode(*(unsigned int *)(a1 + 56));
    uint64_t v5 = [v4 autorelease];
    uint64_t v6 = (void *)v5;
    double v7 = *(double *)(a1 + 40);
    if (v7 == BKSHIDServicesUserEventTimerIntervalForever) {
      double v7 = INFINITY;
    }
    int v15 = 138543618;
    uint64_t v16 = v5;
    __int16 v17 = 2048;
    double v18 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "reset timer to mode:%{public}@ duration:%gs",  (uint8_t *)&v15,  0x16u);
  }

  *(_DWORD *)(*(void *)(a1 + 32) + 44LL) = *(_DWORD *)(a1 + 56);
  *(void *)(*(void *)(a1 + 32) + 8LL) = *(void *)(a1 + 40);
  if (*(_DWORD *)(a1 + 56) != 3) {
    *(void *)(*(void *)(a1 + 32) + 24LL) = *(void *)(a1 + 48);
  }
  uint64_t v8 = *(void *)(a1 + 32);
  int v9 = *(_DWORD *)(v8 + 44);
  if (!v9) {
    return [v8 _queue_clearTimer];
  }
  double v10 = *(double *)(v8 + 8);
  switch(v9)
  {
    case 1:
      *(_BYTE *)(v8 + 40) = 1;
      break;
    case 3:
      *(_BYTE *)(v8 + 40) = 0;
      double v12 = CACurrentMediaTime();
      uint64_t v13 = *(double **)(a1 + 32);
      double v14 = v13[3];
      if (v13[2] >= v14) {
        double v14 = v13[2];
      }
      double v10 = fmax(v13[1] - (v12 - v14), 0.0);
      break;
    case 2:
      *(_BYTE *)(v8 + 40) = 0;
      break;
  }

  return [*(id *)(a1 + 32) _queue_scheduleTimerWithTimeInterval:v10];
}

double sub_10002F4D8(uint64_t a1)
{
  double result = *(double *)(*(void *)(a1 + 32) + 16LL);
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = result;
  return result;
}

void sub_10002F4EC(uint64_t a1)
{
  *(_BYTE *)(*(void *)(a1 + 32) + 57LL) = 1;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, kBKSHIDServicesSafeToSetIdleTimerNotification, 0LL, 0LL, 1u);
}

id sub_10002F524(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained descriptionBuilderWithMultilinePrefix:stru_1000BB628];
  int v3 = (void *)[v2 build];

  return v3;
}

void sub_10002F5BC(id a1)
{
  BKUserEventTimer *v1 = [[BKUserEventTimer alloc] init];
  id v2 = (void *)qword_1000DBFF8;
  qword_1000DBFF8 = (uint64_t)v1;
}

id sub_10002FC2C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _queue_finishBootingIfNecessaryAndTellObservers:1];
}

id sub_10002FC38(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) removeObject:*(void *)(a1 + 40)];
}

id sub_10002FC44(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) addObject:*(void *)(a1 + 40)];
}

void *sub_10002FC50(void *result)
{
  if (*((_BYTE *)result + 40))
  {
    id v1 = result;
    uint64_t v2 = [*(id *)(result[4] + 8) addSystemShellObserver:result[4] reason:@"first boot detection"];
    uint64_t v3 = v1[4];
    uint64_t v4 = *(void **)(v3 + 24);
    *(void *)(v3 + 24) = v2;

    return [v1[4] _queue_finishBootingIfNecessaryAndTellObservers:0];
  }

  return result;
}

void sub_10002FCF0(id a1)
{
  BKFirstBootDetector *v1 = [[BKFirstBootDetector alloc] init];
  id v6 = [BKSystemShellSentinel sharedInstance];
  uint64_t v2 = (void *)[BKFirstBootKernelSemaphoreToken token];
  uint64_t v3 = [BKAlternateSystemAppManager sharedInstance];
  BKFirstBootDetector *v4 = [[BKFirstBootDetector alloc] initWithSystemAppSentinel:v6 firstBootToken:v2 alternateSystemAppManager:v3];
  uint64_t v5 = (void *)qword_1000DC008;
  qword_1000DC008 = (uint64_t)v4;
}

id sub_1000300E4(uint64_t a1)
{
  id v2 =  [*(id *)(a1 + 32) appendUInt64:*(void *)(*(void *)(a1 + 40) + 8) withName:@"senderID" format:1];
  id v3 =  [*(id *)(a1 + 32) appendUnsignedInteger:*(void *)(*(void *)(a1 + 40) + 16) withName:@"page" format:1];
  return  [*(id *)(a1 + 32) appendUnsignedInteger:*(void *)(*(void *)(a1 + 40) + 24) withName:@"usage" format:1];
}

void sub_1000306D8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, id location)
{
}

void sub_100032360(_Unwind_Exception *a1)
{
}

LABEL_41:
      id v25 = v40;
      id v24 = v55;
      __int16 v27 = v56;
      uint64_t v26 = (void *)v57;
      uint64_t v29 = v59;
      double v20 = v50;
      id v23 = v52;
    }

    else
    {

      uint64_t v26 = (void *)v57;
    }

    id v28 = v60;
    goto LABEL_44;
  }

        uint64_t v42 = v42;
        double v41 = v42;
        goto LABEL_42;
      }
    }

    else
    {
      double v43 = BKLogTouchEvents(v23, v24);
      os_log_s *v44 = v43;
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)&uint8_t buf[4] = v8;
        *(_WORD *)&uint8_t buf[8] = 1024;
        *(_DWORD *)&buf[10] = __src[0];
        _os_log_error_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_ERROR,  "auth spec context mismatch between down:%X up:%X",  buf,  0xEu);
      }

      if (DWORD1(__src[0]) == *(_DWORD *)(a2 + 24)) {
        goto LABEL_30;
      }
    }

    double v45 = BKLogTouchEvents(v27, v28);
    double v46 = [v45 autorelease];
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      id v52 = *(_DWORD *)(a2 + 24);
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&uint8_t buf[4] = v52;
      *(_WORD *)&uint8_t buf[8] = 1024;
      *(_DWORD *)&buf[10] = DWORD1(__src[0]);
      _os_log_error_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_ERROR,  "ignoring auth spec: slotID changed between down:%X and up:%X",  buf,  0xEu);
    }

LABEL_30:
    uint64_t v42 = 0LL;
    double v47 = 1;
    goto LABEL_39;
  }

  double v41 = 0LL;
  return v41;
}

LABEL_37:
  uint64_t v29 = [v26 sequenceForFirstEvent:v28 sender:v61 processor:v22 dispatcher:v24 additionalContext:v31];
LABEL_44:
  [v22->_keyDownToEventSequence setObject:v29 forKey:v20];
  if (v62) {
    __int128 v33 = 1LL;
  }
  else {
    __int128 v33 = 3LL;
  }
LABEL_47:
  [v29 postEvent:v28 position:v33 additionalContext:v31];
  if (v29 && !v62) {
    [v22->_keyDownToEventSequence removeObjectForKey:v20];
  }
  double v45 = sub_10003F4C4();
  double v46 = [os_log_s class];
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
  {
    double v47 = [BSDescriptionStream descriptionForRootObject:v22->_keyDownToEventSequence];
    double v48 = v23;
    uint64_t v49 = (void *)v47;
    *(_DWORD *)buf = 138543362;
    uint64_t v69 = (_BKKeyDownKey *)v47;
    _os_log_debug_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEBUG, "keys down: %{public}@", buf, 0xCu);

    id v23 = v48;
  }
}

void sub_100033A34( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, id a17)
{
}

id sub_100034F40(id a1, BKKeyboardInfo *a2)
{
  return sub_10005320C(a2);
}

void sub_100034F48(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 appendString:@"("];
  BSDescriptionStreamAppendBKSKeyModifierFlags(v3, *(void *)(*(void *)(a1 + 32) + 80LL));
  [v3 appendString:@""]);
}

id sub_100034FA4(id a1, BKIOHIDService *a2)
{
  id v3 = a2;
  if (-[BKIOHIDService primaryUsagePage](v3, "primaryUsagePage") == 1
    && -[BKIOHIDService primaryUsage](v3, "primaryUsage") == 6
    || (-[BKIOHIDService claimsToConformToUsagePage:usage:]( v3,  "claimsToConformToUsagePage:usage:",  65LL,  1LL) & 1) != 0)
  {
LABEL_7:
    id v6 = v3;
    [BKKeyboardInfo alloc] init];
    BKKeyboardInfo *v7 = [[BKKeyboardInfo alloc] init];
    uint64_t v8 = v6;
    if (!v7)
    {
LABEL_21:

      goto LABEL_25;
    }

    v7->_service = a2;
    NSString *v10 = [v8 propertyOfClass:[NSString class] forKey:@"Transport"];
    uint64_t v11 = [v10 autorelease];
    transport = v7->_transport;
    v7->_transport = (NSString *)v11;

    NSNumber *v14 = [v8 propertyOfClass:[NSNumber class] forKey:@"ProductID"];
    uint64_t v15 = [v14 autorelease];
    productID = v7->_productID;
    v7->_productID = (NSNumber *)v15;

    NSNumber *v18 = [v8 propertyOfClass:[NSNumber class] forKey:@"VendorID"];
    uint64_t v19 = [v18 autorelease];
    vendorID = v7->_vendorID;
    v7->_vendorID = (NSNumber *)v19;

    NSNumber *v22 = [v8 propertyOfClass:[NSNumber class] forKey:@"HIDVirtualDevice"];
    uint64_t v23 = [v22 autorelease];
    virtualDeviceID = v7->_virtualDeviceID;
    v7->_virtualDeviceID = (NSNumber *)v23;

    v7->_keyboarduint64_t Type = 0;
    id v25 = [v8 propertyForKey:@"StandardType"];
    char v72 = v25;
    v73 = v3;
    if (v25)
    {
      unsigned int v26 = [v25 unsignedIntValue];
      v7->_keyboarduint64_t Type = v26;
      if (v26 != -1) {
        goto LABEL_13;
      }
    }

    else
    {
      v7->_keyboarduint64_t Type = -1;
    }

    v7->_wantsStandardTypeOverride = 1;
LABEL_13:
    char v71 = [BKSDefaults localDefaults];
    __int16 v27 = (void *)[v71 keyboardTypeRemap];
    id v28 = sub_100052934((uint64_t)v7);
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    id v30 = [v27 objectForKey:v29];

    if (v30 && [v30 unsignedIntValue] != v7->_keyboardType)
    {
      id v32 = [v30 unsignedIntValue];
      v7->_keyboarduint64_t Type = v32;
      service = v7->_service;
      NSNumber *v34 = [NSNumber numberWithUnsignedInt:v32];
      [service setProperty:v34 forKey:@"StandardType"];

      v7->_wantsStandardTypeOverride = 1;
    }

    NSNumber *v35 = [v8 propertyOfClass:[NSNumber class] forKey:@"CountryCode"];
    id v36 = v35;
    v7->_countryCode = [v36 unsignedCharValue];
    id v38 = [v8 propertyOfClass:[NSString class] forKey:@"KeyboardLanguage"];
    uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
    id v40 = (NSString *)[v39 copy];
    keyboardLanguage = v7->_keyboardLanguage;
    v7->_keyboardLanguage = v40;

    NSString *v43 = [v8 propertyOfClass:[NSString class] forKey:@"exclusivityIdentifier"];
    double v44 = [v43 doubleValue];
    double v45 = (NSString *)[v44 copy];
    exclusivityIdentifier = v7->_exclusivityIdentifier;
    v7->_exclusivityIdentifier = v45;

    [v8 propertyOfClass:[NSNumber class] forKey:@"HIDSubinterfaceID"];
    uint64_t v49 = [v48 autorelease];
    v7->_subinterfaceID = (int64_t)[v49 integerValue];
    NSNumber *v51 = [v8 propertyOfClass:[NSNumber class] forKey:@"CapsLockLanguageSwitch"];
    v52 = v51;
    unsigned __int8 v53 = [v52 BOOLValue];

    v7->_capsLockKeyHasLanguageSwitchLabel = v53;
    BOOL v55 = [v8 propertyOfClass:[NSNumber class] forKey:@"SupportsGlobeKey"];
    __int128 v56 = v55;
    unsigned __int8 v57 = [v56 BOOLValue];

    v7->_globeKeyLabelHasGlobeSymbol = v57;
    [v8 propertyOfClass:[NSNumber class] forKey:@"KeyboardEnabledByEvent"];
    uint64_t v60 = [v59 autorelease];
    uint64_t v61 = v60;
    if (v60) {
      v7->_shouldActivateByGesture = [v60 BOOLValue];
    }
    id v62 = sub_10005296C(v7);
    uint64_t v63 = [v62 autorelease];
    if (v63) {
      [*v70 setProperty:v63 forKey:@"HIDKeyboardModifierMappingPairs"];
    }

    uint64_t v64 = v7;
    id v3 = v73;
    goto LABEL_21;
  }

  uint64_t v4 = [v3 propertyForKey:@"DeviceTypeHint"];
  uint64_t v5 = (void *)v4;
  if (v4)
  {
    uint64_t v4 = (uint64_t)[(id)v4 isEqualToString:@"Trackpad"];
    if ((v4 & 1) != 0)
    {

      goto LABEL_7;
    }
  }

  uint64_t v65 = BKLogKeyboard(v4);
  os_log_s *v66 = v65;
  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
  {
    double v67 = [BKIOHIDService propertyForKey:@"Manufacturer"];
    double v68 = [v3 propertyForKey:@"Product"];
    *(_DWORD *)buf = 138543874;
    uint64_t v75 = v67;
    __int16 v76 = 2114;
    NSSize v77 = v68;
    __int16 v78 = 2114;
    v79 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v66,  OS_LOG_TYPE_DEFAULT,  "Ignoring service with secondary keyboard usage: %{public}@/%{public}@/%{public}@",  buf,  0x20u);
  }

  double v7 = 0LL;
LABEL_25:

  return v7;
}

id sub_1000354E4(uint64_t a1, uint64_t a2, void *a3)
{
  return _[a3 bufferDidDrain:*(void *)(a1 + 32)];
}

void sub_1000354F4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = objc_loadWeakRetained((id *)(a1 + 40));
    [v2 smartKeyboardAttachmentStateDidChange:WeakRetained];
  }
}

void sub_100035544(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setEventType:3];
  [v3 setOriginIdentifier:0xC181BADB23D8497BLL];
  [v3 setContext:*(void *)(a1 + 32)];
  [v3 setVersionedPID:*(void *)(a1 + 40)];
  [v3 setRegistrantEntitled:1];
}

void sub_1000355B8(uint64_t a1, void *a2, void *a3)
{
  double v12 = a2;
  id v5 = a3;
  if (!v12)
  {
    if (*(void *)(a1 + 32)) {
      goto LABEL_5;
    }
    uint64_t v6 = 0LL;
    uint64_t v7 = 0LL;
    goto LABEL_4;
  }

  if (v12[1] == *(void *)(a1 + 32))
  {
    uint64_t v6 = *((unsigned __int16 *)v12 + 8);
    uint64_t v7 = *((unsigned __int16 *)v12 + 12);
LABEL_4:
    KeyboardEvent = (const void *)IOHIDEventCreateKeyboardEvent(0LL, *(void *)(a1 + 40), v6, v7, 0LL, 0LL);
    id v9 = [v5 firstAdditionalContext:IOHIDEventSetSenderID(KeyboardEvent, *(void *)(a1 + 32)).n128_f64[0]];
    id v10 = v9;
    id v11 = [v10 copy];

    [v5 postEvent:KeyboardEvent position:3 additionalContext:v11];
    CFRelease(KeyboardEvent);
  }

LABEL_5:
}

void sub_100035690(void *a1)
{
  id v2 = [*(id *)(a1[4] + 128) objectForKeyedSubscript:a1[5]];
  id v3 = [v2 integerValue];

  if ((id)a1[6] == v3) {
    [*(id *)(a1[4] + 128) removeObjectForKey:a1[5]];
  }
}

void sub_1000356F8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
}

id sub_100035744(id a1, BKKeyboardInfo *a2)
{
  return sub_10005320C(a2);
}

void sub_10003574C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 2);
    uint64_t v6 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
    if (v3)
    {
      uint64_t v7 = BKLogKeyboard(v6);
      uint64_t v8 = v7;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v10 = 138412290;
        id v11 = v3;
        _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "error in setConnectedKeyboards response:%@",  (uint8_t *)&v10,  0xCu);
      }
    }

    else if (*(void *)(a1 + 56) != *(void *)&v5[6]._os_unfair_lock_opaque)
    {
      id v9 = [v5[10]._os_unfair_lock_opaque bs_map:&stru_1000B6690];
      [v5 _lock_publishUsableKeyboards:v9 toServiceConnection:*(void *)(a1 + 32)];
    }

    os_unfair_lock_unlock(v5 + 2);
  }
}

id sub_100035884(id a1, BKKeyboardInfo *a2)
{
  return sub_10005320C(a2);
}

uint64_t sub_10003588C(int a1, int a2)
{
  if (qword_1000DC020 != -1) {
    dispatch_once(&qword_1000DC020, &stru_1000B6810);
  }
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id v2 = (id)qword_1000DC018;
  id v3 = [v2 countByEnumeratingWithState:v33 objects:v39 count:16];
  if (v3)
  {
    id v5 = v3;
    char v30 = 0;
    uint64_t v6 = *(void *)v34;
    *(void *)&__int128 v4 = 138543362LL;
    __int128 v29 = v4;
    while (1)
    {
      for (uint64_t i = 0LL; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v34 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
        id v9 = [v8 objectForKey:@"productID"];
        uint64_t v11 = [NSNumber class];
        id v12 = v9;
        uint64_t v13 = v12;
        if (v11)
        {
          if ((objc_opt_isKindOfClass(v12, v11) & 1) != 0) {
            id v14 = v13;
          }
          else {
            id v14 = 0LL;
          }
        }

        else
        {
          id v14 = 0LL;
        }

        id v15 = v14;

        uint64_t v16 = (void *)[v8 objectForKey:@"vendorID"];
        NSNumber *v18 = v17;
        id v19 = v16;
        double v20 = v19;
        if (v18)
        {
          if ((objc_opt_isKindOfClass(v19, v18) & 1) != 0) {
            uint64_t v21 = v20;
          }
          else {
            uint64_t v21 = 0LL;
          }
        }

        else
        {
          uint64_t v21 = 0LL;
        }

        id v22 = v21;

        if (!v15 || !v22)
        {
          uint64_t v27 = BKLogKeyboard(v23);
          os_log_s *v26 = v27;
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v29;
            uint64_t v38 = qword_1000DC018;
            _os_log_error_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "Unfamiliar MG query result format: %{public}@",  buf,  0xCu);
          }

          goto LABEL_27;
        }

        if ([v15 unsignedIntValue] == a2)
        {
          id v24 = [v22 unsignedIntValue];
          if ((_DWORD)v24 == a1)
          {
            uint64_t v25 = BKLogKeyboard(v24);
            unsigned int v26 = [v25 autorelease];
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Keyboard requires HES workaround for open",  buf,  2u);
            }

            char v30 = 1;
LABEL_27:
          }
        }
      }

      id v5 = [v2 countByEnumeratingWithState:&v33 objects:v39 count:16];
      if (!v5) {
        goto LABEL_32;
      }
    }
  }

  char v30 = 0;
LABEL_32:

  return v30 & 1;
}

void sub_100035B74(id a1)
{
  id v1 = (void *)MGCopyAnswer(@"StrictWakeKeyboardCases", 0LL);
  uint64_t v3 = [NSArray class];
  id v4 = v1;
  id v5 = v4;
  if (v3)
  {
    if ((objc_opt_isKindOfClass(v4, v3) & 1) != 0) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0LL;
    }
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  id v7 = v6;

  uint64_t v8 = (void *)qword_1000DC018;
  qword_1000DC018 = (uint64_t)v7;

  if (!qword_1000DC018)
  {
    uint64_t v9 = BKLogKeyboard();
    uint64_t v10 = [v9 autorelease];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138543362;
      id v12 = v5;
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Unfamiliar MG query result format: %{public}@",  (uint8_t *)&v11,  0xCu);
    }
  }
}

void sub_100035C90(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  id v4 = v3;
  if (v3) {
    id v5 = (void *)v3[3];
  }
  else {
    id v5 = 0LL;
  }
  id v6 = v5;
  id v7 = [v6 senderID];

  uint64_t v8 = [NSNumber numberWithUnsignedLongLong:v7];
  uint64_t v9 = (void *)[*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:v8];

  if (!v9)
  {
    if (v4) {
      uint64_t v10 = (void *)v4[3];
    }
    else {
      uint64_t v10 = 0LL;
    }
    id v11 = v10;
    id v12 = [v11 propertyForKey:@"VendorID"];
    int v13 = [v12 unsignedIntValue];
    id v14 = [v11 propertyForKey:@"ProductID"];
    int v15 = sub_10003588C(v13, (int)[v14 unsignedIntValue]);

    if (v15)
    {
      ++*(void *)(*(void *)(a1 + 32) + 96LL);
      uint64_t v17 = *(void *)(a1 + 32);
      if (*(void *)(v17 + 96) == 1LL)
      {
        BKSmartCoverHIDEventProcessor *v18 = [*(id *)(v17 + 168) eventProcessorOfClass:[BKSmartCoverHIDEventProcessor class]];
        v19 = v18;
        [v19 setAttachedCoverRequiresWorkaroundForOpenState:1];
      }
    }

    if (v4) {
      double v20 = (void *)v4[3];
    }
    else {
      double v20 = 0LL;
    }
    id v21 = v20;
    [v21 addDisappearanceObserver:*(void *)(a1 + 32) queue:&_dispatch_main_q];

    uint64_t v22 = BKLogKeyboard([*(id *)(*(void *)(a1 + 32) + 32) setObject:v4 forKeyedSubscript:v8]);
    uint64_t v23 = [os_log_s class];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 138543362;
      uint64_t v25 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Keyboard attached: %{public}@",  (uint8_t *)&v24,  0xCu);
    }

    [*(id *)(a1 + 32) _lock_watchForGestures:v4];
  }
}

id sub_100035ED8(id a1, NSNumber *a2, BKKeyboardInfo *a3)
{
  id v4 = a3;
  NSInteger v5 = [a2 integerValue];
  if (v4) {
    int64_t activeModifiers = v4->_activeModifiers;
  }
  else {
    int64_t activeModifiers = 0LL;
  }

  return [NSNumber numberWithInteger:activeModifiers | v5];
}

id sub_100035F34(id a1, BKKeyboardInfo *a2)
{
  return sub_10005320C(a2);
}

BOOL sub_100035F3C(uint64_t a1, void *a2)
{
  return [a2 senderID] == *(id *)(a1 + 32);
}

id sub_100035F6C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeRecognizer:a2];
}

id sub_100035F78(uint64_t a1)
{
  uint64_t v2 = BKLogKeyboard();
  uint64_t v3 = [v2 autorelease];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 138412290;
    uint64_t v7 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "external defaults did change %@",  (uint8_t *)&v6,  0xCu);
  }

  return [*(id *)(a1 + 40) _modifierRemappingsDidChange];
}

__CFString *sub_100036024(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    uint64_t v2 = [BSDescriptionStream descriptionForRootObject:WeakRetained];
  }
  else {
    uint64_t v2 = @"<nil>";
  }

  return v2;
}

void sub_1000360C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100036158(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000366C4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, void *a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, id location)
{
  objc_destroyWeak(v43);
  objc_destroyWeak(v44);

  [location release];
  _Unwind_Resume(a1);
}

void sub_10003687C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  uint64_t v10 = v9;
  a9.receiver = v10;
  a9.super_class = [BKHIDDirectTouchEventProcessor class];
  [_Unwind_Exception dealloc];
  _Unwind_Resume(a1);
}

void sub_100036924( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
}

void sub_100036E74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100036F68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100037104( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, void *a21)
{
  _Unwind_Resume(a1);
}

void sub_100037800(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100037ACC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100037C90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100037DFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000380B8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
}

void sub_1000384D4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, void *a27, uint64_t a28, char a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, id a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, id a39, uint64_t a40, char a41)
{
  _Block_object_dispose(&a41, 8);
  _Unwind_Resume(a1);
}

LABEL_7:
  return 0LL;
}

  NSInteger v5 = [v3 componentsJoinedByString:@","];
  NSString *v6 = [NSString stringWithFormat:@"(%@)", v5];

  return v6;
}

void sub_1000387F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100038C9C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_100038F8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100039190(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003987C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100039A4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100039B58(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_100039EA8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  _Unwind_Resume(a1);
}

void sub_100039F48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003A178(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003A26C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003A4C4(_Unwind_Exception *exception_object)
{
}

LABEL_26:
    uint64_t v23 = 0;
    uint64_t v22 = 0LL;
    goto LABEL_27;
  }

  uint64_t v22 = [self mainDisplayPencilDigitizerService];
  if (!v22)
  {
    uint64_t v25 = BKLogTouchEvents(0LL, v24);
    os_log_s *v26 = v25;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v32) = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "Pencil AX event, but pencil digitizer is missing",  (uint8_t *)&v32,  2u);
    }

LABEL_18:
    uint64_t v22 = [self mainDisplayDigitizerService];
  }

  uint64_t Type = IOHIDEventGetType(a3, v24);
  if ((_DWORD)Type == 11)
  {
    uint64_t Type = IOHIDEventGetIntegerValue(a3, 720921LL);
    uint64_t v23 = Type == 0;
    if (v22) {
      goto LABEL_27;
    }
  }

  else
  {
    uint64_t v23 = 0;
    if (v22) {
      goto LABEL_27;
    }
  }

  if (!v23)
  {
    __int128 v29 = BKLogTouchEvents(Type, v28);
    uint64_t v17 = v29;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v32) = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "AX event, but main screen digitizer is missing",  (uint8_t *)&v32,  2u);
    }

    goto LABEL_26;
  }

void sub_10003A780(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003A908(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003AB58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003ACB8(uint64_t a1)
{
  uint64_t v3 = [v4 _queue_digitizerStateForService:v5];
  if (!v3)
  {
    uint64_t v4 = BKLogTouchEvents(0LL, v2);
    NSInteger v5 = [v4 autorelease];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      int v7 = 138543362;
      uint64_t v8 = v6;
      _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "*** unknown digitizer %{public}@ -- initializing now",  (uint8_t *)&v7,  0xCu);
    }

    uint64_t v3 = [*(id *)(a1 + 32) _queue_addDigitizerStateForService:*(void *)(a1 + 40)];
  }

  sub_10005C98C((uint64_t)v3, *(__IOHIDEvent **)(a1 + 48));
}

void sub_10003AD9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003ADB4(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = BKLogTouchEvents(WeakRetained, v2);
  uint64_t v4 = [v3];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    uint64_t v6 = WeakRetained;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "invalidate touch stream (process-exit) %{public}@",  (uint8_t *)&v5,  0xCu);
  }

  sub_10006751C(WeakRetained);
}

void sub_10003AE68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10003AE84(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 104LL) = *(void *)(a1 + 40);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  _OWORD v3[2] = sub_10003AEE4;
  v3[3] = &unk_1000B6AC8;
  id v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return [v1 _queue_enumerateDigitizersForAllDisplaysUsingBlock:v3];
}

void sub_10003AEE4(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    *(void *)(a2 + 104) = *(void *)(a1 + 32);
    uint64_t v3 = (void *)[*(id *)(a2 + 8) displayUUID];
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    id obj = [*(id *)(a2 + 120) allValues];
    id v4 = [obj countByEnumeratingWithState:v30 objects:v35 count:16];
    if (v4)
    {
      uint64_t v22 = *(void *)v31;
      do
      {
        id v23 = v4;
        for (uint64_t i = 0LL; i != v23; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v31 != v22) {
            objc_enumerationMutation(obj);
          }
          uint64_t v6 = *(void *)(*((void *)&v30 + 1) + 8LL * (void)i);
          if (v6) {
            uint64_t v7 = *(unsigned int *)(v6 + 8);
          }
          else {
            uint64_t v7 = 0LL;
          }
          int v24 = (void *)[*(id *)(a2 + 128) objectForKey:v7];
          if ([v24 count])
          {
            sub_100059314((uint64_t)v29, (void *)a2, 0LL);
            NSMutableArray *v8 = [[NSMutableArray alloc] init];
            __int128 v27 = 0u;
            __int128 v28 = 0u;
            __int128 v25 = 0u;
            __int128 v26 = 0u;
            id v9 = v24;
            id v10 = [v9 countByEnumeratingWithState:v25 objects:v34 count:16];
            if (v10)
            {
              uint64_t v11 = *(void *)v26;
              do
              {
                id v12 = 0LL;
                do
                {
                  if (*(void *)v26 != v11) {
                    objc_enumerationMutation(v9);
                  }
                  uint64_t v13 = *(void *)(*((void *)&v25 + 1) + 8LL * (void)v12);
                  sub_10005C4F0(v13, (uint64_t)v29, 4LL);
                  if (v6) {
                    uint64_t v14 = *(unsigned int *)(v6 + 8);
                  }
                  else {
                    uint64_t v14 = 0LL;
                  }
                  int v15 = sub_10005ED94(a2, v13, v14, (uint64_t)v3, 1LL);
                  uint64_t v16 = [v15 autorelease];
                  [v8 addObject:v16];

                  id v12 = (char *)v12 + 1;
                }

                while (v10 != v12);
                BOOL v17 = [v9 countByEnumeratingWithState:v25 objects:v34 count:16];
                id v10 = v17;
              }

              while (v17);
            }

            id v19 = (const void *)sub_10005948C(v29, v18);
            BKHIDEventCollector *v20 = [[BKHIDEventCollector alloc] init];
            sub_10005AACC((void *)a2, (uint64_t)v19, v6, (uint64_t)v20, 0, v8, *(double *)(a2 + 96));
            sub_100057E60(a2, (uint64_t)v20);

            if (v19) {
              CFRelease(v19);
            }

            sub_10005A9E8((uint64_t)v29);
          }
        }

        id v4 = [obj countByEnumeratingWithState:v30 objects:v35 count:16];
      }

      while (v4);
    }
  }

void sub_10003B19C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

id sub_10003B248(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  id result = [*(id *)(a1 + 32) containsObject:a2];
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
    *a4 = 1;
  }

  return result;
}

uint64_t sub_10003B28C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10003B29C(uint64_t a1)
{
}

void sub_10003B2A4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _queue_servicesMatchingSenderDescriptor:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  int v5 = *(void **)(a1 + 48);
  if (v5)
  {
    unsigned int v6 = [v5 BOOLValue];
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id v7 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
    id v8 = [v7 countByEnumeratingWithState:v17 objects:v25 count:16];
    if (v8)
    {
      uint64_t v10 = *(void *)v18;
      *(void *)&__int128 v9 = 67109378LL;
      __int128 v16 = v9;
      do
      {
        uint64_t v11 = 0LL;
        do
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          _BYTE *v12 = [v17 _queue_digitizerStateForService:v16];
          uint64_t v14 = BKLogTouchEvents(v12, v13);
          int v15 = (os_log_s *)v14;
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v16;
            unsigned int v22 = v6;
            __int16 v23 = 2114;
            int v24 = v12;
            _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "apply hoverDisabled:%{BOOL}u to %{public}@",  buf,  0x12u);
          }

          if (v12) {
            v12[209] = v6;
          }

          uint64_t v11 = (char *)v11 + 1;
        }

        while (v8 != v11);
        id v8 = [v7 countByEnumeratingWithState:v17 objects:v25 count:16];
      }

      while (v8);
    }
  }

void sub_10003B460(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003B490(id a1)
{
  NSSet *v1 = [NSSet setWithObjects:@"InputDetectionMode", @"TouchDetectionMode", @"HostStateNotification", nil];
  uint64_t v2 = (void *)qword_1000DC038;
  qword_1000DC038 = (uint64_t)v1;
}

void sub_10003B4E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    id v4 = *(void **)(a3 + 24);
  }
  else {
    id v4 = 0LL;
  }
  id v5 = v4;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10003B53C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_10003B550(uint64_t a1, uint64_t a2, id *a3)
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v4 = sub_100005584(a3);
  id v5 = v4;
  unsigned int v6 = [v5 countByEnumeratingWithState:v9 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))(*(void *)(a1 + 32));
        ++v8;
      }

      while (v6 != v8);
      unsigned int v6 = [v5 countByEnumeratingWithState:v9 objects:v13 count:16];
    }

    while (v6);
  }
}

void sub_10003B648(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003B668(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 length];
  id v4 = (void *)BKSDisplayUUIDMainKey;
  if (v3) {
    id v4 = v2;
  }
  id v43 = v4;

  id v5 = [*(id *)(*(void *)(a1 + 40) + 120) objectForKeyedSubscript:v43];
  unsigned int v6 = sub_100005584(v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  uint64_t v8 = [v7 firstObject];
  if (v8)
  {
    double v9 = *(double *)(a1 + 64);
    double v10 = *(double *)(a1 + 72);
    int v11 = *(_DWORD *)(a1 + 80);
    __int128 v12 = *(void **)(a1 + 56);
    uint64_t v42 = *(void **)(a1 + 48);
    memset(v46, 0, 304);
    uint64_t v13 = [BKDisplayController displayController];
    uint64_t v14 = v13;
    int v15 = *(void **)(v8 + 40);
    if (v15) {
      int v15 = (void *)v15[1];
    }
    __int128 v16 = v15;
    __int128 v17 = (void *)[*(id *)(v8 + 8) displayUUID];
    int v41 = v11;
    id v45 = 0LL;
    unsigned __int8 v18 = [v16 contextIDAtCAScreenLocation:v17 displayUUID:v14 options:v45 securityAnalysis:v46 results:v9];
    id v19 = v45;

    if ((v18 & 1) != 0)
    {
      if (v19) {
        [v42 setSecurityAnalysis:v19];
      }
      if (DWORD1(v46[0]))
      {
        uint64_t v20 = [*(id *)(v8 + 16) _queue_slotRecordForSlotID:];
        id v21 = (void *)v20;
        if (v20)
        {
          id v22 = *(id *)(v20 + 16);
          __int16 v23 = [BKDisplayController sub_100007730:v22];
          int v24 = [v23 autorelease];

          id v40 = [*(id *)(v8 + 8) displayUUID];
          __int128 v25 = *(void **)(v8 + 40);
          if (v25) {
            __int128 v25 = (void *)v25[1];
          }
          __int128 v26 = v25;
          unsigned int v27 = [v26 contextIDAtCAScreenLocation:v40 displayUUID:v24 options:0 securityAnalysis:v46 results:v9];

          if (DWORD1(v46[0])) {
            unsigned int v28 = v27;
          }
          else {
            unsigned int v28 = 0;
          }
          if (v28 == 1)
          {
            __int128 v29 = [BKTouchDestination initWithTouchDestination:v46[0]];
            id v44 = [v29 autorelease];
            BKTouchContact *v30 = [[BKTouchContact alloc] init];
            v30->_slotID = DWORD1(v46[0]);
            id v31 = sub_1000075CC((uint64_t)v46);
            uint64_t v32 = [v31 autorelease];
            hitTestInformationAtDown = v30->_hitTestInformationAtDown;
            v30->_hitTestInformationAtDown = (BKSHIDEventHitTestLayerInformation *)v32;

            NSArray *v34 = @[v44];
            hostingChain = v30->_hostingChain;
            v30->_hostingChain = v34;

            sub_10001A778(v40);
            v30->_denormalizedLocation.hitTestLocation.x = v36;
            v30->_denormalizedLocation.hitTestLocation.y = v37;
            id v38 = sub_10005BB70(v8, (uint64_t)v30, v41, (uint64_t)v44);
            uint64_t v39 = [v38 autorelease];
            [v42 setAuthenticationMessage:v39];
          }
        }
      }
    }
  }
}

void sub_10003B9A0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, void *a11, uint64_t a12, uint64_t a13, id a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_10003BA48()
{
}

void sub_10003BA50()
{
}

void sub_10003BA58()
{
}

void sub_10003BA60()
{
}

void sub_10003BA68()
{
}

void sub_10003BA74(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 144LL))
  {
    NSMutableDictionary *v2 = [[NSMutableDictionary alloc] init];
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 144);
    *(void *)(v3 + 144) = v2;
  }

  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v5 = *(id *)(a1 + 40);
  id v6 = [v5 countByEnumeratingWithState:v25 objects:v31 count:16];
  if (v6)
  {
    uint64_t v8 = *(void *)v26;
    *(void *)&__int128 v7 = 67109120LL;
    __int128 v24 = v7;
    do
    {
      for (uint64_t i = 0LL; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
        id v11 = [v10 slotID:v24, v25];
        NSNumber *v12 = [NSNumber numberWithUnsignedInt:v11];
        uint64_t v13 = (void *)[*(id *)(*(void *)(a1 + 32) + 144) objectForKeyedSubscript:v12];
        BOOL v14 = v13 == 0LL;

        if (v14)
        {
          BKTouchAuthenticationSlotRecord *v19 = [[BKTouchAuthenticationSlotRecord alloc] init];
          uint64_t v18 = (uint64_t)v19;
          if (v19)
          {
            v19->_authenticationSpecification = v10;
            *(_BYTE *)(v18 + _Block_object_dispose(va, 8) = *(_BYTE *)(a1 + 48);
            *(void *)(v18 + 24) = 1LL;
          }

          if (*(_BYTE *)(a1 + 48) && [v10 initialSampleEvent] == (id)2)
          {
            uint64_t v20 = *(void **)(*(void *)(a1 + 32) + 152LL);
            if (!v20)
            {
              NSMutableOrderedSet *v21 = [[NSMutableOrderedSet alloc] init];
              uint64_t v22 = *(void *)(a1 + 32);
              __int16 v23 = *(void **)(v22 + 152);
              *(void *)(v22 + 152) = v21;

              uint64_t v20 = *(void **)(*(void *)(a1 + 32) + 152LL);
            }

            [v20 removeObject:v12];
            [*(id *)(*(void *)(a1 + 32) + 152) insertObject:v12 atIndex:0];
          }

          [*(id *)(*(void *)(a1 + 32) + 144) setObject:v18 forKey:v12];
          [*(id *)(a1 + 32) _queue_resetTouchAuthenticationInitialSampleEvent];
        }

        else
        {
          uint64_t v17 = BKLogTouchEvents(v15, v16);
          uint64_t v18 = [v17 autorelease];
          if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v24;
            int v30 = (int)v11;
            _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v18,  OS_LOG_TYPE_ERROR,  "addTouchAuthenticationSpecifications: already registered authentication spec for slotID:%X",  buf,  8u);
          }
        }
      }

      id v6 = [v5 countByEnumeratingWithState:v25 objects:v31 count:16];
    }

    while (v6);
  }
}

void sub_10003BCF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003BD38(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 144LL);
  uint64_t v3 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 56)];
  double v9 = [v2 objectForKey:v3];

  id v4 = v9;
  if (v9)
  {
    id v5 = v9[2];
    id v6 = [v5 copy];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8LL);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    id v4 = v9;
    **(_BYTE **)(a1 + 4_Block_object_dispose(va, 8) = *((_BYTE *)v9 + 8);
  }
}

void sub_10003BDDC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

id sub_10003BDFC(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 96LL) = *(void *)(a1 + 40);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  _OWORD v3[2] = sub_10003BE60;
  v3[3] = &unk_1000B6AC8;
  id v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return [v1 _queue_enumerateDigitizersForDisplay:0 usingBlock:v3];
}

uint64_t sub_10003BE60(uint64_t result, uint64_t a2)
{
  if (a2) {
    *(void *)(a2 + 152) = *(void *)(result + 32);
  }
  return result;
}

void sub_10003BE70(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 160);
  *(void *)(v2 + 160) = 0LL;

  id v4 = [*(id *)(a1 + 40) copy];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 168);
  *(void *)(v5 + 16_Block_object_dispose(va, 8) = v4;

  if ([*(id *)(a1 + 40) count])
  {
    uint64_t v7 = ++*(void *)(*(void *)(a1 + 32) + 176LL);
    BSProcessDeathWatcher *v8 = [[BSProcessDeathWatcher alloc] init];
    uint64_t v9 = *(unsigned int *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(v10 + 8);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10003BF50;
    void v15[3] = &unk_1000B7ED8;
    v15[4] = v10;
    v15[5] = v7;
    BSProcessDeathWatcher *v12 = [[BSProcessDeathWatcher alloc] initWithPID:v9 queue:v11 deathHandler:v15];
    uint64_t v13 = *(void *)(a1 + 32);
    BOOL v14 = *(void **)(v13 + 160);
    *(void *)(v13 + 160) = v12;
  }

void sub_10003BF50(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(a1 + 40) == *(void *)(v1 + 176))
  {
    uint64_t v3 = *(void **)(v1 + 168);
    *(void *)(v1 + 16_Block_object_dispose(va, 8) = 0LL;

    [*(id *)(*(void *)(a1 + 32) + 160) invalidate];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 160);
    *(void *)(v4 + 160) = 0LL;
  }

id sub_10003BFAC(uint64_t a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  _OWORD v3[2] = sub_10003C010;
  v3[3] = &unk_1000B6AA8;
  uint64_t v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  int v4 = *(_DWORD *)(a1 + 48);
  return [v1 _queue_enumerateDigitizersForAllDisplaysUsingBlock:v3];
}

void sub_10003C010(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(unsigned int *)(a1 + 40);
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    id obj = v3;
    id v5 = [obj countByEnumeratingWithState:v18 objects:v22 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v19;
      do
      {
        for (uint64_t i = 0LL; i != v5; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v19 != v6) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
          uint64_t v9 = (void *)[v8 uniqueIdentifier];
          uint64_t v10 = v9;
          if (v9)
          {
            uint64_t v11 = (void *)[v9 stringByReplacingOccurrencesOfString:@"." withString:@"_"];

            uint64_t v12 = [NSString stringWithFormat:@"from-client.pid-%d.%@" v4, v11];
            uint64_t v13 = (void *)v12;
          }

          else
          {
            NSString *v13 = [NSString stringWithFormat:@"from-client.pid-%d", v4];
          }

          BOOL v14 = *(void **)(a2 + 80);
          id v15 = [v8 touchIdentifier];
          uint64_t v16 = (void *)[v8 text];
          [v14 annotateTouch:v15 withString:v16 uniqueIdentifier:v13 fromPID:v4];
        }

        id v5 = [obj countByEnumeratingWithState:v18 objects:v22 count:16];
      }

      while (v5);
    }
  }

void sub_10003C1DC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
}

id sub_10003C21C(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  _OWORD v3[2] = sub_10003C280;
  v3[3] = &unk_1000B6A08;
  __int128 v4 = *(_OWORD *)(a1 + 40);
  int v5 = *(_DWORD *)(a1 + 56);
  return [v1 _queue_enumerateDigitizersForAllDisplaysUsingBlock:v3];
}

void sub_10003C280(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    __int128 v3 = *(_OWORD *)(a1 + 32);
    int v4 = *(_DWORD *)(a1 + 48);
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v14 = 0u;
    __int128 v12 = v3;
    __int128 v13 = 0u;
    id v5 = *(id *)(a2 + 112);
    id v6 = [v5 countByEnumeratingWithState:v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v14;
      do
      {
        uint64_t v8 = 0LL;
        do
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8LL * (void)v8);
          if (*(_DWORD *)(v9 + 20) == v4) {
            *(_OWORD *)(v9 + 160) = v12;
          }
          uint64_t v8 = (char *)v8 + 1;
        }

        while (v6 != v8);
        id v6 = [v5 countByEnumeratingWithState:v13 objects:v17 count:16];
      }

      while (v6);
    }

    uint64_t v10 = sub_1000456D4(*(id **)(a2 + 112));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    sub_100058F90(a2, v11);
  }

void sub_10003C3B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10003C3D8(uint64_t a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  _OWORD v3[2] = sub_10003C43C;
  v3[3] = &unk_1000B6AA8;
  uint64_t v1 = *(void **)(a1 + 32);
  void v3[4] = *(void *)(a1 + 40);
  int v4 = *(_DWORD *)(a1 + 48);
  return [v1 _queue_enumerateDigitizersForAllDisplaysUsingBlock:v3];
}

void sub_10003C43C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    __int128 v3 = *(void **)(a1 + 32);
    int v4 = *(_DWORD *)(a1 + 40);
    NSMutableArray *v14 = [[NSMutableArray alloc] init];
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id v5 = *(id *)(a2 + 112);
    id v6 = [v5 countByEnumeratingWithState:v24 objects:v28 count:16];
    uint64_t v13 = a2;
    if (v6)
    {
      uint64_t v7 = *(void *)v25;
      do
      {
        uint64_t v8 = 0LL;
        do
        {
          if (*(void *)v25 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void *)(*((void *)&v24 + 1) + 8LL * (void)v8);
          if (*(_DWORD *)(v9 + 20) == v4)
          {
            id v10 = *(id *)(v9 + 256);
            uint64_t v20 = 0LL;
            __int128 v21 = &v20;
            uint64_t v22 = 0x2020000000LL;
            unsigned int v11 = [v3 shouldAvoidHitTesting:v13];
            uint64_t v12 = 2LL;
            if (!v11) {
              uint64_t v12 = 0LL;
            }
            uint64_t v23 = v12;
            v15[0] = _NSConcreteStackBlock;
            v15[1] = 3221225472LL;
            v15[2] = sub_10005C74C;
            void v15[3] = &unk_1000B7720;
            __int128 v16 = v14;
            uint64_t v17 = v9;
            __int128 v18 = v3;
            __int128 v19 = &v20;
            [BKSHIDTouchRoutingPolicy inspectChangesWithOldPolicy:v10 newPolicy:v3 usingBlock:v15];
            *(void *)(v9 + 4_Block_object_dispose(va, 8) = v21[3];
            objc_storeStrong((id *)(v9 + 256), v3);

            _Block_object_dispose(&v20, 8);
          }

          uint64_t v8 = (char *)v8 + 1;
        }

        while (v6 != v8);
        id v6 = [v5 countByEnumeratingWithState:v24 objects:v28 count:16];
      }

      while (v6);
    }

    if (-[NSMutableArray count](v14, "count")) {
      sub_100058F90(v13, v14);
    }
  }

void sub_10003C644( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

id sub_10003C69C(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10003C714;
  v4[3] = &unk_1000B6A58;
  uint64_t v2 = *(void *)(a1 + 64);
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = v2;
  int v9 = *(_DWORD *)(a1 + 88);
  __int128 v5 = *(_OWORD *)(a1 + 40);
  __int128 v8 = *(_OWORD *)(a1 + 72);
  return [v1 _queue_enumerateDigitizersForAllDisplaysUsingBlock:v4];
}

void sub_10003C714(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    __int128 v3 = *(unsigned int **)(a1 + 48);
    uint64_t v4 = *(void *)(a1 + 56);
    int v35 = *(_DWORD *)(a1 + 80);
    __int128 v5 = *(void **)(a1 + 32);
    __int128 v34 = *(_OWORD *)(a1 + 64);
    NSMutableArray *v32 = [[NSMutableArray alloc] init];
    if (v4 >= 1)
    {
      do
      {
        uint64_t v6 = sub_100045854(*(void *)(a2 + 112), *v3);
        uint64_t v7 = [v6 autorelease];
        int v9 = (void *)v7;
        if (v7)
        {
          if (*(_BYTE *)(v7 + 296))
          {
            uint64_t v10 = BKLogTouchEvents(v7, v8);
            os_log_s *v11 = [v10 autorelease];
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              int v12 = *v3;
              *(_DWORD *)buf = 67109120;
              int v46 = v12;
              _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "tried to detach a touch (%d) that was already detached",  buf,  8u);
            }
          }

          else
          {
            [v32 addObject:v7];
          }
        }

        ++v3;
        --v4;
      }

      while (v4);
    }

    uint64_t v13 = v32;
    NSUInteger v14 = [v32 count];
    BOOL v30 = v14 != 0LL;
    if (v14)
    {
      sub_1000570D8((id *)a2, v32, 1LL, 1);
      sub_1000570D8((id *)a2, v32, 6LL, 1);
      __int128 v38 = 0u;
      __int128 v39 = 0u;
      __int128 v36 = 0u;
      __int128 v37 = 0u;
      id obj = v32;
      [obj countByEnumeratingWithState:v36 objects:v44 count:16];
      id v17 = v15;
      if (v15)
      {
        uint64_t v18 = *(void *)v37;
        do
        {
          __int128 v19 = 0LL;
          do
          {
            if (*(void *)v37 != v18) {
              objc_enumerationMutation(obj);
            }
            uint64_t v20 = *(void *)(*((void *)&v36 + 1) + 8LL * (void)v19);
            uint64_t v21 = BKLogTouchEvents(v15, v16);
            uint64_t v22 = [v21 autorelease];
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            {
              int v29 = *(_DWORD *)(v20 + 16);
              *(_DWORD *)buf = 67109120;
              int v46 = v29;
              _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "detaching:%X", buf, 8u);
            }

            *(_DWORD *)(v20 + 20) = v35;
            *(_BYTE *)(v20 + 296) = 1;
            objc_storeStrong((id *)(v20 + 256), v5);
            unsigned int v23 = [v5 shouldAvoidHitTesting];
            uint64_t v24 = 2LL;
            if (!v23) {
              uint64_t v24 = 0LL;
            }
            *(void *)(v20 + 4_Block_object_dispose(va, 8) = v24;
            *(_OWORD *)(v20 + 160) = v34;
            __int128 v40 = 0u;
            __int128 v41 = 0u;
            __int128 v42 = 0u;
            __int128 v43 = 0u;
            id v25 = *(id *)(a2 + 72);
            id v26 = [v25 countByEnumeratingWithState:&v40 objects:buf count:16];
            if (v26)
            {
              uint64_t v27 = *(void *)v41;
              do
              {
                for (uint64_t i = 0LL; i != v26; uint64_t i = (char *)i + 1)
                {
                  if (*(void *)v41 != v27) {
                    objc_enumerationMutation(v25);
                  }
                  [*(id *)(*((void *)&v40 + 1) + 8 * (void)i) touchDidDetach:*(unsigned int *)(v20 + 16) destinations:*(void *)(v20 + 280)];
                }

                id v26 = [v25 countByEnumeratingWithState:&v40 objects:buf count:16];
              }

              while (v26);
            }

            __int128 v19 = (char *)v19 + 1;
          }

          while (v19 != v17);
          [v15 countByEnumeratingWithState:v36 objects:v44 count:16];
          id v17 = v15;
        }

        while (v15);
      }

      uint64_t v13 = v32;
      sub_100058F90(a2, obj);
    }
  }

  else
  {
    BOOL v30 = 0;
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) |= v30;
}

void sub_10003CAA0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, void *a15)
{
}

id sub_10003CB00(uint64_t a1)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10003CB64;
  v4[3] = &unk_1000B6A08;
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 48);
  void v4[4] = *(void *)(a1 + 40);
  void v4[5] = v2;
  int v5 = *(_DWORD *)(a1 + 56);
  return [v1 _queue_enumerateDigitizersForAllDisplaysUsingBlock:v4];
}

void sub_10003CB64(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = *(unsigned int *)(a1 + 48);
    if (!(_DWORD)v2)
    {
      NSString *v47 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"contextID != 0"];
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        id v48 = NSStringFromSelector("transferTouchIdentifiers:count:toContextID:");
        id v49 = v48;
        id v51 = [a2 class];
        id v52 = NSStringFromClass(v51);
        unsigned __int8 v53 = [v52 autorelease];
        *(_DWORD *)buf = 138544642;
        *(void *)NSSize v77 = v49;
        *(_WORD *)&v77[8] = 2114;
        *(void *)&v77[10] = v53;
        __int16 v78 = 2048;
        uint64_t v79 = a2;
        __int16 v80 = 2114;
        v81 = @"BKDirectTouchState.mm";
        __int16 v82 = 1024;
        int v83 = 827;
        __int16 v84 = 2114;
        v85 = v47;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
      }

      _bs_set_crash_log_message([v47 UTF8String]);
      __break(0);
      JUMPOUT(0x10003D294LL);
    }

    uint64_t v3 = *(void *)(a1 + 40);
    if (v3)
    {
      uint64_t v4 = *(unsigned int **)(a1 + 32);
      v73 = (__autoreleasing _DWORD *)[*(id *)(a2 + 120) objectForKey:v2];
      uint64_t v5 = [*(id *)(a2 + 8) displayUUID];
      uint64_t v60 = (void *)v5;
      if (v73)
      {
        unsigned int v7 = v73[3];
      }

      else
      {
        uint64_t v8 = *(void **)(a2 + 40);
        if (v8) {
          uint64_t v8 = (void *)v8[1];
        }
        int v9 = v8;
        uint64_t v10 = (void *)[*(id *)(a2 + 8) displayUUID];
        unsigned int v7 = [v9 taskPortForContextID:v2 displayUUID:v10];
      }

      unsigned int v56 = v7;
      if (v7 - 1 >= 0xFFFFFFFE)
      {
        uint64_t v41 = BKLogTouchEvents(v5, v6);
        os_log_s *v42 = [v41 autorelease];
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)NSSize v77 = v7;
          *(_WORD *)&v77[4] = 1024;
          *(_DWORD *)&v77[6] = v2;
          _os_log_error_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_ERROR,  "transfer: invalid client port %X for contextID %X",  buf,  0xEu);
        }
      }

      else
      {
        uint64_t v54 = (id *)[*(id *)(a2 + 128) objectForKey:v2];
        unsigned int v11 = sub_1000459B4(*(void *)(a2 + 112), v4, v3);
        int v12 = [v11 autorelease];
        v70[0] = _NSConcreteStackBlock;
        v70[1] = 3221225472LL;
        v70[2] = sub_10005EE0C;
        v70[3] = &unk_1000B7788;
        char v71 = v73;
        int v72 = v2;
        uint64_t v13 = [v12 bs_filter:v70];

        id v55 = v13;
        id v14 = [v13 count];
        if (v14)
        {
          uint64_t v16 = BKLogTouchEvents(v14, v15);
          os_log_s *v17 = v16;
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)NSSize v77 = v2;
            *(_WORD *)&v77[4] = 2114;
            *(void *)&v77[6] = v13;
            _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "transfer: transferring to contextID:%X contacts:%{public}@",  buf,  0x12u);
          }

          sub_1000570D8((id *)a2, v13, 6LL, 1);
          sub_1000570D8((id *)a2, v13, 1LL, 1);
          sub_100059314((uint64_t)buf, (void *)a2, 0LL);
          NSMutableArray *v59 = [[NSMutableArray alloc] init];
          NSSet *v58 = [NSSet setWithArray:v13];
          id v18 = [v13 mutableCopy];
          if ((uint64_t)[v54 count] >= 1)
          {
            __int128 v19 = sub_1000456D4(v54);
            uint64_t v20 = [v19 autorelease];
            [v18 addObjectsFromArray:v20];

            [v18 sortUsingComparator:^NSComparisonResult(id v1, id v2) {
    return [v1 compare:v2];
}];
          }

          __int128 v68 = 0u;
          __int128 v69 = 0u;
          __int128 v66 = 0u;
          __int128 v67 = 0u;
          id obj = v18;
          id v21 = [obj countByEnumeratingWithState:v66 objects:v75 count:16];
          if (v21)
          {
            uint64_t v22 = *(void *)v67;
            do
            {
              for (uint64_t i = 0LL; i != v21; uint64_t i = (char *)i + 1)
              {
                if (*(void *)v67 != v22) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v24 = *(void *)(*((void *)&v66 + 1) + 8LL * (void)i);
                if ([v58 containsObject:v24])
                {
                  *(_BYTE *)(v24 + 297) = 1;
                  sub_10005C4F0(v24, (uint64_t)buf, 35LL);
                  id v25 = sub_10005ED94(a2, v24, v2, (uint64_t)v60, 2LL);
                  v26 = v25;
                  [v59 addObject:v26];
                  id v27 = sub_10005EF90(a2, v2, v56);
                  __int128 v28 = (int32_t *)[v27 autorelease];
                  id v29 = v73;
                  v73 = v28;

                  [*(id *)(v24 + 280) addObject:v73];
                  *(void *)(v24 + 4_Block_object_dispose(va, 8) = 4LL;
                  BOOL v30 = [NSArray initWithObjects:&v73 count:1];
                  id v31 = *(void **)(v24 + 288);
                  *(void *)(v24 + 28_Block_object_dispose(va, 8) = v30;

                  uint64_t v32 = v2;
                  __int128 v64 = 0u;
                  __int128 v65 = 0u;
                  __int128 v62 = 0u;
                  __int128 v63 = 0u;
                  id v33 = *(id *)(a2 + 72);
                  id v34 = [v33 countByEnumeratingWithState:v62 objects:v74 count:16];
                  if (v34)
                  {
                    uint64_t v35 = *(void *)v63;
                    do
                    {
                      for (j = 0LL; j != v34; j = (char *)j + 1)
                      {
                        if (*(void *)v63 != v35) {
                          objc_enumerationMutation(v33);
                        }
                        [*(id *)(*((void *)&v62 + 1) + 8 * (void)j) touchDidTransfer:*(unsigned int *)(v24 + 16) destination:v73];
                      }

                      id v34 = [v33 countByEnumeratingWithState:v62 objects:v74 count:16];
                    }

                    while (v34);
                  }

                  uint64_t v2 = v32;
                }

                else
                {
                  sub_10005C4F0(v24, (uint64_t)buf, 4LL);
                  __int128 v37 = sub_10005ED94(a2, v24, v2, (uint64_t)v60, 1LL);
                  v26 = [v37 autorelease];
                  [v59 addObject:v26];
                }
              }

              id v21 = [obj countByEnumeratingWithState:v66 objects:v75 count:16];
            }

            while (v21);
          }

          __int128 v39 = (const void *)sub_10005948C(buf, v38);
          BKHIDEventCollector *v40 = [[BKHIDEventCollector alloc] init];
          sub_10005AACC((void *)a2, (uint64_t)v39, (uint64_t)v73, (uint64_t)v40, 0, v59, *(double *)(a2 + 96));
          sub_100057E60(a2, (uint64_t)v40);

          if (v39) {
            CFRelease(v39);
          }

          sub_10005A9E8((uint64_t)buf);
        }

        else
        {
          uint64_t v43 = BKLogTouchEvents(0LL, v15);
          os_log_s *v44 = v43;
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            uint64_t v45 = *(void *)(a2 + 8);
            *(_DWORD *)buf = 138543362;
            *(void *)NSSize v77 = v45;
            _os_log_error_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_ERROR,  "transfer: no eligible contacts for service %{public}@",  buf,  0xCu);
          }
        }

        __int128 v42 = (os_log_s *)v54;
      }
    }
  }

void sub_10003D29C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003D404(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _queue_touchStreamClientForReference:*(unsigned int *)(a1 + 64)];
  uint64_t v3 = (_BYTE *)v2;
  if (v2) {
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 32));
  }
  else {
    id WeakRetained = 0LL;
  }
  sub_1000619F0((uint64_t)WeakRetained, &v30, &v31);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8LL);
  if (!*(_BYTE *)(v5 + 24)) {
    *(_BYTE *)(v5 + 24) = v30;
  }
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(v6 + 8);
  char v8 = *(_BYTE *)(v7 + 24);
  if (!v8)
  {
    *(_BYTE *)(v7 + 24) = v31;
    uint64_t v6 = *(void *)(a1 + 48);
    char v8 = *(_BYTE *)(*(void *)(v6 + 8) + 24LL);
  }

  if (v3)
  {
    v3[10] = v8;
    v3[11] = *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
    uint64_t v6 = *(void *)(a1 + 48);
  }

  sub_1000619F0( (uint64_t)WeakRetained,  (_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL),  (unsigned __int8 *)(*(void *)(v6 + 8) + 24LL));
  uint64_t v9 = v31;
  BOOL v10 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) != v31
     || *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) != v30;
  if (WeakRetained) {
    unsigned int v11 = (void *)WeakRetained[1];
  }
  else {
    unsigned int v11 = 0LL;
  }
  id v12 = v11;
  uint64_t v13 = *(void **)(a1 + 32);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_10003D738;
  v25[3] = &unk_1000B69C0;
  id v14 = v3;
  id v26 = v14;
  int8x16_t v27 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
  BOOL v29 = v10;
  uint64_t v28 = *(void *)(a1 + 56);
  [v13 _queue_enumerateDigitizersForDisplay:v12 usingBlock:v25];
  uint64_t v17 = BKLogTouchEvents(v15, v16);
  os_log_s *v18 = v17;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    else {
      __int128 v19 = off_1000B6BD0 + v9;
    }
    if (v30 > 2uLL) {
      uint64_t v20 = @"<unknown>";
    }
    else {
      uint64_t v20 = *(&off_1000B6BF0 + v30);
    }
    unint64_t v21 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
    if (v21 > 3) {
      uint64_t v22 = @"<unknown>";
    }
    else {
      uint64_t v22 = *(off_1000B6BD0 + v21);
    }
    unint64_t v23 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
    if (v23 > 2) {
      uint64_t v24 = @"<unknown>";
    }
    else {
      uint64_t v24 = *(off_1000B6BF0 + v23);
    }
    *(_DWORD *)buf = 138544642;
    id v33 = v19;
    __int16 v34 = 2114;
    uint64_t v35 = v20;
    __int16 v36 = 2114;
    __int128 v37 = v22;
    __int16 v38 = 2114;
    __int128 v39 = v24;
    __int16 v40 = 1024;
    BOOL v41 = v10;
    __int16 v42 = 1024;
    int v43 = 0;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "sg transition (%{public}@, %{public}@) -> (%{public}@, %{public}@) somethingDidChange:%{BOOL}u didNotify:%{BOOL}u",  buf,  0x36u);
  }
}

void sub_10003D704( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_10003D738(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = (id *)a2;
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
    int v5 = *(unsigned __int8 *)(a1 + 64);
    int v6 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
    if (v6 == 2)
    {
      double v7 = *(double *)(a1 + 56);
      *(double *)(a2 + 160) = v7;
    }

    if (v5)
    {
      if (v4 == 3)
      {
        uint64_t v8 = BKLogTouchEvents(a1, a2);
        uint64_t v9 = [v8 autorelease];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "cancel clients due to system gesture stealing the touches",  buf,  2u);
        }

        sub_1000562B0(v2, 2LL, v3);
      }

      else if (v3)
      {
        if (v6 == 2 && *(_BYTE *)(v3 + 9) != 0)
        {
          uint64_t v11 = *(unsigned __int8 *)(v3 + 8);
          uint64_t v12 = BKLogTouchEvents(a1, a2);
          uint64_t v13 = [v12];
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v28 = (void *)[v2[1] displayUUID];
            *(_DWORD *)buf = 134218498;
            int v46 = v2;
            __int16 v47 = 2114;
            id v48 = v28;
            __int16 v49 = 2114;
            uint64_t v50 = v3;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "System gestures no longer possible (<%p> - %{public}@) causedByTouchStream: %{public}@",  buf,  0x20u);
          }

          id v14 = [v2[18] mutableCopy];
          __int128 v41 = 0u;
          __int128 v42 = 0u;
          __int128 v39 = 0u;
          __int128 v40 = 0u;
          id obj = v2[14];
          id v15 = [obj countByEnumeratingWithState:&v39 objects:buf count:16];
          if (v15)
          {
            uint64_t v16 = *(void *)v40;
            do
            {
              for (uint64_t i = 0LL; i != v15; uint64_t i = (char *)i + 1)
              {
                if (*(void *)v40 != v16) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v18 = *(void *)(*((void *)&v39 + 1) + 8LL * (void)i);
                if (*(void *)(v18 + 32) == 2LL)
                {
                  uint64_t v19 = v11;
                  uint64_t v20 = v2;
                  __int128 v37 = 0u;
                  __int128 v38 = 0u;
                  __int128 v35 = 0u;
                  __int128 v36 = 0u;
                  id v21 = *(id *)(v18 + 280);
                  id v22 = [v21 countByEnumeratingWithState:v35 objects:v44 count:16];
                  if (v22)
                  {
                    uint64_t v23 = *(void *)v36;
                    do
                    {
                      for (j = 0LL; j != v22; j = (char *)j + 1)
                      {
                        if (*(void *)v36 != v23) {
                          objc_enumerationMutation(v21);
                        }
                        [v14 addObject:*(void *)(*((void *)&v35 + 1) + 8 * (void)j)];
                      }

                      BOOL v22 = [v21 countByEnumeratingWithState:v35 objects:v44 count:16];
                    }

                    while (v22);
                  }

                  uint64_t v2 = v20;
                  uint64_t v11 = v19;
                }
              }

              id v15 = [obj countByEnumeratingWithState:&v39 objects:buf count:16];
            }

            while (v15);
          }

          __int128 v33 = 0u;
          __int128 v34 = 0u;
          __int128 v31 = 0u;
          __int128 v32 = 0u;
          id obja = v14;
          id v25 = [obja countByEnumeratingWithState:v31 objects:v43 count:16];
          if (v25)
          {
            uint64_t v26 = *(void *)v32;
            do
            {
              for (k = 0LL; k != v25; k = (char *)k + 1)
              {
                if (*(void *)v32 != v26) {
                  objc_enumerationMutation(obja);
                }
                sub_10005EA00(v2, *(void *)(*((void *)&v31 + 1) + 8LL * (void)k), v11);
              }

              id v25 = [obja countByEnumeratingWithState:&v31 objects:v43 count:16];
            }

            while (v25);
          }
        }
      }
    }
  }

void sub_10003DAC0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_10003DB14(uint64_t a1)
{
  uint64_t v1 = (void **)(a1 + 32);
  uint64_t v2 = [*(id *)(a1 + 32) _queue_touchStreamClientForReference:*(unsigned int *)(a1 + 40)];
  uint64_t v3 = (void *)v2;
  int v4 = *v1;
  if (v2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 32));
    int v6 = WeakRetained;
    if (WeakRetained)
    {
      double v7 = (void *)*((void *)WeakRetained + 1);
      goto LABEL_4;
    }
  }

  else
  {
    int v6 = 0LL;
  }

  double v7 = 0LL;
LABEL_4:
  id v8 = v7;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  _DWORD v14[2] = sub_10003DCA0;
  v14[3] = &unk_1000B6970;
  id v9 = v3;
  id v15 = v9;
  [v4 _queue_enumerateDigitizersForDisplay:v8 usingBlock:v14];

  uint64_t v12 = BKLogTouchEvents(v10, v11);
  uint64_t v13 = v12;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v17 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "invalidate touch stream (invalidated by client) %{public}@",  buf,  0xCu);
  }

  sub_10006751C((id *)v9);
}

void sub_10003DC64( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_10003DCA0(uint64_t a1, id *a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if ((uint64_t)[a2[14] count] >= 1)
    {
      if (v3) {
        int v4 = *(void **)(v3 + 48);
      }
      else {
        int v4 = 0LL;
      }
      id v6 = v4;
      sub_1000573E4(a2, (uint64_t)v6);
    }

    if (v3 && (int v5 = (id *)*(id *)(v3 + 48)) != 0LL)
    {
      double v7 = v5;
      [v5[3] removeObject:v3];
      sub_10005789C((uint64_t)a2, (uint64_t)v7);
    }

    else
    {
      double v7 = 0LL;
      sub_10005789C((uint64_t)a2, 0LL);
    }
  }

void sub_10003DD58( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
}

void sub_10003DD70(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  id v4 = [v3 length];
  int v5 = (void *)BKSDisplayUUIDMainKey;
  if (v4) {
    int v5 = v3;
  }
  id v6 = v5;

  double v7 = [v2 _queue_displayInfoForDisplay:v6 createIfNeeded:1];
  if (v7) {
    id v8 = (void *)v7[1];
  }
  else {
    id v8 = 0LL;
  }
  id v9 = v8;
  id v10 = [v9 taskPortForContextID:*(unsigned int *)(a1 + 64) displayUUID:*(void *)(a1 + 40)];
  uint64_t v12 = (uint64_t)v10;
  if (((_DWORD)v10 - 1) >= 0xFFFFFFFE)
  {
    uint64_t v30 = BKLogTouchEvents(v10, v11);
    os_log_s *v31 = [v30 autorelease];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      int v32 = *(_DWORD *)(a1 + 64);
      uint64_t v33 = NSStringFromBKSTouchStreamIdentifier(*(unsigned __int8 *)(a1 + 68));
      __int128 v34 = [v33 autorelease];
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)uint64_t v70 = v12;
      *(_WORD *)&void v70[4] = 1024;
      *(_DWORD *)&v70[6] = v32;
      *(_WORD *)char v71 = 2114;
      *(void *)&v71[2] = v34;
      _os_log_error_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "BKDigitizerTouchStreamCreate: invalid taskPort (0x%X) for contextID:0x%X (touchstreamIdentifier:%{public}@)",  buf,  0x18u);
    }
  }

  else
  {
    BKDigitizerTouchStreamClient *v13 = [[BKDigitizerTouchStreamClient alloc] init];
    if (v13)
    {
      int64_t v14 = *(void *)(a1 + 56);
      if (v13->_versionedPID != v14)
      {
        v13->_versionedPID = v14;
        uint64_t v15 = BSProcessNameForPID(v14);
        uint64_t v16 = [v15 autorelease];
        processName = v13->_processName;
        v13->_processName = (NSString *)v16;
      }

      v13->_shouldSendAmbiguityRecommendations = *(_BYTE *)(a1 + 72);
      v13->_touchStreamIdentifier = *(_DWORD *)(a1 + 68);
    }

    uint64_t v18 = *(unsigned int *)(a1 + 64);
    uint64_t v19 = [BKTouchDestination self];
    uint64_t v20 = v13;
    if (!v13)
    {
      BKDigitizerTouchStreamClient *v35 = [BKDigitizerTouchStreamClient class];
      __int128 v36 = NSStringFromClass(v35);
      __int128 v37 = (void *)[v36 autorelease];
      NSString *v38 = [NSString stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"touchStream", v37];

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        __int128 v39 = NSStringFromSelector("destinationWithTouchStream:contextID:clientPort:");
        __int128 v40 = [v39 autorelease];
        __int128 v42 = (objc_class *)[v19 class];
        int v43 = NSStringFromClass(v42);
        v44 = [v43 autorelease];
        *(_DWORD *)buf = 138544642;
        *(void *)uint64_t v70 = v40;
        *(_WORD *)&v70[8] = 2114;
        *(void *)char v71 = v44;
        *(_WORD *)&v71[8] = 2048;
        uint64_t v72 = v19;
        __int16 v73 = 2114;
        double v74 = @"BKTouchDestination.m";
        __int16 v75 = 1024;
        int v76 = 43;
        __int16 v77 = 2114;
        __int16 v78 = v38;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
      }

      _bs_set_crash_log_message([v38 UTF8String]);
      __break(0);
      JUMPOUT(0x10003E168LL);
    }

    id v22 = v20;
    BKDigitizerTouchStreamClient *v23 = [BKDigitizerTouchStreamClient class];
    if ((objc_opt_isKindOfClass(v22, v23) & 1) == 0)
    {
      uint64_t v45 = (objc_class *)[BKDigitizerTouchStreamClient classForCoder];
      if (!v45) {
        v45 = [v22 class];
      }
      __int16 v47 = NSStringFromClass(v45);
      v48 = [v47 autorelease];
      uint64_t v50 = [BKDigitizerTouchStreamClient class];
      id v51 = NSStringFromClass(v50);
      v52 = v51;
      NSString *v53 = [NSString stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.",  @"touchStream",  v48,  v52];

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        uint64_t v54 = NSStringFromSelector("destinationWithTouchStream:contextID:clientPort:");
        id v55 = v54;
        unsigned __int8 v57 = (v19);
        uint64_t v58 = NSStringFromClass(v57);
        id v59 = v58;
        *(_DWORD *)buf = 138544642;
        *(void *)uint64_t v70 = v55;
        *(_WORD *)&v70[8] = 2114;
        *(void *)char v71 = v59;
        *(_WORD *)&v71[8] = 2048;
        uint64_t v72 = v19;
        __int16 v73 = 2114;
        double v74 = @"BKTouchDestination.m";
        __int16 v75 = 1024;
        int v76 = 43;
        __int16 v77 = 2114;
        __int16 v78 = v53;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
      }

      _bs_set_crash_log_message([v53 UTF8String]);
      __break(0);
      JUMPOUT(0x10003E2A4LL);
    }

    if (!(_DWORD)v18)
    {
      NSString *v60 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"contextID != 0"];
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        uint64_t v61 = NSStringFromSelector("destinationWithTouchStream:contextID:clientPort:");
        __int128 v62 = (void *)objc_claimAutoreleasedReturnValue(v61);
        id v64 = [v19 class];
        __int128 v65 = NSStringFromClass(v64);
        __int128 v66 = [v65 autorelease];
        *(_DWORD *)buf = 138544642;
        *(void *)uint64_t v70 = v62;
        *(_WORD *)&v70[8] = 2114;
        *(void *)char v71 = v66;
        *(_WORD *)&v71[8] = 2048;
        uint64_t v72 = v19;
        __int16 v73 = 2114;
        double v74 = @"BKTouchDestination.m";
        __int16 v75 = 1024;
        int v76 = 44;
        __int16 v77 = 2114;
        __int16 v78 = v60;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
      }

      _bs_set_crash_log_message([v60 UTF8String]);
      __break(0);
      JUMPOUT(0x10003E39CLL);
    }

    uint64_t v24 = [BKTouchDestination initWithTouchIdentifier:v18 destination:v12];
    id v25 = v24;
    if (v24)
    {
      objc_storeWeak((id *)v24 + 5, v22);
      uint64_t v26 = 6LL;
      if (!v22->_shouldSendAmbiguityRecommendations) {
        uint64_t v26 = 2LL;
      }
      void v25[4] = v26;
    }

    v22->_touchDestination = v25;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) _queue_addTouchStreamClient:*(void *)(a1 + 40) toDisplayU UID:*(void *)(a1 + 56) versionedPID:*(void *)(a1 + 32)];
    int8x16_t v27 = *(void **)(a1 + 32);
    uint64_t v28 = *(void *)(a1 + 40);
    v67[0] = _NSConcreteStackBlock;
    v67[1] = 3221225472LL;
    v67[2] = sub_10003E414;
    v67[3] = &unk_1000B6970;
    BOOL v29 = v22;
    __int128 v68 = v29;
    [v27 _queue_enumerateDigitizersForDisplay:v28 usingBlock:v67];
  }
}

void sub_10003E3AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10003E414(uint64_t result, uint64_t a2)
{
  if (!a2) {
    return result;
  }
  uint64_t v3 = *(void *)(result + 32);
  sub_100059314((uint64_t)v25, (void *)a2, 2LL);
  NSMutableArray *v4 = [[NSMutableArray alloc] init];
  if (!v3)
  {
    id v6 = 0LL;
    goto LABEL_21;
  }

  id v5 = *(id *)(v3 + 48);
  id v6 = v5;
  if (!v5)
  {
LABEL_21:
    unsigned int v7 = 0;
    goto LABEL_5;
  }

  [*((id *)v5 + 3) addObject:v3];
  unsigned int v7 = v6[2];
LABEL_5:
  [*(id *)(a2 + 120) setObject:v6 forKey:v7];
  if ((uint64_t)[*(id *)(a2 + 112) count] >= 1)
  {
    id v8 = [*(id *)(a2 + 8) displayUUID];
    if (v6) {
      uint64_t v9 = v6[2];
    }
    else {
      uint64_t v9 = 0LL;
    }
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    id v10 = *(id *)(a2 + 112);
    id v11 = [v10 countByEnumeratingWithState:v21 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v22;
      do
      {
        for (uint64_t i = 0LL; i != v11; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)i);
          uint64_t v15 = sub_10005C5B8((uint64_t)v25, *(void *)(v14 + 8), 2LL, *(unsigned int *)(v14 + 64));
          IOHIDEventSetIntegerValue(v15, 720905LL, 1LL);
          uint64_t v16 = sub_10005ED94(a2, v14, v9, (uint64_t)v8, 0LL);
          id v17 = v16;
          [v4 addObject:v17];
        }

        id v11 = [v10 countByEnumeratingWithState:v21 objects:v26 count:16];
      }

      while (v11);
    }

    uint64_t v19 = (const void *)sub_10005948C(v25, v18);
    BKHIDEventCollector *v20 = [[BKHIDEventCollector alloc] init];
    sub_10005AACC((void *)a2, (uint64_t)v19, (uint64_t)v6, (uint64_t)v20, 0, v4, *(double *)(a2 + 96));
    sub_100057E60(a2, (uint64_t)v20);

    if (v19) {
      CFRelease(v19);
    }
  }

  return sub_10005A9E8((uint64_t)v25);
}

void sub_10003E668( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  if (v20) {
    CFRelease(v20);
  }

  sub_10005A9E8((uint64_t)&a17);
  _Unwind_Resume(a1);
}

void sub_10003E6EC(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  self = *(id *)(a1 + 40);
  id v3 = [self length];
  id v4 = (void *)BKSDisplayUUIDMainKey;
  if (v3) {
    id v4 = self;
  }
  id v5 = v4;

  selfa = [v2 _queue_displayInfoForDisplay:v5 createIfNeeded:YES];
  if (selfa) {
    objc_setProperty_nonatomic_copy(selfa, v6, *(id *)(a1 + 48), 32LL);
  }
  unsigned int v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  _DWORD v12[2] = sub_10003E7F0;
  v12[3] = &unk_1000B6970;
  void v12[4] = *(void *)(a1 + 48);
  [v7 _queue_enumerateDigitizersForDisplay:v8 usingBlock:selfa];
}

void sub_10003E7C8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{
}

void sub_10003E7F0(uint64_t a1, uint64_t a2)
{
}

void sub_10003E800(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  _DWORD v6[2] = sub_10003E8A4;
  v6[3] = &unk_1000B6920;
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  id v7 = v4;
  uint64_t v8 = v5;
  [v2 _queue_enumerateDigitizersForDisplay:v3 usingBlock:v6];
}

void sub_10003E880( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
}

id sub_10003E894(uint64_t a1)
{
  return _[*(id *)(a1 + 32) makeObjectsPerformSelector:"invalidate"];
}

void sub_10003E8A4(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)(a1 + 32);
  if (a2)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    sub_1000562B0((id)a2, 1LL, 0LL);
    id v6 = *(void **)(a2 + 32);
    if (!v6)
    {
      id v14 = [NSString stringWithFormat:@"SuppressTouches-%llX" [*(id *)(a2 + 8) senderID]];
      uint64_t v7 = [BSCompoundAssertion assertionWithIdentifier:];
      uint64_t v8 = *(void **)(a2 + 32);
      *(void *)(a2 + 32) = v7;

      uint64_t v9 = *(void **)(a2 + 32);
      uint64_t v12 = BKLogTouchEvents(v10, v11);
      id v15 = [v12 autorelease];
      [v9 setLog:];

      id v6 = *(void **)(a2 + 32);
    }

    uint64_t v13 = [v6 acquireForReason:v5];
  }

  else
  {
    uint64_t v13 = 0LL;
  }

  id v16 = (id)v13;
  [v4 addObject:v13];
}

void sub_10003E9BC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
}

id sub_10003E9D8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _queue_enumerateDigitizersForAllDisplaysUsingBlock:&stru_1000B68F8];
}

void sub_10003E9E8(id a1, BKDirectTouchState *a2)
{
}

id sub_10003E9F8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _queue_enumerateDigitizersForDisplay:*(void *)(a1 + 40) usingBlock:&stru_1000B68D8];
}

void sub_10003EA0C(id a1, BKDirectTouchState *a2)
{
}

id sub_10003EA1C(uint64_t a1)
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = 0LL;
    uint64_t v5 = *(void *)v12;
    do
    {
      id v6 = 0LL;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        v16[v4 + (void)v6] = [*(id *)(*((void *)&v11 + 1) + 8 * (void)v6) unsignedIntegerValue];
        id v6 = (char *)v6 + 1;
      }

      while (v3 != v6);
      id v3 = [v2 countByEnumeratingWithState:v11 objects:v15 count:16];
      v4 += (uint64_t)v6;
    }

    while (v3);
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10003EB8C;
  v10[3] = &unk_1000B6898;
  uint64_t v7 = *(void **)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  void v10[4] = v16;
  void v10[5] = v8;
  return [v7 _queue_enumerateDigitizersForAllDisplaysUsingBlock:v10];
}

void sub_10003EB6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003EB8C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = sub_1000459B4(*(void *)(a2 + 112), *(unsigned int **)(a1 + 32), *(void *)(a1 + 40));
    id v4 = v3;
    sub_1000570D8((id *)a2, v4, 1LL, 0);
  }

void sub_10003EBF0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_10003EC04(uint64_t a1)
{
}

void sub_10003EC18(uint64_t a1)
{
}

void sub_10003EC2C(uint64_t a1)
{
}

void sub_10003EC40(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v3 = [*(id *)(*(void *)(a1 + 40) + 24) description];
  id v2 = [v1 appendObject:withName:];
}

void sub_10003EC94( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_10003ECA8(void *a1)
{
}

void sub_10003ECB8(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = (dispatch_queue_s *)v1[1];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003EE24;
  block[3] = &unk_1000B8058;
  id v4 = v1;
  dispatch_sync(v2, block);
}

__CFString *sub_10003ED24(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    id v2 = [BSDescriptionStream descriptionForRootObject:WeakRetained];
  }
  else {
    id v2 = @"<nil>";
  }

  return v2;
}

void sub_10003ED78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003ED88(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 8LL);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  void v7[2] = sub_10003EE14;
  v7[3] = &unk_1000B7CF0;
  id v8 = WeakRetained;
  int v9 = a2;
  id v6 = WeakRetained;
  dispatch_async(v5, v7);
}

id sub_10003EE14(uint64_t a1)
{
  return [_queue_windowServerDidDeleteSlotID:];
}

id sub_10003EE24(uint64_t a1)
{
  BKSDefaults *v2 = [BKSDefaults localDefaults];
  unsigned __int8 v3 = [v2 digitizerVisualizeTouches];

  BKSDefaults *v4 = [BKSDefaults localDefaults];
  unsigned __int8 v5 = [v4 digitizerVisualizeHitTestRegions];

  id v6 = *(void **)(a1 + 32);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  _OWORD v8[2] = sub_10003EEE0;
  v8[3] = &unk_1000B6850;
  unsigned __int8 v9 = v3;
  unsigned __int8 v10 = v5;
  return [v6 _queue_enumerateDigitizersForAllDisplaysUsingBlock:v8];
}

void sub_10003EECC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10003EEE0(uint64_t a1, uint64_t a2)
{
}

void sub_10003EEF4(id a1)
{
  BKSDefaults *v1 = [BKSDefaults localDefaults];
  byte_1000DC028 = [v1 isDigitizerSignpostsEnabled];
}

void sub_10003EF38( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_10003F080(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10003F0B0()
{
  if (qword_1000DC048 != -1) {
    dispatch_once(&qword_1000DC048, &stru_1000B6C08);
  }
  return (id)qword_1000DC040;
}

void sub_10003F0F0(id a1)
{
  os_log_t v1 = os_log_create(BKLoggingSubsystem, "BootUI");
  id v2 = (void *)qword_1000DC040;
  qword_1000DC040 = (uint64_t)v1;
}

id sub_10003F124()
{
  if (qword_1000DC058 != -1) {
    dispatch_once(&qword_1000DC058, &stru_1000B6C28);
  }
  return (id)qword_1000DC050;
}

void sub_10003F164(id a1)
{
  os_log_t v1 = os_log_create(BKLoggingSubsystem, "Button");
  id v2 = (void *)qword_1000DC050;
  qword_1000DC050 = (uint64_t)v1;
}

id sub_10003F198()
{
  if (qword_1000DC068 != -1) {
    dispatch_once(&qword_1000DC068, &stru_1000B6C48);
  }
  return (id)qword_1000DC060;
}

void sub_10003F1D8(id a1)
{
  os_log_t v1 = os_log_create(BKLoggingSubsystem, "DisplayAnnotations");
  id v2 = (void *)qword_1000DC060;
  qword_1000DC060 = (uint64_t)v1;
}

id sub_10003F20C()
{
  if (qword_1000DC078 != -1) {
    dispatch_once(&qword_1000DC078, &stru_1000B6C68);
  }
  return (id)qword_1000DC070;
}

void sub_10003F24C(id a1)
{
  os_log_t v1 = os_log_create(BKLoggingSubsystem, "DisplayMonitor");
  id v2 = (void *)qword_1000DC070;
  qword_1000DC070 = (uint64_t)v1;
}

id sub_10003F280()
{
  if (qword_1000DC088 != -1) {
    dispatch_once(&qword_1000DC088, &stru_1000B6C88);
  }
  return (id)qword_1000DC080;
}

void sub_10003F2C0(id a1)
{
  os_log_t v1 = os_log_create(BKLoggingSubsystem, "HID");
  id v2 = (void *)qword_1000DC080;
  qword_1000DC080 = (uint64_t)v1;
}

id sub_10003F2F4()
{
  if (qword_1000DC098 != -1) {
    dispatch_once(&qword_1000DC098, &stru_1000B6CA8);
  }
  return (id)qword_1000DC090;
}

void sub_10003F334(id a1)
{
  os_log_t v1 = os_log_create(BKLoggingSubsystem, "IdleTimer");
  id v2 = (void *)qword_1000DC090;
  qword_1000DC090 = (uint64_t)v1;
}

id sub_10003F368()
{
  if (qword_1000DC0A8 != -1) {
    dispatch_once(&qword_1000DC0A8, &stru_1000B6CC8);
  }
  return (id)qword_1000DC0A0;
}

void sub_10003F3A8(id a1)
{
  os_log_t v1 = os_log_create(BKLoggingSubsystem, "RenderOverlay");
  id v2 = (void *)qword_1000DC0A0;
  qword_1000DC0A0 = (uint64_t)v1;
}

id sub_10003F3DC()
{
  if (qword_1000DC0B8 != -1) {
    dispatch_once(&qword_1000DC0B8, &stru_1000B6CE8);
  }
  return (id)qword_1000DC0B0;
}

void sub_10003F41C(id a1)
{
  os_log_t v1 = os_log_create(BKLoggingSubsystem, "HapticFeedback");
  id v2 = (void *)qword_1000DC0B0;
  qword_1000DC0B0 = (uint64_t)v1;
}

id sub_10003F450()
{
  if (qword_1000DC0C8 != -1) {
    dispatch_once(&qword_1000DC0C8, &stru_1000B6D08);
  }
  return (id)qword_1000DC0C0;
}

void sub_10003F490(id a1)
{
  os_log_t v1 = os_log_create(BKLoggingSubsystem, "Accelerometer");
  id v2 = (void *)qword_1000DC0C0;
  qword_1000DC0C0 = (uint64_t)v1;
}

id sub_10003F4C4()
{
  if (qword_1000DC0D8 != -1) {
    dispatch_once(&qword_1000DC0D8, &stru_1000B6D28);
  }
  return (id)qword_1000DC0D0;
}

void sub_10003F504(id a1)
{
  os_log_t v1 = os_log_create(BKLoggingSubsystem, "KeyPresses");
  id v2 = (void *)qword_1000DC0D0;
  qword_1000DC0D0 = (uint64_t)v1;
}

void sub_100040360( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_1000406D8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000406E8(uint64_t a1)
{
}

void sub_1000406F0(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6 = a2;
  uint64_t v7 = *(void **)(a1 + 32);
  id v9 = v6;
  id v8 = [v6 sendRight];
  LODWORD(v7) = [v7 matchesPortOfRight:v8];

  if ((_DWORD)v7)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
    *a3 = 1;
  }
}

id sub_10004077C(uint64_t a1)
{
  __int128 v11 = @"accelerometer";
  v9[0] = @"x";
  id v2 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
  v10[0] = v2;
  v9[1] = @"y";
  unsigned __int8 v3 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
  v10[1] = v3;
  _DWORD v9[2] = @"z";
  id v4 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
  v10[2] = v4;
  v9[3] = @"type";
  unsigned __int8 v5 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 56)];
  v10[3] = v5;
  [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:4];
  __int128 v12 = v6;
  uint64_t v7 = [NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];

  return v7;
}

void sub_1000408D4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(a1 + 32);
  id v4 = a2;
  [v4 setWantsOrientationEvents:v3];
  [v4 setPassiveOrientationEvents:*(unsigned __int8 *)(a1 + 33)];
}

void sub_10004091C(uint64_t a1, void *a2)
{
  id v6 = a2;
  [v6 setWantsAccelerometerEvents:1];
  [v6 setAccelerometerUpdateInterval:*(double *)(a1 + 32)];
  LODWORD(v3) = *(_DWORD *)(a1 + 40);
  [v6 setXThreshold:v3];
  LODWORD(v4) = *(_DWORD *)(a1 + 44);
  [v6 setYThreshold:v4];
  LODWORD(v5) = *(_DWORD *)(a1 + 48);
  [v6 setZThreshold:v5];
}

void sub_1000409C4(id a1)
{
  BKAccelerometerInterface *v1 = [[BKAccelerometerInterface alloc] init];
  id v2 = (void *)qword_1000DC0E0;
  qword_1000DC0E0 = (uint64_t)v1;
}

uint64_t sub_1000413FC(uint64_t result)
{
  *(_BYTE *)(*(void *)(result + 32) + 8LL) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t sub_10004140C(uint64_t a1)
{
  uint64_t v2 = BKLogAlternateSystemApp();
  os_log_s *v3 = v2;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 138543362;
    uint64_t v7 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "[Manager] Terminating alternate system app with bundleID: %{public}@",  (uint8_t *)&v6,  0xCu);
  }

  [*(id *)(*(void *)(a1 + 40) + 32) terminate];
  [*(id *)(a1 + 40) _queue_cleanUpAfterAlternativeSystemApp:*(void *)(*(void *)(a1 + 40) + 32)];
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_1000414D8(uint64_t a1)
{
  uint64_t v2 = BKLogAlternateSystemApp();
  os_log_s *v3 = v2;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v17 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "[Manager] Open alternate system app with bundleID: %{public}@",  buf,  0xCu);
  }

  double v5 = [BKAlternateSystemApp initWithBundleId:*(void *)(a1 + 32) options:*(void *)(a1 + 40) queue:*(void *)(*(void *)(a1 + 48) + 24LL)];
  if (v5)
  {
    [*(id *)(a1 + 48) setOpenBundleId:*(void *)(a1 + 32)];
    [*(id *)(a1 + 48) setAlternateSystemApp:v5];
    int v6 = [BKSystemShellSentinel sharedInstance];
    [v6 setActiveAlternateSystemAppBundleIdentifier:*(void *)(a1 + 32)];

    objc_initWeak((id *)buf, *(id *)(a1 + 48));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    _DWORD v12[2] = sub_100041730;
    v12[3] = &unk_1000B6E40;
    [v15 copy];
    uint64_t v7 = v5;
    __int128 v13 = v7;
    id v14 = *(id *)(a1 + 56);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    _OWORD v8[2] = sub_100041780;
    v8[3] = &unk_1000B6E68;
    [v11 copy];
    id v9 = v7;
    id v10 = *(id *)(a1 + 64);
    [BKAlternateSystemApp launchWithResultBlock:v12 exitBlock:v8];

    [v11 release];
    [v15 release];
    objc_destroyWeak((id *)buf);
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
  }
}

void sub_100041704(_Unwind_Exception *a1)
{
}

uint64_t sub_100041730(uint64_t a1, int a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained _queue_cleanUpAfterAlternativeSystemApp:*(void *)(a1 + 32)];
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void sub_100041780(uint64_t a1, void *a2)
{
  uint64_t v3 = (id *)(a1 + 48);
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _queue_cleanUpAfterAlternativeSystemApp:*(void *)(a1 + 32)];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

uint64_t sub_1000417DC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000417EC(uint64_t a1)
{
}

void sub_1000417F4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) bundleID];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t sub_100041830(uint64_t result)
{
  *(_BYTE *)(*(void *)(*(void *)(result + 40) + 8LL) + 24LL) = *(_BYTE *)(*(void *)(result + 32) + 8LL);
  return result;
}

void sub_100041884(id a1)
{
  BKAlternateSystemAppManager *v1 = [[BKAlternateSystemAppManager alloc] init];
  uint64_t v2 = (void *)qword_1000DC0F0;
  qword_1000DC0F0 = (uint64_t)v1;
}

void sub_100042A70(id a1)
{
  byte_1000DC110 = BSSystemHasCapability(@"displayport");
}

void sub_100042A94(uint64_t a1, void *a2)
{
  id v3 = sub_100065B98();
  id v4 = v3;
  [a2 noteInterfaceOrientationChangedWithInterfaceOrientation:sub_10006641C((uint64_t)v4)];
}

id sub_100042AE0(uint64_t a1, void *a2)
{
  return _[a2 _handleDemoModeChanged];
}

void sub_100042B28(id a1)
{
  if (!sub_10001A8D4())
  {
    BKTetherController *v1 = [[BKTetherController alloc] init];
    uint64_t v2 = (void *)qword_1000DC100;
    qword_1000DC100 = (uint64_t)v1;
  }

void sub_1000435C8(uint64_t a1)
{
  v3 = [CAWindowServer serverIfRunning];
  uint64_t v2 = (void *)[v3 displayWithName:@"TVOut"];
  if (v2) {
    [*(id *)(*(void *)(a1 + 32) + 16) evaluateDisplay:v2 reason:@"updateTVOutDisplaySettings"];
  }
}

void sub_100043638(uint64_t a1, NSMutableArray **a2, void *a3, char a4)
{
  if (a1)
  {
    uint64_t v30 = [CAWindowServer serverIfRunning];
    int v6 = (void *)[v30 displays];
    uint64_t v7 = [v6 firstObject];

    BOOL v29 = (void *)v7;
    if (v7)
    {
      __int128 v34 = 0u;
      __int128 v35 = 0u;
      __int128 v32 = 0u;
      __int128 v33 = 0u;
      id v9 = [CADisplay displays];
      id v10 = [v9 countByEnumeratingWithState:v32 objects:v38 count:16];
      if (v10)
      {
        id v11 = v10;
        int8x16_t v27 = a3;
        __int128 v12 = 0LL;
        __int128 v13 = 0LL;
        uint64_t v14 = *(void *)v33;
        do
        {
          for (uint64_t i = 0LL; i != v11; uint64_t i = (char *)i + 1)
          {
            id v16 = v13;
            if (*(void *)v33 != v14) {
              objc_enumerationMutation(v9);
            }
            uint64_t v17 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)i);
            __int128 v13 = (void *)[v17 name];

            if ([v13 hasPrefix:@"Wireless"])
            {
              if ((a4 & 1) != 0) {
                id v18 = [v17 immutableCopy];
              }
              else {
                id v18 = v17;
              }
              id v20 = v18;
              if (v18)
              {
                if (!v12) {
                  NSMutableArray *v12 = [[NSMutableArray alloc] init];
                }
                [v12 addObject:v20];
              }
            }

            else if ([v13 isEqualToString:@"TVOut"] && !*(_BYTE *)(a1 + 40))
            {
              if ((a4 & 1) != 0) {
                id v24 = [v17 immutableCopy];
              }
              else {
                id v24 = v17;
              }
              id v20 = v24;
              if (v27)
              {
                id v20 = v24;
                *int8x16_t v27 = v20;
              }
            }

            else
            {
              uint64_t v19 = [v30 displayWithDisplayId:[v17 displayId]];
              if ((void *)v19 == v29)
              {
                id v20 = v29;
              }

              else
              {
                id v20 = (id)v19;
                uint64_t v21 = BKLogDisplay(v19);
                os_log_s *v22 = [v21 autorelease];
                if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                {
                  __int128 v23 = (void *)[v17 name];
                  *(_DWORD *)buf = 138543362;
                  __int128 v37 = v23;
                  _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Tagging unknown display %{public}@ with available modes",  buf,  0xCu);
                }

                [v20 setTag:0x10000];
              }
            }
          }

          id v11 = [v9 countByEnumeratingWithState:v32 objects:v38 count:16];
        }

        while (v11);
      }

      else
      {
        __int128 v12 = 0LL;
        __int128 v13 = 0LL;
      }

      uint64_t v26 = v12;
      *a2 = v26;
    }

    else
    {
      uint64_t v25 = BKLogDisplay(v8);
      __int128 v13 = [v25 autorelease];
      if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v13,  OS_LOG_TYPE_DEFAULT,  "We seeem to be headless",  buf,  2u);
      }
    }
  }

void sub_100043980(uint64_t a1)
{
  uint64_t v2 = [CAWindowServer serverIfRunning];
  *(_BYTE *)(*(void *)(a1 + 32) + 42LL) = 1;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v3 = *(id *)(a1 + 40);
  id v4 = [v3 countByEnumeratingWithState:v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        sub_100043AE4(*(void *)(a1 + 32), *(void **)(*((void *)&v9 + 1) + 8LL * (void)v7), 2uLL);
        uint64_t v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:v9 objects:v13 count:16];
    }

    while (v5);
  }

  if (*(void *)(a1 + 48))
  {
    uint64_t v8 = [v2 displayWithName:@"TVOut"];
    sub_100043AE4(*(void *)(a1 + 32), *(void **)(a1 + 48), 1uLL);
    sub_100043F20(*(void *)(a1 + 32), 0, v8);
  }
}

void sub_100043AE4(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_36;
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  uint64_t v6 = [CAWindowServer server];
  uint64_t v7 = [v6 displayWithDisplayId:[v5 displayId]];
  uint64_t v8 = (void *)[__CFString availableModes];
  id v9 = [v8 count];

  if (!v9)
  {
    uint64_t v19 = BKLogDisplay(v10);
    os_log_s *v20 = [v19];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v40 = 138543362;
      uint64_t v41 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "AMDC No available modes; removing clone/tags if needed %{public}@",
        (uint8_t *)&v40,
        0xCu);
    }

    id v21 = [*(id *)(a1 + 16) removeDisplay:v7];
    if (a3 == 1) {
      *(_BYTE *)(a1 + 41) = 0;
    }
    goto LABEL_33;
  }

  __int128 v11 = (void *)[v6 displays];
  __int128 v12 = (void *)[v11 firstObject];

  __int128 v13 = (void *)[v12 clones];
  id v14 = [v13 count];
  uint64_t v15 = BKLogDisplay(v14);
  os_log_s *v16 = v15;
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (v14)
  {
    if (v17)
    {
      if (a3 > 2) {
        id v18 = @"<unknown>";
      }
      else {
        id v18 = *(off_1000B6FA8 + a3);
      }
      int v40 = 138543874;
      uint64_t v41 = v18;
      __int16 v42 = 2114;
      int v43 = v5;
      __int16 v44 = 2114;
      uint64_t v45 = v13;
      __int128 v23 = "Available modes changed (%{public}@) on %{public}@; clones:%{public}@";
      id v24 = v16;
      uint32_t v25 = 32;
LABEL_18:
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, v23, (uint8_t *)&v40, v25);
    }
  }

  else if (v17)
  {
    if (a3 > 2) {
      __int128 v22 = @"<unknown>";
    }
    else {
      __int128 v22 = off_1000B6FA8 + a3;
    }
    int v40 = 138543618;
    uint64_t v41 = v22;
    __int16 v42 = 2114;
    int v43 = v5;
    __int128 v23 = "Available modes changed (%{public}@) on %{public}@; no clones";
    id v24 = v16;
    uint32_t v25 = 22;
    goto LABEL_18;
  }

  if (a3 == 2)
  {
    uint64_t v34 = BKLogDisplay(v26);
    os_log_s *v35 = [v34 autorelease];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v40) = 0;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "AMDC Wireless", (uint8_t *)&v40, 2u);
    }

    [*(id *)(a1 + 16) evaluateDisplay:v7 reason:@"WirelessDisplayModeDidChange"];
  }

  else if (a3 == 1)
  {
    uint64_t v27 = BKLogDisplay(v26);
    uint64_t v28 = [v27 autorelease];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v40) = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "AMDC TVOut", (uint8_t *)&v40, 2u);
    }

    BOOL v29 = *(dispatch_queue_s **)(a1 + 8);
    id v30 = v7;
    dispatch_assert_queue_V2(v29);
    uint64_t v32 = BKLogDisplay(v31);
    os_log_s *v33 = [v32 autorelease];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v40) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "availableModesDidChangeForPurpleTVOut",  (uint8_t *)&v40,  2u);
    }

    [*(id *)(a1 + 16) evaluateDisplay:v30 reason:@"PurpleTVOutDisplayModeChange"];
    *(_BYTE *)(a1 + 41) = 1;
  }

  else
  {
    uint64_t v36 = BKLogDisplay(v26);
    os_log_s *v37 = [v36 autorelease];
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v40) = 0;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "AMDC Unknown display", (uint8_t *)&v40, 2u);
    }

    [v7 setTag:0x10000];
  }

LABEL_33:
  uint64_t v38 = BKLogDisplay(v21);
  os_log_s *v39 = [v38 autorelease];
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v40) = 0;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "AMDC done", (uint8_t *)&v40, 2u);
  }

LABEL_36:
}

void sub_100043F20(uint64_t a1, int a2, void *a3)
{
  id v7 = a3;
  if (a1)
  {
    if (a2)
    {
      _BKDisplayBlankingContext *v5 = [[_BKDisplayBlankingContext alloc] initForDisplay:v7];
      uint64_t v6 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v5;

      [*(id *)(a1 + 24) blank];
    }

    else
    {
      [*(id *)(a1 + 24) clear];
    }
  }
}

void sub_100043F90(uint64_t a1)
{
  uint64_t v2 = BKLogDisplay(a1);
  os_log_s *v3 = v2;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    *(_DWORD *)BOOL v17 = 138543618;
    *(void *)&v17[4] = v4;
    *(_WORD *)&v17[12] = 2114;
    *(void *)&v17[14] = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Current mode changed on %{public}@ -> %{public}@",  v17,  0x16u);
  }

  uint64_t v6 = *(void *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  if (v6)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v6 + 8));
    uint64_t v8 = (void *)[v7 currentMode];
    id v9 = [v8 width];
    id v10 = [v8 height];
    __int128 v11 = (void *)[v7 name];
    if ([v11 isEqual:@"TVOut"] && *(_BYTE *)(v6 + 40))
    {
      *(void *)BOOL v17 = _NSConcreteStackBlock;
      *(void *)&v17[8] = 3221225472LL;
      *(void *)&v17[16] = sub_1000441DC;
      id v18 = &unk_1000B7F00;
      id v19 = v8;
      double v20 = (double)(unint64_t)v9;
      double v21 = (double)(unint64_t)v10;
      dispatch_async(dispatch_get_main_queue(), v17);
      __int128 v12 = v19;
    }

    else
    {
      __int128 v13 = [CAWindowServer server];
      __int128 v12 = [v13 displayWithDisplayId:[v7 displayId]];

      if (v12)
      {
        [*(id *)(v6 + 16) evaluateDisplay:v12 reason:@"currentModeDidChangeForDisplay"];
      }

      else
      {
        uint64_t v15 = BKLogDisplay(v14);
        id v16 = v15;
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)BOOL v17 = 138543362;
          *(void *)&v17[4] = v7;
          _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "cannot find window server display for %{public}@",  v17,  0xCu);
        }

        __int128 v12 = 0LL;
      }
    }
  }
}

void sub_1000441CC(uint64_t a1)
{
}

void sub_1000441DC(uint64_t a1)
{
  double v2 = (double)(unint64_t)[*(id *)(a1 + 32) preferredScale];
  uint64_t v3 = BSFloatLessThanFloat(v2, 1.0);
  if ((_DWORD)v3)
  {
    uint64_t v4 = BKLogDisplay(v3);
    uint64_t v5 = [v4 autorelease];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      __int128 v13 = (void *)[NSNumber numberWithDouble:v2];
      *(_DWORD *)uint64_t v14 = 138543362;
      *(void *)&void v14[4] = v13;
      _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "preferredScale is %{public}@, using 1.0 instead",  v14,  0xCu);
    }

    double v2 = 1.0;
  }

  CGFloat v6 = *(double *)(a1 + 40);
  CGFloat v7 = *(double *)(a1 + 48);
  uint64_t v8 = BKLogDisplay(v3);
  os_log_s *v9 = [v8 autorelease];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v20.width = v6;
    v20.height = v7;
    id v10 = NSStringFromSize(v20);
    __int128 v11 = v10;
    __int128 v12 = (void *)[NSNumber numberWithDouble:v2];
    *(_DWORD *)uint64_t v14 = 138543618;
    *(void *)&void v14[4] = v11;
    *(_WORD *)&v14[12] = 2114;
    *(void *)&v14[14] = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Setting main screen size to %{public}@ and scale to %{public}@",  v14,  0x16u);
  }

  if (qword_1000DBF68 != -1) {
    dispatch_once(&qword_1000DBF68, &stru_1000B5F68);
  }
  *(void *)uint64_t v14 = _NSConcreteStackBlock;
  *(void *)&v14[8] = 3221225472LL;
  *(void *)&v14[16] = sub_100019CA4;
  uint64_t v15 = &unk_1000B5EB0;
  CGFloat v16 = v6;
  CGFloat v17 = v7;
  char v19 = (int)*(double *)&qword_1000DBF60;
  double v18 = v2;
  sub_1000196F4(v14);
}

void sub_1000443DC()
{
}

void sub_1000443F0()
{
  id v0 = sub_100044434();
  id v1 = v0;
  [v1 performSelectorOnMainThread:"_handleIapServerConnectionDied" withObject:0 waitUntilDone:0];
}

id sub_100044434()
{
  if (qword_1000DC128 != -1) {
    dispatch_once(&qword_1000DC128, &stru_1000B6EF0);
  }
  return (id)qword_1000DC120;
}

void sub_100044478(id a1)
{
  if (!sub_10001A8D4())
  {
    BKTVOutController *v1 = [[BKTVOutController alloc] init];
    double v2 = (void *)qword_1000DC120;
    qword_1000DC120 = (uint64_t)v1;
  }

void sub_1000444B0(id a1)
{
  id v1 = sub_100044434();
  id v2 = [v1 autorelease];
  [self _handleIapServerConnectionDied];
}

id sub_1000444E4(uint64_t a1)
{
  return _[*(id *)(*(void *)(a1 + 32) + 16) setCloneRotationDisabled:*(unsigned __int8 *)(a1 + 40)];
}

id sub_1000444F8(uint64_t a1)
{
  return _[*(id *)(*(void *)(a1 + 32) + 16) addModeRequest:*(void *)(a1 + 48) forDisplay:*(void *)(a1 + 40) clientPID:*(unsigned int *)(a1 + 56)];
}

id sub_100044510(uint64_t a1)
{
  return _[*(id *)(*(void *)(a1 + 32) + 16) removeModeRequestForDisplay:*(void *)(a1 + 40) clientPID:*(unsigned int *)(a1 + 48)];
}

void sub_100044828( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

id sub_100044AA8(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id result = [a3 pid];
  if (*(_DWORD *)(a1 + 40) == (_DWORD)result)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
    *a4 = 1;
  }

  return result;
}

void sub_100044B30(id a1)
{
  BKTouchDeliveryGenericGestureFocusObserver *v1 = [[BKTouchDeliveryGenericGestureFocusObserver alloc] init];
  id v4 = [BKHIDSystemInterface sharedInstance];
  BKTouchDeliveryGenericGestureFocusObserver *v2 = [[BKTouchDeliveryGenericGestureFocusObserver alloc] initWithHIDSystem:v4];
  uint64_t v3 = (void *)qword_1000DC138;
  qword_1000DC138 = (uint64_t)v2;
}

void sub_100044FD8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, char a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, char a34)
{
}

uint64_t sub_100045064(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100045074(uint64_t a1)
{
}

void sub_10004507C(uint64_t a1, void *a2)
{
  uint64_t v3 = kCASecureModeViolationProcessId;
  id v4 = a2;
  id v18 = [v4 objectForKey:v3];
  uint64_t v5 = (void *)[v4 objectForKey:kCASecureModeViolationContextId];
  CGFloat v6 = [v4 objectForKey:kCASecureModeViolationLayerNames];

  int v7 = [v18 intValue];
  if (v7 >= 1 && v7 != getpid())
  {
    uint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
    if (!v8)
    {
      NSMutableDictionary *v9 = [[NSMutableDictionary alloc] init];
      uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8LL);
      __int128 v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;

      uint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
    }

    NSMutableArray *v12 = [v8 objectForKey:v18];
    if (!v12) {
      NSMutableArray *v12 = [[NSMutableArray alloc] init];
    }
    [v12 addObject:v5];
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v12 forKey:v18];
    if ([v6 count])
    {
      __int128 v13 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
      if (!v13)
      {
        NSMutableDictionary *v14 = [[NSMutableDictionary alloc] init];
        uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8LL);
        CGFloat v16 = *(void **)(v15 + 40);
        *(void *)(v15 + 40) = v14;

        __int128 v13 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
      }

      CGFloat v17 = [v13 objectForKeyedSubscript:v5];
      if (!v17)
      {
        NSMutableSet *v17 = [[NSMutableSet alloc] init];
        [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v17 forKeyedSubscript:v5];
      }

      [v17 addObjectsFromArray:v6];
    }
  }
}

void sub_100045258(uint64_t a1, void *a2, void *a3)
{
  id v9 = a3;
  id v5 = a2;
  id v6 = [[BKSSecureModeViolation alloc] initWithProcessId:v5 contextIds:v9];

  int v7 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
  if (v7)
  {
    __int128 v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472LL;
    __int128 v13 = sub_10004551C;
    uint64_t v14 = &unk_1000B7080;
    id v15 = v9;
    uint64_t v8 = [v7 bs_filter:v11];
    if ([v8 count]) {
      [v6 setLayerNamesByContext:v8];
    }
  }

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v6 v9 v11 v12 v13 v14];
}

void sub_100045354(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = objc_getClass("FBSSystemService");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    qword_1000DC150 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  }

  else
  {
    id v2 = [NSAssertionHandler currentHandler];
    uint64_t v3 = [NSString stringWithUTF8String:"Class getFBSSystemServiceClass(void)_block_invoke"];
    [v2 handleFailureInFunction:@"BKSecureDrawingMonitor.m" lineNumber:26 description:@"Unable to find class %s" arguments:@"FBSSystemService"];

    __break(1u);
  }

void *sub_100045418()
{
  id v4 = 0LL;
  if (!qword_1000DC158)
  {
    __int128 v5 = off_1000B70F0;
    uint64_t v6 = 0LL;
    qword_1000DC158 = dlopen(v5, v4);
  }

  id v0 = (void *)qword_1000DC158;
  if (!qword_1000DC158)
  {
    id v0 = [NSAssertionHandler currentHandler];
    NSString *v3 = [NSString stringWithUTF8String:"void *FrontBoardServicesLibrary(void)"];
    [v0 handleFailureInFunction:@"BKSecureDrawingMonitor.m" lineNumber:25 description:@"%s" args:v4];

    __break(1u);
    goto LABEL_7;
  }

  id v1 = v4;
  if (v4) {
LABEL_7:
  }
    free(v1);
  return v0;
}

id sub_10004551C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ([a3 count]) {
    id v6 = [*(id *)(a1 + 32) containsObject:v5];
  }
  else {
    id v6 = 0LL;
  }

  return v6;
}

id sub_100045578(uint64_t a1)
{
  return _[*(id *)(a1 + 32) reportAndKillInsecureProcesses];
}

void sub_1000455C0(id a1)
{
  BKSecureDrawingMonitor *v1 = [[BKSecureDrawingMonitor alloc] init];
  id v2 = (void *)qword_1000DC140;
  qword_1000DC140 = (uint64_t)v1;
}

id *sub_1000456D4(id *a1)
{
  if (a1) {
    a1 = (id *)a1[1];
  }
  return a1;
}

id *sub_1000456F0(id *a1, uint64_t a2)
{
  if (a1)
  {
    id v2 = a1;
    if (a2 >= 30)
    {
      id v4 = [NSString stringWithFormat:@"pathIndex out of bounds: %d" a2];
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        id v5 = NSStringFromSelector("contactForPathIndex:");
        v6 = v5;
        uint64_t v8 = [v2 class];
        id v9 = NSStringFromClass(v8);
        id v10 = v9;
        *(_DWORD *)buf = 138544642;
        uint64_t v12 = v6;
        __int16 v13 = 2114;
        uint64_t v14 = v10;
        __int16 v15 = 2048;
        CGFloat v16 = v2;
        __int16 v17 = 2114;
        id v18 = @"BKTouchContactSet.m";
        __int16 v19 = 1024;
        int v20 = 51;
        __int16 v21 = 2114;
        __int128 v22 = v4;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
      }

      _bs_set_crash_log_message([v4 UTF8String]);
      __break(0);
      JUMPOUT(0x10004584CLL);
    }

    a1 = (id *)a1[a2 + 2];
  }

  return a1;
}

_DWORD *sub_100045854(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    return 0LL;
  }
  int v2 = a2;
  if ((_DWORD)a2)
  {
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    id v3 = *(id *)(a1 + 8);
    id v4 = [v3 countByEnumeratingWithState:v12 objects:v17 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0LL; i != v5; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v13 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(uint32_t *)((uint32_t *)v12 + i);
          if (v8[4] == v2)
          {
            id v9 = v8;
            goto LABEL_16;
          }
        }

        id v5 = [v3 countByEnumeratingWithState:v12 objects:v17 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
  }

  else
  {
    uint64_t v10 = BKLogTouchEvents(a1, a2);
    id v3 = [v10 autorelease];
    if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_ERROR, "ignoring zero touchID", buf, 2u);
    }
  }

  id v9 = 0LL;
LABEL_16:

  return v9;
}

NSMutableArray *sub_1000459B4(uint64_t a1, unsigned int *a2, uint64_t a3)
{
  if (a1)
  {
    NSMutableArray *v6 = [[NSMutableArray alloc] init];
    if (a3 >= 1)
    {
      do
      {
        unsigned int v7 = *a2++;
        uint64_t v8 = sub_100045854(a1, v7);
        id v9 = v8;
        if (v9) {
          [v6 addObject:v9];
        }

        --a3;
      }

      while (a3);
    }
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  return v6;
}

void sub_100045A40(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    uint64_t v3 = *(void *)(a2 + 8);
    if (v3 < 31)
    {
      uint64_t v7 = a1 + 16;
      uint64_t v8 = (os_log_s *)*(id *)(a1 + 16 + 8 * v3);
      id v5 = v8;
      if (v8)
      {
        uint64_t v10 = BKLogTouchEvents(v8, v9);
        os_log_s *v11 = v10;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          int v12 = 67109120;
          LODWORD(v13) = v3;
          _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "addContact: replacing existing contact for pathIndex %d",  (uint8_t *)&v12,  8u);
        }

        sub_100045B8C(a1, (uint64_t)v5);
      }

      [*(id *)(a1 + 8) addObject:a2];
      *(void *)(v7 + 8 * v3) = a2;
    }

    else
    {
      uint64_t v4 = BKLogTouchEvents(a1, a2);
      id v5 = [v4 autorelease];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        int v12 = 138543362;
        uint64_t v13 = a2;
        _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "addContact: pathIndex out of bounds -- %{public}@",  (uint8_t *)&v12,  0xCu);
      }
    }
  }

void sub_100045B8C(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    uint64_t v3 = *(void *)(a2 + 8);
    if (v3 >= 30)
    {
      NSString *v6 = [NSString stringWithFormat:@"pathIndex out of bounds: %d", *(void *)(a2 + 8)];
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        uint64_t v7 = NSStringFromSelector("removeContact:");
        uint64_t v8 = [v7 autorelease];
        uint64_t v10 = (objc_class *)[a1 class];
        __int128 v11 = NSStringFromClass(v10);
        int v12 = [v11 autorelease];
        *(_DWORD *)buf = 138544642;
        __int128 v15 = v8;
        __int16 v16 = 2114;
        __int16 v17 = v12;
        __int16 v18 = 2048;
        uint64_t v19 = a1;
        __int16 v20 = 2114;
        __int16 v21 = @"BKTouchContactSet.m";
        __int16 v22 = 1024;
        int v23 = 101;
        __int16 v24 = 2114;
        uint32_t v25 = v6;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
      }

      _bs_set_crash_log_message([v6 UTF8String]);
      __break(0);
      JUMPOUT(0x100045D38LL);
    }

    uint64_t v4 = *(void **)(a1 + 16 + 8 * v3);
    if (v4)
    {
      id v5 = *(void **)(a1 + 8);
      id v13 = v4;
      [v5 removeObject:];
      *(void *)(a1 + 16 + 8 * v3) = 0LL;
    }
  }

LABEL_3:
  __int128 v11 = 1;
LABEL_13:

  return v11;
}

void sub_1000460AC(uint64_t a1)
{
  id v1 = [[*(Class *)(a1 + 32) alloc] init];
  BKHIDHapticFeedbackInterface *v4 = [[BKHIDHapticFeedbackInterface alloc] init];
  id v2 = [v1 initWithHIDHapticFeedbackInterface:v4];
  uint64_t v3 = (void *)qword_1000DC170;
  qword_1000DC170 = (uint64_t)v2;
}

id sub_10004937C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  if (a3) {
    a3 = *(void *)(a3 + 24);
  }
  return [v4 _lock_evaluateDisplay:a3 reason:*(void *)(a1 + 40)];
}

void sub_1000494F4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_10004A16C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

int64_t sub_10004A4D0(id a1, BKNamespaceNode *a2)
{
  id v2 = [a2 object];
  uint64_t v3 = (void *)[v2 renderer];
  [v3 locationDidChange];

  return 0LL;
}

uint64_t sub_10004A514(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10004A524(uint64_t a1)
{
}

void sub_10004A52C(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v4 = (void *)[v7 object];
  id v5 = [v4 renderer];
  unsigned __int8 v6 = [v5 shouldRenderWithSupernode];

  if ((v6 & 1) == 0) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
  }
}

uint64_t sub_10004A5B0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

int64_t sub_10004A5BC(id a1, BKNamespaceNode *a2)
{
  id v2 = [a2 object];
  uint64_t v3 = (void *)[v2 renderer];

  if ([v3 shouldRenderWithSupernode])
  {
    int64_t v4 = 0LL;
  }

  else
  {
    [v3 didAddAnnotation];
    int64_t v4 = 1LL;
  }

  return v4;
}

id sub_10004A61C(uint64_t a1)
{
  BKDisplayController *v2 = [BKDisplayController sharedInstance];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 64LL);
  id v4 = sub_100065B98();
  v5 = v4;
  uint64_t v6 = sub_1000667B0((uint64_t)v5);
  if (v2)
  {
    [v2 transformLayerPropertiesForDisplay:v3 displayInterfaceOrientation:v6];
  }

  else
  {
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    __int128 v10 = 0u;
  }

  id v7 = *(void **)(*(void *)(a1 + 32) + 88LL);
  v9[0] = v10;
  v9[1] = v11;
  _DWORD v9[2] = v12;
  [v7 setAffineTransform:v9];
  [*(id *)(*(void *)(a1 + 32) + 88) setBounds:CGRectMake(v13, v14)];
  return [*(id *)(a1 + 32) _lock_locationDidChanges];
}

void sub_10004A6FC(uint64_t a1)
{
  id v2 = [NSMutableArray array];
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 56) nodeAtKeyPath:*(void *)(a1 + 40)];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_10004A978;
  v24[3] = &unk_1000B7208;
  id v4 = v2;
  id v25 = v4;
  [v3 enumerateNodesWithOptions:3 usingBlock:v24];
  id v5 = [v3 _lock_supernodeForRenderingAtKeyPath:v4];
  [*(id *)(*(void *)(a1 + 32) + 56) removeNodeAtKeyPath:*(void *)(a1 + 40)];
  double v6 = *(double *)(a1 + 56);
  if (v6 > 0.0 && *(void *)(a1 + 48))
  {
    dispatch_time_t v7 = dispatch_time(0LL, (uint64_t)(v6 * 1000000000.0));
    uint64_t v8 = *(dispatch_queue_s **)(a1 + 48);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10004AA50;
    void v18[3] = &unk_1000B8030;
    v18[4] = *(void *)(a1 + 32);
    id v19 = v4;
    dispatch_after(v7, v8, v18);
  }

  else
  {
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    id v9 = v4;
    id v10 = [v9 countByEnumeratingWithState:v20 objects:v26 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v21;
      do
      {
        __int128 v13 = 0LL;
        do
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v9);
          }
          __int128 v14 = *(void **)(a1 + 32);
          __int128 v15 = (void *)[*(id *)(*((void *)&v20 + 1) + 8 * (void)v13) object];
          [v14 _lock_removeAnnotation:v15];

          __int128 v13 = (char *)v13 + 1;
        }

        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v20 objects:v26 count:16];
      }

      while (v11);
    }
  }

  if (v5 != v3)
  {
    __int16 v16 = (void *)[v5 object];
    __int16 v17 = (void *)[v16 renderer];

    [v17 didRemoveSubannotations];
  }
}

uint64_t sub_10004A978(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_10003F198();
  os_log_s *v5 = [v4 autorelease];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    double v6 = [v3 name];
    int v8 = 138543362;
    id v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "  remove %{public}@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) addObject:v3];
  return 0LL;
}

void sub_10004AA50(uint64_t a1)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  _DWORD v5[2] = sub_10004AAC4;
  v5[3] = &unk_1000B8030;
  id v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 performSynchronizedWithCATransaction:v5];
}

void sub_10004AAC4(uint64_t a1)
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      id v6 = 0LL;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(a1 + 40);
        int v8 = [v9 object];
        [v7 _lock_removeAnnotation:v8];

        id v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:v9 objects:v13 count:16];
    }

    while (v4);
  }
}

void sub_10004ABD4(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 40) + 56) objectAtKeyPath:*(void *)(a1 + 48)];
  id v3 = v2;
  if (v2)
  {
    [*(id *)(a1 + 40) _lock_removeAnnotation:v3];
  }

  id v4 = sub_10003F198();
  uint64_t v5 = [v4 autorelease];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 32);
    int v13 = 138543618;
    uint64_t v14 = v6;
    __int16 v15 = 2114;
    uint64_t v16 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "set %{public}@ to %{public}@",  (uint8_t *)&v13,  0x16u);
  }

  int v8 = [*(id *)(*(void *)(a1 + 40) + 56) setObject:*(void *)(a1 + 32) atKeyPath:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) setNamespaceNode:v8];
  __int128 v9 = [*(id *)(a1 + 40) _lock_supernodeForRenderingAtKeyPath:*(void *)(a1 + 48)];
  __int128 v10 = v9;
  if (v9)
  {
    __int128 v11 = (void *)[v9 object];
    __int128 v12 = (void *)[v11 renderer];

    [v12 didAddAnnotation];
  }

LABEL_9:
}

void sub_10004AD54(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 56) nodeAtKeyPath:*(void *)(a1 + 40)];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  _OWORD v3[2] = sub_10004ADE0;
  v3[3] = &unk_1000B7208;
  id v4 = *(id *)(a1 + 48);
  [v2 enumerateNodesWithOptions:3 usingBlock:v3];
}

uint64_t sub_10004ADE0(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 object];
  [v2 addObject:v3];

  return 0LL;
}

void sub_10004AE20(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 56) objectAtKeyPath:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t sub_10004BFA0(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)[a2 object];
  id v4 = [v3 renderer];
  unsigned int v5 = [v4 shouldRenderWithSupernode];

  if (v5)
  {
    [*(id *)(a1 + 32) addObject:v3];
    uint64_t v6 = 0LL;
  }

  else
  {
    uint64_t v7 = (void *)[v3 renderer];
    [v7 regenerateLayerTree];

    uint64_t v6 = 1LL;
  }

  return v6;
}

void sub_10004C430(id a1)
{
  uint64_t v1 = BSSystemRootDirectory(a1);
  uint64_t v2 = v1;
  [v2 stringByAppendingPathComponent:@"System/Library/AccessibilityBundles/BackBoard.axbundle"];
  id v4 = [NSBundle bundleWithPath:v3];
}

id sub_10004C640(uint64_t a1)
{
  return [*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 16) withName:0];
}

id sub_10004C66C(uint64_t a1)
{
  id v2 =  [*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 11) withName:@"isAlternateShell" ifEqualTo:1];
  id v3 =  [*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 9) withName:@"checkedIn" ifEqualTo:1];
  id v4 =  [*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 8) withName:@"pendingCheckIn" ifEqualTo:1];
  id v5 =  [*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 10) withName:@"finishedStartup" ifEqualTo:1];
  if (![*(id *)(*(void *)(a1 + 40) + 16) watchdogType]) {
    id v6 =  [*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 12) withName:@"wasAlive"];
  }
  id result = [*(id *)(a1 + 32) hasDebugStyle];
  if ((_DWORD)result) {
    return  [*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 24) withName:@"connection"];
  }
  return result;
}

id sub_10004C760(id a1)
{
  id v1 = a1;
  if (a1)
  {
    BSDescriptionStyle *v2 = [BSDescriptionStyle succinctStyle];
    id v1 = [BSDescriptionStream descriptionForRootObject:v1 withStyle:v2];
  }

  return v1;
}

void sub_10004C7C4(uint64_t a1, int a2)
{
  if (a1)
  {
    if ([*(id *)(a1 + 16) watchdogType] == (id)1)
    {
      id v4 = [*(id *)(a1 + 16) jobLabel];
      sub_10001D49C((uint64_t)[v4 UTF8String], a2);
    }
  }

id sub_10004D04C(uint64_t a1, void *a2)
{
  return _[a2 appendDescriptionToFormatter:*(void *)(a1 + 32)];
}

BOOL sub_10004D058(id a1, BKEventStatistic *a2)
{
  return [BKEventStatistic needsLogging];
}

void sub_10004D830(uint64_t a1, void *a2)
{
  id v9 = a2;
  unint64_t v3 = *(void *)(*(void *)(a1 + 32) + 32LL);
  int64_t v4 = __clz(__rbit64(v3));
  unint64_t v5 = __clz(v3);
  unint64_t v6 = 63 - v5;
  if (v4 <= (uint64_t)(63 - v5))
  {
    unint64_t v7 = 64 - v5;
    unint64_t v8 = 63 - v5;
    do
    {
      if (((*(void *)(*(void *)(a1 + 32) + 32LL) >> v4) & 1) != 0)
      {
        if (v8 == v4) {
          [v9 appendFormat:@"%d" v6];
        }
        else {
          [v9 appendFormat:@"%d " v4];
        }
      }

      ++v4;
    }

    while (v7 != v4);
  }
}

id sub_10004DD48(id a1, BKEventStatistic *a2)
{
  return [a2 copy];
}

void sub_10004DD60(uint64_t a1, void *a2)
{
  id v3 = a2;
  int64_t v4 = *(void **)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  _DWORD v6[2] = sub_10004DDF8;
  v6[3] = &unk_1000B8030;
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  [v8 appendProem:0 block:v6];
}

void sub_10004DDF8(uint64_t a1)
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      unint64_t v6 = 0LL;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        [v7 appendObject:v8 withName:0];
        unint64_t v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:v8 objects:v12 count:16];
    }

    while (v4);
  }
}

id sub_10004DEF4(id a1, NSArray *a2)
{
  id v2 = [a2 bs_filter:&stru_1000B7288];
  if ([v2 count]) {
    id v3 = v2;
  }
  else {
    id v3 = 0LL;
  }

  return v3;
}

BOOL sub_10004DF44(id a1, BKEventStatistic *a2)
{
  return [BKEventStatistic needsLogging];
}

void sub_10004E0A8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_10004E38C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 66))
  {
    *(_BYTE *)(v1 + 66) = 1;
    [*(id *)(*(void *)(a1 + 32) + 32) invalidate];
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 32);
    *(void *)(v3 + 32) = 0LL;

    uint64_t v5 = *(void *)(a1 + 32);
    if (*(void *)(v5 + 48)) {
      sub_10004E3F0(v5);
    }
  }

void sub_10004E3F0(uint64_t a1)
{
  if (a1)
  {
    *(_BYTE *)(a1 + 65) = 1;
    [*(id *)(a1 + 48) invalidate];
    id v2 = *(void **)(a1 + 48);
    *(void *)(a1 + 4_Block_object_dispose(va, 8) = 0LL;
  }

void sub_10004E440(uint64_t a1)
{
  if (a1 && *(_BYTE *)(a1 + 65))
  {
    double v2 = BSAbsoluteMachTimeNow(a1);
    uint64_t v3 = *(void **)(a1 + 16);
    if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
    {
      double v4 = *(double *)(a1 + 40);
      if (v4 <= 0.0) {
        double v5 = 0.0;
      }
      else {
        double v5 = v2 - v4;
      }
      uint64_t v6 = *(void *)(a1 + 8);
      id v7 = *(void **)(a1 + 24);
      __int128 v8 = v3;
      __int128 v9 = [v7 bs_compactMap:&stru_1000B73A0];
      __int128 v10 = [BSDescriptionStream descriptionForRootObject:v9];
      *(_DWORD *)buf = 138543874;
      uint64_t v22 = v6;
      __int16 v23 = 2048;
      double v24 = v5;
      __int16 v25 = 2114;
      uint64_t v26 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@ events starting %gs ago: %{public}@",  buf,  0x20u);
    }

    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id v11 = *(id *)(a1 + 24);
    id v12 = [v11 countByEnumeratingWithState:v17 objects:buf count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v18;
      do
      {
        for (uint64_t i = 0LL; i != v13; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
        }

        id v13 = [v11 countByEnumeratingWithState:v17 objects:buf count:16];
      }

      while (v13);
    }

    *(_WORD *)(a1 + 64) = 1;
  }

id sub_10004E62C(id a1, BKEventStatistic *a2)
{
  double v2 = a2;
  if (-[BKEventStatistic needsLogging](v2, "needsLogging")) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0LL;
  }

  return v3;
}

void sub_10004E66C(uint64_t a1)
{
  if (!*(_BYTE *)(*(void *)(a1 + 32) + 66LL))
  {
    double v2 = BSAbsoluteMachTimeNow(a1);
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
    uint64_t v3 = *(void *)(a1 + 32);
    if (*(void *)(v3 + 48))
    {
      [*(id *)(v3 + 48) invalidate];
      uint64_t v4 = *(void *)(a1 + 32);
      double v5 = *(void **)(v4 + 48);
      *(void *)(v4 + 4_Block_object_dispose(va, 8) = 0LL;

      uint64_t v3 = *(void *)(a1 + 32);
    }

    if (*(_BYTE *)(v3 + 64))
    {
      *(double *)(v3 + 40) = v2;
      *(_BYTE *)(*(void *)(a1 + 32) + 64LL) = 0;
      uint64_t v3 = *(void *)(a1 + 32);
    }

    if (v2 - *(double *)(v3 + 40) >= 32.0)
    {
      sub_10004E3F0(v3);
    }

    else
    {
      uint64_t v6 = [BSAbsoluteMachTimer initWithIdentifier:@"BKEventStatisticsLogging"];
      uint64_t v7 = *(void *)(a1 + 32);
      __int128 v8 = *(void **)(v7 + 48);
      *(void *)(v7 + 4_Block_object_dispose(va, 8) = v6;

      location = *(id *)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 32);
      __int128 v10 = *(void **)(v9 + 48);
      uint64_t v11 = *(void *)(v9 + 56);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      _DWORD v12[2] = sub_10004E7F0;
      v12[3] = &unk_1000B73C8;
      [location copy];
      [v10 scheduleWithFireInterval:v11 leewayInterval:v12 queue:8.0 handler:0.5];
      [v13 release];
      [location release];
    }
  }

void sub_10004E7D4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_10004E7F0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    sub_10004E3F0((uint64_t)WeakRetained);
    id WeakRetained = v2;
  }
}

void sub_10004E820(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (dispatch_queue_s **)objc_loadWeakRetained((id *)(a1 + 32));
  double v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = WeakRetained[7];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    void v7[2] = sub_10004E8C8;
    v7[3] = &unk_1000B8030;
    id v8 = v3;
    uint64_t v9 = v5;
    dispatch_async(v6, v7);
  }
}

void sub_10004E8C8(uint64_t a1)
{
}

void sub_10004E940(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.backboard.BKEventStatistics", 0LL);
  id v2 = (void *)qword_1000DC190;
  qword_1000DC190 = (uint64_t)v1;
}

LABEL_39:
    BOOL v29 = BKLogSystemShell();
    uint64_t v28 = v29;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Updating primary system to nil because we are waiting for the alternate system app to launch",  buf,  2u);
    }

    uint64_t v22 = 0LL;
LABEL_42:

    goto LABEL_43;
  }

  if (!self->_lock_systemApp
    || !-[NSMutableOrderedSet containsObject:](self->_lock_connectedSystemApps, "containsObject:"))
  {
    uint64_t v22 = [self->_lock_connectedSystemApps firstObject];
    uint64_t v26 = BKLogSystemShell();
    id v3 = [v26 mutableCopy];
    if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      __int128 v64 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v3,  OS_LOG_TYPE_DEFAULT,  "Updating primary system first app: %{public}@",  buf,  0xCu);
    }

LABEL_43:
    goto LABEL_44;
  }

  __int16 v23 = BKLogSystemShell();
  double v24 = [v23 autorelease];
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    lock_systemApp = self->_lock_systemApp;
    *(_DWORD *)buf = 138543362;
    __int128 v64 = lock_systemApp;
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Updating primary system app to the old _systemApp: %{public}@",  buf,  0xCu);
  }

  uint64_t v22 = self->_lock_systemApp;
LABEL_44:
  p_lock_systemApp = &self->_lock_systemApp;
  if (self->_lock_systemApp != v22)
  {
    objc_storeStrong((id *)&self->_lock_systemApp, v22);
    uint64_t v31 = *p_lock_systemApp;
    uint64_t v32 = BKLogSystemShell();
    os_log_s *v33 = [v32 autorelease];
    uint64_t v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
    if (v31)
    {
      if (v34)
      {
        __int128 v35 = *p_lock_systemApp;
        if (*p_lock_systemApp) {
          __int128 v35 = (BKSystemShellClient *)v35->_descriptor;
        }
        uint64_t v36 = v35;
        BKSystemShellClient *v37 = [v36 bundleIdentifier];
        *(_DWORD *)buf = 138543362;
        __int128 v64 = v37;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Now monitoring %{public}@", buf, 0xCu);
      }
    }

    else
    {
      if (v34)
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "No system apps remain. Waiting for one to spawn...",  buf,  2u);
      }

      if (self->_enableIdleSleepAssertionID)
      {
        uint64_t v38 = BKLogSystemShell();
        os_log_s *v39 = [v38 autorelease];
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "Telling IOKit that idle sleep is now disabled.",  buf,  2u);
        }

        IOPMAssertionRelease(self->_enableIdleSleepAssertionID);
        self->_enableIdleSleepAssertionID = 0;
      }
    }
  }

  int v40 = [self->_observers context];
  uint64_t v49 = 0u;
  uint64_t v50 = 0u;
  id v51 = 0u;
  id v52 = 0u;
  uint64_t v41 = [v40 countByEnumeratingWithState:v49 objects:v61 count:16];
  if (v41)
  {
    __int16 v42 = v41;
    int v43 = *(void *)v50;
    do
    {
      __int16 v44 = 0LL;
      do
      {
        if (*(void *)v50 != v43) {
          objc_enumerationMutation(v40);
        }
        uint64_t v45 = *(void **)(*((void *)&v49 + 1) + 8LL * (void)v44);
        if ((objc_opt_respondsToSelector(v45, "systemShellChangedWithPrimary:") & 1) != 0)
        {
          if (v22) {
            descriptor = v22->_descriptor;
          }
          else {
            descriptor = 0LL;
          }
          __int16 v47 = descriptor;
          [v45 systemShellChangedWithPrimary:v47];
        }

        __int16 v44 = (char *)v44 + 1;
      }

      while (v42 != v44);
      id v48 = [v40 countByEnumeratingWithState:v49 objects:v61 count:16];
      __int16 v42 = v48;
    }

    while (v48);
  }
}

uint64_t sub_1000513F8(uint64_t a1)
{
  uint64_t v2 = BKLogSystemShell(a1);
  os_log_s *v3 = v2;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 138543362;
    uint64_t v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Killing %{public}@.", (uint8_t *)&v6, 0xCu);
  }

  return kill((pid_t)[*(id *)(a1 + 32) pid], 9);
}

id sub_1000514AC(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) start];
}

uint64_t sub_1000514B8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void sub_1000514EC(uint64_t a1)
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v1 = *(id *)(a1 + 32);
  id v2 = [v1 countByEnumeratingWithState:v9 objects:v15 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v10;
    do
    {
      for (uint64_t i = 0LL; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v1);
        }
        int v6 = *(void **)(*((void *)&v9 + 1) + 8LL * (void)i);
        uint64_t v7 = BKLogSystemShell();
        os_log_s *v8 = v7;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v14 = v6;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Killing %{public}@.", buf, 0xCu);
        }

        kill((pid_t)[v6 pid], 9);
      }

      id v3 = [v1 countByEnumeratingWithState:v9 objects:v15 count:16];
    }

    while (v3);
  }
}

BKSystemShellDescriptor *__cdecl sub_100051650(id a1, BKSystemShellClient *a2)
{
  if (a2) {
    return a2->_descriptor;
  }
  else {
    return 0LL;
  }
}

BKSystemShellDescriptor *__cdecl sub_100051664(id a1, BKSystemShellClient *a2)
{
  if (a2) {
    return a2->_descriptor;
  }
  else {
    return 0LL;
  }
}

id sub_100051678(id a1, BKSystemShellClient *a2)
{
  if (a2) {
    return a2->_descriptor;
  }
  else {
    return 0LL;
  }
}

id sub_10005168C(id a1, BKSystemShellClient *a2)
{
  if (a2) {
    return a2->_descriptor;
  }
  else {
    return 0LL;
  }
}

id sub_1000516A0(id a1, BKSystemShellClient *a2)
{
  if (a2) {
    return a2->_descriptor;
  }
  else {
    return 0LL;
  }
}

id sub_1000516B4(id a1, BKSystemShellClient *a2)
{
  if (a2) {
    return a2->_descriptor;
  }
  else {
    return 0LL;
  }
}

void sub_1000516C8(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) primarySystemShell];
  id v4 = [v2 appendObject:v3 withName:@"systemApp"];

  double v5 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) systemShells];
  [v5 appendArraySection:v6 withName:@"connectedSystemApps" skipIfEmpty:1];
}

void sub_1000517D0(id a1)
{
  uint64_t v1 = BSDispatchQueueCreateWithQualityOfService("com.apple.backboardd.migration", 0LL, 33LL, 0LL);
  id v2 = (void *)qword_1000DC1B0;
  qword_1000DC1B0 = v1;
}

void sub_100051804(id a1)
{
  BKSystemShellSentinel *v1 = [[BKSystemShellSentinel alloc] init];
  id v2 = (void *)qword_1000DC198;
  qword_1000DC198 = (uint64_t)v1;
}

id sub_100051D7C(uint64_t a1)
{
  double v2 = BSAbsoluteMachTimeNow(a1);
  id v3 = *(double **)(a1 + 32);
  double v4 = v3[5];
  if (v4 <= 0.0 || v4 <= v2) {
    return [v3 _queue_invalidate];
  }
  else {
    return [v3 _queue_setTimerWithTimeIntervalSinceNow:v4 - v2];
  }
}

id sub_100051DC0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _queue_invalidate];
}

void sub_100051E44(id a1)
{
  uint64_t Serial = BSDispatchQueueCreateSerial(@"BKDisplayBrightnessUpdateTransaction");
  double v2 = (void *)qword_1000DC1C0;
  qword_1000DC1C0 = Serial;
}

void sub_100051E6C(id a1)
{
  uint64_t v1 = (void *)qword_1000DC1B8;
  if (!qword_1000DC1B8)
  {
    BKDisplayBrightnessUpdateTransaction *v2 = [[BKDisplayBrightnessUpdateTransaction alloc] init];
    BKDisplayBrightnessUpdateTransactionManager *v3 = [BKDisplayBrightnessUpdateTransactionManager sharedInstance];
    BKDisplayBrightnessUpdateTransaction *v4 = [[BKDisplayBrightnessUpdateTransaction alloc] initWithIdentifier:@"(implicit)" transactionManager:v3];
    double v5 = (void *)qword_1000DC1B8;
    qword_1000DC1B8 = (uint64_t)v4;

    uint64_t v1 = (void *)qword_1000DC1B8;
  }

  [v1 _queue_updateExpirationTimeWithIntervalSinceNow:1.0];
}

void sub_1000525BC(id a1)
{
  BKDisplayBrightnessUpdateTransactionManager *v1 = [[BKDisplayBrightnessUpdateTransactionManager alloc] init];
  BKDisplayBrightnessController *v4 = [BKDisplayBrightnessController sharedInstance];
  BKDisplayBrightnessUpdateTransactionManager *v2 = [[BKDisplayBrightnessUpdateTransactionManager alloc] initWithBrightnessController:v4];
  id v3 = (void *)qword_1000DC1D0;
  qword_1000DC1D0 = (uint64_t)v2;
}

id sub_100052784(uint64_t a1)
{
  id v2 =  [*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 14) withName:@"shouldActivateByGesture" ifEqualTo:1];
  id v3 =  [*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 64) withName:@"transport" skipIfNil:1];
  id v4 =  [*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 56) withName:@"keyboardLanguage" skipIfNil:1];
  id v5 =  [*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 48) withName:@"keyboardLayout" skipIfNil:1];
  id v6 =  [*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 72) withName:@"exclusivityIdentifier" skipIfNil:1];
  id v7 =  [*(id *)(a1 + 32) appendInt:*(unsigned __int8 *)(*(void *)(a1 + 40) + 12) withName:@"countryCode"];
  id v8 =  [*(id *)(a1 + 32) appendInt:*(unsigned int *)(*(void *)(a1 + 40) + 16) withName:@"keyboardType"];
  id v9 =  [*(id *)(a1 + 32) appendInteger:*(void *)(*(void *)(a1 + 40) + 40) withName:@"subinterfaceID"];
  id v10 =  [*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 8) withName:@"capsLockOn" ifEqualTo:1];
  id v11 =  [*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 9) withName:@"capsLockRomanSwitchMode" ifEqualTo:1];
  id v12 =  [*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 10) withName:@"capsLockKeyHasLanguageSwitchLabel" ifEqualTo:1];
  id v13 =  [*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 11) withName:@"globeKeyLabelHasGlobeSymbol" ifEqualTo:1];
  return  [*(id *)(a1 + 32) appendPointer:*(void *)(*(void *)(a1 + 40) + 80) withName:@"gsKeyboard"];
}

id sub_100052934(uint64_t a1)
{
  id v2 = *(void **)(a1 + 112);
  if (v2)
  {
    if (*(void *)(a1 + 120))
    {
      uint64_t v3 = BKSHIDServicesProductIdentifierFromServiceProperties();
      id v2 = v3;
    }

    else
    {
      id v2 = 0LL;
    }
  }

  return v2;
}

id sub_10005296C(void *a1)
{
  if (!a1[14]) {
    return 0LL;
  }
  uint64_t v1 = a1[15];
  if (!v1) {
    return 0LL;
  }
  uint64_t v2 = BKSHIDServicesProductIdentifierFromServiceProperties(a1[14], v1, a1[16]);
  uint64_t v3 = v2;
  BKSDefaults *v4 = [BKSDefaults externalDefaults];
  id v5 = [v4 keyboardDefaults];

  id v6 = [v5 modifierKeyRemapping];
  id v7 = v6;
  if (v6)
  {
    id v8 = [v6 objectForKey:v3];
    uint64_t v10 = [NSArray class];
    id v11 = v8;
    id v12 = v11;
    if (v10)
    {
      if ((objc_opt_isKindOfClass(v11, v10) & 1) != 0) {
        id v13 = v12;
      }
      else {
        id v13 = 0LL;
      }
    }

    else
    {
      id v13 = 0LL;
    }

    id v16 = v13;

    if ([v16 count])
    {
      __int128 v44 = 0u;
      __int128 v45 = 0u;
      __int128 v42 = 0u;
      __int128 v43 = 0u;
      id v15 = v16;
      id v17 = [v15 countByEnumeratingWithState:v42 objects:v48 count:16];
      if (v17)
      {
        id v19 = v17;
        id v39 = v16;
        int v40 = v7;
        uint64_t v41 = v5;
        uint64_t v20 = *(void *)v43;
        while (2)
        {
          for (uint64_t i = 0LL; i != v19; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v43 != v20) {
              objc_enumerationMutation(v15);
            }
            uint64_t v22 = *(void **)(*((void *)&v42 + 1) + 8LL * (void)i);
            NSDictionary *v23 = v18;
            id v24 = v22;
            __int16 v25 = v24;
            if (v23)
            {
              if ((objc_opt_isKindOfClass(v24, v23) & 1) != 0) {
                uint64_t v26 = v25;
              }
              else {
                uint64_t v26 = 0LL;
              }
            }

            else
            {
              uint64_t v26 = 0LL;
            }

            id v27 = v26;

            uint64_t v28 = (void *)[v27 allKeys];
            if ([v28 count] != (id)2) {
              goto LABEL_30;
            }
            BOOL v29 = [v27 objectForKey:@"HIDKeyboardModifierMappingSrc"];
            uint64_t v31 = [NSNumber class];
            if ((objc_opt_isKindOfClass(v29, v31) & 1) == 0)
            {

LABEL_30:
LABEL_31:
              uint64_t v37 = BKLogKeyboard(v36);
              uint64_t v38 = v37;
              if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                id v47 = v27;
                _os_log_error_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_ERROR,  "invalid key remapping dictionary: %{public}@",  buf,  0xCu);
              }

              id v15 = 0LL;
              goto LABEL_34;
            }

            uint64_t v32 = (void *)[v27 objectForKey:@"HIDKeyboardModifierMappingDst"];
            uint64_t v34 = [NSNumber class];
            char isKindOfClass = objc_opt_isKindOfClass(v32, v34);

            if ((isKindOfClass & 1) == 0) {
              goto LABEL_31;
            }
          }

          id v19 = [v15 countByEnumeratingWithState:v42 objects:v48 count:16];
          if (v19) {
            continue;
          }
          break;
        }

LABEL_34:
        id v5 = v41;
        id v16 = v39;
        id v7 = v40;
      }
    }

    else
    {
      id v15 = 0LL;
    }
  }

  else
  {
    id v15 = 0LL;
  }

  return v15;
}

    [v16 addObject:@"notifyBrightnessSystem"];
    if ((a5 & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }

  screenOwnerPID = self->_screenOwnerPID;
  __int128 v43 = [v8 pid];
  if (v8)
  {
    if (v7) {
      __int128 v44 = *(void **)(v7 + 32);
    }
    else {
      __int128 v44 = 0LL;
    }
    __int128 v45 = v44;
    uint64_t v46 = [v45 containsObject:v8];
  }

  else
  {
    uint64_t v46 = 0;
  }

  if (screenOwnerPID != v43 && v46 == 0)
  {
    [self _queue_addOverlayForReason:v4];
  }

  else
  {
    id v48 = sub_10003F0B0();
    uint64_t v49 = [v48 autorelease];
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v50 = [v8 pid];
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)uint64_t v63 = v50;
      *(_WORD *)&v63[4] = 1024;
      *(_DWORD *)&v63[6] = screenOwnerPID == v43;
      *(_WORD *)&v63[10] = 1024;
      *(_DWORD *)&v63[12] = v46;
      _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_DEFAULT,  "updateOverlay: pid:%d explicitlyDismissed:%{BOOL}u finishedStartup:%{BOOL}u",  buf,  0x14u);
    }

    if (self->_isOverlaySustained)
    {
      id v51 = v7;
      self->_dismissSustainedOverlayIfUnsustained = 1;
      id v52 = sub_10003F0B0();
      os_log_s *v53 = v52;
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)uint64_t v63 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEFAULT,  "updateOverlay: Not dismissing because overlay has been sustained by the system app: %{public}@ ",  buf,  0xCu);
      }

      id v7 = v51;
    }

    else
    {
      uint64_t v54 = sub_10003F0B0();
      os_log_s *v55 = [v54 autorelease];
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)uint64_t v63 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_DEFAULT,  "updateOverlay: Dismissing overlay: %{public}@ ",  buf,  0xCu);
      }

      [self _queue_removeOverlayWithAnimationSettings:0LL];
    }
  }
}

uint64_t sub_100052C9C(void *a1)
{
  if (a1)
  {
    id v1 = sub_10005296C(a1);
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    id obj = v1;
    id v2 = [obj countByEnumeratingWithState:v16 objects:v20 count:16];
    if (v2)
    {
      id v3 = v2;
      char v4 = 0;
      char v5 = 0;
      uint64_t v6 = *(void *)v17;
      do
      {
        for (uint64_t i = 0LL; i != v3; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v17 != v6) {
            objc_enumerationMutation(obj);
          }
          id v8 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
          uint64_t v9 = (void *)[v8 objectForKeyedSubscript:@"HIDKeyboardModifierMappingSrc"];
          id v10 = [v9 unsignedLongLongValue];

          id v11 = [v8 objectForKeyedSubscript:@"HIDKeyboardModifierMappingDst"];
          id v12 = [v11 unsignedLongLongValue];

          v5 |= v10 == (id)0x700000039LL;
          v4 |= v12 == (id)0x700000039LL;
        }

        id v3 = [obj countByEnumeratingWithState:v16 objects:v20 count:16];
      }

      while (v3);
      char v13 = v5 ^ 1 | v4;
    }

    else
    {
      char v13 = 1;
    }
  }

  else
  {
    char v13 = 0;
  }

  return v13 & 1;
}

uint64_t sub_100052E30(uint64_t a1)
{
  if (!a1) {
    return 0LL;
  }
  if (!*(_BYTE *)(a1 + 14)) {
    return 1LL;
  }
  id v1 = [*(id *)(a1 + 24) propertyForKey:@"KeyboardEnabled"];
  NSNumber *v3 = [NSNumber class];
  id v4 = v1;
  char v5 = v4;
  if (v3)
  {
    if ((objc_opt_isKindOfClass(v4, v3) & 1) != 0) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0LL;
    }
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  id v8 = v6;

  if (v8) {
    id v7 = [v8 BOOLValue];
  }
  else {
    id v7 = 0LL;
  }

  return (uint64_t)v7;
}

void sub_100052EE4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (a1 && v3)
  {
    id v5 = [v3 copy];
    uint64_t v6 = *(void **)(a1 + 48);
    *(void *)(a1 + 4_Block_object_dispose(va, 8) = v5;

    if (*(void *)(a1 + 80))
    {
      uint64_t v8 = *(void *)(a1 + 80);
      if (v8) {
        GSKeyboardRelease(v8, v7);
      }
    }

    uint64_t v9 = *(unsigned int *)(a1 + 16);
    else {
      uint64_t v10 = dword_10008C3F0[v9];
    }
    uint64_t v11 = GSKeyboardCreateWithCountryCode(v4, v10, *(unsigned __int8 *)(a1 + 12));
    *(void *)(a1 + 80) = v11;
    if (*(_BYTE *)(a1 + 8))
    {
      __int16 v12 = 0;
      GSKeyboardTranslateKeyExtendedCommandWithUsagePage(v11, 57LL, 0LL, 0LL, &v12, 0LL, &v12);
      GSKeyboardTranslateKeyExtendedCommandWithUsagePage(*(void *)(a1 + 80), 57LL, 1LL, 0LL, &v12, 0LL, &v12);
    }
  }

void sub_100053008(uint64_t a1, int a2)
{
  if (a1 && *(unsigned __int8 *)(a1 + 9) != a2)
  {
    *(_BYTE *)(a1 + 9) = a2;
    id v5 = *(id *)(a1 + 24);
    [v5 setProperty:@NO forKey:@"HIDCapsLockState"];
    if (a2) {
      id v4 = [NSNumber numberWithBool:YES];
    }
    else {
      id v4 = __kCFBooleanFalse;
    }
    [v5 setProperty:v4 forKey:@"HIDCapsLockLEDInhibit"];
    if (*(_BYTE *)(a1 + 8))
    {
      *(_BYTE *)(a1 + _Block_object_dispose(va, 8) = 0;
      [*(id *)(a1 + 24) setElementValue:0 forUsagePage:8 usage:2];
    }
  }

void sub_1000530C8(uint64_t a1, double a2)
{
  if (a1)
  {
    id v3 = *(id *)(a1 + 24);
    id v4 = v3;
    if (a2 != -1.0) {
      a2 = a2 * 1000.0;
    }
    if (a2 == -1.0 || a2 >= 0.0 && a2 <= 3000.0)
    {
      id v5 = [NSNumber numberWithInt:a2];
      [v4 setProperty:v5 forKey:@"CapsLockDelayOverride"];
    }

    else
    {
      uint64_t v6 = BKLogKeyboard(v3);
      id v5 = v6;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        v7[0] = 67109120;
        v7[1] = (int)a2;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "setCapsLockDelayOverride called with invalid interval %d",  (uint8_t *)v7,  8u);
      }
    }
  }

id sub_1000531F0(void *a1)
{
  if (a1)
  {
    id v1 = sub_100052934((uint64_t)a1);
    a1 = v1;
  }

  return a1;
}

id sub_10005320C(void *a1)
{
  if (a1)
  {
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 3221225472LL;
    v2[2] = sub_100053270;
    v2[3] = &unk_1000B7608;
    void v2[4] = a1;
    a1 = [BKSHIDKeyboardDeviceProperties build:v2];
  }

  return a1;
}

void sub_100053270(uint64_t a1, void *a2)
{
  id v3 = *(void **)(*(void *)(a1 + 32) + 24LL);
  id v4 = a2;
  [v4 setSenderID:[v3 senderID]];
  [v4 setTransport:*(void *)(*(void *)(a1 + 32) + 64)];
  [v4 setLayout:*(void *)(*(void *)(a1 + 32) + 48)];
  [v4 setLanguage:*(void *)(*(void *)(a1 + 32) + 56)];
  [v4 setExclusivityIdentifier:*(void *)(*(void *)(a1 + 32) + 72)];
  [v4 setCountryCode:*(unsigned __int8 *)(*(void *)(a1 + 32) + 12)];
  [v4 setStandardType:*(unsigned int *)(*(void *)(a1 + 32) + 16)];
  [v4 setSubinterfaceID:*(void *)(*(void *)(a1 + 32) + 40)];
  [v4 setCapsLockKeyHasLanguageSwitchLabel:*(unsigned __int8 *)(*(void *)(a1 + 32) + 10)];
  [v4 setGlobeKeyLabelHasGlobeSymbol:*(unsigned __int8 *)(*(void *)(a1 + 32) + 11)];
}

void sub_100053638(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v3 setPid:[v2 pid]];
}

void sub_10005367C(uint64_t a1)
{
  if (a1) {
    NSArray *v1 = [NSArray arrayWithObject:a1];
  }
  else {
    id v1 = [qword_1000DC1E0 allKeys];
  }
  id v2 = v1;
  [v1 enumerateObjectsUsingBlock:&stru_1000B7670];
}

void sub_1000536D4(id a1, NSString *a2, unint64_t a3, BOOL *a4)
{
  id v4 = a2;
  id v5 = (const __CFBoolean *)CFPreferencesCopyAppValue(v4, kCFPreferencesCurrentApplication);
  if (v5)
  {
    CFBooleanRef v6 = v5;
    id v7 = [(id)qword_1000DC1E0 objectForKey:v4];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = [BKDisplayBrightnessController sharedInstance];
      [v9 setProperty:v6 forKey:v8];

      else {
        BOOL v10 = 0;
      }
      if (v10)
      {
        uint64_t v11 = BKLogDetailed();
        os_log_s *v12 = [v11 autorelease];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)char v13 = 0;
          _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "resetting ALS curve", v13, 2u);
        }

        sub_1000537E8();
      }

      sub_100053828();
    }

    CFRelease(v6);
  }
}

void sub_1000537E8()
{
  BKDisplayBrightnessController *v0 = [BKDisplayBrightnessController sharedInstance];
  [v0 setProperty:0 forKey:@"ALSResetCurve"];
}

void sub_100053828()
{
  BKDisplayBrightnessController *v0 = [BKDisplayBrightnessController sharedInstance];
  id v4 = [v0 propertyForKey:@"ALSUserPreference"];

  id v1 = [NSNull null];
  unsigned int v2 = [v4 isEqual:v1];

  if (v2)
  {

    id v4 = 0LL;
  }

  BKSDefaults *v3 = [BKSDefaults localDefaults];
  [v3 setALSUserPreferences:v4];
}

BOOL sub_1000538D0()
{
  BKSDefaults *v0 = [BKSDefaults localDefaults];
  id v1 = [v0 ALSUserPreferences];

  if (v1)
  {
    BKDisplayBrightnessController *v2 = [BKDisplayBrightnessController sharedInstance];
    [v2 setProperty:v1 forKey:@"ALSUserPreference"];
  }

  return v1 != 0LL;
}

void sub_100053948(id a1)
{
}

void sub_100053958(int a1, uint64_t a2, CFArrayRef theArray)
{
  if (a2 == 1) {
    goto LABEL_6;
  }
  if (a2 == 128 || a2 == 32)
  {
    CFIndex Count = CFArrayGetCount(theArray);
    if (Count <= 0) {
      __assert_rtn("_wrapRunLoopWithAutoreleasePoolHandler", "BKAutoreleasePoolRunLoopSupport.m", 27, "count > 0");
    }
    CFIndex v6 = Count - 1;
    ValueAtIndex = CFArrayGetValueAtIndex(theArray, Count - 1);
    NSPopAutoreleasePool(ValueAtIndex);
    CFArrayRemoveValueAtIndex(theArray, v6);
    if (a2 == 32)
    {
LABEL_6:
      id v8 = (const void *)NSPushAutoreleasePool(0LL);
      CFArrayAppendValue(theArray, v8);
    }
  }

id sub_100054568(id a1, void *a2)
{
  id v4 = a2;
  if (a1)
  {
    a1 = sub_1000545FC(a1, v3);
    if (a1)
    {
      id v5 = [v4[1] copy];
      CFIndex v6 = (void *)*((void *)a1 + 1);
      *((void *)a1 + 1) = v5;

      id v7 = [v4[2] copy];
      id v8 = (void *)*((void *)a1 + 2);
      *((void *)a1 + 2) = v7;

      id v9 = [v4[3] copy];
      BOOL v10 = (void *)*((void *)a1 + 3);
      *((void *)a1 + 3) = v9;

      *((_DWORD *)a1 + _Block_object_dispose(va, 8) = *((_DWORD *)v4 + 8);
      *((void *)a1 + 5) = v4[5];
      *((void *)a1 + 6) = v4[6];
    }
  }

  return a1;
}

id sub_1000545FC(id result, uint64_t a2)
{
  if (result)
  {
    unsigned int v2 = result;
    [result class];
    if (v3 != objc_opt_class(&OBJC_CLASS___BKSystemShellDescriptor, v4))
    {
      uint64_t v6 = [v2 class];
      if (v6 != objc_opt_class(&OBJC_CLASS___BKMutableSystemShellDescriptor, v7))
      {
        id v8 = [NSString stringWithFormat:@"BKSystemShellDescriptor cannot be subclassed"];
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          id v9 = NSStringFromSelector("_init");
          BOOL v10 = [v9 autorelease];
          v12 = [v2 class];
          char v13 = NSStringFromClass(v12);
          uint64_t v14 = [v13 autorelease];
          *(_DWORD *)buf = 138544642;
          __int128 v17 = v10;
          __int16 v18 = 2114;
          __int128 v19 = v14;
          __int16 v20 = 2048;
          __int128 v21 = v2;
          __int16 v22 = 2114;
          uint64_t v23 = @"BKSystemShellDescriptor.m";
          __int16 v24 = 1024;
          int v25 = 44;
          __int16 v26 = 2114;
          id v27 = v8;
          _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
        }

        _bs_set_crash_log_message([v8 UTF8String]);
        __break(0);
        JUMPOUT(0x100054798LL);
      }
    }

    v15.receiver = v2;
    v15.super_class = [BKSystemShellDescriptor class];
    return [super init];
  }

  return result;
}

LABEL_20:
        uint64_t v28 = 1LL;
        goto LABEL_21;
      }

      char v13 = xmmword_10008C400;
    }

    v10->_sensorsRequiredForOpenState = v13;
    if (a6)
    {
      v10->_state = 3LL;
      if (!(_DWORD)a3)
      {
LABEL_22:
        BOOL v29 = sub_10003F124();
        os_log_s *v16 = [v29 autorelease];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "No SmartCover sensors detected",  (uint8_t *)&buf,  2u);
        }

LABEL_25:
  buf = v11;
  uint64_t v30 = &_dispatch_main_q;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_100055DD8;
  v33[3] = &unk_1000B76D8;
  [v34 copy];
  uint64_t v31 = (id)BSLogAddStateCaptureBlockWithTitle( &_dispatch_main_q,  @"BKSmartCover",  v33);

  [v34 release];
  objc_destroyWeak(buf);
  return v11;
}

      uint64_t v34 = self->_screenOwnerBundleIdentifier;
      __int128 v35 = (void *)[v8 bundleIdentifier];
      BOOL v34 = [NSString isEqual:v35];

      if ((v34 & 1) != 0)
      {
        uint64_t v7 = v57;
      }

      else
      {
        uint64_t v36 = sub_10003F0B0();
        uint64_t v37 = [os_log autorelease];
        uint64_t v7 = v57;
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v38 = self->_screenOwnerBundleIdentifier;
          id v39 = [v8 bundleIdentifier];
          *(_DWORD *)buf = 138543618;
          *(void *)uint64_t v63 = v38;
          *(_WORD *)&v63[8] = 2114;
          *(void *)&v63[10] = v39;
          _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "updateOverlay: Screen owner missing (expected:%{public}@) got:%{public}@",  buf,  0x16u);
        }

        self->_screenOwnerPID = -1;
        int v40 = self->_screenOwnerBundleIdentifier;
        self->_screenOwnerBundleIdentifier = 0LL;
      }

      goto LABEL_34;
    }
  }

  else
  {
    unsigned __int8 v57 = 0LL;
    id v8 = 0LL;
    p_screenOwnerPID = &self->_screenOwnerPID;
    if (self->_screenOwnerPID > 0)
    {
      objc_super v15 = 0LL;
      goto LABEL_8;
    }
  }

  uint64_t v41 = sub_10003F0B0();
  BOOL v10 = [v41 autorelease];
  uint64_t v7 = v57;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    uint64_t v11 = "updateOverlay: No explicit screen owner";
    __int16 v12 = v10;
    char v13 = 2;
LABEL_5:
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
  }

void sub_100054BD4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

LABEL_54:
        goto LABEL_55;
      }

      if (v13 != -16187376)
      {
        if (v13 != -16187360)
        {
          uint64_t v31 = sub_10003F124();
          __int128 v17 = [v31 autorelease];
          if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109376;
            uint64_t v60 = IntegerValue;
            uint64_t v61 = 1024;
            __int128 v62 = v12 != 0;
            _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v17,  OS_LOG_TYPE_ERROR,  "SmertCover unknown usage: %X down:%{BOOL}u",  buf,  0xEu);
          }

          goto LABEL_54;
        }

        __int128 v21 = sub_10003F124();
        os_log_s *v22 = v21;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          uint64_t v60 = v12 != 0;
          _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "SmartCover StateUnknown:%{BOOL}u",  buf,  8u);
        }

        if (v12)
        {
          self->_state = 3LL;
          BKSHIDEventSetSmartCoverInfo(v10, 2, [BKSmartCoverHIDEventProcessor _wakeAnimationStyle]);
          uint64_t v23 = sub_10003F124();
          os_log_s *v24 = [v23 autorelease];
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Sending BKSHIDEventSmartCoverAmbiguousOpen",  buf,  2u);
          }

          int v25 = 2LL;
          if (v10) {
            goto LABEL_45;
          }
        }

        else
        {
          if (self->_state == 3 && (self->_sensorsRequiredForOpenState & self->_disengagedSensors) == 0)
          {
            id v48 = sub_10003F124();
            uint64_t v49 = [v48];
            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_DEFAULT,  "Recovering from unknown smart cover state; Sending BKSHIDEventSmartCoverClosed",
                buf,
                2u);
            }

            [self _smartCoverSensorsDidEngage:self->_sensorsRequiredForOpenState];
            BKSHIDEventSetSmartCoverInfo( v10,  3LL,  [BKSmartCoverHIDEventProcessor _wakeAnimationStyle]);
          }

          int v25 = 0LL;
          if (v10) {
            goto LABEL_45;
          }
        }

        goto LABEL_18;
      }

      uint64_t v30 = sub_10003F124();
      __int128 v17 = [v30 autorelease];
      if (!os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_54;
      }
      *(_DWORD *)buf = 67109120;
      uint64_t v60 = v12 != 0;
      __int16 v18 = "SmartCover attach:%{BOOL}u";
      __int128 v19 = (os_log_s *)v17;
      __int16 v20 = 8;
    }

    else
    {
      __int128 v16 = sub_10003F124();
      __int128 v17 = [v16 autorelease];
      if (!os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_54;
      }
      *(_WORD *)buf = 0;
      __int16 v18 = "dropping smart cover event because we don't have any HES sensors";
      __int128 v19 = (os_log_s *)v17;
      __int16 v20 = 2;
    }

    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
    goto LABEL_54;
  }

  objc_super v15 = 0LL;
LABEL_56:

  return v15;
}

void sub_100055C3C(uint64_t a1, void *a2)
{
}

void sub_100055C50(uint64_t a1, void *a2)
{
}

void sub_100055C64(uint64_t a1, void *a2)
{
}

void sub_100055C78(uint64_t a1, void *a2)
{
}

void sub_100055C8C(void *a1, char a2)
{
  id v3 = a1;
  [v3 appendString:@"{"];
  if ((a2 & 1) != 0)
  {
    [v3 appendString:@"open"];
    id v8 = v3;
    if ((a2 & 4) == 0) {
      goto LABEL_8;
    }
    [v8 appendString:@","];
  }

  else
  {
    id v4 = v3;
    if ((a2 & 4) == 0)
    {
      uint64_t v5 = v4;

      id v6 = v5;
      if ((a2 & 8) == 0)
      {
        int v7 = 0;
        goto LABEL_12;
      }

      goto LABEL_10;
    }
  }

  [v3 appendString:@"flap1"];
LABEL_8:

  id v9 = v3;
  if ((a2 & 8) != 0)
  {
    [v9 appendString:@","];
LABEL_10:
    [v3 appendString:@"flap2"];
  }

  int v7 = 1;
LABEL_12:

  id v10 = v3;
  if ((a2 & 0x10) != 0)
  {
    if (v7) {
      [v10 appendString:@","];
    }
    [v10 appendString:@"flap3"];
  }

  [v10 appendString:@"}"];
}

NSMutableString *sub_100055DA0(char a1)
{
  NSMutableString *v2 = [[NSMutableString alloc] init];
  sub_100055C8C(v2, a1);
  return v2;
}

__CFString *sub_100055DD8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    unsigned int v2 = [BSDescriptionStream descriptionForRootObject:WeakRetained];
  }
  else {
    unsigned int v2 = @"<nil>";
  }

  return v2;
}

void sub_100055E6C(id a1)
{
  byte_1000DC1E8 = BSSystemHasCapability(@"hall-effect-sensor");
}

void sub_10005601C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

id sub_1000562B0(id result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    unsigned int v4 = a2;
    uint64_t v5 = (uint64_t)result;
    uint64_t v6 = BKLogTouchEvents(result, a2);
    int v7 = (os_log_s *)v6;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      id v10 = [*(id *)(v5 + 8) senderID];
      uint64_t v11 = (void *)[*(id *)(v5 + 8) displayUUID];
      int v12 = 134218498;
      id v13 = v10;
      __int16 v14 = 2114;
      objc_super v15 = v11;
      __int16 v16 = 2114;
      uint64_t v17 = a3;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "Cancel all touches %llX - display:%{public}@ causedByTouchStream:%{public}@",  (uint8_t *)&v12,  0x20u);
    }

    id v8 = sub_1000456D4(*(id **)(v5 + 112));
    id v9 = v8;
    sub_100056700(v5, v9, v4, a3);

    return sub_100056B6C(v5, a3);
  }

  return result;
}

void sub_1000563D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000563FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    uint64_t v6 = (id *)(a1 + 80);
    int v7 = (BKTouchAnnotationController *)*(id *)(a1 + 80);
    id v8 = v7;
    if ((a2 & 1) != 0 || (_DWORD)a3)
    {
      if (!v7)
      {
        id v13 = sub_10003F198();
        os_log_s *v14 = [v13 autorelease];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          id v15 = [*(id *)(a1 + 8) displayUUID];
          *(_DWORD *)buf = 138543362;
          BOOL v29 = v15;
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "annotations enabled for %{public}@",  buf,  0xCu);
        }

        BKTouchAnnotationController *v16 = [[BKTouchAnnotationController alloc] init];
        uint64_t v17 = (void *)[*(id *)(a1 + 8) displayUUID];
        id v8 = [BKTouchAnnotationController initWithDisplayUUID:v17];

        [*(id *)(a1 + 72) addObject:v8];
        objc_storeStrong(v6, v8);
      }

      [v8 setShouldVisualizeTouches:a2];
      BOOL v18 = [v8 shouldVisualizeHitTestRegions];
      [v8 setShouldVisualizeHitTestRegions:a3];
      if ((v18 & 1) == 0)
      {
        __int128 v25 = 0u;
        __int128 v26 = 0u;
        __int128 v23 = 0u;
        __int128 v24 = 0u;
        id v19 = *(id *)(a1 + 72);
        id v20 = [v19 countByEnumeratingWithState:v23 objects:v27 count:16];
        if (v20)
        {
          uint64_t v21 = *(void *)v24;
          do
          {
            __int16 v22 = 0LL;
            do
            {
              if (*(void *)v24 != v21) {
                objc_enumerationMutation(v19);
              }
              [v23 hitTestRegionsDidChange:v22 withHitTestContext:v23];
              __int16 v22 = (char *)v22 + 1;
            }

            while (v20 != v22);
            BOOL v20 = [v19 countByEnumeratingWithState:v23 objects:v27 count:16];
          }

          while (v20);
        }
      }
    }

    else if (v7)
    {
      id v9 = sub_10003F198();
      os_log_s *v10 = [v9 autorelease];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = (void *)[*(id *)(a1 + 8) displayUUID];
        *(_DWORD *)buf = 138543362;
        BOOL v29 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "annotations disabled for %{public}@",  buf,  0xCu);
      }

      int v12 = *(void **)(a1 + 80);
      *(void *)(a1 + 80) = 0LL;

      [*(id *)(a1 + 72) removeObject:v8];
      [v8 setShouldVisualizeTouches:NO];
      [v8 setShouldVisualizeHitTestRegions:NO];
    }
  }

void sub_1000566A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100056700(uint64_t a1, void *a2, unsigned int a3, uint64_t a4)
{
  id v7 = a2;
  id obj = v7;
  if (a3 == 2)
  {
    uint64_t v8 = [v7 bs_filter:&stru_1000B7760];

    id v7 = (id)v8;
    id obj = (id)v8;
  }

  id v9 = [v7 count:v7 obj:obj];
  if (v9)
  {
    uint64_t v11 = BKLogTouchEvents(v9, v10);
    int v12 = (os_log_s *)v11;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [BSDescriptionStream descriptionForRootObject:v38];
      uint64_t v14 = (uint64_t)*(off_1000B7A28 + a3);
      *(_DWORD *)buf = 138543874;
      id v59 = v13;
      __int16 v60 = 2114;
      uint64_t v61 = v14;
      __int16 v62 = 2114;
      uint64_t v63 = a4;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "canceling paths %{public}@ -- %{public}@ (ts:%{public}@)",  buf,  0x20u);
    }

    sub_1000570D8((id *)a1, v38, 1LL, 0);
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    objc_super v15 = *(void **)(a1 + 40);
    if (v15) {
      objc_super v15 = (void *)v15[3];
    }
    __int16 v16 = v15;
    id v17 = [v16 countByEnumeratingWithState:v51 objects:v57 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v52;
      do
      {
        id v19 = 0LL;
        do
        {
          if (*(void *)v52 != v18) {
            objc_enumerationMutation(v16);
          }
          uint64_t v20 = *(void *)(*((void *)&v51 + 1) + 8LL * (void)v19);
          if (a3 != 2)
          {
            if (v20) {
LABEL_21:
            }
              __int128 v23 = *(void **)(v20 + 48);
            else {
              __int128 v23 = 0LL;
            }
            id v24 = v23;
            sub_1000573E4((id *)a1, (uint64_t)v24);

            goto LABEL_23;
          }

          unsigned __int8 v21 = [*(id *)(*((void *)&v51 + 1) + 8 * (void)v19) isEqual:a4];
          if (v20) {
            char v22 = v21;
          }
          else {
            char v22 = 1;
          }
          if ((v22 & 1) == 0 && *(_BYTE *)(v20 + 9)) {
            goto LABEL_21;
          }
LABEL_23:
          id v19 = (char *)v19 + 1;
        }

        while (v17 != v19);
        id v25 = [v16 countByEnumeratingWithState:v51 objects:v57 count:16];
        id v17 = v25;
      }

      while (v25);
    }

    if (a3 != 2)
    {
      __int128 v49 = 0u;
      __int128 v50 = 0u;
      __int128 v47 = 0u;
      __int128 v48 = 0u;
      id obja = v38;
      id v26 = [obja countByEnumeratingWithState:v47 objects:v56 count:16];
      if (v26)
      {
        uint64_t v41 = *(void *)v48;
        do
        {
          id v42 = v26;
          for (uint64_t i = 0LL; i != v42; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v48 != v41) {
              objc_enumerationMutation(obja);
            }
            uint64_t v28 = *(void *)(*((void *)&v47 + 1) + 8LL * (void)i);
            uint64_t v29 = *(void *)(v28 + 32);
            BOOL v30 = v29 != 1 && v29 == 2;
            BOOL v31 = v29 == 1 || v29 == 2;
            *(void *)(v28 + 32) = 0LL;
            __int128 v43 = 0u;
            __int128 v44 = 0u;
            __int128 v45 = 0u;
            __int128 v46 = 0u;
            id v32 = *(id *)(a1 + 72);
            id v33 = [v32 countByEnumeratingWithState:v43 objects:v55 count:16];
            if (v33)
            {
              uint64_t v34 = *(void *)v44;
              do
              {
                for (j = 0LL; j != v33; j = (char *)j + 1)
                {
                  if (*(void *)v44 != v34) {
                    objc_enumerationMutation(v32);
                  }
                  id v36 = [v43 objectAtIndex:j];
                  uint64_t v37 = v36;
                  if (v30) {
                    [v36 touch:*(unsigned int *)(v28 + 16) pathIndex:*(void *)(v28 + 8) upAtPoint:CGPointMake(*(unsigned __int8 *)(v28 + 296), *(double *)(v28 + 224), *(double *)(v28 + 232)) detached:YES];
                  }
                  if (v31) {
                    [v37 touch:*(unsigned int *)(v28 + 16) pathIndex:*(void *)(v28 + 8) rangeOutAtPoint:CGPointMake(*(double *)(v28 + 224), *(double *)(v28 + 232))];
                  }
                }

                BOOL v33 = [v32 countByEnumeratingWithState:v43 objects:v55 count:16];
              }

              while (v33);
            }
          }

          id v26 = [obja countByEnumeratingWithState:v47 objects:v56 count:16];
        }

        while (v26);
      }

      sub_100057454(a1);
    }
  }
}

void sub_100056AE0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
}

id sub_100056B6C(uint64_t a1, uint64_t a2)
{
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id obj = *(id *)(a1 + 144);
  id v4 = [obj countByEnumeratingWithState:v21 objects:v25 count:16];
  id v6 = v4;
  if (v4)
  {
    uint64_t v7 = *(void *)v22;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(obj);
        }
        if (a2) {
          uint64_t v9 = *(unsigned __int8 *)(a2 + 8);
        }
        else {
          uint64_t v9 = 0LL;
        }
        uint64_t v10 = *(void *)(*((void *)&v21 + 1) + 8LL * (void)v8);
        uint64_t v11 = BKLogTouchEvents(v4, v5);
        int v12 = (os_log_s *)v11;
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          if (v10) {
            int v18 = *(_DWORD *)(v10 + 8);
          }
          else {
            int v18 = 0;
          }
          *(_DWORD *)buf = 67109120;
          int v27 = v18;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "SGP: Sending cancel to latent client: %x",  buf,  8u);
        }

        uint64_t v13 = mach_absolute_time();
        id v14 = (id)a1;
        DigitizerEvent = (const void *)IOHIDEventCreateDigitizerEvent( 0LL,  v13,  3LL,  0LL,  0LL,  130LL,  0LL,  0LL,  0.0,  0.0,  0.0,  0.0,  0.0,  0x4400000000LL);
        id v16 = *(id *)(a1 + 8);
        IOHIDEventSetSenderID(DigitizerEvent, [v16 senderID]);

        IOHIDEventSetIntegerValue(DigitizerEvent, 720921LL, *(unsigned __int8 *)(a1 + 206));
        IOHIDEventSetIntegerValue(DigitizerEvent, 4LL, *(unsigned __int8 *)(a1 + 207));

        BKSHIDEventDigitizerAttributes *v17 = [[BKSHIDEventDigitizerAttributes alloc] init];
        [v17 setTouchStreamIdentifier:v9];
        sub_100056E14((uint64_t)v14, (uint64_t)DigitizerEvent, v17, v10, *(double *)(a1 + 96));
        CFRelease(DigitizerEvent);

        uint64_t v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v4 = [obj countByEnumeratingWithState:v21 objects:v25 count:16];
      id v6 = v4;
    }

    while (v4);
  }

  return [*(id *)(a1 + 144) removeAllObjects];
}

void sub_100056DCC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
}

void sub_100056E14(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, double a5)
{
  uint64_t v10 = *(void **)(a1 + 40);
  if (v10) {
    uint64_t v10 = (void *)v10[2];
  }
  id v14 = v10;
  sub_100056F38((double *)a1, a3, v14);

  if (a4) {
    uint64_t v11 = *(unsigned int *)(a4 + 8);
  }
  else {
    uint64_t v11 = 0LL;
  }
  id v15 = [BKSHIDEventDeferringToken tokenForIdentifierOfCAContext:v11];
  [a3 setToken:];

  [a3 setInitialTouchTimestamp:a5];
  [a3 setActiveModifiers:*(void *)(a1 + 104)];
  BKSHIDEventSetAttributes(a2, a3);
  id v12 = sub_10001D0EC(*(void *)(a1 + 184));
  id v16 = [v12 autorelease];
  sub_100056FA8(a1, (uint64_t)v16);
  if (a4) {
    uint64_t v13 = *(unsigned int *)(a4 + 12);
  }
  else {
    uint64_t v13 = 0LL;
  }
  [*(id *)(a1 + 48) sendEvent:a2 toClientTaskPort:v13];
}

void sub_100056F1C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

double *sub_100056F38(double *result, void *a2, void *a3)
{
  if (result)
  {
    uint64_t v5 = result;
    double v6 = 0.0;
    if (!*((_BYTE *)v5 + 209)) {
      double v6 = v5[24];
    }
    [a2 setMaximumPositionZ:v6];
    LODWORD(v7) = *((_DWORD *)v5 + 50);
    return (double *)[a2 setMaximumForce:v7];
  }

  return result;
}

void sub_100056FA8(uint64_t a1, uint64_t a2)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100057004;
  v2[3] = &unk_1000B77F0;
  void v2[4] = a1;
  sub_10001ED74(a2, v2);
}

id sub_100057004(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  if (a4) {
    uint64_t v8 = *(unsigned int *)(a4 + 8);
  }
  else {
    uint64_t v8 = 0LL;
  }
  uint64_t v9 = [BKSHIDEventDeferringToken tokenForIdentifierOfCAContext:v8];
  [a3 setToken:v9];

  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void **)(v10 + 40);
  if (v11) {
    uint64_t v11 = (void *)v11[2];
  }
  id v12 = v11;
  sub_100056F38((double *)v10, a3, v12);

  BKSHIDEventSetAttributes(a2, a3);
  if (a4) {
    uint64_t v13 = *(unsigned int *)(a4 + 12);
  }
  else {
    uint64_t v13 = 0LL;
  }
  return [*(id *)(*(void *)(a1 + 32) + 48) sendEvent:a2 toClientTaskPort:v13];
}

void sub_1000570C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000570D8(id *a1, void *a2, uint64_t a3, char a4)
{
  uint64_t v7 = mach_absolute_time();
  BKHIDEventCollector *v8 = [[BKHIDEventCollector alloc] init];
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  id obj = a2;
  id v9 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v9)
  {
    uint64_t v24 = *(void *)v37;
    do
    {
      uint64_t v10 = 0LL;
      id v26 = v9;
      do
      {
        if (*(void *)v37 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v36 + 1) + 8 * v10);
        __int128 v32 = 0u;
        __int128 v33 = 0u;
        __int128 v34 = 0u;
        __int128 v35 = 0u;
        id v12 = *(id *)(v11 + 280);
        id v13 = [v12 countByEnumeratingWithState:v32 objects:v41 count:16];
        uint64_t v27 = v10;
        if (v13)
        {
          uint64_t v14 = *(void *)v33;
          do
          {
            id v15 = 0LL;
            do
            {
              if (*(void *)v33 != v14) {
                objc_enumerationMutation(v12);
              }
              uint64_t v16 = *(void *)(*((void *)&v32 + 1) + 8LL * (void)v15);
              if (v16) {
                uint64_t v17 = *(void *)(v16 + 32);
              }
              else {
                uint64_t v17 = 0LL;
              }
              if ((a3 & ~v17) == 0) {
                sub_100058854(a1, v11, (__IOHIDEvent *)v16, (uint64_t)v8, v7, 0LL);
              }
              id v15 = (char *)v15 + 1;
            }

            while (v13 != v15);
            id v18 = [v12 countByEnumeratingWithState:v32 objects:v41 count:16];
            id v13 = v18;
          }

          while (v18);
        }

        if ((a4 & 1) == 0) {
          *(void *)(v11 + 4_Block_object_dispose(va, 8) = 2LL;
        }
        __int128 v30 = 0u;
        __int128 v31 = 0u;
        __int128 v28 = 0u;
        __int128 v29 = 0u;
        id v19 = a1[9];
        id v20 = [v19 countByEnumeratingWithState:v28 objects:v40 count:16];
        if (v20)
        {
          uint64_t v21 = *(void *)v29;
          do
          {
            __int128 v22 = 0LL;
            do
            {
              if (*(void *)v29 != v21) {
                objc_enumerationMutation(v19);
              }
              [*(id *)(*((void *)&v28 + 1) + 8 * (void)v22) touchDidSoftCancel:*(unsigned int *)(v11 + 16)];
              __int128 v22 = (char *)v22 + 1;
            }

            while (v20 != v22);
            id v20 = [v19 countByEnumeratingWithState:v28 objects:v40 count:16];
          }

          while (v20);
        }

        uint64_t v10 = v27 + 1;
      }

      while ((id)(v27 + 1) != v26);
      id v9 = [obj countByEnumeratingWithState:v36 objects:v42 count:16];
    }

    while (v9);
  }

  sub_100057644((uint64_t)a1, obj, a3);
  sub_100057E60((uint64_t)a1, (uint64_t)v8);
}

void sub_10005738C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1000573E4(id *a1, uint64_t a2)
{
  BKHIDEventCollector *v4 = [[BKHIDEventCollector alloc] init];
  sub_100057CE8(a1, a2, (uint64_t)v4, 0LL);
  sub_100057E60((uint64_t)a1, (uint64_t)v4);
}

void sub_100057440( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

void sub_100057454(uint64_t a1)
{
  NSMutableArray *v2 = [[NSMutableArray alloc] init];
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v3 = [*(id *)(a1 + 112) copy];
  id v4 = [v3 countByEnumeratingWithState:v13 objects:v19 count:16];
  id v6 = v4;
  if (v4)
  {
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8LL * (void)v8);
        if (!*(void *)(v9 + 32))
        {
          uint64_t v10 = *(void *)(v9 + 8);
          uint64_t v11 = BKLogTouchEvents(v4, v5);
          id v12 = [v11 autorelease];
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 67109120;
            int v18 = v10;
            _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "stop tracking path:%d", buf, 8u);
          }

          sub_100063160(v9, 0LL);
          [v2 addObject:v9];
          sub_100045B8C(*(void *)(a1 + 112), v9);
        }

        uint64_t v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v4 = [v3 countByEnumeratingWithState:v13 objects:v19 count:16];
      id v6 = v4;
    }

    while (v4);
  }

  sub_100057644(a1, v2, 1LL);
  sub_100057814(a1);
}

void sub_10005760C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100057644(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = [*(id *)(a1 + 120) copy];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000579D4;
  v21[3] = &unk_1000B78B8;
  v21[5] = a2;
  v21[6] = a3;
  v21[4] = a1;
  BSIntegerMapEnumerateWithBlock(v6, v21);

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v7 = a2;
  id v8 = [v7 countByEnumeratingWithState:v17 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v18;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)v10);
        id v12 = *(void **)(v11 + 280);
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472LL;
        void v16[2] = sub_100057CC0;
        void v16[3] = &unk_1000B78D8;
        v16[4] = a3;
        __int128 v13 = [v12 bs_filter:v16];
        id v14 = [v13 mutableCopy];
        __int128 v15 = *(void **)(v11 + 280);
        *(void *)(v11 + 280) = v14;

        uint64_t v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v7 countByEnumeratingWithState:v17 objects:v22 count:16];
    }

    while (v8);
  }
}

void sub_1000577DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100057814(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 120) copy];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  _OWORD v3[2] = sub_100057890;
  v3[3] = &unk_1000B7818;
  void v3[4] = a1;
  BSIntegerMapEnumerateWithBlock(v2, v3);
}

void sub_100057880(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100057890(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_10005789C(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    if (a2)
    {
      uint64_t v4 = *(unsigned int *)(a2 + 8);
      if ([*(id *)(a2 + 24) count]) {
        return;
      }
    }

    else
    {
      uint64_t v4 = 0LL;
    }

    uint64_t v5 = (void *)[*(id *)(a1 + 128) objectForKey:v4];
    id v6 = [v5 count];

    if ((uint64_t)v6 <= 0)
    {
      uint64_t v9 = BKLogTouchEvents(v7, v8);
      uint64_t v10 = [v9 autorelease];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        int v11 = 138543362;
        uint64_t v12 = a2;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "removing destination: %{public}@",  (uint8_t *)&v11,  0xCu);
      }

      [*(id *)(a1 + 120) removeObjectForKey:v4];
      [*(id *)(a1 + 128) removeObjectForKey:v4];
    }
  }

void sub_1000579BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000579D4(uint64_t *a1, unsigned int a2, uint64_t a3)
{
  if (a3) {
    uint64_t v5 = *(void *)(a3 + 32);
  }
  else {
    uint64_t v5 = 0LL;
  }
  if ((a1[6] & ~v5) == 0)
  {
    uint64_t v6 = a2;
    __int128 v20 = [(id *)(a1[4] + 128) objectForKey:a2];
    if (v20)
    {
      uint64_t v7 = (void *)a1[5];
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      __int128 v24 = 0u;
      id v8 = v7;
      id v9 = [v8 countByEnumeratingWithState:v21 objects:v37 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v22;
        do
        {
          for (uint64_t i = 0LL; i != v9; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v22 != v10) {
              objc_enumerationMutation(v8);
            }
            uint64_t v12 = *(void *)(*(void *)(*((void *)&v21 + 1) + 8LL * (void)i) + 8LL);
            if (v12 >= 30)
            {
              NSString *v13 = [NSString stringWithFormat:@"pathIndex out of bounds: %d", *(void *)(*(void *)(*((void *)&v21 + 1) + 8LL * (void)i) + 8LL)];
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              {
                id v14 = NSStringFromSelector("removeContacts:");
                __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
                v17 = (objc_class *)v20;
                __int128 v18 = NSStringFromClass(v17);
                __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
                *(_DWORD *)buf = 138544642;
                id v26 = v15;
                __int16 v27 = 2114;
                __int128 v28 = v19;
                __int16 v29 = 2048;
                __int128 v30 = v20;
                __int16 v31 = 2114;
                __int128 v32 = @"BKTouchContactSet.m";
                __int16 v33 = 1024;
                int v34 = 112;
                __int16 v35 = 2114;
                __int128 v36 = v13;
                _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
              }

              _bs_set_crash_log_message([v13 UTF8String]);
              __break(0);
              JUMPOUT(0x100057C8CLL);
            }

            v20[v12 + 2] = 0LL;
          }

          id v9 = [v8 countByEnumeratingWithState:v21 objects:v37 count:16];
        }

        while (v9);
      }

      [v20[1] removeObjectsInArray:v8];
    }

    if (![v20 count]) {
      [*(id *)(a1[4] + 128) removeObjectForKey:v6];
    }
    sub_10005789C(a1[4], a3);
  }

void sub_100057C9C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

BOOL sub_100057CC0(uint64_t a1, uint64_t a2)
{
  if (a2) {
    uint64_t v2 = *(void *)(a2 + 32);
  }
  else {
    uint64_t v2 = 0LL;
  }
  return (*(void *)(a1 + 32) & ~v2) != 0;
}

void sub_100057CE8(id *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1)
  {
    uint64_t v8 = mach_absolute_time();
    if (a2) {
      uint64_t v9 = *(unsigned int *)(a2 + 8);
    }
    else {
      uint64_t v9 = 0LL;
    }
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    uint64_t v10 = [a1[16] objectForKey:v9];
    id v11 = [v10 countByEnumeratingWithState:v14 objects:v18 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v15;
      do
      {
        __int128 v13 = 0LL;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v10);
          }
          sub_100058854(a1, *(void *)(*((void *)&v14 + 1) + 8LL * (void)v13), (__IOHIDEvent *)a2, a3, v8, a4);
          __int128 v13 = (char *)v13 + 1;
        }

        while (v11 != v13);
        id v11 = [v10 countByEnumeratingWithState:v14 objects:v18 count:16];
      }

      while (v11);
    }

    [a1[16] removeObjectForKey:v9];
    sub_10005789C((uint64_t)a1, a2);
  }

void sub_100057E40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100057E60(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    _DWORD v5[2] = sub_100057F1C;
    v5[3] = &unk_1000B77F0;
    void v5[4] = a1;
    id v3 = v5;
    uint64_t v4 = v3;
    if (a2)
    {
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472LL;
      _DWORD v6[2] = sub_10001EC6C;
      v6[3] = &unk_1000B6090;
      void v6[4] = a2;
      uint64_t v7 = v3;
      sub_10001ED74(a2, v6);
    }
  }

void sub_100057F1C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    uint64_t v8 = *(void **)(v4 + 40);
    if (v8) {
      uint64_t v8 = (void *)v8[2];
    }
    __int16 v75 = v8;
    sub_100056F38((double *)v4, a3, v75);
    [a3 setActiveModifiers:*(void *)(v4 + 104)];
    BKSHIDEventSetAttributes(a2, a3);
    if (a4) {
      uint64_t v9 = *(unsigned int *)(a4 + 12);
    }
    else {
      uint64_t v9 = 0LL;
    }
    if ((~IOHIDEventGetIntegerValue(a2, 720903LL) & 0x20002) == 0
      && IOHIDEventGetIntegerValue(a2, 720905LL) == 1)
    {
      uint64_t ClientConnectionManager = BKHIDEventRoutingGetClientConnectionManager(1LL, v10);
      uint64_t v12 = [ClientConnectionManager autorelease];
      __int128 v13 = (void *)[v12 clientForTaskPort:v9];

      if (v13)
      {
        uint64_t v16 = BKLogTouchEvents(v14, v15);
        os_log_s *v17 = v16;
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          id v18 = [v13 bundleID];
          uint64_t v19 = NSStringFromBSVersionedPID([v13 versionedPID]);
          __int128 v20 = v19;
          *(_DWORD *)buf = 138543618;
          id v89 = v18;
          __int16 v90 = 2114;
          v91 = v20;
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "send tapToWake to %{public}@ pid:%{public}@",  buf,  0x16u);
        }
      }
    }

    id v21 = sub_10001D0EC(*(void *)(v4 + 184));
    int v76 = [v21 autorelease];
    sub_100056FA8(v4, (uint64_t)v76);
    uint64_t v24 = BKLogTouchEvents(v22, v23);
    os_log_s *v25 = v24;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      uint64_t ConciseDescription = BKSHIDEventGetConciseDescription(a2);
      __int128 v53 = (void *)ConciseDescription;
      *(_DWORD *)buf = 138543362;
      id v89 = v53;
      _os_log_debug_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
    }

    [*(id *)(v4 + 48) sendEvent:a2 toClientTaskPort:v9];
    if (a4) {
      unsigned int v27 = *(_DWORD *)(a4 + 8);
    }
    else {
      unsigned int v27 = 0;
    }
    uint64_t v28 = *(void *)(v4 + 184);
    if (v28)
    {
      if (IOHIDEventGetType(a2, v26) != 11)
      {
        NSString *v54 = [NSString stringWithFormat:@"must be a digitizer event"];
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          id v55 = NSStringFromSelector("_saveWillUpdateEvents:port:contextID:");
          id v56 = [v55 autorelease];
          uint64_t v58 = (objc_class *)v28;
          id v59 = NSStringFromClass(v58);
          __int16 v60 = [v59 autorelease];
          *(_DWORD *)buf = 138544642;
          id v89 = v56;
          __int16 v90 = 2114;
          v91 = v60;
          __int16 v92 = 2048;
          uint64_t v93 = v28;
          __int16 v94 = 2114;
          v95 = @"BKDirectTouchUpdateEvents.mm";
          __int16 v96 = 1024;
          int v97 = 271;
          __int16 v98 = 2114;
          v99 = v54;
          _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
        }

        _bs_set_crash_log_message([v54 UTF8String]);
        __break(0);
        JUMPOUT(0x10005851CLL);
      }

      uint64_t v29 = sub_10001D130(a2);
      int IntegerValue = IOHIDEventGetIntegerValue(a2, 720924LL);
      if (v29)
      {
        if (IntegerValue)
        {
          __int16 v31 = sub_10001CF04(v28, v29);
          p_isa = (id *)v31;
          if (!p_isa)
          {
            __int16 v33 = [[_BKEventUpdateGeneration alloc] init];
            p_isa = (id *)&v33->super.isa;
            if (v33) {
              v33->_generationCFIndex Count = v29;
            }
            int v34 = *(void **)(v28 + 8);
            if (!v34)
            {
              NSMutableArray *v35 = [[NSMutableArray alloc] init];
              __int128 v36 = *(void **)(v28 + 8);
              *(void *)(v28 + _Block_object_dispose(va, 8) = v35;

              int v34 = *(void **)(v28 + 8);
            }

            [v34 addObject:p_isa];
            if (!p_isa)
            {
              NSString *v61 = [NSString stringWithFormat:@"this is Unix, that can't happen"];
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              {
                __int16 v62 = NSStringFromSelector("_saveWillUpdateEvents:port:contextID:");
                id v63 = v62;
                v65 = [v28 class];
                __int128 v66 = NSStringFromClass(v65);
                __int128 v67 = [v66 autorelease];
                *(_DWORD *)buf = 138544642;
                id v89 = v63;
                __int16 v90 = 2114;
                v91 = v67;
                __int16 v92 = 2048;
                uint64_t v93 = v28;
                __int16 v94 = 2114;
                v95 = @"BKDirectTouchUpdateEvents.mm";
                __int16 v96 = 1024;
                int v97 = 281;
                __int16 v98 = 2114;
                v99 = v61;
                _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
              }

              _bs_set_crash_log_message([v61 UTF8String]);
              __break(0);
              JUMPOUT(0x100058618LL);
            }
          }

          id v37 = p_isa[17];
          __int128 v81 = 0u;
          __int128 v82 = 0u;
          __int128 v83 = 0u;
          __int128 v84 = 0u;
          id v38 = v37;
          id v39 = [v38 countByEnumeratingWithState:v81 objects:buf count:16];
          if (v39)
          {
            uint64_t v40 = *(void *)v82;
            do
            {
              uint64_t v41 = 0LL;
              do
              {
                if (*(void *)v82 != v40) {
                  objc_enumerationMutation(v38);
                }
                id v42 = *(_DWORD **)(*((void *)&v81 + 1) + 8LL * (void)v41);
                if (v42)
                {
                  if (v42[3] == (_DWORD)v9 && v42[2] == v27)
                  {
                    __int128 v45 = v42;

                    goto LABEL_44;
                  }
                }

                else if (!(v9 | v27))
                {
                  goto LABEL_40;
                }

                uint64_t v41 = (char *)v41 + 1;
              }

              while (v39 != v41);
              id v43 = [v38 countByEnumeratingWithState:v81 objects:buf count:16];
              id v39 = v43;
            }

            while (v43);
          }

LABEL_40:
          BKUpdateEventClient *v44 = [[BKUpdateEventClient alloc] init];
          __int128 v45 = v44;
          if (v44)
          {
            v44->super._contextID = v27;
            v44->super._clientPort = v9;
          }

          [v38 addObject:v44];
LABEL_44:
          sub_10001D26C((const __CFArray **)v85, a2);
          sub_10001D2B0((unint64_t)v85);
          unsigned int v46 = 0;
          __int128 v77 = *(_OWORD *)v85;
          __int128 v78 = v85[16];
          __int128 v79 = v86;
          uint64_t v80 = v87[0];
          while (*((void *)&v78 + 1))
          {
            uint64_t v47 = v79;
            *((void *)&v79 + 1) = *((void *)&v78 + 1);
            uint64_t v80 = v79;
            int v48 = [v78 integerValueForField:720924];
            int v49 = sub_10001CBE4((uint64_t)p_isa, v47);
            if (v48)
            {
              sub_10001CD74((uint64_t)p_isa, v49 | v48, v47);
              v46 |= 1LL << v47;
            }

            sub_10001D2B0((unint64_t)&v77);
          }

          if (v45)
          {
            v45->_pathIDMask = v46;
            if (!v45->_pathIDMask)
            {
              [v38 removeObjectIdenticalTo:v45];
              if (![v38 count])
              {
                id v50 = sub_10001D03C(v28, v29);
                uint64_t v51 = [v50 autorelease];
                if ((id *)v51 != p_isa)
                {
                  NSString *v68 = [NSString stringWithFormat:@"pending/removed items don't match: %@/%@", v51, p_isa];
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                  {
                    __int128 v69 = NSStringFromSelector("_saveWillUpdateEvents:port:contextID:");
                    id v70 = [v69 autorelease];
                    uint64_t v72 = (objc_class *)v28;
                    __int16 v73 = NSStringFromClass(v72);
                    double v74 = [v73 autorelease];
                    *(_DWORD *)v85 = 138544642;
                    *(void *)&v85[4] = v70;
                    *(_WORD *)&v85[12] = 2114;
                    *(void *)&v85[14] = v74;
                    *(_WORD *)&v85[22] = 2048;
                    *(void *)&v85[24] = v28;
                    LOWORD(v86) = 2114;
                    *(void *)((char *)&v86 + 2) = @"BKDirectTouchUpdateEvents.mm";
                    WORD5(v86) = 1024;
                    HIDWORD(v86) = 322;
                    LOWORD(v87[0]) = 2114;
                    *(void *)((char *)v87 + 2) = v68;
                    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v85,  0x3Au);
                  }

                  _bs_set_crash_log_message([v68 UTF8String]);
                  __break(0);
                  JUMPOUT(0x100058714LL);
                }
              }
            }
          }
        }
      }
    }
  }

void sub_10005872C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100058854(void *a1, uint64_t a2, __IOHIDEvent *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  DigitizerEvent = a3;
  if (a3) {
    unsigned int v32 = *((_DWORD *)a3 + 2);
  }
  else {
    unsigned int v32 = 0;
  }
  id v11 = a3;
  uint64_t v12 = v11;
  if (!a4)
  {

    id v20 = 0LL;
LABEL_20:
    uint64_t v22 = a1;
    DigitizerEvent = (__IOHIDEvent *)IOHIDEventCreateDigitizerEvent( 0LL,  a5,  3LL,  0LL,  0LL,  131LL,  0LL,  0LL,  0.0,  0.0,  0.0,  0.0,  0.0,  0x4400000000LL);
    id v23 = v22[1];
    IOHIDEventSetSenderID(DigitizerEvent, [v23 senderID]);

    IOHIDEventSetIntegerValue(DigitizerEvent, 720921LL, *((unsigned __int8 *)v22 + 206));
    IOHIDEventSetIntegerValue(DigitizerEvent, 4LL, *((unsigned __int8 *)v22 + 207));

    if (a6) {
      IOHIDEventSetIntegerValue(DigitizerEvent, 720923LL, a6);
    }
    BKSHIDEventDigitizerAttributes *v21 = [[BKSHIDEventDigitizerAttributes alloc] init];

    uint64_t v24 = [BKSHIDEventDeferringToken tokenForIdentifierOfCAContext:v32];
    [v21 setToken:v24];

    [v21 setInitialTouchTimestamp:*((double *)v22 + 12)];
    NSMutableArray *v25 = [[NSMutableArray alloc] init];
    [v21 setPathAttributes:v25];

    sub_10001EB28(a4, DigitizerEvent, v21, v12);
    CFRelease(DigitizerEvent);
    goto LABEL_23;
  }

  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id v13 = *(id *)(a4 + 16);
  id v14 = [v13 countByEnumeratingWithState:v34 objects:v38 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v35;
    do
    {
      uint64_t v16 = 0LL;
      do
      {
        if (*(void *)v35 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = *(void *)(*((void *)&v34 + 1) + 8LL * (void)v16);
        if (v17)
        {
          if (*(__IOHIDEvent **)(v17 + 24) == v12)
          {
            DigitizerEvent = *(__IOHIDEvent **)(v17 + 8);
            id v31 = *(id *)(v17 + 16);
            goto LABEL_18;
          }
        }

        else if (!DigitizerEvent)
        {
          id v31 = 0LL;
LABEL_18:
          id v14 = v31;
          char v19 = 1;
          goto LABEL_19;
        }

        uint64_t v16 = (char *)v16 + 1;
      }

      while (v14 != v16);
      id v18 = [v13 countByEnumeratingWithState:v34 objects:v38 count:16];
      id v14 = v18;
    }

    while (v18);
  }

  DigitizerEvent = 0LL;
  char v19 = 0;
LABEL_19:

  id v20 = v14;
  id v21 = v20;
  if ((v19 & 1) == 0) {
    goto LABEL_20;
  }
LABEL_23:
  uint64_t v26 = IOHIDEventCreateDigitizerEvent( 0LL,  a5,  *(unsigned int *)(a2 + 64),  *(unsigned int *)(a2 + 8),  0LL,  131LL,  0LL,  0LL,  0.0,  0.0,  0.0,  0.0,  0.0,  0x4400000000LL);
  unsigned int v27 = (const void *)v26;
  if (a6) {
    IOHIDEventSetIntegerValue(v26, 720923LL, a6);
  }
  BKSHIDEventDigitizerPathAttributes *v28 = [[BKSHIDEventDigitizerPathAttributes alloc] init];
  [v28 setPathIndex:*(void *)(a2 + 8)];
  [v28 setTouchIdentifier:*(unsigned int *)(a2 + 16)];
  [v28 setUserIdentifier:*(unsigned int *)(a2 + 20)];
  [v28 setHitTestContextCategory:*(void *)(a2 + 56)];
  [v28 setLocus:*(unsigned __int8 *)(a2 + 296)];
  IOHIDEventAppendEvent(DigitizerEvent, v27, 0LL, v29);
  __int128 v30 = (void *)[v21 pathAttributes];
  [v30 addObject:v28];

  CFRelease(v27);
}

void sub_100058C0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_100058C8C(id a1, BKTouchContact *a2)
{
  return a2->_presence == 2 && !a2->_touchDetached;
}

void sub_100058CB0(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) primaryUsagePage];
  id v3 = [*(id *)(*(void *)(a1 + 32) + 8) primaryUsage];
  uint64_t v4 = *(void **)(a1 + 40);
  if ((_DWORD)v2 == 13)
  {
    uint64_t v5 = ((_DWORD)v3 - 1);
    else {
      uint64_t v6 = [NSString stringWithFormat:@"(unknown digitizer usage: %X)" v3];
    }
    id v19 = (id)v6;
    [v4 appendString:v6 withName:0];
  }

  else
  {
    id v19 = [NSString stringWithFormat:@"(0x%X / 0x%X)", v2, v3];
    [v4 appendString:withName:];
  }

  id v20 = [*(id *)(*(void *)(a1 + 32) + 8) senderDescriptor];
  id v7 = [v20 hardwareType];

  uint64_t v8 = *(void **)(a1 + 40);
  uint64_t v9 = NSStringFromBKSHIDEventHardwareType(v7);
  id v21 = v9;
  [v8 appendString:v8 withName:v8];

  uint64_t v10 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v10 + 205))
  {
    [*(id *)(a1 + 40) appendString:@"preciseLocations" withName:0];
    uint64_t v10 = *(void *)(a1 + 32);
  }

  if (v7 == (id)2)
  {
    id v11 =  [*(id *)(a1 + 40) appendBool:[*(id *)(v10 + 8) isAuthenticated] withName:@"authenticated"];
    uint64_t v10 = *(void *)(a1 + 32);
  }

  uint64_t v12 = *(void **)(a1 + 40);
  id v22 = [*(id *)(v10 + 8) displayUUID];
  [v12 appendString:v13 withName:v14 skipIfEmpty:v15];

  id v13 =  [*(id *)(a1 + 40) appendUInt64:[*(id *)(*(void *)(a1 + 32) + 8) senderID] withName:@"senderID" format:1];
  id v14 =  [*(id *)(a1 + 40) appendObject:*(void *)(*(void *)(a1 + 32) + 112) withName:@"contacts"];
  uint64_t v15 = *(void **)(a1 + 40);
  id v23 = [*(id *)(*(void *)(a1 + 32) + 120) allValues];
  [v15 appendObject:v16 withName:];

  id v17 =  [*(id *)(a1 + 40) appendObject:*(void *)(*(void *)(a1 + 32) + 144) withName:@"latentSystemGestureDestinations"];
  id v24 = [*(id *)(*(void *)(a1 + 32) + 32) reasons];
  if ([v24 count]) {
    id v18 = [*(id *)(a1 + 40) appendObject:v24 withName:@"suppressTouchesAssertion"];
  }
}

void sub_100058F64( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
}

uint64_t sub_100058F90(uint64_t a1, void *a2)
{
  uint64_t v4 = BKLogTouchEvents(a1, a2);
  uint64_t v5 = [v4 autorelease];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    __int128 v35 = a2;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "synth and post:%{public}@", buf, 0xCu);
  }

  sub_100059314((uint64_t)buf, (void *)a1, 0LL);
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id v6 = a2;
  id v7 = [v6 countByEnumeratingWithState:v30 objects:v36 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v31;
    do
    {
      for (uint64_t i = 0LL; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(v6);
        }
        sub_10005C4F0(*(void *)(*((void *)&v30 + 1) + 8LL * (void)i), (uint64_t)buf, 4LL);
      }

      id v7 = [v6 countByEnumeratingWithState:&v30 objects:v36 count:16];
    }

    while (v7);
  }

  id v11 = (const void *)sub_10005948C(buf, v10);
  uint64_t v12 = sub_1000594E8(a1, (uint64_t)v11, *(void **)(a1 + 112));
  id v13 = v12;
  id v14 = sub_1000694C0( *(void *)(a1 + 24),  (uint64_t)v11,  v13,  *(void **)(a1 + 176),  *(void **)(a1 + 120),  *(void **)(a1 + 128));
  uint64_t v15 = v14;
  uint64_t v16 = v15;
  if (!v15)
  {
    objc_storeStrong((id *)(a1 + 112), v13);
LABEL_14:
    BKHIDEventCollector *v18 = [[BKHIDEventCollector alloc] init];
    *(void *)__int128 v36 = v18;
    id v19 = (id)a1;
    __int128 v37 = v19;
    char v29 = 0;
    id v20 = (void *)v19[5];
    if (v20) {
      id v20 = (void *)v20[3];
    }
    id v21 = v20;
    sub_1000619F0((uint64_t)v21, &v29, (unsigned __int8 *)&v30);

    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_10005A780;
    v25[3] = &unk_1000B7890;
    void v25[4] = v19;
    id v22 = v18;
    uint64_t v26 = v22;
    unsigned int v27 = v11;
    char v28 = v29;
    sub_100007D60((void *)v16, (uint64_t)v25);

    sub_10005A990((uint64_t *)v36);
    goto LABEL_19;
  }

  if (*(_BYTE *)(v15 + 8)) {
    *(void *)(a1 + 96) = *(void *)(v15 + 16);
  }
  objc_storeStrong((id *)(a1 + 112), v13);
  if ([*(id *)(v16 + 24) count]) {
    goto LABEL_14;
  }
  uint64_t v23 = BKLogTouchEvents(0LL, v17);
  id v22 = [v23 autorelease];
  if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)__int128 v36 = 0;
    _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)v22,  OS_LOG_TYPE_DEBUG,  "no events for regular clients",  v36,  2u);
  }

LABEL_19:
  if (v11) {
    CFRelease(v11);
  }
  return sub_10005A9E8((uint64_t)buf);
}

LABEL_20:
    uint64_t v26 = [CADisplay class];
    unsigned int v27 = v16;
    char v28 = v27;
    if (v26)
    {
      if ((objc_opt_isKindOfClass(v27, v26) & 1) != 0) {
        char v29 = v28;
      }
      else {
        char v29 = 0LL;
      }
    }

    else
    {
      char v29 = 0LL;
    }

    __int128 v30 = v29;

    __int128 v31 = [v30 immutableCopy];
    int v76 = v31;
    if (!v31)
    {
LABEL_62:

      goto LABEL_63;
    }

    __int128 v69 = v18;
    id v70 = v16;
    uint64_t v71 = v12;
    uint64_t v72 = v10;
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    NSMutableSet *v33 = [self->_lock_monitors copy];
    os_unfair_lock_unlock(p_lock);
    __int128 v81 = 0u;
    __int128 v82 = 0u;
    __int128 v79 = 0u;
    uint64_t v80 = 0u;
    id obj = v33;
    __int128 v77 = [obj countByEnumeratingWithState:&v79 objects:v94 count:16];
    if (!v77) {
      goto LABEL_61;
    }
    __int16 v75 = *(void *)v80;
    __int16 v73 = (void *)BKSDisplayUUIDMainKey;
LABEL_28:
    __int128 v34 = 0LL;
    while (1)
    {
      if (*(void *)v80 != v75) {
        objc_enumerationMutation(obj);
      }
      __int128 v35 = *(void *)(*((void *)&v79 + 1) + 8 * v34);
      __int128 v36 = v76;
      if (!v35) {
        goto LABEL_57;
      }
      os_unfair_lock_lock((os_unfair_lock_t)(v35 + 60));
      __int128 v37 = [*(id *)(v35 + 64) copy];
      os_unfair_lock_unlock((os_unfair_lock_t)(v35 + 60));
      __int128 v78 = v37;
      id v38 = [(id)v35 _filterDisplay:v36 usingPredicate:v37];
      os_unfair_lock_lock((os_unfair_lock_t)(v35 + 24));
      id v39 = v36;
      uint64_t v40 = [v39 displayId];
      uint64_t v41 = v40;
      id v42 = *(void **)(v35 + 48);
      id v43 = [NSNumber numberWithInteger:v40];
      __int128 v44 = [v42 objectForKey:v43];

      if (v38)
      {
        if (v44)
        {
          __int128 v45 = *(os_log_s **)(v35 + 16);
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)__int16 v96 = v40;
            *(_WORD *)&v96[4] = 2114;
            *(void *)&v96[6] = v44;
            _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "modified display %d -- %{public}@",  buf,  0x12u);
          }

          [*(id *)(v35 + 40) setObject:v39 forKey:v44];
          v90[0] = _NSConcreteStackBlock;
          v90[1] = 3221225472LL;
          v90[2] = sub_100060188;
          v90[3] = &unk_1000B7AD0;
          v90[4] = v35;
          unsigned int v46 = v39;
          v91 = v46;
          uint64_t v47 = objc_retainBlock(v90);
          int v48 = &v91;
        }

        else
        {
          __int128 v52 = [v39 uniqueId];
          __int128 v53 = [v52 length];
          __int128 v54 = v73;
          if (v53) {
            __int128 v54 = v52;
          }
          __int128 v44 = v54;

          id v55 = *(os_log_s **)(v35 + 16);
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)__int16 v96 = v40;
            *(_WORD *)&v96[4] = 2114;
            *(void *)&v96[6] = v44;
            _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_DEFAULT,  "adding display %d -- %{public}@",  buf,  0x12u);
          }

          v92[0] = _NSConcreteStackBlock;
          v92[1] = 3221225472LL;
          v92[2] = sub_10006017C;
          v92[3] = &unk_1000B7AD0;
          v92[4] = v35;
          unsigned int v46 = v39;
          uint64_t v93 = v46;
          uint64_t v47 = objc_retainBlock(v92);
          [*(id *)(v35 + 40) setObject:v46 forKey:v44];
          id v56 = *(void **)(v35 + 48);
          uint64_t v57 = [NSNumber numberWithInteger:v41];
          [v56 setObject:v44 forKey:v57];

          int v48 = &v93;
        }
      }

      else
      {
        int v49 = *(os_log_s **)(v35 + 16);
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)__int16 v96 = v40;
          *(_WORD *)&v96[4] = 2114;
          *(void *)&v96[6] = v44;
          _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_DEFAULT,  "removing display %d -- %{public}@",  buf,  0x12u);
        }

        unsigned int v46 = [*(id *)(v35 + 40) objectForKey:v44 v69, v70, v71, v72];

        if (!v46)
        {
          uint64_t v47 = 0LL;
          goto LABEL_47;
        }

        v88[0] = _NSConcreteStackBlock;
        v88[1] = 3221225472LL;
        v88[2] = sub_100060194;
        v88[3] = &unk_1000B7AD0;
        v88[4] = v35;
        id v89 = v39;
        uint64_t v47 = objc_retainBlock(v88);
        [*(id *)(v35 + 40) removeObjectForKey:v44];
        id v50 = *(void **)(v35 + 48);
        uint64_t v51 = [NSNumber numberWithInteger:v41];
        [v50 removeObjectForKey:v51];

        int v48 = &v89;
      }

LABEL_47:
      uint64_t v58 = [v35 context:v69:v70:v71:v72];
      id v59 = [v58 copy];

      os_unfair_lock_unlock((os_unfair_lock_t)(v35 + 24));
      if (v47)
      {
        __int128 v86 = 0u;
        v87 = 0u;
        __int128 v84 = 0u;
        v85 = 0u;
        __int16 v60 = v59;
        uint64_t v61 = [v60 countByEnumeratingWithState:v84 objects:buf count:16];
        if (v61)
        {
          __int16 v62 = v61;
          id v63 = *(void *)v85;
          do
          {
            for (uint64_t i = 0LL; i != v62; uint64_t i = (char *)i + 1)
            {
              if (*(void *)v85 != v63) {
                objc_enumerationMutation(v60);
              }
              ((void (*)(void *, void))v47[2])(v47, *(void *)(*((void *)&v84 + 1) + 8LL * (void)i));
            }

            __int16 v62 = [v60 countByEnumeratingWithState:v84 objects:buf count:16];
          }

          while (v62);
        }
      }

LABEL_57:
      if ((id)++v34 == v77)
      {
        __int128 v65 = [obj countByEnumeratingWithState:v79 objects:v94 count:16];
        __int128 v77 = v65;
        if (!v65)
        {
LABEL_61:

          uint64_t v12 = v71;
          __n128 v10 = v72;
          id v18 = v69;
          uint64_t v16 = v70;
          goto LABEL_62;
        }

        goto LABEL_28;
      }
    }
  }

  if (off_1000DB428 == a6) {
    goto LABEL_20;
  }
  if (off_1000DB448 == a6)
  {
    __int128 v66 = sub_10003F20C();
    os_log_s *v21 = v66;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      NSNumber *v67 = [NSNumber numberWithUnsignedInteger:[v18 pointScale]];
      __int128 v68 = (void *)[v18 uniqueId];
      *(_DWORD *)buf = 138543874;
      *(void *)__int16 v96 = v67;
      *(_WORD *)&v96[8] = 2114;
      *(void *)&v96[10] = v18;
      int v97 = 2114;
      __int16 v98 = v68;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "point scale changed to %{public}@ for display %{public}@ %{public}@",  buf,  0x20u);
    }

    goto LABEL_19;
  }

  v83.receiver = self;
  v83.super_class = [BKSharedCADisplayProvider class];
  [v83 observeValueForKeyPath:v10 ofObject:v16 change:v12 context:a6];
LABEL_63:
}

void sub_100059288( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  if (v17) {
    CFRelease(v17);
  }
  sub_10005A9E8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_100059314(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  *(_OWORD *)(a1 + 16) = xmmword_10008C410;
  *(_OWORD *)(a1 + 4_Block_object_dispose(va, 8) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 12_Block_object_dispose(va, 8) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_BYTE *)(a1 + 192) = 0;
  *(_OWORD *)(a1 + 32) = 0u;
  *(void *)a1 = 0LL;
  *(void *)(a1 + _Block_object_dispose(va, 8) = a1 + 32;
  *(void *)(a1 + 200) = 0LL;
  uint64_t v6 = mach_absolute_time();
  *(void *)(a1 + 200) = v6;
  id v7 = (id *)v5;
  uint64_t DigitizerEvent = IOHIDEventCreateDigitizerEvent( 0LL,  v6,  3LL,  0LL,  0LL,  a3,  0LL,  0LL,  0.0,  0.0,  0.0,  0.0,  0.0,  0x4400000000LL);
  id v9 = v7[1];
  IOHIDEventSetSenderID(DigitizerEvent, [v9 senderID]);

  IOHIDEventSetIntegerValue(DigitizerEvent, 720921LL, *((unsigned __int8 *)v7 + 206));
  IOHIDEventSetIntegerValue(DigitizerEvent, 4LL, *((unsigned __int8 *)v7 + 207));

  if (*(void *)a1) {
    CFRelease(*(CFTypeRef *)a1);
  }
  *(void *)a1 = DigitizerEvent;

  return a1;
}

void sub_100059444(_Unwind_Exception *a1)
{
  if (*(_BYTE *)(v2 + 192))
  {
    free(*(void **)(v2 + 8));
    *(_BYTE *)(v2 + 192) = 0;
  }

  if (*(void *)v2) {
    CFRelease(*(CFTypeRef *)v2);
  }

  _Unwind_Resume(a1);
}

uint64_t sub_10005948C(void *a1, __n128 a2)
{
  uint64_t v3 = a1[2];
  if (v3)
  {
    uint64_t v4 = (uint64_t *)a1[1];
    uint64_t v5 = 8 * v3;
    do
    {
      uint64_t v6 = *v4++;
      IOHIDEventAppendEvent(*a1, v6, 0LL, a2);
      v5 -= 8LL;
    }

    while (v5);
  }

  sub_10005AA58((uint64_t)a1);
  uint64_t result = *a1;
  *a1 = 0LL;
  return result;
}

id *sub_1000594E8(uint64_t a1, uint64_t a2, void *a3)
{
  v166 = (id *)[a3 copy];
  [*(id *)(a1 + 136) removeAllObjects];
  uint64_t v5 = sub_10001D26C((const __CFArray **)v222, a2);
  unint64_t v6 = sub_10001D2B0((unint64_t)v5);
  __int128 v202 = *(_OWORD *)v222;
  __int128 v203 = v223;
  __int128 v204 = v224;
  uint64_t v205 = v225;
  for (uint64_t i = *((void *)&v223 + 1); *((void *)&v203 + 1); uint64_t i = *((void *)&v203 + 1))
  {
    *((void *)&v204 + 1) = i;
    uint64_t v205 = v204;
    uint64_t v8 = sub_1000456F0(*(id **)(a1 + 112), v204);
    uint64_t v9 = [v8 autorelease];
    __n128 v10 = (void *)v9;
    if (v9)
    {
      uint64_t v11 = *(unsigned int *)(v9 + 20);
      if ((_DWORD)v11)
      {
        double FloatValue = IOHIDEventGetFloatValue(i, 720896LL);
        double v13 = IOHIDEventGetFloatValue(i, 720897LL);
        id v14 = [*(id *)(a1 + 136) objectForKey:v11];
        if (v14
          || (id v14 = objc_alloc_init(&OBJC_CLASS___BKTouchCentroidCalculator),
              [*(id *)(a1 + 136) setObject:v14 forKey:v11],
              v14))
        {
          CGFloat v15 = v13 + v14->_location.y;
          v14->_location.double x = FloatValue + v14->_location.x;
          v14->_location.double y = v15;
          ++v14->_count;
        }
      }
    }

    unint64_t v6 = [v202 sub_10001D2B0];
  }

  int HasHighFrequencyDigitizer = BKSHIDServicesDeviceHasHighFrequencyDigitizer(v6);
  uint64_t v16 = sub_10001D26C((const __CFArray **)v222, a2);
  unint64_t v17 = sub_10001D2B0((unint64_t)v16);
  __int128 v202 = *(_OWORD *)v222;
  __int128 v203 = v223;
  __int128 v204 = v224;
  *((void *)&v19 + 1) = *((void *)&v224 + 1);
  uint64_t v205 = v225;
  *(void *)&__int128 v19 = 138543874LL;
  __int128 v161 = v19;
  while (1)
  {
    uint64_t v20 = *((void *)&v203 + 1);
    if (!*((void *)&v203 + 1)) {
      break;
    }
    uint64_t v21 = v204;
    *((void *)&v204 + 1) = *((void *)&v203 + 1);
    uint64_t v205 = v204;
    uint64_t IntegerValue = [v203 integerValueForHIDUsage:720925];
    if ((_DWORD)IntegerValue)
    {
      uint64_t v24 = BKLogTouchEvents(IntegerValue, v23);
      id v25 = (BKTouchContact *)v24;
      if (!os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_ERROR)) {
        goto LABEL_105;
      }
      *(_WORD *)buf = 0;
      uint64_t v26 = (os_log_s *)v25;
      unsigned int v27 = "ignoring subevent with nonzero didUpdateMask (on parent event with zero didUpdateMask)";
      uint32_t v28 = 2;
      goto LABEL_14;
    }

    uint64_t v169 = IOHIDEventGetIntegerValue(v20, 720903LL);
    uint64_t v29 = IOHIDEventGetIntegerValue(v20, 720904LL);
    unsigned int v167 = v169 & 0x20000;
    if (v29) {
      BOOL v30 = (v169 & 0x20000) == 0;
    }
    else {
      BOOL v30 = 0;
    }
    int v31 = v30;
    uint64_t v165 = IOHIDEventGetIntegerValue(v20, 720905LL);
    unsigned int v168 = (v165 != 0) & (v169 >> 1);
    int v163 = v31;
    int v164 = v169 & v31;
    if ((v169 & v31 & 1) != 0
      || (!v167 ? (BOOL v32 = v29 == 0) : (BOOL v32 = 1), v32 ? (v33 = 0) : (v33 = 1), v168 && (v33 & 1) == 0))
    {
      __int128 v34 = sub_1000456F0(v166, v21);
      uint64_t v35 = [v34 autorelease];
      uint64_t v37 = v35;
      if (v35)
      {
        uint64_t v38 = *(void *)(v35 + 32);
        if (v38 == 2 && v165)
        {
          uint64_t v39 = BKLogTouchEvents(v35, v36);
          uint64_t v40 = [v39 autorelease];
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            *(void *)&uint8_t buf[4] = v37;
            _os_log_error_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_ERROR,  "range-in for pathIndex with existing contact -- using existing: %{public}@",  buf,  0xCu);
          }

          id v25 = (BKTouchContact *)(id)v37;
LABEL_56:

          uint64_t v44 = v169;
          if (v168)
          {
LABEL_57:
            v25->_tapToWake = v167 >> 17;
            if (v167)
            {
              uint64_t v61 = BKLogTouchEvents(v42, v43);
              os_log_s *v62 = [v61 autorelease];
              if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "received tapToWake", buf, 2u);
              }
            }
          }

LABEL_62:
          if (v25->_userIdentifier)
          {
            uint64_t v65 = [*(id *)(a1 + 136) objectForKey:];
            __int128 v67 = (void *)v65;
            if (v65)
            {
              uint64_t v68 = *(void *)(v65 + 8);
              if (v68 < 1)
              {
                double x = CGPointZero.x;
                double y = CGPointZero.y;
              }

              else
              {
                double x = *(double *)(v65 + 16) / (double)v68;
                double y = *(double *)(v65 + 24) / (double)v68;
              }

              uint64_t v71 = BKLogTouchEvents(v65, v66);
              os_log_s *v72 = v71;
              if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v156 = BSStringFromCGPoint(x, y);
                v157 = v156;
                *(_DWORD *)buf = 138543362;
                *(void *)&uint8_t buf[4] = v157;
                _os_log_debug_impl( (void *)&_mh_execute_header,  v72,  OS_LOG_TYPE_DEBUG,  "using centroid %{public}@",  buf,  0xCu);
              }
            }

            else
            {
              double x = IOHIDEventGetFloatValue(v20, 720896LL);
              double y = IOHIDEventGetFloatValue(v20, 720897LL);
            }
          }

          else
          {
            double x = IOHIDEventGetFloatValue(v20, 720896LL);
            double y = IOHIDEventGetFloatValue(v20, 720897LL);
          }

          IOHIDEventGetPhase(v20);
          v25->_eventPhaseBits = v73;
          sub_10005C38C((uint64_t)buf, a1, x, y, v25->_offset.x, v25->_offset.y);
          __int128 v74 = v218;
          v25->_denormalizedLocation.locationsAreValid = *(_OWORD *)buf;
          v25->_denormalizedLocation.location.double y = v74;
          v25->_denormalizedLocation.hitTestLocation.double y = v219;
          v25->_denormalizedLocation.preciseLocation.double y = v220;
          v25->_normalLocation.double x = x;
          v25->_normalLocation.double y = y;
          v25->_positionZ = IOHIDEventGetFloatValue(v20, 720898LL);
          int64_t presence = v25->_presence;
          v25->_previousPresence = presence;
          if (v168)
          {
            if (presence != 1)
            {
              __int128 v196 = 0u;
              __int128 v197 = 0u;
              __int128 v194 = 0u;
              __int128 v195 = 0u;
              id v78 = *(id *)(a1 + 72);
              id v79 = [v78 countByEnumeratingWithState:v194 objects:v216 count:16];
              if (v79)
              {
                uint64_t v80 = *(void *)v195;
                double v81 = v218.doubleValue;
                double v82 = v219;
                uint64_t v83 = v205;
                do
                {
                  for (j = 0LL; j != v79; j = (char *)j + 1)
                  {
                    if (*(void *)v195 != v80) {
                      objc_enumerationMutation(v78);
                    }
                    double v85 = 0.0;
                    if (!*(_BYTE *)(a1 + 209)) {
                      double v85 = *(double *)(a1 + 192);
                    }
                    [v194 touch:v25->_touchIdentifier pathIndex:v83 rangeInAtPoint:v44 eventMask:v25->_transducerType z:v81 maxZ:v82 transducerType:v25->_positionZ];
                  }

                  id v79 = [v78 countByEnumeratingWithState:v194 objects:v216 count:16];
                }

                while (v79);
              }
            }

            v25->_int64_t presence = 2LL;
            hitTestInformationAtDown = v25->_hitTestInformationAtDown;
            v25->_hitTestInformationAtDown = 0LL;

            hitTestSecurityAnalysis = v25->_hitTestSecurityAnalysis;
            v25->_hitTestSecurityAnalysis = 0LL;

            v25->_transferred = 0;
            __int128 v190 = 0u;
            __int128 v191 = 0u;
            __int128 v192 = 0u;
            __int128 v193 = 0u;
            id v88 = *(id *)(a1 + 72);
            id v89 = [v88 countByEnumeratingWithState:v190 objects:v215 count:16];
            if (v89)
            {
              uint64_t v90 = *(void *)v191;
              double v91 = v218.doubleValue;
              double v92 = v219;
              uint64_t v93 = v205;
              do
              {
                for (k = 0LL; k != v89; k = (char *)k + 1)
                {
                  if (*(void *)v191 != v90) {
                    objc_enumerationMutation(v88);
                  }
                  [v25 touch:v93 pathIndex:v93 downAtPoint:CGPointMake(v44, v161) eventMask:v91 transducerType:v92];
                }

                id v89 = [v88 countByEnumeratingWithState:v190 objects:v215 count:16];
              }

              while (v89);
            }

            goto LABEL_92;
          }

          if (v164)
          {
            if (!presence)
            {
              v25->_int64_t presence = 1LL;
              __int128 v186 = 0u;
              __int128 v187 = 0u;
              __int128 v188 = 0u;
              __int128 v189 = 0u;
              id v88 = *(id *)(a1 + 72);
              id v111 = [v88 countByEnumeratingWithState:v186 objects:v214 count:16];
              if (v111)
              {
                uint64_t v112 = *(void *)v187;
                double v113 = v218.doubleValue;
                double v114 = v219;
                uint64_t v115 = v205;
                do
                {
                  for (m = 0LL; m != v111; m = (char *)m + 1)
                  {
                    if (*(void *)v187 != v112) {
                      objc_enumerationMutation(v88);
                    }
                    double v117 = 0.0;
                    if (!*(_BYTE *)(a1 + 209)) {
                      double v117 = *(double *)(a1 + 192);
                    }
                    [v186 touch:v25->_touchIdentifier pathIndex:v115 rangeInAtPoint:v44 eventMask:v25->_transducerType z:v113 maxZ:v114 transducerType:v25->_positionZ];
                  }

                  id v111 = [v88 countByEnumeratingWithState:v186 objects:v214 count:16];
                }

                while (v111);
              }

LABEL_92:
LABEL_93:
              uint64_t v97 = BKLogTouchEvents(v95, v96);
              os_log_s *v98 = v97;
              if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
              {
                unint64_t v99 = v25->_presence;
                v100 = @"<unknown>";
                if (v99 <= 2) {
                  v100 = *(off_1000B7C40 + v99);
                }
                int v101 = v205;
                v102 = v100;
                *(_DWORD *)v207 = 67109378;
                *(_DWORD *)v208 = v101;
                *(_WORD *)&v208[4] = 2114;
                *(void *)&v208[6] = v102;
                _os_log_impl( (void *)&_mh_execute_header,  v98,  OS_LOG_TYPE_DEFAULT,  "contact %d presence: %{public}@",  v207,  0x12u);
              }

LABEL_97:
            }

LABEL_98:
            if (HasHighFrequencyDigitizer)
            {
              uint64_t TimeStamp = IOHIDEventGetTimeStamp(v20);
              double v104 = BSMonotonicReferencedTimeFromMachTime(TimeStamp);
              double v105 = IOHIDEventGetFloatValue(v20, 720913LL);
              double previousTimestamp = v25->_zGradient.previousTimestamp;
              if (previousTimestamp != 0.0)
              {
                double v107 = v104 - previousTimestamp;
                if (v107 >= 0.1) {
                  double v108 = v107;
                }
                else {
                  double v108 = 1.0;
                }
                double v109 = IOHIDEventGetFloatValue(v20, 720916LL);
                float v110 = (v105 - v25->_zGradient.previousQuality)
                     / v108
                     / sqrt(v109 * IOHIDEventGetFloatValue(v20, 720917LL) * 0.0002);
                v25->_zGradient.zGradient = v110;
              }

              v25->_zGradient.double previousTimestamp = v104;
              v25->_zGradient.previousQualitdouble y = v105;
            }

            goto LABEL_105;
          }

          if ((v169 & 2) == 0 || v165)
          {
            if ((v169 & 1) != 0) {
              char v127 = v163;
            }
            else {
              char v127 = 1;
            }
            if ((v127 & 1) != 0)
            {
              if (v165) {
                int v128 = 1;
              }
              else {
                int v128 = v163;
              }
              if (v128 == 1)
              {
                __int128 v172 = 0u;
                __int128 v173 = 0u;
                __int128 v170 = 0u;
                __int128 v171 = 0u;
                __int16 v98 = (os_log_s *)*(id *)(a1 + 72);
                id v129 = [os_log_s countByEnumeratingWithState:v170 objects:v206 count:16];
                if (v129)
                {
                  uint64_t v130 = *(void *)v171;
                  double v131 = v218.doubleValue;
                  double v132 = v219;
                  do
                  {
                    for (n = 0LL; n != v129; n = (char *)n + 1)
                    {
                      if (*(void *)v171 != v130) {
                        objc_enumerationMutation(v98);
                      }
                      double v134 = 0.0;
                      if (!*(_BYTE *)(a1 + 209)) {
                        double v134 = *(double *)(a1 + 192);
                      }
                      [v25->_touchIdentifier touch:v44 didMoveToPoint:v131 eventMask:v132 z:v134 maxZ:v161];
                    }

                    [v98 countByEnumeratingWithState:v170 objects:v206 count:16];
                  }

                  while (v129);
                }

                goto LABEL_97;
              }

              goto LABEL_98;
            }

            if (presence != 1)
            {
              uint64_t v152 = BKLogTouchEvents(v75, v76);
              os_log_s *v98 = [v152 autorelease];
              if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
              {
                unint64_t v153 = v25->_presence;
                v154 = @"<unknown>";
                if (v153 <= 2) {
                  v154 = *(off_1000B7C40 + v153);
                }
                uint64_t v155 = v154;
                *(_DWORD *)v207 = v161;
                *(void *)v208 = v155;
                *(_WORD *)&v208[8] = 1024;
                *(_DWORD *)&v208[10] = v165 != 0;
                __int16 v209 = 1024;
                int v210 = 0;
                _os_log_error_impl( (void *)&_mh_execute_header,  v98,  OS_LOG_TYPE_ERROR,  "unexpected range-out (presence:%{public}@ event.touch:%{BOOL}u) event.range:%{BOOL}u",  v207,  0x18u);
              }

              goto LABEL_97;
            }

            v25->_int64_t presence = 0LL;
            __int128 v174 = 0u;
            __int128 v175 = 0u;
            __int128 v176 = 0u;
            __int128 v177 = 0u;
            id v135 = *(id *)(a1 + 72);
            BOOL v144 = [v135 countByEnumeratingWithState:v174 objects:v211 count:16];
            if (v144)
            {
              uint64_t v145 = *(void *)v175;
              double v146 = v218.doubleValue;
              double v147 = v219;
              uint64_t v148 = v205;
              do
              {
                for (iuint64_t i = 0LL; ii != v144; iuint64_t i = (char *)ii + 1)
                {
                  if (*(void *)v175 != v145) {
                    objc_enumerationMutation(v135);
                  }
                  id v150 = *(id *)(*((void *)&v174 + 1) + 8LL * (void)ii);
                  [v150 touch:v25->_touchIdentifier pathIndex:v148 rangeOutAtPoint:CGPointMake(v146, v147)];
                }

                BOOL v144 = [v135 countByEnumeratingWithState:v174 objects:v211 count:16];
              }

              while (v144);
            }
          }

          else
          {
            if ((v163 & 1) != 0)
            {
              v25->_int64_t presence = 1LL;
              __int128 v178 = 0u;
              __int128 v179 = 0u;
              __int128 v180 = 0u;
              __int128 v181 = 0u;
              id v118 = *(id *)(a1 + 72);
              id v119 = [v118 countByEnumeratingWithState:v178 objects:v212 count:16];
              if (v119)
              {
                uint64_t v120 = *(void *)v179;
                double v121 = v218.doubleValue;
                double v122 = v219;
                uint64_t v123 = v205;
                do
                {
                  for (jj = 0LL; jj != v119; jj = (char *)jj + 1)
                  {
                    if (*(void *)v179 != v120) {
                      objc_enumerationMutation(v118);
                    }
                    id v125 = *(id *)(*((void *)&v178 + 1) + 8LL * (void)jj);
                    [v125 touch:v25->_touchIdentifier pathIndex:v123 upAtPoint:CGPointMake(v121, v122) detached:v25->_touchDetached];
                  }

                  id v119 = [v118 countByEnumeratingWithState:&v178 objects:v212 count:16];
                }

                while (v119);
              }

              hitTestPolicdouble y = v25->_hitTestPolicy;
              if (hitTestPolicy == 2)
              {
                v25->_hitTestPolicdouble y = 3LL;
              }

              else if (hitTestPolicy == 4)
              {
                v25->_hitTestPolicdouble y = 0LL;
              }

              goto LABEL_93;
            }

            v25->_int64_t presence = 0LL;
            __int128 v182 = 0u;
            __int128 v183 = 0u;
            __int128 v184 = 0u;
            __int128 v185 = 0u;
            id v135 = *(id *)(a1 + 72);
            id v136 = [v135 countByEnumeratingWithState:&v182 objects:v213 count:16];
            if (v136)
            {
              uint64_t v137 = *(void *)v183;
              double v138 = v218.1;
              double v139 = v219;
              uint64_t v140 = v205;
              do
              {
                for (kk = 0LL; kk != v136; kk = (char *)kk + 1)
                {
                  if (*(void *)v183 != v137) {
                    objc_enumerationMutation(v135);
                  }
                  id v142 = [v182 objectAtIndex:kk];
                  v143 = v142;
                  if (presence == 2) {
                    [v142 touch:v25->_touchIdentifier pathIndex:v140 upAtPoint:v25->_touchDetached detached:v138 v139];
                  }
                  [v143 touch:v25->_touchIdentifier pathIndex:v140 rangeOutAtPoint:CGPointMake(v138, v139) atPoint:v161];
                }

                id v136 = [v135 countByEnumeratingWithState:v182 objects:v213 count:16];
              }

              while (v136);
            }
          }

          goto LABEL_93;
        }

        uint64_t v47 = BKLogTouchEvents(v35, v36);
        int v48 = (os_log_s *)v47;
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v37;
          _os_log_error_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_ERROR,  "range-in for pathIndex with existing contact -- replacing: %{public}@",  buf,  0xCu);
        }

        sub_100045B8C((uint64_t)v166, v37);
        uint64_t v49 = *(void *)(v37 + 8);
        uint64_t v52 = BKLogTouchEvents(v50, v51);
        os_log_s *v53 = [os_log_s class];
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v49;
          _os_log_debug_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEBUG, "stop tracking path:%d", buf, 8u);
        }

        sub_100063160(v37, 0LL);
        sub_100045B8C(*(void *)(a1 + 112), v37);
        *(void *)buf = v37;
        __int128 v54 = (void *)[NSArray arrayWithObjects:buf count:1];
        sub_100057644(a1, v54, 1LL);

        sub_100057814(a1);
        __int128 v198 = 0u;
        __int128 v199 = 0u;
        __int128 v200 = 0u;
        __int128 v201 = 0u;
        id v55 = *(id *)(a1 + 72);
        id v56 = [v55 countByEnumeratingWithState:v198 objects:v221 count:16];
        if (v56)
        {
          uint64_t v57 = *(void *)v199;
          do
          {
            for (mm = 0LL; mm != v56; mm = (char *)mm + 1)
            {
              if (*(void *)v199 != v57) {
                objc_enumerationMutation(v55);
              }
              id v59 = [v198 objectAtIndex:mm];
              __int16 v60 = v59;
              if (v38 == 2) {
                [v59 touch:v21 pathIndex:*(unsigned int *)(v37 + 16) upAtPoint:CGPointMake(*(unsigned __int8 *)(v37 + 296), 0.0) detached:0.0];
              }
              [v60 touch:*(unsigned int *)(v37 + 16) pathIndex:v21 rangeOutAtPoint:CGPointMake(0.0, 0.0) atTime:v161];
            }

            id v56 = [v55 countByEnumeratingWithState:v198 objects:v221 count:16];
          }

          while (v56);
        }
      }

      id v25 = sub_10005C264(v21, v20);
      sub_100045A40((uint64_t)v166, (uint64_t)v25);
      goto LABEL_56;
    }

    if (v168)
    {
      uint64_t v41 = sub_1000456F0(v166, v21);
      uint64_t v42 = [v41 autorelease];
      id v25 = (BKTouchContact *)v42;
      uint64_t v44 = v169;
      if (!v42)
      {
        uint64_t v45 = BKLogTouchEvents(0LL, v43);
        os_log_s *v46 = [v45 autorelease];
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v21;
          _os_log_error_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_ERROR,  "touch down without previous range event: %d",  buf,  8u);
        }

        uint64_t v44 = v169 | 1;
        IOHIDEventSetIntegerValue(v20, 720903LL, v44);
        id v25 = sub_10005C264(v21, v20);
        sub_100045A40((uint64_t)v166, (uint64_t)v25);
      }

      goto LABEL_57;
    }

    id v63 = sub_1000456F0(v166, v21);
    BKTouchContact *v25 = [v63 autorelease];
    uint64_t v44 = v169;
    if (v25) {
      goto LABEL_62;
    }
    uint64_t v151 = BKLogTouchEvents(0LL, v64);
    BKTouchContact *v25 = [v151 autorelease];
    if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v21;
      uint64_t v26 = (os_log_s *)v25;
      unsigned int v27 = "didn't see a previous touch down or range-in event for pathIndex:%d; skipping event";
      uint32_t v28 = 8;
LABEL_14:
      _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, v27, buf, v28);
    }

LABEL_105:
    unint64_t v17 = [v202 sub_10001D2B0];
  }

  uint64_t v158 = BKLogTouchEvents(v17, v18);
  v159 = [os_log logWithName:v158];
  if (os_log_type_enabled(v159, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v222 = 138543362;
    *(void *)&v222[4] = v166;
    _os_log_debug_impl((void *)&_mh_execute_header, v159, OS_LOG_TYPE_DEBUG, "contacts now %{public}@", v222, 0xCu);
  }

  return v166;
}

void sub_10005A5A0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_10005A780(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a2) {
    uint64_t v7 = *(unsigned int *)(a2 + 8);
  }
  else {
    uint64_t v7 = 0LL;
  }
  id v8 = [*(id *)(*(void *)(a1 + 32) + 56) shouldCancelTouchesDeliveredToContextId:v7 withInitialTouchTimestamp:*(double *)(*(void *)(a1 + 32) + 96)];
  if ((_DWORD)v8)
  {
    __n128 v10 = (void *)[*(id *)(*(void *)(a1 + 32) + 128) objectForKey:v7];
    if ((uint64_t)[v10 count] >= 1)
    {
      uint64_t v11 = BKLogTouchDeliveryPolicy();
      uint64_t v12 = v11;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        int v19 = 67109120;
        int v20 = v7;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "(Synth) TDPS said this context should cancel: %X",  (uint8_t *)&v19,  8u);
      }

      id v14 = *(id **)(a1 + 32);
      uint64_t v13 = *(void *)(a1 + 40);
      uint64_t IntegerValue = IOHIDEventGetIntegerValue(*(void *)(a1 + 48), 720923LL);
      sub_100057CE8(v14, a2, v13, IntegerValue);
    }
  }

  else if (a2)
  {
    int v16 = *(unsigned __int8 *)(a1 + 56);
    sub_10005AACC( *(void **)(a1 + 32),  *(void *)(a1 + 48),  a2,  *(void *)(a1 + 40),  v16 == 1,  a4,  *(double *)(*(void *)(a1 + 32) + 96LL));
    if (v16 == 1) {
      sub_10005B9C4(*(void *)(a1 + 32), a2);
    }
  }

  else
  {
    uint64_t v17 = BKLogTouchEvents(v8, v9);
    uint64_t v18 = [v17];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v19 = 67109120;
      int v20 = v7;
      _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "(Synth) Missing destination for hit tested context: %X",  (uint8_t *)&v19,  8u);
    }
  }

void sub_10005A974(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t *sub_10005A990(uint64_t *a1)
{
  return a1;
}

void sub_10005A9CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10005A9E8(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 192))
  {
    free(*(void **)(a1 + 8));
    *(_BYTE *)(a1 + 192) = 0;
  }

  if (*(void *)a1) {
    CFRelease(*(CFTypeRef *)a1);
  }
  return a1;
}

void sub_10005AA2C(_Unwind_Exception *exception_object)
{
  if (*(_BYTE *)(v1 + 192))
  {
    free(*(void **)(v1 + 8));
    *(_BYTE *)(v1 + 192) = 0;
  }

  if (*(void *)v1) {
    CFRelease(*(CFTypeRef *)v1);
  }
  _Unwind_Resume(exception_object);
}

double sub_10005AA58(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    uint64_t v3 = *(CFTypeRef **)(a1 + 8);
    uint64_t v4 = 8 * v2;
    do
    {
      if (*v3) {
        CFRelease(*v3);
      }
      ++v3;
      v4 -= 8LL;
    }

    while (v4);
  }

  if (*(_BYTE *)(a1 + 192))
  {
    free(*(void **)(a1 + 8));
    *(_BYTE *)(a1 + 192) = 0;
  }

  double result = 0.0;
  *(_OWORD *)(a1 + 16) = xmmword_10008C410;
  *(void *)(a1 + _Block_object_dispose(va, 8) = a1 + 32;
  return result;
}

void sub_10005AACC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, void *a6, double a7)
{
  if (a1)
  {
    if (!a2) {
      __assert_rtn( "-[BKDirectTouchState _appendSubsetOfHIDCollection:forDestination:toEventPoster:systemGestureIsPossible:pathLocat ions:initialTouchTimestamp:]",  "BKDirectTouchState.mm",  2175,  "pathCollectionEvent");
    }
    if (a3)
    {
      unsigned int v10 = *(_DWORD *)(a3 + 12);
      unsigned int v137 = *(_DWORD *)(a3 + 8);
    }

    else
    {
      unsigned int v137 = 0;
      unsigned int v10 = 0;
    }

    NSMutableArray *v141 = [[NSMutableArray alloc] init];
    BKTouchContactSet *v139 = [[BKTouchContactSet alloc] init];
    id v144 = a1;
    uint64_t TimeStamp = IOHIDEventGetTimeStamp(a2);
    LODWORD(v124) = 0;
    HIDWORD(v124) = IOHIDEventGetEventFlags(a2) & 0x20 | 4;
    cf = (__IOHIDEvent *)IOHIDEventCreateDigitizerEvent( 0LL,  TimeStamp,  3LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  0.0,  0.0,  0.0,  0.0,  v124);
    id v12 = *((id *)v144 + 1);
    IOHIDEventSetSenderID(cf, [v12 senderID]);

    uint64_t IntegerValue = IOHIDEventGetIntegerValue(a2, 720923LL);
    IOHIDEventSetIntegerValue(cf, 720923LL, IntegerValue);
    uint64_t v14 = IOHIDEventGetIntegerValue(a2, 720924LL);
    IOHIDEventSetIntegerValue(cf, 720924LL, v14);
    uint64_t v15 = IOHIDEventGetIntegerValue(a2, 720925LL);
    IOHIDEventSetIntegerValue(cf, 720925LL, v15);
    uint64_t v16 = IOHIDEventGetIntegerValue(a2, 720921LL);
    IOHIDEventSetIntegerValue(cf, 720921LL, v16);
    uint64_t v17 = IOHIDEventGetIntegerValue(a2, 4LL);
    IOHIDEventSetIntegerValue(cf, 4LL, v17);

    uint64_t Children = (const __CFArray *)IOHIDEventGetChildren(a2);
    int v19 = Children;
    if (Children)
    {
      CFIndex Count = CFArrayGetCount(Children);
      if (Count >= 1)
      {
        CFIndex v145 = Count;
        unsigned int v125 = v10;
        uint64_t v138 = 0LL;
        CFIndex v21 = 0LL;
        double v134 = v19;
LABEL_8:
        ValueAtIndedouble x = CFArrayGetValueAtIndex(v19, v21);
        int Type = IOHIDEventGetType(ValueAtIndex, v23);
        if (Type != 11)
        {
          if (Type != 1
            || (unsigned __int16 v25 = IOHIDEventGetIntegerValue(ValueAtIndex, 0x10000LL),
                __int16 v26 = IOHIDEventGetIntegerValue(ValueAtIndex, 65537LL),
                v25 != 65280LL)
            || v26 != 38LL)
          {
            Copdouble y = (const void *)IOHIDEventCreateCopy(0LL, ValueAtIndex);
            IOHIDEventAppendEvent(cf, Copy, 0LL, v28);
            CFRelease(Copy);
          }

          goto LABEL_124;
        }

        uint64_t v29 = IOHIDEventGetIntegerValue(ValueAtIndex, 720901LL);
        uint64_t v31 = v29;
        if (v29 >= 30)
        {
          uint64_t v32 = BKLogTouchEvents(v29, v30);
          uint64_t v33 = v32;
          if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&uint8_t buf[4] = v31;
            _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v33,  OS_LOG_TYPE_ERROR,  "bad path count:%d",  buf,  8u);
          }

          goto LABEL_123;
        }

        __int128 v34 = sub_1000456F0(*((id **)v144 + 14), v29);
        uint64_t v33 = [v34 autorelease];
        if (!v33)
        {
          uint64_t v68 = BKLogTouchEvents(0LL, v35);
          uint64_t v45 = [os_log_s class];
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&uint8_t buf[4] = v31;
            _os_log_error_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_ERROR,  "no contact for pathIndex:%d",  buf,  8u);
          }

          goto LABEL_122;
        }

        __int128 v149 = 0u;
        __int128 v150 = 0u;
        __int128 v147 = 0u;
        __int128 v148 = 0u;
        id v36 = a6;
        id v37 = [v36 countByEnumeratingWithState:v147 objects:v159 count:16];
        if (!v37)
        {
LABEL_29:

          int v19 = v134;
          uint64_t v44 = BKLogTouchEvents(v42, v43);
          uint64_t v45 = [v44 autorelease];
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)&uint8_t buf[4] = v31;
            *(_WORD *)&uint8_t buf[8] = 1024;
            *(_DWORD *)&buf[10] = v137;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEBUG,  "Filtering pathIndex:%d from ctx:%X",  buf,  0xEu);
          }

          goto LABEL_122;
        }

        uint64_t v38 = *(void *)v148;
LABEL_19:
        uint64_t v39 = 0LL;
        while (1)
        {
          if (*(void *)v148 != v38) {
            objc_enumerationMutation(v36);
          }
          uint64_t v40 = *(void **)(v147 + 8 * v39);
          if (v40)
          {
            if (v40[1] == v31)
            {
              id v142 = v40;

              int v102 = v142[25];
              int v103 = v142[26];
              double v104 = *((double *)v142 + 4);
              double v105 = *((double *)v142 + 5);
              double v106 = *((double *)v142 + 6);
              double v107 = *((double *)v142 + 7);
              double v108 = *((double *)v142 + 8);
              double v109 = *((double *)v142 + 9);
LABEL_32:
              uint64_t v46 = IOHIDEventCreateCopy(0LL, ValueAtIndex);
              IOHIDEventSetFloatValue(v46, 720896LL, v104);
              IOHIDEventSetFloatValue(v46, 720897LL, v105);
              uint64_t v47 = IOHIDEventGetIntegerValue(v46, 720903LL);
              uint64_t v48 = IOHIDEventGetIntegerValue(v46, 720905LL);
              int v132 = v102;
              v143 = (const void *)v46;
              id v49 = (id)IOHIDEventGetIntegerValue(v46, 720904LL);
              id v51 = v49;
              BOOL v52 = v48 == 0;
              BOOL v133 = v49 != 0LL;
              int v53 = *(unsigned __int8 *)(v33 + 296);
              int v130 = v103;
              unsigned int v131 = v52 & (v47 >> 1);
              int v135 = v53;
              if (v142)
              {
                BOOL v54 = v53 == 0;
                BOOL v55 = v53 != 0;
                unsigned int v56 = (v48 != 0) & (v47 >> 1);
                uint64_t v57 = *((void *)v142 + 2);
                if (!v54) {
                  LOBYTE(v56) = 1;
                }
                char v58 = v57 != 3 || v55;
                if (v57 == 2) {
                  char v59 = v56 | v47 & (v49 != 0LL);
                }
                else {
                  char v59 = 1;
                }
                if (v57)
                {
                  unsigned int v60 = v52 & (v47 >> 1);
                }

                else
                {
                  BOOL v55 = 0;
                  unsigned int v60 = 0;
                }

                if (v60 != 1 || v57 == 4)
                {
                  if (v57 == 3) {
                    unsigned int v67 = 3;
                  }
                  else {
                    unsigned int v67 = 1;
                  }
                  if (v57 == 2) {
                    unsigned int v67 = 2;
                  }
                  if (v57 == 4) {
                    unsigned int v67 = 4;
                  }
                  int v19 = v134;
                }

                else
                {
                  uint64_t v126 = v47;
                  uint64_t v61 = v48;
                  BOOL v62 = v55;
                  uint64_t v63 = v33;
                  char v64 = v59;
                  BOOL v65 = v52;
                  char v66 = v58;
                  uint64_t v127 = v63;
                  id v49 = [*((id *)v144 + 8) noteTouchUpOccurred:*(unsigned int *)(v63 + 16) detached:v135 != 0 context:v137 clientPort:v125];
                  if (v57 == 3) {
                    unsigned int v67 = 3;
                  }
                  else {
                    unsigned int v67 = 1;
                  }
                  if (v57 == 2) {
                    unsigned int v67 = 2;
                  }
                  int v19 = v134;
                  char v58 = v66;
                  LOBYTE(v52) = v65;
                  char v59 = v64;
                  BOOL v55 = v62;
                  uint64_t v48 = v61;
                  uint64_t v47 = v126;
                  uint64_t v33 = v127;
                }

                if (v55) {
                  uint64_t v69 = v67;
                }
                else {
                  uint64_t v69 = 0LL;
                }
              }

              else
              {
                uint64_t v69 = 0LL;
                char v58 = 1;
                char v59 = 1;
                int v19 = v134;
              }

              if (v51) {
                char v70 = 1;
              }
              else {
                char v70 = v52;
              }
              if ((v70 & 1) == 0)
              {
                BOOL v133 = 1;
                char v71 = v58;
                id v49 = (id)IOHIDEventSetIntegerValue(v143, 720904LL, 1LL);
                char v58 = v71;
              }

              if ((v58 & 1) != 0)
              {
                unint64_t v72 = v47;
                if ((v59 & 1) == 0)
                {
                  uint64_t v73 = BKLogTouchEvents(v49, v50);
                  os_log_s *v74 = [v73 autorelease];
                  if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 67109120;
                    *(_DWORD *)&uint8_t buf[4] = v137;
                    _os_log_debug_impl( (void *)&_mh_execute_header,  v74,  OS_LOG_TYPE_DEBUG,  "-------> synthetic touch down due to client change to contextID: 0x%x",  buf,  8u);
                  }

                  uint64_t v75 = v47 | 2;
                  if (!v48) {
                    uint64_t v75 = v47;
                  }
                  unint64_t v72 = v75 & 0xFFFFFFFFFFFFF7DALL | 0x821;
                }

                if (v48) {
                  int v76 = 1;
                }
                else {
                  int v76 = v133;
                }
                if (v76 == 1 && (v47 & 0x80) == 0) {
                  sub_100045A40((uint64_t)v139, v33);
                }
              }

              else
              {
                if (v48)
                {
                  uint64_t v77 = BKLogTouchEvents(v49, v50);
                  os_log_s *v78 = v77;
                  if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 67109120;
                    *(_DWORD *)&uint8_t buf[4] = v137;
                    _os_log_debug_impl( (void *)&_mh_execute_header,  v78,  OS_LOG_TYPE_DEBUG,  "-------> synthetic touch cancel due to client change to contextID: 0x%x",  buf,  8u);
                  }

                  unint64_t v72 = 131LL;
                }

                else
                {
                  uint64_t v79 = BKLogTouchEvents(v49, v50);
                  os_log_s *v78 = v79;
                  if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 67109120;
                    *(_DWORD *)&uint8_t buf[4] = v137;
                    _os_log_debug_impl( (void *)&_mh_execute_header,  v78,  OS_LOG_TYPE_DEBUG,  "-------> synthetic range out due to client change to contextID: 0x%x",  buf,  8u);
                  }

                  unint64_t v72 = 1LL;
                }

                IOHIDEventSetIntegerValue(v143, 720905LL, 0LL);
                IOHIDEventSetIntegerValue(v143, 720904LL, 0LL);
              }

              IOHIDEventSetIntegerValue(v143, 720903LL, v72);
              if (!v135 && !*(_DWORD *)(v33 + 16) && !v132 && !v130)
              {
                v80.n128_u64[0] = *(void *)(v33 + 192);
                if (v80.n128_f64[0] == 0.0) {
                  goto LABEL_121;
                }
              }

              BKSHIDEventDigitizerPathAttributes *v81 = [[BKSHIDEventDigitizerPathAttributes alloc] init];
              [v81 setPathIndex:v31];
              [v81 setTouchIdentifier:*(unsigned int *)(v33 + 16)];
              [v81 setUserIdentifier:*(unsigned int *)(v33 + 20)];
              [v81 setHitTestContextCategory:*(void *)(v33 + 56)];
              double v82 = *(double *)(v33 + 192);
              *(float *)&double v82 = v82;
              [v81 setZGradient:v82];
              [v81 setLocus:v69];
              [v81 setHitTestLocation:CGPointMake(v106, v107)];
              [v81 setPreciseLocation:CGPointMake(v108, v109)];
              if (*(void *)(v33 + 272))
              {
                uint64_t v83 = [*(id *)(v33 + 288) firstObject];
                int v84 = v83 ? v83[2] : 0;
                BOOL v85 = v84 == v137;

                if (v85) {
                  [v81 setSecurityAnalysis:*(void *)(v33 + 272)];
                }
              }

              if (!v131) {
                goto LABEL_120;
              }
              sub_10001D26C((const __CFArray **)buf, (uint64_t)ValueAtIndex);
              CFIndex v87 = buf[8];
              uint64_t v88 = v156;
              if (*(uint64_t *)&buf[8] >= (uint64_t)v156)
              {
LABEL_116:
                int v99 = 0;
                goto LABEL_117;
              }

              id v89 = *(const __CFArray **)buf;
              while (1)
              {
                if (v88) {
                  uint64_t v90 = CFArrayGetValueAtIndex(v89, v87);
                }
                else {
                  uint64_t v90 = 0LL;
                }
                if (IOHIDEventGetType(v90, v86) == 1)
                {
                  uint64_t v91 = IOHIDEventGetIntegerValue(ValueAtIndex, 0x10000LL);
                  uint64_t v92 = IOHIDEventGetIntegerValue(ValueAtIndex, 65537LL);
                  if (v91 == 65280 && v92 == 34)
                  {
                    uint64_t v93 = IOHIDEventGetIntegerValue(ValueAtIndex, 65539LL);
                    int v95 = v93;
                    if (v93 > 7)
                    {
                      DataValue = (_DWORD *)IOHIDEventGetDataValue(ValueAtIndex, 65540LL);
                      if (*DataValue == 1)
                      {
                        int v99 = DataValue[1];
LABEL_117:
                        id v100 = sub_10005BB70((uint64_t)v144, v33, v99, a3);
                        int v101 = [v100 autorelease];
                        if (v101) {
                          [v81 setAuthenticationMessage:v101];
                        }

LABEL_120:
                        [v141 addObject:v81];

LABEL_121:
                        IOHIDEventAppendEvent(cf, v143, 0LL, v80);
                        CFRelease(v143);
                        ++v138;
                        uint64_t v45 = (os_log_s *)v142;
LABEL_122:

LABEL_123:
LABEL_124:
                        if (++v21 == v145)
                        {
                          if (v138 > 0)
                          {
                            BKSHIDEventDigitizerAttributes *v110 = [[BKSHIDEventDigitizerAttributes alloc] init];
                            id v111 = [BKSHIDEventDeferringToken tokenForIdentifierOfCAContext:v137];
                            [v110 setToken:v111];

                            [v110 setInitialTouchTimestamp:a7];
                            [v110 setSystemGesturesPossible:a5 != 0];
                            [v110 setPathAttributes:v141];
                            if (a3)
                            {
                              id v112 = *(id *)(a3 + 16);
                              double v113 = v112;
                              if (v112) {
                                [v110 setSceneTouchBehavior:[v112 touchBehavior]];
                              }
                            }

                            else
                            {
                              double v113 = 0LL;
                            }

                            if (*((void *)v144 + 10)) {
                              [v110 setOptions:256];
                            }
                            sub_10001D26C((const __CFArray **)buf, (uint64_t)cf);
                            sub_10001D2B0((unint64_t)buf);
                            unsigned int v114 = 0;
                            uint64_t v115 = 0LL;
                            uint64_t v116 = 0LL;
                            int v117 = 0;
                            *(_OWORD *)uint64_t v151 = *(_OWORD *)buf;
                            __int128 v152 = v156;
                            __int128 v153 = v157;
                            uint64_t v154 = v158;
                            while (1)
                            {
                              uint64_t v118 = *((void *)&v152 + 1);
                              if (!*((void *)&v152 + 1)) {
                                break;
                              }
                              *((void *)&v153 + 1) = *((void *)&v152 + 1);
                              uint64_t v154 = v153;
                              if (IOHIDEventGetIntegerValue(*((void *)&v152 + 1), 720905LL)) {
                                uint64_t v115 = 1LL;
                              }
                              uint64_t v119 = IOHIDEventGetIntegerValue(v118, 720904LL);
                              unint64_t v120 = IOHIDEventGetIntegerValue(v118, 720903LL);
                              if (v119) {
                                uint64_t v116 = 1LL;
                              }
                              v114 |= v120 & 0xF060807;
                              v117 |= (v120 >> 7) & 1;
                              sub_10001D2B0((unint64_t)v151);
                            }

                            if ((v117 & 1) != 0 && !-[BKTouchContactSet count](v139, "count"))
                            {
                              uint64_t v122 = BKLogTouchEvents(0LL, v121);
                              uint64_t v123 = [os_log_s class];
                              if (os_log_type_enabled(v123, OS_LOG_TYPE_DEBUG))
                              {
                                *(_DWORD *)buf = 67109120;
                                *(_DWORD *)&uint8_t buf[4] = v137;
                                _os_log_debug_impl( (void *)&_mh_execute_header,  v123,  OS_LOG_TYPE_DEBUG,  "full collection cancel contextID: 0x%X",  buf,  8u);
                              }

                              v114 |= 0x80u;
                            }

                            IOHIDEventSetIntegerValue(cf, 720903LL, v114);
                            IOHIDEventSetIntegerValue(cf, 720905LL, v115);
                            IOHIDEventSetIntegerValue(cf, 720904LL, v116);
                            [*((id *)v144 + 16) setObject:v139 forKey:v137];
                            sub_10001EB28(a4, cf, v110, (void *)a3);
                          }

                          goto LABEL_148;
                        }

                        goto LABEL_8;
                      }
                    }

                    else
                    {
                      uint64_t v96 = BKLogTouchEvents(v93, v94);
                      uint64_t v97 = [os_log autorelease];
                      if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)uint64_t v151 = 67109120;
                        *(_DWORD *)&v151[4] = v95;
                        _os_log_error_impl( (void *)&_mh_execute_header,  v97,  OS_LOG_TYPE_ERROR,  "malformed AX subevent (length is %d), want at least 8 bytes",  v151,  8u);
                      }
                    }
                  }
                }

                if (v88 == ++v87) {
                  goto LABEL_116;
                }
              }
            }
          }

          else if (!v31)
          {

            id v142 = 0LL;
            int v102 = 0;
            int v103 = 0;
            double v104 = 0.0;
            double v105 = 0.0;
            double v106 = 0.0;
            double v107 = 0.0;
            double v108 = 0.0;
            double v109 = 0.0;
            goto LABEL_32;
          }

          if (v37 == (id)++v39)
          {
            id v41 = [v36 countByEnumeratingWithState:v147 objects:v159 count:16];
            id v37 = v41;
            if (!v41) {
              goto LABEL_29;
            }
            goto LABEL_19;
          }
        }
      }
    }

LABEL_148:
    CFRelease(cf);
  }

void sub_10005B880( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, void *a27, uint64_t a28, void *a29)
{
  _Unwind_Resume(a1);
}

void sub_10005B9C4(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    return;
  }
  if (a2) {
    uint64_t v4 = *(unsigned int *)(a2 + 8);
  }
  else {
    uint64_t v4 = 0LL;
  }
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  uint64_t v5 = [*(id *)(a1 + 128) objectForKey:v4];
  id v6 = [v5 countByEnumeratingWithState:v14 objects:v20 count:16];
  if (!v6)
  {

LABEL_16:
    uint64_t v12 = BKLogTouchEvents(v10, v11);
    uint64_t v13 = [v12];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v19 = a2;
      _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "adding latent: %{public}@", buf, 0xCu);
    }

    [*(id *)(a1 + 144) addObject:a2];
    return;
  }

  uint64_t v7 = 0LL;
  uint64_t v8 = *(void *)v15;
  do
  {
    for (uint64_t i = 0LL; i != v6; uint64_t i = (char *)i + 1)
    {
      if (*(void *)v15 != v8) {
        objc_enumerationMutation(v5);
      }
      if (*(void *)(*(void *)(*((void *)&v14 + 1) + 8LL * (void)i) + 32LL) > v7) {
        uint64_t v7 = *(void *)(*(void *)(*((void *)&v14 + 1) + 8LL * (void)i) + 32LL);
      }
    }

    id v6 = [v5 countByEnumeratingWithState:v14 objects:v20 count:16];
  }

  while (v6);

  if (v7 <= 1) {
    goto LABEL_16;
  }
}

void sub_10005BB50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10005BB70(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  if (a4) {
    int v8 = *(_DWORD *)(a4 + 8);
  }
  else {
    int v8 = 0;
  }
  uint64_t v9 = [*(id *)(a2 + 288) firstObject];
  if (v9) {
    int v10 = v9[2];
  }
  else {
    int v10 = 0;
  }

  if (v10 == v8 && *(void *)(a2 + 264))
  {
    uint64_t v11 = [*(id *)(a1 + 16) _queue_slotRecordForSlotID:*(unsigned int *)(a2 + 24)];
    uint64_t v12 = (void *)v11;
    if (!v11)
    {
      id v42 = 0LL;
      goto LABEL_41;
    }

    id v55 = *(id *)(v11 + 16);
    memset(__src, 0, sizeof(__src));
    uint64_t v13 = *(void **)(a1 + 40);
    if (v13) {
      uint64_t v13 = (void *)v13[1];
    }
    __int128 v14 = v13;
    __int128 v15 = (void *)[*(id *)(a1 + 8) displayUUID];
    CGPoint v20 = [v14 convertReferenceLocation:v15 toCAScreenLocationForDisplayUUID:*(double *)(a2 + 224) displayUUID:*(double *)(a2 + 232)];
    double v17 = v16;
    double v19 = v18;
    int v20 = [*(id *)(a2 + 256) contextIDsToExcludeFromHitTesting];
    CFIndex v21 = [BKDisplayController displayControllerWithDisplayID:v55];
    id v22 = v21;
    id v23 = [v14 contextIDAtCAScreenLocation:v15 displayUUID:v22 options:0 securityAnalysis:__src results:v17];
    if (LODWORD(__src[0]) == v8)
    {
      uint64_t v25 = BKLogTouchEvents(v23, v24);
      os_log_s *v26 = [v25 autorelease];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = __src[0];
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "auth spec contextID down/up match:%X",  buf,  8u);
      }

      if (DWORD1(__src[0]) == *(_DWORD *)(a2 + 24))
      {
        if (a4) {
          uint64_t v29 = *(unsigned int *)(a4 + 12);
        }
        else {
          uint64_t v29 = 0LL;
        }
        uint64_t v30 = BSAuditTokenForTask(v29, buf);
        if ((_DWORD)v30)
        {
          uint64_t v32 = *(void **)(a1 + 88);
          if (!v32)
          {
            uint64_t v33 = [BKHIDSystemInterface sharedInstance];
            uint64_t v35 = *(void **)(a1 + 88);
            __int128 v34 = (uint64_t *)(a1 + 88);
            uint64_t *v34 = v33;

            uint64_t v32 = (void *)*v34;
          }

          id v36 = [v32 deliveryManager];
          BOOL v54 = [v36 authenticationOriginator];
          id v37 = [v55 secureName];
          if (a3)
          {
            int v39 = (int)v37;
            if ((_DWORD)v37 == a3)
            {
              uint64_t v40 = 2LL;
            }

            else
            {
              uint64_t v49 = BKLogTouchEvents(v37, v38);
              uint64_t v50 = [os_log_s class];
              if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)char v64 = 67109376;
                int v65 = v39;
                __int16 v66 = 1024;
                int v67 = a3;
                _os_log_error_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_ERROR,  "auth secure name:%X does not match requested secure name:%X",  v64,  0xEu);
              }

              uint64_t v40 = 1LL;
            }
          }

          else
          {
            uint64_t v40 = 0LL;
          }

          v56[0] = _NSConcreteStackBlock;
          v56[1] = 3221225472LL;
          v56[2] = sub_10005C148;
          v56[3] = &unk_1000B7900;
          memcpy(v59, __src, sizeof(v59));
          v56[4] = a2;
          uint64_t v60 = v40;
          id v57 = v55;
          __int128 v61 = *(_OWORD *)buf;
          __int128 v62 = v69;
          id v58 = v12;
          id v42 = [v54 buildMessage:v56];
        }

        else
        {
          uint64_t v48 = BKLogTouchEvents(v30, v31);
          id v36 = v48;
          if (os_log_type_enabled((os_log_t)v36, OS_LOG_TYPE_ERROR))
          {
            if (a4) {
              int v53 = *(_DWORD *)(a4 + 12);
            }
            else {
              int v53 = 0;
            }
            *(_DWORD *)char v64 = 67109120;
            int v65 = v53;
            _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v36,  OS_LOG_TYPE_ERROR,  "auth cannot get audit token for port:%X",  v64,  8u);
          }

          id v42 = 0LL;
        }

        char v47 = 0;
LABEL_39:

        if ((v47 & 1) != 0)
        {
          id v41 = 0LL;
LABEL_42:

          return v41;
        }

void sub_10005C0AC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_10005C148(uint64_t a1, void *a2)
{
  uint64_t v4 = *(unsigned int *)(a1 + 56);
  id v5 = a2;
  [v5 setTargetContextID:v4];
  [v5 setTargetSlotID:*(unsigned int *)(a1 + 60)];

  id v6 = sub_1000075CC(a1 + 56);
  uint64_t v7 = [v6 autorelease];
  [v5 setHitTestInformationFromStartEvent:*(void *)(*(void *)(a1 + 32) + 264)];
  [v5 setHitTestInformationFromEndEvent:v7];
  [v5 setSecureNameStatus:*(void *)(a1 + 360)];
  [v5 setContext:[*(id *)(a1 + 40) authenticationMessageContext]];
  __int128 v8 = *(_OWORD *)(a1 + 384);
  v11[0] = *(_OWORD *)(a1 + 368);
  v11[1] = v8;
  [v5 setVersionedPID:BSVersionedPIDForAuditToken(v11)];
  uint64_t v9 = *(void *)(a1 + 48);
  if (v9) {
    BOOL v10 = *(unsigned __int8 *)(v9 + 8) != 0;
  }
  else {
    BOOL v10 = 0LL;
  }
  [v5 setRegistrantEntitled:v10];
}

void sub_10005C254(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BKTouchContact *sub_10005C264(int64_t a1, uint64_t a2)
{
  BKTouchContact *v4 = [[BKTouchContact alloc] init];
  id v5 = v4;
  else {
    int v6 = 1;
  }
  dword_1000DC1F8 = v6;
  v4->_pathIndedouble x = a1;
  v4->_touchIdentifier = v6;
  v4->_transducerint Type = IOHIDEventGetIntegerValue(a2, 720900LL);
  uint64_t v7 = BKLogTouchEvents();
  os_log_s *v8 = [v7 autorelease];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v10[0] = 67109376;
    v10[1] = a1;
    __int16 v11 = 1024;
    int v12 = dword_1000DC1F8;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "new contact for pathIndex: %d touchID: %X",  (uint8_t *)v10,  0xEu);
  }

  return v5;
}

void sub_10005C370(_Unwind_Exception *exception_object)
{
}

float64x2_t sub_10005C38C(uint64_t a1, uint64_t a2, float64_t a3, float64_t a4, float64_t a5, float64_t a6)
{
  float64x2_t v34 = 0uLL;
  double v33 = 1.0;
  float64x2_t v31 = 0uLL;
  __asm { FMOV            V0.2D, #1.0 }

  float64x2_t v26 = _Q0;
  float64x2_t v32 = _Q0;
  uint64_t v13 = (void *)[*(id *)(a2 + 8) displayUUID];
  sub_100019B10(v13, &v34, &v34.f64[1], &v33, 0LL, (uint64_t)&v31);

  v14.f64[0] = a3;
  v14.f64[1] = a4;
  v15.f64[0] = a5;
  v15.f64[1] = a6;
  float64x2_t v16 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v33, 0);
  float64x2_t v17 = vmlaq_f64( vmulq_n_f64(v15, v33),  v34,  vminnmq_f64(vmaxnmq_f64(vdivq_f64(vsubq_f64(v14, v31), v32), (float64x2_t)0), v26));
  float64x2_t v18 = vdivq_f64(vrndaq_f64(v17), v16);
  double v19 = 1.0 / v33 * 0.5;
  double v20 = v19 + v18.f64[0];
  double v21 = v18.f64[0] - v19;
  if (v18.f64[0] == v34.f64[0] / v33)
  {
    char v22 = 1;
  }

  else
  {
    double v21 = v18.f64[0];
    char v22 = 0;
  }

  if (v18.f64[0] == 0.0)
  {
    char v23 = 1;
  }

  else
  {
    double v20 = v21;
    char v23 = v22;
  }

  double v24 = v18.f64[1];
  if (v18.f64[1] == 0.0)
  {
    double v24 = v19 + v18.f64[1];
LABEL_11:
    char v23 = 1;
    goto LABEL_12;
  }

  if (v18.f64[1] == v34.f64[1] / v33)
  {
    double v24 = v18.f64[1] - v19;
    goto LABEL_11;
  }

void sub_10005C4E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10005C4F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = sub_10005C5B8(a2, *(void *)(a1 + 8), a3, *(unsigned int *)(a1 + 64));
  IOHIDEventSetFloatValue(v4, 720896LL, *(double *)(a1 + 136));
  IOHIDEventSetFloatValue(v4, 720897LL, *(double *)(a1 + 144));
  uint64_t result = IOHIDEventSetFloatValue(v4, 720898LL, *(double *)(a1 + 152));
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6 == 2)
  {
    uint64_t result = IOHIDEventSetIntegerValue(v4, 720905LL, 1LL);
    uint64_t v6 = *(void *)(a1 + 32);
  }

  if (v6 >= 1) {
    uint64_t result = IOHIDEventSetIntegerValue(v4, 720904LL, 1LL);
  }
  if (*(_WORD *)(a1 + 68)) {
    return IOHIDEventSetPhase(v4, *(unsigned __int16 *)(a1 + 68));
  }
  return result;
}

uint64_t sub_10005C5B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t DigitizerEvent = IOHIDEventCreateDigitizerEvent( 0LL,  *(void *)(a1 + 200),  a4,  a2,  0LL,  a3,  0LL,  0LL,  0.0,  0.0,  0.0,  0.0,  0.0,  0x4400000000LL);
  uint64_t v6 = (void **)(a1 + 8);
  unint64_t v7 = *(void *)(a1 + 16);
  if (v7 < *(void *)(a1 + 24))
  {
    __int128 v8 = *v6;
LABEL_12:
    v8[v7] = DigitizerEvent;
    *(void *)(a1 + 16) = v7 + 1;
    return DigitizerEvent;
  }

  uint64_t v9 = BKLogTouchEvents();
  BOOL v10 = [v9 autorelease];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = *(void *)(a1 + 24);
    *(_DWORD *)buf = 134218240;
    uint64_t v17 = a1 + 8;
    __int16 v18 = 1024;
    int v19 = v15;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "array:%p exceeded capacity:%d; moving to heap",
      buf,
      0x12u);
  }

  uint64_t v11 = *(void *)(a1 + 24);
  int v12 = calloc(2 * v11, 8uLL);
  if (v12)
  {
    __int128 v8 = v12;
    if (v11)
    {
      for (uint64_t i = 0LL; i != v11; ++i)
        v12[i] = *((void *)*v6 + i);
    }

    if (*(_BYTE *)(a1 + 192)) {
      free(*v6);
    }
    *(void *)(a1 + _Block_object_dispose(va, 8) = v8;
    *(void *)(a1 + 24) = 2 * v11;
    *(_BYTE *)(a1 + 192) = 1;
    unint64_t v7 = *(void *)(a1 + 16);
    goto LABEL_12;
  }

  return DigitizerEvent;
}

id *sub_10005C74C(id *result, uint64_t a2)
{
  uint64_t v2 = result;
  if (a2 == 3)
  {
    [result[4] addObject:result[5]];
    uint64_t result = (id *)[v2[6] shouldAvoidHitTesting];
    if ((_DWORD)result) {
      *(void *)(*((void *)v2[7] + 1) + 24LL) = 1LL;
    }
  }

  else if (a2 == 2 || a2 == 1)
  {
    return (id *)[result[4] addObject:result[5]];
  }

  return result;
}

void sub_10005C7B4(uint64_t a1, void *a2)
{
  if (a1 && *(void **)(a1 + 176) != a2)
  {
    id v4 = [a2 copy];
    id v5 = *(void **)(a1 + 176);
    *(void *)(a1 + 176) = v4;

    uint64_t v8 = BKLogTouchEvents(v6, v7);
    uint64_t v9 = [os_log_s autorelease];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543618;
      char v22 = a2;
      __int16 v23 = 2114;
      uint64_t v24 = a1;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "Setting hittest regions to: %{public}@ for digitizer: %{public}@",  buf,  0x16u);
    }

    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id v10 = *(id *)(a1 + 72);
    id v11 = [v10 countByEnumeratingWithState:v16 objects:v20 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v17;
      do
      {
        uint64_t v13 = 0LL;
        do
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v10);
          }
          [v13 hitTestRegionsDidChange:a2 withHitTestRegion:v16];
          uint64_t v13 = (char *)v13 + 1;
        }

        while (v11 != v13);
        id v11 = [v10 countByEnumeratingWithState:v16 objects:v20 count:16];
      }

      while (v11);
    }

    if ((uint64_t)[*(id *)(a1 + 112) count] >= 1)
    {
      float64x2_t v14 = sub_1000456D4(*(id **)(a1 + 112));
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      sub_100058F90(a1, v15);
    }
  }

void sub_10005C968(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005C98C(uint64_t a1, __IOHIDEvent *a2)
{
  if (!a1) {
    return;
  }
  if (!*(_BYTE *)(a1 + 204))
  {
    uint64_t v3 = [*(id *)(a1 + 8) propertyForKey:@"AccurateMaxDigitizerPressureValue"];
    id v4 = v3;
    if (v3) {
      [v3 floatValue];
    }
    else {
      int v5 = 0;
    }
    *(_BYTE *)(a1 + 204) = 1;
    *(_DWORD *)(a1 + 200) = v5;
  }

  __int128 v241 = 0u;
  __int128 v242 = 0u;
  __int128 v239 = 0u;
  __int128 v240 = 0u;
  uint64_t v223 = a1;
  id v6 = *(id *)(a1 + 72);
  id v7 = [v6 countByEnumeratingWithState:v239 objects:v263 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v240;
    do
    {
      for (uint64_t i = 0LL; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v240 != v8) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v239 + 1) + 8 * (void)i) touchWillStartProcessingTouchCollection];
      }

      id v7 = [v6 countByEnumeratingWithState:v239 objects:v263 count:16];
    }

    while (v7);
  }

  if (BKSHIDEventContainsUpdates(a2))
  {
    id location = *(id **)(v223 + 184);
    if (location)
    {
      uint64_t v221 = sub_10001D130((uint64_t)a2);
      id v10 = sub_10001CF04((uint64_t)location, v221);
      v226 = [v10 autorelease];
      if (v226)
      {
        __int128 v276 = 0u;
        __int128 v275 = 0u;
        __int128 v274 = 0u;
        __int128 v273 = 0u;
        __int128 v272 = 0u;
        __int128 v271 = 0u;
        __int128 v270 = 0u;
        __int128 v269 = 0u;
        __int128 v268 = 0u;
        __int128 v266 = 0u;
        __int128 v267 = 0u;
        __int128 v265 = 0u;
        memset(buf, 0, sizeof(buf));
        sub_10001D26C((const __CFArray **)v284, (uint64_t)a2);
        sub_10001D2B0((unint64_t)v284);
        uint64_t v224 = 0LL;
        unsigned int v12 = 0;
        objc_super v280 = *(objc_super *)v284;
        __int128 v281 = v285;
        __int128 v282 = v286;
        *(void *)&__int128 v283 = v287;
        while (1)
        {
          uint64_t v13 = *((void *)&v281 + 1);
          if (!*((void *)&v281 + 1)) {
            break;
          }
          uint64_t v14 = v282;
          *((void *)&v282 + 1) = *((void *)&v281 + 1);
          *(void *)&__int128 v283 = v282;
          int v15 = sub_10001CBE4((uint64_t)v226, v282);
          int IntegerValue = IOHIDEventGetIntegerValue(v13, 720924LL);
          if (!v15)
          {
            uint64_t v94 = IOHIDEventGetIntegerValue(v13, 720925LL);
            uint64_t v96 = v94;
            if ((_DWORD)v94)
            {
              uint64_t v97 = BKLogTouchEvents(v94, v95);
              os_log_s *v98 = v97;
              if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v277 = 134218240;
                *(void *)&v277[4] = v14;
                *(_WORD *)&v277[12] = 2048;
                *(void *)&v277[14] = v96;
                _os_log_impl( (void *)&_mh_execute_header,  v98,  OS_LOG_TYPE_DEFAULT,  "remainingUpdatesMask for path %ld is zero, but we got updates:%lX",  v277,  0x16u);
              }
            }

            goto LABEL_106;
          }

          int v17 = IntegerValue;
          buf[v14] = v13;
          sub_10001CD74((uint64_t)v226, IntegerValue, v14);
          v12 |= 1LL << v14;
          uint64_t v18 = v224;
          if (v17) {
            uint64_t v18 = v224 + 1;
          }
          uint64_t v224 = v18;
          sub_10001D2B0((unint64_t)&v280);
        }

        if (v12)
        {
          __int128 v283 = 0u;
          __int128 v282 = 0u;
          __int128 v281 = 0u;
          objc_super v280 = (objc_super)0;
          id obja = v226[17];
          __int16 v66 = 0LL;
          id v67 = [obja countByEnumeratingWithState:v280 objects:v284 count:16];
          if (v67)
          {
            uint64_t v231 = *(void *)v281;
            do
            {
              uint64_t v68 = 0LL;
              do
              {
                if (*(void *)v281 != v231) {
                  objc_enumerationMutation(obja);
                }
                Class isa = v280.super_class[(void)v68].isa;
                if (isa) {
                  int v70 = (int)isa[3].isa;
                }
                else {
                  int v70 = 0;
                }
                unint64_t v71 = v70 & v12;
                if ((v70 & v12) != 0)
                {
                  id v72 = location[3];
                  uint64_t TimeStamp = IOHIDEventGetTimeStamp(a2);
                  IOHIDEventGetEventFlags(a2);
                  LODWORD(v210) = 0;
                  HIDWORD(v210) = v74 & 0x20 | 4;
                  uint64_t DigitizerEvent = (const void *)IOHIDEventCreateDigitizerEvent( 0LL,  TimeStamp,  3LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  0.0,  0.0,  0.0,  0.0,  v210);
                  id v76 = v72;
                  uint64_t v77 = v76;
                  if (v76) {
                    id v78 = (void *)*((void *)v76 + 1);
                  }
                  else {
                    id v78 = 0LL;
                  }
                  id v79 = v78;
                  IOHIDEventSetSenderID(DigitizerEvent, [v79 senderID]);

                  uint64_t v80 = IOHIDEventGetIntegerValue(a2, 720923LL);
                  IOHIDEventSetIntegerValue(DigitizerEvent, 720923LL, v80);
                  uint64_t v81 = IOHIDEventGetIntegerValue(a2, 720924LL);
                  IOHIDEventSetIntegerValue(DigitizerEvent, 720924LL, v81);
                  uint64_t v82 = IOHIDEventGetIntegerValue(a2, 720925LL);
                  IOHIDEventSetIntegerValue(DigitizerEvent, 720925LL, v82);
                  uint64_t v83 = IOHIDEventGetIntegerValue(a2, 720921LL);
                  IOHIDEventSetIntegerValue(DigitizerEvent, 720921LL, v83);
                  uint64_t v84 = IOHIDEventGetIntegerValue(a2, 4LL);
                  IOHIDEventSetIntegerValue(DigitizerEvent, 4LL, v84);

                  for (uint64_t j = 0LL; j != 30; ++j)
                  {
                    if (((v71 >> j) & 1) != 0) {
                      IOHIDEventAppendEvent(DigitizerEvent, buf[j], 0LL, v85);
                    }
                  }

                  BKSHIDEventDigitizerAttributes *v87 = [[BKSHIDEventDigitizerAttributes alloc] init];
                  if (!v66) {
                    BKHIDEventCollector *v66 = [[BKHIDEventCollector alloc] init];
                  }
                  id v88 = sub_10001D0EC((uint64_t)location);
                  id v89 = [v88 autorelease];
                  uint64_t v90 = v89;
                  if (v66 && v89 && [*((id *)v89 + 2) count])
                  {
                    sub_10001EACC((uint64_t)v66);
                    [v66->_collectedEvents addObjectsFromArray:v90[2]];
                  }

                  sub_10001EB28((uint64_t)v66, a2, v87, isa);
                  CFRelease(DigitizerEvent);
                }

                uint64_t v68 = (char *)v68 + 1;
              }

              while (v68 != v67);
              id v91 = [obja countByEnumeratingWithState:&v280 objects:v284 count:16];
              id v67 = v91;
            }

            while (v91);
          }

          if (!v224)
          {
            id v92 = sub_10001D03C((uint64_t)location, v221);
            uint64_t v93 = [v92 autorelease];
            if ((id *)v93 != v226)
            {
              NSString *v203 = [NSString stringWithFormat:@"pending/removed items don't match: %@/%@", v93, v226];
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              {
                __int128 v204 = NSStringFromSelector("_handleDidUpdateEvent:");
                id v205 = v204;
                v207 = [location class];
                v208 = NSStringFromClass(v207);
                __int16 v209 = [v208 autorelease];
                *(_DWORD *)v277 = 138544642;
                *(void *)&v277[4] = v205;
                *(_WORD *)&v277[12] = 2114;
                *(void *)&v277[14] = v209;
                *(_WORD *)&v277[22] = 2048;
                *(void *)&v277[24] = location;
                LOWORD(v27_Block_object_dispose(va, 8) = 2114;
                *(void *)((char *)&v278 + 2) = @"BKDirectTouchUpdateEvents.mm";
                WORD5(v27_Block_object_dispose(va, 8) = 1024;
                HIDWORD(v27_Block_object_dispose(va, 8) = 260;
                LOWORD(v279[0]) = 2114;
                *(void *)((char *)v279 + 2) = v203;
                _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v277,  0x3Au);
              }

              _bs_set_crash_log_message([v203 UTF8String]);
              __break(0);
              JUMPOUT(0x10005E410LL);
            }
          }
        }

        else
        {
          __int16 v66 = 0LL;
        }

        int v99 = v66;
      }

      else
      {
        uint64_t v63 = BKLogTouchEvents(0LL, v11);
        char v64 = [os_log_s class];
        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
        {
          int v65 = [BSDescriptionStream descriptionForRootObject:location[1]];
          LODWORD(buf[0]) = 134218242;
          *(void *)((char *)buf + 4) = v221;
          WORD2(buf[1]) = 2114;
          *(void *)((char *)&buf[1] + 6) = v65;
          _os_log_impl( (void *)&_mh_execute_header,  v64,  OS_LOG_TYPE_DEFAULT,  "BKDigitizer: got an event update with generation:%ld but I can't find any pending items waiting for an update: %{public}@",  (uint8_t *)buf,  0x16u);
        }

LABEL_106:
        int v99 = 0LL;
      }
    }

    else
    {
      int v99 = 0LL;
    }

    sub_100056FA8(v223, (uint64_t)v99);

    goto LABEL_253;
  }

  v216 = (void *)[*(id *)(v223 + 8) displayUUID];
  if (!*(void *)(v223 + 56))
  {
    BKTouchDeliveryPolicyServer *v19 = [BKTouchDeliveryPolicyServer sharedServer];
    objc_storeStrong((id *)(v223 + 56), v19);
    uint64_t v20 = *(void *)(v223 + 24);
    if (v20) {
      objc_storeStrong((id *)(v20 + 8), v19);
    }
  }

  BKHIDEventCollector *v217 = [[BKHIDEventCollector alloc] init];
  v253[0] = (uint64_t)v217;
  id obj = (id *)(id)v223;
  v253[1] = (uint64_t)obj;
  double v21 = (id *)obj[14];
  locationa = (id **)(obj + 14);
  if (v21)
  {
    BKTouchContactSet *v230 = [[BKTouchContactSet alloc] init];
    __int128 v287 = 0u;
    __int128 v286 = 0u;
    __int128 v285 = 0u;
    *(_OWORD *)v284 = 0u;
    id v22 = v21[1];
    id v23 = [v22 countByEnumeratingWithState:v284 objects:buf count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v285;
      do
      {
        uint64_t v25 = 0LL;
        do
        {
          if (*(void *)v285 != v24) {
            objc_enumerationMutation(v22);
          }
          uint64_t v26 = *(void *)(*(void *)&v284[8] + 8LL * (void)v25);
          BKTouchContact *v27 = [[BKTouchContact alloc] init];
          if (v27)
          {
            v280.receiver = v27;
            [v280 super_class] = [BKTouchContact class];
            uint64_t v28 = [super init];
            uint64_t v29 = (uint64_t)v28;
            if (v28)
            {
              *((void *)v28 + 1) = *(void *)(v26 + 8);
              *((_DWORD *)v28 + 4) = *(_DWORD *)(v26 + 16);
              *((_DWORD *)v28 + 5) = *(_DWORD *)(v26 + 20);
              *((_DWORD *)v28 + 6) = *(_DWORD *)(v26 + 24);
              *((void *)v28 + 4) = *(void *)(v26 + 32);
              *((void *)v28 + 6) = *(void *)(v26 + 48);
              *((void *)v28 + 7) = *(void *)(v26 + 56);
              *((_DWORD *)v28 + 16) = *(_DWORD *)(v26 + 64);
              *((_WORD *)v28 + 34) = *(_WORD *)(v26 + 68);
              __int128 v30 = *(_OWORD *)(v26 + 72);
              *(_OWORD *)(v28 + 8_Block_object_dispose(va, 8) = *(_OWORD *)(v26 + 88);
              *(_OWORD *)(v28 + 72) = v30;
              __int128 v31 = *(_OWORD *)(v26 + 104);
              *(_OWORD *)(v28 + 120) = *(_OWORD *)(v26 + 120);
              *(_OWORD *)(v28 + 104) = v31;
              *(_OWORD *)(v28 + 136) = *(_OWORD *)(v26 + 136);
              *((void *)v28 + 19) = *(void *)(v26 + 152);
              *((_OWORD *)v28 + 10) = *(_OWORD *)(v26 + 160);
              __int128 v32 = *(_OWORD *)(v26 + 176);
              *((void *)v28 + 24) = *(void *)(v26 + 192);
              *((_OWORD *)v28 + 11) = v32;
              __int128 v33 = *(_OWORD *)(v26 + 200);
              __int128 v34 = *(_OWORD *)(v26 + 216);
              __int128 v35 = *(_OWORD *)(v26 + 232);
              *((void *)v28 + 31) = *(void *)(v26 + 248);
              *(_OWORD *)(v28 + 232) = v35;
              *(_OWORD *)(v28 + 216) = v34;
              *(_OWORD *)(v28 + 200) = v33;
              objc_storeStrong((id *)v28 + 32, *(id *)(v26 + 256));
              objc_storeStrong((id *)(v29 + 264), *(id *)(v26 + 264));
              objc_storeStrong((id *)(v29 + 272), *(id *)(v26 + 272));
              id v36 = [*(id *)(v26 + 280) mutableCopy];
              id v37 = *(void **)(v29 + 280);
              *(void *)(v29 + 280) = v36;

              objc_storeStrong((id *)(v29 + 288), *(id *)(v26 + 288));
              *(_BYTE *)(v29 + 296) = *(_BYTE *)(v26 + 296);
              *(_BYTE *)(v29 + 29_Block_object_dispose(va, 8) = *(_BYTE *)(v26 + 298);
            }
          }

          else
          {
            uint64_t v29 = 0LL;
          }

          sub_100045A40((uint64_t)v230, v29);

          uint64_t v25 = (char *)v25 + 1;
        }

        while (v23 != v25);
        id v38 = [v22 countByEnumeratingWithState:v284 objects:buf count:16];
        id v23 = v38;
      }

      while (v38);
    }
  }

  else
  {
    v230 = 0LL;
  }

  uint64_t v39 = IOHIDEventGetIntegerValue(a2, 720903LL);
  int v41 = v39;
  if ((v39 & 0x80) != 0)
  {
    uint64_t v49 = BKLogTouchEvents(v39, v40);
    os_log_s *v50 = [v49 autorelease];
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_DEFAULT,  "cancel received from HID",  (uint8_t *)buf,  2u);
    }

    NSMutableArray *v51 = [[NSMutableArray alloc] init];
    int v52 = a2;
    sub_10001D26C((const __CFArray **)&v280, (uint64_t)a2);
    sub_10001D2B0((unint64_t)&v280);
    *(objc_super *)v277 = v280;
    *(_OWORD *)&v277[16] = v281;
    __int128 v278 = v282;
    v279[0] = v283;
    while (*(void *)&v277[24])
    {
      *((void *)&v278 + 1) = *(void *)&v277[24];
      v279[0] = v278;
      int v53 = sub_1000456F0(*locationa, v278);
      uint64_t v54 = [v53 autorelease];
      id v55 = (void *)v54;
      if (v54)
      {
        uint64_t v56 = *(unsigned int *)(v54 + 16);
        if ((_DWORD)v56)
        {
          __int128 v287 = 0u;
          __int128 v286 = 0u;
          __int128 v285 = 0u;
          *(_OWORD *)v284 = 0u;
          id v57 = *(id *)(v223 + 72);
          id v58 = [v57 countByEnumeratingWithState:v284 objects:buf count:16];
          if (v58)
          {
            uint64_t v59 = *(void *)v285;
            do
            {
              for (k = 0LL; k != v58; k = (char *)k + 1)
              {
                if (*(void *)v285 != v59) {
                  objc_enumerationMutation(v57);
                }
                [v284[8] touchDidHIDCancel:v56];
              }

              id v58 = [v57 countByEnumeratingWithState:v284 objects:buf count:16];
            }

            while (v58);
          }
        }

        [v51 addObject:v55];
      }

      sub_10001D2B0((unint64_t)v277);
      int v52 = a2;
    }

    if (-[NSMutableArray count](v51, "count"))
    {
      __int128 v62 = v51;
    }

    else
    {
      uint64_t v116 = BKLogTouchEvents(0LL, v61);
      int v117 = (os_log_s *)v116;
      if (os_log_type_enabled(v117, OS_LOG_TYPE_INFO))
      {
        uint64_t SenderID = (void *)IOHIDEventGetSenderID(v52);
        LODWORD(v280.receiver) = 134217984;
        v280.receiver = SenderID;
        _os_log_impl( (void *)&_mh_execute_header,  v117,  OS_LOG_TYPE_INFO,  "received cancel without child paths from senderID:0x%llX",  (uint8_t *)&v280,  0xCu);
      }

      uint64_t v119 = sub_1000456D4(*locationa);
      NSMutableArray *v62 = v119;
    }

    unint64_t v120 = v62;

    sub_100056700((uint64_t)obj, v120, 0, 0LL);
    if (![*locationa count]) {
      sub_100056B6C((uint64_t)obj, 0LL);
    }
    *((_BYTE *)obj + 20_Block_object_dispose(va, 8) = 0;

    goto LABEL_252;
  }

  sub_10001D26C(v252, (uint64_t)a2);
  sub_10001D2B0((unint64_t)v252);
  if (v252[2])
  {
    _BKHIDNoteUserEventOccurredOnDisplay(v216);
    if ((v41 & 0x20000) == 0)
    {
      unsigned int v42 = [obj[4] isActive];
      int v43 = *((unsigned __int8 *)obj + 208);
      if (((*((_BYTE *)obj + 208) == 0) & ~v42) == 0)
      {
        sub_10001D26C((const __CFArray **)buf, (uint64_t)a2);
        sub_10001D2B0((unint64_t)buf);
        __int128 v285 = buf[2];
        *(_OWORD *)v284 = *(_OWORD *)buf;
        __int128 v286 = *(_OWORD *)&buf[4];
        *(void *)&__int128 v287 = v265;
        uint64_t v45 = buf[3];
        if (buf[3])
        {
          char v46 = 0;
          do
          {
            *((void *)&v286 + 1) = v45;
            *(void *)&__int128 v287 = v286;
            uint64_t v47 = IOHIDEventGetIntegerValue(v45, 720905LL);
            sub_10001D2B0((unint64_t)v284);
            if (v47) {
              ++v46;
            }
            uint64_t v45 = *((void *)&v285 + 1);
          }

          while (*((void *)&v285 + 1));
          BOOL v48 = v46 != 0;
        }

        else
        {
          BOOL v48 = 0;
        }

        *((_BYTE *)obj + 20_Block_object_dispose(va, 8) = v48;
        uint64_t v174 = BKLogTouchEvents(0LL, v44);
        v214 = v174;
        if (os_log_type_enabled(v214, OS_LOG_TYPE_DEFAULT))
        {
          id v175 = [*(id *)(v223 + 8) senderID];
          __int128 v176 = [obj[4] reasons];
          __int128 v177 = [BSDescriptionStream descriptionForRootObject:v176];
          int v178 = *((unsigned __int8 *)obj + 208);
          LODWORD(buf[0]) = 134218754;
          *(void *)((char *)buf + 4) = v175;
          WORD2(buf[1]) = 2114;
          *(void *)((char *)&buf[1] + 6) = v177;
          HIWORD(buf[2]) = 1024;
          LODWORD(buf[3]) = v43;
          WORD2(buf[3]) = 1024;
          *(_DWORD *)((char *)&buf[3] + 6) = v178;
          _os_log_impl( (void *)&_mh_execute_header,  v214,  OS_LOG_TYPE_DEFAULT,  "%llX ignoring touch event (%{public}@) prevHadTouches:%{BOOL}u nowHasTouches:%{BOOL}u",  (uint8_t *)buf,  0x22u);
        }

LABEL_251:
        goto LABEL_252;
      }
    }

    *((_BYTE *)obj + 206) = IOHIDEventGetIntegerValue(a2, 720921LL) != 0;
    *((_BYTE *)obj + 207) = IOHIDEventGetIntegerValue(a2, 4LL) != 0;
    id v100 = sub_1000594E8((uint64_t)obj, (uint64_t)a2, v230);
    os_log_s *v214 = v100;
    int v101 = sub_1000694C0((uint64_t)obj[3], (uint64_t)a2, v214, obj[22], obj[15], obj[16]);
    uint64_t v102 = v101;
    if (v102 && *(_BYTE *)(v102 + 8)) {
      obj[12] = *(id *)(v102 + 16);
    }
    uint64_t v215 = v102;
    objc_storeStrong((id *)locationa, v214);
    int v103 = (void *)[SLGLog sharedInstance];
    unsigned int v104 = [v103 isEnabled];

    if (v104) {
      sub_10002A858(obj, (uint64_t)a2);
    }
    __int128 v250 = 0u;
    __int128 v251 = 0u;
    __int128 v248 = 0u;
    __int128 v249 = 0u;
    double v105 = v230;
    int v106 = 0;
    v107 = [v105 countByEnumeratingWithState:v248 objects:v280 count:16];
    if (v107)
    {
      uint64_t v108 = *(void *)v249;
      do
      {
        for (m = 0LL; m != v107; m = (char *)m + 1)
        {
          if (*(void *)v249 != v108) {
            objc_enumerationMutation(v105);
          }
          uint64_t v110 = [v248 objectAtIndex:m];
          if (*(void *)(v110 + 32) == 2LL) {
            v106 |= *(_BYTE *)(v110 + 296) == 0;
          }
        }

        [v105 enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
    v280[idx] = obj;
}];
      }

      while (v107);
    }

    __int128 v246 = 0u;
    __int128 v247 = 0u;
    __int128 v244 = 0u;
    __int128 v245 = 0u;
    id v111 = *locationa;
    id v112 = [v111 countByEnumeratingWithState:v244 objects:v277 count:16];
    if (v112)
    {
      int v225 = 0;
      uint64_t v113 = *(void *)v245;
      do
      {
        for (n = 0LL; n != v112; n = (char *)n + 1)
        {
          if (*(void *)v245 != v113) {
            objc_enumerationMutation(v111);
          }
          uint64_t v115 = *(void *)(*((void *)&v244 + 1) + 8LL * (void)n);
          if (*(void *)(v115 + 32) == 2LL) {
            v225 |= *(_BYTE *)(v115 + 296) == 0;
          }
        }

        id v112 = [v111 countByEnumeratingWithState:v244 objects:v277 count:16];
      }

      while (v112);
    }

    else
    {
      int v225 = 0;
    }

    char v243 = 0;
    int aSelector = v225 & (v106 ^ 1);
    if ((aSelector & 1) != 0 || ((v225 ^ 1) & 1) != 0)
    {
      uint64_t v123 = BKLogTouchEvents(v121, v122);
      os_log_s *v124 = v123;
      if (os_log_type_enabled(v124, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf[0]) = 67109376;
        HIDWORD(buf[0]) = aSelector & 1;
        LOWORD(buf[1]) = 1024;
        *(_DWORD *)((char *)&buf[1] + 2) = (v225 ^ 1) & 1;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v124,  OS_LOG_TYPE_DEBUG,  "touchstreams: start sending isFirstDown:%{BOOL}u lifted:%{BOOL}u",  (uint8_t *)buf,  0xEu);
      }
    }

    unsigned __int8 v254 = 0;
    unsigned int v125 = obj[5];
    if (v125) {
      unsigned int v125 = (void *)v125[3];
    }
    v213 = v125;
    BOOL v126 = sub_1000619F0((uint64_t)v213, &v243, &v254);
    BOOL v211 = v254 == 3;
    BOOL v212 = v126;
    if (v126)
    {
      __int128 v287 = 0u;
      __int128 v286 = 0u;
      __int128 v285 = 0u;
      *(_OWORD *)v284 = 0u;
      __int128 v218 = v213;
      id v127 = [v218 countByEnumeratingWithState:v284 objects:buf count:16];
      if (v127)
      {
        uint64_t v219 = *(void *)v285;
        do
        {
          id v222 = v127;
          for (iuint64_t i = 0LL; ii != v222; iuint64_t i = (char *)ii + 1)
          {
            if (*(void *)v285 != v219) {
              objc_enumerationMutation(v218);
            }
            id v129 = (id *)*(id *)(*(void *)&v284[8] + 8LL * (void)ii);
            v227 = v129;
            if (v129) {
              int v130 = *((unsigned __int8 *)v129 + 10);
            }
            else {
              int v130 = 0;
            }
            if ((aSelector & 1) != 0)
            {
              if (v130 != 1) {
                goto LABEL_162;
              }
            }

            else if (v225 & 1 | (v130 != 1))
            {
LABEL_162:
              unsigned int v131 = v129;
              if (v129)
              {
                if (*((_BYTE *)v129 + 9) && v130 == 1) {
                  goto LABEL_186;
                }
              }

              goto LABEL_167;
            }

            if (v129) {
              *((_BYTE *)v129 + 10) = 2;
            }
LABEL_167:
            if (!a2) {
              __assert_rtn( "-[BKDirectTouchState _touchStreamClient:appendPathCollectionEvent:toEventPoster:initialTouchTimestamp:]",  "BKDirectTouchState.mm",  2436,  "pathCollectionEvent");
            }
            double v133 = *((double *)obj + 21);
            NSMutableArray *v134 = [[NSMutableArray alloc] init];
            int v135 = [*(id *)(v223 + 8) displayUUID];
            if (v227)
            {
              id v136 = (unsigned int *)v227[6];
              unsigned int v137 = v136;
              if (v136) {
                uint64_t v138 = v136[2];
              }
              else {
                uint64_t v138 = 0LL;
              }
              BOOL v139 = *((_BYTE *)v227 + 9) != 0;
            }

            else
            {
              uint64_t v138 = 0LL;
              unsigned int v137 = 0LL;
              BOOL v139 = 0;
            }

            *((void *)&v258 + 1) = 0LL;
            *(void *)&__int128 v259 = 0LL;
            uint64_t Children = (const __CFArray *)IOHIDEventGetChildren(a2);
            *(void *)&__int128 v258 = Children;
            if (Children) {
              *(void *)&__int128 v259 = CFArrayGetCount(Children);
            }
            sub_10001D2B0((unint64_t)&v258);
            *(_OWORD *)v288 = v258;
            *(_OWORD *)&v288[16] = v259;
            __int128 v289 = v260;
            *(void *)&__int128 v290 = v261;
            while (1)
            {
              uint64_t v141 = v288[24];
              if (!*(void *)&v288[24]) {
                break;
              }
              int64_t v142 = v289;
              *((void *)&v289 + 1) = *(void *)&v288[24];
              *(void *)&__int128 v290 = v289;
              v143 = sub_1000456F0(*locationa, v289);
              uint64_t v144 = [v143 autorelease];
              CFIndex v145 = (id *)v144;
              if (v144 && (!v139 || !*(_BYTE *)(v144 + 296)))
              {
                float64_t FloatValue = IOHIDEventGetFloatValue(v141, 720896LL);
                float64_t v147 = IOHIDEventGetFloatValue(v141, 720897LL);
                sub_10005C38C((uint64_t)v257, (uint64_t)obj, FloatValue, v147, CGPointZero.x, CGPointZero.y);
                sub_10005EBF0((uint64_t)v255, (uint64_t)obj, (uint64_t)v257, v138, (uint64_t)v135);
                BKHitTestResultPathLocation *v148 = [[BKHitTestResultPathLocation alloc] init];
                __int128 v149 = v148;
                if (v148)
                {
                  __int128 v150 = v255[1];
                  v148->_pathLocation.locationsAreValid = v255[0];
                  v148->_pathLocation.location.double y = v150;
                  v148->_pathLocation.hitTestLocation.double y = v255[2];
                  v148->_pathLocation.preciseLocation.double y = v256;
                  v148->_pathIndedouble x = v142;
                  v148->_contextRelationship = 0LL;
                }

                [v134 addObject:v148];
                [v145[35] addObject:v137];
              }

              sub_10001D2B0((unint64_t)v288);
            }

            if (-[NSMutableArray count](v134, "count")) {
              sub_10005AACC(obj, (uint64_t)a2, (uint64_t)v137, (uint64_t)v217, 0, v134, v133);
            }

            unsigned int v131 = v227;
LABEL_186:
          }

          id v127 = [v218 countByEnumeratingWithState:v284 objects:buf count:16];
        }

        while (v127);
      }

      if ((aSelector & 1) != 0)
      {
        uint64_t v151 = IOHIDEventGetTimeStamp(a2);
        *((double *)obj + 21) = BSMonotonicReferencedTimeFromMachTime(v151);
      }
    }

    __int128 v152 = a2;
    if (v215 && ![*(id *)(v215 + 24) count])
    {
      uint64_t v172 = BKLogTouchEvents(0LL, v153);
      os_log_s *v173 = v172;
      if (os_log_type_enabled(v173, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(buf[0]) = 0;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v173,  OS_LOG_TYPE_DEBUG,  "no events for regular clients",  (uint8_t *)buf,  2u);
      }

      sub_100057454((uint64_t)obj);
    }

    else
    {
      if ((v212 & aSelector) == 1)
      {
        uint64_t v154 = (void *)[*(id *)(v223 + 8) displayUUID];
        __int128 v260 = 0u;
        __int128 v261 = 0u;
        __int128 v258 = 0u;
        __int128 v259 = 0u;
        uint64_t v155 = sub_100005584((id *)obj[5]);
        __int128 v156 = (void *)[v155 autorelease];
        id v157 = [v156 countByEnumeratingWithState:v258 objects:buf count:16];
        if (v157)
        {
          uint64_t v158 = *(void *)v259;
LABEL_199:
          uint64_t v159 = 0LL;
          while (1)
          {
            if (*(void *)v259 != v158) {
              objc_enumerationMutation(v156);
            }
            v160 = v258[v159];
            if (v157 == (id)++v159)
            {
              id v157 = [v156 countByEnumeratingWithState:v258 objects:buf count:16];
              if (v157) {
                goto LABEL_199;
              }
              goto LABEL_206;
            }
          }
        }

        else
        {
LABEL_206:

          double v161 = *((double *)obj + 20);
          uint64_t v162 = IOHIDEventGetTimeStamp(a2);
          if (v161 >= BSMonotonicReferencedTimeFromMachTime(v162))
          {
            uint64_t v179 = BKLogTouchEvents(v163, v164);
            __int128 v156 = v179;
            if (os_log_type_enabled((os_log_t)v156, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)v284 = 138543362;
              *(void *)&v284[4] = v154;
              _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)v156,  OS_LOG_TYPE_DEBUG,  "Assuming system gestures are not possible (lost race with SpringBoard) (%{public}@)",  v284,  0xCu);
            }
          }

          else
          {
            uint64_t v165 = BKLogTouchEvents(v163, v164);
            v166 = os_log_s;
            if (os_log_type_enabled(v166, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)v284 = 138543362;
              *(void *)&v284[4] = v154;
              _os_log_debug_impl( (void *)&_mh_execute_header,  v166,  OS_LOG_TYPE_DEBUG,  "Assuming system gestures are possible (%{public}@)",  v284,  0xCu);
            }

            char v243 = 1;
            __int128 v289 = 0u;
            __int128 v290 = 0u;
            memset(v288, 0, sizeof(v288));
            unsigned int v167 = obj[5];
            if (v167) {
              unsigned int v167 = (void *)v167[3];
            }
            __int128 v156 = v167;
            id v168 = [v156 countByEnumeratingWithState:v288 objects:v284 count:16];
            if (v168)
            {
              uint64_t v169 = v288[16];
              do
              {
                for (juint64_t j = 0LL; jj != v168; juint64_t j = (char *)jj + 1)
                {
                  if (**(void **)&v288[16] != v169) {
                    objc_enumerationMutation(v156);
                  }
                  uint64_t v171 = *(void *)(*(void *)&v288[8] + 8LL * (void)jj);
                  if (v171 && *(_BYTE *)(v171 + 9)) {
                    *(_BYTE *)(v171 + 11) = 1;
                  }
                }

                id v168 = [v156 countByEnumeratingWithState:v288 objects:v284 count:16];
              }

              while (v168);
            }
          }
        }

        __int128 v152 = a2;
      }

      *(void *)&__int128 v258 = _NSConcreteStackBlock;
      *((void *)&v258 + 1) = 3221225472LL;
      *(void *)&__int128 v259 = sub_10005E78C;
      *((void *)&v259 + 1) = &unk_1000B7868;
      *(void *)&__int128 v260 = obj;
      *((void *)&v260 + 1) = v217;
      *(void *)&__int128 v261 = v152;
      BYTE8(v261) = v243;
      BYTE9(v261) = v211;
      sub_100007D60((void *)v215, (uint64_t)&v258);
      __int128 v287 = 0u;
      __int128 v286 = 0u;
      __int128 v285 = 0u;
      *(_OWORD *)v284 = 0u;
      __int128 v180 = *locationa;
      id v181 = [v180 countByEnumeratingWithState:v284 objects:buf count:16];
      if (v181)
      {
        uint64_t v182 = *(void *)v285;
        do
        {
          for (kk = 0LL; kk != v181; kk = (char *)kk + 1)
          {
            if (*(void *)v285 != v182) {
              objc_enumerationMutation(v180);
            }
            uint64_t v184 = *(void *)(*(void *)&v284[8] + 8LL * (void)kk);
            if (*(void *)(v184 + 32) == 1LL && *(_BYTE *)(v184 + 296))
            {
              *(_BYTE *)(v184 + 296) = 0;
              *(void *)(v184 + 160) = 0LL;
              *(void *)(v184 + 16_Block_object_dispose(va, 8) = 0LL;
              *(_DWORD *)(v184 + 20) = 0;
            }
          }

          id v181 = [v180 countByEnumeratingWithState:v284 objects:buf count:16];
        }

        while (v181);
      }

      sub_100057454((uint64_t)obj);
      uint64_t v187 = BKLogTouchEvents(v185, v186);
      os_log_s *v188 = [v187 autorelease];
      BOOL v189 = os_log_type_enabled(v188, OS_LOG_TYPE_DEBUG);

      if (v189)
      {
        if (v216)
        {
          uint64_t v192 = BKLogTouchEvents(v190, v191);
          os_log_s *v193 = [v192 autorelease];
          if (os_log_type_enabled(v193, OS_LOG_TYPE_DEBUG))
          {
            id v194 = [*(id *)(v223 + 8) senderID];
            __int128 v195 = [BSDescriptionStream descriptionForRootObject:locationa];
            *(_DWORD *)v288 = 134218498;
            *(void *)&v288[4] = v194;
            *(_WORD *)&v288[12] = 2114;
            *(void *)&v288[14] = v216;
            *(_WORD *)&v288[22] = 2114;
            *(void *)&v288[24] = v195;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v193,  OS_LOG_TYPE_DEBUG,  "digitizer:%llX - display:%{public}@ - %{public}@",  v288,  0x20u);
          }
        }

        else
        {
          uint64_t v196 = BKLogTouchEvents(v190, v191);
          os_log_s *v193 = [v196 autorelease];
          if (os_log_type_enabled(v193, OS_LOG_TYPE_DEBUG))
          {
            id v201 = [*(id *)(v223 + 8) senderID];
            __int128 v202 = [BSDescriptionStream descriptionForRootObject:locationa];
            *(_DWORD *)v288 = 134218242;
            *(void *)&v288[4] = v201;
            *(_WORD *)&v288[12] = 2114;
            *(void *)&v288[14] = v202;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v193,  OS_LOG_TYPE_DEBUG,  "contacts:%llX - %{public}@",  v288,  0x16u);
          }
        }
      }
    }

    goto LABEL_251;
  }

LABEL_252:
  sub_10005A990(v253);
LABEL_253:
  __int128 v237 = 0u;
  __int128 v238 = 0u;
  __int128 v235 = 0u;
  __int128 v236 = 0u;
  id v197 = *(id *)(v223 + 72);
  id v198 = [v197 countByEnumeratingWithState:v235 objects:v262 count:16];
  if (v198)
  {
    uint64_t v199 = *(void *)v236;
    do
    {
      for (mm = 0LL; mm != v198; mm = (char *)mm + 1)
      {
        if (*(void *)v236 != v199) {
          objc_enumerationMutation(v197);
        }
        [*(id *)(*((void *)&v235 + 1) + 8 * (void)mm) touchDidFinishProcessingTouchCollection];
      }

      id v198 = [v197 countByEnumeratingWithState:v235 objects:v262 count:16];
    }

    while (v198);
  }
}

void sub_10005E428( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, void *a24)
{
  _Unwind_Resume(a1);
}

void sub_10005E78C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a2) {
    uint64_t v7 = *(unsigned int *)(a2 + 8);
  }
  else {
    uint64_t v7 = 0LL;
  }
  id v8 = [*(id *)(*(void *)(a1 + 32) + 56) shouldCancelTouchesDeliveredToContextId:v7 withInitialTouchTimestamp:*(double *)(*(void *)(a1 + 32) + 96)];
  if ((_DWORD)v8)
  {
    id v10 = [*(id *)(*(void *)(a1 + 32) + 128) objectForKey:v7];
    if ((uint64_t)[v10 count] >= 1)
    {
      uint64_t v11 = BKLogTouchDeliveryPolicy();
      unsigned int v12 = [v11 autorelease];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        int v19 = 67109120;
        int v20 = v7;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "TDPS said this context should cancel: %X",  (uint8_t *)&v19,  8u);
      }

      uint64_t v14 = *(id **)(a1 + 32);
      uint64_t v13 = *(void *)(a1 + 40);
      uint64_t IntegerValue = IOHIDEventGetIntegerValue(*(void *)(a1 + 48), 720923LL);
      sub_100057CE8(v14, a2, v13, IntegerValue);
    }
  }

  else if (a2)
  {
    int v16 = *(unsigned __int8 *)(a1 + 56);
    sub_10005AACC( *(void **)(a1 + 32),  *(void *)(a1 + 48),  a2,  *(void *)(a1 + 40),  v16 == 1,  a4,  *(double *)(*(void *)(a1 + 32) + 96LL));
    if (v16 == 1 || *(_BYTE *)(a1 + 57))
    {
      if (v16 == 1) {
        sub_10005B9C4(*(void *)(a1 + 32), a2);
      }
    }

    else if ([*(id *)(*(void *)(a1 + 32) + 144) containsObject:a2])
    {
      sub_10005EA00(*(id **)(a1 + 32), a2, 0LL);
    }
  }

  else
  {
    uint64_t v17 = BKLogTouchEvents(v8, v9);
    uint64_t v18 = (os_log_s *)[v17 autorelease];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      int v19 = 67109120;
      int v20 = v7;
      _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "Missing destination for hit tested context: %X -- ignoring event",  (uint8_t *)&v19,  8u);
    }
  }

void sub_10005E9E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10005EA00(id *a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    uint64_t v6 = BKLogTouchEvents(a1, a2);
    uint64_t v7 = [v6 autorelease];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      if (a2) {
        int v13 = *(_DWORD *)(a2 + 8);
      }
      else {
        int v13 = 0;
      }
      *(_DWORD *)buf = 67109120;
      int v15 = v13;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "SGP: Sending no longer possible to latent client: %x",  buf,  8u);
    }

    [a1[18] removeObject:a2];
    uint64_t v8 = mach_absolute_time();
    uint64_t v9 = a1;
    uint64_t DigitizerEvent = (const void *)IOHIDEventCreateDigitizerEvent( 0LL,  v8,  3LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  0.0,  0.0,  0.0,  0.0,  0x4400000000LL);
    id v11 = v9[1];
    IOHIDEventSetSenderID(DigitizerEvent, [v11 senderID]);

    IOHIDEventSetIntegerValue(DigitizerEvent, 720921LL, *((unsigned __int8 *)v9 + 206));
    IOHIDEventSetIntegerValue(DigitizerEvent, 4LL, *((unsigned __int8 *)v9 + 207));

    BKSHIDEventDigitizerAttributes *v12 = [[BKSHIDEventDigitizerAttributes alloc] init];
    [v12 setSystemGestureStateChange:1];
    [v12 setTouchStreamIdentifier:a3];
    sub_100056E14((uint64_t)v9, (uint64_t)DigitizerEvent, v12, a2, *((double *)v9 + 12));
    CFRelease(DigitizerEvent);
  }

void sub_10005EBC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double sub_10005EBF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!a2)
  {
    *(void *)(a1 + 4_Block_object_dispose(va, 8) = 0LL;
    *(void *)&__int128 v17 = 0LL;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)a1 = 0u;
    return *(double *)&v17;
  }

  *(_WORD *)a1 = 0;
  int64x2_t v10 = vdupq_n_s64(0xC197D783FC000000LL);
  *(int64x2_t *)(a1 + _Block_object_dispose(va, 8) = v10;
  id v11 = (__int128 *)(a1 + 8);
  *(int64x2_t *)(a1 + 24) = v10;
  id v12 = (__int128 *)(a1 + 24);
  *(_BYTE *)(a1 + 2) = 0;
  *(int64x2_t *)(a1 + 40) = v10;
  *(double *)(a1 + 24) = sub_10005ED04(a2, a5, a4, *(double *)(a3 + 24), *(double *)(a3 + 32));
  *(void *)(a1 + 32) = v13;
  int v14 = *(unsigned __int8 *)(a3 + 1);
  *(_BYTE *)(a1 + 1) = v14;
  int v15 = *(unsigned __int8 *)(a3 + 2);
  *(_BYTE *)(a1 + 2) = v15;
  if (!v14)
  {
    *id v11 = *v12;
    if (v15) {
      goto LABEL_4;
    }
LABEL_6:
    __int128 v17 = *v11;
    *(_OWORD *)(a1 + 40) = *v11;
    goto LABEL_7;
  }

  *(double *)(a1 + _Block_object_dispose(va, 8) = sub_10005ED04(a2, a5, a4, *(double *)(a3 + 8), *(double *)(a3 + 16));
  *(void *)(a1 + 16) = v16;
  if (!*(_BYTE *)(a3 + 2)) {
    goto LABEL_6;
  }
LABEL_4:
  *(double *)&__int128 v17 = sub_10005ED04(a2, a5, a4, *(double *)(a3 + 40), *(double *)(a3 + 48));
  *(void *)(a1 + 40) = v17;
  *(void *)(a1 + 4_Block_object_dispose(va, 8) = v18;
LABEL_7:
  *(_BYTE *)a1 = 1;
  return *(double *)&v17;
}

double sub_10005ED04(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5)
{
  uint64_t v9 = *(void **)(a1 + 40);
  if (v9) {
    uint64_t v9 = (void *)v9[1];
  }
  int64x2_t v10 = v9;
  [v10 convertReferenceLocation:a2 toCAScreenLocationForDisplayUUID:a4];
  [v10 convertCAScreenLocation:a3 toContextID:a2];
  double v12 = v11;

  return v12;
}

void sub_10005ED84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BKHitTestResultPathLocation *sub_10005ED94( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int64_t a5)
{
  BKHitTestResultPathLocation *v7 = [[BKHitTestResultPathLocation alloc] init];
  if (v7)
  {
    int64_t v8 = *(void *)(a2 + 8);
    __int128 v9 = v11[1];
    v7->_pathLocation.locationsAreValid = v11[0];
    v7->_pathLocation.location.double y = v9;
    v7->_pathLocation.hitTestLocation.double y = v11[2];
    v7->_pathLocation.preciseLocation.double y = v12;
    v7->_pathIndedouble x = v8;
    v7->_contextRelationship = a5;
  }

  return v7;
}

uint64_t sub_10005EE0C(uint64_t a1, uint64_t a2)
{
  if (*(_BYTE *)(a2 + 296))
  {
    uint64_t v3 = BKLogTouchEvents(a1, a2);
    os_log_s *v4 = v3;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = *(_DWORD *)(a2 + 16);
      int v18 = 67109120;
      int v19 = v5;
      uint64_t v6 = "transfer: touch %X detached";
LABEL_14:
      int v15 = v4;
      uint32_t v16 = 8;
      goto LABEL_15;
    }
  }

  else if (*(_BYTE *)(a2 + 297))
  {
    uint64_t v7 = BKLogTouchEvents(a1, a2);
    os_log_s *v4 = v7;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v17 = *(_DWORD *)(a2 + 16);
      int v18 = 67109120;
      int v19 = v17;
      uint64_t v6 = "transfer: touch %X already transferred once";
      goto LABEL_14;
    }
  }

  else
  {
    if (!*(void *)(a1 + 32)) {
      return 1LL;
    }
    [*(id *)(a2 + 280) containsObject:];
    if (!(_DWORD)v10) {
      return 1LL;
    }
    uint64_t v12 = BKLogTouchEvents(v10, v11);
    os_log_s *v4 = [v12 autorelease];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v13 = *(_DWORD *)(a2 + 16);
      int v14 = *(_DWORD *)(a1 + 40);
      int v18 = 67109376;
      int v19 = v13;
      __int16 v20 = 1024;
      int v21 = v14;
      uint64_t v6 = "transfer: touch %X already in contextID:%X";
      int v15 = v4;
      uint32_t v16 = 14;
LABEL_15:
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, v6, (uint8_t *)&v18, v16);
    }
  }

  return 0LL;
}

id sub_10005EF90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    uint64_t v6 = a2;
    uint64_t v7 = (void *)[*(id *)(a1 + 120) objectForKey:a2];
    if (!v7)
    {
      int64_t v8 = [BKTouchDestination initWithPid:a2 uid:a3];
      uint64_t v7 = [v8 autorelease];
      [*(id *)(a1 + 120) setObject:v7 forKey:v6];
    }
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  return v7;
}

void sub_10005F024(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

int64_t sub_10005F034(id a1, BKTouchContact *a2, BKTouchContact *a3)
{
  pathIndedouble x = a2->_pathIndex;
  int64_t v4 = a3->_pathIndex;
  BOOL v5 = pathIndex <= v4;
  if (pathIndex >= v4) {
    int64_t v6 = 0LL;
  }
  else {
    int64_t v6 = -1LL;
  }
  if (v5) {
    return v6;
  }
  else {
    return 1LL;
  }
}

void sub_10005F04C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 succinctDescription];
  [v2 appendString:withName:];
}

void sub_10005F094( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

id sub_10006017C(uint64_t a1, void *a2)
{
  return [a2 monitor:*(void *)(a1 + 32) displayDidBecomeActive:*(void *)(a1 + 40)];
}

id sub_100060188(uint64_t a1, void *a2)
{
  return [a2 monitor:*(void *)(a1 + 32) activeDisplayPropertiesDidChange:*(void *)(a1 + 40)];
}

id sub_100060194(uint64_t a1, void *a2)
{
  return [a2 monitor:*(void *)(a1 + 32) displayDidBecomeInactive:*(void *)(a1 + 40)];
}

void sub_1000601E0(id a1)
{
  BKSharedCADisplayProvider *v1 = [[BKSharedCADisplayProvider alloc] init];
  uint64_t v2 = (void *)qword_1000DC208;
  qword_1000DC208 = (uint64_t)v1;
}

void sub_10006145C(uint64_t a1, void *a2, void *a3)
{
  int64_t v4 = *(void **)(*(void *)(a1 + 32) + 48LL);
  id v5 = a2;
  id v6 = [NSNumber numberWithUnsignedInt:a3.displayId];
  [v4 setObject:v5 forKey:v6];
}

id sub_1000614D4(id a1, CADisplay *a2)
{
  return [CADisplay immutableCopy];
}

void sub_1000614EC(uint64_t a1, void *a2, void *a3)
{
  int64_t v4 = *(void **)(*(void *)(a1 + 32) + 48LL);
  id v5 = a2;
  id v6 = [NSNumber numberWithUnsignedInt:[a3 displayId]];
  [v4 setObject:v5 forKey:v6];
}

void sub_100061564(id a1)
{
  if (!qword_1000DC210)
  {
    BKWatchdogService *v1 = [[BKWatchdogService alloc] init];
    uint64_t v2 = (void *)qword_1000DC210;
    qword_1000DC210 = (uint64_t)v1;
  }

uint64_t sub_1000615A8(uint64_t a1)
{
  return mach_port_mod_refs(mach_task_self_, *(_DWORD *)(a1 + 32), 1u, -1);
}

uint64_t sub_1000615C8(uint64_t a1)
{
  return dispatch_mig_server(*(void *)(a1 + 32), 40LL, sub_10007A3C4);
}

id sub_1000619C0(uint64_t a1)
{
  return  [*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 8) withName:@"displayUUID"];
}

BOOL sub_1000619F0(uint64_t a1, _BYTE *a2, unsigned __int8 *a3)
{
  if (!a1) {
    return 0LL;
  }
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v5 = *(id *)(a1 + 16);
  id v6 = [v5 countByEnumeratingWithState:v18 objects:v22 count:16];
  BOOL v7 = v6 != 0LL;
  if (v6)
  {
    id v8 = v6;
    unsigned __int8 v9 = 0;
    int v10 = 0;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0LL; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v5);
        }
        int v13 = [v18 objectAtIndex:i];
        if (v13)
        {
          if (v13[9])
          {
            int v14 = v13[11];
            int v15 = (v10 | 2) == 2 ? v13[11] : v10;
            if (v14 != v10 && v14 != 0) {
              int v10 = v15;
            }
          }

          LODWORD(v13) = v13[10];
        }
      }

      id v8 = [v5 countByEnumeratingWithState:v18 objects:v22 count:16];
    }

    while (v8);
  }

  else
  {
    unsigned __int8 v9 = 0;
    LOBYTE(v10) = 0;
  }

  *a2 = v10;
  *a3 = v9;
  return v7;
}

void sub_100061FAC(_Unwind_Exception *a1)
{
}

void sub_100062534(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1)
  {
    uint64_t v2 = *(void *)(a1 + 40);
    uint64_t v3 = *(void **)(v2 + 32);
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_1000625C0;
    v4[3] = &unk_1000B8030;
    void v4[4] = v2;
    id v5 = v1;
    [v3 terminateAlternateSystemApp:v5 forReason:0 andReport:0 withDescription:0 completion:v4];
  }

void sub_1000625C0(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 16) remoteObjectProxy];
  [v2 alternateSystemAppWithBundleIDDidTerminate:*(void *)(a1 + 40)];

  uint64_t v4 = BKLogAlternateSystemApp(v3);
  os_log_s *v5 = [v4 autorelease];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = 138543362;
    uint64_t v8 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[Server] Sent notification that alternate system app %{public}@ did terminate",  (uint8_t *)&v7,  0xCu);
  }
}

void sub_100062684(uint64_t a1)
{
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  void v16[2] = sub_1000627C8;
  void v16[3] = &unk_1000B7BA8;
  uint64_t v2 = *(void **)(a1 + 40);
  v16[4] = *(void *)(a1 + 32);
  id v17 = v2;
  uint64_t v3 = objc_retainBlock(v16);
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5)
  {
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 32LL);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000628CC;
    v13[3] = &unk_1000B7BD0;
    int v7 = v3;
    uint64_t v8 = *(void *)(a1 + 32);
    unsigned __int8 v9 = *(void **)(a1 + 40);
    id v15 = v7;
    void v13[4] = v8;
    id v14 = v9;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    _OWORD v11[2] = sub_1000629C4;
    _OWORD v11[3] = &unk_1000B7BF8;
    int v10 = *(void **)(a1 + 40);
    v11[4] = *(void *)(a1 + 32);
    id v12 = v10;
    [v6 openAlternateSystemApp:v5 options:0 withResult:v13 andExitBlock:v11];
  }

  else
  {
    ((void (*)(void *, uint64_t))v3[2])(v3, 2LL);
  }
}

void sub_1000627C8(uint64_t a1, unsigned int a2)
{
  NSError *v3 = [NSError errorWithDomain:@"com.apple.backboardd.altsysapp" code:a2 userInfo:nil];
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 16) remoteObjectProxy];
  [v4 alternateSystemAppWithBundleID:*(void *)(a1 + 40) failedToOpenWithResult:v3];

  uint64_t v6 = BKLogAlternateSystemApp(v5);
  int v7 = (os_log_s *)v6;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 40);
    int v9 = 138543618;
    uint64_t v10 = v8;
    __int16 v11 = 2114;
    id v12 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[Server] Sent notification that alternate system app %{public}@ failed to open with error %{public}@",  (uint8_t *)&v9,  0x16u);
  }
}

void sub_1000628CC(void *a1, int a2)
{
  if (a2)
  {
    (*(void (**)(void))(a1[6] + 16LL))();
  }

  else
  {
    uint64_t v3 = (void *)[*(id *)(a1[4] + 16) remoteObjectProxy];
    [v3 alternateSystemAppWithBundleIDDidOpen:a1[5]];

    uint64_t v5 = BKLogAlternateSystemApp(v4);
    uint64_t v6 = [v5 autorelease];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = a1[5];
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[Server] Sent notification that alternate system app %{public}@ did open",  (uint8_t *)&v8,  0xCu);
    }
  }

void sub_1000629C4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 16) remoteObjectProxy];
  [v4 alternateSystemAppWithBundleID:*(void *)(a1 + 40) didExitWithContext:v3];

  uint64_t v6 = BKLogAlternateSystemApp(v5);
  uint64_t v7 = [v6 autorelease];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 40);
    int v9 = 138543618;
    uint64_t v10 = v8;
    __int16 v11 = 2114;
    id v12 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[Server] Sent notification that alternate system app %{public}@ did exit with reason %{public}@",  (uint8_t *)&v9,  0x16u);
  }
}

id sub_100062AAC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 32);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  _DWORD v5[2] = sub_100062B1C;
  v5[3] = &unk_1000B8058;
  void v5[4] = v2;
  return [v3 unblockSystemAppForAlternateSystemAppWithCompletion:v5];
}

void sub_100062B1C(uint64_t a1)
{
  uint64_t v1 = [*(id *)(*(void *)(a1 + 32) + 16) remoteObjectProxy];
  [v1 didUnblockSystemAppForAlternateSystemApp];

  uint64_t v3 = BKLogAlternateSystemApp(v2);
  uint64_t v4 = [v3];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[Server] Sent notification that system app is no longer blocked for alternate system app",  v5,  2u);
  }
}

id sub_100062B9C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100062BF4;
  v4[3] = &unk_1000B8058;
  void v4[4] = v1;
  return [v2 blockSystemAppForAlternateSystemAppWithCompletion:v4];
}

void sub_100062BF4(uint64_t a1)
{
  uint64_t v1 = [*(id *)(*(void *)(a1 + 32) + 16) remoteObjectProxy];
  [v1 didBlockSystemAppForAlternateSystemApp];

  uint64_t v3 = BKLogAlternateSystemApp(v2);
  uint64_t v4 = v3;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[Server] Sent notification that system app is blocked for alternate system app",  v5,  2u);
  }
}

id sub_100062C74(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) _queue_listener:*(void *)(a1 + 40) shouldAcceptNewConnection:*(void *)(a1 + 48)];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = (_BYTE)result;
  return result;
}

void sub_100062CA8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleInterruptedOrInvalidatedConnection];
}

void sub_100062CD4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleInterruptedOrInvalidatedConnection];
}

id sub_100062D00(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) unblockSystemAppForAlternateSystemAppWithCompletion:0];
}

void sub_100062D80(id a1)
{
  BKAlternateSystemAppServer *v1 = [[BKAlternateSystemAppServer alloc] init];
  uint64_t v2 = (void *)qword_1000DC220;
  qword_1000DC220 = (uint64_t)v1;
}

id sub_100063154(uint64_t a1, void *a2)
{
  return [a2 appendSuccinctDescriptionToFormatter:*(void *)(a1 + 32)];
}

void sub_100063160(uint64_t a1, void *a2)
{
  if (a1)
  {
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    __int128 v10 = 0u;
    __int128 v11 = 0u;
    uint64_t v3 = (id *)(a1 + 288);
    id v4 = *(id *)(a1 + 288);
    id v5 = [v4 countByEnumeratingWithState:v10 objects:v14 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0LL;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v10 + 1) + 8LL * (void)v8);
          if (v9) {
            [*(id *)(v9 + 24) removeObject:v3];
          }
          uint64_t v8 = (char *)v8 + 1;
        }

        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:v10 objects:v14 count:16];
      }

      while (v6);
    }

    objc_storeStrong(v3, a2);
  }

void sub_1000638B0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

LABEL_10:
      [v16 addObject:@"setInitialLevel"];
      goto LABEL_11;
    }

LABEL_31:
  os_unfair_lock_unlock(p_lock);
}

void sub_100064604(uint64_t a1)
{
  if (a1)
  {
    os_unfair_lock_assert_owner((os_unfair_lock_t)(a1 + 8));
    uint64_t v12 = 0LL;
    __int128 v13 = &v12;
    uint64_t v14 = 0x3032000000LL;
    id v15 = sub_1000647DC;
    uint32_t v16 = sub_1000647EC;
    BKSBacklightFeatures *v17 = [[BKSBacklightFeatures alloc] init];
    uint64_t v2 = *(void **)(a1 + 88);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    _OWORD v11[2] = sub_1000647F4;
    _OWORD v11[3] = &unk_1000B7CA8;
    v11[4] = a1;
    void v11[5] = &v12;
    [v2 enumerateWithBlock:v11];
    NSMutableDictionary *v3 = [[NSMutableDictionary alloc] init];
    id v4 = (void *)v13[5];
    if (v4) {
      id v5 = [v4 disableFeatures];
    }
    else {
      id v5 = 0LL;
    }
    id v6 = [NSNumber numberWithInt:v5];
    [v3 setObject:v6 forKeyedSubscript:@"Status"];

    [(id)v13[5] fixedBrightnessNitsWhileDisabled];
    if (v7 >= 0.0)
    {
      uint64_t v8 = (void *)[NSNumber numberWithDouble:v7];
      [v3 setObject:v8 forKey:@"FixBrightnessNits"];
    }

    [(id)v13[5] fixedBrightnessLevelWhileDisabled];
    if (v9 >= 0.0)
    {
      NSNumber *v10 = [NSNumber numberWithDouble:v9];
      [v3 setObject:v10 forKey:@"FixBrightness"];
    }

    sub_1000649CC(a1, v3, @"CoreBrightnessFeaturesDisabled");

    _Block_object_dispose(&v12, 8);
  }

void sub_1000647B8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t sub_1000647DC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000647EC(uint64_t a1)
{
}

void sub_1000647F4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && (id v6 = *(id *)(v4 + 62)) != 0LL)
  {
    id v7 = v6;
    if ([v6 disableFeatures]
      && ([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) disableFeatures] & 1) == 0)
    {
      goto LABEL_24;
    }

    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) fixedBrightnessNitsWhileDisabled];
    float v9 = v8;
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) fixedBrightnessLevelWhileDisabled];
    float v11 = v10;
    [v7 fixedBrightnessNitsWhileDisabled];
    float v13 = v12;
    id v14 = [v7 fixedBrightnessLevelWhileDisabled];
    if (v9 < 0.0 && v11 < 0.0 && (v13 >= 0.0 || v16 >= 0.0)) {
      goto LABEL_24;
    }
    if ((v11 >= 0.0 || v16 < 0.0)
      && (v11 >= 0.0 ? (BOOL v17 = v16 <= v11) : (BOOL v17 = 1), v17 && (v9 >= 0.0 ? (v18 = v13 <= v9) : (v18 = 1), v18)))
    {
      uint64_t v19 = BKLogBacklight(v14, v15);
      os_log_s *v20 = [v19 autorelease];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
        uint64_t v22 = *(void *)(*(void *)(a1 + 32) + 88LL);
        int v27 = 138543618;
        uint64_t v28 = v21;
        __int16 v29 = 2114;
        uint64_t v30 = v22;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "effective backlight features:%{public}@ clients:(%{public}@)",  (uint8_t *)&v27,  0x16u);
      }
    }

    else
    {
LABEL_24:
      uint64_t v23 = *(void *)(*(void *)(a1 + 40) + 8LL);
      uint64_t v24 = *(void **)(v23 + 40);
      *(void *)(v23 + 40) = v7;
      id v7 = v7;
    }
  }

  else
  {
    uint64_t v25 = *(void *)(*(void *)(a1 + 40) + 8LL);
    uint64_t v26 = *(void **)(v25 + 40);
    *(void *)(v25 + 40) = 0LL;
  }
}

void sub_1000649CC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    uint64_t v7 = BKLogBacklight();
    float v8 = [v7 autorelease];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      float v9 = [BSDescriptionStream descriptionForRootObject:v5];
      int v10 = 138543618;
      id v11 = v6;
      __int16 v12 = 2114;
      float v13 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Set BrightnessSystem property:%{public}@ to:%{public}@",  (uint8_t *)&v10,  0x16u);
    }

    [*(id *)(a1 + 96) setProperty:v5 forKey:v6];
  }
}

void sub_100064AD4(uint64_t a1, uint64_t a2, int a3)
{
  if (a1 && (*(_DWORD *)(a1 + 16) != (_DWORD)a2 || !*(_BYTE *)(a1 + 80)))
  {
    *(_DWORD *)(a1 + 16) = a2;
    *(_BYTE *)(a1 + 80) = 1;
    id v5 = *(void **)(a1 + 96);
    id v6 = [NSNumber numberWithUnsignedInt:a2];
    [v5 setProperty:v6 forKey:@"BrightnessCurveLevel"];

    if (a3)
    {
      id v7 = [BKSDefaults localDefaults];
      [v7 setBrightnessCurve:a2];
    }
  }

void sub_100064B94(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  id v7 = v5;
  if (WeakRetained)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100064C54;
    block[3] = &unk_1000B8030;
    id v10 = v7;
    id v11 = WeakRetained;
    dispatch_async(&_dispatch_main_q, block);
  }
}

void sub_100064C54(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = [NSDictionary class];
  id v5 = v3;
  id v6 = v5;
  if (v4)
  {
    if ((objc_opt_isKindOfClass(v5, v4) & 1) != 0) {
      id v7 = v6;
    }
    else {
      id v7 = 0LL;
    }
  }

  else
  {
    id v7 = 0LL;
  }

  id v8 = v7;

  if (v8)
  {
    float v9 = [v8 objectForKey:@"Brightness"];
    uint64_t v11 = [NSNumber class];
    id v12 = v9;
    float v13 = v12;
    if (v11 && (objc_opt_isKindOfClass(v12, v11) & 1) != 0)
    {

      if (v13)
      {
        [v13 floatValue];
        [*(id *)(a1 + 40) setBrightnessLevel:@"BrightnessSystemDidChange" reason:4 options:nil];

        goto LABEL_16;
      }
    }

    else
    {
    }
  }

  uint64_t v14 = BKLogBacklight();
  uint64_t v15 = [v14 autorelease];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    int v16 = 138543362;
    id v17 = v8;
    _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "property change handler arguments seem bogus: %{public}@",  (uint8_t *)&v16,  0xCu);
  }

LABEL_16:
}

void sub_100064E08(id a1)
{
  uint64_t v1 = BKLogBacklight(a1);
  uint64_t v2 = v1;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "instantiating BrightnessSystem", v10, 2u);
  }

  BrightnessSystem *v3 = [[BrightnessSystem alloc] init];
  BKDisplayBrightnessController *v4 = [[BKDisplayBrightnessController alloc] init];
  BKSystemShellSentinel *v5 = [BKSystemShellSentinel sharedInstance];
  id v6 = sub_100065B98();
  id v7 = v6;
  BKDisplayBrightnessController *v8 = [[BKDisplayBrightnessController alloc] _initWithBrightnessSystem:v3 systemShellSentinel:v5 orientationManager:v7];
  float v9 = (void *)qword_1000DC230;
  qword_1000DC230 = (uint64_t)v8;
}

void sub_1000652FC(uint64_t a1, double a2)
{
  if (a1 && *(double *)(a1 + 40) != a2)
  {
    *(double *)(a1 + 40) = a2;
    uint64_t v4 = *(void *)(a1 + 128);
    uint64_t v5 = BKLogOrientationDevice(a1);
    os_log_s *v6 = v5;
    id v7 = v6;
    if (v4)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 134217984;
        double v11 = a2;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "setUpdateInterval:%g",  (uint8_t *)&v10,  0xCu);
      }

      double v8 = *(double *)(a1 + 40) * 1000000.0;
      float v9 = *(void **)(a1 + 128);
      id v7 = [NSNumber numberWithDouble:v8];
      [v9 setProperty:v7 forKey:@"ReportInterval"];
    }

    else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v10 = 134217984;
      double v11 = a2;
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "missing accel HID service plugin (setUpdateInterval:%g)",  (uint8_t *)&v10,  0xCu);
    }
  }

void sub_100065454(uint64_t a1, float a2)
{
  if (a1 && *(float *)(a1 + 48) != a2)
  {
    *(float *)(a1 + 4_Block_object_dispose(va, 8) = a2;
    uint64_t v4 = *(void *)(a1 + 128);
    uint64_t v5 = BKLogOrientationDevice(a1);
    id v6 = v5;
    id v7 = v6;
    if (v4)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v14 = a2;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "setInterruptEventThresholds:%g", buf, 0xCu);
      }

      LODWORD(v_Block_object_dispose(va, 8) = *(_DWORD *)(a1 + 48);
      id v7 = [NSNumber numberWithFloat:v8];
      float v9 = [NSNumber numberWithInt:20000LL];
      v11[0] = @"ThresholdX";
      v11[1] = @"ThresholdY";
      v12[0] = v7;
      v12[1] = v7;
      _OWORD v11[2] = @"ThresholdZ";
      _OWORD v11[3] = @"ThresholdPeriod";
      _DWORD v12[2] = v7;
      v12[3] = v9;
      int v10 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:4];
      [*(id *)(a1 + 128) setProperty:v10 forKey:@"Shake"];
    }

    else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      double v14 = a2;
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "missing accel HID service plugin (setInterruptEventThresholds:%g)",  buf,  0xCu);
    }
  }

void sub_100065610(void *a1)
{
  if (!a1[12])
  {
    uint64_t v2 = BKLogOrientationDevice(a1);
    uint64_t v3 = [v2 autorelease];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Resetting device orientation.", v4, 2u);
    }

    kdebug_trace(730464776LL, 0LL, 0LL, 0LL, 0LL);
    sub_1000656D0(a1, 0LL, 1);
    if (a1[7] != 1LL)
    {
      a1[7] = 1LL;
      sub_100065820((uint64_t)a1, 1LL);
    }
  }

void sub_1000656D0(void *a1, uint64_t a2, char a3)
{
  uint64_t v4 = a2;
  if (a1[11] != a2)
  {
    a1[11] = a2;
    id v6 = (dispatch_queue_s *)a1[18];
    *(void *)&__int128 v12 = _NSConcreteStackBlock;
    *((void *)&v12 + 1) = 3221225472LL;
    float v13 = sub_10006597C;
    double v14 = &unk_1000B7ED8;
    uint64_t v15 = a1;
    uint64_t v16 = a2;
    dispatch_async(v6, ^{
    v12;
});
    a2 = a1[11];
  }

  if (a2)
  {
    if (a1[7] != a2)
    {
      a1[7] = a2;
      sub_100065820((uint64_t)a1, a2);
    }

    if ((a3 & 1) != 0 || a1[10] == -1LL)
    {
      uint64_t IsValid = BSInterfaceOrientationIsValid(v4);
      if ((_DWORD)IsValid)
      {
        a1[10] = v4;
        uint64_t v8 = BKLogOrientationDevice(IsValid);
        float v9 = (os_log_s *)[v8 autorelease];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = BSInterfaceOrientationDescription(a1[10]);
          double v11 = [v10 doubleValue];
          LODWORD(v12) = 138543362;
          *(void *)((char *)&v12 + 4) = v11;
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Last effective interface orientation changed to: %{public}@",  (uint8_t *)&v12,  0xCu);
        }
      }
    }
  }

void sub_100065820(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(dispatch_queue_s **)(a1 + 144);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  _OWORD v3[2] = sub_100065878;
  v3[3] = &unk_1000B7ED8;
  void v3[4] = a1;
  void v3[5] = a2;
  dispatch_async(v2, v3);
}

void sub_100065878(uint64_t a1)
{
  uint64_t v1 = a1;
  LODWORD(a1) = dword_1000DB698;
  if (dword_1000DB698 != -1
    || (notify_register_check("com.apple.backboardd.unambiguousOrientation", &dword_1000DB698),
        a1 = dword_1000DB698,
        dword_1000DB698 != -1))
  {
    notify_set_state(a1, *(void *)(v1 + 40));
    a1 = notify_post("com.apple.backboardd.unambiguousOrientation");
  }

  uint64_t v2 = BKLogOrientationDevice(a1);
  uint64_t v3 = v2;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = BSDeviceOrientationDescription(*(void *)(*(void *)(v1 + 32) + 56LL));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    int v6 = 138543362;
    id v7 = v5;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "Last unambiguous device orientation changed to: %{public}@",  (uint8_t *)&v6,  0xCu);
  }
}

void sub_10006597C(uint64_t a1)
{
  uint64_t v1 = a1;
  LODWORD(a1) = dword_1000DB690;
  if (dword_1000DB690 != -1
    || (notify_register_check("com.apple.backboardd.orientation", &dword_1000DB690),
        a1 = dword_1000DB690,
        dword_1000DB690 != -1))
  {
    notify_set_state(a1, *(void *)(v1 + 40));
    a1 = notify_post("com.apple.backboardd.orientation");
  }

  uint64_t v2 = BKLogOrientationDevice(a1);
  uint64_t v3 = [v2];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = BSDeviceOrientationDescription(*(void *)(*(void *)(v1 + 32) + 88LL));
    uint64_t v5 = [v4 autorelease];
    int v6 = 138543362;
    id v7 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Effective device orientation changed to: %{public}@",  (uint8_t *)&v6,  0xCu);
  }
}

__CFString *sub_100065A7C(uint64_t a1)
{
  if (!a1)
  {
    int v6 = @"none";
    return v6;
  }

  uint64_t v1 = a1;
  uint64_t v2 = [NSMutableArray array];
  uint64_t v3 = v2;
  if ((v1 & 1) != 0)
  {
    [v2 addObject:@"user"];
    v1 &= ~1uLL;
    if ((v1 & 2) == 0)
    {
LABEL_4:
      if ((v1 & 4) == 0) {
        goto LABEL_5;
      }
LABEL_12:
      [v3 addObject:@"overlay"];
      v1 &= ~4uLL;
      if (!v1) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }

  else if ((v1 & 2) == 0)
  {
    goto LABEL_4;
  }

  [v3 addObject:@"system"];
  v1 &= ~2uLL;
  if ((v1 & 4) != 0) {
    goto LABEL_12;
  }
LABEL_5:
  if (v1)
  {
LABEL_6:
    uint64_t v4 = [NSNumber numberWithUnsignedInteger:v1];
    [v3 addObject:v4];
  }

id sub_100065B98()
{
  if (qword_1000DC248 != -1) {
    dispatch_once(&qword_1000DC248, &stru_1000B7CC8);
  }
  return (id)qword_1000DC240;
}

void sub_100065BDC(id a1)
{
  BKOrientationManager *v1 = [[BKOrientationManager alloc] init];
  uint64_t v2 = (void *)qword_1000DC240;
  qword_1000DC240 = (uint64_t)v1;
}

void sub_100065C04(uint64_t a1)
{
}

void sub_100065C14(uint64_t a1)
{
}

uint64_t sub_100065C24(uint64_t result)
{
  *(_BYTE *)(*(void *)(*(void *)(result + 40) + 8LL) + 24LL) = *(_BYTE *)(*(void *)(result + 32) + 52LL);
  return result;
}

void sub_100065C38(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    int v2 = *(unsigned __int8 *)(a1 + 40);
    if (*(unsigned __int8 *)(v1 + 52) != v2)
    {
      *(_BYTE *)(v1 + 52) = v2;
      uint64_t v3 = BKLogOrientationDevice(a1);
      uint64_t v4 = v3;
      BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
      if (v2)
      {
        if (v5)
        {
          LOWORD(v8[0]) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Turning on orientation events.",  (uint8_t *)v8,  2u);
        }

        kdebug_trace(730464792LL, 0LL, 0LL, 0LL, 0LL);
        uint64_t v7 = *(void *)(v1 + 112);
        int v6 = *(void **)(v1 + 120);
        v8[0] = _NSConcreteStackBlock;
        v8[1] = 3221225472LL;
        _OWORD v8[2] = sub_100065D88;
        v8[3] = &unk_1000B7D90;
        void v8[4] = v1;
        [v6 startDeviceOrientationUpdatesToQueue:v7 withHandler:v8];
        sub_100065DD4(v1);
      }

      else
      {
        if (v5)
        {
          LOWORD(v8[0]) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Turning off orientation events.",  (uint8_t *)v8,  2u);
        }

        kdebug_trace(730464796LL, 0LL, 0LL, 0LL, 0LL);
        [*(id *)(v1 + 120) stopDeviceOrientationUpdates];
        sub_100065610((void *)v1);
      }
    }
  }

void sub_100065D88(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v5 = a2;
  BSDispatchQueueAssert(v3, v4);
  sub_100065E80(*(void *)(a1 + 32), v5);
}

void sub_100065DD4(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 52))
  {
    id v4 = [*(id *)(a1 + 120) deviceOrientationBlocking];
    sub_100065E80(a1, v4);
  }

  else
  {
    uint64_t v2 = BKLogOrientationDevice(a1);
    uint64_t v3 = [v2 autorelease];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_ERROR,  "WARNING: Attempting synchronous device orientation update while events disabled!",  buf,  2u);
    }

    sub_100065F78(a1);
  }

void sub_100065E80(uint64_t a1, void *a2)
{
  if (a1)
  {
    id v3 = [a2 orientation];
    uint64_t v4 = v3;
    uint64_t v5 = BKLogOrientationDevice(v3);
    int v6 = (os_log_s *)v5;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = BSDeviceOrientationDescription(v4);
      uint64_t v8 = (void *)v7;
      int v9 = 138543362;
      uint64_t v10 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Updating device orientation from CoreMotion to: %{public}@",  (uint8_t *)&v9,  0xCu);
    }

    kdebug_trace(730464780LL, v4, 0LL, 0LL, 0LL);
    sub_100066094(a1, v4, 1LL);
  }

void sub_100065F78(uint64_t a1)
{
  if (a1)
  {
    CMDeviceOrientationManager *v2 = [[CMDeviceOrientationManager alloc] init];
    [v2 startDeviceOrientationUpdatesToQueue:^(CMDeviceOrientation orientation, NSError *error) {
    // TODO: handle error
}];
    id v3 = [CMDeviceOrientationManager deviceOrientationBlocking];
    uint64_t v4 = [CMDeviceOrientationManager stopDeviceOrientationUpdates];
    uint64_t v5 = [v4 autorelease];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = BSDeviceOrientationDescription([v3 orientation]);
      uint64_t v7 = [v6 autorelease];
      int v8 = 138543362;
      int v9 = v7;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "Fetching effective device orientation with temporary manager: %{public}@",  (uint8_t *)&v8,  0xCu);
    }

    sub_100065E80(a1, v3);
  }

void sub_100066094(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 && !*(_BYTE *)(a1 + 104))
  {
    if (*(void *)(a1 + 72) != a2)
    {
      *(void *)(a1 + 72) = a2;
      uint64_t v6 = *(dispatch_queue_s **)(a1 + 144);
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472LL;
      _DWORD v7[2] = sub_100066318;
      v7[3] = &unk_1000B7ED8;
      void v7[4] = a1;
      void v7[5] = a2;
      dispatch_async(v6, v7);
    }

    if (!*(void *)(a1 + 96)) {
      sub_1000656D0((void *)a1, a2, 1);
    }
    sub_100066158(a1, a2, a3);
  }

void sub_100066158(uint64_t a1, uint64_t a2, uint64_t a3)
{
  BOOL v6 = *(void *)(a1 + 96) != 0LL;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  uint64_t v7 = (void *)[*(id *)(a1 + 24) orderedContext];
  int v8 = (void *)[v7 array];

  id obj = v8;
  id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      __int128 v12 = 0LL;
      do
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)v12);
        double v14 = *(dispatch_queue_s **)(a1 + 16);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_1000662D0;
        block[3] = &unk_1000B7DB8;
        void block[4] = v13;
        void block[5] = a1;
        void block[6] = a2;
        block[7] = a3;
        BOOL v17 = v6;
        dispatch_async(v14, block);
        __int128 v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v10);
  }
}

uint64_t sub_1000662D0(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector( *(void *)(a1 + 32),  "orientationManager:deviceOrientationMayHaveChanged:changeSource:isDeviceOrientationLocked:");
  if ((result & 1) != 0) {
    return (uint64_t)[*(id *)(a1 + 32) orientationManager:*(void *)(a1 + 40) deviceOrientationMayHaveChanged:*(void *)(a1 + 48) changeSource:*(void *)(a1 + 56) isDeviceOrientationLocked:*(unsigned __int8 *)(a1 + 64)];
  }
  return result;
}

void sub_100066318(uint64_t a1)
{
  uint64_t v1 = a1;
  LODWORD(a1) = dword_1000DB694;
  if (dword_1000DB694 != -1
    || (notify_register_check("com.apple.backboardd.rawOrientation", &dword_1000DB694),
        a1 = dword_1000DB694,
        dword_1000DB694 != -1))
  {
    notify_set_state(a1, *(void *)(v1 + 40));
    a1 = notify_post("com.apple.backboardd.rawOrientation");
  }

  uint64_t v2 = BKLogOrientationDevice(a1);
  id v3 = (os_log_s *)v2;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = BSDeviceOrientationDescription(*(void *)(*(void *)(v1 + 32) + 72LL));
    uint64_t v5 = v4;
    int v6 = 138543362;
    uint64_t v7 = v5;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "Current raw accelerometer device orientation changed to: %{public}@",  (uint8_t *)&v6,  0xCu);
  }
}

uint64_t sub_10006641C(uint64_t a1)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v5 = 0LL;
  int v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  uint64_t v8 = 0LL;
  uint64_t v1 = *(dispatch_queue_s **)(a1 + 8);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000664B8;
  v4[3] = &unk_1000B8080;
  void v4[4] = a1;
  void v4[5] = &v5;
  dispatch_sync(v1, v4);
  uint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t sub_1000664B8(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8LL) + 24LL) = *(void *)(*(void *)(result + 32) + 64LL);
  return result;
}

void sub_1000664CC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    uint64_t v2 = *(void *)(a1 + 40);
    uint64_t v3 = *(void *)(v1 + 64);
    if (v3 != v2)
    {
      uint64_t v4 = BKLogOrientationDevice(a1);
      uint64_t v5 = [v4 autorelease];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v20 = BSInterfaceOrientationDescription(*(void *)(v1 + 64));
        __int128 v21 = [v20 autorelease];
        uint64_t v22 = BSInterfaceOrientationDescription(v2);
        uint64_t v23 = v22;
        *(_DWORD *)buf = 138543618;
        __int128 v32 = v21;
        __int16 v33 = 2114;
        __int128 v34 = v23;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "Current user interface orientation is changing from %{public}@ to %{public}@",  buf,  0x16u);
      }
    }

    BKHIDEventProcessorRegistry *v6 = [BKHIDEventProcessorRegistry sharedInstance];
    BKHIDDirectTouchEventProcessor *v8 = [v6 eventProcessorOfClass:[BKHIDDirectTouchEventProcessor class]];
    id v9 = v8;

    [v9 setBuiltInDisplayInterfaceOrientation:v2];
    kdebug_trace(730464788LL, v2, 0LL, 0LL, 0LL);
    *(void *)(v1 + 64) = v2;
    if (v3 != v2)
    {
      uint64_t v24 = v9;
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification( DarwinNotifyCenter,  @"com.apple.backboardd.deviceinterfaceorientation",  0LL,  0LL,  1u);
      BOOL v11 = *(void *)(v1 + 96) != 0LL;
      __int128 v29 = 0u;
      __int128 v30 = 0u;
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      __int128 v12 = (void *)[*(id *)(v1 + 24) orderedContext];
      uint64_t v13 = (void *)[v12 array];

      id v14 = [v13 countByEnumeratingWithState:&v27 objects:buf count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v28;
        do
        {
          BOOL v17 = 0LL;
          do
          {
            if (*(void *)v28 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void *)(*((void *)&v27 + 1) + 8LL * (void)v17);
            __int128 v19 = *(dispatch_queue_s **)(v1 + 16);
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472LL;
            block[2] = sub_100066768;
            block[3] = &unk_1000B7DE0;
            void block[4] = v18;
            void block[5] = v1;
            void block[6] = v2;
            BOOL v26 = v11;
            dispatch_async(v19, block);
            BOOL v17 = (char *)v17 + 1;
          }

          while (v15 != v17);
          id v15 = [v13 countByEnumeratingWithState:&v27 objects:buf count:16];
        }

        while (v15);
      }

      id v9 = v24;
    }
  }

uint64_t sub_100066768(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector( *(void *)(a1 + 32),  "orientationManager:userInterfaceOrientationMayHaveChanged:isDeviceOrientationLocked:");
  if ((result & 1) != 0) {
    return (uint64_t)_[*(id *)(a1 + 32) orientationManager:*(void *)(a1 + 40) userInterfaceOrientationMayHaveChanged:*(void *)(a1 + 48) isDeviceOrientationLocked:*(unsigned __int8 *)(a1 + 56)];
  }
  return result;
}

uint64_t sub_1000667B0(uint64_t a1)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v5 = 0LL;
  int v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  uint64_t v8 = 0LL;
  uint64_t v1 = *(dispatch_queue_s **)(a1 + 8);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10006684C;
  v4[3] = &unk_1000B8080;
  void v4[4] = a1;
  void v4[5] = &v5;
  dispatch_sync(v1, v4);
  uint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t sub_10006684C(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8LL) + 24LL) = *(void *)(*(void *)(result + 32) + 80LL);
  uint64_t v1 = *(void *)(*(void *)(result + 40) + 8LL);
  if (*(void *)(v1 + 24) == -1LL) {
    *(void *)(v1 + 24) = 1LL;
  }
  return result;
}

uint64_t sub_100066880(uint64_t a1)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v5 = 0LL;
  int v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  uint64_t v8 = 0LL;
  uint64_t v1 = *(dispatch_queue_s **)(a1 + 8);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10006691C;
  v4[3] = &unk_1000B8080;
  void v4[4] = a1;
  void v4[5] = &v5;
  dispatch_sync(v1, v4);
  uint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t sub_10006691C(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8LL) + 24LL) = *(void *)(*(void *)(result + 32) + 88LL);
  return result;
}

uint64_t sub_100066930(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (v1) {
    LOBYTE(v1) = *(void *)(v1 + 96) != 0LL;
  }
  *(_BYTE *)(*(void *)(*(void *)(result + 40) + 8LL) + 24LL) = v1;
  return result;
}

BOOL sub_100066954(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  uint64_t v2 = *(dispatch_queue_s **)(a1 + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000669FC;
  block[3] = &unk_1000B7D40;
  void block[4] = a1;
  void block[5] = &v6;
  void block[6] = a2;
  dispatch_sync(v2, block);
  BOOL v3 = *((_BYTE *)v7 + 24) != 0;
  _Block_object_dispose(&v6, 8);
  return v3;
}

void *sub_1000669FC(void *result)
{
  uint64_t v1 = result[4];
  if (v1) {
    LOBYTE(v1) = *(void *)(v1 + 96) != 0LL;
  }
  uint64_t v2 = (void *)result[6];
  *(_BYTE *)(*(void *)(result[5] + 8LL) + 24LL) = v1;
  if (v2)
  {
    uint64_t v3 = *(void *)(result[4] + 88LL);
    if (v3 == -1) {
      uint64_t v3 = 0LL;
    }
    void *v2 = v3;
  }

  return result;
}

void sub_100066A38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1)
  {
    uint64_t v4 = *(dispatch_queue_s **)(a1 + 8);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    _DWORD v5[2] = sub_100066A98;
    v5[3] = &unk_1000B7D68;
    void v5[4] = a1;
    void v5[5] = a2;
    void v5[6] = a3;
    v5[7] = a4;
    dispatch_sync(v4, v5);
  }

void sub_100066A98(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v1 = a1[5];
  if (v2) {
    BOOL v3 = v1 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3)
  {
    uint64_t v4 = a1[6];
    if (v1 == 2)
    {
      uint64_t v5 = a1[7];
      uint64_t v6 = [NSNumber numberWithInt:v5];
      uint64_t v7 = (void *)[*(id *)(v2 + 32) objectForKey:v6];

      if (!v7)
      {
        BSProcessDeathWatcher *v8 = [[BSProcessDeathWatcher alloc] init];
        uint64_t v9 = *(void *)(v2 + 8);
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472LL;
        v27[2] = sub_100066D84;
        v27[3] = &unk_1000B7ED8;
        v27[4] = v2;
        v27[5] = v5;
        id v10 = [BSProcessDeathWatcher initWithPID:v5 queue:v9 deathHandler:v27];
        [*(id *)(v2 + 32) setObject:v10 forKey:v6];
      }
    }

    if ((*(void *)(v2 + 96) & v1) == 0)
    {
      uint64_t v11 = BKLogOrientationDevice(a1);
      os_log_s *v12 = [v11 autorelease];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = sub_100065A7C(v1);
        v14 = v13;
        uint64_t v15 = BSDeviceOrientationDescription(v4);
        uint64_t v16 = v15;
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v14;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Locking device orientation for lock type: %{public}@ to: %{public}@",  buf,  0x16u);
      }

      kdebug_trace(730464784LL, v1, v4, 0LL, 0LL);
      uint64_t v17 = *(void *)(v2 + 96);
      if (v17)
      {
        *(void *)(v2 + 96) = v17 | v1;
        BOOL v18 = 1;
      }

      else
      {
        sub_1000656D0((void *)v2, v4, v1 != 2);
        sub_100066158(v2, v4, 3LL);
        *(void *)(v2 + 96) |= v1;
        sub_100066158(v2, v4, 3LL);
        BOOL v18 = *(void *)(v2 + 96) != 0LL;
      }

      __int128 v19 = *(dispatch_queue_s **)(v2 + 144);
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&uint8_t buf[8] = 3221225472LL;
      *(void *)&uint8_t buf[16] = sub_100066E0C;
      __int128 v29 = &unk_1000B7E00;
      BOOL v30 = v18;
      dispatch_async(v19, buf);
      uint64_t v21 = BKLogOrientationDevice(v20);
      uint64_t v22 = (os_log_s *)v21;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v23 = sub_100065A7C(v1);
        uint64_t v24 = v23;
        uint64_t v25 = BSDeviceOrientationDescription(v4);
        BOOL v26 = [v25 autorelease];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v24;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v26;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEBUG,  "Locked device orientation for lock type: %{public}@ to: %{public}@",  buf,  0x16u);
      }
    }
  }

void sub_100066D84(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 32) count] == (id)1)
  {
    uint64_t v2 = BKLogOrientationDevice(1LL);
    BOOL v3 = [os_log_s class];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Last system shell with an orientation lock exited -- unlocking system device orientation",  v4,  2u);
    }

    sub_100066E78(*(void *)(a1 + 32), 2LL, *(void *)(a1 + 40));
  }

uint64_t sub_100066E0C(uint64_t result)
{
  uint64_t v1 = result;
  LODWORD(result) = dword_1000DB69C;
  if (dword_1000DB69C != -1
    || (notify_register_check("com.apple.backboardd.orientationlock", &dword_1000DB69C),
        uint64_t result = dword_1000DB69C,
        dword_1000DB69C != -1))
  {
    notify_set_state(result, *(unsigned __int8 *)(v1 + 32));
    return notify_post("com.apple.backboardd.orientationlock");
  }

  return result;
}

void sub_100066E78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 && (*(void *)(a1 + 96) & a2) != 0)
  {
    uint64_t v6 = BKLogOrientationDevice(a1);
    uint64_t v7 = [v6 autorelease];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = sub_100065A7C(a2);
      uint64_t v9 = v8;
      LODWORD(v14) = 138543362;
      *(void *)((char *)&v14 + 4) = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Unlocking device orientation for lock type: %{public}@",  (uint8_t *)&v14,  0xCu);
    }

    kdebug_trace(730464788LL, a2, 0LL, 0LL, 0LL);
    *(void *)(a1 + 96) &= ~a2;
    if ((a2 & 2) != 0)
    {
      id v10 = [NSNumber numberWithInt:a3];
      uint64_t v11 = (void *)[*(id *)(a1 + 32) objectForKey:v10];
      [*(id *)(a1 + 32) removeObjectForKey:v10];
      [v11 invalidate];
    }

    sub_100065DD4(a1);
    BOOL v12 = *(void *)(a1 + 96) != 0LL;
    uint64_t v13 = *(dispatch_queue_s **)(a1 + 144);
    *(void *)&__int128 v14 = _NSConcreteStackBlock;
    *((void *)&v14 + 1) = 3221225472LL;
    uint64_t v15 = sub_100066E0C;
    uint64_t v16 = &unk_1000B7E00;
    BOOL v17 = v12;
    dispatch_async(v13, ^{
});
  }

void sub_100067018(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    BOOL v3 = *(dispatch_queue_s **)(a1 + 8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100067078;
    block[3] = &unk_1000B7F00;
    void block[4] = a1;
    void block[5] = a2;
    void block[6] = a3;
    dispatch_sync(v3, block);
  }

void sub_100067078(uint64_t *a1)
{
}

void sub_100067088(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    uint64_t v2 = *(dispatch_queue_s **)(a1 + 8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000670EC;
    block[3] = &unk_1000B7F00;
    void block[4] = a1;
    void block[5] = a2;
    void block[6] = 2LL;
    dispatch_sync(v2, block);
  }

void sub_1000670EC(uint64_t *a1)
{
}

void sub_1000670FC(uint64_t a1)
{
}

id *sub_100067104(id *a1, void *a2)
{
  id v3 = a2;
  if (a1) {
    a1 = (id *)[a1[3] acquireForReason:@"observing" withContext:v3];
  }

  return a1;
}

id sub_1000673CC(uint64_t a1)
{
  id v2 =  [*(id *)(a1 + 32) appendVersionedPID:*(void *)(*(void *)(a1 + 40) + 40) withName:@"pid"];
  [*(id *)(a1 + 32) appendString:*(void *)(*(void *)(a1 + 40) + 64) withName:0 skipIfEmpty:1];
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = NSStringFromBKSTouchStreamIdentifier(*(unsigned __int8 *)(*(void *)(a1 + 40) + 8LL));
  uint64_t v5 = [v4 autorelease];
  [v3 appendString:v5 withName:0];

  id v6 =  [*(id *)(a1 + 32) appendDouble:@"creationTime" withName:4 decimalPrecision:*(double *)(*(void *)(a1 + 40) + 24)];
  id v7 =  [*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 48) withName:@"touchDestination"];
  id v8 =  [*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 12) withName:@"valid"];
  unint64_t v9 = *(unsigned __int8 *)(*(void *)(a1 + 40) + 10LL);
  if (v9 > 3) {
    id v10 = @"<unknown>";
  }
  else {
    id v10 = off_1000B7E20[v9];
  }
  id v11 = [*(id *)(a1 + 32) appendObject:v10 withName:@"dispatchMode"];
  unint64_t v12 = *(unsigned __int8 *)(*(void *)(a1 + 40) + 11LL);
  if (v12 > 2) {
    uint64_t v13 = @"<unknown>";
  }
  else {
    uint64_t v13 = off_1000B7E40[v12];
  }
  return [*(id *)(a1 + 32) appendObject:v13 withName:@"ambiguityRecommendation"];
}

id *sub_10006751C(id *result)
{
  if (result)
  {
    uint64_t v1 = result;
    if ((*((_BYTE *)result + 12) & 1) != 0)
    {
      *((_BYTE *)result + 12) = 0;
      [result[7] invalidate];
      id v2 = v1[7];
      v1[7] = 0LL;

      id WeakRetained = (id *)objc_loadWeakRetained(v1 + 4);
      uint64_t v4 = WeakRetained;
      if (WeakRetained) {
        [WeakRetained[2] removeObject:v1];
      }

      return (id *)objc_storeWeak(v1 + 4, 0LL);
    }
  }

  return result;
}

void sub_100067948(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 40);
  id v2 = *(void **)(*(void *)(a1 + 32) + 32LL);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  _OWORD v3[2] = sub_1000679BC;
  v3[3] = &unk_1000B7EB0;
  id v4 = v1;
  [v2 enumerateKeysAndObjectsUsingBlock:v3];
}

void sub_1000679BC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = [v5 processDescription];
  if (v6) {
    uint64_t v8 = v6[2];
  }
  else {
    uint64_t v8 = 0LL;
  }

  id v11 = [v7 stringByAppendingFormat:@" contextID %X" v8];
  unint64_t v9 = *(void **)(a1 + 32);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  _DWORD v12[2] = sub_100067AC4;
  v12[3] = &unk_1000B8030;
  id v13 = v9;
  id v14 = v5;
  id v10 = v5;
  [v13 appendBodySectionWithName:v11 openDelimiter:@"{" closeDelimiter:@"}" block:v12];
}

void sub_100067AC4(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100067B34;
  v2[3] = &unk_1000B7E88;
  uint64_t v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 appendCustomFormatWithName:@"touchIDs" block:v2];
}

void sub_100067B34(uint64_t a1, void *a2)
{
  id v3 = a2;
  v9[0] = 0LL;
  v9[1] = v9;
  _DWORD v9[2] = 0x2020000000LL;
  char v10 = 0;
  id v4 = [*(id *)(a1 + 32) touchIdentifiers];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  _DWORD v6[2] = sub_100067C0C;
  v6[3] = &unk_1000B7E60;
  uint64_t v8 = v9;
  id v5 = v3;
  id v7 = v5;
  [v4 enumerateRangesUsingBlock:v6];

  _Block_object_dispose(v9, 8);
}

void sub_100067BF4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

id sub_100067C0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL)) {
    [*(id *)(a1 + 32) appendString:@" "];
  }
  id v6 = *(void **)(a1 + 32);
  if (a3 == 1) {
    id result = [v6 appendFormat:@"%X" a2, v8];
  }
  else {
    id result = [v6 appendFormat:@"%X-%X" a2, a3 + a2 - 1];
  }
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  return result;
}

id sub_100068570(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 144);
  *(void *)(v2 + 144) = 0LL;

  return _[*(id *)(*(void *)(a1 + 32) + 128) end];
}

id sub_1000685B0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 144))
  {
    id v7 = [NSString stringWithFormat:@"precondition: should have invalidated and cleared any previous transactions"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = NSStringFromSelector(*(SEL *)(a1 + 40));
      unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      id v11 = [*(void *)(a1 + 32) class];
      unint64_t v12 = NSStringFromClass(v11);
      id v13 = v12;
      uint64_t v14 = *(void *)(a1 + 32);
      int v15 = 138544642;
      uint64_t v16 = v9;
      __int16 v17 = 2114;
      BOOL v18 = v13;
      __int16 v19 = 2048;
      uint64_t v20 = v14;
      __int16 v21 = 2114;
      uint64_t v22 = @"BKTouchDeliveryStatisticsLoggingObserver.m";
      __int16 v23 = 1024;
      int v24 = 294;
      __int16 v25 = 2114;
      BOOL v26 = v7;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  (uint8_t *)&v15,  0x3Au);
    }

    _bs_set_crash_log_message([v7 UTF8String]);
    __break(0);
    JUMPOUT(0x100068728LL);
  }

  uint64_t v3 = [*(id *)(v2 + 8) beginTransactionForReason:@"processing touches"];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 144);
  *(void *)(v4 + 144) = v3;

  return [*(id *)(*(void *)(a1 + 32) + 128) begin];
}

id sub_100068730(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) increment];
}

id sub_10006873C(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) increment];
}

id sub_100068748(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 88) increment];
}

id sub_100068754(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 80) increment];
}

id sub_100068760(uint64_t a1)
{
  return _[*(id *)(*(void *)(a1 + 32) + 112) excludeBitNumber:*(void *)(a1 + 40)];
}

id sub_10006879C(uint64_t a1)
{
  id result = [*(id *)(*(void *)(a1 + 32) + 112) includeBitNumber:*(void *)(a1 + 40)];
  if (!*(_DWORD *)(a1 + 48)) {
    id result = [*(id *)(*(void *)(a1 + 32) + 72) increment];
  }
  int v3 = *(_DWORD *)(a1 + 52);
  if ((v3 & 0x20000) != 0)
  {
    id result = [*(id *)(*(void *)(a1 + 32) + 64) increment];
    int v3 = *(_DWORD *)(a1 + 52);
  }

  if ((v3 & 0x42800) != 0) {
    return [*(id *)(*(void *)(a1 + 32) + 96) increment];
  }
  return result;
}

id sub_10006882C(uint64_t a1)
{
  return _[*(id *)(*(void *)(a1 + 32) + 120) excludeBitNumber:*(void *)(a1 + 40)];
}

id sub_100068868(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 120) includeBitNumber:*(void *)(a1 + 40)];
}

void sub_1000688A4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(_DWORD *)(a1 + 48);
  if (*(_DWORD *)(v1 + 176) != v2)
  {
    *(_DWORD *)(v1 + 176) = v2;
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(a1 + 40);
    id v6 = *(void **)(v4 + 8);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    _DWORD v7[2] = sub_10006893C;
    v7[3] = &unk_1000B80A8;
    void v7[4] = v4;
    id v8 = v5;
    int v9 = *(_DWORD *)(a1 + 48);
    [v6 updateStatistics:v7];
  }

id sub_10006893C(uint64_t a1)
{
  return _[*(id *)(*(void *)(a1 + 32) + 136) addDestination:*(void *)(a1 + 40) touchIdentifier:*(unsigned int *)(a1 + 48)];
}

void sub_100068AC4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, objc_super a11)
{
  a11.super_class = [BKDirectTouchStateHitTester class];
  [_Unwind_Exception dealloc];
  _Unwind_Resume(a1);
}

void sub_100068B0C(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    sub_10003ECA8(a1);
  }
  _Unwind_Resume(a1);
}

void sub_100068BB8(void *a1, void *a2, CGFloat *a3, int64_t a4, void *a5)
{
  int v9 = a1;
  id v10 = a2;
  id v11 = a5;
  sub_100007C10((uint64_t)v11, v9, *((_DWORD *)v10 + 5), *((void *)v10 + 1), a3, a4);
  if (v9)
  {
    int v14 = v9[2];
    int v15 = v9[3];
  }

  else
  {
    int v14 = 0;
    int v15 = 0;
  }

  uint64_t v16 = BKLogTouchEvents(v12, v13);
  os_log_s *v17 = v16;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v18 = *((void *)v10 + 1);
    v19[0] = 67109632;
    v19[1] = v14;
    __int16 v20 = 1024;
    int v21 = v15;
    __int16 v22 = 1024;
    int v23 = v18;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "Adding hit test result: %X %X %d",  (uint8_t *)v19,  0x14u);
  }

  [*((id *)v10 + 35) addObject:v9];
}

void sub_100068CEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_100068D14(id a1, BKTouchDestination *a2)
{
  return !a2 || (a2->_predicate & 1) == 0;
}

id sub_100068D38(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  id v8 = sub_10005EF90(*(void *)(a1 + 16), a2, a3);
  uint64_t v9 = [v8 autorelease];
  id v10 = (void *)v9;
  if (v9) {
    [*(id *)(v9 + 24) addObject:v7];
  }
  [v7 addObject:v10];

  return v10;
}

void sub_100068DB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100068DCC(uint64_t a1, void *a2, unsigned int *a3, uint64_t a4)
{
  int v24 = a2;
  uint64_t v7 = *a3;
  uint64_t v8 = a3[2];
  NSMutableArray *v9 = [[NSMutableArray alloc] init];
  id v10 = sub_100068D38(a1, v7, v8, v9);
  id v11 = [*(id *)a4 hostContextIDForEmbeddedContextID:v7 displayUUID:*(void *)(a4 + 8)];
  *(void *)&__int128 v12 = 67109376LL;
  __int128 v23 = v12;
  while ((_DWORD)v11)
  {
    id v13 = [*(id *)a4 taskPortForContextID:v11 displayUUID:*(void *)(a4 + 8)];
    uint64_t v15 = (uint64_t)v13;
    if (((_DWORD)v13 - 1) > 0xFFFFFFFD)
    {
      uint64_t v19 = BKLogTouchEvents(v13, v14);
      os_log_s *v20 = [v19 autorelease];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v23;
        int v26 = v15;
        __int16 v27 = 1024;
        int v28 = (int)v11;
        _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "invalid port (%X) for contextID:%X",  buf,  0xEu);
      }
    }

    else
    {
      [v9 count];
      if ((unint64_t)v16 >= 0x40)
      {
        uint64_t v21 = BKLogTouchEvents(v16, v17);
        os_log_s *v22 = [v21 autorelease];
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 67109120;
          int v26 = (int)v11;
          _os_log_fault_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_FAULT,  "reached maximum supported embedded context depth at contextID:%X",  buf,  8u);
        }

        break;
      }

      id v18 = sub_100068D38(a1, (uint64_t)v11, v15, v9);
    }

    id v11 = [*(id *)a4 hostContextIDForEmbeddedContextID:v11 displayUUID:v23];
  }

  sub_100063160((uint64_t)v24, v9);
  [*(id *)a4 applySceneHostSettingsToHostingChain:v24[36]];
  v24[7] = [*(id *)a4 hitTestCategoryForContextID:*a3];
}

void sub_100068FF0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_100069034(void *a1, void *a2, uint64_t a3, uint64_t a4, double a5, double a6)
{
  id v11 = a1;
  __int128 v12 = a2;
  int v13 = *(unsigned __int8 *)(a4 + 89);
  id v14 = v12[2];
  uint64_t v15 = [BKDisplayController displayControllerForDisplay:v13];
  id v16 = v15;

  memset(v26, 0, sizeof(v26));
  id v17 = [*(id *)a4 contextIDAtCAScreenLocation:v16 displayUUID:v26 options:0 securityAnalysis:v26 results:a5];
  if (DWORD1(v26[0]) == *(_DWORD *)(a3 + 4))
  {
    uint64_t v19 = BKLogTouchEvents(v17, v18);
    os_log_s *v20 = v19;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v28 = DWORD1(v26[0]);
      _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "auth: recording hit test info for slotID:%X",  buf,  8u);
    }

    *((_DWORD *)v11 + 6) = DWORD1(v26[0]);
    id v21 = sub_1000075CC((uint64_t)v26);
    uint64_t v22 = v21;
    __int128 v23 = (os_log_s *)*((void *)v11 + 33);
    *((void *)v11 + 33) = v22;
  }

  else
  {
    uint64_t v24 = BKLogTouchEvents(v17, v18);
    os_log_s *v23 = [v24 autorelease];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      int v25 = *(_DWORD *)(a3 + 4);
      *(_DWORD *)buf = 67109376;
      int v28 = v25;
      __int16 v29 = 1024;
      int v30 = DWORD1(v26[0]);
      _os_log_error_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "auth: slotID mismatch between down hit tests: %X vs %X",  buf,  0xEu);
    }
  }
}

void sub_100069244(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double sub_100069278(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double v7 = v6;
  double v9 = v8;
  id v10 = [BKDisplayController displayControllerForDisplayID:a2];
  v11 = [v10 autorelease];
  [*(id *)a3 contextIDAtCAScreenLocation:v11 displayUUID:a2 options:a1 securityAnalysis:v7 results:v9];

  return v7;
}

void sub_100069310(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100069320(void *a1)
{
  uint64_t v1 = a1;
  if (v1[6])
  {
    uint64_t v2 = BKLogTouchEvents();
    os_log_s *v3 = v2;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = v1[6];
      v6[0] = 67109120;
      v6[1] = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "auth: exited slotID %X", (uint8_t *)v6, 8u);
    }

    v1[6] = 0;
    id v5 = (void *)*((void *)v1 + 33);
    *((void *)v1 + 33) = 0LL;
  }
}

void sub_1000693E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__n128 sub_1000693FC(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 48);
  __int128 v3 = *(_OWORD *)(a2 + 64);
  *(__n128 *)(a1 + 4_Block_object_dispose(va, 8) = result;
  *(_OWORD *)(a1 + 64) = v3;
  return result;
}

void sub_10006940C(uint64_t a1, void *a2)
{
  id v17 = a2;
  [v17 rect];
  BOOL v3 = CGRectContainsPoint(v18, *(CGPoint *)(a1 + 56));
  int v4 = v17;
  if (v3)
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
    uint64_t v6 = *(void *)(v5 + 24);
    if (!v6)
    {
      [v17 rect];
      double v7 = *(void **)(*(void *)(a1 + 40) + 8LL);
      void v7[6] = v8;
      v7[7] = v9;
      v7[8] = v10;
      v7[9] = v11;
      [v17 _exclusiveTouchNormalizedSubRectInReferenceSpace];
      __int128 v12 = *(void **)(*(void *)(a1 + 48) + 8LL);
      v12[6] = v13;
      v12[7] = v14;
      v12[8] = v15;
      v12[9] = v16;
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
      uint64_t v6 = *(void *)(v5 + 24);
      int v4 = v17;
    }

    *(void *)(v5 + 24) = v6 + 1;
  }
}

void sub_1000694A4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
}

BKTouchHitTestContextMap *sub_1000694C0(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6)
{
  id v192 = a3;
  id v199 = a4;
  id v193 = a5;
  id v194 = a6;
  if (a1)
  {
    BKTouchHitTestContextMap *v200 = [[BKTouchHitTestContextMap alloc] init];
    uint64_t v10 = *(void **)(a1 + 16);
    if (v10) {
      uint64_t v10 = (void *)v10[1];
    }
    uint64_t v11 = v10;
    __int128 v12 = (void *)[v11 displayUUID];

    uint64_t v13 = *(void **)(a1 + 32);
    if (v13) {
      uint64_t v13 = (void *)v13[1];
    }
    uint64_t v191 = v13;
    id v222 = v191;
    uint64_t v224 = 0LL;
    *(void *)int v225 = 0LL;
    id v190 = v12;
    id v223 = v190;
    *(_DWORD *)&v225[7] = 0;
    *(int64x2_t *)&v225[16] = vdupq_n_s64(0xC197D783FC000000LL);
    v225[32] = v225[16];
    v225[48] = v225[16];
    __int16 v226 = 0;
    __int128 v218 = 0u;
    __int128 v219 = 0u;
    __int128 v220 = 0u;
    __int128 v221 = 0u;
    id obj = v192;
    id v198 = [obj countByEnumeratingWithState:v218 objects:v227 count:16];
    if (v198)
    {
      uint64_t v197 = *(void *)v219;
      *(void *)&__int128 v14 = 138543618LL;
      __int128 v189 = v14;
      do
      {
        id v201 = 0LL;
        do
        {
          if (*(void *)v219 != v197) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void *)(*((void *)&v218 + 1) + 8LL * (void)v201);
          uint64_t v16 = *(void *)(v15 + 8);
          __int128 v17 = *(_OWORD *)(v15 + 216);
          *(_OWORD *)&v225[8] = *(_OWORD *)(v15 + 200);
          *(_OWORD *)&v225[24] = v17;
          *(_OWORD *)&v225[40] = *(_OWORD *)(v15 + 232);
          *(void *)&v225[56] = *(void *)(v15 + 248);
          *(void *)int v225 = v16;
          uint64_t v207 = v15;
          CGRect v18 = (id *)(id)v15;
          uint64_t v19 = v200;
          uint64_t v215 = v18;
          id v20 = v18[32];
          id v21 = v20;
          if (v20)
          {
            uint64_t v22 = (void *)[v20 contextIDsToAlwaysSendTouches];
            __int128 v23 = v22;
            if (v22)
            {
              BOOL v211 = v22;
              id v24 = [v22 count];
              __int128 v23 = v211;
              if (v24)
              {
                __int128 v254 = 0u;
                __int128 v255 = 0u;
                *(_OWORD *)v252 = 0u;
                __int128 v253 = 0u;
                id v25 = v211;
                id v26 = [v25 countByEnumeratingWithState:v252 objects:idx count:16];
                if (v26)
                {
                  uint64_t v27 = *(void *)v253;
                  do
                  {
                    for (uint64_t i = 0LL; i != v26; uint64_t i = (char *)i + 1)
                    {
                      if (*(void *)v253 != v27) {
                        objc_enumerationMutation(v25);
                      }
                      [*(id *)(*(void *)&v252[8] + 8 * (void)i) unsignedIntValue:v189];
                      id v30 = [v222 taskPortForContextID:v29 displayUUID:v223];
                      uint64_t v31 = (uint64_t)v30;
                      if ((_DWORD)v29) {
                        BOOL v32 = (_DWORD)v30 == 0;
                      }
                      else {
                        BOOL v32 = 1;
                      }
                      if (!v32 && (_DWORD)v30 != -1)
                      {
                        sub_10005EBF0( (uint64_t)v228,  *(void *)(a1 + 16),  (uint64_t)&v225[8],  (uint64_t)v29,  (uint64_t)v223);
                        uint64_t v36 = BKLogTouchEvents(v34, v35);
                        os_log_s *v37 = v36;
                        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
                        {
                          *(_DWORD *)buf = 67109632;
                          *(_DWORD *)&uint8_t buf[4] = (_DWORD)v29;
                          *(_WORD *)&uint8_t buf[8] = 1024;
                          *(_DWORD *)&buf[10] = v31;
                          *(_WORD *)&buf[14] = 1024;
                          LODWORD(v259) = *(_DWORD *)v225;
                          _os_log_debug_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEBUG,  "Always send: adding %X %X %d",  buf,  0x14u);
                        }

                        id v38 = sub_10005EF90(*(void *)(a1 + 16), (uint64_t)v29, v31);
                        uint64_t v39 = [v38 autorelease];
                        [v215[35] addObject:v39];
                        sub_100007C10( (uint64_t)v19,  v39,  *((_DWORD *)v215 + 5),  *(int64_t *)v225,  (CGFloat *)v228,  4LL);
                      }
                    }

                    id v26 = [v25 countByEnumeratingWithState:v252 objects:idx count:16];
                  }

                  while (v26);
                }

                __int128 v23 = v211;
              }
            }
          }

          uint64_t v40 = v215;
          int v41 = v19;
          if (v40[6] == (id)1)
          {
            v40[6] = (id)2;
            id v42 = [v40[35] copy];
            __int128 v254 = 0u;
            __int128 v255 = 0u;
            *(_OWORD *)v252 = 0u;
            __int128 v253 = 0u;
            id v43 = v42;
            id v44 = [v43 countByEnumeratingWithState:v252 objects:idx count:16];
            id v46 = v44;
            if (v44)
            {
              uint64_t v47 = *(void *)v253;
              do
              {
                BOOL v48 = 0LL;
                do
                {
                  if (*(void *)v253 != v47) {
                    objc_enumerationMutation(v43);
                  }
                  uint64_t v49 = *(unsigned int **)(*(void *)&v252[8] + 8LL * (void)v48);
                  if (v49) {
                    uint64_t v50 = v49[2];
                  }
                  else {
                    uint64_t v50 = 0LL;
                  }
                  uint64_t v51 = BKLogTouchEvents(v44, v45);
                  int v52 = (os_log_s *)v51;
                  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)v228 = 67109376;
                    *(_DWORD *)&v228[4] = v50;
                    *(_WORD *)&v228[8] = 1024;
                    *(_DWORD *)&v228[10] = *(_DWORD *)v225;
                    _os_log_debug_impl( (void *)&_mh_execute_header,  v52,  OS_LOG_TYPE_DEBUG,  "Start avoiding: adding %X %d",  v228,  0xEu);
                  }

                  sub_10005EBF0((uint64_t)v228, *(void *)(a1 + 16), (uint64_t)&v225[8], v50, (uint64_t)v223);
                  sub_100068BB8(v49, v40, (CGFloat *)v228, 3LL, v41);
                  BOOL v48 = (char *)v48 + 1;
                }

                while (v46 != v48);
                id v44 = [v43 countByEnumeratingWithState:v252 objects:idx count:16];
                id v46 = v44;
              }

              while (v44);
            }

            int v53 = [v43 bs_filter:&stru_1000B7F40];
            id v54 = [v53 mutableCopy];
            id v55 = v40[35];
            v40[35] = v54;
          }

          __int128 v204 = v40;
          id v56 = v199;
          id v57 = v56;
          id v58 = v40[6];
          if (v58 == (id)2) {
            goto LABEL_51;
          }
          if (v58 == (id)3)
          {
            v40[6] = 0LL;
LABEL_51:

            goto LABEL_186;
          }

          Class isa = v204[4].super.super.isa;
          BOOL v61 = v58 != (id)4 && isa != 0LL;
          if (!v61 || isa != (Class)1)
          {
            BOOL v63 = v61;
            char v64 = !v61;
            if (isa != (Class)2) {
              char v64 = 1;
            }
            if ((v64 & 1) != 0)
            {

              if (v63 || isa != (Class)2)
              {
                unsigned int v94 = 0;
                uint64_t v95 = v215;
              }

              else
              {
                uint64_t v95 = v215;
                if (v40[6] == (id)4) {
                  unsigned int v94 = [*(id *)(a1 + 24) _queue_hasTouchEnterSlots];
                }
                else {
                  unsigned int v94 = 0;
                }
              }

              BOOL v93 = v63;
              goto LABEL_90;
            }

            if ([v56 count])
            {
              double v65 = *(double *)&v225[32];
              double v66 = v225[40];
              id v67 = v204;
              id v68 = v57;
              double v69 = *(double *)&v67[13].super.super.isa;
              double v70 = *(double *)&v67[14].super.super.isa;
              double v71 = *(double *)&v67[15].super.super.isa;
              double v72 = *(double *)&v67[16].super.super.isa;
              double v73 = *(double *)&v67[9].super.super.isa;
              double v74 = *(double *)&v67[10].super.super.isa;
              double v75 = *(double *)&v67[11].super.super.isa;
              double v76 = *(double *)&v67[12].super.super.isa;
              int isa_low = LOBYTE(v67[37].super.super.isa);
              idx[0] = 0LL;
              idx[1] = (CFIndex)idx;
              *(void *)&__int128 v234 = 0x5012000000LL;
              *((void *)&v234 + 1) = sub_1000693FC;
              *(void *)&__int128 v235 = nullsub_6;
              *((void *)&v235 + 1) = "";
              *(double *)&__int128 v236 = v73;
              *((double *)&v236 + 1) = v74;
              *(double *)&__int128 v237 = v75;
              *((double *)&v237 + 1) = v76;
              *(void *)v252 = 0LL;
              *(void *)&v252[8] = v252;
              *(void *)&__int128 v253 = 0x5012000000LL;
              *((void *)&v253 + 1) = sub_1000693FC;
              *(void *)&__int128 v254 = nullsub_6;
              *((void *)&v254 + 1) = "";
              *(double *)&__int128 v255 = v69;
              *((double *)&v255 + 1) = v70;
              double v256 = v71;
              double v257 = v72;
              *(void *)buf = 0LL;
              *(void *)&uint8_t buf[8] = buf;
              __int128 v259 = 0x2020000000uLL;
              *(void *)v228 = _NSConcreteStackBlock;
              *(void *)&v228[8] = 3221225472LL;
              *(void *)&__int128 v229 = sub_10006940C;
              *((void *)&v229 + 1) = &unk_1000B7F68;
              CGFloat v208 = v65;
              *((double *)&v231 + 1) = v65;
              double v78 = v69;
              CGFloat point = v66;
              double v232 = v66;
              double v79 = v70;
              *(void *)&__int128 v230 = buf;
              *((void *)&v230 + 1) = idx;
              *(void *)&__int128 v231 = v252;
              id v212 = v68;
              [v68 enumerateObjectsUsingBlock:v228];
              v267.origin.double x = v73;
              v267.origin.double y = v74;
              v267.size.width = v75;
              v267.size.height = v76;
              if (!CGRectEqualToRect(v267, *(CGRect *)(idx[1] + 48)))
              {
                double v73 = *(double *)(idx[1] + 48);
                double v74 = *(double *)(idx[1] + 56);
                double v75 = *(double *)(idx[1] + 64);
                double v76 = *(double *)(idx[1] + 72);
                double v78 = *(double *)(*(void *)&v252[8] + 48LL);
                double v79 = *(double *)(*(void *)&v252[8] + 56LL);
                double v71 = *(double *)(*(void *)&v252[8] + 64LL);
                double v72 = *(double *)(*(void *)&v252[8] + 72LL);
                IsEmptdouble y = CGRectIsEmpty(*(CGRect *)&v67[9].super.super.isa);
                if (!IsEmpty)
                {
                  uint64_t v82 = BKLogTouchEvents(IsEmpty, v81);
                  uint64_t v83 = [v82 autorelease];
                  if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
                  {
                    uint64_t v84 = BSStringFromCGRect( *(double *)&v67[9].super.super.isa,  *(double *)&v67[10].super.super.isa,  *(double *)&v67[11].super.super.isa,  *(double *)&v67[12].super.super.isa);
                    __n128 v85 = v84;
                    uint64_t v86 = BSStringFromCGRect(v73, v74, v75, v76);
                    v87 = v86;
                    *(_DWORD *)v262 = v189;
                    v263 = v85;
                    __int16 v264 = 2114;
                    __int128 v265 = v87;
                    _os_log_impl( (void *)&_mh_execute_header,  v83,  OS_LOG_TYPE_DEFAULT,  "Touch moved from this region: %{public}@ to this region: %{public}@",  v262,  0x16u);
                  }
                }
              }

              if (isa_low
                || (v268.origin.double x = v78,
                    v268.origin.double y = v79,
                    v268.size.width = v71,
                    v268.size.height = v72,
                    v266.double x = v208,
                    v266.double y = point,
                    !(BOOL v88 = CGRectContainsPoint(v268, v266))))
              {
                int v92 = 0;
              }

              else
              {
                uint64_t v90 = BKLogTouchEvents(v88, v89);
                os_log_s *v91 = v90;
                if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG))
                {
                  uint64_t v168 = BSStringFromCGRect(v73, v74, v75, v76);
                  uint64_t v169 = v168;
                  uint64_t v170 = BSStringFromCGRect(v78, v79, v71, v72);
                  uint64_t v171 = [v170 autorelease];
                  *(_DWORD *)v262 = v189;
                  v263 = v169;
                  __int16 v264 = 2114;
                  __int128 v265 = v171;
                  _os_log_debug_impl( (void *)&_mh_execute_header,  v91,  OS_LOG_TYPE_DEBUG,  "Touch entered exclusive touch region of this touch region: %{public}@ exclusiveHitTestRegion: %{publ ic}@, so no longer a candidate for hit testing",  v262,  0x16u);
                }

                int v92 = 1;
              }

              *(double *)&v67[13].super.super.Class isa = v78;
              *(double *)&v67[14].super.super.Class isa = v79;
              *(double *)&v67[15].super.super.Class isa = v71;
              *(double *)&v67[16].super.super.Class isa = v72;
              *(double *)&v67[9].super.super.Class isa = v73;
              *(double *)&v67[10].super.super.Class isa = v74;
              *(double *)&v67[11].super.super.Class isa = v75;
              *(double *)&v67[12].super.super.Class isa = v76;
              _Block_object_dispose(buf, 8);
              _Block_object_dispose(v252, 8);
              _Block_object_dispose(idx, 8);

              if (v92) {
LABEL_81:
              }
                v40[6] = (id)4;
            }

            else if (!LOBYTE(v204[37].super.super.isa))
            {
              goto LABEL_81;
            }

            BOOL v93 = 1;
            goto LABEL_83;
          }

          BOOL v93 = v204[5].super.super.isa != (Class)2;
LABEL_83:

          unsigned int v94 = 0;
          uint64_t v95 = v215;
LABEL_90:
          BOOL v209 = v93;
          if (!v93 && !v94) {
            goto LABEL_122;
          }
          uint64_t v96 = v204;
          uint64_t SenderID = IOHIDEventGetSenderID(a2);
          __int16 v98 = [v95[32] contextIDsToExcludeFromHitTesting];
          if (SenderID == 0x8000000817319379LL || SenderID == 0x8000000817319374LL)
          {
            int v99 = [*(id *)(a1 + 24) _queue_contextIDsToIgnoreForZoomSenders];
            id v100 = v98;
            id v101 = v99;
            uint64_t v102 = v101;
            int v103 = v101;
            if (v100 && (int v103 = v100, v101)) {
              id v104 = [v100 arrayByAddingObjectsFromArray:v101];
            }
            else {
              id v104 = v103;
            }
            __int16 v98 = v104;
          }

          double v105 = v224;
          uint64_t v224 = v98;

          if (!(_BYTE)v226)
          {
            if (IOHIDEventConformsTo(a2, 1LL)
              && (sub_10001D26C((const __CFArray **)idx, a2), CFIndex v107 = idx[1], v108 = v234, idx[1] < (uint64_t)v234))
            {
              double v109 = (const __CFArray *)idx[0];
              while (1)
              {
                uint64_t v110 = v108 ? CFArrayGetValueAtIndex(v109, v107) : 0LL;
                if (IOHIDEventGetType(v110, v106) == 1
                  && IOHIDEventGetIntegerValue(v110, 0x10000LL) == 65376
                  && IOHIDEventGetIntegerValue(v110, 65537LL) == 11)
                {
                  break;
                }

                if (v108 == ++v107) {
                  goto LABEL_110;
                }
              }

              char v111 = 1;
            }

            else
            {
LABEL_110:
              char v111 = 0;
            }

            HIBYTE(v226) = v111;
            LOBYTE(v226) = 1;
          }

          if (!v209)
          {
LABEL_122:
            if (v94)
            {
              uint64_t v121 = v204;
              __int128 v250 = 0u;
              __int128 v251 = 0u;
              __int128 v248 = 0u;
              __int128 v249 = 0u;
              __int128 v246 = 0u;
              __int128 v247 = 0u;
              __int128 v244 = 0u;
              __int128 v245 = 0u;
              __int128 v242 = 0u;
              __int128 v243 = 0u;
              __int128 v240 = 0u;
              __int128 v241 = 0u;
              __int128 v238 = 0u;
              __int128 v239 = 0u;
              __int128 v236 = 0u;
              __int128 v237 = 0u;
              __int128 v234 = 0u;
              __int128 v235 = 0u;
              *(_OWORD *)iddouble x = 0u;
              double v122 = [v222 sub_100069278:idx];
              if (LODWORD(idx[0]) && HIDWORD(idx[0]))
              {
                double v124 = v122;
                double v125 = v123;
                BOOL v126 = [a1 _queue_slotRecordForSlotID:];
                id v127 = v126;
                if (v126)
                {
                  if (v126[3] == 2LL)
                  {
                    sub_100069034(v121, v126, (uint64_t)idx, (uint64_t)&v222, v124, v125);
                    sub_100068DCC(a1, v121, (unsigned int *)idx, (uint64_t)&v222);
                  }
                }

                else
                {
                  sub_100069320(v121);
                }
              }

              else
              {
                sub_100069320(v121);
              }
            }

            goto LABEL_137;
          }

          id v112 = v96;
          __int128 v250 = 0u;
          __int128 v251 = 0u;
          __int128 v248 = 0u;
          __int128 v249 = 0u;
          __int128 v246 = 0u;
          __int128 v247 = 0u;
          __int128 v244 = 0u;
          __int128 v245 = 0u;
          __int128 v242 = 0u;
          __int128 v243 = 0u;
          __int128 v240 = 0u;
          __int128 v241 = 0u;
          __int128 v238 = 0u;
          __int128 v239 = 0u;
          __int128 v236 = 0u;
          __int128 v237 = 0u;
          __int128 v234 = 0u;
          __int128 v235 = 0u;
          *(_OWORD *)iddouble x = 0u;
          if (isa == (Class)2) {
            uint64_t v113 = v252;
          }
          else {
            uint64_t v113 = 0LL;
          }
          *(void *)v252 = 0LL;
          double v114 = [v222 sub_100069278:idx:v113];
          if (isa == (Class)2)
          {
            double v116 = v114;
            double v117 = v115;
            uint64_t v118 = *(void **)v252;
            id v119 = *(id *)v252;
            if (LODWORD(idx[0]))
            {
              objc_storeStrong(v112 + 34, v118);
              if (HIDWORD(idx[0]))
              {
                unint64_t v120 = [*(id *)(a1 + 24) _queue_slotRecordForSlotID:];
                if (v120) {
                  sub_100069034(v112, v120, (uint64_t)idx, (uint64_t)&v222, v116, v117);
                }
              }

              else
              {
                sub_100069320(v112);
              }

LABEL_135:
              sub_100068DCC(a1, v112, (unsigned int *)idx, (uint64_t)&v222);
              goto LABEL_136;
            }
          }

          else
          {
            id v119 = 0LL;
            if (LODWORD(idx[0])) {
              goto LABEL_135;
            }
          }

          sub_100063160((uint64_t)v112, 0LL);
          sub_100069320(v112);
LABEL_136:

LABEL_137:
          int v128 = v204;
          v216 = v41;
          id v205 = [*(id *)(a1 + 8) filterDestinations:v128[36].super.super.isa];
          uint64_t v129 = BKLogTouchDeliveryPolicy();
          int v130 = v129;
          if (os_log_type_enabled(v130, OS_LOG_TYPE_DEBUG))
          {
            unsigned int v167 = [*(id *)(a1 + 8) valueForKey:@"_policy"];
            LODWORD(idx[0]) = 138543362;
            *(CFIndex *)((char *)idx + 4) = (CFIndex)v167;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v130,  OS_LOG_TYPE_DEBUG,  "policies: %{public}@",  (uint8_t *)idx,  0xCu);
          }

          NSMutableSet *v213 = [[NSMutableSet alloc] init];
          __int128 v230 = 0u;
          __int128 v231 = 0u;
          *(_OWORD *)v228 = 0u;
          __int128 v229 = 0u;
          id v206 = v205;
          id v131 = [v206 countByEnumeratingWithState:v228 objects:idx count:16];
          if (v131)
          {
            uint64_t v132 = 0LL;
            uint64_t v133 = *(void *)v229;
            do
            {
              double v134 = 0LL;
              id pointa = v131;
              do
              {
                if (*(void *)v229 != v133) {
                  objc_enumerationMutation(v206);
                }
                int v135 = *(unsigned int **)(*(void *)&v228[8] + 8LL * (void)v134);
                uint64_t v136 = BKLogTouchDeliveryPolicy();
                os_log_s *v137 = v136;
                if (os_log_type_enabled(v137, OS_LOG_TYPE_DEBUG))
                {
                  double v146 = [v135 succinctDescription];
                  *(_DWORD *)v262 = 138543362;
                  v263 = v146;
                  _os_log_debug_impl( (void *)&_mh_execute_header,  v137,  OS_LOG_TYPE_DEBUG,  "TDPS allow send to %{public}@",  v262,  0xCu);
                }

                if (v135) {
                  uint64_t v138 = v135[2];
                }
                else {
                  uint64_t v138 = 0LL;
                }
                if (-[objc_class containsObject:]( v128[35].super.super.isa,  "containsObject:",  v135,  sub_10005EBF0( (uint64_t)v262,  *(void *)(a1 + 16),  (uint64_t)&v225[8],  v138,  (uint64_t)v223))) {
                  int64_t v139 = 1LL;
                }
                else {
                  int64_t v139 = 2LL;
                }
                sub_100068BB8(v135, v128, (CGFloat *)v262, v139, v216);
                [v213 addObject:v135];
                if (v209)
                {
                  __int128 v261 = 0u;
                  __int128 v260 = 0u;
                  __int128 v259 = 0u;
                  *(_OWORD *)buf = 0u;
                  uint64_t v140 = *(void **)(a1 + 16);
                  if (v140) {
                    uint64_t v140 = (void *)v140[9];
                  }
                  uint64_t v141 = v140;
                  id v142 = [v141 countByEnumeratingWithState:buf objects:v252 count:16];
                  uint64_t v143 = a1;
                  if (v142)
                  {
                    uint64_t v144 = *(void *)v259;
                    do
                    {
                      for (uint64_t j = 0LL; j != v142; uint64_t j = (char *)j + 1)
                      {
                        if (*(void *)v259 != v144) {
                          objc_enumerationMutation(v141);
                        }
                        [*(id *)(*(void *)&buf[8] + 8 * (void)j) touch:v128[2].super.super.isa didHitTestToDestination:v135 hostingChainIndex:v132];
                      }

                      id v142 = [v141 countByEnumeratingWithState:buf objects:v252 count:16];
                    }

                    while (v142);
                  }

                  id v131 = pointa;
                  a1 = v143;
                  ++v132;
                }

                double v134 = (char *)v134 + 1;
              }

              while (v134 != v131);
              id v147 = [v206 countByEnumeratingWithState:v228 objects:idx count:16];
              id v131 = v147;
            }

            while (v147);
          }

          __int128 v148 = v128;
          __int128 v149 = v213;
          v214 = v216;
          id v210 = v193;
          id v150 = v194;
          __int128 v204 = v149;
          NSMutableSet *v151 = [NSMutableSet setWithSet:*((void *)v148 + 35)];
          [v151 minusSet:v149];
          __int128 v254 = 0u;
          __int128 v255 = 0u;
          *(_OWORD *)v252 = 0u;
          __int128 v253 = 0u;
          id v217 = v151;
          id v152 = [v217 countByEnumeratingWithState:v252 objects:idx count:16];
          if (v152)
          {
            uint64_t v153 = *(void *)v253;
            do
            {
              for (k = 0LL; k != v152; k = (char *)k + 1)
              {
                if (*(void *)v253 != v153) {
                  objc_enumerationMutation(v217);
                }
                uint64_t v155 = [v252[8] objectAtIndex:k];
                if (v155 && (*(_BYTE *)(v155 + 32) & 1) != 0)
                {
                  sub_10005EBF0( (uint64_t)v228,  *(void *)(a1 + 16),  (uint64_t)&v225[8],  *(unsigned int *)(v155 + 8),  (uint64_t)v223);
                  uint64_t v156 = *(unsigned int *)(v155 + 8);
                  uint64_t v159 = BKLogTouchEvents(v157, v158);
                  v160 = v159;
                  if (os_log_type_enabled(v160, OS_LOG_TYPE_DEBUG))
                  {
                    uint64_t v166 = *(void *)(v207 + 8);
                    *(_DWORD *)buf = 67109376;
                    *(_DWORD *)&uint8_t buf[4] = v156;
                    *(_WORD *)&uint8_t buf[8] = 1024;
                    *(_DWORD *)&buf[10] = v166;
                    _os_log_debug_impl( (void *)&_mh_execute_header,  v160,  OS_LOG_TYPE_DEBUG,  "Adding hit test exit result: %X %d",  buf,  0xEu);
                  }

                  sub_100007C10((uint64_t)v214, (void *)v155, v148[5], *(void *)(v207 + 8), (CGFloat *)v228, 3LL);
                  double v161 = [v150 objectForKey:v156];
                  sub_100045B8C((uint64_t)v161, (uint64_t)v148);
                  if (![v161 count]) {
                    [v150 removeObjectForKey:v156];
                  }
                  uint64_t v163 = [v210 objectForKey:v156];
                  if (v163)
                  {
                    [*((id *)v148 + 35) removeObject:v155];
                  }

                  else
                  {
                    uint64_t v164 = BKLogTouchEvents(0LL, v162);
                    uint64_t v165 = [os_log_s class];
                    if (os_log_type_enabled(v165, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 67109120;
                      *(_DWORD *)&uint8_t buf[4] = v156;
                      _os_log_error_impl( (void *)&_mh_execute_header,  v165,  OS_LOG_TYPE_ERROR,  "_removeContact: missing destination for context %X",  buf,  8u);
                    }
                  }
                }
              }

              id v152 = [v217 countByEnumeratingWithState:v252 objects:idx count:16];
            }

            while (v152);
          }

LABEL_186:
          id v201 = (char *)v201 + 1;
        }

        while (v201 != v198);
        id v172 = [obj countByEnumeratingWithState:v218 objects:v227 count:16];
        id v198 = v172;
      }

      while (v172);
    }

    uint64_t IsFirstTouchDown = (uint64_t)[obj count];
    if (IsFirstTouchDown >= 1)
    {
      uint64_t IsFirstTouchDown = BKSHIDDigitizerEventIsFirstTouchDown(a2);
      if ((_DWORD)IsFirstTouchDown)
      {
        if (v200) {
          v200->_initialTouchDown = 1;
        }
        uint64_t TimeStamp = IOHIDEventGetTimeStamp(a2);
        double v176 = BSMonotonicReferencedTimeFromMachTime(TimeStamp);
        if (v200) {
          v200->_initialTouchTimestamp = v176;
        }
      }
    }

    uint64_t v177 = *(void *)(a1 + 16);
    if (v177)
    {
      uint64_t v178 = BKLogTouchEvents(IsFirstTouchDown, v174);
      uint64_t v179 = [os_log_s class];
      BOOL v180 = os_log_type_enabled(v179, OS_LOG_TYPE_DEBUG);

      if (v180)
      {
        BSDescriptionStream *v181 = [[BSDescriptionStream alloc] init];
        uint64_t v182 = *(void *)(v177 + 120);
        idx[0] = (CFIndex)_NSConcreteStackBlock;
        idx[1] = 3221225472LL;
        *(void *)&__int128 v234 = sub_10005F04C;
        *((void *)&v234 + 1) = &unk_1000B7840;
        id v183 = v181;
        *(void *)&__int128 v235 = v183;
        id v184 = [v183 appendIntegerMap:v182 withName:0 keyFormat:1 valueBlock:idx];
        uint64_t v186 = BKLogTouchEvents(v184, v185);
        uint64_t v187 = [os_log_s class];
        if (os_log_type_enabled(v187, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v252 = 138543362;
          *(void *)&v252[4] = v183;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v187,  OS_LOG_TYPE_DEBUG,  "destinations are now %{public}@",  v252,  0xCu);
        }
      }
    }

    sub_10006AC90(&v222);
  }

  else
  {
    __int128 v200 = 0LL;
  }

  return v200;
}

void sub_10006A93C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, void *a17, void *a18, uint64_t a19, void *a20, uint64_t a21, uint64_t a22, void *a23, void *a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, void *a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,id a51)
{
  _Block_object_dispose(&STACK[0x430], 8);
  _Block_object_dispose(&STACK[0x3B0], 8);
  _Block_object_dispose(&STACK[0x280], 8);

  sub_10006AC90(&a51);
  _Unwind_Resume(a1);
}

id *sub_10006AC90(id *a1)
{
  id v2 = *a1;
  *a1 = 0LL;

  id v3 = a1[1];
  a1[1] = 0LL;

  id v4 = a1[2];
  a1[2] = 0LL;

  return a1;
}

id sub_10006AF2C(uint64_t a1)
{
  id result = [*(id *)(*(void *)(a1 + 32) + 24) count];
  if (result) {
    return  [*(id *)(a1 + 40) appendInteger:[*(id *)(*(void *)(a1 + 32) + 24) count] withName:@"externalReferences"];
  }
  return result;
}

void *sub_10006AF9C(void *a1, uint64_t a2, uint64_t a3)
{
  if (!a1) {
    return 0LL;
  }
  v8.receiver = a1;
  v8.super_class = [BKTouchDestination class];
  id v3 = [super initWithContextID:a2 clientPort:a3];
  id v4 = v3;
  if (v3)
  {
    void v3[4] = 1LL;
    NSHashTable *v5 = [NSHashTable initWithOptions:517 capacity:8];
    uint64_t v6 = (void *)v4[3];
    v4[3] = v5;
  }

  return v4;
}

void *sub_10006B034(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [BKTouchDestination initWithTouchID:a2 destination:a3];
}

void sub_10006B3C8(id a1)
{
  BKDisplayAnnotationLocation *v1 = [[BKDisplayAnnotationLocation alloc] init];
  id v2 = (void *)qword_1000DC250;
  qword_1000DC250 = (uint64_t)v1;
}

void sub_10006BDCC(id a1)
{
  BKDisplayRenderOverlayPersistenceCoordinator *v1 = [[BKDisplayRenderOverlayPersistenceCoordinator alloc] init];
  id v2 = (void *)qword_1000DC260;
  qword_1000DC260 = (uint64_t)v1;
}

void sub_10006CB18(id a1)
{
  BKBootUIOverlayVendor *v1 = [[BKBootUIOverlayVendor alloc] init];
  id v4 = [BKFirstBootDetector sharedInstance];
  id v2 = [BKBootUIOverlayVendor initWithFirstBootDetector:v4];
  id v3 = (void *)qword_1000DC270;
  qword_1000DC270 = (uint64_t)v2;
}

void sub_10006E188(id a1)
{
  if (!sub_10001A8D4())
  {
    BKDisplayRenderOverlayManager *v1 = [[BKDisplayRenderOverlayManager alloc] init];
    BKDisplayRenderOverlayPersistenceCoordinator *v8 = [BKDisplayRenderOverlayPersistenceCoordinator sharedInstance];
    id v2 = sub_100065B98();
    id v3 = v2;
    BKDisplayBrightnessController *v4 = [BKDisplayBrightnessController sharedInstance];
    uint64_t v5 = [CAWindowServer serverIfRunning];
    id v6 = [BKDisplayRenderOverlayManager _initWithPersistenceCoordinator:v8 orientationManager:v3 backlightManager:v4 windowServer:v5];
    double v7 = (void *)qword_1000DC280;
    qword_1000DC280 = (uint64_t)v6;
  }

void sub_10006FE38(void *a1, void *a2)
{
  id v3 = a2;
  v10[0] = _NSConcreteStackBlock;
  uint64_t v4 = a1[4];
  uint64_t v5 = (void *)a1[5];
  id v6 = *(dispatch_queue_s **)(v4 + 8);
  _DWORD v10[2] = sub_10006FED8;
  v10[3] = &unk_1000B8140;
  v10[1] = 3221225472LL;
  id v11 = v3;
  uint64_t v12 = v4;
  id v7 = v5;
  uint64_t v8 = a1[6];
  id v13 = v7;
  uint64_t v14 = v8;
  id v9 = v3;
  dispatch_async(v6, v10);
}

id sub_10006FED8(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  if (v3 == v2[9]) {
    return [v2 _queue_continueAddingOverlayForReason:*(void *)(a1 + 48) generation:*(void *)(a1 + 56)];
  }
  id v4 = sub_10003F0B0();
  uint64_t v5 = [v4 autorelease];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 56);
    v9[0] = 67109378;
    v9[1] = v7;
    __int16 v10 = 2114;
    uint64_t v11 = v8;
    _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "addOverlay(%d-%{public}@): this overlay was removed or canceled; not continuing",
      (uint8_t *)v9,
      0x12u);
  }

  return [*(id *)(a1 + 32) invalidate];
}

void sub_10006FFD0(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  double v5 = BSContinuousMachTimeNow(v4);
  id v6 = sub_10003F0B0();
  uint64_t v7 = [v6 autorelease];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 56);
    uint64_t v9 = *(void *)(a1 + 32);
    double v10 = v5 - *(double *)(a1 + 64);
    int v15 = 67109634;
    int v16 = v8;
    __int16 v17 = 2114;
    uint64_t v18 = v9;
    __int16 v19 = 2048;
    double v20 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "addOverlay(%d-%{public}@): acquire returned in %gs",  (uint8_t *)&v15,  0x1Cu);
  }

  if (v4)
  {
    id v11 = sub_10003F0B0();
    uint64_t v12 = [v11];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 56);
      uint64_t v14 = *(void *)(a1 + 32);
      int v15 = 67109634;
      int v16 = v13;
      __int16 v17 = 2114;
      uint64_t v18 = v14;
      __int16 v19 = 2114;
      double v20 = v4;
      _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "addOverlay(%d-%{public}@): could not acquire activity assertion (but we shall continue anyway): %{public}@",  (uint8_t *)&v15,  0x1Cu);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void sub_100070140(uint64_t a1)
{
  id v2 = sub_10003F0B0();
  uint64_t v3 = v2;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v8 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "systemShellChangedWithPrimary: %{public}@",  buf,  0xCu);
  }

  double v5 = *(void **)(a1 + 40);
  id v6 = [NSString stringWithFormat:@"shell changed (%@)", *(void *)(a1 + 32)];
  [v5 _queue_updateOverlayForReason:v6];
}

void sub_100070218(uint64_t a1)
{
  id v2 = sub_10003F0B0();
  uint64_t v3 = v2;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v8 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "systemShellDidFinishLaunching: - %{public}@",  buf,  0xCu);
  }

  double v5 = *(void **)(a1 + 40);
  id v6 = [NSString stringWithFormat:@"shell launched (%@)" , *(void *)(a1 + 32)];
  [v5 _queue_updateOverlayForReason:v6];
}

id sub_1000702F0(uint64_t a1)
{
  id v2 = sub_10003F0B0();
  uint64_t v3 = [v2];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v9 = 138543362;
    uint64_t v10 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Re-evalutate - firstBootDetectorDidFinishFirstBoot - %{public}@",  (uint8_t *)&v9,  0xCu);
  }

  double v5 = *(void **)(a1 + 40);
  if (v5[7])
  {
    uint64_t v6 = BKLogDetailed();
    uint64_t v7 = [v6 autorelease];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Toggling underlay.", (uint8_t *)&v9, 2u);
    }

    [*(id *)(a1 + 40) _queue_removeUnderlay];
    [*(id *)(a1 + 40) _queue_addUnderlay];
    double v5 = *(void **)(a1 + 40);
  }

  return [v5 _queue_updateOverlayForReason:@"didFinishFirstBoot"];
}

void sub_100070404(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 104LL);
  id v3 = sub_10003F0B0();
  uint64_t v4 = (os_log_s *)v3;
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 40);
      int v9 = 138543362;
      uint64_t v10 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Unsustaining the boot overlay: %{public}@",  (uint8_t *)&v9,  0xCu);
    }

    *(_BYTE *)(*(void *)(a1 + 32) + 104LL) = 0;
    uint64_t v7 = *(_BYTE **)(a1 + 32);
    if (v7[105])
    {
      [v7 _queue_removeOverlayWithAnimationSettings:0];
      *(_BYTE *)(*(void *)(a1 + 32) + 105LL) = 0;
    }
  }

  else
  {
    if (v5)
    {
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = 138543362;
      uint64_t v10 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Can't unsustain nonexistent boot overlay: %{public}@",  (uint8_t *)&v9,  0xCu);
    }
  }

void sub_100070524(void *a1)
{
  uint64_t v2 = *(void *)(a1[4] + 72LL);
  id v3 = sub_10003F0B0();
  uint64_t v4 = v3;
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v5)
    {
      uint64_t v6 = a1[5];
      int v8 = 138543362;
      uint64_t v9 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Sustaining the boot overlay: %{public}@",  (uint8_t *)&v8,  0xCu);
    }

    *(_BYTE *)(a1[4] + 104LL) = 1;
    *(_BYTE *)(a1[4] + 105LL) = 0;
    *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = 1;
  }

  else
  {
    if (v5)
    {
      uint64_t v7 = a1[5];
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Can't persist a boot overlay that isn't there: %{public}@",  (uint8_t *)&v8,  0xCu);
    }
  }

void sub_100070640(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 72LL);
  id v3 = sub_10003F0B0();
  uint64_t v4 = [v3 autorelease];
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v5)
    {
      int v6 = *(_DWORD *)(a1 + 48);
      int v8 = 67109120;
      int v9 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Dismissing boot logo (pid:%d)",  (uint8_t *)&v8,  8u);
    }

    *(_BYTE *)(*(void *)(a1 + 32) + 104LL) = 0;
    *(_BYTE *)(*(void *)(a1 + 32) + 105LL) = 0;
    [*(id *)(a1 + 32) _queue_setScreenOwnerPID:*(unsigned int *)(a1 + 48)];
    [*(id *)(a1 + 32) _queue_removeOverlayWithAnimationSettings:*(void *)(a1 + 40)];
  }

  else
  {
    if (v5)
    {
      int v7 = *(_DWORD *)(a1 + 48);
      int v8 = 67109120;
      int v9 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Cannot dismiss nonexistent boot logo (pid:%d)",  (uint8_t *)&v8,  8u);
    }
  }

uint64_t sub_100070760(uint64_t result)
{
  *(_BYTE *)(*(void *)(*(void *)(result + 40) + 8LL) + 24LL) = *(void *)(*(void *)(result + 32) + 72LL) != 0LL;
  return result;
}

id sub_10007077C(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) hideAppleLogoOnLaunch];
  id v3 = *(void **)(a1 + 40);
  if (v2) {
    [v3 _queue_removeUnderlay];
  }
  else {
    [v3 _queue_addUnderlay];
  }
  return [*(id *)(a1 + 40) _queue_updateOverlayForReason:@"init"];
}

id sub_1000707C4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _queue_updateOverlayForReason:@"init 2"];
}

void sub_100070834(id a1)
{
  if (sub_10001A8D4())
  {
    uint64_t v1 = (void *)qword_1000DC290;
    qword_1000DC290 = 0LL;
  }

  else
  {
    BKBootUIPresenter *v2 = [[BKBootUIPresenter alloc] init];
    BKSystemShellSentinel *v9 = [[BKSystemShellSentinel sharedInstance] autorelease];
    BKAlternateSystemAppManager *v3 = [BKAlternateSystemAppManager sharedInstance];
    uint64_t v4 = [BKFirstBootDetector sharedInstance];
    BOOL v5 = [BKBootUIOverlayVendor sharedInstance];
    BKDisplayRenderOverlayManager *v6 = [BKDisplayRenderOverlayManager sharedInstance];
    int v7 = [BKBootUIPresenter initWithSystemAppSentinel:v9 alternateSystemAppManager:v3 firstBootDetector:v4 bootUIOverlayVendor:v5 renderOverlayManager:v6];
    int v8 = (void *)qword_1000DC290;
    qword_1000DC290 = (uint64_t)v7;

    uint64_t v1 = v9;
  }
}

void sub_100070C98(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = [BSObjCProtocol protocolForProtocol:[BKSSystemShellControlClientInterface class]];
  uint64_t v4 = [BSObjCProtocol protocolForProtocol:&BKSSystemShellControlServerInterface];
  BOOL v5 = [BSMutableServiceInterface interfaceWithIdentifier:BKSSystemShellControllerServiceName];
  [v5 setServer:v4];
  [v5 setClient:v7];
  int v6 = [BSServiceQuality userInitiated];
  [v3 setServiceQuality:v6];

  [v3 setInterface:v5];
  [v3 setInterfaceTarget:*(void *)(*(void *)(a1 + 32) + 16)];
  [v3 setTargetQueue:*(void *)(*(void *)(a1 + 32) + 24)];
  [v3 setInvalidationHandler:&stru_1000B81D0];
  [v3 setInterruptionHandler:^(NSNotification *v4) {
    stru_1000B81F0(v4);
}];
}

void sub_100070DCC(uint64_t a1, void *a2)
{
  uint64_t v3 = BKSSystemShellServiceDomainName;
  id v4 = a2;
  [v4 setDomain:v3];
  [v4 setService:BKSSystemShellControllerServiceName];
  [v4 setDelegate:*(void *)(a1 + 32)];
}

void sub_1000711E0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

BKNamespaceNode *__cdecl sub_100071964(id a1, NSString *a2, BKNamespaceNode *a3, BOOL a4)
{
  id v4 = a2;
  BKNamespaceNode *v5 = [[BKNamespaceNode alloc] init];
  [v5 setName:v4];

  return v5;
}

uint64_t sub_1000719A8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000719B8(uint64_t a1)
{
}

void sub_1000719C0(uint64_t a1, int a2, id obj)
{
}

id sub_1000719D4(id a1, id a2)
{
  return [BSDescriptionBuilder descriptionForObject:a2];
}

void sub_1000722C8(void *a1)
{
  id v1 = a1;
  uint64_t v2 = qword_1000DC2B0;
  if (qword_1000DC2B0
    || (uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[BKHIDSystemInterface sharedInstance](&OBJC_CLASS___BKHIDSystemInterface, "sharedInstance")),
        uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 HIDSystemChannel]),
        BOOL v5 = (void *)qword_1000DC2B0,
        qword_1000DC2B0 = v4,
        v5,
        v3,
        (uint64_t v2 = qword_1000DC2B0) != 0))
  {
    dispatch_mach_receive_barrier(v2, v1);
  }

  else
  {
    id v6 = sub_10003F280();
    os_log_s *v7 = v6;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v8 = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "BKHIDSystem HID server runloop not yet initialized",  v8,  2u);
    }
  }
}

void sub_1000723D0(id a1)
{
  BKHIDSystemInterface *v1 = [[BKHIDSystemInterface alloc] init];
  uint64_t v2 = (void *)qword_1000DC2A0;
  qword_1000DC2A0 = (uint64_t)v1;
}

id sub_100072D10(uint64_t a1, void *a2)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  _OWORD v3[2] = sub_100072D84;
  v3[3] = &unk_1000B8510;
  int v4 = *(_DWORD *)(a1 + 40);
  void v3[4] = *(void *)(a1 + 32);
  return [a2 matchSharingTouchesPolicy:stru_1000B84F0 orCancelTouchesPolicy:v3 orCombinedPolicy:stru_1000B8530];
}

NSNumber *sub_100072D84(uint64_t a1, int a2, double a3)
{
  BOOL v3 = *(_DWORD *)(a1 + 40) == a2 && *(double *)(a1 + 32) == a3;
  return [NSNumber numberWithInt:v3];
}

id sub_100072DB4(id a1, NSArray *a2)
{
  return sub_100072DBC(a2);
}

id sub_100072DBC(void *a1)
{
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  id v1 = a1;
  uint64_t v2 = (uint64_t)[v1 countByEnumeratingWithState:v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0LL; i != v2; ++i)
      {
        if (*(void *)v8 != v3) {
          objc_enumerationMutation(v1);
        }
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "BOOLValue", (void)v7))
        {
          uint64_t v2 = 1LL;
          goto LABEL_11;
        }
      }

      uint64_t v2 = (uint64_t)[v1 countByEnumeratingWithState:v7 objects:v11 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }

id sub_100072ED0(id a1, unsigned int a2, unsigned int a3)
{
  return [NSNumber numberWithBool:NO];
}

id sub_100072EDC(uint64_t a1, void *a2)
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  _OWORD v8[2] = sub_100072F70;
  v8[3] = &unk_1000B8428;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v9 = v4;
  uint64_t v10 = v5;
  id v6 = [a2 matchSharingTouchesPolicy:v8 orCancelTouchesPolicy:&stru_1000B8468 orCombinedPolicy:&stru_1000B8488];

  return v6;
}

NSNumber *sub_100072F70(uint64_t a1, int a2, int a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    LODWORD(v3) = *(_DWORD *)(v3 + 8);
  }
  if ((_DWORD)v3 == a2)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4) {
      LODWORD(v4) = *(_DWORD *)(v4 + 8);
    }
    BOOL v5 = (_DWORD)v4 == a3;
  }

  else
  {
    BOOL v5 = 0LL;
  }

  return [NSNumber numberWithInt:v5];
}

id sub_100072FB0(id a1, NSArray *a2)
{
  return sub_100072DBC(a2);
}

id sub_100072FB8(id a1, unsigned int a2, double a3)
{
  return [NSNumber numberWithBool:NO];
}

uint64_t sub_100072FC4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (_xpc_endpoint_s *)[v3 assertionEndpoint];
  BOOL v5 = [v3 assertionEndpoint];

  if (v5)
  {
    id v6 = xpc_connection_create_from_endpoint(v4);
    xpc_connection_set_target_queue(v6, *(dispatch_queue_t *)(*(void *)(a1 + 32) + 8LL));
    id location = *(id *)(a1 + 32);
    [from release];
from = v6;
[from retain];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10007315C;
    handler[3] = &unk_1000B8400;
    [v11 copy];
    id v10 = v3;
    [v12 copyWeak:from];
    xpc_connection_set_event_handler(v6, handler);
    [*(id *)(*(void *)(a1 + 32) + 24) addObject:v6];
    xpc_connection_resume(v6);
    xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_connection_send_message(v6, v7);

    [v12 release];
    [v11 release];
    [from release];
    [location release];
  }

  return 0LL;
}

void sub_10007312C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void sub_10007315C(uint64_t a1, void *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (a2 == &_xpc_error_connection_invalid || a2 == &_xpc_error_connection_interrupted)
  {
    uint64_t v6 = BKLogTouchDeliveryPolicy();
    xpc_object_t v7 = v6;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v8 = *(void **)(a1 + 32);
      int v19 = 138543362;
      double v20 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "TDPS server received policy invalidation %{public}@",  (uint8_t *)&v19,  0xCu);
    }

    id v9 = (void *)WeakRetained[3];
    id v10 = objc_loadWeakRetained((id *)(a1 + 48));
    [v9 removeObject:v10];

    uint64_t v11 = BKLogTouchDeliveryPolicy();
    os_log_s *v12 = [v11 autorelease];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      __int16 v17 = [WeakRetained _policy];
      int v19 = 138543362;
      double v20 = v17;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "Policy was %{public}@",  (uint8_t *)&v19,  0xCu);
    }

    uint64_t v13 = (void *)[WeakRetained _policy];
    uint64_t v14 = [v13 policyExcludingPolicyIdenticalTo:*(void *)(a1 + 32)];
    [WeakRetained _queue_setPolicy:v14];

    uint64_t v15 = BKLogTouchDeliveryPolicy();
    int v16 = [v15 autorelease];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v18 = (void *)[WeakRetained _policy];
      int v19 = 138543362;
      double v20 = v18;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "Policy is %{public}@",  (uint8_t *)&v19,  0xCu);
    }
  }
}

id sub_10007335C(uint64_t a1, void *a2)
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  _OWORD v8[2] = sub_100073428;
  v8[3] = &unk_1000B8348;
  id v9 = *(id *)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  _DWORD v6[2] = sub_1000734A0;
  v6[3] = &unk_1000B8370;
  id v7 = *(id *)(a1 + 32);
  uint64_t v4 = [a2 matchSharingTouchesPolicy:v8 orCancelTouchesPolicy:v6 orCombinedPolicy:&stru_1000B83B0];

  return v4;
}

id sub_100073428(uint64_t a1)
{
  uint64_t v1 = BKHostRequiresTouchesFromHostedContentEntitlement;
  uint64_t v2 = (void *)[*(id *)(a1 + 32) _xpcConnection];
  BOOL v3 = [BKSecurityManager hasEntitlement:v1 forConnection:v2];

  return v3;
}

id sub_1000734A0(uint64_t a1)
{
  uint64_t v1 = BKCancelsTouchesInHostedContentEntitlement;
  uint64_t v2 = (void *)[*(id *)(a1 + 32) _xpcConnection];
  BOOL v3 = [self hasEntitlement:v2 forConnection:v1];

  return v3;
}

id sub_100073518(id a1, NSArray *a2)
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  uint64_t v2 = a2;
  [v2 countByEnumeratingWithState:v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v6), "BOOLValue", (void)v10))
        {
          uint64_t v7 = 0LL;
          goto LABEL_11;
        }

        uint64_t v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      [v2 countByEnumeratingWithState:v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

  uint64_t v7 = 1LL;
LABEL_11:

  __int128 v8 = (void *)[NSNumber numberWithBool:v7];
  return v8;
}

void sub_100073678(id a1)
{
  BKTouchDeliveryPolicyServer *v1 = [[BKTouchDeliveryPolicyServer alloc] init];
  uint64_t v2 = (void *)qword_1000DC2B8;
  qword_1000DC2B8 = (uint64_t)v1;
}

uint64_t sub_1000736A0(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 20);
  else {
    return 0LL;
  }
}

void sub_1000736E0(_DWORD *a1, uint64_t a2)
{
  if ((*a1 & 0x80000000) != 0 || a1[1] != 24)
  {
    int v5 = -304;
  }

  else
  {
    int v4 = a1[6];
    id v3 = a1 + 6;
    if (v4 || v3[1] <= 0x1Fu)
    {
      int v5 = -309;
    }

    else
    {
      __int128 v6 = *(_OWORD *)(v3 + 9);
      v7[0] = *(_OWORD *)(v3 + 5);
      v7[1] = v6;
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472LL;
      _OWORD v8[2] = sub_10000F680;
      v8[3] = &unk_1000B7108;
      void v8[4] = a2 + 36;
      if ((sub_1000138EC( (uint64_t)"_BKHIDXXGetBacklightFactor",  BKBackBoardClientEntitlement,  (uint64_t)v7) & 1) != 0)
      {
        sub_10000F680((uint64_t)v8);
        *(_DWORD *)(a2 + 32) = 0;
        *(NDR_record_t *)(a2 + 24) = NDR_record;
        *(_DWORD *)(a2 + 4) = 40;
        return;
      }

      int v5 = 5;
    }
  }

  *(_DWORD *)(a2 + 32) = v5;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
}

void sub_1000737DC(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 36)
  {
    int v3 = -304;
    goto LABEL_7;
  }

  if (*(_DWORD *)(a1 + 36) || *(_DWORD *)(a1 + 40) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return;
  }

  int v4 = *(_DWORD *)(a1 + 32);
  __int128 v5 = *(_OWORD *)(a1 + 72);
  v7[0] = *(_OWORD *)(a1 + 56);
  v7[1] = v5;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  _OWORD v8[2] = sub_10000F6D4;
  v8[3] = &unk_1000B7AF0;
  int v9 = v4;
  if (sub_1000138EC( (uint64_t)"_BKHIDXXSetBacklightFactorPending",  BKBackBoardClientEntitlement,  (uint64_t)v7))
  {
    sub_10000F6D4((uint64_t)v8);
    int v6 = 0;
  }

  else
  {
    int v6 = 5;
  }

  *(_DWORD *)(a2 + 32) = v6;
}

void sub_1000738C8(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 48)
  {
    int v3 = -304;
  }

  else if (*(_DWORD *)(a1 + 48) || *(_DWORD *)(a1 + 52) < 0x20u)
  {
    int v3 = -309;
  }

  else
  {
    char v4 = *(_BYTE *)(a1 + 40);
    char v5 = *(_BYTE *)(a1 + 44);
    uint64_t v6 = *(void *)(a1 + 32);
    __int128 v7 = *(_OWORD *)(a1 + 84);
    v8[0] = *(_OWORD *)(a1 + 68);
    v8[1] = v7;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    _DWORD v9[2] = sub_10000F7D8;
    void v9[3] = &unk_1000B60B0;
    void v9[4] = v6;
    char v10 = v4;
    char v11 = v5;
    if (sub_1000138EC( (uint64_t)"_BKHIDXXSetBacklightFactorWithFadeDuration",  BKBackBoardClientEntitlement,  (uint64_t)v8))
    {
      sub_10000F7D8((uint64_t)v9);
      int v3 = 0;
    }

    else
    {
      int v3 = 5;
    }
  }

  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
}

void sub_1000739C0(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 52)
  {
    int v3 = -304;
    goto LABEL_7;
  }

  if (*(_DWORD *)(a1 + 52) || *(_DWORD *)(a1 + 56) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return;
  }

  char v4 = *(_BYTE *)(a1 + 40);
  char v5 = *(_BYTE *)(a1 + 44);
  char v6 = *(_BYTE *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 32);
  __int128 v8 = *(_OWORD *)(a1 + 88);
  v10[0] = *(_OWORD *)(a1 + 72);
  v10[1] = v8;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  _OWORD v11[2] = sub_10000F7FC;
  _OWORD v11[3] = &unk_1000B5B60;
  void v11[4] = v7;
  char v12 = v4;
  char v13 = v5;
  char v14 = v6;
  if (sub_1000138EC( (uint64_t)"_BKHIDXXNotifySetBacklightFactorWithFadeDurationAsync",  BKBackBoardClientEntitlement,  (uint64_t)v10))
  {
    sub_10000F7FC((uint64_t)v11);
    int v9 = 0;
  }

  else
  {
    int v9 = 5;
  }

  *(_DWORD *)(a2 + 32) = v9;
}

void sub_100073AC4(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 40)
  {
    int v3 = -304;
    goto LABEL_7;
  }

  if (*(_DWORD *)(a1 + 40) || *(_DWORD *)(a1 + 44) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return;
  }

  uint64_t v4 = *(void *)(a1 + 32);
  __int128 v5 = *(_OWORD *)(a1 + 76);
  v7[0] = *(_OWORD *)(a1 + 60);
  v7[1] = v5;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  _OWORD v8[2] = sub_10000F82C;
  v8[3] = &unk_1000B7108;
  void v8[4] = v4;
  if (sub_1000138EC( (uint64_t)"_BKHIDXXSetMinimumBrightnessLevelWithFadeDuration",  BKBackBoardClientEntitlement,  (uint64_t)v7))
  {
    sub_10000F82C((uint64_t)v8);
    int v6 = 0;
  }

  else
  {
    int v6 = 5;
  }

  *(_DWORD *)(a2 + 32) = v6;
}

void sub_100073BB0(_DWORD *a1, uint64_t a2)
{
  if ((*a1 & 0x80000000) != 0 || a1[1] != 24)
  {
    int v5 = -304;
  }

  else
  {
    int v4 = a1[6];
    int v3 = a1 + 6;
    if (v4 || v3[1] <= 0x1Fu)
    {
      int v5 = -309;
    }

    else
    {
      __int128 v6 = *(_OWORD *)(v3 + 9);
      v7[0] = *(_OWORD *)(v3 + 5);
      v7[1] = v6;
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472LL;
      _OWORD v8[2] = sub_10000FA84;
      v8[3] = &unk_1000B7108;
      void v8[4] = a2 + 36;
      if (sub_100013818(BKDisplayBrightnessEntitlement, (uint64_t)v7))
      {
        sub_10000FA84((uint64_t)v8);
        *(_DWORD *)(a2 + 32) = 0;
        *(NDR_record_t *)(a2 + 24) = NDR_record;
        *(_DWORD *)(a2 + 4) = 40;
        return;
      }

      int v5 = 5;
    }
  }

  *(_DWORD *)(a2 + 32) = v5;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
}

void sub_100073CA4(_DWORD *a1, uint64_t a2)
{
  if ((*a1 & 0x80000000) != 0 || a1[1] != 24)
  {
    int v5 = -304;
  }

  else
  {
    int v4 = a1[6];
    int v3 = a1 + 6;
    if (v4 || v3[1] <= 0x1Fu)
    {
      int v5 = -309;
    }

    else
    {
      __int128 v6 = *(_OWORD *)(v3 + 9);
      v7[0] = *(_OWORD *)(v3 + 5);
      v7[1] = v6;
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472LL;
      _OWORD v8[2] = sub_10000FACC;
      v8[3] = &unk_1000B7108;
      void v8[4] = a2 + 36;
      if (sub_100013818(BKDisplayBrightnessEntitlement, (uint64_t)v7))
      {
        sub_10000FACC((uint64_t)v8);
        *(_DWORD *)(a2 + 32) = 0;
        *(NDR_record_t *)(a2 + 24) = NDR_record;
        *(_DWORD *)(a2 + 4) = 40;
        return;
      }

      int v5 = 5;
    }
  }

  *(_DWORD *)(a2 + 32) = v5;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
}

void sub_100073D98(_DWORD *a1, uint64_t a2)
{
  if ((*a1 & 0x80000000) != 0 || a1[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }

  else
  {
    int v3 = (void *)[qword_1000DBF88 propertyForKey:@"DisplayBackLightArchitecture"];
    uint64_t v5 = [NSNumber class];
    id v6 = v3;
    uint64_t v7 = v6;
    if (v5)
    {
      if ((objc_opt_isKindOfClass(v6, v5) & 1) != 0) {
        __int128 v8 = v7;
      }
      else {
        __int128 v8 = 0LL;
      }
    }

    else
    {
      __int128 v8 = 0LL;
    }

    id v9 = v8;

    unsigned __int8 v10 = [v9 unsignedCharValue];
    *(_BYTE *)(a2 + 36) = v10;
    *(_DWORD *)(a2 + 32) = 0;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 40;
  }

void sub_100073E80(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 && *(_DWORD *)(a1 + 24) == 1 && *(_DWORD *)(a1 + 4) == 56)
  {
    if (*(_BYTE *)(a1 + 39) == 1 && (int v4 = *(_DWORD *)(a1 + 40), v4 == *(_DWORD *)(a1 + 52)))
    {
      if (!*(_DWORD *)(a1 + 56) && *(_DWORD *)(a1 + 60) > 0x1Fu)
      {
        uint64_t v6 = *(void *)(a1 + 28);
        __int128 v7 = *(_OWORD *)(a1 + 92);
        v8[0] = *(_OWORD *)(a1 + 76);
        v8[1] = v7;
        *(_DWORD *)(a2 + 32) = sub_10000F870(v6, v4, v8);
        mig_deallocate(*(void *)(a1 + 28), *(unsigned int *)(a1 + 40));
        *(void *)(a1 + 2_Block_object_dispose(va, 8) = 0LL;
        *(_DWORD *)(a1 + 40) = 0;
        return;
      }

      int v5 = -309;
    }

    else
    {
      int v5 = -300;
    }
  }

  else
  {
    int v5 = -304;
  }

  *(_DWORD *)(a2 + 32) = v5;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
}

void sub_100073F58(_DWORD *a1, uint64_t a2)
{
  if ((*a1 & 0x80000000) != 0 || a1[1] != 24)
  {
    int v5 = -304;
  }

  else
  {
    int v4 = a1[6];
    int v3 = a1 + 6;
    if (v4 || v3[1] <= 0x1Fu)
    {
      int v5 = -309;
    }

    else
    {
      __int128 v6 = *(_OWORD *)(v3 + 9);
      v7[0] = *(_OWORD *)(v3 + 5);
      v7[1] = v6;
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472LL;
      __int128 v8[2] = sub_10000FB14;
      v8[3] = &unk_1000B7108;
      void v8[4] = a2 + 36;
      if ((sub_1000138EC( (uint64_t)"_BKHIDXXAmbientLightSensorExists",  BKBackBoardClientEntitlement,  (uint64_t)v7) & 1) != 0)
      {
        sub_10000FB14((uint64_t)v8);
        *(_DWORD *)(a2 + 32) = 0;
        *(NDR_record_t *)(a2 + 24) = NDR_record;
        *(_DWORD *)(a2 + 4) = 40;
        return;
      }

      int v5 = 5;
    }
  }

  *(_DWORD *)(a2 + 32) = v5;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
}

void sub_100074054(_DWORD *a1, uint64_t a2)
{
  if ((*a1 & 0x80000000) != 0 || a1[1] != 24)
  {
    int v5 = -304;
    goto LABEL_7;
  }

  int v4 = a1[6];
  int v3 = a1 + 6;
  if (v4 || v3[1] <= 0x1Fu)
  {
    int v5 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v5;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return;
  }

  __int128 v6 = *(_OWORD *)(v3 + 9);
  v13[0] = *(_OWORD *)(v3 + 5);
  v13[1] = v6;
  id v7 = sub_1000138EC( (uint64_t)"_BKHIDXXAmbientLightSensorDisableAutoBrightness",  BKBackBoardClientEntitlement,  (uint64_t)v13);
  if ((_DWORD)v7)
  {
    uint64_t v8 = BKLogBacklight(v7);
    os_log_s *v9 = [os_log_s new];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "BKAmbientLightSensorDisableAutoBrightness",  buf,  2u);
    }

    unsigned __int8 v10 = [BKDisplayBrightnessController sharedInstance];
    char v14 = @"DisplayAutoBrightnessActive";
    *(void *)buf = __kCFBooleanFalse;
    char v11 = [NSDictionary dictionaryWithObjects:buf forKeys:&v14 count:1];
    [v10 setProperty:v11 forKey:@"DisplayAutoBrightnessStatus"];

    int v12 = 0;
  }

  else
  {
    int v12 = 5;
  }

  *(_DWORD *)(a2 + 32) = v12;
}

void sub_1000741E0(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 36)
  {
    int v3 = -304;
    goto LABEL_7;
  }

  if (*(_DWORD *)(a1 + 36) || *(_DWORD *)(a1 + 40) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return;
  }

  char v4 = *(_BYTE *)(a1 + 32);
  __int128 v5 = *(_OWORD *)(a1 + 72);
  v7[0] = *(_OWORD *)(a1 + 56);
  v7[1] = v5;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  __int128 v8[2] = sub_10000FB5C;
  v8[3] = &unk_1000B7E00;
  char v9 = v4;
  if (sub_1000138EC( (uint64_t)"_BKHIDXXAmbientLightSensorEnableAutoBrightness",  BKBackBoardClientEntitlement,  (uint64_t)v7))
  {
    sub_10000FB5C((uint64_t)v8);
    int v6 = 0;
  }

  else
  {
    int v6 = 5;
  }

  *(_DWORD *)(a2 + 32) = v6;
}

void sub_1000742CC(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 36)
  {
    int v3 = -304;
    goto LABEL_7;
  }

  if (*(_DWORD *)(a1 + 36) || *(_DWORD *)(a1 + 40) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return;
  }

  char v4 = *(_BYTE *)(a1 + 32);
  __int128 v5 = *(_OWORD *)(a1 + 72);
  v7[0] = *(_OWORD *)(a1 + 56);
  v7[1] = v5;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  __int128 v8[2] = sub_100011C90;
  v8[3] = &unk_1000B7E00;
  char v9 = v4;
  if (sub_1000138EC( (uint64_t)"_BKHIDXXSetDeviceInterfaceOrientation",  BKBackBoardClientEntitlement,  (uint64_t)v7))
  {
    sub_100011C90((uint64_t)v8);
    int v6 = 0;
  }

  else
  {
    int v6 = 5;
  }

  *(_DWORD *)(a2 + 32) = v6;
}

void sub_1000743B8(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 36)
  {
    int v3 = -304;
    goto LABEL_7;
  }

  if (*(_DWORD *)(a1 + 36) || *(_DWORD *)(a1 + 40) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return;
  }

  char v4 = *(_BYTE *)(a1 + 32);
  __int128 v5 = *(_OWORD *)(a1 + 72);
  v7[0] = *(_OWORD *)(a1 + 56);
  v7[1] = v5;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  __int128 v8[2] = sub_100011D10;
  v8[3] = &unk_1000B7E00;
  char v9 = v4;
  if (sub_100013818(BKBackBoardSetDeviceOrientationEntitlement, (uint64_t)v7))
  {
    sub_100011D10((uint64_t)v8);
    int v6 = 0;
  }

  else
  {
    int v6 = 5;
  }

  *(_DWORD *)(a2 + 32) = v6;
}

void sub_10007449C(_DWORD *a1, uint64_t a2)
{
  if ((*a1 & 0x80000000) != 0 || a1[1] != 36)
  {
    int v3 = -304;
    goto LABEL_7;
  }

  if (a1[9] || a1[10] <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return;
  }

  uint64_t v4 = BKLogUISensor();
  os_log_s *v5 = [v4 autorelease];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "RequestEstimatedProximityEvents ignored on this OS",  v6,  2u);
  }

  *(_DWORD *)(a2 + 32) = 0;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  *(_DWORD *)(a2 + 4) = 40;
}

void sub_10007456C(_DWORD *a1, uint64_t a2)
{
  if ((*a1 & 0x80000000) != 0
    || (uint64_t v4 = a1[1], v4 < 0x28)
    || v4 > 0x428
    || ((unsigned int v5 = a1[9], v5 <= 0x400) ? (v6 = (int)v4 - 40 >= v5) : (v6 = 0),
        (unsigned int v7 = ((v5 + 3) & 0xFFFFFFFC) + 40, v6) ? (v8 = (_DWORD)v4 == v7) : (v8 = 0),
        !v8 || !memchr(a1 + 10, 0, v4 - 40)))
  {
    int v9 = -304;
LABEL_12:
    *(_DWORD *)(a2 + 32) = v9;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return;
  }

  unsigned __int8 v10 = (_DWORD *)((char *)a1 + ((v4 + 3) & 0x1FFFFFFFCLL));
  if (*v10 || v10[1] <= 0x1Fu)
  {
    int v9 = -309;
    goto LABEL_12;
  }

  sub_10000FCE8();
  *(_DWORD *)(a2 + 32) = 0;
}

void sub_100074634(_DWORD *a1, uint64_t a2)
{
  if ((*a1 & 0x80000000) != 0 || a1[1] != 24)
  {
    int v3 = -304;
    goto LABEL_7;
  }

  if (a1[6] || a1[7] <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return;
  }

  uint64_t v4 = BKLogUISensor();
  os_log_s *v5 = [v4 autorelease];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "ResetProximityCalibration ignored on this OS",  v6,  2u);
  }

  *(_DWORD *)(a2 + 32) = 0;
}

void sub_1000746EC(_DWORD *a1, uint64_t a2)
{
  if ((*a1 & 0x80000000) != 0 || a1[1] != 24)
  {
    int v3 = -304;
    goto LABEL_7;
  }

  if (a1[6] || a1[7] <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return;
  }

  uint64_t v4 = BKLogUISensor();
  os_log_s *v5 = v4;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "ProximityDidUnoccludeAfterScreenWake ignored on this OS",  v6,  2u);
  }

  *(_DWORD *)(a2 + 32) = 0;
}

void sub_1000747A4(_DWORD *a1, uint64_t a2)
{
  if ((*a1 & 0x80000000) != 0 || a1[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }

  else
  {
    BKHIDEventProcessorRegistry *v3 = [BKHIDEventProcessorRegistry sharedInstance];
    BKHIDProximityEventProcessor *v5 = [v3 eventProcessorOfClass:[BKHIDProximityEventProcessor class]];
    BOOL v6 = [v5 autorelease];

    *(_BYTE *)(a2 + 36) = [v6 isObjectWithinProximity];
    *(_DWORD *)(a2 + 32) = 0;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 40;
  }

void sub_10007485C(_DWORD *a1, uint64_t a2)
{
  if ((*a1 & 0x80000000) != 0 || a1[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }

  else
  {
    BKHIDEventProcessorRegistry *v3 = [BKHIDEventProcessorRegistry sharedInstance];
    BKHIDProximityEventProcessor *v5 = [v3 eventProcessorOfClass:[BKHIDProximityEventProcessor class]];
    BOOL v6 = [v5 autorelease];

    *(_BYTE *)(a2 + 36) = [v6 isProximityDetectionActive];
    *(_DWORD *)(a2 + 32) = 0;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 40;
  }

void sub_100074914(_DWORD *a1, uint64_t a2)
{
  if ((*a1 & 0x80000000) != 0 || a1[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }

  else
  {
    BKHIDEventProcessorRegistry *v3 = [BKHIDEventProcessorRegistry sharedInstance];
    BKHIDDirectTouchEventProcessor *v5 = [v3 eventProcessorOfClass:[BKHIDDirectTouchEventProcessor class]];
    BOOL v6 = [v5 autorelease];

    *(_BYTE *)(a2 + 36) = [v6 shouldIgnoreTouchesWhileObjectInProximity];
    *(_DWORD *)(a2 + 32) = 0;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 40;
  }

void sub_1000749CC(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 36)
  {
    int v3 = -304;
    goto LABEL_7;
  }

  if (*(_DWORD *)(a1 + 36) || *(_DWORD *)(a1 + 40) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return;
  }

  char v4 = *(_BYTE *)(a1 + 32);
  __int128 v5 = *(_OWORD *)(a1 + 72);
  v7[0] = *(_OWORD *)(a1 + 56);
  v7[1] = v5;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  __int128 v8[2] = sub_10000FD4C;
  v8[3] = &unk_1000B7E00;
  char v9 = v4;
  if (sub_1000138EC( (uint64_t)"_BKHIDXXSetObjectInProximityIgnoresTouches",  BKBackBoardClientEntitlement,  (uint64_t)v7))
  {
    sub_10000FD4C((uint64_t)v8);
    int v6 = 0;
  }

  else
  {
    int v6 = 5;
  }

  *(_DWORD *)(a2 + 32) = v6;
}

void sub_100074AB8(_DWORD *a1, uint64_t a2)
{
  if ((*a1 & 0x80000000) != 0 || a1[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }

  else
  {
    BKHIDEventProcessorRegistry *v3 = [BKHIDEventProcessorRegistry sharedInstance];
    BKButtonHIDEventProcessor *v5 = [v3 eventProcessorOfClass:[BKButtonHIDEventProcessor class]];
    int v6 = [v5 autorelease];
    *(_DWORD *)(a2 + 36) = [v6 ringerState];

    *(_DWORD *)(a2 + 32) = 0;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 40;
  }

void sub_100074B6C(_DWORD *a1, uint64_t a2)
{
  if ((*a1 & 0x80000000) != 0 || a1[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }

  else
  {
    BKHIDEventProcessorRegistry *v3 = [BKHIDEventProcessorRegistry sharedInstance];
    BKSmartCoverHIDEventProcessor *v5 = [v3 eventProcessorOfClass:[BKSmartCoverHIDEventProcessor class]];
    int v6 = [v5 autorelease];
    *(_BYTE *)(a2 + 36) = [v6 isSmartCoverClosed];

    *(_DWORD *)(a2 + 32) = 0;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 40;
  }

void sub_100074C20(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 48)
  {
    int v10 = -304;
  }

  else
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(unsigned __int16 *)(a1 + 40);
    uint64_t v5 = *(unsigned __int16 *)(a1 + 44);
    BKHIDEventProcessorRegistry *v6 = [BKHIDEventProcessorRegistry sharedInstance];
    BKButtonHIDEventProcessor *v8 = [v6 eventProcessorOfClass:[BKButtonHIDEventProcessor class]];
    char v9 = (void *)[v8 autorelease];
    [v9 cancelButtonForSenderID:v3 uagePage:v4 usage:v5];

    int v10 = 0;
  }

  *(_DWORD *)(a2 + 32) = v10;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
}

_DWORD *sub_100074CD8(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0) {
    goto LABEL_16;
  }
  uint64_t v3 = result;
  uint64_t v4 = result[1];
  unsigned int v5 = result[9];
  if (v5 > 0x400) {
    goto LABEL_16;
  }
  unsigned int v6 = (v5 + 3) & 0xFFFFFFFC;
  uint64_t v8 = 1064LL;
  id result = memchr(result + 10, 0, v8 - 40);
  if (result)
  {
    char v9 = (char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL);
    if (!*(_DWORD *)v9 && *((_DWORD *)v9 + 1) > 0x1Fu)
    {
      int v11 = *(_DWORD *)((char *)v3 + v6 + 40);
      __int128 v12 = *(_OWORD *)(v9 + 36);
      v13[0] = *(_OWORD *)(v9 + 20);
      v13[1] = v12;
      id result = (_DWORD *)sub_10000FE24((_BYTE *)v3 + 40, v11, (uint64_t)v13);
      *(_DWORD *)(a2 + 32) = (_DWORD)result;
      return result;
    }

    int v10 = -309;
  }

  else
  {
LABEL_16:
    int v10 = -304;
  }

  *(_DWORD *)(a2 + 32) = v10;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_100074DE4(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) == 0
    && (uint64_t v3 = result, v4 = result[1], v4 >= 0x28)
    && v4 <= 0x428
    && ((unsigned int v5 = result[9], v5 <= 0x400) ? (v6 = (int)v4 - 40 >= v5) : (v6 = 0),
        (unsigned int v7 = ((v5 + 3) & 0xFFFFFFFC) + 40, v6) ? (v8 = (_DWORD)v4 == v7) : (v8 = 0),
        v8 && (id result = memchr(result + 10, 0, v4 - 40)) != 0LL))
  {
    int v10 = (char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL);
    if (!*(_DWORD *)v10 && *((_DWORD *)v10 + 1) > 0x1Fu)
    {
      __int128 v11 = *(_OWORD *)(v10 + 36);
      v12[0] = *(_OWORD *)(v10 + 20);
      v12[1] = v11;
      id result = (_DWORD *)sub_100010904((uint64_t)(v3 + 10), (uint64_t)v12);
      *(_DWORD *)(a2 + 32) = (_DWORD)result;
      return result;
    }

    int v9 = -309;
  }

  else
  {
    int v9 = -304;
  }

  *(_DWORD *)(a2 + 32) = v9;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

void sub_100074ECC(_DWORD *a1, uint64_t a2)
{
  if ((*a1 & 0x80000000) != 0 || a1[1] != 24)
  {
    int v5 = -304;
    goto LABEL_7;
  }

  int v4 = a1[6];
  uint64_t v3 = a1 + 6;
  if (v4 || v3[1] <= 0x1Fu)
  {
    int v5 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v5;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return;
  }

  __int128 v6 = *(_OWORD *)(v3 + 9);
  v12[0] = *(_OWORD *)(v3 + 5);
  v12[1] = v6;
  if (sub_100013818(BKBackBoardClientEntitlement, (uint64_t)v12))
  {
    BKHIDEventProcessorRegistry *v7 = [BKHIDEventProcessorRegistry sharedInstance];
    BKHIDDirectTouchEventProcessor *v9 = [v7 eventProcessorOfClass:[BKHIDDirectTouchEventProcessor class]];
    int v10 = (void *)[v9 autorelease];

    [v10 cancelTouchesOnAllDisplays];
    int v11 = 0;
  }

  else
  {
    int v11 = 5;
  }

  *(_DWORD *)(a2 + 32) = v11;
}

void sub_100074FBC(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 && *(_DWORD *)(a1 + 24) == 1 && *(_DWORD *)(a1 + 4) == 56)
  {
    if (*(_BYTE *)(a1 + 39) == 1 && (int v4 = *(_DWORD *)(a1 + 40), v4 == *(_DWORD *)(a1 + 52)))
    {
      if (!*(_DWORD *)(a1 + 56) && *(_DWORD *)(a1 + 60) > 0x1Fu)
      {
        uint64_t v6 = *(void *)(a1 + 28);
        __int128 v7 = *(_OWORD *)(a1 + 92);
        v8[0] = *(_OWORD *)(a1 + 76);
        v8[1] = v7;
        *(_DWORD *)(a2 + 32) = sub_100010A0C(v6, v4, (uint64_t)v8);
        mig_deallocate(*(void *)(a1 + 28), *(unsigned int *)(a1 + 40));
        *(void *)(a1 + 2_Block_object_dispose(va, 8) = 0LL;
        *(_DWORD *)(a1 + 40) = 0;
        return;
      }

      int v5 = -309;
    }

    else
    {
      int v5 = -300;
    }
  }

  else
  {
    int v5 = -304;
  }

  *(_DWORD *)(a2 + 32) = v5;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
}

void sub_100075094(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) == 0) {
    goto LABEL_2;
  }
  int v3 = -304;
  if (*(_DWORD *)(a1 + 24) != 1) {
    goto LABEL_3;
  }
  uint64_t v5 = *(unsigned int *)(a1 + 4);
  if (*(_BYTE *)(a1 + 39) != 1) {
    goto LABEL_17;
  }
  unsigned int v6 = *(_DWORD *)(a1 + 60);
  int v3 = -304;
  if ((_DWORD)v5 != ((v6 + 3) & 0xFFFFFFFC) + 64) {
    goto LABEL_2;
  }
  int v7 = *(_DWORD *)(a1 + 40);
  if (v7 != *(_DWORD *)(a1 + 52))
  {
LABEL_17:
    int v3 = -300;
    goto LABEL_3;
  }

  if (!memchr((const void *)(a1 + 64), 0, v5 - 64))
  {
LABEL_2:
    int v3 = -304;
    goto LABEL_3;
  }

  uint64_t v8 = ((v5 + 3) & 0x1FFFFFFFCLL) + a1;
  if (!*(_DWORD *)v8 && *(_DWORD *)(v8 + 4) > 0x1Fu)
  {
    uint64_t v9 = *(void *)(a1 + 28);
    __int128 v10 = *(_OWORD *)(v8 + 36);
    v11[0] = *(_OWORD *)(v8 + 20);
    v11[1] = v10;
    *(_DWORD *)(a2 + 32) = sub_100010BEC(v9, v7, a1 + 64, (uint64_t)v11);
    mig_deallocate(*(void *)(a1 + 28), *(unsigned int *)(a1 + 40));
    *(void *)(a1 + 2_Block_object_dispose(va, 8) = 0LL;
    *(_DWORD *)(a1 + 40) = 0;
    return;
  }

  int v3 = -309;
LABEL_3:
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
}

void sub_1000751E0(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 && *(_DWORD *)(a1 + 24) == 1 && *(_DWORD *)(a1 + 4) == 56)
  {
    if (*(_BYTE *)(a1 + 39) == 1 && (int v4 = *(_DWORD *)(a1 + 40), v4 == *(_DWORD *)(a1 + 52)))
    {
      if (!*(_DWORD *)(a1 + 56) && *(_DWORD *)(a1 + 60) > 0x1Fu)
      {
        uint64_t v6 = *(void *)(a1 + 28);
        __int128 v7 = *(_OWORD *)(a1 + 92);
        v8[0] = *(_OWORD *)(a1 + 76);
        v8[1] = v7;
        *(_DWORD *)(a2 + 32) = sub_100010DF8(v6, v4, v8);
        mig_deallocate(*(void *)(a1 + 28), *(unsigned int *)(a1 + 40));
        *(void *)(a1 + 2_Block_object_dispose(va, 8) = 0LL;
        *(_DWORD *)(a1 + 40) = 0;
        return;
      }

      int v5 = -309;
    }

    else
    {
      int v5 = -300;
    }
  }

  else
  {
    int v5 = -304;
  }

  *(_DWORD *)(a2 + 32) = v5;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
}

void sub_1000752B8(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) == 0 || *(_DWORD *)(a1 + 24) != 1 || *(_DWORD *)(a1 + 4) != 56)
  {
    int v4 = -304;
    goto LABEL_10;
  }

  if (*(_BYTE *)(a1 + 39) != 1 || *(_DWORD *)(a1 + 40) != *(_DWORD *)(a1 + 52))
  {
    int v4 = -300;
    goto LABEL_10;
  }

  if (*(_DWORD *)(a1 + 56) || *(_DWORD *)(a1 + 60) <= 0x1Fu)
  {
    int v4 = -309;
LABEL_10:
    *(_DWORD *)(a2 + 32) = v4;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return;
  }

  __int128 v5 = *(_OWORD *)(a1 + 92);
  v7[0] = *(_OWORD *)(a1 + 76);
  v7[1] = v5;
  else {
    int v6 = 5;
  }
  *(_DWORD *)(a2 + 32) = v6;
  mig_deallocate(*(void *)(a1 + 28), *(unsigned int *)(a1 + 40));
  *(void *)(a1 + 2_Block_object_dispose(va, 8) = 0LL;
  *(_DWORD *)(a1 + 40) = 0;
}

void sub_1000753AC(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 && *(_DWORD *)(a1 + 24) == 1 && *(_DWORD *)(a1 + 4) == 56)
  {
    if (*(_BYTE *)(a1 + 39) == 1 && (unsigned int v4 = *(_DWORD *)(a1 + 40), v4 == *(_DWORD *)(a1 + 52)))
    {
      if (!*(_DWORD *)(a1 + 56) && *(_DWORD *)(a1 + 60) > 0x1Fu)
      {
        uint64_t v6 = *(void *)(a1 + 28);
        __int128 v7 = *(_OWORD *)(a1 + 92);
        v8[0] = *(_OWORD *)(a1 + 76);
        v8[1] = v7;
        sub_1000111DC(v6, v4, (uint64_t)v8);
        *(_DWORD *)(a2 + 32) = 0;
        mig_deallocate(*(void *)(a1 + 28), *(unsigned int *)(a1 + 40));
        *(void *)(a1 + 2_Block_object_dispose(va, 8) = 0LL;
        *(_DWORD *)(a1 + 40) = 0;
        return;
      }

      int v5 = -309;
    }

    else
    {
      int v5 = -300;
    }
  }

  else
  {
    int v5 = -304;
  }

  *(_DWORD *)(a2 + 32) = v5;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
}

uint64_t sub_100075484(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 40)
  {
    int v4 = -304;
    goto LABEL_7;
  }

  int v3 = *(_DWORD *)(result + 40);
  result += 40LL;
  if (v3 || *(_DWORD *)(result + 4) <= 0x1Fu)
  {
    int v4 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v4;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }

  __int128 v5 = *(_OWORD *)(result + 36);
  v7[0] = *(_OWORD *)(result + 20);
  v7[1] = v5;
  id result = sub_1000139E4( (uint64_t)"_BKHIDXXPlayHaptic",  BKFastHapticPlayEntitlement,  BKBackBoardClientEntitlement,  (uint64_t)v7);
  if ((_DWORD)result) {
    int v6 = 0;
  }
  else {
    int v6 = 5;
  }
  *(_DWORD *)(a2 + 32) = v6;
  return result;
}

void sub_100075538(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 && *(_DWORD *)(a1 + 24) == 1 && *(_DWORD *)(a1 + 4) == 56)
  {
    if (*(_BYTE *)(a1 + 39) == 1 && (unsigned int v4 = *(_DWORD *)(a1 + 40), v4 == *(_DWORD *)(a1 + 52)))
    {
      if (!*(_DWORD *)(a1 + 56) && *(_DWORD *)(a1 + 60) > 0x1Fu)
      {
        uint64_t v6 = *(void *)(a1 + 28);
        __int128 v7 = *(_OWORD *)(a1 + 92);
        v8[0] = *(_OWORD *)(a1 + 76);
        v8[1] = v7;
        sub_100011040(v6, v4, (uint64_t)v8);
        *(_DWORD *)(a2 + 32) = 0;
        mig_deallocate(*(void *)(a1 + 28), *(unsigned int *)(a1 + 40));
        *(void *)(a1 + 2_Block_object_dispose(va, 8) = 0LL;
        *(_DWORD *)(a1 + 40) = 0;
        return;
      }

      int v5 = -309;
    }

    else
    {
      int v5 = -300;
    }
  }

  else
  {
    int v5 = -304;
  }

  *(_DWORD *)(a2 + 32) = v5;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
}

_DWORD *sub_100075610(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0) {
    goto LABEL_16;
  }
  int v3 = result;
  uint64_t v4 = result[1];
  unsigned int v5 = result[10];
  if (v5 > 0x400) {
    goto LABEL_16;
  }
  unsigned int v6 = (v5 + 3) & 0xFFFFFFFC;
  uint64_t v8 = 1068LL;
  id result = memchr(result + 11, 0, v8 - 44);
  if (!result)
  {
LABEL_16:
    int v10 = -304;
    goto LABEL_17;
  }

  uint64_t v9 = (char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL);
  if (*(_DWORD *)v9 || *((_DWORD *)v9 + 1) <= 0x1Fu)
  {
    int v10 = -309;
LABEL_17:
    *(_DWORD *)(a2 + 32) = v10;
    NDR_record_t v11 = NDR_record;
    goto LABEL_18;
  }

  int v12 = v3[8];
  int v13 = *(_DWORD *)((char *)v3 + v6 + 44);
  char v14 = *((_BYTE *)v3 + v6 + 48);
  __int128 v15 = *(_OWORD *)(v9 + 36);
  v16[0] = *(_OWORD *)(v9 + 20);
  v16[1] = v15;
  id result = (_DWORD *)sub_1000113E8(v12, (uint64_t)(v3 + 11), v13, v14, a2 + 36, v16);
  *(_DWORD *)(a2 + 32) = (_DWORD)result;
  NDR_record_t v11 = NDR_record;
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }

void sub_100075744(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 36)
  {
    int v3 = -304;
  }

  else if (*(_DWORD *)(a1 + 36) || *(_DWORD *)(a1 + 40) < 0x20u)
  {
    int v3 = -309;
  }

  else
  {
    int v4 = *(_DWORD *)(a1 + 32);
    __int128 v5 = *(_OWORD *)(a1 + 72);
    v6[0] = *(_OWORD *)(a1 + 56);
    v6[1] = v5;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    _OWORD v7[2] = sub_1000115E0;
    v7[3] = &unk_1000B7AF0;
    int v8 = v4;
    if (sub_1000139E4( (uint64_t)"_BKHIDXXTouchStreamInvalidate",  BKTouchStreamsEntitlement,  BKBackBoardClientEntitlement,  (uint64_t)v6))
    {
      sub_1000115E0((uint64_t)v7);
      int v3 = 0;
    }

    else
    {
      int v3 = 5;
    }
  }

  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
}

void sub_100075838(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 52)
  {
    int v3 = -304;
    goto LABEL_7;
  }

  if (*(_DWORD *)(a1 + 52) || *(_DWORD *)(a1 + 56) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return;
  }

  int v4 = *(_DWORD *)(a1 + 32);
  char v5 = *(_BYTE *)(a1 + 36);
  char v6 = *(_BYTE *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 44);
  __int128 v8 = *(_OWORD *)(a1 + 88);
  v10[0] = *(_OWORD *)(a1 + 72);
  v10[1] = v8;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  _OWORD v11[2] = sub_100011568;
  _OWORD v11[3] = &unk_1000B5C28;
  char v13 = v5;
  char v14 = v6;
  void v11[4] = v7;
  int v12 = v4;
  if (sub_1000139E4( (uint64_t)"_BKHIDXXTouchStreamSetEventDispatchMode",  BKTouchStreamsEntitlement,  BKBackBoardClientEntitlement,  (uint64_t)v10))
  {
    sub_100011568((uint64_t)v11);
    int v9 = 0;
  }

  else
  {
    int v9 = 5;
  }

  *(_DWORD *)(a2 + 32) = v9;
}

void sub_100075948(_DWORD *a1, uint64_t a2)
{
  int v3 = -304;
  if ((*a1 & 0x80000000) == 0)
  {
    uint64_t v5 = a1[1];
    if (v5 >= 0x28 && v5 <= 0xA8)
    {
      uint64_t v6 = a1[8];
      if (v6 > 0x20
        || (v6 <= (v5 - 40) >> 2 ? (BOOL v7 = (_DWORD)v5 == 4 * (_DWORD)v6 + 40) : (BOOL v7 = 0), !v7))
      {
        int v3 = -304;
        goto LABEL_13;
      }

      __int128 v8 = (char *)a1 + ((v5 + 3) & 0x1FFFFFFFCLL);
      if (*(_DWORD *)v8 || *((_DWORD *)v8 + 1) < 0x20u)
      {
        int v3 = -309;
        goto LABEL_13;
      }

      uint64_t v9 = *(unsigned int *)((char *)a1 + (4 * v6) + 36);
      __int128 v10 = *(_OWORD *)(v8 + 36);
      v32[0] = *(_OWORD *)(v8 + 20);
      v32[1] = v10;
      uint64_t v11 = BSPIDForAuditToken(v32);
      id v12 = sub_100013898(BKTransferTouchesEntitlement, (uint64_t)v32);
      if ((_DWORD)v12)
      {
        uint64_t ClientConnectionManager = BKHIDEventRoutingGetClientConnectionManager(v12, v13);
        __int128 v15 = [ClientConnectionManager autorelease];
        int v16 = (void *)[v15 bundleIDForPID:v11];

        id v17 = [v16 isEqual:@"com.apple.springboard"];
        if ((_DWORD)v17)
        {
          if ((_DWORD)v6)
          {
            BKHIDEventProcessorRegistry *v19 = [BKHIDEventProcessorRegistry sharedInstance];
            BKHIDDirectTouchEventProcessor *v21 = [v19 eventProcessorOfClass:[BKHIDDirectTouchEventProcessor class]];
            uint64_t v22 = v21;

            [v22 transferTouchIdentifiers:a1 + 9 count:v6 toContextID:v9];
            int v3 = 0;
LABEL_25:

            goto LABEL_13;
          }

          uint64_t v30 = BKLogTouchEvents(v17, v18);
          os_log_s *v25 = v30;
          if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
            goto LABEL_23;
          }
          uint64_t v31 = BSProcessDescriptionForPID(v11);
          int v28 = [v31 autorelease];
          *(_DWORD *)buf = 138543362;
          uint64_t v34 = v28;
          id v29 = "TouchTransfer: %{public}@ requested transfer of no touches";
          goto LABEL_27;
        }

        uint64_t v26 = BKLogTouchEvents(v17, v18);
        os_log_s *v25 = [v26];
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          uint64_t v27 = BSProcessDescriptionForPID(v11);
          int v28 = [v27 autorelease];
          *(_DWORD *)buf = 138543362;
          uint64_t v34 = v28;
          id v29 = "TouchTransfer: %{public}@ is not an authorized client";
LABEL_27:
          _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, v29, buf, 0xCu);
        }
      }

      else
      {
        uint64_t v23 = BKLogTouchEvents(v12, v13);
        int v16 = v23;
        if (!os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
        {
LABEL_24:
          int v3 = 5;
          goto LABEL_25;
        }

        uint64_t v24 = BSProcessDescriptionForPID(v11);
        os_log_s *v25 = v24;
        *(_DWORD *)buf = 138543362;
        uint64_t v34 = v25;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v16,  OS_LOG_TYPE_ERROR,  "TouchTransfer: %{public}@ is not an authorized client",  buf,  0xCu);
      }

LABEL_23:
      goto LABEL_24;
    }
  }

void sub_100075C28(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) == 0) {
    goto LABEL_2;
  }
  int v3 = -304;
  if (*(_DWORD *)(a1 + 24) != 1) {
    goto LABEL_3;
  }
  uint64_t v6 = *(unsigned int *)(a1 + 4);
  if (*(_BYTE *)(a1 + 39) != 1) {
    goto LABEL_17;
  }
  unsigned int v7 = *(_DWORD *)(a1 + 52);
  if (v7 > 0x20)
  {
LABEL_2:
    int v3 = -304;
LABEL_3:
    *(_DWORD *)(a2 + 32) = v3;
    NDR_record_t v4 = NDR_record;
    goto LABEL_4;
  }

  int v3 = -304;
  __int128 v8 = (float *)(a1 + 4 * v7);
  int v9 = *(_DWORD *)(a1 + 40);
  if (v9 != *((_DWORD *)v8 + 17))
  {
LABEL_17:
    int v3 = -300;
    goto LABEL_3;
  }

  uint64_t v10 = ((v6 + 3) & 0x1FFFFFFFCLL) + a1;
  if (*(_DWORD *)v10 || *(_DWORD *)(v10 + 4) <= 0x1Fu)
  {
    int v3 = -309;
    goto LABEL_3;
  }

  int v11 = *((_DWORD *)v8 + 14);
  float v12 = v8[15];
  float v13 = v8[16];
  uint64_t v14 = *(void *)(a1 + 28);
  __int128 v15 = *(_OWORD *)(v10 + 36);
  v16[0] = *(_OWORD *)(v10 + 20);
  v16[1] = v15;
  *(_DWORD *)(a2 + 32) = sub_10001164C(a1 + 56, v7, v11, v14, v9, a2 + 36, (uint64_t)v16, v12, v13);
  mig_deallocate(*(void *)(a1 + 28), *(unsigned int *)(a1 + 40));
  *(void *)(a1 + 2_Block_object_dispose(va, 8) = 0LL;
  *(_DWORD *)(a1 + 40) = 0;
  NDR_record_t v4 = NDR_record;
  if (!*(_DWORD *)(a2 + 32))
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 40;
    return;
  }

void sub_100075D78(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 44)
  {
    int v3 = -304;
    goto LABEL_7;
  }

  if (*(_DWORD *)(a1 + 44) || *(_DWORD *)(a1 + 48) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return;
  }

  int v4 = *(_DWORD *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 36);
  __int128 v6 = *(_OWORD *)(a1 + 80);
  v8[0] = *(_OWORD *)(a1 + 64);
  v8[1] = v6;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  _DWORD v9[2] = sub_1000118CC;
  void v9[3] = &unk_1000B5BE8;
  void v9[4] = v5;
  int v10 = v4;
  if (sub_1000139E4( (uint64_t)"_BKHIDXXDigitizerTouchSetOffset",  BKDetachTouchesEntitlement,  BKBackBoardClientEntitlement,  (uint64_t)v8))
  {
    sub_1000118CC((uint64_t)v9);
    int v7 = 0;
  }

  else
  {
    int v7 = 5;
  }

  *(_DWORD *)(a2 + 32) = v7;
}

void sub_100075E78(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 && *(_DWORD *)(a1 + 24) == 1 && *(_DWORD *)(a1 + 4) == 60)
  {
    if (*(_BYTE *)(a1 + 39) == 1 && (int v4 = *(_DWORD *)(a1 + 40), v4 == *(_DWORD *)(a1 + 56)))
    {
      if (!*(_DWORD *)(a1 + 60) && *(_DWORD *)(a1 + 64) > 0x1Fu)
      {
        int v6 = *(_DWORD *)(a1 + 52);
        uint64_t v7 = *(void *)(a1 + 28);
        __int128 v8 = *(_OWORD *)(a1 + 96);
        v9[0] = *(_OWORD *)(a1 + 80);
        v9[1] = v8;
        *(_DWORD *)(a2 + 32) = sub_100011944(v6, v7, v4, (uint64_t)v9);
        mig_deallocate(*(void *)(a1 + 28), *(unsigned int *)(a1 + 40));
        *(void *)(a1 + 2_Block_object_dispose(va, 8) = 0LL;
        *(_DWORD *)(a1 + 40) = 0;
        return;
      }

      int v5 = -309;
    }

    else
    {
      int v5 = -300;
    }
  }

  else
  {
    int v5 = -304;
  }

  *(_DWORD *)(a2 + 32) = v5;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
}

void sub_100075F54(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 44)
  {
    int v3 = -304;
    goto LABEL_7;
  }

  if (*(_DWORD *)(a1 + 44) || *(_DWORD *)(a1 + 48) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return;
  }

  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = *(_DWORD *)(a1 + 40);
  __int128 v6 = *(_OWORD *)(a1 + 80);
  v8[0] = *(_OWORD *)(a1 + 64);
  v8[1] = v6;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  _OWORD v9[2] = sub_100011BE8;
  void v9[3] = &unk_1000B5BE8;
  void v9[4] = v4;
  int v10 = v5;
  if (sub_1000138EC((uint64_t)"_BKHIDXXResetUserEventTimer", BKBackBoardClientEntitlement, (uint64_t)v8))
  {
    sub_100011BE8((uint64_t)v9);
    int v7 = 0;
  }

  else
  {
    int v7 = 5;
  }

  *(_DWORD *)(a2 + 32) = v7;
}

void sub_100076048(_DWORD *a1, uint64_t a2)
{
  if ((*a1 & 0x80000000) != 0 || a1[1] != 24)
  {
    int v5 = -304;
    goto LABEL_7;
  }

  int v4 = a1[6];
  int v3 = a1 + 6;
  if (v4 || v3[1] <= 0x1Fu)
  {
    int v5 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v5;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return;
  }

  __int128 v6 = *(_OWORD *)(v3 + 9);
  v9[0] = *(_OWORD *)(v3 + 5);
  v9[1] = v6;
  if (sub_1000138EC((uint64_t)"_BKHIDXXNotifyOnNextUserEvent", BKBackBoardClientEntitlement, (uint64_t)v9))
  {
    int v7 = [BKUserEventTimer sharedInstance];
    [v7 notifyOnNextUserEvent];

    int v8 = 0;
  }

  else
  {
    int v8 = 5;
  }

  *(_DWORD *)(a2 + 32) = v8;
}

void sub_100076110(_DWORD *a1, uint64_t a2)
{
  if ((*a1 & 0x80000000) != 0 || a1[1] != 24)
  {
    int v5 = -304;
  }

  else
  {
    int v4 = a1[6];
    int v3 = a1 + 6;
    if (v4 || v3[1] <= 0x1Fu)
    {
      int v5 = -309;
    }

    else
    {
      __int128 v6 = *(_OWORD *)(v3 + 9);
      v7[0] = *(_OWORD *)(v3 + 5);
      v7[1] = v6;
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472LL;
      _OWORD v8[2] = sub_100011C30;
      v8[3] = &unk_1000B7108;
      void v8[4] = a2 + 36;
      if (sub_100013818(BKBackBoardLastUserEventTimeEntitlement, (uint64_t)v7))
      {
        sub_100011C30((uint64_t)v8);
        *(_DWORD *)(a2 + 32) = 0;
        *(NDR_record_t *)(a2 + 24) = NDR_record;
        *(_DWORD *)(a2 + 4) = 44;
        return;
      }

      int v5 = 5;
    }
  }

  *(_DWORD *)(a2 + 32) = v5;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
}

void sub_100076204(_DWORD *a1, uint64_t a2)
{
  if ((*a1 & 0x80000000) != 0 || a1[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }

  else
  {
    BKUserEventTimer *v3 = [BKUserEventTimer sharedInstance];
    *(_BYTE *)(a2 + 36) = [v3 isSafeToResetIdleTimer];

    *(_DWORD *)(a2 + 32) = 0;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 40;
  }

void sub_10007628C(_DWORD *a1, uint64_t a2)
{
  if ((*a1 & 0x80000000) != 0 || a1[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }

  else
  {
    id v3 = sub_100065B98();
    int v4 = [v3 autorelease];
    *(_DWORD *)(a2 + 36) = sub_1000667B0((uint64_t)v4);

    *(_DWORD *)(a2 + 32) = 0;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 40;
  }

void sub_100076314(_DWORD *a1, uint64_t a2)
{
  if ((*a1 & 0x80000000) != 0 || a1[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }

  else
  {
    id v3 = sub_100065B98();
    int v4 = v3;
    *(_DWORD *)(a2 + 36) = sub_100066880((uint64_t)v4);

    *(_DWORD *)(a2 + 32) = 0;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 40;
  }

_DWORD *sub_10007639C(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0) {
    goto LABEL_16;
  }
  id v3 = result;
  uint64_t v4 = result[1];
  unsigned int v5 = result[9];
  if (v5 > 0x400) {
    goto LABEL_16;
  }
  unsigned int v6 = (v5 + 3) & 0xFFFFFFFC;
  uint64_t v8 = 1064LL;
  id result = memchr(result + 10, 0, v8 - 40);
  if (result)
  {
    int v9 = (char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL);
    if (!*(_DWORD *)v9 && *((_DWORD *)v9 + 1) > 0x1Fu)
    {
      char v11 = *((_BYTE *)v3 + v6 + 40);
      __int128 v12 = *(_OWORD *)(v9 + 36);
      v13[0] = *(_OWORD *)(v9 + 20);
      v13[1] = v12;
      id result = (_DWORD *)sub_100011D54((uint64_t)(v3 + 10), v11, v13);
      *(_DWORD *)(a2 + 32) = (_DWORD)result;
      return result;
    }

    int v10 = -309;
  }

  else
  {
LABEL_16:
    int v10 = -304;
  }

  *(_DWORD *)(a2 + 32) = v10;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

void sub_1000764A8(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 40)
  {
    int v3 = -304;
  }

  else if (*(_DWORD *)(a1 + 40) || *(_DWORD *)(a1 + 44) < 0x20u)
  {
    int v3 = -309;
  }

  else
  {
    int v4 = *(_DWORD *)(a1 + 32);
    char v5 = *(_BYTE *)(a1 + 36);
    __int128 v6 = *(_OWORD *)(a1 + 76);
    v7[0] = *(_OWORD *)(a1 + 60);
    v7[1] = v6;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    _OWORD v8[2] = sub_100011E60;
    v8[3] = &unk_1000B5C48;
    char v12 = v5;
    int v9 = v4;
    __int128 v10 = *(_OWORD *)(a1 + 60);
    __int128 v11 = *(_OWORD *)(a1 + 76);
    if (sub_1000138EC((uint64_t)"_BKHIDXXLockOrientation", BKBackBoardClientEntitlement, (uint64_t)v7))
    {
      sub_100011E60((uint64_t)v8);
      int v3 = 0;
    }

    else
    {
      int v3 = 5;
    }
  }

  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
}

void sub_1000765A8(_DWORD *a1, uint64_t a2)
{
  if ((*a1 & 0x80000000) != 0 || a1[1] != 24)
  {
    int v5 = -304;
    goto LABEL_7;
  }

  int v4 = a1[6];
  int v3 = a1 + 6;
  if (v4 || v3[1] <= 0x1Fu)
  {
    int v5 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v5;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return;
  }

  __int128 v6 = *(_OWORD *)(v3 + 9);
  v9[0] = *(_OWORD *)(v3 + 5);
  v9[1] = v6;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  _OWORD v10[2] = sub_100011EE0;
  v10[3] = &unk_1000B5C68;
  __int128 v7 = *(_OWORD *)(v3 + 9);
  __int128 v11 = *(_OWORD *)(v3 + 5);
  __int128 v12 = v7;
  if (sub_1000138EC((uint64_t)"_BKHIDXXUnlockOrientation", BKBackBoardClientEntitlement, (uint64_t)v9))
  {
    sub_100011EE0((uint64_t)v10);
    int v8 = 0;
  }

  else
  {
    int v8 = 5;
  }

  *(_DWORD *)(a2 + 32) = v8;
}

void sub_100076694(_DWORD *a1, uint64_t a2)
{
  if ((*a1 & 0x80000000) != 0 || a1[1] != 24)
  {
    int v5 = -304;
  }

  else
  {
    int v4 = a1[6];
    int v3 = a1 + 6;
    if (v4 || v3[1] <= 0x1Fu)
    {
      int v5 = -309;
    }

    else
    {
      __int128 v6 = *(_OWORD *)(v3 + 9);
      v7[0] = *(_OWORD *)(v3 + 5);
      v7[1] = v6;
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472LL;
      _OWORD v8[2] = sub_100011F3C;
      v8[3] = &unk_1000B60D0;
      void v8[4] = a2 + 36;
      void v8[5] = a2 + 40;
      if ((sub_1000138EC( (uint64_t)"_BKHIDXXIsOrientationLockedWithOrientation",  BKBackBoardClientEntitlement,  (uint64_t)v7) & 1) != 0)
      {
        sub_100011F3C((uint64_t)v8);
        *(_DWORD *)(a2 + 32) = 0;
        *(NDR_record_t *)(a2 + 24) = NDR_record;
        *(_DWORD *)(a2 + 4) = 44;
        return;
      }

      int v5 = 5;
    }
  }

  *(_DWORD *)(a2 + 32) = v5;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
}

void sub_100076794(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 && *(_DWORD *)(a1 + 24) == 1 && *(_DWORD *)(a1 + 4) == 68)
  {
    if (*(unsigned __int16 *)(a1 + 38) << 16 == 1114112)
    {
      if (!*(_DWORD *)(a1 + 68) && *(_DWORD *)(a1 + 72) > 0x1Fu)
      {
        uint64_t v4 = *(unsigned int *)(a1 + 28);
        double v5 = *(double *)(a1 + 48);
        float v6 = *(float *)(a1 + 56);
        float v7 = *(float *)(a1 + 60);
        float v8 = *(float *)(a1 + 64);
        __int128 v9 = *(_OWORD *)(a1 + 104);
        v10[0] = *(_OWORD *)(a1 + 88);
        v10[1] = v9;
        sub_100011F98(v4, (uint64_t)v10, v5, v6, v7, v8);
        *(_DWORD *)(a2 + 32) = 0;
        return;
      }

      int v3 = -309;
    }

    else
    {
      int v3 = -300;
    }
  }

  else
  {
    int v3 = -304;
  }

  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
}

void sub_100076858(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 && *(_DWORD *)(a1 + 24) == 1 && *(_DWORD *)(a1 + 4) == 56)
  {
    if (*(unsigned __int16 *)(a1 + 38) << 16 == 1114112)
    {
      if (!*(_DWORD *)(a1 + 56) && *(_DWORD *)(a1 + 60) > 0x1Fu)
      {
        uint64_t v4 = *(unsigned int *)(a1 + 28);
        int v5 = *(unsigned __int8 *)(a1 + 48);
        int v6 = *(unsigned __int8 *)(a1 + 52);
        __int128 v7 = *(_OWORD *)(a1 + 92);
        v8[0] = *(_OWORD *)(a1 + 76);
        v8[1] = v7;
        sub_100012038(v4, v5, v6, (uint64_t)v8);
        *(_DWORD *)(a2 + 32) = 0;
        return;
      }

      int v3 = -309;
    }

    else
    {
      int v3 = -300;
    }
  }

  else
  {
    int v3 = -304;
  }

  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
}

void sub_100076918(_DWORD *a1, uint64_t a2)
{
  if ((*a1 & 0x80000000) != 0 || a1[1] != 24)
  {
    int v5 = -304;
    goto LABEL_7;
  }

  int v4 = a1[6];
  int v3 = a1 + 6;
  if (v4 || v3[1] <= 0x1Fu)
  {
    int v5 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v5;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return;
  }

  __int128 v6 = *(_OWORD *)(v3 + 9);
  v11[0] = *(_OWORD *)(v3 + 5);
  v11[1] = v6;
  BOOL v7 = sub_100013818(BKDisplayBrightnessEntitlement, (uint64_t)v11);
  float v8 = [BKDisplayBrightnessController sharedInstance];
  __int128 v9 = v8;
  if (v7) {
    [v8 brightnessLevel];
  }
  else {
    [v8 unentitledBrightnessLevel];
  }
  *(_DWORD *)(a2 + 36) = v10;

  *(_DWORD *)(a2 + 32) = 0;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  *(_DWORD *)(a2 + 4) = 40;
}

uint64_t sub_1000769FC(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 && *(_DWORD *)(a1 + 24) == 1 && *(_DWORD *)(a1 + 4) == 40)
  {
    if (*(unsigned __int16 *)(a1 + 38) << 16 == 1114112)
    {
      uint64_t v3 = a1 + 40;
      if (*(_DWORD *)(a1 + 40) || *(_DWORD *)(a1 + 44) < 0x20u)
      {
        uint64_t result = 4294966987LL;
      }

      else
      {
        uint64_t v5 = *(unsigned int *)(a1 + 28);
        __int128 v6 = *(_OWORD *)(v3 + 36);
        v7[0] = *(_OWORD *)(v3 + 20);
        v7[1] = v6;
        uint64_t result = sub_1000120C8(v5, v7);
      }
    }

    else
    {
      uint64_t result = 4294966996LL;
    }
  }

  else
  {
    uint64_t result = 4294966992LL;
  }

  *(_DWORD *)(a2 + 32) = result;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

void sub_100076AAC(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 36)
  {
    int v3 = -304;
  }

  else if (*(_DWORD *)(a1 + 36) || *(_DWORD *)(a1 + 40) < 0x20u)
  {
    int v3 = -309;
  }

  else
  {
    int v4 = *(_DWORD *)(a1 + 32);
    __int128 v11 = *(_OWORD *)(a1 + 72);
    *(_OWORD *)buf = *(_OWORD *)(a1 + 56);
    __int128 v13 = v11;
    uint64_t v5 = [BSAuditToken tokenFromAuditToken:buf];
    BSProcessHandle *v6 = [BSProcessHandle processHandleForAuditToken:v5];

    id v7 = [v6 isValid];
    if ((_DWORD)v7)
    {
      [BKDisplayBrightnessUpdateTransaction beginImplicitTransaction];
      float v8 = [BKDisplayBrightnessUpdateTransactionManager sharedInstance];
      LODWORD(v9) = v4;
      [v8 setDisplayBrightness:0 permanently:v9];
      int v3 = 0;
    }

    else
    {
      uint64_t v10 = BKLogBacklight(v7);
      float v8 = [v10 floatValue];
      if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v6;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v8,  OS_LOG_TYPE_ERROR,  "Ignoring implicit brightness transaction request because sender is invalid: %{public}@",  buf,  0xCu);
      }

      int v3 = 5;
    }
  }

  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
}

void sub_100076C44(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 40)
  {
    int v3 = -304;
    goto LABEL_7;
  }

  if (*(_DWORD *)(a1 + 40) || *(_DWORD *)(a1 + 44) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return;
  }

  int v4 = *(_DWORD *)(a1 + 32);
  char v5 = *(_BYTE *)(a1 + 36);
  __int128 v6 = *(_OWORD *)(a1 + 76);
  v8[0] = *(_OWORD *)(a1 + 60);
  v8[1] = v6;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  _OWORD v9[2] = sub_10001233C;
  void v9[3] = &unk_1000B5C88;
  int v10 = v4;
  char v11 = v5;
  if (sub_100013818(BKDisplayBrightnessEntitlement, (uint64_t)v8))
  {
    sub_10001233C((uint64_t)v9);
    int v7 = 0;
  }

  else
  {
    int v7 = 5;
  }

  *(_DWORD *)(a2 + 32) = v7;
}

_DWORD *sub_100076D30(_DWORD *result, uint64_t a2)
{
  int v2 = -304;
  if ((*result & 0x80000000) == 0)
  {
    if (result[1] == 24) {
      int v2 = 0;
    }
    else {
      int v2 = -304;
    }
  }

  *(_DWORD *)(a2 + 32) = v2;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

void sub_100076D60(_DWORD *a1, uint64_t a2)
{
  if ((*a1 & 0x80000000) != 0 || a1[1] != 24)
  {
    int v5 = -304;
    goto LABEL_7;
  }

  int v4 = a1[6];
  int v3 = a1 + 6;
  if (v4 || v3[1] <= 0x1Fu)
  {
    int v5 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v5;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return;
  }

  __int128 v6 = *(_OWORD *)(v3 + 9);
  v9[0] = *(_OWORD *)(v3 + 5);
  v9[1] = v6;
  if (sub_100013818(BKDisplayBrightnessEntitlement, (uint64_t)v9))
  {
    BKDisplayBrightnessUpdateTransactionManager *v7 = [BKDisplayBrightnessUpdateTransactionManager sharedInstance];
    [v7 restoreSystemDisplayBrightness];

    int v8 = 0;
  }

  else
  {
    int v8 = 5;
  }

  *(_DWORD *)(a2 + 32) = v8;
}

void sub_100076E20(_DWORD *a1, uint64_t a2)
{
  if ((*a1 & 0x80000000) != 0 || a1[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }

  else
  {
    BKDisplayBrightnessController *v3 = [BKDisplayBrightnessController sharedInstance];
    *(_BYTE *)(a2 + 36) = [v3 displayBrightnessCurve];

    *(_DWORD *)(a2 + 32) = 0;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 40;
  }

void sub_100076EA8(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 36)
  {
    int v3 = -304;
    goto LABEL_7;
  }

  if (*(_DWORD *)(a1 + 36) || *(_DWORD *)(a1 + 40) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return;
  }

  char v4 = *(_BYTE *)(a1 + 32);
  __int128 v5 = *(_OWORD *)(a1 + 72);
  v7[0] = *(_OWORD *)(a1 + 56);
  v7[1] = v5;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  _OWORD v8[2] = sub_10001238C;
  v8[3] = &unk_1000B7E00;
  char v9 = v4;
  if (sub_100013818(BKDisplayBrightnessEntitlement, (uint64_t)v7))
  {
    sub_10001238C((uint64_t)v8);
    int v6 = 0;
  }

  else
  {
    int v6 = 5;
  }

  *(_DWORD *)(a2 + 32) = v6;
}

void sub_100076F8C(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 36)
  {
    int v3 = -304;
    goto LABEL_7;
  }

  if (*(_DWORD *)(a1 + 36) || *(_DWORD *)(a1 + 40) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return;
  }

  char v4 = *(_BYTE *)(a1 + 32);
  __int128 v5 = *(_OWORD *)(a1 + 72);
  v7[0] = *(_OWORD *)(a1 + 56);
  v7[1] = v5;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  _OWORD v8[2] = sub_1000123D0;
  v8[3] = &unk_1000B7E00;
  char v9 = v4;
  if (sub_100013818(BKDisplayBrightnessEntitlement, (uint64_t)v7))
  {
    sub_1000123D0((uint64_t)v8);
    int v6 = 0;
  }

  else
  {
    int v6 = 5;
  }

  *(_DWORD *)(a2 + 32) = v6;
}

void sub_100077070(_DWORD *a1, uint64_t a2)
{
  if ((*a1 & 0x80000000) == 0
    && (uint64_t v3 = a1[1], v3 >= 0x28)
    && v3 <= 0x428
    && ((v4 = a1[9], v4 <= 0x400) ? (BOOL v5 = (int)v3 - 40 >= v4) : (BOOL v5 = 0),
        (unsigned int v6 = ((v4 + 3) & 0xFFFFFFFC) + 40, v5) ? (v7 = (_DWORD)v3 == v6) : (v7 = 0),
        v7 && (int v8 = a1 + 10, memchr(a1 + 10, 0, v3 - 40))))
  {
    if (*v8) {
      char v9 = [NSString stringWithUTF8String:v8];
    }
    else {
      char v9 = 0LL;
    }
    BKHIDEventProcessorRegistry *v10 = [BKHIDEventProcessorRegistry sharedInstance];
    BKHumanPresenceHIDEventProcessor *v12 = [v10 eventProcessorOfClass:[BKHumanPresenceHIDEventProcessor class]];
    __int128 v13 = [v12 autorelease];

    uint64_t v16 = 0LL;
    double v17 = 0.0;
    char v15 = 0;
    [v13 getStatus:&v16 presence:&v15 proximityInCentimeters:&v17 forDisplayUUID:v9];
    *(_DWORD *)(a2 + 36) = v16;
    *(_BYTE *)(a2 + 40) = v15;
    float v14 = v17;
    *(float *)(a2 + 44) = v14;

    *(_DWORD *)(a2 + 32) = 0;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 48;
  }

  else
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }

void sub_1000771D0(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 40)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }

  else
  {
    uint64_t v3 = *(void *)(a1 + 32);
    BKHIDEventProcessorRegistry *v4 = [BKHIDEventProcessorRegistry sharedInstance];
    BKKeyboardHIDEventProcessor *v6 = [v4 eventProcessorOfClass:[BKKeyboardHIDEventProcessor class]];
    BOOL v7 = [v6 autorelease];

    if (v3) {
      unsigned __int8 v8 = [v7 isCapsLockLightOnForSenderID:v3];
    }
    else {
      unsigned __int8 v8 = [v7 isCapsLockLightOn];
    }
    *(_BYTE *)(a2 + 36) = v8;

    *(_DWORD *)(a2 + 32) = 0;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 40;
  }

void sub_10007729C(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 44)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }

  else
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = *(unsigned __int8 *)(a1 + 40);
    BKHIDEventProcessorRegistry *v5 = [BKHIDEventProcessorRegistry sharedInstance];
    BKKeyboardHIDEventProcessor *v7 = [v5 eventProcessorOfClass:[BKKeyboardHIDEventProcessor class]];
    unsigned __int8 v8 = [v7 autorelease];

    BOOL v9 = v4 != 0;
    if (v3) {
      [v8 setRomanCapsLockSwitchModeActive:v9 forSenderID:v3];
    }
    else {
      [v8 setRomanCapsLockSwitchModeActive:v9];
    }

    *(_DWORD *)(a2 + 32) = 0;
  }

void sub_100077360(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 48)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }

  else
  {
    uint64_t v3 = *(void *)(a1 + 32);
    double v4 = *(double *)(a1 + 40);
    uint64_t v5 = [BKHIDEventProcessorRegistry sharedInstance];
    BKKeyboardHIDEventProcessor *v7 = [v5 eventProcessorOfClass:[BKKeyboardHIDEventProcessor class]];
    unsigned __int8 v8 = [v7 autorelease];

    if (v3) {
      [v8 setCapsLockDelayOverride:v3 forSenderID:v4];
    }
    else {
      [v8 setCapsLockDelayOverride:v4];
    }

    *(_DWORD *)(a2 + 32) = 0;
  }

void sub_100077420(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 44)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }

  else
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(unsigned int *)(a1 + 40);
    BKHIDEventProcessorRegistry *v5 = [BKHIDEventProcessorRegistry sharedInstance];
    BKKeyboardHIDEventProcessor *v7 = [v5 eventProcessorOfClass:[BKKeyboardHIDEventProcessor class]];
    unsigned __int8 v8 = [v7 autorelease];

    [v8 setStandardType:v4 forSenderID:v3];
    *(_DWORD *)(a2 + 32) = 0;
  }

void sub_1000774D4(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 44)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }

  else
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = *(unsigned __int8 *)(a1 + 40);
    BKHIDEventProcessorRegistry *v5 = [BKHIDEventProcessorRegistry sharedInstance];
    BKKeyboardHIDEventProcessor *v7 = [v5 eventProcessorOfClass:[BKKeyboardHIDEventProcessor class]];
    unsigned __int8 v8 = [v7 autorelease];

    [v8 setCapsLockActive:v4 != 0 onSenderID:v3];
    *(_DWORD *)(a2 + 32) = 0;
  }

void sub_10007758C(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 40)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }

  else
  {
    uint64_t v3 = *(void *)(a1 + 32);
    BKHIDEventProcessorRegistry *v4 = [BKHIDEventProcessorRegistry sharedInstance];
    BKKeyboardHIDEventProcessor *v6 = [v4 eventProcessorOfClass:[BKKeyboardHIDEventProcessor class]];
    id v7 = v6;

    *(_BYTE *)(a2 + 36) = [v7 keyboardWantsStandardTypeOverrideForSenderID:v3];
    *(_DWORD *)(a2 + 32) = 0;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 40;
  }

void sub_10007764C(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) == 0
    && (uint64_t v4 = *(unsigned int *)(a1 + 4), v4 >= 0x30)
    && v4 <= 0x430
    && ((unsigned int v5 = *(_DWORD *)(a1 + 44), v5 <= 0x400) ? (v6 = (int)v4 - 48 >= v5) : (v6 = 0),
        (unsigned int v7 = ((v5 + 3) & 0xFFFFFFFC) + 48, v6) ? (v8 = (_DWORD)v4 == v7) : (v8 = 0),
        v8 && memchr((const void *)(a1 + 48), 0, v4 - 48)))
  {
    if (*(_BYTE *)(a1 + 48))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v10 = [NSString stringWithUTF8String:a1 + 48];
      if ([v10 length])
      {
        uint64_t v11 = [BKHIDEventProcessorRegistry sharedInstance];
        BKKeyboardHIDEventProcessor *v13 = [v11 eventProcessorOfClass:[BKKeyboardHIDEventProcessor class]];
        float v14 = [v13 floatValue];

        if (v9) {
          [v14 setKeyboardLayout:v10 forSenderID:v9];
        }
        else {
          [v14 setKeyboardLayout:v10];
        }
      }
    }

    else
    {
      int v10 = 0LL;
    }

    *(_DWORD *)(a2 + 32) = 0;
  }

  else
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }

void sub_100077784(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 && *(_DWORD *)(a1 + 24) == 1 && *(_DWORD *)(a1 + 4) == 56)
  {
    if (*(_BYTE *)(a1 + 39) == 1 && (int v4 = *(_DWORD *)(a1 + 40), v4 == *(_DWORD *)(a1 + 52)))
    {
      if (!*(_DWORD *)(a1 + 56) && *(_DWORD *)(a1 + 60) > 0x1Fu)
      {
        uint64_t v6 = *(void *)(a1 + 28);
        __int128 v7 = *(_OWORD *)(a1 + 92);
        v8[0] = *(_OWORD *)(a1 + 76);
        v8[1] = v7;
        *(_DWORD *)(a2 + 32) = sub_1000106A8(v6, v4, (uint64_t)v8);
        mig_deallocate(*(void *)(a1 + 28), *(unsigned int *)(a1 + 40));
        *(void *)(a1 + 2_Block_object_dispose(va, 8) = 0LL;
        *(_DWORD *)(a1 + 40) = 0;
        return;
      }

      int v5 = -309;
    }

    else
    {
      int v5 = -300;
    }
  }

  else
  {
    int v5 = -304;
  }

  *(_DWORD *)(a2 + 32) = v5;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
}

void sub_10007785C(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) == 0 || *(_DWORD *)(a1 + 24) != 2 || *(_DWORD *)(a1 + 4) != 76)
  {
    int v4 = -304;
    goto LABEL_12;
  }

  if (*(_BYTE *)(a1 + 39) != 1
    || *(_BYTE *)(a1 + 55) != 1
    || *(_DWORD *)(a1 + 40) != *(_DWORD *)(a1 + 68)
    || *(_DWORD *)(a1 + 56) != *(_DWORD *)(a1 + 72))
  {
    int v4 = -300;
    goto LABEL_12;
  }

  if (*(_DWORD *)(a1 + 76) || *(_DWORD *)(a1 + 80) <= 0x1Fu)
  {
    int v4 = -309;
LABEL_12:
    *(_DWORD *)(a2 + 32) = v4;
    goto LABEL_13;
  }

  *(_DWORD *)(a2 + 52) = 0;
  int v5 = (objc_class *)(a2 + 52);
  uint64_t v6 = (objc_class *)(a2 + 28);
  *(_DWORD *)(a2 + 36) = 16777472;
  __int128 v7 = *(objc_class **)(a1 + 28);
  int v8 = *(_DWORD *)(a1 + 40);
  uint64_t v9 = *(objc_class **)(a1 + 44);
  int v10 = *(_DWORD *)(a1 + 56);
  __int128 v11 = *(_OWORD *)(a1 + 112);
  v13[0] = *(_OWORD *)(a1 + 96);
  v13[1] = v11;
  int v12 = sub_100010010(v7, v8, v9, v10, v6, v5, (uint64_t)v13);
  mig_deallocate(*(void *)(a1 + 44), *(unsigned int *)(a1 + 56));
  *(void *)(a1 + 44) = 0LL;
  *(_DWORD *)(a1 + 56) = 0;
  mig_deallocate(*(void *)(a1 + 28), *(unsigned int *)(a1 + 40));
  *(void *)(a1 + 2_Block_object_dispose(va, 8) = 0LL;
  *(_DWORD *)(a1 + 40) = 0;
  if (!v12)
  {
    *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
    *(NDR_record_t *)(a2 + 44) = NDR_record;
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 56;
    *(_DWORD *)(a2 + 24) = 1;
    return;
  }

  *(_DWORD *)(a2 + 32) = v12;
LABEL_13:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
}

void sub_1000779C8(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) == 0 || *(_DWORD *)(a1 + 24) != 2 || *(_DWORD *)(a1 + 4) != 76)
  {
    int v4 = -304;
    goto LABEL_12;
  }

  if (*(_BYTE *)(a1 + 39) != 1
    || *(_BYTE *)(a1 + 55) != 1
    || *(_DWORD *)(a1 + 40) != *(_DWORD *)(a1 + 68)
    || *(_DWORD *)(a1 + 56) != *(_DWORD *)(a1 + 72))
  {
    int v4 = -300;
    goto LABEL_12;
  }

  if (*(_DWORD *)(a1 + 76) || *(_DWORD *)(a1 + 80) <= 0x1Fu)
  {
    int v4 = -309;
LABEL_12:
    *(_DWORD *)(a2 + 32) = v4;
    goto LABEL_13;
  }

  *(_DWORD *)(a2 + 52) = 0;
  int v5 = (objc_class *)(a2 + 52);
  uint64_t v6 = (objc_class *)(a2 + 28);
  *(_DWORD *)(a2 + 36) = 16777472;
  __int128 v7 = *(objc_class **)(a1 + 28);
  int v8 = *(_DWORD *)(a1 + 40);
  uint64_t v9 = *(objc_class **)(a1 + 44);
  int v10 = *(_DWORD *)(a1 + 56);
  __int128 v11 = *(_OWORD *)(a1 + 112);
  v13[0] = *(_OWORD *)(a1 + 96);
  v13[1] = v11;
  int v12 = sub_10001035C(v7, v8, v9, v10, v6, v5, (uint64_t)v13);
  mig_deallocate(*(void *)(a1 + 44), *(unsigned int *)(a1 + 56));
  *(void *)(a1 + 44) = 0LL;
  *(_DWORD *)(a1 + 56) = 0;
  mig_deallocate(*(void *)(a1 + 28), *(unsigned int *)(a1 + 40));
  *(void *)(a1 + 2_Block_object_dispose(va, 8) = 0LL;
  *(_DWORD *)(a1 + 40) = 0;
  if (!v12)
  {
    *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
    *(NDR_record_t *)(a2 + 44) = NDR_record;
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 56;
    *(_DWORD *)(a2 + 24) = 1;
    return;
  }

  *(_DWORD *)(a2 + 32) = v12;
LABEL_13:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
}

void sub_100077B34(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 && *(_DWORD *)(a1 + 24) == 2 && *(_DWORD *)(a1 + 4) == 76)
  {
    if (*(_BYTE *)(a1 + 39) == 1
      && *(_BYTE *)(a1 + 55) == 1
      && (unsigned int v4 = *(_DWORD *)(a1 + 40), v4 == *(_DWORD *)(a1 + 68))
      && (unsigned int v5 = *(_DWORD *)(a1 + 56), v5 == *(_DWORD *)(a1 + 72)))
    {
      if (!*(_DWORD *)(a1 + 76) && *(_DWORD *)(a1 + 80) > 0x1Fu)
      {
        uint64_t v7 = *(void *)(a1 + 28);
        uint64_t v8 = *(void *)(a1 + 44);
        __int128 v9 = *(_OWORD *)(a1 + 112);
        v10[0] = *(_OWORD *)(a1 + 96);
        v10[1] = v9;
        *(_DWORD *)(a2 + 32) = sub_10001241C(v7, v4, v8, v5, v10);
        mig_deallocate(*(void *)(a1 + 44), *(unsigned int *)(a1 + 56));
        *(void *)(a1 + 44) = 0LL;
        *(_DWORD *)(a1 + 56) = 0;
        mig_deallocate(*(void *)(a1 + 28), *(unsigned int *)(a1 + 40));
        *(void *)(a1 + 2_Block_object_dispose(va, 8) = 0LL;
        *(_DWORD *)(a1 + 40) = 0;
        return;
      }

      int v6 = -309;
    }

    else
    {
      int v6 = -300;
    }
  }

  else
  {
    int v6 = -304;
  }

  *(_DWORD *)(a2 + 32) = v6;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
}

void sub_100077C40(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) == 0 || *(_DWORD *)(a1 + 24) != 2 || *(_DWORD *)(a1 + 4) != 76)
  {
    int v4 = -304;
    goto LABEL_12;
  }

  if (*(_BYTE *)(a1 + 39) != 1
    || *(_BYTE *)(a1 + 55) != 1
    || *(_DWORD *)(a1 + 40) != *(_DWORD *)(a1 + 68)
    || *(_DWORD *)(a1 + 56) != *(_DWORD *)(a1 + 72))
  {
    int v4 = -300;
    goto LABEL_12;
  }

  if (*(_DWORD *)(a1 + 76) || *(_DWORD *)(a1 + 80) <= 0x1Fu)
  {
    int v4 = -309;
LABEL_12:
    *(_DWORD *)(a2 + 32) = v4;
    goto LABEL_13;
  }

  *(_DWORD *)(a2 + 52) = 0;
  unsigned int v5 = (_DWORD *)(a2 + 52);
  int v6 = (void *)(a2 + 28);
  *(_DWORD *)(a2 + 36) = 16777472;
  uint64_t v7 = *(void *)(a1 + 28);
  unsigned int v8 = *(_DWORD *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 44);
  unsigned int v10 = *(_DWORD *)(a1 + 56);
  __int128 v11 = *(_OWORD *)(a1 + 112);
  v13[0] = *(_OWORD *)(a1 + 96);
  v13[1] = v11;
  int v12 = sub_100012CC0(v7, v8, v9, v10, v6, v5, (uint64_t)v13);
  mig_deallocate(*(void *)(a1 + 44), *(unsigned int *)(a1 + 56));
  *(void *)(a1 + 44) = 0LL;
  *(_DWORD *)(a1 + 56) = 0;
  mig_deallocate(*(void *)(a1 + 28), *(unsigned int *)(a1 + 40));
  *(void *)(a1 + 2_Block_object_dispose(va, 8) = 0LL;
  *(_DWORD *)(a1 + 40) = 0;
  if (!v12)
  {
    *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
    *(NDR_record_t *)(a2 + 44) = NDR_record;
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 56;
    *(_DWORD *)(a2 + 24) = 1;
    return;
  }

  *(_DWORD *)(a2 + 32) = v12;
LABEL_13:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
}

void sub_100077DAC(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) == 0 || *(_DWORD *)(a1 + 24) != 1 || *(_DWORD *)(a1 + 4) != 56)
  {
    int v5 = -304;
    goto LABEL_10;
  }

  if (*(_BYTE *)(a1 + 39) != 1 || (unsigned int v4 = *(_DWORD *)(a1 + 40), v4 != *(_DWORD *)(a1 + 52)))
  {
    int v5 = -300;
    goto LABEL_10;
  }

  if (*(_DWORD *)(a1 + 56) || *(_DWORD *)(a1 + 60) <= 0x1Fu)
  {
    int v5 = -309;
LABEL_10:
    *(_DWORD *)(a2 + 32) = v5;
    NDR_record_t v6 = NDR_record;
    goto LABEL_11;
  }

  uint64_t v7 = *(void *)(a1 + 28);
  __int128 v8 = *(_OWORD *)(a1 + 92);
  v9[0] = *(_OWORD *)(a1 + 76);
  v9[1] = v8;
  sub_100013564(v7, v4, (unsigned int *)(a2 + 36), (uint64_t)v9);
  *(_DWORD *)(a2 + 32) = 0;
  mig_deallocate(*(void *)(a1 + 28), *(unsigned int *)(a1 + 40));
  *(void *)(a1 + 2_Block_object_dispose(va, 8) = 0LL;
  *(_DWORD *)(a1 + 40) = 0;
  NDR_record_t v6 = NDR_record;
  if (!*(_DWORD *)(a2 + 32))
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 40;
    return;
  }

void sub_100077EA8(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 && *(_DWORD *)(a1 + 24) == 1 && *(_DWORD *)(a1 + 4) == 56)
  {
    if (*(_BYTE *)(a1 + 39) == 1 && (unsigned int v4 = *(_DWORD *)(a1 + 40), v4 == *(_DWORD *)(a1 + 52)))
    {
      if (!*(_DWORD *)(a1 + 56) && *(_DWORD *)(a1 + 60) > 0x1Fu)
      {
        uint64_t v6 = *(void *)(a1 + 28);
        __int128 v7 = *(_OWORD *)(a1 + 92);
        v8[0] = *(_OWORD *)(a1 + 76);
        v8[1] = v7;
        sub_1000130A8(v6, v4, v8);
        *(_DWORD *)(a2 + 32) = 0;
        mig_deallocate(*(void *)(a1 + 28), *(unsigned int *)(a1 + 40));
        *(void *)(a1 + 2_Block_object_dispose(va, 8) = 0LL;
        *(_DWORD *)(a1 + 40) = 0;
        return;
      }

      int v5 = -309;
    }

    else
    {
      int v5 = -300;
    }
  }

  else
  {
    int v5 = -304;
  }

  *(_DWORD *)(a2 + 32) = v5;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
}

void sub_100077F80(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) == 0 || *(_DWORD *)(a1 + 24) != 1 || *(_DWORD *)(a1 + 4) != 56)
  {
    int v4 = -304;
    goto LABEL_10;
  }

  if (*(_BYTE *)(a1 + 39) != 1 || *(_DWORD *)(a1 + 40) != *(_DWORD *)(a1 + 52))
  {
    int v4 = -300;
    goto LABEL_10;
  }

  if (*(_DWORD *)(a1 + 56) || *(_DWORD *)(a1 + 60) <= 0x1Fu)
  {
    int v4 = -309;
LABEL_10:
    *(_DWORD *)(a2 + 32) = v4;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return;
  }

  sub_10000FDC0();
  *(_DWORD *)(a2 + 32) = 0;
  mig_deallocate(*(void *)(a1 + 28), *(unsigned int *)(a1 + 40));
  *(void *)(a1 + 2_Block_object_dispose(va, 8) = 0LL;
  *(_DWORD *)(a1 + 40) = 0;
}

void sub_100078038(_DWORD *a1, uint64_t a2)
{
  if ((*a1 & 0x80000000) != 0 || a1[1] != 24)
  {
    int v3 = -304;
    goto LABEL_7;
  }

  if (a1[6] || a1[7] <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return;
  }

  *(_DWORD *)(a2 + 36) = 16777472;
  *(_DWORD *)(a2 + 52) = 0;
  uint64_t v4 = BKLogUISensor();
  int v5 = (os_log_s *)[v4 autorelease];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "GetUISensorCharacteristics ignored on this OS",  v6,  2u);
  }

  *(void *)(a2 + 2_Block_object_dispose(va, 8) = 0LL;
  *(_DWORD *)(a2 + 52) = 0;
  *(_DWORD *)(a2 + 40) = 0;
  *(NDR_record_t *)(a2 + 44) = NDR_record;
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 56;
  *(_DWORD *)(a2 + 24) = 1;
}

void sub_10007812C(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 40)
  {
    int v3 = -304;
    goto LABEL_7;
  }

  if (*(_DWORD *)(a1 + 40) || *(_DWORD *)(a1 + 44) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return;
  }

  int32x2_t v4 = *(int32x2_t *)(a1 + 32);
  __int128 v5 = *(_OWORD *)(a1 + 76);
  v7[0] = *(_OWORD *)(a1 + 60);
  v7[1] = v5;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  _OWORD v8[2] = sub_1000134BC;
  v8[3] = &unk_1000B6170;
  __int128 v9 = v7[0];
  __int128 v10 = v5;
  int32x2_t v11 = vrev64_s32(v4);
  if (sub_1000138EC( (uint64_t)"_BKHIDXXTouchSensitiveButtonSetScanMode",  BKBackBoardClientEntitlement,  (uint64_t)v7))
  {
    sub_1000134BC((uint64_t)v8);
    int v6 = 0;
  }

  else
  {
    int v6 = 5;
  }

  *(_DWORD *)(a2 + 32) = v6;
}

uint64_t sub_100078224(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 20);
  else {
    return 0LL;
  }
}

_DWORD *sub_100078264(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0
    || (int v3 = result, v4 = result[1], v4 < 0x28)
    || v4 > 0x428
    || ((unsigned int v5 = result[9], v5 <= 0x400) ? (v6 = (int)v4 - 40 >= v5) : (v6 = 0),
        (unsigned int v7 = ((v5 + 3) & 0xFFFFFFFC) + 40, v6) ? (v8 = (_DWORD)v4 == v7) : (v8 = 0),
        !v8 || (uint64_t result = memchr(result + 10, 0, v4 - 40)) == 0LL))
  {
    int v9 = -304;
LABEL_12:
    *(_DWORD *)(a2 + 32) = v9;
    NDR_record_t v10 = NDR_record;
    goto LABEL_13;
  }

  int32x2_t v11 = (char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL);
  if (*(_DWORD *)v11 || *((_DWORD *)v11 + 1) <= 0x1Fu)
  {
    int v9 = -309;
    goto LABEL_12;
  }

  __int128 v12 = *(_OWORD *)(v11 + 36);
  v13[0] = *(_OWORD *)(v11 + 20);
  v13[1] = v12;
  uint64_t result = (_DWORD *)sub_10001FFFC((uint64_t)(v3 + 10), a2 + 36, (uint64_t)v13);
  *(_DWORD *)(a2 + 32) = (_DWORD)result;
  NDR_record_t v10 = NDR_record;
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }

_DWORD *sub_10007836C(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0) {
    goto LABEL_16;
  }
  int v3 = result;
  uint64_t v4 = result[1];
  unsigned int v5 = result[9];
  if (v5 > 0x400) {
    goto LABEL_16;
  }
  unsigned int v6 = (v5 + 3) & 0xFFFFFFFC;
  uint64_t v8 = 1064LL;
  uint64_t result = memchr(result + 10, 0, v8 - 40);
  if (!result)
  {
LABEL_16:
    int v10 = -304;
    goto LABEL_17;
  }

  int v9 = (char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL);
  if (*(_DWORD *)v9 || *((_DWORD *)v9 + 1) <= 0x1Fu)
  {
    int v10 = -309;
LABEL_17:
    *(_DWORD *)(a2 + 32) = v10;
    NDR_record_t v11 = NDR_record;
    goto LABEL_18;
  }

  char v12 = *((_BYTE *)v3 + v6 + 40);
  __int128 v13 = *(_OWORD *)(v9 + 36);
  v14[0] = *(_OWORD *)(v9 + 20);
  v14[1] = v13;
  uint64_t result = (_DWORD *)sub_100020118((uint64_t)(v3 + 10), v12, a2 + 36, v14);
  *(_DWORD *)(a2 + 32) = (_DWORD)result;
  NDR_record_t v11 = NDR_record;
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }

_DWORD *sub_100078498(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0) {
    goto LABEL_16;
  }
  int v3 = result;
  uint64_t v4 = result[1];
  unsigned int v5 = result[9];
  if (v5 > 0x400) {
    goto LABEL_16;
  }
  unsigned int v6 = (v5 + 3) & 0xFFFFFFFC;
  uint64_t v8 = 1064LL;
  uint64_t result = memchr(result + 10, 0, v8 - 40);
  if (result)
  {
    int v9 = (char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL);
    if (!*(_DWORD *)v9 && *((_DWORD *)v9 + 1) > 0x1Fu)
    {
      char v11 = *((_BYTE *)v3 + v6 + 40);
      char v12 = *((_BYTE *)v3 + v6 + 44);
      __int128 v13 = *(_OWORD *)(v9 + 36);
      v14[0] = *(_OWORD *)(v9 + 20);
      v14[1] = v13;
      uint64_t result = (_DWORD *)sub_10001EEBC((uint64_t)(v3 + 10), v11, v12, (uint64_t)v14);
      *(_DWORD *)(a2 + 32) = (_DWORD)result;
      return result;
    }

    int v10 = -309;
  }

  else
  {
LABEL_16:
    int v10 = -304;
  }

  *(_DWORD *)(a2 + 32) = v10;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_1000785A8(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) == 0
    && (int v3 = result, v4 = result[1], v4 >= 0x28)
    && v4 <= 0x428
    && ((unsigned int v5 = result[9], v5 <= 0x400) ? (v6 = (int)v4 - 40 >= v5) : (v6 = 0),
        (unsigned int v7 = ((v5 + 3) & 0xFFFFFFFC) + 40, v6) ? (v8 = (_DWORD)v4 == v7) : (v8 = 0),
        v8 && (uint64_t result = memchr(result + 10, 0, v4 - 40)) != 0LL))
  {
    int v10 = (char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL);
    if (!*(_DWORD *)v10 && *((_DWORD *)v10 + 1) > 0x1Fu)
    {
      __int128 v11 = *(_OWORD *)(v10 + 36);
      v12[0] = *(_OWORD *)(v10 + 20);
      v12[1] = v11;
      uint64_t result = (_DWORD *)sub_10001F22C((uint64_t)(v3 + 10), (uint64_t)v12);
      *(_DWORD *)(a2 + 32) = (_DWORD)result;
      return result;
    }

    int v9 = -309;
  }

  else
  {
    int v9 = -304;
  }

  *(_DWORD *)(a2 + 32) = v9;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_100078690(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0
    || (int v3 = result, v4 = result[1], v4 < 0x28)
    || v4 > 0x428
    || ((unsigned int v5 = result[9], v5 <= 0x400) ? (v6 = (int)v4 - 40 >= v5) : (v6 = 0),
        (unsigned int v7 = ((v5 + 3) & 0xFFFFFFFC) + 40, v6) ? (v8 = (_DWORD)v4 == v7) : (v8 = 0),
        !v8 || (uint64_t result = memchr(result + 10, 0, v4 - 40)) == 0LL))
  {
    int v9 = -304;
LABEL_12:
    *(_DWORD *)(a2 + 32) = v9;
    NDR_record_t v10 = NDR_record;
    goto LABEL_13;
  }

  __int128 v11 = (char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL);
  if (*(_DWORD *)v11 || *((_DWORD *)v11 + 1) <= 0x1Fu)
  {
    int v9 = -309;
    goto LABEL_12;
  }

  __int128 v12 = *(_OWORD *)(v11 + 36);
  v13[0] = *(_OWORD *)(v11 + 20);
  v13[1] = v12;
  uint64_t result = (_DWORD *)sub_10001F3B4((uint64_t)(v3 + 10), a2 + 36, (uint64_t)v13);
  *(_DWORD *)(a2 + 32) = (_DWORD)result;
  NDR_record_t v10 = NDR_record;
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }

uint64_t sub_100078798(_DWORD *a1, uint64_t a2)
{
  int v4 = *a1;
  uint64_t result = 4294966992LL;
  if ((v4 & 0x80000000) == 0)
  {
    uint64_t v6 = a1[1];
    if (v6 >= 0x2C && v6 <= 0x42C)
    {
      unsigned int v7 = a1[9];
      if (v7 <= 0x400)
      {
        unsigned int v8 = (v7 + 3) & 0xFFFFFFFC;
        if ((int)v6 - 44 >= v7 && (_DWORD)v6 == v8 + 44)
        {
          uint64_t v10 = 1064LL;
          if (memchr(a1 + 10, 0, v10 - 40))
          {
            __int128 v11 = (char *)a1 + ((v6 + 3) & 0x1FFFFFFFCLL);
            if (*(_DWORD *)v11 || *((_DWORD *)v11 + 1) < 0x20u)
            {
              uint64_t result = 4294966987LL;
            }

            else
            {
              char v12 = *((_BYTE *)a1 + v8 + 40);
              __int128 v13 = *(_OWORD *)(v11 + 36);
              v14[0] = *(_OWORD *)(v11 + 20);
              v14[1] = v13;
              uint64_t result = sub_10001F488((uint64_t)(a1 + 10), v12, (uint64_t)v14);
            }
          }

          else
          {
            uint64_t result = 4294966992LL;
          }
        }
      }
    }
  }

  *(_DWORD *)(a2 + 32) = result;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_1000788A4(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0
    || (int v3 = result, v4 = result[1], v4 < 0x28)
    || v4 > 0x428
    || ((unsigned int v5 = result[9], v5 <= 0x400) ? (v6 = (int)v4 - 40 >= v5) : (v6 = 0),
        (unsigned int v7 = ((v5 + 3) & 0xFFFFFFFC) + 40, v6) ? (v8 = (_DWORD)v4 == v7) : (v8 = 0),
        !v8 || (uint64_t result = memchr(result + 10, 0, v4 - 40)) == 0LL))
  {
    int v9 = -304;
LABEL_12:
    *(_DWORD *)(a2 + 32) = v9;
    goto LABEL_13;
  }

  uint64_t v10 = (char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL);
  if (*(_DWORD *)v10 || *((_DWORD *)v10 + 1) <= 0x1Fu)
  {
    int v9 = -309;
    goto LABEL_12;
  }

  *(_DWORD *)(a2 + 52) = 0;
  *(_DWORD *)(a2 + 36) = 16777472;
  __int128 v11 = *(_OWORD *)(v10 + 36);
  v12[0] = *(_OWORD *)(v10 + 20);
  v12[1] = v11;
  uint64_t result = (_DWORD *)sub_10001F5F4((_BYTE *)v3 + 40, (void *)(a2 + 28), (_DWORD *)(a2 + 52), (uint64_t)v12);
  if (!(_DWORD)result)
  {
    *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
    *(NDR_record_t *)(a2 + 44) = NDR_record;
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 56;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }

  *(_DWORD *)(a2 + 32) = (_DWORD)result;
LABEL_13:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

void sub_1000789D8(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) == 0) {
    goto LABEL_2;
  }
  int v3 = -304;
  if (*(_DWORD *)(a1 + 24) != 1) {
    goto LABEL_3;
  }
  uint64_t v5 = *(unsigned int *)(a1 + 4);
  if (*(_BYTE *)(a1 + 39) != 1) {
    goto LABEL_19;
  }
  unsigned int v6 = *(_DWORD *)(a1 + 56);
  if (v6 > 0x400)
  {
LABEL_2:
    int v3 = -304;
    goto LABEL_3;
  }

  int v3 = -304;
  unsigned int v7 = (v6 + 3) & 0xFFFFFFFC;
  if ((_DWORD)v5 != v7 + 64) {
    goto LABEL_3;
  }
  int v8 = *(_DWORD *)(a1 + 40);
  if (v8 != *(_DWORD *)(a1 + v7 + 60))
  {
LABEL_19:
    int v3 = -300;
    goto LABEL_3;
  }

  uint64_t v9 = 1084LL;
  uint64_t v10 = ((v5 + 3) & 0x1FFFFFFFCLL) + a1;
  if (!*(_DWORD *)v10 && *(_DWORD *)(v10 + 4) > 0x1Fu)
  {
    uint64_t v11 = *(void *)(a1 + 28);
    __int128 v12 = *(_OWORD *)(v10 + 36);
    v13[0] = *(_OWORD *)(v10 + 20);
    v13[1] = v12;
    *(_DWORD *)(a2 + 32) = sub_10001F77C(a1 + 60, v11, v8, (uint64_t)v13);
    mig_deallocate(*(void *)(a1 + 28), *(unsigned int *)(a1 + 40));
    *(void *)(a1 + 2_Block_object_dispose(va, 8) = 0LL;
    *(_DWORD *)(a1 + 40) = 0;
    return;
  }

  int v3 = -309;
LABEL_3:
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
}

_DWORD *sub_100078B34(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0
    || (int v3 = result, v4 = result[1], v4 < 0x28)
    || v4 > 0x428
    || ((unsigned int v5 = result[9], v5 <= 0x400) ? (v6 = (int)v4 - 40 >= v5) : (v6 = 0),
        (unsigned int v7 = ((v5 + 3) & 0xFFFFFFFC) + 40, v6) ? (v8 = (_DWORD)v4 == v7) : (v8 = 0),
        !v8 || (uint64_t result = memchr(result + 10, 0, v4 - 40)) == 0LL))
  {
    int v9 = -304;
LABEL_12:
    *(_DWORD *)(a2 + 32) = v9;
    NDR_record_t v10 = NDR_record;
    goto LABEL_13;
  }

  uint64_t v11 = (char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL);
  if (*(_DWORD *)v11 || *((_DWORD *)v11 + 1) <= 0x1Fu)
  {
    int v9 = -309;
    goto LABEL_12;
  }

  __int128 v12 = *(_OWORD *)(v11 + 36);
  v13[0] = *(_OWORD *)(v11 + 20);
  v13[1] = v12;
  uint64_t result = (_DWORD *)sub_10001FAE8((uint64_t)(v3 + 10), a2 + 36, (uint64_t)v13);
  *(_DWORD *)(a2 + 32) = (_DWORD)result;
  NDR_record_t v10 = NDR_record;
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }

uint64_t sub_100078C3C(_DWORD *a1, uint64_t a2)
{
  int v4 = *a1;
  uint64_t result = 4294966992LL;
  if ((v4 & 0x80000000) == 0)
  {
    uint64_t v6 = a1[1];
    if (v6 >= 0x2C && v6 <= 0x42C)
    {
      unsigned int v7 = a1[9];
      if (v7 <= 0x400)
      {
        unsigned int v8 = (v7 + 3) & 0xFFFFFFFC;
        if ((int)v6 - 44 >= v7 && (_DWORD)v6 == v8 + 44)
        {
          uint64_t v10 = 1064LL;
          if (memchr(a1 + 10, 0, v10 - 40))
          {
            uint64_t v11 = (char *)a1 + ((v6 + 3) & 0x1FFFFFFFCLL);
            if (*(_DWORD *)v11 || *((_DWORD *)v11 + 1) < 0x20u)
            {
              uint64_t result = 4294966987LL;
            }

            else
            {
              char v12 = *((_BYTE *)a1 + v8 + 40);
              __int128 v13 = *(_OWORD *)(v11 + 36);
              v14[0] = *(_OWORD *)(v11 + 20);
              v14[1] = v13;
              uint64_t result = sub_10001FC04((uint64_t)(a1 + 10), v12, (uint64_t)v14);
            }
          }

          else
          {
            uint64_t result = 4294966992LL;
          }
        }
      }
    }
  }

  *(_DWORD *)(a2 + 32) = result;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_100078D48(int *a1, uint64_t a2)
{
  int v4 = *a1;
  uint64_t result = 4294966992LL;
  if ((v4 & 0x80000000) == 0)
  {
    uint64_t v6 = a1[1];
    if (v6 >= 0x30 && v6 <= 0x430)
    {
      unsigned int v7 = a1[9];
      if (v7 <= 0x400)
      {
        unsigned int v8 = (v7 + 3) & 0xFFFFFFFC;
        if ((int)v6 - 48 >= v7 && (_DWORD)v6 == v8 + 48)
        {
          uint64_t v10 = 1064LL;
          if (memchr(a1 + 10, 0, v10 - 40))
          {
            uint64_t v11 = (char *)a1 + ((v6 + 3) & 0x1FFFFFFFCLL);
            if (*(_DWORD *)v11 || *((_DWORD *)v11 + 1) < 0x20u)
            {
              uint64_t result = 4294966987LL;
            }

            else
            {
              int v12 = *(int *)((char *)a1 + v8 + 40);
              int v13 = *(int *)((char *)a1 + v8 + 44);
              __int128 v14 = *(_OWORD *)(v11 + 36);
              v15[0] = *(_OWORD *)(v11 + 20);
              v15[1] = v14;
              uint64_t result = sub_10001FDA0((uint64_t)(a1 + 10), v12, v13, (uint64_t)v15);
            }
          }

          else
          {
            uint64_t result = 4294966992LL;
          }
        }
      }
    }
  }

  *(_DWORD *)(a2 + 32) = result;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_100078E58(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0
    || (int v3 = result, v4 = result[1], v4 < 0x28)
    || v4 > 0x428
    || ((unsigned int v5 = result[9], v5 <= 0x400) ? (v6 = (int)v4 - 40 >= v5) : (v6 = 0),
        (unsigned int v7 = ((v5 + 3) & 0xFFFFFFFC) + 40, v6) ? (v8 = (_DWORD)v4 == v7) : (v8 = 0),
        !v8 || (uint64_t result = memchr(result + 10, 0, v4 - 40)) == 0LL))
  {
    int v9 = -304;
LABEL_12:
    *(_DWORD *)(a2 + 32) = v9;
    NDR_record_t v10 = NDR_record;
    goto LABEL_13;
  }

  uint64_t v11 = (char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL);
  if (*(_DWORD *)v11 || *((_DWORD *)v11 + 1) <= 0x1Fu)
  {
    int v9 = -309;
    goto LABEL_12;
  }

  __int128 v12 = *(_OWORD *)(v11 + 36);
  v13[0] = *(_OWORD *)(v11 + 20);
  v13[1] = v12;
  uint64_t result = (_DWORD *)sub_10001FE64((uint64_t)(v3 + 10), a2 + 36, (uint64_t)v13);
  *(_DWORD *)(a2 + 32) = (_DWORD)result;
  NDR_record_t v10 = NDR_record;
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }

uint64_t sub_100078F60(_DWORD *a1, uint64_t a2)
{
  int v4 = *a1;
  uint64_t result = 4294966992LL;
  if ((v4 & 0x80000000) == 0)
  {
    uint64_t v6 = a1[1];
    if (v6 >= 0x2C && v6 <= 0x42C)
    {
      unsigned int v7 = a1[9];
      if (v7 <= 0x400)
      {
        unsigned int v8 = (v7 + 3) & 0xFFFFFFFC;
        if ((int)v6 - 44 >= v7 && (_DWORD)v6 == v8 + 44)
        {
          uint64_t v10 = 1064LL;
          if (memchr(a1 + 10, 0, v10 - 40))
          {
            uint64_t v11 = (char *)a1 + ((v6 + 3) & 0x1FFFFFFFCLL);
            if (*(_DWORD *)v11 || *((_DWORD *)v11 + 1) < 0x20u)
            {
              uint64_t result = 4294966987LL;
            }

            else
            {
              char v12 = *((_BYTE *)a1 + v8 + 40);
              __int128 v13 = *(_OWORD *)(v11 + 36);
              v14[0] = *(_OWORD *)(v11 + 20);
              v14[1] = v13;
              uint64_t result = sub_10001FF38((uint64_t)(a1 + 10), v12, (uint64_t)v14);
            }
          }

          else
          {
            uint64_t result = 4294966992LL;
          }
        }
      }
    }
  }

  *(_DWORD *)(a2 + 32) = result;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_10007906C(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }

  else
  {
    double v10 = 0.0;
    double v11 = 0.0;
    double v9 = 0.0;
    __int16 v8 = 0;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    _OWORD v12[2] = sub_100019A3C;
    v12[3] = &unk_1000B5E90;
    void v12[4] = &v11;
    void v12[5] = &v10;
    v12[6] = &v9;
    v12[7] = (char *)&v8 + 1;
    v12[8] = 0LL;
    v12[9] = &v8;
    sub_1000196F4(v12);
    float v3 = v11;
    float v4 = v10;
    *(float *)(a2 + 36) = v3;
    *(float *)(a2 + 40) = v4;
    float v5 = v9;
    *(float *)(a2 + 44) = v5;
    float v7 = BSDegreesToRadians(v6, (double)(90 * HIBYTE(v8)));
    *(float *)(a2 + 4_Block_object_dispose(va, 8) = v7;
    *(_BYTE *)(a2 + 52) = v8;
    uint64_t result = (_DWORD *)sub_10001A8D4();
    *(_BYTE *)(a2 + 56) = (_BYTE)result;
    *(_DWORD *)(a2 + 32) = 0;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 60;
  }

  return result;
}

void sub_100079184(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }

  else
  {
    int v3 = *(unsigned __int8 *)(a1 + 32);
    id v4 = sub_100044434();
    uint64_t v5 = [v4 autorelease];
    uint64_t v6 = (void *)v5;
    if (v5)
    {
      float v7 = *(dispatch_queue_s **)(v5 + 8);
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472LL;
      _OWORD v8[2] = sub_1000444E4;
      v8[3] = &unk_1000B7D18;
      void v8[4] = v6;
      BOOL v9 = v3 != 0;
      dispatch_async(v7, v8);
    }

    *(_DWORD *)(a2 + 32) = 0;
  }

_DWORD *sub_10007924C(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0) {
    goto LABEL_16;
  }
  int v3 = result;
  uint64_t v4 = result[1];
  unsigned int v5 = result[9];
  if (v5 > 0x400) {
    goto LABEL_16;
  }
  unsigned int v6 = (v5 + 3) & 0xFFFFFFFC;
  uint64_t v8 = 1064LL;
  uint64_t result = memchr(result + 10, 0, v8 - 40);
  if (result)
  {
    BOOL v9 = (char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL);
    if (!*(_DWORD *)v9 && *((_DWORD *)v9 + 1) > 0x1Fu)
    {
      char v11 = *((_BYTE *)v3 + v6 + 40);
      __int128 v12 = *(_OWORD *)(v9 + 36);
      v13[0] = *(_OWORD *)(v9 + 20);
      v13[1] = v12;
      uint64_t result = (_DWORD *)sub_1000202D4((uint64_t)(v3 + 10), v11, v13);
      *(_DWORD *)(a2 + 32) = (_DWORD)result;
      return result;
    }

    int v10 = -309;
  }

  else
  {
LABEL_16:
    int v10 = -304;
  }

  *(_DWORD *)(a2 + 32) = v10;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_100079358(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) == 0
    && (int v3 = result, v4 = result[1], v4 >= 0x28)
    && v4 <= 0x428
    && ((unsigned int v5 = result[9], v5 <= 0x400) ? (v6 = (int)v4 - 40 >= v5) : (v6 = 0),
        (unsigned int v7 = ((v5 + 3) & 0xFFFFFFFC) + 40, v6) ? (v8 = (_DWORD)v4 == v7) : (v8 = 0),
        v8 && (uint64_t result = memchr(result + 10, 0, v4 - 40)) != 0LL))
  {
    int v10 = (char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL);
    if (!*(_DWORD *)v10 && *((_DWORD *)v10 + 1) > 0x1Fu)
    {
      __int128 v11 = *(_OWORD *)(v10 + 36);
      v12[0] = *(_OWORD *)(v10 + 20);
      v12[1] = v11;
      uint64_t result = (_DWORD *)sub_10002054C((uint64_t)(v3 + 10), v12);
      *(_DWORD *)(a2 + 32) = (_DWORD)result;
      return result;
    }

    int v9 = -309;
  }

  else
  {
    int v9 = -304;
  }

  *(_DWORD *)(a2 + 32) = v9;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

void sub_100079440(_DWORD *a1, uint64_t a2)
{
  if ((*a1 & 0x80000000) != 0 || a1[1] != 24)
  {
    int v5 = -304;
  }

  else
  {
    int v4 = a1[6];
    int v3 = a1 + 6;
    if (v4 || v3[1] <= 0x1Fu)
    {
      int v5 = -309;
    }

    else
    {
      __int128 v6 = *(_OWORD *)(v3 + 9);
      v7[0] = *(_OWORD *)(v3 + 5);
      v7[1] = v6;
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472LL;
      _OWORD v8[2] = sub_10002070C;
      v8[3] = &unk_1000B7108;
      void v8[4] = a2 + 36;
      if ((sub_1000138EC( (uint64_t)"_BKDisplayXXDisplayIsTethered",  BKBackBoardClientEntitlement,  (uint64_t)v7) & 1) != 0)
      {
        sub_10002070C((uint64_t)v8);
        *(_DWORD *)(a2 + 32) = 0;
        *(NDR_record_t *)(a2 + 24) = NDR_record;
        *(_DWORD *)(a2 + 4) = 40;
        return;
      }

      int v5 = 5;
    }
  }

  *(_DWORD *)(a2 + 32) = v5;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
}

void sub_10007953C(_DWORD *a1, uint64_t a2)
{
  if ((*a1 & 0x80000000) != 0 || a1[1] != 24)
  {
    int v5 = -304;
  }

  else
  {
    int v4 = a1[6];
    int v3 = a1 + 6;
    if (v4 || v3[1] <= 0x1Fu)
    {
      int v5 = -309;
    }

    else
    {
      __int128 v6 = *(_OWORD *)(v3 + 9);
      v7[0] = *(_OWORD *)(v3 + 5);
      v7[1] = v6;
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472LL;
      _OWORD v8[2] = sub_100020754;
      v8[3] = &unk_1000B7108;
      void v8[4] = a2 + 36;
      if ((sub_1000138EC( (uint64_t)"_BKDisplayXXTetherPrefsNeedImmediateUpdate",  BKBackBoardClientEntitlement,  (uint64_t)v7) & 1) != 0)
      {
        sub_100020754((uint64_t)v8);
        *(_DWORD *)(a2 + 32) = 0;
        *(NDR_record_t *)(a2 + 24) = NDR_record;
        *(_DWORD *)(a2 + 4) = 40;
        return;
      }

      int v5 = 5;
    }
  }

  *(_DWORD *)(a2 + 32) = v5;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
}

void sub_100079638(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 36)
  {
    int v3 = -304;
  }

  else if (*(_DWORD *)(a1 + 36) || *(_DWORD *)(a1 + 40) < 0x20u)
  {
    int v3 = -309;
  }

  else
  {
    char v4 = *(_BYTE *)(a1 + 32);
    __int128 v5 = *(_OWORD *)(a1 + 72);
    v6[0] = *(_OWORD *)(a1 + 56);
    v6[1] = v5;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    _OWORD v7[2] = sub_1000207CC;
    v7[3] = &unk_1000B7E00;
    char v8 = v4;
    if (sub_1000138EC( (uint64_t)"_BKDisplayXXSetTetheredOrientationNotificationsDisabled",  BKBackBoardClientEntitlement,  (uint64_t)v6))
    {
      sub_1000207CC((uint64_t)v7);
      int v3 = 0;
    }

    else
    {
      int v3 = 5;
    }
  }

  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
}

void sub_100079720(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 36)
  {
    int v3 = -304;
    goto LABEL_7;
  }

  if (*(_DWORD *)(a1 + 36) || *(_DWORD *)(a1 + 40) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return;
  }

  char v4 = *(_BYTE *)(a1 + 32);
  __int128 v5 = *(_OWORD *)(a1 + 72);
  v7[0] = *(_OWORD *)(a1 + 56);
  v7[1] = v5;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  _OWORD v8[2] = sub_100020818;
  v8[3] = &unk_1000B7E00;
  char v9 = v4;
  if (sub_1000138EC( (uint64_t)"_BKDisplayXXUpdateTetheredDisplayOrientationIfNecessaryWithInterfaceOrientation",  BKBackBoardClientEntitlement,  (uint64_t)v7))
  {
    sub_100020818((uint64_t)v8);
    int v6 = 0;
  }

  else
  {
    int v6 = 5;
  }

  *(_DWORD *)(a2 + 32) = v6;
}

void sub_10007980C(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 36)
  {
    int v3 = -304;
    goto LABEL_7;
  }

  if (*(_DWORD *)(a1 + 36) || *(_DWORD *)(a1 + 40) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return;
  }

  char v4 = *(_BYTE *)(a1 + 32);
  __int128 v5 = *(_OWORD *)(a1 + 72);
  v7[0] = *(_OWORD *)(a1 + 56);
  v7[1] = v5;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  _OWORD v8[2] = sub_100020868;
  v8[3] = &unk_1000B7E00;
  char v9 = v4;
  if (sub_1000138EC( (uint64_t)"_BKDisplayXXUpdateMirroredDisplayOrientationWithInterfaceOrientation",  BKBackBoardClientEntitlement,  (uint64_t)v7))
  {
    sub_100020868((uint64_t)v8);
    int v6 = 0;
  }

  else
  {
    int v6 = 5;
  }

  *(_DWORD *)(a2 + 32) = v6;
}

void sub_1000798F8(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 36)
  {
    int v3 = -304;
  }

  else if (*(_DWORD *)(a1 + 36) || *(_DWORD *)(a1 + 40) < 0x20u)
  {
    int v3 = -309;
  }

  else
  {
    char v4 = *(_BYTE *)(a1 + 32);
    __int128 v5 = *(_OWORD *)(a1 + 72);
    v6[0] = *(_OWORD *)(a1 + 56);
    v6[1] = v5;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    _OWORD v7[2] = sub_100021444;
    v7[3] = &unk_1000B7E00;
    char v8 = v4;
    if (sub_1000138EC((uint64_t)"_BKDisplayXXSetSecureMode", BKBackBoardClientEntitlement, (uint64_t)v6))
    {
      sub_100021444((uint64_t)v7);
      int v3 = 0;
    }

    else
    {
      int v3 = 5;
    }
  }

  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
}

_DWORD *sub_1000799E0(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0
    || (int v3 = result, v4 = result[1], v4 < 0x28)
    || v4 > 0x428
    || ((unsigned int v5 = result[9], v5 <= 0x400) ? (v6 = (int)v4 - 40 >= v5) : (v6 = 0),
        (unsigned int v7 = ((v5 + 3) & 0xFFFFFFFC) + 40, v6) ? (v8 = (_DWORD)v4 == v7) : (v8 = 0),
        !v8 || (uint64_t result = memchr(result + 10, 0, v4 - 40)) == 0LL))
  {
    int v9 = -304;
LABEL_12:
    *(_DWORD *)(a2 + 32) = v9;
    goto LABEL_13;
  }

  int v10 = (char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL);
  if (*(_DWORD *)v10 || *((_DWORD *)v10 + 1) <= 0x1Fu)
  {
    int v9 = -309;
    goto LABEL_12;
  }

  *(_DWORD *)(a2 + 52) = 0;
  *(_DWORD *)(a2 + 36) = 16777472;
  __int128 v11 = *(_OWORD *)(v10 + 36);
  v12[0] = *(_OWORD *)(v10 + 20);
  v12[1] = v11;
  uint64_t result = (_DWORD *)sub_10002123C((_BYTE *)v3 + 40, (void *)(a2 + 28), (_DWORD *)(a2 + 52), (uint64_t)v12);
  if (!(_DWORD)result)
  {
    *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
    *(NDR_record_t *)(a2 + 44) = NDR_record;
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 56;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }

  *(_DWORD *)(a2 + 32) = (_DWORD)result;
LABEL_13:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

void sub_100079B14(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 && *(_DWORD *)(a1 + 24) == 2 && *(_DWORD *)(a1 + 4) == 76)
  {
    if (*(_BYTE *)(a1 + 39) == 1
      && *(_BYTE *)(a1 + 55) == 1
      && (unsigned int v4 = *(_DWORD *)(a1 + 40), v4 == *(_DWORD *)(a1 + 68))
      && (unsigned int v5 = *(_DWORD *)(a1 + 56), v5 == *(_DWORD *)(a1 + 72)))
    {
      if (!*(_DWORD *)(a1 + 76) && *(_DWORD *)(a1 + 80) > 0x1Fu)
      {
        uint64_t v7 = *(void *)(a1 + 28);
        uint64_t v8 = *(void *)(a1 + 44);
        __int128 v9 = *(_OWORD *)(a1 + 112);
        v10[0] = *(_OWORD *)(a1 + 96);
        v10[1] = v9;
        *(_DWORD *)(a2 + 32) = sub_100020C8C(v7, v4, v8, v5, (uint64_t)v10);
        mig_deallocate(*(void *)(a1 + 44), *(unsigned int *)(a1 + 56));
        *(void *)(a1 + 44) = 0LL;
        *(_DWORD *)(a1 + 56) = 0;
        mig_deallocate(*(void *)(a1 + 28), *(unsigned int *)(a1 + 40));
        *(void *)(a1 + 2_Block_object_dispose(va, 8) = 0LL;
        *(_DWORD *)(a1 + 40) = 0;
        goto LABEL_13;
      }

      int v6 = -309;
    }

    else
    {
      int v6 = -300;
    }
  }

  else
  {
    int v6 = -304;
  }

  *(_DWORD *)(a2 + 32) = v6;
LABEL_13:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
}

void sub_100079C20(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 && *(_DWORD *)(a1 + 24) == 2 && *(_DWORD *)(a1 + 4) == 76)
  {
    if (*(_BYTE *)(a1 + 39) == 1
      && *(_BYTE *)(a1 + 55) == 1
      && (unsigned int v4 = *(_DWORD *)(a1 + 40), v4 == *(_DWORD *)(a1 + 68))
      && (unsigned int v5 = *(_DWORD *)(a1 + 56), v5 == *(_DWORD *)(a1 + 72)))
    {
      if (!*(_DWORD *)(a1 + 76) && *(_DWORD *)(a1 + 80) > 0x1Fu)
      {
        uint64_t v7 = *(void *)(a1 + 28);
        uint64_t v8 = *(void *)(a1 + 44);
        __int128 v9 = *(_OWORD *)(a1 + 112);
        v10[0] = *(_OWORD *)(a1 + 96);
        v10[1] = v9;
        *(_DWORD *)(a2 + 32) = sub_10002108C(v7, v4, v8, v5, (uint64_t)v10);
        mig_deallocate(*(void *)(a1 + 44), *(unsigned int *)(a1 + 56));
        *(void *)(a1 + 44) = 0LL;
        *(_DWORD *)(a1 + 56) = 0;
        mig_deallocate(*(void *)(a1 + 28), *(unsigned int *)(a1 + 40));
        *(void *)(a1 + 2_Block_object_dispose(va, 8) = 0LL;
        *(_DWORD *)(a1 + 40) = 0;
        goto LABEL_13;
      }

      int v6 = -309;
    }

    else
    {
      int v6 = -300;
    }
  }

  else
  {
    int v6 = -304;
  }

  *(_DWORD *)(a2 + 32) = v6;
LABEL_13:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
}

void sub_100079D2C(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 && *(_DWORD *)(a1 + 24) == 1 && *(_DWORD *)(a1 + 4) == 56)
  {
    if (*(_BYTE *)(a1 + 39) == 1 && (unsigned int v4 = *(_DWORD *)(a1 + 40), v4 == *(_DWORD *)(a1 + 52)))
    {
      if (!*(_DWORD *)(a1 + 56) && *(_DWORD *)(a1 + 60) > 0x1Fu)
      {
        uint64_t v6 = *(void *)(a1 + 28);
        __int128 v7 = *(_OWORD *)(a1 + 92);
        v8[0] = *(_OWORD *)(a1 + 76);
        v8[1] = v7;
        *(_DWORD *)(a2 + 32) = sub_10002117C(v6, v4, (uint64_t)v8);
        mig_deallocate(*(void *)(a1 + 28), *(unsigned int *)(a1 + 40));
        *(void *)(a1 + 2_Block_object_dispose(va, 8) = 0LL;
        *(_DWORD *)(a1 + 40) = 0;
        goto LABEL_11;
      }

      int v5 = -309;
    }

    else
    {
      int v5 = -300;
    }
  }

  else
  {
    int v5 = -304;
  }

  *(_DWORD *)(a2 + 32) = v5;
LABEL_11:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
}

void sub_100079E04(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 && *(_DWORD *)(a1 + 24) == 1 && *(_DWORD *)(a1 + 4) == 56)
  {
    if (*(_BYTE *)(a1 + 39) == 1 && (int v4 = *(_DWORD *)(a1 + 40), v4 == *(_DWORD *)(a1 + 52)))
    {
      if (!*(_DWORD *)(a1 + 56) && *(_DWORD *)(a1 + 60) > 0x1Fu)
      {
        uint64_t v6 = *(void *)(a1 + 28);
        __int128 v7 = *(_OWORD *)(a1 + 92);
        v8[0] = *(_OWORD *)(a1 + 76);
        v8[1] = v7;
        *(_DWORD *)(a2 + 32) = sub_10002134C(v6, v4, v8);
        mig_deallocate(*(void *)(a1 + 28), *(unsigned int *)(a1 + 40));
        *(void *)(a1 + 2_Block_object_dispose(va, 8) = 0LL;
        *(_DWORD *)(a1 + 40) = 0;
        goto LABEL_11;
      }

      int v5 = -309;
    }

    else
    {
      int v5 = -300;
    }
  }

  else
  {
    int v5 = -304;
  }

  *(_DWORD *)(a2 + 32) = v5;
LABEL_11:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
}

void sub_100079EDC(_DWORD *a1, uint64_t a2)
{
  if ((*a1 & 0x80000000) != 0 || a1[1] != 24)
  {
    int v5 = -304;
    goto LABEL_7;
  }

  int v4 = a1[6];
  int v3 = a1 + 6;
  if (v4 || v3[1] <= 0x1Fu)
  {
    int v5 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v5;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return;
  }

  *(_DWORD *)(a2 + 36) = 16777472;
  *(_DWORD *)(a2 + 52) = 0;
  __int128 v6 = *(_OWORD *)(v3 + 9);
  v30[0] = *(_OWORD *)(v3 + 5);
  v30[1] = v6;
  BKBootUIPresenter *v7 = [BKBootUIPresenter sharedInstance];
  uint64_t v8 = [BKDisplayRenderOverlayManager sharedInstance];
  uint64_t v9 = BSPIDForAuditToken(v30);
  unsigned int v10 = 0;
  if (([v8 isShowingNonBootUIOverlays] & 1) == 0)
  {
    NSString *v11 = [NSString stringWithFormat:@"pid %d", v9];
    unsigned int v10 = [v7 sustainOverlayForReason:v11];
  }

  NSMutableSet *v12 = [NSMutableSet set];
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v13 = (void *)[v8 activeOverlays];
  id v14 = [v13 countByEnumeratingWithState:v31 objects:v37 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v32;
    do
    {
      for (uint64_t i = 0LL; i != v15; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v32 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)i);
        [v18 level];
        if (v19 > 0.0)
        {
          uint64_t v20 = (void *)[v18 descriptor];
          [v12 addObject:v20];
        }
      }

      id v15 = [v13 countByEnumeratingWithState:v31 objects:v37 count:16];
    }

    while (v15);
  }

  id v21 = [v12 count];
  id v22 = sub_10003F0B0();
  uint64_t v23 = [v22 autorelease];
  BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
  if (!v21)
  {
    if (v24)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "GetRenderOverlayDismissActions: no active overlays",  buf,  2u);
    }

    if (!v10) {
      goto LABEL_28;
    }
LABEL_27:
    [v7 unsustainOverlayForReason:@"failed to encode dismiss actions"];
LABEL_28:

    int v5 = 5;
    goto LABEL_7;
  }

  if (v24)
  {
    id v25 = [BSDescriptionStream descriptionForRootObject:v12];
    *(_DWORD *)buf = 138543362;
    uint64_t v36 = v25;
    _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "GetRenderOverlayDismissActions: returning %{public}@",  buf,  0xCu);
  }

  uint64_t v26 = [v12 bs_secureEncoded];
  if (!v26)
  {
    id v28 = sub_10003F0B0();
    os_log_s *v29 = [v28 autorelease];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "GetRenderOverlayDismissActions failed to encode actions",  buf,  2u);
    }

    if ((v10 & 1) == 0) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }

  uint64_t v27 = v26;
  *(void *)(a2 + 2_Block_object_dispose(va, 8) = [v26 bs_bytesForMIG];
  *(_DWORD *)(a2 + 52) = [v27 bs_lengthForMIG];

  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(NDR_record_t *)(a2 + 44) = NDR_record;
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 56;
  *(_DWORD *)(a2 + 24) = 1;
}

void sub_10007A284(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) == 0 || *(_DWORD *)(a1 + 24) != 1 || *(_DWORD *)(a1 + 4) != 56)
  {
    int v4 = -304;
    goto LABEL_10;
  }

  if (*(_BYTE *)(a1 + 39) != 1 || *(_DWORD *)(a1 + 40) != *(_DWORD *)(a1 + 52))
  {
    int v4 = -300;
    goto LABEL_10;
  }

  if (*(_DWORD *)(a1 + 56) || *(_DWORD *)(a1 + 60) <= 0x1Fu)
  {
    int v4 = -309;
LABEL_10:
    *(_DWORD *)(a2 + 32) = v4;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return;
  }

  sub_100020C24();
  *(_DWORD *)(a2 + 32) = 5;
  mig_deallocate(*(void *)(a1 + 28), *(unsigned int *)(a1 + 40));
  *(void *)(a1 + 2_Block_object_dispose(va, 8) = 0LL;
  *(_DWORD *)(a1 + 40) = 0;
}

uint64_t sub_10007A340(mach_port_t a1, int a2, double a3, float a4, float a5, float a6)
{
  NDR_record_t v8 = NDR_record;
  double v9 = a3;
  float v10 = a4;
  float v11 = a5;
  float v12 = a6;
  int v13 = a2;
  msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 980665;
  if (&_voucher_mach_msg_set) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 17, 0x38u, 0, 0, 0, 0);
}

uint64_t sub_10007A3C4(_DWORD *a1, uint64_t a2)
{
  unsigned int v3 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  int v4 = a1[5] + 100;
  *(void *)(a2 + _Block_object_dispose(va, 8) = v3;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v4;
  if (a1[5] != 6002000)
  {
    uint64_t result = 0LL;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 32) = -303;
    return result;
  }

  if ((*a1 & 0x80000000) != 0 || a1[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v7 = NDR_record;
LABEL_13:
    *(NDR_record_t *)(a2 + 24) = v7;
    return 1LL;
  }

  if (qword_1000DC218 != -1) {
    dispatch_once(&qword_1000DC218, &stru_1000B7B10);
  }
  unsigned int v5 = [(id)qword_1000DC210 isAlive];
  *(_BYTE *)(a2 + 36) = 1;
  if (v5) {
    int v6 = 0;
  }
  else {
    int v6 = 5;
  }
  *(_DWORD *)(a2 + 32) = v6;
  NDR_record_t v7 = NDR_record;
  if ((v5 & 1) == 0) {
    goto LABEL_13;
  }
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  *(_DWORD *)(a2 + 4) = 40;
  return 1LL;
}

id objc_msgSend_ALSDelayOnUnlock(void *a1, const char *a2, ...)
{
  return _[a1 ALSDelayOnUnlock];
}

id objc_msgSend_ALSEpoch(void *a1, const char *a2, ...)
{
  return _[a1 ALSEpoch];
}

id objc_msgSend_ALSUserPreferences(void *a1, const char *a2, ...)
{
  return _[a1 ALSUserPreferences];
}

id objc_msgSend_CATransform3DValue(void *a1, const char *a2, ...)
{
  return _[a1 CATransform3DValue];
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return _[a1 CGColor];
}

id objc_msgSend_HIDSystemChannel(void *a1, const char *a2, ...)
{
  return _[a1 HIDSystemChannel];
}

id objc_msgSend_TVOutDisplay(void *a1, const char *a2, ...)
{
  return _[a1 TVOutDisplay];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _[a1 URL];
}

id objc_msgSend_URLForResource_withExtension_(void *a1, const char *a2, ...)
{
  return [a1 URLForResource:withExtension:];
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return [a1 URLWithString:];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend__activateConnection_withContext_(void *a1, const char *a2, ...)
{
  return [a1 _activateConnection:withContext:];
}

id objc_msgSend__addSystemShellToCollectivePingSet_(void *a1, const char *a2, ...)
{
  return [a1 _addSystemShellToCollectivePingSet];
}

id objc_msgSend__animationForBackgroundLayerCrossfading_(void *a1, const char *a2, ...)
{
  return [_animationForBackgroundLayerCrossfading:];
}

id objc_msgSend__animationForContentLayerCrossfading_(void *a1, const char *a2, ...)
{
  return [a1 _animationForContentLayerCrossfading];
}

id objc_msgSend__animationForKeyPath_withSettings_(void *a1, const char *a2, ...)
{
  return [a1 _animationForKeyPath:withSettings:];
}

id objc_msgSend__applyExtendedHitTestInformationForCAScreenCoordinates_displayUUID_toPathAttributes_secureName_excludeContextIDs_( void *a1, const char *a2, ...)
{
  return [a1 _applyExtendedHitTestInformationForCAScreenCoordinates:v1 displayUUID:v2 toPathAttributes:v3 secureName:v4 excludeContextIDs:v5];
}

id objc_msgSend__assetPrefix(void *a1, const char *a2, ...)
{
  return _[a1 _assetPrefix];
}

id objc_msgSend__beginUpdateTransaction_(void *a1, const char *a2, ...)
{
  return [a1 _beginUpdateTransaction:];
}

id objc_msgSend__bounds(void *a1, const char *a2, ...)
{
  return _[a1 _bounds];
}

id objc_msgSend__bundleInfoOverrides(void *a1, const char *a2, ...)
{
  return _[a1 _bundleInfoOverrides];
}

id objc_msgSend__classesRequiredToDecode(void *a1, const char *a2, ...)
{
  return _[a1 _classesRequiredToDecode];
}

id objc_msgSend__cleanUpContentLayer(void *a1, const char *a2, ...)
{
  return _[a1 _cleanUpContentLayer];
}

id objc_msgSend__cleanup(void *a1, const char *a2, ...)
{
  return _[a1 _cleanup];
}

id objc_msgSend__collectivePingSystemShellSet(void *a1, const char *a2, ...)
{
  return _[a1 _collectivePingSystemShellSet];
}

id objc_msgSend__commonInitWithContext_server_(void *a1, const char *a2, ...)
{
  return [a1 _commonInitWithContext:a2 server:a3];
}

id objc_msgSend__configureReferenceSpaceLayerTransformWithScale_(void *a1, const char *a2, ...)
{
  return [a1 _configureReferenceSpaceLayerTransformWithScale:];
}

id objc_msgSend__createImageForIndex_basename_scale_idiom_bundle_(void *a1, const char *a2, ...)
{
  return [a1 _createImageForIndex:basename:scale:idiom:bundle:];
}

id objc_msgSend__currentMaskForUsage_HIDSystem_mask_maskIfEngaged_(void *a1, const char *a2, ...)
{
  return [_currentMaskForUsage:HIDSystem:mask:maskIfEngaged:];
}

id objc_msgSend__dataMigrationCheckInListener_didReceiveConnection_withContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dataMigrationCheckInListener:didReceiveConnection:withContext:");
}

id objc_msgSend__deathByPid(void *a1, const char *a2, ...)
{
  return _[a1 _deathByPid];
}

id objc_msgSend__deathBySendRight(void *a1, const char *a2, ...)
{
  return _[a1 _deathBySendRight];
}

id objc_msgSend__demoCardConnection(void *a1, const char *a2, ...)
{
  return _[a1 _demoCardConnection];
}

id objc_msgSend__determineServiceForEvent_sender_fromTouchPad_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_determineServiceForEvent:sender:fromTouchPad:");
}

id objc_msgSend__didRespondToTouchDelivery(void *a1, const char *a2, ...)
{
  return _[a1 _didRespondToTouchDelivery];
}

id objc_msgSend__dumpNodeTree_level_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dumpNodeTree:level:");
}

id objc_msgSend__endUpdateTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_endUpdateTransaction:");
}

id objc_msgSend__enumerateKeyPathNodesByComponent_options_ifFound_ifMissing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_enumerateKeyPathNodesByComponent:options:ifFound:ifMissing:");
}

id objc_msgSend__enumerateNodesWithOptions_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_enumerateNodesWithOptions:usingBlock:");
}

id objc_msgSend__eventSourceForKeyboardInfo_sender_(void *a1, const char *a2, ...)
{
  return [a1 _eventSourceForKeyboardInfo:sender:];
}

id objc_msgSend__exclusiveTouchNormalizedSubRectInReferenceSpace(void *a1, const char *a2, ...)
{
  return _[a1 _exclusiveTouchNormalizedSubRectInReferenceSpace];
}

id objc_msgSend__fileNameForOverlay_(void *a1, const char *a2, ...)
{
  return [a1 _fileNameForOverlay:];
}

id objc_msgSend__filePathForOverlay_(void *a1, const char *a2, ...)
{
  return [a1 _filePathForOverlay:];
}

id objc_msgSend__filterDisplay_usingPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_filterDisplay:usingPredicate:");
}

id objc_msgSend__filterDisplays_usingPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_filterDisplays:usingPredicate:");
}

id objc_msgSend__getFrames_ofAnnotations_fixSuperlayer_scale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getFrames:ofAnnotations:fixSuperlayer:scale:");
}

id objc_msgSend__handleAccelerometerRequestForPort_auditToken_updateBlock_(void *a1, const char *a2, ...)
{
  return [a1 _handleAccelerometerRequestForPort:auditToken:updateBlock:];
}

id objc_msgSend__handleDirectTouchEvent_service_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleDirectTouchEvent:service:");
}

id objc_msgSend__handleEvent_(void *a1, const char *a2, ...)
{
  return [a1 _handleEvent:];
}

id objc_msgSend__handleInterruptedOrInvalidatedConnection(void *a1, const char *a2, ...)
{
  return _[a1 _handleInterruptedOrInvalidatedConnection];
}

id objc_msgSend__hardwareIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 _hardwareIdentifier];
}

id objc_msgSend__idiomSuffix(void *a1, const char *a2, ...)
{
  return _[a1 _idiomSuffix];
}

id objc_msgSend__imageAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_imageAtIndex:");
}

id objc_msgSend__immutableDisplays(void *a1, const char *a2, ...)
{
  return _[a1 _immutableDisplays];
}

id objc_msgSend__init(void *a1, const char *a2, ...)
{
  return _[a1 _init];
}

id objc_msgSend__initWithBrightnessController_(void *a1, const char *a2, ...)
{
  return [_BKDisplayBrightnessController _initWithBrightnessController:a1];
}

id objc_msgSend__initWithBrightnessSystem_systemShellSentinel_orientationManager_(void *a1, const char *a2, ...)
{
  return [a1 _initWithBrightnessSystem:a2 systemShellSentinel:a3 orientationManager:a4];
}

id objc_msgSend__initWithDescriptor_overlayType_imageData_level_frozen_(void *a1, const char *a2, ...)
{
  return [a1 _initWithDescriptor:v10 overlayType:v11 imageData:v12 level:v13 frozen:v14];
}

id objc_msgSend__initWithDeviceOrientationManager_(void *a1, const char *a2, ...)
{
  return [a1 _initWithDeviceOrientationManager:];
}

id objc_msgSend__initWithPersistenceCoordinator_orientationManager_backlightManager_windowServer_( void *a1, const char *a2, ...)
{
  return [a1 _initWithPersistenceCoordinator:a2 orientationManager:a3 backlightManager:a4 windowServer:a5];
}

id objc_msgSend__initWithPersistenceData_(void *a1, const char *a2, ...)
{
  return [a1 _initWithPersistenceData:];
}

id objc_msgSend__isBuiltinDisplay(void *a1, const char *a2, ...)
{
  return _[a1 _isBuiltinDisplay];
}

id objc_msgSend__isModifierKeyWithPage_usage_(void *a1, const char *a2, ...)
{
  return [a1 _isModifierKeyWithPage:v1 usage:v2];
}

id objc_msgSend__isNullDisplay(void *a1, const char *a2, ...)
{
  return _[a1 _isNullDisplay];
}

id objc_msgSend__keyPathForTouchIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 _keyPathForTouchIdentifier:];
}

id objc_msgSend__loadAllImages(void *a1, const char *a2, ...)
{
  return _[a1 _loadAllImages];
}

id objc_msgSend__lock_CATransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lock_CATransaction:");
}

id objc_msgSend__lock_activeModifiers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lock_activeModifiers");
}

id objc_msgSend__lock_addDeathWatcherForPid_(void *a1, const char *a2, ...)
{
  return [a1 _lock_addDeathWatcherForPid:];
}

id objc_msgSend__lock_addModifierKeyDown_(void *a1, const char *a2, ...)
{
  return [a1 _lock_addModifierKeyDown:];
}

id objc_msgSend__lock_addObserversToDisplay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lock_addObserversToDisplay:");
}

id objc_msgSend__lock_anyKeyboardHasCapsLockActive(void *a1, const char *a2, ...)
{
  return [a1 _lock_anyKeyboardHasCapsLockActive];
}

id objc_msgSend__lock_applyDeliveryInformation_resolution_toEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lock_applyDeliveryInformation:resolution:toEvent:");
}

id objc_msgSend__lock_blockSystemApp(void *a1, const char *a2, ...)
{
  return [a1 _lock_blockSystemApp];
}

id objc_msgSend__lock_bootstrapSystemApp(void *a1, const char *a2, ...)
{
  return [a1 _lock_bootstrapSystemApp];
}

id objc_msgSend__lock_cancelKeyDownEvents_(void *a1, const char *a2, ...)
{
  return [a1 _lock_cancelKeyDownEvents:];
}

id objc_msgSend__lock_checkInWithRemoteCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lock_checkInWithRemoteCompletionBlock:");
}

id objc_msgSend__lock_clearSystemAppOrientationClient(void *a1, const char *a2, ...)
{
  return [a1 _lock_clearSystemAppOrientationClient];
}

id objc_msgSend__lock_clearWindowServerDisplayTags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lock_clearWindowServerDisplayTags:");
}

id objc_msgSend__lock_cloneMirroringOptionsFromSourceDisplay_destinationDisplay_virtualMode_isStevenote_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lock_cloneMirroringOptionsFromSourceDisplay:destinationDisplay:virtualMode:isStevenote:");
}

id objc_msgSend__lock_cloneMirroringOptionsSteveNote_contextIDs_(void *a1, const char *a2, ...)
{
  return [a1 _lock_cloneMirroringOptionsSteveNote:contextIDs:];
}

id objc_msgSend__lock_commitDisplayBrightness(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lock_commitDisplayBrightness");
}

id objc_msgSend__lock_completeCheckInForShell_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lock_completeCheckInForShell:");
}

id objc_msgSend__lock_completeCheckInForShell_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lock_completeCheckInForShell:completionBlock:");
}

id objc_msgSend__lock_currentConnectionShell(void *a1, const char *a2, ...)
{
  return [a1 _lock_currentConnectionShell];
}

id objc_msgSend__lock_dispatchKeyEvent_keyCommand_keyboardInfo_eventSource_fromSender_dispatcher_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lock_dispatchKeyEvent:keyCommand:keyboardInfo:eventSource:fromSender:dispatcher:");
}

id objc_msgSend__lock_evaluateAllDisplaysForReason_(void *a1, const char *a2, ...)
{
  return [a1 _lock_evaluateAllDisplaysForReason:];
}

id objc_msgSend__lock_evaluateCarPlayDisplay_label_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lock_evaluateCarPlayDisplay:label:");
}

id objc_msgSend__lock_evaluateConnectedDisplay_because_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lock_evaluateConnectedDisplay:because:");
}

id objc_msgSend__lock_evaluateContinuityDisplay_label_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lock_evaluateContinuityDisplay:label:");
}

id objc_msgSend__lock_evaluateDisplay_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lock_evaluateDisplay:reason:");
}

id objc_msgSend__lock_evaluateExistingClonesForReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lock_evaluateExistingClonesForReason:");
}

id objc_msgSend__lock_existingClientForSendRight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lock_existingClientForSendRight:");
}

id objc_msgSend__lock_freezeOverlay_(void *a1, const char *a2, ...)
{
  return [a1 _lock_freezeOverlay:];
}

id objc_msgSend__lock_handleKeyEvent_fromSender_dispatcher_bypassCapsLockChecks_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lock_handleKeyEvent:fromSender:dispatcher:bypassCapsLockChecks:");
}

id objc_msgSend__lock_handleRelaunchRequestFromSystemApp_withOptions_(void *a1, const char *a2, ...)
{
  return [a1 _lock_handleRelaunchRequestFromSystemApp:withOptions:];
}

id objc_msgSend__lock_handleUnicodeEvent_fromSender_dispatcher_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lock_handleUnicodeEvent:fromSender:dispatcher:");
}

id objc_msgSend__lock_hasEntitlement_usingCacheForAuditToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lock_hasEntitlement:usingCacheForAuditToken:");
}

id objc_msgSend__lock_invalidate(void *a1, const char *a2, ...)
{
  return [a1 _lock_invalidate];
}

id objc_msgSend__lock_keyboardRemoved_(void *a1, const char *a2, ...)
{
  return [a1 _lock_keyboardRemoved:];
}

id objc_msgSend__lock_keyboardsDetected_(void *a1, const char *a2, ...)
{
  return [a1 _lock_keyboardsDetected:];
}

id objc_msgSend__lock_locationDidChanges(void *a1, const char *a2, ...)
{
  return [a1 _lock_locationDidChanges];
}

id objc_msgSend__lock_postSyntheticCapsLockPressForKeyboard_(void *a1, const char *a2, ...)
{
  return [a1 _lock_postSyntheticCapsLockPressForKeyboard:];
}

id objc_msgSend__lock_postSyntheticEventWithDetectionMaskToClients_(void *a1, const char *a2, ...)
{
  return [a1 _lock_postSyntheticEventWithDetectionMaskToClients:];
}

id objc_msgSend__lock_publishUsableKeyboards_toServiceConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lock_publishUsableKeyboards:toServiceConnection:");
}

id objc_msgSend__lock_publishUsableKeyboardsToServiceConnections(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lock_publishUsableKeyboardsToServiceConnections");
}

id objc_msgSend__lock_rebuildModeCache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lock_rebuildModeCache");
}

id objc_msgSend__lock_recomputeTagsForDisplay_shouldHide_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lock_recomputeTagsForDisplay:shouldHide:");
}

id objc_msgSend__lock_removeAnnotation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lock_removeAnnotation:");
}

id objc_msgSend__lock_removeCapsLockEntryIfNeeded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lock_removeCapsLockEntryIfNeeded:");
}

id objc_msgSend__lock_removeClone_fromWindowServerDisplay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lock_removeClone:fromWindowServerDisplay:");
}

id objc_msgSend__lock_removeDisplayCloneDestination_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lock_removeDisplayCloneDestination:");
}

id objc_msgSend__lock_removeModifierKeyDown_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lock_removeModifierKeyDown:");
}

id objc_msgSend__lock_removeObserversFromDisplay_(void *a1, const char *a2, ...)
{
  return [a1 _lock_removeObserversFromDisplay:];
}

id objc_msgSend__lock_removeSenderIDFromTracking_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lock_removeSenderIDFromTracking:");
}

id objc_msgSend__lock_restoreCapsLockStateToKeyboard_(void *a1, const char *a2, ...)
{
  return [a1 _lock_restoreCapsLockStateToKeyboard:];
}

id objc_msgSend__lock_sendQueuedUpdatesToClient(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lock_sendQueuedUpdatesToClient");
}

id objc_msgSend__lock_setBacklightLocked_(void *a1, const char *a2, ...)
{
  return [a1 _lock_setBacklightLocked:YES];
}

id objc_msgSend__lock_setCapsLockActive_onSenderID_(void *a1, const char *a2, ...)
{
  return [a1 _lock_setCapsLockActive:YES onSenderID:self];
}

id objc_msgSend__lock_setCapsLockState_forKeyboard_(void *a1, const char *a2, ...)
{
  return [a1 _lock_setCapsLockState:forKeyboard:];
}

id objc_msgSend__lock_setKeyboardLightsSuspended_(void *a1, const char *a2, ...)
{
  return [a1 _lock_setKeyboardLightsSuspended:];
}

id objc_msgSend__lock_setLockedOrientation_(void *a1, const char *a2, ...)
{
  return [a1 _lock_setLockedOrientation:];
}

id objc_msgSend__lock_setOverlaysDisablingUpdates_(void *a1, const char *a2, ...)
{
  return [a1 _lock_setOverlaysDisablingUpdates:];
}

id objc_msgSend__lock_setPrimaryKeyboard_(void *a1, const char *a2, ...)
{
  return [a1 _lock_setPrimaryKeyboard:];
}

id objc_msgSend__lock_setupCloningToDestination_fromVirtualMode_hideByDefault_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lock_setupCloningToDestination:fromVirtualMode:hideByDefault:");
}

id objc_msgSend__lock_setupLayerTree(void *a1, const char *a2, ...)
{
  return [a1 _lock_setupLayerTree];
}

id objc_msgSend__lock_smartKeyboardAttachmentStateDidChange_(void *a1, const char *a2, ...)
{
  return [a1 _lock_smartKeyboardAttachmentStateDidChange:];
}

id objc_msgSend__lock_stopWatchingForGestures_(void *a1, const char *a2, ...)
{
  return [a1 _lock_stopWatchingForGestures:];
}

id objc_msgSend__lock_supernodeForRenderingAtKeyPath_(void *a1, const char *a2, ...)
{
  return [a1 _lock_supernodeForRenderingAtKeyPath:];
}

id objc_msgSend__lock_systemAppSetOrientationEventsClient_wantsOrientationEvents_auditToken_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lock_systemAppSetOrientationEventsClient:wantsOrientationEvents:auditToken:");
}

id objc_msgSend__lock_tearDownLayerTree(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lock_tearDownLayerTree");
}

id objc_msgSend__lock_unblockSystemApp(void *a1, const char *a2, ...)
{
  return [a1 _lock_unblockSystemApp];
}

id objc_msgSend__lock_updateContextIDMap(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lock_updateContextIDMap");
}

id objc_msgSend__lock_updateGlobalModifierState(void *a1, const char *a2, ...)
{
  return [a1 _lock_updateGlobalModifierState];
}

id objc_msgSend__lock_updateLayerTree(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lock_updateLayerTree");
}

id objc_msgSend__lock_updateObservingState(void *a1, const char *a2, ...)
{
  return [a1 _lock_updateObservingState];
}

id objc_msgSend__lock_updatePrimarySystemApp(void *a1, const char *a2, ...)
{
  return [a1 _lock_updatePrimarySystemApp];
}

id objc_msgSend__lock_updateSceneHostSettings(void *a1, const char *a2, ...)
{
  return [a1 _lock_updateSceneHostSettings];
}

id objc_msgSend__lock_updateStateForActiveOverlayChange(void *a1, const char *a2, ...)
{
  return [a1 _lock_updateStateForActiveOverlayChange];
}

id objc_msgSend__lock_usableKeyboardAttached_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lock_usableKeyboardAttached:");
}

id objc_msgSend__lock_usableKeyboardDetached_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lock_usableKeyboardDetached:");
}

id objc_msgSend__lock_virtualDisplayModeFromClientParametersForDisplay_shouldHide_shouldDisable_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lock_virtualDisplayModeFromClientParametersForDisplay:shouldHide:shouldDisable:");
}

id objc_msgSend__lock_watchForGestures_(void *a1, const char *a2, ...)
{
  return [a1 _lock_watchForGestures:];
}

id objc_msgSend__locked_notifyIfNeededCurrentDetectionMaskChangeWithTimstamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_locked_notifyIfNeededCurrentDetectionMaskChangeWithTimstamp:");
}

id objc_msgSend__locked_postEventWithDetectionMask_toDestinations_dispatcher_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_locked_postEventWithDetectionMask:toDestinations:dispatcher:reason:");
}

id objc_msgSend__locked_setObjectWithinProximity_notify_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_locked_setObjectWithinProximity:notify:");
}

id objc_msgSend__locked_updateTouchSuppressionAssertion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_locked_updateTouchSuppressionAssertion");
}

id objc_msgSend__migrateBackBoard(void *a1, const char *a2, ...)
{
  return _[a1 _migrateBackBoard];
}

id objc_msgSend__modifierRemappingsDidChange(void *a1, const char *a2, ...)
{
  return _[a1 _modifierRemappingsDidChange];
}

id objc_msgSend__moveRestoredFileAtPath_(void *a1, const char *a2, ...)
{
  return [a1 _moveRestoredFileAtPath:];
}

id objc_msgSend__passesThresholdForX_y_z_(void *a1, const char *a2, ...)
{
  return [a1 _passesThresholdForX:y:z:];
}

id objc_msgSend__persistenceCoordinator(void *a1, const char *a2, ...)
{
  return _[a1 _persistenceCoordinator];
}

id objc_msgSend__persistenceData(void *a1, const char *a2, ...)
{
  return _[a1 _persistenceData];
}

id objc_msgSend__persistentPropertyKeyDenylist(void *a1, const char *a2, ...)
{
  return _[a1 _persistentPropertyKeyDenylist];
}

id objc_msgSend__pidForClientPort_(void *a1, const char *a2, ...)
{
  return [a1 _pidForClientPort:];
}

id objc_msgSend__pingSystemShellForCollectiveWatchdog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pingSystemShellForCollectiveWatchdog:");
}

id objc_msgSend__policy(void *a1, const char *a2, ...)
{
  return _[a1 _policy];
}

id objc_msgSend__postDisplayPortNotificationCode_(void *a1, const char *a2, ...)
{
  return [a1 _postDisplayPortNotificationCode:];
}

id objc_msgSend__postEvent_sender_dispatcher_destination_cancelled_(void *a1, const char *a2, ...)
{
  return [a1 _postEvent:nil sender:nil dispatcher:nil destination:nil cancelled:nil];
}

id objc_msgSend__prepareContentLayerForPresentation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_prepareContentLayerForPresentation:");
}

id objc_msgSend__presentWithAnimationSettings_(void *a1, const char *a2, ...)
{
  return [a1 _presentWithAnimationSettings:];
}

id objc_msgSend__processRingerSwitchEvent_down_sender_dispatcher_(void *a1, const char *a2, ...)
{
  return [a1 _processRingerSwitchEvent:v1 down:v2 sender:v3 dispatcher:v4];
}

id objc_msgSend__queue_acquireActivityAssertionForReason_generation_continuation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_queue_acquireActivityAssertionForReason:generation:continuation:");
}

id objc_msgSend__queue_addDigitizerStateForService_(void *a1, const char *a2, ...)
{
  return [a1 _queue_addDigitizerStateForService:];
}

id objc_msgSend__queue_addOverlayForReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_queue_addOverlayForReason:");
}

id objc_msgSend__queue_addServicesMatchingSenderDescriptor_inPerDisplayInfo_toArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_queue_addServicesMatchingSenderDescriptor:inPerDisplayInfo:toArray:");
}

id objc_msgSend__queue_addTouchStreamClient_toDisplayUUID_versionedPID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_queue_addTouchStreamClient:toDisplayUUID:versionedPID:");
}

id objc_msgSend__queue_addUnderlay(void *a1, const char *a2, ...)
{
  return [_queue_addUnderlay];
}

id objc_msgSend__queue_annotateTouch_withString_uniqueIdentifier_fromPID_(void *a1, const char *a2, ...)
{
  return [a1 _queue_annotateTouch:v1 withString:v2 uniqueIdentifier:v3 fromPID:v4];
}

id objc_msgSend__queue_annotateTouch_withUniqueString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_queue_annotateTouch:withUniqueString:");
}

id objc_msgSend__queue_applyBasicAnnotationTextForTouchIdentifier_pathIndex_(void *a1, const char *a2, ...)
{
  return [a1 _queue_applyBasicAnnotationTextForTouchIdentifier:pathIndex:];
}

id objc_msgSend__queue_applyCachedPropertiesToMultitouchService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_queue_applyCachedPropertiesToMultitouchService:");
}

id objc_msgSend__queue_cleanUpAfterAlternativeSystemApp_(void *a1, const char *a2, ...)
{
  return [a1 _queue_cleanUpAfterAlternativeSystemApp:];
}

id objc_msgSend__queue_clearTimer(void *a1, const char *a2, ...)
{
  return [a1 _queue_clearTimer];
}

id objc_msgSend__queue_contextIDsToIgnoreForZoomSenders(void *a1, const char *a2, ...)
{
  return [a1 _queue_contextIDsToIgnoreForZoomSenders];
}

id objc_msgSend__queue_digitizerStateForService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_queue_digitizerStateForService:");
}

id objc_msgSend__queue_displayInfoForDisplay_createIfNeeded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_queue_displayInfoForDisplay:createIfNeeded:");
}

id objc_msgSend__queue_enumerateDigitizersForAllDisplaysUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_queue_enumerateDigitizersForAllDisplaysUsingBlock:");
}

id objc_msgSend__queue_enumerateDigitizersForDisplay_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_queue_enumerateDigitizersForDisplay:usingBlock:");
}

id objc_msgSend__queue_handleEvent_fromTouchPad_dispatcher_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_queue_handleEvent:fromTouchPad:dispatcher:");
}

id objc_msgSend__queue_hasTouchEnterSlots(void *a1, const char *a2, ...)
{
  return [a1 _queue_hasTouchEnterSlots];
}

id objc_msgSend__queue_listener_shouldAcceptNewConnection_(void *a1, const char *a2, ...)
{
  return [a1 _queue_listener:shouldAcceptNewConnection:];
}

id objc_msgSend__queue_pendUpdate_(void *a1, const char *a2, ...)
{
  return [a1 _queue_pendUpdate:];
}

id objc_msgSend__queue_performDelegateCallout_(void *a1, const char *a2, ...)
{
  return [a1 _queue_performDelegateCallout:];
}

id objc_msgSend__queue_postNotification_(void *a1, const char *a2, ...)
{
  return [a1 _queue_postNotification:];
}

id objc_msgSend__queue_postUpdate_forTouchIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 _queue_postUpdate:forTouchIdentifier:];
}

id objc_msgSend__queue_removeAnnotationForTouch_withUniqueIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 _queue_removeAnnotationForTouch:withUniqueIdentifier:];
}

id objc_msgSend__queue_removeOverlayWithAnimationSettings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_queue_removeOverlayWithAnimationSettings:");
}

id objc_msgSend__queue_removeUnderlay(void *a1, const char *a2, ...)
{
  return [a1 _queue_removeUnderlay];
}

id objc_msgSend__queue_resetTouchAuthenticationInitialSampleEvent(void *a1, const char *a2, ...)
{
  return [a1 _queue_resetTouchAuthenticationInitialSampleEvent];
}

id objc_msgSend__queue_scheduleTimerWithTimeInterval_(void *a1, const char *a2, ...)
{
  return [a1 _queue_scheduleTimerWithTimeInterval:];
}

id objc_msgSend__queue_sendCancelEventForTouchPad_(void *a1, const char *a2, ...)
{
  return [a1 _queue_sendCancelEventForTouchPad:];
}

id objc_msgSend__queue_sendEvent_fromTouchPad_toDestination_dispatcher_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_queue_sendEvent:fromTouchPad:toDestination:dispatcher:");
}

id objc_msgSend__queue_servicesMatchingSenderDescriptor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_queue_servicesMatchingSenderDescriptor:");
}

id objc_msgSend__queue_setCenter_forTouchIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 _queue_setCenter:forTouchIdentifier:];
}

id objc_msgSend__queue_setPolicy_(void *a1, const char *a2, ...)
{
  return [a1 _queue_setPolicy:];
}

id objc_msgSend__queue_setProcessPID_observesGlobalTouches_(void *a1, const char *a2, ...)
{
  return [_queue_setProcessPID:observesGlobalTouches:];
}

id objc_msgSend__queue_setProcessPID_observesTouch_withIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 _queue_setProcessPID:v1 observesTouch:v2 withIdentifier:v3];
}

id objc_msgSend__queue_setScreenOwnerPID_(void *a1, const char *a2, ...)
{
  return [a1 _queue_setScreenOwnerPID:];
}

id objc_msgSend__queue_slotRecordForSlotID_(void *a1, const char *a2, ...)
{
  return [a1 _queue_slotRecordForSlotID:];
}

id objc_msgSend__queue_touchPadRemoved_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_queue_touchPadRemoved:");
}

id objc_msgSend__queue_touchPadsDetected_(void *a1, const char *a2, ...)
{
  return [a1 _queue_touchPadsDetected:];
}

id objc_msgSend__queue_touchStreamClientForReference_(void *a1, const char *a2, ...)
{
  return [_queue_touchStreamClientForReference:];
}

id objc_msgSend__queue_touchStreamInfoForDisplayUUID_createIfNeeded_(void *a1, const char *a2, ...)
{
  return [a1 _queue_touchStreamInfoForDisplayUUID:createIfNeeded:];
}

id objc_msgSend__queue_updateOverlayForReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_queue_updateOverlayForReason:");
}

id objc_msgSend__queue_userEventOccurredInIdleMode(void *a1, const char *a2, ...)
{
  return [a1 _queue_userEventOccurredInIdleMode];
}

id objc_msgSend__queue_userEventOccurredInPresenceMode(void *a1, const char *a2, ...)
{
  return [a1 _queue_userEventOccurredInPresenceMode];
}

id objc_msgSend__remoteProcessIsAlreadyConnected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_remoteProcessIsAlreadyConnected:");
}

id objc_msgSend__removeSystemShellFromCollectivePingSet_(void *a1, const char *a2, ...)
{
  return [a1 _removeSystemShellFromCollectivePingSet:];
}

id objc_msgSend__removeUnusedFiles(void *a1, const char *a2, ...)
{
  return _[a1 _removeUnusedFiles];
}

id objc_msgSend__resetServiceStatus(void *a1, const char *a2, ...)
{
  return _[a1 _resetServiceStatus];
}

id objc_msgSend__reverseTetheringActive(void *a1, const char *a2, ...)
{
  return _[a1 _reverseTetheringActive];
}

id objc_msgSend__routeSqueezeEventToSystem(void *a1, const char *a2, ...)
{
  return _[a1 _routeSqueezeEventToSystem];
}

id objc_msgSend__scale(void *a1, const char *a2, ...)
{
  return _[a1 _scale];
}

id objc_msgSend__serviceExists_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serviceExists:");
}

id objc_msgSend__setAdditionalEnvironment_(void *a1, const char *a2, ...)
{
  return [a1 _setAdditionalEnvironment:];
}

id objc_msgSend__setAdditionalMachServices_(void *a1, const char *a2, ...)
{
  return [a1 _setAdditionalMachServices:];
}

id objc_msgSend__setBlockingSystemApp_(void *a1, const char *a2, ...)
{
  return [a1 _setBlockingSystemApp:];
}

id objc_msgSend__setBounds_(void *a1, const char *a2, ...)
{
  return [a1 _setBounds:];
}

id objc_msgSend__setInterstitial_(void *a1, const char *a2, ...)
{
  return [a1 _setInterstitial:];
}

id objc_msgSend__setOverrideExecutablePath_(void *a1, const char *a2, ...)
{
  return [a1 _setOverrideExecutablePath:];
}

id objc_msgSend__setPresence_forDisplayUUID_(void *a1, const char *a2, ...)
{
  return [a1 _setPresence:forDisplayUUID:];
}

id objc_msgSend__setProximityInCentimeters_forDisplayUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setProximityInCentimeters:forDisplayUUID:");
}

id objc_msgSend__setQueue_(void *a1, const char *a2, ...)
{
  return [a1 _setQueue:];
}

id objc_msgSend__setTetherState_(void *a1, const char *a2, ...)
{
  return [a1 _setTetherState:];
}

id objc_msgSend__setType_(void *a1, const char *a2, ...)
{
  return [a1 _setType:];
}

id objc_msgSend__sharedQueue(void *a1, const char *a2, ...)
{
  return _[a1 _sharedQueue];
}

id objc_msgSend__shellListener_didReceiveConnection_withContext_(void *a1, const char *a2, ...)
{
  [a1 _shellListener:didReceiveConnection:withContext:];
}

id objc_msgSend__shouldMatchKeyCommandsForEvent_gsKeyboard_(void *a1, const char *a2, ...)
{
  return [a1 _shouldMatchKeyCommandsForEvent:gsKeyboard:];
}

id objc_msgSend__shouldSendSampleEventWithTimestamp_samplingInterval_(void *a1, const char *a2, ...)
{
  return [a1 _shouldSendSampleEventWithTimestamp:samplingInterval:];
}

id objc_msgSend__smartCoverSensorsDidDisengage_(void *a1, const char *a2, ...)
{
  [a1 _smartCoverSensorsDidDisengage:];
}

id objc_msgSend__smartCoverSensorsDidEngage_(void *a1, const char *a2, ...)
{
  return [_smartCoverSensorsDidEngage:];
}

id objc_msgSend__spinnyImageSequence(void *a1, const char *a2, ...)
{
  return _[a1 _spinnyImageSequence];
}

id objc_msgSend__stopAnimating(void *a1, const char *a2, ...)
{
  return _[a1 _stopAnimating];
}

id objc_msgSend__stringByRemovingPrefix_fromString_(void *a1, const char *a2, ...)
{
  return [a1 _stringByRemovingPrefix:fromString:];
}

id objc_msgSend__stringDescribingContextID_clientPort_(void *a1, const char *a2, ...)
{
  return [a1 _stringDescribingContextID:clientPort:];
}

id objc_msgSend__stringDescribingPID_(void *a1, const char *a2, ...)
{
  return [a1 _stringDescribingPID:];
}

id objc_msgSend__unloadSpinnyImageSequence(void *a1, const char *a2, ...)
{
  return _[a1 _unloadSpinnyImageSequence];
}

id objc_msgSend__updateBounds(void *a1, const char *a2, ...)
{
  return _[a1 _updateBounds];
}

id objc_msgSend__updateSettings(void *a1, const char *a2, ...)
{
  return _[a1 _updateSettings];
}

id objc_msgSend__updateWindowServerUpdatesForOverlays_(void *a1, const char *a2, ...)
{
  return [a1 _updateWindowServerUpdatesForOverlays:];
}

id objc_msgSend__useLightBackground(void *a1, const char *a2, ...)
{
  return _[a1 _useLightBackground];
}

id objc_msgSend__validateConnection_withContext_forListenerLabel_(void *a1, const char *a2, ...)
{
  return [a1 _validateConnection:v1 withContext:v2 forListenerLabel:v3];
}

id objc_msgSend__validateHapticFeedbackRequest_forAuditToken_(void *a1, const char *a2, ...)
{
  return [a1 _validateHapticFeedbackRequest:forAuditToken:];
}

id objc_msgSend__validatePencilHapticFeedbackRequest_forPID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_validatePencilHapticFeedbackRequest:forPID:");
}

id objc_msgSend__validateTrackpadHapticFeedbackRequest_forPID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_validateTrackpadHapticFeedbackRequest:forPID:");
}

id objc_msgSend__wakeAnimationStyle(void *a1, const char *a2, ...)
{
  return _[a1 _wakeAnimationStyle];
}

id objc_msgSend__wrapInCATransaction_(void *a1, const char *a2, ...)
{
  return [a1 _wrapInCATransaction:];
}

id objc_msgSend__xpcConnection(void *a1, const char *a2, ...)
{
  return _[a1 _xpcConnection];
}

id objc_msgSend_accelerometerUpdateInterval(void *a1, const char *a2, ...)
{
  return _[a1 accelerometerUpdateInterval];
}

id objc_msgSend_accessPort_(void *a1, const char *a2, ...)
{
  return [a1 accessPort:];
}

id objc_msgSend_accessibilityHIDServices(void *a1, const char *a2, ...)
{
  return _[a1 accessibilityHIDServices];
}

id objc_msgSend_acquireForReason_(void *a1, const char *a2, ...)
{
  return [a1 acquireForReason:];
}

id objc_msgSend_acquireForReason_withContext_(void *a1, const char *a2, ...)
{
  return [a1 acquireForReason:withContext:];
}

id objc_msgSend_acquireWithError_(void *a1, const char *a2, ...)
{
  return [a1 acquireWithError:nil];
}

id objc_msgSend_acquireWithTimeout_handler_(void *a1, const char *a2, ...)
{
  return [a1 acquireWithTimeout:handler:];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return _[a1 activate];
}

id objc_msgSend_activateWithHandler_(void *a1, const char *a2, ...)
{
  return [a1 activateWithHandler:];
}

id objc_msgSend_activeMultilinePrefix(void *a1, const char *a2, ...)
{
  return _[a1 activeMultilinePrefix];
}

id objc_msgSend_activeOverlayWithDescriptor_(void *a1, const char *a2, ...)
{
  return [a1 activeOverlayWithDescriptor:];
}

id objc_msgSend_activeOverlays(void *a1, const char *a2, ...)
{
  return _[a1 activeOverlays];
}

id objc_msgSend_addAnimation_forKey_(void *a1, const char *a2, ...)
{
  return [a1 addAnimation:forKey:];
}

id objc_msgSend_addBeginNotification_endNotification_(void *a1, const char *a2, ...)
{
  return [a1 addBeginNotification:endNotification:];
}

id objc_msgSend_addClone_options_(void *a1, const char *a2, ...)
{
  return [a1 addClone:options:];
}

id objc_msgSend_addDisappearanceObserver_queue_(void *a1, const char *a2, ...)
{
  return [a1 addDisappearanceObserver:nil queue:nil];
}

id objc_msgSend_addDisplayBlankingObserver_(void *a1, const char *a2, ...)
{
  return [a1 addDisplayBlankingObserver:];
}

id objc_msgSend_addGlobalKeyboardObserver_(void *a1, const char *a2, ...)
{
  return [a1 addGlobalKeyboardObserver:];
}

id objc_msgSend_addIndex_(void *a1, const char *a2, ...)
{
  return [a1 addIndex:];
}

id objc_msgSend_addMonitor_(void *a1, const char *a2, ...)
{
  return [a1 addMonitor:];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return [a1 addObject:];
}

id objc_msgSend_addObject_toCollectionClass_forKey_(void *a1, const char *a2, ...)
{
  return [a1 addObject:forKey:];
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return [a1 addObjectsFromArray:];
}

id objc_msgSend_addObserver_(void *a1, const char *a2, ...)
{
  return [a1 addObserver:];
}

id objc_msgSend_addObserver_forKeyPath_options_context_(void *a1, const char *a2, ...)
{
  return [a1 addObserver:forKeyPath:options:context:];
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return [a1 addObserver:nil selector:nil name:nil object:nil];
}

id objc_msgSend_addRecognizer_recognitionBlock_(void *a1, const char *a2, ...)
{
  return [a1 addRecognizer:recognitionBlock:];
}

id objc_msgSend_addRepeatingField_containsClass_(void *a1, const char *a2, ...)
{
  return [a1 addRepeatingField:containsClass:];
}

id objc_msgSend_addSenderInfo_(void *a1, const char *a2, ...)
{
  return [a1 addSenderInfo:];
}

id objc_msgSend_addService_(void *a1, const char *a2, ...)
{
  return [a1 addService:];
}

id objc_msgSend_addSublayer_(void *a1, const char *a2, ...)
{
  return [a1 addSublayer:];
}

id objc_msgSend_addSystemShellObserver_reason_(void *a1, const char *a2, ...)
{
  return [a1 addSystemShellObserver:reason:];
}

id objc_msgSend_addToRunLoop_forMode_(void *a1, const char *a2, ...)
{
  return [a1 addToRunLoop:forMode:];
}

id objc_msgSend_addTouchAuthenticationSpecifications_registrantEntitled_(void *a1, const char *a2, ...)
{
  return [a1 addTouchAuthenticationSpecifications:registrantEntitled:];
}

id objc_msgSend_addTouchStreamForContextID_display_versionedPID_identifier_shouldSendAmbiguityRecommendations_( void *a1, const char *a2, ...)
{
  return [a1 addTouchStreamForContextID:display:versionedPID:identifier:shouldSendAmbiguityRecommendations:];
}

id objc_msgSend_allAnnotationsForKeyPath_(void *a1, const char *a2, ...)
{
  return [a1 allAnnotationsForKeyPath:];
}

id objc_msgSend_allImages(void *a1, const char *a2, ...)
{
  return _[a1 allImages];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_allPersistentPropertiesForServicesMatchingDescriptor_(void *a1, const char *a2, ...)
{
  return [a1 allPersistentPropertiesForServicesMatchingDescriptor:];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _[a1 allValues];
}

id objc_msgSend_alternateSystemApp(void *a1, const char *a2, ...)
{
  return _[a1 alternateSystemApp];
}

id objc_msgSend_alternateSystemAppBundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 alternateSystemAppBundleIdentifier];
}

id objc_msgSend_alternateSystemAppWithBundleID_didExitWithContext_(void *a1, const char *a2, ...)
{
  return [a1 alternateSystemAppWithBundleID:didExitWithContext:];
}

id objc_msgSend_alternateSystemAppWithBundleID_failedToOpenWithResult_(void *a1, const char *a2, ...)
{
  return [a1 alternateSystemAppWithBundleID:failedToOpenWithResult:];
}

id objc_msgSend_alternateSystemAppWithBundleIDDidOpen_(void *a1, const char *a2, ...)
{
  return [a1 alternateSystemAppWithBundleIDDidOpen:];
}

id objc_msgSend_alternateSystemAppWithBundleIDDidTerminate_(void *a1, const char *a2, ...)
{
  return [a1 alternateSystemAppWithBundleIDDidTerminate:];
}

id objc_msgSend_animates(void *a1, const char *a2, ...)
{
  return _[a1 animates];
}

id objc_msgSend_animationWithKeyPath_(void *a1, const char *a2, ...)
{
  return [a1 animationWithKeyPath:];
}

id objc_msgSend_annotateTouch_withString_uniqueIdentifier_fromPID_(void *a1, const char *a2, ...)
{
  return [a1 annotateTouch:withString:uniqueIdentifier:fromPID:];
}

id objc_msgSend_annotation(void *a1, const char *a2, ...)
{
  return _[a1 annotation];
}

id objc_msgSend_annotationController(void *a1, const char *a2, ...)
{
  return _[a1 annotationController];
}

id objc_msgSend_annotationControllerForDisplay_(void *a1, const char *a2, ...)
{
  return [a1 annotationControllerForDisplay:];
}

id objc_msgSend_annotationForKeyPath_(void *a1, const char *a2, ...)
{
  return [a1 annotationForKeyPath:];
}

id objc_msgSend_annotationWithEllipseSize_(void *a1, const char *a2, ...)
{
  return [a1 annotationWithEllipseSize:CGSizeMake(0, 0)];
}

id objc_msgSend_annotationWithRectangleSize_(void *a1, const char *a2, ...)
{
  return [a1 annotationWithRectangleSize:CGSizeMake(0, 0)];
}

id objc_msgSend_annotationWithString_(void *a1, const char *a2, ...)
{
  return [a1 annotationWithString:];
}

id objc_msgSend_anyBuiltinTouchscreenDigitizer(void *a1, const char *a2, ...)
{
  return _[a1 anyBuiltinTouchscreenDigitizer];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return _[a1 anyObject];
}

id objc_msgSend_appendArraySection_withName_multilinePrefix_skipIfEmpty_objectTransformer_( void *a1, const char *a2, ...)
{
  return [a1 appendArraySection:withName:multilinePrefix:skipIfEmpty:objectTransformer:];
}

id objc_msgSend_appendArraySection_withName_skipIfEmpty_(void *a1, const char *a2, ...)
{
  return [a1 appendArraySection:withName:skipIfEmpty:];
}

id objc_msgSend_appendBodySectionWithName_block_(void *a1, const char *a2, ...)
{
  return [a1 appendBodySectionWithName:block:];
}

id objc_msgSend_appendBodySectionWithName_multilinePrefix_block_(void *a1, const char *a2, ...)
{
  return [a1 appendBodySectionWithName:nil multilinePrefix:nil block:nil];
}

id objc_msgSend_appendBodySectionWithName_openDelimiter_closeDelimiter_block_(void *a1, const char *a2, ...)
{
  return [a1 appendBodySectionWithName:openDelimiter:closeDelimiter:block:];
}

id objc_msgSend_appendBool_withName_(void *a1, const char *a2, ...)
{
  return [a1 appendBool:withName:];
}

id objc_msgSend_appendBool_withName_ifEqualTo_(void *a1, const char *a2, ...)
{
  return [a1 appendBool:YES withName:@"" ifEqualTo:YES];
}

id objc_msgSend_appendCollection_withName_itemBlock_(void *a1, const char *a2, ...)
{
  return [a1 appendCollection:withName:itemBlock:];
}

id objc_msgSend_appendCustomFormatForValue_withCustomFormatForName_(void *a1, const char *a2, ...)
{
  return [a1 appendCustomFormatForValue:withCustomFormatForName:];
}

id objc_msgSend_appendCustomFormatWithName_block_(void *a1, const char *a2, ...)
{
  return [a1 appendCustomFormatWithName:block:];
}

id objc_msgSend_appendDouble_withName_decimalPrecision_(void *a1, const char *a2, ...)
{
  return [a1 appendDouble:withName:decimalPrecision:];
}

id objc_msgSend_appendFloat_withName_(void *a1, const char *a2, ...)
{
  return [a1 appendFloat:withName:];
}

id objc_msgSend_appendFloat_withName_decimalPrecision_(void *a1, const char *a2, ...)
{
  return [a1 appendFloat:withName:decimalPrecision:];
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return [a1 appendFormat:];
}

id objc_msgSend_appendInt_withName_(void *a1, const char *a2, ...)
{
  return [a1 appendInt:withName:];
}

id objc_msgSend_appendInteger_withName_(void *a1, const char *a2, ...)
{
  return [a1 appendInteger:withName:];
}

id objc_msgSend_appendIntegerMap_withName_keyFormat_valueBlock_(void *a1, const char *a2, ...)
{
  return [a1 appendIntegerMap:withName:keyFormat:valueBlock:];
}

id objc_msgSend_appendObject_withName_(void *a1, const char *a2, ...)
{
  return [a1 appendObject:withName:];
}

id objc_msgSend_appendObject_withName_skipIfNil_(void *a1, const char *a2, ...)
{
  return [a1 appendObject:withName:skipIfNil:];
}

id objc_msgSend_appendPoint_withName_(void *a1, const char *a2, ...)
{
  return [a1 appendPoint:withName:];
}

id objc_msgSend_appendPointer_withName_(void *a1, const char *a2, ...)
{
  return [a1 appendPointer:withName:];
}

id objc_msgSend_appendProem_block_(void *a1, const char *a2, ...)
{
  return [a1 appendProem:block:];
}

id objc_msgSend_appendSize_withName_(void *a1, const char *a2, ...)
{
  return [a1 appendSize:withName:];
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return [a1 appendString:@""];
}

id objc_msgSend_appendString_withName_(void *a1, const char *a2, ...)
{
  return [a1 appendString:withName:];
}

id objc_msgSend_appendString_withName_skipIfEmpty_(void *a1, const char *a2, ...)
{
  return [a1 appendString:withName:skipIfEmpty:];
}

id objc_msgSend_appendSuccinctDescriptionToFormatter_(void *a1, const char *a2, ...)
{
  return [a1 appendSuccinctDescriptionToFormatter:];
}

id objc_msgSend_appendTimeInterval_withName_decomposeUnits_(void *a1, const char *a2, ...)
{
  return [a1 appendTimeInterval:withName:decomposeUnits:];
}

id objc_msgSend_appendUInt64_withName_format_(void *a1, const char *a2, ...)
{
  return [a1 appendUInt64:withName:format:];
}

id objc_msgSend_appendUnsignedInteger_withName_(void *a1, const char *a2, ...)
{
  return [a1 appendUnsignedInteger:withName:];
}

id objc_msgSend_appendUnsignedInteger_withName_format_(void *a1, const char *a2, ...)
{
  return [a1 appendUnsignedInteger:withName:format:];
}

id objc_msgSend_appendVersionedPID_withName_(void *a1, const char *a2, ...)
{
  return [a1 appendVersionedPID:getpid() withName:getprogname()];
}

id objc_msgSend_applyAppearanceToShapeLayer_(void *a1, const char *a2, ...)
{
  return [a1 applyAppearanceToShapeLayer:];
}

id objc_msgSend_applyAppearanceToTextLayer_(void *a1, const char *a2, ...)
{
  return [a1 applyAppearanceToTextLayer:];
}

id objc_msgSend_applyExtendedHitTestInformationForCAScreenCoordinates_displayUUID_toPathAttributes_secureName_excludeContextIDs_( void *a1, const char *a2, ...)
{
  return [a1 applyExtendedHitTestInformationForCAScreenCoordinates:v1 displayUUID:v2 toPathAttributes:v3 secureName:v4 excludeContextIDs:v5];
}

id objc_msgSend_applyOverlay_withAnimationSettings_(void *a1, const char *a2, ...)
{
  return [a1 applyOverlay:withAnimationSettings:];
}

id objc_msgSend_applySceneHostSettingsToHostingChain_(void *a1, const char *a2, ...)
{
  return [a1 applySceneHostSettingsToHostingChain:];
}

id objc_msgSend_applyToCAAnimation_(void *a1, const char *a2, ...)
{
  return [a1 applyToCAAnimation];
}

id objc_msgSend_applyToLayer_forContent_(void *a1, const char *a2, ...)
{
  return [a1 applyToLayer:forContent:];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return [a1 arrayByAddingObjectsFromArray:];
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObject:nil];
}

id objc_msgSend_arrayWithObjects_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObjects:];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObjects:count:];
}

id objc_msgSend_assertionEndpoint(void *a1, const char *a2, ...)
{
  return _[a1 assertionEndpoint];
}

id objc_msgSend_assertionWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 assertionWithIdentifier:];
}

id objc_msgSend_assertionWithIdentifier_stateDidChangeHandler_(void *a1, const char *a2, ...)
{
  return [a1 assertionWithIdentifier:stateDidChangeHandler:];
}

id objc_msgSend_associatedDisplay(void *a1, const char *a2, ...)
{
  return _[a1 associatedDisplay];
}

id objc_msgSend_asyncSetProperty_forKey_(void *a1, const char *a2, ...)
{
  return [a1 asyncSetProperty:forKey:];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return _[a1 auditToken];
}

id objc_msgSend_auditTokenRepresentsSystemApp_(void *a1, const char *a2, ...)
{
  return [a1 auditTokenRepresentsSystemApp:];
}

id objc_msgSend_authenticationMessage(void *a1, const char *a2, ...)
{
  return _[a1 authenticationMessage];
}

id objc_msgSend_authenticationMessageContext(void *a1, const char *a2, ...)
{
  return _[a1 authenticationMessageContext];
}

id objc_msgSend_authenticationOriginator(void *a1, const char *a2, ...)
{
  return _[a1 authenticationOriginator];
}

id objc_msgSend_automaticResetDisabled(void *a1, const char *a2, ...)
{
  return _[a1 automaticResetDisabled];
}

id objc_msgSend_availableModes(void *a1, const char *a2, ...)
{
  return _[a1 availableModes];
}

id objc_msgSend_backgroundStatisticsFailingContrast(void *a1, const char *a2, ...)
{
  return _[a1 backgroundStatisticsFailingContrast];
}

id objc_msgSend_backgroundStatisticsForeground(void *a1, const char *a2, ...)
{
  return _[a1 backgroundStatisticsForeground];
}

id objc_msgSend_backgroundStatisticsPassingContrast(void *a1, const char *a2, ...)
{
  return _[a1 backgroundStatisticsPassingContrast];
}

id objc_msgSend_backgroundStatisticsRegion(void *a1, const char *a2, ...)
{
  return _[a1 backgroundStatisticsRegion];
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return [a1 base64EncodedStringWithOptions:];
}

id objc_msgSend_baseAttributesFromProvider_(void *a1, const char *a2, ...)
{
  return [a1 baseAttributesFromProvider:];
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return _[a1 begin];
}

id objc_msgSend_beginImplicitTransaction(void *a1, const char *a2, ...)
{
  return _[a1 beginImplicitTransaction];
}

id objc_msgSend_beginTransactionForReason_(void *a1, const char *a2, ...)
{
  return [a1 beginTransactionForReason:];
}

id objc_msgSend_bk_setBackgroundColorRed_green_blue_alpha_(void *a1, const char *a2, ...)
{
  return [a1 bk_setBackgroundColorRed:green:blue:alpha:];
}

id objc_msgSend_bk_setForegroundColorRed_green_blue_alpha_(void *a1, const char *a2, ...)
{
  return [a1 bk_setForegroundColorRed:green:blue:alpha:];
}

id objc_msgSend_bksAccelerometerClientRequestedAccelerometerEvents_updateInterval_xThreshold_yThreshold_zThreshold_auditToken_( void *a1, const char *a2, ...)
{
  return [a1 bksAccelerometerClientRequestedAccelerometerEvents:updateInterval:xThreshold:yThreshold:zThreshold:auditToken:];
}

id objc_msgSend_bksAccelerometerClientRequestedOrientationEvents_enabled_passiveEvents_auditToken_( void *a1, const char *a2, ...)
{
  return [a1 bksAccelerometerClientRequestedOrientationEvents:enabled:passiveEvents:auditToken:];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return _[a1 blackColor];
}

id objc_msgSend_blank(void *a1, const char *a2, ...)
{
  return _[a1 blank];
}

id objc_msgSend_blockSystemApp(void *a1, const char *a2, ...)
{
  return _[a1 blockSystemApp];
}

id objc_msgSend_blockSystemAppForAlternateSystemAppWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 blockSystemAppForAlternateSystemAppWithCompletion:];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _[a1 bounds];
}

id objc_msgSend_brightness(void *a1, const char *a2, ...)
{
  return _[a1 brightness];
}

id objc_msgSend_brightnessCurve(void *a1, const char *a2, ...)
{
  return _[a1 brightnessCurve];
}

id objc_msgSend_brightnessLevel(void *a1, const char *a2, ...)
{
  return _[a1 brightnessLevel];
}

id objc_msgSend_bs_bytesForMIG(void *a1, const char *a2, ...)
{
  return [a1 bs_bytesForMIG];
}

id objc_msgSend_bs_compactMap_(void *a1, const char *a2, ...)
{
  return [a1 bs_compactMap:];
}

id objc_msgSend_bs_containsObjectPassingTest_(void *a1, const char *a2, ...)
{
  return [a1 bs_containsObjectPassingTest:];
}

id objc_msgSend_bs_filter_(void *a1, const char *a2, ...)
{
  return [a1 bs_filter:];
}

id objc_msgSend_bs_lengthForMIG(void *a1, const char *a2, ...)
{
  return [a1 bs_lengthForMIG];
}

id objc_msgSend_bs_map_(void *a1, const char *a2, ...)
{
  return [a1 bs_map:];
}

id objc_msgSend_bs_reduce_block_(void *a1, const char *a2, ...)
{
  return [a1 bs_reduce:block:];
}

id objc_msgSend_bs_safeDictionaryForKey_(void *a1, const char *a2, ...)
{
  return [a1 bs_safeDictionaryForKey:];
}

id objc_msgSend_bs_safeStringForKey_(void *a1, const char *a2, ...)
{
  return [a1 bs_safeStringForKey:];
}

id objc_msgSend_bs_secureDecodedFromData_(void *a1, const char *a2, ...)
{
  return [a1 bs_secureDecodedFromData:];
}

id objc_msgSend_bs_secureDecodedFromData_withAdditionalClasses_(void *a1, const char *a2, ...)
{
  return [a1 bs_secureDecodedFromData:withAdditionalClasses:];
}

id objc_msgSend_bs_secureEncoded(void *a1, const char *a2, ...)
{
  return [a1 bs_secureEncoded];
}

id objc_msgSend_bs_secureObjectFromData_ofClass_(void *a1, const char *a2, ...)
{
  return [a1 bs_secureObjectFromData:ofClass:];
}

id objc_msgSend_bs_secureObjectFromData_ofClasses_(void *a1, const char *a2, ...)
{
  return [a1 bs_secureObjectFromData:ofClasses:];
}

id objc_msgSend_build(void *a1, const char *a2, ...)
{
  return _[a1 build];
}

id objc_msgSend_build_(void *a1, const char *a2, ...)
{
  return [a1 build:];
}

id objc_msgSend_buildMessage_(void *a1, const char *a2, ...)
{
  return [a1 buildMessage:];
}

id objc_msgSend_buildSchemaForClass_builder_(void *a1, const char *a2, ...)
{
  return [a1 buildSchemaForClass:builder];
}

id objc_msgSend_builderWithObject_(void *a1, const char *a2, ...)
{
  return [a1 builderWithObject:];
}

id objc_msgSend_builtinDisplay(void *a1, const char *a2, ...)
{
  return _[a1 builtinDisplay];
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return [a1 bundleForClass:nil];
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return _[a1 bundleID];
}

id objc_msgSend_bundleIDForPID_(void *a1, const char *a2, ...)
{
  return [a1 bundleIDForPID:];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_bundlePath(void *a1, const char *a2, ...)
{
  return _[a1 bundlePath];
}

id objc_msgSend_bundleRecordWithBundleIdentifier_allowPlaceholder_error_(void *a1, const char *a2, ...)
{
  return [a1 bundleRecordWithBundleIdentifier:allowPlaceholder:error:];
}

id objc_msgSend_bundleWithPath_(void *a1, const char *a2, ...)
{
  return [a1 bundleWithPath:];
}

id objc_msgSend_cachesPath(void *a1, const char *a2, ...)
{
  return _[a1 cachesPath];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return _[a1 cancel];
}

id objc_msgSend_cancelAndSuppressTouchesOnDisplay_reason_(void *a1, const char *a2, ...)
{
  return [a1 cancelAndSuppressTouchesOnDisplay:reason:];
}

id objc_msgSend_cancelButtonForSenderID_uagePage_usage_(void *a1, const char *a2, ...)
{
  return [a1 cancelButtonForSenderID:uagePage:usage:];
}

id objc_msgSend_cancelTouchesOnAllDisplays(void *a1, const char *a2, ...)
{
  return _[a1 cancelTouchesOnAllDisplays];
}

id objc_msgSend_cancelTouchesOnDisplay_(void *a1, const char *a2, ...)
{
  return [a1 cancelTouchesOnDisplay:];
}

id objc_msgSend_cancelTouchesWithIdentifiers_(void *a1, const char *a2, ...)
{
  return [a1 cancelTouchesWithIdentifiers:];
}

id objc_msgSend_canceledStyle(void *a1, const char *a2, ...)
{
  return _[a1 canceledStyle];
}

id objc_msgSend_centerAtPoint_(void *a1, const char *a2, ...)
{
  return [a1 centerAtPoint:];
}

id objc_msgSend_claimsToConformToUsagePage_usage_(void *a1, const char *a2, ...)
{
  return [a1 claimsToConformToUsagePage:usage];
}

id objc_msgSend_classForCoder(void *a1, const char *a2, ...)
{
  return _[a1 classForCoder];
}

id objc_msgSend_classesRequiredToDecode(void *a1, const char *a2, ...)
{
  return _[a1 classesRequiredToDecode];
}

id objc_msgSend_clear(void *a1, const char *a2, ...)
{
  return _[a1 clear];
}

id objc_msgSend_clientConnectionManager(void *a1, const char *a2, ...)
{
  return _[a1 clientConnectionManager];
}

id objc_msgSend_clientEntitlement(void *a1, const char *a2, ...)
{
  return _[a1 clientEntitlement];
}

id objc_msgSend_clientForTaskPort_(void *a1, const char *a2, ...)
{
  return [a1 clientForTaskPort:];
}

id objc_msgSend_cloneMaster(void *a1, const char *a2, ...)
{
  return _[a1 cloneMaster];
}

id objc_msgSend_cloneMirroringRequestsDidChange(void *a1, const char *a2, ...)
{
  return _[a1 cloneMirroringRequestsDidChange];
}

id objc_msgSend_clones(void *a1, const char *a2, ...)
{
  return _[a1 clones];
}

id objc_msgSend_collectionLineBreakNoneStyle(void *a1, const char *a2, ...)
{
  return _[a1 collectionLineBreakNoneStyle];
}

id objc_msgSend_collectiveWatchdogPing(void *a1, const char *a2, ...)
{
  return _[a1 collectiveWatchdogPing];
}

id objc_msgSend_colorVariationStyleWithIndex_(void *a1, const char *a2, ...)
{
  return [a1 colorVariationStyleWithIndex:];
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return _[a1 commit];
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return [a1 componentsJoinedByString:];
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return [a1 componentsSeparatedByString:];
}

id objc_msgSend_configureConnection_(void *a1, const char *a2, ...)
{
  return [a1 configureConnection:];
}

id objc_msgSend_connectionForPID_(void *a1, const char *a2, ...)
{
  return [a1 connectionForPID:];
}

id objc_msgSend_containsIndex_(void *a1, const char *a2, ...)
{
  return [a1 containsIndex:];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return [a1 containsObject:];
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return _[a1 content];
}

id objc_msgSend_contentLayer(void *a1, const char *a2, ...)
{
  return _[a1 contentLayer];
}

id objc_msgSend_contentWithSize_(void *a1, const char *a2, ...)
{
  return [a1 contentWithSize:];
}

id objc_msgSend_contentWithString_(void *a1, const char *a2, ...)
{
  return [a1 contentWithString:];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return _[a1 context];
}

id objc_msgSend_contextID(void *a1, const char *a2, ...)
{
  return _[a1 contextID];
}

id objc_msgSend_contextIDAtCAScreenLocation_displayUUID_options_securityAnalysis_results_( void *a1, const char *a2, ...)
{
  return [a1 contextIDAtCAScreenLocation:displayUUID:options:securityAnalysis:results:];
}

id objc_msgSend_contextIDsToAlwaysSendTouches(void *a1, const char *a2, ...)
{
  return _[a1 contextIDsToAlwaysSendTouches];
}

id objc_msgSend_contextIDsToExcludeFromHitTesting(void *a1, const char *a2, ...)
{
  return _[a1 contextIDsToExcludeFromHitTesting];
}

id objc_msgSend_contextId(void *a1, const char *a2, ...)
{
  return _[a1 contextId];
}

id objc_msgSend_contextIdHostingContextId_(void *a1, const char *a2, ...)
{
  return [a1 contextIdHostingContextId:];
}

id objc_msgSend_contextWithIdentity_(void *a1, const char *a2, ...)
{
  return [a1 contextWithIdentity:];
}

id objc_msgSend_controlledBySupernode(void *a1, const char *a2, ...)
{
  return _[a1 controlledBySupernode];
}

id objc_msgSend_convertCAScreenLocation_toContextID_displayUUID_(void *a1, const char *a2, ...)
{
  return [a1 convertCAScreenLocation:toContextID:displayUUID:];
}

id objc_msgSend_convertPoint_fromLayer_(void *a1, const char *a2, ...)
{
  return [a1 convertPoint:fromLayer:];
}

id objc_msgSend_convertPoint_toContextId_(void *a1, const char *a2, ...)
{
  return [a1 convertPoint:toContextId:];
}

id objc_msgSend_convertReferenceLocation_toCAScreenLocationForDisplayUUID_(void *a1, const char *a2, ...)
{
  return [a1 convertReferenceLocation:toCAScreenLocationForDisplayUUID:];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_copyPropertyForKey_(void *a1, const char *a2, ...)
{
  return [a1 copyPropertyForKey:];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return [a1 countByEnumeratingWithState:a2 objects:a3 count:a4];
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return [a1 createDirectoryAtPath:withIntermediateDirectories:attributes:error:];
}

id objc_msgSend_createFileAtPath_contents_attributes_(void *a1, const char *a2, ...)
{
  return [a1 createFileAtPath:contents:attributes:];
}

id objc_msgSend_crosshatchedBackgroundStyle(void *a1, const char *a2, ...)
{
  return _[a1 crosshatchedBackgroundStyle];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return _[a1 currentConnection];
}

id objc_msgSend_currentContext(void *a1, const char *a2, ...)
{
  return _[a1 currentContext];
}

id objc_msgSend_currentDestinations(void *a1, const char *a2, ...)
{
  return _[a1 currentDestinations];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return _[a1 currentHandler];
}

id objc_msgSend_currentMode(void *a1, const char *a2, ...)
{
  return _[a1 currentMode];
}

id objc_msgSend_currentOverlayWithLevel_(void *a1, const char *a2, ...)
{
  return [a1 currentOverlayWithLevel:];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 currentRunLoop];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return _[a1 data];
}

id objc_msgSend_dataMigrationQueue(void *a1, const char *a2, ...)
{
  return _[a1 dataMigrationQueue];
}

id objc_msgSend_dataMigratorDidComplete(void *a1, const char *a2, ...)
{
  return _[a1 dataMigratorDidComplete];
}

id objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(void *a1, const char *a2, ...)
{
  return [a1 dataWithBytesNoCopy:length:freeWhenDone:];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_deathWatcher(void *a1, const char *a2, ...)
{
  return _[a1 deathWatcher];
}

id objc_msgSend_debugStyle(void *a1, const char *a2, ...)
{
  return _[a1 debugStyle];
}

id objc_msgSend_decodeBoolForKey_(void *a1, const char *a2, ...)
{
  return [a1 decodeBoolForKey:];
}

id objc_msgSend_decodeDoubleForKey_(void *a1, const char *a2, ...)
{
  return [a1 decodeDoubleForKey:];
}

id objc_msgSend_decodeFloatForKey_(void *a1, const char *a2, ...)
{
  return [a1 decodeFloatForKey:];
}

id objc_msgSend_decodeInt64ForKey_(void *a1, const char *a2, ...)
{
  return [a1 decodeInt64ForKey:];
}

id objc_msgSend_decodeIntegerForKey_(void *a1, const char *a2, ...)
{
  return [a1 decodeIntegerForKey:];
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return [a1 decodeObjectOfClass:forKey:];
}

id objc_msgSend_decodeObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return [a1 decodeObjectOfClass:fromData:error:];
}

id objc_msgSend_decodeStringForKey_(void *a1, const char *a2, ...)
{
  return [a1 decodeStringForKey:];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_definedInReferenceSpace(void *a1, const char *a2, ...)
{
  return _[a1 definedInReferenceSpace];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_deliveryManager(void *a1, const char *a2, ...)
{
  return _[a1 deliveryManager];
}

id objc_msgSend_describes_(void *a1, const char *a2, ...)
{
  return [a1 describes:];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_descriptionBuilderWithMultilinePrefix_(void *a1, const char *a2, ...)
{
  return [a1 descriptionBuilderWithMultilinePrefix:];
}

id objc_msgSend_descriptionForRootObject_(void *a1, const char *a2, ...)
{
  return [a1 descriptionForRootObject:nil];
}

id objc_msgSend_descriptionForRootObject_withStyle_(void *a1, const char *a2, ...)
{
  return [a1 descriptionForRootObject:withStyle:];
}

id objc_msgSend_descriptionOfResolutionPathForEventDescriptor_senderDescriptor_(void *a1, const char *a2, ...)
{
  return [a1 descriptionOfResolutionPathForEventDescriptor:senderDescriptor:];
}

id objc_msgSend_descriptionOfResolutionPathForKeyCommand_senderDescriptor_(void *a1, const char *a2, ...)
{
  return [a1 descriptionOfResolutionPathForKeyCommand:senderDescriptor:];
}

id objc_msgSend_descriptionWithMultilinePrefix_(void *a1, const char *a2, ...)
{
  return [a1 descriptionWithMultilinePrefix:nil];
}

id objc_msgSend_descriptor(void *a1, const char *a2, ...)
{
  return _[a1 descriptor];
}

id objc_msgSend_descriptorByAddingSenderIDToMatchCriteria_(void *a1, const char *a2, ...)
{
  return [a1 descriptorByAddingSenderIDToMatchCriteria:];
}

id objc_msgSend_descriptorForHIDEventType_page_usage_(void *a1, const char *a2, ...)
{
  return [a1 descriptorForHIDEventType:page:usage:];
}

id objc_msgSend_destinationsForEvent_fromSender_(void *a1, const char *a2, ...)
{
  return [a1 destinationsForEvent:fromSender:];
}

id objc_msgSend_destinationsForEvent_fromSender_overrideSenderDescriptor_(void *a1, const char *a2, ...)
{
  return [a1 destinationsForEvent:fromSender:overrideSenderDescriptor:];
}

id objc_msgSend_destinationsForEvent_sender_(void *a1, const char *a2, ...)
{
  return [a1 destinationsForEvent:sender:];
}

id objc_msgSend_destroyOverlay_(void *a1, const char *a2, ...)
{
  return [a1 destroyOverlay:];
}

id objc_msgSend_detachTouchIdentifiers_count_assignUserIdentifier_policy_offset_(void *a1, const char *a2, ...)
{
  return [a1 detachTouchIdentifiers:v1 count:v2 assignUserIdentifier:v3 policy:v4 offset:v5];
}

id objc_msgSend_detectionMask(void *a1, const char *a2, ...)
{
  return _[a1 detectionMask];
}

id objc_msgSend_deviceClass(void *a1, const char *a2, ...)
{
  return _[a1 deviceClass];
}

id objc_msgSend_deviceOrientationBlocking(void *a1, const char *a2, ...)
{
  return _[a1 deviceOrientationBlocking];
}

id objc_msgSend_deviceType(void *a1, const char *a2, ...)
{
  return _[a1 deviceType];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjects:forKeys:count:];
}

id objc_msgSend_dictionaryWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjectsAndKeys:];
}

id objc_msgSend_didAddAnnotation(void *a1, const char *a2, ...)
{
  return _[a1 didAddAnnotation];
}

id objc_msgSend_didBlockSystemAppForAlternateSystemApp(void *a1, const char *a2, ...)
{
  return _[a1 didBlockSystemAppForAlternateSystemApp];
}

id objc_msgSend_didRemoveAnnotation(void *a1, const char *a2, ...)
{
  return _[a1 didRemoveAnnotation];
}

id objc_msgSend_didRemoveSubannotations(void *a1, const char *a2, ...)
{
  return _[a1 didRemoveSubannotations];
}

id objc_msgSend_didRespondBlockForConnection_(void *a1, const char *a2, ...)
{
  return [a1 didRespondBlockForConnection:];
}

id objc_msgSend_didUnblockSystemAppForAlternateSystemApp(void *a1, const char *a2, ...)
{
  return _[a1 didUnblockSystemAppForAlternateSystemApp];
}

id objc_msgSend_digitizerMatchingDictionaries(void *a1, const char *a2, ...)
{
  return _[a1 digitizerMatchingDictionaries];
}

id objc_msgSend_digitizerServicePersistentPropertyController(void *a1, const char *a2, ...)
{
  return _[a1 digitizerServicePersistentPropertyController];
}

id objc_msgSend_digitizerSurfaceDimensions(void *a1, const char *a2, ...)
{
  return _[a1 digitizerSurfaceDimensions];
}

id objc_msgSend_digitizerVisualizeHitTestRegions(void *a1, const char *a2, ...)
{
  return _[a1 digitizerVisualizeHitTestRegions];
}

id objc_msgSend_digitizerVisualizeTouches(void *a1, const char *a2, ...)
{
  return _[a1 digitizerVisualizeTouches];
}

id objc_msgSend_disableCAOverscan(void *a1, const char *a2, ...)
{
  return _[a1 disableCAOverscan];
}

id objc_msgSend_disableCAScaling(void *a1, const char *a2, ...)
{
  return _[a1 disableCAScaling];
}

id objc_msgSend_disableCAYUV(void *a1, const char *a2, ...)
{
  return _[a1 disableCAYUV];
}

id objc_msgSend_disableCloneMirroring(void *a1, const char *a2, ...)
{
  return _[a1 disableCloneMirroring];
}

id objc_msgSend_disableFeatures(void *a1, const char *a2, ...)
{
  return _[a1 disableFeatures];
}

id objc_msgSend_disableStudyLogALSLogging(void *a1, const char *a2, ...)
{
  return _[a1 disableStudyLogALSLogging];
}

id objc_msgSend_disableStudyLogAccelerometerLogging(void *a1, const char *a2, ...)
{
  return _[a1 disableStudyLogAccelerometerLogging];
}

id objc_msgSend_disableStudyLogBTKeyboardEventLogging(void *a1, const char *a2, ...)
{
  return _[a1 disableStudyLogBTKeyboardEventLogging];
}

id objc_msgSend_disableStudyLogBTKeyboardEventRedirection(void *a1, const char *a2, ...)
{
  return _[a1 disableStudyLogBTKeyboardEventRedirection];
}

id objc_msgSend_disableStudyLogButtonLogging(void *a1, const char *a2, ...)
{
  return _[a1 disableStudyLogButtonLogging];
}

id objc_msgSend_disableStudyLogCameraKeyLogging(void *a1, const char *a2, ...)
{
  return _[a1 disableStudyLogCameraKeyLogging];
}

id objc_msgSend_disableStudyLogGyroLogging(void *a1, const char *a2, ...)
{
  return _[a1 disableStudyLogGyroLogging];
}

id objc_msgSend_disableStudyLogPowerButtonLogging(void *a1, const char *a2, ...)
{
  return _[a1 disableStudyLogPowerButtonLogging];
}

id objc_msgSend_disableStudyLogVolumeKeyLogging(void *a1, const char *a2, ...)
{
  return _[a1 disableStudyLogVolumeKeyLogging];
}

id objc_msgSend_disableUpdateMask(void *a1, const char *a2, ...)
{
  return _[a1 disableUpdateMask];
}

id objc_msgSend_disabled(void *a1, const char *a2, ...)
{
  return _[a1 disabled];
}

id objc_msgSend_disablesDisplayUpdates(void *a1, const char *a2, ...)
{
  return _[a1 disablesDisplayUpdates];
}

id objc_msgSend_disablesUpdates(void *a1, const char *a2, ...)
{
  return _[a1 disablesUpdates];
}

id objc_msgSend_dismissOverlayWithAnimationSettings_requstedByPID_(void *a1, const char *a2, ...)
{
  return [a1 dismissOverlayWithAnimationSettings:nil requstedByPID:0];
}

id objc_msgSend_dismissWithAnimationSettings_(void *a1, const char *a2, ...)
{
  return [a1 dismissWithAnimationSettings:nil];
}

id objc_msgSend_dispatcher(void *a1, const char *a2, ...)
{
  return _[a1 dispatcher];
}

id objc_msgSend_display(void *a1, const char *a2, ...)
{
  return _[a1 display];
}

id objc_msgSend_display_didBecomeBlank_(void *a1, const char *a2, ...)
{
  return [a1 display:didBecomeBlank:];
}

id objc_msgSend_displayBrightnessCurve(void *a1, const char *a2, ...)
{
  return _[a1 displayBrightnessCurve];
}

id objc_msgSend_displayId(void *a1, const char *a2, ...)
{
  return _[a1 displayId];
}

id objc_msgSend_displayIsBlanked_(void *a1, const char *a2, ...)
{
  return [a1 displayIsBlanked:];
}

id objc_msgSend_displayIsConnected_(void *a1, const char *a2, ...)
{
  return [a1 displayIsConnected:];
}

id objc_msgSend_displayLinkWithDisplay_target_selector_(void *a1, const char *a2, ...)
{
  return [a1 displayLinkWithDisplay:target:selector:];
}

id objc_msgSend_displayUUID(void *a1, const char *a2, ...)
{
  return _[a1 displayUUID];
}

id objc_msgSend_displayUUIDIsActive_(void *a1, const char *a2, ...)
{
  return [a1 displayUUIDIsActive:];
}

id objc_msgSend_displayWithDisplayId_(void *a1, const char *a2, ...)
{
  return [a1 displayWithDisplayId:];
}

id objc_msgSend_displayWithHardwareIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 displayWithHardwareIdentifier:];
}

id objc_msgSend_displayWithName_(void *a1, const char *a2, ...)
{
  return [a1 displayWithName:];
}

id objc_msgSend_displayWithUniqueId_(void *a1, const char *a2, ...)
{
  return [a1 displayWithUniqueId:];
}

id objc_msgSend_displays(void *a1, const char *a2, ...)
{
  return _[a1 displays];
}

id objc_msgSend_doItHide(void *a1, const char *a2, ...)
{
  return _[a1 doItHide];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return _[a1 duration];
}

id objc_msgSend_ellipseStyle(void *a1, const char *a2, ...)
{
  return _[a1 ellipseStyle];
}

id objc_msgSend_emphasizedStyle(void *a1, const char *a2, ...)
{
  return _[a1 emphasizedStyle];
}

id objc_msgSend_encodeBool_forKey_(void *a1, const char *a2, ...)
{
  return [a1 encodeBool:forKey:];
}

id objc_msgSend_encodeFloat_forKey_(void *a1, const char *a2, ...)
{
  return [a1 encodeFloat:forKey:];
}

id objc_msgSend_encodeInteger_forKey_(void *a1, const char *a2, ...)
{
  return [a1 encodeInteger:forKey:];
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 encodeObject:forKey:];
}

id objc_msgSend_entitlementCache(void *a1, const char *a2, ...)
{
  return _[a1 entitlementCache];
}

id objc_msgSend_enumerateIndexesUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateIndexesUsingBlock:];
}

id objc_msgSend_enumerateIndexesWithOptions_usingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateIndexesWithOptions:];
}

id objc_msgSend_enumerateKeyPathNodes_options_ifFound_ifMissing_(void *a1, const char *a2, ...)
{
  return [a1 enumerateKeyPathNodes:nil options:0 ifFound:nil ifMissing:nil];
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateKeysAndObjectsUsingBlock:];
}

id objc_msgSend_enumerateKeysAndObjectsWithIndexesUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateKeysAndObjectsWithIndexesUsingBlock:];
}

id objc_msgSend_enumerateNodesWithOptions_usingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateNodesWithOptions:0 usingBlock:];
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateObjectsUsingBlock:];
}

id objc_msgSend_enumerateRangesUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateRangesUsingBlock:];
}

id objc_msgSend_enumerateUserInfoWithBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateUserInfoWithBlock:];
}

id objc_msgSend_enumerateWithBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateWithBlock:];
}

id objc_msgSend_enumeratorAtPath_(void *a1, const char *a2, ...)
{
  return [a1 enumeratorAtPath:];
}

id objc_msgSend_environment(void *a1, const char *a2, ...)
{
  return _[a1 environment];
}

id objc_msgSend_environmentRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 environmentRepresentation];
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 errorWithDomain:code:userInfo:];
}

id objc_msgSend_evaluateDisplay_reason_(void *a1, const char *a2, ...)
{
  return [a1 evaluateDisplay:reason:];
}

id objc_msgSend_eventDispatcher(void *a1, const char *a2, ...)
{
  return _[a1 eventDispatcher];
}

id objc_msgSend_eventProcessorOfClass_(void *a1, const char *a2, ...)
{
  return [a1 eventProcessorOfClass:];
}

id objc_msgSend_eventProcessorRegistry(void *a1, const char *a2, ...)
{
  return _[a1 eventProcessorRegistry];
}

id objc_msgSend_eventSource(void *a1, const char *a2, ...)
{
  return _[a1 eventSource];
}

id objc_msgSend_eventSourceForSender_(void *a1, const char *a2, ...)
{
  return [a1 eventSourceForSender:];
}

id objc_msgSend_executablePath(void *a1, const char *a2, ...)
{
  return _[a1 executablePath];
}

id objc_msgSend_execute_(void *a1, const char *a2, ...)
{
  return [a1 execute:];
}

id objc_msgSend_execute_error_(void *a1, const char *a2, ...)
{
  return [a1 execute:error:];
}

id objc_msgSend_externalDefaults(void *a1, const char *a2, ...)
{
  return _[a1 externalDefaults];
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return [a1 fileExistsAtPath:];
}

id objc_msgSend_fileExistsAtPath_isDirectory_(void *a1, const char *a2, ...)
{
  return [a1 fileExistsAtPath:isDirectory:];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 fileSystemRepresentation];
}

id objc_msgSend_fileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return [a1 fileURLWithPath:isDirectory:];
}

id objc_msgSend_filterDestinations_(void *a1, const char *a2, ...)
{
  return [a1 filterDestinations:];
}

id objc_msgSend_firstAdditionalContext(void *a1, const char *a2, ...)
{
  return _[a1 firstAdditionalContext];
}

id objc_msgSend_firstBootDetectorDidFinishFirstBoot_(void *a1, const char *a2, ...)
{
  return [a1 firstBootDetectorDidFinishFirstBoot:];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_fixedBrightnessLevelWhileDisabled(void *a1, const char *a2, ...)
{
  return _[a1 fixedBrightnessLevelWhileDisabled];
}

id objc_msgSend_fixedBrightnessNitsWhileDisabled(void *a1, const char *a2, ...)
{
  return _[a1 fixedBrightnessNitsWhileDisabled];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _[a1 floatValue];
}

id objc_msgSend_flush(void *a1, const char *a2, ...)
{
  return _[a1 flush];
}

id objc_msgSend_forceCloneMirroring(void *a1, const char *a2, ...)
{
  return _[a1 forceCloneMirroring];
}

id objc_msgSend_forceMirroredOrientation(void *a1, const char *a2, ...)
{
  return _[a1 forceMirroredOrientation];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _[a1 frame];
}

id objc_msgSend_freeze(void *a1, const char *a2, ...)
{
  return _[a1 freeze];
}

id objc_msgSend_freezeOverlay_(void *a1, const char *a2, ...)
{
  return [a1 freezeOverlay:];
}

id objc_msgSend_geometryForDisplayUUID_(void *a1, const char *a2, ...)
{
  return [a1 geometryForDisplayUUID:];
}

id objc_msgSend_getArgument_atIndex_(void *a1, const char *a2, ...)
{
  return [a1 getArgument:atIndex:];
}

id objc_msgSend_getStatus_presence_proximityInCentimeters_forDisplayUUID_(void *a1, const char *a2, ...)
{
  return [a1 getStatus:&v1 presence:&v2 proximityInCentimeters:&v3 forDisplayUUID:v4];
}

id objc_msgSend_globalKeyboardModifiersDidChange_(void *a1, const char *a2, ...)
{
  return [a1 globalKeyboardModifiersDidChange:];
}

id objc_msgSend_grant(void *a1, const char *a2, ...)
{
  return _[a1 grant];
}

id objc_msgSend_grantWithForegroundPriority(void *a1, const char *a2, ...)
{
  return _[a1 grantWithForegroundPriority];
}

id objc_msgSend_grantWithNamespace_endowment_(void *a1, const char *a2, ...)
{
  return [a1 grantWithNamespace:endowment:];
}

id objc_msgSend_grantWithResistance_(void *a1, const char *a2, ...)
{
  return [a1 grantWithResistance:];
}

id objc_msgSend_grantWithUserInteractivity(void *a1, const char *a2, ...)
{
  return _[a1 grantWithUserInteractivity];
}

id objc_msgSend_handleAccelerometerEventWithTimestamp_x_y_z_samplingInterval_(void *a1, const char *a2, ...)
{
  return [a1 handleAccelerometerEventWithTimestamp:x:y:z:samplingInterval:];
}

id objc_msgSend_handleFailureInFunction_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  [a1 handleFailureInFunction:__FUNCTION__ file:__FILE__ lineNumber:__LINE__ description:@""];
}

id objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return [a1 handleFailureInMethod:object:file:lineNumber:description:];
}

id objc_msgSend_handleOrientationEvent_orientationLocked_(void *a1, const char *a2, ...)
{
  return [a1 handleOrientationEvent:orientationLocked:];
}

id objc_msgSend_hardwareType(void *a1, const char *a2, ...)
{
  return _[a1 hardwareType];
}

id objc_msgSend_hasDebugStyle(void *a1, const char *a2, ...)
{
  return _[a1 hasDebugStyle];
}

id objc_msgSend_hasEntitlement_(void *a1, const char *a2, ...)
{
  return [a1 hasEntitlement:];
}

id objc_msgSend_hasEntitlement_forAuditToken_(void *a1, const char *a2, ...)
{
  return [a1 hasEntitlement:forAuditToken:];
}

id objc_msgSend_hasEntitlement_forConnection_(void *a1, const char *a2, ...)
{
  return [a1 hasEntitlement:forConnection:];
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return [a1 hasPrefix:];
}

id objc_msgSend_hasSuccinctStyle(void *a1, const char *a2, ...)
{
  return _[a1 hasSuccinctStyle];
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return [a1 hasSuffix:];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _[a1 hash];
}

id objc_msgSend_height(void *a1, const char *a2, ...)
{
  return _[a1 height];
}

id objc_msgSend_hideAppleLogoOnLaunch(void *a1, const char *a2, ...)
{
  return _[a1 hideAppleLogoOnLaunch];
}

id objc_msgSend_hitTestAtPosition_options_(void *a1, const char *a2, ...)
{
  return [a1 hitTestAtPosition:options:];
}

id objc_msgSend_hitTestCategoryForContextID_(void *a1, const char *a2, ...)
{
  return [a1 hitTestCategoryForContextID:];
}

id objc_msgSend_hitTestInformationMask(void *a1, const char *a2, ...)
{
  return _[a1 hitTestInformationMask];
}

id objc_msgSend_hitTestRegionsDidChange_(void *a1, const char *a2, ...)
{
  return [a1 hitTestRegionsDidChange:];
}

id objc_msgSend_hostContextIDForEmbeddedContextID_displayUUID_(void *a1, const char *a2, ...)
{
  return [a1 hostContextIDForEmbeddedContextID:displayUUID:];
}

id objc_msgSend_humanIsPresent(void *a1, const char *a2, ...)
{
  return _[a1 humanIsPresent];
}

id objc_msgSend_iapDefaults(void *a1, const char *a2, ...)
{
  return _[a1 iapDefaults];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_identityForEmbeddedApplicationIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 identityForEmbeddedApplicationIdentifier:];
}

id objc_msgSend_ignoreAccelerometerAndOrientationEvents(void *a1, const char *a2, ...)
{
  return _[a1 ignoreAccelerometerAndOrientationEvents];
}

id objc_msgSend_ignoreTetheringPreferences(void *a1, const char *a2, ...)
{
  return _[a1 ignoreTetheringPreferences];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return _[a1 image];
}

id objc_msgSend_imageAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 imageAtIndex:];
}

id objc_msgSend_immutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 immutableCopy];
}

id objc_msgSend_includeBitNumber_(void *a1, const char *a2, ...)
{
  return [a1 includeBitNumber:];
}

id objc_msgSend_increment(void *a1, const char *a2, ...)
{
  return _[a1 increment];
}

id objc_msgSend_indexSet(void *a1, const char *a2, ...)
{
  return _[a1 indexSet];
}

id objc_msgSend_infoDictionary(void *a1, const char *a2, ...)
{
  return _[a1 infoDictionary];
}

id objc_msgSend_inhibitRotation(void *a1, const char *a2, ...)
{
  return _[a1 inhibitRotation];
}

id objc_msgSend_initForAllManagedWithReason_(void *a1, const char *a2, ...)
{
  return [a1 initForAllManagedWithReason:];
}

id objc_msgSend_initForDisplay_(void *a1, const char *a2, ...)
{
  return [a1 initForDisplay:];
}

id objc_msgSend_initWithBasename_bundle_imageCount_scale_(void *a1, const char *a2, ...)
{
  return [a1 initWithBasename:bundle:imageCount:scale:];
}

id objc_msgSend_initWithBundleId_options_queue_(void *a1, const char *a2, ...)
{
  return [a1 initWithBundleId:options:queue:];
}

id objc_msgSend_initWithBytesNoCopy_length_freeWhenDone_(void *a1, const char *a2, ...)
{
  return [a1 initWithBytesNoCopy:length:freeWhenDone:];
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 initWithCapacity:];
}

id objc_msgSend_initWithConnection_pid_(void *a1, const char *a2, ...)
{
  return [a1 initWithConnection:pid:];
}

id objc_msgSend_initWithContentsOfFile_options_error_(void *a1, const char *a2, ...)
{
  return [a1 initWithContentsOfFile:options:error:];
}

id objc_msgSend_initWithContext_(void *a1, const char *a2, ...)
{
  return [a1 initWithContext:];
}

id objc_msgSend_initWithController_(void *a1, const char *a2, ...)
{
  return [a1 initWithController:];
}

id objc_msgSend_initWithDelegate_serverTarget_serverProtocol_clientProtocol_serviceName_queue_log_entitlement_( void *a1, const char *a2, ...)
{
  return [a1 initWithDelegate:a2 serverTarget:a3 serverProtocol:a4 clientProtocol:a5 serviceName:a6 queue:a7 log:a8 entitlement:a9];
}

id objc_msgSend_initWithDeliveryManager_ruleChangeAuthority_(void *a1, const char *a2, ...)
{
  return [a1 initWithDeliveryManager:ruleChangeAuthority:];
}

id objc_msgSend_initWithDisplayProvider_(void *a1, const char *a2, ...)
{
  return [a1 initWithDisplayProvider:];
}

id objc_msgSend_initWithDisplayProvider_log_filterPredicate_(void *a1, const char *a2, ...)
{
  return [a1 initWithDisplayProvider:a2 log:a3 filterPredicate:a4];
}

id objc_msgSend_initWithDisplayUUID_(void *a1, const char *a2, ...)
{
  return [a1 initWithDisplayUUID:];
}

id objc_msgSend_initWithExplanation_(void *a1, const char *a2, ...)
{
  return [a1 initWithExplanation:];
}

id objc_msgSend_initWithExplanation_target_attributes_(void *a1, const char *a2, ...)
{
  return [a1 initWithExplanation:target:attributes:];
}

id objc_msgSend_initWithFireInterval_queue_handler_(void *a1, const char *a2, ...)
{
  return [a1 initWithFireInterval:queue:handler:];
}

id objc_msgSend_initWithFirstBootDetector_(void *a1, const char *a2, ...)
{
  return [a1 initWithFirstBootDetector:];
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 initWithFormat:];
}

id objc_msgSend_initWithHIDHapticFeedbackInterface_(void *a1, const char *a2, ...)
{
  return [a1 initWithHIDHapticFeedbackInterface:];
}

id objc_msgSend_initWithHIDSystem_(void *a1, const char *a2, ...)
{
  return [a1 initWithHIDSystem:];
}

id objc_msgSend_initWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 initWithIdentifier:];
}

id objc_msgSend_initWithIdentifier_forReason_invalidationBlock_(void *a1, const char *a2, ...)
{
  return [a1 initWithIdentifier:forReason:invalidationBlock:];
}

id objc_msgSend_initWithIdentifier_transactionManager_(void *a1, const char *a2, ...)
{
  return [a1 initWithIdentifier:a2 transactionManager:a3];
}

id objc_msgSend_initWithLabel_(void *a1, const char *a2, ...)
{
  return [a1 initWithLabel:];
}

id objc_msgSend_initWithLabel_logCategory_(void *a1, const char *a2, ...)
{
  return [a1 initWithLabel:logCategory:];
}

id objc_msgSend_initWithLog_(void *a1, const char *a2, ...)
{
  return [a1 initWithLog:];
}

id objc_msgSend_initWithLogger_(void *a1, const char *a2, ...)
{
  return [a1 initWithLogger:];
}

id objc_msgSend_initWithLogger_duration_(void *a1, const char *a2, ...)
{
  return [a1 initWithLogger:duration:];
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return [a1 initWithMachServiceName:];
}

id objc_msgSend_initWithMatchingDictionary_dataProvider_(void *a1, const char *a2, ...)
{
  return [a1 initWithMatchingDictionary:dataProvider:];
}

id objc_msgSend_initWithName_display_(void *a1, const char *a2, ...)
{
  return [a1 initWithName:display:];
}

id objc_msgSend_initWithObjects_(void *a1, const char *a2, ...)
{
  return [a1 initWithObjects:];
}

id objc_msgSend_initWithObjects_count_(void *a1, const char *a2, ...)
{
  return [a1 initWithObjects:nil count:0];
}

id objc_msgSend_initWithObjects_forKeys_(void *a1, const char *a2, ...)
{
  return [a1 initWithObjects:forKeys:];
}

id objc_msgSend_initWithObserverService_(void *a1, const char *a2, ...)
{
  return [a1 initWithObserverService:];
}

id objc_msgSend_initWithOptions_capacity_(void *a1, const char *a2, ...)
{
  return [a1 initWithOptions:capacity:];
}

id objc_msgSend_initWithOverlayDescriptor_level_(void *a1, const char *a2, ...)
{
  return [a1 initWithOverlayDescriptor:level:];
}

id objc_msgSend_initWithPID_queue_deathHandler_(void *a1, const char *a2, ...)
{
  return [a1 initWithPID:queue:deathHandler:];
}

id objc_msgSend_initWithPath_(void *a1, const char *a2, ...)
{
  return [a1 initWithPath:];
}

id objc_msgSend_initWithPid_sendRight_(void *a1, const char *a2, ...)
{
  return [a1 initWithPid:sendRight:];
}

id objc_msgSend_initWithPid_sendRight_queue_(void *a1, const char *a2, ...)
{
  return [a1 initWithPid:sendRight:queue:];
}

id objc_msgSend_initWithPid_sendRight_queue_processName_(void *a1, const char *a2, ...)
{
  return [a1 initWithPid:sendRight:queue:processName:];
}

id objc_msgSend_initWithPort_(void *a1, const char *a2, ...)
{
  return [a1 initWithPort:];
}

id objc_msgSend_initWithPredicate_context_(void *a1, const char *a2, ...)
{
  return [a1 initWithPredicate:context:];
}

id objc_msgSend_initWithProcessId_contextIds_(void *a1, const char *a2, ...)
{
  return [a1 initWithProcessId:contextIds:];
}

id objc_msgSend_initWithProgressBarVisibility_createContext_contextLevel_appearance_(void *a1, const char *a2, ...)
{
  return [a1 initWithProgressBarVisibility:createContext:contextLevel:appearance:];
}

id objc_msgSend_initWithRed_green_blue_(void *a1, const char *a2, ...)
{
  return [a1 initWithRed:0.0 green:0.0 blue:0.0];
}

id objc_msgSend_initWithSecureModeViolations_(void *a1, const char *a2, ...)
{
  return [a1 initWithSecureModeViolations:];
}

id objc_msgSend_initWithSendRight_(void *a1, const char *a2, ...)
{
  return [a1 initWithSendRight:];
}

id objc_msgSend_initWithSenderDescriptor_matcherDataProvider_persistentPropertyController_( void *a1, const char *a2, ...)
{
  return [a1 initWithSenderDescriptor:a2 matcherDataProvider:a3 persistentPropertyController:a4];
}

id objc_msgSend_initWithSentinel_(void *a1, const char *a2, ...)
{
  return [a1 initWithSentinel:];
}

id objc_msgSend_initWithService_(void *a1, const char *a2, ...)
{
  return [a1 initWithService:];
}

id objc_msgSend_initWithSupportedHES_disengagedHES_attached_unknownState_(void *a1, const char *a2, ...)
{
  return [a1 initWithSupportedHES:disengagedHES:attached:unknownState:];
}

id objc_msgSend_initWithSystemAppSentinel_alternateSystemAppManager_firstBootDetector_bootUIOverlayVendor_renderOverlayManager_( void *a1, const char *a2, ...)
{
  return [a1 initWithSystemAppSentinel:alternateSystemAppManager:firstBootDetector:bootUIOverlayVendor:renderOverlayManager:];
}

id objc_msgSend_initWithSystemAppSentinel_firstBootToken_alternateSystemAppManager_(void *a1, const char *a2, ...)
{
  return [a1 initWithSystemAppSentinel:firstBootToken:alternateSystemAppManager:];
}

id objc_msgSend_initWithTarget_selector_object_(void *a1, const char *a2, ...)
{
  return [a1 initWithTarget:a2 selector:a3 object:a4];
}

id objc_msgSend_initWithUsagePage_usage_builtIn_dataProvider_(void *a1, const char *a2, ...)
{
  return [a1 initWithUsagePage:usage:builtIn:dataProvider:];
}

id objc_msgSend_initialSampleEvent(void *a1, const char *a2, ...)
{
  return _[a1 initialSampleEvent];
}

id objc_msgSend_initialize(void *a1, const char *a2, ...)
{
  return _[a1 initialize];
}

id objc_msgSend_injectGSEvent_(void *a1, const char *a2, ...)
{
  return [a1 injectGSEvent:];
}

id objc_msgSend_injectHIDEvent_(void *a1, const char *a2, ...)
{
  return [a1 injectHIDEvent:];
}

id objc_msgSend_insertObject_atIndex_(void *a1, const char *a2, ...)
{
  return [a1 insertObject:atIndex:];
}

id objc_msgSend_insertSublayer_atIndex_(void *a1, const char *a2, ...)
{
  return [a1 insertSublayer:atIndex:];
}

id objc_msgSend_inspectChangesWithOldPolicy_newPolicy_usingBlock_(void *a1, const char *a2, ...)
{
  return [a1 inspectChangesWithOldPolicy:newPolicy:usingBlock:];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_interfaceOrientation(void *a1, const char *a2, ...)
{
  return _[a1 interfaceOrientation];
}

id objc_msgSend_interfaceWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 interfaceWithIdentifier:];
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return [a1 interfaceWithProtocol:];
}

id objc_msgSend_intersectSet_(void *a1, const char *a2, ...)
{
  return [a1 intersectSet:];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_invalidateTouchStreamReference_(void *a1, const char *a2, ...)
{
  return [a1 invalidateTouchStreamReference:];
}

id objc_msgSend_invoke(void *a1, const char *a2, ...)
{
  return _[a1 invoke];
}

id objc_msgSend_isALSSupported(void *a1, const char *a2, ...)
{
  return _[a1 isALSSupported];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return _[a1 isActive];
}

id objc_msgSend_isAlive(void *a1, const char *a2, ...)
{
  return _[a1 isAlive];
}

id objc_msgSend_isAlsSupported(void *a1, const char *a2, ...)
{
  return _[a1 isAlsSupported];
}

id objc_msgSend_isAuthenticated(void *a1, const char *a2, ...)
{
  return _[a1 isAuthenticated];
}

id objc_msgSend_isAutoBrightnessAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isAutoBrightnessAvailable];
}

id objc_msgSend_isBlanked(void *a1, const char *a2, ...)
{
  return _[a1 isBlanked];
}

id objc_msgSend_isBrightnessLevelControlAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isBrightnessLevelControlAvailable];
}

id objc_msgSend_isBuiltIn(void *a1, const char *a2, ...)
{
  return _[a1 isBuiltIn];
}

id objc_msgSend_isCapsLockLightOn(void *a1, const char *a2, ...)
{
  return _[a1 isCapsLockLightOn];
}

id objc_msgSend_isCapsLockLightOnForSenderID_(void *a1, const char *a2, ...)
{
  return [a1 isCapsLockLightOnForSenderID:];
}

id objc_msgSend_isDigitizerSignpostsEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isDigitizerSignpostsEnabled];
}

id objc_msgSend_isDitheringEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isDitheringEnabled];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isEnabled];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return [a1 isEqual:];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToString:];
}

id objc_msgSend_isExternal(void *a1, const char *a2, ...)
{
  return _[a1 isExternal];
}

id objc_msgSend_isFirstBoot(void *a1, const char *a2, ...)
{
  return _[a1 isFirstBoot];
}

id objc_msgSend_isFlipBookEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isFlipBookEnabled];
}

id objc_msgSend_isFrozen(void *a1, const char *a2, ...)
{
  return _[a1 isFrozen];
}

id objc_msgSend_isObjectWithinProximity(void *a1, const char *a2, ...)
{
  return _[a1 isObjectWithinProximity];
}

id objc_msgSend_isPencilDigitizer(void *a1, const char *a2, ...)
{
  return _[a1 isPencilDigitizer];
}

id objc_msgSend_isProximityDetectionActive(void *a1, const char *a2, ...)
{
  return _[a1 isProximityDetectionActive];
}

id objc_msgSend_isRequired(void *a1, const char *a2, ...)
{
  return _[a1 isRequired];
}

id objc_msgSend_isSafeToResetIdleTimer(void *a1, const char *a2, ...)
{
  return _[a1 isSafeToResetIdleTimer];
}

id objc_msgSend_isSecureModeEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isSecureModeEnabled];
}

id objc_msgSend_isShowingNonBootUIOverlays(void *a1, const char *a2, ...)
{
  return _[a1 isShowingNonBootUIOverlays];
}

id objc_msgSend_isSmartCoverClosed(void *a1, const char *a2, ...)
{
  return _[a1 isSmartCoverClosed];
}

id objc_msgSend_isSmartCoverSupported(void *a1, const char *a2, ...)
{
  return _[a1 isSmartCoverSupported];
}

id objc_msgSend_isSpringAnimation(void *a1, const char *a2, ...)
{
  return _[a1 isSpringAnimation];
}

id objc_msgSend_isSqueezeForSystemShortcutEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isSqueezeForSystemShortcutEnabled];
}

id objc_msgSend_isSteveNoteOverscanEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isSteveNoteOverscanEnabled];
}

id objc_msgSend_isSteveNoteRotationEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isSteveNoteRotationEnabled];
}

id objc_msgSend_isTethered(void *a1, const char *a2, ...)
{
  return _[a1 isTethered];
}

id objc_msgSend_isTokenSet(void *a1, const char *a2, ...)
{
  return _[a1 isTokenSet];
}

id objc_msgSend_isUsable(void *a1, const char *a2, ...)
{
  return _[a1 isUsable];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return _[a1 isValid];
}

id objc_msgSend_isVirtualService(void *a1, const char *a2, ...)
{
  return _[a1 isVirtualService];
}

id objc_msgSend_jobLabel(void *a1, const char *a2, ...)
{
  return _[a1 jobLabel];
}

id objc_msgSend_keyCommand(void *a1, const char *a2, ...)
{
  return _[a1 keyCommand];
}

id objc_msgSend_keyCommandForEvent_gsKeyboard_activeModifiers_(void *a1, const char *a2, ...)
{
  return [a1 keyCommandForEvent:gsKeyboard:activeModifiers:];
}

id objc_msgSend_keyPath(void *a1, const char *a2, ...)
{
  return _[a1 keyPath];
}

id objc_msgSend_keyboardDefaults(void *a1, const char *a2, ...)
{
  return _[a1 keyboardDefaults];
}

id objc_msgSend_keyboardTypeRemap(void *a1, const char *a2, ...)
{
  return _[a1 keyboardTypeRemap];
}

id objc_msgSend_keyboardWantsStandardTypeOverrideForSenderID_(void *a1, const char *a2, ...)
{
  return [a1 keyboardWantsStandardTypeOverrideForSenderID:];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return _[a1 label];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_lastUserEventTime(void *a1, const char *a2, ...)
{
  return _[a1 lastUserEventTime];
}

id objc_msgSend_launchPreboardWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 launchPreboardWithCompletion:];
}

id objc_msgSend_launchWithResultBlock_exitBlock_(void *a1, const char *a2, ...)
{
  return [a1 launchWithResultBlock:nil exitBlock:nil];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return _[a1 layer];
}

id objc_msgSend_layoutAnnotationStack_(void *a1, const char *a2, ...)
{
  return [a1 layoutAnnotationStack:];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_level(void *a1, const char *a2, ...)
{
  return _[a1 level];
}

id objc_msgSend_listenerWithConfigurator_(void *a1, const char *a2, ...)
{
  return [a1 listenerWithConfigurator:];
}

id objc_msgSend_load(void *a1, const char *a2, ...)
{
  return _[a1 load];
}

id objc_msgSend_localDefaults(void *a1, const char *a2, ...)
{
  return _[a1 localDefaults];
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return _[a1 location];
}

id objc_msgSend_locationDidChange(void *a1, const char *a2, ...)
{
  return _[a1 locationDidChange];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return _[a1 lock];
}

id objc_msgSend_lockBacklight(void *a1, const char *a2, ...)
{
  return _[a1 lockBacklight];
}

id objc_msgSend_lockdownDefaults(void *a1, const char *a2, ...)
{
  return _[a1 lockdownDefaults];
}

id objc_msgSend_log_(void *a1, const char *a2, ...)
{
  return [a1 log:];
}

id objc_msgSend_logBlock_domain_(void *a1, const char *a2, ...)
{
  return [a1 logBlock:domain:];
}

id objc_msgSend_mainDisplay(void *a1, const char *a2, ...)
{
  return _[a1 mainDisplay];
}

id objc_msgSend_mainDisplayDigitizerService(void *a1, const char *a2, ...)
{
  return _[a1 mainDisplayDigitizerService];
}

id objc_msgSend_mainDisplayPencilDigitizerService(void *a1, const char *a2, ...)
{
  return _[a1 mainDisplayPencilDigitizerService];
}

id objc_msgSend_makeObjectsPerformSelector_withObject_(void *a1, const char *a2, ...)
{
  return [a1 makeObjectsPerformSelector:withObject:];
}

id objc_msgSend_matchSharingTouchesPolicy_orCancelTouchesPolicy_orCombinedPolicy_(void *a1, const char *a2, ...)
{
  return [a1 matchSharingTouchesPolicy:orCancelTouchesPolicy:orCombinedPolicy:];
}

id objc_msgSend_matchesDescriptor_failureReason_(void *a1, const char *a2, ...)
{
  return [a1 matchesDescriptor:failureReason:];
}

id objc_msgSend_matchesPortOfRight_(void *a1, const char *a2, ...)
{
  return [a1 matchesPortOfRight:];
}

id objc_msgSend_maxForce(void *a1, const char *a2, ...)
{
  return _[a1 maxForce];
}

id objc_msgSend_member_(void *a1, const char *a2, ...)
{
  return [a1 member:];
}

id objc_msgSend_migrateDefaultsIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 migrateDefaultsIfNecessary];
}

id objc_msgSend_migrateIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 migrateIfNecessary];
}

id objc_msgSend_migrateIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 migrateIfNeeded];
}

id objc_msgSend_minimalStyle(void *a1, const char *a2, ...)
{
  return _[a1 minimalStyle];
}

id objc_msgSend_minusSet_(void *a1, const char *a2, ...)
{
  return [a1 minusSet:];
}

id objc_msgSend_modifierKeyRemapping(void *a1, const char *a2, ...)
{
  return _[a1 modifierKeyRemapping];
}

id objc_msgSend_monitor_activeDisplayPropertiesDidChange_(void *a1, const char *a2, ...)
{
  return [a1 monitor:activeDisplayPropertiesDidChange:];
}

id objc_msgSend_monitor_displayDidBecomeActive_(void *a1, const char *a2, ...)
{
  return [a1 monitor:displayDidBecomeActive:];
}

id objc_msgSend_monitor_displayDidBecomeInactive_(void *a1, const char *a2, ...)
{
  return [a1 monitor:displayDidBecomeInactive:];
}

id objc_msgSend_monitorForDeath_(void *a1, const char *a2, ...)
{
  return [a1 monitorForDeath];
}

id objc_msgSend_monitorSendRight_withHandler_(void *a1, const char *a2, ...)
{
  return [a1 monitorSendRight:withHandler:];
}

id objc_msgSend_moveItemAtPath_toPath_error_(void *a1, const char *a2, ...)
{
  return [a1 moveItemAtPath:toPath:error:];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_namespaceNode(void *a1, const char *a2, ...)
{
  return _[a1 namespaceNode];
}

id objc_msgSend_nativeOrientation(void *a1, const char *a2, ...)
{
  return _[a1 nativeOrientation];
}

id objc_msgSend_nativeRotation(void *a1, const char *a2, ...)
{
  return _[a1 nativeRotation];
}

id objc_msgSend_needsLogging(void *a1, const char *a2, ...)
{
  return _[a1 needsLogging];
}

id objc_msgSend_new(void *a1, const char *a2, ...)
{
  return _[a1 new];
}

id objc_msgSend_newLayerForContent_scale_(void *a1, const char *a2, ...)
{
  return [a1 newLayerForContent:scale:];
}

id objc_msgSend_nodeAtKeyPath_(void *a1, const char *a2, ...)
{
  return [a1 nodeAtKeyPath:];
}

id objc_msgSend_normalizedDigitizerRect(void *a1, const char *a2, ...)
{
  return _[a1 normalizedDigitizerRect];
}

id objc_msgSend_noteInterfaceOrientationChangedWithInterfaceOrientation_(void *a1, const char *a2, ...)
{
  return [a1 noteInterfaceOrientationChangedWithInterfaceOrientation:];
}

id objc_msgSend_noteTouchUpOccurred_detached_context_clientPort_(void *a1, const char *a2, ...)
{
  return [a1 noteTouchUpOccurred:detached:context:clientPort:];
}

id objc_msgSend_notifyOnNextUserEvent(void *a1, const char *a2, ...)
{
  return _[a1 notifyOnNextUserEvent];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _[a1 null];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return [a1 numberWithBool:YES];
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return [a1 numberWithDouble:];
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return [a1 numberWithFloat:];
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return [a1 numberWithInt:];
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithInteger:];
}

id objc_msgSend_numberWithLong_(void *a1, const char *a2, ...)
{
  return [a1 numberWithLong:];
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return [a1 numberWithLongLong:];
}

id objc_msgSend_numberWithUnsignedChar_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedChar:];
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedInt:];
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedInteger:];
}

id objc_msgSend_numberWithUnsignedLong_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedLong:];
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedLongLong:];
}

id objc_msgSend_numberWithUnsignedShort_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedShort:];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return _[a1 object];
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 objectAtIndex:];
}

id objc_msgSend_objectAtKeyPath_(void *a1, const char *a2, ...)
{
  return [a1 objectAtKeyPath:];
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 objectEnumerator];
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return [a1 objectForKey:];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectForKeyedSubscript:];
}

id objc_msgSend_observeDefault_onQueue_withBlock_(void *a1, const char *a2, ...)
{
  return [a1 observeDefault:onQueue:withBlock:];
}

id objc_msgSend_observeDefaults_onQueue_withBlock_(void *a1, const char *a2, ...)
{
  return [a1 observeDefaults:onQueue:withBlock:];
}

id objc_msgSend_observeTouchEventDeliveryDidOccur_response_(void *a1, const char *a2, ...)
{
  return [a1 observeTouchEventDeliveryDidOccur:response:];
}

id objc_msgSend_observeValueForKeyPath_ofObject_change_context_(void *a1, const char *a2, ...)
{
  return [a1 observeValueForKeyPath:ofObject:change:context:];
}

id objc_msgSend_openAlternateSystemApp_options_withResult_andExitBlock_(void *a1, const char *a2, ...)
{
  return [a1 openAlternateSystemApp:options:withResult:andExitBlock:];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return _[a1 options];
}

id objc_msgSend_orderedContext(void *a1, const char *a2, ...)
{
  return _[a1 orderedContext];
}

id objc_msgSend_orderedSetWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 orderedSetWithCapacity:];
}

id objc_msgSend_orientation(void *a1, const char *a2, ...)
{
  return _[a1 orientation];
}

id objc_msgSend_orientationManager_deviceOrientationMayHaveChanged_changeSource_isDeviceOrientationLocked_( void *a1, const char *a2, ...)
{
  return [a1 orientationManager:v1 deviceOrientationMayHaveChanged:v2 changeSource:v3 isDeviceOrientationLocked:v4];
}

id objc_msgSend_overlayStyle_block_(void *a1, const char *a2, ...)
{
  return [a1 overlayStyle:block:];
}

id objc_msgSend_overlayType(void *a1, const char *a2, ...)
{
  return _[a1 overlayType];
}

id objc_msgSend_overlayWithLevel_display_(void *a1, const char *a2, ...)
{
  return [a1 overlayWithLevel:display:];
}

id objc_msgSend_overrideSenderDescriptor(void *a1, const char *a2, ...)
{
  return _[a1 overrideSenderDescriptor];
}

id objc_msgSend_passiveOrientationEvents(void *a1, const char *a2, ...)
{
  return _[a1 passiveOrientationEvents];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_pathAttributes(void *a1, const char *a2, ...)
{
  return _[a1 pathAttributes];
}

id objc_msgSend_pathIndexInRangeMask(void *a1, const char *a2, ...)
{
  return _[a1 pathIndexInRangeMask];
}

id objc_msgSend_pathIndexTouchingMask(void *a1, const char *a2, ...)
{
  return _[a1 pathIndexTouchingMask];
}

id objc_msgSend_pathProviderForSystemContainerForCurrentProcess(void *a1, const char *a2, ...)
{
  return _[a1 pathProviderForSystemContainerForCurrentProcess];
}

id objc_msgSend_performSelector_onThread_withObject_waitUntilDone_(void *a1, const char *a2, ...)
{
  return [a1 performSelector:onThread:withObject:waitUntilDone:];
}

id objc_msgSend_performSelector_onThread_withObject_waitUntilDone_modes_(void *a1, const char *a2, ...)
{
  return [a1 performSelector:onThread:withObject:waitUntilDone:modes:];
}

id objc_msgSend_performSelectorOnMainThread_withObject_waitUntilDone_(void *a1, const char *a2, ...)
{
  return [a1 performSelectorOnMainThread:withObject:waitUntilDone:];
}

id objc_msgSend_performSynchronized_(void *a1, const char *a2, ...)
{
  return [a1 performSynchronized:];
}

id objc_msgSend_performSynchronizedWithCATransaction_(void *a1, const char *a2, ...)
{
  return [a1 performSynchronizedWithCATransaction:];
}

id objc_msgSend_persistentConnectionDefaults(void *a1, const char *a2, ...)
{
  return _[a1 persistentConnectionDefaults];
}

id objc_msgSend_persistentPropertiesForKeys_forSenderDescriptor_(void *a1, const char *a2, ...)
{
  return [a1 persistentPropertiesForKeys:forSenderDescriptor:];
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return _[a1 pid];
}

id objc_msgSend_pidForBundleID_(void *a1, const char *a2, ...)
{
  return [a1 pidForBundleID:];
}

id objc_msgSend_playHapticFeedbackRequest_(void *a1, const char *a2, ...)
{
  return [a1 playHapticFeedbackRequest:];
}

id objc_msgSend_point(void *a1, const char *a2, ...)
{
  return _[a1 point];
}

id objc_msgSend_pointScale(void *a1, const char *a2, ...)
{
  return _[a1 pointScale];
}

id objc_msgSend_pointerArrayWithOptions_(void *a1, const char *a2, ...)
{
  return [a1 pointerArrayWithOptions:];
}

id objc_msgSend_pointerAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 pointerAtIndex:];
}

id objc_msgSend_policyByCombiningPolicies_(void *a1, const char *a2, ...)
{
  return [a1 policyByCombiningPolicies:];
}

id objc_msgSend_policyExcludingPolicyIdenticalTo_(void *a1, const char *a2, ...)
{
  return [a1 policyExcludingPolicyIdenticalTo:];
}

id objc_msgSend_policyIncludingPolicy_(void *a1, const char *a2, ...)
{
  return [a1 policyIncludingPolicy:];
}

id objc_msgSend_position(void *a1, const char *a2, ...)
{
  return _[a1 position];
}

id objc_msgSend_postEvent_fromSender_(void *a1, const char *a2, ...)
{
  return [a1 postEvent:fromSender:];
}

id objc_msgSend_postEvent_position_additionalContext_(void *a1, const char *a2, ...)
{
  return [a1 postEvent:nil position:nil additionalContext:nil];
}

id objc_msgSend_postEvent_position_additionalContext_fromBuffer_toResolution_(void *a1, const char *a2, ...)
{
  return [a1 postEvent:position:additionalContext:fromBuffer:toResolution:];
}

id objc_msgSend_postEvent_toDestination_(void *a1, const char *a2, ...)
{
  return [a1 postEvent:toDestination:];
}

id objc_msgSend_postHapticFeedbackRequest_forAuditToken_(void *a1, const char *a2, ...)
{
  return [a1 postHapticFeedbackRequest:forAuditToken:];
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return [a1 postNotificationName:nil object:nil];
}

id objc_msgSend_postTouchAnnotations_sourcePID_(void *a1, const char *a2, ...)
{
  return [a1 postTouchAnnotations:sourcePID:];
}

id objc_msgSend_powerSourceID(void *a1, const char *a2, ...)
{
  return _[a1 powerSourceID];
}

id objc_msgSend_predicateMatchingIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 predicateMatchingIdentifier:];
}

id objc_msgSend_preferredFrameSize(void *a1, const char *a2, ...)
{
  return _[a1 preferredFrameSize];
}

id objc_msgSend_preferredScale(void *a1, const char *a2, ...)
{
  return _[a1 preferredScale];
}

id objc_msgSend_prepareForRestart(void *a1, const char *a2, ...)
{
  return _[a1 prepareForRestart];
}

id objc_msgSend_presentWithAnimationSettings_(void *a1, const char *a2, ...)
{
  return [a1 presentWithAnimationSettings:];
}

id objc_msgSend_primaryPage(void *a1, const char *a2, ...)
{
  return _[a1 primaryPage];
}

id objc_msgSend_primarySystemShell(void *a1, const char *a2, ...)
{
  return _[a1 primarySystemShell];
}

id objc_msgSend_primaryUsage(void *a1, const char *a2, ...)
{
  return _[a1 primaryUsage];
}

id objc_msgSend_primaryUsagePage(void *a1, const char *a2, ...)
{
  return _[a1 primaryUsagePage];
}

id objc_msgSend_principalClass(void *a1, const char *a2, ...)
{
  return _[a1 principalClass];
}

id objc_msgSend_processDescription(void *a1, const char *a2, ...)
{
  return _[a1 processDescription];
}

id objc_msgSend_processEvent_sender_dispatcher_(void *a1, const char *a2, ...)
{
  return [a1 processEvent:sender:dispatcher:];
}

id objc_msgSend_processHandleForAuditToken_(void *a1, const char *a2, ...)
{
  return [a1 processHandleForAuditToken:];
}

id objc_msgSend_processId(void *a1, const char *a2, ...)
{
  return _[a1 processId];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 processIdentifier];
}

id objc_msgSend_progressIndicatorProperties(void *a1, const char *a2, ...)
{
  return _[a1 progressIndicatorProperties];
}

id objc_msgSend_progressIndicatorWithStyle_position_(void *a1, const char *a2, ...)
{
  return [a1 progressIndicatorWithStyle:position:];
}

id objc_msgSend_propertyForKey_(void *a1, const char *a2, ...)
{
  return [a1 propertyForKey:];
}

id objc_msgSend_propertyOfClass_forKey_(void *a1, const char *a2, ...)
{
  return [a1 propertyOfClass:forKey:];
}

id objc_msgSend_protocolForProtocol_(void *a1, const char *a2, ...)
{
  return [a1 protocolForProtocol:];
}

id objc_msgSend_proximityDetectionMaskDidChange_(void *a1, const char *a2, ...)
{
  return [a1 proximityDetectionMaskDidChange:];
}

id objc_msgSend_proximityInCentimeters(void *a1, const char *a2, ...)
{
  return _[a1 proximityInCentimeters];
}

id objc_msgSend_rasterizationScale(void *a1, const char *a2, ...)
{
  return _[a1 rasterizationScale];
}

id objc_msgSend_realToken(void *a1, const char *a2, ...)
{
  return _[a1 realToken];
}

id objc_msgSend_reasons(void *a1, const char *a2, ...)
{
  return _[a1 reasons];
}

id objc_msgSend_rebuildPersistentOverlays(void *a1, const char *a2, ...)
{
  return _[a1 rebuildPersistentOverlays];
}

id objc_msgSend_recognizerForEventDescriptor_(void *a1, const char *a2, ...)
{
  return [a1 recognizerForEventDescriptor:];
}

id objc_msgSend_rect(void *a1, const char *a2, ...)
{
  return _[a1 rect];
}

id objc_msgSend_rectangleStyle(void *a1, const char *a2, ...)
{
  return _[a1 rectangleStyle];
}

id objc_msgSend_reducePolicyToObjectWithBlock_(void *a1, const char *a2, ...)
{
  return [a1 reducePolicyToObjectWithBlock:];
}

id objc_msgSend_reevaluateActiveDisplaysWithReason_(void *a1, const char *a2, ...)
{
  return [a1 reevaluateActiveDisplaysWithReason:];
}

id objc_msgSend_referenceSpaceLayer(void *a1, const char *a2, ...)
{
  return _[a1 referenceSpaceLayer];
}

id objc_msgSend_regenerateLayerTree(void *a1, const char *a2, ...)
{
  return _[a1 regenerateLayerTree];
}

id objc_msgSend_registerClientsForMonitoring(void *a1, const char *a2, ...)
{
  return _[a1 registerClientsForMonitoring];
}

id objc_msgSend_registerHandler_(void *a1, const char *a2, ...)
{
  return [a1 registerHandler:];
}

id objc_msgSend_registerNotificationBlock_(void *a1, const char *a2, ...)
{
  return [a1 registerNotificationBlock:];
}

id objc_msgSend_registerWatchdog(void *a1, const char *a2, ...)
{
  return _[a1 registerWatchdog];
}

id objc_msgSend_relativeToTopLeftOfSuper_(void *a1, const char *a2, ...)
{
  return [a1 relativeToTopLeftOfSuper:self];
}

id objc_msgSend_remoteContextWithOptions_(void *a1, const char *a2, ...)
{
  return [a1 remoteContextWithOptions:];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return _[a1 remoteObjectProxy];
}

id objc_msgSend_remoteProcess(void *a1, const char *a2, ...)
{
  return _[a1 remoteProcess];
}

id objc_msgSend_remoteTarget(void *a1, const char *a2, ...)
{
  return _[a1 remoteTarget];
}

id objc_msgSend_removeAllAnimations(void *a1, const char *a2, ...)
{
  return _[a1 removeAllAnimations];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeAnnotationsForKeyPath_(void *a1, const char *a2, ...)
{
  return [a1 removeAnnotationsForKeyPath:];
}

id objc_msgSend_removeAnnotationsForKeyPath_afterDelay_queue_(void *a1, const char *a2, ...)
{
  return [a1 removeAnnotationsForKeyPath:nil afterDelay:0.0 queue:nil];
}

id objc_msgSend_removeClone_(void *a1, const char *a2, ...)
{
  return [a1 removeClone:];
}

id objc_msgSend_removeDisplay_(void *a1, const char *a2, ...)
{
  return [a1 removeDisplay];
}

id objc_msgSend_removeFromSuperlayer(void *a1, const char *a2, ...)
{
  return _[a1 removeFromSuperlayer];
}

id objc_msgSend_removeIndex_(void *a1, const char *a2, ...)
{
  return [a1 removeIndex:];
}

id objc_msgSend_removeIndexes_(void *a1, const char *a2, ...)
{
  return [a1 removeIndexes:];
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return [a1 removeItemAtPath:error:];
}

id objc_msgSend_removeMonitor_(void *a1, const char *a2, ...)
{
  return [a1 removeMonitor:];
}

id objc_msgSend_removeNodeAtKeyPath_(void *a1, const char *a2, ...)
{
  return [a1 removeNodeAtKeyPath:];
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return [a1 removeObject:];
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectAtIndex:];
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectForKey:];
}

id objc_msgSend_removeObjectIdenticalTo_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectIdenticalTo:];
}

id objc_msgSend_removeObjectsInArray_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectsInArray:];
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver];
}

id objc_msgSend_removeObserver_forKeyPath_(void *a1, const char *a2, ...)
{
  return [a1 removeObserverForKeyPath:nil];
}

id objc_msgSend_removeObserver_forKeyPath_context_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver:forKeyPath:context:];
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver:name:object:];
}

id objc_msgSend_removeOverlay_withAnimationSettings_(void *a1, const char *a2, ...)
{
  return [a1 removeOverlay:withAnimationSettings:];
}

id objc_msgSend_removeRecognizer_(void *a1, const char *a2, ...)
{
  return [a1 removeRecognizer:];
}

id objc_msgSend_removeService_(void *a1, const char *a2, ...)
{
  return [a1 removeService:];
}

id objc_msgSend_renderer(void *a1, const char *a2, ...)
{
  return _[a1 renderer];
}

id objc_msgSend_replacePointerAtIndex_withPointer_(void *a1, const char *a2, ...)
{
  return [a1 replacePointerAtIndex:withPointer:];
}

id objc_msgSend_repostFirstEventToBufferedTargets_(void *a1, const char *a2, ...)
{
  return [a1 repostFirstEventToBufferedTargets:];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return _[a1 reset];
}

id objc_msgSend_resetForCancel(void *a1, const char *a2, ...)
{
  return _[a1 resetForCancel];
}

id objc_msgSend_resetTimer_mode_(void *a1, const char *a2, ...)
{
  return [a1 resetTimer:mode:];
}

id objc_msgSend_responsePendingForConnection_(void *a1, const char *a2, ...)
{
  return [a1 responsePendingForConnection:];
}

id objc_msgSend_restoreSystemDisplayBrightness(void *a1, const char *a2, ...)
{
  return _[a1 restoreSystemDisplayBrightness];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 reverseObjectEnumerator];
}

id objc_msgSend_ringerState(void *a1, const char *a2, ...)
{
  return _[a1 ringerState];
}

id objc_msgSend_rootLayer(void *a1, const char *a2, ...)
{
  return _[a1 rootLayer];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return _[a1 run];
}

id objc_msgSend_saveOverlay_(void *a1, const char *a2, ...)
{
  return [a1 saveOverlay:];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return _[a1 scale];
}

id objc_msgSend_schedule(void *a1, const char *a2, ...)
{
  return _[a1 schedule];
}

id objc_msgSend_scheduleWithFireInterval_leewayInterval_queue_handler_(void *a1, const char *a2, ...)
{
  return [a1 scheduleWithFireInterval:leewayInterval:queue:handler:];
}

id objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(void *a1, const char *a2, ...)
{
  return [a1 scheduledTimerWithTimeInterval:0.0f target:nil selector:nil userInfo:nil repeats:NO];
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return _[a1 section];
}

id objc_msgSend_secureModeViolations(void *a1, const char *a2, ...)
{
  return _[a1 secureModeViolations];
}

id objc_msgSend_secureName(void *a1, const char *a2, ...)
{
  return _[a1 secureName];
}

id objc_msgSend_securityAnalysisFromCAHitTestDictionary_errorString_(void *a1, const char *a2, ...)
{
  return [a1 securityAnalysisFromCAHitTestDictionary:errorString:];
}

id objc_msgSend_selector(void *a1, const char *a2, ...)
{
  return _[a1 selector];
}

id objc_msgSend_sendActions_withResult_(void *a1, const char *a2, ...)
{
  return [a1 sendActions:withResult:];
}

id objc_msgSend_sendCancelEventForAllDisplays(void *a1, const char *a2, ...)
{
  return _[a1 sendCancelEventForAllDisplays];
}

id objc_msgSend_sendCancelEventForDisplay_(void *a1, const char *a2, ...)
{
  return [a1 sendCancelEventForDisplay:];
}

id objc_msgSend_sendEvent_toClientTaskPort_(void *a1, const char *a2, ...)
{
  return [a1 sendEvent:toClientTaskPort:];
}

id objc_msgSend_sendRight(void *a1, const char *a2, ...)
{
  return _[a1 sendRight];
}

id objc_msgSend_sendTouchUpdate_(void *a1, const char *a2, ...)
{
  return [a1 sendTouchUpdate:];
}

id objc_msgSend_senderCache(void *a1, const char *a2, ...)
{
  return _[a1 senderCache];
}

id objc_msgSend_senderDescriptor(void *a1, const char *a2, ...)
{
  return _[a1 senderDescriptor];
}

id objc_msgSend_senderDescriptorForEventType_(void *a1, const char *a2, ...)
{
  return [a1 senderDescriptorForEventType:];
}

id objc_msgSend_senderID(void *a1, const char *a2, ...)
{
  return _[a1 senderID];
}

id objc_msgSend_senderInfo(void *a1, const char *a2, ...)
{
  return _[a1 senderInfo];
}

id objc_msgSend_sensorsRequiredForOpenState(void *a1, const char *a2, ...)
{
  return _[a1 sensorsRequiredForOpenState];
}

id objc_msgSend_sequenceForFirstEvent_sender_processor_dispatcher_additionalContext_(void *a1, const char *a2, ...)
{
  return [a1 sequenceForFirstEvent:sender:processor:dispatcher:additionalContext:];
}

id objc_msgSend_sequenceForKeyCommand_sender_processor_dispatcher_additionalContext_(void *a1, const char *a2, ...)
{
  return [a1 sequenceForKeyCommand:sender:processor:dispatcher:additionalContext:];
}

id objc_msgSend_serial(void *a1, const char *a2, ...)
{
  return _[a1 serial];
}

id objc_msgSend_server(void *a1, const char *a2, ...)
{
  return _[a1 server];
}

id objc_msgSend_serverIfRunning(void *a1, const char *a2, ...)
{
  return _[a1 serverIfRunning];
}

id objc_msgSend_serverWithOptions_(void *a1, const char *a2, ...)
{
  return [a1 serverWithOptions:nil];
}

id objc_msgSend_serviceClass_(void *a1, const char *a2, ...)
{
  return [a1 serviceClass:];
}

id objc_msgSend_serviceMatcherDataProvider(void *a1, const char *a2, ...)
{
  return _[a1 serviceMatcherDataProvider];
}

id objc_msgSend_services(void *a1, const char *a2, ...)
{
  return _[a1 services];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setALSEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setALSEnabled:YES];
}

id objc_msgSend_setALSEpoch_(void *a1, const char *a2, ...)
{
  return [a1 setALSEpoch:];
}

id objc_msgSend_setALSUserPreferences_(void *a1, const char *a2, ...)
{
  return [a1 setALSUserPreferences:];
}

id objc_msgSend_setAccelerometerUpdateInterval_(void *a1, const char *a2, ...)
{
  return [a1 setAccelerometerUpdateInterval:];
}

id objc_msgSend_setActivationHandler_(void *a1, const char *a2, ...)
{
  return [a1 setActivationHandler:];
}

id objc_msgSend_setActive_(void *a1, const char *a2, ...)
{
  return [a1 setActive:YES];
}

id objc_msgSend_setActiveAlternateSystemAppBundleIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setActiveAlternateSystemAppBundleIdentifier:];
}

id objc_msgSend_setActiveModifiers_(void *a1, const char *a2, ...)
{
  return [a1 setActiveModifiers:];
}

id objc_msgSend_setAffineTransform_(void *a1, const char *a2, ...)
{
  return [a1 setAffineTransform:];
}

id objc_msgSend_setAlternateSystemApp_(void *a1, const char *a2, ...)
{
  return [a1 setAlternateSystemApp:];
}

id objc_msgSend_setAlternateSystemAppManager_(void *a1, const char *a2, ...)
{
  return [a1 setAlternateSystemAppManager:];
}

id objc_msgSend_setAnchorPoint_(void *a1, const char *a2, ...)
{
  return [a1 setAnchorPoint:];
}

id objc_msgSend_setAnimates_(void *a1, const char *a2, ...)
{
  return [a1 setAnimates:YES];
}

id objc_msgSend_setAnnotation_(void *a1, const char *a2, ...)
{
  return [a1 setAnnotation:];
}

id objc_msgSend_setAnnotation_forKeyPath_(void *a1, const char *a2, ...)
{
  return [a1 setAnnotation:forKeyPath:];
}

id objc_msgSend_setAnnotationController_(void *a1, const char *a2, ...)
{
  return [a1 setAnnotationController:];
}

id objc_msgSend_setAssociatedDisplay_(void *a1, const char *a2, ...)
{
  return [a1 setAssociatedDisplay:];
}

id objc_msgSend_setAttachedCoverRequiresWorkaroundForOpenState_(void *a1, const char *a2, ...)
{
  return [a1 setAttachedCoverRequiresWorkaroundForOpenState:];
}

id objc_msgSend_setAuthenticationMessage_(void *a1, const char *a2, ...)
{
  return [a1 setAuthenticationMessage:];
}

id objc_msgSend_setAutoBrightnessEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setAutoBrightnessEnabled:];
}

id objc_msgSend_setAutomaticResetDisabled_(void *a1, const char *a2, ...)
{
  return [a1 setAutomaticResetDisabled:YES];
}

id objc_msgSend_setBackground_(void *a1, const char *a2, ...)
{
  return [a1 setBackground:];
}

id objc_msgSend_setBackgroundAverage_(void *a1, const char *a2, ...)
{
  return [a1 setBackgroundAverage:];
}

id objc_msgSend_setBackgroundAverageContrastThreshold_(void *a1, const char *a2, ...)
{
  [a1 setBackgroundAverageContrastThreshold:];
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return [a1 setBackgroundColor:];
}

id objc_msgSend_setBackgroundStandardDeviation_(void *a1, const char *a2, ...)
{
  return [a1 setBackgroundStandardDeviation:];
}

id objc_msgSend_setBacklightFeatures_forPID_(void *a1, const char *a2, ...)
{
  return [a1 setBacklightFeatures:forPID:];
}

id objc_msgSend_setBacklightLocked_forReason_(void *a1, const char *a2, ...)
{
  return [a1 setBacklightLocked:forReason:];
}

id objc_msgSend_setBaseStyle_(void *a1, const char *a2, ...)
{
  return [a1 setBaseStyle:];
}

id objc_msgSend_setBeginTime_(void *a1, const char *a2, ...)
{
  return [a1 setBeginTime:];
}

id objc_msgSend_setBeginTimeMode_(void *a1, const char *a2, ...)
{
  return [a1 setBeginTimeMode:];
}

id objc_msgSend_setBlanked_(void *a1, const char *a2, ...)
{
  return [a1 setBlanked:YES];
}

id objc_msgSend_setBounds_(void *a1, const char *a2, ...)
{
  return [a1 setBounds:];
}

id objc_msgSend_setBrightness_(void *a1, const char *a2, ...)
{
  return [a1 setBrightness:];
}

id objc_msgSend_setBrightnessCurve_(void *a1, const char *a2, ...)
{
  return [a1 setBrightnessCurve:];
}

id objc_msgSend_setBrightnessLevel_reason_options_(void *a1, const char *a2, ...)
{
  return [a1 setBrightnessLevel:reason:options:];
}

id objc_msgSend_setBuiltInDisplayInterfaceOrientation_(void *a1, const char *a2, ...)
{
  return [a1 setBuiltInDisplayInterfaceOrientation:];
}

id objc_msgSend_setBundleID_(void *a1, const char *a2, ...)
{
  return [a1 setBundleID:];
}

id objc_msgSend_setBundleIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setBundleIdentifier:];
}

id objc_msgSend_setBundlePath_(void *a1, const char *a2, ...)
{
  return [a1 setBundlePath:];
}

id objc_msgSend_setCalculationMode_(void *a1, const char *a2, ...)
{
  return [a1 setCalculationMode:];
}

id objc_msgSend_setCapsLockActive_onSenderID_(void *a1, const char *a2, ...)
{
  return [a1 setCapsLockActive:YES onSenderID:nil];
}

id objc_msgSend_setCapsLockDelayOverride_(void *a1, const char *a2, ...)
{
  return [a1 setCapsLockDelayOverride:];
}

id objc_msgSend_setCapsLockDelayOverride_forSenderID_(void *a1, const char *a2, ...)
{
  return [a1 setCapsLockDelayOverride:forSenderID:];
}

id objc_msgSend_setCapsLockKeyHasLanguageSwitchLabel_(void *a1, const char *a2, ...)
{
  return [a1 setCapsLockKeyHasLanguageSwitchLabel:YES];
}

id objc_msgSend_setCapsLockLightOn_(void *a1, const char *a2, ...)
{
  return [a1 setCapsLockLightOn:YES];
}

id objc_msgSend_setClient_(void *a1, const char *a2, ...)
{
  return [a1 setClient:];
}

id objc_msgSend_setClientConnection_(void *a1, const char *a2, ...)
{
  return [a1 setClientConnection:];
}

id objc_msgSend_setConnectedKeyboards_withReply_(void *a1, const char *a2, ...)
{
  return [a1 setConnectedKeyboards:withReply:];
}

id objc_msgSend_setContent_(void *a1, const char *a2, ...)
{
  return [a1 setContent:];
}

id objc_msgSend_setContents_(void *a1, const char *a2, ...)
{
  return [a1 setContents:];
}

id objc_msgSend_setContentsFormat_(void *a1, const char *a2, ...)
{
  return [a1 setContentsFormat:];
}

id objc_msgSend_setContentsScale_(void *a1, const char *a2, ...)
{
  return [a1 setContentsScale:];
}

id objc_msgSend_setContext_(void *a1, const char *a2, ...)
{
  return [a1 setContext:];
}

id objc_msgSend_setContextID_(void *a1, const char *a2, ...)
{
  return [a1 setContextID:];
}

id objc_msgSend_setCount_(void *a1, const char *a2, ...)
{
  return [a1 setCount:];
}

id objc_msgSend_setCountryCode_(void *a1, const char *a2, ...)
{
  return [a1 setCountryCode:];
}

id objc_msgSend_setCumulativeContentsTransform_(void *a1, const char *a2, ...)
{
  return [a1 setCumulativeContentsTransform:];
}

id objc_msgSend_setCumulativeLayerTransform_(void *a1, const char *a2, ...)
{
  return [a1 setCumulativeLayerTransform:];
}

id objc_msgSend_setCumulativeOpacity_(void *a1, const char *a2, ...)
{
  return [a1 setCumulativeOpacity:];
}

id objc_msgSend_setCurrentDestinations_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentDestinations:];
}

id objc_msgSend_setDeactivationHandler_(void *a1, const char *a2, ...)
{
  return [a1 setDeactivationHandler:];
}

id objc_msgSend_setDeathWatcher_(void *a1, const char *a2, ...)
{
  return [a1 setDeathWatcher:];
}

id objc_msgSend_setDefinedInReferenceSpace_(void *a1, const char *a2, ...)
{
  return [a1 setDefinedInReferenceSpace:];
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setDelegate:];
}

id objc_msgSend_setDescriptor_(void *a1, const char *a2, ...)
{
  return [a1 setDescriptor:];
}

id objc_msgSend_setDetectedOcclusion_(void *a1, const char *a2, ...)
{
  return [a1 setDetectedOcclusion:];
}

id objc_msgSend_setDetectionMask_(void *a1, const char *a2, ...)
{
  return [a1 setDetectionMask:];
}

id objc_msgSend_setDigitizerSurfaceSize_(void *a1, const char *a2, ...)
{
  return [a1 setDigitizerSurfaceSize:];
}

id objc_msgSend_setDisableActions_(void *a1, const char *a2, ...)
{
  return [a1 setDisableActions:YES];
}

id objc_msgSend_setDisableUpdateMask_(void *a1, const char *a2, ...)
{
  return [a1 setDisableUpdateMask:];
}

id objc_msgSend_setDisabled_(void *a1, const char *a2, ...)
{
  return [a1 setDisabled:];
}

id objc_msgSend_setDisablesUpdates_(void *a1, const char *a2, ...)
{
  return [a1 setDisablesUpdates:];
}

id objc_msgSend_setDisplay_(void *a1, const char *a2, ...)
{
  return [a1 setDisplay:];
}

id objc_msgSend_setDisplayBrightness_permanently_(void *a1, const char *a2, ...)
{
  return [a1 setDisplayBrightness:permanently:];
}

id objc_msgSend_setDisplayBrightnessCurve_(void *a1, const char *a2, ...)
{
  return [a1 setDisplayBrightnessCurve:];
}

id objc_msgSend_setDitheringEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setDitheringEnabled:YES];
}

id objc_msgSend_setDomain_(void *a1, const char *a2, ...)
{
  return [a1 setDomain:];
}

id objc_msgSend_setDuration_(void *a1, const char *a2, ...)
{
  return [a1 setDuration:];
}

id objc_msgSend_setElementValue_forUsagePage_usage_(void *a1, const char *a2, ...)
{
  return [a1 setElementValue:forUsagePage:usage:];
}

id objc_msgSend_setEntitlementCache_(void *a1, const char *a2, ...)
{
  return [a1 setEntitlementCache:];
}

id objc_msgSend_setEnvironment_(void *a1, const char *a2, ...)
{
  return [a1 setEnvironment:];
}

id objc_msgSend_setEventDestination_forDisplayUUID_(void *a1, const char *a2, ...)
{
  return [a1 setEventDestination:forDisplayUUID:];
}

id objc_msgSend_setEventDispatchMode_ambiguityRecommendation_lastTouchTimestamp_forTouchStreamIdentifier_( void *a1, const char *a2, ...)
{
  return [a1 setEventDispatchMode:ambiguityRecommendation:lastTouchTimestamp:forTouchStreamIdentifier:];
}

id objc_msgSend_setEventDispatcher_(void *a1, const char *a2, ...)
{
  return [a1 setEventDispatcher:];
}

id objc_msgSend_setEventProcessorRegistry_(void *a1, const char *a2, ...)
{
  return [a1 setEventProcessorRegistry:];
}

id objc_msgSend_setEventType_(void *a1, const char *a2, ...)
{
  return [a1 setEventType:];
}

id objc_msgSend_setExcludedZoomContextIDs_fromVersionedPID_(void *a1, const char *a2, ...)
{
  return [a1 setExcludedZoomContextIDs:fromVersionedPID:];
}

id objc_msgSend_setExclusivityIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setExclusivityIdentifier:];
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return [a1 setExportedInterface:];
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return [a1 setExportedObject:];
}

id objc_msgSend_setExternal_(void *a1, const char *a2, ...)
{
  return [a1 setExternal:];
}

id objc_msgSend_setFillColor_(void *a1, const char *a2, ...)
{
  return [a1 setFillColor:];
}

id objc_msgSend_setFillMode_(void *a1, const char *a2, ...)
{
  return [a1 setFillMode:];
}

id objc_msgSend_setFlipBookEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setFlipBookEnabled:YES];
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return [a1 setFont:];
}

id objc_msgSend_setFontSize_(void *a1, const char *a2, ...)
{
  return [a1 setFontSize:];
}

id objc_msgSend_setForceDemoMaxHBI_(void *a1, const char *a2, ...)
{
  return [a1 setForceDemoMaxHBI:];
}

id objc_msgSend_setForegroundColor_(void *a1, const char *a2, ...)
{
  return [a1 setForegroundColor:];
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return [a1 setFrame:CGRectMake(0, 0, 0, 0)];
}

id objc_msgSend_setFromValue_(void *a1, const char *a2, ...)
{
  return [a1 setFromValue:];
}

id objc_msgSend_setFrozen_(void *a1, const char *a2, ...)
{
  return [a1 setFrozen:YES];
}

id objc_msgSend_setGSModifierState_(void *a1, const char *a2, ...)
{
  return [a1 setGSModifierState:];
}

id objc_msgSend_setGlobeKeyLabelHasGlobeSymbol_(void *a1, const char *a2, ...)
{
  return [a1 setGlobeKeyLabelHasGlobeSymbol:YES];
}

id objc_msgSend_setHasInsecureFilter_(void *a1, const char *a2, ...)
{
  return [a1 setHasInsecureFilter:YES];
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return [a1 setHidden:YES];
}

id objc_msgSend_setHideAppleLogoOnLaunch_(void *a1, const char *a2, ...)
{
  return [a1 setHideAppleLogoOnLaunch:];
}

id objc_msgSend_setHitTestContextCategory_(void *a1, const char *a2, ...)
{
  return [a1 setHitTestContextCategory:];
}

id objc_msgSend_setHitTestInformationFromEndEvent_(void *a1, const char *a2, ...)
{
  return [a1 setHitTestInformationFromEndEvent:];
}

id objc_msgSend_setHitTestInformationFromStartEvent_(void *a1, const char *a2, ...)
{
  return [a1 setHitTestInformationFromStartEvent:];
}

id objc_msgSend_setHitTestLocation_(void *a1, const char *a2, ...)
{
  return [a1 setHitTestLocation:];
}

id objc_msgSend_setHitTestRegions_forDisplay_(void *a1, const char *a2, ...)
{
  return [a1 setHitTestRegions:forDisplay:];
}

id objc_msgSend_setHumanIsPresent_(void *a1, const char *a2, ...)
{
  return [a1 setHumanIsPresent:YES];
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return [a1 setImage:];
}

id objc_msgSend_setInitialTouchTimestamp_(void *a1, const char *a2, ...)
{
  return [a1 setInitialTouchTimestamp:];
}

id objc_msgSend_setInterface_(void *a1, const char *a2, ...)
{
  return [a1 setInterface:];
}

id objc_msgSend_setInterfaceTarget_(void *a1, const char *a2, ...)
{
  return [a1 setInterfaceTarget:];
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return [a1 setInterruptionHandler:];
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return [a1 setInvalidationHandler:];
}

id objc_msgSend_setIsDetached_(void *a1, const char *a2, ...)
{
  return [a1 setIsDetached:YES];
}

id objc_msgSend_setJobLabel_(void *a1, const char *a2, ...)
{
  return [a1 setJobLabel:];
}

id objc_msgSend_setKeyCommandsToAuthenticate_(void *a1, const char *a2, ...)
{
  return [a1 setKeyCommandsToAuthenticate:];
}

id objc_msgSend_setKeyPath_(void *a1, const char *a2, ...)
{
  return [a1 setKeyPath:];
}

id objc_msgSend_setKeyboardLayout_(void *a1, const char *a2, ...)
{
  return [a1 setKeyboardLayout:];
}

id objc_msgSend_setKeyboardLayout_forSenderID_(void *a1, const char *a2, ...)
{
  return [a1 setKeyboardLayout:forSenderID:];
}

id objc_msgSend_setKeyboardTypeRemap_(void *a1, const char *a2, ...)
{
  return [a1 setKeyboardTypeRemap:];
}

id objc_msgSend_setLabel_(void *a1, const char *a2, ...)
{
  return [a1 setLabel:];
}

id objc_msgSend_setLanguage_(void *a1, const char *a2, ...)
{
  return [a1 setLanguage:];
}

id objc_msgSend_setLayer_(void *a1, const char *a2, ...)
{
  return [a1 setLayer:];
}

id objc_msgSend_setLayerNamesByContext_(void *a1, const char *a2, ...)
{
  return [a1 setLayerNamesByContext:];
}

id objc_msgSend_setLayout_(void *a1, const char *a2, ...)
{
  return [a1 setLayout:];
}

id objc_msgSend_setLevel_(void *a1, const char *a2, ...)
{
  return [a1 setLevel:];
}

id objc_msgSend_setLineDashPattern_(void *a1, const char *a2, ...)
{
  return [a1 setLineDashPattern:];
}

id objc_msgSend_setLineWidth_(void *a1, const char *a2, ...)
{
  return [a1 setLineWidth:];
}

id objc_msgSend_setLocation_(void *a1, const char *a2, ...)
{
  return [a1 setLocation:];
}

id objc_msgSend_setLockBacklight_(void *a1, const char *a2, ...)
{
  return [a1 setLockBacklight:YES];
}

id objc_msgSend_setLocus_(void *a1, const char *a2, ...)
{
  return [a1 setLocus:];
}

id objc_msgSend_setLog_(void *a1, const char *a2, ...)
{
  return [a1 setLog:];
}

id objc_msgSend_setMaximumForce_(void *a1, const char *a2, ...)
{
  return [a1 setMaximumForce:];
}

id objc_msgSend_setMaximumPositionZ_(void *a1, const char *a2, ...)
{
  return [a1 setMaximumPositionZ:];
}

id objc_msgSend_setMaximumTerminationResistance_(void *a1, const char *a2, ...)
{
  return [a1 setMaximumTerminationResistance:];
}

id objc_msgSend_setMinimumBrightnessLevel_fadeDuration_(void *a1, const char *a2, ...)
{
  return [a1 setMinimumBrightnessLevel:fadeDuration:];
}

id objc_msgSend_setMode_(void *a1, const char *a2, ...)
{
  return [a1 setMode:];
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return [a1 setName:];
}

id objc_msgSend_setNamespaceNode_(void *a1, const char *a2, ...)
{
  return [a1 setNamespaceNode:];
}

id objc_msgSend_setNativeRotation_(void *a1, const char *a2, ...)
{
  return [a1 setNativeRotation:];
}

id objc_msgSend_setNeedsDisplay(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsDisplay];
}

id objc_msgSend_setNeedsLogging_(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLogging:YES];
}

id objc_msgSend_setNormalizedDigitizerRect_(void *a1, const char *a2, ...)
{
  return [a1 setNormalizedDigitizerRect:];
}

id objc_msgSend_setObject_(void *a1, const char *a2, ...)
{
  return [a1 setObject:];
}

id objc_msgSend_setObject_atKeyPath_(void *a1, const char *a2, ...)
{
  return [a1 setObject:atKeyPath:];
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKey:];
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKeyedSubscript:];
}

id objc_msgSend_setOffset_forTouchesWithUserIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setOffset:forTouchesWithUserIdentifier:];
}

id objc_msgSend_setOpacity_(void *a1, const char *a2, ...)
{
  return [a1 setOpacity:];
}

id objc_msgSend_setOpenBundleId_(void *a1, const char *a2, ...)
{
  return [a1 setOpenBundleId:];
}

id objc_msgSend_setOptions_(void *a1, const char *a2, ...)
{
  return [a1 setOptions:];
}

id objc_msgSend_setOrientation_(void *a1, const char *a2, ...)
{
  return [a1 setOrientation:];
}

id objc_msgSend_setOrientationNotificationDisabled_(void *a1, const char *a2, ...)
{
  return [a1 setOrientationNotificationDisabled:YES];
}

id objc_msgSend_setOriginIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setOriginIdentifier:];
}

id objc_msgSend_setOverlayType_(void *a1, const char *a2, ...)
{
  return [a1 setOverlayType:];
}

id objc_msgSend_setOverrideSenderDescriptor_(void *a1, const char *a2, ...)
{
  return [a1 setOverrideSenderDescriptor:];
}

id objc_msgSend_setPassiveOrientationEvents_(void *a1, const char *a2, ...)
{
  return [a1 setPassiveOrientationEvents:YES];
}

id objc_msgSend_setPath_(void *a1, const char *a2, ...)
{
  return [a1 setPath:];
}

id objc_msgSend_setPathAttributes_(void *a1, const char *a2, ...)
{
  return [a1 setPathAttributes:];
}

id objc_msgSend_setPathIndex_(void *a1, const char *a2, ...)
{
  return [a1 setPathIndex:];
}

id objc_msgSend_setPathIndexInRangeMask_(void *a1, const char *a2, ...)
{
  return [a1 setPathIndexInRangeMask:];
}

id objc_msgSend_setPathIndexTouchingMask_(void *a1, const char *a2, ...)
{
  return [a1 setPathIndexTouchingMask:];
}

id objc_msgSend_setPersistentProperties_forSenderDescriptor_(void *a1, const char *a2, ...)
{
  return [a1 setPersistentProperties:forSenderDescriptor:];
}

id objc_msgSend_setPid_(void *a1, const char *a2, ...)
{
  return [a1 setPid:];
}

id objc_msgSend_setPoint_(void *a1, const char *a2, ...)
{
  return [a1 setPoint:];
}

id objc_msgSend_setPosition_(void *a1, const char *a2, ...)
{
  return [a1 setPosition:];
}

id objc_msgSend_setPreciseLocation_(void *a1, const char *a2, ...)
{
  return [a1 setPreciseLocation:YES];
}

id objc_msgSend_setProcessDescription_(void *a1, const char *a2, ...)
{
  return [a1 setProcessDescription:];
}

id objc_msgSend_setProcessId_(void *a1, const char *a2, ...)
{
  return [a1 setProcessId:];
}

id objc_msgSend_setProgressIndicatorProperties_(void *a1, const char *a2, ...)
{
  return [a1 setProgressIndicatorProperties:];
}

id objc_msgSend_setProperties_(void *a1, const char *a2, ...)
{
  return [a1 setProperties:];
}

id objc_msgSend_setProperty_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setProperty:forKey:];
}

id objc_msgSend_setProximityDetectionMode_(void *a1, const char *a2, ...)
{
  return [a1 setProximityDetectionMode:];
}

id objc_msgSend_setProximityInCentimeters_(void *a1, const char *a2, ...)
{
  return [a1 setProximityInCentimeters:];
}

id objc_msgSend_setQueue_(void *a1, const char *a2, ...)
{
  return [a1 setQueue:];
}

id objc_msgSend_setRasterizationScale_(void *a1, const char *a2, ...)
{
  return [a1 setRasterizationScale:];
}

id objc_msgSend_setRegistrantEntitled_(void *a1, const char *a2, ...)
{
  return [a1 setRegistrantEntitled:];
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return [a1 setRemoteObjectInterface:];
}

id objc_msgSend_setRenderer_(void *a1, const char *a2, ...)
{
  return [a1 setRenderer:];
}

id objc_msgSend_setRendererFlags_(void *a1, const char *a2, ...)
{
  return [a1 setRendererFlags:];
}

id objc_msgSend_setRepeatCount_(void *a1, const char *a2, ...)
{
  return [a1 setRepeatCount:];
}

id objc_msgSend_setReportType_(void *a1, const char *a2, ...)
{
  return [a1 setReportType:];
}

id objc_msgSend_setResourceValue_forKey_error_(void *a1, const char *a2, ...)
{
  return [a1 setResourceValue:forKey:error:];
}

id objc_msgSend_setRomanCapsLockSwitchModeActive_(void *a1, const char *a2, ...)
{
  return [a1 setRomanCapsLockSwitchModeActive:YES];
}

id objc_msgSend_setRomanCapsLockSwitchModeActive_forSenderID_(void *a1, const char *a2, ...)
{
  return [a1 setRomanCapsLockSwitchModeActive:forSenderID:];
}

id objc_msgSend_setRoutingPolicy_forTouchesWithUserIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setRoutingPolicy:forTouchesWithUserIdentifier:];
}

id objc_msgSend_setScale_(void *a1, const char *a2, ...)
{
  return [a1 setScale:];
}

id objc_msgSend_setScanningActive_buttonIdentifier_forPID_(void *a1, const char *a2, ...)
{
  return [a1 setScanningActive:v2 buttonIdentifier:v3 forPID:v4];
}

id objc_msgSend_setSceneHostSettings_(void *a1, const char *a2, ...)
{
  return [a1 setSceneHostSettings:];
}

id objc_msgSend_setSceneTouchBehavior_(void *a1, const char *a2, ...)
{
  return [a1 setSceneTouchBehavior:];
}

id objc_msgSend_setSection_(void *a1, const char *a2, ...)
{
  return [a1 setSection:];
}

id objc_msgSend_setSecure_(void *a1, const char *a2, ...)
{
  return [a1 setSecure:];
}

id objc_msgSend_setSecureModeEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setSecureModeEnabled:YES];
}

id objc_msgSend_setSecureNameStatus_(void *a1, const char *a2, ...)
{
  return [a1 setSecureNameStatus:];
}

id objc_msgSend_setSecurityAnalysis_(void *a1, const char *a2, ...)
{
  return [a1 setSecurityAnalysis:];
}

id objc_msgSend_setSenderID_(void *a1, const char *a2, ...)
{
  return [a1 setSenderID:];
}

id objc_msgSend_setServer_(void *a1, const char *a2, ...)
{
  return [a1 setServer:];
}

id objc_msgSend_setService_(void *a1, const char *a2, ...)
{
  return [a1 setService:];
}

id objc_msgSend_setService_forAlias_(void *a1, const char *a2, ...)
{
  return [a1 setService:forAlias:];
}

id objc_msgSend_setServiceMatcherDataProvider_(void *a1, const char *a2, ...)
{
  return [a1 setServiceMatcherDataProvider:];
}

id objc_msgSend_setServiceQuality_(void *a1, const char *a2, ...)
{
  return [a1 setServiceQuality:];
}

id objc_msgSend_setShapeSize_(void *a1, const char *a2, ...)
{
  return [a1 setShapeSize:];
}

id objc_msgSend_setShouldAutoposition_(void *a1, const char *a2, ...)
{
  return [a1 setShouldAutoposition:YES];
}

id objc_msgSend_setShouldConsumeEvents_(void *a1, const char *a2, ...)
{
  return [a1 setShouldConsumeEvents:YES];
}

id objc_msgSend_setShouldSuppressTouchesWhileObjectWithinProximity_(void *a1, const char *a2, ...)
{
  return [a1 setShouldSuppressTouchesWhileObjectWithinProximity:];
}

id objc_msgSend_setShouldVisualizeHitTestRegions_(void *a1, const char *a2, ...)
{
  return [a1 setShouldVisualizeHitTestRegions:];
}

id objc_msgSend_setShouldVisualizeTouches_(void *a1, const char *a2, ...)
{
  return [a1 setShouldVisualizeTouches:YES];
}

id objc_msgSend_setSize_(void *a1, const char *a2, ...)
{
  return [a1 setSize:];
}

id objc_msgSend_setSlotDeletionCallback_(void *a1, const char *a2, ...)
{
  return [a1 setSlotDeletionCallback:];
}

id objc_msgSend_setSource_(void *a1, const char *a2, ...)
{
  return [a1 setSource:];
}

id objc_msgSend_setSpawnType_(void *a1, const char *a2, ...)
{
  return [a1 setSpawnType:];
}

id objc_msgSend_setStandardType_(void *a1, const char *a2, ...)
{
  return [a1 setStandardType:];
}

id objc_msgSend_setStandardType_forSenderID_(void *a1, const char *a2, ...)
{
  return [a1 setStandardType:forSenderID:];
}

id objc_msgSend_setStatistics_(void *a1, const char *a2, ...)
{
  return [a1 setStatistics:];
}

id objc_msgSend_setString_(void *a1, const char *a2, ...)
{
  return [a1 setString:@""];
}

id objc_msgSend_setStrokeColor_(void *a1, const char *a2, ...)
{
  return [a1 setStrokeColor:];
}

id objc_msgSend_setStyleModifier_(void *a1, const char *a2, ...)
{
  return [a1 setStyleModifier:];
}

id objc_msgSend_setStyleSheet_(void *a1, const char *a2, ...)
{
  return [a1 setStyleSheet:];
}

id objc_msgSend_setSubinterfaceID_(void *a1, const char *a2, ...)
{
  return [a1 setSubinterfaceID:];
}

id objc_msgSend_setSubnodeScreenEdgeTreatment_(void *a1, const char *a2, ...)
{
  return [a1 setSubnodeScreenEdgeTreatment:];
}

id objc_msgSend_setSuperBias_(void *a1, const char *a2, ...)
{
  return [a1 setSuperBias:];
}

id objc_msgSend_setSystemGestureStateChange_(void *a1, const char *a2, ...)
{
  return [a1 setSystemGestureStateChange:];
}

id objc_msgSend_setSystemGesturesPossible_(void *a1, const char *a2, ...)
{
  return [a1 setSystemGesturesPossible:YES];
}

id objc_msgSend_setSystemIdentifiers_(void *a1, const char *a2, ...)
{
  return [a1 setSystemIdentifiers:];
}

id objc_msgSend_setSystemIdleSleepInterval_(void *a1, const char *a2, ...)
{
  return [a1 setSystemIdleSleepInterval:];
}

id objc_msgSend_setSystemInterface_(void *a1, const char *a2, ...)
{
  return [a1 setSystemInterface:];
}

id objc_msgSend_setTag_(void *a1, const char *a2, ...)
{
  return [a1 setTag:];
}

id objc_msgSend_setTargetContextID_(void *a1, const char *a2, ...)
{
  return [a1 setTargetContextID:];
}

id objc_msgSend_setTargetQueue_(void *a1, const char *a2, ...)
{
  return [a1 setTargetQueue:];
}

id objc_msgSend_setTargetSlotID_(void *a1, const char *a2, ...)
{
  return [a1 setTargetSlotID:];
}

id objc_msgSend_setTimestamp_(void *a1, const char *a2, ...)
{
  return [a1 setTimestamp:];
}

id objc_msgSend_setToValue_(void *a1, const char *a2, ...)
{
  return [a1 setToValue:];
}

id objc_msgSend_setToken_(void *a1, const char *a2, ...)
{
  return [a1 setToken:];
}

id objc_msgSend_setTouchIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setTouchIdentifier:];
}

id objc_msgSend_setTouchStreamIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setTouchStreamIdentifier:];
}

id objc_msgSend_setTransform_(void *a1, const char *a2, ...)
{
  return [a1 setTransform:];
}

id objc_msgSend_setTransport_(void *a1, const char *a2, ...)
{
  return [a1 setTransport:];
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return [a1 setType:];
}

id objc_msgSend_setUnderlyingQueue_(void *a1, const char *a2, ...)
{
  return [a1 setUnderlyingQueue:];
}

id objc_msgSend_setUserIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setUserIdentifier:];
}

id objc_msgSend_setUserInfo_forConnection_(void *a1, const char *a2, ...)
{
  return [a1 setUserInfo:forConnection:];
}

id objc_msgSend_setValidMask_(void *a1, const char *a2, ...)
{
  return [a1 setValidMask:];
}

id objc_msgSend_setValues_(void *a1, const char *a2, ...)
{
  return [a1 setValues:];
}

id objc_msgSend_setVersionedPID_(void *a1, const char *a2, ...)
{
  return [a1 setVersionedPID:];
}

id objc_msgSend_setVisible_(void *a1, const char *a2, ...)
{
  return [a1 setVisible:YES];
}

id objc_msgSend_setWantsAccelerometerEvents_(void *a1, const char *a2, ...)
{
  return [a1 setWantsAccelerometerEvents:YES];
}

id objc_msgSend_setWantsOrientationEvents_(void *a1, const char *a2, ...)
{
  return [a1 setWantsOrientationEvents:YES];
}

id objc_msgSend_setWatchdogType_(void *a1, const char *a2, ...)
{
  return [a1 setWatchdogType:];
}

id objc_msgSend_setWifiInterfaceName_(void *a1, const char *a2, ...)
{
  return [a1 setWifiInterfaceName:];
}

id objc_msgSend_setWindowServerDisplay_(void *a1, const char *a2, ...)
{
  return [a1 setWindowServerDisplay:];
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return [a1 setWithArray:];
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return [a1 setWithObject:];
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return [a1 setWithObjects:];
}

id objc_msgSend_setWithSet_(void *a1, const char *a2, ...)
{
  return [a1 setWithSet:];
}

id objc_msgSend_setXThreshold_(void *a1, const char *a2, ...)
{
  return [a1 setXThreshold:];
}

id objc_msgSend_setYThreshold_(void *a1, const char *a2, ...)
{
  return [a1 setYThreshold:];
}

id objc_msgSend_setZGradient_(void *a1, const char *a2, ...)
{
  return [a1 setZGradient:];
}

id objc_msgSend_setZThreshold_(void *a1, const char *a2, ...)
{
  return [a1 setZThreshold:];
}

id objc_msgSend_shapeSize(void *a1, const char *a2, ...)
{
  return _[a1 shapeSize];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedInstances(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstances];
}

id objc_msgSend_sharedServer(void *a1, const char *a2, ...)
{
  return _[a1 sharedServer];
}

id objc_msgSend_shouldAutoposition(void *a1, const char *a2, ...)
{
  return _[a1 shouldAutoposition];
}

id objc_msgSend_shouldAvoidHitTesting(void *a1, const char *a2, ...)
{
  return _[a1 shouldAvoidHitTesting];
}

id objc_msgSend_shouldCancelTouchesDeliveredToContextId_withInitialTouchTimestamp_(void *a1, const char *a2, ...)
{
  return [a1 shouldCancelTouchesDeliveredToContextId:withInitialTouchTimestamp:];
}

id objc_msgSend_shouldCreateStudyLogger(void *a1, const char *a2, ...)
{
  return _[a1 shouldCreateStudyLogger];
}

id objc_msgSend_shouldIgnoreTouchesWhileObjectInProximity(void *a1, const char *a2, ...)
{
  return _[a1 shouldIgnoreTouchesWhileObjectInProximity];
}

id objc_msgSend_shouldRenderWithSupernode(void *a1, const char *a2, ...)
{
  return _[a1 shouldRenderWithSupernode];
}

id objc_msgSend_shouldVisualizeHitTestRegions(void *a1, const char *a2, ...)
{
  return _[a1 shouldVisualizeHitTestRegions];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return _[a1 size];
}

id objc_msgSend_sizeLayer_toFitAtScale_(void *a1, const char *a2, ...)
{
  return [a1 sizeLayer:toFitAtScale:];
}

id objc_msgSend_sizeLayerToFitAtScale_(void *a1, const char *a2, ...)
{
  return [a1 sizeLayerToFitAtScale:];
}

id objc_msgSend_slotID(void *a1, const char *a2, ...)
{
  return _[a1 slotID];
}

id objc_msgSend_smartCoverStateDidChange_(void *a1, const char *a2, ...)
{
  return [a1 smartCoverStateDidChange:];
}

id objc_msgSend_smartKeyboardAttachmentStateDidChange_(void *a1, const char *a2, ...)
{
  return [a1 smartKeyboardAttachmentStateDidChange:];
}

id objc_msgSend_sortUsingComparator_(void *a1, const char *a2, ...)
{
  return [a1 sortUsingComparator:];
}

id objc_msgSend_springBoardDefaults(void *a1, const char *a2, ...)
{
  return _[a1 springBoardDefaults];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _[a1 start];
}

id objc_msgSend_startDeviceOrientationUpdatesToQueue_withHandler_(void *a1, const char *a2, ...)
{
  return [a1 startDeviceOrientationUpdatesToQueue:withHandler:];
}

id objc_msgSend_startEventProcessor_mainDisplayObserver_deliveryManager_dispatcherProvider_( void *a1, const char *a2, ...)
{
  return [a1 startEventProcessor:nil mainDisplayObserver:nil deliveryManager:nil dispatcherProvider:nil];
}

id objc_msgSend_startMonitoringSecureDrawing(void *a1, const char *a2, ...)
{
  return _[a1 startMonitoringSecureDrawing];
}

id objc_msgSend_startObserving_queue_(void *a1, const char *a2, ...)
{
  return [a1 startObserving:nil queue:nil];
}

id objc_msgSend_startServerWithChannel_(void *a1, const char *a2, ...)
{
  return [a1 startServerWithChannel:];
}

id objc_msgSend_startServerWithDataMigration(void *a1, const char *a2, ...)
{
  return _[a1 startServerWithDataMigration];
}

id objc_msgSend_startServerWithoutDataMigration(void *a1, const char *a2, ...)
{
  return _[a1 startServerWithoutDataMigration];
}

id objc_msgSend_statisticWithLabel_(void *a1, const char *a2, ...)
{
  return [a1 statisticWithLabel:];
}

id objc_msgSend_statisticWithLabel_hexFormatModifier_(void *a1, const char *a2, ...)
{
  return [a1 statisticWithLabel:hexFormatModifier:];
}

id objc_msgSend_statisticWithLabel_scale_(void *a1, const char *a2, ...)
{
  return [a1 statisticWithLabel:scale:];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return _[a1 status];
}

id objc_msgSend_stopDeviceOrientationUpdates(void *a1, const char *a2, ...)
{
  return _[a1 stopDeviceOrientationUpdates];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return _[a1 string];
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringByAppendingFormat:];
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return [a1 stringByAppendingPathComponent:];
}

id objc_msgSend_stringByAppendingPathExtension_(void *a1, const char *a2, ...)
{
  return [a1 stringByAppendingPathExtension:];
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return [a1 stringByAppendingString:];
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return _[a1 stringByDeletingPathExtension];
}

id objc_msgSend_stringByExpandingTildeInPath(void *a1, const char *a2, ...)
{
  return _[a1 stringByExpandingTildeInPath];
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return [a1 stringByReplacingOccurrencesOfString:withString:];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringWithFormat:];
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return [a1 stringWithUTF8String:];
}

id objc_msgSend_strongToStrongObjectsMapTable(void *a1, const char *a2, ...)
{
  return _[a1 strongToStrongObjectsMapTable];
}

id objc_msgSend_style(void *a1, const char *a2, ...)
{
  return _[a1 style];
}

id objc_msgSend_styleSheet(void *a1, const char *a2, ...)
{
  return _[a1 styleSheet];
}

id objc_msgSend_styleSheetDidChange(void *a1, const char *a2, ...)
{
  return _[a1 styleSheetDidChange];
}

id objc_msgSend_stylusOpaqueTouchDigitizer(void *a1, const char *a2, ...)
{
  return _[a1 stylusOpaqueTouchDigitizer];
}

id objc_msgSend_subnodeScreenEdgeTreatment(void *a1, const char *a2, ...)
{
  return _[a1 subnodeScreenEdgeTreatment];
}

id objc_msgSend_subnodeStyleModifier(void *a1, const char *a2, ...)
{
  return _[a1 subnodeStyleModifier];
}

id objc_msgSend_subnodes(void *a1, const char *a2, ...)
{
  return _[a1 subnodes];
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return [a1 substringFromIndex:];
}

id objc_msgSend_succinctDescription(void *a1, const char *a2, ...)
{
  return _[a1 succinctDescription];
}

id objc_msgSend_succinctDescriptionBuilder(void *a1, const char *a2, ...)
{
  return _[a1 succinctDescriptionBuilder];
}

id objc_msgSend_succinctStyle(void *a1, const char *a2, ...)
{
  return _[a1 succinctStyle];
}

id objc_msgSend_superBias(void *a1, const char *a2, ...)
{
  return _[a1 superBias];
}

id objc_msgSend_superlayer(void *a1, const char *a2, ...)
{
  return _[a1 superlayer];
}

id objc_msgSend_supportCloningToDisplay_(void *a1, const char *a2, ...)
{
  return [a1 supportCloningToDisplay:];
}

id objc_msgSend_supportedSensors(void *a1, const char *a2, ...)
{
  return _[a1 supportedSensors];
}

id objc_msgSend_suppressBrightnessNotificationsForReason_(void *a1, const char *a2, ...)
{
  return [a1 suppressBrightnessNotificationsForReason:];
}

id objc_msgSend_sustainOverlayForReason_(void *a1, const char *a2, ...)
{
  return [a1 sustainOverlayForReason:];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return _[a1 synchronize];
}

id objc_msgSend_synchronizeALSPreferencesAndSystemDisplayBrightness(void *a1, const char *a2, ...)
{
  return _[a1 synchronizeALSPreferencesAndSystemDisplayBrightness];
}

id objc_msgSend_systemAppSetOrientationEventsClient_wantsOrientationEvents_auditToken_(void *a1, const char *a2, ...)
{
  return [a1 systemAppSetOrientationEventsClient:wantsOrientationEvents:auditToken:];
}

id objc_msgSend_systemApplicationBundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 systemApplicationBundleIdentifier];
}

id objc_msgSend_systemEventOfType_matchingEvent_options_(void *a1, const char *a2, ...)
{
  return [a1 systemEventOfType:matchingEvent:options:];
}

id objc_msgSend_systemGestureStateChange(void *a1, const char *a2, ...)
{
  return _[a1 systemGestureStateChange];
}

id objc_msgSend_systemIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 systemIdentifiers];
}

id objc_msgSend_systemIdleSleepInterval(void *a1, const char *a2, ...)
{
  return _[a1 systemIdleSleepInterval];
}

id objc_msgSend_systemInterface(void *a1, const char *a2, ...)
{
  return _[a1 systemInterface];
}

id objc_msgSend_systemShellChangedWithPrimary_(void *a1, const char *a2, ...)
{
  return [a1 systemShellChangedWithPrimary:];
}

id objc_msgSend_systemShellDidConnect_connection_(void *a1, const char *a2, ...)
{
  return [a1 systemShellDidConnect:connection];
}

id objc_msgSend_systemShellDidFinishLaunching_(void *a1, const char *a2, ...)
{
  return [a1 systemShellDidFinishLaunching:];
}

id objc_msgSend_systemShellDidTerminate_(void *a1, const char *a2, ...)
{
  return [a1 systemShellDidTerminate:];
}

id objc_msgSend_systemShellState(void *a1, const char *a2, ...)
{
  return _[a1 systemShellState];
}

id objc_msgSend_systemShellWillBootstrap(void *a1, const char *a2, ...)
{
  return _[a1 systemShellWillBootstrap];
}

id objc_msgSend_systemShells(void *a1, const char *a2, ...)
{
  return _[a1 systemShells];
}

id objc_msgSend_tag(void *a1, const char *a2, ...)
{
  return _[a1 tag];
}

id objc_msgSend_targetWithPid_environmentIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 targetWithPid:environmentIdentifier:];
}

id objc_msgSend_taskNamePortOfContextId_(void *a1, const char *a2, ...)
{
  return [a1 taskNamePortOfContextId:];
}

id objc_msgSend_taskPortForContextID_displayUUID_(void *a1, const char *a2, ...)
{
  return [a1 taskPortForContextID:displayUUID:];
}

id objc_msgSend_terminate(void *a1, const char *a2, ...)
{
  return _[a1 terminate];
}

id objc_msgSend_terminateAlternateSystemApp_forReason_andReport_withDescription_completion_( void *a1, const char *a2, ...)
{
  return [a1 terminateAlternateSystemApp:v1 forReason:v2 andReport:v3 withDescription:v4 completion:v5];
}

id objc_msgSend_terminateAnyAlternateSystemApp(void *a1, const char *a2, ...)
{
  return _[a1 terminateAnyAlternateSystemApp];
}

id objc_msgSend_terminateWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 terminateWithCompletion:];
}

id objc_msgSend_tetheredDisplayPortMode(void *a1, const char *a2, ...)
{
  return _[a1 tetheredDisplayPortMode];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return _[a1 text];
}

id objc_msgSend_textBackgroundStyle(void *a1, const char *a2, ...)
{
  return _[a1 textBackgroundStyle];
}

id objc_msgSend_textStyle(void *a1, const char *a2, ...)
{
  return _[a1 textStyle];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceNow];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return _[a1 timestamp];
}

id objc_msgSend_token(void *a1, const char *a2, ...)
{
  return _[a1 token];
}

id objc_msgSend_tokenForIdentifierOfCAContext_(void *a1, const char *a2, ...)
{
  return [a1 tokenForIdentifierOfCAContext:];
}

id objc_msgSend_tokenFromAuditToken_(void *a1, const char *a2, ...)
{
  return [a1 tokenFromAuditToken:];
}

id objc_msgSend_touch_didHitTestToDestination_hostingChainIndex_(void *a1, const char *a2, ...)
{
  return [a1 touch:didHitTestToDestination:hostingChainIndex:];
}

id objc_msgSend_touch_didMoveToPoint_eventMask_z_maxZ_(void *a1, const char *a2, ...)
{
  return [a1 touch:didMoveToPoint:eventMask:z:maxZ:];
}

id objc_msgSend_touch_pathIndex_downAtPoint_eventMask_transducerType_(void *a1, const char *a2, ...)
{
  return [a1 touch:pathIndex:downAtPoint:eventMask:transducerType:];
}

id objc_msgSend_touch_pathIndex_rangeInAtPoint_eventMask_z_maxZ_transducerType_(void *a1, const char *a2, ...)
{
  return [a1 touch:pathIndex:rangeInAtPoint:eventMask:z:maxZ:transducerType:];
}

id objc_msgSend_touch_pathIndex_rangeOutAtPoint_(void *a1, const char *a2, ...)
{
  return [a1 touch:v1 pathIndex:v2 rangeOutAtPoint:v3];
}

id objc_msgSend_touch_pathIndex_upAtPoint_detached_(void *a1, const char *a2, ...)
{
  return [a1 touch:pathIndex:upAtPoint:detached:];
}

id objc_msgSend_touchBehavior(void *a1, const char *a2, ...)
{
  return _[a1 touchBehavior];
}

id objc_msgSend_touchDidDetach_destinations_(void *a1, const char *a2, ...)
{
  return [a1 touchDidDetach:destinations:];
}

id objc_msgSend_touchDidFinishProcessingTouchCollection(void *a1, const char *a2, ...)
{
  return _[a1 touchDidFinishProcessingTouchCollection];
}

id objc_msgSend_touchDidHIDCancel_(void *a1, const char *a2, ...)
{
  return [a1 touchDidHIDCancel:];
}

id objc_msgSend_touchDidSoftCancel_(void *a1, const char *a2, ...)
{
  return [a1 touchDidSoftCancel:];
}

id objc_msgSend_touchDidTransfer_destination_(void *a1, const char *a2, ...)
{
  return [a1 touchDidTransfer:destination:];
}

id objc_msgSend_touchIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 touchIdentifier];
}

id objc_msgSend_touchIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 touchIdentifiers];
}

id objc_msgSend_touchScales(void *a1, const char *a2, ...)
{
  return _[a1 touchScales];
}

id objc_msgSend_touchSensitiveButtonServicePersistentPropertyController(void *a1, const char *a2, ...)
{
  return _[a1 touchSensitiveButtonServicePersistentPropertyController];
}

id objc_msgSend_touchWillStartProcessingTouchCollection(void *a1, const char *a2, ...)
{
  return _[a1 touchWillStartProcessingTouchCollection];
}

id objc_msgSend_transferTouchIdentifiers_count_toContextID_(void *a1, const char *a2, ...)
{
  return [a1 transferTouchIdentifiers:count:toContextID:];
}

id objc_msgSend_transformFromLayerId_inContextId_(void *a1, const char *a2, ...)
{
  return [a1 transformFromLayerId:inContextId:];
}

id objc_msgSend_transformLayer(void *a1, const char *a2, ...)
{
  return _[a1 transformLayer];
}

id objc_msgSend_transformLayerPropertiesForDisplay_displayInterfaceOrientation_(void *a1, const char *a2, ...)
{
  return [a1 transformLayerPropertiesForDisplay:displayInterfaceOrientation:];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_unblockSystemApp(void *a1, const char *a2, ...)
{
  return _[a1 unblockSystemApp];
}

id objc_msgSend_unblockSystemAppForAlternateSystemAppWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 unblockSystemAppForAlternateSystemAppWithCompletion:];
}

id objc_msgSend_unentitledBrightnessLevel(void *a1, const char *a2, ...)
{
  return _[a1 unentitledBrightnessLevel];
}

id objc_msgSend_uniqueId(void *a1, const char *a2, ...)
{
  return _[a1 uniqueId];
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 uniqueIdentifier];
}

id objc_msgSend_unknownSenderInfo(void *a1, const char *a2, ...)
{
  return _[a1 unknownSenderInfo];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return _[a1 unlock];
}

id objc_msgSend_unsetToken(void *a1, const char *a2, ...)
{
  return _[a1 unsetToken];
}

id objc_msgSend_unsignedCharValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedCharValue];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedLongLongValue];
}

id objc_msgSend_unsustainOverlayForReason_(void *a1, const char *a2, ...)
{
  return [a1 unsustainOverlayForReason:];
}

id objc_msgSend_updatePreferencesIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 updatePreferencesIfNeeded];
}

id objc_msgSend_updateStatistics_(void *a1, const char *a2, ...)
{
  return [a1 updateStatistics:];
}

id objc_msgSend_userInfoForConnection_(void *a1, const char *a2, ...)
{
  return [a1 userInfoForConnection:];
}

id objc_msgSend_userInitiated(void *a1, const char *a2, ...)
{
  return _[a1 userInitiated];
}

id objc_msgSend_usesDisplayPortTethering(void *a1, const char *a2, ...)
{
  return _[a1 usesDisplayPortTethering];
}

id objc_msgSend_validateMessage_(void *a1, const char *a2, ...)
{
  return [a1 validateMessage:];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return _[a1 value];
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return [a1 valueForKey:];
}

id objc_msgSend_versionedPID(void *a1, const char *a2, ...)
{
  return _[a1 versionedPID];
}

id objc_msgSend_versionedPIDForPID_(void *a1, const char *a2, ...)
{
  return [a1 versionedPIDForPID:];
}

id objc_msgSend_videoTVOutReservedForIPodOut(void *a1, const char *a2, ...)
{
  return _[a1 videoTVOutReservedForIPodOut];
}

id objc_msgSend_videoTVOutReservedForRemoteUI(void *a1, const char *a2, ...)
{
  return _[a1 videoTVOutReservedForRemoteUI];
}

id objc_msgSend_virtualDisplayMode(void *a1, const char *a2, ...)
{
  return _[a1 virtualDisplayMode];
}

id objc_msgSend_wantsAccelerometerEvents(void *a1, const char *a2, ...)
{
  return _[a1 wantsAccelerometerEvents];
}

id objc_msgSend_wantsOrientationEvents(void *a1, const char *a2, ...)
{
  return _[a1 wantsOrientationEvents];
}

id objc_msgSend_watchdogType(void *a1, const char *a2, ...)
{
  return _[a1 watchdogType];
}

id objc_msgSend_width(void *a1, const char *a2, ...)
{
  return _[a1 width];
}

id objc_msgSend_willUnblank(void *a1, const char *a2, ...)
{
  return _[a1 willUnblank];
}

id objc_msgSend_windowServerDisplay(void *a1, const char *a2, ...)
{
  return _[a1 windowServerDisplay];
}

id objc_msgSend_windowServerDisplayForDisplayIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 windowServerDisplayForDisplayIdentifier:];
}

id objc_msgSend_windowServerDisplays(void *a1, const char *a2, ...)
{
  return _[a1 windowServerDisplays];
}

id objc_msgSend_workQueue(void *a1, const char *a2, ...)
{
  return _[a1 workQueue];
}

id objc_msgSend_xThreshold(void *a1, const char *a2, ...)
{
  return _[a1 xThreshold];
}

id objc_msgSend_yThreshold(void *a1, const char *a2, ...)
{
  return _[a1 yThreshold];
}

id objc_msgSend_zThreshold(void *a1, const char *a2, ...)
{
  return _[a1 zThreshold];
}