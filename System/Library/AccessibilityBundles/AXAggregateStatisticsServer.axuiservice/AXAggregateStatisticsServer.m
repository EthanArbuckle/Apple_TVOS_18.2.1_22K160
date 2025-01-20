void sub_4BB8(id a1)
{
  AXAggregateStatisticsServer *v1;
  void *v2;
  v1 = objc_alloc_init(&OBJC_CLASS___AXAggregateStatisticsServer);
  v2 = (void *)qword_10A50;
  qword_10A50 = (uint64_t)v1;
}

void sub_4D5C(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___AXAggregateStatistics);
  v2 = (void *)qword_10A60;
  qword_10A60 = (uint64_t)v1;
}

id sub_4E7C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startLogging];
}

id sub_53E8(uint64_t a1)
{
  v4 = @"enabled";
  v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [*(id *)(a1 + 32) BOOLForKey:@"peopleDetectionEnabledForAnalytics"]));
  v5 = v1;
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v5,  &v4,  1LL));

  return v2;
}

id sub_5498(uint64_t a1)
{
  v4 = @"enabled";
  v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [*(id *)(a1 + 32) BOOLForKey:@"doorDetectionEnabledForAnalytics"]));
  v5 = v1;
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v5,  &v4,  1LL));

  return v2;
}

id sub_5548(uint64_t a1)
{
  v4 = @"enabled";
  v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [*(id *)(a1 + 32) BOOLForKey:@"doorDetectionDecorations"]));
  v5 = v1;
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v5,  &v4,  1LL));

  return v2;
}

id sub_55F8(uint64_t a1)
{
  v4 = @"enabled";
  v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [*(id *)(a1 + 32) BOOLForKey:@"doorDetectionAttributes"]));
  v5 = v1;
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v5,  &v4,  1LL));

  return v2;
}

id sub_56A8(uint64_t a1)
{
  v22[0] = @"approach";
  v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) valueForKey:@"selectedAttributes"]);
  v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v21 containsString:@"0"]));
  v23[0] = v20;
  v22[1] = @"color";
  v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) valueForKey:@"selectedAttributes"]);
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v19 containsString:@"1"]));
  v23[1] = v18;
  v22[2] = @"doorHandle";
  v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) valueForKey:@"selectedAttributes"]);
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v17 containsString:@"2"]));
  v23[2] = v16;
  v22[3] = @"openMethod";
  v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) valueForKey:@"selectedAttributes"]);
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v15 containsString:@"3"]));
  v23[3] = v14;
  v22[4] = @"openState";
  v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) valueForKey:@"selectedAttributes"]);
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v13 containsString:@"4"]));
  v23[4] = v12;
  v22[5] = @"shape";
  v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) valueForKey:@"selectedAttributes"]);
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v2 containsString:@"5"]));
  v23[5] = v3;
  v22[6] = @"size";
  v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) valueForKey:@"selectedAttributes"]);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v4 containsString:@"6"]));
  v23[6] = v5;
  v22[7] = @"window";
  v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) valueForKey:@"selectedAttributes"]);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v6 containsString:@"7"]));
  v23[7] = v7;
  v22[8] = @"material";
  v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) valueForKey:@"selectedAttributes"]);
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v8 containsString:@"8"]));
  v23[8] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v23,  v22,  9LL));

  return v10;
}

id sub_5A40(uint64_t a1)
{
  v4 = @"enabled";
  v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [*(id *)(a1 + 32) BOOLForKey:@"pointSpeakEnabledForAnalytics"]));
  v5 = v1;
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v5,  &v4,  1LL));

  return v2;
}

id sub_5AF0(uint64_t a1)
{
  v6[0] = @"under";
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [*(id *)(a1 + 32) integerForKey:@"pointSpeakFingerLocation"] == 0));
  v6[1] = @"above";
  v7[0] = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [*(id *)(a1 + 32) integerForKey:@"pointSpeakFingerLocation"] == (char *)&dword_0 + 1));
  v7[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v7,  v6,  2LL));

  return v4;
}

id sub_5BEC(uint64_t a1)
{
  v4 = @"enabled";
  v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [*(id *)(a1 + 32) BOOLForKey:@"textDetectionEnabledForAnalytics"]));
  v5 = v1;
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v5,  &v4,  1LL));

  return v2;
}

id sub_5C9C(uint64_t a1)
{
  v4 = @"enabled";
  v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [*(id *)(a1 + 32) BOOLForKey:@"objectUnderstandingEnabledForAnalytics"]));
  v5 = v1;
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v5,  &v4,  1LL));

  return v2;
}

id sub_5D4C(uint64_t a1)
{
  v4 = @"detectLanguages";
  v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  objc_msgSend(*(id *)(a1 + 32), "BOOLForKey:")));
  v5 = v1;
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v5,  &v4,  1LL));

  return v2;
}

id sub_5DF4(uint64_t a1)
{
  v4 = @"enabled";
  v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [*(id *)(a1 + 32) BOOLForKey:@"savedActivityForAnalytics"]));
  v5 = v1;
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v5,  &v4,  1LL));

  return v2;
}

id sub_5EA4(uint64_t a1)
{
  v4 = @"enabled";
  v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [*(id *)(a1 + 32) BOOLForKey:@"switchedActivityForAnalytics"]));
  v5 = v1;
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v5,  &v4,  1LL));

  return v2;
}

id sub_5F54(uint64_t a1)
{
  v4 = @"enabled";
  v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [*(id *)(a1 + 32) BOOLForKey:@"readerModeEnabledForAnalytics"]));
  v5 = v1;
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v5,  &v4,  1LL));

  return v2;
}

id sub_6004(uint64_t a1)
{
  v4 = @"enabled";
  v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [*(id *)(a1 + 32) BOOLForKey:@"readerModeSpeechEnabledForAnalytics"]));
  v5 = v1;
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v5,  &v4,  1LL));

  return v2;
}

NSDictionary *__cdecl sub_60E8(id a1)
{
  v4 = @"enabled";
  v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  +[AVSSettings avsFeatureEnabled](&OBJC_CLASS___AVSSettings, "avsFeatureEnabled")));
  v5 = v1;
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v5,  &v4,  1LL));

  return (NSDictionary *)v2;
}

NSDictionary *__cdecl sub_6194(id a1)
{
  v5 = @"numberOfEnrolledCommands";
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[AVSStore shortcuts](&OBJC_CLASS___AVSStore, "shortcuts"));
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v1 count]));
  v6 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_63CC(id a1)
{
  v1 = objc_alloc(&OBJC_CLASS___NSUserDefaults);
  v2 = -[NSUserDefaults initWithSuiteName:](v1, "initWithSuiteName:", AX_SpringBoardBundleName);
  unsigned int v3 = -[NSUserDefaults BOOLForKey:](v2, "BOOLForKey:", @"SBDisableCaptureButton");

  char v11 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v3 ^ 1));
  uint64_t v5 = __UIAccessibilitySafeClass(@"NSNumber", v4, 1LL, &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (v11) {
    abort();
  }
  v7 = &__kCFBooleanTrue;
  if (v6) {
    v7 = v6;
  }
  id v8 = v7;

  v12 = @"enabled";
  id v13 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));

  return (NSDictionary *)v9;
}

id sub_64E8(uint64_t a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKey:@"systemOverlay.halfPressGestureEnabled"]);
  if (v1) {
    v2 = (void *)v1;
  }
  else {
    v2 = &__kCFBooleanTrue;
  }
  char v8 = 0;
  uint64_t v3 = __UIAccessibilitySafeClass(@"NSNumber", v2, 1LL, &v8);
  uint64_t v4 = objc_claimAutoreleasedReturnValue(v3);
  if (v8) {
    abort();
  }
  uint64_t v5 = (void *)v4;
  v9 = @"enabled";
  uint64_t v10 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));

  return v6;
}

id sub_65C8(uint64_t a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKey:@"systemOverlay.swipeToPresentEnabled"]);
  if (v1) {
    v2 = (void *)v1;
  }
  else {
    v2 = &__kCFBooleanTrue;
  }
  char v8 = 0;
  uint64_t v3 = __UIAccessibilitySafeClass(@"NSNumber", v2, 1LL, &v8);
  uint64_t v4 = objc_claimAutoreleasedReturnValue(v3);
  if (v8) {
    abort();
  }
  uint64_t v5 = (void *)v4;
  v9 = @"enabled";
  uint64_t v10 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));

  return v6;
}

NSDictionary *__cdecl sub_66A8(id a1)
{
  uint64_t v5 = @"sensitivity";
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v1 cameraButtonSensitivity];
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v6 = v2;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));

  return (NSDictionary *)v3;
}

id sub_6768(uint64_t a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) objectForKey:@"systemOverlay.menuToggleMaxIntervalMilliseconds"]);
  unsigned int v2 = [v1 intValue];

  if (v2) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 500LL;
  }
  v7 = @"doubleLightPressSpeed";
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v3));
  char v8 = v4;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));

  return v5;
}

id sub_6830(uint64_t a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) objectForKey:@"systemOverlay.doubleClickMaxIntervalMilliseconds"]);
  unsigned int v2 = [v1 intValue];

  if (v2) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 400LL;
  }
  v7 = @"doubleClickSpeed";
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v3));
  char v8 = v4;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));

  return v5;
}

void sub_72C0(_Unwind_Exception *a1)
{
}

NSDictionary *__cdecl sub_72E0(id a1)
{
  uint64_t v5 = @"enabled";
  uint64_t v1 = +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  _AXSVoiceOverTouchEnabled(a1));
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  v6 = v2;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_7384(id a1)
{
  uint64_t v5 = @"enabled";
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v1 voiceOverHintsEnabled]));
  v6 = v2;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_7448(id a1)
{
  uint64_t v5 = @"rate";
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v1 voiceOverSpeakingRate];
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
  v6 = v2;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_7508(id a1)
{
  uint64_t v5 = @"enabled";
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v1 voiceOverPitchChangeEnabled]));
  v6 = v2;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_75CC(id a1)
{
  uint64_t v5 = @"enabled";
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v1 voiceOverImageCaptionsEnabled]));
  v6 = v2;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_7690(id a1)
{
  v7[0] = @"enabled";
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v1 voiceOverAudioDuckingEnabled]));
  v7[1] = @"duckingMode";
  v8[0] = v2;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLong:]( NSNumber,  "numberWithLong:",  [v3 voiceOverMediaDuckingMode]));
  v8[1] = v4;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v8,  v7,  2LL));

  return (NSDictionary *)v5;
}

id sub_779C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v3 = @"gender";
  uint64_t v4 = v1;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v4,  &v3,  1LL));
}

id sub_780C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v3 = @"filter";
  uint64_t v4 = v1;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v4,  &v3,  1LL));
}

NSDictionary *__cdecl sub_787C(id a1)
{
  uint64_t v5 = @"Enabled";
  uint64_t v1 = +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  _AXSPhotosensitiveMitigationEnabled(a1));
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  v6 = v2;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_7920(id a1)
{
  uint64_t v5 = @"enabled";
  uint64_t v1 = +[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", _AXSHoverTextEnabled(a1));
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  v6 = v2;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));

  return (NSDictionary *)v3;
}

id sub_79C4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v3 = @"displayMode";
  uint64_t v4 = v1;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v4,  &v3,  1LL));
}

NSDictionary *__cdecl sub_7A34(id a1)
{
  uint64_t v5 = @"enabled";
  uint64_t v1 = +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  _AXSHoverTextTypingEnabled(a1));
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  v6 = v2;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));

  return (NSDictionary *)v3;
}

id sub_7AD8(uint64_t a1)
{
  uint64_t v4 = @"enabled";
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 32)));
  uint64_t v5 = v1;
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v5,  &v4,  1LL));

  return v2;
}

NSDictionary *__cdecl sub_7B78(id a1)
{
  uint64_t v5 = @"enabled";
  uint64_t v1 = +[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", _AXSMonoAudioEnabled(a1));
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  v6 = v2;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_7C1C(id a1)
{
  uint64_t v5 = @"enabled";
  uint64_t v1 = +[NSNumber numberWithUnsignedChar:](&OBJC_CLASS___NSNumber, "numberWithUnsignedChar:", _AXSZoomTouchEnabled(a1));
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  v6 = v2;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_7CC0(id a1)
{
  v9 = @"enabled";
  double Current = CFAbsoluteTimeGetCurrent();
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v3 = [v2 lastSmartInvertColorsEnablement];
  BOOL v5 = Current - v4 < 86400.0 || _AXSInvertColorsEnabled(v3) != 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v5));
  uint64_t v10 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));

  return (NSDictionary *)v7;
}

NSDictionary *__cdecl sub_7DB8(id a1)
{
  BOOL v5 = @"enabled";
  uint64_t v1 = +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  _AXSClosedCaptionsEnabled(a1));
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  v6 = v2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_7E5C(id a1)
{
  BOOL v5 = @"enabled";
  uint64_t v1 = +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  _AXSEnhanceTextLegibilityEnabled(a1));
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  v6 = v2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_7F00(id a1)
{
  BOOL v5 = @"enabled";
  uint64_t v1 = +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  _AXSEnhanceBackgroundContrastEnabled(a1));
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  v6 = v2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_7FA4(id a1)
{
  BOOL v5 = @"enabled";
  uint64_t v1 = +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  _AXSDifferentiateWithoutColorEnabled(a1));
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  v6 = v2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_8048(id a1)
{
  BOOL v5 = @"enabled";
  uint64_t v1 = +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  _AXSReduceMotionEnabled(a1));
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  v6 = v2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_80EC(id a1)
{
  BOOL v5 = @"enabled";
  uint64_t v1 = +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  _AXSButtonShapesEnabled(a1));
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  v6 = v2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_8190(id a1)
{
  BOOL v5 = @"enabled";
  uint64_t v1 = +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  _AXSAssistiveTouchScannerEnabled(a1));
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  v6 = v2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_8234(id a1)
{
  v6 = @"RecipesCount";
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue([v1 switchControlRecipes]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v2 count]));
  v7 = v3;
  double v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1LL));

  return (NSDictionary *)v4;
}

NSDictionary *__cdecl sub_8308(id a1)
{
  BOOL v5 = @"ScanningStyle";
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v1 switchControlScanningStyle]));
  v6 = v2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_83CC(id a1)
{
  BOOL v5 = @"TapBehavior";
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v1 switchControlTapBehavior]));
  v6 = v2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_8490(id a1)
{
  BOOL v5 = @"enabled";
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v1 assistiveTouchScannerSpeechEnabled]));
  v6 = v2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_8554(id a1)
{
  BOOL v5 = @"enabled";
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v1 assistiveTouchScannerSoundEnabled]));
  v6 = v2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_8618(id a1)
{
  BOOL v5 = @"enabled";
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v1 assistiveTouchGroupElementsEnabled]));
  v6 = v2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_86DC(id a1)
{
  BOOL v5 = @"enabled";
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v1 assistiveTouchScannerCursorHighVisibilityEnabled]));
  v6 = v2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));

  return (NSDictionary *)v3;
}

id sub_87A0(uint64_t a1)
{
  double v4 = @"SwitchesCount";
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [*(id *)(a1 + 32) count]));
  BOOL v5 = v1;
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v5,  &v4,  1LL));

  return v2;
}

id sub_8848(uint64_t a1)
{
  double v4 = @"enabled";
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 32)));
  BOOL v5 = v1;
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v5,  &v4,  1LL));

  return v2;
}

id sub_88E8(uint64_t a1)
{
  double v4 = @"enabled";
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 32)));
  BOOL v5 = v1;
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v5,  &v4,  1LL));

  return v2;
}

NSDictionary *__cdecl sub_8988(id a1)
{
  BOOL v5 = @"MultiDeviceCount";
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v1 switchControlPlatformSwitchedCount]));
  v6 = v2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));

  return (NSDictionary *)v3;
}

id sub_8A4C(uint64_t a1)
{
  double v4 = @"enabled";
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [*(id *)(a1 + 32) count] != 0));
  BOOL v5 = v1;
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v5,  &v4,  1LL));

  return v2;
}

id sub_8AF8(uint64_t a1)
{
  BOOL v5 = @"enabled";
  if (*(_BYTE *)(a1 + 40)) {
    BOOL v1 = [*(id *)(a1 + 32) count] != 0;
  }
  else {
    BOOL v1 = 0LL;
  }
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v1));
  v6 = v2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));

  return v3;
}

void sub_8D2C(id a1)
{
  BOOL v1 = -[NSArray initWithObjects:]( objc_alloc(&OBJC_CLASS___NSArray),  "initWithObjects:",  @"UICTContentSizeCategoryXS",  @"UICTContentSizeCategoryS",  @"UICTContentSizeCategoryM",  @"UICTContentSizeCategoryL",  @"UICTContentSizeCategoryXL",  @"UICTContentSizeCategoryXXL",  @"UICTContentSizeCategoryXXXL",  @"UICTContentSizeCategoryAccessibilityM",  @"UICTContentSizeCategoryAccessibilityL",  @"UICTContentSizeCategoryAccessibilityXL",  @"UICTContentSizeCategoryAccessibilityXXL",  @"UICTContentSizeCategoryAccessibilityXXXL",  0LL);
  unsigned int v2 = (void *)qword_10A70;
  qword_10A70 = (uint64_t)v1;
}

id sub_8DD8(uint64_t a1)
{
  double v4 = @"enabled";
  BOOL v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 32)));
  BOOL v5 = v1;
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v5,  &v4,  1LL));

  return v2;
}

id sub_8E78(uint64_t a1)
{
  double v4 = @"size";
  BOOL v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", *(void *)(a1 + 32)));
  BOOL v5 = v1;
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v5,  &v4,  1LL));

  return v2;
}

NSDictionary *__cdecl sub_8F2C(id a1)
{
  v7[0] = @"Enabled";
  BOOL v1 = +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  fabsf(_AXSSideButtonClickSpeed(a1) + -0.4) > 2.2204e-16);
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  v7[1] = @"Speed";
  v8[0] = v2;
  *(float *)&double v3 = _AXSSideButtonClickSpeed(v2);
  double v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v3));
  v8[1] = v4;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v8,  v7,  2LL));

  return (NSDictionary *)v5;
}

void *sub_9064(uint64_t a1)
{
  BOOL v5 = 0LL;
  if (!qword_10A88)
  {
    __int128 v6 = off_C8C0;
    uint64_t v7 = 0LL;
    qword_10A88 = _sl_dlopen(&v6, &v5);
    double v3 = v5;
    unsigned int v2 = (void *)qword_10A88;
    if (qword_10A88)
    {
      if (!v5) {
        goto LABEL_5;
      }
    }

    else
    {
      double v3 = (char *)abort_report_np("%s", v5);
    }

    free(v3);
    goto LABEL_5;
  }

  unsigned int v2 = (void *)qword_10A88;
LABEL_5:
  result = dlsym(v2, "kSCROBrailleDisplayModelIdentifier");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  qword_10A80 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

void sub_9154()
{
  v0 = dlerror();
  uint64_t v1 = abort_report_np("%s", v0);
  AXCPSharedResourcesDirectory(v1);
}

id objc_msgSend_voiceOverSpeakingRate(void *a1, const char *a2, ...)
{
  return [a1 voiceOverSpeakingRate];
}