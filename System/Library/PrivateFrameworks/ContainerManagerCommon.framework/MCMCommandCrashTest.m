@interface MCMCommandCrashTest
+ (Class)incomingMessageClass;
+ (unint64_t)command;
- (BOOL)preflightClientAllowed;
- (MCMCommandCrashTest)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5;
- (unint64_t)crashCount;
- (unint64_t)setTestLocks;
- (void)execute;
@end

@implementation MCMCommandCrashTest

- (MCMCommandCrashTest)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MCMCommandCrashTest;
  v9 = -[MCMCommand initWithMessage:context:reply:](&v11, sel_initWithMessage_context_reply_, v8, a4, a5);
  if (v9)
  {
    v9->_crashCount = [v8 crashCount];
    v9->_setTestLocks = [v8 setTestLocks];
  }

  return v9;
}

- (BOOL)preflightClientAllowed
{
  id v3 = containermanager_copy_global_configuration();
  int v4 = [v3 isInternalImage];

  if (!v4) {
    return 0;
  }
  v5 = -[MCMCommand context](self, "context");
  [v5 clientIdentity];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  char v7 = [v6 isAllowedToTest];

  return v7;
}

- (void)execute
{
  uint64_t v74 = *MEMORY[0x1895F89C0];
  v63 = (void *)MEMORY[0x1895CE3A8](self, a2);
  id v3 = (const char *)container_codesign_copy_current_identifier();
  uint64_t v4 = objc_msgSend( objc_alloc(NSString),  "initWithBytesNoCopy:length:encoding:deallocator:",  v3,  strnlen(v3, 0x400uLL),  4,  &__block_literal_global_1198);
  v5 = -[MCMCommand context](self, "context");
  uint64_t v67 = 1LL;
  id v6 = containermanager_copy_global_configuration();
  uint64_t v7 = 12LL;
  int v8 = [v6 dispositionForContainerClass:12];

  if (v8 != 1)
  {
    id v9 = containermanager_copy_global_configuration();
    uint64_t v7 = 10LL;
    [v9 dispositionForContainerClass:10];
  }
  v10 = -[MCMCommand context](self, "context");
  [v10 globalConfiguration];
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 staticConfig];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = [v12 configForContainerClass:v7];

  [v5 userIdentityCache];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 userIdentityForPersonalPersona];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t active_platform = dyld_get_active_platform();
  v17 = -[MCMCommand context](self, "context");
  [v17 userIdentityCache];
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = (void *)v4;
  v62 = (void *)v13;
  v19 = +[MCMContainerIdentity containerIdentityWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:]( &OBJC_CLASS___MCMContainerIdentity,  "containerIdentityWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:",  v15,  v4,  v13,  active_platform,  v18,  &v67);
  [v5 containerFactory];
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  id v66 = 0LL;
  [v20 containerForContainerIdentity:v19 createIfNecessary:1 error:&v66];
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  id v22 = v66;

  id v65 = v22;
  [v21 metadataWithError:&v65];
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  id v24 = v65;

  if (!v23)
  {
    container_log_handle_for_category();
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v64;
      __int16 v72 = 2112;
      uint64_t v73 = (uint64_t)v24;
      _os_log_error_impl( &dword_188846000,  v26,  OS_LOG_TYPE_ERROR,  "Failed to create or lookup lookup existing container for retry test: %@; error = %@",
        buf,
        0x16u);
    }

    goto LABEL_19;
  }

  v60 = v21;
  v61 = v19;
  if (!-[MCMCommandCrashTest crashCount](self, "crashCount"))
  {
    v26 = 0LL;
    v31 = 0LL;
LABEL_14:
    v36 = objc_alloc_init(&OBJC_CLASS___MCMResultPromise);
    [v23 containerIdentity];
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = v37;
    [MEMORY[0x189603F18] arrayWithObjects:&v68 count:1];
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = +[MCMCommandOperationDelete commandForOperationDeleteWithContainerIdentities:removeAllCodeSignInfo:context:resultPromise:]( &OBJC_CLASS___MCMCommandOperationDelete,  "commandForOperationDeleteWithContainerIdentities:removeAllCodeSignInfo:context:resultPromise:",  v38,  0LL,  v5,  v36);
    [v39 execute];
    v40 = -[MCMResultPromise result](v36, "result");
    [v40 error];
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (v41)
    {
      container_log_handle_for_category();
      v42 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        [v23 containerPath];
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        [v59 containerRootURL];
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        [v58 path];
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = -[MCMResultPromise result](v36, "result");
        uint64_t v48 = [v57 error];
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v56;
        __int16 v72 = 2112;
        uint64_t v73 = v48;
        v49 = (void *)v48;
        _os_log_error_impl( &dword_188846000,  v42,  OS_LOG_TYPE_ERROR,  "Failed to delete retry container at [%@]; error = %@",
          buf,
          0x16u);
      }
      v43 = -[MCMResultPromise result](v36, "result");
      uint64_t v44 = [v43 error];

      id v24 = (id)v44;
    }

    v21 = v60;
    v19 = v61;

LABEL_19:
    container_log_handle_for_category();
    v45 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      *(void *)&buf[4] = 0LL;
      __int16 v72 = 2112;
      uint64_t v73 = (uint64_t)v24;
      _os_log_impl(&dword_188846000, v45, OS_LOG_TYPE_DEFAULT, "Restart result: %llu, error = %@", buf, 0x16u);
    }
    v46 = -[MCMCommand resultPromise](self, "resultPromise");
    v47 = -[MCMResultBase initWithError:](objc_alloc(&OBJC_CLASS___MCMResultBase), "initWithError:", v24);
    [v46 completeWithResult:v47];

    objc_autoreleasePoolPop(v63);
    return;
  }

  [v23 info];
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  [v25 objectForKeyedSubscript:@"CrashCounter"];
  v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    [v23 info];
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    [v27 objectForKeyedSubscript:@"CrashCounter"];
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v29 = [v28 unsignedIntValue];

    unint64_t v30 = v29 - 1;
  }

  else
  {
    unint64_t v30 = -[MCMCommandCrashTest crashCount](self, "crashCount");
  }

  container_log_handle_for_category();
  v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&buf[4] = v30;
    _os_log_error_impl(&dword_188846000, v32, OS_LOG_TYPE_ERROR, "Restarts remaining in retry test: %llu", buf, 0xCu);
  }

  v33 = objc_alloc(&OBJC_CLASS___MCMCommandSetInfoValue);
  [MEMORY[0x189607968] numberWithUnsignedLongLong:v30];
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  [v23 containerIdentity];
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[MCMCommandSetInfoValue initWithKey:value:containerIdentity:context:resultPromise:]( v33,  "initWithKey:value:containerIdentity:context:resultPromise:",  @"CrashCounter",  v34,  v35,  v5,  0LL);

  -[MCMCommandSetInfoValue execute](v31, "execute");
  if (!v30) {
    goto LABEL_14;
  }
  if (-[MCMCommandCrashTest setTestLocks](self, "setTestLocks"))
  {
    v50 = +[MCMTestLocks sharedInstance](&OBJC_CLASS___MCMTestLocks, "sharedInstance");
    [v50 setEnabled:1];
    objc_msgSend(v50, "acquireLock:", -[MCMCommandCrashTest setTestLocks](self, "setTestLocks"));
  }

  -[MCMRuntimeState persist](objc_alloc_init(&OBJC_CLASS___MCMRuntimeState), "persist");
  container_log_handle_for_category();
  v51 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_188846000, v51, OS_LOG_TYPE_DEFAULT, "Restarting", buf, 2u);
  }

  *(void *)buf = 1LL;
  if (sysctlbyname("kern.crash_behavior_test_mode", 0LL, 0LL, buf, 8uLL) < 0)
  {
    int v52 = *__error();
    container_log_handle_for_category();
    v53 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v69 = 67109120;
      int v70 = v52;
      _os_log_error_impl( &dword_188846000,  v53,  OS_LOG_TYPE_ERROR,  "Could not enable crash test mode, error = %{darwin.errno}d",  v69,  8u);
    }
  }

  usleep(0x7A120u);
  v54 = (MCMCommandCrashTest *)abort_with_reason();
  -[MCMCommandCrashTest crashCount](v54, v55);
}

- (unint64_t)crashCount
{
  return self->_crashCount;
}

- (unint64_t)setTestLocks
{
  return self->_setTestLocks;
}

uint64_t __30__MCMCommandCrashTest_execute__block_invoke(int a1, void *a2)
{
  v3[1] = *MEMORY[0x1895F89C0];
  v3[0] = a2;
  if (a2)
  {
    free(a2);
    return memset_s(v3, 8uLL, 0, 8uLL);
  }

  return result;
}

+ (unint64_t)command
{
  return 25LL;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

@end