@interface MCPasscodeManagerWriter
+ (BOOL)didPasscodePolicyChangeWithOldRestrictions:(id)a3 newRestrictions:(id)a4;
+ (id)sharedManager;
- (BOOL)changePasscodeFrom:(id)a3 to:(id)a4 skipRecovery:(BOOL)a5 senderBundleID:(id)a6 outError:(id *)a7;
- (BOOL)changePasscodeWithRecoveryPasscode:(id)a3 to:(id)a4 skipRecovery:(BOOL)a5 senderBundleID:(id)a6 outError:(id *)a7;
- (BOOL)clearPasscodeWithEscrowKeybagData:(id)a3 secret:(id)a4 senderBundleID:(id)a5 outError:(id *)a6;
- (BOOL)clearRecoveryPasscodeOpaqueDataWithOutError:(id *)a3;
- (BOOL)isPasscodeRecoveryRestricted;
- (id)_setPublicPasscodeDict:(id)a3;
- (id)clearRecoveryPasscode;
- (id)processPasscodeChangeWithOldPascodeGeneration:(id)a3 oldPublicDict:(id)a4 newPasscodeGeneration:(id)a5 newPublicDict:(id)a6 newPasscodeWasSet:(BOOL)a7;
- (void)_sendPasscodeChangedNotification;
- (void)_setPrivatePasscodeDict:(id)a3;
- (void)clearPasscodeHistory;
- (void)migratePasscodeMetadata;
- (void)resetPasscodeMetadata;
- (void)updatePasscodeHistoryWithOldPasscode:(id)a3 oldPasscodeData:(id)a4 newPrivateDictionary:(id)a5;
@end

@implementation MCPasscodeManagerWriter

+ (id)sharedManager
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___MCPasscodeManagerWriter;
  id v2 = objc_msgSendSuper2(&v4, "sharedManager");
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

- (id)_setPublicPasscodeDict:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  a3,  200LL,  0LL,  0LL));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](&OBJC_CLASS___UMUserManager, "sharedManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 currentUser]);
  id v13 = 0LL;
  [v4 setKeybagOpaqueDataForUser:v5 withOpaqueData:v3 withError:&v13];
  id v6 = v13;
  if (v6)
  {
    uint64_t v7 = MCPasscodeErrorDomain;
    uint64_t v8 = MCErrorArray(@"PASSCODE_ERROR_CANNOT_SET_OPAQUE_PASSCODE_DATA");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:",  v7,  5023LL,  v9,  v6,  MCErrorTypeFatal,  0LL));

    if (v10)
    {
      v11 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v15 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Failed to set opaque passcode data: (%{public}@)",  buf,  0xCu);
      }
    }
  }

  else
  {
    v10 = 0LL;
  }

  return v10;
}

- (void)_setPrivatePasscodeDict:(id)a3
{
  if (a3)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  a3,  200LL,  0LL,  0LL));
    if (v3)
    {
      LOBYTE(v4) = 0;
      v5 = v3;
      +[MCKeychain setData:forService:account:label:description:access:useSystemKeychain:outError:]( &OBJC_CLASS___MCKeychain,  "setData:forService:account:label:description:access:useSystemKeychain:outError:",  v3,  kMCServiceName,  kMCPrivateAccountName,  0LL,  0LL,  kSecAttrAccessibleWhenUnlockedThisDeviceOnly,  v4,  0LL);
      v3 = v5;
    }
  }

  else
  {
    +[MCKeychain removeItemForService:account:label:description:useSystemKeychain:group:]( &OBJC_CLASS___MCKeychain,  "removeItemForService:account:label:description:useSystemKeychain:group:",  kMCServiceName,  kMCPrivateAccountName,  0LL,  0LL,  0LL,  0LL);
  }

- (void)_sendPasscodeChangedNotification
{
  uint64_t v2 = GSSendAppPreferencesChanged(MCSpringboardBundleIdentifier, @"DeviceLockPassword");
  MCSendPasscodeChangedNotification(v2);
}

- (BOOL)isPasscodeRecoveryRestricted
{
  if (MCKeybagMementoSupported(self, a2))
  {
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](&OBJC_CLASS___MCRestrictionManager, "sharedManager"));
    else {
      unsigned int v3 = +[MCRestrictionManager mayChangePasscode]( &OBJC_CLASS___MCRestrictionManager,  "mayChangePasscode") ^ 1;
    }
  }

  else
  {
    LOBYTE(v3) = 1;
  }

  return v3;
}

- (BOOL)changePasscodeFrom:(id)a3 to:(id)a4 skipRecovery:(BOOL)a5 senderBundleID:(id)a6 outError:(id *)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  if ((+[MCRestrictionManager mayChangePasscode](&OBJC_CLASS___MCRestrictionManager, "mayChangePasscode") & 1) != 0)
  {
    if ((+[MCPasscodeManager isDeviceUnlocked](&OBJC_CLASS___MCPasscodeManager, "isDeviceUnlocked") & 1) != 0
      || (id v15 = (id)objc_claimAutoreleasedReturnValue(+[MCPasscodeManager deviceLockedError](&OBJC_CLASS___MCPasscodeManager, "deviceLockedError"))) == 0LL)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue([v12 dataUsingEncoding:4]);
      id v133 = [v16 length];
      if (!v133)
      {

        v16 = 0LL;
      }

      v17 = (void *)objc_claimAutoreleasedReturnValue([v13 dataUsingEncoding:4]);
      id v134 = [v17 length];
      if (!v134)
      {

        v17 = 0LL;
      }

      id v135 = 0LL;
      v18 = (void *)objc_claimAutoreleasedReturnValue( -[MCPasscodeManagerWriter _privatePasscodeDictWithOutError:]( self,  "_privatePasscodeDictWithOutError:",  &v135));
      id v15 = v135;
      if (v15)
      {
LABEL_86:

        if (!a7) {
          goto LABEL_89;
        }
        goto LABEL_87;
      }

      v129 = v18;
      v130 = v17;
      v19 = (void *)objc_claimAutoreleasedReturnValue( +[MDMCloudConfiguration sharedConfiguration]( &OBJC_CLASS___MDMCloudConfiguration,  "sharedConfiguration"));
      v131 = v16;
      BOOL v113 = v9;
      if ([v19 userMode] == 1)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](&OBJC_CLASS___UMUserManager, "sharedManager"));
        unsigned int v21 = [v20 isSharedIPad];
      }

      else
      {
        unsigned int v21 = 0;
      }

      int HasSEP = MCGestaltHasSEP();
      int v26 = v21 ^ 1;
      v116 = (void *)objc_claimAutoreleasedReturnValue(-[MCPasscodeManagerWriter _currentPublicPasscodeDict](self, "_currentPublicPasscodeDict"));
      id v27 = [v116 MCMutableDeepCopy];
      v28 = v27;
      if (v27) {
        v29 = (NSMutableDictionary *)v27;
      }
      else {
        v29 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
      }
      v30 = v29;
      int v31 = HasSEP & v26;

      id v32 = [v129 MCMutableDeepCopy];
      v33 = v32;
      if (v32) {
        v34 = (NSMutableDictionary *)v32;
      }
      else {
        v34 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
      }
      v35 = v34;

      v123 = (void *)objc_claimAutoreleasedReturnValue( +[MCPasscodeManagerWriter characteristicsDictionaryFromPasscode:]( &OBJC_CLASS___MCPasscodeManagerWriter,  "characteristicsDictionaryFromPasscode:",  v13));
      unsigned int v117 = +[MCPasscodeManagerWriter unlockScreenTypeForPasscodeCharacteristics:outSimplePasscodeType:]( &OBJC_CLASS___MCPasscodeManagerWriter,  "unlockScreenTypeForPasscodeCharacteristics:outSimplePasscodeType:");
      id v118 = v14;
      v132 = v35;
      int v119 = v31;
      if (!v31)
      {
        id v42 = -[MCPasscodeManagerWriter _setPublicPasscodeDict:](self, "_setPublicPasscodeDict:", 0LL);
        v43 = (_UNKNOWN **)-[NSMutableDictionary mutableCopy](v35, "mutableCopy");
        [v43 setObject:0 forKeyedSubscript:kMCPrivatePasscodeCharacteristicsKey];
        -[MCPasscodeManagerWriter _setPrivatePasscodeDict:](self, "_setPrivatePasscodeDict:", v43);
        v122 = 0LL;
        goto LABEL_45;
      }

      uint64_t v36 = ((uint64_t (*)(void))MCKeybagCurrentPasscodeGeneration)();
      v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
      v38 = v131;
      v122 = v37;
      if (v133 && v37)
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue([v37 stringValue]);
        if (v30)
        {
          v40 = v30;
          v41 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v30, "objectForKeyedSubscript:", v39));

          if (v41)
          {
            v124 = v40;
          }

          else
          {
            v44 = (void *)objc_claimAutoreleasedReturnValue( -[MCPasscodeManagerWriter _fixUpPublicPasscodeDict:]( self,  "_fixUpPublicPasscodeDict:",  v116));
            v45 = (NSMutableDictionary *)[v44 MCMutableDeepCopy];

            v124 = v45;
          }
        }

        else
        {
          v124 = 0LL;
        }

        uint64_t v46 = kMCPrivatePasscodeCharacteristicsKey;
        v47 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v132,  "objectForKeyedSubscript:",  kMCPrivatePasscodeCharacteristicsKey));
        v48 = v47;
        if (v47)
        {
          v49 = (void *)objc_claimAutoreleasedReturnValue([v47 objectForKeyedSubscript:v39]);

          if (!v49)
          {
            v50 = (void *)objc_claimAutoreleasedReturnValue( -[MCPasscodeManagerWriter _fixUpPasscodeCharacteristics:]( self,  "_fixUpPasscodeCharacteristics:",  v48));
            id v51 = [v50 MCMutableDeepCopy];

            -[NSMutableDictionary setObject:forKeyedSubscript:](v132, "setObject:forKeyedSubscript:", v51, v46);
            id v14 = v118;
          }
        }

        v38 = v131;
        v35 = v132;
        v37 = v122;
      }

      else
      {
        v124 = v30;
      }

      if (v134 && v37)
      {
        v43 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  (char *)[v37 unsignedIntegerValue] + 1));
      }

      else
      {
        v52 = &off_1000CC0B8;
        if (v37) {
          v52 = (_UNKNOWN **)v37;
        }
        v43 = v52;
        if (!v134)
        {
          v30 = v124;
          goto LABEL_45;
        }
      }

      -[MCPasscodeManagerWriter updatePasscodeHistoryWithOldPasscode:oldPasscodeData:newPrivateDictionary:]( self,  "updatePasscodeHistoryWithOldPasscode:oldPasscodeData:newPrivateDictionary:",  v12,  v38,  v35);
      uint64_t v53 = objc_claimAutoreleasedReturnValue([v43 stringValue]);
      uint64_t v54 = kMCPrivatePasscodeCharacteristicsKey;
      v55 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v35,  "objectForKeyedSubscript:",  kMCPrivatePasscodeCharacteristicsKey));
      v56 = v55;
      if (v55) {
        v57 = v55;
      }
      else {
        v57 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
      }
      v58 = v57;

      -[NSMutableDictionary setObject:forKeyedSubscript:](v58, "setObject:forKeyedSubscript:", v123, v53);
      v59 = v58;
      v127 = v58;
      v35 = v132;
      -[NSMutableDictionary setObject:forKeyedSubscript:](v132, "setObject:forKeyedSubscript:", v59, v54);
      -[MCPasscodeManagerWriter _setPrivatePasscodeDict:](self, "_setPrivatePasscodeDict:", v132);
      v138[0] = kMCPublicPasscodeKeyboardTypeKey;
      v114 = (void *)v53;
      v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v117));
      v139[0] = v60;
      v138[1] = kMCPublicPasscodeSimpleTypeKey;
      v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 0xFFFFFFFFLL));
      v139[1] = v61;
      v138[2] = kMCPublicPasscodeCreationDateKey;
      v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      v139[2] = v62;
      v63 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v139,  v138,  3LL));

      v30 = v124;
      -[NSMutableDictionary setObject:forKeyedSubscript:](v124, "setObject:forKeyedSubscript:", v63, v114);
      id v64 = -[MCPasscodeManagerWriter _setPublicPasscodeDict:](self, "_setPublicPasscodeDict:", v124);

      id v14 = v118;
LABEL_45:

      v128 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v30,  200LL,  0LL,  0LL));
      uint64_t v65 = MCKeybagMementoBlobExists();
      int v112 = v65;
      unsigned int v67 = MCKeybagMementoSupported(v65, v66);
      unsigned int v68 = -[MCPasscodeManagerWriter isPasscodeRecoveryRestricted](self, "isPasscodeRecoveryRestricted");
      if (v119)
      {
        uint64_t v69 = MCKeybagClearPasscodeGenerationCaches();
        MCSendClearPasscodeGenerationCachesNotification(v69);
      }

      unsigned int v111 = v67;
      char v70 = v67 ^ 1;
      if (!v133) {
        char v70 = 1;
      }
      char v110 = v68;
      if ((v70 & 1) != 0)
      {
        v81 = v30;
        v82 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v82,  OS_LOG_TYPE_DEFAULT,  "Changing passcode with no options",  buf,  2u);
        }

        unsigned int v115 = MKBKeyBagChangeSystemSecret(v131, v130, v128);
        int v109 = 0;
        v30 = v81;
        if (!v119) {
          goto LABEL_58;
        }
      }

      else
      {
        Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        v72 = Mutable;
        if (v134) {
          int v73 = v68 | v113;
        }
        else {
          int v73 = 1;
        }
        v74 = (const void **)&kCFBooleanTrue;
        if (v73) {
          v74 = (const void **)&kCFBooleanFalse;
        }
        CFDictionaryAddValue(Mutable, @"OverrideMemento", *v74);
        int v109 = v73 ^ 1;
        v75 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v137 = v72;
          _os_log_impl( (void *)&_mh_execute_header,  v75,  OS_LOG_TYPE_DEFAULT,  "Changing passcode with options: %@",  buf,  0xCu);
        }

        unsigned int v115 = MKBKeyBagChangeSystemSecretOpts(v131, v130, v128, v72);
        v35 = v132;
        if (!v119)
        {
LABEL_58:
          if (v134)
          {
            v76 = v30;
            v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v117));
            -[NSMutableDictionary setObject:forKeyedSubscript:]( v30,  "setObject:forKeyedSubscript:",  v77,  kMCPublicPasscodeKeyboardTypeKey);

            v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 0xFFFFFFFFLL));
            -[NSMutableDictionary setObject:forKeyedSubscript:]( v30,  "setObject:forKeyedSubscript:",  v78,  kMCPublicPasscodeSimpleTypeKey);

            v79 = objc_opt_new(&OBJC_CLASS___NSDate);
            -[NSMutableDictionary setObject:forKeyedSubscript:]( v30,  "setObject:forKeyedSubscript:",  v79,  kMCPublicPasscodeCreationDateKey);

            -[NSMutableDictionary setObject:forKeyedSubscript:]( v35,  "setObject:forKeyedSubscript:",  v123,  kMCPrivatePasscodeCharacteristicsKey);
            v80 = 0LL;
            goto LABEL_72;
          }

          v80 = 0LL;
LABEL_70:
          if ((-[MCPasscodeManagerWriter isPasscodeSet](self, "isPasscodeSet") & 1) != 0)
          {
LABEL_73:
            v99 = _MCLogObjects[0];
            v126 = v30;
            v121 = v80;
            if (v115)
            {
              if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67109120;
                LODWORD(v137) = v115;
                _os_log_impl( (void *)&_mh_execute_header,  v99,  OS_LOG_TYPE_ERROR,  "Failed to set new passcode. Result: %d",  buf,  8u);
              }

              uint64_t v100 = MCPasscodeErrorDomain;
              v101 = (__CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v115));
              uint64_t v102 = MCErrorArray(@"PASSCODE_ERROR_CANNOT_SET_P_CODE");
              v103 = (void *)objc_claimAutoreleasedReturnValue(v102);
              id v15 = (id)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v100,  5014LL,  v103,  MCErrorTypeFatal,  v101,  0LL));

              v18 = v129;
              v17 = v130;
              v104 = v116;
            }

            else
            {
              if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v99,  OS_LOG_TYPE_DEFAULT,  "Passcode has been changed.",  buf,  2u);
              }

              v105 = self;
              v104 = v116;
              v101 = (__CFDictionary *)objc_claimAutoreleasedReturnValue( -[MCPasscodeManagerWriter processPasscodeChangeWithOldPascodeGeneration:oldPublicDict:newPasscodeGeneration:newPublicDict:newPasscodeWasSet:]( v105,  "processPasscodeChangeWithOldPascodeGeneration:oldPublicDict:newPasscodeGenera tion:newPublicDict:newPasscodeWasSet:",  v122,  v116,  v80,  v30,  v134 != 0LL));
              if (v101)
              {
                v106 = _MCLogObjects[0];
                if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543362;
                  v137 = v101;
                  _os_log_impl( (void *)&_mh_execute_header,  v106,  OS_LOG_TYPE_ERROR,  "Failed to process passcode change. Error: %{public}@",  buf,  0xCu);
                }
              }

              BYTE1(v108) = v113;
              LOBYTE(v108) = v110;
              +[MCPasscodeAnalytics sendPasscodeChangedEventWithChangeType:oldPasscodeExists:isClearingPasscode:newPasscodeUnlockScreenType:newPasscodeSimpleType:passcodeRecoverySupported:passcodeRecoveryRestricted:recoverySkipped:senderBundleID:]( &OBJC_CLASS___MCPasscodeAnalytics,  "sendPasscodeChangedEventWithChangeType:oldPasscodeExists:isClearingPasscode:newPasscodeUnlockScreenType: newPasscodeSimpleType:passcodeRecoverySupported:passcodeRecoveryRestricted:recoverySkipped:senderBundleID:",  0LL,  v133 != 0LL,  v134 == 0LL,  v117,  0xFFFFFFFFLL,  v111,  v108,  v14);
              if (((v109 | v112 ^ 1) & 1) == 0) {
                +[MCPasscodeAnalytics sendRecoveryPasscodeClearedEventWithReason:]( &OBJC_CLASS___MCPasscodeAnalytics,  "sendRecoveryPasscodeClearedEventWithReason:",  0LL);
              }
              id v15 = 0LL;
              v18 = v129;
              v17 = v130;
            }

            v16 = v131;
            goto LABEL_86;
          }

          -[NSMutableDictionary setObject:forKeyedSubscript:]( v35,  "setObject:forKeyedSubscript:",  0LL,  kMCPrivatePasscodeCharacteristicsKey);
          v76 = 0LL;
LABEL_72:
          id v97 = -[MCPasscodeManagerWriter _setPublicPasscodeDict:](self, "_setPublicPasscodeDict:", v76);
          -[MCPasscodeManagerWriter _setPrivatePasscodeDict:](self, "_setPrivatePasscodeDict:", v35);
          v98 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManagerWriter sharedManager]( &OBJC_CLASS___MCRestrictionManagerWriter,  "sharedManager"));
          [v98 clearAllPasscodeComplianceCaches];

          v30 = v76;
          id v14 = v118;
          goto LABEL_73;
        }
      }

      uint64_t v83 = MCKeybagClearPasscodeGenerationCaches();
      uint64_t v84 = MCSendClearPasscodeGenerationCachesNotification(v83);
      uint64_t v85 = MCKeybagCurrentPasscodeGeneration(v84);
      v80 = (void *)objc_claimAutoreleasedReturnValue(v85);
      if (v134)
      {
        uint64_t v86 = MCKeybagMementoPasscodeGeneration();
        v87 = (void *)objc_claimAutoreleasedReturnValue(v86);
        v76 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
        v125 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
        if (v80)
        {
          v88 = (void *)objc_claimAutoreleasedReturnValue([v80 stringValue]);
          v120 = v80;
          v89 = v30;
          v90 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v30, "objectForKeyedSubscript:", v88));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v76, "setObject:forKeyedSubscript:", v90, v88);

          v91 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v132,  "objectForKeyedSubscript:",  kMCPrivatePasscodeCharacteristicsKey));
          v92 = v87;
          v93 = (void *)objc_claimAutoreleasedReturnValue([v91 objectForKeyedSubscript:v88]);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v125, "setObject:forKeyedSubscript:", v93, v88);

          v87 = v92;
          v30 = v89;
          v80 = v120;
        }

        if (v87)
        {
          v94 = (void *)objc_claimAutoreleasedReturnValue([v87 stringValue]);
          v95 = v30;
          v96 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v30, "objectForKeyedSubscript:", v94));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v76, "setObject:forKeyedSubscript:", v96, v94);

          v30 = v95;
        }

        v35 = v132;
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v132,  "setObject:forKeyedSubscript:",  v125,  kMCPrivatePasscodeCharacteristicsKey);

        goto LABEL_72;
      }

      goto LABEL_70;
    }
  }

  else
  {
    uint64_t v22 = MCPasscodeErrorDomain;
    uint64_t v23 = MCErrorArray(@"PASSCODE_ERROR_CANNOT_MODIFY");
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    id v15 = (id)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v22,  5014LL,  v24,  MCErrorTypeFatal,  0LL));
  }

  if (!a7) {
    goto LABEL_89;
  }
LABEL_87:
  if (v15) {
    *a7 = v15;
  }
LABEL_89:

  return v15 == 0LL;
}

- (BOOL)changePasscodeWithRecoveryPasscode:(id)a3 to:(id)a4 skipRecovery:(BOOL)a5 senderBundleID:(id)a6 outError:(id *)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  if ((MCKeybagMementoSupported(v14, v15) & 1) != 0)
  {
    if ((+[MCRestrictionManager mayChangePasscode]( &OBJC_CLASS___MCRestrictionManager,  "mayChangePasscode") & 1) != 0)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue([v12 dataUsingEncoding:4]);
      if (-[MCPasscodeManagerWriter isPasscodeRecoveryRestricted](self, "isPasscodeRecoveryRestricted")
        || !MCKeybagMementoBlobExists()
        || ![v16 length])
      {
        uint64_t v25 = MCPasscodeErrorDomain;
        uint64_t v26 = MCErrorArray(@"PASSCODE_ERROR_CANNOT_SET_PASSCODE_WITH_RECOVERY");
        id v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v25,  5014LL,  v27,  MCErrorTypeFatal,  0LL));

        goto LABEL_13;
      }

      BOOL v110 = v9;
      v17 = (void *)objc_claimAutoreleasedReturnValue([v13 dataUsingEncoding:4]);
      id v115 = [v17 length];
      if (v115)
      {
        unsigned int v117 = v17;
      }

      else
      {

        unsigned int v117 = 0LL;
      }

      int v112 = (void *)objc_claimAutoreleasedReturnValue(-[MCPasscodeManagerWriter _currentPublicPasscodeDict](self, "_currentPublicPasscodeDict"));
      id v29 = [v112 MCMutableDeepCopy];
      v30 = v29;
      if (v29) {
        int v31 = (NSMutableDictionary *)v29;
      }
      else {
        int v31 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
      }
      id v118 = v31;

      unsigned int v123 = -1;
      uint64_t v108 = (void *)objc_claimAutoreleasedReturnValue( +[MCPasscodeManagerWriter characteristicsDictionaryFromPasscode:]( &OBJC_CLASS___MCPasscodeManagerWriter,  "characteristicsDictionaryFromPasscode:",  v13));
      unsigned int v105 = +[MCPasscodeManagerWriter unlockScreenTypeForPasscodeCharacteristics:outSimplePasscodeType:]( &OBJC_CLASS___MCPasscodeManagerWriter,  "unlockScreenTypeForPasscodeCharacteristics:outSimplePasscodeType:");
      id v32 = (void *)objc_claimAutoreleasedReturnValue( +[MDMCloudConfiguration sharedConfiguration]( &OBJC_CLASS___MDMCloudConfiguration,  "sharedConfiguration"));
      v116 = v16;
      if ([v32 userMode] == 1)
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](&OBJC_CLASS___UMUserManager, "sharedManager"));
        unsigned int v34 = [v33 isSharedIPad];

        v16 = v116;
      }

      else
      {
        unsigned int v34 = 0;
      }

      uint64_t HasSEP = MCGestaltHasSEP();
      int v109 = HasSEP & (v34 ^ 1);
      if (v109 != 1)
      {
        id v42 = -[MCPasscodeManagerWriter _setPublicPasscodeDict:](self, "_setPublicPasscodeDict:", 0LL);
        unsigned int v111 = 0LL;
        v40 = v118;
        goto LABEL_39;
      }

      uint64_t v36 = MCKeybagCurrentPasscodeGeneration(HasSEP);
      v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
      uint64_t v38 = objc_claimAutoreleasedReturnValue([v37 stringValue]);
      v39 = (void *)v38;
      v40 = v118;
      if (v118 && v38)
      {
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v118, "objectForKeyedSubscript:", v38));

        if (v41)
        {
          v40 = v118;
        }

        else
        {
          v43 = (void *)objc_claimAutoreleasedReturnValue(-[MCPasscodeManagerWriter _fixUpPublicPasscodeDict:](self, "_fixUpPublicPasscodeDict:", v112));
          v44 = (NSMutableDictionary *)[v43 MCMutableDeepCopy];

          v40 = v44;
          v16 = v116;
        }
      }

      unsigned int v111 = v37;
      if (v115 && v37)
      {
        v45 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  (char *)[v37 unsignedIntegerValue] + 1));
      }

      else
      {
        uint64_t v46 = &off_1000CC0B8;
        if (v37) {
          uint64_t v46 = (_UNKNOWN **)v37;
        }
        v45 = v46;
        if (!v115) {
          goto LABEL_38;
        }
      }

      int v119 = v39;
      v47 = v45;
      BOOL v113 = (void *)objc_claimAutoreleasedReturnValue([v45 stringValue]);
      v128[0] = kMCPublicPasscodeKeyboardTypeKey;
      v106 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v105));
      v129[0] = v106;
      v128[1] = kMCPublicPasscodeSimpleTypeKey;
      v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v123));
      v129[1] = v48;
      v128[2] = kMCPublicPasscodeCreationDateKey;
      v49 = v40;
      v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      v129[2] = v50;
      id v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v129,  v128,  3LL));

      v40 = v49;
      v16 = v116;

      -[NSMutableDictionary setObject:forKeyedSubscript:](v49, "setObject:forKeyedSubscript:", v51, v113);
      id v52 = -[MCPasscodeManagerWriter _setPublicPasscodeDict:](self, "_setPublicPasscodeDict:", v49);

      v45 = v47;
      v39 = v119;
LABEL_38:

LABEL_39:
      v120 = (NSDate *)v40;
      uint64_t v53 = objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v40,  200LL,  0LL,  0LL));
      Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      CFDictionaryAddValue(Mutable, @"UseMementoBlob", kCFBooleanTrue);
      if (v115) {
        int v55 = v110;
      }
      else {
        int v55 = 1;
      }
      int v104 = v55;
      if (v55) {
        CFBooleanRef v56 = kCFBooleanFalse;
      }
      else {
        CFBooleanRef v56 = kCFBooleanTrue;
      }
      CFDictionaryAddValue(Mutable, @"OverrideMemento", v56);
      v107 = (void *)v53;
      if (v109)
      {
        uint64_t v57 = MCKeybagClearPasscodeGenerationCaches();
        MCSendClearPasscodeGenerationCachesNotification(v57);
        uint64_t v58 = MKBKeyBagChangeSystemSecretOpts(v16, v117, v53, Mutable);
        uint64_t v59 = MCKeybagClearPasscodeGenerationCaches();
        uint64_t v60 = MCSendClearPasscodeGenerationCachesNotification(v59);
        uint64_t v61 = MCKeybagCurrentPasscodeGeneration(v60);
        v114 = (void *)objc_claimAutoreleasedReturnValue(v61);
        if (v115)
        {
          uint64_t v62 = MCKeybagMementoPasscodeGeneration();
          v63 = (NSDate *)objc_claimAutoreleasedReturnValue(v62);
          v40 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
          if (v114)
          {
            id v64 = (void *)objc_claimAutoreleasedReturnValue([v114 stringValue]);
            uint64_t v65 = v58;
            uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue(-[NSDate objectForKeyedSubscript:](v120, "objectForKeyedSubscript:", v64));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v40, "setObject:forKeyedSubscript:", v66, v64);

            uint64_t v58 = v65;
          }

          if (v63)
          {
            unsigned int v67 = (void *)objc_claimAutoreleasedReturnValue(-[NSDate stringValue](v63, "stringValue"));
            unsigned int v102 = v58;
            unsigned int v68 = (void *)objc_claimAutoreleasedReturnValue(-[NSDate objectForKeyedSubscript:](v120, "objectForKeyedSubscript:", v67));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v40, "setObject:forKeyedSubscript:", v68, v67);

            uint64_t v58 = v102;
          }

          goto LABEL_57;
        }
      }

      else
      {
        uint64_t v69 = MKBKeyBagChangeSystemSecretOpts(v16, v117, v53, Mutable);
        uint64_t v58 = v69;
        if (v115)
        {
          uint64_t v70 = v69;
          v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v105));
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v40,  "setObject:forKeyedSubscript:",  v71,  kMCPublicPasscodeKeyboardTypeKey);

          uint64_t v58 = v70;
          v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v123));
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v40,  "setObject:forKeyedSubscript:",  v72,  kMCPublicPasscodeSimpleTypeKey);

          v63 = objc_opt_new(&OBJC_CLASS___NSDate);
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v40,  "setObject:forKeyedSubscript:",  v63,  kMCPublicPasscodeCreationDateKey);
          v114 = 0LL;
          goto LABEL_57;
        }

        v114 = 0LL;
      }

      v40 = 0LL;
      v63 = v120;
LABEL_57:

      id v73 = -[MCPasscodeManagerWriter _setPublicPasscodeDict:](self, "_setPublicPasscodeDict:", v40);
      v120 = (NSDate *)v40;
LABEL_58:
      v74 = _MCLogObjects[0];
      if ((_DWORD)v58)
      {
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v127) = v58;
          _os_log_impl( (void *)&_mh_execute_header,  v74,  OS_LOG_TYPE_ERROR,  "Failed to set new passcode with recovery passcode. Result: %d",  buf,  8u);
        }

        uint64_t v75 = MCPasscodeErrorDomain;
        v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v58));
        uint64_t v77 = MCErrorArray(@"PASSCODE_ERROR_CANNOT_SET_P_CODE");
        v78 = (void *)objc_claimAutoreleasedReturnValue(v77);
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v75,  5014LL,  v78,  MCErrorTypeFatal,  v76,  0LL));

        goto LABEL_98;
      }

      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "Passcode has been changed.", buf, 2u);
      }

      id v122 = 0LL;
      unsigned __int8 v79 = -[MCPasscodeManagerWriter unlockDeviceWithPasscode:outError:]( self,  "unlockDeviceWithPasscode:outError:",  v13,  &v122);
      id v80 = v122;
      v76 = v80;
      if ((v79 & 1) == 0)
      {
        v82 = _MCLogObjects[0];
        uint64_t v83 = v107;
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v127 = v76;
          _os_log_impl( (void *)&_mh_execute_header,  v82,  OS_LOG_TYPE_ERROR,  "Failed to unlock device with new passcode. Error: %{public}@",  buf,  0xCu);
        }

        uint64_t v22 = 0LL;
        v16 = v116;
        goto LABEL_99;
      }

      if (v80)
      {
LABEL_97:
        uint64_t v22 = 0LL;
LABEL_98:
        v16 = v116;
        uint64_t v83 = v107;
LABEL_99:

LABEL_13:
        if (!a7) {
          goto LABEL_16;
        }
        goto LABEL_14;
      }

      if ((+[MCPasscodeManager isDeviceUnlocked](&OBJC_CLASS___MCPasscodeManager, "isDeviceUnlocked") & 1) == 0)
      {
        uint64_t v81 = objc_claimAutoreleasedReturnValue(+[MCPasscodeManager deviceLockedError](&OBJC_CLASS___MCPasscodeManager, "deviceLockedError"));
        if (v81)
        {
          v76 = (void *)v81;
          goto LABEL_97;
        }
      }

      id v121 = 0LL;
      uint64_t v84 = (void *)objc_claimAutoreleasedReturnValue( -[MCPasscodeManagerWriter _privatePasscodeDictWithOutError:]( self,  "_privatePasscodeDictWithOutError:",  &v121));
      id v85 = v121;
      if (v85)
      {
        v76 = v85;
        uint64_t v86 = v84;
        v87 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v127 = v76;
          _os_log_impl( (void *)&_mh_execute_header,  v87,  OS_LOG_TYPE_ERROR,  "Failed to retrieve private passcode data. Error: %{public}@",  buf,  0xCu);
        }

        uint64_t v84 = v86;
        goto LABEL_96;
      }

      if ((+[MCPasscodeManager isDeviceUnlocked](&OBJC_CLASS___MCPasscodeManager, "isDeviceUnlocked") & 1) == 0)
      {
        v76 = (void *)objc_claimAutoreleasedReturnValue(+[MCPasscodeManager deviceLockedError](&OBJC_CLASS___MCPasscodeManager, "deviceLockedError"));
        if (v76)
        {
LABEL_96:

          goto LABEL_97;
        }
      }

      v101 = v84;
      id v88 = [v84 MCMutableDeepCopy];
      v89 = v88;
      if (v88) {
        v90 = (NSMutableDictionary *)v88;
      }
      else {
        v90 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
      }
      v91 = v90;

      v103 = v91;
      if (v115)
      {
        v92 = v111;
        if (v109)
        {
          if (v114)
          {
            v93 = (void *)objc_claimAutoreleasedReturnValue([v114 stringValue]);
            v124 = v93;
            v125 = v108;
            v94 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v125,  &v124,  1LL));
            -[NSMutableDictionary setObject:forKeyedSubscript:]( v103,  "setObject:forKeyedSubscript:",  v94,  kMCPrivatePasscodeCharacteristicsKey);

            v92 = v111;
            v91 = v103;
          }

          goto LABEL_89;
        }

        uint64_t v95 = kMCPrivatePasscodeCharacteristicsKey;
        v96 = v91;
        id v97 = v108;
      }

      else
      {
        v92 = v111;
        uint64_t v95 = kMCPrivatePasscodeCharacteristicsKey;
        v96 = v91;
        id v97 = 0LL;
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:](v96, "setObject:forKeyedSubscript:", v97, v95);
LABEL_89:
      -[MCPasscodeManagerWriter _setPrivatePasscodeDict:](self, "_setPrivatePasscodeDict:", v91);
      v98 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManagerWriter sharedManager]( &OBJC_CLASS___MCRestrictionManagerWriter,  "sharedManager"));
      [v98 clearAllPasscodeComplianceCaches];

LABEL_90:
      v76 = (void *)objc_claimAutoreleasedReturnValue( -[MCPasscodeManagerWriter processPasscodeChangeWithOldPascodeGeneration:oldPublicDict:newPasscodeGeneration:newPublicDict:newPasscodeWasSet:]( self,  "processPasscodeChangeWithOldPascodeGeneration:oldPublicDict:newPasscodeGeneration:newPublicDict: newPasscodeWasSet:",  v92,  v112,  v114,  v120,  v115 != 0LL));
      if (v76)
      {
        v99 = _MCLogObjects[0];
        if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v127 = v76;
          _os_log_impl( (void *)&_mh_execute_header,  v99,  OS_LOG_TYPE_ERROR,  "Failed to process passcode change. Error: %{public}@",  buf,  0xCu);
        }
      }

      BYTE1(v100) = v110;
      LOBYTE(v100) = 0;
      +[MCPasscodeAnalytics sendPasscodeChangedEventWithChangeType:oldPasscodeExists:isClearingPasscode:newPasscodeUnlockScreenType:newPasscodeSimpleType:passcodeRecoverySupported:passcodeRecoveryRestricted:recoverySkipped:senderBundleID:]( &OBJC_CLASS___MCPasscodeAnalytics,  "sendPasscodeChangedEventWithChangeType:oldPasscodeExists:isClearingPasscode:newPasscodeUnlockScreenType:newPassc odeSimpleType:passcodeRecoverySupported:passcodeRecoveryRestricted:recoverySkipped:senderBundleID:",  1LL,  1LL,  v115 == 0LL,  v105,  v123,  1LL,  v100,  v14);
      if (v104) {
        +[MCPasscodeAnalytics sendRecoveryPasscodeClearedEventWithReason:]( &OBJC_CLASS___MCPasscodeAnalytics,  "sendRecoveryPasscodeClearedEventWithReason:",  1LL);
      }

      uint64_t v84 = v101;
      goto LABEL_96;
    }

    uint64_t v23 = MCPasscodeErrorDomain;
    uint64_t v24 = MCErrorArray(@"PASSCODE_ERROR_CANNOT_MODIFY");
    v20 = (void *)objc_claimAutoreleasedReturnValue(v24);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v23,  5014LL,  v20,  MCErrorTypeFatal,  0LL));
  }

  else
  {
    uint64_t v18 = MCPasscodeErrorDomain;
    uint64_t v19 = MCErrorArray(@"PASSCODE_ERROR_CANNOT_SET_PASSCODE_WITH_RECOVERY");
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSCocoaErrorDomain,  3328LL,  0LL,  0LL));
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:underlyingError:errorType:",  v18,  5014LL,  v20,  v21,  MCErrorTypeFatal));
  }

  if (!a7) {
    goto LABEL_16;
  }
LABEL_14:
  if (v22) {
    *a7 = v22;
  }
LABEL_16:

  return v22 == 0LL;
}

- (BOOL)clearPasscodeWithEscrowKeybagData:(id)a3 secret:(id)a4 senderBundleID:(id)a5 outError:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v40 = a5;
  int v39 = MCKeybagMementoBlobExists();
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[MDMCloudConfiguration sharedConfiguration]( &OBJC_CLASS___MDMCloudConfiguration,  "sharedConfiguration"));
  if ([v12 userMode] == 1)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](&OBJC_CLASS___UMUserManager, "sharedManager"));
    char v14 = [v13 isSharedIPad] ^ 1;
  }

  else
  {
    char v14 = 1;
  }

  if (MCGestaltHasSEP() && (v14 & 1) != 0)
  {
    uint64_t v15 = MCKeybagClearPasscodeGenerationCaches();
    MCSendClearPasscodeGenerationCachesNotification(v15);
    uint64_t v16 = MKBKeyBagChangeSystemSecretWithEscrow(v10, v11, 0LL, 1LL, 0LL);
    uint64_t v17 = MCKeybagClearPasscodeGenerationCaches();
    MCSendClearPasscodeGenerationCachesNotification(v17);
  }

  else
  {
    uint64_t v16 = MKBKeyBagChangeSystemSecretWithEscrow(v10, v11, 0LL, 1LL, 0LL);
  }

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](&OBJC_CLASS___MCRestrictionManagerWriter, "sharedManager"));
  if ((-[MCPasscodeManagerWriter isPasscodeSet](self, "isPasscodeSet") & 1) != 0)
  {
    id v19 = 0LL;
  }

  else
  {
    id v41 = 0LL;
    v20 = (void *)objc_claimAutoreleasedReturnValue( -[MCPasscodeManagerWriter _privatePasscodeDictWithOutError:]( self,  "_privatePasscodeDictWithOutError:",  &v41));
    id v19 = v41;
    id v21 = [v20 MCMutableDeepCopy];
    uint64_t v22 = v21;
    if (v21) {
      uint64_t v23 = (NSMutableDictionary *)v21;
    }
    else {
      uint64_t v23 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    }
    uint64_t v24 = v23;

    -[NSMutableDictionary setObject:forKeyedSubscript:]( v24,  "setObject:forKeyedSubscript:",  0LL,  kMCPrivatePasscodeCharacteristicsKey);
    id v25 = -[MCPasscodeManagerWriter _setPublicPasscodeDict:](self, "_setPublicPasscodeDict:", 0LL);
    -[MCPasscodeManagerWriter _setPrivatePasscodeDict:](self, "_setPrivatePasscodeDict:", v24);
    [v18 clearAllPasscodeComplianceCaches];
  }

  uint64_t v26 = _MCLogObjects[0];
  if ((_DWORD)v16)
  {
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v43 = v16;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Failed to clear passcode. Result: %d", buf, 8u);
    }

    uint64_t v27 = MCPasscodeErrorDomain;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v16));
    uint64_t v29 = MCErrorArray(@"PASSCODE_ERROR_CANNOT_CLEAR_PASSCODE_P_CODE");
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    uint64_t v31 = objc_claimAutoreleasedReturnValue( +[NSError MCErrorWithDomain:code:descriptionArray:errorType:]( &OBJC_CLASS___NSError,  "MCErrorWithDomain:code:descriptionArray:errorType:",  v27,  5013LL,  v30,  MCErrorTypeFatal,  v28,  0LL));

    id v19 = (id)v31;
    id v32 = v40;
  }

  else
  {
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Passcode cleared.", buf, 2u);
    }

    [v18 recomputeEffectiveUserSettingsPasscode:0];
    [v18 recomputeNagMetadata];
    [v18 notifyClientsToRecomputeCompliance];
    id v33 = -[MCPasscodeManagerWriter performSelectorOnMainThread:withObject:waitUntilDone:]( self,  "performSelectorOnMainThread:withObject:waitUntilDone:",  "_sendPasscodeChangedNotification",  0LL,  0LL);
    uint64_t v35 = MCKeybagMementoSupported(v33, v34);
    unsigned __int8 v36 = -[MCPasscodeManagerWriter isPasscodeRecoveryRestricted](self, "isPasscodeRecoveryRestricted");
    id v32 = v40;
    LOWORD(v38) = v36;
    +[MCPasscodeAnalytics sendPasscodeChangedEventWithChangeType:oldPasscodeExists:isClearingPasscode:newPasscodeUnlockScreenType:newPasscodeSimpleType:passcodeRecoverySupported:passcodeRecoveryRestricted:recoverySkipped:senderBundleID:]( &OBJC_CLASS___MCPasscodeAnalytics,  "sendPasscodeChangedEventWithChangeType:oldPasscodeExists:isClearingPasscode:newPasscodeUnlockScreenType:newPasscod eSimpleType:passcodeRecoverySupported:passcodeRecoveryRestricted:recoverySkipped:senderBundleID:",  2LL,  1LL,  1LL,  2LL,  0xFFFFFFFFLL,  v35,  v38,  v40);
    if (v39) {
      +[MCPasscodeAnalytics sendRecoveryPasscodeClearedEventWithReason:]( &OBJC_CLASS___MCPasscodeAnalytics,  "sendRecoveryPasscodeClearedEventWithReason:",  2LL);
    }
  }

  if (a6 && v19) {
    *a6 = v19;
  }

  return v19 == 0LL;
}

+ (BOOL)didPasscodePolicyChangeWithOldRestrictions:(id)a3 newRestrictions:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ((+[MCRestrictionManager restrictedBool:changedBetweenOldRestrictions:andNewRestrictions:]( &OBJC_CLASS___MCRestrictionManager,  "restrictedBool:changedBetweenOldRestrictions:andNewRestrictions:",  MCFeatureSimplePasscodeAllowed,  v5,  v6) & 1) != 0 || (+[MCRestrictionManager restrictedBool:changedBetweenOldRestrictions:andNewRestrictions:]( &OBJC_CLASS___MCRestrictionManager,  "restrictedBool:changedBetweenOldRestrictions:andNewRestrictions:",  MCFeaturePasscodeRequired,  v5,  v6) & 1) != 0 || (+[MCRestrictionManager restrictedBool:changedBetweenOldRestrictions:andNewRestrictions:]( &OBJC_CLASS___MCRestrictionManager,  "restrictedBool:changedBetweenOldRestrictions:andNewRestrictions:",  MCFeatureAlphanumericPasscodeRequired,  v5,  v6) & 1) != 0 || (+[MCRestrictionManager restrictedValue:changedBetweenOldRestrictions:andNewRestrictions:]( &OBJC_CLASS___MCRestrictionManager,  "restrictedValue:changedBetweenOldRestrictions:andNewRestrictions:",  MCFeatureMinimumPasscodeLength,  v5,  v6) & 1) != 0 || (+[MCRestrictionManager restrictedValue:changedBetweenOldRestrictions:andNewRestrictions:]( &OBJC_CLASS___MCRestrictionManager,  "restrictedValue:changedBetweenOldRestrictions:andNewRestrictions:",  MCFeaturePasscodeHistoryCount,  v5,  v6) & 1) != 0 || (+[MCRestrictionManager restrictedValue:changedBetweenOldRestrictions:andNewRestrictions:]( &OBJC_CLASS___MCRestrictionManager,  "restrictedValue:changedBetweenOldRestrictions:andNewRestrictions:",  MCFeatureMaximumFailedPasscodeAttempts,  v5,  v6) & 1) != 0 || (+[MCRestrictionManager restrictedValue:changedBetweenOldRestrictions:andNewRestrictions:]( &OBJC_CLASS___MCRestrictionManager,  "restrictedValue:changedBetweenOldRestrictions:andNewRestrictions:",  MCFeaturePasscodeMinimumComplexChars,  v5,  v6) & 1) != 0 || (+[MCRestrictionManager restrictedValue:changedBetweenOldRestrictions:andNewRestrictions:]( &OBJC_CLASS___MCRestrictionManager,  "restrictedValue:changedBetweenOldRestrictions:andNewRestrictions:",  MCFeatureMaximumPasscodeAgeDays,  v5,  v6) & 1) != 0 || (unsigned int v7 = +[MCPasscodeManager unlockScreenTypeForPasscodeCharacteristics:]( &OBJC_CLASS___MCPasscodeManager,
                             "unlockScreenTypeForPasscodeCharacteristics:",
                             v5),
        v7 != +[MCPasscodeManager unlockScreenTypeForPasscodeCharacteristics:]( &OBJC_CLASS___MCPasscodeManager,  "unlockScreenTypeForPasscodeCharacteristics:",  v6))
    || (+[MCRestrictionManager restrictedValue:changedBetweenOldRestrictions:andNewRestrictions:]( &OBJC_CLASS___MCRestrictionManager,  "restrictedValue:changedBetweenOldRestrictions:andNewRestrictions:",  MCFeatureAutoLockTime,  v5,  v6) & 1) != 0)
  {
    unsigned __int8 v8 = 1;
  }

  else
  {
    unsigned __int8 v8 = +[MCRestrictionManager restrictedValue:changedBetweenOldRestrictions:andNewRestrictions:]( &OBJC_CLASS___MCRestrictionManager,  "restrictedValue:changedBetweenOldRestrictions:andNewRestrictions:",  MCFeaturePasscodeLockGraceTime,  v5,  v6);
  }

  return v8;
}

- (void)resetPasscodeMetadata
{
}

- (void)updatePasscodeHistoryWithOldPasscode:(id)a3 oldPasscodeData:(id)a4 newPrivateDictionary:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](&OBJC_CLASS___MCRestrictionManager, "sharedManager"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 valueForFeature:MCFeaturePasscodeHistoryCount]);

  if ([v11 unsignedIntValue])
  {
    if ([v8 length])
    {
      uint64_t v32 = kMCPrivatePasscodeHistoryKey;
      id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:"));
      id v13 = [v12 mutableCopy];
      char v14 = v13;
      if (v13) {
        uint64_t v15 = (NSMutableArray *)v13;
      }
      else {
        uint64_t v15 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
      }
      uint64_t v17 = v15;

      unsigned int v18 = CCCalibratePBKDF(2u, (size_t)[v8 length], 4uLL, 3u, 0x20uLL, 0x64u);
      uint64_t v19 = kMCPrivatePasscodeHistoryMaxIterationsKey;
      v20 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:kMCPrivatePasscodeHistoryMaxIterationsKey]);
      unsigned int v21 = [v20 unsignedIntValue];

      if (v18 <= v21) {
        unsigned int v22 = v21;
      }
      else {
        unsigned int v22 = v18;
      }
      if (v22 <= 0x2710) {
        uint64_t v23 = 10000LL;
      }
      else {
        uint64_t v23 = v22;
      }
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v23));
      [v9 setObject:v24 forKeyedSubscript:v19];

      id v25 = (void *)objc_claimAutoreleasedReturnValue(+[MCPasscodeManagerWriter generateSalt](&OBJC_CLASS___MCPasscodeManagerWriter, "generateSalt"));
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[MCPasscodeManagerWriter hashForPasscode:usingMethod:salt:customIterations:]( &OBJC_CLASS___MCPasscodeManagerWriter,  "hashForPasscode:usingMethod:salt:customIterations:",  v7,  3LL,  v25,  v23));
      v34[0] = kMCPrivatePasscodeHistoryHashKey;
      v34[1] = kMCPrivatePasscodeHistorySaltKey;
      v35[0] = v26;
      v35[1] = v25;
      v35[2] = &off_1000CC0D0;
      v34[2] = kMCPrivatePasscodeHistoryHashMethodKey;
      v34[3] = kMCPrivatePasscodeHistoryIterationsKey;
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v23));
      v35[3] = v27;
      v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v35,  v34,  4LL));

      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](v17, "firstObject"));
      unsigned __int8 v30 = [v29 isEqualToDictionary:v28];

      if ((v30 & 1) == 0) {
        -[NSMutableArray insertObject:atIndex:](v17, "insertObject:atIndex:", v28, 0LL);
      }
      if ((unint64_t)-[NSMutableArray count](v17, "count") >= 0x65) {
        -[NSMutableArray removeObjectsInRange:]( v17,  "removeObjectsInRange:",  100LL,  (char *)-[NSMutableArray count](v17, "count") - 100);
      }
      uint64_t v31 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Old passcode added to history", buf, 2u);
      }

      [v9 setObject:v17 forKeyedSubscript:v32];
    }
  }

  else
  {
    uint64_t v16 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Passcode history removed", buf, 2u);
    }

    [v9 setObject:0 forKeyedSubscript:kMCPrivatePasscodeHistoryKey];
  }
}

- (void)clearPasscodeHistory
{
  if ((+[MCPasscodeManager isDeviceUnlocked](&OBJC_CLASS___MCPasscodeManager, "isDeviceUnlocked") & 1) == 0)
  {
    unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(+[MCPasscodeManager deviceLockedError](&OBJC_CLASS___MCPasscodeManager, "deviceLockedError"));
    if (v3)
    {
LABEL_5:
      os_log_t v6 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        unsigned int v21 = v3;
        id v7 = "Unable to clear passcode history. Error: %{public}@";
        id v8 = v6;
        os_log_type_t v9 = OS_LOG_TYPE_ERROR;
        uint32_t v10 = 12;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v8, v9, v7, buf, v10);
        goto LABEL_17;
      }

      goto LABEL_17;
    }
  }

  id v19 = 0LL;
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue( -[MCPasscodeManagerWriter _privatePasscodeDictWithOutError:]( self,  "_privatePasscodeDictWithOutError:",  &v19));
  id v4 = v19;
  if (v4)
  {
    id v5 = v4;

    unsigned int v3 = v5;
    goto LABEL_5;
  }

  uint64_t v11 = kMCPrivatePasscodeHistoryKey;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:kMCPrivatePasscodeHistoryKey]);

  if (!v12)
  {
    os_log_t v16 = _MCLogObjects[0];
    if (!os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    *(_WORD *)buf = 0;
    id v7 = "Passcode history already cleared";
    id v8 = v16;
    os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
    uint32_t v10 = 2;
    goto LABEL_7;
  }

  id v13 = [v3 MCMutableDeepCopy];
  char v14 = v13;
  if (v13) {
    uint64_t v15 = (NSMutableDictionary *)v13;
  }
  else {
    uint64_t v15 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  }
  uint64_t v17 = v15;

  -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", 0LL, v11);
  -[MCPasscodeManagerWriter _setPrivatePasscodeDict:](self, "_setPrivatePasscodeDict:", v17);
  unsigned int v18 = _MCLogObjects[0];
  if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Passcode history cleared", buf, 2u);
  }

LABEL_17:
}

- (id)clearRecoveryPasscode
{
  id v8 = 0LL;
  -[MCPasscodeManagerWriter clearRecoveryPasscodeOpaqueDataWithOutError:]( self,  "clearRecoveryPasscodeOpaqueDataWithOutError:",  &v8);
  id v2 = v8;
  unsigned int v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }

  else
  {
    uint64_t v5 = MCKeybagClearMementoBlob();
    id v4 = (id)objc_claimAutoreleasedReturnValue(v5);
  }

  os_log_t v6 = v4;

  return v6;
}

- (BOOL)clearRecoveryPasscodeOpaqueDataWithOutError:(id *)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCPasscodeManagerWriter _currentPublicPasscodeDict](self, "_currentPublicPasscodeDict"));
  if (v5)
  {
    uint64_t v6 = MCKeybagMementoPasscodeGeneration();
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    if (v7)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue( -[MCPasscodeManagerWriter _filterPublicPasscodeDict:forGeneration:]( self,  "_filterPublicPasscodeDict:forGeneration:",  v5,  v7));
      if (v8)
      {
        id v9 = [v5 MCMutableDeepCopy];
        uint32_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 stringValue]);
        [v9 setObject:0 forKeyedSubscript:v10];
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MCPasscodeManagerWriter _setPublicPasscodeDict:](self, "_setPublicPasscodeDict:", v9));
        id v12 = v11;
        BOOL v13 = v11 == 0LL;
        if (a3 && v11) {
          *a3 = v11;
        }
      }

      else
      {
        BOOL v13 = 0;
      }
    }

    else
    {
      BOOL v13 = 0;
    }
  }

  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (id)processPasscodeChangeWithOldPascodeGeneration:(id)a3 oldPublicDict:(id)a4 newPasscodeGeneration:(id)a5 newPublicDict:(id)a6 newPasscodeWasSet:(BOOL)a7
{
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  id v14 = a3;
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManagerWriter sharedManager](&OBJC_CLASS___MCRestrictionManagerWriter, "sharedManager"));
  [v15 recomputeNagMetadata];
  [v15 notifyClientsToRecomputeCompliance];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100070030;
  block[3] = &unk_1000C29D0;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
  os_log_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[MDMCloudConfiguration sharedConfiguration]( &OBJC_CLASS___MDMCloudConfiguration,  "sharedConfiguration"));
  v44 = self;
  if ([v16 userMode] == 1)
  {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](&OBJC_CLASS___UMUserManager, "sharedManager"));
    unsigned int v18 = [v17 isSharedIPad];
  }

  else
  {
    unsigned int v18 = 0;
  }

  int HasSEP = MCGestaltHasSEP();
  v20 = (void *)objc_claimAutoreleasedReturnValue([v14 stringValue]);

  unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue([v13 stringValue]);
  v45 = v11;
  if (!HasSEP || v18)
  {
    uint64_t v37 = kMCPublicPasscodeKeyboardTypeKey;
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:kMCPublicPasscodeKeyboardTypeKey]);
    unsigned __int8 v36 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v37]);
    uint64_t v38 = kMCPublicPasscodeSimpleTypeKey;
    v28 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:kMCPublicPasscodeSimpleTypeKey]);
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v38]);
    if (v18) {
      +[MCPasscodeManagerWriter setCurrentEphemeralUserPasscodeTypeFromUnlockScreenType:simplePasscodeType:]( &OBJC_CLASS___MCPasscodeManagerWriter,  "setCurrentEphemeralUserPasscodeTypeFromUnlockScreenType:simplePasscodeType:",  -[MCPasscodeManagerWriter unlockScreenTypeWithPublicPasscodeDict:isRecovery:]( v44,  "unlockScreenTypeWithPublicPasscodeDict:isRecovery:",  v12,  0LL,  v42),  -[MCPasscodeManagerWriter unlockSimplePasscodeTypeWithPublicPasscodeDict:isRecovery:]( v44,  "unlockSimplePasscodeTypeWithPublicPasscodeDict:isRecovery:",  v12,  0LL));
    }
  }

  else
  {
    unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v20]);
    uint64_t v23 = kMCPublicPasscodeKeyboardTypeKey;
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:kMCPublicPasscodeKeyboardTypeKey]);

    id v25 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v21]);
    uint64_t v43 = objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:v23]);

    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v20]);
    uint64_t v27 = kMCPublicPasscodeSimpleTypeKey;
    v28 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:kMCPublicPasscodeSimpleTypeKey]);

    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v21]);
    id v30 = v12;
    uint64_t v31 = v21;
    uint64_t v32 = v15;
    id v33 = v20;
    uint64_t v34 = v29;
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue([v29 objectForKeyedSubscript:v27]);

    v20 = v33;
    uint64_t v15 = v32;
    unsigned int v21 = v31;
    id v12 = v30;
    unsigned __int8 v36 = (void *)v43;
  }

  if (!v24
    || (unsigned int v39 = [v24 intValue], v39 != objc_msgSend(v36, "intValue"))
    || !v28
    || (unsigned int v40 = [v28 intValue], v40 != objc_msgSend(v35, "intValue")))
  {
    MCSendUnlockScreenTypeDidChangeNotification();
  }

  return 0LL;
}

- (void)migratePasscodeMetadata
{
  if (-[MCPasscodeManagerWriter isPasscodeSet](self, "isPasscodeSet"))
  {
    unsigned int v3 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Updating passcode metadata...", buf, 2u);
    }

    if ((+[MCPasscodeManager isDeviceUnlocked](&OBJC_CLASS___MCPasscodeManager, "isDeviceUnlocked") & 1) == 0)
    {
      id v4 = (id)objc_claimAutoreleasedReturnValue(+[MCPasscodeManager deviceLockedError](&OBJC_CLASS___MCPasscodeManager, "deviceLockedError"));
      if (v4) {
        goto LABEL_28;
      }
    }

    id v23 = 0LL;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[MCPasscodeManagerWriter _privatePasscodeDictWithOutError:]( self,  "_privatePasscodeDictWithOutError:",  &v23));
    id v4 = v23;
    if (!v4 && v5)
    {
      uint64_t v6 = kMCPrivatePasscodeCharacteristicsKey;
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:kMCPrivatePasscodeCharacteristicsKey]);
      if (v7)
      {
        uint64_t v8 = objc_claimAutoreleasedReturnValue(-[MCPasscodeManagerWriter _currentPublicPasscodeDict](self, "_currentPublicPasscodeDict"));
        id v9 = (void *)v8;
        if (v8)
        {
          uint64_t v10 = MCKeybagCurrentPasscodeGeneration(v8);
          id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
          id v12 = v11;
          if (v11)
          {
            id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 stringValue]);
            id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v13]);

            if (v14) {
              goto LABEL_12;
            }
            v20 = _MCLogObjects[0];
            if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Migrating public data...", buf, 2u);
            }

            unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue(-[MCPasscodeManagerWriter _fixUpPublicPasscodeDict:](self, "_fixUpPublicPasscodeDict:", v9));
            id v4 = (id)objc_claimAutoreleasedReturnValue(-[MCPasscodeManagerWriter _setPublicPasscodeDict:](self, "_setPublicPasscodeDict:", v21));

            if (!v4)
            {
LABEL_12:
              uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v13]);

              if (!v15)
              {
                os_log_t v16 = _MCLogObjects[0];
                if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Migrating private data...",  buf,  2u);
                }

                uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( -[MCPasscodeManagerWriter _fixUpPasscodeCharacteristics:]( self,  "_fixUpPasscodeCharacteristics:",  v7));
                id v18 = [v5 MCMutableDeepCopy];
                [v18 setObject:v17 forKeyedSubscript:v6];
                -[MCPasscodeManagerWriter _setPrivatePasscodeDict:](self, "_setPrivatePasscodeDict:", v18);
                id v19 = (void *)objc_claimAutoreleasedReturnValue( +[MCRestrictionManagerWriter sharedManager]( &OBJC_CLASS___MCRestrictionManagerWriter,  "sharedManager"));
                [v19 clearAllPasscodeComplianceCaches];
                [v19 recomputeNagMetadata];
              }

              id v4 = 0LL;
            }
          }

          else
          {
            id v4 = 0LL;
          }
        }

        else
        {
          id v4 = 0LL;
        }
      }

      else
      {
        id v4 = 0LL;
      }
    }

    if (v4)
    {
LABEL_28:
      unsigned int v22 = _MCLogObjects[0];
      if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v25 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "Unable to migrate passcode metadata. Error: %{public}@",  buf,  0xCu);
      }
    }
  }

@end