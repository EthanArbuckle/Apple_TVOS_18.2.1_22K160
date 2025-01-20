@interface MTChaperoneParser
- (BOOL)isKeybagRollingNeeded;
- (MTChaperoneParser)init;
- (id)_allCommands;
- (id)_applyRedemptionCode:(id)a3;
- (id)_clearPasscode:(id)a3;
- (id)_managedApplicationList:(id)a3;
- (id)_profileList:(id)a3;
- (id)_removeApplication:(id)a3;
- (id)_removeProfile:(id)a3;
- (id)_requestUnlockToken:(id)a3;
- (unint64_t)_profileInstallationStyleForRequest:(id)a3;
- (void)_installApplication:(id)a3 completionBlock:(id)a4;
- (void)_processRequest:(id)a3 accessRights:(unint64_t)a4 assertion:(id)a5 completionBlock:(id)a6;
- (void)commandDefaultMDMOptionsCompletionBlock:(id)a3;
- (void)commandProceedWithKeybagMigrationRequest:(id)a3 completionBlock:(id)a4;
- (void)commandSetDefaultMDMOptionsRequest:(id)a3 completionBlock:(id)a4;
- (void)processRequest:(id)a3 assertion:(id)a4 completionBlock:(id)a5;
- (void)waitUntilKeybagRollingHasBeenPerformedCompletionBlock:(id)a3 timeRemaining:(double)a4;
@end

@implementation MTChaperoneParser

- (MTChaperoneParser)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MTChaperoneParser;
  v2 = -[MTChaperoneParser initWithManagingProfileIdentifier:](&v6, "initWithManagingProfileIdentifier:", 0LL);
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___MTIPCUTunnelParser);
    iPCUParser = v2->_iPCUParser;
    v2->_iPCUParser = v3;

    -[MTChaperoneParser setIsMDM:](v2, "setIsMDM:", 0LL);
  }

  return v2;
}

- (void)processRequest:(id)a3 assertion:(id)a4 completionBlock:(id)a5
{
}

- (void)_processRequest:(id)a3 accessRights:(unint64_t)a4 assertion:(id)a5 completionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:kMCTPRequestTypeKey]);
  uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v13, v14) & 1) == 0) {
    goto LABEL_8;
  }
  if (![v13 isEqualToString:@"DefaultMDMOptions"])
  {
    if ([v13 isEqualToString:@"SetDefaultMDMOptions"])
    {
      -[MTChaperoneParser commandSetDefaultMDMOptionsRequest:completionBlock:]( self,  "commandSetDefaultMDMOptionsRequest:completionBlock:",  v10,  v12);
      goto LABEL_9;
    }

    if ([v13 isEqualToString:@"ProceedWithKeybagMigration"])
    {
      -[MTChaperoneParser commandProceedWithKeybagMigrationRequest:completionBlock:]( self,  "commandProceedWithKeybagMigrationRequest:completionBlock:",  v10,  v12);
      goto LABEL_9;
    }

- (id)_allCommands
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100006B34;
  block[3] = &unk_100010780;
  block[4] = self;
  if (qword_100014BC0 != -1) {
    dispatch_once(&qword_100014BC0, block);
  }
  return (id)qword_100014BA8;
}

- (unint64_t)_profileInstallationStyleForRequest:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKey:kMCTPRequestTypeKey]);
  unint64_t v4 = [v3 isEqualToString:kMDMPRequestTypeInstallProfileSilent];

  return v4;
}

- (void)_installApplication:(id)a3 completionBlock:(id)a4
{
  id v4 = a4;
  if (v4)
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    objc_super v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100006F98;
    block[3] = &unk_100010838;
    id v8 = v4;
    dispatch_async(v6, block);
  }
}

- (id)_applyRedemptionCode:(id)a3
{
  return +[MTChaperoneParser responseWithStatus:]( &OBJC_CLASS___MTChaperoneParser,  "responseWithStatus:",  kMCTPStatusCommandFormatError);
}

- (id)_managedApplicationList:(id)a3
{
  return +[MTChaperoneParser responseWithStatus:]( &OBJC_CLASS___MTChaperoneParser,  "responseWithStatus:",  kMCTPStatusCommandFormatError);
}

- (id)_removeApplication:(id)a3
{
  return +[MTChaperoneParser responseWithStatus:]( &OBJC_CLASS___MTChaperoneParser,  "responseWithStatus:",  kMCTPStatusCommandFormatError);
}

- (id)_profileList:(id)a3
{
  return -[MTChaperoneParser _profileList:filterFlags:](self, "_profileList:filterFlags:", a3, 85LL);
}

- (id)_removeProfile:(id)a3
{
  uint64_t v4 = objc_claimAutoreleasedReturnValue([a3 objectForKey:kIdentifierKey]);
  v5 = (void *)v4;
  if (v4)
  {
    objc_super v6 = *(os_log_s **)DMCLogObjects(v4);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v13 = 138543362;
      uint64_t v14 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "Chaperone requested removal of profile “%{public}@”",  (uint8_t *)&v13,  0xCu);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue( +[MDMMCInterface profileIdentifiersWithFilterFlags:]( &OBJC_CLASS___MDMMCInterface,  "profileIdentifiersWithFilterFlags:",  69LL));
    id v8 = [v7 containsObject:v5];
    if ((v8 & 1) != 0)
    {
      uint64_t v9 = objc_claimAutoreleasedReturnValue( -[MTChaperoneParser _removeProfileWithIdentifier:installationType:]( self,  "_removeProfileWithIdentifier:installationType:",  v5,  0LL));
    }

    else
    {
      id v11 = *(os_log_s **)DMCLogObjects(v8);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v13) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Chaperone attempted to remove profile unavailable to Chaperone",  (uint8_t *)&v13,  2u);
      }

      uint64_t v9 = objc_claimAutoreleasedReturnValue(+[MDMParser responseWithStatus:](&OBJC_CLASS___MDMParser, "responseWithStatus:", kMCTPStatusAcknowledged));
    }

    id v10 = (void *)v9;
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[MDMParser responseWithStatus:]( &OBJC_CLASS___MDMParser,  "responseWithStatus:",  kMCTPStatusCommandFormatError));
  }

  return v10;
}

- (id)_requestUnlockToken:(id)a3
{
  if (+[MDMMCInterface isPasscodeSet](&OBJC_CLASS___MDMMCInterface, "isPasscodeSet", a3))
  {
    id v3 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  DMCKeybagErrorDomain,  37002LL,  0LL));
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTChaperoneParser responseWithError:](&OBJC_CLASS___MTChaperoneParser, "responseWithError:", v3));
  }

  else
  {
    id v8 = 0LL;
    uint64_t v5 = MDMKeybagCreateSupervisionEscrowWithPasscode(0LL, &v8);
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    id v3 = v8;
    if (v6)
    {
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[MTChaperoneParser responseWithStatus:]( &OBJC_CLASS___MTChaperoneParser,  "responseWithStatus:",  kMCTPStatusAcknowledged));
      [v4 setObject:v6 forKeyedSubscript:@"UnlockToken"];
    }

    else
    {
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTChaperoneParser responseWithError:](&OBJC_CLASS___MTChaperoneParser, "responseWithError:", v3));
    }
  }

  return v4;
}

- (id)_clearPasscode:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:kMDMPUnlockTokenKey]);
  id v14 = 0LL;
  uint64_t v4 = MDMKeybagRetrieveSupervisionEscrowSecret(&v14);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v14;
  v7 = v6;
  if (!v5)
  {
    id v9 = v6;
LABEL_6:
    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[MDMParser responseWithError:](&OBJC_CLASS___MDMParser, "responseWithError:", v7));
    goto LABEL_7;
  }

  id v13 = v6;
  unsigned __int8 v8 = +[MDMMCInterface clearPasscodeWithEscrowKeybagData:secret:outError:]( &OBJC_CLASS___MDMMCInterface,  "clearPasscodeWithEscrowKeybagData:secret:outError:",  v3,  v5,  &v13);
  id v9 = v13;

  if ((v8 & 1) == 0)
  {
    v7 = v9;
    goto LABEL_6;
  }

  uint64_t v10 = objc_claimAutoreleasedReturnValue(+[MDMParser responseWithStatus:](&OBJC_CLASS___MDMParser, "responseWithStatus:", kMCTPStatusAcknowledged));
LABEL_7:
  id v11 = (void *)v10;

  return v11;
}

- (void)commandDefaultMDMOptionsCompletionBlock:(id)a3
{
  uint64_t v5 = (void (**)(id, void *))a3;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[MTChaperoneParser responseWithStatus:]( &OBJC_CLASS___MTChaperoneParser,  "responseWithStatus:",  kMCTPStatusAcknowledged));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[MDMOptionsUtilities defaultMDMOptions](&OBJC_CLASS___MDMOptionsUtilities, "defaultMDMOptions"));
  if (v4) {
    [v3 setObject:v4 forKeyedSubscript:@"DefaultMDMOptions"];
  }
  if (v5) {
    v5[2](v5, v3);
  }
}

- (void)commandSetDefaultMDMOptionsRequest:(id)a3 completionBlock:(id)a4
{
  unsigned __int8 v8 = (void (**)(id, void *))a4;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"DefaultMDMOptions"]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[MDMOptionsUtilities validatedMDMOptionsFromOptionsDictionary:]( &OBJC_CLASS___MDMOptionsUtilities,  "validatedMDMOptionsFromOptionsDictionary:",  v5));
  +[MDMOptionsUtilities setDefaultMDMOptions:](&OBJC_CLASS___MDMOptionsUtilities, "setDefaultMDMOptions:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[MTChaperoneParser responseWithStatus:]( &OBJC_CLASS___MTChaperoneParser,  "responseWithStatus:",  kMCTPStatusAcknowledged));
  if (v8) {
    v8[2](v8, v7);
  }
}

- (BOOL)isKeybagRollingNeeded
{
  if (qword_100014BD0 != -1) {
    dispatch_once(&qword_100014BD0, &stru_100010858);
  }
  CFProperty = (void *)IORegistryEntryCreateCFProperty(dword_100014BCC, @"enable-rolld-dev1", 0LL, 0);
  id v3 = *(os_log_s **)DMCLogObjects();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v5[0] = 67109120;
    v5[1] = CFProperty != 0LL;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Is keybag rolling needed: %d", (uint8_t *)v5, 8u);
  }

  return CFProperty != 0LL;
}

- (void)waitUntilKeybagRollingHasBeenPerformedCompletionBlock:(id)a3 timeRemaining:(double)a4
{
  id v6 = a3;
  uint64_t SystemGeneration = MKBKeyBagGetSystemGeneration(&v39);
  int v8 = SystemGeneration;
  id v9 = *(os_log_s **)DMCLogObjects(SystemGeneration);
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Could not get keybag system generation number.",  buf,  2u);
    }

    if (v6)
    {
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
      id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100007C7C;
      block[3] = &unk_100010838;
      id v28 = v6;
      dispatch_async(v11, block);

      id v12 = v28;
LABEL_26:
    }
  }

  else
  {
    BOOL v13 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
    if (v13)
    {
      *(_DWORD *)buf = 67109120;
      int v41 = v39;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Keybag system generation status: %d", buf, 8u);
    }

    if (!v39 || (v39 & 5) != 0)
    {
      id v19 = *(os_log_s **)DMCLogObjects(v13);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEBUG,  "Keybag system generation is sufficient to proceed.",  buf,  2u);
      }

      if (v6)
      {
        dispatch_queue_global_t v20 = dispatch_get_global_queue(0LL, 0LL);
        v21 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v20);
        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472LL;
        v37[2] = sub_100007B24;
        v37[3] = &unk_100010838;
        id v38 = v6;
        dispatch_async(v21, v37);

        id v12 = v38;
        goto LABEL_26;
      }
    }

    else
    {
      BOOL v14 = -[MTChaperoneParser isKeybagRollingNeeded](self, "isKeybagRollingNeeded");
      if (!v14)
      {
        v22 = *(os_log_s **)DMCLogObjects(v14);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "Keybag rolling is not needed.", buf, 2u);
        }

        dispatch_queue_global_t v23 = dispatch_get_global_queue(0LL, 0LL);
        v24 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v23);
        v35[0] = _NSConcreteStackBlock;
        v35[1] = 3221225472LL;
        v35[2] = sub_100007B7C;
        v35[3] = &unk_100010838;
        id v36 = v6;
        dispatch_async(v24, v35);

        id v12 = v36;
        goto LABEL_26;
      }

      objc_super v15 = *(os_log_s **)DMCLogObjects(v14);
      if (a4 > 0.0)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Polling keybag status...", buf, 2u);
        }

        dispatch_time_t v16 = dispatch_time(0LL, 200000000LL);
        dispatch_queue_global_t v17 = dispatch_get_global_queue(0LL, 0LL);
        id v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v17);
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472LL;
        v31[2] = sub_100007BE8;
        v31[3] = &unk_100010880;
        v31[4] = self;
        id v32 = v6;
        double v33 = a4;
        uint64_t v34 = 0x3FC999999999999ALL;
        dispatch_after(v16, v18, v31);

        id v12 = v32;
        goto LABEL_26;
      }

      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Timed out waiting for keybag migration.",  buf,  2u);
      }

      if (v6)
      {
        dispatch_queue_global_t v25 = dispatch_get_global_queue(0LL, 0LL);
        v26 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v25);
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472LL;
        v29[2] = sub_100007BFC;
        v29[3] = &unk_100010838;
        id v30 = v6;
        dispatch_async(v26, v29);

        id v12 = v30;
        goto LABEL_26;
      }
    }
  }
}

- (void)commandProceedWithKeybagMigrationRequest:(id)a3 completionBlock:(id)a4
{
  uint64_t v5 = (const __CFString *)kMDMKeybagMigrationHasBeenClearedByHostKey;
  id v6 = (const __CFString *)kMDMNotBackedUpPreferencesDomain;
  v7 = (const __CFString *)kMDMPreferencesMobileUserName;
  id v9 = a4;
  CFPreferencesSetValue(v5, kCFBooleanTrue, v6, v7, kCFPreferencesAnyHost);
  uint64_t v8 = CFPreferencesSynchronize(v6, v7, kCFPreferencesAnyHost);
  MDMSendTriggerRollKeybagsNotification(v8);
  -[MTChaperoneParser waitUntilKeybagRollingHasBeenPerformedCompletionBlock:timeRemaining:]( self,  "waitUntilKeybagRollingHasBeenPerformedCompletionBlock:timeRemaining:",  v9,  300.0);
}

- (void).cxx_destruct
{
}

@end