@interface ContextPluginACM
- (BOOL)_isEvent:(int64_t)a3 contributingToResult:(id)a4;
- (BOOL)_shouldAvoidRemovingCredentialType:(unsigned int)a3;
- (BOOL)_shouldFailOnAcmStatus:(int)a3 action:(id)a4 failureHandler:(id)a5;
- (BOOL)_shouldRetryEvaluationForError:(id)a3 options:(id)a4;
- (BOOL)_updateACMContextWithOptions:(id)a3 policy:(int64_t)a4 error:(id *)a5;
- (BOOL)_validatePassword:(int64_t)a3 options:(id)a4 uiDelegate:(id)a5 originator:(id)a6 request:(id)a7 callerName:(id)a8 callerBundleId:(id)a9 reply:(id)a10;
- (ContextPluginACM)initWithACMContext:(__ACMHandle *)a3 contextOwner:(BOOL)a4 module:(id)a5;
- (__ACMHandle)acmContext;
- (id)_acmParamForPolicy:(int64_t)a3 options:(id)a4 userId:(unsigned int)a5 secondPass:(BOOL)a6;
- (id)_decodeOperation:(id)a3;
- (id)_fillConstraint:(id)a3 options:(id)a4 userId:(id)a5 error:(id *)a6;
- (id)_operationAsString:(id)a3 error:(id *)a4;
- (id)_unsatisfiedListForRequirement:(__ACMRequirement *)a3;
- (id)_updateRecoveryRetryCountIfNeeded:(id)a3 request:(id)a4 userId:(id)a5;
- (unsigned)_credentialTypeForEvent:(int64_t)a3;
- (unsigned)_credentialTypeForRequirementType:(unsigned int)a3;
- (unsigned)_requirementTypeForCredentialType:(int64_t)a3;
- (unsigned)instanceId;
- (void)_evaluateACL:(id)a3 operation:(id)a4 options:(id)a5 uiDelegate:(id)a6 originator:(id)a7 request:(id)a8 callerName:(id)a9 callerBundleId:(id)a10 reply:(id)a11;
- (void)_evaluateCtkPolicy:(int64_t)a3 options:(id)a4 uiDelegate:(id)a5 originator:(id)a6 request:(id)a7 reply:(id)a8;
- (void)_evaluateOperation:(id)a3 aclRef:(id)a4 options:(id)a5 uiDelegate:(id)a6 originator:(id)a7 request:(id)a8 validate:(BOOL)a9 callerName:(id)a10 callerBundleId:(id)a11 reply:(id)a12;
- (void)_handleAcmRequirement:(const __ACMRequirement *)a3 policy:(int64_t)a4 constraintData:(id)a5 operation:(id)a6 internalInfo:(id)a7 uiDelegate:(id)a8 originator:(id)a9 request:(id)a10 reply:(id)a11;
- (void)_handleCTKACL:(id)a3 tokenId:(id)a4 operation:(id)a5 options:(id)a6 originator:(id)a7 request:(id)a8 callerName:(id)a9 callerBundleId:(id)a10 reply:(id)a11;
- (void)_releaseGracefully:(BOOL)a3;
- (void)_removeRequestedCredentials:(__ACMRequirement *)a3;
- (void)_setACMHelper:(id)a3;
- (void)_setAuthenticationManager:(id)a3;
- (void)_setMechanismManager:(id)a3;
- (void)_validateACL:(id)a3 evaluateOperation:(id)a4 options:(id)a5 uiDelegate:(id)a6 originator:(id)a7 request:(id)a8 callerName:(id)a9 callerBundleId:(id)a10 reply:(id)a11;
- (void)_validateOperation:(id)a3 aclRef:(id)a4 evaluateOperation:(id)a5 options:(id)a6 uiDelegate:(id)a7 originator:(id)a8 request:(id)a9 reply:(id)a10;
- (void)_validateOperations:(id)a3 aclRef:(id)a4 evaluateOperation:(id)a5 options:(id)a6 uiDelegate:(id)a7 originator:(id)a8 request:(id)a9 currentResult:(id)a10 reply:(id)a11;
- (void)_verifyACMPolicy:(char *)a3 acmParameter:(id)a4 maxGlobalCredentialAge:(unsigned int)a5 retryAllowed:(BOOL)a6 reply:(id)a7;
- (void)authMethodWithReply:(id)a3;
- (void)checkCredentialSatisfied:(int64_t)a3 policy:(int64_t)a4 reply:(id)a5;
- (void)credentialOfType:(int64_t)a3 originator:(id)a4 reply:(id)a5;
- (void)dealloc;
- (void)evaluateACL:(id)a3 operation:(id)a4 options:(id)a5 uiDelegate:(id)a6 originator:(id)a7 request:(id)a8 callerName:(id)a9 callerBundleId:(id)a10 reply:(id)a11;
- (void)evaluateACL:(id)a3 operation:(id)a4 options:(id)a5 uiDelegate:(id)a6 originator:(id)a7 request:(id)a8 reply:(id)a9;
- (void)evaluatePolicy:(int64_t)a3 options:(id)a4 uiDelegate:(id)a5 originator:(id)a6 request:(id)a7 reply:(id)a8;
- (void)externalizedContextWithReply:(id)a3;
- (void)finishedAuthenticationForPolicy:(int64_t)a3 constraintData:(id)a4 operation:(id)a5 internalInfo:(id)a6 uiDelegate:(id)a7 originator:(id)a8 request:(id)a9 availabilityEvents:(id)a10 result:(id)a11 error:(id)a12 reply:(id)a13;
- (void)forciblyInvalidate;
- (void)isCredentialSet:(int64_t)a3 originator:(id)a4 reply:(id)a5;
- (void)resetEvent:(int64_t)a3 originator:(id)a4 reply:(id)a5;
- (void)setCredential:(id)a3 type:(int64_t)a4 options:(id)a5 originator:(id)a6 reply:(id)a7;
- (void)verifyFileVaultUser:(id)a3 volumeUuid:(id)a4 options:(unint64_t)a5 reply:(id)a6;
@end

@implementation ContextPluginACM

- (ContextPluginACM)initWithACMContext:(__ACMHandle *)a3 contextOwner:(BOOL)a4 module:(id)a5
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___ContextPluginACM;
  v6 = -[ContextPluginACM initWithContextOwner:underlyingPtr:moduleRef:]( &v15,  "initWithContextOwner:underlyingPtr:moduleRef:",  a4,  a3,  a5);
  v7 = v6;
  if (v6)
  {
    v6->_acmContext = a3;
    v6->_instanceId = ACMContextGetTrackingNumber((uint64_t)a3);
    v8 = -[LAACMHelper initWithACMContext:]( objc_alloc(&OBJC_CLASS___LAACMHelper),  "initWithACMContext:",  v7->_acmContext);
    acmHelper = v7->_acmHelper;
    v7->_acmHelper = v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[MechanismManagerACM sharedInstance](&OBJC_CLASS___MechanismManagerACM, "sharedInstance"));
    mechanismManager = v7->_mechanismManager;
    v7->_mechanismManager = (MechanismManagerACM *)v10;

    uint64_t v12 = objc_claimAutoreleasedReturnValue(+[AuthenticationManager sharedInstance](&OBJC_CLASS___AuthenticationManager, "sharedInstance"));
    authenticationManager = v7->_authenticationManager;
    v7->_authenticationManager = (AuthenticationManager *)v12;
  }

  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ContextPluginACM;
  -[ContextPluginACM dealloc](&v3, "dealloc");
}

- (void)forciblyInvalidate
{
}

- (void)_releaseGracefully:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContextPluginACM module](self, "module"));
  if (v3) {
    v6 = "gracefully";
  }
  else {
    v6 = "forcibly";
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"released %s", v6));
  [v5 untrackPlugin:self reason:v7];

  acmContext = self->_acmContext;
  if (acmContext)
  {
    int TrackingNumber = ACMContextGetTrackingNumber((uint64_t)acmContext);
    id v10 = sub_5078();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    uint64_t v12 = v11;
    if (v3) {
      os_log_type_t v13 = OS_LOG_TYPE_INFO;
    }
    else {
      os_log_type_t v13 = OS_LOG_TYPE_ERROR;
    }
    if (os_log_type_enabled(v11, v13))
    {
      *(_DWORD *)buf = 67109634;
      int v19 = TrackingNumber;
      __int16 v20 = 2082;
      v21 = v6;
      __int16 v22 = 1024;
      unsigned int v23 = -[ContextPluginACM contextOwner](self, "contextOwner");
      _os_log_impl(&dword_0, v12, v13, "Deleting ACMContext:%u %{public}s, destroy:%d", buf, 0x18u);
    }

    int v14 = ACMContextDelete(self->_acmContext, (int)-[ContextPluginACM contextOwner](self, "contextOwner"));
    if (v14)
    {
      int v15 = v14;
      id v16 = sub_5078();
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
        sub_1FB7C(TrackingNumber, v15, v17);
      }
    }

    self->_acmContext = 0LL;
    -[LAACMHelper clear](self->_acmHelper, "clear");
  }

- (unsigned)instanceId
{
  return self->_instanceId;
}

- (id)_acmParamForPolicy:(int64_t)a3 options:(id)a4 userId:(unsigned int)a5 secondPass:(BOOL)a6
{
  v6 = (void *)objc_claimAutoreleasedReturnValue([a4 objectForKeyedSubscript:&off_29EE0]);
  v7 = v6;
  if (v6)
  {
    [v6 floatValue];
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[LAManagedACMParameters acmParameterWithTimeOffset:]( &OBJC_CLASS___LAManagedACMParameters,  "acmParameterWithTimeOffset:",  fmaxf((float)(600.0 - v8) * 1000.0, 0.0)));
    uint64_t v10 = objc_claimAutoreleasedReturnValue([0 acmParameterByAppendingACMParameters:v9]);
    v11 = (void *)v10;
    if (v10) {
      uint64_t v12 = (void *)v10;
    }
    else {
      uint64_t v12 = v9;
    }
    id v13 = v12;

    if (v13)
    {
      id v14 = sub_5078();
      int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138412290;
        id v18 = v13;
        _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "Will use ACM parameter: %@", (uint8_t *)&v17, 0xCu);
      }
    }
  }

  else
  {
    id v13 = 0LL;
  }

  return v13;
}

- (BOOL)_updateACMContextWithOptions:(id)a3 policy:(int64_t)a4 error:(id *)a5
{
  return *a5 == 0LL;
}

- (void)evaluatePolicy:(int64_t)a3 options:(id)a4 uiDelegate:(id)a5 originator:(id)a6 request:(id)a7 reply:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  objc_initWeak(location, v16);
  int v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v16 userId]));
  __int16 v20 = (void *)objc_claimAutoreleasedReturnValue( -[ContextPluginACM _updateRecoveryRetryCountIfNeeded:request:userId:]( self,  "_updateRecoveryRetryCountIfNeeded:request:userId:",  v14,  v17,  v19));
  v37 = v14;

  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472LL;
  v47[2] = sub_5640;
  v47[3] = &unk_284D8;
  v47[4] = self;
  id v21 = v20;
  id v48 = v21;
  id v22 = v17;
  id v49 = v22;
  v52[1] = (id)a3;
  id v23 = v15;
  id v50 = v23;
  objc_copyWeak(v52, location);
  id v24 = v18;
  id v51 = v24;
  v25 = objc_retainBlock(v47);
  if (a3 == 1009)
  {
    -[ContextPluginACM _evaluateCtkPolicy:options:uiDelegate:originator:request:reply:]( self,  "_evaluateCtkPolicy:options:uiDelegate:originator:request:reply:",  1009LL,  v21,  v23,  v16,  v22,  v25);
  }

  else
  {
    id v26 = +[LAACMHelper acmPolicyForPolicy:](&OBJC_CLASS___LAACMHelper, "acmPolicyForPolicy:", a3);
    if (v26)
    {
      uint64_t v27 = objc_claimAutoreleasedReturnValue([v21 objectForKey:&off_29EF8]);
      [(id)v27 doubleValue];
      double v29 = v28;
      id v34 = v26;

      v36 = (void *)objc_claimAutoreleasedReturnValue( -[ContextPluginACM _acmParamForPolicy:options:userId:secondPass:]( self,  "_acmParamForPolicy:options:userId:secondPass:",  a3,  v21,  [v16 userId],  0));
      id v46 = 0LL;
      LOBYTE(v27) = -[ContextPluginACM _updateACMContextWithOptions:policy:error:]( self,  "_updateACMContextWithOptions:policy:error:",  v21,  a3,  &v46);
      id v35 = v46;
      if ((v27 & 1) == 0)
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unable to set data on ACM context with error %@",  v35));
        v31 = (void *)objc_claimAutoreleasedReturnValue( +[LAErrorHelper parameterErrorWithMessage:]( &OBJC_CLASS___LAErrorHelper,  "parameterErrorWithMessage:",  v30));
        ((void (*)(void *, void, void *))v25[2])(v25, 0LL, v31);
      }

      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472LL;
      v38[2] = sub_5710;
      v38[3] = &unk_28500;
      v44 = v25;
      id v39 = v22;
      v40 = self;
      int64_t v45 = a3;
      id v41 = v16;
      id v42 = v21;
      id v43 = v23;
      -[ContextPluginACM _verifyACMPolicy:acmParameter:maxGlobalCredentialAge:retryAllowed:reply:]( self,  "_verifyACMPolicy:acmParameter:maxGlobalCredentialAge:retryAllowed:reply:",  v34,  v36,  (v29 * 1000.0),  1LL,  v38);

      v32 = v44;
      v33 = v35;
    }

    else
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
      v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Can't find ACM policy for: %@",  v36));
      v32 = (void *)objc_claimAutoreleasedReturnValue( +[LAErrorHelper parameterErrorWithMessage:]( &OBJC_CLASS___LAErrorHelper,  "parameterErrorWithMessage:",  v33));
      ((void (*)(void *, void, void *))v25[2])(v25, 0LL, v32);
    }
  }

  objc_destroyWeak(v52);
  objc_destroyWeak(location);
}

- (void)_evaluateCtkPolicy:(int64_t)a3 options:(id)a4 uiDelegate:(id)a5 originator:(id)a6 request:(id)a7 reply:(id)a8
{
  id v13 = a4;
  id v61 = a5;
  id v63 = a6;
  id v64 = a7;
  id v65 = a8;
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:&off_29F10]);
  if (v14)
  {
    uint64_t v81 = 0LL;
    v82 = &v81;
    uint64_t v83 = 0x2050000000LL;
    id v15 = (void *)qword_2CE48;
    uint64_t v84 = qword_2CE48;
    if (!qword_2CE48)
    {
      v76 = _NSConcreteStackBlock;
      uint64_t v77 = 3221225472LL;
      v78 = sub_BFBC;
      v79 = &unk_28AC0;
      v80 = &v81;
      sub_BFBC((uint64_t)&v76);
      id v15 = (void *)v82[3];
    }

    id v16 = v15;
    _Block_object_dispose(&v81, 8);
    uint64_t v81 = 0LL;
    v82 = &v81;
    uint64_t v83 = 0x2050000000LL;
    id v17 = (void *)qword_2CE58;
    uint64_t v84 = qword_2CE58;
    if (!qword_2CE58)
    {
      v76 = _NSConcreteStackBlock;
      uint64_t v77 = 3221225472LL;
      v78 = sub_C0C0;
      v79 = &unk_28AC0;
      v80 = &v81;
      sub_C0C0((uint64_t)&v76);
      id v17 = (void *)v82[3];
    }

    id v18 = v17;
    _Block_object_dispose(&v81, 8);
    v71[0] = _NSConcreteStackBlock;
    v71[1] = 3221225472LL;
    v71[2] = sub_6370;
    v71[3] = &unk_28528;
    id v19 = v65;
    id v73 = v19;
    id v20 = v14;
    id v72 = v20;
    id v74 = v16;
    id v75 = v18;
    v59 = objc_retainBlock(v71);
    if (self->_ctkPin)
    {
      v60 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  -[NSData bytes](self->_ctkPin, "bytes"),  -[NSData length](self->_ctkPin, "length"),  4LL);
      ((void (*)(void *, NSString *, void))v59[2])(v59, v60, 0LL);
LABEL_62:

      goto LABEL_63;
    }

    id v22 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:&off_29F58]);
    v55 = v22;
    if (v22)
    {
      v60 = v22;
      id v23 = (id)-[NSString intValue](v60, "intValue");
      if (v63) {
        [v63 auditToken];
      }
      else {
        memset(v70, 0, sizeof(v70));
      }
      id v69 = 0LL;
      v57 = (NSString *)objc_claimAutoreleasedReturnValue( +[DaemonUtils callerDisplayNameWithPid:auditToken:bundleId:]( &OBJC_CLASS___DaemonUtils,  "callerDisplayNameWithPid:auditToken:bundleId:",  v23,  v70,  &v69));
      v56 = (NSString *)v69;
    }

    else if (self->_ctkCallerSet)
    {
      v60 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  self->_ctkCallerProcessId));
      v57 = self->_ctkCallerName;
      v56 = self->_ctkCallerBundleId;
    }

    else
    {
      v56 = 0LL;
      v57 = 0LL;
      v60 = 0LL;
    }

    if (self->_ctkCallerSet)
    {
      if (v13) {
        id v24 = v13;
      }
      else {
        id v24 = &__NSDictionary0__struct;
      }
      v25 = (void *)objc_claimAutoreleasedReturnValue([v24 dictionaryByMergingWith:self->_ctkCallerOptions]);
      v62 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v25));
    }

    else
    {
      v62 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v13));
    }

    [v62 removeObjectForKey:&off_29F10];
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v20 authenticationError]);

    if (v26)
    {
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v20 authenticationError]);
      [v62 setObject:v27 forKeyedSubscript:&off_29F70];
    }

    id v51 = (void *)objc_claimAutoreleasedReturnValue([v62 objectForKeyedSubscript:&off_29F88]);
    v54 = (void *)objc_claimAutoreleasedReturnValue([v62 objectForKeyedSubscript:&off_29FA0]);
    v52 = (void *)objc_claimAutoreleasedReturnValue([v62 objectForKeyedSubscript:&off_29FB8]);
    v53 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue([v62 objectForKeyedSubscript:&off_29FD0]);
    if ((objc_opt_isKindOfClass(v20, v16) & 1) != 0)
    {
      double v28 = (void *)objc_claimAutoreleasedReturnValue([v20 PINFormat]);
      if (v28)
      {
        double v29 = v54;
        if (!v54)
        {
          uint64_t v30 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v28 minPINLength]));
          [v62 setObject:v30 forKey:&off_29FA0];
          double v29 = (void *)v30;
        }

        v54 = v29;
        if (!v52)
        {
          v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v28 maxPINLength]));
          [v62 setObject:v52 forKey:&off_29FB8];
          double v29 = v54;
        }

        if (!v53)
        {
          v53 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v28 charset]));
          [v62 setObject:v53 forKey:&off_29FD0];
          double v29 = v54;
        }
      }

      v31 = (void *)objc_claimAutoreleasedReturnValue([v20 localizedPINLabel]);

      if (v31)
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue([v20 localizedPINLabel]);
        [v62 setObject:v32 forKey:&off_29FE8];
      }
    }

    else
    {
      if ((objc_opt_isKindOfClass(v20, v18) & 1) == 0)
      {
        id v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unsupported auth operation: %@",  v20));
        id v42 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue( +[LAErrorHelper parameterErrorWithMessage:]( &OBJC_CLASS___LAErrorHelper,  "parameterErrorWithMessage:",  v35));
        (*((void (**)(id, void, NSMutableDictionary *))v19 + 2))(v19, 0LL, v42);
LABEL_61:

        goto LABEL_62;
      }

      if (!v53)
      {
        [v62 setObject:&off_2A000 forKey:&off_29FD0];
        v53 = &off_2A000;
      }

      v33 = (void *)objc_claimAutoreleasedReturnValue([v20 localizedPasswordLabel]);

      if (!v33)
      {
LABEL_44:
        id v34 = (void *)objc_claimAutoreleasedReturnValue( -[ContextPluginACM createInternalInfoWithPolicy:policyOptions:request:originator:]( self,  "createInternalInfoWithPolicy:policyOptions:request:originator:",  a3,  v62,  v64,  v63));
        id v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v34));

        if (v60)
        {
          [v35 setObject:v60 forKey:@"ProcessId"];
          if (!v57)
          {
            v36 = (void *)objc_claimAutoreleasedReturnValue(+[InstalledAppsCache sharedInstance](&OBJC_CLASS___InstalledAppsCache, "sharedInstance"));
            v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "binaryNameForPid:", -[NSString intValue](v60, "intValue")));

            if (v37) {
              [v35 setObject:v37 forKey:@"CallerName"];
            }

            goto LABEL_51;
          }
        }

        else if (!v57)
        {
LABEL_51:
          if (v56) {
            [v35 setObject:v56 forKey:@"CallerId"];
          }
          [v35 setObject:&__kCFBooleanTrue forKey:@"CTKPIN"];
          v38 = (void *)objc_claimAutoreleasedReturnValue([v64 payload]);
          id v39 = [v38 mutableCopy];
          v40 = v39;
          if (v39) {
            id v41 = (NSMutableDictionary *)v39;
          }
          else {
            id v41 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
          }
          id v42 = v41;

          -[NSMutableDictionary setObject:forKeyedSubscript:]( v42,  "setObject:forKeyedSubscript:",  v35,  LACEvaluationRequestPayloadKeyInternalInfo);
          [v64 updatePayload:v42];
          v85[0] = @"AcmContextRecord";
          id v43 = [[ACMContextRecord alloc] initWithACMContext:self->_acmContext cachedExternalizationDelegate:self];
          v85[1] = @"UserId";
          v86[0] = v43;
          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKeyedSubscript:"));
          v86[1] = v44;
          int64_t v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v86,  v85,  2LL));

          mechanismManager = self->_mechanismManager;
          id v68 = 0LL;
          v47 = (void *)objc_claimAutoreleasedReturnValue( -[MechanismManagerACM loadMechanism:initParams:request:className:error:]( mechanismManager,  "loadMechanism:initParams:request:className:error:",  1LL,  v45,  v64,  @"MechanismPassphrase",  &v68));
          id v48 = v68;
          if (v47)
          {
            id v49 = [[MechanismUI alloc] initWithNonUiMechanism:v47 eventProcessing:0 policy:a3 internalInfo:v35 request:v64];
            authenticationManager = self->_authenticationManager;
            v66[0] = _NSConcreteStackBlock;
            v66[1] = 3221225472LL;
            v66[2] = sub_64E4;
            v66[3] = &unk_28550;
            v67 = v59;
            -[AuthenticationManager authenticateForPolicy:constraintData:internalInfo:uiDelegate:originator:request:mechanism:reply:]( authenticationManager,  "authenticateForPolicy:constraintData:internalInfo:uiDelegate:originator:request:mechanism:reply:",  a3,  0LL,  v35,  v61,  v63,  v64,  v49,  v66);
          }

          else
          {
            ((void (*)(void *, void, id))v59[2])(v59, 0LL, v48);
          }

          goto LABEL_61;
        }

        [v35 setObject:v57 forKey:@"CallerName"];
        goto LABEL_51;
      }

      double v28 = (void *)objc_claimAutoreleasedReturnValue([v20 localizedPasswordLabel]);
      [v62 setObject:v28 forKey:&off_29FE8];
    }

    goto LABEL_44;
  }

  id v21 = (void *)objc_claimAutoreleasedReturnValue( +[LAErrorHelper parameterErrorWithMessage:]( &OBJC_CLASS___LAErrorHelper,  "parameterErrorWithMessage:",  @"Missing auth operation."));
  (*((void (**)(id, void, void *))v65 + 2))(v65, 0LL, v21);

LABEL_63:
}

- (void)_verifyACMPolicy:(char *)a3 acmParameter:(id)a4 maxGlobalCredentialAge:(unsigned int)a5 retryAllowed:(BOOL)a6 reply:(id)a7
{
  uint64_t v7 = *(void *)&a5;
  id v11 = a7;
  acmHelper = self->_acmHelper;
  id v13 = a4;
  id v14 = [v13 acmParameters];
  id v15 = [v13 count];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_6670;
  v17[3] = &unk_28578;
  id v18 = v11;
  id v19 = a3;
  id v16 = v11;
  -[LAACMHelper preflightPolicy:parameters:parametersCount:maxGlobalCredentialAge:processRequirement:]( acmHelper,  "preflightPolicy:parameters:parametersCount:maxGlobalCredentialAge:processRequirement:",  a3,  v14,  v15,  v7,  v17);
}

- (void)verifyFileVaultUser:(id)a3 volumeUuid:(id)a4 options:(unint64_t)a5 reply:(id)a6
{
  id v7 = a6;
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[LAErrorHelper errorNotSupported](&OBJC_CLASS___LAErrorHelper, "errorNotSupported"));
  (*((void (**)(id, void, id))a6 + 2))(v7, 0LL, v8);
}

- (BOOL)_shouldRetryEvaluationForError:(id)a3 options:(id)a4
{
  return 0;
}

- (id)_updateRecoveryRetryCountIfNeeded:(id)a3 request:(id)a4 userId:(id)a5
{
  return a3;
}

- (void)_handleAcmRequirement:(const __ACMRequirement *)a3 policy:(int64_t)a4 constraintData:(id)a5 operation:(id)a6 internalInfo:(id)a7 uiDelegate:(id)a8 originator:(id)a9 request:(id)a10 reply:(id)a11
{
  id v16 = a5;
  id v31 = a6;
  id v33 = a7;
  id v17 = a8;
  id v18 = a9;
  id v19 = a10;
  id v20 = a11;
  objc_initWeak(location, v18);
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472LL;
  v43[2] = sub_6A64;
  v43[3] = &unk_285C8;
  id v30 = v20;
  id v44 = v30;
  id v21 = objc_retainBlock(v43);
  id v22 = [[ACMContextRecord alloc] initWithACMContext:self->_acmContext cachedExternalizationDelegate:self];
  mechanismManager = self->_mechanismManager;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_6CD8;
  v34[3] = &unk_28680;
  id v24 = v17;
  id v35 = v24;
  v25 = v21;
  id v41 = v25;
  v36 = self;
  v42[1] = (id)a4;
  id v29 = v16;
  id v37 = v29;
  id v26 = v18;
  id v38 = v26;
  id v27 = v19;
  id v39 = v27;
  id v28 = v31;
  id v40 = v28;
  objc_copyWeak(v42, location);
  -[MechanismManagerACM mechanismForACMRequirement:acmContextRecord:policy:internalInfo:uiDelegate:originator:request:reply:]( mechanismManager,  "mechanismForACMRequirement:acmContextRecord:policy:internalInfo:uiDelegate:originator:request:reply:",  a3,  v22,  a4,  v33,  v24,  v26,  v27,  v34);
  objc_destroyWeak(v42);

  objc_destroyWeak(location);
}

- (id)_unsatisfiedListForRequirement:(__ACMRequirement *)a3
{
  if (ACMRequirementGetType(a3, v5) == 7)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_7194;
    v13[3] = &unk_286A8;
    v13[4] = self;
    id v14 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    id v8 = v14;
    ACMRequirementGetSubrequirements((int *)a3, (uint64_t)v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v8, "componentsJoinedByString:", @", "));

    return v9;
  }

  else
  {
    uint64_t Type = ACMRequirementGetType(a3, v7);
    uint64_t v12 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%d:%d",  Type,  ACMRequirementGetState(a3, v11));
    return (id)objc_claimAutoreleasedReturnValue(v12);
  }

- (void)finishedAuthenticationForPolicy:(int64_t)a3 constraintData:(id)a4 operation:(id)a5 internalInfo:(id)a6 uiDelegate:(id)a7 originator:(id)a8 request:(id)a9 availabilityEvents:(id)a10 result:(id)a11 error:(id)a12 reply:(id)a13
{
  id v56 = a4;
  id v55 = a5;
  id v53 = a6;
  id v18 = a7;
  id v54 = a8;
  id v19 = a9;
  id v20 = a10;
  id v21 = a11;
  id v22 = a12;
  id v23 = a13;
  objc_initWeak(location, self);
  v72[0] = _NSConcreteStackBlock;
  v72[1] = 3221225472LL;
  v72[2] = sub_76E0;
  v72[3] = &unk_28718;
  id v24 = v18;
  id v73 = v24;
  id v25 = v20;
  id v74 = v25;
  objc_copyWeak(&v77, location);
  id v75 = self;
  id v26 = v23;
  id v76 = v26;
  id v27 = objc_retainBlock(v72);
  id v28 = v27;
  v52 = v19;
  if (!v21)
  {
    ((void (*)(void *, void, id))v27[2])(v27, 0LL, v22);
    id v31 = v53;
    goto LABEL_7;
  }

  id v46 = v26;
  id v47 = v25;
  id v49 = v22;
  v62[0] = _NSConcreteStackBlock;
  v62[1] = 3221225472LL;
  v62[2] = sub_792C;
  v62[3] = &unk_28740;
  id v29 = v27;
  v62[4] = self;
  id v70 = v29;
  int64_t v71 = a3;
  id v30 = v55;
  id v63 = v30;
  id v48 = v21;
  id v64 = v21;
  id v31 = v53;
  id v32 = v53;
  id v65 = v32;
  id v66 = v19;
  id v33 = v56;
  id v67 = v33;
  id v68 = v24;
  id v69 = v54;
  id v51 = objc_retainBlock(v62);
  id v34 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKey:@"GlobalCredential"]);
  unsigned int v45 = [v34 unsignedIntValue];

  if (a3)
  {
    id v35 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKeyedSubscript:@"UserId"]);
    id v36 = [v35 unsignedIntValue];

    id v37 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKeyedSubscript:@"Options"]);
    id v38 = (id)objc_claimAutoreleasedReturnValue( -[ContextPluginACM _acmParamForPolicy:options:userId:secondPass:]( self,  "_acmParamForPolicy:options:userId:secondPass:",  a3,  v37,  v36,  1LL));

    acmHelper = self->_acmHelper;
    id v40 = +[LAACMHelper acmPolicyForPolicy:](&OBJC_CLASS___LAACMHelper, "acmPolicyForPolicy:", a3);
    id v41 = [v38 acmParameters];
    id v42 = [v38 count];
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472LL;
    v60[2] = sub_7CCC;
    v60[3] = &unk_28768;
    id v61 = v51;
    -[LAACMHelper preflightPolicy:parameters:parametersCount:maxGlobalCredentialAge:processRequirement:]( acmHelper,  "preflightPolicy:parameters:parametersCount:maxGlobalCredentialAge:processRequirement:",  v40,  v41,  v42,  v45,  v60);
    id v43 = v61;
  }

  else
  {
    if (!v33)
    {
      id v38 = (id)objc_claimAutoreleasedReturnValue( +[LAErrorHelper internalErrorWithMessage:]( &OBJC_CLASS___LAErrorHelper,  "internalErrorWithMessage:",  @"Unexpected result type."));
      ((void (*)(void *, void, id))v29[2])(v29, 0LL, v38);
      goto LABEL_5;
    }

    id v59 = 0LL;
    id v43 = (void *)objc_claimAutoreleasedReturnValue(-[ContextPluginACM _operationAsString:error:](self, "_operationAsString:error:", v30, &v59));
    id v38 = v59;
    if (v43)
    {
      id v44 = self->_acmHelper;
      v57[0] = _NSConcreteStackBlock;
      v57[1] = 3221225472LL;
      v57[2] = sub_7CF0;
      v57[3] = &unk_28790;
      v58 = v51;
      -[LAACMHelper verifyAclConstraint:operation:preflight:parameters:parametersCount:maxGlobalCredentialAge:processRequirement:]( v44,  "verifyAclConstraint:operation:preflight:parameters:parametersCount:maxGlobalCredentialAge:processRequirement:",  v33,  v43,  1LL,  0LL,  0LL,  v45,  v57);
    }

    else
    {
      ((void (*)(void *, void, id))v29[2])(v29, 0LL, v49);
    }
  }

LABEL_5:
  id v25 = v47;
  id v21 = v48;
  id v22 = v49;
  id v26 = v46;
LABEL_7:

  objc_destroyWeak(&v77);
  objc_destroyWeak(location);
}

- (BOOL)_isEvent:(int64_t)a3 contributingToResult:(id)a4
{
  else {
    uint64_t v4 = qword_223E0[a3 - 2];
  }
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v4));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v6]);

  LOBYTE(v5) = [v7 BOOLValue];
  return (char)v5;
}

- (BOOL)_shouldFailOnAcmStatus:(int)a3 action:(id)a4 failureHandler:(id)a5
{
  v6 = *(void **)&a3;
  id v8 = a4;
  v9 = (void (**)(id, void, uint64_t))a5;
  if ((int)v6 <= -4)
  {
    if ((_DWORD)v6 == -21)
    {
      uint64_t v10 = @"Pay is Locked";
      uint64_t v11 = -1LL;
      uint64_t v12 = 23LL;
      goto LABEL_9;
    }

    if ((_DWORD)v6 == -14)
    {
      uint64_t v10 = @"Not available";
      uint64_t v11 = -1020LL;
      uint64_t v12 = 0LL;
LABEL_9:
      uint64_t v13 = objc_claimAutoreleasedReturnValue( +[LAErrorHelper errorWithCode:subcode:message:]( &OBJC_CLASS___LAErrorHelper,  "errorWithCode:subcode:message:",  v11,  v12,  v10));
LABEL_10:
      v6 = (void *)v13;
      v9[2](v9, 0LL, v13);
LABEL_14:

      LOBYTE(v6) = 1;
      goto LABEL_15;
    }

- (unsigned)_credentialTypeForRequirementType:(unsigned int)a3
{
  int v3 = a3;
  switch(a3)
  {
    case 0xBu:
      int v3 = 5;
      break;
    case 0xCu:
      int v3 = 6;
      break;
    case 0xDu:
      int v3 = 7;
      break;
    case 0xEu:
      int v3 = 8;
      break;
    case 0xFu:
      int v3 = 9;
      break;
    case 0x10u:
    case 0x11u:
    case 0x12u:
    case 0x14u:
    case 0x15u:
    case 0x16u:
    case 0x17u:
    case 0x18u:
    case 0x19u:
    case 0x1Au:
      goto LABEL_4;
    case 0x13u:
      int v3 = 16;
      break;
    case 0x1Bu:
      int v3 = 23;
      break;
    default:
      if (a3 - 1 >= 3)
      {
LABEL_4:
        id v4 = sub_5078();
        id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
          sub_1FC00(v3, v5);
        }

        int v3 = 0;
      }

      break;
  }

  return v3;
}

- (void)_removeRequestedCredentials:(__ACMRequirement *)a3
{
  uint64_t Type = ACMRequirementGetType(a3, a2);
  if ((_DWORD)Type == 7)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_80DC;
    v16[3] = &unk_287B8;
    v16[4] = self;
    ACMRequirementGetSubrequirements((int *)a3, (uint64_t)v16);
  }

  else
  {
    uint64_t v7 = Type;
    if (ACMRequirementGetState(a3, v6) == 1)
    {
      uint64_t v8 = -[ContextPluginACM _credentialTypeForRequirementType:](self, "_credentialTypeForRequirementType:", v7);
      if ((_DWORD)v8)
      {
        uint64_t v9 = v8;
        acmHelper = self->_acmHelper;
        id v15 = 0LL;
        unsigned __int8 v11 = -[LAACMHelper removeCredentialsOfType:error:]( acmHelper,  "removeCredentialsOfType:error:",  v9,  &v15);
        id v12 = v15;
        if ((v11 & 1) == 0)
        {
          id v13 = sub_5078();
          id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            sub_1FC74((uint64_t)v12, v7, v14);
          }
        }
      }

      else
      {
        id v12 = 0LL;
      }
    }
  }

- (id)_decodeOperation:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    id v5 = (char *)[v3 integerValue];
    switch((unint64_t)v5)
    {
      case 0uLL:
      case 2uLL:
        uint64_t v6 = &stru_291A0;
        goto LABEL_13;
      case 1uLL:
      case 4uLL:
        uint64_t v8 = &off_28D60;
        goto LABEL_11;
      case 3uLL:
        uint64_t v8 = &off_28D80;
        goto LABEL_11;
      case 5uLL:
        uint64_t v8 = &off_28DA0;
LABEL_11:
        uint64_t v7 = *v8;
        goto LABEL_12;
      default:
        if (v5 == stru_3D8.segname) {
          uint64_t v6 = @"oacl";
        }
        else {
          uint64_t v6 = 0LL;
        }
        goto LABEL_13;
    }
  }

  uint64_t v7 = (__CFString *)v3;
LABEL_12:
  uint64_t v6 = v7;
LABEL_13:

  return v6;
}

- (void)evaluateACL:(id)a3 operation:(id)a4 options:(id)a5 uiDelegate:(id)a6 originator:(id)a7 request:(id)a8 reply:(id)a9
{
  id v35 = a3;
  id v14 = a4;
  id v15 = a5;
  id v32 = a6;
  id v16 = a7;
  id v33 = a8;
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472LL;
  id v52[2] = sub_851C;
  v52[3] = &unk_28550;
  id v31 = a9;
  id v53 = v31;
  id v34 = objc_retainBlock(v52);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:&off_2A030]);
  LOBYTE(a6) = [v17 BOOLValue];

  if ((a6 & 1) != 0)
  {
    id v18 = 0LL;
    id v19 = 0LL;
  }

  else
  {
    id v20 = [v16 processId];
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:&off_2A048]);
    if (v21
      && [v16 checkEntitlement:@"com.apple.private.LocalAuthentication.CallerPID"])
    {
      id v20 = [v21 intValue];
    }

    if (v16) {
      [v16 auditToken];
    }
    else {
      memset(v51, 0, sizeof(v51));
    }
    id v50 = 0LL;
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[DaemonUtils callerDisplayNameWithPid:auditToken:bundleId:]( &OBJC_CLASS___DaemonUtils,  "callerDisplayNameWithPid:auditToken:bundleId:",  v20,  v51,  &v50));
    id v19 = v50;
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:&off_2A060]);
    if (v22
      && [v16 checkEntitlement:@"com.apple.private.LocalAuthentication.CallerName"])
    {
      id v23 = v22;

      id v18 = v23;
    }
  }

  objc_initWeak(&location, v16);
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472LL;
  v38[2] = sub_8594;
  v38[3] = &unk_28808;
  id v24 = v14;
  id v39 = v24;
  id v40 = self;
  id v25 = v35;
  id v41 = v25;
  id v26 = v15;
  id v42 = v26;
  id v27 = v32;
  id v43 = v27;
  objc_copyWeak(&v48, &location);
  id v28 = v33;
  id v44 = v28;
  id v29 = v18;
  id v45 = v29;
  id v30 = v19;
  id v46 = v30;
  id v36 = v34;
  id v47 = v36;
  -[ContextPluginACM evaluateACL:operation:options:uiDelegate:originator:request:callerName:callerBundleId:reply:]( self,  "evaluateACL:operation:options:uiDelegate:originator:request:callerName:callerBundleId:reply:",  v25,  v24,  v26,  v27,  v16,  v28,  v29,  v30,  v38);

  objc_destroyWeak(&v48);
  objc_destroyWeak(&location);
}

- (void)_handleCTKACL:(id)a3 tokenId:(id)a4 operation:(id)a5 options:(id)a6 originator:(id)a7 request:(id)a8 callerName:(id)a9 callerBundleId:(id)a10 reply:(id)a11
{
  id v35 = a3;
  id v38 = a4;
  id v36 = a5;
  id v32 = a6;
  id v37 = a7;
  id v17 = a8;
  id v33 = a9;
  id v34 = a10;
  id v18 = a11;
  id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 log]);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v38;
    _os_log_impl( &dword_0,  v19,  OS_LOG_TYPE_DEFAULT,  "%{public}@ handles CTK request using tokenId:%{public}@",  buf,  0x16u);
  }

  id v20 = objc_alloc(&OBJC_CLASS___LAContext);
  id v21 = (void *)objc_claimAutoreleasedReturnValue(-[ContextPluginACM cachedExternalizedContext](self, "cachedExternalizedContext"));
  id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 externalizedContext]);
  id v23 = -[LAContext initWithExternalizedContext:](v20, "initWithExternalizedContext:", v22);

  uint64_t v47 = 0LL;
  id v48 = &v47;
  uint64_t v49 = 0x2050000000LL;
  id v24 = (void *)qword_2CE60;
  uint64_t v50 = qword_2CE60;
  if (!qword_2CE60)
  {
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472LL;
    *(void *)&buf[16] = sub_C114;
    v52 = &unk_28AC0;
    id v53 = &v47;
    sub_C114((uint64_t)buf);
    id v24 = (void *)v48[3];
  }

  id v25 = v24;
  _Block_object_dispose(&v47, 8);
  id v26 = [[v25 alloc] initWithTokenID:v38];
  id v46 = 0LL;
  id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 sessionWithLAContext:v23 error:&v46]);
  id v28 = v46;

  if (v27)
  {
    CFRetain(v27);
    self->_ctkCallerSet = 1;
    objc_storeStrong((id *)&self->_ctkCallerOptions, a6);
    self->_ctkCallerProcessId = objc_msgSend(v37, "processId", v32, v33, v34);
    objc_storeStrong((id *)&self->_ctkCallerName, a9);
    objc_storeStrong((id *)&self->_ctkCallerBundleId, a10);
    id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 log]);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v29, OS_LOG_TYPE_INFO, "TKClientTokenSession created successfully.", buf, 2u);
    }

    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    id v31 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_8BE0;
    block[3] = &unk_28830;
    id v40 = v27;
    id v41 = v35;
    id v42 = v36;
    id v43 = self;
    id v45 = v18;
    id v44 = v17;
    dispatch_async(v31, block);
  }

  else
  {
    (*((void (**)(id, void, id))v18 + 2))(v18, 0LL, v28);
  }
}

- (void)evaluateACL:(id)a3 operation:(id)a4 options:(id)a5 uiDelegate:(id)a6 originator:(id)a7 request:(id)a8 callerName:(id)a9 callerBundleId:(id)a10 reply:(id)a11
{
  id v17 = a3;
  id v18 = a4;
  id v39 = a5;
  id v38 = a6;
  id v40 = a7;
  id v43 = a8;
  id v41 = a9;
  id v42 = a10;
  id v19 = a11;
  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[ContextPluginACM _decodeOperation:](self, "_decodeOperation:", v18));
  if (v20)
  {
    uint64_t v54 = 0LL;
    uint64_t v21 = SecAccessControlCreateFromData(kCFAllocatorDefault, v17, &v54);
    id v22 = (void *)v21;
    if (v21)
    {
      uint64_t Protection = SecAccessControlGetProtection(v21);
      id v24 = (void *)objc_claimAutoreleasedReturnValue(Protection);
      uint64_t v25 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v24, v25) & 1) != 0)
      {
        *(void *)&__int128 buf = 0LL;
        *((void *)&buf + 1) = &buf;
        uint64_t v56 = 0x2020000000LL;
        id v26 = (id *)qword_2CE68;
        uint64_t v57 = qword_2CE68;
        if (!qword_2CE68)
        {
          id v27 = (void *)sub_C010();
          id v26 = (id *)dlsym(v27, "TKAccessControlProtectionTokenIDKey");
          *(void *)(*((void *)&buf + 1) + 24LL) = v26;
          qword_2CE68 = (uint64_t)v26;
        }

        _Block_object_dispose(&buf, 8);
        if (!v26)
        {
          sub_1FCF8();
          __break(1u);
        }

        id v28 = *v26;
        id v29 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKey:v28]);

        id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue([v43 log]);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138543362;
          *(void *)((char *)&buf + 4) = v29;
          _os_log_impl( &dword_0,  v30,  OS_LOG_TYPE_DEFAULT,  "ACL is protected by TKToken: %{public}@",  (uint8_t *)&buf,  0xCu);
        }

        dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
        id v32 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_91CC;
        block[3] = &unk_28880;
        void block[4] = self;
        id v45 = v17;
        id v46 = v29;
        id v47 = v20;
        id v48 = v39;
        id v49 = v40;
        id v50 = v43;
        id v51 = v41;
        id v52 = v42;
        id v53 = v19;
        id v33 = v29;
        dispatch_async(v32, block);
      }

      else
      {
        id v37 = (os_log_s *)objc_claimAutoreleasedReturnValue([v43 log]);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          LODWORD(buf) = 138543362;
          *(void *)((char *)&buf + 4) = v24;
          _os_log_impl(&dword_0, v37, OS_LOG_TYPE_INFO, "ACL protection: %{public}@", (uint8_t *)&buf, 0xCu);
        }

        if ([v20 isEqualToString:&stru_291A0]) {
          -[ContextPluginACM _validateACL:evaluateOperation:options:uiDelegate:originator:request:callerName:callerBundleId:reply:]( self,  "_validateACL:evaluateOperation:options:uiDelegate:originator:request:callerName:callerBundleId:reply:",  v22,  v20,  v39,  v38,  v40,  v43,  v41,  v42,  v19);
        }
        else {
          -[ContextPluginACM _evaluateACL:operation:options:uiDelegate:originator:request:callerName:callerBundleId:reply:]( self,  "_evaluateACL:operation:options:uiDelegate:originator:request:callerName:callerBundleId:reply:",  v22,  v20,  v39,  v38,  v40,  v43,  v41,  v42,  v19);
        }
      }
    }

    else
    {
      id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid ACL: '%@'",  v17));
      id v36 = (void *)objc_claimAutoreleasedReturnValue( +[LAErrorHelper parameterErrorWithMessage:]( &OBJC_CLASS___LAErrorHelper,  "parameterErrorWithMessage:",  v24));
      (*((void (**)(id, void, void *))v19 + 2))(v19, 0LL, v36);
    }
  }

  else
  {
    id v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid operation: %@",  v18));
    id v35 = (void *)objc_claimAutoreleasedReturnValue( +[LAErrorHelper parameterErrorWithMessage:]( &OBJC_CLASS___LAErrorHelper,  "parameterErrorWithMessage:",  v34));
    (*((void (**)(id, void, void *))v19 + 2))(v19, 0LL, v35);
  }
}

- (void)_evaluateACL:(id)a3 operation:(id)a4 options:(id)a5 uiDelegate:(id)a6 originator:(id)a7 request:(id)a8 callerName:(id)a9 callerBundleId:(id)a10 reply:(id)a11
{
  id v16 = a3;
  id v33 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  objc_initWeak(location, v19);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_9574;
  v34[3] = &unk_288D0;
  id v31 = v23;
  id v42 = v31;
  id v24 = v16;
  id v35 = v24;
  id v36 = self;
  id v25 = v17;
  id v37 = v25;
  id v26 = v18;
  id v38 = v26;
  objc_copyWeak(&v43, location);
  id v27 = v20;
  id v39 = v27;
  id v28 = v21;
  id v40 = v28;
  id v29 = v22;
  id v41 = v29;
  LOBYTE(v30) = 0;
  -[ContextPluginACM _evaluateOperation:aclRef:options:uiDelegate:originator:request:validate:callerName:callerBundleId:reply:]( self,  "_evaluateOperation:aclRef:options:uiDelegate:originator:request:validate:callerName:callerBundleId:reply:",  v33,  v24,  v25,  v26,  v19,  v27,  v30,  v28,  v29,  v34);

  objc_destroyWeak(&v43);
  objc_destroyWeak(location);
}

- (id)_fillConstraint:(id)a3 options:(id)a4 userId:(id)a5 error:(id *)a6
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_9778;
  v10[3] = &unk_288F0;
  v10[4] = a6;
  uint64_t v6 = objc_retainBlock(v10);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v8 = (id)((uint64_t (*)(void *, void))v6[2])(v6, 0LL);

  return v7;
}

- (void)_evaluateOperation:(id)a3 aclRef:(id)a4 options:(id)a5 uiDelegate:(id)a6 originator:(id)a7 request:(id)a8 validate:(BOOL)a9 callerName:(id)a10 callerBundleId:(id)a11 reply:(id)a12
{
  id v18 = a3;
  id v19 = a4;
  id v69 = a5;
  id v67 = a6;
  id v20 = a7;
  id v21 = a8;
  id v68 = a10;
  id v22 = a11;
  id v23 = (void (**)(id, void *, void))a12;
  id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue([v21 log]);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138543618;
    *(void *)&uint8_t buf[4] = self;
    __int16 v93 = 2114;
    id v94 = v18;
    _os_log_impl(&dword_0, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ evaluates operation: %{public}@", buf, 0x16u);
  }

  if (![v18 isEqualToString:&stru_291A0])
  {
    id v66 = v22;
    id v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v20 userId]));
    id v28 = (void *)objc_claimAutoreleasedReturnValue( -[ContextPluginACM _updateRecoveryRetryCountIfNeeded:request:userId:]( self,  "_updateRecoveryRetryCountIfNeeded:request:userId:",  v69,  v21,  v27));

    Constraint = (const void *)SecAccessControlGetConstraint(v19, v18);
    if (!Constraint)
    {
      if (a9)
      {
        v23[2](v23, &__NSDictionary0__struct, 0LL);
      }

      else
      {
        id v35 = v28;
        id v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ACL operation is not allowed: '%@'",  v18));
        id v37 = (void *)objc_claimAutoreleasedReturnValue( +[LAErrorHelper errorWithCode:message:]( &OBJC_CLASS___LAErrorHelper,  "errorWithCode:message:",  -1009LL,  v36));
        ((void (**)(id, void *, void *))v23)[2](v23, 0LL, v37);

        id v28 = v35;
      }

      id v25 = v67;
      id v26 = v68;
      id v22 = v66;
      goto LABEL_35;
    }

    uint64_t v30 = (void *)CFRetain(Constraint);
    uint64_t v31 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    id v64 = v30;
    id v65 = v28;
    id v62 = v20;
    if ((objc_opt_isKindOfClass(v30, v31) & 1) != 0)
    {
      id v32 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKeyedSubscript:&off_2A078]);
      id v33 = v32;
      if (v32) {
        id v34 = v32;
      }
      else {
        id v34 = (id)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v20 userId]));
      }
      id v38 = v34;

      id v87 = 0LL;
      id v28 = v65;
      id v39 = v38;
      id v40 = (void *)objc_claimAutoreleasedReturnValue( -[ContextPluginACM _fillConstraint:options:userId:error:]( self,  "_fillConstraint:options:userId:error:",  v30,  v65,  v38,  &v87));
      id v41 = v87;
      if (!v40)
      {
        id v61 = v41;
        ((void (*)(void (**)(id, void *, void), void))v23[2])(v23, 0LL);
        id v63 = v39;
        id v25 = v67;
        id v26 = v68;
LABEL_34:

        id v20 = v62;
LABEL_35:

        goto LABEL_36;
      }

      id v61 = v39;
      id v42 = v41;
      *(void *)__int128 buf = 0LL;
      id v63 = v40;
      if ([v40 count])
      {
        v89 = v40;
        v90 = &off_2A090;
        id v88 = v18;
        id v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v89,  &v88,  1LL));
        v91 = v43;
        id v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v91,  &v90,  1LL));
        BOOL v45 = sub_EF60((uint64_t)v19, v44, buf);

        id v22 = v66;
        id v28 = v65;
        if (!v45)
        {
          id v53 = *(void **)buf;
          v23[2](v23, 0LL, *(void *)buf);

          id v25 = v67;
          id v26 = v68;
LABEL_33:
          uint64_t v30 = v64;
          goto LABEL_34;
        }
      }

      uint64_t v30 = v64;
      id v20 = v62;
    }

    else
    {
      id v63 = &__NSDictionary0__struct;
    }

    id v46 = (void *)SecAccessControlCopyConstraintData(v19, v18);
    id v47 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKey:&off_29EF8]);
    v60 = v47;
    if (v47)
    {
      [v47 doubleValue];
      unint64_t v49 = (v48 * 1000.0);
    }

    else
    {
      uint64_t v50 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v30, v50) & 1) != 0)
      {
        id v51 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKey:@"pgcma"]);
        id v52 = v51;
        if (v51) {
          unint64_t v49 = (unint64_t)[v51 unsignedIntValue];
        }
        else {
          unint64_t v49 = 0LL;
        }
      }

      else
      {
        unint64_t v49 = 0LL;
      }
    }

    id v86 = 0LL;
    uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue(-[ContextPluginACM _operationAsString:error:](self, "_operationAsString:error:", v18, &v86));
    id v55 = v86;
    id v61 = v46;
    if (v54)
    {
      acmHelper = self->_acmHelper;
      v70[0] = _NSConcreteStackBlock;
      v70[1] = 3221225472LL;
      _OWORD v70[2] = sub_9E60;
      v70[3] = &unk_28940;
      id v58 = v55;
      uint64_t v83 = v23;
      id v71 = v21;
      id v72 = v64;
      id v73 = v20;
      BOOL v85 = a9;
      id v74 = v63;
      id v75 = self;
      id v76 = v65;
      id v26 = v68;
      id v77 = v68;
      id v78 = v22;
      int v84 = v49;
      id v79 = v46;
      id v80 = v18;
      id v25 = v67;
      id v81 = v67;
      id v82 = v19;
      id v22 = v66;
      id v56 = (id)v49;
      uint64_t v57 = v58;
      -[LAACMHelper verifyAclConstraint:operation:preflight:parameters:parametersCount:maxGlobalCredentialAge:processRequirement:]( acmHelper,  "verifyAclConstraint:operation:preflight:parameters:parametersCount:maxGlobalCredentialAge:processRequirement:",  v79,  v54,  1LL,  0LL,  0LL,  v56,  v70);
    }

    else
    {
      uint64_t v57 = v55;
      ((void (**)(id, void *, id))v23)[2](v23, 0LL, v55);
      id v25 = v67;
      id v26 = v68;
    }

    id v28 = v65;
    goto LABEL_33;
  }

  v23[2](v23, &__NSDictionary0__struct, 0LL);
  id v25 = v67;
  id v26 = v68;
LABEL_36:
}

- (id)_operationAsString:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    id v7 = v5;
    id v8 = 0LL;
    if (!a4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid operation: %@",  v5));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[LAErrorHelper internalErrorWithMessage:]( &OBJC_CLASS___LAErrorHelper,  "internalErrorWithMessage:",  v9));

  id v7 = 0LL;
  if (a4) {
LABEL_5:
  }
    *a4 = v8;
LABEL_6:

  return v7;
}

- (void)_validateACL:(id)a3 evaluateOperation:(id)a4 options:(id)a5 uiDelegate:(id)a6 originator:(id)a7 request:(id)a8 callerName:(id)a9 callerBundleId:(id)a10 reply:(id)a11
{
  id v16 = a3;
  id v30 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  uint64_t Constraints = SecAccessControlGetConstraints(v16);
  id v25 = (void *)objc_claimAutoreleasedReturnValue(Constraints);
  if (v25)
  {
    id v29 = v20;
    objc_initWeak(location, v19);
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 keyEnumerator]);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_A6C0;
    v31[3] = &unk_28968;
    v38[1] = v16;
    id v37 = v23;
    v31[4] = self;
    id v32 = v17;
    id v33 = v18;
    objc_copyWeak(v38, location);
    id v34 = v29;
    id v35 = v21;
    id v36 = v22;
    id v27 = v30;
    -[ContextPluginACM _validateOperations:aclRef:evaluateOperation:options:uiDelegate:originator:request:currentResult:reply:]( self,  "_validateOperations:aclRef:evaluateOperation:options:uiDelegate:originator:request:currentResult:reply:",  v26,  v16,  v30,  v32,  v33,  v19,  v34,  &__NSDictionary0__struct,  v31);

    objc_destroyWeak(v38);
    objc_destroyWeak(location);
    id v20 = v29;
  }

  else
  {
    (*((void (**)(id, void *, void))v23 + 2))(v23, &__NSDictionary0__struct, 0LL);
    id v27 = v30;
  }
}

- (void)_validateOperations:(id)a3 aclRef:(id)a4 evaluateOperation:(id)a5 options:(id)a6 uiDelegate:(id)a7 originator:(id)a8 request:(id)a9 currentResult:(id)a10 reply:(id)a11
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = v16;
  id v33 = v19;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  id v24 = a10;
  id v25 = a11;
  uint64_t v26 = objc_claimAutoreleasedReturnValue([v20 nextObject]);
  uint64_t v31 = (void *)v26;
  id v32 = v18;
  if (v26)
  {
    id v27 = (void *)v26;
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_AB10;
    v34[3] = &unk_28990;
    id v45 = v25;
    id v35 = v24;
    id v36 = v27;
    id v37 = self;
    id v38 = v20;
    id v39 = v17;
    id v40 = v18;
    id v41 = v33;
    id v42 = v21;
    id v43 = v22;
    id v44 = v23;
    -[ContextPluginACM _validateOperation:aclRef:evaluateOperation:options:uiDelegate:originator:request:reply:]( self,  "_validateOperation:aclRef:evaluateOperation:options:uiDelegate:originator:request:reply:",  v36,  v39,  v40,  v41,  v42,  v43,  v44,  v34);

    id v28 = v45;
  }

  else
  {
    id v47 = v24;
    double v48 = @"Result";
    id v46 = &off_2A090;
    id v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v47,  &v46,  1LL));
    unint64_t v49 = v28;
    id v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v49,  &v48,  1LL));
    (*((void (**)(id, void *, void))v25 + 2))(v25, v29, 0LL);
  }
}

- (void)_validateOperation:(id)a3 aclRef:(id)a4 evaluateOperation:(id)a5 options:(id)a6 uiDelegate:(id)a7 originator:(id)a8 request:(id)a9 reply:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = (void (**)(id, void *, void))a10;
  id v23 = a5;
  id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue([v21 log]);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138543618;
    id v28 = self;
    __int16 v29 = 2114;
    id v30 = v16;
    _os_log_impl(&dword_0, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ validates operation: %{public}@", buf, 0x16u);
  }

  unsigned int v25 = [v16 isEqual:v23];
  if (v25)
  {
    v22[2](v22, &__NSDictionary0__struct, 0LL);
  }

  else
  {
    LOBYTE(v26) = 1;
    -[ContextPluginACM _evaluateOperation:aclRef:options:uiDelegate:originator:request:validate:callerName:callerBundleId:reply:]( self,  "_evaluateOperation:aclRef:options:uiDelegate:originator:request:validate:callerName:callerBundleId:reply:",  v16,  v17,  v18,  v19,  v20,  v21,  v26,  0LL,  0LL,  v22);
  }
}

- (BOOL)_validatePassword:(int64_t)a3 options:(id)a4 uiDelegate:(id)a5 originator:(id)a6 request:(id)a7 callerName:(id)a8 callerBundleId:(id)a9 reply:(id)a10
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = (void (**)(id, void, id))a10;
  acmHelper = self->_acmHelper;
  v50[0] = 0LL;
  unsigned __int8 v23 = -[LAACMHelper isCredentialOfTypeSet:error:]( acmHelper,  "isCredentialOfTypeSet:error:",  2LL,  v50);
  id v24 = v50[0];
  if ((v23 & 1) == 0)
  {
    id v39 = v17;
    id v40 = v16;
    unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:&off_2A030]);
    unsigned int v26 = [v25 BOOLValue];

    if (v26)
    {
      id v27 = (id *)objc_claimAutoreleasedReturnValue( +[LAErrorHelper errorWithCode:message:]( &OBJC_CLASS___LAErrorHelper,  "errorWithCode:message:",  -1004LL,  @"User interaction is required."));
      v21[2](v21, 0LL, v27);
      id v16 = v40;
    }

    else
    {
      id v16 = v40;
      if (!self->_applicationPasswordWasSet)
      {
        id v17 = v39;
        if (self->_applicationPasswordCounter < 5)
        {
          id v37 = (id *)objc_claimAutoreleasedReturnValue( -[ContextPluginACM createInternalInfo:skipCallerIdentification:callerBundleId:request:originator:]( self,  "createInternalInfo:skipCallerIdentification:callerBundleId:request:originator:",  v15,  v19 != 0LL,  0LL,  v18,  v39));
          if (v19) {
            [v37 setObject:v19 forKey:@"CallerName"];
          }
          if (v20) {
            [v37 setObject:v20 forKey:@"CallerId"];
          }
          id v34 = (void *)objc_claimAutoreleasedReturnValue([v18 payload]);
          id v29 = [v34 mutableCopy];
          id v33 = v19;
          if (v29)
          {
            id v30 = v29;
            uint64_t v31 = (NSMutableDictionary *)v29;
          }

          else
          {
            id v30 = 0LL;
            uint64_t v31 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
          }

          id v36 = v31;

          -[NSMutableDictionary setObject:forKeyedSubscript:]( v36,  "setObject:forKeyedSubscript:",  v37,  LACEvaluationRequestPayloadKeyInternalInfo);
          [v18 updatePayload:v36];
          objc_initWeak(&location, v39);
          id v35 = [[ACMContextRecord alloc] initWithACMContext:self->_acmContext cachedExternalizationDelegate:self];
          mechanismManager = self->_mechanismManager;
          v41[0] = _NSConcreteStackBlock;
          v41[1] = 3221225472LL;
          v41[2] = sub_B1D4;
          v41[3] = &unk_28A08;
          id v42 = v15;
          id v43 = self;
          id v27 = v37;
          id v44 = v27;
          id v45 = v40;
          objc_copyWeak(&v48, &location);
          id v46 = v18;
          id v47 = v21;
          id v17 = v39;
          -[MechanismManagerACM mechanismForApplicationPasswordMode:acmContextRecord:options:internalInfo:uiDelegate:originator:request:reply:]( mechanismManager,  "mechanismForApplicationPasswordMode:acmContextRecord:options:internalInfo:uiDelegate:originator:request:reply:",  a3,  v35,  v42,  v27,  v45,  v39,  v46,  v41);
          id v19 = v33;

          objc_destroyWeak(&v48);
          objc_destroyWeak(&location);

          id v16 = v40;
        }

        else
        {
          self->_applicationPasswordCounter = 0LL;
          id v27 = (id *)objc_claimAutoreleasedReturnValue( +[LAErrorHelper errorWithCode:message:]( &OBJC_CLASS___LAErrorHelper,  "errorWithCode:message:",  -1LL,  @"Application retry limit exceeded."));
          v21[2](v21, 0LL, v27);
        }

        goto LABEL_7;
      }

      id v27 = (id *)objc_claimAutoreleasedReturnValue( +[LAErrorHelper errorWithCode:message:]( &OBJC_CLASS___LAErrorHelper,  "errorWithCode:message:",  -1LL,  @"Missing application password."));
      v21[2](v21, 0LL, v27);
    }

    id v17 = v39;
LABEL_7:
  }

  return v23;
}

- (void)isCredentialSet:(int64_t)a3 originator:(id)a4 reply:(id)a5
{
  id v8 = a4;
  uint64_t v9 = (void (**)(id, BOOL, void *))a5;
  if (a3 == -9)
  {
    uint64_t v12 = 13LL;
LABEL_8:
    acmHelper = self->_acmHelper;
    id v17 = 0LL;
    -[LAACMHelper isCredentialOfTypeSet:error:](acmHelper, "isCredentialOfTypeSet:error:", v12, &v17);
    id v14 = v17;
LABEL_13:
    id v16 = v14;
    unsigned __int8 v11 = 0LL;
    goto LABEL_14;
  }

  if (!a3)
  {
    uint64_t v12 = 2LL;
    goto LABEL_8;
  }

  if (a3 != -3) {
    goto LABEL_12;
  }
  ctkPin = self->_ctkPin;
  if (ctkPin)
  {
    unsigned __int8 v11 = ctkPin;
    goto LABEL_10;
  }

  unsigned __int8 v11 = (NSData *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  if (!v11)
  {
LABEL_12:
    id v14 = (id)objc_claimAutoreleasedReturnValue( +[LAErrorHelper parameterErrorWithMessage:]( &OBJC_CLASS___LAErrorHelper,  "parameterErrorWithMessage:",  @"Unsupported credential type"));
    goto LABEL_13;
  }

- (void)setCredential:(id)a3 type:(int64_t)a4 options:(id)a5 originator:(id)a6 reply:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = (void (**)(id, id, id))a7;
  if (a4 > -4)
  {
    if (a4 == -3)
    {
      objc_storeStrong((id *)&self->_ctkPin, a3);
      id v21 = 0LL;
    }

    else
    {
      if (a4) {
        goto LABEL_13;
      }
      if (v13)
      {
        id v22 = v13;
        unsigned __int8 v23 = (void *)objc_claimAutoreleasedReturnValue( +[LACSecureData secureDataWithBytes:length:]( LACSecureData,  "secureDataWithBytes:length:",  [v22 bytes],  objc_msgSend(v22, "length")));
        acmHelper = self->_acmHelper;
        id v36 = 0LL;
        unsigned __int8 v25 = -[LAACMHelper replacePassphraseCredentialWithPurpose:passphrase:scope:error:]( acmHelper,  "replacePassphraseCredentialWithPurpose:passphrase:scope:error:",  0LL,  v23,  1LL,  &v36);
        id v21 = v36;

        id v20 = 0LL;
        if ((v25 & 1) == 0) {
          goto LABEL_19;
        }
      }

      else
      {
        uint64_t v31 = self->_acmHelper;
        id v35 = 0LL;
        id v20 = -[LAACMHelper removeCredentialsOfType:error:](v31, "removeCredentialsOfType:error:", 2LL, &v35);
        id v21 = v35;
        if (!(_DWORD)v20) {
          goto LABEL_19;
        }
      }

      self->_applicationPasswordWasSet = v13 != 0LL;
    }

    id v20 = &dword_0 + 1;
    goto LABEL_19;
  }

  if (a4 == -11)
  {
    unsigned int v26 = self->_acmHelper;
    id v32 = 0LL;
    id v20 = -[LAACMHelper addCredential:scope:property:data:error:]( v26,  "addCredential:scope:property:data:error:",  21LL,  1LL,  1001LL,  v13,  &v32);
    id v27 = v32;
LABEL_15:
    id v21 = v27;
    goto LABEL_19;
  }

  if (a4 != -9)
  {
LABEL_13:
    id v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
    id v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unsupported credentialType: %@",  v28));
    id v21 = (id)objc_claimAutoreleasedReturnValue( +[LAErrorHelper parameterErrorWithMessage:]( &OBJC_CLASS___LAErrorHelper,  "parameterErrorWithMessage:",  v29));

    id v20 = 0LL;
    goto LABEL_19;
  }

  if (!v13)
  {
    id v30 = self->_acmHelper;
    id v33 = 0LL;
    id v20 = -[LAACMHelper removeCredentialsOfType:error:](v30, "removeCredentialsOfType:error:", 13LL, &v33);
    id v27 = v33;
    goto LABEL_15;
  }

  id v17 = v13;
  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[LACSecureData secureDataWithBytes:length:]( LACSecureData,  "secureDataWithBytes:length:",  [v17 bytes],  objc_msgSend(v17, "length")));
  id v19 = self->_acmHelper;
  id v34 = 0LL;
  id v20 = -[LAACMHelper addExtractablePassphrase:scope:error:]( v19,  "addExtractablePassphrase:scope:error:",  v18,  1LL,  &v34);
  id v21 = v34;

LABEL_19:
  v16[2](v16, v20, v21);
}

- (void)credentialOfType:(int64_t)a3 originator:(id)a4 reply:(id)a5
{
  if (a3 == -9)
  {
    acmHelper = self->_acmHelper;
    id v14 = 0LL;
    id v7 = (void (**)(id, void *, id))a5;
    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[LAACMHelper credentialOfType:property:error:]( acmHelper,  "credentialOfType:property:error:",  13LL,  701LL,  &v14));
    id v9 = v14;
    v7[2](v7, v8, v9);
  }

  else
  {
    id v11 = a5;
    id v13 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unsupported credentialType: %d",  a3));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[LAErrorHelper parameterErrorWithMessage:]( &OBJC_CLASS___LAErrorHelper,  "parameterErrorWithMessage:",  v13));
    (*((void (**)(id, void, void *))a5 + 2))(v11, 0LL, v12);
  }

- (void)checkCredentialSatisfied:(int64_t)a3 policy:(int64_t)a4 reply:(id)a5
{
  acmHelper = self->_acmHelper;
  id v9 = (void (**)(id, id, id))a5;
  id v12 = 0LL;
  id v10 = -[LAACMHelper verifyRequirementOfType:policy:error:]( acmHelper,  "verifyRequirementOfType:policy:error:",  -[ContextPluginACM _requirementTypeForCredentialType:](self, "_requirementTypeForCredentialType:", a3),  +[LAACMHelper acmPolicyForPolicy:](&OBJC_CLASS___LAACMHelper, "acmPolicyForPolicy:", a4),  &v12);
  id v11 = v12;
  v9[2](v9, v10, v11);
}

- (unsigned)_requirementTypeForCredentialType:(int64_t)a3
{
  return 0;
}

- (void)externalizedContextWithReply:(id)a3
{
  id v4 = a3;
  acmContext = self->_acmContext;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_BA7C;
  v7[3] = &unk_28A30;
  id v8 = v4;
  id v6 = v4;
  ACMContextGetExternalForm(acmContext, (uint64_t)v7);
}

- (unsigned)_credentialTypeForEvent:(int64_t)a3
{
  else {
    return dword_223F8[a3 - 1];
  }
}

- (void)resetEvent:(int64_t)a3 originator:(id)a4 reply:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, void, void *))a5;
  id v10 = sub_5078();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 67109120;
    int v22 = a3;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "resetEvent:%d", buf, 8u);
  }

  BOOL v12 = 0;
  id v13 = 0LL;
  uint64_t v14 = 1LL;
  do
  {
    if ((!a3 || (_DWORD)v14 == -[ContextPluginACM _credentialTypeForEvent:](self, "_credentialTypeForEvent:", a3))
      && !-[ContextPluginACM _shouldAvoidRemovingCredentialType:](self, "_shouldAvoidRemovingCredentialType:", v14))
    {
      if (-[LAACMHelper isCredentialOfTypeSet:error:]( self->_acmHelper,  "isCredentialOfTypeSet:error:",  v14,  0LL))
      {
        acmHelper = self->_acmHelper;
        id v20 = v13;
        unsigned int v16 = -[LAACMHelper removeCredentialsOfType:error:]( acmHelper,  "removeCredentialsOfType:error:",  v14,  &v20);
        id v17 = v20;

        id v13 = v17;
        if (!v16) {
          break;
        }
      }
    }

    int v18 = v14 + 1;
    BOOL v12 = v14 > 0x11;
    uint64_t v14 = (v14 + 1);
  }

  while (v18 != 19);
  if (!a3)
  {
    ctkPin = self->_ctkPin;
    self->_ctkPin = 0LL;

    if (!v12) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }

  if (v12) {
LABEL_12:
  }
    -[ContextPluginACM setResultInfo:](self, "setResultInfo:", &__NSDictionary0__struct);
LABEL_13:
  ((void (**)(id, BOOL, void *))v9)[2](v9, v12, v13);
}

- (BOOL)_shouldAvoidRemovingCredentialType:(unsigned int)a3
{
  return (a3 < 0x10) & (0x9400u >> a3);
}

- (void)authMethodWithReply:(id)a3
{
  id v4 = a3;
  acmContext = self->_acmContext;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_BDB4;
  v7[3] = &unk_28A58;
  id v8 = v4;
  id v6 = v4;
  ACMGetAclAuthMethod((__n128 *)acmContext, (uint64_t)v7);
}

- (void)_setACMHelper:(id)a3
{
}

- (void)_setMechanismManager:(id)a3
{
}

- (void)_setAuthenticationManager:(id)a3
{
}

- (__ACMHandle)acmContext
{
  return self->_acmContext;
}

- (void).cxx_destruct
{
}

@end