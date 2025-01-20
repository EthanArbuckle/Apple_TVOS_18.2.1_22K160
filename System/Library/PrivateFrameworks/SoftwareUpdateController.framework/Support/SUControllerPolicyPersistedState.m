@interface SUControllerPolicyPersistedState
- (BOOL)fallenBackToSecondary;
- (BOOL)prepareWasStarted;
- (BOOL)scanRampingForeground;
- (BOOL)targetingApplied;
- (BOOL)termsAccepted;
- (BOOL)updateIsApplied;
- (BOOL)updateIsPrepared;
- (NSString)lastBuildVersion;
- (NSString)lastOSVersion;
- (NSString)scanBaseUUID;
- (NSString)targetBuildVersion;
- (NSString)targetOSVersion;
- (NSString)updateUUID;
- (SUControllerPolicyPersistedState)initWithPersisted:(id)a3;
- (SUCoreDescriptor)primaryDescriptor;
- (SUCoreDescriptor)secondaryDescriptor;
- (SUCorePersistedState)corePersisted;
- (id)description;
- (void)clearPersisted:(id)a3;
- (void)setFallenBackToSecondary:(BOOL)a3;
- (void)setLastBuildVersion:(id)a3;
- (void)setLastOSVersion:(id)a3;
- (void)setPrepareWasStarted:(BOOL)a3;
- (void)setPrimaryDescriptor:(id)a3;
- (void)setScanBaseUUID:(id)a3;
- (void)setScanRampingForeground:(BOOL)a3;
- (void)setSecondaryDescriptor:(id)a3;
- (void)setTargetBuildVersion:(id)a3;
- (void)setTargetOSVersion:(id)a3;
- (void)setTargetingApplied:(BOOL)a3;
- (void)setTermsAccepted:(BOOL)a3;
- (void)setUpdateIsApplied:(BOOL)a3;
- (void)setUpdateIsPrepared:(BOOL)a3;
- (void)setUpdateUUID:(id)a3;
@end

@implementation SUControllerPolicyPersistedState

- (SUControllerPolicyPersistedState)initWithPersisted:(id)a3
{
  id v5 = a3;
  v46.receiver = self;
  v46.super_class = (Class)&OBJC_CLASS___SUControllerPolicyPersistedState;
  v6 = -[SUControllerPolicyPersistedState init](&v46, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_corePersisted, a3);
    if (([v5 isPersistedStateLoaded] & 1) != 0
      || ([v5 loadPersistedState] & 1) != 0)
    {
      goto LABEL_7;
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 oslog]);

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10003D7D8(v9, v10, v11, v12, v13, v14, v15, v16);
    }

    [v5 removePersistedState];
    if ([v5 loadPersistedState])
    {
LABEL_7:
      uint64_t v17 = objc_claimAutoreleasedReturnValue([v5 stringForKey:@"LastOSVersion"]);
      lastOSVersion = v7->_lastOSVersion;
      v7->_lastOSVersion = (NSString *)v17;

      uint64_t v19 = objc_claimAutoreleasedReturnValue([v5 stringForKey:@"LastBuildVersion"]);
      lastBuildVersion = v7->_lastBuildVersion;
      v7->_lastBuildVersion = (NSString *)v19;

      uint64_t v21 = objc_claimAutoreleasedReturnValue([v5 stringForKey:@"TargetOSVersion"]);
      targetOSVersion = v7->_targetOSVersion;
      v7->_targetOSVersion = (NSString *)v21;

      uint64_t v23 = objc_claimAutoreleasedReturnValue([v5 stringForKey:@"TargetBuildVersion"]);
      targetBuildVersion = v7->_targetBuildVersion;
      v7->_targetBuildVersion = (NSString *)v23;

      uint64_t v25 = objc_claimAutoreleasedReturnValue([v5 stringForKey:@"ScanBaseUUID"]);
      scanBaseUUID = v7->_scanBaseUUID;
      v7->_scanBaseUUID = (NSString *)v25;

      v7->_scanRampingForeground = [v5 BOOLeanForKey:@"ScanRampingForeground"];
      uint64_t v27 = objc_claimAutoreleasedReturnValue([v5 stringForKey:@"UpdateUUID"]);
      updateUUID = v7->_updateUUID;
      v7->_updateUUID = (NSString *)v27;

      id v29 = [v5 secureCodedObjectForKey:@"PrimaryDescriptor" ofClass:objc_opt_class(SUCoreDescriptor)];
      uint64_t v30 = objc_claimAutoreleasedReturnValue(v29);
      primaryDescriptor = v7->_primaryDescriptor;
      v7->_primaryDescriptor = (SUCoreDescriptor *)v30;

      id v32 = [v5 secureCodedObjectForKey:@"SecondaryDescriptor" ofClass:objc_opt_class(SUCoreDescriptor)];
      uint64_t v33 = objc_claimAutoreleasedReturnValue(v32);
      secondaryDescriptor = v7->_secondaryDescriptor;
      v7->_secondaryDescriptor = (SUCoreDescriptor *)v33;

      v7->_termsAccepted = [v5 BOOLeanForKey:@"TermsAccepted"];
      v7->_fallenBackToSecondary = [v5 BOOLeanForKey:@"FallenBackToSecondary"];
      v7->_targetingApplied = [v5 BOOLeanForKey:@"TargetingApplied"];
      v7->_prepareWasStarted = [v5 BOOLeanForKey:@"PrepareWasStarted"];
      v7->_updateIsPrepared = [v5 BOOLeanForKey:@"UpdateIsPrepared"];
      v7->_updateIsApplied = [v5 BOOLeanForKey:@"UpdateIsApplied"];
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
      v36 = (os_log_s *)objc_claimAutoreleasedReturnValue([v35 oslog]);

      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v48 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "[POLICY_PERSISTED] successfully loaded persisted state: %{public}@",  buf,  0xCu);
      }
    }

    else
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
      v36 = (os_log_s *)objc_claimAutoreleasedReturnValue([v37 oslog]);

      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        sub_10003D7A8(v36, v38, v39, v40, v41, v42, v43, v44);
      }
    }
  }

  return v7;
}

- (void)clearPersisted:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 oslog]);

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138543362;
    id v17 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[POLICY_PERSISTED] clearing persisted state (%{public}@)",  (uint8_t *)&v16,  0xCu);
  }

  -[SUCorePersistedState removePersistedState](self->_corePersisted, "removePersistedState");
  if ((-[SUCorePersistedState loadPersistedState](self->_corePersisted, "loadPersistedState") & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger"));
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 oslog]);

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10003D808(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
}

- (void)setLastOSVersion:(id)a3
{
  id v4 = (NSString *)a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyPersistedState corePersisted](self, "corePersisted"));
  [v5 persistString:v4 forKey:@"LastOSVersion"];

  lastOSVersion = self->_lastOSVersion;
  self->_lastOSVersion = v4;
}

- (void)setLastBuildVersion:(id)a3
{
  id v4 = (NSString *)a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyPersistedState corePersisted](self, "corePersisted"));
  [v5 persistString:v4 forKey:@"LastBuildVersion"];

  lastBuildVersion = self->_lastBuildVersion;
  self->_lastBuildVersion = v4;
}

- (void)setTargetOSVersion:(id)a3
{
  id v4 = (NSString *)a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyPersistedState corePersisted](self, "corePersisted"));
  [v5 persistString:v4 forKey:@"TargetOSVersion"];

  targetOSVersion = self->_targetOSVersion;
  self->_targetOSVersion = v4;
}

- (void)setTargetBuildVersion:(id)a3
{
  id v4 = (NSString *)a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyPersistedState corePersisted](self, "corePersisted"));
  [v5 persistString:v4 forKey:@"TargetBuildVersion"];

  targetBuildVersion = self->_targetBuildVersion;
  self->_targetBuildVersion = v4;
}

- (void)setScanBaseUUID:(id)a3
{
  id v4 = (NSString *)a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyPersistedState corePersisted](self, "corePersisted"));
  [v5 persistString:v4 forKey:@"ScanBaseUUID"];

  scanBaseUUID = self->_scanBaseUUID;
  self->_scanBaseUUID = v4;
}

- (void)setScanRampingForeground:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyPersistedState corePersisted](self, "corePersisted"));
  [v5 persistBoolean:v3 forKey:@"ScanRampingForeground"];

  self->_scanRampingForeground = v3;
}

- (void)setUpdateUUID:(id)a3
{
  id v4 = (NSString *)a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyPersistedState corePersisted](self, "corePersisted"));
  [v5 persistString:v4 forKey:@"UpdateUUID"];

  updateUUID = self->_updateUUID;
  self->_updateUUID = v4;
}

- (void)setPrimaryDescriptor:(id)a3
{
  id v4 = (SUCoreDescriptor *)a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyPersistedState corePersisted](self, "corePersisted"));
  [v5 persistSecureCodedObject:v4 forKey:@"PrimaryDescriptor"];

  primaryDescriptor = self->_primaryDescriptor;
  self->_primaryDescriptor = v4;
}

- (void)setSecondaryDescriptor:(id)a3
{
  id v4 = (SUCoreDescriptor *)a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyPersistedState corePersisted](self, "corePersisted"));
  [v5 persistSecureCodedObject:v4 forKey:@"SecondaryDescriptor"];

  secondaryDescriptor = self->_secondaryDescriptor;
  self->_secondaryDescriptor = v4;
}

- (void)setTermsAccepted:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyPersistedState corePersisted](self, "corePersisted"));
  [v5 persistBoolean:v3 forKey:@"TermsAccepted"];

  self->_termsAccepted = v3;
}

- (void)setFallenBackToSecondary:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyPersistedState corePersisted](self, "corePersisted"));
  [v5 persistBoolean:v3 forKey:@"FallenBackToSecondary"];

  self->_fallenBackToSecondary = v3;
}

- (void)setTargetingApplied:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyPersistedState corePersisted](self, "corePersisted"));
  [v5 persistBoolean:v3 forKey:@"TargetingApplied"];

  self->_targetingApplied = v3;
}

- (void)setPrepareWasStarted:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyPersistedState corePersisted](self, "corePersisted"));
  [v5 persistBoolean:v3 forKey:@"PrepareWasStarted"];

  self->_prepareWasStarted = v3;
}

- (void)setUpdateIsPrepared:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyPersistedState corePersisted](self, "corePersisted"));
  [v5 persistBoolean:v3 forKey:@"UpdateIsPrepared"];

  self->_updateIsPrepared = v3;
}

- (void)setUpdateIsApplied:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SUControllerPolicyPersistedState corePersisted](self, "corePersisted"));
  [v5 persistBoolean:v3 forKey:@"UpdateIsApplied"];

  self->_updateIsApplied = v3;
}

- (id)description
{
  lastOSVersion = self->_lastOSVersion;
  BOOL v3 = @"none";
  targetOSVersion = (const __CFString *)self->_targetOSVersion;
  if (!targetOSVersion) {
    targetOSVersion = @"none";
  }
  uint64_t v21 = targetOSVersion;
  lastBuildVersion = self->_lastBuildVersion;
  if (self->_targetBuildVersion) {
    targetBuildVersion = (const __CFString *)self->_targetBuildVersion;
  }
  else {
    targetBuildVersion = @"none";
  }
  v20 = targetBuildVersion;
  if (self->_scanBaseUUID) {
    scanBaseUUID = (const __CFString *)self->_scanBaseUUID;
  }
  else {
    scanBaseUUID = @"none";
  }
  if (self->_scanRampingForeground) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  if (self->_updateUUID) {
    updateUUID = (const __CFString *)self->_updateUUID;
  }
  else {
    updateUUID = @"none";
  }
  primaryDescriptor = self->_primaryDescriptor;
  if (primaryDescriptor) {
    BOOL v3 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SUCoreDescriptor summary](self->_primaryDescriptor, "summary"));
  }
  secondaryDescriptor = self->_secondaryDescriptor;
  if (secondaryDescriptor) {
    uint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue(-[SUCoreDescriptor summary](self->_secondaryDescriptor, "summary"));
  }
  else {
    uint64_t v11 = @"none";
  }
  if (self->_termsAccepted) {
    uint64_t v12 = @"YES";
  }
  else {
    uint64_t v12 = @"NO";
  }
  if (self->_fallenBackToSecondary) {
    uint64_t v13 = @"YES";
  }
  else {
    uint64_t v13 = @"NO";
  }
  if (self->_targetingApplied) {
    uint64_t v14 = @"YES";
  }
  else {
    uint64_t v14 = @"NO";
  }
  if (self->_prepareWasStarted) {
    uint64_t v15 = @"YES";
  }
  else {
    uint64_t v15 = @"NO";
  }
  if (self->_updateIsPrepared) {
    int v16 = @"YES";
  }
  else {
    int v16 = @"NO";
  }
  if (self->_updateIsApplied) {
    id v17 = @"YES";
  }
  else {
    id v17 = @"NO";
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"\n[>>>\n            lastOSVersion: %@\n         lastBuildVersion: %@\n          targetOSVersion: %@\n       targetBuildVersion: %@\n             scanBaseUUID: %@\n    scanRampingForeground: %@\n               updateUUID: %@\n        primaryDescriptor: %@\n      secondaryDescriptor: %@\n            termsAccepted: %@\n    fallenBackToSecondary: %@\n         targetingApplied: %@\n        prepareWasStarted: %@\n         updateIsPrepared: %@\n          updateIsApplied: %@\n<<<]",  lastOSVersion,  lastBuildVersion,  v21,  v20,  scanBaseUUID,  v7,  updateUUID,  v3,  v11,  v12,  v13,  v14,  v15,  v16,  v17));
  if (secondaryDescriptor) {

  }
  if (primaryDescriptor) {
  return v18;
  }
}

- (SUCorePersistedState)corePersisted
{
  return self->_corePersisted;
}

- (NSString)lastOSVersion
{
  return self->_lastOSVersion;
}

- (NSString)lastBuildVersion
{
  return self->_lastBuildVersion;
}

- (NSString)targetOSVersion
{
  return self->_targetOSVersion;
}

- (NSString)targetBuildVersion
{
  return self->_targetBuildVersion;
}

- (NSString)scanBaseUUID
{
  return self->_scanBaseUUID;
}

- (BOOL)scanRampingForeground
{
  return self->_scanRampingForeground;
}

- (NSString)updateUUID
{
  return self->_updateUUID;
}

- (SUCoreDescriptor)primaryDescriptor
{
  return self->_primaryDescriptor;
}

- (SUCoreDescriptor)secondaryDescriptor
{
  return self->_secondaryDescriptor;
}

- (BOOL)termsAccepted
{
  return self->_termsAccepted;
}

- (BOOL)fallenBackToSecondary
{
  return self->_fallenBackToSecondary;
}

- (BOOL)targetingApplied
{
  return self->_targetingApplied;
}

- (BOOL)prepareWasStarted
{
  return self->_prepareWasStarted;
}

- (BOOL)updateIsPrepared
{
  return self->_updateIsPrepared;
}

- (BOOL)updateIsApplied
{
  return self->_updateIsApplied;
}

- (void).cxx_destruct
{
}

@end