LABEL_77:
  if (v35) {
    v67 = v45;
  }
  else {
    v67 = 0;
  }
  if (v67 && AppIntegerValue == 2)
  {
    v68 = [(id)objc_opt_class(self) _logConfig];
    v69 = (void *)objc_claimAutoreleasedReturnValue(v68);
    if (!v69) {
      v69 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    v70 = objc_msgSend(v69, "shouldLog", v194);
    v71 = (os_log_s *)objc_claimAutoreleasedReturnValue([v69 OSLogObject]);
    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT)) {
      v72 = v70;
    }
    else {
      v72 = v70 & 2;
    }
    if ((_DWORD)v72)
    {
      v73 = (id)objc_opt_class(self);
      *(_DWORD *)buf = 138543362;
      v211 = (uint64_t)v73;
      LODWORD(v201) = 12;
      v74 = (void *)_os_log_send_and_compose_impl( v72,  0LL,  0LL,  0LL,  &dword_0,  v71,  0LL,  "[%{public}@] - Biometrics: Major OS upgrade, migrating AMS biometric state to UNSET",  buf,  v201);

      if (!v74)
      {
LABEL_93:

        CFPreferencesSetAppValue(@"AMSDeviceBiometricsState", 0LL, @"com.apple.AppleMediaServices");
        v75 = @"com.apple.AppleMediaServices";
LABEL_129:
        CFPreferencesAppSynchronize(v75);
        goto LABEL_130;
      }

      v71 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v74,  4LL));
      free(v74);
      v194 = v71;
      SSFileLog(v69, @"%@");
    }

    goto LABEL_93;
  }

  if (!(AppIntegerValue | v35))
  {
    if (v25 == 2)
    {
      v103 = 1LL;
      goto LABEL_251;
    }

    if (!v45 && v25 == 1)
    {
      v103 = 2LL;
LABEL_251:
      v203 = v103;
      v181 = [(id)objc_opt_class(self) _logConfig];
      v182 = (void *)objc_claimAutoreleasedReturnValue(v181);
      if (!v182) {
        v182 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
      }
      v183 = objc_msgSend(v182, "shouldLog", v194);
      v184 = (os_log_s *)objc_claimAutoreleasedReturnValue([v182 OSLogObject]);
      if (os_log_type_enabled(v184, OS_LOG_TYPE_DEFAULT)) {
        v185 = v183;
      }
      else {
        v185 = v183 & 2;
      }
      if ((_DWORD)v185)
      {
        v186 = (id)objc_opt_class(self);
        v187 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", v25));
        v188 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", v203));
        *(_DWORD *)buf = 138543874;
        v211 = (uint64_t)v186;
        v212 = 2114;
        *(void *)v213 = v187;
        *(_WORD *)&v213[8] = 2114;
        v214 = v188;
        LODWORD(v201) = 32;
        v189 = (void *)_os_log_send_and_compose_impl( v185,  0LL,  0LL,  0LL,  &dword_0,  v184,  0LL,  "[%{public}@] - Biometrics: Migrating legacy StoreServices biometric state (%{public}@) to AMS b iometric state (%{public}@)",  buf,  v201);

        if (!v189)
        {
LABEL_262:

          CFPreferencesSetAppValue( @"AMSDeviceBiometricsState",  +[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", v203),  @"com.apple.AppleMediaServices");
          CFPreferencesAppSynchronize(@"com.apple.AppleMediaServices");
          v97 = @"BiometricStateDidMigrate";
          v98 = &off_10A68;
          goto LABEL_128;
        }

        v184 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v189,  4LL));
        free(v189);
        v194 = v184;
        SSFileLog(v182, @"%@");
      }

      goto LABEL_262;
    }
  }

LABEL_130:
  if (-[ISMMigrator didRestoreFromBackup](self, "didRestoreFromBackup", v194))
  {
    CFPreferencesSetAppValue(@"DidShowHardRestoreFailureDialog", 0LL, v14);
    CFPreferencesSetAppValue(@"RestoreAccountIDs", 0LL, v14);
    CFPreferencesSetAppValue(@"RestoreFailRetryCount", 0LL, v14);
    CFPreferencesSetAppValue(@"RestoreItemKinds", 0LL, v14);
    CFPreferencesSetAppValue(@"RestoreSoftFailRetryCount", 0LL, v14);
    CFPreferencesSetAppValue(@"RestoreStoreFrontIDs", 0LL, v14);
    CFPreferencesSetAppValue(@"RestoreSuppressTermsAndConditions", 0LL, v14);
  }

  if (-[ISMMigrator didUpgrade](self, "didUpgrade"))
  {
    +[ISFileProtectionClassMigrator setMigrationNeededIfNotSet:]( &OBJC_CLASS___ISFileProtectionClassMigrator,  "setMigrationNeededIfNotSet:",  1LL);
  }

  else
  {
    v99 = -[ISMMigrator didRestoreFromBackup](self, "didRestoreFromBackup");
    +[ISFileProtectionClassMigrator setMigrationNeededIfNotSet:]( &OBJC_CLASS___ISFileProtectionClassMigrator,  "setMigrationNeededIfNotSet:",  v99);
    if (!(_DWORD)v99)
    {
      v102 = 1;
      goto LABEL_142;
    }
  }

  CFPreferencesSetAppValue(@"UnsignedBags", 0LL, v14);
  CFPreferencesAppSynchronize(v14);
  v100 = (const __CFString *)kSSUserDefaultsIdentifier;
  v101 = (void *)CFPreferencesCopyAppValue(@"InitiateSessionURL", kSSUserDefaultsIdentifier);
  if ([v101 isEqualToString:@"https://init.itunes.apple.com/bag.xml?ix=6&custombag=true"]) {
    CFPreferencesSetAppValue(@"InitiateSessionURL", 0LL, v100);
  }
  CFPreferencesAppSynchronize(v100);

  v102 = 0;
LABEL_142:
  CFPreferencesAppSynchronize(@"com.apple.mobileipod");
  AppBooleanValue = CFPreferencesGetAppBooleanValue( @"HasMigratedMusicAllowsCellularData",  @"com.apple.mobileipod",  0LL);
  if (!(_DWORD)AppBooleanValue)
  {
    CFPreferencesSetAppValue( @"HasMigratedMusicAllowsCellularData",  &__kCFBooleanTrue,  @"com.apple.mobileipod");
    v105 = +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  CFPreferencesGetAppBooleanValue(@"AllowAutoDownloadOnCellular", kSSUserDefaultsIdentifier, 0LL));
    CFPreferencesSetAppValue(@"MusicAllowsCellularData", v105, @"com.apple.mobileipod");
    AppBooleanValue = CFPreferencesAppSynchronize(@"com.apple.mobileipod");
  }

  ShouldUseAppstored = SSDebugShouldUseAppstored(AppBooleanValue);
  else {
    v107 = 1LL;
  }
  v108 = [(id)objc_opt_class(self) _logConfig];
  v109 = objc_claimAutoreleasedReturnValue(v108);
  v110 = (void *)v109;
  if (ShouldUseAppstored)
  {
    if (!v109) {
      v110 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    v111 = [v110 shouldLog];
    v112 = (os_log_s *)objc_claimAutoreleasedReturnValue([v110 OSLogObject]);
    if (os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT)) {
      v113 = v111;
    }
    else {
      v113 = v111 & 2;
    }
    if ((_DWORD)v113)
    {
      v114 = (id)objc_opt_class(self);
      *(_DWORD *)buf = 138543362;
      v211 = (uint64_t)v114;
      LODWORD(v201) = 12;
      v115 = (void *)_os_log_send_and_compose_impl( v113,  0LL,  0LL,  0LL,  &dword_0,  v112,  0LL,  "[%{public}@]: Scheduling AppStore Migrator",  buf,  v201);

      if (!v115)
      {
LABEL_163:

        v116 = objc_msgSend( objc_alloc((Class)ISWeakLinkedClassForString(@"ASDMigrationRequestOptions", 29)),  "initWithMigrationType:",  v107);
        v117 = objc_msgSend( objc_alloc((Class)ISWeakLinkedClassForString(@"ASDMigrationRequest", 29)),  "initWithOptions:",  v116);
        v209[0] = _NSConcreteStackBlock;
        v209[1] = 3221225472LL;
        v209[2] = sub_5E44;
        v209[3] = &unk_10328;
        v209[4] = self;
        [v117 startWithCompletionBlock:v209];

        goto LABEL_176;
      }

      v112 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v115,  4LL));
      free(v115);
      v197 = v112;
      SSFileLog(v110, @"%@");
    }

    goto LABEL_163;
  }

  if (!v109) {
    v110 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  v118 = [v110 shouldLog];
  v119 = (os_log_s *)objc_claimAutoreleasedReturnValue([v110 OSLogObject]);
  if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT)) {
    v120 = v118;
  }
  else {
    v120 = v118 & 2;
  }
  if (!(_DWORD)v120) {
    goto LABEL_174;
  }
  v121 = (id)objc_opt_class(self);
  *(_DWORD *)buf = 138543362;
  v211 = (uint64_t)v121;
  LODWORD(v201) = 12;
  v122 = (void *)_os_log_send_and_compose_impl( v120,  0LL,  0LL,  0LL,  &dword_0,  v119,  0LL,  "[%{public}@]: Scheduling iTunes Migrator",  buf,  v201);

  if (v122)
  {
    v119 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v122,  4LL));
    free(v122);
    v197 = v119;
    SSFileLog(v110, @"%@");
LABEL_174:
  }

  v116 = objc_alloc_init(&OBJC_CLASS___SSMigrator);
  v208[0] = _NSConcreteStackBlock;
  v208[1] = 3221225472LL;
  v208[2] = sub_5FDC;
  v208[3] = &unk_10350;
  v208[4] = self;
  [v116 performMigration:v107 completionBlock:v208];
LABEL_176:

  if ((v102 & 1) != 0) {
    goto LABEL_214;
  }
  v123 = (void *)objc_claimAutoreleasedReturnValue( +[SSLogConfig sharedAccountsMigrationConfig]( &OBJC_CLASS___SSLogConfig,  "sharedAccountsMigrationConfig"));
  if (!v123) {
    v123 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  v124 = objc_msgSend(v123, "shouldLog", v197);
  v125 = (os_log_s *)objc_claimAutoreleasedReturnValue([v123 OSLogObject]);
  if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT)) {
    v126 = v124;
  }
  else {
    v126 = v124 & 2;
  }
  if ((_DWORD)v126)
  {
    v127 = (id)objc_opt_class(self);
    *(_DWORD *)buf = 138543362;
    v211 = (uint64_t)v127;
    LODWORD(v201) = 12;
    v128 = (void *)_os_log_send_and_compose_impl( v126,  0LL,  0LL,  0LL,  &dword_0,  v125,  0LL,  "%{public}@: Repairing accounts BEFORE migrating accounts.",  buf,  v201);

    if (!v128) {
      goto LABEL_188;
    }
    v125 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v128,  4LL));
    free(v128);
    v198 = v125;
    SSFileLog(v123, @"%@");
  }

LABEL_188:
  [(id)objc_opt_class(self) _repairAccounts];
  v129 = -[ISMMigrator _migrateAccountsToAccountsFramework](self, "_migrateAccountsToAccountsFramework");
  v130 = objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedAccountsMigrationConfig](&OBJC_CLASS___SSLogConfig, "sharedAccountsMigrationConfig"));
  v131 = (void *)v130;
  if (!v129)
  {
    if (!v130) {
      v131 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    v137 = objc_msgSend(v131, "shouldLog", v198);
    v138 = (os_log_s *)objc_claimAutoreleasedReturnValue([v131 OSLogObject]);
    if (os_log_type_enabled(v138, OS_LOG_TYPE_DEFAULT)) {
      v139 = v137;
    }
    else {
      v139 = v137 & 2;
    }
    if ((_DWORD)v139)
    {
      v140 = (id)objc_opt_class(self);
      *(_DWORD *)buf = 138543362;
      v211 = (uint64_t)v140;
      LODWORD(v201) = 12;
      v141 = (void *)_os_log_send_and_compose_impl( v139,  0LL,  0LL,  0LL,  &dword_0,  v138,  0LL,  "%{public}@: No accounts were migrated, so we won't do a second cleanup pass.",  buf,  v201);

      if (!v141)
      {
LABEL_212:

        goto LABEL_213;
      }

      v138 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v141,  4LL));
      free(v141);
      v199 = v138;
      SSFileLog(v131, @"%@");
    }

    goto LABEL_212;
  }

  if (!v130) {
    v131 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  v132 = objc_msgSend(v131, "shouldLog", v198);
  v133 = (os_log_s *)objc_claimAutoreleasedReturnValue([v131 OSLogObject]);
  if (os_log_type_enabled(v133, OS_LOG_TYPE_DEFAULT)) {
    v134 = v132;
  }
  else {
    v134 = v132 & 2;
  }
  if (!(_DWORD)v134) {
    goto LABEL_199;
  }
  v135 = (id)objc_opt_class(self);
  *(_DWORD *)buf = 138543362;
  v211 = (uint64_t)v135;
  LODWORD(v201) = 12;
  v136 = (void *)_os_log_send_and_compose_impl( v134,  0LL,  0LL,  0LL,  &dword_0,  v133,  0LL,  "%{public}@: Repairing accounts AFTER migrating accounts.",  buf,  v201);

  if (v136)
  {
    v133 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v136,  4LL));
    free(v136);
    v199 = v133;
    SSFileLog(v131, @"%@");
LABEL_199:
  }

  [(id)objc_opt_class(self) _repairAccounts];
LABEL_213:
  -[ISMMigrator _migrateSandboxAccounts](self, "_migrateSandboxAccounts", v199);
LABEL_214:
  v142 = [(id)objc_opt_class(self) _logConfig];
  v143 = (void *)objc_claimAutoreleasedReturnValue(v142);
  if (!v143) {
    v143 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  v144 = objc_msgSend(v143, "shouldLog", v197);
  v145 = (os_log_s *)objc_claimAutoreleasedReturnValue([v143 OSLogObject]);
  if (os_log_type_enabled(v145, OS_LOG_TYPE_DEFAULT)) {
    v146 = v144;
  }
  else {
    v146 = v144 & 2;
  }
  if ((_DWORD)v146)
  {
    v147 = (id)objc_opt_class(self);
    *(_DWORD *)buf = 138543362;
    v211 = (uint64_t)v147;
    LODWORD(v201) = 12;
    v148 = (void *)_os_log_send_and_compose_impl( v146,  0LL,  0LL,  0LL,  &dword_0,  v145,  0LL,  "%{public}@: Starting migration to iTunes Feature Enabler.",  buf,  v201);

    if (!v148) {
      goto LABEL_225;
    }
    v145 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v148,  4LL));
    free(v148);
    v200 = v145;
    SSFileLog(v143, @"%@");
  }

LABEL_225:
  +[SSFeatureEnablerMigrator migrate](&OBJC_CLASS___SSFeatureEnablerMigrator, "migrate");
  if ((v102 & 1) == 0)
  {
    v149 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
    v150 = (void *)objc_claimAutoreleasedReturnValue([v149 activeAccount]);
    -[ISMMigrator _migrateAutomaticDownloadKindsDefaultToActiveAccount:store:]( self,  "_migrateAutomaticDownloadKindsDefaultToActiveAccount:store:",  v150,  v149);
    -[ISMMigrator _migrateServerPromptDefaultsToActiveAccount:store:]( self,  "_migrateServerPromptDefaultsToActiveAccount:store:",  v150,  v149);
    -[ISMMigrator _cleanupAutomaticDownloadKindsOfActiveAccount:]( self,  "_cleanupAutomaticDownloadKindsOfActiveAccount:",  v150);
    -[ISMMigrator _encryptAccountFlags](self, "_encryptAccountFlags");

    -[ISMMigrator _postPushToken](self, "_postPushToken");
    -[ISMMigrator _cleanupFollowUps](self, "_cleanupFollowUps");
  }

  if (-[ISMMigrator didUpgrade](self, "didUpgrade", v200))
  {
    if (+[AMSDefaults migratedDeviceOffers](&OBJC_CLASS___AMSDefaults, "migratedDeviceOffers"))
    {
      v151 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedDataMigrationConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedDataMigrationConfig"));
      if (!v151) {
        v151 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
      }
      v152 = (os_log_s *)objc_claimAutoreleasedReturnValue([v151 OSLogObject]);
      if (os_log_type_enabled(v152, OS_LOG_TYPE_INFO))
      {
        v153 = objc_opt_class(self);
        v154 = AMSLogKey();
        v155 = (id)objc_claimAutoreleasedReturnValue(v154);
        v156 = NSStringFromSelector(a2);
        v157 = (id)objc_claimAutoreleasedReturnValue(v156);
        *(_DWORD *)buf = 138543874;
        v211 = v153;
        v212 = 2114;
        *(void *)v213 = v155;
        *(_WORD *)&v213[8] = 2114;
        v214 = v157;
        _os_log_impl( &dword_0,  v152,  OS_LOG_TYPE_INFO,  "%{public}@: [%{public}@] %{public}@ skipping. We already migrated.",  buf,  0x20u);
      }
    }

    else
    {
      v158 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
      v151 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v158, "ams_activeiTunesAccount"));

      if (v151)
      {
        v159 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
        v160 = (void *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedDataMigrationConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedDataMigrationConfig"));
        if (!v160) {
          v160 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
        }
        v161 = (os_log_s *)objc_claimAutoreleasedReturnValue([v160 OSLogObject]);
        if (os_log_type_enabled(v161, OS_LOG_TYPE_INFO))
        {
          v162 = objc_opt_class(self);
          v163 = AMSLogKey();
          v164 = (id)objc_claimAutoreleasedReturnValue(v163);
          v165 = NSStringFromSelector(a2);
          v166 = (id)objc_claimAutoreleasedReturnValue(v165);
          *(_DWORD *)buf = 138543874;
          v211 = v162;
          v212 = 2114;
          *(void *)v213 = v164;
          *(_WORD *)&v213[8] = 2114;
          v214 = v166;
          _os_log_impl(&dword_0, v161, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] %{public}@ started.", buf, 0x20u);
        }

        v167 = (void *)objc_claimAutoreleasedReturnValue( +[AMSDeviceOfferRegistrationTask bagKeySet]( &OBJC_CLASS___AMSDeviceOfferRegistrationTask,  "bagKeySet"));
        v168 = (void *)objc_claimAutoreleasedReturnValue( +[AMSDeviceOfferRegistrationTask bagSubProfile]( &OBJC_CLASS___AMSDeviceOfferRegistrationTask,  "bagSubProfile"));
        v169 = (void *)objc_claimAutoreleasedReturnValue( +[AMSDeviceOfferRegistrationTask bagSubProfileVersion]( &OBJC_CLASS___AMSDeviceOfferRegistrationTask,  "bagSubProfileVersion"));
        +[AMSBagKeySet registerBagKeySet:forProfile:profileVersion:]( &OBJC_CLASS___AMSBagKeySet,  "registerBagKeySet:forProfile:profileVersion:",  v167,  v168,  v169);

        v170 = (void *)objc_claimAutoreleasedReturnValue( +[AMSDeviceOfferRegistrationTask bagSubProfile]( &OBJC_CLASS___AMSDeviceOfferRegistrationTask,  "bagSubProfile"));
        v171 = (void *)objc_claimAutoreleasedReturnValue( +[AMSDeviceOfferRegistrationTask bagSubProfileVersion]( &OBJC_CLASS___AMSDeviceOfferRegistrationTask,  "bagSubProfileVersion"));
        v172 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[AMSBag bagForProfile:profileVersion:]( &OBJC_CLASS___AMSBag,  "bagForProfile:profileVersion:",  v170,  v171));

        v173 = [[AMSDeviceOfferRegistrationTask alloc] initWithAccount:v151 bag:v172];
        [v173 setLightweightCheckOnly:1];
        v174 = (void *)objc_claimAutoreleasedReturnValue([v173 perform]);
        v205[0] = _NSConcreteStackBlock;
        v205[1] = 3221225472LL;
        v205[2] = sub_615C;
        v205[3] = &unk_10378;
        v205[4] = self;
        v207 = a2;
        v152 = v159;
        v206 = v152;
        [v174 addFinishBlock:v205];
      }

      else
      {
        v152 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[AMSLogConfig sharedDataMigrationConfig]( &OBJC_CLASS___AMSLogConfig,  "sharedDataMigrationConfig"));
        if (!v152) {
          v152 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
        }
        v172 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[os_log_s OSLogObject](v152, "OSLogObject"));
        if (os_log_type_enabled(v172, OS_LOG_TYPE_INFO))
        {
          v175 = objc_opt_class(self);
          v176 = AMSLogKey();
          v177 = (id)objc_claimAutoreleasedReturnValue(v176);
          v178 = NSStringFromSelector(a2);
          v179 = (id)objc_claimAutoreleasedReturnValue(v178);
          *(_DWORD *)buf = 138543874;
          v211 = v175;
          v212 = 2114;
          *(void *)v213 = v177;
          *(_WORD *)&v213[8] = 2114;
          v214 = v179;
          _os_log_impl( &dword_0,  v172,  OS_LOG_TYPE_INFO,  "%{public}@: [%{public}@] %{public}@ skipping. No account is signed in during upgrade.",  buf,  0x20u);
        }
      }
    }
  }

  if (+[ISFileProtectionClassMigrator isMigrationNeeded]( &OBJC_CLASS___ISFileProtectionClassMigrator,  "isMigrationNeeded")) {
    +[ISFileProtectionClassMigrator migrate](&OBJC_CLASS___ISFileProtectionClassMigrator, "migrate");
  }
  return 1;
}

void sub_5E44(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [(id)objc_opt_class(*(void *)(a1 + 32)) _logConfig];
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (!v5) {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v6 = [v5 shouldLog];
  else {
    LODWORD(v7) = v6;
  }
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 OSLogObject]);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v7 = v7;
  }
  else {
    v7 &= 2u;
  }
  if (!(_DWORD)v7) {
    goto LABEL_12;
  }
  v9 = (void *)objc_opt_class(*(void *)(a1 + 32));
  int v12 = 138543618;
  v13 = v9;
  __int16 v14 = 2114;
  id v15 = v3;
  id v10 = v9;
  v11 = (void *)_os_log_send_and_compose_impl( v7,  0LL,  0LL,  0LL,  &dword_0,  v8,  0LL,  "[%{public}@]: AppStore Migrator scheduled: %{public}@",  &v12,  22);

  if (v11)
  {
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v11,  4LL));
    free(v11);
    SSFileLog(v5, @"%@");
LABEL_12:
  }
}

void sub_5FDC(uint64_t a1)
{
  id v2 = [(id)objc_opt_class(*(void *)(a1 + 32)) _logConfig];
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
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
  uint64_t v7 = (void *)objc_opt_class(*(void *)(a1 + 32));
  int v10 = 138543362;
  v11 = v7;
  id v8 = v7;
  v9 = (void *)_os_log_send_and_compose_impl( v5,  0LL,  0LL,  0LL,  &dword_0,  v6,  0LL,  "[%{public}@]: iTunes Migrator Scheduled",  &v10,  12);

  if (v9)
  {
    unsigned int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v9,  4LL));
    free(v9);
    SSFileLog(v3, @"%@");
LABEL_12:
  }
}

void sub_615C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedDataMigrationConfig](&OBJC_CLASS___AMSLogConfig, "sharedDataMigrationConfig"));
    if (!v7) {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
    }
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = objc_opt_class(*(void *)(a1 + 32));
      uint64_t v10 = AMSLogKey();
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      int v12 = NSStringFromSelector(*(SEL *)(a1 + 48));
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      int v23 = 138544130;
      uint64_t v24 = v9;
      __int16 v25 = 2114;
      v26 = v11;
      __int16 v27 = 2114;
      v28 = v13;
      __int16 v29 = 2114;
      id v30 = v6;
      _os_log_impl( &dword_0,  v8,  OS_LOG_TYPE_ERROR,  "%{public}@: [%{public}@] %{public}@ Error running the device offer registration. error = %{public}@.",  (uint8_t *)&v23,  0x2Au);
    }
  }

  +[AMSDefaults setMigratedDeviceOffers:](&OBJC_CLASS___AMSDefaults, "setMigratedDeviceOffers:", 1LL);
  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedDataMigrationConfig](&OBJC_CLASS___AMSLogConfig, "sharedDataMigrationConfig"));
  if (!v14) {
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(+[AMSLogConfig sharedConfig](&OBJC_CLASS___AMSLogConfig, "sharedConfig"));
  }
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 OSLogObject]);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = objc_opt_class(*(void *)(a1 + 32));
    uint64_t v17 = AMSLogKey();
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = NSStringFromSelector(*(SEL *)(a1 + 48));
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v21 timeIntervalSinceDate:*(void *)(a1 + 40)];
    int v23 = 138544130;
    uint64_t v24 = v16;
    __int16 v25 = 2114;
    v26 = v18;
    __int16 v27 = 2114;
    v28 = v20;
    __int16 v29 = 2048;
    id v30 = v22;
    _os_log_impl( &dword_0,  v15,  OS_LOG_TYPE_DEFAULT,  "%{public}@: [%{public}@] %{public}@ finished. executionTime = %f",  (uint8_t *)&v23,  0x2Au);
  }
}

void sub_63F4(id a1)
{
  id v3 = objc_alloc_init(&OBJC_CLASS___SSMutableLogConfig);
  [v3 setCategory:@"migrator"];
  [v3 setSubsystem:@"com.apple.itunesstored"];
  id v1 = [v3 copy];
  id v2 = (void *)qword_14518;
  qword_14518 = (uint64_t)v1;
}

LABEL_78:
      goto LABEL_79;
    }

    v45 = [(id)objc_opt_class(self) _logConfig];
    v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
    if (!v46) {
      v46 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    v47 = objc_msgSend(v46, "shouldLog", v53);
    else {
      LODWORD(v48) = v47;
    }
    v49 = (os_log_s *)objc_claimAutoreleasedReturnValue([v46 OSLogObject]);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT)) {
      v48 = v48;
    }
    else {
      v48 &= 2u;
    }
    if ((_DWORD)v48)
    {
      v50 = (void *)objc_opt_class(self);
      v55 = 138543362;
      v56 = v50;
      v51 = v50;
      LODWORD(v54) = 12;
      v52 = (void *)_os_log_send_and_compose_impl( v48,  0LL,  0LL,  0LL,  &dword_0,  v49,  0LL,  "%{public}@: Enabling automatic downloads for audiobooks since it's enabled for eBooks.",  &v55,  v54);

      if (!v52)
      {
LABEL_76:

        __int16 v29 = -[NSSet initWithObjects:](objc_alloc(&OBJC_CLASS___NSSet), "initWithObjects:", v25, 0LL);
        v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[SSDevice currentDevice](&OBJC_CLASS___SSDevice, "currentDevice"));
        -[os_log_s unionAutomaticDownloadKinds:withCompletionBlock:]( v32,  "unionAutomaticDownloadKinds:withCompletionBlock:",  v29,  0LL);
        goto LABEL_77;
      }

      v49 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v52,  4LL));
      free(v52);
      SSFileLog(v46, @"%@");
    }

    goto LABEL_76;
  }

  if (!v7) {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  uint64_t v9 = [v8 shouldLog];
  else {
    LODWORD(v10) = v9;
  }
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 OSLogObject]);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v10 = v10;
  }
  else {
    v10 &= 2u;
  }
  if (!(_DWORD)v10) {
    goto LABEL_13;
  }
  v55 = 138543362;
  v56 = (id)objc_opt_class(self);
  int v12 = v56;
  v13 = (void *)_os_log_send_and_compose_impl( v10,  0LL,  0LL,  0LL,  &dword_0,  v11,  0LL,  "%{public}@: Clearing automatic download kinds after restoring a backup from a different device.",  &v55,  12);

  if (v13)
  {
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v13,  4LL));
    free(v13);
    SSFileLog(v8, @"%@");
LABEL_13:
  }

  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(+[SSDevice currentDevice](&OBJC_CLASS___SSDevice, "currentDevice"));
  [v14 setAutomaticDownloadKinds:0 withCompletionBlock:0];
LABEL_79:
}

LABEL_38:
LABEL_39:
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  obj = v10;
  v26 = [obj countByEnumeratingWithState:&v66 objects:v70 count:16];
  if (v26)
  {
    __int16 v27 = v26;
    v65 = *(void *)v67;
    do
    {
      for (i = 0LL; i != v27; i = (char *)i + 1)
      {
        if (*(void *)v67 != v65) {
          objc_enumerationMutation(obj);
        }
        __int16 v29 = *(void **)(*((void *)&v66 + 1) + 8LL * (void)i);
        if (objc_msgSend(v29, "ams_isLocalAccount", v60))
        {
          id v30 = [(id)objc_opt_class(self) _logConfig];
          v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
          if (!v31) {
            v31 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
          }
          v32 = [v31 shouldLog];
          else {
            v33 = v32;
          }
          v34 = (os_log_s *)objc_claimAutoreleasedReturnValue([v31 OSLogObject]);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
            v35 = v33;
          }
          else {
            v35 = v33 & 2;
          }
          if (!(_DWORD)v35) {
            goto LABEL_79;
          }
          v36 = (void *)objc_opt_class(self);
          v37 = v36;
          v38 = AMSHashIfNeeded(v29);
          v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
          v71 = 138543618;
          v72 = v36;
          v73 = 2114;
          v74 = v39;
          v60 = &v71;
          v40 = (void *)_os_log_send_and_compose_impl( v35,  0LL,  0LL,  0LL,  &dword_0,  v34,  0LL,  "%{public}@: Not encrypting flag for local account. account = %{public}@");
        }

        else
        {
          v41 = objc_msgSend(v29, "ams_encryptAccountFlags");
          v42 = [(id)objc_opt_class(self) _logConfig];
          v43 = objc_claimAutoreleasedReturnValue(v42);
          v31 = (void *)v43;
          if (v41)
          {
            if (!v43) {
              v31 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
            }
            v44 = [v31 shouldLog];
            v45 = (os_log_s *)objc_claimAutoreleasedReturnValue([v31 OSLogObject]);
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT)) {
              v46 = v44;
            }
            else {
              v46 = v44 & 2;
            }
            if ((_DWORD)v46)
            {
              v47 = (void *)objc_opt_class(self);
              v48 = v47;
              v49 = AMSHashIfNeeded(v29);
              v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
              v71 = 138543618;
              v72 = v47;
              v73 = 2114;
              v74 = v50;
              v60 = &v71;
              v51 = (void *)_os_log_send_and_compose_impl( v46,  0LL,  0LL,  0LL,  &dword_0,  v45,  0LL,  "%{public}@: Encrypted account flags, saving account. account = %{public}@");

              if (v51)
              {
                v45 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v51,  4LL));
                free(v51);
                v60 = (int *)v45;
                SSFileLog(v31, @"%@");
                goto LABEL_66;
              }
            }

            else
            {
LABEL_66:
            }

            v31 = (void *)objc_claimAutoreleasedReturnValue( +[ACAccountStore ams_sharedAccountStore]( &OBJC_CLASS___ACAccountStore,  "ams_sharedAccountStore"));
            v52 = objc_msgSend(v31, "ams_saveAccount:verifyCredentials:", v29, 0);
            goto LABEL_80;
          }

          if (!v43) {
            v31 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
          }
          v53 = [v31 shouldLog];
          v34 = (os_log_s *)objc_claimAutoreleasedReturnValue([v31 OSLogObject]);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
            v54 = v53;
          }
          else {
            v54 = v53 & 2;
          }
          if (!(_DWORD)v54) {
            goto LABEL_79;
          }
          v55 = (void *)objc_opt_class(self);
          v56 = v55;
          v57 = AMSHashIfNeeded(v29);
          v58 = (void *)objc_claimAutoreleasedReturnValue(v57);
          v71 = 138543618;
          v72 = v55;
          v73 = 2114;
          v74 = v58;
          v60 = &v71;
          v40 = (void *)_os_log_send_and_compose_impl( v54,  0LL,  0LL,  0LL,  &dword_0,  v34,  0LL,  "%{public}@: Encrypting account flags failed or they were already encrypted. account = %{public}@");
        }

        if (v40)
        {
          v34 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v40,  4LL));
          free(v40);
          v60 = (int *)v34;
          SSFileLog(v31, @"%@");
          self = v64;
LABEL_79:

          goto LABEL_81;
        }

LABEL_80:
        self = v64;
LABEL_81:
      }

      __int16 v27 = [obj countByEnumeratingWithState:&v66 objects:v70 count:16];
    }

    while (v27);
  }
}

NSString *__cdecl sub_7620(id a1, ACAccount *a2)
{
  return (NSString *)-[ACAccount hashedDescription](a2, "hashedDescription");
}

LABEL_15:
  int v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults", v53));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:@"SSDeviceType"]);

  __int16 v14 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:@"buildVersion"]);
    uint64_t v16 = v15;
    if (v15)
    {
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "matchesInString:options:range:", v15, 0, 0, objc_msgSend(v15, "length")));
      goto LABEL_20;
    }
  }

  else
  {
    uint64_t v16 = 0LL;
  }

  uint64_t v17 = 0LL;
LABEL_20:
  if ([v17 count])
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectAtIndexedSubscript:0]);
    v19 = [v18 range];
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "substringWithRange:", v19, v20));
  }

  else
  {
    v61 = 0LL;
  }

  v59 = v13;
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[SSLogConfig sharedAccountsMigrationConfig]( &OBJC_CLASS___SSLogConfig,  "sharedAccountsMigrationConfig"));
  if (!v21) {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  v22 = [v21 shouldLog];
  else {
    LODWORD(v23) = v22;
  }
  uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue([v21 OSLogObject]);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
    int v23 = v23;
  }
  else {
    v23 &= 2u;
  }
  v58 = v16;
  if ((_DWORD)v23)
  {
    __int16 v25 = (void *)objc_opt_class(self);
    v63 = 138543874;
    v64 = v25;
    v65 = 2114;
    v66 = v16;
    v67 = 2114;
    v68 = v61;
    v26 = v25;
    LODWORD(v56) = 32;
    __int16 v27 = (void *)_os_log_send_and_compose_impl( v23,  0LL,  0LL,  0LL,  &dword_0,  v24,  0LL,  "%{public}@: Updating from %{public}@ with major version number %{public}@",  &v63,  v56);

    if (!v27) {
      goto LABEL_35;
    }
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v27,  4LL));
    free(v27);
    v54 = v24;
    SSFileLog(v21, @"%@");
  }

LABEL_35:
  v28 = (void *)MGCopyAnswer(@"BuildVersion", 0LL);
  __int16 v29 = v28;
  if (v28)
  {
    id v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "matchesInString:options:range:", v28, 0, 0, objc_msgSend(v28, "length")));

    uint64_t v17 = (void *)v30;
  }

  if (objc_msgSend(v17, "count", v54))
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue([v17 objectAtIndexedSubscript:0]);
    v32 = [v31 range];
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "substringWithRange:", v32, v33));
  }

  else
  {
    v60 = 0LL;
  }

  v34 = (void *)objc_claimAutoreleasedReturnValue( +[SSLogConfig sharedAccountsMigrationConfig]( &OBJC_CLASS___SSLogConfig,  "sharedAccountsMigrationConfig"));
  if (!v34) {
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  v57 = v17;
  v35 = [v34 shouldLog];
  else {
    LODWORD(v36) = v35;
  }
  v37 = (os_log_s *)objc_claimAutoreleasedReturnValue([v34 OSLogObject]);
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT)) {
    v36 = v36;
  }
  else {
    v36 &= 2u;
  }
  if (!(_DWORD)v36) {
    goto LABEL_51;
  }
  v38 = (void *)objc_opt_class(self);
  v63 = 138543874;
  v64 = v38;
  v65 = 2114;
  v66 = v29;
  v67 = 2114;
  v68 = v60;
  v39 = v38;
  LODWORD(v56) = 32;
  v40 = (void *)_os_log_send_and_compose_impl( v36,  0LL,  0LL,  0LL,  &dword_0,  v37,  0LL,  "%{public}@: Updating to %{public}@ with major version number %{public}@",  &v63,  v56);

  if (v40)
  {
    v37 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v40,  4LL));
    free(v40);
    v55 = v37;
    SSFileLog(v34, @"%@");
LABEL_51:
  }

  v41 = 0LL;
  if (v61 && v60) {
    v41 = [v61 isEqualToString:v60] ^ 1;
  }
  v42 = (void *)objc_claimAutoreleasedReturnValue( +[SSLogConfig sharedAccountsMigrationConfig]( &OBJC_CLASS___SSLogConfig,  "sharedAccountsMigrationConfig",  v55));
  if (!v42) {
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  v43 = [v42 shouldLog];
  else {
    LODWORD(v44) = v43;
  }
  v45 = (os_log_s *)objc_claimAutoreleasedReturnValue([v42 OSLogObject]);
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT)) {
    v44 = v44;
  }
  else {
    v44 &= 2u;
  }
  if (!(_DWORD)v44) {
    goto LABEL_66;
  }
  v46 = (void *)objc_opt_class(self);
  v47 = v4;
  v48 = v3;
  v49 = v46;
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v41));
  v63 = 138543618;
  v64 = v46;
  v65 = 2114;
  v66 = v50;
  LODWORD(v56) = 22;
  v51 = (void *)_os_log_send_and_compose_impl( v44,  0LL,  0LL,  0LL,  &dword_0,  v45,  0LL,  "%{public}@: Is major version update: %{public}@",  &v63,  v56);

  id v3 = v48;
  unsigned int v4 = v47;

  if (v51)
  {
    v45 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v51,  4LL));
    free(v51);
    SSFileLog(v42, @"%@");
LABEL_66:
  }

  return v41;
}
}
}
}

LABEL_39:
    goto LABEL_40;
  }

  if (!v10) {
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  int v12 = -[os_log_s shouldLog](v11, "shouldLog");
  else {
    LODWORD(v13) = v12;
  }
  __int16 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[os_log_s OSLogObject](v11, "OSLogObject"));
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
    v13 = v13;
  }
  else {
    v13 &= 2u;
  }
  if (!(_DWORD)v13) {
    goto LABEL_14;
  }
  v28 = 138543362;
  __int16 v29 = (id)objc_opt_class(self);
  id v15 = v29;
  uint64_t v16 = (void *)_os_log_send_and_compose_impl( v13,  0LL,  0LL,  0LL,  &dword_0,  v14,  0LL,  "%{public}@: Found a value for AutomaticDownloadKinds. Migrating it to the active account.",  &v28,  12);

  if (v16)
  {
    __int16 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v16,  4LL));
    free(v16);
    SSFileLog(v11, @"%@");
LABEL_14:
  }

  CFPreferencesSetAppValue(@"AutomaticDownloadKinds", 0LL, v8);
  CFPreferencesAppSynchronize(v8);
  [v6 setAutomaticDownloadKinds:v9];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_837C;
  v26[3] = &unk_10420;
  v26[4] = self;
  __int16 v27 = v6;
  [v7 saveAccount:v27 verifyCredentials:0 completion:v26];

LABEL_40:
}

void sub_837C(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) != 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SSLogConfig sharedAccountsMigrationConfig]( &OBJC_CLASS___SSLogConfig,  "sharedAccountsMigrationConfig"));
    if (!v6) {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v7 = [v6 shouldLog];
    else {
      LODWORD(v8) = v7;
    }
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v8 = v8;
    }
    else {
      v8 &= 2u;
    }
    if (!(_DWORD)v8) {
      goto LABEL_24;
    }
    uint64_t v10 = (void *)objc_opt_class(*(void *)(a1 + 32));
    int v19 = 138543362;
    v20 = v10;
    id v11 = v10;
    int v12 = (void *)_os_log_send_and_compose_impl( v8,  0LL,  0LL,  0LL,  &dword_0,  v9,  0LL,  "%{public}@: Success migrating the value for AutomaticDownloadKinds to the active account.",  &v19,  12);
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedAccountsConfig](&OBJC_CLASS___SSLogConfig, "sharedAccountsConfig"));
    if (!v6) {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v13 = [v6 shouldLog];
    else {
      LODWORD(v14) = v13;
    }
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      uint64_t v14 = v14;
    }
    else {
      v14 &= 2u;
    }
    if (!(_DWORD)v14) {
      goto LABEL_24;
    }
    id v15 = (void *)objc_opt_class(*(void *)(a1 + 32));
    uint64_t v16 = *(void **)(a1 + 40);
    id v17 = v15;
    v18 = (void *)objc_claimAutoreleasedReturnValue([v16 hashedDescription]);
    int v19 = 138543874;
    v20 = v15;
    __int16 v21 = 2114;
    v22 = v18;
    __int16 v23 = 2114;
    id v24 = v5;
    int v12 = (void *)_os_log_send_and_compose_impl( v14,  0LL,  0LL,  0LL,  &dword_0,  v9,  16LL,  "%{public}@: Failed to save the active account after migrating the AutomaticDownloadKinds default. ac count = %{public}@ | error = %{public}@",  &v19,  32);
  }

  if (v12)
  {
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v12,  4LL));
    free(v12);
    SSFileLog(v6, @"%@");
LABEL_24:
  }
}

void sub_8E94( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id *location, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, id a37)
{
}

void sub_8EB8(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SSLogConfig sharedAccountsMigrationConfig]( &OBJC_CLASS___SSLogConfig,  "sharedAccountsMigrationConfig"));
    if (!v6) {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v7 = [v6 shouldLog];
    else {
      LODWORD(v8) = v7;
    }
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      uint64_t v8 = v8;
    }
    else {
      v8 &= 2u;
    }
    if ((_DWORD)v8)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      int v13 = 138543618;
      id v14 = (id)objc_opt_class(WeakRetained);
      __int16 v15 = 2114;
      id v16 = v5;
      id v11 = v14;
      int v12 = (void *)_os_log_send_and_compose_impl( v8,  0LL,  0LL,  0LL,  &dword_0,  v9,  16LL,  "%{public}@: We failed to remove the duplicate, unmigrated sandbox account. error = %{public}@",  &v13,  22);

      if (!v12)
      {
LABEL_14:

        goto LABEL_15;
      }

      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v12,  4LL));
      free(v12);
      SSFileLog(v6, @"%@");
    }

    goto LABEL_14;
  }

LABEL_42:
          CFPreferencesAppSynchronize(v10);
          v41[0] = _NSConcreteStackBlock;
          v41[1] = 3221225472LL;
          v41[2] = sub_95AC;
          v41[3] = &unk_10350;
          v41[4] = v40;
          [v7 saveAccount:v6 verifyCredentials:0 completion:v41];
          goto LABEL_43;
        }

        id v24 = v7;
        __int16 v25 = (void *)objc_claimAutoreleasedReturnValue( +[SSLogConfig sharedAccountsMigrationConfig]( &OBJC_CLASS___SSLogConfig,  "sharedAccountsMigrationConfig"));
        if (!v25) {
          __int16 v25 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
        }
        v26 = [v25 shouldLog];
        __int16 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue([v25 OSLogObject]);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
          v28 = v26;
        }
        else {
          v28 = v26 & 2;
        }
        if ((_DWORD)v28)
        {
          __int16 v29 = (void *)objc_opt_class(v40);
          v43 = 138543618;
          v44 = v29;
          v45 = 2112;
          v46 = v22;
          id v30 = v29;
          LODWORD(v38) = 22;
          v31 = (void *)_os_log_send_and_compose_impl( v28,  0LL,  0LL,  0LL,  &dword_0,  v27,  0LL,  "%{public}@: Found a value for %@. Migrating it to the active account.",  &v43,  v38);

          if (!v31)
          {
LABEL_28:

            [v6 setLastAttemptDate:v23 forServerPromptWithIdentifier:v8];
            CFPreferencesSetAppValue(v22, 0LL, v10);
            unsigned int v7 = v24;
            goto LABEL_42;
          }

          __int16 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v31,  4LL));
          free(v31);
          SSFileLog(v25, @"%@");
        }

        goto LABEL_28;
      }

      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v21,  4LL));
      free(v21);
      SSFileLog(v14, @"%@");
    }

    goto LABEL_15;
  }

  v22 = (__CFString *)objc_claimAutoreleasedReturnValue( +[SSLogConfig sharedAccountsMigrationConfig]( &OBJC_CLASS___SSLogConfig,  "sharedAccountsMigrationConfig"));
  if (!v22) {
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  v32 = -[__CFString shouldLog](v22, "shouldLog");
  else {
    v33 = v32;
  }
  v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[__CFString OSLogObject](v22, "OSLogObject"));
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT)) {
    v35 = v33;
  }
  else {
    v35 = v33 & 2;
  }
  if (!(_DWORD)v35) {
    goto LABEL_40;
  }
  v43 = 138543362;
  v44 = (id)objc_opt_class(self);
  v36 = v44;
  v37 = (void *)_os_log_send_and_compose_impl( v35,  0LL,  0LL,  0LL,  &dword_0,  v34,  0LL,  "%{public}@: There's no active account. Skipping migration of ServerPrompt defaults.",  &v43,  12);

  if (v37)
  {
    v34 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v37,  4LL));
    free(v37);
    SSFileLog(v22, @"%@");
LABEL_40:
  }

LABEL_44:
}

void sub_95AC(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) != 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SSLogConfig sharedAccountsMigrationConfig]( &OBJC_CLASS___SSLogConfig,  "sharedAccountsMigrationConfig"));
    if (!v6) {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v7 = [v6 shouldLog];
    else {
      LODWORD(v8) = v7;
    }
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v8 = v8;
    }
    else {
      v8 &= 2u;
    }
    if (!(_DWORD)v8) {
      goto LABEL_24;
    }
    uint64_t v10 = (void *)objc_opt_class(*(void *)(a1 + 32));
    *(_DWORD *)id v17 = 138543362;
    *(void *)&v17[4] = v10;
    id v11 = v10;
    uint64_t v12 = _os_log_send_and_compose_impl( v8,  0LL,  0LL,  0LL,  &dword_0,  v9,  0LL,  "%{public}@: Success saving the active account after migrating ServerPrompt defaults to it.",  v17,  12,  *(_OWORD *)v17,  *(void *)&v17[16]);
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedAccountsConfig](&OBJC_CLASS___SSLogConfig, "sharedAccountsConfig"));
    if (!v6) {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v13 = [v6 shouldLog];
    else {
      LODWORD(v14) = v13;
    }
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      uint64_t v14 = v14;
    }
    else {
      v14 &= 2u;
    }
    if (!(_DWORD)v14) {
      goto LABEL_24;
    }
    __int16 v15 = (void *)objc_opt_class(*(void *)(a1 + 32));
    *(_DWORD *)id v17 = 138543618;
    *(void *)&v17[4] = v15;
    *(_WORD *)&v17[12] = 2114;
    *(void *)&v17[14] = v5;
    id v11 = v15;
    uint64_t v12 = _os_log_send_and_compose_impl( v14,  0LL,  0LL,  0LL,  &dword_0,  v9,  16LL,  "%{public}@: Failed to save the active account after migrating ServerPrompt defaults to it. error = %{public}@",  v17,  22,  *(void *)v17,  *(_OWORD *)&v17[8]);
  }

  id v16 = (void *)v12;

  if (v16)
  {
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v16,  4LL));
    free(v16);
    SSFileLog(v6, @"%@");
LABEL_24:
  }
}

void sub_9B24(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SSLogConfig sharedAccountsMigrationConfig]( &OBJC_CLASS___SSLogConfig,  "sharedAccountsMigrationConfig"));
    if (!v6) {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v7 = [v6 shouldLog];
    else {
      LODWORD(v8) = v7;
    }
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      uint64_t v8 = v8;
    }
    else {
      v8 &= 2u;
    }
    if ((_DWORD)v8)
    {
      uint64_t v10 = (void *)objc_opt_class(*(void *)(a1 + 32));
      id v11 = *(void **)(a1 + 40);
      id v12 = v10;
      unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v11 hashedDescription]);
      int v15 = 138543874;
      id v16 = v10;
      __int16 v17 = 2114;
      v18 = v13;
      __int16 v19 = 2114;
      id v20 = v5;
      uint64_t v14 = (void *)_os_log_send_and_compose_impl( v8,  0LL,  0LL,  0LL,  &dword_0,  v9,  16LL,  "%{public}@: Failed to remove a PET from an account. account = %{public}@ | error = %{public}@",  &v15,  32);

      if (!v14)
      {
LABEL_14:

        goto LABEL_15;
      }

      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v14,  4LL));
      free(v14);
      SSFileLog(v6, @"%@");
    }

    goto LABEL_14;
  }

LABEL_30:
            v34 = v49;
          }

          else
          {
            v35 = v23;
            if (!v24) {
              __int16 v25 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
            }
            v36 = [v25 shouldLog];
            v28 = (os_log_s *)objc_claimAutoreleasedReturnValue([v25 OSLogObject]);
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
              v37 = v36;
            }
            else {
              v37 = v36 & 2;
            }
            if ((_DWORD)v37)
            {
              v38 = (void *)objc_opt_class(a1);
              v39 = v38;
              v40 = (void *)objc_claimAutoreleasedReturnValue([v10 hashedDescription]);
              v57 = 138543874;
              v58 = v38;
              v59 = 2114;
              v60 = v40;
              v61 = 2114;
              v34 = v35;
              v62 = v35;
              v43 = &v57;
              v41 = (void *)_os_log_send_and_compose_impl( v37,  0LL,  0LL,  0LL,  &dword_0,  v28,  16LL,  "%{public}@: %{public}@ was broken or empty, but we failed to remove it. error = %{public}@");

              if (!v41)
              {
                id v5 = v46;
                unsigned int v4 = v47;
                unsigned int v7 = v45;
                goto LABEL_44;
              }

              v28 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v41,  4LL));
              free(v41);
              v43 = (int *)v28;
              SSFileLog(v25, @"%@");
              id v5 = v46;
              unsigned int v4 = v47;
            }

            else
            {
              v34 = v35;
            }

            unsigned int v7 = v45;
          }

          goto LABEL_44;
        }

LABEL_46:
        uint64_t v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      v42 = [obj countByEnumeratingWithState:&v53 objects:v63 count:16];
      unsigned int v7 = v42;
    }

    while (v42);
  }
}

LABEL_29:
LABEL_30:
  if (objc_msgSend(v18, "count", v41))
  {
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    __int16 v27 = v18;
    v28 = [v27 countByEnumeratingWithState:&v46 objects:v52 count:16];
    if (v28)
    {
      __int16 v29 = v28;
      v43 = v18;
      v44 = v4;
      id v30 = *(void *)v47;
      do
      {
        for (i = 0LL; i != v29; i = (char *)i + 1)
        {
          if (*(void *)v47 != v30) {
            objc_enumerationMutation(v27);
          }
          v32 = *(void **)(*((void *)&v46 + 1) + 8LL * (void)i);
          [v32 setActive:0];
          v45[0] = _NSConcreteStackBlock;
          v45[1] = 3221225472LL;
          v45[2] = sub_AB54;
          v45[3] = &unk_104D8;
          v45[4] = v32;
          v45[5] = a1;
          [v15 saveAccount:v32 verifyCredentials:0 completion:v45];
        }

        __int16 v29 = [v27 countByEnumeratingWithState:&v46 objects:v52 count:16];
      }

      while (v29);
      v18 = v43;
      unsigned int v4 = v44;
    }
  }

  else
  {
    __int16 v27 = (id)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedAccountsMigrationConfig](&OBJC_CLASS___SSLogConfig, "sharedAccountsMigrationConfig"));
    if (!v27) {
      __int16 v27 = (id)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    v33 = [v27 shouldLog];
    else {
      v34 = v33;
    }
    v35 = (os_log_s *)objc_claimAutoreleasedReturnValue([v27 OSLogObject]);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT)) {
      v36 = v34;
    }
    else {
      v36 = v34 & 2;
    }
    if ((_DWORD)v36)
    {
      v37 = v4;
      v38 = (void *)objc_opt_class(a1);
      v53 = 138543362;
      v54 = v38;
      v39 = v38;
      LODWORD(v42) = 12;
      v40 = (void *)_os_log_send_and_compose_impl( v36,  0LL,  0LL,  0LL,  &dword_0,  v35,  0LL,  "%{public}@: There are no accounts we need to deactivate.",  &v53,  v42);

      if (!v40)
      {
        unsigned int v4 = v37;
        goto LABEL_52;
      }

      v35 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v40,  4LL));
      free(v40);
      SSFileLog(v27, @"%@");
      unsigned int v4 = v37;
    }
  }

LABEL_52:
}

BOOL sub_AA94(id a1, SSAccount *a2)
{
  return -[SSAccount isActive](a2, "isActive") ^ 1;
}

id sub_AAB0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isActive])
  {
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 backingAccount]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) backingAccount]);
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    id v8 = [v5 isEqualToString:v7];
  }

  else
  {
    id v8 = &dword_0 + 1;
  }

  return v8;
}

void sub_AB54(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedAccountsMigrationConfig](&OBJC_CLASS___SSLogConfig, "sharedAccountsMigrationConfig"));
  unsigned int v7 = (void *)v6;
  if (a2)
  {
    if (!v6) {
      unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v8 = [v7 shouldLog];
    else {
      LODWORD(v9) = v8;
    }
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v9 = v9;
    }
    else {
      v9 &= 2u;
    }
    if (!(_DWORD)v9) {
      goto LABEL_24;
    }
    id v11 = (void *)objc_opt_class(*(void *)(a1 + 40));
    id v12 = *(void **)(a1 + 32);
    id v13 = v11;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 hashedDescription]);
    *(_DWORD *)__int16 v21 = 138543618;
    *(void *)&v21[4] = v11;
    *(_WORD *)&v21[12] = 2114;
    *(void *)&v21[14] = v14;
    uint64_t v15 = _os_log_send_and_compose_impl( v9,  0LL,  0LL,  0LL,  &dword_0,  v10,  0LL,  "%{public}@: Successfully deactivated %{public}@.",  v21,  22,  *(_OWORD *)v21,  *(void *)&v21[16],  v22);
  }

  else
  {
    if (!v6) {
      unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v16 = [v7 shouldLog];
    else {
      LODWORD(v17) = v16;
    }
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      uint64_t v17 = v17;
    }
    else {
      v17 &= 2u;
    }
    if (!(_DWORD)v17) {
      goto LABEL_24;
    }
    v18 = (void *)objc_opt_class(*(void *)(a1 + 40));
    __int16 v19 = *(void **)(a1 + 32);
    id v13 = v18;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v19 hashedDescription]);
    *(_DWORD *)__int16 v21 = 138543874;
    *(void *)&v21[4] = v18;
    *(_WORD *)&v21[12] = 2114;
    *(void *)&v21[14] = v14;
    *(_WORD *)&v21[22] = 2112;
    uint64_t v15 = _os_log_send_and_compose_impl( v17,  0LL,  0LL,  0LL,  &dword_0,  v10,  16LL,  "%{public}@: Failed to deactivate %{public}@. error = %@",  v21,  32,  *(void *)v21,  *(_OWORD *)&v21[8],  v5);
  }

  id v20 = (void *)v15;

  if (v20)
  {
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v20,  4LL));
    free(v20);
    SSFileLog(v7, @"%@");
LABEL_24:
  }
}

LABEL_18:
      __int16 v21 = v15;
      else {
        id v20 = v21;
      }
LABEL_22:
      __int16 v23 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v13]);
      id v24 = [v23 isEqual:v20];

      if ((v24 & 1) == 0)
      {
        [v6 setObject:v20 forKeyedSubscript:v13];
        v33 = 1;
      }

      id v12 = (char *)v12 + 1;
    }

    while (v10 != v12);
    __int16 v25 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
    uint64_t v10 = v25;
  }

  while (v25);
LABEL_30:

  v26 = (void *)objc_claimAutoreleasedReturnValue([v37 objectForKeyedSubscript:@"originalUsername"]);
  if ([v26 length])
  {
    __int16 v27 = (void *)objc_claimAutoreleasedReturnValue([v6 username]);
    v28 = [v27 isEqualToString:v26];

    __int16 v29 = v33;
    if (v28)
    {
      id v30 = (void *)objc_claimAutoreleasedReturnValue([v37 username]);
      [v6 setUsername:v30];

      __int16 v29 = 1;
    }
  }

  else
  {
    __int16 v29 = v33;
  }

  return v29 & 1;
}

int64_t sub_B1CC(id a1, SSAccount *a2, SSAccount *a3)
{
  unsigned int v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSAccount backingAccount](a2, "backingAccount"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SSAccount backingAccount](v4, "backingAccount"));

  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v5 creationDate]);
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v6 creationDate]);
  id v9 = [v7 compare:v8];

  return (int64_t)v9;
}

BOOL sub_B268(id a1, SSAccount *a2)
{
  return -[SSAccount isActive](a2, "isActive");
}

LABEL_32:
          v34 = v42;
          v33 = v43;
        }

        else
        {
          if (!v18) {
            __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
          }
          __int16 v29 = objc_msgSend(v19, "shouldLog", v35);
          uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue([v19 OSLogObject]);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            id v30 = v29;
          }
          else {
            id v30 = v29 & 2;
          }
          if (!(_DWORD)v30) {
            goto LABEL_32;
          }
          v31 = (void *)objc_opt_class(a1);
          __int16 v25 = v31;
          v26 = (void *)objc_claimAutoreleasedReturnValue([v10 hashedDescription]);
          __int16 v27 = (void *)objc_claimAutoreleasedReturnValue([v15 hashedDescription]);
          v52 = 138544130;
          v53 = v31;
          v54 = 2114;
          v55 = v26;
          v56 = 2114;
          v57 = v27;
          v58 = 2112;
          v59 = v17;
          LODWORD(v36) = 42;
          v28 = _os_log_send_and_compose_impl( v30,  0LL,  0LL,  0LL,  &dword_0,  v22,  16LL,  "%{public}@: Failed to remove a duplicate of %{public}@. duplicate = %{public}@ | error = %@",  &v52,  v36);
LABEL_30:
          v32 = (void *)v28;

          if (v32)
          {
            uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v32,  4LL));
            free(v32);
            v35 = v22;
            SSFileLog(v19, @"%@");
            uint64_t v6 = v37;
            a1 = v38;
            goto LABEL_32;
          }

          uint64_t v6 = v37;
          a1 = v38;
          v34 = v42;
          v33 = v43;
        }

        id v13 = v33 | v34;
      }

      uint64_t v14 = (char *)v14 + 1;
    }

    while (v41 != v14);
    v41 = [v6 countByEnumeratingWithState:&v48 objects:v60 count:16];
  }

  while (v41);

  if ((v13 & 1) != 0)
  {
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472LL;
    v44[2] = sub_B7F4;
    v44[3] = &unk_104D8;
    v46 = a1;
    v45 = v10;
    [v39 saveAccount:v45 verifyCredentials:0 completion:v44];
    id v12 = v45;
    goto LABEL_39;
  }

LABEL_40:
LABEL_41:
}

int64_t sub_B750(id a1, SSAccount *a2, SSAccount *a3)
{
  unsigned int v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SSAccount backingAccount](a2, "backingAccount"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SSAccount backingAccount](v4, "backingAccount"));

  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v5 creationDate]);
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v6 creationDate]);
  id v9 = [v7 compare:v8];

  return (int64_t)v9;
}

BOOL sub_B7EC(id a1, SSAccount *a2)
{
  return -[SSAccount isActive](a2, "isActive");
}

void sub_B7F4(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedAccountsMigrationConfig](&OBJC_CLASS___SSLogConfig, "sharedAccountsMigrationConfig"));
  unsigned int v7 = (void *)v6;
  if (a2)
  {
    if (!v6) {
      unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v8 = [v7 shouldLog];
    else {
      LODWORD(v9) = v8;
    }
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      uint64_t v9 = v9;
    }
    else {
      v9 &= 2u;
    }
    if (!(_DWORD)v9) {
      goto LABEL_24;
    }
    id v11 = (void *)objc_opt_class(*(void *)(a1 + 40));
    id v12 = *(void **)(a1 + 32);
    id v13 = v11;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 hashedDescription]);
    *(_DWORD *)__int16 v21 = 138543618;
    *(void *)&v21[4] = v11;
    *(_WORD *)&v21[12] = 2114;
    *(void *)&v21[14] = v14;
    uint64_t v15 = _os_log_send_and_compose_impl( v9,  0LL,  0LL,  0LL,  &dword_0,  v10,  0LL,  "%{public}@: Successfully merged duplicate accounts. The remaining account is %{public}@.",  v21,  22,  *(_OWORD *)v21,  *(void *)&v21[16],  v22);
  }

  else
  {
    if (!v6) {
      unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v16 = [v7 shouldLog];
    else {
      LODWORD(v17) = v16;
    }
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 OSLogObject]);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      uint64_t v17 = v17;
    }
    else {
      v17 &= 2u;
    }
    if (!(_DWORD)v17) {
      goto LABEL_24;
    }
    v18 = (void *)objc_opt_class(*(void *)(a1 + 40));
    __int16 v19 = *(void **)(a1 + 32);
    id v13 = v18;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v19 hashedDescription]);
    *(_DWORD *)__int16 v21 = 138543874;
    *(void *)&v21[4] = v18;
    *(_WORD *)&v21[12] = 2114;
    *(void *)&v21[14] = v14;
    *(_WORD *)&v21[22] = 2114;
    uint64_t v15 = _os_log_send_and_compose_impl( v17,  0LL,  0LL,  0LL,  &dword_0,  v10,  16LL,  "%{public}@: Failed to merge duplicate accounts. primaryAccount = %{public}@ | error = %{public}@",  v21,  32,  *(void *)v21,  *(_OWORD *)&v21[8],  v5);
  }

  id v20 = (void *)v15;

  if (v20)
  {
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v20,  4LL));
    free(v20);
    SSFileLog(v7, @"%@");
LABEL_24:
  }
}

NSString *__cdecl sub_BCC8(id a1, SSAccount *a2)
{
  return (NSString *)-[SSAccount hashedDescription](a2, "hashedDescription");
}

LABEL_34:
      }

      id v3 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
    }

    while (v3);
  }
}

void sub_C140(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[SSLogConfig sharedAccountsMigrationConfig]( &OBJC_CLASS___SSLogConfig,  "sharedAccountsMigrationConfig"));
    if (!v6) {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v7 = [v6 shouldLog];
    else {
      LODWORD(v8) = v7;
    }
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      uint64_t v8 = v8;
    }
    else {
      v8 &= 2u;
    }
    if ((_DWORD)v8)
    {
      uint64_t v10 = (void *)objc_opt_class(*(void *)(a1 + 32));
      int v13 = 138543618;
      uint64_t v14 = v10;
      __int16 v15 = 2114;
      id v16 = v5;
      id v11 = v10;
      id v12 = (void *)_os_log_send_and_compose_impl( v8,  0LL,  0LL,  0LL,  &dword_0,  v9,  16LL,  "%{public}@: Failed to save the account after converting the NSString to a NSNumber. error = %{public}@",  &v13,  22);

      if (!v12)
      {
LABEL_14:

        goto LABEL_15;
      }

      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v12,  4LL));
      free(v12);
      SSFileLog(v6, @"%@");
    }

    goto LABEL_14;
  }

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return [a1 username];
}