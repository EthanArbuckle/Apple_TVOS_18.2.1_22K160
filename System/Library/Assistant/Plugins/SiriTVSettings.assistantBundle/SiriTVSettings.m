LABEL_10:
  v13 = (void *)objc_claimAutoreleasedReturnValue( -[SiriTVSettingsSetSiriAuthorizationForApp _successResponseForValue:previousValue:]( self,  "_successResponseForValue:previousValue:",  v7,  v6));
LABEL_11:
  v14 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    v15 = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SiriTVSettingsSetSiriAuthorizationForApp bundleId](self, "bundleId"));
    if (v9) {
      v17 = @"Dry Run";
    }
    else {
      v17 = @"Set";
    }
    if (v6) {
      v18 = @"ON";
    }
    else {
      v18 = @"OFF";
    }
    if ((_DWORD)v7) {
      v19 = @"ON";
    }
    else {
      v19 = @"OFF";
    }
    v20 = (objc_class *)objc_opt_class(self);
    v21 = NSStringFromClass(v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v24 = 136316674;
    v25 = "-[SiriTVSettingsSetSiriAuthorizationForApp performWithCompletion:]";
    v26 = 2080;
    v27 = "-[SiriTVSettingsSetSiriAuthorizationForApp performWithCompletion:]";
    v28 = 2112;
    v29 = v16;
    v30 = 2112;
    v31 = v17;
    v32 = 2112;
    v33 = v18;
    v34 = 2112;
    v35 = v19;
    v36 = 2112;
    v37 = v22;
    _os_log_impl( &dword_0,  v15,  OS_LOG_TYPE_DEFAULT,  "%s %s: %@ (%@ / prev: %@ / value: %@ / %@)",  (uint8_t *)&v24,  0x48u);
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue([v13 dictionary]);
  v4[2](v4, v23);
}

void sub_1DFC(uint64_t a1, uint64_t a2)
{
  id v11 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) appearance]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _getSystemServiceProxy]);
  [v4 setSystemAppearance:SiriTVSettingsPBSSystemAppearanceForAppearance(v11)];

  if ([*(id *)(a1 + 32) requiresResponse])
  {
    v5 = (void *)objc_opt_new(&OBJC_CLASS___SASettingSetAppearanceResponse);
    v6 = (void *)objc_opt_new(&OBJC_CLASS___SASettingAppearanceEntity);
    id v7 = SiriTVSettingsAppearanceForPBSSystemAppearance(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    [v6 setPreviousValue:v8];

    [v6 setValue:v11];
    [v5 setSetting:v6];
    uint64_t v9 = *(void *)(a1 + 40);
    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue([v5 dictionary]);
      (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
    }
  }
}
}

void sub_21EC(uint64_t a1, uint64_t a2)
{
  id v9 = (id)objc_opt_new(&OBJC_CLASS___SASettingAppearanceEntity);
  id v4 = SiriTVSettingsAppearanceForPBSSystemAppearance(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  [v9 setValue:v5];
  [v9 setPreviousValue:v5];
  v6 = (void *)objc_opt_new(&OBJC_CLASS___SASettingGetAppearanceResponse);
  [v6 setSetting:v9];
  uint64_t v7 = *(void *)(a1 + 32);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 dictionary]);
  (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
}

id SiriTVSettingsAppearanceForPBSSystemAppearance(uint64_t a1)
{
  if (qword_9278 != -1) {
    dispatch_once(&qword_9278, &stru_4280);
  }
  v2 = (void *)qword_9270;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a1));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:v3]);
  v5 = v4;
  if (!v4) {
    id v4 = (void *)SASettingAppearanceLightValue;
  }
  id v6 = v4;

  return v6;
}

void sub_247C(id a1)
{
  v3[0] = &off_4410;
  v3[1] = &off_4428;
  v4[0] = SASettingAppearanceDarkValue;
  v4[1] = SASettingAppearanceLightValue;
  v3[2] = &off_4440;
  v4[2] = SASettingAppearanceLightValue;
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  3LL));
  v2 = (void *)qword_9270;
  qword_9270 = v1;
}

id SiriTVSettingsPBSSystemAppearanceForAppearance(void *a1)
{
  id v1 = a1;
  if (qword_9288 != -1) {
    dispatch_once(&qword_9288, &stru_42A0);
  }
  v2 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_9280 objectForKeyedSubscript:v1]);
  v3 = v2;
  if (v2) {
    id v4 = [v2 integerValue];
  }
  else {
    id v4 = &dword_0 + 2;
  }

  return v4;
}

void sub_25B8(id a1)
{
  v3[0] = SASettingAppearanceDarkValue;
  v3[1] = SASettingAppearanceLightValue;
  v4[0] = &off_4410;
  v4[1] = &off_4428;
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  2LL));
  v2 = (void *)qword_9280;
  qword_9280 = v1;
}

void sub_2A6C(uint64_t a1, double a2)
{
  id v8 = (id)objc_opt_new(&OBJC_CLASS___SATimerGetCompleted);
  id v4 = (void *)objc_opt_new(&OBJC_CLASS___SATimerObject);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a2));
  [v4 setTimerValue:v5];

  [v4 setState:SATimerStateRunningValue];
  [v8 setTimer:v4];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v8 dictionary]);
  (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}