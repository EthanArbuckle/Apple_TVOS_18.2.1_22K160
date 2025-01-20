@interface TCCDProcess
+ (id)identifierForInvalidCode;
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (BOOL)BOOLValueForEntitlement:(id)a3;
- (BOOL)_initializeUsingResponsibleIdentity:(id)a3;
- (BOOL)_initializeUsingTaskForAuditToken:(id *)a3;
- (BOOL)hasEntitlement:(id)a3 containsService:(id)a4 options:(unint64_t)a5;
- (BOOL)hasEntitlement:(id)a3 containsServiceAllOrService:(id)a4 options:(unint64_t)a5;
- (BOOL)hasRuntimeValidationEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPlatformBinary;
- (BOOL)isSystemPreferencesApp;
- (NSDictionary)entitlements;
- (NSString)binaryPath;
- (NSString)identifier;
- (NSString)responsiblePath;
- (TCCDProcess)initWithAuditToken:(id *)a3 responsibleIdentity:(id)a4;
- (au_tid)pidVersion;
- (id)arrayValueForEntitlement:(id)a3;
- (id)description;
- (id)dictionaryValueForEntitlement:(id)a3;
- (id)logHandle;
- (int)pid;
- (unint64_t)hash;
- (unsigned)auid;
- (unsigned)codesignStatus;
- (unsigned)euid;
- (void)dealloc;
- (void)setAuditToken:(id *)a3;
- (void)setAuid:(unsigned int)a3;
- (void)setBinaryPath:(id)a3;
- (void)setCodesignStatus:(unsigned int)a3;
- (void)setEntitlements:(id)a3;
- (void)setEuid:(unsigned int)a3;
- (void)setIdentifier:(id)a3;
- (void)setPid:(int)a3;
- (void)setPidVersion:(au_tid)a3;
- (void)tccd_crash_fd_limit;
@end

@implementation TCCDProcess

+ (id)identifierForInvalidCode
{
  return @"<ID of InvalidCode>";
}

- (void)tccd_crash_fd_limit
{
  if ((os_variant_allows_internal_security_policies("com.apple.tcc") & 1) != 0)
  {
    _os_crash("Too many open files");
    __break(1u);
  }

  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[TCCDProcess logHandle](self, "logHandle"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Too many open files", v4, 2u);
  }

  exit(1);
}

- (id)logHandle
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDPlatform currentPlatform](&OBJC_CLASS___TCCDPlatform, "currentPlatform"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 server]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 logHandle]);

  return v4;
}

- (TCCDProcess)initWithAuditToken:(id *)a3 responsibleIdentity:(id)a4
{
  id v6 = a4;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___TCCDProcess;
  v7 = -[TCCDProcess init](&v26, "init");
  p_isa = (id *)&v7->super.isa;
  if (v7)
  {
    __int128 v9 = *(_OWORD *)&a3->var0[4];
    v25[0] = *(_OWORD *)a3->var0;
    v25[1] = v9;
    -[TCCDProcess setAuditToken:](v7, "setAuditToken:", v25);
    [p_isa auditToken];
    audit_token_to_au32(&atoken, &auidp, &euidp, 0LL, 0LL, 0LL, &pidp, 0LL, &tidp);
    if (auidp == -1) {
      uid_t auidp = euidp;
    }
    [p_isa setPid:pidp];
    [p_isa setAuid:auidp];
    [p_isa setEuid:euidp];
    [p_isa setPidVersion:tidp];
    if (v6)
    {
    }

    else
    {
      __int128 v10 = *(_OWORD *)&a3->var0[4];
      buffer[0] = *(_OWORD *)a3->var0;
      buffer[1] = v10;
      if (![p_isa _initializeUsingTaskForAuditToken:buffer])
      {
LABEL_18:
        v16 = 0LL;
        goto LABEL_19;
      }
    }

    bzero(buffer, 0x400uLL);
    if (proc_pidpath_audittoken((audit_token_t *)a3, buffer, 0x400u) <= 0)
    {
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([p_isa logHandle]);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_100038A64(p_isa, v17);
      }

      goto LABEL_18;
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", buffer));
    id v19 = 0LL;
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v11 stringByResolvingRealPathWithError:&v19]);
    id v13 = v19;
    id v14 = p_isa[8];
    p_isa[8] = (id)v12;

    if (!p_isa[8])
    {
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([p_isa logHandle]);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_100038B18((uint64_t)buffer, (uint64_t)v13, v15);
      }

      objc_storeStrong(p_isa + 8, v11);
    }
  }

  v16 = p_isa;
LABEL_19:

  return v16;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___TCCDProcess;
  -[TCCDProcess dealloc](&v2, "dealloc");
}

- (NSString)responsiblePath
{
  responsiblePath = self->_responsiblePath;
  if (responsiblePath) {
    return responsiblePath;
  }
  else {
    return (NSString *)(id)objc_claimAutoreleasedReturnValue(-[TCCDProcess binaryPath](self, "binaryPath"));
  }
}

- (BOOL)BOOLValueForEntitlement:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDProcess entitlements](self, "entitlements"));

  if (!v5) {
    goto LABEL_9;
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDProcess entitlements](self, "entitlements"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v4]);

  if (!v7)
  {
LABEL_8:

LABEL_9:
    unsigned __int8 v10 = 0;
    goto LABEL_10;
  }

  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSNumber, v8);
  if ((objc_opt_isKindOfClass(v7, v9) & 1) == 0)
  {
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[TCCDProcess logHandle](self, "logHandle"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100038B98(self);
    }

    goto LABEL_8;
  }

  unsigned __int8 v10 = [v7 BOOLValue];

LABEL_10:
  return v10;
}

- (id)arrayValueForEntitlement:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDProcess entitlements](self, "entitlements"));

  if (v5
    && (id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDProcess entitlements](self, "entitlements")),
        v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v4]),
        v6,
        v7))
  {
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSArray, v8);
    if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0)
    {
      unsigned __int8 v10 = v7;
    }

    else
    {
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[TCCDProcess logHandle](self, "logHandle"));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100038C18(self);
      }

      unsigned __int8 v10 = 0LL;
    }
  }

  else
  {
    unsigned __int8 v10 = objc_opt_new(&OBJC_CLASS___NSArray);
  }

  return v10;
}

- (id)dictionaryValueForEntitlement:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDProcess entitlements](self, "entitlements"));

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDProcess entitlements](self, "entitlements"));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v4]);

    if (!v5)
    {
LABEL_7:

      v5 = 0LL;
      goto LABEL_8;
    }

    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSDictionary, v7);
    if ((objc_opt_isKindOfClass(v5, v8) & 1) == 0)
    {
      id v9 = tcc_access_log();
      unsigned __int8 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_100038C98(self);
      }

      goto LABEL_7;
    }
  }

- (id)description
{
  v3 = objc_opt_new(&OBJC_CLASS___NSMutableString);
  uint64_t v5 = objc_opt_class(self, v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDProcess identifier](self, "identifier"));
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"%@: identifier=%@, pid=%d, auid=%d, euid=%d, ",  v5,  v6,  -[TCCDProcess pid](self, "pid"),  -[TCCDProcess auid](self, "auid"),  -[TCCDProcess euid](self, "euid"));

  if (self->_responsiblePath) {
    -[NSMutableString appendFormat:](v3, "appendFormat:", @"responsible_path=%@, ", self->_responsiblePath);
  }
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDProcess binaryPath](self, "binaryPath"));
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"binary_path=%@", v7);

  return v3;
}

- (BOOL)hasEntitlement:(id)a3 containsService:(id)a4 options:(unint64_t)a5
{
  char v5 = a5;
  id v8 = a3;
  id v9 = a4;
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDProcess arrayValueForEntitlement:](self, "arrayValueForEntitlement:", v8));
  if (!v10) {
    goto LABEL_11;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue([v9 name]);
  unsigned __int8 v12 = [v10 containsObject:v11];

  if ((v12 & 1) == 0)
  {
    if ((v5 & 1) != 0)
    {
      uint64_t v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "macos_compositionParentService"));
      if (v21)
      {
        v22 = (void *)v21;
        while (1)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue([v22 name]);
          unsigned int v24 = [v10 containsObject:v23];

          if (v24) {
            break;
          }
          uint64_t v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "macos_compositionParentService"));

          v22 = (void *)v25;
          if (!v25) {
            goto LABEL_11;
          }
        }

        goto LABEL_3;
      }
    }

- (BOOL)hasEntitlement:(id)a3 containsServiceAllOrService:(id)a4 options:(unint64_t)a5
{
  id v8 = a3;
  if (-[TCCDProcess hasEntitlement:containsService:options:]( self,  "hasEntitlement:containsService:options:",  v8,  a4,  a5))
  {
    BOOL v9 = 1;
  }

  else
  {
    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(+[TCCDService serviceAll](&OBJC_CLASS___TCCDService, "serviceAll"));
    BOOL v9 = -[TCCDProcess hasEntitlement:containsService:options:]( self,  "hasEntitlement:containsService:options:",  v8,  v10,  a5);
  }

  return v9;
}

- (BOOL)hasRuntimeValidationEnabled
{
  return (~-[TCCDProcess codesignStatus](self, "codesignStatus") & 0x1200) == 0;
}

- (BOOL)isPlatformBinary
{
  return (~-[TCCDProcess codesignStatus](self, "codesignStatus") & 0x4000001) == 0;
}

- (BOOL)isSystemPreferencesApp
{
  BOOL v3 = -[TCCDProcess isPlatformBinary](self, "isPlatformBinary");
  if (v3)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[TCCDProcess identifier](self, "identifier"));
    unsigned __int8 v5 = [v4 isEqualToString:@"com.apple.TVSettings"];

    LOBYTE(v3) = v5;
  }

  return v3;
}

- (BOOL)_initializeUsingTaskForAuditToken:(id *)a3
{
  unsigned int v41 = 0;
  p_pid = &self->_pid;
  if (csops_audittoken(self->_pid, 0LL, &v41, 4LL, a3))
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[TCCDProcess logHandle](self, "logHandle"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100038EB8((uint64_t)p_pid, v6, v7, v8, v9, v10, v11, v12);
    }

    unsigned int v13 = 0;
  }

  else
  {
    unsigned int v13 = v41;
  }

  self->_codesignStatus = v13;
  __int128 v14 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)cf.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&cf.val[4] = v14;
  uint64_t v15 = SecTaskCreateWithAuditToken(0LL, &cf);
  if (v15)
  {
    *(void *)cf.val = 0LL;
    v16 = (NSDictionary *)SecTaskCopyValuesForEntitlements( v15,  (CFArrayRef)+[TCCDPlatform allTCCEntitlements]( &OBJC_CLASS___TCCDPlatform,  "allTCCEntitlements"),  (CFErrorRef *)&cf);
    if (!v16)
    {
      if (*(void *)cf.val)
      {
        unsigned int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[TCCDProcess logHandle](self, "logHandle"));
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_100038DE8();
        }
      }

      v16 = objc_opt_new(&OBJC_CLASS___NSDictionary);
    }

    entitlements = self->_entitlements;
    self->_entitlements = v16;

    *__error() = 0;
    id v19 = (__CFString *)SecTaskCopySigningIdentifier(v15, (CFErrorRef *)&cf);
    if (!v19)
    {
      uint64_t v20 = *(void *)cf.val;
      uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[TCCDProcess logHandle](self, "logHandle"));
      BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
      if (v20)
      {
        if (v22) {
          sub_100038D80();
        }
      }

      else if (v22)
      {
        sub_100038D18((uint64_t)p_pid, v21, v23, v24, v25, v26, v27, v28);
      }

      id v37 = objc_msgSend((id)objc_opt_class(self, v36), "identifierForInvalidCode");
      id v19 = (__CFString *)objc_claimAutoreleasedReturnValue(v37);
    }

    identifier = self->_identifier;
    self->_identifier = &v19->isa;

    CFRelease(v15);
    if (*(void *)cf.val) {
      CFRelease(*(CFTypeRef *)cf.val);
    }
  }

  else
  {
    __int16 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[TCCDProcess logHandle](self, "logHandle"));
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_100038E50((uint64_t)p_pid, v29, v30, v31, v32, v33, v34, v35);
    }
  }

  return v15 != 0LL;
}

- (BOOL)_initializeUsingResponsibleIdentity:(id)a3
{
  return 0;
}

- (unint64_t)hash
{
  int8x16_t v2 = veorq_s8(*(int8x16_t *)self->_auditToken.val, *(int8x16_t *)&self->_auditToken.val[4]);
  int16x8_t v3 = vmovl_high_s8(v2);
  int8x16_t v4 = (int8x16_t)vmovl_s16(*(int16x4_t *)v3.i8);
  int16x8_t v5 = vmovl_s8(*(int8x8_t *)v2.i8);
  int8x16_t v6 = (int8x16_t)vmovl_s16(*(int16x4_t *)v5.i8);
  int8x16_t v7 = (int8x16_t)vmovl_high_s16(v3);
  int8x16_t v8 = (int8x16_t)vmovl_high_s16(v5);
  *(int8x8_t *)v8.i8 = veor_s8( veor_s8( veor_s8(*(int8x8_t *)v6.i8, *(int8x8_t *)v4.i8),  veor_s8(*(int8x8_t *)v8.i8, *(int8x8_t *)v7.i8)),  veor_s8( veor_s8( (int8x8_t)*(_OWORD *)&vextq_s8(v6, v6, 8uLL),  (int8x8_t)*(_OWORD *)&vextq_s8(v4, v4, 8uLL)),  veor_s8( (int8x8_t)*(_OWORD *)&vextq_s8(v8, v8, 8uLL),  (int8x8_t)*(_OWORD *)&vextq_s8(v7, v7, 8uLL))));
  v9.i64[0] = v8.i32[0];
  v9.i64[1] = v8.i32[1];
  return (unint64_t)veor_s8((int8x8_t)v8.i32[0], (int8x8_t)*(_OWORD *)&vextq_s8(v9, v9, 8uLL));
}

- (BOOL)isEqual:(id)a3
{
  int16x8_t v5 = (TCCDProcess *)a3;
  if (v5 == self)
  {
    BOOL v8 = 1;
  }

  else
  {
    uint64_t v6 = objc_opt_class(self, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      int8x16_t v7 = v5;
      -[TCCDProcess auditToken](self, "auditToken");
      if (v7)
      {
        -[TCCDProcess auditToken](v7, "auditToken");
      }

      else
      {
        __int128 v14 = 0u;
        __int128 v15 = 0u;
      }

      if (v16 == (void)v14 && v17 == *((void *)&v14 + 1) && v18 == (void)v15 && v19 == *((void *)&v15 + 1))
      {
        unsigned int v12 = -[TCCDProcess pid](self, "pid");
        BOOL v8 = v12 == -[TCCDProcess pid](v7, "pid");
      }

      else
      {
        BOOL v8 = 0;
      }
    }

    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  return result;
}

- (void)setAuditToken:(id *)a3
{
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (unsigned)auid
{
  return self->_auid;
}

- (void)setAuid:(unsigned int)a3
{
  self->_auid = a3;
}

- (unsigned)euid
{
  return self->_euid;
}

- (void)setEuid:(unsigned int)a3
{
  self->_euid = a3;
}

- (au_tid)pidVersion
{
  return dest;
}

- (void)setPidVersion:(au_tid)a3
{
  au_tid src = a3;
  objc_copyStruct(&self->_pidVersion, &src, 8LL, 1, 0);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (NSDictionary)entitlements
{
  return (NSDictionary *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setEntitlements:(id)a3
{
}

- (unsigned)codesignStatus
{
  return self->_codesignStatus;
}

- (void)setCodesignStatus:(unsigned int)a3
{
  self->_codesignStatus = a3;
}

- (NSString)binaryPath
{
  return (NSString *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setBinaryPath:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

@end