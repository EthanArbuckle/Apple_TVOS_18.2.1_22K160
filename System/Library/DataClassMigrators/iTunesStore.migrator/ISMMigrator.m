@interface ISMMigrator
+ (BOOL)_copyAccountPropertiesIfNeededFromAccount:(id)a3 toAccount:(id)a4;
+ (id)_firstActiveAccountInAccounts:(id)a3;
+ (id)_logConfig;
+ (void)_cleanupBrokenAccounts:(BOOL)a3 emptyAccounts:(BOOL)a4;
+ (void)_cleanupDuplicateAccounts;
+ (void)_cleanupMultipleActiveAccountsWithPreferredActiveAccount:(id)a3;
+ (void)_mergeDuplicateAccounts:(id)a3 inStore:(id)a4;
+ (void)_repairAccounts;
+ (void)_repairAccountsWithStringDSID;
+ (void)_repairBrokenAccounts;
- (BOOL)_isMajorVersionUpdate;
- (BOOL)_migrateAccountsToAccountsFramework;
- (BOOL)performMigration;
- (id)dataClassName;
- (void)_cleanupAutomaticDownloadKindsOfActiveAccount:(id)a3;
- (void)_cleanupFollowUps;
- (void)_encryptAccountFlags;
- (void)_migrateAutomaticDownloadKindsDefaultToActiveAccount:(id)a3 store:(id)a4;
- (void)_migrateSandboxAccounts;
- (void)_migrateServerPromptDefaultsToActiveAccount:(id)a3 store:(id)a4;
- (void)_postPushToken;
- (void)_removePasswordEquivalentTokensFromAccounts;
@end

@implementation ISMMigrator

- (id)dataClassName
{
  return @"iTunes Store";
}

- (BOOL)performMigration
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[SSLogConfig sharedAccountsMigrationConfig]( &OBJC_CLASS___SSLogConfig,  "sharedAccountsMigrationConfig"));
  if (!v3) {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v4 = [v3 shouldLog];
  else {
    unsigned int v5 = v4;
  }
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 OSLogObject]);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = v5 & 2;
  }
  if ((_DWORD)v7)
  {
    id v8 = (id)objc_opt_class(self);
    unsigned int v9 = -[ISMMigrator didMigrateBackupFromDifferentDevice](self, "didMigrateBackupFromDifferentDevice");
    unsigned int v10 = -[ISMMigrator didRestoreFromBackup](self, "didRestoreFromBackup");
    unsigned int v11 = -[ISMMigrator didRestoreFromCloudBackup](self, "didRestoreFromCloudBackup");
    unsigned int v12 = -[ISMMigrator didUpgrade](self, "didUpgrade");
    *(_DWORD *)buf = 138544386;
    uint64_t v211 = (uint64_t)v8;
    __int16 v212 = 1024;
    *(_DWORD *)v213 = v9;
    *(_WORD *)&v213[4] = 1024;
    *(_DWORD *)&v213[6] = v10;
    LOWORD(v214) = 1024;
    *(_DWORD *)((char *)&v214 + 2) = v11;
    HIWORD(v214) = 1024;
    unsigned int v215 = v12;
    v13 = (void *)_os_log_send_and_compose_impl( v7,  0LL,  0LL,  0LL,  &dword_0,  v6,  0LL,  "%{public}@: didMigrateBackupFromDifferentDevice = %d | didRestoreFromBackup = %d | didRestoreFromClo udBackup = %d | didUpgrade = %d",  buf,  36);

    if (!v13) {
      goto LABEL_13;
    }
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v13,  4LL));
    free(v13);
    v190 = v6;
    SSFileLog(v3, @"%@");
  }

LABEL_13:
  CFPreferencesAppSynchronize(@"com.apple.AppleMediaServices");
  v14 = (const __CFString *)kITunesStoreDaemonDefaultsID;
  CFPreferencesAppSynchronize(kITunesStoreDaemonDefaultsID);
  if (!-[ISMMigrator didUpgrade](self, "didUpgrade"))
  {
    id v76 = [(id)objc_opt_class(self) _logConfig];
    v77 = (void *)objc_claimAutoreleasedReturnValue(v76);
    if (!v77) {
      v77 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v78 = objc_msgSend(v77, "shouldLog", v190);
    v79 = (os_log_s *)objc_claimAutoreleasedReturnValue([v77 OSLogObject]);
    if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v80 = v78;
    }
    else {
      uint64_t v80 = v78 & 2;
    }
    if ((_DWORD)v80)
    {
      id v81 = (id)objc_opt_class(self);
      *(_DWORD *)buf = 138543362;
      uint64_t v211 = (uint64_t)v81;
      LODWORD(v201) = 12;
      v82 = (void *)_os_log_send_and_compose_impl( v80,  0LL,  0LL,  0LL,  &dword_0,  v79,  0LL,  "[%{public}@] - Biometrics: Not an OS upgrade, setting AMS biometric state to ENABLED",  buf,  v201);

      if (!v82) {
        goto LABEL_105;
      }
      v79 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v82,  4LL));
      free(v82);
      v195 = v79;
      SSFileLog(v77, @"%@");
    }

LABEL_105:
    CFPreferencesSetAppValue(@"AMSDeviceBiometricsState", &off_10A80, @"com.apple.AppleMediaServices");
    CFPreferencesAppSynchronize(@"com.apple.AppleMediaServices");
    id v83 = [(id)objc_opt_class(self) _logConfig];
    v84 = (void *)objc_claimAutoreleasedReturnValue(v83);
    if (!v84) {
      v84 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v85 = objc_msgSend(v84, "shouldLog", v195);
    v86 = (os_log_s *)objc_claimAutoreleasedReturnValue([v84 OSLogObject]);
    if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v87 = v85;
    }
    else {
      uint64_t v87 = v85 & 2;
    }
    if ((_DWORD)v87)
    {
      id v88 = (id)objc_opt_class(self);
      *(_DWORD *)buf = 138543362;
      uint64_t v211 = (uint64_t)v88;
      LODWORD(v201) = 12;
      v89 = (void *)_os_log_send_and_compose_impl( v87,  0LL,  0LL,  0LL,  &dword_0,  v86,  0LL,  "[%{public}@] - Biometrics: Not an OS upgrade, setting Legacy biometric state to ENABLED",  buf,  v201);

      if (!v89) {
        goto LABEL_116;
      }
      v86 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v89,  4LL));
      free(v89);
      v196 = v86;
      SSFileLog(v84, @"%@");
    }

LABEL_116:
    CFPreferencesSetAppValue(@"BiometricState", &off_10A98, v14);
    id v90 = [(id)objc_opt_class(self) _logConfig];
    v91 = (void *)objc_claimAutoreleasedReturnValue(v90);
    if (!v91) {
      v91 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v92 = objc_msgSend(v91, "shouldLog", v196);
    v93 = (os_log_s *)objc_claimAutoreleasedReturnValue([v91 OSLogObject]);
    if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v94 = v92;
    }
    else {
      uint64_t v94 = v92 & 2;
    }
    if ((_DWORD)v94)
    {
      id v95 = (id)objc_opt_class(self);
      *(_DWORD *)buf = 138543362;
      uint64_t v211 = (uint64_t)v95;
      LODWORD(v201) = 12;
      v96 = (void *)_os_log_send_and_compose_impl( v94,  0LL,  0LL,  0LL,  &dword_0,  v93,  0LL,  "[%{public}@] - Biometrics: Not an OS upgrade, setting Legacy biometric state enabled to ENABLED",  buf,  v201);

      if (!v96)
      {
LABEL_127:

        v97 = @"BiometricStateEnabled";
        v98 = &off_10A98;
LABEL_128:
        CFPreferencesSetAppValue(v97, v98, v14);
        v75 = v14;
        goto LABEL_129;
      }

      v93 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v96,  4LL));
      free(v96);
      v194 = v93;
      SSFileLog(v91, @"%@");
    }

    goto LABEL_127;
  }

  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue( @"AMSDeviceBiometricsState",  @"com.apple.AppleMediaServices",  0LL);
  id v16 = [(id)objc_opt_class(self) _logConfig];
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  if (!v17) {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v18 = objc_msgSend(v17, "shouldLog", v190);
  else {
    unsigned int v19 = v18;
  }
  v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 OSLogObject]);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v21 = v19;
  }
  else {
    uint64_t v21 = v19 & 2;
  }
  if ((_DWORD)v21)
  {
    id v22 = (id)objc_opt_class(self);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", AppIntegerValue));
    *(_DWORD *)buf = 138543618;
    uint64_t v211 = (uint64_t)v22;
    __int16 v212 = 2112;
    *(void *)v213 = v23;
    LODWORD(v201) = 22;
    v24 = (void *)_os_log_send_and_compose_impl( v21,  0LL,  0LL,  0LL,  &dword_0,  v20,  0LL,  "[%{public}@] - Biometrics: Found AMS biometric state: %@",  buf,  v201);

    if (!v24) {
      goto LABEL_26;
    }
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v24,  4LL));
    free(v24);
    v191 = v20;
    SSFileLog(v17, @"%@");
  }

LABEL_26:
  CFIndex v25 = CFPreferencesGetAppIntegerValue(@"BiometricState", v14, 0LL);
  id v26 = [(id)objc_opt_class(self) _logConfig];
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  if (!v27) {
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v28 = objc_msgSend(v27, "shouldLog", v191);
  else {
    unsigned int v29 = v28;
  }
  v30 = (os_log_s *)objc_claimAutoreleasedReturnValue([v27 OSLogObject]);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v31 = v29;
  }
  else {
    uint64_t v31 = v29 & 2;
  }
  if ((_DWORD)v31)
  {
    id v32 = (id)objc_opt_class(self);
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", v25));
    *(_DWORD *)buf = 138543618;
    uint64_t v211 = (uint64_t)v32;
    __int16 v212 = 2112;
    *(void *)v213 = v33;
    LODWORD(v201) = 22;
    v34 = (void *)_os_log_send_and_compose_impl( v31,  0LL,  0LL,  0LL,  &dword_0,  v30,  0LL,  "[%{public}@] - Biometrics: Found Legacy biometric state: %@",  buf,  v201);

    if (!v34) {
      goto LABEL_38;
    }
    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v34,  4LL));
    free(v34);
    v192 = v30;
    SSFileLog(v27, @"%@");
  }

LABEL_38:
  CFIndex v35 = CFPreferencesGetAppIntegerValue(@"BiometricStateDidMigrate", v14, 0LL);
  id v36 = [(id)objc_opt_class(self) _logConfig];
  v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
  if (!v37) {
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v38 = objc_msgSend(v37, "shouldLog", v192);
  else {
    unsigned int v39 = v38;
  }
  v40 = (os_log_s *)objc_claimAutoreleasedReturnValue([v37 OSLogObject]);
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v41 = v39;
  }
  else {
    uint64_t v41 = v39 & 2;
  }
  if ((_DWORD)v41)
  {
    id v42 = (id)objc_opt_class(self);
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v35 != 0));
    *(_DWORD *)buf = 138543618;
    uint64_t v211 = (uint64_t)v42;
    __int16 v212 = 2112;
    *(void *)v213 = v43;
    LODWORD(v201) = 22;
    v44 = (void *)_os_log_send_and_compose_impl( v41,  0LL,  0LL,  0LL,  &dword_0,  v40,  0LL,  "[%{public}@] - Biometrics: Did migrate to AMS: %@",  buf,  v201);

    if (!v44) {
      goto LABEL_50;
    }
    v40 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v44,  4LL));
    free(v44);
    v193 = v40;
    SSFileLog(v37, @"%@");
  }

LABEL_50:
  BOOL v45 = -[ISMMigrator _isMajorVersionUpdate](self, "_isMajorVersionUpdate");
  id v46 = [(id)objc_opt_class(self) _logConfig];
  v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
  if (!v47) {
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v48 = objc_msgSend(v47, "shouldLog", v193);
  v49 = (os_log_s *)objc_claimAutoreleasedReturnValue([v47 OSLogObject]);
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v50 = v48;
  }
  else {
    uint64_t v50 = v48 & 2;
  }
  if ((_DWORD)v50)
  {
    id v51 = (id)objc_opt_class(self);
    uint64_t v52 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v45));
    v202 = self;
    v53 = v14;
    BOOL v54 = v45;
    BOOL v45 = v35;
    CFIndex v55 = v25;
    CFIndex v56 = AppIntegerValue;
    v57 = (void *)v52;
    *(_DWORD *)buf = 138543618;
    uint64_t v211 = (uint64_t)v51;
    __int16 v212 = 2114;
    *(void *)v213 = v52;
    LODWORD(v201) = 22;
    v58 = (void *)_os_log_send_and_compose_impl( v50,  0LL,  0LL,  0LL,  &dword_0,  v49,  0LL,  "[%{public}@] - Biometrics: OS upgrade, is major version update? %{public}@",  buf,  v201);

    CFIndex AppIntegerValue = v56;
    CFIndex v25 = v55;
    CFIndex v35 = v45;
    LODWORD(v45) = v54;
    v14 = v53;
    self = v202;

    if (!v58) {
      goto LABEL_61;
    }
    v49 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v58,  4LL));
    free(v58);
    v194 = v49;
    SSFileLog(v47, @"%@");
  }

LABEL_61:
  if (v25 == 1 && v45)
  {
    id v60 = [(id)objc_opt_class(self) _logConfig];
    v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
    if (!v61) {
      v61 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v62 = objc_msgSend(v61, "shouldLog", v194);
    v63 = (os_log_s *)objc_claimAutoreleasedReturnValue([v61 OSLogObject]);
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v64 = v62;
    }
    else {
      uint64_t v64 = v62 & 2;
    }
    if ((_DWORD)v64)
    {
      id v65 = (id)objc_opt_class(self);
      *(_DWORD *)buf = 138543362;
      uint64_t v211 = (uint64_t)v65;
      LODWORD(v201) = 12;
      v66 = (void *)_os_log_send_and_compose_impl( v64,  0LL,  0LL,  0LL,  &dword_0,  v63,  0LL,  "[%{public}@] - Biometrics: Major OS upgrade, setting Legacy biometric state to UNSET",  buf,  v201);

      if (!v66)
      {
LABEL_76:

        CFPreferencesSetAppValue(@"BiometricState", 0LL, v14);
        goto LABEL_77;
      }

      v63 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v66,  4LL));
      free(v66);
      v194 = v63;
      SSFileLog(v61, @"%@");
    }

    goto LABEL_76;
  }

+ (id)_logConfig
{
  if (qword_14520 != -1) {
    dispatch_once(&qword_14520, &stru_103B8);
  }
  return (id)qword_14518;
}

- (void)_cleanupFollowUps
{
  id v3 = [(id)objc_opt_class(self) _logConfig];
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (!v4) {
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v5 = [v4 shouldLog];
  else {
    LODWORD(v6) = v5;
  }
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 OSLogObject]);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v6 = v6;
  }
  else {
    v6 &= 2u;
  }
  if (!(_DWORD)v6) {
    goto LABEL_12;
  }
  int v10 = 138543362;
  id v11 = (id)objc_opt_class(self);
  id v8 = v11;
  unsigned int v9 = (void *)_os_log_send_and_compose_impl( v6,  0LL,  0LL,  0LL,  &dword_0,  v7,  0LL,  "%{public}@: Cleaning follow ups",  &v10,  12);

  if (v9)
  {
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v9,  4LL));
    free(v9);
    SSFileLog(v4, @"%@");
LABEL_12:
  }
}

- (void)_cleanupAutomaticDownloadKindsOfActiveAccount:(id)a3
{
  id v4 = a3;
  unsigned int v5 = -[ISMMigrator didMigrateBackupFromDifferentDevice](self, "didMigrateBackupFromDifferentDevice");
  id v6 = [(id)objc_opt_class(self) _logConfig];
  uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
  id v8 = (void *)v7;
  if (!v5)
  {
    if (!v7) {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v15 = [v8 shouldLog];
    else {
      LODWORD(v16) = v15;
    }
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 OSLogObject]);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v16 = v16;
    }
    else {
      v16 &= 2u;
    }
    if ((_DWORD)v16)
    {
      int v55 = 138543362;
      id v56 = (id)objc_opt_class(self);
      id v18 = v56;
      unsigned int v19 = (void *)_os_log_send_and_compose_impl( v16,  0LL,  0LL,  0LL,  &dword_0,  v17,  0LL,  "%{public}@: Checking to see if we need to enable automatic downloads for audiobooks.",  &v55,  12);

      if (!v19) {
        goto LABEL_27;
      }
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v19,  4LL));
      free(v19);
      v53 = v17;
      SSFileLog(v8, @"%@");
    }

LABEL_27:
    if (!v4)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue( +[SSLogConfig sharedAccountsMigrationConfig]( &OBJC_CLASS___SSLogConfig,  "sharedAccountsMigrationConfig"));
      if (!v14) {
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
      }
      unsigned int v36 = objc_msgSend(v14, "shouldLog", v53);
      else {
        LODWORD(v37) = v36;
      }
      unsigned int v29 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 OSLogObject]);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
        uint64_t v37 = v37;
      }
      else {
        v37 &= 2u;
      }
      if ((_DWORD)v37)
      {
        unsigned int v38 = (void *)objc_opt_class(self);
        int v55 = 138543362;
        id v56 = v38;
        id v39 = v38;
        LODWORD(v54) = 12;
        v40 = (void *)_os_log_send_and_compose_impl( v37,  0LL,  0LL,  0LL,  &dword_0,  v29,  0LL,  "%{public}@: There's no active account. Skipping enabling automatic downloads.",  &v55,  v54);

        if (!v40) {
          goto LABEL_79;
        }
        unsigned int v29 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v40,  4LL));
        free(v40);
        SSFileLog(v14, @"%@");
      }

      goto LABEL_78;
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue([v4 accountPropertyForKey:SSAccountPropertyAutomaticDownloadKinds]);
    id v21 = [v20 copy];
    uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSArray);
    uint64_t v23 = SSSafeCast(v21, v22);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v23);

    unsigned int v24 = [v14 containsObject:SSDownloadKindEBook];
    uint64_t v25 = SSDownloadKindAudiobook;
    if (!v24 || ([v14 containsObject:SSDownloadKindAudiobook] & 1) != 0)
    {
      unsigned int v26 = objc_msgSend(v14, "containsObject:", v25, v53);
      id v27 = [(id)objc_opt_class(self) _logConfig];
      uint64_t v28 = objc_claimAutoreleasedReturnValue(v27);
      unsigned int v29 = (os_log_s *)v28;
      if (v26)
      {
        if (!v28) {
          unsigned int v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
        }
        unsigned int v30 = -[os_log_s shouldLog](v29, "shouldLog");
        else {
          LODWORD(v31) = v30;
        }
        id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[os_log_s OSLogObject](v29, "OSLogObject"));
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
          uint64_t v31 = v31;
        }
        else {
          v31 &= 2u;
        }
        if (!(_DWORD)v31) {
          goto LABEL_77;
        }
        v33 = (void *)objc_opt_class(self);
        int v55 = 138543362;
        id v56 = v33;
        id v34 = v33;
        LODWORD(v54) = 12;
        uint64_t v35 = _os_log_send_and_compose_impl( v31,  0LL,  0LL,  0LL,  &dword_0,  v32,  0LL,  "%{public}@: Automatic downloads for audiobooks are already enabled.",  &v55,  v54);
      }

      else
      {
        if (!v28) {
          unsigned int v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
        }
        unsigned int v41 = -[os_log_s shouldLog](v29, "shouldLog");
        else {
          LODWORD(v42) = v41;
        }
        id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[os_log_s OSLogObject](v29, "OSLogObject"));
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
          uint64_t v42 = v42;
        }
        else {
          v42 &= 2u;
        }
        if (!(_DWORD)v42) {
          goto LABEL_77;
        }
        v43 = (void *)objc_opt_class(self);
        int v55 = 138543362;
        id v56 = v43;
        id v34 = v43;
        LODWORD(v54) = 12;
        uint64_t v35 = _os_log_send_and_compose_impl( v42,  0LL,  0LL,  0LL,  &dword_0,  v32,  0LL,  "%{public}@: Not enabling automatic downloads for audiobooks since it's not enabled for eBooks.",  &v55,  v54);
      }

      v44 = (void *)v35;

      if (v44)
      {
        id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v44,  4LL));
        free(v44);
        SSFileLog(v29, @"%@");
LABEL_77:
      }

- (void)_encryptAccountFlags
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[SSLogConfig sharedAccountsMigrationConfig]( &OBJC_CLASS___SSLogConfig,  "sharedAccountsMigrationConfig"));
  if (!v3) {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v4 = [v3 shouldLog];
  else {
    unsigned int v5 = v4;
  }
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 OSLogObject]);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = v5 & 2;
  }
  if ((_DWORD)v7)
  {
    int v71 = 138543362;
    id v72 = (id)objc_opt_class(self);
    id v8 = v72;
    unsigned int v9 = (void *)_os_log_send_and_compose_impl( v7,  0LL,  0LL,  0LL,  &dword_0,  v6,  0LL,  "%{public}@: Encrypting account flags if necessary.",  &v71,  12);

    if (!v9) {
      goto LABEL_13;
    }
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v9,  4LL));
    free(v9);
    v59 = v6;
    SSFileLog(v3, @"%@");
  }

LABEL_13:
  unsigned int v62 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "ams_iTunesAccounts"));
  uint64_t v64 = self;
  if ([v10 count])
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ams_mapWithTransform:", &stru_103F8));
    id v12 = [(id)objc_opt_class(self) _logConfig];
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    if (!v13) {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v14 = objc_msgSend(v13, "shouldLog", v59);
    else {
      LODWORD(v15) = v14;
    }
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 OSLogObject]);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v15 = v15;
    }
    else {
      v15 &= 2u;
    }
    if ((_DWORD)v15)
    {
      v17 = (void *)objc_opt_class(self);
      int v71 = 138543618;
      id v72 = v17;
      __int16 v73 = 2114;
      v74 = v11;
      id v18 = v17;
      LODWORD(v61) = 22;
      unsigned int v19 = (void *)_os_log_send_and_compose_impl( v15,  0LL,  0LL,  0LL,  &dword_0,  v16,  0LL,  "%{public}@: Encrypting account flags for accounts: %{public}@",  &v71,  v61);

      if (!v19)
      {
        self = v64;
        goto LABEL_38;
      }

      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v19,  4LL));
      free(v19);
      id v60 = (int *)v16;
      SSFileLog(v13, @"%@");
      self = v64;
    }
  }

  else
  {
    id v20 = [(id)objc_opt_class(self) _logConfig];
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v20);
    if (!v11) {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v21 = objc_msgSend(v11, "shouldLog", v59);
    else {
      LODWORD(v22) = v21;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue([v11 OSLogObject]);
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v22 = v22;
    }
    else {
      v22 &= 2u;
    }
    if ((_DWORD)v22)
    {
      uint64_t v23 = (void *)objc_opt_class(self);
      int v71 = 138543362;
      id v72 = v23;
      id v24 = v23;
      LODWORD(v61) = 12;
      uint64_t v25 = (void *)_os_log_send_and_compose_impl( v22,  0LL,  0LL,  0LL,  &dword_0,  v13,  0LL,  "%{public}@: No accounts to encrypt.",  &v71,  v61);

      if (!v25) {
        goto LABEL_39;
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v25,  4LL));
      free(v25);
      id v60 = (int *)v13;
      SSFileLog(v11, @"%@");
    }
  }

- (BOOL)_isMajorVersionUpdate
{
  id v62 = 0LL;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  @"\\d+",  0LL,  &v62));
  id v4 = v62;
  if (v4)
  {
    unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( +[SSLogConfig sharedAccountsMigrationConfig]( &OBJC_CLASS___SSLogConfig,  "sharedAccountsMigrationConfig"));
    if (!v5) {
      unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v6 = [v5 shouldLog];
    else {
      LODWORD(v7) = v6;
    }
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 OSLogObject]);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v7 = v7;
    }
    else {
      v7 &= 2u;
    }
    if ((_DWORD)v7)
    {
      unsigned int v9 = (void *)objc_opt_class(self);
      int v63 = 138543618;
      uint64_t v64 = v9;
      __int16 v65 = 2114;
      id v66 = v4;
      id v10 = v9;
      id v11 = (void *)_os_log_send_and_compose_impl( v7,  0LL,  0LL,  0LL,  &dword_0,  v8,  0LL,  "%{public}@: Error configuration regular expression parser: %{public}@",  &v63,  22);

      if (!v11)
      {
LABEL_14:

        goto LABEL_15;
      }

      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v11,  4LL));
      free(v11);
      unsigned int v53 = v8;
      SSFileLog(v5, @"%@");
    }

    goto LABEL_14;
  }

- (BOOL)_migrateAccountsToAccountsFramework
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[SSLogConfig sharedAccountsMigrationConfig]( &OBJC_CLASS___SSLogConfig,  "sharedAccountsMigrationConfig"));
  if (!v3) {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v4 = [v3 shouldLog];
  else {
    LODWORD(v5) = v4;
  }
  unsigned int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 OSLogObject]);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v5 = v5;
  }
  else {
    v5 &= 2u;
  }
  if (!(_DWORD)v5) {
    goto LABEL_12;
  }
  int v10 = 138543362;
  id v11 = (id)objc_opt_class(self);
  id v7 = v11;
  id v8 = (void *)_os_log_send_and_compose_impl( v5,  0LL,  0LL,  0LL,  &dword_0,  v6,  0LL,  "%{public}@: Starting migration to Accounts.framework.",  &v10,  12);

  if (v8)
  {
    unsigned int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v8,  4LL));
    free(v8);
    SSFileLog(v3, @"%@");
LABEL_12:
  }

  return +[SSAccountStore migrateToAccountsFramework]( &OBJC_CLASS___SSAccountStore,  "migrateToAccountsFramework");
}

- (void)_migrateAutomaticDownloadKindsDefaultToActiveAccount:(id)a3 store:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue( +[SSLogConfig sharedAccountsMigrationConfig]( &OBJC_CLASS___SSLogConfig,  "sharedAccountsMigrationConfig"));
    if (!v9) {
      unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v17 = [v9 shouldLog];
    else {
      LODWORD(v18) = v17;
    }
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 OSLogObject]);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v18 = v18;
    }
    else {
      v18 &= 2u;
    }
    if ((_DWORD)v18)
    {
      int v28 = 138543362;
      id v29 = (id)objc_opt_class(self);
      id v19 = v29;
      uint64_t v20 = (void *)_os_log_send_and_compose_impl( v18,  0LL,  0LL,  0LL,  &dword_0,  v11,  0LL,  "%{public}@: There's no active account. Skipping migration of the AutomaticDownloadKinds default.",  &v28,  12);

      if (!v20) {
        goto LABEL_40;
      }
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v20,  4LL));
      free(v20);
      SSFileLog(v9, @"%@");
    }

    goto LABEL_39;
  }

  id v8 = (const __CFString *)kSSUserDefaultsIdentifier;
  unsigned int v9 = (void *)CFPreferencesCopyAppValue(@"AutomaticDownloadKinds", kSSUserDefaultsIdentifier);
  uint64_t v10 = objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedAccountsMigrationConfig](&OBJC_CLASS___SSLogConfig, "sharedAccountsMigrationConfig"));
  id v11 = (os_log_s *)v10;
  if (!v9)
  {
    if (!v10) {
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v21 = -[os_log_s shouldLog](v11, "shouldLog");
    else {
      LODWORD(v22) = v21;
    }
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[os_log_s OSLogObject](v11, "OSLogObject"));
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v22 = v22;
    }
    else {
      v22 &= 2u;
    }
    if (!(_DWORD)v22) {
      goto LABEL_38;
    }
    int v28 = 138543362;
    id v29 = (id)objc_opt_class(self);
    id v24 = v29;
    uint64_t v25 = (void *)_os_log_send_and_compose_impl( v22,  0LL,  0LL,  0LL,  &dword_0,  v23,  0LL,  "%{public}@: We didn't find a value for AutomaticDownloadKinds that needs to be migrated.",  &v28,  12);

    if (v25)
    {
      uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v25,  4LL));
      free(v25);
      SSFileLog(v11, @"%@");
LABEL_38:
    }

- (void)_migrateSandboxAccounts
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[SSLogConfig sharedAccountsMigrationConfig]( &OBJC_CLASS___SSLogConfig,  "sharedAccountsMigrationConfig"));
  if (!v2) {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  LODWORD(v3) = [v2 shouldLog];
  unsigned int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([v2 OSLogObject]);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v3 = v3;
  }
  else {
    v3 &= 2u;
  }
  if ((_DWORD)v3)
  {
    *(_DWORD *)location = 138543362;
    *(void *)&location[4] = objc_opt_class(self);
    id v5 = *(id *)&location[4];
    id v6 = (void *)_os_log_send_and_compose_impl( v3,  0LL,  0LL,  0LL,  &dword_0,  v4,  0LL,  "%{public}@: Migrating sandbox accounts.",  location,  12);

    if (v6)
    {
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v6,  4LL));
      free(v6);
      uint64_t v44 = v7;
      SSFileLog(v2, @"%@");
    }
  }

  else
  {
  }

  uint64_t v50 = objc_alloc_init(&OBJC_CLASS___ACAccountStore);
  uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue( -[ACAccountStore accountTypeWithAccountTypeIdentifier:]( v50,  "accountTypeWithAccountTypeIdentifier:",  ACAccountTypeIdentifieriTunesStore));
  id v47 = (void *)objc_claimAutoreleasedReturnValue( -[ACAccountStore accountTypeWithAccountTypeIdentifier:]( v50,  "accountTypeWithAccountTypeIdentifier:",  ACAccountTypeIdentifieriTunesStoreSandbox));
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue( -[ACAccountStore accountsWithAccountType:options:error:]( v50,  "accountsWithAccountType:options:error:",  v46,  1LL,  0LL));
  id v8 = [obj countByEnumeratingWithState:&v54 objects:v61 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v55;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v55 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v54 + 1) + 8LL * (void)i);
        unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", @"scope", v44));
        uint64_t v13 = (char *)[v12 unsignedIntegerValue];

        if (v13 == (_BYTE *)&dword_0 + 1)
        {
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[SSLogConfig sharedAccountsMigrationConfig]( &OBJC_CLASS___SSLogConfig,  "sharedAccountsMigrationConfig"));
          if (!v14) {
            uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
          }
          LODWORD(v15) = [v14 shouldLog];
          uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 OSLogObject]);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
            uint64_t v15 = v15;
          }
          else {
            v15 &= 2u;
          }
          if ((_DWORD)v15)
          {
            unsigned int v17 = (void *)objc_opt_class(self);
            id v18 = v17;
            id v19 = (void *)objc_claimAutoreleasedReturnValue([v11 hashedDescription]);
            *(_DWORD *)location = 138543618;
            *(void *)&location[4] = v17;
            __int16 v59 = 2114;
            id v60 = v19;
            LODWORD(v45) = 22;
            uint64_t v20 = (void *)_os_log_send_and_compose_impl( v15,  0LL,  0LL,  0LL,  &dword_0,  v16,  0LL,  "%{public}@: Migrating a sandbox account to the new account type. account = %{public}@",  location,  v45);

            if (v20)
            {
              uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v20,  4LL));
              free(v20);
              uint64_t v44 = v16;
              SSFileLog(v14, @"%@");
              goto LABEL_28;
            }
          }

          else
          {
LABEL_28:
          }

          [v11 setAccountType:v47];
          id v53 = 0LL;
          unsigned __int8 v21 = -[ACAccountStore saveVerifiedAccount:error:]( v50,  "saveVerifiedAccount:error:",  v11,  &v53);
          id v22 = v53;
          uint64_t v23 = v22;
          if ((v21 & 1) != 0) {
            goto LABEL_57;
          }
          id v24 = (void *)objc_claimAutoreleasedReturnValue([v22 domain]);
          if ([v24 isEqualToString:ACErrorDomain])
          {
            BOOL v25 = [v23 code] == (char *)&dword_4 + 1;

            if (v25)
            {
              id v26 = (void *)objc_claimAutoreleasedReturnValue( +[SSLogConfig sharedAccountsMigrationConfig]( &OBJC_CLASS___SSLogConfig,  "sharedAccountsMigrationConfig"));
              if (!v26) {
                id v26 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
              }
              LODWORD(v27) = objc_msgSend(v26, "shouldLog", v44);
              int v28 = (os_log_s *)objc_claimAutoreleasedReturnValue([v26 OSLogObject]);
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
                uint64_t v27 = v27;
              }
              else {
                v27 &= 2u;
              }
              if ((_DWORD)v27)
              {
                id v29 = (void *)objc_opt_class(self);
                *(_DWORD *)location = 138543362;
                *(void *)&location[4] = v29;
                id v30 = v29;
                LODWORD(v45) = 12;
                uint64_t v31 = (void *)_os_log_send_and_compose_impl( v27,  0LL,  0LL,  0LL,  &dword_0,  v28,  0LL,  "%{public}@: Failed to migrate the sandbox account because a sandbox version of it alread y exists. We'll remove it instead.",  location,  v45);

                if (v31)
                {
                  int v28 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v31,  4LL));
                  free(v31);
                  uint64_t v44 = v28;
                  SSFileLog(v26, @"%@");
                  goto LABEL_42;
                }
              }

              else
              {
LABEL_42:
              }

              objc_initWeak((id *)location, self);
              v51[0] = _NSConcreteStackBlock;
              v51[1] = 3221225472LL;
              v51[2] = sub_8EB8;
              v51[3] = &unk_10448;
              objc_copyWeak(&v52, (id *)location);
              -[ACAccountStore removeAccount:withCompletionHandler:]( v50,  "removeAccount:withCompletionHandler:",  v11,  v51);
              objc_destroyWeak(&v52);
              objc_destroyWeak((id *)location);
LABEL_57:

              continue;
            }
          }

          else
          {
          }

          id v32 = (void *)objc_claimAutoreleasedReturnValue( +[SSLogConfig sharedAccountsMigrationConfig]( &OBJC_CLASS___SSLogConfig,  "sharedAccountsMigrationConfig",  v44));
          if (!v32) {
            id v32 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
          }
          LODWORD(v33) = [v32 shouldLog];
          id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue([v32 OSLogObject]);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
            uint64_t v33 = v33;
          }
          else {
            v33 &= 2u;
          }
          if ((_DWORD)v33)
          {
            unsigned int v35 = (void *)objc_opt_class(self);
            *(_DWORD *)location = 138543618;
            *(void *)&location[4] = v35;
            __int16 v59 = 2114;
            id v60 = v23;
            id v36 = v35;
            LODWORD(v45) = 22;
            id v37 = (void *)_os_log_send_and_compose_impl( v33,  0LL,  0LL,  0LL,  &dword_0,  v34,  16LL,  "%{public}@: Failed to migrate the sandbox account. error = %{public}@",  location,  v45);

            if (v37)
            {
              id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v37,  4LL));
              free(v37);
              uint64_t v44 = v34;
              SSFileLog(v32, @"%@");
              goto LABEL_55;
            }
          }

          else
          {
LABEL_55:
          }

          goto LABEL_57;
        }
      }

      id v8 = [obj countByEnumeratingWithState:&v54 objects:v61 count:16];
    }

    while (v8);
  }

  uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue( +[SSLogConfig sharedAccountsMigrationConfig]( &OBJC_CLASS___SSLogConfig,  "sharedAccountsMigrationConfig"));
  if (!v38) {
    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  LODWORD(v39) = objc_msgSend(v38, "shouldLog", v44);
  v40 = (os_log_s *)objc_claimAutoreleasedReturnValue([v38 OSLogObject]);
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v39 = v39;
  }
  else {
    v39 &= 2u;
  }
  if (!(_DWORD)v39) {
    goto LABEL_70;
  }
  uint64_t v41 = (void *)objc_opt_class(self);
  *(_DWORD *)location = 138543362;
  *(void *)&location[4] = v41;
  id v42 = v41;
  LODWORD(v45) = 12;
  unsigned int v43 = (void *)_os_log_send_and_compose_impl( v39,  0LL,  0LL,  0LL,  &dword_0,  v40,  0LL,  "%{public}@: Finished migrating sandbox accounts.",  location,  v45);

  if (v43)
  {
    v40 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v43,  4LL));
    free(v43);
    SSFileLog(v38, @"%@");
LABEL_70:
  }
}

- (void)_migrateServerPromptDefaultsToActiveAccount:(id)a3 store:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v40 = self;
    uint64_t v8 = SSServerPromptIdentifierAutomaticDownloadsAvailable;
    uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ServerPrompt-%@",  SSServerPromptIdentifierAutomaticDownloadsAvailable));
    Boolean keyExistsAndHasValidFormat = 0;
    uint64_t v10 = (const __CFString *)kSSUserDefaultsIdentifier;
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(v9, kSSUserDefaultsIdentifier, &keyExistsAndHasValidFormat);
    int v12 = keyExistsAndHasValidFormat;
    if (!keyExistsAndHasValidFormat) {
      goto LABEL_16;
    }
    int v13 = AppBooleanValue;
    id v39 = v7;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[SSLogConfig sharedAccountsMigrationConfig]( &OBJC_CLASS___SSLogConfig,  "sharedAccountsMigrationConfig"));
    if (!v14) {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v15 = [v14 shouldLog];
    else {
      unsigned int v16 = v15;
    }
    unsigned int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 OSLogObject]);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v18 = v16;
    }
    else {
      uint64_t v18 = v16 & 2;
    }
    if ((_DWORD)v18)
    {
      id v19 = (void *)objc_opt_class(v40);
      int v43 = 138543618;
      id v44 = v19;
      __int16 v45 = 2112;
      uint64_t v46 = v9;
      id v20 = v19;
      unsigned __int8 v21 = (void *)_os_log_send_and_compose_impl( v18,  0LL,  0LL,  0LL,  &dword_0,  v17,  0LL,  "%{public}@: Found a value for %@. Migrating it to the active account.",  &v43,  22);

      if (!v21)
      {
LABEL_15:

        [v6 setDisplayedServerPrompt:v13 != 0 withIdentifier:v8];
        CFPreferencesSetAppValue(v9, 0LL, v10);
        id v7 = v39;
LABEL_16:
        id v22 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ServerPromptDate-%@",  v8));

        uint64_t v23 = (void *)CFPreferencesCopyAppValue(v22, v10);
        if (!v23)
        {
          if (!v12)
          {
LABEL_43:

            goto LABEL_44;
          }

- (void)_postPushToken
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[SSLogConfig sharedAccountsMigrationConfig]( &OBJC_CLASS___SSLogConfig,  "sharedAccountsMigrationConfig"));
  if (!v3) {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v4 = [v3 shouldLog];
  else {
    LODWORD(v5) = v4;
  }
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 OSLogObject]);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v5 = v5;
  }
  else {
    v5 &= 2u;
  }
  if (!(_DWORD)v5) {
    goto LABEL_12;
  }
  int v10 = 138543362;
  id v11 = (id)objc_opt_class(self);
  id v7 = v11;
  uint64_t v8 = (void *)_os_log_send_and_compose_impl( v5,  0LL,  0LL,  0LL,  &dword_0,  v6,  0LL,  "%{public}@: Sending request to post push token",  &v10,  12);

  if (v8)
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v8,  4LL));
    free(v8);
    SSFileLog(v3, @"%@");
LABEL_12:
  }

  id v9 = objc_alloc_init(&OBJC_CLASS___SSPushNotificationTokenRequest);
  [v9 startWithCompletion:0];
}

- (void)_removePasswordEquivalentTokensFromAccounts
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 accounts]);
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 passwordEquivalentToken]);

        if (v10)
        {
          [v9 setPasswordEquivalentToken:0];
          v11[0] = _NSConcreteStackBlock;
          v11[1] = 3221225472LL;
          v11[2] = sub_9B24;
          v11[3] = &unk_10420;
          v11[4] = self;
          v11[5] = v9;
          [v3 saveAccount:v9 verifyCredentials:0 completion:v11];
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v6);
  }
}

+ (void)_cleanupBrokenAccounts:(BOOL)a3 emptyAccounts:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  id v44 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
  id obj = (id)objc_claimAutoreleasedReturnValue([v44 accounts]);
  id v6 = [obj countByEnumeratingWithState:&v53 objects:v63 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v54;
    BOOL v46 = v5;
    BOOL v47 = v4;
    uint64_t v50 = *(void *)v54;
    do
    {
      id v9 = 0LL;
      id v45 = v7;
      do
      {
        if (*(void *)v54 != v8) {
          objc_enumerationMutation(obj);
        }
        int v10 = *(void **)(*((void *)&v53 + 1) + 8LL * (void)v9);
        if ((objc_msgSend(v10, "isLocalAccount", v43) & 1) == 0)
        {
          id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 backingAccount]);
          __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v10 uniqueIdentifier]);
          if (v12)
          {
            __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v10 uniqueIdentifier]);
            unsigned int v14 = [v13 isEqualToNumber:&off_10AB0];
          }

          else
          {
            unsigned int v14 = 1;
          }

          __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v11 accountProperties]);
          id v16 = [v15 count];

          if (v16)
          {
            unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([v11 accountProperties]);
            if ([v17 count] == (char *)&dword_0 + 1)
            {
              uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v11 accountProperties]);
              id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:@"originalUsername"]);
              BOOL v20 = v19 != 0LL;
            }

            else
            {
              BOOL v20 = 0;
            }
          }

          else
          {
            BOOL v20 = 1;
          }

          if ((v14 & v5 & 1) == 0 && (!v20 || !v4)) {
            goto LABEL_45;
          }
          unsigned __int8 v21 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
          id v52 = 0LL;
          unsigned int v22 = [v21 removeAccount:v10 error:&v52];
          id v23 = v52;

          uint64_t v24 = objc_claimAutoreleasedReturnValue( +[SSLogConfig sharedAccountsMigrationConfig]( &OBJC_CLASS___SSLogConfig,  "sharedAccountsMigrationConfig"));
          BOOL v25 = (void *)v24;
          if (v22)
          {
            id v49 = v23;
            if (!v24) {
              BOOL v25 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
            }
            unsigned int v26 = [v25 shouldLog];
            else {
              unsigned int v27 = v26;
            }
            uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue([v25 OSLogObject]);
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
              uint64_t v29 = v27;
            }
            else {
              uint64_t v29 = v27 & 2;
            }
            if ((_DWORD)v29)
            {
              id v30 = (void *)objc_opt_class(a1);
              id v31 = v30;
              unsigned int v32 = (void *)objc_claimAutoreleasedReturnValue([v10 hashedDescription]);
              int v57 = 138543618;
              v58 = v30;
              __int16 v59 = 2114;
              id v60 = v32;
              int v43 = &v57;
              unsigned int v33 = (void *)_os_log_send_and_compose_impl( v29,  0LL,  0LL,  0LL,  &dword_0,  v28,  0LL,  "%{public}@: %{public}@ was broken or empty, so we removed it.");

              if (v33)
              {
                uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v33,  4LL));
                free(v33);
                int v43 = (int *)v28;
                SSFileLog(v25, @"%@");
                BOOL v5 = v46;
                BOOL v4 = v47;
                goto LABEL_30;
              }

              BOOL v5 = v46;
              BOOL v4 = v47;
              id v34 = v49;
LABEL_44:

LABEL_45:
              uint64_t v8 = v50;
              goto LABEL_46;
            }

+ (void)_cleanupDuplicateAccounts
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
  uint64_t v24 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  unsigned int v22 = v2;
  id obj = (id)objc_claimAutoreleasedReturnValue([v2 accounts]);
  id v3 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v34;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v34 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
        __int128 v29 = 0u;
        __int128 v30 = 0u;
        __int128 v31 = 0u;
        __int128 v32 = 0u;
        uint64_t v8 = v24;
        id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v29,  v38,  16LL);
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v30;
LABEL_8:
          uint64_t v12 = 0LL;
          while (1)
          {
            if (*(void *)v30 != v11) {
              objc_enumerationMutation(v8);
            }
            __int128 v13 = *(void **)(*((void *)&v29 + 1) + 8 * v12);
            unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 firstObject]);

            if (v10 == (id)++v12)
            {
              id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v29,  v38,  16LL);
              if (v10) {
                goto LABEL_8;
              }
              goto LABEL_14;
            }
          }

          __int128 v15 = v13;

          if (v15) {
            goto LABEL_17;
          }
        }

        else
        {
LABEL_14:
        }

        __int128 v15 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
        -[NSMutableArray addObject:](v8, "addObject:", v15);
LABEL_17:
        -[NSMutableArray addObject:](v15, "addObject:", v7);
      }

      id v4 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
    }

    while (v4);
  }

  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v16 = v24;
  id v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v25,  v37,  16LL);
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v26;
    do
    {
      for (j = 0LL; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(v16);
        }
        [a1 _mergeDuplicateAccounts:*(void *)(*((void *)&v25 + 1) + 8 * (void)j) inStore:v22];
      }

      id v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v25,  v37,  16LL);
    }

    while (v18);
  }
}

+ (void)_cleanupMultipleActiveAccountsWithPreferredActiveAccount:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[SSLogConfig sharedAccountsMigrationConfig]( &OBJC_CLASS___SSLogConfig,  "sharedAccountsMigrationConfig"));
  if (!v5) {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v6 = [v5 shouldLog];
  else {
    unsigned int v7 = v6;
  }
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 OSLogObject]);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = v7 & 2;
  }
  if ((_DWORD)v9)
  {
    id v10 = (void *)objc_opt_class(a1);
    id v11 = v10;
    id v12 = v4;
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v4 hashedDescription]);
    int v53 = 138543618;
    __int128 v54 = v10;
    __int16 v55 = 2114;
    __int128 v56 = v13;
    unsigned int v14 = (void *)_os_log_send_and_compose_impl( v9,  0LL,  0LL,  0LL,  &dword_0,  v8,  0LL,  "%{public}@: At the beginning of the cleanup, our active account was %{public}@.",  &v53,  22);

    id v4 = v12;
    if (!v14) {
      goto LABEL_13;
    }
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v14,  4LL));
    free(v14);
    uint64_t v41 = v8;
    SSFileLog(v5, @"%@");
  }

LABEL_13:
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 accounts]);
  id v17 = v16;
  if (v4)
  {
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472LL;
    v50[2] = sub_AAB0;
    v50[3] = &unk_104B0;
    id v51 = v4;
    id v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "_ss_arrayByRemovingObjectsPassingTest:", v50));

    uint64_t v19 = v51;
  }

  else
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "_ss_arrayByRemovingObjectsPassingTest:", &stru_10488));

    if (![v18 count]) {
      goto LABEL_30;
    }
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[SSLogConfig sharedAccountsMigrationConfig]( &OBJC_CLASS___SSLogConfig,  "sharedAccountsMigrationConfig"));
    if (!v19) {
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v20 = objc_msgSend(v19, "shouldLog", v41);
    else {
      unsigned int v21 = v20;
    }
    unsigned int v22 = (os_log_s *)objc_claimAutoreleasedReturnValue([v19 OSLogObject]);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v23 = v21;
    }
    else {
      uint64_t v23 = v21 & 2;
    }
    if ((_DWORD)v23)
    {
      uint64_t v24 = (void *)objc_opt_class(a1);
      int v53 = 138543362;
      __int128 v54 = v24;
      id v25 = v24;
      LODWORD(v42) = 12;
      __int128 v26 = (void *)_os_log_send_and_compose_impl( v23,  0LL,  0LL,  0LL,  &dword_0,  v22,  0LL,  "%{public}@: We didn't start the cleanup process with a valid active account. Deactivating all accounts.",  &v53,  v42);

      if (!v26)
      {
        id v4 = 0LL;
        goto LABEL_29;
      }

      unsigned int v22 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v26,  4LL));
      free(v26);
      uint64_t v41 = v22;
      SSFileLog(v19, @"%@");
      id v4 = 0LL;
    }
  }

+ (BOOL)_copyAccountPropertiesIfNeededFromAccount:(id)a3 toAccount:(id)a4
{
  id v5 = a3;
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([a4 backingAccount]);
  __int128 v32 = v5;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  id v37 = (void *)objc_claimAutoreleasedReturnValue([v5 backingAccount]);
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v37 accountProperties]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allKeys]);

  id obj = v8;
  id v9 = [v8 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (!v9)
  {
    char v33 = 0;
    goto LABEL_30;
  }

  id v10 = v9;
  char v33 = 0;
  uint64_t v36 = *(void *)v39;
  uint64_t v11 = SSAccountPropertyAltDSIDKey;
  uint64_t v35 = SSAccountPropertyDSIDKey;
  do
  {
    id v12 = 0LL;
    do
    {
      if (*(void *)v39 != v36) {
        objc_enumerationMutation(obj);
      }
      __int128 v13 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)v12);
      unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v37 objectForKeyedSubscript:v13]);
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v13]);
      if ([v13 isEqualToString:v11]
        && (([v14 isEqual:&stru_10A38] & 1) != 0
         || [v15 isEqual:&stru_10A38]))
      {
        unsigned int v16 = [v14 isEqual:&stru_10A38];
        id v17 = v14;
        if (!v16) {
          goto LABEL_17;
        }
        unsigned __int8 v18 = [v15 isEqual:&stru_10A38];
      }

      else
      {
        if (![v13 isEqualToString:v35]
          || ([v14 isEqual:&off_10AB0] & 1) == 0
          && ![v15 isEqual:&off_10AB0])
        {
          goto LABEL_18;
        }

        unsigned int v19 = [v14 isEqualToNumber:&off_10AB0];
        id v17 = v14;
        if (!v19) {
          goto LABEL_17;
        }
        unsigned __int8 v18 = [v15 isEqualToNumber:&off_10AB0];
      }

      id v17 = v15;
      if ((v18 & 1) == 0)
      {
LABEL_17:
        id v20 = v17;
        if (v20) {
          goto LABEL_22;
        }
      }

+ (id)_firstActiveAccountInAccounts:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 sortedArrayUsingComparator:&stru_10518]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_ss_firstObjectPassingTest:", &stru_10538));

  return v4;
}

+ (void)_mergeDuplicateAccounts:(id)a3 inStore:(id)a4
{
  id v6 = a3;
  id v39 = a4;
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 sortedArrayUsingComparator:&stru_10558]);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 reverseObjectEnumerator]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 allObjects]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_ss_firstObjectPassingTest:", &stru_10578));
  if (!v10) {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);
  }
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  id v6 = v9;
  id v11 = [v6 countByEnumeratingWithState:&v48 objects:v60 count:16];
  id v12 = v6;
  id v41 = v11;
  if (!v11)
  {
LABEL_39:

    goto LABEL_40;
  }

  int v13 = 0;
  uint64_t v40 = *(void *)v49;
  id v37 = v6;
  id v38 = a1;
  do
  {
    unsigned int v14 = 0LL;
    do
    {
      if (*(void *)v49 != v40) {
        objc_enumerationMutation(v6);
      }
      __int128 v15 = *(void **)(*((void *)&v48 + 1) + 8LL * (void)v14);
      if (v15 != v10)
      {
        unsigned int v42 = [a1 _copyAccountPropertiesIfNeededFromAccount:*(void *)(*((void *)&v48 + 1) + 8 * (void)v14) toAccount:v10];
        id v47 = 0LL;
        unsigned int v16 = [v39 removeAccount:v15 error:&v47];
        id v17 = v47;
        uint64_t v18 = objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedAccountsMigrationConfig](&OBJC_CLASS___SSLogConfig, "sharedAccountsMigrationConfig"));
        unsigned int v19 = (void *)v18;
        int v43 = v13;
        if (v16)
        {
          if (!v18) {
            unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
          }
          unsigned int v20 = objc_msgSend(v19, "shouldLog", v35);
          else {
            unsigned int v21 = v20;
          }
          unsigned int v22 = (os_log_s *)objc_claimAutoreleasedReturnValue([v19 OSLogObject]);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
            uint64_t v23 = v21;
          }
          else {
            uint64_t v23 = v21 & 2;
          }
          if ((_DWORD)v23)
          {
            unsigned __int8 v24 = (void *)objc_opt_class(a1);
            id v25 = v24;
            __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v10 hashedDescription]);
            id v27 = (void *)objc_claimAutoreleasedReturnValue([v15 hashedDescription]);
            int v52 = 138543874;
            int v53 = v24;
            __int16 v54 = 2114;
            __int16 v55 = v26;
            __int16 v56 = 2114;
            int v57 = v27;
            LODWORD(v36) = 32;
            uint64_t v28 = _os_log_send_and_compose_impl( v23,  0LL,  0LL,  0LL,  &dword_0,  v22,  0LL,  "%{public}@: Removed a duplicate of %{public}@. duplicate = %{public}@",  &v52,  v36);
            goto LABEL_30;
          }

+ (void)_repairAccounts
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 accounts]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_ss_map:", &stru_105B8));

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SSLogConfig sharedAccountsMigrationConfigOversize]( &OBJC_CLASS___SSLogConfig,  "sharedAccountsMigrationConfigOversize"));
  if (!v6) {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v7 = [v6 shouldLog];
  else {
    LODWORD(v8) = v7;
  }
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v8 = v8;
  }
  else {
    v8 &= 2u;
  }
  if (!(_DWORD)v8) {
    goto LABEL_12;
  }
  int v14 = 138543618;
  id v15 = (id)objc_opt_class(a1);
  __int16 v16 = 2114;
  id v17 = v5;
  id v10 = v15;
  id v11 = (void *)_os_log_send_and_compose_impl( v8,  0LL,  0LL,  0LL,  &dword_0,  v9,  0LL,  "%{public}@: currentAccounts = %{public}@",  &v14,  22);

  if (v11)
  {
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v11,  4LL));
    free(v11);
    SSFileLog(v6, @"%@");
LABEL_12:
  }

  [a1 _cleanupDuplicateAccounts];
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v3 accounts]);
  int v13 = (void *)objc_claimAutoreleasedReturnValue([a1 _firstActiveAccountInAccounts:v12]);

  [a1 _repairBrokenAccounts];
  [a1 _cleanupBrokenAccounts:1 emptyAccounts:1];
  [a1 _cleanupMultipleActiveAccountsWithPreferredActiveAccount:v13];
  [a1 _repairAccountsWithStringDSID];
}

+ (void)_repairAccountsWithStringDSID
{
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v32 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
  id obj = (id)objc_claimAutoreleasedReturnValue([v32 accounts]);
  id v2 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v39;
    uint64_t v5 = SSAccountPropertyDSIDKey;
    uint64_t v33 = SSAccountPropertyDSIDKey;
    uint64_t v34 = *(void *)v39;
    do
    {
      for (i = 0LL; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v39 != v4) {
          objc_enumerationMutation(obj);
        }
        unsigned int v7 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)i);
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "accountPropertyForKey:", v5, v30));
        uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSString);
        if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
        {
          id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SSLogConfig sharedAccountsMigrationConfig]( &OBJC_CLASS___SSLogConfig,  "sharedAccountsMigrationConfig"));
          if (!v10) {
            id v10 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
          }
          unsigned int v11 = [v10 shouldLog];
          else {
            unsigned int v12 = v11;
          }
          int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 OSLogObject]);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
            uint64_t v14 = v12;
          }
          else {
            uint64_t v14 = v12 & 2;
          }
          if ((_DWORD)v14)
          {
            id v15 = (void *)objc_opt_class(a1);
            id v16 = v15;
            id v17 = (void *)objc_claimAutoreleasedReturnValue([v7 hashedDescription]);
            int v42 = 138543618;
            int v43 = v15;
            uint64_t v4 = v34;
            __int16 v44 = 2114;
            id v45 = v17;
            LODWORD(v31) = 22;
            uint64_t v18 = (void *)_os_log_send_and_compose_impl( v14,  0LL,  0LL,  0LL,  &dword_0,  v13,  0LL,  "%{public}@: Found a DSID that's being stored as a NSString. Attempting to repair it. account = %{public}@",  &v42,  v31);

            uint64_t v5 = v33;
            if (v18)
            {
              int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v18,  4LL));
              free(v18);
              uint64_t v30 = v13;
              SSFileLog(v10, @"%@");
              goto LABEL_18;
            }
          }

          else
          {
LABEL_18:
          }

          uint64_t UniqueIdentifierFromValue = SSAccountGetUniqueIdentifierFromValue(v8);
          unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue(UniqueIdentifierFromValue);
          if (v20)
          {
            [v7 setUniqueIdentifier:v20];
            v37[0] = _NSConcreteStackBlock;
            v37[1] = 3221225472LL;
            v37[2] = sub_C140;
            v37[3] = &unk_105D8;
            v37[4] = a1;
            [v32 saveAccount:v7 verifyCredentials:0 completion:v37];
LABEL_33:

            goto LABEL_34;
          }

          unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue( +[SSLogConfig sharedAccountsMigrationConfig]( &OBJC_CLASS___SSLogConfig,  "sharedAccountsMigrationConfig"));
          if (!v21) {
            unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
          }
          unsigned int v22 = objc_msgSend(v21, "shouldLog", v30);
          uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue([v21 OSLogObject]);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
            uint64_t v24 = v22;
          }
          else {
            uint64_t v24 = v22 & 2;
          }
          if ((_DWORD)v24)
          {
            id v25 = (void *)objc_opt_class(a1);
            id v26 = v25;
            uint64_t v27 = SSHashIfNeeded(v8);
            uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
            int v42 = 138543618;
            int v43 = v25;
            __int16 v44 = 2114;
            id v45 = v28;
            LODWORD(v31) = 22;
            unsigned int v29 = (void *)_os_log_send_and_compose_impl( v24,  0LL,  0LL,  0LL,  &dword_0,  v23,  16LL,  "%{public}@: Failed to convert %{public}@ to a NSNumber.",  &v42,  v31);

            uint64_t v5 = v33;
            uint64_t v4 = v34;

            if (v29)
            {
              uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v29,  4LL));
              free(v29);
              uint64_t v30 = v23;
              SSFileLog(v21, @"%@");
              goto LABEL_31;
            }
          }

          else
          {
LABEL_31:
          }

          goto LABEL_33;
        }

+ (void)_repairBrokenAccounts
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "accounts", 0));
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8LL * (void)i);
        if (([v8 isLocalAccount] & 1) == 0
          && [v8 hasBrokenDSID])
        {
          [v2 repairAccountWithBrokenDSID:v8];
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v5);
  }
}

@end