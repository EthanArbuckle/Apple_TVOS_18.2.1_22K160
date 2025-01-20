void sub_13D4(id a1)
{
  AXTouchAccommodationsUIServer *v1;
  void *v2;
  v1 = objc_alloc_init(&OBJC_CLASS___AXTouchAccommodationsUIServer);
  v2 = (void *)qword_116F0;
  qword_116F0 = (uint64_t)v1;
}
}

void sub_158C(uint64_t a1)
{
  if (UIAccessibilityIsVoiceOverRunning())
  {
    v2 = *(void **)(a1 + 32);
    id v3 = sub_15F4(@"TOUCH-ACCOMMODATIONS-SUSPENEDED-DUE-TO-VOICEOVER-ON");
    id v4 = (id)objc_claimAutoreleasedReturnValue(v3);
    [v2 _showBannerWithText:v4 andSubtitleText:0];
  }

id sub_15F4(void *a1)
{
  id v1 = a1;
  v2 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___AXTouchAccommodationsUIServer));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedStringForKey:v1 value:v1 table:@"Localizable"]);

  return v4;
}

void sub_16F8(uint64_t a1)
{
  if (_UIAccessibilityZoomTouchEnabled())
  {
    v2 = *(void **)(a1 + 32);
    id v3 = sub_15F4(@"TOUCH-ACCOMMODATIONS-ZOOM-CONTROLLER-ENABLED");
    id v4 = (id)objc_claimAutoreleasedReturnValue(v3);
    [v2 _showBannerWithText:v4 andSubtitleText:0];
  }

void sub_1CC8(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = sub_15F4(@"TOUCH-ACCOMMODATIONS-SUSPENEDED-DUE-TO-VOICEOVER-ON");
  id v3 = (id)objc_claimAutoreleasedReturnValue(v2);
  [v1 _showBannerWithText:v3 andSubtitleText:0];
}

void sub_1D14(id a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v1 setZoomShouldShowSlug:1];
}

void sub_1D4C(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = sub_15F4(@"TOUCH-ACCOMMODATIONS-ZOOM-CONTROLLER-ENABLED");
  id v3 = (id)objc_claimAutoreleasedReturnValue(v2);
  [v1 _showBannerWithText:v3 andSubtitleText:0];
}

void sub_1D98(id a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v1 setZoomShouldShowSlug:0];
}

void sub_1F0C(id a1, BOOL a2)
{
  BOOL v2 = a2;
  uint64_t v3 = AXLogTouchAccommodations(a1);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  v5 = v4;
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Showing Scene View Controller for Touch Accommodations", v13, 2u);
    }
  }

  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    sub_6A80(v5, v6, v7, v8, v9, v10, v11, v12);
  }
}

void sub_200C(id a1, BOOL a2)
{
  BOOL v2 = a2;
  uint64_t v3 = AXLogTouchAccommodations(a1);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  v5 = v4;
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Hiding Scene View Controller for Touch Accommodations", v13, 2u);
    }
  }

  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    sub_6AB4(v5, v6, v7, v8, v9, v10, v11, v12);
  }
}

void sub_211C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 9))
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(v1 + 48) parentViewController]);

    if (!v3)
    {
      id v4 = (void *)objc_claimAutoreleasedReturnValue( +[AXUIDisplayManager sharedDisplayManager]( &OBJC_CLASS___AXUIDisplayManager,  "sharedDisplayManager"));
      objc_msgSend( v4,  "addContentViewController:withUserInteractionEnabled:forService:",  *(void *)(*(void *)(a1 + 32) + 48),  0);
    }

    *(_BYTE *)(*(void *)(a1 + 32) + 9LL) = 1;
    *(_BYTE *)(*(void *)(a1 + 32) + 10LL) = 0;
  }

void sub_21E8(uint64_t a1)
{
  BOOL v2 = *(_BYTE **)(a1 + 32);
  if (v2[9] && !v2[10])
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 viewController]);
    [v3 removeAllHandTouchMarkers];

    id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 48) parentViewController]);
    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue( +[AXUIDisplayManager sharedDisplayManager]( &OBJC_CLASS___AXUIDisplayManager,  "sharedDisplayManager"));
      objc_msgSend( v5,  "removeContentViewController:withUserInteractionEnabled:forService:",  *(void *)(*(void *)(a1 + 32) + 48),  0);
    }

    *(_BYTE *)(*(void *)(a1 + 32) + 10LL) = 1;
    *(_BYTE *)(*(void *)(a1 + 32) + 9LL) = 0;
  }

void sub_2524(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) viewController]);
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _getPointsArrayFromPathInfoArray:*(void *)(a1 + 40)]);
  [v3 updateLocationOfHandTouchMarkerAtPoints:v2];
}

void sub_25F0(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) viewController]);
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _getPointsArrayFromPathInfoArray:*(void *)(a1 + 40)]);
  [v3 resetProgressTrackOfHandTouchMarkerAtPoints:v2];
}

void sub_2698(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = sub_15F4(@"HOLD_DURATION_TRIPLE_CLICK_HELP_FORMAT");
  id v8 = (id)objc_claimAutoreleasedReturnValue(v2);
  id v3 = sub_15F4(@"HOLD-DURATION-HELP-SUBTITLE");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v5 touchAccommodationsHoldDuration];
  *(float *)&double v6 = v6;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  v4,  *(float *)&v6));
  [v1 _showBannerWithText:v8 andSubtitleText:v7];
}

void sub_2840( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

LABEL_6:
  -[CATransformLayer setPosition:](self->_transformLayer, "setPosition:", x, y);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v15 = [v14 touchAccommodationsHoldDurationEnabled];

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v17 = v16;
  if (v15)
  {
    [v16 touchAccommodationsHoldDuration];
    v19 = v18;

    if (v19 <= 0.289999992)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
      v22 = self;
      v23 = v20;
      v21 = 0LL;
    }

    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  1.0,  1.0,  1.0,  0.5));
      v21 = kCAFilterMaximum;
      v22 = self;
      v23 = v20;
    }

    v32 = (void *)objc_claimAutoreleasedReturnValue( -[AXTouchAccommodationsViewController _createProgressLayerWithColor:withFilterName:forHoldDuration:]( v22,  "_createProgressLayerWithColor:withFilterName:forHoldDuration:",  v23,  v21,  1LL));

    v33 = @"holdDurationProgressTrack";
LABEL_17:
    [v32 setName:v33];
    -[CATransformLayer addSublayer:](self->_transformLayer, "addSublayer:", v32);

    return self->_transformLayer;
  }

  v24 = [v16 touchAccommodationsTapActivationMethod];

  if (v24)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    [v25 touchAccommodationsTapActivationTimeout];
    v27 = v26;

    if (v27 <= 0.289999992)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
      v30 = self;
      v31 = v28;
      v29 = 0LL;
    }

    else
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
      v29 = kCAFilterNormalBlendMode;
      v30 = self;
      v31 = v28;
    }

    v32 = (void *)objc_claimAutoreleasedReturnValue( -[AXTouchAccommodationsViewController _createProgressLayerWithColor:withFilterName:forHoldDuration:]( v30,  "_createProgressLayerWithColor:withFilterName:forHoldDuration:",  v31,  v29,  0LL));

    v33 = @"tapAssistanceProgressTrack";
    goto LABEL_17;
  }

  return self->_transformLayer;
}
}

void sub_3614(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 40)) {
    return;
  }
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v3 = [v2 touchAccommodationsTapActivationMethod];

  if (!v3) {
    return;
  }
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  uint64_t v44 = a1;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 8) sublayers]);
  id v5 = [v4 countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (!v5) {
    goto LABEL_30;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v47;
  uint64_t v45 = kCAFilterPlusD;
  do
  {
    for (i = 0LL; i != v6; i = (char *)i + 1)
    {
      if (*(void *)v47 != v7) {
        objc_enumerationMutation(v4);
      }
      uint64_t v9 = *(void **)(*((void *)&v46 + 1) + 8LL * (void)i);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
      [v10 touchAccommodationsTapActivationTimeout];
      double v12 = v11;

      if (v12 <= 0.289999992)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue([v9 name]);
        unsigned int v20 = [v19 isEqualToString:@"shapeLayerDisc"];

        if (v20
          || (v21 = (void *)objc_claimAutoreleasedReturnValue([v9 name]),
              unsigned int v22 = [v21 isEqualToString:@"shapeLayerDot"],
              v21,
              v22))
        {
          id v23 = objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
          objc_msgSend(v9, "setFillColor:", objc_msgSend(v23, "CGColor"));
          goto LABEL_27;
        }

        v25 = (void *)objc_claimAutoreleasedReturnValue([v9 name]);
        unsigned int v26 = [v25 isEqualToString:@"shapeLayerEmptyTrack"];

        if (v26
          || (v27 = (void *)objc_claimAutoreleasedReturnValue([v9 name]),
              unsigned int v28 = [v27 isEqualToString:@"holdDurationProgressTrack"],
              v27,
              v28))
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
          goto LABEL_26;
        }
      }

      else
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
        [v13 touchAccommodationsHoldDuration];
        double v15 = v14;

        v16 = (void *)objc_claimAutoreleasedReturnValue([v9 name]);
        unsigned int v17 = [v16 isEqualToString:@"shapeLayerDisc"];

        if (v15 > 0.289999992)
        {
          if (!v17) {
            continue;
          }
          id v18 = objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor, "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.5));
          objc_msgSend(v9, "setFillColor:", objc_msgSend(v18, "CGColor"));
          goto LABEL_23;
        }

        if (v17)
        {
          double v24 = 0.5;
LABEL_22:
          id v32 = objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor, "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, v24));
          objc_msgSend(v9, "setFillColor:", objc_msgSend(v32, "CGColor"));

          id v18 = (id)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", v45));
          [v9 setCompositingFilter:v18];
LABEL_23:

          continue;
        }

        v30 = (void *)objc_claimAutoreleasedReturnValue([v9 name]);
        unsigned int v31 = [v30 isEqualToString:@"shapeLayerDot"];

        if (v31)
        {
          double v24 = 0.300000012;
          goto LABEL_22;
        }

        v33 = (void *)objc_claimAutoreleasedReturnValue([v9 name]);
        unsigned int v34 = [v33 isEqualToString:@"shapeLayerEmptyTrack"];

        if (v34)
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  1.0,  1.0,  1.0,  0.5));
LABEL_26:
          id v23 = v29;
          objc_msgSend(v9, "setStrokeColor:", objc_msgSend(v23, "CGColor"));
LABEL_27:

          [v9 setCompositingFilter:0];
          continue;
        }
      }
    }

    id v6 = [v4 countByEnumeratingWithState:&v46 objects:v50 count:16];
  }

  while (v6);
LABEL_30:

  v35 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v35 touchAccommodationsTapActivationTimeout];
  double v37 = v36;

  v38 = *(void **)(v44 + 32);
  if (v37 <= 0.289999992)
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    v41 = v38;
    v42 = v39;
    uint64_t v40 = 0LL;
  }

  else
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    uint64_t v40 = kCAFilterNormalBlendMode;
    v41 = v38;
    v42 = v39;
  }

  v43 = (void *)objc_claimAutoreleasedReturnValue([v41 _createProgressLayerWithColor:v42 withFilterName:v40 forHoldDuration:0]);

  [v43 setName:@"tapAssistanceProgressTrack"];
  [*(id *)(*(void *)(v44 + 32) + 8) addSublayer:v43];
}

void sub_3E94( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

void sub_3EC0(uint64_t a1)
{
  id v2 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 8LL);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_3F64;
  v3[3] = &unk_C4C0;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  id v4 = *(id *)(a1 + 32);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v5);
}

void sub_3F64(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned __int8 v3 = [v2 touchAccommodationsIgnoreRepeatEnabled];

  if ((v3 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _setTimerState:0];

    [*(id *)(*(void *)(a1 + 32) + 32) cancel];
  }

id sub_3FE4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 type] == 3001)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v5 = [WeakRetained _handleEvent:v3];
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

void sub_4558( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_457C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _endHoldDurationAndAllowTapAssistance:1];
}

void sub_4688( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_46AC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _setTimerState:4];
}

void sub_47B0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_47D4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _setTimerState:0];
}

id sub_49D8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processTimerEventsFromCurrentState];
}

void sub_4C90(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    id v5 = [v3 copy];
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v5 handInfo]);
    [v4 setEventType:1];

    [v5 resetInitialTouchCountValueForHidStreamIdentifier:TouchAccommodationsHIDEventTapIdentifier];
    [v5 setIsGeneratedEvent:1];
    [*(id *)(a1 + 40) _sendHIDEventUnconditionally:v5 shouldUseOriginalTime:1];
    +[NSThread sleepForTimeInterval:](&OBJC_CLASS___NSThread, "sleepForTimeInterval:", 0.05);
  }

  else
  {
    [v3 setIsGeneratedEvent:1];
    [*(id *)(a1 + 40) _sendHIDEventUnconditionally:*(void *)(a1 + 32) shouldUseOriginalTime:1];
  }

id sub_4DE0(uint64_t a1)
{
  int v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) initialTouchEvent]);

  if (v2)
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 initialTouchEvent]);
    [v3 _sendHIDEventUnconditionally:v4 shouldUseOriginalTime:0];

    +[NSThread sleepForTimeInterval:](&OBJC_CLASS___NSThread, "sleepForTimeInterval:", 0.05);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 160) handInfo]);
    [v5 setEventType:6];

    [*(id *)(*(void *)(a1 + 32) + 160) setIsGeneratedEvent:1];
    [*(id *)(*(void *)(a1 + 32) + 160) setWillUpdateMask:0];
    [*(id *)(*(void *)(a1 + 32) + 160) setDidUpdateMask:0];
    [*(id *)(a1 + 32) _sendHIDEventUnconditionally:*(void *)(*(void *)(a1 + 32) + 160) shouldUseOriginalTime:0];
  }

  return [*(id *)(a1 + 32) setInitialTouchEvent:0];
}

id sub_4F4C(uint64_t a1)
{
  int v2 = *(id **)(a1 + 32);
  if (v2[19])
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue([v2[19] handInfo]);
    [v3 setEventType:1];

    [*(id *)(*(void *)(a1 + 32) + 152) setIsGeneratedEvent:1];
    [*(id *)(a1 + 32) _sendHIDEventUnconditionally:*(void *)(*(void *)(a1 + 32) + 152) shouldUseOriginalTime:0];
    +[NSThread sleepForTimeInterval:](&OBJC_CLASS___NSThread, "sleepForTimeInterval:", 0.05);
    id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 152) handInfo]);
    [v4 setEventType:6];

    [*(id *)(*(void *)(a1 + 32) + 152) setIsGeneratedEvent:1];
    [*(id *)(*(void *)(a1 + 32) + 152) setWillUpdateMask:0];
    [*(id *)(*(void *)(a1 + 32) + 152) setDidUpdateMask:0];
    [*(id *)(a1 + 32) _sendHIDEventUnconditionally:*(void *)(*(void *)(a1 + 32) + 152) shouldUseOriginalTime:0];
    int v2 = *(id **)(a1 + 32);
  }

  return [v2 setFinalTouchEvent:0];
}

LABEL_19:
    }
  }

LABEL_10:
  if (v7 - self->_firstHoldDurationCancelTime > 3.0) {
    self->_holdDurationCancelCount = 0;
  }
  -[AXTouchAccommodationsEventProcessor _setTimerState:](self, "_setTimerState:", 0LL);
}

void sub_5D88( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, char a49)
{
}

uint64_t sub_5DB4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_5DC4(uint64_t a1)
{
}

void sub_5DCC(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 120) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

id sub_5E9C(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 120) removeAllObjects];
}

LABEL_36:
      unsigned int v26 = (dispatch_queue_s *)self->_hidDispatchQueue;
      v27 = _NSConcreteStackBlock;
      unsigned int v28 = 3221225472LL;
      v29 = sub_65A0;
      v30 = &unk_C5B0;
      unsigned int v31 = self;
      id v32 = v4;
      v33 = v15;
      dispatch_async(v26, &v27);

      if ((v19 & 1) == 0) {
        goto LABEL_8;
      }
      goto LABEL_37;
    }

    state = self->_state;
    if (state == 3)
    {
      self->_touchEventAfterIgnoreRepeatTimerBegan = 1;
      state = self->_state;
    }

    if (state)
    {
      if (self->_touchEventAfterIgnoreRepeatTimerBegan)
      {
        v19 = 1;
        goto LABEL_36;
      }
    }

    else
    {
      self->_touchEventAfterIgnoreRepeatTimerBegan = 0;
    }

    unsigned int v20 = (dispatch_queue_s *)self->_hidDispatchQueue;
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472LL;
    v42[2] = sub_645C;
    v42[3] = &unk_C470;
    v42[4] = self;
    v43 = v15;
    dispatch_async(v20, v42);
    if ([v5 touchAccommodationsHoldDurationEnabled])
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[AXTouchAccommodationsEventProcessor delegate](self, "delegate"));
      [v21 willStartTimersInEventProcessor:self];

      unsigned int v22 = (dispatch_queue_s *)self->_hidDispatchQueue;
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472LL;
      v41[2] = sub_649C;
      v41[3] = &unk_C3A8;
      v41[4] = self;
      dispatch_async(v22, v41);
    }

    else
    {
      if (![v5 touchAccommodationsTapActivationMethod])
      {
        v19 = 0;
        goto LABEL_35;
      }

      double v24 = (void *)objc_claimAutoreleasedReturnValue(-[AXTouchAccommodationsEventProcessor delegate](self, "delegate"));
      [v24 willStartTimersInEventProcessor:self];

      v25 = (dispatch_queue_s *)self->_hidDispatchQueue;
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472LL;
      v38[2] = sub_64A8;
      v38[3] = &unk_C5B0;
      v38[4] = self;
      v39 = v5;
      uint64_t v40 = v4;
      dispatch_async(v25, v38);
    }

    v19 = 1;
LABEL_35:

    goto LABEL_36;
  }

  double v11 = 0;
LABEL_6:

  return v11;
}

void sub_63AC(uint64_t a1)
{
  uint64_t v1 = (os_unfair_lock_s **)(a1 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 56LL));
  id v2 = [*(id *)&(*v1)[12]._os_unfair_lock_opaque count];
  if (v2)
  {
    uint64_t v3 = AXLogTouchAccommodations(v2);
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_6CC8(v1, 48LL, v4);
    }

    [*(id *)&(*v1)[12]._os_unfair_lock_opaque removeAllObjects];
  }

  os_unfair_lock_unlock(*v1 + 14);
}

id sub_6444(uint64_t a1)
{
  return [*(id *)(a1 + 32) setEvent:*(void *)(a1 + 40)];
}

id sub_644C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateTouchAccommodationsBasedOnTapActivation];
}

id sub_6454(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateTouchAccommodationsBasedOnTapActivation];
}

id sub_645C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 40) copy];
  [*(id *)(a1 + 32) setInitialTouchEvent:v2];

  return [*(id *)(a1 + 32) setCanBeginIgnoreRepeatTimer:1];
}

id sub_649C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setTimerState:1];
}

void sub_64A8(id *a1)
{
  if ([a1[5] touchAccommodationsTapActivationMethod] == (char *)&dword_0 + 2)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue([a1[6] handInfo]);
    uint64_t v2 = objc_claimAutoreleasedReturnValue([v5 paths]);
    uint64_t v3 = a1[4];
    id v4 = (void *)v3[14];
    v3[14] = v2;
  }

id sub_652C(uint64_t a1)
{
  if ([*(id *)(a1 + 32) touchAccommodationsIgnoreRepeatEnabled])
  {
    if (([*(id *)(a1 + 32) touchAccommodationsHoldDurationEnabled] & 1) == 0)
    {
      uint64_t v2 = *(void **)(a1 + 40);
    }
  }

  return [*(id *)(a1 + 40) setCanBeginIgnoreRepeatTimer:0];
}

void sub_65A0(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _shouldAllowBypassForSwipeGestures])
  {
    id v2 = [*(id *)(a1 + 32) _bypassForSwipeGestureDueToEvent:*(void *)(a1 + 40)];
    int v3 = (int)v2;
    uint64_t v4 = AXLogTouchAccommodations(v2);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
    if (v3)
    {
      if (v6) {
        sub_6D7C(a1 + 40, v5, v7, v8, v9, v10, v11, v12);
      }
    }

    else
    {
      if (v6) {
        sub_6DE4(a1, v5, v7, v8, v9, v10, v11, v12);
      }

      uint64_t v13 = *(void *)(a1 + 32);
      double v14 = *(void **)(a1 + 40);
      double v15 = *(dispatch_queue_s **)(v13 + 128);
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_6694;
      v16[3] = &unk_C470;
      v16[4] = v13;
      id v17 = v14;
      dispatch_sync(v15, v16);
    }
  }

id sub_6694(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 120LL);
  if (!v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 120);
    *(void *)(v4 + 120) = v3;

    id v2 = *(void **)(*(void *)(a1 + 32) + 120LL);
  }

  return [v2 addObject:*(void *)(a1 + 40)];
}

void sub_67D8(uint64_t a1)
{
  double Current = CFAbsoluteTimeGetCurrent();
  if (Current - *(double *)(*(void *)(a1 + 32) + 88LL) > 3.0)
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXUserEventTimer sharedInstance](&OBJC_CLASS___AXUserEventTimer, "sharedInstance"));
    [v3 userEventOccurred];

    *(double *)(*(void *)(a1 + 32) + 88LL) = Current;
  }

void sub_6A58( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_6A68( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_6A80( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_6AB4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_6AE8(os_log_s *a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_0, a1, OS_LOG_TYPE_DEBUG, "Ending hold duration %{public}@", (uint8_t *)&v3, 0xCu);
}

void sub_6B84(uint64_t *a1, os_log_s *a2)
{
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_error_impl( &dword_0,  a2,  OS_LOG_TYPE_ERROR,  "Unexpected state for ending hold duration: %ld",  (uint8_t *)&v3,  0xCu);
  sub_6A78();
}

void sub_6BF8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_6C2C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_6C94( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_6CC8(void *a1, uint64_t a2, os_log_s *a3)
{
  id v6 = [*(id *)(*a1 + a2) count];
  uint64_t v7 = *(void *)(*a1 + a2);
  int v8 = 134218242;
  id v9 = v6;
  __int16 v10 = 2114;
  uint64_t v11 = v7;
  _os_log_error_impl( &dword_0,  a3,  OS_LOG_TYPE_ERROR,  "HID has been quiesced for 30 seconds but there are still %lu generations anticipating update! This is a bug somewher e in the system! generations: %{public}@",  (uint8_t *)&v8,  0x16u);
}

void sub_6D7C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_6DE4( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

id objc_msgSend_addContentViewController_withUserInteractionEnabled_forService_context_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addContentViewController:withUserInteractionEnabled:forService:context:completion:");
}

id objc_msgSend_removeContentViewController_withUserInteractionEnabled_forService_context_completion_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeContentViewController:withUserInteractionEnabled:forService:context:completion:");
}

id objc_msgSend_showAlertWithText_subtitleText_iconImage_type_priority_duration_forService_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showAlertWithText:subtitleText:iconImage:type:priority:duration:forService:");
}

id objc_msgSend_zoomShouldShowSlug(void *a1, const char *a2, ...)
{
  return [a1 zoomShouldShowSlug];
}