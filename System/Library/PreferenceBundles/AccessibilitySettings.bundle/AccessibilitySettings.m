AXTVBrailleLanguageVariantsController *sub_36F0(uint64_t a1)
{
  AXTVBrailleLanguageVariantsController *v2;
  void *v3;
  AXTVBrailleLanguageVariantsController *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v15;
  v2 = objc_alloc(&OBJC_CLASS___AXTVBrailleLanguageVariantsController);
  v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) tableEnumerator]);
  v4 = -[AXTVBrailleLanguageVariantsController initWithTableEnumerator:](v2, "initWithTableEnumerator:", v3);

  v12 = AXTVLocString(@"AXBrailleTranslationDefaultLanguageTitle", v5, v6, v7, v8, v9, v10, v11, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  -[AXTVBrailleLanguageVariantsController setTitle:](v4, "setTitle:", v13);

  -[AXTVBrailleLanguageVariantsController setLocale:](v4, "setLocale:", *(void *)(a1 + 40));
  -[AXTVBrailleLanguageVariantsController setModifyingDefaultLanguage:](v4, "setModifyingDefaultLanguage:", 1LL);
  return v4;
}

AXTVBrailleLanguageVariantsController *sub_3788(uint64_t a1)
{
  v2 = objc_alloc(&OBJC_CLASS___AXTVBrailleLanguageVariantsController);
  v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) tableEnumerator]);
  v4 = -[AXTVBrailleLanguageVariantsController initWithTableEnumerator:](v2, "initWithTableEnumerator:", v3);

  id v12 = AXTVLocString(@"AXBrailleTranslationDefaultLanguageTitle", v5, v6, v7, v8, v9, v10, v11, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  -[AXTVBrailleLanguageVariantsController setTitle:](v4, "setTitle:", v13);

  -[AXTVBrailleLanguageVariantsController setLocale:](v4, "setLocale:", *(void *)(a1 + 40));
  -[AXTVBrailleLanguageVariantsController setModifyingDefaultLanguage:](v4, "setModifyingDefaultLanguage:", 1LL);
  return v4;
}

LABEL_7:
  v13 = BRLLogTranslation();
  v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138412290;
    v18 = v7;
    _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "Setting new items after removing: %@", (uint8_t *)&v17, 0xCu);
  }

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v15 setVoiceOverBrailleLanguageRotorItems:v7];

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBrailleLanguageController tableView](self, "tableView"));
  [v16 setEditing:0];

  -[AXTVBrailleLanguageController _updateNavigationItem](self, "_updateNavigationItem");
  -[AXTVBrailleLanguageController reloadSettings](self, "reloadSettings");
}

void sub_4060( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

void sub_409C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained deleteTableFromRotor:*(void *)(a1 + 32)];
}

AXTVEnableSettingWithDurationViewController *sub_47AC()
{
  v0 = objc_alloc(&OBJC_CLASS___AXTVEnableSettingWithDurationViewController);
  uint64_t v1 = AXParameterizedLocalizedString(2LL, @"STEP_REPEAT_LABEL");
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  uint64_t v3 = AXParameterizedLocalizedString(2LL, @"STEP_REPEAT_FOOTER");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v12 = AXTVLocString(@"STEP_REPEAT_ADJUST_INSTRUCTIONS", v5, v6, v7, v8, v9, v10, v11, v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = -[AXTVEnableSettingWithDurationViewController initWithTitle:description:featureOnOffKey:featureDurationKey:featureDurationAdjustmentInstructions:minimumDuration:maximumDuration:discreteAdjustmentValue:]( v0,  "initWithTitle:description:featureOnOffKey:featureDurationKey:featureDurationAdjustmentInstructions:minimumDura tion:maximumDuration:discreteAdjustmentValue:",  v2,  v4,  @"assistiveTouchActionRepeatEnabled",  @"assistiveTouchActionRepeatInterval",  v13,  kAXSAssistiveTouchActionRepeatIntervalMin,  kAXSAssistiveTouchActionRepeatIntervalMax,  0.1);

  return v14;
}

void sub_4878(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  if ([v3 assistiveTouchActionRepeatEnabled])
  {
    [*(id *)(a1 + 32) assistiveTouchActionRepeatInterval];
    uint64_t v8 = AXLocDuration(0LL, v5, v6, v7);
  }

  else
  {
    uint64_t v8 = AXParameterizedLocalizedString(2LL, @"FEATURE_OFF");
  }

  id v9 = (id)objc_claimAutoreleasedReturnValue(v8);
  [v4 setLocalizedValue:v9];
}

AXTVEnableSettingWithDurationViewController *sub_4AA0(uint64_t a1)
{
  v2 = objc_alloc(&OBJC_CLASS___AXTVEnableSettingWithDurationViewController);
  uint64_t v3 = AXParameterizedLocalizedString(2LL, @"LONG_PRESS_LABEL");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = AXParameterizedLocalizedString(2LL, @"LONG_PRESS_FOOTER");
  double v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v14 = AXTVLocString(@"LONG_PRESS_ADJUST_INSTRUCTIONS", v7, v8, v9, v10, v11, v12, v13, v27);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  uint64_t v16 = -[AXTVEnableSettingWithDurationViewController initWithTitle:description:featureOnOffKey:featureDurationKey:featureDurationAdjustmentInstructions:minimumDuration:maximumDuration:discreteAdjustmentValue:]( v2,  "initWithTitle:description:featureOnOffKey:featureDurationKey:featureDurationAdjustmentInstructions:minimumDura tion:maximumDuration:discreteAdjustmentValue:",  v4,  v6,  @"assistiveTouchLongPressEnabled",  @"assistiveTouchLongPressDuration",  v15,  kAXSAssistiveTouchLongPressDurationMin,  kAXSAssistiveTouchLongPressDurationMax,  0.1);

  uint64_t v17 = AXParameterizedLocalizedString(2LL, @"LONG_PRESS_DURATION");
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  -[AXTVEnableSettingWithDurationViewController setSettingDurationTitle:](v16, "setSettingDurationTitle:", v18);

  uint64_t v19 = AXParameterizedLocalizedString(2LL, @"LONG_PRESS_PAUSE_SCANNING");
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v20,  0LL,  *(void *)(a1 + 32),  @"assistiveTouchLongPressPauseScanningEnabled",  *(void *)(a1 + 40),  "_longPressPauseScanningToggled:"));

  uint64_t v22 = AXParameterizedLocalizedString(2LL, @"LONG_PRESS_PAUSE_SCANNING_FOOTER");
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  [v21 setLocalizedDescription:v23];

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVUtils BOOLeanOnOffFormatter](&OBJC_CLASS___AXTVUtils, "BOOLeanOnOffFormatter"));
  [v21 setLocalizedValueFormatter:v24];

  uint64_t v27 = (uint64_t)v21;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v27, 1LL));
  -[AXTVEnableSettingWithDurationViewController setAdditionalSettingsItems:](v16, "setAdditionalSettingsItems:", v25);

  return v16;
}

void sub_4CA4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  if ([v3 assistiveTouchLongPressEnabled])
  {
    [*(id *)(a1 + 32) assistiveTouchLongPressDuration];
    uint64_t v8 = AXLocDuration(0LL, v5, v6, v7);
  }

  else
  {
    uint64_t v8 = AXParameterizedLocalizedString(2LL, @"FEATURE_OFF");
  }

  id v9 = (id)objc_claimAutoreleasedReturnValue(v8);
  [v4 setLocalizedValue:v9];
}

id sub_4E24(uint64_t a1)
{
  uint64_t v2 = AXParameterizedLocalizedString(2LL, @"SCANNING_SPEED_LABEL");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v11 = AXTVLocString(@"SCANNING_SPEED_ADJUST_INSTRUCTIONS", v4, v5, v6, v7, v8, v9, v10, v19);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  double v13 = kAXSAssistiveTouchStepIntervalMin;
  double v14 = kAXSAssistiveTouchStepIntervalMax;
  [*(id *)(a1 + 32) assistiveTouchStepInterval];
  double v16 = v15;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_4F3C;
  v20[3] = &unk_65250;
  id v21 = *(id *)(a1 + 32);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[AXTVSliderViewController sliderWithTitle:subtitle:minimumValue:maximumValue:currentValue:discreteStepAmount:valueChangeHandler:valueFormatHandler:]( &OBJC_CLASS___AXTVSliderViewController,  "sliderWithTitle:subtitle:minimumValue:maximumValue:currentValue:discreteStepAmount:valueChangeHandle r:valueFormatHandler:",  v3,  v12,  v20,  &stru_65290,  v13,  v14,  v16,  0.1));

  return v17;
}

id sub_4F3C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAssistiveTouchStepInterval:");
}

NSString *__cdecl sub_4F44(id a1, double a2, double a3, double a4)
{
  return (NSString *)AXLocDuration(0LL, a2, a3, a4);
}

AXTVEnableSettingWithDurationViewController *sub_5080()
{
  v0 = objc_alloc(&OBJC_CLASS___AXTVEnableSettingWithDurationViewController);
  uint64_t v1 = AXParameterizedLocalizedString(2LL, @"DELAY_AFTER_INPUT");
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  uint64_t v3 = AXParameterizedLocalizedString(2LL, @"DELAY_AFTER_INPUT_FOOTER");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v12 = AXTVLocString(@"DELAY_AFTER_INPUT_ADJUST_INSTRUCTIONS", v5, v6, v7, v8, v9, v10, v11, v16);
  double v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  double v14 = -[AXTVEnableSettingWithDurationViewController initWithTitle:description:featureOnOffKey:featureDurationKey:featureDurationAdjustmentInstructions:minimumDuration:maximumDuration:discreteAdjustmentValue:]( v0,  "initWithTitle:description:featureOnOffKey:featureDurationKey:featureDurationAdjustmentInstructions:minimumDura tion:maximumDuration:discreteAdjustmentValue:",  v2,  v4,  @"assistiveTouchDelayAfterInputEnabled",  @"assistiveTouchDelayAfterInput",  v13,  kAXSAssistiveTouchDelayAfterInputMin,  kAXSAssistiveTouchDelayAfterInputMax,  0.1);

  return v14;
}

void sub_514C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  if ([v3 assistiveTouchDelayAfterInputEnabled])
  {
    [*(id *)(a1 + 32) assistiveTouchDelayAfterInput];
    uint64_t v8 = AXLocDuration(0LL, v5, v6, v7);
  }

  else
  {
    uint64_t v8 = AXParameterizedLocalizedString(2LL, @"FEATURE_OFF");
  }

  id v9 = (id)objc_claimAutoreleasedReturnValue(v8);
  [v4 setLocalizedValue:v9];
}

AXTVEnableSettingWithDurationViewController *sub_53D8()
{
  v0 = objc_alloc(&OBJC_CLASS___AXTVEnableSettingWithDurationViewController);
  uint64_t v1 = AXParameterizedLocalizedString(2LL, @"SCAN_TIMEOUT_LABEL");
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  uint64_t v3 = AXParameterizedLocalizedString(2LL, @"SCAN_TIMEOUT_FOOTER");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v12 = AXTVLocString(@"SCAN_TIMEOUT_ADJUST_INSTRUCTIONS", v5, v6, v7, v8, v9, v10, v11, v16);
  double v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  double v14 = -[AXTVEnableSettingWithDurationViewController initWithTitle:description:featureOnOffKey:featureDurationKey:featureDurationAdjustmentInstructions:minimumDuration:maximumDuration:discreteAdjustmentValue:]( v0,  "initWithTitle:description:featureOnOffKey:featureDurationKey:featureDurationAdjustmentInstructions:minimumDura tion:maximumDuration:discreteAdjustmentValue:",  v2,  v4,  @"assistiveTouchScanTimeoutEnabled",  @"assistiveTouchScanTimeout",  v13,  kAXSAssistiveTouchScanTimeoutMin,  kAXSAssistiveTouchScanTimeoutMax,  0.1);

  return v14;
}

void sub_54A4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  if ([v3 assistiveTouchScanTimeoutEnabled])
  {
    [*(id *)(a1 + 32) assistiveTouchScanTimeout];
    uint64_t v8 = AXLocDuration(0LL, v5, v6, v7);
  }

  else
  {
    uint64_t v8 = AXParameterizedLocalizedString(2LL, @"FEATURE_OFF");
  }

  id v9 = (id)objc_claimAutoreleasedReturnValue(v8);
  [v4 setLocalizedValue:v9];
}

id sub_5624(uint64_t a1)
{
  uint64_t v2 = AXParameterizedLocalizedString(2LL, @"DWELL_TIME_LABEL");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v11 = AXTVLocString(@"DWELL_TIME_ADJUST_INSTRUCTIONS", v4, v5, v6, v7, v8, v9, v10, v19);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  double v13 = kAXSSwitchControlDwellTimeMin;
  double v14 = kAXSSwitchControlDwellTimeMax;
  [*(id *)(a1 + 32) switchControlDwellTime];
  double v16 = v15;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_573C;
  v20[3] = &unk_65250;
  id v21 = *(id *)(a1 + 32);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[AXTVSliderViewController sliderWithTitle:subtitle:minimumValue:maximumValue:currentValue:discreteStepAmount:valueChangeHandler:valueFormatHandler:]( &OBJC_CLASS___AXTVSliderViewController,  "sliderWithTitle:subtitle:minimumValue:maximumValue:currentValue:discreteStepAmount:valueChangeHandle r:valueFormatHandler:",  v3,  v12,  v20,  &stru_652B0,  v13,  v14,  v16,  0.1));

  return v17;
}

id sub_573C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSwitchControlDwellTime:");
}

NSString *__cdecl sub_5744(id a1, double a2, double a3, double a4)
{
  return (NSString *)AXLocDuration(0LL, a2, a3, a4);
}

AXTVEnableSettingWithDurationViewController *sub_5DD0()
{
  v0 = objc_alloc(&OBJC_CLASS___AXTVEnableSettingWithDurationViewController);
  uint64_t v1 = AXParameterizedLocalizedString(2LL, @"REQUIRE_HOLD_LABEL");
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  uint64_t v3 = AXParameterizedLocalizedString(2LL, @"REQUIRE_HOLD_FOOTER_TEXT");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v12 = AXTVLocString(@"REQUIRE_HOLD_ADJUST_INSTRUCTIONS", v5, v6, v7, v8, v9, v10, v11, v16);
  double v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  double v14 = -[AXTVEnableSettingWithDurationViewController initWithTitle:description:featureOnOffKey:featureDurationKey:featureDurationAdjustmentInstructions:minimumDuration:maximumDuration:discreteAdjustmentValue:]( v0,  "initWithTitle:description:featureOnOffKey:featureDurationKey:featureDurationAdjustmentInstructions:minimumDura tion:maximumDuration:discreteAdjustmentValue:",  v2,  v4,  @"assistiveTouchInputHoldEnabled",  @"assistiveTouchInputHoldDuration",  v13,  kAXSAssistiveTouchInputHoldDurationMin,  kAXSAssistiveTouchInputHoldDurationMax,  0.1);

  return v14;
}

void sub_5E9C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  if ([v3 assistiveTouchInputHoldEnabled])
  {
    [*(id *)(a1 + 32) assistiveTouchInputHoldDuration];
    uint64_t v8 = AXLocDuration(0LL, v5, v6, v7);
  }

  else
  {
    uint64_t v8 = AXParameterizedLocalizedString(2LL, @"FEATURE_OFF");
  }

  id v9 = (id)objc_claimAutoreleasedReturnValue(v8);
  [v4 setLocalizedValue:v9];
}

AXTVEnableSettingWithDurationViewController *sub_5F28()
{
  v0 = objc_alloc(&OBJC_CLASS___AXTVEnableSettingWithDurationViewController);
  uint64_t v1 = AXParameterizedLocalizedString(2LL, @"IGNORE_REPEAT_LABEL");
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  uint64_t v3 = AXParameterizedLocalizedString(2LL, @"IGNORE_REPEAT_FOOTER");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v12 = AXTVLocString(@"IGNORE_REPEAT_ADJUST_INSTRUCTIONS", v5, v6, v7, v8, v9, v10, v11, v16);
  double v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  double v14 = -[AXTVEnableSettingWithDurationViewController initWithTitle:description:featureOnOffKey:featureDurationKey:featureDurationAdjustmentInstructions:minimumDuration:maximumDuration:discreteAdjustmentValue:]( v0,  "initWithTitle:description:featureOnOffKey:featureDurationKey:featureDurationAdjustmentInstructions:minimumDura tion:maximumDuration:discreteAdjustmentValue:",  v2,  v4,  @"assistiveTouchInputCoalescingEnabled",  @"assistiveTouchInputCoalescingDuration",  v13,  kAXSAssistiveTouchInputCoalescingDurationMin,  kAXSAssistiveTouchInputCoalescingDurationMax,  0.1);

  return v14;
}

void sub_5FF4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  if ([v3 assistiveTouchInputCoalescingEnabled])
  {
    [*(id *)(a1 + 32) assistiveTouchInputCoalescingDuration];
    uint64_t v8 = AXLocDuration(0LL, v5, v6, v7);
  }

  else
  {
    uint64_t v8 = AXParameterizedLocalizedString(2LL, @"FEATURE_OFF");
  }

  id v9 = (id)objc_claimAutoreleasedReturnValue(v8);
  [v4 setLocalizedValue:v9];
}

NSString *__cdecl sub_6774(id a1, NSNumber *a2)
{
  return (NSString *)AXAssistiveTouchScannerColorDescription(-[NSNumber integerValue](a2, "integerValue"));
}

AXTVAirPodsSettingsViewController *sub_6B14(uint64_t a1)
{
  return  -[AXTVAirPodsSettingsViewController initWithDevice:]( objc_alloc(&OBJC_CLASS___AXTVAirPodsSettingsViewController),  "initWithDevice:",  *(void *)(a1 + 32));
}

void sub_711C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, id *a12, id *a13)
{
}

id sub_71E0(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  double v5 = (void *)objc_claimAutoreleasedReturnValue( [WeakRetained _fontControllerWithItem:v3 nameKey:@"textMonospaceSerifFontName" overrideKey:@"videoOverridesTextMonospaceSerifFontName"]);

  return v5;
}

id sub_7244(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  double v5 = (void *)objc_claimAutoreleasedReturnValue( [WeakRetained _fontControllerWithItem:v3 nameKey:@"textProportionalSerifFontName" overrideKey:@"videoOverridesTextProportionalSerifFontName"]);

  return v5;
}

id sub_72A8(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  double v5 = (void *)objc_claimAutoreleasedReturnValue( [WeakRetained _fontControllerWithItem:v3 nameKey:@"textMonospaceSansSerifFontName" overrideKey:@"videoOverridesTextMonospaceSansSerifFontName"]);

  return v5;
}

id sub_730C(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  double v5 = (void *)objc_claimAutoreleasedReturnValue( [WeakRetained _fontControllerWithItem:v3 nameKey:@"textProportionalSansSerifFontName" overrideKey:@"videoOverridesTextProportionalSansSerifFontName"]);

  return v5;
}

id sub_7370(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  double v5 = (void *)objc_claimAutoreleasedReturnValue( [WeakRetained _fontControllerWithItem:v3 nameKey:@"textCasualFontName" overrideKey:@"videoOverridesTextCasualFontName"]);

  return v5;
}

id sub_73D4(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  double v5 = (void *)objc_claimAutoreleasedReturnValue( [WeakRetained _fontControllerWithItem:v3 nameKey:@"textProportionalSerifFontName" overrideKey:@"videoOverridesTextProportionalSerifFontName"]);

  return v5;
}

id sub_7438(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  double v5 = (void *)objc_claimAutoreleasedReturnValue( [WeakRetained _fontControllerWithItem:v3 nameKey:@"textSmallCapitalFontName" overrideKey:@"videoOverridesTextSmallCapitalFontName"]);

  return v5;
}

void sub_7FAC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, id *a10, id *a11, id *a12, id *a13)
{
}

id sub_80E4(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  double v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _editFontViewController:v3]);

  return v5;
}

id sub_8138(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v11 = AXTVLocString(@"AXCaptionStyleSizeOverrideDescription", v4, v5, v6, v7, v8, v9, v10, v16);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v14 = (void *)objc_claimAutoreleasedReturnValue( [WeakRetained _editingViewControllerWithSetting:v3 overrideKey:@"videoOverridesTextSize" overrideDescription:v12 availableValues:0]);

  return v14;
}

id sub_81B4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v11 = AXTVLocString(@"AXCaptionStyleColorOverrideDescription", v4, v5, v6, v7, v8, v9, v10, v17);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v14 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVUtils captionColors](&OBJC_CLASS___AXTVUtils, "captionColors"));
  double v15 = (void *)objc_claimAutoreleasedReturnValue( [WeakRetained _editingViewControllerWithSetting:v3 overrideKey:@"videoOverridesTextColor" overrideDescription:v12 availableValues:v14]);

  return v15;
}

id sub_8254(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v11 = AXTVLocString(@"AXCaptionStyleBackgroundColorOverrideDescription", v4, v5, v6, v7, v8, v9, v10, v17);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v14 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVUtils captionColors](&OBJC_CLASS___AXTVUtils, "captionColors"));
  double v15 = (void *)objc_claimAutoreleasedReturnValue( [WeakRetained _editingViewControllerWithSetting:v3 overrideKey:@"videoOverridesBackgroundColor" overrideDescription:v12 availableValues:v14]);

  return v15;
}

id sub_82F4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v11 = AXTVLocString(@"AXCaptionStyleBackgroundOpacityOverrideDescription", v4, v5, v6, v7, v8, v9, v10, v16);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v14 = (void *)objc_claimAutoreleasedReturnValue( [WeakRetained _editingViewControllerWithSetting:v3 overrideKey:@"videoOverridesBackgroundOpacity" overrideDescription:v12 availableValues:0]);

  return v14;
}

id sub_8370(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v11 = AXTVLocString(@"AXCaptionStyleTextOpacityOverrideDescription", v4, v5, v6, v7, v8, v9, v10, v16);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v14 = (void *)objc_claimAutoreleasedReturnValue( [WeakRetained _editingViewControllerWithSetting:v3 overrideKey:@"videoOverridesTextOpacity" overrideDescription:v12 availableValues:0]);

  return v14;
}

id sub_83EC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v11 = AXTVLocString(@"AXCaptionStyleTextEdgeOverrideDescription", v4, v5, v6, v7, v8, v9, v10, v16);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v14 = (void *)objc_claimAutoreleasedReturnValue( [WeakRetained _editingViewControllerWithSetting:v3 overrideKey:@"videoOverridesTextEdgeStyle" overrideDescription:v12 availableValues:0]);

  return v14;
}

id sub_8468(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _editTextHighlightViewController:v3]);

  return v5;
}

void sub_88F8(_Unwind_Exception *a1)
{
}

NSString *__cdecl sub_8914(id a1, id a2)
{
  return (NSString *)a2;
}

id sub_8928(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v7 = v5;
  if (WeakRetained)
  {
    if ([v5 length])
    {
      double v15 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained style]);
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 name]);
      unsigned __int8 v17 = [v5 isEqual:v16];

      uint64_t v7 = v5;
      if ((v17 & 1) != 0) {
        goto LABEL_13;
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVAudioVideoFacade sharedInstance](&OBJC_CLASS___AXTVAudioVideoFacade, "sharedInstance"));
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 availableCaptionStyles]);
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472LL;
      v34[2] = sub_8ABC;
      v34[3] = &unk_65380;
      id v20 = v5;
      id v35 = v20;
      id v21 = [v19 indexOfObjectPassingTest:v34];

      if (v21 == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        v29 = 0LL;
      }

      else
      {
        id v31 = AXTVLocString(@"AXCaptionExistsFormat", v22, v23, v24, v25, v26, v27, v28, (uint64_t)v20);
        v29 = (void *)objc_claimAutoreleasedReturnValue(v31);
      }
    }

    else
    {
      id v30 = AXTVLocString(@"AXCaptionTooShortError", v8, v9, v10, v11, v12, v13, v14, v33);
      v29 = (void *)objc_claimAutoreleasedReturnValue(v30);
    }

    uint64_t v7 = v5;
    if (v29)
    {
      if (a3) {
        *a3 = v29;
      }

      uint64_t v7 = 0LL;
    }
  }

LABEL_13:
  return v7;
}

id sub_8ABC(uint64_t a1, void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a2 name]);
  id v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

void sub_9170( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, id location)
{
}

void sub_91C0(uint64_t a1)
{
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained featureOnOffKey]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v7 valueForKey:v3]);
  uint64_t v5 = [v4 BOOLValue] ^ 1;
  id v6 = objc_loadWeakRetained((id *)(a1 + 32));
  [v6 setHidden:v5];
}

id sub_9264(uint64_t a1, void *a2)
{
  id v22 = a2;
  uint64_t v23 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained featureDurationAdjustmentInstructions]);
  id v5 = objc_loadWeakRetained((id *)(a1 + 48));
  [v5 mimimumDuration];
  double v7 = v6;
  id v8 = objc_loadWeakRetained((id *)(a1 + 48));
  [v8 maximumDuration];
  double v10 = v9;
  uint64_t v11 = *(void **)(a1 + 40);
  id v12 = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 featureDurationKey]);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v11 valueForKey:v13]);
  [v14 doubleValue];
  double v16 = v15;
  id v17 = objc_loadWeakRetained((id *)(a1 + 48));
  [v17 discreteAdjustmentValue];
  double v19 = v18;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_942C;
  v24[3] = &unk_653F8;
  id v25 = *(id *)(a1 + 40);
  objc_copyWeak(&v26, (id *)(a1 + 48));
  id v20 = (void *)objc_claimAutoreleasedReturnValue( +[AXTVSliderViewController sliderWithTitle:subtitle:minimumValue:maximumValue:currentValue:discreteStepAmount:valueChangeHandler:valueFormatHandler:]( &OBJC_CLASS___AXTVSliderViewController,  "sliderWithTitle:subtitle:minimumValue:maximumValue:currentValue:discreteStepAmount:valueChangeHandle r:valueFormatHandler:",  v23,  v4,  v24,  &stru_65418,  v7,  v10,  v16,  v19));

  objc_destroyWeak(&v26);
  return v20;
}

void sub_9418(_Unwind_Exception *a1)
{
}

void sub_942C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained featureDurationKey]);
  [v2 setValue:v5 forKey:v4];
}

NSString *__cdecl sub_94A4(id a1, double a2, double a3, double a4)
{
  return (NSString *)AXLocDuration(0LL, a2, a3, a4);
}

NSString *__cdecl sub_995C(id a1, NSNumber *a2)
{
  unint64_t v2 = (unint64_t)-[NSNumber integerValue](a2, "integerValue") - 1;
  if (v2 > 2) {
    id v3 = @"described.media.none";
  }
  else {
    id v3 = off_65480[v2];
  }
  uint64_t v4 = AXParameterizedLocalizedString(1LL, v3);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue(v4);
}

void sub_9B0C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_9B30(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSettings];
}

UIViewController *__cdecl sub_9C8C(id a1, TSKSettingItem *a2)
{
  unint64_t v2 = objc_alloc_init(&OBJC_CLASS___TTSSubstitution);
  id v3 = -[AXTVSpeechPronunciationDetailsViewController initWithPronunciation:]( objc_alloc(&OBJC_CLASS___AXTVSpeechPronunciationDetailsViewController),  "initWithPronunciation:",  v2);

  return (UIViewController *)v3;
}

void sub_9DA8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 originalString]);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_9E6C;
  v7[3] = &unk_65200;
  id v8 = v3;
  id v5 = v3;
  double v6 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v4,  0LL,  v5,  0LL,  v7));

  [*(id *)(a1 + 32) addObject:v6];
}

AXTVSpeechPronunciationDetailsViewController *sub_9E6C(uint64_t a1)
{
  return  -[AXTVSpeechPronunciationDetailsViewController initWithPronunciation:]( objc_alloc(&OBJC_CLASS___AXTVSpeechPronunciationDetailsViewController),  "initWithPronunciation:",  *(void *)(a1 + 32));
}

void sub_A428( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
}

void sub_A460(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) representedObject]);
  [WeakRetained _removePronuncation:v2];
}
}

id sub_AF24(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAccessoryTintColor];
}

void sub_B170(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.3));
  unint64_t v2 = (void *)qword_804F0;
  qword_804F0 = v1;

  uint64_t v3 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 0.4));
  uint64_t v4 = (void *)qword_804F8;
  qword_804F8 = v3;
}

id sub_B588(uint64_t a1, void *a2)
{
  return [a2 _reloadSettingsItemsForSettingsChange];
}

void sub_BAF4(id a1, TSKSettingItem *a2, id a3)
{
  double v6 = a2;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v4 = [v3 switchControlScanningStyle];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TSKSettingItem representedObject](v6, "representedObject"));
  LODWORD(v4) = v4 == [v5 integerValue];

  -[TSKSettingItem setAccessoryTypes:](v6, "setAccessoryTypes:", 2LL * v4);
}

BOOL sub_C67C(id a1, NSDictionary *a2, unint64_t a3, BOOL *a4)
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](a2, "objectForKeyedSubscript:", @"Default"));
  unsigned int v6 = [v5 BOOLValue];

  if (v6) {
    *a4 = 1;
  }
  return v6;
}

LABEL_12:
}

void sub_D130(id a1, TSKSettingItem *a2, id a3)
{
  uint64_t v3 = a2;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[TSKSettingItem representedObject](v3, "representedObject"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:AXSSwitchControlMenuItemEnabledKey]);
  unsigned int v5 = [v4 BOOLValue];

  if (v5) {
    uint64_t v6 = 2LL;
  }
  else {
    uint64_t v6 = 0LL;
  }
  -[TSKSettingItem setAccessoryTypes:](v3, "setAccessoryTypes:", v6);
}

void sub_DAC8(id a1, TSKSettingItem *a2, id a3)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance", a3));
  unsigned int v4 = [v3 voiceOverTouchBrailleDisplaySyncInputOutputTables];

  if (v4)
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v7 voiceOverTouchBrailleDisplayOutputTableIdentifier]);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    [v6 setVoiceOverTouchBrailleDisplayInputTableIdentifier:v5];
  }

NSString *__cdecl sub_DB68(id a1, NSString *a2)
{
  unint64_t v2 = a2;
  uint64_t v3 = -[BRLTTable initWithIdentifier:](objc_alloc(&OBJC_CLASS___BRLTTable), "initWithIdentifier:", v2);

  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[BRLTTable localizedNameWithService](v3, "localizedNameWithService"));
  return (NSString *)v4;
}

void sub_DBC0(id a1, TSKSettingItem *a2, id a3)
{
  uint64_t v3 = a2;
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned int v5 = [v4 voiceOverTouchBrailleDisplaySyncInputOutputTables];

  if (v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 voiceOverTouchBrailleDisplayOutputTableIdentifier]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    [v8 setVoiceOverTouchBrailleDisplayInputTableIdentifier:v7];
  }

  id v9 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  -[TSKSettingItem setHidden:]( v3,  "setHidden:",  [v9 voiceOverTouchBrailleDisplaySyncInputOutputTables] ^ 1);
}

NSString *__cdecl sub_DC88(id a1, NSString *a2)
{
  unint64_t v2 = a2;
  uint64_t v3 = -[BRLTTable initWithIdentifier:](objc_alloc(&OBJC_CLASS___BRLTTable), "initWithIdentifier:", v2);

  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[BRLTTable localizedNameWithService](v3, "localizedNameWithService"));
  return (NSString *)v4;
}

void sub_DCE0(id a1, TSKSettingItem *a2, id a3)
{
  uint64_t v3 = a2;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  -[TSKSettingItem setHidden:](v3, "setHidden:", [v4 voiceOverTouchBrailleDisplaySyncInputOutputTables]);
}

NSString *__cdecl sub_DD38(id a1, NSString *a2)
{
  unint64_t v2 = a2;
  uint64_t v3 = -[BRLTTable initWithIdentifier:](objc_alloc(&OBJC_CLASS___BRLTTable), "initWithIdentifier:", v2);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[BRLTTable localizedNameWithService](v3, "localizedNameWithService"));
  return (NSString *)v4;
}

void sub_DD90(id a1, TSKSettingItem *a2, id a3)
{
  uint64_t v3 = a2;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  -[TSKSettingItem setHidden:](v3, "setHidden:", [v4 voiceOverTouchBrailleDisplaySyncInputOutputTables]);
}

NSString *__cdecl sub_DDE8(id a1, NSNumber *a2)
{
  NSInteger v2 = -[NSNumber integerValue](a2, "integerValue");
  double v10 = @"AXBrailleSixDot";
  if (v2 == 3) {
    double v10 = @"AXBrailleContracted";
  }
  if (v2 == 2) {
    uint64_t v11 = @"AXBrailleEightDot";
  }
  else {
    uint64_t v11 = (__CFString *)v10;
  }
  id v12 = AXTVLocString(v11, v3, v4, v5, v6, v7, v8, v9, vars0);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue(v12);
}

NSString *__cdecl sub_DE30(id a1, NSNumber *a2)
{
  NSInteger v2 = -[NSNumber integerValue](a2, "integerValue");
  double v10 = @"AXBrailleSixDot";
  if (v2 == 3) {
    double v10 = @"AXBrailleContracted";
  }
  if (v2 == 2) {
    uint64_t v11 = @"AXBrailleEightDot";
  }
  else {
    uint64_t v11 = (__CFString *)v10;
  }
  id v12 = AXTVLocString(v11, v3, v4, v5, v6, v7, v8, v9, vars0);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue(v12);
}

id sub_DE78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v9 = AXTVLocString(@"AXBrailleAlertDisplayDurationTitle", a2, a3, a4, a5, a6, a7, a8, v26);
  double v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v18 = AXTVLocString(@"AXBrailleAlertDisplayDurationDescription", v11, v12, v13, v14, v15, v16, v17, v27);
  double v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  double v20 = kAXSVoiceOverBrailleDisplayIntervalMin;
  double v21 = kAXSVoiceOverBrailleDisplayIntervalMax;
  [*(id *)(a1 + 32) voiceOverBrailleAlertDisplayDuration];
  double v23 = v22;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_DF94;
  v28[3] = &unk_65250;
  id v29 = *(id *)(a1 + 32);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[AXTVSliderViewController sliderWithTitle:subtitle:minimumValue:maximumValue:currentValue:discreteStepAmount:valueChangeHandler:valueFormatHandler:]( &OBJC_CLASS___AXTVSliderViewController,  "sliderWithTitle:subtitle:minimumValue:maximumValue:currentValue:discreteStepAmount:valueChangeHandle r:valueFormatHandler:",  v10,  v19,  v28,  &stru_65770,  v20,  v21,  v23,  0.0));

  return v24;
}

id sub_DF94(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setVoiceOverBrailleAlertDisplayDuration:");
}

NSString *__cdecl sub_DF9C(id a1, double a2, double a3, double a4)
{
  return (NSString *)AXLocDuration(0LL, a2, a3, a4);
}

void sub_E78C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_E7B4(uint64_t a1, void *a2)
{
  NSInteger v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained pronunciation]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 originalString]);
  objc_msgSend(v3, "setEnabled:", objc_msgSend(v5, "length") != 0);
}

void sub_EA08( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

AXTVMultiLanguageChooserViewController *sub_EA34(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_alloc(&OBJC_CLASS___AXTVMultiLanguageChooserViewController);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) pronunciation]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 languages]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allObjects]);
  uint64_t v8 = -[AXTVMultiLanguageChooserViewController initWithSelectedLanguages:](v4, "initWithSelectedLanguages:", v7);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_EB34;
  v10[3] = &unk_657C0;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  -[AXTVMultiLanguageChooserViewController setWillFinsishWithSelectedLanguagesHandler:]( v8,  "setWillFinsishWithSelectedLanguagesHandler:",  v10);
  objc_destroyWeak(&v11);

  return v8;
}

void sub_EB20(_Unwind_Exception *a1)
{
}

void sub_EB34(uint64_t a1, void *a2)
{
  NSInteger v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained pronunciation]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v3));

  [v4 setLanguages:v5];
}

void sub_F150(id a1, TTSSpeechAction *a2, BOOL a3)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance", a3));
  [v3 setActive:0 error:0];
}

NSString *__cdecl sub_F1B4(id a1, NSSet *a2)
{
  NSInteger v2 = a2;
  if (!-[NSSet count](v2, "count"))
  {
    uint64_t v12 = @"AXSpeechPronunciationLanguageAllOption";
LABEL_6:
    id v13 = AXTVLocString(v12, v3, v4, v5, v6, v7, v8, v9, v15);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v13);
    goto LABEL_7;
  }

  if ((char *)-[NSSet count](v2, "count") != (char *)&dword_0 + 1)
  {
    uint64_t v12 = @"AXSpeechPronunciationLanguageMultipleOption";
    goto LABEL_6;
  }

  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSSet anyObject](v2, "anyObject"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[AXTVMultiLanguageChooserViewController localizedNameForLanguageIdentifier:]( &OBJC_CLASS___AXTVMultiLanguageChooserViewController,  "localizedNameForLanguageIdentifier:",  v10));

LABEL_7:
  return (NSString *)v11;
}

void sub_F3B0(id a1)
{
  v96[0] = MACaptionAppearanceMediumSystemFontIdentifier;
  v96[1] = MACaptionAppearanceSystemFontIdentifier;
  v96[2] = @"HelveticaNeue";
  v96[3] = @"Courier";
  v96[4] = MACaptionAppearanceMonoSystemFontIdentifier;
  v96[5] = @"Menlo-Regular";
  v96[6] = @"TrebuchetMS";
  v96[7] = @"Avenir-Roman";
  v96[8] = @"Copperplate";
  v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v96, 9LL));
  id v8 = AXTVLocString(@"AXCaptionFontSystemMediumFont", v1, v2, v3, v4, v5, v6, v7, v85);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v95[0] = v9;
  id v17 = AXTVLocString(@"AXCaptionFontSystemFont", v10, v11, v12, v13, v14, v15, v16, v86);
  id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v95[1] = v18;
  id v26 = AXTVLocString(@"AXCaptionFontHelvetica", v19, v20, v21, v22, v23, v24, v25, v87);
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  v95[2] = v27;
  id v35 = AXTVLocString(@"AXCaptionFontCourier", v28, v29, v30, v31, v32, v33, v34, v88);
  v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
  v95[3] = v36;
  id v44 = AXTVLocString(@"AXCaptionFontSystemMonoFont", v37, v38, v39, v40, v41, v42, v43, v89);
  v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
  v95[4] = v45;
  id v53 = AXTVLocString(@"AXCaptionFontMenlo", v46, v47, v48, v49, v50, v51, v52, v90);
  v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
  v95[5] = v54;
  id v62 = AXTVLocString(@"AXCaptionFontTrebuchet", v55, v56, v57, v58, v59, v60, v61, v91);
  v63 = (void *)objc_claimAutoreleasedReturnValue(v62);
  v95[6] = v63;
  id v71 = AXTVLocString(@"AXCaptionFontAvenir", v64, v65, v66, v67, v68, v69, v70, v92);
  v72 = (void *)objc_claimAutoreleasedReturnValue(v71);
  v95[7] = v72;
  id v80 = AXTVLocString(@"AXCaptionFontCopperplate", v73, v74, v75, v76, v77, v78, v79, v93);
  v81 = (void *)objc_claimAutoreleasedReturnValue(v80);
  v95[8] = v81;
  v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v95, 9LL));

  v83 = -[TSKMappingFormatter initWithInputs:outputs:]( objc_alloc(&OBJC_CLASS___TSKMappingFormatter),  "initWithInputs:outputs:",  v94,  v82);
  v84 = (void *)qword_80508;
  qword_80508 = (uint64_t)v83;
}

void sub_F628(id a1)
{
  id v8 = AXTVLocString(@"AXCaptionTextEdgeStyleNone", v1, v2, v3, v4, v5, v6, v7, v49[0]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v17 = AXTVLocString(@"AXCaptionTextEdgeStyleDropShadow", v10, v11, v12, v13, v14, v15, v16, (uint64_t)v9);
  id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v49[1] = (uint64_t)v18;
  id v26 = AXTVLocString(@"AXCaptionTextEdgeStyleRaise", v19, v20, v21, v22, v23, v24, v25, v49[0]);
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  v49[2] = (uint64_t)v27;
  id v35 = AXTVLocString(@"AXCaptionTextEdgeStyleDepressed", v28, v29, v30, v31, v32, v33, v34, v49[0]);
  v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
  v49[3] = (uint64_t)v36;
  id v44 = AXTVLocString(@"AXCaptionTextEdgeStyleUniform", v37, v38, v39, v40, v41, v42, v43, v49[0]);
  v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
  v49[4] = (uint64_t)v45;
  uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v49, 5LL));

  uint64_t v47 = -[TSKMappingFormatter initWithInputs:outputs:]( objc_alloc(&OBJC_CLASS___TSKMappingFormatter),  "initWithInputs:outputs:",  &off_6FF10,  v46);
  uint64_t v48 = (void *)qword_80518;
  qword_80518 = (uint64_t)v47;
}

void sub_F79C(id a1)
{
  id v8 = AXTVLocString(@"AXCaptionTextSizeExtraSmall", v1, v2, v3, v4, v5, v6, v7, v49[0]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v17 = AXTVLocString(@"AXCaptionTextSizeSmall", v10, v11, v12, v13, v14, v15, v16, (uint64_t)v9);
  id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v49[1] = (uint64_t)v18;
  id v26 = AXTVLocString(@"AXCaptionTextSizeMedium", v19, v20, v21, v22, v23, v24, v25, v49[0]);
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  v49[2] = (uint64_t)v27;
  id v35 = AXTVLocString(@"AXCaptionTextSizeLarge", v28, v29, v30, v31, v32, v33, v34, v49[0]);
  v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
  v49[3] = (uint64_t)v36;
  id v44 = AXTVLocString(@"AXCaptionTextSizeExtraLarge", v37, v38, v39, v40, v41, v42, v43, v49[0]);
  v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
  v49[4] = (uint64_t)v45;
  uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v49, 5LL));

  uint64_t v47 = -[TSKMappingFormatter initWithInputs:outputs:]( objc_alloc(&OBJC_CLASS___TSKMappingFormatter),  "initWithInputs:outputs:",  &off_6FF28,  v46);
  uint64_t v48 = (void *)qword_80528;
  qword_80528 = (uint64_t)v47;
}

void sub_F910(id a1)
{
  id v8 = AXTVLocString(@"AXCaptionTextOpacityOpaque", v1, v2, v3, v4, v5, v6, v7, v31[0]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v17 = AXTVLocString(@"AXCaptionTextOpacitySemiTransparent", v10, v11, v12, v13, v14, v15, v16, (uint64_t)v9);
  id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v31[1] = (uint64_t)v18;
  id v26 = AXTVLocString(@"AXCaptionTextOpacityTransparent", v19, v20, v21, v22, v23, v24, v25, v31[0]);
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  v31[2] = (uint64_t)v27;
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v31, 3LL));

  uint64_t v29 = -[TSKMappingFormatter initWithInputs:outputs:]( objc_alloc(&OBJC_CLASS___TSKMappingFormatter),  "initWithInputs:outputs:",  &off_6FF40,  v28);
  uint64_t v30 = (void *)qword_80538;
  qword_80538 = (uint64_t)v29;
}

void sub_FA44(id a1)
{
  id v8 = AXTVLocString(@"AXCaptionBackgroundOpacity50", v1, v2, v3, v4, v5, v6, v7, v49[0]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v17 = AXTVLocString(@"AXCaptionBackgroundOpacity100", v10, v11, v12, v13, v14, v15, v16, (uint64_t)v9);
  id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v49[1] = (uint64_t)v18;
  id v26 = AXTVLocString(@"AXCaptionBackgroundOpacity75", v19, v20, v21, v22, v23, v24, v25, v49[0]);
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  v49[2] = (uint64_t)v27;
  id v35 = AXTVLocString(@"AXCaptionBackgroundOpacity25", v28, v29, v30, v31, v32, v33, v34, v49[0]);
  v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
  v49[3] = (uint64_t)v36;
  id v44 = AXTVLocString(@"AXCaptionBackgroundOpacity0", v37, v38, v39, v40, v41, v42, v43, v49[0]);
  v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
  v49[4] = (uint64_t)v45;
  uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v49, 5LL));

  uint64_t v47 = -[TSKMappingFormatter initWithInputs:outputs:]( objc_alloc(&OBJC_CLASS___TSKMappingFormatter),  "initWithInputs:outputs:",  &off_6FF58,  v46);
  uint64_t v48 = (void *)qword_80548;
  qword_80548 = (uint64_t)v47;
}

id sub_FD5C(uint64_t a1, void *a2)
{
  uint64_t v2 = a1;
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 stringForObjectValue:v4]);
  LODWORD(v2) = [v4 isEqual:*(void *)(v2 + 40)];

  if ((_DWORD)v2)
  {
    id v13 = AXTVLocString(@"AXCaptionDefaultValueFormat", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);
    uint64_t v14 = objc_claimAutoreleasedReturnValue(v13);

    uint64_t v5 = (void *)v14;
  }

  return v5;
}

void sub_10120( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_1014C(uint64_t a1)
{
  id v2 = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([v2 traitCollection]);
  objc_msgSend(v2, "_updateColorsForUserInterfaceStyle:", objc_msgSend(v1, "userInterfaceStyle"));
}

void sub_10B80(_Unwind_Exception *a1)
{
}

void sub_10BBC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, float a5)
{
  uint64_t v8 = (id *)(a1 + 32);
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained(v8);
  *(float *)&double v10 = a5;
  [WeakRetained _handleDownloadProgressForVoiceId:v9 progress:a3 storageSize:a4 requiredDiskSpace:v10];
}

void sub_10C2C(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = (id *)(a1 + 32);
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _handleVoiceDownloaded:v5 cancelled:a3];
}

void sub_10C84(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleVoiceDeleted:v3];
}

void sub_11000( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
}

void sub_11028(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _updateVoiceVariantItem:v3];
}

void sub_11E98(_Unwind_Exception *a1)
{
}

void sub_11EC0(uint64_t a1)
{
  uint64_t v2 = AXTTSLogCommon();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v7 = 138412290;
    uint64_t v8 = v4;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "User selected OK to confirm download of: %@", (uint8_t *)&v7, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained speechModelController]);
  [v6 startDownloadForResource:*(void *)(a1 + 32)];
}

void sub_11F94(uint64_t a1)
{
  uint64_t v2 = AXTTSLogCommon();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_impl( &dword_0,  v3,  OS_LOG_TYPE_DEFAULT,  "User selected Cancel to abort download of: %@",  (uint8_t *)&v5,  0xCu);
  }
}

void sub_12208( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_12230(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained speechModelController]);
  [v4 deleteResource:*(void *)(a1 + 32)];

  id v5 = objc_loadWeakRetained(v2);
  LOBYTE(WeakRetained) = [v5 _hasAnyDeletableResources];

  if ((WeakRetained & 1) == 0)
  {
    id v6 = objc_loadWeakRetained(v2);
    int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 tableView]);
    [v7 setEditing:0];
  }

  id v8 = objc_loadWeakRetained(v2);
  [v8 reloadSettings];
}

LABEL_20:
  return v19;
}

LABEL_11:
  return v6;
}

  id v13 = 0;
LABEL_12:

  return v13;
}
}
}

void sub_13DAC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *a9, id *a10, uint64_t a11, id *location, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, id a37)
{
}

void sub_13E24(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setHidden:", objc_msgSend(v2, "voiceOverEnabled") ^ 1);
}

AXTVSpeechVoicesForLanguageViewController *sub_13E68(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXLanguageManager sharedInstance](&OBJC_CLASS___AXLanguageManager, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 dialectForSystemLanguage]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 langMap]);

  id v5 = objc_alloc(&OBJC_CLASS___AXTVSpeechVoicesForLanguageViewController);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v7 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained speechModelController]);
  id v8 = -[AXTVSpeechVoicesForLanguageViewController initWithLanguageMap:speechModelController:]( v5,  "initWithLanguageMap:speechModelController:",  v4,  v7);

  return v8;
}

void sub_13F0C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSettings];
}

void sub_13F38(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _setVoiceNameForSettingItem:v3];
}

id sub_13F80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v9 = AXTVLocString(@"AXSpeechRateTitle", a2, a3, a4, a5, a6, a7, a8, v24);
  double v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v18 = AXTVLocString(@"AXSpeechRateAdjustInstructions", v11, v12, v13, v14, v15, v16, v17, v25);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  [*(id *)(a1 + 32) voiceOverSpeakingRate];
  double v21 = v20;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_1407C;
  v26[3] = &unk_65250;
  id v27 = *(id *)(a1 + 32);
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[AXTVSliderViewController sliderWithTitle:subtitle:minimumValue:maximumValue:currentValue:discreteStepAmount:valueChangeHandler:valueFormatHandler:]( &OBJC_CLASS___AXTVSliderViewController,  "sliderWithTitle:subtitle:minimumValue:maximumValue:currentValue:discreteStepAmount:valueChangeHandle r:valueFormatHandler:",  v10,  v19,  v26,  &stru_65A88,  0.0,  1.0,  v21,  0.0));

  return v22;
}

id sub_1407C(uint64_t a1, double a2)
{
  *(float *)&a2 = a2;
  return [*(id *)(a1 + 32) setVoiceOverSpeakingRate:a2];
}

NSString *__cdecl sub_14088(id a1, double a2, double a3, double a4)
{
  float v4 = a2;
  return (NSString *)AXFormatFloatWithPercentage(0LL, v4, a3, a4);
}

void sub_145B8(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"RotorItem"]);
  if ((AXShouldHideVoiceOverRotorItemFromSettings(v8) & 1) == 0)
  {
    uint64_t v4 = AXVoiceOverRotorLocString(v3);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    id v6 = [v8 mutableCopy];
    int v7 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v5,  0LL,  v6,  0LL,  *(void *)(a1 + 32),  "_rotorCellClicked:"));

    [v7 setUpdateBlock:&stru_65AA8];
    [*(id *)(a1 + 40) addObject:v7];
  }
}

void sub_14694(id a1, TSKSettingItem *a2, id a3)
{
  uint64_t v4 = a2;
  id v5 = a3;
  char v13 = 0;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  int v7 = (void *)objc_claimAutoreleasedReturnValue(-[TSKSettingItem representedObject](v4, "representedObject"));
  uint64_t v8 = __UIAccessibilityCastAsClass(v6, v7, 1LL, &v13);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  if (v13) {
    abort();
  }
  double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"Enabled"]);
  unsigned int v11 = [v10 BOOLValue];

  if (v11) {
    uint64_t v12 = 2LL;
  }
  else {
    uint64_t v12 = 0LL;
  }
  -[TSKSettingItem setAccessoryTypes:](v4, "setAccessoryTypes:", v12);
}

void sub_14A34( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_14A58(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_14A68(uint64_t a1)
{
}

void sub_14A70(void *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v12 = a2;
  int v7 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"RotorItem"]);
  unsigned int v8 = [v7 isEqualToString:a1[4]];

  if (v8)
  {
    *(void *)(*(void *)(a1[5] + 8LL) + 24LL) = a3;
    id v9 = [v12 mutableCopy];
    uint64_t v10 = *(void *)(a1[6] + 8LL);
    unsigned int v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    *a4 = 1;
  }
}

void sub_155E0(id a1, TSKSettingItem *a2, id a3)
{
  id v5 = a2;
  else {
    uint64_t v4 = 0LL;
  }
  -[TSKSettingItem setAccessoryTypes:](v5, "setAccessoryTypes:", v4);
  -[TSKSettingItem setLocalizedValue:](v5, "setLocalizedValue:", 0LL);
}

id sub_15638(id a1, AXTVMenuSettingItem *a2)
{
  return +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[AXTVMenuSettingItem option](a2, "option"));
}

id sub_15668(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(*(void *)(a1 + 32) + 32LL);
  id v6 = a3;
  int v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [a2 option]));
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v5 indexOfObject:v7]));
  id v9 = *(void **)(*(void *)(a1 + 32) + 32LL);
  id v10 = [v6 option];

  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v10));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v9 indexOfObject:v11]));
  id v13 = [v8 compare:v12];

  return v13;
}

void sub_16800( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_16828(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:TSKAccessibilityVoiceOverPracticeUserInfoKeyTitle]);
  [WeakRetained setAccessibilityVoiceOverPracticeTitle:v6];

  id v7 = objc_loadWeakRetained(v2);
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:TSKAccessibilityVoiceOverPracticeUserInfoKeyDescription]);
  [v7 setAccessibilityVoiceOverPracticeDescription:v9];

  id v10 = objc_loadWeakRetained(v2);
  [v10 reloadSettings];
}

void sub_16B74( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

void sub_16BB4(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  unsigned int v6 = [WeakRetained isVoiceOverPracticeEnabled];

  if (v6)
  {
    id v7 = *(void **)(a1 + 32);
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 accessibilityVoiceOverPracticeTitle]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) accessibilityVoiceOverPracticeDescription]);
    id v21 = (id)objc_claimAutoreleasedReturnValue([v7 _attributedStringForVOTPracticeTitle:v8 description:v9]);

    [v4 setAttributedLocalizedDescription:v21];
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v21 string]);
    UIAccessibilitySpeakIfNotSpeaking();
  }

  else
  {
    id v21 = objc_loadWeakRetained(v3);
    id v18 = AXTVLocString(@"AXVoiceOverPracticeDetails", v11, v12, v13, v14, v15, v16, v17, v20);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v18);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v21 _attributedStringForGenericMessage:v10]);
    [v4 setAttributedLocalizedDescription:v19];
  }
}

void sub_16CCC(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  unsigned int v5 = [WeakRetained isVoiceOverPracticeEnabled];

  if (v5) {
    uint64_t v13 = @"AXVoiceOverPracticeIsRunningTitle";
  }
  else {
    uint64_t v13 = @"AXVoiceOverStartPracticeTitle";
  }
  id v14 = AXTVLocString(v13, v6, v7, v8, v9, v10, v11, v12, v15);
  id v16 = (id)objc_claimAutoreleasedReturnValue(v14);
  [v3 setLocalizedTitle:v16];
}

void sub_17368( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_17390(uint64_t a1)
{
  uint64_t v2 = AXLogCommon();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v5 = 0;
    _os_log_impl( &dword_0,  v3,  OS_LOG_TYPE_DEFAULT,  "Got _UIDeviceRemoteTouchSurfaceTypeDidChangeNotification. Reloading settings",  v5,  2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSettings];
}

id sub_1740C(uint64_t a1, void *a2)
{
  return [a2 _reloadSettingsItemsForSettingsChange];
}

AXTVAirPodsChooserViewController *sub_186CC(uint64_t a1)
{
  return  -[AXTVAirPodsChooserViewController initWithDevices:]( objc_alloc(&OBJC_CLASS___AXTVAirPodsChooserViewController),  "initWithDevices:",  *(void *)(a1 + 32));
}

AXTVAirPodsSettingsViewController *sub_186FC(uint64_t a1)
{
  uint64_t v2 = objc_alloc(&OBJC_CLASS___AXTVAirPodsSettingsViewController);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) firstObject]);
  id v4 = -[AXTVAirPodsSettingsViewController initWithDevice:](v2, "initWithDevice:", v3);

  return v4;
}

id sub_18750(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v9 = AXTVLocString(@"AXAudioBalanceItemTitle", a2, a3, a4, a5, a6, a7, a8, v27);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v18 = AXTVLocString(@"AXAudioBalanceSliderInstructions", v11, v12, v13, v14, v15, v16, v17, v28);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  double v20 = AXMinimumLinearAudioBalanceLevel;
  double v21 = AXMaximumLinearAudioBalanceLevel;
  id v22 = [*(id *)(a1 + 32) audioLeftRightBalance];
  *(float *)&double v23 = v23;
  double v24 = AXSLinearValueForLogarithmicValue(v22, *(float *)&v23);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_18874;
  v29[3] = &unk_65250;
  id v30 = *(id *)(a1 + 32);
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[AXTVSliderViewController sliderWithTitle:subtitle:minimumValue:maximumValue:currentValue:discreteStepAmount:valueChangeHandler:valueFormatHandler:]( &OBJC_CLASS___AXTVSliderViewController,  "sliderWithTitle:subtitle:minimumValue:maximumValue:currentValue:discreteStepAmount:valueChangeHandle r:valueFormatHandler:",  v10,  v19,  v29,  &stru_65BC8,  v20,  v21,  v24,  0.0));

  return v25;
}

id sub_18874(uint64_t a1, double a2)
{
  float v3 = a2;
  double v4 = AXSLogarithmicValueForLinearValue(v3);
  return [*(id *)(a1 + 32) setAudioLeftRightBalance:v4];
}

NSString *__cdecl sub_188A0(id a1, double a2, double a3, double a4)
{
  float v4 = a2;
  double v5 = AXSLogarithmicValueForLinearValue(v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVUtils audioBalanceFormatter](&OBJC_CLASS___AXTVUtils, "audioBalanceFormatter"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v5));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 stringForObjectValue:v7]);

  return (NSString *)v8;
}

NSString *__cdecl sub_189C8(id a1, NSNumber *a2)
{
  uint64_t v2 = -[NSNumber unsignedIntegerValue](a2, "unsignedIntegerValue");
  if (v2 <= 31)
  {
    switch(v2)
    {
      case 0LL:
        uint64_t v10 = @"SettingsOFF";
        break;
      case 1LL:
        uint64_t v10 = @"AXVoiceOverTitle";
        break;
      case 2LL:
        uint64_t v10 = @"AXZoomTitle";
        break;
      case 4LL:
        uint64_t v10 = @"AXClosedCaptionsTitle";
        break;
      case 8LL:
        uint64_t v10 = @"AXAudioDescriptionsTitle";
        break;
      default:
        goto LABEL_21;
    }

    goto LABEL_22;
  }

  if (v2 > 255)
  {
    switch(v2)
    {
      case 256LL:
        uint64_t v10 = @"AXLightSensitivityTitle";
        goto LABEL_22;
      case 512LL:
        uint64_t v10 = @"AXReduceWhitePointTitle";
        goto LABEL_22;
      case 1024LL:
        uint64_t v10 = @"AXHoverTextTitle";
        goto LABEL_22;
    }

LABEL_21:
    uint64_t v10 = @"AXMenuAskValue";
    goto LABEL_22;
  }

  if (v2 != 32)
  {
    if (v2 == 64)
    {
      uint64_t v10 = @"AXInvertColorsTitle";
      goto LABEL_22;
    }

    if (v2 == 128)
    {
      uint64_t v10 = @"AXColorFiltersTitle";
LABEL_22:
      id v13 = AXTVLocString(v10, v3, v4, v5, v6, v7, v8, v9, vars0);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v13);
      return (NSString *)v12;
    }

    goto LABEL_21;
  }

  uint64_t v11 = AXParameterizedLocalizedString(2LL, @"SWITCH_SCANNING_LABEL");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  return (NSString *)v12;
}

void sub_18CC0(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", &off_6FFE8));
  uint64_t v2 = (void *)qword_80558;
  qword_80558 = v1;
}

id sub_19080(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v9 = AXTVLocString(@"AXZoomMaxLevelTitle", a2, a3, a4, a5, a6, a7, a8, v26);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v18 = AXTVLocString(@"AXZoomMaxLevelSliderInstructions", v11, v12, v13, v14, v15, v16, v17, v27);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  double v20 = AXZoomMinimumUserPreferredMaximumZoomLevel;
  double v21 = AXZoomMaximumZoomLevel;
  [*(id *)(a1 + 32) zoomPreferredMaximumZoomScale];
  double v23 = v22;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_191AC;
  v28[3] = &unk_65250;
  id v29 = *(id *)(a1 + 32);
  double v24 = (void *)objc_claimAutoreleasedReturnValue( +[AXTVSliderViewController sliderWithTitle:subtitle:minimumValue:maximumValue:currentValue:discreteStepAmount:valueChangeHandler:valueFormatHandler:]( &OBJC_CLASS___AXTVSliderViewController,  "sliderWithTitle:subtitle:minimumValue:maximumValue:currentValue:discreteStepAmount:valueChangeHandle r:valueFormatHandler:",  v10,  v19,  v28,  &stru_65C28,  v20,  v21,  v23,  0.0));

  [v24 setAccessibilityValueFormatHandler:&stru_65C48];
  return v24;
}

id sub_191AC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setZoomPreferredMaximumZoomScale:");
}

NSString *__cdecl sub_191B4(id a1, double a2, double a3, double a4)
{
  float v4 = a2;
  uint64_t v5 = AXFormatFloat(1LL, v4, a3, a4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v14 = AXTVLocString(@"AXZoomLevelFormat", v7, v8, v9, v10, v11, v12, v13, (uint64_t)v6);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  return (NSString *)v15;
}

NSString *__cdecl sub_19208(id a1, double a2, double a3, double a4)
{
  float v4 = a2;
  uint64_t v5 = AXFormatFloat(1LL, v4, a3, a4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v14 = AXTVLocString(@"AXZoomLevelFormat_Spoken", v7, v8, v9, v10, v11, v12, v13, (uint64_t)v6);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  return (NSString *)v15;
}

void sub_1925C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setEnabled:", objc_msgSend(v2, "zoomEnabled"));
}

NSString *__cdecl sub_192C8(id a1, NSNumber *a2)
{
  *(float *)&double v2 = v2;
  uint64_t v5 = AXFormatFloat(1LL, *(float *)&v2, v3, v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v14 = AXTVLocString(@"AXZoomLevelFormat", v7, v8, v9, v10, v11, v12, v13, (uint64_t)v6);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  return (NSString *)v15;
}

id AddressForBTDevice(uint64_t a1)
{
  if (!BTDeviceGetAddressString(a1, v8, 248LL)) {
    return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  v8));
  }
  _AXTVBTLog(16LL, 1LL, @"BTDeviceGetAddressString(%p) failed with error %d.", v2, v3, v4, v5, v6, a1);
  return 0LL;
}

void sub_19768(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, void *a6)
{
  uint64_t v12 = objc_autoreleasePoolPush();
  id v13 = a6;
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 addDeviceIfNeeded:a1]);
  double v20 = v14;
  if ((_DWORD)a2 != -1 && (a2 & 0x40) != 0) {
    goto LABEL_3;
  }
  if ((a3 - 2) < 2)
  {
    switch((_DWORD)a2)
    {
      case 0xFFFFFFFF:
        if (a4 != 701 || (_DWORD)a5) {
          goto LABEL_3;
        }
        [v14 _clearName];
        uint64_t v52 = @"AXTVCoreBluetoothDeviceUpdatedNotification";
        goto LABEL_51;
      case 2:
        if (a4 != 303 || (_DWORD)a5) {
          goto LABEL_3;
        }
        _AXTVBTLog( 2LL,  1LL,  @"received 'phonebook supported' phonebook event from device %@",  v15,  v16,  v17,  v18,  v19,  (uint64_t)v14);
        break;
      case 1:
        _AXTVBTLog( 2LL,  1LL,  @"received BT_SERVICE_DEPENDENT_EVENT event for BT_SERVICE_HANDSFREE",  v15,  v16,  v17,  v18,  v19,  v53);
        if (a4 == 101 && !(_DWORD)a5)
        {
          _AXTVBTLog( 2LL,  1LL,  @"received 'audio connected' handsfree event from device %@",  v31,  v32,  v33,  v34,  v35,  (uint64_t)v20);
          v36 = v13;
          uint64_t v37 = 1LL;
LABEL_35:
          [v36 setAudioConnected:v37];
          goto LABEL_3;
        }

        if (a4 == 102 && !(_DWORD)a5)
        {
          _AXTVBTLog( 2LL,  1LL,  @"received 'audio disconnected' handsfree event from device %@",  v31,  v32,  v33,  v34,  v35,  (uint64_t)v20);
          v36 = v13;
          uint64_t v37 = 0LL;
          goto LABEL_35;
        }

        if (a4 == 103 && !(_DWORD)a5)
        {
          _AXTVBTLog( 2LL,  1LL,  @"received 'start voice command' handsfree event from device %@",  v31,  v32,  v33,  v34,  v35,  (uint64_t)v20);
          uint64_t v52 = @"AXTVCoreBluetoothHandsfreeInitiatedVoiceCommand";
          goto LABEL_51;
        }

        if (a4 == 104 && !(_DWORD)a5)
        {
          _AXTVBTLog( 2LL,  1LL,  @"received 'end voice command' handsfree event from device %@",  v31,  v32,  v33,  v34,  v35,  (uint64_t)v20);
          uint64_t v52 = @"AXTVCoreBluetoothHandsfreeEndedVoiceCommand";
          goto LABEL_51;
        }

        if (a4 != 303 || (_DWORD)a5)
        {
          if (a4 != 702 || (_DWORD)a5)
          {
            if (a4 != 703 || (_DWORD)a5) {
              goto LABEL_3;
            }
            _AXTVBTLog( 2LL,  1LL,  @"received 'high power disabled' event from device %@",  v31,  v32,  v33,  v34,  v35,  (uint64_t)v20);
            uint64_t v52 = @"AXTVCoreBluetoothHighPowerDisabled";
          }

          else
          {
            _AXTVBTLog( 2LL,  1LL,  @"received 'high power enabled' event from device %@",  v31,  v32,  v33,  v34,  v35,  (uint64_t)v20);
            uint64_t v52 = @"AXTVCoreBluetoothHighPowerEnabled";
          }

          goto LABEL_51;
        }

        _AXTVBTLog( 2LL,  1LL,  @"received 'phonebook supported' handsfree event from device %@",  v31,  v32,  v33,  v34,  v35,  (uint64_t)v20);
        break;
      default:
        goto LABEL_3;
    }

    uint64_t v52 = @"AXTVCoreBluetoothDeviceSupportsContactSyncNotification";
    goto LABEL_51;
  }

  if (a3 == 1)
  {
    id v38 = [v14 connectedServicesCount];
    if (a4 != 12) {
      goto LABEL_3;
    }
    id v44 = v38;
    if ((_DWORD)a5)
    {
      uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"failed with error %d",  a5));
      _AXTVBTLog(1LL, 1LL, @"disconnection to service 0x%08x on device %@ %@", v45, v46, v47, v48, v49, a2);

      if (v44) {
        goto LABEL_3;
      }
      uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a5));
      uint64_t v51 = @"AXTVCoreBluetoothDeviceDisconnectFailedNotification";
LABEL_43:
      [v13 postNotificationName:v51 object:v20 error:v50];

      goto LABEL_3;
    }

    _AXTVBTLog(1LL, 1LL, @"disconnection to service 0x%08x on device %@ %@", v39, v40, v41, v42, v43, a2);
    if (v44) {
      goto LABEL_3;
    }
    uint64_t v52 = @"AXTVCoreBluetoothDeviceDisconnectSuccessNotification";
LABEL_51:
    [v13 postNotificationName:v52 object:v20];
    goto LABEL_3;
  }

  if (!a3)
  {
    if (a4 == 1)
    {
      _AXTVBTLog(1LL, 1LL, @"attempting to connect to service 0x%08x on device %@", v21, v22, v23, v24, v25, a2);
      goto LABEL_3;
    }

    if (a4 == 11)
    {
      if ((_DWORD)a5)
      {
        v54 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"failed with error %d",  a5));
        _AXTVBTLog(1LL, 1LL, @"connection to service 0x%08x on device %@ %@", v26, v27, v28, v29, v30, a2);
      }

      else
      {
        _AXTVBTLog(1LL, 1LL, @"connection to service 0x%08x on device %@ %@", v21, v22, v23, v24, v25, a2);
      }

      if ((_DWORD)a2 == 512) {
        [v13 postNotificationName:@"AXTVCoreBluetoothDeviceSupportsMAPClientNotification" object:v20];
      }
      if ((_DWORD)a5)
      {
        uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a5));
        uint64_t v51 = @"AXTVCoreBluetoothDeviceConnectFailedNotification";
        goto LABEL_43;
      }

      uint64_t v52 = @"AXTVCoreBluetoothDeviceConnectSuccessNotification";
      goto LABEL_51;
    }
  }

LABEL_3:
  objc_autoreleasePoolPop(v12);
}

LABEL_8:
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v7 postNotificationName:v4 object:v5 userInfo:v3];
}
}

LABEL_4:
  return v11;
}

void sub_1B784(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  uint64_t v8 = objc_autoreleasePoolPush();
  id v9 = a4;
  uint64_t v15 = v9;
  if (a3 | a2)
  {
    else {
      uint64_t v16 = *(&off_65D98 + (int)a2);
    }
    _AXTVBTLog(16LL, 1LL, @"session attach called back with %@ (%x)", v10, v11, v12, v13, v14, (uint64_t)v16);
    if ([v15 available])
    {
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL));
      [v15 postNotificationName:@"AXTVCoreBluetoothAvailabilityChangedNotification" object:v18];
    }

    [v15 _cleanup:0];
    [v15 _attach];
  }

  else
  {
    if ([v9 _setup:a1])
    {
      uint64_t v17 = 1LL;
    }

    else
    {
      [v15 _cleanup:1];
      uint64_t v17 = 0LL;
    }

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v17));
    [v15 postNotificationName:@"AXTVCoreBluetoothAvailabilityChangedNotification" object:v16];
  }

  objc_autoreleasePoolPop(v8);
}

void sub_1B8E4(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  uint64_t v6 = objc_autoreleasePoolPush();
  id v7 = a4;
  uint64_t v13 = v7;
  switch(a2)
  {
    case 0:
      _AXTVBTLog(0LL, 1LL, @"local device power state changed", v8, v9, v10, v11, v12, v14);
      [v13 _powerChanged];
      break;
    case 3:
      [v7 _connectabilityChanged];
      break;
    case 4:
      [v7 _pairedStatusChanged];
      break;
    case 5:
      [v7 _connectedStatusChanged];
      break;
    case 6:
    case 7:
      [v7 _discoveryStateChanged];
      break;
    case 8:
      [v7 _advertisingChanged];
      break;
    default:
      break;
  }

  objc_autoreleasePoolPop(v6);
}

void sub_1B9A0(uint64_t a1, int a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v9 = objc_autoreleasePoolPush();
  id v10 = a5;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 addDeviceIfNeeded:a3]);
  uint64_t v12 = v11;
  if (a2 == 4)
  {
    if ([v11 magicPaired]
      && [v12 magicPairedDeviceNameUpdated])
    {
      uint64_t v13 = @"AXTVCoreBluetoothMagicPairedDeviceNameChangedNotification";
      goto LABEL_8;
    }
  }

  else if (a2 == 1 && !BTAccessoryManagerGetDeviceBatteryLevel(a1, a3, &v14))
  {
    uint64_t v13 = @"AXTVCoreBluetoothDeviceBatteryChangedNotification";
LABEL_8:
    [v10 postNotificationName:v13 object:v12];
  }

  objc_autoreleasePoolPop(v9);
}

void sub_1BA6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = objc_autoreleasePoolPush();
  id v8 = a5;
  [v8 _setScanState:a2];
  if ((_DWORD)a2 == 1) {
    [v8 _restartScan];
  }

  objc_autoreleasePoolPop(v7);
}

void sub_1BAC4(uint64_t a1, int a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v8 = objc_autoreleasePoolPush();
  id v9 = a5;
  uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 addDeviceIfNeeded:a3]);
  uint64_t v16 = (void *)v10;
  if (v10)
  {
    if (a2 == 1)
    {
      _AXTVBTLog(2LL, 1LL, @"lost device %@", v11, v12, v13, v14, v15, v10);
      [v9 _removeDevice:v16];
      uint64_t v17 = @"AXTVCoreBluetoothDeviceRemovedNotification";
      goto LABEL_6;
    }

    if (!a2)
    {
      _AXTVBTLog(2LL, 1LL, @"found device %@", v11, v12, v13, v14, v15, v10);
      uint64_t v17 = @"AXTVCoreBluetoothDeviceDiscoveredNotification";
LABEL_6:
      [v9 postNotificationName:v17 object:v16];
    }
  }

  objc_autoreleasePoolPop(v8);
}

void sub_1BB90(uint64_t a1, int a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9 = objc_autoreleasePoolPush();
  id v10 = a5;
  uint64_t v16 = v10;
  if (a3 == 4294901761LL) {
    uint64_t v17 = 0LL;
  }
  else {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v10 addDeviceIfNeeded:a3]);
  }
  if (a2 == 3)
  {
    if ((_DWORD)a4)
    {
      _AXTVBTLog(16LL, 1LL, @"pairing to device %@ failed with result %d", v11, v12, v13, v14, v15, (uint64_t)v17);
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a4));
      [v16 postNotificationName:@"AXTVCoreBluetoothPairingPINResultFailedNotification" object:v17 error:v18];
    }

    else
    {
      _AXTVBTLog(2LL, 1LL, @"pairing to device %@ completed successfully", v11, v12, v13, v14, v15, (uint64_t)v17);
      [v16 postNotificationName:@"AXTVCoreBluetoothPairingPINResultSuccessNotification" object:v17];
    }
  }

  objc_autoreleasePoolPop(v9);
}

void sub_1BC9C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v6 = objc_autoreleasePoolPush();
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 addDeviceIfNeeded:a2]);
  _AXTVBTLog(1LL, 1LL, @"received pincode request for device %@", v9, v10, v11, v12, v13, (uint64_t)v8);
  [v7 postNotificationName:@"AXTVCoreBluetoothPairingPINRequestNotification" object:v8];

  objc_autoreleasePoolPop(v6);
}

void sub_1BD28(uint64_t a1, uint64_t a2, uint64_t a3, int a4, void *a5)
{
  uint64_t v9 = objc_autoreleasePoolPush();
  id v10 = a5;
  uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 addDeviceIfNeeded:a2]);
  uint64_t v17 = (void *)v11;
  if (a4)
  {
    _AXTVBTLog( 1LL,  1LL,  @"received user confirmation request (numeric comparison to %06u) for device %@",  v12,  v13,  v14,  v15,  v16,  a3);
    uint64_t v18 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", a3));
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v17,  @"device",  v18,  @"value",  0LL));
    [v10 postNotificationName:@"AXTVCoreBluetoothPairingUserNumericComparisionNotification" object:v19];

    id v10 = (id)v18;
  }

  else
  {
    _AXTVBTLog(1LL, 1LL, @"received user confirmation request for device %@", v12, v13, v14, v15, v16, v11);
    [v10 postNotificationName:@"AXTVCoreBluetoothPairingUserConfirmationNotification" object:v17];
  }

  objc_autoreleasePoolPop(v9);
}

void sub_1BE4C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = objc_autoreleasePoolPush();
  id v8 = a4;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 addDeviceIfNeeded:a2]);
  _AXTVBTLog(1LL, 1LL, @"received passkey display request for device %@", v10, v11, v12, v13, v14, (uint64_t)v9);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", a3));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v9,  @"device",  v15,  @"value",  0LL));
  [v8 postNotificationName:@"AXTVCoreBluetoothPairingPassKeyDisplayNotification" object:v16];

  objc_autoreleasePoolPop(v7);
}

void sub_1C15C(id a1, TSKSettingItem *a2, id a3)
{
  id v7 = a2;
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[TSKSettingItem representedObject](v7, "representedObject"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 hoverTextFontName]);

  if (v3 | v5)
  {
    else {
      uint64_t v6 = 0LL;
    }
  }

  else
  {
    uint64_t v6 = 2LL;
  }

  -[TSKSettingItem setAccessoryTypes:](v7, "setAccessoryTypes:", v6);
}

void sub_1C4B4(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___AXTVAudioVideoFacade);
  uint64_t v2 = (void *)qword_80580;
  qword_80580 = (uint64_t)v1;
}

int64_t sub_1C9B8(id a1, id a2, id a3)
{
  id v4 = a3;
  uint64_t v5 = (void *)MACaptionAppearancePrefCopyProfileOrder(a2);
  uint64_t v6 = (void *)MACaptionAppearancePrefCopyProfileOrder(v4);

  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0
    && (uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v6, v8) & 1) != 0))
  {
    int64_t v9 = (int64_t)[v5 compare:v6];
  }

  else
  {
    int64_t v9 = -1LL;
  }

  return v9;
}

id sub_1CA58(id a1, NSString *a2, unint64_t a3)
{
  uint64_t v3 = a2;
  id v4 = -[AXTVCaptionStyle initWithStyleID:](objc_alloc(&OBJC_CLASS___AXTVCaptionStyle), "initWithStyleID:", v3);

  return v4;
}

BOOL sub_1CAFC(id a1, AXTVCaptionStyle *a2, unint64_t a3, BOOL *a4)
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVCaptionStyle styleID](a2, "styleID", a3, a4));
  BOOL v5 = MACaptionAppearancePrefIsProfileEditable() != 0;

  return v5;
}

void sub_1CDC8(_Unwind_Exception *a1)
{
}

void sub_1CDF4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateSelectedSubtitleOption:1];
}

void sub_1CE24(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateAvailableSubtitleLanguageOptions:1];

  id v3 = objc_loadWeakRetained(v1);
  [v3 _updateSelectedSubtitleOption:1];
}

void sub_1CE78(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateAvailableAudioLanguageCodes:1];
}

void sub_1D25C(id a1)
{
  uint64_t v1 = (void *)qword_80590;
  qword_80590 = (uint64_t)&off_70018;
}

void sub_1D2B4(id a1)
{
  uint64_t v1 = (void *)qword_805A0;
  qword_805A0 = (uint64_t)&off_70030;
}

void sub_1DFB0(id a1)
{
  id v1 = -[AXTVBluetoothManager __init](objc_alloc(&OBJC_CLASS___AXTVBluetoothManager), "__init");
  uint64_t v2 = (void *)qword_805B0;
  qword_805B0 = (uint64_t)v1;
}

id sub_20434(uint64_t a1, void *a2)
{
  return [a2 _reloadSettingsItemsForSettingsChange];
}

NSString *__cdecl sub_20B88(id a1, NSNumber *a2)
{
  NSInteger v2 = -[NSNumber integerValue](a2, "integerValue");
  if (v2)
  {
    if (v2 == 4)
    {
      uint64_t v10 = @"AXHoverTextDisplayModeInlineHoverTitle";
    }

    else
    {
      if (v2 != 1)
      {
        uint64_t v12 = 0LL;
        return (NSString *)v12;
      }

      uint64_t v10 = @"AXHoverTextDisplayModeDockedBottomTitle";
    }
  }

  else
  {
    uint64_t v10 = @"AXHoverTextDisplayModeDockedTopTitle";
  }

  id v11 = AXTVLocString(v10, v3, v4, v5, v6, v7, v8, v9, vars0);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  return (NSString *)v12;
}

NSString *__cdecl sub_20BE4(id a1, NSNumber *a2)
{
  unint64_t v2 = -[NSNumber integerValue](a2, "integerValue");
  if (v2 > 4)
  {
    id v11 = 0LL;
  }

  else
  {
    id v10 = AXTVLocString(off_66138[v2], v3, v4, v5, v6, v7, v8, v9, vars0);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  }

  return (NSString *)v11;
}

id sub_20C20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v9 = AXTVLocString(@"AXHoverTextTextSizeTitle", a2, a3, a4, a5, a6, a7, a8, v21);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  double v11 = HTMinimumTextSize;
  double v12 = HTMaximumTextSize;
  [*(id *)(a1 + 32) hoverTextFontSize];
  if (v13 < HTMinimumTextSize) {
    double v13 = HTMinimumTextSize;
  }
  if (v13 >= HTMaximumTextSize) {
    double v14 = HTMaximumTextSize;
  }
  else {
    double v14 = v13;
  }
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"a"));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 imageByApplyingSymbolConfiguration:*(void *)(a1 + 40)]);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"a"));
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 imageByApplyingSymbolConfiguration:*(void *)(a1 + 48)]);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_20DA8;
  v22[3] = &unk_65250;
  id v23 = *(id *)(a1 + 32);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[AXTVSliderViewController sliderWithTitle:subtitle:minimumValue:maximumValue:currentValue:leftDetailImage:rightDetailImage:discreteStepAmount:valueChangeHandler:valueFormatHandler:]( &OBJC_CLASS___AXTVSliderViewController,  "sliderWithTitle:subtitle:minimumValue:maximumValue:currentValue:leftDetailImage:rightDetailImage:dis creteStepAmount:valueChangeHandler:valueFormatHandler:",  v10,  0LL,  v16,  v18,  v22,  &stru_65F70,  v11,  v12,  v14,  1.0));

  return v19;
}

id sub_20DA8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setHoverTextFontSize:");
}

NSString *__cdecl sub_20DB0(id a1, double a2, double a3, double a4)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[AXTVUtils hoverTextFontSizeFormatter]( &OBJC_CLASS___AXTVUtils,  "hoverTextFontSizeFormatter",  a2,  a3,  a4));
  uint64_t v6 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([v5 formattingBlock]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a2));
  uint64_t v8 = ((uint64_t (**)(void, void *))v6)[2](v6, v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  return (NSString *)v9;
}

UIViewController *__cdecl sub_20E3C(id a1, TSKSettingItem *a2)
{
  unint64_t v2 = objc_alloc(&OBJC_CLASS___AXTVHoverTextColorPickerViewController);
  id v10 = AXTVLocString(@"AXHoverTextTextColorTitle", v3, v4, v5, v6, v7, v8, v9, v14);
  double v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  double v12 = -[AXTVHoverTextColorPickerViewController initWithTitle:](v2, "initWithTitle:", v11);

  -[AXTVHoverTextColorPickerViewController setColorGetter:](v12, "setColorGetter:", &stru_65FF8);
  -[AXTVHoverTextColorPickerViewController setColorSetter:](v12, "setColorSetter:", &stru_66038);
  return (UIViewController *)v12;
}

HTUITaggedColor *__cdecl sub_20EB0(id a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 hoverTextTextColor]);

  return (HTUITaggedColor *)v2;
}

void sub_20EF0(id a1, HTUITaggedColor *a2)
{
  unint64_t v2 = a2;
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v3 setHoverTextTextColor:v2];
}

UIViewController *__cdecl sub_20F40(id a1, TSKSettingItem *a2)
{
  unint64_t v2 = objc_alloc(&OBJC_CLASS___AXTVHoverTextColorPickerViewController);
  id v10 = AXTVLocString(@"AXHoverTextBackgroundColorTitle", v3, v4, v5, v6, v7, v8, v9, v14);
  double v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  double v12 = -[AXTVHoverTextColorPickerViewController initWithTitle:](v2, "initWithTitle:", v11);

  -[AXTVHoverTextColorPickerViewController setColorGetter:](v12, "setColorGetter:", &stru_66078);
  -[AXTVHoverTextColorPickerViewController setColorSetter:](v12, "setColorSetter:", &stru_66098);
  return (UIViewController *)v12;
}

HTUITaggedColor *__cdecl sub_20FB4(id a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 hoverTextBackgroundColor]);

  return (HTUITaggedColor *)v2;
}

void sub_20FF4(id a1, HTUITaggedColor *a2)
{
  unint64_t v2 = a2;
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v3 setHoverTextBackgroundColor:v2];
}

id sub_21044(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v9 = AXTVLocString(@"AXHoverTextBackgroundOpacityTitle", a2, a3, a4, a5, a6, a7, a8, v15);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  [*(id *)(a1 + 32) hoverTextBackgroundOpacity];
  double v12 = v11;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_21124;
  v16[3] = &unk_65250;
  id v17 = *(id *)(a1 + 32);
  double v13 = (void *)objc_claimAutoreleasedReturnValue( +[AXTVSliderViewController sliderWithTitle:subtitle:minimumValue:maximumValue:currentValue:discreteStepAmount:valueChangeHandler:valueFormatHandler:]( &OBJC_CLASS___AXTVSliderViewController,  "sliderWithTitle:subtitle:minimumValue:maximumValue:currentValue:discreteStepAmount:valueChangeHandle r:valueFormatHandler:",  v10,  0LL,  v16,  &stru_660B8,  0.35,  1.0,  v12,  0.01));

  return v13;
}

id sub_21124(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setHoverTextBackgroundOpacity:");
}

NSString *__cdecl sub_2112C(id a1, double a2, double a3, double a4)
{
  float v4 = a2;
  return (NSString *)AXFormatFloatWithPercentage(0LL, v4, a3, a4);
}

UIViewController *__cdecl sub_21138(id a1, TSKSettingItem *a2)
{
  unint64_t v2 = objc_alloc(&OBJC_CLASS___AXTVHoverTextColorPickerViewController);
  id v10 = AXTVLocString(@"AXHoverTextBorderColorTitle", v3, v4, v5, v6, v7, v8, v9, v14);
  double v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  double v12 = -[AXTVHoverTextColorPickerViewController initWithTitle:](v2, "initWithTitle:", v11);

  -[AXTVHoverTextColorPickerViewController setColorGetter:](v12, "setColorGetter:", &stru_660F8);
  -[AXTVHoverTextColorPickerViewController setColorSetter:](v12, "setColorSetter:", &stru_66118);
  return (UIViewController *)v12;
}

HTUITaggedColor *__cdecl sub_211AC(id a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([v1 hoverTextBorderColor]);

  return (HTUITaggedColor *)v2;
}

void sub_211EC(id a1, HTUITaggedColor *a2)
{
  unint64_t v2 = a2;
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v3 setHoverTextBorderColor:v2];
}

void sub_21D0C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
}

double sub_21D38(uint64_t a1)
{
  *(void *)&double result = (unint64_t)CGRectInset(v2, -20.0, -20.0);
  return result;
}

void sub_21D58(uint64_t a1)
{
  id v2 = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = (void *)objc_claimAutoreleasedReturnValue([v2 traitCollection]);
  objc_msgSend(v2, "_updateColorsForUserInterfaceStyle:", objc_msgSend(v1, "userInterfaceStyle"));
}

LABEL_6:
}

void sub_234F4(id a1, TSKSettingItem *a2, id a3)
{
  id v3 = a2;
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[AXTVVoiceOverAudioDuckingViewController _descriptionForCurrentAudioDuckingMode]( &OBJC_CLASS___AXTVVoiceOverAudioDuckingViewController,  "_descriptionForCurrentAudioDuckingMode"));
  -[TSKSettingItem setLocalizedDescription:](v3, "setLocalizedDescription:", v4);
}

NSString *__cdecl sub_23548(id a1, NSNumber *a2)
{
  NSInteger v2 = -[NSNumber integerValue](a2, "integerValue");
  id v10 = @"AXVoiceOverAudioDuckingOffValue";
  if (v2 == 2) {
    id v10 = @"AXVoiceOverAudioDuckingAlwaysValue";
  }
  if (v2 == 1) {
    double v11 = @"AXVoiceOverAudioDuckingWhenSpeakingValue";
  }
  else {
    double v11 = (__CFString *)v10;
  }
  id v12 = AXTVLocString(v11, v3, v4, v5, v6, v7, v8, v9, vars0);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue(v12);
}

id sub_23590(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v9 = AXTVLocString(@"AXVoiceOverAudioDuckingVolumeTitle", a2, a3, a4, a5, a6, a7, a8, v19);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  +[AXTVVoiceOverAudioDuckingViewController _minimumVolumeValue]( &OBJC_CLASS___AXTVVoiceOverAudioDuckingViewController,  "_minimumVolumeValue");
  double v12 = v11;
  +[AXTVVoiceOverAudioDuckingViewController _maximumVolumeValue]( &OBJC_CLASS___AXTVVoiceOverAudioDuckingViewController,  "_maximumVolumeValue");
  double v14 = v13;
  [*(id *)(a1 + 32) voiceOverVolume];
  double v16 = v15;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_23698;
  v20[3] = &unk_65250;
  id v21 = *(id *)(a1 + 32);
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[AXTVSliderViewController sliderWithTitle:subtitle:minimumValue:maximumValue:currentValue:discreteStepAmount:valueChangeHandler:valueFormatHandler:]( &OBJC_CLASS___AXTVSliderViewController,  "sliderWithTitle:subtitle:minimumValue:maximumValue:currentValue:discreteStepAmount:valueChangeHandle r:valueFormatHandler:",  v10,  0LL,  v20,  &stru_661C8,  v12,  v14,  v16,  0.0));

  return v17;
}

id sub_23698(uint64_t a1, double a2)
{
  *(float *)&a2 = a2;
  return [*(id *)(a1 + 32) setVoiceOverVolume:a2];
}

NSString *__cdecl sub_236A4(id a1, double a2, double a3, double a4)
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVUtils percentageFormtter](&OBJC_CLASS___AXTVUtils, "percentageFormtter", a2, a3, a4));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a2));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 stringForObjectValue:v6]);

  return (NSString *)v7;
}

void sub_23C70( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, id a34)
{
}

void sub_23CF4(uint64_t a1, void *a2)
{
  NSInteger v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained selectedLanguages]);
  objc_msgSend(v3, "setAccessoryTypes:", 2 * (objc_msgSend(v4, "count") == 0));
}

void sub_23D5C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = (id)objc_claimAutoreleasedReturnValue([v3 representedObject]);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained selectedLanguages]);
  else {
    uint64_t v6 = 0LL;
  }
  [v3 setAccessoryTypes:v6];
}

id sub_2469C(uint64_t a1)
{
  double v2 = (double)(rand() % 20);
  if ((rand() & 1) != 0) {
    double v3 = -v2;
  }
  else {
    double v3 = v2;
  }
  CGAffineTransformMakeTranslation(&v8, 0.0, v3);
  uint64_t v4 = *(void **)(a1 + 32);
  CGAffineTransform v6 = v8;
  CGAffineTransformScale(&v7, &v6, 1.08000004, 1.08000004);
  return [v4 setTransform:&v7];
}

id sub_24744(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

id sub_24750(uint64_t a1)
{
  double v2 = *(void **)(a1 + 40);
  __int128 v3 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v5[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v5[1] = v3;
  v5[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  return [v2 setTransform:v5];
}

_BYTE *sub_247FC(uint64_t a1)
{
  double result = *(_BYTE **)(a1 + 32);
  if (result[8]) {
    return [result performSelector:"_updateSubtitleImage" withObject:0 afterDelay:0.0];
  }
  return result;
}

void sub_24908(id a1)
{
  id v1 = (void *)qword_805C0;
  qword_805C0 = (uint64_t)&off_700C0;
}

void sub_24A14(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained showNextImage];
}

void sub_24F9C(id a1, TSKSettingItem *a2, id a3)
{
  CGAffineTransform v8 = a2;
  __int128 v3 = (void *)objc_claimAutoreleasedReturnValue(-[TSKSettingItem representedObject](v8, "representedObject"));
  uint64_t v4 = (char *)[v3 integerValue];

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  BOOL v6 = [v5 switchControlTapBehavior] == v4;

  -[TSKSettingItem setAccessoryTypes:](v8, "setAccessoryTypes:", 2LL * v6);
  if (v4 == (_BYTE *)&dword_0 + 1)
  {
    CGAffineTransform v7 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    -[TSKSettingItem setEnabled:]( v8,  "setEnabled:",  [v7 switchControlScanningStyle] != (char *)&dword_0 + 2);
  }

  else
  {
    -[TSKSettingItem setEnabled:](v8, "setEnabled:", 1LL);
  }
}

void sub_25204( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

void sub_25224(uint64_t a1)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  BOOL v2 = [v4 switchControlTapBehavior] != (char *)&dword_0 + 1;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setHidden:v2];
}

id sub_25284(uint64_t a1)
{
  uint64_t v2 = AXParameterizedLocalizedString(2LL, @"TAP_BEHAVIOR_AUTO_TIMEOUT_LABEL");
  __int128 v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v11 = AXTVLocString(@"TAP_BEHAVIOR_AUTO_TIMEOUT_ADJUST_INSTRUCTIONS", v4, v5, v6, v7, v8, v9, v10, v19);
  double v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  double v13 = kSwitchControlAutoTapTimeoutMin;
  double v14 = kSwitchControlAutoTapTimeoutMax;
  [*(id *)(a1 + 32) switchControlAutoTapTimeout];
  double v16 = v15;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_2539C;
  v20[3] = &unk_65250;
  id v21 = *(id *)(a1 + 32);
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[AXTVSliderViewController sliderWithTitle:subtitle:minimumValue:maximumValue:currentValue:discreteStepAmount:valueChangeHandler:valueFormatHandler:]( &OBJC_CLASS___AXTVSliderViewController,  "sliderWithTitle:subtitle:minimumValue:maximumValue:currentValue:discreteStepAmount:valueChangeHandle r:valueFormatHandler:",  v3,  v12,  v20,  &stru_66250,  v13,  v14,  v16,  0.1));

  return v17;
}

id sub_2539C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSwitchControlAutoTapTimeout:");
}

NSString *__cdecl sub_253A4(id a1, double a2, double a3, double a4)
{
  return (NSString *)AXLocDuration(0LL, a2, a3, a4);
}

void sub_256D8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_25700(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _updateItem:v3];
}

void sub_25864(_Unwind_Exception *a1)
{
}

void sub_2588C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = SCATLocStringForAction([v3 integerValue]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v5,  0LL,  v3,  0LL,  *(void *)(a1 + 32),  "actionCellClicked:"));

  [*(id *)(a1 + 40) addObject:v6];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_25984;
  v7[3] = &unk_65798;
  objc_copyWeak(&v8, (id *)(a1 + 48));
  [v6 setUpdateBlock:v7];
  objc_destroyWeak(&v8);
}

void sub_25970(_Unwind_Exception *a1)
{
}

void sub_25984(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _updateItem:v3];
}

void sub_25AE8(_Unwind_Exception *a1)
{
}

void sub_25B10(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = SCATLocStringForAction([v3 integerValue]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v5,  0LL,  v3,  0LL,  *(void *)(a1 + 32),  "actionCellClicked:"));

  [*(id *)(a1 + 40) addObject:v6];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_25C08;
  v7[3] = &unk_65798;
  objc_copyWeak(&v8, (id *)(a1 + 48));
  [v6 setUpdateBlock:v7];
  objc_destroyWeak(&v8);
}

void sub_25BF4(_Unwind_Exception *a1)
{
}

void sub_25C08(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _updateItem:v3];
}

void sub_25D94(_Unwind_Exception *a1)
{
}

void sub_25DBC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = SCATLocStringForAction([v3 integerValue]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v5,  0LL,  v3,  0LL,  *(void *)(a1 + 32),  "actionCellClicked:"));

  [*(id *)(a1 + 40) addObject:v6];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_25EB4;
  v7[3] = &unk_65798;
  objc_copyWeak(&v8, (id *)(a1 + 48));
  [v6 setUpdateBlock:v7];
  objc_destroyWeak(&v8);
}

void sub_25EA0(_Unwind_Exception *a1)
{
}

void sub_25EB4(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _updateItem:v3];
}

id sub_260CC(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) popBackToViewControllerOfType:objc_opt_class(AXTVSwitchControlSwitchVariantsViewController)];
  if ((result & 1) == 0) {
    return [*(id *)(a1 + 32) popBackToViewControllerOfType:objc_opt_class(AXTVSwitchControlSwitchesViewController)];
  }
  return result;
}

void sub_26784(id a1, TSKSettingItem *a2, id a3)
{
  uint64_t v6 = a2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v4 = [v3 switchControlScanAfterTapLocation];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TSKSettingItem representedObject](v6, "representedObject"));
  LODWORD(v4) = v4 == [v5 integerValue];

  -[TSKSettingItem setAccessoryTypes:](v6, "setAccessoryTypes:", 2LL * v4);
}

void sub_26B70( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, id a28)
{
}

void sub_26BA0(uint64_t a1, void *a2)
{
  id v9 = a2;
  uint64_t v3 = objc_claimAutoreleasedReturnValue([v9 representedObject]);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue([WeakRetained colorGetter]);

  if (v5)
  {
    uint64_t v6 = v5[2](v5);
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  if (v3 | v7)
  {
    else {
      uint64_t v8 = 0LL;
    }
  }

  else
  {
    uint64_t v8 = 2LL;
  }

  [v9 setAccessoryTypes:v8];
}

void sub_27140( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

id sub_27168(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_2728C;
  v12[3] = &unk_65318;
  objc_copyWeak(&v13, (id *)(a1 + 32));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  0LL,  0LL,  v6,  0LL,  v12));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_272F8;
  v10[3] = &unk_65228;
  id v8 = v6;
  id v11 = v8;
  [v7 setUpdateBlock:v10];

  objc_destroyWeak(&v13);
  return v7;
}

void sub_27274(_Unwind_Exception *a1)
{
}

id sub_2728C(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 representedObject]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _editStyleControllerWithStyle:v5]);
  return v6;
}

void sub_272F8(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = (id)objc_claimAutoreleasedReturnValue([v2 name]);
  [v3 setLocalizedTitle:v4];
}

void sub_27A5C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

void sub_27A98(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained deleteExistingStyle:*(void *)(a1 + 32)];
}

void sub_297D8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, id location)
{
}

id sub_29800(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = AXAirPodsLocalizedStringForKey(@"ToneVolume");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained facade]);
  [v7 toneVolume];
  v17[1] = 3221225472LL;
  v17[2] = sub_299C8;
  v17[3] = &unk_65250;
  uint64_t v18 = *(void *)(a1 + 32);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_29A08;
  v16[3] = &unk_662E8;
  void v16[4] = v18;
  v17[0] = _NSConcreteStackBlock;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[AXTVSliderViewController sliderWithTitle:subtitle:minimumValue:maximumValue:currentValue:discreteStepAmount:valueChangeHandler:valueFormatHandler:]( &OBJC_CLASS___AXTVSliderViewController,  "sliderWithTitle:subtitle:minimumValue:maximumValue:currentValue:discreteStepAmount:valueChangeHandler :valueFormatHandler:",  v5,  0LL,  v17,  v16,  15.0,  100.0,  v8,  1.0));

  [*(id *)(a1 + 32) _defaultSliderValue];
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v10 / 100.0));
  [v9 setDefaultTickValue:v11];

  objc_initWeak(&location, *(id *)(a1 + 32));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_29A28;
  v13[3] = &unk_66310;
  objc_copyWeak(&v14, &location);
  [v9 setSubtitleTextHandler:v13];
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v9;
}

void sub_299AC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_299C8(uint64_t a1, double a2)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) facade]);
  [v3 setToneVolume:a2];
}

uint64_t sub_29A08(uint64_t a1)
{
  *(float *)&double v1 = v1;
  return AXFormatFloatWithPercentage(0LL, *(float *)&v1, v2, v3);
}

id sub_29A28(uint64_t a1)
{
  id v1 = objc_loadWeakRetained((id *)(a1 + 32));
  double v2 = (void *)objc_claimAutoreleasedReturnValue([v1 facade]);
  [v2 toneVolume];
  *(float *)&double v3 = v3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v1 _toneVolumeFooter:v3]);

  return v4;
}

uint64_t sub_29A90(uint64_t a1, void *a2)
{
  double v2 = *(void **)(a1 + 32);
  [a2 floatValue];
  [v2 _displayedToneVolume:v3];
  *(float *)&double v4 = v4;
  return AXFormatFloatWithPercentage(0LL, *(float *)&v4, v5, v6);
}

NSString *__cdecl sub_29FD0(id a1, NSNumber *a2)
{
  double v3 = fabs(v2 + -0.25);
  if (v2 < 0.25 || v3 < 2.22044605e-16)
  {
    double v5 = @"PressDuration_Default";
  }

  else if (fabs(v2 + -0.45) < 2.22044605e-16 || v2 < 0.45)
  {
    double v5 = @"PressDuration_Slow";
  }

  else
  {
    double v5 = @"PressDuration_Slowest";
  }

  uint64_t v7 = AXAirPodsLocalizedStringForKey(v5);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue(v7);
}

NSString *__cdecl sub_2A084(id a1, NSNumber *a2)
{
  double v3 = @"HoldDuration_Fastest";
  if (v2 >= 0.35 && fabs(v2 + -0.35) >= 0.001)
  {
    if (fabs(v2 + -0.4) < 0.001 || v2 < 0.4) {
      double v3 = @"HoldDuration_Fast";
    }
    else {
      double v3 = @"HoldDuration_Default";
    }
  }

  uint64_t v5 = AXAirPodsLocalizedStringForKey(v3);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue(v5);
}

NSString *_AXTVLocStringWithTable(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = a2;
  uint64_t v7 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(&OBJC_CLASS___AXTVUtils));
  double v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = v8;
  if (v8)
  {
    double v10 = (void *)objc_claimAutoreleasedReturnValue([v8 localizedStringForKey:v5 value:&stru_69430 table:v6]);
    unsigned int v11 = [v10 hasSuffix:@"%"];
    if (v11)
    {
      uint64_t v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "substringToIndex:", (char *)objc_msgSend(v10, "length") - 1));

      double v10 = (void *)v12;
    }

    id v13 = -[NSString initWithFormat:arguments:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:arguments:",  v10,  a3);

    if (v11)
    {
      uint64_t v14 = objc_claimAutoreleasedReturnValue(-[NSString stringByAppendingString:](v13, "stringByAppendingString:", @"%"));

      id v13 = (NSString *)v14;
    }
  }

  else
  {
    id v13 = 0LL;
  }

  return v13;
}

id AXTVLocString( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9 = _AXTVLocStringWithTable(a1, @"Accessibility", (uint64_t)&a9);
  return (id)objc_claimAutoreleasedReturnValue(v9);
}

id AXTVLocStringWithTable( void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9 = _AXTVLocStringWithTable(a1, a2, (uint64_t)&a9);
  return (id)objc_claimAutoreleasedReturnValue(v9);
}

void sub_2AAD8(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___AXTVUtils);
  double v2 = (void *)qword_805D0;
  qword_805D0 = (uint64_t)v1;
}

void sub_2AECC(id a1)
{
  id v1 = [[TVSBlockFormatter alloc] initWithFormattingBlock:&stru_66400];
  double v2 = (void *)qword_805E0;
  qword_805E0 = (uint64_t)v1;
}

NSString *__cdecl sub_2AF00(id a1, NSNumber *a2)
{
  id v2 = -[NSNumber floatValue](a2, "floatValue");
  float v11 = AXSLinearValueForLogarithmicValue(v2, v3);
  double v12 = v11 + -0.5;
  if (v11 <= 0.5)
  {
    double v26 = v12 * -2.0;
    double v27 = fabs(v12 * -2.0);
    if (v27 >= 0.01)
    {
      float v30 = v26;
      uint64_t v31 = AXFormatFloatWithPercentage(0LL, fabsf(v30), v27, 0.01);
      id v17 = (void *)objc_claimAutoreleasedReturnValue(v31);
      id v25 = AXTVLocString(@"AXAudioBalanceValueLeft", v32, v33, v34, v35, v36, v37, v38, (uint64_t)v17);
      goto LABEL_7;
    }
  }

  else
  {
    double v13 = v12 + v12;
    double v14 = fabs(v12 + v12);
    if (v14 >= 0.01)
    {
      float v15 = v13;
      uint64_t v16 = AXFormatFloatWithPercentage(0LL, v15, v14, 0.01);
      id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      id v25 = AXTVLocString(@"AXAudioBalanceValueRight", v18, v19, v20, v21, v22, v23, v24, (uint64_t)v17);
LABEL_7:
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(v25);

      return (NSString *)v29;
    }
  }

  id v28 = AXTVLocString(@"AXAudioBalanceValueCenter", v4, v5, v6, v7, v8, v9, v10, v40);
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  return (NSString *)v29;
}

NSString *__cdecl sub_2B014(id a1, NSNumber *a2)
{
  return (NSString *)AXLocDuration(0LL, v2, v3, v4);
}

NSString *__cdecl sub_2B058(id a1, NSNumber *a2)
{
  return (NSString *)AXFormatNumber(a2);
}

NSString *__cdecl sub_2B088(id a1, NSNumber *a2)
{
  if (-[NSNumber BOOLValue](a2, "BOOLValue")) {
    double v2 = @"FEATURE_ON";
  }
  else {
    double v2 = @"FEATURE_OFF";
  }
  uint64_t v3 = AXParameterizedLocalizedString(2LL, v2);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue(v3);
}

NSString *__cdecl sub_2B0EC(id a1, id a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0
    || (uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSSet), (objc_opt_isKindOfClass(v2, v4) & 1) != 0))
  {
    uint64_t v5 = AXFormatInteger([v2 count]);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  }

  else
  {
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v2, v8) & 1) != 0)
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v2 allKeys]);
      uint64_t v10 = AXFormatInteger([v9 count]);
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v10);
    }

    else
    {
      uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSArray);
      char isKindOfClass = objc_opt_isKindOfClass(v2, v11);
      uint64_t v6 = 0LL;
      if (v2 && (isKindOfClass & 1) == 0)
      {
        double v13 = (objc_class *)objc_opt_class(v2);
        double v14 = NSStringFromClass(v13);
        float v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/ATVAccessibility/settings/AccessibilitySettings/source/AXTVUtils.m",  239LL,  "+[AXTVUtils collectionCountValueFormatter]_block_invoke",  @"This formatter is for known collections only. Input: %@ - %@");

        uint64_t v6 = 0LL;
      }
    }
  }

  return (NSString *)v6;
}

NSString *__cdecl sub_2B244(id a1, NSNumber *a2)
{
  unint64_t v2 = -[NSNumber integerValue](a2, "integerValue");
  if (v2 > 2)
  {
    uint64_t v4 = 0LL;
  }

  else
  {
    uint64_t v3 = AXParameterizedLocalizedString(2LL, off_666E8[v2]);
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  }

  return (NSString *)v4;
}

NSString *__cdecl sub_2B2AC(id a1, NSNumber *a2)
{
  unint64_t v2 = -[NSNumber integerValue](a2, "integerValue");
  if (v2 > 2)
  {
    uint64_t v4 = 0LL;
  }

  else
  {
    uint64_t v3 = AXParameterizedLocalizedString(2LL, off_66700[v2]);
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  }

  return (NSString *)v4;
}

NSString *__cdecl sub_2B314(id a1, NSNumber *a2)
{
  NSInteger v2 = -[NSNumber integerValue](a2, "integerValue");
  if (v2)
  {
    if (v2 != 1)
    {
      uint64_t v5 = 0LL;
      return (NSString *)v5;
    }

    uint64_t v3 = @"SCAN_LOCATION_AFTER_TAP_CURRENT_ITEM_LABEL";
  }

  else
  {
    uint64_t v3 = @"SCAN_LOCATION_AFTER_TAP_DEFAULT_LABEL";
  }

  uint64_t v4 = AXParameterizedLocalizedString(2LL, v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  return (NSString *)v5;
}

NSString *__cdecl sub_2B388(id a1, id a2)
{
  return 0LL;
}

NSString *__cdecl sub_2B3B8(id a1, NSNumber *a2)
{
  return (NSString *)AXFormatFloatWithPercentage(0LL, v2, v3, v4);
}

NSString *__cdecl sub_2B3FC(id a1, NSNumber *a2)
{
  LODWORD(v2) = 1120403456;
  return (NSString *)AXFormatFloatWithPercentage(0LL, v3 / 100.0, v2, v4);
}

NSString *__cdecl sub_2B44C(id a1, NSNumber *a2)
{
  return (NSString *)+[AXTVUtils colorNameForHue:saturation:]( &OBJC_CLASS___AXTVUtils,  "colorNameForHue:saturation:",  v2 * 360.0,  0.0);
}

NSString *__cdecl sub_2B4A8(id a1, AXSwitch *a2)
{
  float v2 = a2;
  float v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned int v4 = [v3 assistiveTouchLongPressEnabled];

  if (v4 && -[AXSwitch longPressAction](v2, "longPressAction"))
  {
    uint64_t v5 = AXParameterizedLocalizedString(2LL, @"LONG_PRESS_MULTIPLE_ACTIONS");
    uint64_t v6 = objc_claimAutoreleasedReturnValue(v5);
  }

  else
  {
    uint64_t v7 = SCATLocStringForAction(-[AXSwitch action](v2, "action"));
    uint64_t v6 = objc_claimAutoreleasedReturnValue(v7);
  }

  uint64_t v8 = (void *)v6;

  return (NSString *)v8;
}

NSString *__cdecl sub_2B55C(id a1, AXSwitch *a2)
{
  return (NSString *)SCATLocStringForAction(-[AXSwitch action](a2, "action"));
}

NSString *__cdecl sub_2B59C(id a1, AXSwitch *a2)
{
  float v2 = a2;
  if (-[AXSwitch longPressAction](v2, "longPressAction")) {
    uint64_t v3 = SCATLocStringForAction(-[AXSwitch longPressAction](v2, "longPressAction"));
  }
  else {
    uint64_t v3 = AXParameterizedLocalizedString(2LL, @"LONG_PRESS_NO_ACTION");
  }
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return (NSString *)v4;
}

NSString *__cdecl sub_2B804(id a1, UIColor *a2)
{
  uint64_t v104 = 0LL;
  uint64_t v105 = 0LL;
  uint64_t v102 = 0LL;
  uint64_t v103 = 0LL;
  uint64_t v101 = 0LL;
  uint64_t v93 = a2;
  if (+[AXTVUtils _extractColorType:r:g:b:w:a:](&OBJC_CLASS___AXTVUtils, "_extractColorType:r:g:b:w:a:"))
  {
    id v9 = AXTVLocString(@"AXCaptionColorWhite", v2, v3, v4, v5, v6, v7, v8, v78);
    uint64_t v92 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v106[0] = v92;
    uint64_t v91 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  1.0,  1.0,  1.0,  1.0));
    v107[0] = v91;
    id v17 = AXTVLocString(@"AXCaptionColorCyan", v10, v11, v12, v13, v14, v15, v16, v79);
    uint64_t v90 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v106[1] = v90;
    uint64_t v89 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor cyanColor](&OBJC_CLASS___UIColor, "cyanColor"));
    v107[1] = v89;
    id v25 = AXTVLocString(@"AXCaptionColorBlue", v18, v19, v20, v21, v22, v23, v24, v80);
    uint64_t v88 = (void *)objc_claimAutoreleasedReturnValue(v25);
    v106[2] = v88;
    uint64_t v87 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blueColor](&OBJC_CLASS___UIColor, "blueColor"));
    v107[2] = v87;
    id v33 = AXTVLocString(@"AXCaptionColorGreen", v26, v27, v28, v29, v30, v31, v32, v81);
    uint64_t v82 = objc_claimAutoreleasedReturnValue(v33);
    v106[3] = v82;
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor greenColor](&OBJC_CLASS___UIColor, "greenColor"));
    v107[3] = v34;
    id v42 = AXTVLocString(@"AXCaptionColorYellow", v35, v36, v37, v38, v39, v40, v41, v82);
    uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
    v106[4] = v43;
    id v44 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor yellowColor](&OBJC_CLASS___UIColor, "yellowColor"));
    v107[4] = v44;
    id v52 = AXTVLocString(@"AXCaptionColorMagenta", v45, v46, v47, v48, v49, v50, v51, v83);
    uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
    v106[5] = v53;
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor magentaColor](&OBJC_CLASS___UIColor, "magentaColor"));
    v107[5] = v54;
    id v62 = AXTVLocString(@"AXCaptionColorRed", v55, v56, v57, v58, v59, v60, v61, v84);
    v63 = (void *)objc_claimAutoreleasedReturnValue(v62);
    v106[6] = v63;
    uint64_t v64 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](&OBJC_CLASS___UIColor, "redColor"));
    v107[6] = v64;
    id v72 = AXTVLocString(@"AXCaptionColorBlack", v65, v66, v67, v68, v69, v70, v71, v85);
    uint64_t v73 = (void *)objc_claimAutoreleasedReturnValue(v72);
    v106[7] = v73;
    uint64_t v74 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  0.0,  0.0,  0.0,  1.0));
    v107[7] = v74;
    uint64_t v75 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v107,  v106,  8LL));

    uint64_t v95 = 0LL;
    v96 = &v95;
    uint64_t v97 = 0x3032000000LL;
    v98 = sub_2BBD8;
    v99 = sub_2BBE8;
    id v100 = 0LL;
    v94[0] = _NSConcreteStackBlock;
    v94[1] = 3221225472LL;
    v94[2] = sub_2BBF0;
    v94[3] = &unk_66648;
    v94[5] = v105;
    v94[6] = v104;
    v94[4] = &v95;
    v94[7] = v103;
    v94[8] = v102;
    [v75 enumerateKeysAndObjectsUsingBlock:v94];
    uint64_t v76 = (__CFString *)(id)v96[5];
    _Block_object_dispose(&v95, 8);
  }

  else
  {
    uint64_t v76 = &stru_69430;
  }

  return (NSString *)v76;
}

void sub_2BBB8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, char a26)
{
}

uint64_t sub_2BBD8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_2BBE8(uint64_t a1)
{
}

void sub_2BBF0(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v8 = a2;
  double v13 = 0.0;
  double v14 = 0.0;
  double v11 = 0.0;
  double v12 = 0.0;
  uint64_t v10 = 0LL;
  int64_t v9 = +[AXTVUtils _extractColorType:r:g:b:w:a:]( &OBJC_CLASS___AXTVUtils,  "_extractColorType:r:g:b:w:a:",  a3,  &v14,  &v13,  &v12,  &v11,  &v10);
  if (v9 == 1)
  {
LABEL_8:
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
    *a4 = 1;
    goto LABEL_9;
  }

  if (v9 == 2
    && vabdd_f64(v14, *(double *)(a1 + 40)) < 0.001
    && vabdd_f64(v13, *(double *)(a1 + 48)) < 0.001
    && vabdd_f64(v12, *(double *)(a1 + 56)) < 0.001)
  {
    goto LABEL_8;
  }

LABEL_9:
}

    else {
      uint64_t v18 = TSKLocString(@"BTErrorGenericFormat", v17);
    }
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
    double v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v19, v20));
    goto LABEL_14;
  }

  if (a3 == 109)
  {
    double v12 = TSKLocString(@"BTErrorUnsupportedDeviceFormat", v8);
    double v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    double v14 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
    double v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v13, v14));

    uint64_t v35 = TSKLocString(@"SettingsOK", v10);
    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472LL;
    v39[2] = sub_3973C;
    v39[3] = &unk_659F8;
    uint64_t v40 = v6;
    objc_copyWeak(&v41, &location);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v36,  1LL,  v39));

    objc_destroyWeak(&v41);
    uint64_t v19 = v40;
LABEL_15:

    goto LABEL_16;
  }

  if (a3 != 156) {
    goto LABEL_9;
  }
  int64_t v9 = TSKLocString(@"BTErrorWrongPincode", v8);
  double v11 = (void *)objc_claimAutoreleasedReturnValue(v9);
LABEL_7:
  uint64_t v15 = 0LL;
LABEL_16:
  uint64_t v26 = TSKLocString(@"BTErrorHeader", v10);
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v27,  v11,  1LL));

  if (!v15)
  {
    uint64_t v30 = TSKLocString(@"SettingsOK", v29);
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472LL;
    v37[2] = sub_39798;
    v37[3] = &unk_66990;
    objc_copyWeak(&v38, &location);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v31,  1LL,  v37));

    objc_destroyWeak(&v38);
  }

  [v28 addAction:v15];
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBrailleBluetoothListViewController navigationController](self, "navigationController"));
  id v33 = [v32 popToViewController:self animated:1];

  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBrailleBluetoothListViewController navigationController](self, "navigationController"));
  [v34 presentViewController:v28 animated:1 completion:0];

  -[AXTVBrailleBluetoothListViewController setErrorAlert:](self, "setErrorAlert:", v28);
  objc_destroyWeak(&location);
LABEL_19:
}

  return v8;
}

NSString *__cdecl sub_2BE94(id a1, NSNumber *a2)
{
  double v2 = HTMinimumTextSize;
  double v3 = (double)-[NSNumber integerValue](a2, "integerValue");
  if (v2 >= v3) {
    double v3 = v2;
  }
  if (v3 >= HTMaximumTextSize) {
    double v3 = HTMaximumTextSize;
  }
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", (uint64_t)v3));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumberFormatter localizedStringFromNumber:numberStyle:]( &OBJC_CLASS___NSNumberFormatter,  "localizedStringFromNumber:numberStyle:",  v4,  1LL));

  id v13 = AXTVLocString(@"AXHoverTextTextSizeValue", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);
  double v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  return (NSString *)v14;
}

NSString *__cdecl sub_2BF74(id a1, NSString *a2)
{
  double v2 = a2;
  uint64_t v10 = v2;
  if (v2)
  {
    uint64_t v11 = v2;
  }

  else
  {
    id v12 = AXTVLocString(@"AXHoverTextDefaultFontValue", v3, v4, v5, v6, v7, v8, v9, v15);
    uint64_t v11 = (NSString *)objc_claimAutoreleasedReturnValue(v12);
  }

  id v13 = v11;

  return v13;
}

NSString *__cdecl sub_2BFE4(id a1, HTUITaggedColor *a2)
{
  if (a2)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[HTUITaggedColor localizedName](a2, "localizedName"));
  }

  else
  {
    id v9 = AXTVLocString(@"AXHoverTextDefaultColorValue", 0LL, v2, v3, v4, v5, v6, v7, vars0);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v9);
  }

  return (NSString *)v8;
}

id _AXTVMakeError( uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10 = a2;
  uint64_t v11 = -[NSString initWithFormat:arguments:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:arguments:", v10, &a9);

  NSErrorUserInfoKey v15 = NSLocalizedDescriptionKey;
  uint64_t v16 = v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"AXTV",  a1,  v12));

  return v13;
}

void sub_2C658( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void sub_2C678(uint64_t a1, void *a2)
{
  id v9 = (id)objc_claimAutoreleasedReturnValue([a2 styleID]);
  uint64_t v4 = (void *)MACaptionAppearancePrefCopyProfileName(v9, v3);
  if ([v4 hasPrefix:*(void *)(a1 + 32)])
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "substringFromIndex:", objc_msgSend(*(id *)(a1 + 32), "length")));
    unsigned int v6 = [v5 intValue];

    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8LL);
    signed int v8 = *(_DWORD *)(v7 + 24);
    *(_DWORD *)(v7 + 24) = v8;
  }
}

LABEL_29:
  _AXTVBTLog(0LL, 4LL, @"created %@", v7, v8, v9, v10, v11, v12);
  return (AXTVBluetoothDevice *)v12;
}

NSMutableArray *sub_2D9F4(void *a1)
{
  id v1 = a1;
  uint64_t v7 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  if (v1)
  {
    signed int v8 = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreate(kCFAllocatorSystemDefault);
    NSErrorUserInfoKey v15 = @"SerialNumber";
    id v16 = v1;
    IOHIDEventSystemClientSetMatching( v8,  +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));
    id v9 = IOHIDEventSystemClientCopyServices(v8);
    if (v9)
    {
      id v10 = v9;
      if (CFArrayGetCount(v9) >= 1)
      {
        CFIndex v11 = 0LL;
        do
        {
          ValueAtIndex = (__IOHIDServiceClient *)CFArrayGetValueAtIndex(v10, v11);
          CFTypeRef RegistryID = IOHIDServiceClientGetRegistryID(ValueAtIndex);
          if (RegistryID) {
            -[NSMutableArray addObject:](v7, "addObject:", RegistryID);
          }
          ++v11;
        }

        while (v11 < CFArrayGetCount(v10));
      }

      CFRelease(v10);
    }

    CFRelease(v8);
  }

  _AXTVBTLog(0LL, 4LL, @"device with serialNumber %@ has registry IDs %@", v2, v3, v4, v5, v6, (uint64_t)v1);

  return v7;
}

void sub_2DB34(void *a1@<X0>, void *a2@<X8>)
{
  id v3 = a1;
  *a2 = -1LL;
  a2[1] = -1LL;
  a2[2] = -1LL;
  if (v3)
  {
    CFTypeRef cf = (CFTypeRef)IOPSCopyPowerSourcesByType(0LL);
    CFArrayRef v4 = IOPSCopyPowerSourcesList(cf);
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    id v5 = -[__CFArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v20,  v24,  16LL);
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v21;
      while (2)
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v21 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
          id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"Name"]);
          unsigned int v11 = [v3 isEqual:v10];

          if (v11)
          {
            id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"Max Capacity"]);
            id v13 = [v12 integerValue];

            if ((uint64_t)v13 >= 1)
            {
              double v14 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"Current Capacity"]);
              id v15 = [v14 integerValue];

              if ((uint64_t)v15 >= 1)
              {
                else {
                  uint64_t v16 = (uint64_t)v13;
                }
                *a2 = vcvtmd_s64_f64((double)v16 / (double)(uint64_t)v13 * 100.0 + 0.5);
              }
            }

            id v17 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"Power Source State"]);
            a2[1] = [v17 isEqualToString:@"AC Power"];

            CFBooleanRef v18 = (CFBooleanRef)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"Is Charging"]);
            a2[2] = v18 == kCFBooleanTrue;

            goto LABEL_18;
          }
        }

        id v6 = -[__CFArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v20,  v24,  16LL);
        if (v6) {
          continue;
        }
        break;
      }
    }

LABEL_18:
    CFRelease(cf);
  }
}

LABEL_14:
  _AXTVBTLog(0LL, 4LL, @"created %@", v7, v8, v9, v10, v11, v12);
  return (AXTVBluetoothDevice *)v12;
}

LABEL_25:
    uint64_t v30 = -[AXTVBluetoothDevice initWithBTLEPeripheral:](self, "initWithBTLEPeripheral:", v15);
    goto LABEL_26;
  }

  if (!v5)
  {
    id v9 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVCoreBluetoothManager sharedInstance](&OBJC_CLASS___AXTVCoreBluetoothManager, "sharedInstance"));
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 connectedDevices]);
    -[NSMutableSet addObjectsFromArray:](v9, "addObjectsFromArray:", v11);

    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVCoreBluetoothManager sharedInstance](&OBJC_CLASS___AXTVCoreBluetoothManager, "sharedInstance"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 pairedDevices]);
    -[NSMutableSet addObjectsFromArray:](v9, "addObjectsFromArray:", v13);

    uint64_t v39 = 0u;
    uint64_t v40 = 0u;
    uint64_t v37 = 0u;
    uint64_t v38 = 0u;
    double v14 = v9;
    id v15 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v37,  v42,  16LL);
    if (v15)
    {
      uint64_t v16 = *(void *)v38;
      while (2)
      {
        for (j = 0LL; j != v15; j = (char *)j + 1)
        {
          if (*(void *)v38 != v16) {
            objc_enumerationMutation(v14);
          }
          CFBooleanRef v18 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)j);
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 address]);
          if ([v19 isEqualToString:v8])
          {
            id v15 = v18;

            goto LABEL_23;
          }
        }

        id v15 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v37,  v42,  16LL);
        if (v15) {
          continue;
        }
        break;
      }
    }

LABEL_23:
    uint64_t v30 = -[AXTVBluetoothDevice initWithClassicBluetoothDevice:](self, "initWithClassicBluetoothDevice:", v15);
LABEL_26:
    self = v30;
  }

  return self;
}

LABEL_36:
                        id v3 = 0LL;
LABEL_37:

                        return (NSString *)v3;
                      }

LABEL_35:
                      goto LABEL_36;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }

    goto LABEL_35;
  }

  id v3 = 0LL;
  return (NSString *)v3;
}

LABEL_10:
}

const char *sub_30C90(unsigned int a1)
{
  if (a1 > 0x30) {
    return "unknown";
  }
  else {
    return (&off_66760)[a1];
  }
}

uint64_t sub_3166C(void *a1, unint64_t a2)
{
  id v3 = a1;
  if ((unint64_t)[v3 length] <= a2)
  {
    uint64_t v7 = 0LL;
  }

  else
  {
    unsigned int v4 = [v3 characterAtIndex:a2];
    BOOL v5 = v4 - 65 < 6 || v4 - 97 < 6;
    unsigned int v6 = v4 - 48 < 0xA || v5;
    if (v4) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0LL;
    }
  }

  return v7;
}

BOOL sub_316E8(void *a1, unint64_t a2)
{
  id v3 = a1;
  BOOL v4 = (unint64_t)[v3 length] > a2
    && [v3 characterAtIndex:a2] == 58;

  return v4;
}

void sub_3173C( uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_31C54(uint64_t a1, uint64_t a2)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_32454;
  block[3] = &unk_66908;
  block[4] = a2;
  dispatch_async(&_dispatch_main_q, block);
}

NSString *__cdecl sub_32390(id a1, NSNumber *a2)
{
  else {
    id v9 = @"AXFocusStyleDefault";
  }
  id v10 = AXTVLocString(v9, v2, v3, v4, v5, v6, v7, v8, vars0);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue(v10);
}

id sub_32454(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSettings];
}

id sub_326CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v9 = AXTVLocString(@"AXLightSensitivityTitle", a2, a3, a4, a5, a6, a7, a8, v26);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v18 = AXTVLocString(@"AXLightSensitivityIntensityAdjustInstructions", v11, v12, v13, v14, v15, v16, v17, v27);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  double v20 = kMADisplayFilterPrefBrightnessIntensityMin;
  double v21 = kMADisplayFilterPrefBrightnessIntensityMax;
  [*(id *)(a1 + 32) displayFilterBrightnessIntensity];
  double v23 = v22;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_327E8;
  v28[3] = &unk_65250;
  id v29 = *(id *)(a1 + 32);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[AXTVSliderViewController sliderWithTitle:subtitle:minimumValue:maximumValue:currentValue:discreteStepAmount:valueChangeHandler:valueFormatHandler:]( &OBJC_CLASS___AXTVSliderViewController,  "sliderWithTitle:subtitle:minimumValue:maximumValue:currentValue:discreteStepAmount:valueChangeHandle r:valueFormatHandler:",  v10,  v19,  v28,  &stru_66928,  v20,  v21,  v23,  0.0));

  return v24;
}

id sub_327E8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDisplayFilterBrightnessIntensity:");
}

NSString *__cdecl sub_327F0(id a1, double a2, double a3, double a4)
{
  float v4 = a2;
  return (NSString *)AXFormatFloatWithPercentage(0LL, v4, a3, a4);
}

void sub_327FC(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setEnabled:", objc_msgSend(v2, "displayFilterCategoryLightSensitivityEnabled"));
}

void sub_32EFC(_Unwind_Exception *a1)
{
}

void sub_32F34(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained switchRegistrar]);
  [v1 beginFilteringEvents];
}

void sub_32F78(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained switchRegistrar]);
  [v1 endFilteringEvents];
}

void sub_3380C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = (id)objc_claimAutoreleasedReturnValue([v2 availableCaptionStyles]);
  [v3 setAvailableValues:v4];
}

void sub_3385C(id a1, TSKSettingItem *a2, id a3)
{
  id v3 = a2;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TSKSettingItem representedObject](v3, "representedObject"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v5 name]);
  -[TSKSettingItem setLocalizedTitle:](v3, "setLocalizedTitle:", v4);
}

NSString *__cdecl sub_338DC(id a1, AXTVCaptionStyle *a2)
{
  return -[AXTVCaptionStyle name](a2, "name");
}

uint64_t sub_339D4(uint64_t a1, uint64_t a2)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_33BE4;
  v3[3] = &unk_66908;
  v3[4] = a2;
  return AXPerformBlockOnMainThread(v3);
}

id sub_33BE4(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSettings];
}

void _AXTVBTLog( uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v12 = a3;
  if (qword_80628 != -1) {
    dispatch_once(&qword_80628, &stru_66A10);
  }
  else {
    uint64_t v13 = (&off_66A30)[a2 - 1];
  }
  id v14 = (id)*v13;
  id v15 = v12;
  os_log_with_args(v14, a1, [v15 UTF8String], &a9, v9);
}

void sub_33CF0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.Accessibility", "AXTV-BT-General");
  uint64_t v2 = (void *)qword_805F8;
  qword_805F8 = (uint64_t)v1;

  os_log_t v3 = os_log_create("com.apple.Accessibility", "AXTV-BT-CoreManager");
  id v4 = (void *)qword_80600;
  qword_80600 = (uint64_t)v3;

  os_log_t v5 = os_log_create("com.apple.Accessibility", "AXTV-BT-CoreDevice");
  uint64_t v6 = (void *)qword_80608;
  qword_80608 = (uint64_t)v5;

  os_log_t v7 = os_log_create("com.apple.Accessibility", "AXTV-BT-WrapperManager");
  uint64_t v8 = (void *)qword_80610;
  qword_80610 = (uint64_t)v7;

  os_log_t v9 = os_log_create("com.apple.Accessibility", "AXTV-BT-WrapperDevice");
  id v10 = (void *)qword_80618;
  qword_80618 = (uint64_t)v9;

  os_log_t v11 = os_log_create("com.apple.Accessibility", "AXTV-BM-Braille");
  id v12 = (void *)qword_80620;
  qword_80620 = (uint64_t)v11;
}

id sub_3403C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v9 = AXTVLocString(@"AXReduceWhitePointTitle", a2, a3, a4, a5, a6, a7, a8, v26);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v18 = AXTVLocString(@"AXReduceWhitePointAdjustIntensityInstructions", v11, v12, v13, v14, v15, v16, v17, v27);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  double v20 = kMADisplayFilterPrefReduceWhitePointIntensityMin;
  double v21 = kMADisplayFilterPrefReduceWhitePointIntensityMax;
  [*(id *)(a1 + 32) displayFilterReduceWhitePointIntensity];
  double v23 = v22;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_34158;
  v28[3] = &unk_65250;
  id v29 = *(id *)(a1 + 32);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[AXTVSliderViewController sliderWithTitle:subtitle:minimumValue:maximumValue:currentValue:discreteStepAmount:valueChangeHandler:valueFormatHandler:]( &OBJC_CLASS___AXTVSliderViewController,  "sliderWithTitle:subtitle:minimumValue:maximumValue:currentValue:discreteStepAmount:valueChangeHandle r:valueFormatHandler:",  v10,  v19,  v28,  &stru_66A58,  v20,  v21,  v23,  0.0));

  return v24;
}

id sub_34158(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDisplayFilterReduceWhitePointIntensity:");
}

NSString *__cdecl sub_34160(id a1, double a2, double a3, double a4)
{
  float v4 = a2;
  return (NSString *)AXFormatFloatWithPercentage(0LL, v4, a3, a4);
}

void sub_3416C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setEnabled:", objc_msgSend(v2, "displayFilterCategoryReduceWhitePointEnabled"));
}

AXTVBrailleLanguageVariantsController *sub_34674(uint64_t a1)
{
  uint64_t v2 = objc_alloc(&OBJC_CLASS___AXTVBrailleLanguageVariantsController);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) tableEnumerator]);
  float v4 = -[AXTVBrailleLanguageVariantsController initWithTableEnumerator:](v2, "initWithTableEnumerator:", v3);

  os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) title]);
  -[AXTVBrailleLanguageVariantsController setTitle:](v4, "setTitle:", v5);

  -[AXTVBrailleLanguageVariantsController setAddingNewLanguage:]( v4,  "setAddingNewLanguage:",  [*(id *)(a1 + 32) isAddingNewLanguage]);
  -[AXTVBrailleLanguageVariantsController setLanguageAgnostic:](v4, "setLanguageAgnostic:", 0LL);
  -[AXTVBrailleLanguageVariantsController setLocale:](v4, "setLocale:", *(void *)(a1 + 40));
  return v4;
}

int64_t sub_3471C(id a1, TSKSettingItem *a2, TSKSettingItem *a3)
{
  float v4 = a3;
  os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TSKSettingItem localizedTitle](a2, "localizedTitle"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[TSKSettingItem localizedTitle](v4, "localizedTitle"));

  id v7 = [v5 localizedCompare:v6];
  return (int64_t)v7;
}

AXTVBrailleLanguageVariantsController *sub_34788(uint64_t a1)
{
  uint64_t v2 = objc_alloc(&OBJC_CLASS___AXTVBrailleLanguageVariantsController);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) tableEnumerator]);
  float v4 = -[AXTVBrailleLanguageVariantsController initWithTableEnumerator:](v2, "initWithTableEnumerator:", v3);

  os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) title]);
  -[AXTVBrailleLanguageVariantsController setTitle:](v4, "setTitle:", v5);

  -[AXTVBrailleLanguageVariantsController setAddingNewLanguage:]( v4,  "setAddingNewLanguage:",  [*(id *)(a1 + 32) isAddingNewLanguage]);
  -[AXTVBrailleLanguageVariantsController setLanguageAgnostic:](v4, "setLanguageAgnostic:", 1LL);
  -[AXTVBrailleLanguageVariantsController setTableIdentifier:](v4, "setTableIdentifier:", *(void *)(a1 + 40));
  return v4;
}

void sub_34E08( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

void sub_34E34(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  id v3 = [v2 applicationState];

  if (!v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained stopScanning];
  }

void sub_34EAC(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  id v3 = [v2 applicationState];

  if (!v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained startScanning];
  }

void sub_350C4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

BOOL sub_350E0(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v4 = *(void *)(v3 + 24);
  *(void *)(v3 + 24) = v4 + 1;
  return v4 == 0;
}

BOOL sub_351DC(id a1, AXTVBluetoothDevice *a2, BOOL *a3)
{
  return (char *)-[AXTVBluetoothDevice type](a2, "type", a3) != (char *)&dword_0 + 1;
}

void sub_35E2C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setEnabled:", objc_msgSend(v2, "displayFilterCategoryColorEnabled"));
  id v7 = (id)objc_claimAutoreleasedReturnValue([v3 representedObject]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 keyPath]);
  os_log_t v5 = (void *)objc_claimAutoreleasedReturnValue([v7 valueForKey:v4]);
  else {
    uint64_t v6 = 0LL;
  }
  [v3 setAccessoryTypes:v6];
}

void sub_360A4(uint64_t a1, void *a2)
{
  id v4 = a2;
  else {
    uint64_t v3 = 1LL;
  }
  [v4 setHidden:v3];
}

id sub_360FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v9 = AXTVLocString(@"AXColorFilterRedAdjustTitle", a2, a3, a4, a5, a6, a7, a8, v26);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v18 = AXTVLocString(@"AXColorFilterRedAdjustIntensityInstructions", v11, v12, v13, v14, v15, v16, v17, v27);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  double v20 = kMADisplayFilterPrefRedColorIntensityMin;
  double v21 = kMADisplayFilterPrefRedColorIntensityMax;
  [*(id *)(a1 + 32) displayFilterRedColorCorrectionIntensity];
  double v23 = v22;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_36218;
  v28[3] = &unk_65250;
  id v29 = *(id *)(a1 + 32);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[AXTVSliderViewController sliderWithTitle:subtitle:minimumValue:maximumValue:currentValue:discreteStepAmount:valueChangeHandler:valueFormatHandler:]( &OBJC_CLASS___AXTVSliderViewController,  "sliderWithTitle:subtitle:minimumValue:maximumValue:currentValue:discreteStepAmount:valueChangeHandle r:valueFormatHandler:",  v10,  v19,  v28,  &stru_66B50,  v20,  v21,  v23,  0.0));

  return v24;
}

id sub_36218(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDisplayFilterRedColorCorrectionIntensity:");
}

NSString *__cdecl sub_36220(id a1, double a2, double a3, double a4)
{
  float v4 = a2;
  return (NSString *)AXFormatFloatWithPercentage(0LL, v4, a3, a4);
}

void sub_36400(uint64_t a1, void *a2)
{
  id v4 = a2;
  else {
    uint64_t v3 = 1LL;
  }
  [v4 setHidden:v3];
}

id sub_36458(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v9 = AXTVLocString(@"AXColorFilterGreenAdjustTitle", a2, a3, a4, a5, a6, a7, a8, v26);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v18 = AXTVLocString(@"AXColorFilterGreenAdjustIntensityInstructions", v11, v12, v13, v14, v15, v16, v17, v27);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  double v20 = kMADisplayFilterPrefGreenColorIntensityMin;
  double v21 = kMADisplayFilterPrefGreenColorIntensityMax;
  [*(id *)(a1 + 32) displayFilterGreenColorCorrectionIntensity];
  double v23 = v22;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_36574;
  v28[3] = &unk_65250;
  id v29 = *(id *)(a1 + 32);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[AXTVSliderViewController sliderWithTitle:subtitle:minimumValue:maximumValue:currentValue:discreteStepAmount:valueChangeHandler:valueFormatHandler:]( &OBJC_CLASS___AXTVSliderViewController,  "sliderWithTitle:subtitle:minimumValue:maximumValue:currentValue:discreteStepAmount:valueChangeHandle r:valueFormatHandler:",  v10,  v19,  v28,  &stru_66B70,  v20,  v21,  v23,  0.0));

  return v24;
}

id sub_36574(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDisplayFilterGreenColorCorrectionIntensity:");
}

NSString *__cdecl sub_3657C(id a1, double a2, double a3, double a4)
{
  float v4 = a2;
  return (NSString *)AXFormatFloatWithPercentage(0LL, v4, a3, a4);
}

void sub_3675C(uint64_t a1, void *a2)
{
  id v4 = a2;
  else {
    uint64_t v3 = 1LL;
  }
  [v4 setHidden:v3];
}

id sub_367B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v9 = AXTVLocString(@"AXColorFilterBlueAdjustTitle", a2, a3, a4, a5, a6, a7, a8, v26);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v18 = AXTVLocString(@"AXColorFilterBlueAdjustIntensityInstructions", v11, v12, v13, v14, v15, v16, v17, v27);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  double v20 = kMADisplayFilterPrefBlueColorIntensityMin;
  double v21 = kMADisplayFilterPrefBlueColorIntensityMax;
  [*(id *)(a1 + 32) displayFilterBlueColorCorrectionIntensity];
  double v23 = v22;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_368D0;
  v28[3] = &unk_65250;
  id v29 = *(id *)(a1 + 32);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[AXTVSliderViewController sliderWithTitle:subtitle:minimumValue:maximumValue:currentValue:discreteStepAmount:valueChangeHandler:valueFormatHandler:]( &OBJC_CLASS___AXTVSliderViewController,  "sliderWithTitle:subtitle:minimumValue:maximumValue:currentValue:discreteStepAmount:valueChangeHandle r:valueFormatHandler:",  v10,  v19,  v28,  &stru_66B90,  v20,  v21,  v23,  0.0));

  return v24;
}

id sub_368D0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDisplayFilterBlueColorCorrectionIntensity:");
}

NSString *__cdecl sub_368D8(id a1, double a2, double a3, double a4)
{
  float v4 = a2;
  return (NSString *)AXFormatFloatWithPercentage(0LL, v4, a3, a4);
}

void sub_36B70(uint64_t a1, void *a2)
{
  id v4 = a2;
  else {
    uint64_t v3 = 1LL;
  }
  [v4 setHidden:v3];
}

id sub_36BC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v9 = AXTVLocString(@"AXIntensityTitle", a2, a3, a4, a5, a6, a7, a8, v26);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v18 = AXTVLocString( @"AXColorFilterColorTintIntensityAdjustInstructions",  v11,  v12,  v13,  v14,  v15,  v16,  v17,  v27);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  double v20 = kMADisplayFilterPrefSingleColorIntensityMin;
  double v21 = kMADisplayFilterPrefSingleColorIntensityMax;
  [*(id *)(a1 + 32) displayFilterTintSingleColorIntensity];
  double v23 = v22;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_36CE4;
  v28[3] = &unk_65250;
  id v29 = *(id *)(a1 + 32);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[AXTVSliderViewController sliderWithTitle:subtitle:minimumValue:maximumValue:currentValue:discreteStepAmount:valueChangeHandler:valueFormatHandler:]( &OBJC_CLASS___AXTVSliderViewController,  "sliderWithTitle:subtitle:minimumValue:maximumValue:currentValue:discreteStepAmount:valueChangeHandle r:valueFormatHandler:",  v10,  v19,  v28,  &stru_66BB0,  v20,  v21,  v23,  0.0));

  return v24;
}

id sub_36CE4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDisplayFilterTintSingleColorIntensity:");
}

NSString *__cdecl sub_36CEC(id a1, double a2, double a3, double a4)
{
  float v4 = a2;
  return (NSString *)AXFormatFloatWithPercentage(0LL, v4, a3, a4);
}

id sub_36CF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v9 = AXTVLocString(@"AXColorHueTitle", a2, a3, a4, a5, a6, a7, a8, v24);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v18 = AXTVLocString(@"AXColorFilterColorTintHueAdjustInstructions", v11, v12, v13, v14, v15, v16, v17, v25);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  [*(id *)(a1 + 32) displayFilterTintSingleColorHue];
  double v21 = v20;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_36DF4;
  v26[3] = &unk_65250;
  id v27 = *(id *)(a1 + 32);
  double v22 = (void *)objc_claimAutoreleasedReturnValue( +[AXTVSliderViewController sliderWithTitle:subtitle:minimumValue:maximumValue:currentValue:discreteStepAmount:valueChangeHandler:valueFormatHandler:]( &OBJC_CLASS___AXTVSliderViewController,  "sliderWithTitle:subtitle:minimumValue:maximumValue:currentValue:discreteStepAmount:valueChangeHandle r:valueFormatHandler:",  v10,  v19,  v26,  &stru_66BD0,  0.0,  1.0,  v21,  0.0));

  return v22;
}

id sub_36DF4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDisplayFilterTintSingleColorHue:");
}

NSString *__cdecl sub_36DFC(id a1, double a2, double a3, double a4)
{
  return (NSString *)+[AXTVUtils colorNameForHue:saturation:]( &OBJC_CLASS___AXTVUtils,  "colorNameForHue:saturation:",  (a2 - a3) / (a4 - a3) * 360.0,  0.0);
}

id sub_37590(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleBrailleConfigurationChanged];
}

id sub_37614(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleBrailleConfigurationChanged];
}

void sub_37A9C(uint64_t a1, void *a2)
{
  id v3 = a2;
  float v4 = (void *)objc_claimAutoreleasedReturnValue([v3 source]);
  unsigned __int8 v5 = [v4 isEqualToString:SCATSwitchSourceMFI];

  if ((v5 & 1) == 0)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 remoteDeviceName]);
    id v7 = [v6 length];

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);
    if (v7)
    {
      double v20 = (void *)objc_claimAutoreleasedReturnValue([v3 remoteDeviceName]);
      id v16 = AXTVLocString(@"AXSwitchTitleFormatWithRemoteDevice", v9, v10, v11, v12, v13, v14, v15, (uint64_t)v8);
      uint64_t v17 = objc_claimAutoreleasedReturnValue(v16);

      uint64_t v8 = (void *)v17;
    }

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_37C00;
    v21[3] = &unk_66C30;
    char v22 = *(_BYTE *)(a1 + 40);
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v8,  0LL,  v3,  @"self",  v21));
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[AXTVUtils switchControlSwitchValueFormatter]( &OBJC_CLASS___AXTVUtils,  "switchControlSwitchValueFormatter"));
    [v18 setLocalizedValueFormatter:v19];

    [*(id *)(a1 + 32) addObject:v18];
  }
}

id sub_37C00(uint64_t a1, void *a2)
{
  if (*(_BYTE *)(a1 + 32))
  {
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a2 representedObject]);
    uint64_t v3 = objc_claimAutoreleasedReturnValue( +[AXTVSwitchControlSwitchVariantsViewController controllerWithSwitch:]( &OBJC_CLASS___AXTVSwitchControlSwitchVariantsViewController,  "controllerWithSwitch:",  v2));
  }

  else
  {
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a2 representedObject]);
    uint64_t v3 = objc_claimAutoreleasedReturnValue( +[AXTVSwitchControlSwitchDetailsViewController controllerWithSwitch:variant:]( &OBJC_CLASS___AXTVSwitchControlSwitchDetailsViewController,  "controllerWithSwitch:variant:",  v2,  0LL));
  }

  float v4 = (void *)v3;

  return v4;
}

void sub_3816C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
}

void sub_381A4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) representedObject]);
  [WeakRetained _removeSwitch:v2];
}

void sub_387C8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

TSKSettingItem *__cdecl sub_38808(id a1, TSKListSettingGroup *a2, AXTVBluetoothDevice *a3)
{
  uint64_t v3 = a3;
  float v4 = (void *)objc_claimAutoreleasedReturnValue(-[AXTVBluetoothDevice name](v3, "name"));
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v4,  0LL,  v3,  @"state",  &stru_66CD0));

  id v6 = -[AXTVBluetoothDevice type](v3, "type");
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[AXTVBluetoothFacade deviceStatusFormatterForDeviceType:showConnectedState:]( &OBJC_CLASS___AXTVBluetoothFacade,  "deviceStatusFormatterForDeviceType:showConnectedState:",  v6,  1LL));
  [v5 setLocalizedValueFormatter:v7];
  [v5 setUpdateBlock:&stru_66CF0];

  return (TSKSettingItem *)v5;
}

UIViewController *__cdecl sub_388C8(id a1, TSKSettingItem *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = objc_alloc_init(&OBJC_CLASS___AXTVBrailleBluetoothItemViewController);
  float v4 = (void *)objc_claimAutoreleasedReturnValue(-[TSKSettingItem localizedTitle](v2, "localizedTitle"));
  -[AXTVBrailleBluetoothItemViewController setTitle:](v3, "setTitle:", v4);

  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[TSKSettingItem representedObject](v2, "representedObject"));
  -[AXTVBrailleBluetoothItemViewController setBluetoothDevice:](v3, "setBluetoothDevice:", v5);

  return (UIViewController *)v3;
}

void sub_3894C(id a1, TSKSettingItem *a2, id a3)
{
  uint64_t v3 = a2;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TSKSettingItem representedObject](v3, "representedObject"));
  float v4 = (void *)objc_claimAutoreleasedReturnValue([v5 name]);
  -[TSKSettingItem setLocalizedTitle:](v3, "setLocalizedTitle:", v4);
}

id sub_389A4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v5,  0LL,  v4,  @"state",  WeakRetained,  "_connectDevice:"));

  [v7 setUpdateBlock:&stru_66D10];
  return v7;
}

void sub_38A40(id a1, TSKSettingItem *a2, id a3)
{
  id v4 = a3;
  id v5 = a2;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[TSKSettingItem representedObject](v5, "representedObject"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v8 name]);
  -[TSKSettingItem setHidden:](v5, "setHidden:", [v6 length] == 0);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v8 name]);
  -[TSKSettingItem setLocalizedTitle:](v5, "setLocalizedTitle:", v7);

  -[TSKSettingItem setLocalizedValue:](v5, "setLocalizedValue:", 0LL);
  LODWORD(v7) = [v4 integerValue] == (char *)&dword_0 + 1;

  -[TSKSettingItem setAccessoryTypes:](v5, "setAccessoryTypes:", 4LL * v7);
}

void sub_391F4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_39708(_Unwind_Exception *a1)
{
}

void sub_3973C(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXTVBluetoothManager sharedInstance](&OBJC_CLASS___AXTVBluetoothManager, "sharedInstance"));
  [v2 unpairDevice:*(void *)(a1 + 32)];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setErrorAlert:0];
}

void sub_39798(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setErrorAlert:0];
}

void sub_39CD4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_39CF8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  WeakRetained[8] = 1;
}

void sub_3A434( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id *a18, uint64_t a19, id *location, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,id a58)
{
}

AXTVSpeechVoiceVariantsViewController *sub_3A4B8(uint64_t a1)
{
  uint64_t v2 = objc_alloc(&OBJC_CLASS___AXTVSpeechVoiceVariantsViewController);
  uint64_t v3 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained speechModelController]);
  id v6 = -[AXTVSpeechVoiceVariantsViewController initWithFootprint:speechModelController:]( v2,  "initWithFootprint:speechModelController:",  v3,  v5);

  return v6;
}

AXTVSpeechVoiceVariantsViewController *sub_3A528(uint64_t a1)
{
  uint64_t v2 = objc_alloc(&OBJC_CLASS___AXTVSpeechVoiceVariantsViewController);
  uint64_t v3 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained speechModelController]);
  id v6 = -[AXTVSpeechVoiceVariantsViewController initWithFootprint:speechModelController:]( v2,  "initWithFootprint:speechModelController:",  v3,  v5);

  return v6;
}

void sub_3AC60(id a1, TSKSettingItem *a2, id a3)
{
}

void sub_3AC6C(id a1, TSKSettingItem *a2, id a3)
{
}

void sub_3B7A4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, id location)
{
}

void sub_3B7F0(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v7 = a2;
  id v4 = [v3 state];
  if (*(_BYTE *)(a1 + 40)) {
    BOOL v5 = 0;
  }
  else {
    BOOL v5 = v4 == 0LL;
  }
  uint64_t v6 = !v5;
  [v7 setHidden:v6];
}

void sub_3B844(uint64_t a1, void *a2)
{
  id v6 = a2;
  unint64_t v3 = +[AXTVBluetoothFacade numberOfConnectedRemotes](&OBJC_CLASS___AXTVBluetoothFacade, "numberOfConnectedRemotes");
  if (*(_BYTE *)(a1 + 40)) {
    BOOL v4 = v3 > 1;
  }
  else {
    BOOL v4 = 1;
  }
  else {
    uint64_t v5 = 1LL;
  }
  [v6 setHidden:v5];
}

void sub_3B8B8(uint64_t a1, void *a2)
{
  id v6 = a2;
  unint64_t v3 = +[AXTVBluetoothFacade numberOfConnectedRemotes](&OBJC_CLASS___AXTVBluetoothFacade, "numberOfConnectedRemotes");
  if (*(_BYTE *)(a1 + 40)) {
    BOOL v4 = v3 > 1;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4) {
    id v5 = 0LL;
  }
  else {
    id v5 = [*(id *)(a1 + 32) isConnected];
  }
  [v6 setHidden:v5];
}

void sub_3B920(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained bluetoothDevice]);
  objc_msgSend(v3, "setHidden:", objc_msgSend(v4, "tvset_supportsIAP") ^ 1);
}

void sub_3B980(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (+[TVSDevice runningAnInternalBuild](&OBJC_CLASS___TVSDevice, "runningAnInternalBuild")
    && *(_BYTE *)(a1 + 40))
  {
    uint64_t v3 = [*(id *)(a1 + 32) isConnected] ^ 1;
  }

  else
  {
    uint64_t v3 = 1LL;
  }

  [v4 setHidden:v3];
}

void sub_3B9E4(id a1, TSKSettingItem *a2, id a3)
{
  -[TSKSettingItem setHidden:](a2, "setHidden:", a3 == 0LL);
}

void sub_3B9F4(id a1, TSKSettingItem *a2, id a3)
{
  -[TSKSettingItem setHidden:](a2, "setHidden:", a3 == 0LL);
}

void sub_3BA04(id a1, TSKSettingItem *a2, id a3)
{
  -[TSKSettingItem setHidden:](a2, "setHidden:", a3 == 0LL);
}

void sub_3BA14(id a1, TSKSettingItem *a2, id a3)
{
  id v4 = a2;
  id v7 = v4;
  if (a3)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TSKSettingItem representedObject](v4, "representedObject"));
    -[TSKSettingItem setHidden:](v7, "setHidden:", [v5 isConnected] ^ 1);

    id v6 = (TSKSettingItem *)v5;
  }

  else
  {
    -[TSKSettingItem setHidden:](v4, "setHidden:", 1LL);
    id v6 = v7;
  }
}

void sub_3BA80(id a1, TSKSettingItem *a2, id a3)
{
  id v6 = a2;
  unsigned __int8 v4 = +[TVSDevice runningAnInternalBuild](&OBJC_CLASS___TVSDevice, "runningAnInternalBuild");
  if (a3 && (v4 & 1) != 0)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TSKSettingItem representedObject](v6, "representedObject"));
    -[TSKSettingItem setHidden:](v6, "setHidden:", [v5 isConnected] ^ 1);
  }

  else
  {
    -[TSKSettingItem setHidden:](v6, "setHidden:", 1LL);
  }
}

void sub_3BAF8(id a1, TSKSettingItem *a2, id a3)
{
  unsigned __int8 v4 = a2;
  id v7 = v4;
  if (a3)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TSKSettingItem representedObject](v4, "representedObject"));
    -[TSKSettingItem setHidden:](v7, "setHidden:", [v5 isConnected] ^ 1);

    id v6 = (TSKSettingItem *)v5;
  }

  else
  {
    -[TSKSettingItem setHidden:](v4, "setHidden:", 1LL);
    id v6 = v7;
  }
}

void sub_3BB64(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  [v5 doubleValue];
  double v7 = v6 / 100.0;
  if (v7 > 1.0) {
    double v7 = 1.0;
  }
  id v8 = *(void **)(a1 + 32);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", fmax(v7, 0.0)));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 stringFromNumber:v9]);
  [v13 setLocalizedValue:v10];

  unint64_t v11 = (unint64_t)[v5 integerValue];
  if ((v11 & 0x8000000000000000LL) != 0)
  {
    [v13 setHidden:1];
  }

  else
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v13 representedObject]);
    objc_msgSend(v13, "setHidden:", objc_msgSend(v12, "isConnected") ^ 1);
  }
}

void sub_3BF34( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_3BF58(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  +[AXTVBluetoothFacade unpairDevice:](&OBJC_CLASS___AXTVBluetoothFacade, "unpairDevice:", WeakRetained);

  id v4 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) navigationController]);
  id v3 = [v4 popViewControllerAnimated:1];
}

uint64_t sub_3C0DC(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0 && _TVSLogInternalLogLevel >= 5)
  {
    uint64_t v3 = TVSSystemLog;
    pthread_main_np();
    pthread_self();
    return _TVSLogBase(v2, &_os_log_default, 1LL, 0LL, 5LL, v3, @"#T:[%@%p] #Notice #%@ : could not open URL %@ ");
  }

  return result;
}

UIViewController *__cdecl sub_3C478(id a1, TSKSettingItem *a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSKSettingItem representedObject](a2, "representedObject"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[AXTVSwitchControlSwitchDetailsViewController controllerWithSwitch:variant:]( &OBJC_CLASS___AXTVSwitchControlSwitchDetailsViewController,  "controllerWithSwitch:variant:",  v2,  0LL));

  return (UIViewController *)v3;
}

UIViewController *__cdecl sub_3C4C8(id a1, TSKSettingItem *a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSKSettingItem representedObject](a2, "representedObject"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[AXTVSwitchControlSwitchDetailsViewController controllerWithSwitch:variant:]( &OBJC_CLASS___AXTVSwitchControlSwitchDetailsViewController,  "controllerWithSwitch:variant:",  v2,  1LL));

  return (UIViewController *)v3;
}

void sub_3C590(id a1)
{
  os_log_t v1 = objc_alloc_init(&OBJC_CLASS___AXTVSettingsFacade);
  uint64_t v2 = (void *)qword_80630;
  qword_80630 = (uint64_t)v1;
}

void sub_3CC84(os_log_s *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 voiceOverBrailleLanguageRotorItems]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 debugDescription]);
  int v5 = 138412290;
  double v6 = v4;
  _os_log_debug_impl(&dword_0, a1, OS_LOG_TYPE_DEBUG, "Updated braille language rotor items: %@", (uint8_t *)&v5, 0xCu);
}

void sub_3CD48(void *a1, void *a2)
{
  unsigned int v3 = [a1 type];
  if (v3 > 0x2F) {
    goto LABEL_9;
  }
  uint64_t v4 = v3;
  if (((1LL << v3) & 0x8000009B0008LL) == 0) {
    goto LABEL_5;
  }
  uint64_t v5 = 3LL;
  while (1)
  {
    id v12 = [a2 type];
    sub_3173C( (uint64_t)v12,  v6,  @"device is of type %ld which is not the same a receiving object %ld",  v7,  v8,  v9,  v10,  v11,  v5);
    __break(1u);
LABEL_5:
    if (v4 == 24)
    {
      uint64_t v5 = 2LL;
    }

    else if (v4 == 26)
    {
      uint64_t v5 = 4LL;
    }

    else
    {
LABEL_9:
      uint64_t v5 = 0LL;
    }
  }

void sub_3CDD0()
{
}

void sub_3CDF8(void *a1, uint64_t a2)
{
  id v9 = [a1 type];
  sub_3173C( (uint64_t)v9,  v3,  @"device is of type %ld which is not the same a receiving object %ld",  v4,  v5,  v6,  v7,  v8,  a2);
  __break(1u);
}

void sub_3CE24()
{
}

void sub_3CE4C(uint64_t a1, os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( &dword_0,  a2,  OS_LOG_TYPE_ERROR,  "getEnhanceDialogueLevel SPI call failed: %@",  (uint8_t *)&v2,  0xCu);
}

id objc_msgSend__editingViewControllerWithSetting_overrideKey_overrideDescription_availableValues_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_editingViewControllerWithSetting:overrideKey:overrideDescription:availableValues:");
}

id objc_msgSend__handleDownloadProgressForVoiceId_progress_storageSize_requiredDiskSpace_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleDownloadProgressForVoiceId:progress:storageSize:requiredDiskSpace:");
}

id objc_msgSend_childPaneItemWithTitle_description_representedObject_keyPath_childControllerBlock_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:");
}

id objc_msgSend_childPaneItemWithTitle_description_representedObject_keyPath_childControllerClass_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:");
}

id objc_msgSend_initWithTitle_description_featureOnOffKey_featureDurationKey_featureDurationAdjustmentInstructions_minimumDuration_maximumDuration_discreteAdjustmentValue_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "initWithTitle:description:featureOnOffKey:featureDurationKey:featureDurationAdjustmentInstructions:minimumDur ation:maximumDuration:discreteAdjustmentValue:");
}

id objc_msgSend_multiValueItemWithTitle_description_representedObject_keyPath_availableValues_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "multiValueItemWithTitle:description:representedObject:keyPath:availableValues:");
}

id objc_msgSend_sliderWithTitle_subtitle_minimumValue_maximumValue_currentValue_discreteStepAmount_valueChangeHandler_valueFormatHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "sliderWithTitle:subtitle:minimumValue:maximumValue:currentValue:discreteStepAmount:valueChangeHandler:valueFormatHandler:");
}

id objc_msgSend_sliderWithTitle_subtitle_minimumValue_maximumValue_currentValue_leftDetailImage_rightDetailImage_discreteStepAmount_valueChangeHandler_valueFormatHandler_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "sliderWithTitle:subtitle:minimumValue:maximumValue:currentValue:leftDetailImage:rightDetailImage:discreteStep Amount:valueChangeHandler:valueFormatHandler:");
}

id objc_msgSend_toggleItemWithTitle_description_representedObject_keyPath_onTitle_offTitle_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:");
}

id objc_msgSend_tripleClickItemWithTitle_description_representedObject_keyPath_option_updateBlock_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tripleClickItemWithTitle:description:representedObject:keyPath:option:updateBlock:");
}

id objc_msgSend_zoomPreferredMaximumZoomScale(void *a1, const char *a2, ...)
{
  return [a1 zoomPreferredMaximumZoomScale];
}