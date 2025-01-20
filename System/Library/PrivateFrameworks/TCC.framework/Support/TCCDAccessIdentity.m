@interface TCCDAccessIdentity
+ (id)_createCacheKeyWithAccessorAuditToken:(id *)a3 responsibleAuditToken:(id *)a4 isSpecificIdentity:(BOOL)a5;
+ (id)cachedAccessIdentityForAccessorAuditToken:(id *)a3 responsibleAuditToken:(id *)a4 isSpecificIdentity:(BOOL)a5;
+ (void)_initIdentityCache;
+ (void)cacheAccessIdentity:(id)a3 forAccessorAuditToken:(id *)a4 responsibleAuditToken:(id *)a5 isSpecificIdentity:(BOOL)a6;
+ (void)clearCache;
- ($115C4C562B26FF47E01F9F4EA65B5887)accessorAuditToken;
- ($115C4C562B26FF47E01F9F4EA65B5887)responsibleAuditToken;
- (BOOL)_deriveIdentityFromAttributionChain:(id)a3 preferMostSpecificIdentifier:(BOOL)a4;
- (BOOL)getSDKVersion:(unsigned int *)a3 platformType:(unsigned int *)a4;
- (BOOL)isAvocadoWidget;
- (BOOL)isCaptureExtension;
- (BOOL)isEqualToCachedIdentity:(id)a3;
- (BOOL)isPlugInWithExtensionPointIdentifier:(id)a3;
- (BOOL)is_wk2_proxy;
- (BOOL)pluginTargetsSystemExtensionPoint;
- (NSNumber)policy_id;
- (NSString)attributionPath;
- (NSString)identifier;
- (NSString)path;
- (NSString)pluginBundleIdentifier;
- (NSURL)pluginBundleURL;
- (TCCDAccessIdentity)initWithAttributionChain:(id)a3 preferMostSpecificIdentifier:(BOOL)a4;
- (TCCDAccessIdentity)initWithBundleIdentifier:(id)a3 isWK2Proxy:(BOOL)a4;
- (TCCDAccessIdentity)initWithIdentifier:(id)a3 type:(int)a4 executableURL:(id)a5 SDKVersion:(unsigned int)a6 platformType:(unsigned int)a7;
- (TCCDAccessIdentity)initWithMessage:(id)a3;
- (TCCDBundle)bundle;
- (id)_initWithAccessIdentity:(id)a3;
- (id)description;
- (id)displayName;
- (int)client_type;
- (int)responsiblePID;
- (int)targetPID;
- (int64_t)appExtensionType;
- (int64_t)pluginPromptPolicy;
- (void)_makeDisplayNameBlockForURL:(id)a3;
- (void)_updateFromAccessIdentity:(id)a3;
@end

@implementation TCCDAccessIdentity

+ (void)_initIdentityCache
{
  if (qword_1000782B8 != -1) {
    dispatch_once(&qword_1000782B8, &stru_1000652F0);
  }
}

+ (id)_createCacheKeyWithAccessorAuditToken:(id *)a3 responsibleAuditToken:(id *)a4 isSpecificIdentity:(BOOL)a5
{
  BOOL v17 = a5;
  v7 = -[NSMutableData initWithBytes:length:]( objc_alloc(&OBJC_CLASS___NSMutableData),  "initWithBytes:length:",  a3,  32LL);
  v8 = v7;
  if (a4)
  {
    BOOL v9 = *(void *)a3->var0 == *(void *)a4->var0 && *(void *)&a3->var0[2] == *(void *)&a4->var0[2];
    BOOL v10 = v9 && *(void *)&a3->var0[4] == *(void *)&a4->var0[4];
    if ((!v10 || *(void *)&a3->var0[6] != *(void *)&a4->var0[6])
      && (*(void *)a3->var0 != qword_1000782C0
       || *(void *)&a3->var0[2] != *(void *)algn_1000782C8
       || *(void *)&a3->var0[4] != qword_1000782D0
       || *(void *)&a3->var0[6] != unk_1000782D8))
    {
      -[NSMutableData appendBytes:length:](v7, "appendBytes:length:", a4, 32LL);
    }
  }

  -[NSMutableData appendBytes:length:](v8, "appendBytes:length:", &v17, 1LL);
  id v15 = -[NSMutableData copy](v8, "copy");

  return v15;
}

- (BOOL)isEqualToCachedIdentity:(id)a3
{
  v5 = (TCCDAccessIdentity *)a3;
  p_isa = (id *)&v5->super.isa;
  if (v5 == self)
  {
    BOOL v23 = 1;
    goto LABEL_31;
  }

  if (!v5)
  {
    BOOL v23 = 0;
    goto LABEL_31;
  }

  int client_type = self->_client_type;
  unsigned int v8 = -[TCCDAccessIdentity client_type](v5, "client_type");
  unsigned int v9 = client_type == v8;
  identifier = self->_identifier;
  v11 = identifier;
  if (!identifier)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue([p_isa identifier]);
    if (!v3)
    {
LABEL_10:

      goto LABEL_11;
    }

    v11 = self->_identifier;
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue([p_isa identifier]);
  unsigned int v13 = -[NSString isEqualToString:](v11, "isEqualToString:", v12);
  if (client_type == v8) {
    unsigned int v9 = v13;
  }
  else {
    unsigned int v9 = 0;
  }

  if (!identifier) {
    goto LABEL_10;
  }
LABEL_11:
  policy_id = self->_policy_id;
  id v15 = policy_id;
  if (policy_id) {
    goto LABEL_14;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_isa, "policy_id"));
  if (v3)
  {
    id v15 = self->_policy_id;
LABEL_14:
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_isa, "policy_id"));
    v9 &= -[NSNumber isEqualToNumber:](v15, "isEqualToNumber:", v16);

    if (policy_id) {
      goto LABEL_16;
    }
  }

LABEL_16:
  path = self->_path;
  v18 = path;
  if (path) {
    goto LABEL_19;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue([p_isa path]);
  if (v3)
  {
    v18 = self->_path;
LABEL_19:
    v19 = (void *)objc_claimAutoreleasedReturnValue([p_isa path]);
    v9 &= -[NSString isEqualToString:](v18, "isEqualToString:", v19);

    if (path) {
      goto LABEL_21;
    }
  }

LABEL_21:
  bundle = self->_bundle;
  v21 = bundle;
  if (bundle) {
    goto LABEL_24;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue([p_isa bundle]);
  if (v3)
  {
    v21 = self->_bundle;
LABEL_24:
    v22 = (void *)objc_claimAutoreleasedReturnValue([p_isa bundle]);
    v9 &= -[TCCDBundle isEqual:](v21, "isEqual:", v22);

    if (bundle) {
      goto LABEL_26;
    }
  }

LABEL_26:
  if (self->displayNameBlock == p_isa[1]) {
    BOOL v23 = v9;
  }
  else {
    BOOL v23 = 0;
  }
LABEL_31:

  return v23;
}

+ (void)clearCache
{
  v2 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  40LL);
  v3 = (void *)qword_1000782A8;
  qword_1000782A8 = (uint64_t)v2;

  v4 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 40LL);
  v5 = (void *)qword_1000782B0;
  qword_1000782B0 = (uint64_t)v4;
}

+ (id)cachedAccessIdentityForAccessorAuditToken:(id *)a3 responsibleAuditToken:(id *)a4 isSpecificIdentity:(BOOL)a5
{
  BOOL v5 = a5;
  [a1 _initIdentityCache];
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue( [a1 _createCacheKeyWithAccessorAuditToken:a3 responsibleAuditToken:a4 isSpecificIdentity:v5]);
  id v10 = (id)qword_1000782A8;
  objc_sync_enter(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_1000782A8 objectForKeyedSubscript:v9]);
  objc_sync_exit(v10);

  return v11;
}

+ (void)cacheAccessIdentity:(id)a3 forAccessorAuditToken:(id *)a4 responsibleAuditToken:(id *)a5 isSpecificIdentity:(BOOL)a6
{
  BOOL v6 = a6;
  id v40 = a3;
  [a1 _initIdentityCache];
  id v10 = (void *)objc_claimAutoreleasedReturnValue( [a1 _createCacheKeyWithAccessorAuditToken:a4 responsibleAuditToken:a5 isSpecificIdentity:v6]);
  id v11 = (id)qword_1000782A8;
  objc_sync_enter(v11);
  if ((unint64_t)[(id)qword_1000782A8 count] >= 0x28)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_1000782B0 objectAtIndexedSubscript:0]);
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_1000782A8 objectForKeyedSubscript:v12]);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 server]);
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 logHandle]);

    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      BOOL v17 = (void *)objc_claimAutoreleasedReturnValue([v13 identifier]);
      sub_100015354(v17, (uint64_t)v42, v16);
    }

    [(id)qword_1000782A8 removeObjectForKey:v12];
    [(id)qword_1000782B0 removeObjectAtIndex:0];
  }

  id v18 = -[TCCDAccessIdentity _initWithAccessIdentity:]( objc_alloc(&OBJC_CLASS___TCCDAccessIdentity),  "_initWithAccessIdentity:",  v40);
  [(id)qword_1000782A8 setObject:v18 forKeyedSubscript:v10];
  [(id)qword_1000782B0 addObject:v10];
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 server]);
  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue([v20 logHandle]);
  BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG);

  if (v22)
  {
    __int128 v23 = *(_OWORD *)&a4->var0[4];
    *(_OWORD *)atoken.val = *(_OWORD *)a4->var0;
    *(_OWORD *)&atoken.val[4] = v23;
    uint64_t v24 = audit_token_to_pid(&atoken);
    __int128 v25 = *(_OWORD *)&a4->var0[4];
    *(_OWORD *)atoken.val = *(_OWORD *)a4->var0;
    *(_OWORD *)&atoken.val[4] = v25;
    uint64_t v26 = audit_token_to_pidversion(&atoken);
    __int128 v27 = *(_OWORD *)&a4->var0[4];
    *(_OWORD *)atoken.val = *(_OWORD *)a4->var0;
    *(_OWORD *)&atoken.val[4] = v27;
    v28 = +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"accessor: ([%d.%d], %d)",  v24,  v26,  audit_token_to_asid(&atoken));
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    if (a5)
    {
      __int128 v30 = *(_OWORD *)&a5->var0[4];
      *(_OWORD *)atoken.val = *(_OWORD *)a5->var0;
      *(_OWORD *)&atoken.val[4] = v30;
      uint64_t v31 = audit_token_to_pid(&atoken);
      __int128 v32 = *(_OWORD *)&a5->var0[4];
      *(_OWORD *)atoken.val = *(_OWORD *)a5->var0;
      *(_OWORD *)&atoken.val[4] = v32;
      uint64_t v33 = audit_token_to_pidversion(&atoken);
      __int128 v34 = *(_OWORD *)&a5->var0[4];
      *(_OWORD *)atoken.val = *(_OWORD *)a5->var0;
      *(_OWORD *)&atoken.val[4] = v34;
      objc_msgSend(v29, "appendFormat:", @", responsible: ([%d.%d], %d)", v31, v33, audit_token_to_asid(&atoken));
    }

    v35 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
    v36 = (void *)objc_claimAutoreleasedReturnValue([v35 server]);
    v37 = (os_log_s *)objc_claimAutoreleasedReturnValue([v36 logHandle]);

    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue([v18 identifier]);
      v39 = (char *)[(id)qword_1000782B0 count];
      atoken.val[0] = 138543874;
      *(void *)&atoken.val[1] = v38;
      LOWORD(atoken.val[3]) = 2114;
      *(void *)((char *)&atoken.val[3] + 2) = v29;
      HIWORD(atoken.val[5]) = 2048;
      *(void *)&atoken.val[6] = v39 - 1;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEBUG,  "identityCache: adding: %{public}@ for %{public}@, idx: %lu",  (uint8_t *)&atoken,  0x20u);
    }
  }

  objc_sync_exit(v11);
}

- (void)_makeDisplayNameBlockForURL:(id)a3
{
  if (-[TCCDAccessIdentity client_type](self, "client_type", a3))
  {
    -[TCCDAccessIdentity client_type](self, "client_type");
  }

  else
  {
    v4 = self->_identifier;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1000132D8;
    v8[3] = &unk_100065318;
    unsigned int v9 = v4;
    BOOL v5 = v4;
    BOOL v6 = objc_retainBlock(v8);
    id displayNameBlock = self->displayNameBlock;
    self->id displayNameBlock = v6;
  }

- (BOOL)_deriveIdentityFromAttributionChain:(id)a3 preferMostSpecificIdentifier:(BOOL)a4
{
  id v5 = a3;
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 responsibleProcess]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 responsiblePath]);

  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 server]);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 logHandle]);

  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_1000157E0(v5, v10);
    }

    __int128 v11 = *(_OWORD *)&self->_responsibleAuditToken.val[4];
    *(_OWORD *)audit_token_t atoken = *(_OWORD *)self->_responsibleAuditToken.val;
    *(_OWORD *)&atoken[16] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[LSBundleRecord bundleRecordForAuditToken:error:]( &OBJC_CLASS___LSBundleRecord,  "bundleRecordForAuditToken:error:",  atoken,  0LL));
    uint64_t v16 = objc_opt_class(&OBJC_CLASS___LSApplicationExtensionRecord, v13, v14, v15);
    id v17 = 0LL;
    if ((objc_opt_isKindOfClass(v12, v16) & 1) == 0) {
      goto LABEL_40;
    }
    id v17 = v12;
    id v18 = (NSURL *)objc_claimAutoreleasedReturnValue([v17 URL]);
    pluginBundleURL = self->_pluginBundleURL;
    self->_pluginBundleURL = v18;

    v20 = (NSString *)objc_claimAutoreleasedReturnValue([v17 bundleIdentifier]);
    pluginBundleIdentifier = self->_pluginBundleIdentifier;
    self->_pluginBundleIdentifier = v20;

    self->_pluginTargetsSystemExtensionPoint = 1;
    self->_int64_t pluginPromptPolicy = 1LL;
    BOOL v22 = (void *)objc_claimAutoreleasedReturnValue([v17 extensionPointRecord]);
    __int128 v23 = v22;
    if (v22)
    {
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v22 SDKDictionary]);
      id v28 = objc_msgSend( v24,  "objectForKey:ofClass:",  @"EXRequiresLegacyInfrastructure",  objc_opt_class(NSNumber, v25, v26, v27));
      v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
      unsigned int v30 = [v29 BOOLValue];
      char v31 = v30;
      int64_t v32 = v30 ? 1LL : 2LL;

      self->_int64_t appExtensionType = v32;
      if ((v31 & 1) == 0)
      {
        self->_pluginTargetsSystemExtensionPoint = [v23 extensionPointType] < 2;
        unsigned int v33 = [v23 TCCPolicy];
        int v34 = v33;
        if (v33 >= 3)
        {
          id v44 = tcc_access_log();
          v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
            sub_100015770(v34, v45);
          }

          int64_t v35 = 1LL;
        }

        else
        {
          int64_t v35 = v33;
        }

        self->_int64_t pluginPromptPolicy = v35;
      }
    }

    id v46 = tcc_access_log();
    v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
    {
      int responsiblePID = self->_responsiblePID;
      v84 = (void *)objc_claimAutoreleasedReturnValue([v23 name]);
      int64_t pluginPromptPolicy = self->_pluginPromptPolicy;
      int64_t appExtensionType = self->_appExtensionType;
      *(_DWORD *)audit_token_t atoken = 67110146;
      *(_DWORD *)&atoken[4] = responsiblePID;
      *(_WORD *)&atoken[8] = 2114;
      *(void *)&atoken[10] = v17;
      *(_WORD *)&atoken[18] = 2114;
      *(void *)&atoken[20] = v84;
      *(_WORD *)&atoken[28] = 2048;
      *(void *)&atoken[30] = appExtensionType;
      __int16 v129 = 2048;
      int64_t v130 = pluginPromptPolicy;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEBUG,  "IDENTITY_ATTRIBUTION: Responsible process (pid=%u) is App Extension: %{public}@, extension point %{public}@, ext ension type %ld, prompt policy %ld",  atoken,  0x30u);
    }

    if (!v17) {
      goto LABEL_40;
    }
    int64_t v48 = self->_pluginPromptPolicy;
    if (!v48) {
      goto LABEL_40;
    }
    if (v48 != 2)
    {
      if (v48 == 1)
      {
        v49 = (void *)objc_claimAutoreleasedReturnValue([v17 containingBundleRecord]);
        v50 = v49;
        BOOL v54 = 1;
        if (v49)
        {
          uint64_t v51 = objc_claimAutoreleasedReturnValue([v49 bundleIdentifier]);
          if (v51)
          {
            v52 = (void *)v51;
            v53 = (void *)objc_claimAutoreleasedReturnValue([v50 URL]);

            if (v53) {
              BOOL v54 = 0;
            }
          }
        }

        v70 = (NSString *)objc_claimAutoreleasedReturnValue([v50 bundleIdentifier]);
        identifier = self->_identifier;
        self->_identifier = v70;

        bundle = (TCCDBundle *)objc_claimAutoreleasedReturnValue([v50 URL]);
        if (v54)
        {

LABEL_40:
          id v118 = 0LL;
          v72 = (TCCDBundle *)[v5 attributedBundleUsingOutermostBundle:0 computedStaticCodeRef:0 computedNonIdentifiableBundleURL:&v118];
          id v10 = (os_log_s *)v118;
          bundle = self->_bundle;
          self->_bundle = v72;
LABEL_41:

          v73 = self->_bundle;
          if (v73)
          {
            v74 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDBundle bundleIdentifier](v73, "bundleIdentifier"));

            if (v74)
            {
              if (!self->displayNameBlock)
              {
                self->_int client_type = 0;
                v75 = (NSString *)objc_claimAutoreleasedReturnValue(-[TCCDBundle bundleIdentifier](self->_bundle, "bundleIdentifier"));
                v76 = self->_identifier;
                self->_identifier = v75;

                v77 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDBundle bundleURL](self->_bundle, "bundleURL"));
                -[TCCDAccessIdentity _makeDisplayNameBlockForURL:](self, "_makeDisplayNameBlockForURL:", v77);
              }

              v78 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
              v79 = (void *)objc_claimAutoreleasedReturnValue([v78 server]);
              bundle = (TCCDBundle *)objc_claimAutoreleasedReturnValue([v79 logHandle]);

              if (os_log_type_enabled((os_log_t)bundle, OS_LOG_TYPE_DEBUG)) {
                sub_100015464((uint64_t)self, (os_log_s *)bundle);
              }
              BOOL v43 = 1;
              goto LABEL_51;
            }
          }

          v80 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
          v81 = (void *)objc_claimAutoreleasedReturnValue([v80 server]);
          bundle = (TCCDBundle *)objc_claimAutoreleasedReturnValue([v81 logHandle]);

          if (os_log_type_enabled((os_log_t)bundle, OS_LOG_TYPE_ERROR)) {
            sub_1000153D0(v5, (os_log_s *)bundle);
          }
LABEL_50:
          BOOL v43 = 0;
LABEL_51:

          goto LABEL_52;
        }
      }

      else
      {
        bundle = 0LL;
      }

      goto LABEL_69;
    }

    __int128 v55 = *(_OWORD *)&self->_responsibleAuditToken.val[4];
    __int128 v126 = *(_OWORD *)self->_responsibleAuditToken.val;
    __int128 v127 = v55;
    __int128 v56 = *(_OWORD *)&self->_responsibleAuditToken.val[4];
    *(_OWORD *)audit_token_t atoken = *(_OWORD *)self->_responsibleAuditToken.val;
    *(_OWORD *)&atoken[16] = v56;
    v57 = +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  audit_token_to_pid((audit_token_t *)atoken));
    v58 = (void *)objc_claimAutoreleasedReturnValue(v57);
    id v125 = 0LL;
    v59 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessHandle handleForIdentifier:error:]( &OBJC_CLASS___RBSProcessHandle,  "handleForIdentifier:error:",  v58,  &v125));
    id v60 = v125;

    if (v59)
    {
      v116 = v60;
      v117 = v59;
      [v59 auditToken];
      *(_OWORD *)audit_token_t atoken = v126;
      *(_OWORD *)&atoken[16] = v127;
      pid_t v61 = audit_token_to_pid((audit_token_t *)atoken);
      *(_OWORD *)audit_token_t atoken = v123;
      *(_OWORD *)&atoken[16] = v124;
      pid_t v62 = audit_token_to_pid((audit_token_t *)atoken);
      *(_OWORD *)audit_token_t atoken = v126;
      *(_OWORD *)&atoken[16] = v127;
      int v63 = audit_token_to_pidversion((audit_token_t *)atoken);
      *(_OWORD *)audit_token_t atoken = v123;
      *(_OWORD *)&atoken[16] = v124;
      int v64 = audit_token_to_pidversion((audit_token_t *)atoken);
      if (v61 != v62 || v63 != v64)
      {
        id v88 = tcc_access_log();
        v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(v88);
        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
        {
          v59 = v117;
          [v117 auditToken];
          id v112 = sub_100015290(v122);
          v113 = (void *)objc_claimAutoreleasedReturnValue(v112);
          *(_OWORD *)audit_token_t atoken = v126;
          *(_OWORD *)&atoken[16] = v127;
          id v114 = sub_100015290(atoken);
          v115 = (void *)objc_claimAutoreleasedReturnValue(v114);
          *(_DWORD *)audit_token_t atoken = 138543874;
          *(void *)&atoken[4] = v117;
          *(_WORD *)&atoken[12] = 2114;
          *(void *)&atoken[14] = v113;
          *(_WORD *)&atoken[22] = 2114;
          *(void *)&atoken[24] = v115;
          _os_log_error_impl( (void *)&_mh_execute_header,  v66,  OS_LOG_TYPE_ERROR,  "Rejecting RBSProcessHandle %{public}@ for App Extension because process handle's audit token %{public}@ does n't match original %{public}@",  atoken,  0x20u);

          bundle = 0LL;
          id v60 = v116;
        }

        else
        {
          bundle = 0LL;
          id v60 = v116;
          v59 = v117;
        }

        goto LABEL_65;
      }

      v59 = v117;
      v65 = (os_log_s *)objc_claimAutoreleasedReturnValue([v117 hostProcess]);
      if (v65)
      {
        v66 = v65;
        id v60 = v116;
        if ((-[os_log_s isApplication](v65, "isApplication") & 1) != 0)
        {
          -[os_log_s auditToken](v66, "auditToken");
          id v121 = v116;
          v122[0] = *(_OWORD *)atoken;
          v122[1] = *(_OWORD *)&atoken[16];
          bundle = (TCCDBundle *)objc_claimAutoreleasedReturnValue( +[LSBundleRecord bundleRecordForAuditToken:error:]( &OBJC_CLASS___LSBundleRecord,  "bundleRecordForAuditToken:error:",  v122,  &v121));
          id v68 = v121;

          if (bundle)
          {
            v69 = bundle;
          }

          else
          {
            id v110 = tcc_access_log();
            v111 = (os_log_s *)objc_claimAutoreleasedReturnValue(v110);
            if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR)) {
              sub_1000156A4();
            }
          }

          id v60 = v68;
          goto LABEL_65;
        }

        id v91 = tcc_access_log();
        v92 = (os_log_s *)objc_claimAutoreleasedReturnValue(v91);
        if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR)) {
          sub_10001570C();
        }
      }

      else
      {
        id v89 = tcc_access_log();
        v90 = (os_log_s *)objc_claimAutoreleasedReturnValue(v89);
        id v60 = v116;
        if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR)) {
          sub_100015644();
        }

        v66 = 0LL;
      }
    }

    else
    {
      id v87 = tcc_access_log();
      v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(v87);
      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
        sub_1000155E4();
      }
    }

    bundle = 0LL;
LABEL_65:

    if (!bundle
      || (uint64_t v93 = objc_claimAutoreleasedReturnValue(-[TCCDBundle bundleIdentifier](bundle, "bundleIdentifier"))) == 0
      || (v94 = (void *)v93,
          v95 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDBundle URL](bundle, "URL")),
          v95,
          v94,
          !v95))
    {
      id v109 = tcc_access_log();
      v104 = (os_log_s *)objc_claimAutoreleasedReturnValue(v109);
      if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR)) {
        sub_10001557C();
      }
      goto LABEL_79;
    }

    v96 = (NSString *)objc_claimAutoreleasedReturnValue(-[TCCDBundle bundleIdentifier](bundle, "bundleIdentifier"));
    v97 = self->_identifier;
    self->_identifier = v96;

    uint64_t v98 = objc_claimAutoreleasedReturnValue(-[TCCDBundle URL](bundle, "URL"));
    bundle = (TCCDBundle *)v98;
LABEL_69:
    v99 = (TCCDBundle *)objc_claimAutoreleasedReturnValue(+[TCCDBundle bundleWithURL:](&OBJC_CLASS___TCCDBundle, "bundleWithURL:", bundle));
    v100 = self->_bundle;
    self->_bundle = v99;

    v101 = self->_bundle;
    v102 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
    v103 = (void *)objc_claimAutoreleasedReturnValue([v102 server]);
    v104 = (os_log_s *)objc_claimAutoreleasedReturnValue([v103 logHandle]);

    if (v101)
    {
      if (os_log_type_enabled(v104, OS_LOG_TYPE_INFO))
      {
        v105 = self->_pluginBundleURL;
        v106 = self->_bundle;
        *(_DWORD *)audit_token_t atoken = 138543618;
        *(void *)&atoken[4] = v105;
        *(_WORD *)&atoken[12] = 2114;
        *(void *)&atoken[14] = v106;
        _os_log_impl( (void *)&_mh_execute_header,  v104,  OS_LOG_TYPE_INFO,  "IDENTITY_ATTRIBUTION: Attributing App Extension %{public}@ to %{public}@",  atoken,  0x16u);
      }

      *(void *)audit_token_t atoken = 0LL;
      if (TCCDServerHasPolicyOverride( self->_pluginBundleIdentifier,  (id *)&self->_policy_id,  (void **)&self->_identifier,  (id *)atoken))
      {
        self->_int client_type = 2;
        v119[0] = _NSConcreteStackBlock;
        v119[1] = 3221225472LL;
        v119[2] = sub_100013D40;
        v119[3] = &unk_100065318;
        id v120 = *(id *)atoken;
        v107 = objc_retainBlock(v119);
        id displayNameBlock = self->displayNameBlock;
        self->id displayNameBlock = v107;
      }

      id v10 = 0LL;
      goto LABEL_41;
    }

    if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR)) {
      sub_1000154E8(v5, v104);
    }
LABEL_79:

    id v10 = 0LL;
    goto LABEL_50;
  }

  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_1000153A0(v10, v36, v37, v38, v39, v40, v41, v42);
  }
  BOOL v43 = 0;
LABEL_52:

  return v43;
}

- (TCCDAccessIdentity)initWithAttributionChain:(id)a3 preferMostSpecificIdentifier:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = -[TCCDAccessIdentity init](self, "init");
  if (!v7) {
    goto LABEL_14;
  }
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v6 requestingProcess]);
  v7->_targetPID = [v8 pid];

  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v6 responsibleProcess]);
  v7->_int responsiblePID = [v9 pid];

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 accessingProcess]);
  __int128 v11 = v10;
  if (v10)
  {
    [v10 auditToken];
  }

  else
  {
    __int128 v31 = 0u;
    __int128 v32 = 0u;
  }

  *(_OWORD *)v7->_accessorAuditToken.val = v31;
  *(_OWORD *)&v7->_accessorAuditToken.val[4] = v32;
  v12 = (void *)objc_claimAutoreleasedReturnValue([v6 responsibleProcess]);
  uint64_t v13 = v12;
  if (v12)
  {
    [v12 auditToken];
  }

  else
  {
    __int128 v29 = 0u;
    __int128 v30 = 0u;
  }

  *(_OWORD *)v7->_responsibleAuditToken.val = v29;
  *(_OWORD *)&v7->_responsibleAuditToken.val[4] = v30;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v6 responsibleProcess]);
  uint64_t v15 = objc_claimAutoreleasedReturnValue([v14 responsiblePath]);
  path = v7->_path;
  v7->_path = (NSString *)v15;

  if (!v7->_path)
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
    v19 = (void *)objc_claimAutoreleasedReturnValue([v18 server]);
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v19 logHandle]);

    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_100015874(v20, v21, v22, v23, v24, v25, v26, v27);
    }

    goto LABEL_14;
  }

  if (!-[TCCDAccessIdentity _deriveIdentityFromAttributionChain:preferMostSpecificIdentifier:]( v7,  "_deriveIdentityFromAttributionChain:preferMostSpecificIdentifier:",  v6,  v4))
  {
LABEL_14:
    id v17 = 0LL;
    goto LABEL_15;
  }

  id v17 = v7;
LABEL_15:

  return v17;
}

- (TCCDAccessIdentity)initWithMessage:(id)a3
{
  id v4 = a3;
  if (!xpc_dictionary_get_data(v4, "target_token", &length) || length != 32)
  {
    self = -[TCCDAccessIdentity init](self, "init");
    if (self)
    {
      string = xpc_dictionary_get_string(v4, "client_type");
      unsigned int v8 = xpc_dictionary_get_string(v4, "client");
      unsigned int v9 = xpc_dictionary_get_string(v4, "bundle_url");
      if (!string || !v8) {
        goto LABEL_24;
      }
      id v10 = v9;
      __int128 v11 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v8));
      identifier = self->_identifier;
      self->_identifier = v11;

      if (v11)
      {
        if (!strcmp(string, "bundle"))
        {
          self->_int client_type = 0;
          if (v10)
          {
            uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v10));
            uint64_t v14 = (TCCDBundle *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v13));

            uint64_t v15 = (TCCDBundle *)objc_claimAutoreleasedReturnValue(+[TCCDBundle bundleWithURL:](&OBJC_CLASS___TCCDBundle, "bundleWithURL:", v14));
            bundle = self->_bundle;
            self->_bundle = v15;
          }

          else
          {
            v19 = (TCCDBundle *)objc_claimAutoreleasedReturnValue( +[TCCDBundle bundleWithIdentifier:]( &OBJC_CLASS___TCCDBundle,  "bundleWithIdentifier:",  self->_identifier));
            uint64_t v14 = self->_bundle;
            self->_bundle = v19;
          }

          v20 = (NSString *)objc_claimAutoreleasedReturnValue(-[TCCDBundle executablePath](self->_bundle, "executablePath"));
          path = self->_path;
          self->_path = v20;

          uint64_t v22 = self->_bundle;
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 server]);
          id v18 = (NSString *)objc_claimAutoreleasedReturnValue([v24 logHandle]);

          if (v22)
          {
            if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v25 = self->_bundle;
              uint64_t v26 = self->_identifier;
              *(_DWORD *)buf = 136446978;
              __int128 v32 = "-[TCCDAccessIdentity initWithMessage:]";
              __int16 v33 = 2114;
              int v34 = v25;
              __int16 v35 = 2114;
              uint64_t v36 = (TCCDBundle *)v26;
              __int16 v37 = 2082;
              uint64_t v38 = (NSString *)v10;
              _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)v18,  OS_LOG_TYPE_DEBUG,  "%{public}s: bundle:%{public}@; for: %{public}@ with url: %{public}s",
                buf,
                0x2Au);
            }
          }

          else if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_ERROR))
          {
            id v28 = self->_bundle;
            __int128 v29 = self->_identifier;
            *(_DWORD *)buf = 136447234;
            __int128 v32 = "-[TCCDAccessIdentity initWithMessage:]";
            __int16 v33 = 2048;
            int v34 = v28;
            __int16 v35 = 2114;
            uint64_t v36 = v28;
            __int16 v37 = 2114;
            uint64_t v38 = v29;
            __int16 v39 = 2082;
            uint64_t v40 = v10;
            _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v18,  OS_LOG_TYPE_ERROR,  "%{public}s: self.bundle=%p, bundle:%{public}@; for: %{public}@ with url: %{public}s",
              buf,
              0x34u);
          }
        }

        else
        {
          if (strcmp(string, "path")) {
            goto LABEL_11;
          }
          self->_int client_type = 1;
          id v17 = self->_identifier;
          id v18 = self->_path;
          self->_path = v17;
        }

LABEL_24:
        self = self;
        id v6 = self;
        goto LABEL_25;
      }
    }

- (TCCDAccessIdentity)initWithBundleIdentifier:(id)a3 isWK2Proxy:(BOOL)a4
{
  id v7 = a3;
  unsigned int v8 = -[TCCDAccessIdentity init](self, "init");
  unsigned int v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identifier, a3);
    v9->_int client_type = 0;
    v9->_is_wk2_proxy = a4;
    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[TCCDBundle bundleWithIdentifier:](&OBJC_CLASS___TCCDBundle, "bundleWithIdentifier:", v7));
    bundle = v9->_bundle;
    v9->_bundle = (TCCDBundle *)v10;

    v12 = v9->_bundle;
    if (v12)
    {
      uint64_t v13 = objc_claimAutoreleasedReturnValue(-[TCCDBundle executablePath](v12, "executablePath"));
      path = v9->_path;
      v9->_path = (NSString *)v13;
    }

    uint64_t v15 = v9->_identifier;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_100014398;
    v21[3] = &unk_100065318;
    uint64_t v22 = v15;
    uint64_t v16 = v15;
    id v17 = objc_retainBlock(v21);
    id displayNameBlock = v9->displayNameBlock;
    v9->id displayNameBlock = v17;

    v19 = v9;
  }

  return v9;
}

- (TCCDAccessIdentity)initWithIdentifier:(id)a3 type:(int)a4 executableURL:(id)a5 SDKVersion:(unsigned int)a6 platformType:(unsigned int)a7
{
  id v13 = a3;
  id v14 = a5;
  uint64_t v15 = -[TCCDAccessIdentity init](self, "init");
  uint64_t v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_identifier, a3);
    v16->_int client_type = a4;
    if (a4 == 1)
    {
      objc_storeStrong((id *)&v16->_path, v16->_identifier);
      if (v16->_path)
      {
        uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:"));
        if (!v22) {
          goto LABEL_17;
        }
        goto LABEL_16;
      }

      __int16 v33 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
      int v34 = (void *)objc_claimAutoreleasedReturnValue([v33 server]);
      uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue([v34 logHandle]);

      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_10001596C(v22, v35, v36, v37, v38, v39, v40, v41);
      }
LABEL_22:
      uint64_t v21 = 0LL;
      goto LABEL_23;
    }

    if (!a4)
    {
      if (v14)
      {
        id v17 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
        id v18 = (TCCDBundle *)objc_claimAutoreleasedReturnValue([v17 appBundleURLContainingExecutableURL:v14]);

        if (v18)
        {
          uint64_t v19 = objc_claimAutoreleasedReturnValue(+[TCCDBundle bundleWithURL:](&OBJC_CLASS___TCCDBundle, "bundleWithURL:", v18));
          bundle = v16->_bundle;
          v16->_bundle = (TCCDBundle *)v19;
        }
      }

      else
      {
        uint64_t v23 = objc_claimAutoreleasedReturnValue(+[TCCDBundle bundleWithIdentifier:](&OBJC_CLASS___TCCDBundle, "bundleWithIdentifier:", v13));
        id v18 = v16->_bundle;
        v16->_bundle = (TCCDBundle *)v23;
      }

      uint64_t v24 = v16->_bundle;
      if (v24)
      {
        uint64_t v25 = objc_claimAutoreleasedReturnValue(-[TCCDBundle executablePath](v24, "executablePath"));
        path = v16->_path;
        v16->_path = (NSString *)v25;

        uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[TCCDBundle bundleURL](v16->_bundle, "bundleURL"));
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
        id v28 = (void *)objc_claimAutoreleasedReturnValue([v27 server]);
        __int128 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue([v28 logHandle]);

        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDAccessIdentity bundle](v16, "bundle"));
          __int128 v31 = v16->_bundle;
          identifier = v16->_identifier;
          int v45 = 136447490;
          id v46 = "-[TCCDAccessIdentity initWithIdentifier:type:executableURL:SDKVersion:platformType:]";
          __int16 v47 = 2048;
          int64_t v48 = v30;
          __int16 v49 = 2114;
          v50 = v31;
          __int16 v51 = 2114;
          v52 = identifier;
          __int16 v53 = 2114;
          id v54 = v14;
          __int16 v55 = 2082;
          id v56 = [v14 fileSystemRepresentation];
          _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_INFO,  "%{public}s: self.bundle=%p, bundle:%{public}@; for: %{public}@, URL: %{public}@, %{public}s",
            (uint8_t *)&v45,
            0x3Eu);
        }

        if (!v22) {
          goto LABEL_17;
        }
LABEL_16:
        -[TCCDAccessIdentity _makeDisplayNameBlockForURL:](v16, "_makeDisplayNameBlockForURL:", v22);
LABEL_17:
        v16->_sdkVersion = a6;
        v16->_platformType = a7;
        uint64_t v21 = v16;
LABEL_23:

        goto LABEL_24;
      }

      uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
      BOOL v43 = (void *)objc_claimAutoreleasedReturnValue([v42 server]);
      uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue([v43 logHandle]);

      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_1000158A4((uint64_t *)&v16->_identifier, v14, v22);
      }
      goto LABEL_22;
    }
  }

  uint64_t v21 = 0LL;
LABEL_24:

  return v21;
}

- (id)_initWithAccessIdentity:(id)a3
{
  id v4 = a3;
  id v5 = -[TCCDAccessIdentity init](self, "init");
  id v6 = v5;
  if (v5)
  {
    -[TCCDAccessIdentity _updateFromAccessIdentity:](v5, "_updateFromAccessIdentity:", v4);
    id v7 = v6;
  }

  return v6;
}

- (void)_updateFromAccessIdentity:(id)a3
{
  id v4 = a3;
  self->_int client_type = objc_msgSend(v4, "client_type");
  id v5 = (NSString *)objc_claimAutoreleasedReturnValue([v4 identifier]);
  identifier = self->_identifier;
  self->_identifier = v5;

  id v7 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "policy_id"));
  policy_id = self->_policy_id;
  self->_policy_id = v7;

  unsigned int v9 = (NSString *)objc_claimAutoreleasedReturnValue([v4 path]);
  path = self->_path;
  self->_path = v9;

  __int128 v11 = (TCCDBundle *)objc_claimAutoreleasedReturnValue([v4 bundle]);
  bundle = self->_bundle;
  self->_bundle = v11;

  id v13 = (void *)v4[1];
  id v14 = objc_retainBlock(v13);
  id displayNameBlock = self->displayNameBlock;
  self->id displayNameBlock = v14;
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: identifier=%@, client_type=%u>",  objc_opt_class(self, a2),  self->_identifier,  self->_client_type);
}

- (id)displayName
{
  return (id)(*((uint64_t (**)(void))self->displayNameBlock + 2))();
}

- (NSString)attributionPath
{
  if (self->_client_type == 1 || !self->_bundle) {
    v2 = self->_path;
  }
  else {
    v2 = (NSString *)objc_claimAutoreleasedReturnValue(-[TCCDBundle bundlePath](self->_bundle, "bundlePath"));
  }
  return v2;
}

- (BOOL)getSDKVersion:(unsigned int *)a3 platformType:(unsigned int *)a4
{
  unsigned int sdkVersion = self->_sdkVersion;
  if (sdkVersion)
  {
    *a3 = sdkVersion;
    *a4 = self->_platformType;
    return 1;
  }

  unsigned int v9 = self;
  objc_sync_enter(v9);
  unsigned int v10 = self->_sdkVersion;
  if (v10)
  {
LABEL_4:
    *a3 = v10;
    *a4 = v9->_platformType;
    BOOL v8 = 1;
    goto LABEL_56;
  }

  id v11 = objc_claimAutoreleasedReturnValue(-[TCCDAccessIdentity path](v9, "path"));
  v12 = (const char *)[v11 fileSystemRepresentation];

  if (!v12)
  {
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
    id v28 = (void *)objc_claimAutoreleasedReturnValue([v27 server]);
    __int128 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue([v28 logHandle]);

    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDAccessIdentity path](v9, "path"));
      sub_10001599C(v30, (uint64_t)buf, v29);
    }

    goto LABEL_55;
  }

  off_t v65 = 0LL;
  *__error() = 0;
  id v13 = (id)-[TCCDAccessIdentity targetPID](v9, "targetPID");
  int v14 = (int)v13;
  if ((int)v13 >= 1 && csops(v13, 6LL, &v65, 8LL))
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 server]);
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 logHandle]);

    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v51 = *__error();
      v52 = __error();
      __int16 v53 = strerror(*v52);
      *(_DWORD *)buf = 136446978;
      v70 = v12;
      __int16 v71 = 1024;
      *(_DWORD *)v72 = v14;
      *(_WORD *)&v72[4] = 1024;
      *(_DWORD *)&v72[6] = v51;
      *(_WORD *)&v72[10] = 2082;
      *(void *)&v72[12] = v53;
      _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "failed to get text offset for %{public}s[%d]: (#%d) %{public}s",  buf,  0x22u);
    }

    goto LABEL_55;
  }

  off_t v18 = v65;
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
  v20 = (void *)objc_claimAutoreleasedReturnValue([v19 server]);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 logHandle]);

  int v22 = open(v12, 0);
  int v23 = v22;
  if (v22 == -1)
  {
    __int128 v31 = v21;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      int v54 = *__error();
      __int16 v55 = __error();
      id v56 = strerror(*v55);
      *(_DWORD *)buf = 136446722;
      v70 = v12;
      __int16 v71 = 1024;
      *(_DWORD *)v72 = v54;
      *(_WORD *)&v72[4] = 2082;
      *(void *)&v72[6] = v56;
      _os_log_error_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "failed to open %{public}s: (#%d): %{public}s",  buf,  0x1Cu);
    }

    goto LABEL_55;
  }

  ssize_t v24 = pread(v22, __buf, 0x1CuLL, v18);
  if (v24 != 28)
  {
    __int128 v32 = v21;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      if (v24 == -1)
      {
        v57 = __error();
        v58 = strerror(*v57);
      }

      else
      {
        v58 = "truncated";
      }

      *(_DWORD *)buf = 136447234;
      v70 = v12;
      __int16 v71 = 2082;
      *(void *)v72 = v58;
      *(_WORD *)&v72[8] = 2048;
      *(void *)&v72[10] = v18;
      *(_WORD *)&v72[18] = 2048;
      uint64_t v73 = 28LL;
      __int16 v74 = 2048;
      ssize_t v75 = v24;
      _os_log_error_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_ERROR,  "failed to read header from %{public}s: %{public}s;  (textoff: %llu, expected size: %lu, got: %zd)",
        buf,
        0x34u);
    }

    goto LABEL_52;
  }

  int v25 = __buf[0];
  if (__buf[0] == -17958193)
  {
    int v64 = v21;
    uint64_t v26 = 32LL;
  }

  else
  {
    if (__buf[0] != -17958194)
    {
      if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v70 = v12;
        __int16 v71 = 1024;
        *(_DWORD *)v72 = v25;
        *(_WORD *)&v72[4] = 2048;
        *(void *)&v72[6] = v18;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v21,  OS_LOG_TYPE_ERROR,  "spooky magic for %{public}s (0x%x) at text offset: %lld",  buf,  0x1Cu);
      }

      goto LABEL_53;
    }

    int v64 = v21;
    uint64_t v26 = 28LL;
  }

  size_t v33 = __size;
  int v34 = (int *)malloc(__size);
  if (!v34)
  {
    uint64_t v21 = v64;
    __int128 v32 = v64;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      int v61 = *__error();
      pid_t v62 = __error();
      int v63 = strerror(*v62);
      *(_DWORD *)buf = 136446722;
      v70 = v12;
      __int16 v71 = 1024;
      *(_DWORD *)v72 = v61;
      *(_WORD *)&v72[4] = 2082;
      *(void *)&v72[6] = v63;
      _os_log_error_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_ERROR,  "can't allocate buffer for %{public}s: (#%d) %{public}s",  buf,  0x1Cu);
    }

- (BOOL)isPlugInWithExtensionPointIdentifier:(id)a3
{
  id v4 = a3;
  pluginBundleURL = self->_pluginBundleURL;
  p_pluginBundleURL = (uint64_t *)&self->_pluginBundleURL;
  if (pluginBundleURL)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDBundle bundleWithURL:](&OBJC_CLASS___TCCDBundle, "bundleWithURL:"));
    BOOL v8 = v7;
    if (v7)
    {
      unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v7 extensionPointIdentifier]);
      unsigned __int8 v10 = [v9 isEqualToString:v4];
    }

    else
    {
      id v11 = tcc_access_log();
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_100015BC4(p_pluginBundleURL, v12, v13);
      }

      unsigned __int8 v10 = 0;
    }
  }

  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (BOOL)isAvocadoWidget
{
  return -[TCCDAccessIdentity isPlugInWithExtensionPointIdentifier:]( self,  "isPlugInWithExtensionPointIdentifier:",  @"com.apple.widgetkit-extension");
}

- (BOOL)isCaptureExtension
{
  return -[TCCDAccessIdentity isPlugInWithExtensionPointIdentifier:]( self,  "isPlugInWithExtensionPointIdentifier:",  @"com.apple.securecapture");
}

- (int)client_type
{
  return self->_client_type;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (NSNumber)policy_id
{
  return (NSNumber *)objc_getProperty(self, a2, 48LL, 1);
}

- (BOOL)is_wk2_proxy
{
  return self->_is_wk2_proxy;
}

- (NSString)path
{
  return (NSString *)objc_getProperty(self, a2, 56LL, 1);
}

- (TCCDBundle)bundle
{
  return (TCCDBundle *)objc_getProperty(self, a2, 64LL, 1);
}

- (int)targetPID
{
  return self->_targetPID;
}

- (int)responsiblePID
{
  return self->_responsiblePID;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)accessorAuditToken
{
  return result;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)responsibleAuditToken
{
  return result;
}

- (NSString)pluginBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 72LL, 1);
}

- (NSURL)pluginBundleURL
{
  return (NSURL *)objc_getProperty(self, a2, 80LL, 1);
}

- (BOOL)pluginTargetsSystemExtensionPoint
{
  return self->_pluginTargetsSystemExtensionPoint;
}

- (int64_t)pluginPromptPolicy
{
  return self->_pluginPromptPolicy;
}

- (int64_t)appExtensionType
{
  return self->_appExtensionType;
}

- (void).cxx_destruct
{
}

@end