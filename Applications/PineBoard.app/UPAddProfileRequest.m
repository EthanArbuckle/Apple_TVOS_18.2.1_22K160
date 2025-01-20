@interface UPAddProfileRequest
+ (BOOL)_pb_sanitizeCreateUserProfileAttributes:(id)a3;
+ (id)pb_addProfileRequestWithCreateUserProfileAttributes:(id)a3 error:(id *)a4;
@end

@implementation UPAddProfileRequest

+ (id)pb_addProfileRequestWithCreateUserProfileAttributes:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (objc_msgSend(a1, "_pb_sanitizeCreateUserProfileAttributes:", v6))
  {
    v7 = objc_alloc_init(&OBJC_CLASS___UPAddProfileRequest);
    -[UPAddProfileRequest setPrimary:](v7, "setPrimary:", sub_1000909CC((uint64_t)[v6 type]));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 iCloudAltDSID]);
    -[UPAddProfileRequest setICloudAltDSID:](v7, "setICloudAltDSID:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 iTunesAltDSID]);
    -[UPAddProfileRequest setITunesAltDSID:](v7, "setITunesAltDSID:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 gameCenterAltDSID]);
    -[UPAddProfileRequest setGameCenterAltDSID:](v7, "setGameCenterAltDSID:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue([v6 personaUniqueString]);
    -[UPAddProfileRequest setPersonaUniqueIdentifier:](v7, "setPersonaUniqueIdentifier:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue([v6 preferredLanguages]);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSOrderedSet orderedSetWithArray:](&OBJC_CLASS___NSOrderedSet, "orderedSetWithArray:", v12));

    v14 = (void *)objc_claimAutoreleasedReturnValue([v6 preferredInputModes]);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSOrderedSet orderedSetWithArray:](&OBJC_CLASS___NSOrderedSet, "orderedSetWithArray:", v14));

    v16 = (void *)objc_claimAutoreleasedReturnValue([v6 overrideName]);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UPSetting customNameSettingWithName:](&OBJC_CLASS___UPSetting, "customNameSettingWithName:", v16));
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[UPSetting preferredLanguagesSettingWithLanguages:]( &OBJC_CLASS___UPSetting,  "preferredLanguagesSettingWithLanguages:",  v13,  v17));
    v26[1] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[UPSetting preferredInputModesSettingWithInputModes:]( &OBJC_CLASS___UPSetting,  "preferredInputModesSettingWithInputModes:",  v15));
    v26[2] = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v26, 3LL));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v20));

    -[UPAddProfileRequest setSettings:](v7, "setSettings:", v21);
  }

  else
  {
    id v22 = sub_100084680();
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_1002818B0(v6, v23);
    }

    if (a4)
    {
      uint64_t v24 = PBSUserProfileServiceErrorForCode(300LL);
      v7 = 0LL;
      *a4 = (id)objc_claimAutoreleasedReturnValue(v24);
    }

    else
    {
      v7 = 0LL;
    }
  }

  return v7;
}

+ (BOOL)_pb_sanitizeCreateUserProfileAttributes:(id)a3
{
  id v3 = a3;
  id v4 = sub_100084680();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v30 = 138412290;
    id v31 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Validating create user attributes {attributes=%@}",  (uint8_t *)&v30,  0xCu);
  }

  uint64_t v6 = objc_claimAutoreleasedReturnValue([v3 preferredLanguages]);
  if (v6)
  {
    v7 = (void *)v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue([v3 preferredInputModes]);

    if (!v8)
    {
      id v21 = objc_alloc(&OBJC_CLASS___TVCSPreferredLanguagesManager);
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v3 preferredLanguages]);
      id v13 = [v21 initWithLanguages:v22 inputModes:0 updateFromPreferences:0];

      v23 = (void *)objc_claimAutoreleasedReturnValue([v13 preferredInputModes]);
      id v24 = [v23 count];

      if (!v24)
      {
        id v29 = sub_100084680();
        v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_100281940(v3, v17);
        }
        BOOL v10 = 0;
        goto LABEL_16;
      }

      v25 = (void *)objc_claimAutoreleasedReturnValue([v13 preferredLanguages]);
      [v3 setPreferredLanguages:v25];

      v26 = (void *)objc_claimAutoreleasedReturnValue([v13 preferredInputModeList]);
      [v3 setPreferredInputModes:v26];

      id v27 = sub_100084680();
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
LABEL_15:
        BOOL v10 = 1;
LABEL_16:

        goto LABEL_17;
      }

      v18 = (void *)objc_claimAutoreleasedReturnValue([v3 preferredLanguages]);
      v19 = (void *)objc_claimAutoreleasedReturnValue([v3 preferredInputModes]);
      int v30 = 138543618;
      id v31 = v18;
      __int16 v32 = 2114;
      v33 = v19;
      v20 = "Calculated new input modes from language list {inputModes=%{public}@, languages=%{public}@}";
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v30, 0x16u);

      goto LABEL_15;
    }
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue([v3 preferredLanguages]);

  if (!v9)
  {
    id v11 = sub_100084680();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10027DC0C(v12);
    }

    id v13 = (id)objc_claimAutoreleasedReturnValue( +[TVCSPreferredLanguagesManager sharedInstance]( &OBJC_CLASS___TVCSPreferredLanguagesManager,  "sharedInstance"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 preferredLanguages]);
    [v3 setPreferredLanguages:v14];

    v15 = (void *)objc_claimAutoreleasedReturnValue([v13 preferredInputModeList]);
    [v3 setPreferredInputModes:v15];

    id v16 = sub_100084680();
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue([v3 preferredLanguages]);
    v19 = (void *)objc_claimAutoreleasedReturnValue([v3 preferredInputModes]);
    int v30 = 138543618;
    id v31 = v18;
    __int16 v32 = 2114;
    v33 = v19;
    v20 = "Default input modes and languages {inputModes=%{public}@, languages=%{public}@}";
    goto LABEL_14;
  }

  BOOL v10 = 1;
LABEL_17:

  return v10;
}

@end