@interface TCCDReminderMonitor
+ (double)positiveDoubleValueAtPreferenceKey:(id)a3 withFallback:(double)a4;
- (TCCDReminderMonitor)init;
- (double)lastReminderTime;
- (double)serviceCooldown;
- (double)systemCooldown;
- (id)reportResourceUsage:(id)a3;
- (void)setLastReminderTime:(double)a3;
- (void)setReminderCooldownPeriod:(int64_t)a3 with:(int64_t)a4;
- (void)setServiceCooldown:(double)a3;
- (void)setSystemCooldown:(double)a3;
- (void)showReminderPrompt:(id)a3 result:(id)a4;
@end

@implementation TCCDReminderMonitor

- (TCCDReminderMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TCCDReminderMonitor;
  v2 = -[TCCDReminderMonitor init](&v6, "init");
  if (v2)
  {
    v2->_lastReminderTime = CFAbsoluteTimeGetCurrent();
    +[TCCDReminderMonitor positiveDoubleValueAtPreferenceKey:withFallback:]( &OBJC_CLASS___TCCDReminderMonitor,  "positiveDoubleValueAtPreferenceKey:withFallback:",  @"reminderSystemCooldown",  604800.0);
    v2->_systemCooldown = v3;
    +[TCCDReminderMonitor positiveDoubleValueAtPreferenceKey:withFallback:]( &OBJC_CLASS___TCCDReminderMonitor,  "positiveDoubleValueAtPreferenceKey:withFallback:",  @"reminderServiceCooldown",  15552000.0);
    v2->_serviceCooldown = v4;
  }

  return v2;
}

+ (double)positiveDoubleValueAtPreferenceKey:(id)a3 withFallback:(double)a4
{
  v5 = (__CFString *)a3;
  double valuePtr = 0.0;
  double v6 = 0.0;
  if (os_variant_allows_internal_security_policies("com.apple.tcc"))
  {
    CFPropertyListRef v7 = CFPreferencesCopyValue(v5, @"com.apple.tccd", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
    if (v7)
    {
      v8 = v7;
      CFTypeID TypeID = CFNumberGetTypeID();
      if (TypeID == CFGetTypeID(v8) && !CFNumberGetValue((CFNumberRef)v8, kCFNumberDoubleType, &valuePtr)) {
        double valuePtr = 0.0;
      }
      CFRelease(v8);
      double v6 = valuePtr;
    }
  }

  if (v6 > 0.0) {
    a4 = v6;
  }

  return a4;
}

- (id)reportResourceUsage:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 subjectIdentity]);
  v39 = (void *)objc_claimAutoreleasedReturnValue([v4 attributionChain]);
  v73[0] = 0LL;
  v73[1] = v73;
  v73[2] = 0x3032000000LL;
  v73[3] = sub_1000118EC;
  v73[4] = sub_1000118FC;
  id v74 = 0LL;
  v72[0] = 0LL;
  v72[1] = v72;
  v72[2] = 0x2020000000LL;
  uint64_t v68 = 0LL;
  v69 = &v68;
  uint64_t v70 = 0x2020000000LL;
  char v71 = 0;
  uint64_t v64 = 0LL;
  v65 = &v64;
  uint64_t v66 = 0x2020000000LL;
  int v67 = 0;
  uint64_t v60 = 0LL;
  v61 = &v60;
  uint64_t v62 = 0x2020000000LL;
  int v63 = 0;
  uint64_t v56 = 0LL;
  v57 = &v56;
  uint64_t v58 = 0x2020000000LL;
  int v59 = 1;
  uint64_t v52 = 0LL;
  v53 = (double *)&v52;
  uint64_t v54 = 0x2020000000LL;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472LL;
  v49[2] = sub_100011904;
  v49[3] = &unk_100064CD8;
  id v6 = v5;
  id v50 = v6;
  id v51 = v4;
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472LL;
  v40[2] = sub_100011A38;
  v40[3] = &unk_100065218;
  v43 = v72;
  v44 = &v64;
  v45 = &v60;
  v46 = &v56;
  v47 = &v52;
  v48 = &v68;
  v42 = v73;
  CFPropertyListRef v7 = self;
  v40[4] = self;
  id v8 = v51;
  id v41 = v8;
  if (db_eval( (uint64_t)"SELECT client, client_type, last_reminded, last_modified, flags, auth_version FROM acces s WHERE auth_value = ? and client = ? and service = ? and (auth_reason = ? or auth_reason = ?)",  v49,  v40))
  {
    id v9 = tcc_access_log();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue([v8 service]);
      sub_100012198((uint64_t)v39, v11, buf, v10);
    }

    v12 = 0LL;
  }

  else
  {
    if (&_TMIsAutomaticTimeEnabled && *((_BYTE *)v69 + 24) && !TMIsAutomaticTimeEnabled())
    {
      id v13 = tcc_access_log();
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v76 = "-[TCCDReminderMonitor reportResourceUsage:]";
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s: automatic time is disabled, not surfacing reminder prompt",  buf,  0xCu);
      }

      *((_BYTE *)v69 + 24) = 0;
    }

    id v15 = tcc_access_log();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = *((unsigned __int8 *)v69 + 24);
      *(_DWORD *)buf = 136315394;
      v76 = "-[TCCDReminderMonitor reportResourceUsage:]";
      __int16 v77 = 1024;
      LODWORD(v78) = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s: shouldRemind: %d", buf, 0x12u);
    }

    if (*((_BYTE *)v69 + 24))
    {
      v18 = v7;
      objc_sync_enter(v18);
      double v19 = v53[3];
      double v20 = v18[3];
      [v18 systemCooldown];
      BOOL v22 = v19 - v20 <= v21;
      if (v19 - v20 <= v21)
      {
        id v23 = tcc_access_log();
        v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          v25 = (const char *)*((void *)v53 + 3);
          uint64_t v26 = *((void *)v18 + 3);
          [v18 systemCooldown];
          double v27 = v53[3] - v18[3];
          *(_DWORD *)buf = 134218752;
          v76 = v25;
          __int16 v77 = 2048;
          uint64_t v78 = v26;
          __int16 v79 = 2048;
          uint64_t v80 = v28;
          __int16 v81 = 2048;
          double v82 = v27;
          _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "reminder cooldown not expired: now %f, last_reminded %f, cooldown interval %f, elapsed %f",  buf,  0x2Au);
        }
      }

      else
      {
        id v29 = tcc_access_log();
        v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          v32 = (const char *)*((void *)v53 + 3);
          uint64_t v33 = *((void *)v18 + 3);
          [v18 systemCooldown];
          double v34 = v53[3] - v18[3];
          *(_DWORD *)buf = 134218752;
          v76 = v32;
          __int16 v77 = 2048;
          uint64_t v78 = v33;
          __int16 v79 = 2048;
          uint64_t v80 = v35;
          __int16 v81 = 2048;
          double v82 = v34;
          _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "reminder cooldown expired: now %f, last_reminded %f, cooldown interval %f, elapsed: %f",  buf,  0x2Au);
        }

        v18[3] = v53[3];
      }

      objc_sync_exit(v18);
    }

    else
    {
      BOOL v22 = 1;
    }

    v12 = objc_opt_new(&OBJC_CLASS___TCCDRequestResult);
    -[TCCDRequestResult setPreviousAuthorization:](v12, "setPreviousAuthorization:", 2LL);
    -[TCCDRequestResult setDatabaseFlags:](v12, "setDatabaseFlags:", *((unsigned int *)v61 + 6));
    -[TCCDRequestResult setAuthorizationVersion:](v12, "setAuthorizationVersion:", *((int *)v57 + 6));
    -[TCCDRequestResult setLastReminderTime:](v12, "setLastReminderTime:", *((unsigned int *)v65 + 6));
    -[TCCDRequestResult setPromptType:](v12, "setPromptType:", 3LL);
    if (*((_BYTE *)v69 + 24)) {
      char v36 = v22;
    }
    else {
      char v36 = 1;
    }
    if ((v36 & 1) == 0)
    {
      -[TCCDReminderMonitor showReminderPrompt:result:](v7, "showReminderPrompt:result:", v8, v12);
      -[TCCDRequestResult setLastReminderTime:](v12, "setLastReminderTime:", (int)v53[3]);
    }

    id v37 = tcc_access_log();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v76 = "-[TCCDReminderMonitor reportResourceUsage:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }
  }

  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v60, 8);
  _Block_object_dispose(&v64, 8);
  _Block_object_dispose(&v68, 8);
  _Block_object_dispose(v72, 8);
  _Block_object_dispose(v73, 8);

  return v12;
}

- (void)showReminderPrompt:(id)a3 result:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  CFPropertyListRef v7 = (void *)objc_claimAutoreleasedReturnValue([v5 service]);
  id v8 = objc_alloc(&OBJC_CLASS___TCCDAccessIdentity);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 attributionChain]);
  v10 = -[TCCDAccessIdentity initWithAttributionChain:preferMostSpecificIdentifier:]( v8,  "initWithAttributionChain:preferMostSpecificIdentifier:",  v9,  [v7 hasParanoidSecurityPolicy]);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDAccessIdentity displayName](v10, "displayName"));
  if (v11)
  {
    id v27 = v6;
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 reminderTitleTextLocalizationKey]);
    if (!v12) {
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 requestTitleTextLocalizationKey]);
    }
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 reminderLimitedButtonTitleTextLocalizationKey]);
    if (!v13) {
      id v13 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v7,  "buttonTitleLocalizationKeyForAuthorization:desiredAuth:",  objc_msgSend(v7, "downgradeAuthRight"),  2));
    }
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v7 localizedTextWithKey:v13]);
    id v14 = [v7 downgradeAuthRight];
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v7 reminderAllowButtonTitleTextLocalizationKey]);
    if (!v15) {
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v7 allowAuthorizationButtonTitleLocalizationKey]);
    }
    v25 = (void *)objc_claimAutoreleasedReturnValue([v7 localizedTextWithKey:v15]);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v7 localizedTextWithKey:v12]);
    if (!v16)
    {
      id v23 = tcc_access_log();
      int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v29 = (const char *)v7;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Could not find localized string for service: %@",  buf,  0xCu);
      }

      goto LABEL_20;
    }

    int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:]( &OBJC_CLASS___NSString,  "stringWithValidatedFormat:validFormatSpecifiers:error:",  v16,  @"%@",  0LL,  v11));
    if (v17)
    {
      [v5 setReminderPrompt:1];
      [v5 presentSynchronousPromptWithHeader:v17 message:0 aButtonTitle:v25 aButtonAuth:v14 bButtonTitle:v26 bButtonAuth:2 currentAuth:2 updatingResult:v27];
      id v18 = tcc_access_log();
      double v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        id v29 = "-[TCCDReminderMonitor showReminderPrompt:result:]";
        double v20 = "%s";
LABEL_18:
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 0xCu);
      }
    }

    else
    {
      id v24 = tcc_access_log();
      double v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v29 = (const char *)v7;
        double v20 = "Could not find localized request string for service: %@";
        goto LABEL_18;
      }
    }

LABEL_20:
    id v6 = v27;
    goto LABEL_21;
  }

  id v21 = tcc_access_log();
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v22 = (char *)objc_claimAutoreleasedReturnValue(-[TCCDAccessIdentity identifier](v10, "identifier"));
    *(_DWORD *)buf = 138412546;
    id v29 = v22;
    __int16 v30 = 2112;
    v31 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "reminder prompt: cannot find display name: %@ service: %@",  buf,  0x16u);
  }

- (void)setReminderCooldownPeriod:(int64_t)a3 with:(int64_t)a4
{
  if (a4 | a3)
  {
    if (a3 >= 1 && a4 >= 1)
    {
      -[TCCDReminderMonitor setSystemCooldown:](self, "setSystemCooldown:", (double)a3);
      -[TCCDReminderMonitor setServiceCooldown:](self, "setServiceCooldown:", (double)a4);
    }
  }

  else
  {
    -[TCCDReminderMonitor setSystemCooldown:](self, "setSystemCooldown:", 604800.0);
    -[TCCDReminderMonitor setServiceCooldown:](self, "setServiceCooldown:", 15552000.0);
  }

- (double)systemCooldown
{
  return self->_systemCooldown;
}

- (void)setSystemCooldown:(double)a3
{
  self->_systemCooldown = a3;
}

- (double)serviceCooldown
{
  return self->_serviceCooldown;
}

- (void)setServiceCooldown:(double)a3
{
  self->_serviceCooldown = a3;
}

- (double)lastReminderTime
{
  return self->_lastReminderTime;
}

- (void)setLastReminderTime:(double)a3
{
  self->_lastReminderTime = a3;
}

@end