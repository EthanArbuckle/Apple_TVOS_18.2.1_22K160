@interface BKAlternateSystemApp
+ (id)_bundleInfoOverrides;
- (BKAlternateSystemApp)initWithBundleId:(id)a3 options:(id)a4 queue:(id)a5;
- (BOOL)launchWithResultBlock:(id)a3 exitBlock:(id)a4;
- (BOOL)terminate;
- (NSDictionary)options;
- (NSString)bundleID;
- (NSString)description;
- (OS_dispatch_queue)queue;
- (RBSAssertion)visibilityAssertion;
- (RBSProcessHandle)processHandle;
- (id)pendingExitBlock;
- (void)_noteExitedWithContext:(id)a3;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setOptions:(id)a3;
- (void)setPendingExitBlock:(id)a3;
- (void)setProcessHandle:(id)a3;
- (void)setQueue:(id)a3;
- (void)setVisibilityAssertion:(id)a3;
@end

@implementation BKAlternateSystemApp

- (BKAlternateSystemApp)initWithBundleId:(id)a3 options:(id)a4 queue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = [BKAlternateSystemApp class];
  BKAlternateSystemApp *v11 = [[BKAlternateSystemApp alloc] init];
  v12 = v11;
  if (v11)
  {
    [v11 setBundleID:v8];
    [v12 setOptions:v9];
    [v12 setQueue:v10];
  }

  return v12;
}

- (NSString)description
{
  return [BSDescriptionStream descriptionForRootObject:self];
}

- (void)appendDescriptionToFormatter:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100022AAC;
  v5[3] = &unk_1000B8030;
  id v6 = a3;
  v7 = self;
  id v4 = v6;
  [v4 appendProem:self block:v5];
}

- (BOOL)launchWithResultBlock:(id)a3 exitBlock:(id)a4
{
  id v7 = a3;
  id v93 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  val = self;
  location = (id *)&self->_processHandle;
  if (self->_processHandle)
  {
    v71 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_processHandle == nil"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v72 = NSStringFromSelector(a2);
      v73 = [v72 autorelease];
      v75 = [self class];
      v76 = NSStringFromClass(v75);
      BKAlternateSystemApp *v77 = [v76 autorelease];
      *(_DWORD *)buf = 138544642;
      v122 = v73;
      __int16 v123 = 2114;
      v124 = v77;
      __int16 v125 = 2048;
      v126 = self;
      __int16 v127 = 2114;
      v128 = @"BKAlternateSystemApp.m";
      __int16 v129 = 1024;
      int v130 = 89;
      __int16 v131 = 2114;
      v132 = v71;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  buf,  0x3Au);
    }

    _bs_set_crash_log_message([v71 UTF8String]);
    __break(0);
    JUMPOUT(0x100022544LL);
  }

  uint64_t v8 = BKLogAlternateSystemApp();
  id v9 = [v8 autorelease];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v122 = self;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "launchWithResultBlock: %{public}@", buf, 0xCu);
  }

  v116[0] = _NSConcreteStackBlock;
  v116[1] = 3221225472LL;
  v116[2] = sub_100022920;
  v116[3] = &unk_1000B73F0;
  v116[4] = self;
  id v88 = v7;
  id v117 = v88;
  v89 = objc_retainBlock(v116);
  id v10 = [v93 copy];
  id pendingExitBlock = self->_pendingExitBlock;
  self->_id pendingExitBlock = v10;

  NSDictionary *v13 = [self _bundleInfoOverrides];
  v92 = v13;
  objc_super v14 = [v92 objectForKey:self->_bundleID];
  v95 = v14;
  if (v14)
  {
    v15 = [v14 objectForKey:@"OverrideURL"];
    v94 = [NSURL URLWithString:v15];

    v96 = (__CFString *)[v95 objectForKey:@"OverrideAppType"];
    uint64_t v16 = BKLogAlternateSystemApp();
    os_log_s *v17 = [v16 autorelease];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      bundleID = self->_bundleID;
      *(_DWORD *)buf = 134218754;
      v122 = self;
      __int16 v123 = 2114;
      v124 = (BKAlternateSystemApp *)bundleID;
      __int16 v125 = 2114;
      v126 = v94;
      __int16 v127 = 2114;
      v128 = v96;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "launchWithResultBlock %p: Using built-in information for bundle ID %{public}@: URL=\"%{public}@\" appType=\"%{public}@\"",  buf,  0x2Au);
    }

    goto LABEL_11;
  }

  v19 = self->_bundleID;
  id v115 = 0LL;
  v96 = [LSBundleRecord bundleRecordWithBundleIdentifier:v19 allowPlaceholder:0LL error:&v115];
  v20 = (BKAlternateSystemApp *)v115;
  if (v96 && !v20)
  {
    v94 = [v96 URL];
LABEL_11:

    v96 = [v94 path];
    id v91 = [[BSCFBundle alloc] initWithPath:v96];
    v90 = [v91 executablePath];
    if (v90)
    {
      v21 = [NSMutableDictionary dictionary];
      BSMutableMachServiceAliases *v99 = [[BSMutableMachServiceAliases alloc] init];
      v87 = [self->_bundleID stringByAppendingString:@".jail."];
      v86 = [v87 stringByAppendingString:@"com.apple.frontboard.systemappservices"];
      v85 = [v87 stringByAppendingString:@"com.apple.frontboard.workspace"];
      [v21 setObject:&__kCFBooleanTrue forKey:v86];
      [v21 setObject:&__kCFBooleanTrue forKey:v85];
      [v99 setService:@"com.apple.frontboard.systemappservices" forAlias:v86];
      [v99 setService:v85 forAlias:@"com.apple.frontboard.workspace"];
      v83 = (void *)[v91 infoDictionary];
      v84 = [v83 bs_safeDictionaryForKey:@"BKSLaunchdPlist"];
      __int128 v113 = 0u;
      __int128 v114 = 0u;
      __int128 v111 = 0u;
      __int128 v112 = 0u;
      id obj = [v84 bs_safeDictionaryForKey:@"MachServices"];
      id v22 = [obj countByEnumeratingWithState:&v111 objects:v120 count:16];
      if (v22)
      {
        uint64_t v23 = *(void *)v112;
        do
        {
          for (i = 0LL; i != v22; i = (char *)i + 1)
          {
            if (*(void *)v112 != v23) {
              objc_enumerationMutation(obj);
            }
            v25 = *(void **)(*((void *)&v111 + 1) + 8LL * (void)i);
            if ([v25 length]) {
              [v21 setObject:&__kCFBooleanTrue forKey:v25];
            }
          }

          id v22 = [obj countByEnumeratingWithState:v111 objects:v120 count:16];
        }

        while (v22);
      }

      __int128 v109 = 0u;
      __int128 v110 = 0u;
      __int128 v107 = 0u;
      __int128 v108 = 0u;
      id v26 = [v84 bs_safeDictionaryForKey:@"AlternateMachServices"];
      id v27 = [v26 countByEnumeratingWithState:v107 objects:v119 count:16];
      if (v27)
      {
        uint64_t v28 = *(void *)v108;
        do
        {
          for (j = 0LL; j != v27; j = (char *)j + 1)
          {
            if (*(void *)v108 != v28) {
              objc_enumerationMutation(v26);
            }
            v30 = *(BKAlternateSystemApp **)(*((void *)&v107 + 1) + 8LL * (void)j);
            if (-[BKAlternateSystemApp length](v30, "length"))
            {
              v31 = [v26 bs_safeStringForKey:v30];
              if (-[__CFString length](v31, "length"))
              {
                v32 = [v21 objectForKey:v31];
                BOOL v33 = v32 == 0LL;

                uint64_t v34 = BKLogAlternateSystemApp();
                os_log_s *v35 = v34;
                v36 = v35;
                if (v33)
                {
                  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
                  {
                    v38 = val->_bundleID;
                    *(_DWORD *)buf = 134218754;
                    v122 = val;
                    __int16 v123 = 2114;
                    v124 = (BKAlternateSystemApp *)v38;
                    __int16 v125 = 2114;
                    v126 = v30;
                    __int16 v127 = 2114;
                    v128 = v31;
                    _os_log_error_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_ERROR,  "launchWithResultBlock %p: [%{public}@] Ignoring alternate mach service for %{public}@ because mapped service %{public}@ does not exist.",  buf,  0x2Au);
                  }
                }

                else
                {
                  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
                  {
                    v37 = val->_bundleID;
                    *(_DWORD *)buf = 134218754;
                    v122 = val;
                    __int16 v123 = 2114;
                    v124 = (BKAlternateSystemApp *)v37;
                    __int16 v125 = 2112;
                    v126 = (BKAlternateSystemApp *)v31;
                    __int16 v127 = 2112;
                    v128 = (const __CFString *)v30;
                    _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "launchWithResultBlock %p: [%{public}@] Registering alternate mach service %@ in place of %@.",  buf,  0x2Au);
                  }

                  [v99 setService:v31 forAlias:v30];
                }
              }
            }
          }

          id v27 = [v26 countByEnumeratingWithState:v107 objects:v119 count:16];
        }

        while (v27);
      }

      RBSProcessIdentity *v82 = [RBSProcessIdentity identityForEmbeddedApplicationIdentifier:val->_bundleID];
      RBSLaunchContext *v39 = [RBSLaunchContext contextWithIdentity:v82];
      [v39 setSpawnType:1];
      [v39 _setOverrideExecutablePath:v90];
      v40 = [BSMutableMachServiceAliases environmentRepresentation];
      [v39 _setAdditionalEnvironment:v40];

      v41 = [v21 allKeys];
      [v39 _setAdditionalMachServices:v41];

      id v81 = [[RBSLaunchRequest alloc] initWithContext:v39];
      id v105 = 0LL;
      id v106 = 0LL;
      unsigned __int8 v42 = [v81 execute:&v106 error:&v105];
      id v43 = v106;
      id v78 = v106;
      id v97 = v105;
      if ((v42 & 1) != 0)
      {
        objc_storeStrong(location, v43);
        [from release];
from = [val retain];
        processHandle = val->_processHandle;
        v102[0] = _NSConcreteStackBlock;
        v102[1] = 3221225472LL;
        v102[2] = sub_100022A04;
        v102[3] = &unk_1000B61F8;
        objc_copyWeak(&v103, &from);
        [processHandle monitorForDeath:v102];
        locationa = [RBSTarget targetWithPid:[*location pid] environmentIdentifier:@"com.apple.backboard.alternateSystemApp"];
        RBSAssertion *v45 = [[RBSAssertion alloc] init];
        v46 = [RBSEndowmentGrant grantWithNamespace:@"com.apple.frontboard.visibility" endowment:YES];
        v118[0] = v46;
        RBSJetsamPriorityGrant *v47 = [RBSJetsamPriorityGrant grantWithForegroundPriority];
        v118[1] = v47;
        v48 = [RBSCPUAccessGrant grantWithUserInteractivity];
        v118[2] = v48;
        v49 = [RBSGPUAccessGrant grant];
        v118[3] = v49;
        RBSResistTerminationGrant *v50 = [[RBSResistTerminationGrant alloc] initWithResistance:40LL];
        v118[4] = v50;
        v51 = [NSArray arrayWithObjects:v118, 5LL];
        RBSAssertion *v52 = [[RBSAssertion alloc] initWithExplanation:@"Alternate system app" target:locationa attributes:v51];
        visibilityAssertion = val->_visibilityAssertion;
        val->_visibilityAssertion = v52;

        v54 = val->_visibilityAssertion;
        id v101 = 0LL;
        unsigned __int8 v55 = [RBSAssertion acquireWithError:&v101];
        id v56 = v101;

        if ((v55 & 1) != 0)
        {
          uint64_t v57 = BKLogAlternateSystemApp();
          v58 = os_log_create("com.apple.springboard", "com.apple.springboard.launchd");
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            v122 = val;
            __int16 v123 = 2114;
            v124 = val;
            _os_log_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_DEFAULT,  "launchSucceeded %p: %{public}@",  buf,  0x16u);
          }

          (*((void (**)(id, void))v88 + 2))(v88, 0LL);
        }

        else
        {
          uint64_t v65 = BKLogAlternateSystemApp();
          v66 = v65;
          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
          {
            v70 = [v56 descriptionWithMultilinePrefix:0];
            *(_DWORD *)buf = 134218242;
            v122 = val;
            __int16 v123 = 2114;
            v124 = v70;
            _os_log_error_impl( (void *)&_mh_execute_header,  v66,  OS_LOG_TYPE_ERROR,  "launchWithResultBlock %p: launch succeeded but app was not made visible: %{public}@",  buf,  0x16u);
          }

          [BKAlternateSystemApp terminate];
          ((void (*)(void))v89[2])();
        }

        v103 = nil;
        [from release];
        id v97 = v56;
      }

      else
      {
        uint64_t v61 = BKLogAlternateSystemApp();
        v62 = v61;
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        {
          v68 = [v97 descriptionWithMultilinePrefix:0];
          *(_DWORD *)buf = 134218242;
          v122 = val;
          __int16 v123 = 2114;
          v124 = v68;
          _os_log_error_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_ERROR,  "launchWithResultBlock %p: launch failed: %{public}@",  buf,  0x16u);
        }

        ((void (*)(void))v89[2])();
        unsigned __int8 v55 = 0;
      }
    }

    else
    {
      uint64_t v59 = BKLogAlternateSystemApp();
      v60 = [os_log logWithName:@"com.apple.BKHIDEventClient"];
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218242;
        v122 = self;
        __int16 v123 = 2114;
        v124 = (BKAlternateSystemApp *)v96;
        _os_log_error_impl( (void *)&_mh_execute_header,  v60,  OS_LOG_TYPE_ERROR,  "launchWithResultBlock %p: launch failed: no executable path for bundle at path %{public}@",  buf,  0x16u);
      }

      ((void (*)(void))v89[2])();
      unsigned __int8 v55 = 0;
    }

    goto LABEL_58;
  }

  v94 = v20;
  uint64_t v63 = BKLogAlternateSystemApp();
  v64 = [os_log logWithName:v63];
  if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
  {
    v69 = self->_bundleID;
    *(_DWORD *)buf = 134218498;
    v122 = self;
    __int16 v123 = 2114;
    v124 = (BKAlternateSystemApp *)v69;
    __int16 v125 = 2114;
    v126 = v94;
    _os_log_error_impl( (void *)&_mh_execute_header,  v64,  OS_LOG_TYPE_ERROR,  "launchWithResultBlock %p: launch failed: error from LS %{public}@ -- %{public}@",  buf,  0x20u);
  }

  ((void (*)(void))v89[2])();
  unsigned __int8 v55 = 0;
LABEL_58:

  return v55;
}

- (BOOL)terminate
{
  id pendingExitBlock = self->_pendingExitBlock;
  self->_id pendingExitBlock = 0LL;

  [self->_visibilityAssertion invalidate];
  visibilityAssertion = self->_visibilityAssertion;
  self->_visibilityAssertion = 0LL;

  processHandle = self->_processHandle;
  if (processHandle)
  {
    [processHandle pid];
    id v7 = [[RBSTerminateContext alloc] initWithExplanation:@"Alternate system app termination requested."];
    [v7 setReportType:0];
    [v7 setMaximumTerminationResistance:40];
    RBSTerminateRequest *v8 = [[RBSTerminateRequest alloc] init];
    id v9 = [NSNumber numberWithInt:v6];
    uint64_t v10 = [RBSProcessPredicate predicateMatchingIdentifier:v9];
    id v11 = [v8 initWithPredicate:v10 context:v7];

    id v18 = 0LL;
    LOBYTE(v10) = [v11 execute:&v18];
    id v12 = v18;
    if ((v10 & 1) == 0)
    {
      uint64_t v13 = BKLogAlternateSystemApp();
      os_log_s *v14 = [v13 autorelease];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        bundleID = self->_bundleID;
        *(_DWORD *)buf = 138543618;
        v20 = bundleID;
        __int16 v21 = 2114;
        id v22 = v12;
        _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Failed to terminate %{public}@ with error: %{public}@",  buf,  0x16u);
      }
    }

    v15 = self->_processHandle;
    self->_processHandle = 0LL;
  }

  return 1;
}

- (void)_noteExitedWithContext:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v5 = BKLogAlternateSystemApp();
  id v6 = [v5 autorelease];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543618;
    id v12 = self;
    __int16 v13 = 2114;
    id v14 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "_noteExitedWithContext: app:%{public}@ exitContext:%{public}@",  (uint8_t *)&v11,  0x16u);
  }

  id pendingExitBlock = (void (**)(id, id))self->_pendingExitBlock;
  if (pendingExitBlock)
  {
    pendingExitBlock[2](pendingExitBlock, v4);
    id v8 = self->_pendingExitBlock;
    self->_id pendingExitBlock = 0LL;
  }

  [self->_visibilityAssertion invalidate];
  visibilityAssertion = self->_visibilityAssertion;
  self->_visibilityAssertion = 0LL;

  processHandle = self->_processHandle;
  self->_processHandle = 0LL;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (RBSProcessHandle)processHandle
{
  return self->_processHandle;
}

- (void)setProcessHandle:(id)a3
{
}

- (RBSAssertion)visibilityAssertion
{
  return self->_visibilityAssertion;
}

- (void)setVisibilityAssertion:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (id)pendingExitBlock
{
  return self->_pendingExitBlock;
}

- (void)setPendingExitBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)_bundleInfoOverrides
{
  v5[0] = @"OverrideURL";
  v5[1] = @"OverrideAppType";
  v6[0] = @"file:///Applications/PreBoard.app";
  v6[1] = @"System";
  id v7 = @"com.apple.PreBoard";
  v2 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];
  id v8 = v2;
  v3 = [NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];

  return v3;
}

@end