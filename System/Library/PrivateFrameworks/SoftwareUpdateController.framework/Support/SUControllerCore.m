@interface SUControllerCore
+ (BOOL)activateLoadingPersisted;
+ (id)initWithAttachedClients:(id)a3 withConfig:(id)a4 withAutoInstallManager:(id)a5;
+ (id)scanPolicySummary:(id)a3;
+ (id)sharedControllerCore;
+ (id)sharedControllerCoreInitWithAttachedClients:(id)a3 initWithConfig:(id)a4 initWithAutoInstallManager:(id)a5;
+ (id)updatePolicySummary:(id)a3;
+ (void)activateScanManagerWithBaseUUID:(id)a3 rampingForeground:(BOOL)a4;
+ (void)autoScanTrigger;
+ (void)installUpdateForClient:(id)a3 forDescriptor:(id)a4;
+ (void)managerConfigForClient:(id)a3 completion:(id)a4;
+ (void)managerStateForClient:(id)a3 completion:(id)a4;
+ (void)managerStatusForClient:(id)a3 completion:(id)a4;
+ (void)modifyConfigForClient:(id)a3 alteringConfig:(id)a4 forChangeMask:(int64_t)a5 completion:(id)a6;
+ (void)purgeScanContentWithBaseUUID:(id)a3 rampingForeground:(BOOL)a4 completion:(id)a5;
+ (void)purgeUpdateForClient:(id)a3 forDescriptor:(id)a4 completion:(id)a5;
+ (void)scanForUpdatesForClient:(id)a3 withScanOptions:(id)a4;
+ (void)updateAcceptingTermsForClient:(id)a3 forDescriptor:(id)a4 usingSSOToken:(id)a5;
+ (void)useSSOTokenToPersonalizeForClient:(id)a3 forDescriptor:(id)a4 usingSSOToken:(id)a5;
+ (void)userDidAcceptTermsAndConditionsForClient:(id)a3 forDescriptor:(id)a4;
- (SUControllerConfig)coreConfig;
- (SUControllerCore)initWithAttachedClients:(id)a3 withConfig:(id)a4 withAutoInstallManager:(id)a5;
- (SUControllerPolicyEngine)policyEngine;
- (SUControllerScanManager)scanManager;
- (void)setCoreConfig:(id)a3;
@end

@implementation SUControllerCore

- (SUControllerCore)initWithAttachedClients:(id)a3 withConfig:(id)a4 withAutoInstallManager:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___SUControllerCore;
  v11 = -[SUControllerCore init](&v29, "init");
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 oslog]);

    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v31 = @"/var/mobile/Library/SoftwareUpdate/SUController.eventReport";
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "[CONTROLLER_CORE] event reporter StoringToPath:%@",  buf,  0xCu);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue( +[SUCoreEventReporter initSharedReporterStoringToPath:]( &OBJC_CLASS___SUCoreEventReporter,  "initSharedReporterStoringToPath:",  @"/var/mobile/Library/SoftwareUpdate/SUController.eventReport"));
    v15 = (SUControllerConfig *)[v9 copy];
    coreConfig = v11->_coreConfig;
    v11->_coreConfig = v15;

    v17 = -[SUControllerPolicyEngine initWithAttachedClients:withConfig:withAutoInstallManager:]( objc_alloc(&OBJC_CLASS___SUControllerPolicyEngine),  "initWithAttachedClients:withConfig:withAutoInstallManager:",  v8,  v9,  v10);
    policyEngine = v11->_policyEngine;
    v11->_policyEngine = v17;

    v19 = -[SUControllerScanManager initWithAttachedClients:withConfig:withPolicyEngine:]( objc_alloc(&OBJC_CLASS___SUControllerScanManager),  "initWithAttachedClients:withConfig:withPolicyEngine:",  v8,  v9,  v11->_policyEngine);
    scanManager = v11->_scanManager;
    v11->_scanManager = v19;

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue([v21 oslog]);

    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = @"DEFINED";
      v24 = v11->_policyEngine;
      if (v11->_coreConfig) {
        v25 = @"DEFINED";
      }
      else {
        v25 = @"NONE";
      }
      if (v11->_scanManager) {
        v26 = @"DEFINED";
      }
      else {
        v26 = @"NONE";
      }
      *(_DWORD *)buf = 138544130;
      if (v24) {
        v27 = @"DEFINED";
      }
      else {
        v27 = @"NONE";
      }
      v31 = v25;
      __int16 v32 = 2114;
      if (!v14) {
        v23 = @"NONE";
      }
      v33 = v26;
      __int16 v34 = 2114;
      v35 = v27;
      __int16 v36 = 2114;
      v37 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "[CONTROLLER_CORE] coreConfig:%{public}@, scanManager:%{public}@, policyEngine:%{public}@, sharedReporter:%{public}@",  buf,  0x2Au);
    }
  }

  return v11;
}

+ (id)initWithAttachedClients:(id)a3 withConfig:(id)a4 withAutoInstallManager:(id)a5
{
  return +[SUControllerCore sharedControllerCoreInitWithAttachedClients:initWithConfig:initWithAutoInstallManager:]( &OBJC_CLASS___SUControllerCore,  "sharedControllerCoreInitWithAttachedClients:initWithConfig:initWithAutoInstallManager:",  a3,  a4,  a5);
}

+ (id)sharedControllerCore
{
  return +[SUControllerCore sharedControllerCoreInitWithAttachedClients:initWithConfig:initWithAutoInstallManager:]( &OBJC_CLASS___SUControllerCore,  "sharedControllerCoreInitWithAttachedClients:initWithConfig:initWithAutoInstallManager:",  0LL,  0LL,  0LL);
}

+ (id)sharedControllerCoreInitWithAttachedClients:(id)a3 initWithConfig:(id)a4 initWithAutoInstallManager:(id)a5
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100006FE8;
  block[3] = &unk_100064860;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  uint64_t v7 = qword_100079610;
  id v8 = v16;
  id v9 = v15;
  id v10 = v14;
  if (v7 != -1) {
    dispatch_once(&qword_100079610, block);
  }
  id v11 = (id)qword_100079608;

  return v11;
}

+ (BOOL)activateLoadingPersisted
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerCore sharedControllerCore](&OBJC_CLASS___SUControllerCore, "sharedControllerCore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreDevice sharedDevice](&OBJC_CLASS___SUCoreDevice, "sharedDevice"));
  if (([v3 isBootedOSSecureInternal] & 1) == 0)
  {
LABEL_5:

    goto LABEL_6;
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue([v2 coreConfig]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 simulatorCommandsFile]);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreSimulate sharedSimulator](&OBJC_CLASS___SUCoreSimulate, "sharedSimulator"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v2 coreConfig]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 simulatorCommandsFile]);
    [v6 adoptAllEventAlterations:v8];

    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    v3 = (void *)objc_claimAutoreleasedReturnValue([v9 oslog]);

    if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v2 coreConfig]);
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 simulatorCommandsFile]);
      int v15 = 138543362;
      id v16 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v3,  OS_LOG_TYPE_DEFAULT,  "[CONTROLLER_CORE] {activateLoadingPersisted} adopted simulator command file:%{public}@",  (uint8_t *)&v15,  0xCu);
    }

    goto LABEL_5;
  }

+ (void)activateScanManagerWithBaseUUID:(id)a3 rampingForeground:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[SUControllerCore sharedControllerCore](&OBJC_CLASS___SUControllerCore, "sharedControllerCore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v7 scanManager]);
  [v6 activateWithBaseUUID:v5 rampingForeground:v4];
}

+ (void)autoScanTrigger
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[SUControllerCore sharedControllerCore](&OBJC_CLASS___SUControllerCore, "sharedControllerCore"));
  v2 = (void *)objc_claimAutoreleasedReturnValue([v3 scanManager]);
  [v2 autoScanTrigger];
}

+ (void)scanForUpdatesForClient:(id)a3 withScanOptions:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[SUControllerCore sharedControllerCore](&OBJC_CLASS___SUControllerCore, "sharedControllerCore"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v8 scanManager]);
  [v7 scanForUpdatesForClient:v6 withScanOptions:v5];
}

+ (void)updateAcceptingTermsForClient:(id)a3 forDescriptor:(id)a4 usingSSOToken:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v11 = (id)objc_claimAutoreleasedReturnValue(+[SUControllerCore sharedControllerCore](&OBJC_CLASS___SUControllerCore, "sharedControllerCore"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v11 scanManager]);
  [v10 updateAcceptingTermsForClient:v9 forDescriptor:v8 usingSSOToken:v7];
}

+ (void)purgeScanContentWithBaseUUID:(id)a3 rampingForeground:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerCore sharedControllerCore](&OBJC_CLASS___SUControllerCore, "sharedControllerCore"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 scanManager]);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100007508;
  v12[3] = &unk_100064888;
  id v13 = v7;
  id v11 = v7;
  [v10 purgeScanContentWithBaseUUID:v8 rampingForeground:v5 completion:v12];
}

+ (void)modifyConfigForClient:(id)a3 alteringConfig:(id)a4 forChangeMask:(int64_t)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = a4;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerCore sharedControllerCore](&OBJC_CLASS___SUControllerCore, "sharedControllerCore"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 coreConfig]);
  id v14 = [v13 copy];

  int v15 = (void *)objc_claimAutoreleasedReturnValue([v12 coreConfig]);
  [v15 modify:v11 usingMask:a5];

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v12 coreConfig]);
  id v17 = [v16 copy];

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreDevice sharedDevice](&OBJC_CLASS___SUCoreDevice, "sharedDevice"));
  unsigned int v19 = [v18 isBootedOSSecureInternal];

  if ((a5 & 0x200000) != 0 && v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreSimulate sharedSimulator](&OBJC_CLASS___SUCoreSimulate, "sharedSimulator"));
    [v20 clearAllEventAlterations];

    v21 = (void *)objc_claimAutoreleasedReturnValue([v17 simulatorCommandsFile]);
    if (v21)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreSimulate sharedSimulator](&OBJC_CLASS___SUCoreSimulate, "sharedSimulator"));
      v23 = (void *)objc_claimAutoreleasedReturnValue([v17 simulatorCommandsFile]);
      [v22 adoptAllEventAlterations:v23];

      v24 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue([v24 oslog]);

      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue([v17 simulatorCommandsFile]);
        *(_DWORD *)buf = 138543362;
        v42 = v26;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "[CONTROLLER_CORE] {modifyConfigForClient} adopted simulator command file:%{public}@",  buf,  0xCu);
      }
    }

    else
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue([v27 oslog]);

      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "[CONTROLLER_CORE] {modifyConfigForClient} cleared all simulator event alterations",  buf,  2u);
      }
    }
  }

  v28 = (void *)objc_claimAutoreleasedReturnValue([v12 scanManager]);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_100007934;
  v34[3] = &unk_100064900;
  id v35 = v12;
  id v36 = v9;
  id v37 = v17;
  id v38 = v14;
  id v39 = v10;
  int64_t v40 = a5;
  id v29 = v10;
  id v30 = v14;
  id v31 = v17;
  id v32 = v9;
  id v33 = v12;
  [v28 modifyConfigForClient:v32 alteringConfig:v31 forChangeMask:a5 completion:v34];
}

+ (void)managerStatusForClient:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerCore sharedControllerCore](&OBJC_CLASS___SUControllerCore, "sharedControllerCore"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 policyEngine]);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100007D28;
  v10[3] = &unk_100064950;
  id v11 = v5;
  id v9 = v5;
  [v8 managerStatusForClient:v6 completion:v10];
}

+ (void)managerStateForClient:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerCore sharedControllerCore](&OBJC_CLASS___SUControllerCore, "sharedControllerCore"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 policyEngine]);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100007F40;
  v10[3] = &unk_1000649A0;
  id v11 = v5;
  id v9 = v5;
  [v8 managerStateForClient:v6 completion:v10];
}

+ (void)managerConfigForClient:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerCore sharedControllerCore](&OBJC_CLASS___SUControllerCore, "sharedControllerCore"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 policyEngine]);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10000813C;
  v10[3] = &unk_1000649C8;
  id v11 = v5;
  id v9 = v5;
  [v8 managerConfigForClient:v6 completion:v10];
}

+ (void)installUpdateForClient:(id)a3 forDescriptor:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[SUControllerCore sharedControllerCore](&OBJC_CLASS___SUControllerCore, "sharedControllerCore"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v8 policyEngine]);
  [v7 installUpdateForClient:v6 forDescriptor:v5];
}

+ (void)userDidAcceptTermsAndConditionsForClient:(id)a3 forDescriptor:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[SUControllerCore sharedControllerCore](&OBJC_CLASS___SUControllerCore, "sharedControllerCore"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v8 policyEngine]);
  [v7 userDidAcceptTermsAndConditionsForClient:v6 forDescriptor:v5];
}

+ (void)useSSOTokenToPersonalizeForClient:(id)a3 forDescriptor:(id)a4 usingSSOToken:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v11 = (id)objc_claimAutoreleasedReturnValue(+[SUControllerCore sharedControllerCore](&OBJC_CLASS___SUControllerCore, "sharedControllerCore"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v11 policyEngine]);
  [v10 useSSOTokenToPersonalizeForClient:v9 forDescriptor:v8 usingSSOToken:v7];
}

+ (void)purgeUpdateForClient:(id)a3 forDescriptor:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[SUControllerCore sharedControllerCore](&OBJC_CLASS___SUControllerCore, "sharedControllerCore"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 policyEngine]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000084D8;
  v13[3] = &unk_100064A18;
  id v14 = v7;
  id v12 = v7;
  [v11 purgeUpdateForClient:v9 forDescriptor:v8 completion:v13];
}

+ (id)scanPolicySummary:(id)a3
{
  id v3 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 softwareUpdateScanPolicy]);
  unsigned int v5 = [v4 discretionary];

  if (v5) {
    id v6 = @"|discretionary";
  }
  else {
    id v6 = @"|non-discretionary";
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue([&stru_100066480 stringByAppendingString:v6]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 softwareUpdateScanPolicy]);
  unsigned int v9 = [v8 restrictToIncremental];

  if (v9)
  {
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v7 stringByAppendingString:@"|restrictIncr"]);

    id v7 = (void *)v10;
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v3 softwareUpdateScanPolicy]);
  unsigned int v12 = [v11 restrictToFull];

  if (v12)
  {
    uint64_t v13 = objc_claimAutoreleasedReturnValue([v7 stringByAppendingString:@"|restrictFull"]);

    id v7 = (void *)v13;
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v3 softwareUpdateScanPolicy]);
  unsigned int v15 = [v14 allowSameVersion];

  if (v15)
  {
    uint64_t v16 = objc_claimAutoreleasedReturnValue([v7 stringByAppendingString:@"|allowSame"]);

    id v7 = (void *)v16;
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v3 softwareUpdateScanPolicy]);
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 sessionId]);

  if (v18)
  {
    unsigned int v19 = objc_alloc(&OBJC_CLASS___NSString);
    v20 = (void *)objc_claimAutoreleasedReturnValue([v3 softwareUpdateScanPolicy]);
    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 sessionId]);
    v22 = -[NSString initWithFormat:](v19, "initWithFormat:", @"|sesionID=%@", v21);
    uint64_t v23 = objc_claimAutoreleasedReturnValue([v7 stringByAppendingString:v22]);

    id v7 = (void *)v23;
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue([v3 softwareUpdateScanPolicy]);
  v25 = (void *)objc_claimAutoreleasedReturnValue([v24 rampingScanType]);

  if (v25)
  {
    v26 = objc_alloc(&OBJC_CLASS___NSString);
    v27 = (void *)objc_claimAutoreleasedReturnValue([v3 softwareUpdateScanPolicy]);
    v28 = (void *)objc_claimAutoreleasedReturnValue([v27 rampingScanType]);
    id v29 = -[NSString initWithFormat:](v26, "initWithFormat:", @"|rampScan=%@", v28);
    uint64_t v30 = objc_claimAutoreleasedReturnValue([v7 stringByAppendingString:v29]);

    id v7 = (void *)v30;
  }

  if (([v7 isEqualToString:&stru_100066480] & 1) == 0)
  {
    uint64_t v31 = objc_claimAutoreleasedReturnValue([v7 stringByAppendingString:@"|"]);

    id v7 = (void *)v31;
  }

  return v7;
}

+ (id)updatePolicySummary:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 softwareUpdateDownloadPolicy]);
  unsigned int v4 = [v3 discretionary];

  if (v4) {
    unsigned int v5 = @"|discretionary";
  }
  else {
    unsigned int v5 = @"|non-discretionary";
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue([&stru_100066480 stringByAppendingString:v5]);
  if (([v6 isEqualToString:&stru_100066480] & 1) == 0)
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 stringByAppendingString:@"|"]);

    id v6 = (void *)v7;
  }

  return v6;
}

- (SUControllerConfig)coreConfig
{
  return self->_coreConfig;
}

- (void)setCoreConfig:(id)a3
{
}

- (SUControllerPolicyEngine)policyEngine
{
  return self->_policyEngine;
}

- (SUControllerScanManager)scanManager
{
  return self->_scanManager;
}

- (void).cxx_destruct
{
}

@end