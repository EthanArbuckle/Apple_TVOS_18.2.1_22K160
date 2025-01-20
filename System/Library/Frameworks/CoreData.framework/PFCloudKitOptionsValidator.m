@interface PFCloudKitOptionsValidator
- (BOOL)validateOptions:(void *)a3 andStoreOptions:(uint64_t *)a4 error:;
- (void)dealloc;
@end

@implementation PFCloudKitOptionsValidator

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PFCloudKitOptionsValidator;
  -[PFCloudKitOptionsValidator dealloc](&v3, sel_dealloc);
}

- (BOOL)validateOptions:(void *)a3 andStoreOptions:(uint64_t *)a4 error:
{
  v114[1] = *MEMORY[0x1895F89C0];
  if (!result) {
    return result;
  }
  v7 = (void *)MEMORY[0x186E3E5D8]();
  else {
    uint64_t v8 = __ckLoggingOverride;
  }
  uint64_t v9 = [@"CoreData+CloudKit: %s(%d): " stringByAppendingString:@"Validating options: %@\nstoreOptions: %@"];
  v103 = a2;
  v104 = a3;
  _NSCoreDataLog( v8,  v9,  v10,  v11,  v12,  v13,  v14,  v15,  (uint64_t)"-[PFCloudKitOptionsValidator validateOptions:andStoreOptions:error:]");
  objc_autoreleasePoolPop(v7);
  v16 = (void *)[a2 containerIdentifier];
  if (!v16)
  {
    v30 = (void *)MEMORY[0x189607870];
    uint64_t v31 = *MEMORY[0x189607460];
    uint64_t v109 = *MEMORY[0x1896075F0];
    v110 = @"A container identifier is required for the CloudKit integration.";
    v32 = (void *)MEMORY[0x189603F68];
    v33 = (uint64_t *)&v110;
    v34 = &v109;
    goto LABEL_21;
  }

  v17 = v16;
  if (![v16 isNSString])
  {
    v30 = (void *)MEMORY[0x189607870];
    uint64_t v31 = *MEMORY[0x189607460];
    uint64_t v111 = *MEMORY[0x1896075F0];
    v35 = (void *)NSString;
    v36 = (objc_class *)objc_opt_class();
    uint64_t v112 = [v35 stringWithFormat:@"NSCloudKitMirroringDelegateOptions.containerIdentifier only accepts values of type '%@'. The following is not a valid value:\n%@", NSStringFromClass(v36), v17, v103, v104];
    v32 = (void *)MEMORY[0x189603F68];
    v33 = &v112;
    v34 = &v111;
    goto LABEL_21;
  }

  if (![v17 length])
  {
    v30 = (void *)MEMORY[0x189607870];
    uint64_t v31 = *MEMORY[0x189607460];
    uint64_t v113 = *MEMORY[0x1896075F0];
    v114[0] = @"NSCloudKitMirroringDelegateOptions.containerIdentifier requires a value with a length greather than 0";
    v32 = (void *)MEMORY[0x189603F68];
    v33 = v114;
    v34 = &v113;
LABEL_21:
    uint64_t v37 = objc_msgSend( v30,  "errorWithDomain:code:userInfo:",  v31,  134060,  objc_msgSend(v32, "dictionaryWithObjects:forKeys:count:", v33, v34, 1));
    if (v37) {
      goto LABEL_23;
    }
    uint64_t v38 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog( 17LL,  v38,  v39,  v40,  v41,  v42,  v43,  v44,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitOptionsValidator.m");
    v45 = (os_log_s *)__pflogFaultLog;
    if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)) {
      goto LABEL_23;
    }
    *(_DWORD *)buf = 136315394;
    v106 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitOptionsValidator.m";
    __int16 v107 = 1024;
    int v108 = 87;
    goto LABEL_38;
  }

  if (![a3 objectForKey:@"NSPersistentHistoryTrackingKey"])
  {
    v54 = (void *)MEMORY[0x189607870];
    uint64_t v55 = *MEMORY[0x189607460];
    uint64_t v113 = *MEMORY[0x1896075F0];
    v114[0] = [NSString stringWithFormat:@"%@ is required for the CloudKit integration.", @"NSPersistentHistoryTrackingKey", 36, v103, v104];
    uint64_t v37 = objc_msgSend( v54,  "errorWithDomain:code:userInfo:",  v55,  134060,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v114, &v113, 1));
    if (v37) {
      goto LABEL_23;
    }
    uint64_t v56 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog( 17LL,  v56,  v57,  v58,  v59,  v60,  v61,  v62,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitOptionsValidator.m");
    v45 = (os_log_s *)__pflogFaultLog;
    if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)) {
      goto LABEL_23;
    }
    *(_DWORD *)buf = 136315394;
    v106 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitOptionsValidator.m";
    __int16 v107 = 1024;
    int v108 = 105;
    goto LABEL_38;
  }

  uint64_t v18 = [a2 containerOptions];
  if (v18)
  {
    uint64_t v19 = v18;
    getCloudKitCKContainerOptionsClass[0]();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v63 = (void *)MEMORY[0x189607870];
      uint64_t v64 = *MEMORY[0x189607460];
      uint64_t v113 = *MEMORY[0x1896075F0];
      v65 = (void *)NSString;
      getCloudKitCKContainerOptionsClass[0]();
      v66 = (objc_class *)objc_opt_class();
      v114[0] = [v65 stringWithFormat:@"NSCloudKitMirroringDelegateOptions.containerOptions only accepts values of type '%@'. The following is not a valid value:\n%@", NSStringFromClass(v66), v19, v103, v104];
      uint64_t v37 = objc_msgSend( v63,  "errorWithDomain:code:userInfo:",  v64,  134060,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v114, &v113, 1));
      if (v37) {
        goto LABEL_23;
      }
      uint64_t v67 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
      _NSCoreDataLog( 17LL,  v67,  v68,  v69,  v70,  v71,  v72,  v73,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitOptionsValidator.m");
      v45 = (os_log_s *)__pflogFaultLog;
      if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)) {
        goto LABEL_23;
      }
      *(_DWORD *)buf = 136315394;
      v106 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitOptionsValidator.m";
      __int16 v107 = 1024;
      int v108 = 132;
      goto LABEL_38;
    }
  }

  v20 = (void *)[a2 ckAssetThresholdBytes];
  if (v20)
  {
    v21 = v20;
    if ([v20 isNSNumber])
    {
      v74 = (void *)MEMORY[0x189607870];
      uint64_t v75 = *MEMORY[0x189607460];
      uint64_t v113 = *MEMORY[0x1896075F0];
      v114[0] = [NSString stringWithFormat:@"The value for 'NSCloudKitMirroringDelegateOptions.ckAssetThresholdBytes' must be at least %@ bytes. The following value is invalid: %@", objc_msgSend(MEMORY[0x189607968], "numberWithInteger:", 100), v21, v103, v104];
      v78 = (void *)MEMORY[0x189603F68];
      v79 = v114;
      v80 = &v113;
    }

    else
    {
      v74 = (void *)MEMORY[0x189607870];
      uint64_t v75 = *MEMORY[0x189607460];
      uint64_t v111 = *MEMORY[0x1896075F0];
      v76 = (void *)NSString;
      v77 = (objc_class *)objc_opt_class();
      uint64_t v112 = [v76 stringWithFormat:@"The value for 'NSCloudKitMirroringDelegateOptions.ckAssetThresholdBytes' must be an instance of '%@'. The following value is invalid: %@", NSStringFromClass(v77), v21, v103, v104];
      v78 = (void *)MEMORY[0x189603F68];
      v79 = &v112;
      v80 = &v111;
    }

    uint64_t v37 = objc_msgSend( v74,  "errorWithDomain:code:userInfo:",  v75,  134060,  objc_msgSend(v78, "dictionaryWithObjects:forKeys:count:", v79, v80, 1));
    if (v37) {
      goto LABEL_23;
    }
    uint64_t v85 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog( 17LL,  v85,  v86,  v87,  v88,  v89,  v90,  v91,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitOptionsValidator.m");
    v45 = (os_log_s *)__pflogFaultLog;
    if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)) {
      goto LABEL_23;
    }
    *(_DWORD *)buf = 136315394;
    v106 = "/Library/Caches/com.apple.xbs/Sources/Persistence/PFCloudKitOptionsValidator.m";
    __int16 v107 = 1024;
    int v108 = 162;
    goto LABEL_38;
  }

@end