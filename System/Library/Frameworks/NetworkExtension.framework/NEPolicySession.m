@interface NEPolicySession
+ (uint64_t)copyTLVForBytes:(uint64_t)a1 messageLength:(uint64_t)a2 type:(unint64_t)a3 includeHeaderOffset:(int)a4 n:(int)a5 hasFlags:(int)a6;
+ (void)addTLVToMessage:(char)a3 type:(uint64_t)a4 length:(uint64_t)a5 value:;
- (BOOL)apply;
- (BOOL)lockSessionToCurrentProcess;
- (BOOL)registerServiceUUID:(id)a3;
- (BOOL)removeAllDomainFilters;
- (BOOL)removeAllDomainTries;
- (BOOL)removeAllPolicies;
- (BOOL)removeDomainFilterWithID:(unint64_t)a3;
- (BOOL)removeDomainTrieWithID:(unint64_t)a3;
- (BOOL)removePolicyWithID:(unint64_t)a3;
- (BOOL)unregisterServiceUUID:(id)a3;
- (NEPolicySession)init;
- (NEPolicySession)initWithSessionName:(id)a3;
- (NEPolicySession)initWithSocket:(int)a3;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (id)dumpDomainTries;
- (id)dumpKernelPolicies;
- (id)initFromPrivilegedProcess;
- (id)policyWithID:(unint64_t)a3;
- (int)dupSocket;
- (int64_t)priority;
- (unint64_t)addDomainFilterWithData:(id)a3;
- (unint64_t)addDomainTrieWithData:(id)a3;
- (unint64_t)addPolicy:(id)a3;
- (unint64_t)addPolicy:(id)a3 storeLocally:(BOOL)a4;
- (void)dealloc;
- (void)setPriority:(int64_t)a3;
@end

@implementation NEPolicySession

- (NEPolicySession)initWithSocket:(int)a3
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___NEPolicySession;
  v4 = -[NEPolicySession init](&v16, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_internalPriority = 0LL;
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    policies = v5->_policies;
    v5->_policies = v6;

    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v9 = dispatch_queue_create("NEPolicy Control IO Queue", v8);
    ioQueue = v5->_ioQueue;
    v5->_ioQueue = (OS_dispatch_queue *)v9;

    if ((a3 & 0x80000000) == 0)
    {
      v5->_sessionFD = a3;
LABEL_11:
      v12 = v5;
      goto LABEL_12;
    }

    if (getuid()) {
      int NECPSessionFD = NEHelperGetNECPSessionFD();
    }
    else {
      int NECPSessionFD = necp_session_open();
    }
    v5->_sessionFD = NECPSessionFD;
    if ((NECPSessionFD & 0x80000000) == 0) {
      goto LABEL_11;
    }
    int v15 = *__error();
    ne_log_obj();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109378;
      int v18 = v15;
      __int16 v19 = 2080;
      v20 = (char *)__strerrbuf;
      _os_log_fault_impl( &dword_1876B1000,  v11,  OS_LOG_TYPE_FAULT,  "Failed to open NECP session fd: [%d] %s",  buf,  0x12u);
    }
  }

  else
  {
    ne_log_obj();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__strerrbuf = 0;
      _os_log_error_impl(&dword_1876B1000, v11, OS_LOG_TYPE_ERROR, "Failed to init NEPolicySession", __strerrbuf, 2u);
    }
  }

  v12 = 0LL;
LABEL_12:

  return v12;
}

- (id)initFromPrivilegedProcess
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  uint64_t v3 = necp_session_open();
  if ((v3 & 0x80000000) != 0)
  {
    int v5 = *__error();
    if (strerror_r(v5, __strerrbuf, 0x80uLL)) {
      __strerrbuf[0] = 0;
    }
    ne_log_obj();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      v8[0] = 67109378;
      v8[1] = v5;
      __int16 v9 = 2080;
      v10 = __strerrbuf;
      _os_log_fault_impl( &dword_1876B1000,  v6,  OS_LOG_TYPE_FAULT,  "Failed to open NECP session fd: [%d] %s",  (uint8_t *)v8,  0x12u);
    }

    v4 = 0LL;
  }

  else
  {
    self = -[NEPolicySession initWithSocket:](self, "initWithSocket:", v3);
    v4 = self;
  }

  return v4;
}

- (NEPolicySession)init
{
  return -[NEPolicySession initWithSocket:](self, "initWithSocket:", 0xFFFFFFFFLL);
}

- (NEPolicySession)initWithSessionName:(id)a3
{
  id v4 = a3;
  uint64_t v20 = 0LL;
  v21 = &v20;
  uint64_t v22 = 0x2020000000LL;
  int v23 = -1;
  +[NEFileHandleMaintainer sharedMaintainer](&OBJC_CLASS___NEFileHandleMaintainer, "sharedMaintainer");
  int v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = MEMORY[0x1895F87A8];
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = __39__NEPolicySession_initWithSessionName___block_invoke;
  v17[3] = &unk_18A08F338;
  id v7 = v4;
  id v18 = v7;
  __int16 v19 = &v20;
  [v5 iterateFileHandlesWithBlock:v17];

  v8 = -[NEPolicySession initWithSocket:](self, "initWithSocket:", *((unsigned int *)v21 + 6));
  __int16 v9 = v8;
  if ((v21[3] & 0x80000000) != 0)
  {
    if (v8)
    {
      v10 = -[NEPolicySessionFileHandle initWithPolicySession:name:]( objc_alloc(&OBJC_CLASS___NEPolicySessionFileHandle),  "initWithPolicySession:name:",  v8,  v7);
      if (v10)
      {
        v11 = +[NEFileHandleMaintainer sharedMaintainer](&OBJC_CLASS___NEFileHandleMaintainer, "sharedMaintainer");
        v15[0] = v6;
        v15[1] = 3221225472LL;
        v15[2] = __39__NEPolicySession_initWithSessionName___block_invoke_2;
        v15[3] = &unk_18A08F360;
        id v16 = v7;
        [v11 setFileHandle:v10 matchingPredicate:v15];

        +[NEFileHandleMaintainer sharedMaintainer](&OBJC_CLASS___NEFileHandleMaintainer, "sharedMaintainer");
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v12 commit];
      }
    }

    else
    {
      ne_log_obj();
      v10 = (NEPolicySessionFileHandle *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v14 = 0;
        _os_log_error_impl( &dword_1876B1000,  (os_log_t)v10,  OS_LOG_TYPE_ERROR,  "Failed to allocate a NEPolicySession",  v14,  2u);
      }
    }
  }

  else
  {
    -[NEPolicySession removeAllPolicies](v8, "removeAllPolicies");
  }

  _Block_object_dispose(&v20, 8);
  return v9;
}

- (void)dealloc
{
  v2 = self;
  v3.receiver = v2;
  v3.super_class = (Class)&OBJC_CLASS___NEPolicySession;
  -[NEPolicySession dealloc](&v3, sel_dealloc);
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithCapacity:0];
  [v7 appendString:@"{"];
  if (!self)
  {
    [v7 appendPrettyObject:0 withName:@"priority" andIndent:v5 options:a4];
    id Property = 0LL;
    goto LABEL_24;
  }

  int64_t internalPriority = self->_internalPriority;
  if (internalPriority > 299)
  {
    switch(internalPriority)
    {
      case 300LL:
        __int16 v9 = @"high";
        break;
      case 301LL:
        __int16 v9 = @"high1";
        break;
      case 302LL:
        __int16 v9 = @"high2";
        break;
      case 303LL:
        __int16 v9 = @"high3";
        break;
      case 304LL:
        __int16 v9 = @"high4";
        break;
      default:
        if (internalPriority == 400)
        {
          __int16 v9 = @"HighRestricted";
        }

        else
        {
          __int16 v9 = @"low";
        }

        break;
    }

    goto LABEL_23;
  }

  if (internalPriority > 100)
  {
    if (internalPriority == 101)
    {
      __int16 v9 = @"control1";
      goto LABEL_23;
    }

    if (internalPriority == 200)
    {
      __int16 v9 = @"privileged-tunnel";
      goto LABEL_23;
    }

- (id)description
{
  return -[NEPolicySession descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0LL, 0LL);
}

- (int)dupSocket
{
  else {
    return dup((int)self);
  }
}

- (int64_t)priority
{
  if (self)
  {
    char v2 = *(_BYTE *)(self + 8);
    self = *(void *)(self + 24);
    if ((v2 & 1) != 0)
    {
      if (self > 399)
      {
        switch(self)
        {
          case 0x190LL:
            return 8LL;
          case 0x1F4LL:
            return 9LL;
          case 0xFFFFLL:
            return 10LL;
        }
      }

      else
      {
        switch(self)
        {
          case 300LL:
            self = 3LL;
            break;
          case 301LL:
            self = 4LL;
            break;
          case 302LL:
            self = 5LL;
            break;
          case 303LL:
            self = 6LL;
            break;
          case 304LL:
            self = 7LL;
            break;
          default:
            if (self == 100)
            {
              self = 1LL;
            }

            else if (self == 200)
            {
              self = 2LL;
            }

            break;
        }
      }
    }
  }

  return self;
}

- (void)setPriority:(int64_t)a3
{
  int64_t v5 = a3;
  uint64_t v17 = *MEMORY[0x1895F89C0];
  unint64_t v7 = a3 - 1;
  if (!v4 & v3)
  {
LABEL_4:
    if (a3 > 299)
    {
      switch(a3)
      {
        case 300LL:
          goto LABEL_6;
        case 301LL:
          goto LABEL_17;
        case 302LL:
          goto LABEL_18;
        case 303LL:
          goto LABEL_19;
        case 304LL:
          goto LABEL_20;
        default:
          if (a3 == 400) {
            goto LABEL_21;
          }
          if (a3 == 500) {
            goto LABEL_13;
          }
          goto LABEL_22;
      }
    }

    if (a3 > 100)
    {
      if (a3 == 101) {
        goto LABEL_25;
      }
      if (a3 == 200)
      {
LABEL_16:
        int64_t v5 = 200LL;
        goto LABEL_25;
      }
    }

    else
    {
      if (!a3) {
        goto LABEL_25;
      }
      if (a3 == 100)
      {
LABEL_10:
        int64_t v5 = 100LL;
        goto LABEL_25;
      }
    }

- (BOOL)lockSessionToCurrentProcess
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  int v2 = necp_session_action();
  if (v2)
  {
    int v3 = *__error();
    if (strerror_r(v3, __strerrbuf, 0x80uLL)) {
      __strerrbuf[0] = 0;
    }
    ne_log_obj();
    char v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      v6[0] = 67109378;
      v6[1] = v3;
      __int16 v7 = 2080;
      v8 = __strerrbuf;
      _os_log_fault_impl( &dword_1876B1000,  v4,  OS_LOG_TYPE_FAULT,  "Failed to lock session to process: [%d] %s",  (uint8_t *)v6,  0x12u);
    }
  }

  return v2 == 0;
}

- (BOOL)registerServiceUUID:(id)a3
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  [a3 getUUIDBytes:v11];
  int v3 = necp_session_action();
  if (v3)
  {
    int v4 = *__error();
    if (strerror_r(v4, __strerrbuf, 0x80uLL)) {
      __strerrbuf[0] = 0;
    }
    ne_log_obj();
    int64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      v7[0] = 67109378;
      v7[1] = v4;
      __int16 v8 = 2080;
      int v9 = __strerrbuf;
      _os_log_fault_impl( &dword_1876B1000,  v5,  OS_LOG_TYPE_FAULT,  "Failed to register service: [%d] %s",  (uint8_t *)v7,  0x12u);
    }
  }

  return v3 == 0;
}

- (BOOL)unregisterServiceUUID:(id)a3
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  [a3 getUUIDBytes:v11];
  int v3 = necp_session_action();
  if (v3)
  {
    int v4 = *__error();
    if (strerror_r(v4, __strerrbuf, 0x80uLL)) {
      __strerrbuf[0] = 0;
    }
    ne_log_obj();
    int64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      v7[0] = 67109378;
      v7[1] = v4;
      __int16 v8 = 2080;
      int v9 = __strerrbuf;
      _os_log_fault_impl( &dword_1876B1000,  v5,  OS_LOG_TYPE_FAULT,  "Failed to unregister service: [%d] %s",  (uint8_t *)v7,  0x12u);
    }
  }

  return v3 == 0;
}

- (unint64_t)addDomainFilterWithData:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  int64_t v5 = v4;
  if (a3)
  {
    [v4 bytes];
    uint64_t v6 = [v5 length];
    if (necp_session_action())
    {
      int v7 = *__error();
      if (strerror_r(v7, __strerrbuf, 0x80uLL)) {
        __strerrbuf[0] = 0;
      }
      ne_log_obj();
      __int16 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109378;
        int v14 = v7;
        __int16 v15 = 2080;
        int v16 = __strerrbuf;
        _os_log_fault_impl(&dword_1876B1000, v8, OS_LOG_TYPE_FAULT, "Failed to add domain filter: [%d] %s", buf, 0x12u);
      }

      ne_log_obj();
      int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)__strerrbuf = 134217984;
        id v18 = (const char *)v6;
        _os_log_debug_impl( &dword_1876B1000,  v9,  OS_LOG_TYPE_DEBUG,  "Failed to add domain filter of length %zu",  (uint8_t *)__strerrbuf,  0xCu);
      }
    }

    else
    {
      ne_log_obj();
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)__strerrbuf = 134217984;
        id v18 = (const char *)v6;
        _os_log_debug_impl( &dword_1876B1000,  v10,  OS_LOG_TYPE_DEBUG,  "Added domain filter of length %zu",  (uint8_t *)__strerrbuf,  0xCu);
      }
    }
  }

  else
  {
    ne_log_obj();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)__strerrbuf = 136315138;
      id v18 = "-[NEPolicySession addDomainFilterWithData:]";
      _os_log_fault_impl( &dword_1876B1000,  v12,  OS_LOG_TYPE_FAULT,  "%s called with null filterData",  (uint8_t *)__strerrbuf,  0xCu);
    }
  }

  return 0LL;
}

- (BOOL)removeDomainFilterWithID:(unint64_t)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  int v7 = a3;
  int v3 = necp_session_action();
  if (v3)
  {
    int v4 = *__error();
    if (strerror_r(v4, __strerrbuf, 0x80uLL)) {
      __strerrbuf[0] = 0;
    }
    ne_log_obj();
    int64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109634;
      int v9 = v7;
      __int16 v10 = 1024;
      int v11 = v4;
      __int16 v12 = 2080;
      __int16 v13 = __strerrbuf;
      _os_log_fault_impl( &dword_1876B1000,  v5,  OS_LOG_TYPE_FAULT,  "Failed to remove domain filter %u: [%d] %s",  buf,  0x18u);
    }
  }

  return v3 == 0;
}

- (BOOL)removeAllDomainFilters
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  int v2 = necp_session_action();
  if (v2)
  {
    int v3 = *__error();
    if (strerror_r(v3, __strerrbuf, 0x80uLL)) {
      __strerrbuf[0] = 0;
    }
    ne_log_obj();
    int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      v6[0] = 67109378;
      v6[1] = v3;
      __int16 v7 = 2080;
      __int16 v8 = __strerrbuf;
      _os_log_fault_impl( &dword_1876B1000,  v4,  OS_LOG_TYPE_FAULT,  "Failed to remove all domain filters: [%d] %s",  (uint8_t *)v6,  0x12u);
    }
  }

  return v2 == 0;
}

- (unint64_t)addDomainTrieWithData:(id)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  int64_t v5 = v4;
  if (!a3)
  {
    ne_log_obj();
    __int16 v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      goto LABEL_6;
    }
    *(_DWORD *)__strerrbuf = 136315138;
    uint64_t v19 = "-[NEPolicySession addDomainTrieWithData:]";
    uint64_t v10 = "%s called with null trieData";
    int v11 = (uint8_t *)__strerrbuf;
    __int16 v12 = v7;
    uint32_t v13 = 12;
LABEL_12:
    _os_log_fault_impl(&dword_1876B1000, v12, OS_LOG_TYPE_FAULT, v10, v11, v13);
LABEL_6:

    goto LABEL_10;
  }

  [v4 bytes];
  [v5 length];
  if (necp_session_action())
  {
    int v6 = *__error();
    if (strerror_r(v6, __strerrbuf, 0x80uLL)) {
      __strerrbuf[0] = 0;
    }
    ne_log_obj();
    __int16 v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      goto LABEL_6;
    }
    *(_DWORD *)buf = 67109378;
    int v15 = v6;
    __int16 v16 = 2080;
    uint64_t v17 = __strerrbuf;
    uint64_t v10 = "Failed to add domain trie: [%d] %s";
    int v11 = buf;
    __int16 v12 = v7;
    uint32_t v13 = 18;
    goto LABEL_12;
  }

  ne_log_obj();
  __int16 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__strerrbuf = 67109120;
    LODWORD(v19) = 0;
    _os_log_impl(&dword_1876B1000, v8, OS_LOG_TYPE_INFO, "Added domain trie - ID %u", (uint8_t *)__strerrbuf, 8u);
  }

LABEL_10:
  return 0LL;
}

- (BOOL)removeDomainTrieWithID:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  int v7 = a3;
  if (!necp_session_action())
  {
    ne_log_obj();
    int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__strerrbuf = 67109120;
      int v15 = v7;
      _os_log_impl(&dword_1876B1000, v6, OS_LOG_TYPE_INFO, "Deleted domain trie - ID %u", (uint8_t *)__strerrbuf, 8u);
    }

    return 1;
  }

  if (*__error() == 2) {
    return 1;
  }
  int v3 = *__error();
  if (strerror_r(v3, __strerrbuf, 0x80uLL)) {
    __strerrbuf[0] = 0;
  }
  ne_log_obj();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 67109634;
    int v9 = v7;
    __int16 v10 = 1024;
    int v11 = v3;
    __int16 v12 = 2080;
    uint32_t v13 = __strerrbuf;
    _os_log_fault_impl(&dword_1876B1000, v4, OS_LOG_TYPE_FAULT, "Failed to remove domain trie %u: [%d] %s", buf, 0x18u);
  }

  return 0;
}

- (BOOL)removeAllDomainTries
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  int v2 = necp_session_action();
  if (v2)
  {
    int v3 = *__error();
    ne_log_obj();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      v6[0] = 67109378;
      v6[1] = v3;
      __int16 v7 = 2080;
      __int16 v8 = (char *)__strerrbuf;
      _os_log_fault_impl( &dword_1876B1000,  v4,  OS_LOG_TYPE_FAULT,  "Failed to remove all domain tries: [%d] %s",  (uint8_t *)v6,  0x12u);
    }
  }

  else
  {
    ne_log_obj();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)__strerrbuf = 0;
      _os_log_impl(&dword_1876B1000, v4, OS_LOG_TYPE_INFO, "Deleted all domain tries", __strerrbuf, 2u);
    }
  }

  return v2 == 0;
}

- (unint64_t)addPolicy:(id)a3 storeLocally:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v138 = *MEMORY[0x1895F89C0];
  int v6 = (id *)a3;
  __int16 v7 = v6;
  if (!v6) {
    goto LABEL_87;
  }
  id v8 = v6[2];
  if (!v8) {
    goto LABEL_87;
  }
  switch(*((void *)v8 + 4))
  {
    case 1LL:
    case 2LL:
    case 3LL:
    case 4LL:
    case 7LL:
    case 0xCLL:
    case 0xDLL:
    case 0xELL:
      goto LABEL_4;
    case 5LL:
    case 6LL:
      if (!*((void *)v8 + 6)) {
        goto LABEL_87;
      }
      goto LABEL_4;
    case 8LL:
    case 0xBLL:
    case 0xFLL:
      if (!*((void *)v8 + 7)) {
        goto LABEL_87;
      }
      goto LABEL_4;
    case 9LL:
      if (![*((id *)v8 + 8) count]) {
        goto LABEL_87;
      }
      __int128 v123 = 0u;
      __int128 v124 = 0u;
      __int128 v121 = 0u;
      __int128 v122 = 0u;
      id v9 = *((id *)v8 + 8);
      uint64_t v32 = [v9 countByEnumeratingWithState:&v121 objects:__strerrbuf count:16];
      if (!v32) {
        goto LABEL_85;
      }
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v122;
      break;
    default:
      goto LABEL_87;
  }

  do
  {
    for (uint64_t i = 0LL; i != v33; ++i)
    {
      if (*(void *)v122 != v34) {
        objc_enumerationMutation(v9);
      }
      uint64_t v36 = *(void *)(*((void *)&v121 + 1) + 8 * i);
      if (!v36
        || (uint64_t v37 = *(void *)(v36 + 24), (unint64_t)(v37 - 8) < 0xFFFFFFFFFFFFFFF9LL)
        || (uint64_t v38 = *(void *)(v36 + 48), v38 > 7))
      {
LABEL_86:

LABEL_87:
        unint64_t v28 = 0LL;
        goto LABEL_204;
      }

      if (*(void *)(v36 + 32))
      {
        if (v38) {
          goto LABEL_86;
        }
      }

      else
      {
        if (v38) {
          BOOL v39 = *(void *)(v36 + 40) == 0LL;
        }
        else {
          BOOL v39 = 1;
        }
        if (!v39) {
          goto LABEL_86;
        }
      }

      uint64_t v40 = *(void *)(v36 + 16);
      if ((unint64_t)(v37 - 5) > 1)
      {
        if (v40 || v37 == 7 && !*(_DWORD *)(v36 + 8)) {
          goto LABEL_86;
        }
      }

      else if (!v40)
      {
        goto LABEL_86;
      }
    }

    uint64_t v33 = [v9 countByEnumeratingWithState:&v121 objects:__strerrbuf count:16];
  }

  while (v33);
LABEL_85:

LABEL_4:
  __int128 v119 = 0u;
  __int128 v120 = 0u;
  __int128 v117 = 0u;
  __int128 v118 = 0u;
  id v9 = v7[3];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v117 objects:buf count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v118;
    do
    {
      uint64_t v13 = 0LL;
      do
      {
        if (*(void *)v118 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v117 + 1) + 8 * v13);
        if (!v14) {
          goto LABEL_86;
        }
        switch(*(void *)(v14 + 72))
        {
          case 1LL:
          case 2LL:
            if (!*(void *)(v14 + 80)) {
              goto LABEL_86;
            }
            break;
          case 3LL:
          case 4LL:
          case 7LL:
          case 0xALL:
          case 0xFLL:
          case 0x11LL:
          case 0x12LL:
          case 0x13LL:
          case 0x18LL:
          case 0x19LL:
          case 0x1ALL:
          case 0x1BLL:
          case 0x1CLL:
          case 0x1FLL:
          case 0x20LL:
          case 0x27LL:
          case 0x28LL:
            break;
          case 5LL:
            if (!*(void *)(v14 + 88)) {
              goto LABEL_86;
            }
            break;
          case 6LL:
            if (!*(void *)(v14 + 96)) {
              goto LABEL_86;
            }
            break;
          case 8LL:
            if (!*(void *)(v14 + 112)) {
              goto LABEL_86;
            }
            break;
          case 9LL:
            if (*(_DWORD *)(v14 + 48) > *(_DWORD *)(v14 + 52)) {
              goto LABEL_86;
            }
            break;
          case 0xBLL:
          case 0xDLL:
          case 0x14LL:
          case 0x16LL:
            if (!*(void *)(v14 + 120)) {
              goto LABEL_86;
            }
            break;
          case 0xCLL:
          case 0xELL:
          case 0x15LL:
          case 0x17LL:
            if (!*(void *)(v14 + 120) || !*(void *)(v14 + 128)) {
              goto LABEL_86;
            }
            break;
          case 0x10LL:
            if (!*(void *)(v14 + 144) || !*(void *)(v14 + 152)) {
              goto LABEL_86;
            }
            break;
          case 0x1DLL:
            if (!*(void *)(v14 + 160)) {
              goto LABEL_86;
            }
            break;
          case 0x1ELL:
            if (!*(_WORD *)(v14 + 14)) {
              goto LABEL_86;
            }
            break;
          case 0x25LL:
            if (!*(_WORD *)(v14 + 16)) {
              goto LABEL_86;
            }
            break;
          case 0x26LL:
            if (!*(_DWORD *)(v14 + 32)) {
              goto LABEL_86;
            }
            break;
          case 0x2ALL:
            if (!*(void *)(v14 + 104)) {
              goto LABEL_86;
            }
            break;
          case 0x2BLL:
            if (!*(_DWORD *)(v14 + 36) && !*(_DWORD *)(v14 + 40) && !*(_DWORD *)(v14 + 44)) {
              goto LABEL_86;
            }
            break;
          default:
            goto LABEL_86;
        }

        ++v13;
      }

      while (v11 != v13);
      uint64_t v15 = [v9 countByEnumeratingWithState:&v117 objects:buf count:16];
      uint64_t v11 = v15;
    }

    while (v15);
  }

  id v16 = objc_alloc_init(MEMORY[0x189603FB8]);
  uint64_t v17 = v16;
  if (!v16)
  {
    ne_log_obj();
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__strerrbuf = 0;
      _os_log_error_impl( &dword_1876B1000,  v27,  OS_LOG_TYPE_ERROR,  "Failed to create add message",  (uint8_t *)__strerrbuf,  2u);
    }

    unint64_t v28 = 0LL;
    goto LABEL_203;
  }

  id v18 = v16;
  uint64_t v19 = &off_18A087000;
  +[NEPolicySession addTLVToMessage:type:length:value:]( (uint64_t)&OBJC_CLASS___NEPolicySession,  v18,  2,  4LL,  (uint64_t)(v7 + 1));
  uint64_t v20 = (char *)v7[2];
  id v21 = v18;
  uint64_t v22 = v21;
  if (!v20)
  {
    v111 = v17;
    v113 = v7;

LABEL_209:
    ne_log_obj();
    v109 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__strerrbuf = 0;
      _os_log_error_impl( &dword_1876B1000,  v109,  OS_LOG_TYPE_ERROR,  "Failed to add TLVs to message",  (uint8_t *)__strerrbuf,  2u);
    }

    unint64_t v28 = 0LL;
    uint64_t v17 = v111;
    __int16 v7 = v113;
    goto LABEL_203;
  }

  id v23 = objc_alloc_init(MEMORY[0x189603FB8]);
  v24 = v23;
  unint64_t v25 = *((void *)v20 + 4) - 1LL;
  if (v25 > 0xE) {
    unsigned __int8 v26 = 0;
  }
  else {
    unsigned __int8 v26 = byte_187872FE3[v25];
  }
  v114 = self;
  unsigned __int8 v125 = v26;
  [v23 appendBytes:&v125 length:1];
  v116 = v22;
  switch(*((void *)v20 + 4))
  {
    case 1LL:
      v29 = (uint64_t *)(v20 + 12);
      goto LABEL_136;
    case 2LL:
      v29 = (uint64_t *)(v20 + 8);
      goto LABEL_136;
    case 3LL:
      int v42 = *((_DWORD *)v20 + 4);
      v41 = (uint64_t *)(v20 + 16);
      if (!v42) {
        goto LABEL_139;
      }
      v30 = v24;
      v29 = v41;
      goto LABEL_137;
    case 4LL:
    case 7LL:
      v29 = (uint64_t *)(v20 + 20);
      goto LABEL_136;
    case 5LL:
      [*((id *)v20 + 6) dataUsingEncoding:1];
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      [v24 appendData:v43];
      LOBYTE(v136) = 0;
      v44 = (char *)&v136;
      goto LABEL_207;
    case 6LL:
      unint64_t v45 = *((void *)v20 + 5) - 1LL;
      if (v45 > 0xE) {
        int v46 = 0;
      }
      else {
        int v46 = byte_187872FE3[v45];
      }
      LODWORD(v136) = v46;
      [v24 appendBytes:&v136 length:4];
      [*((id *)v20 + 6) dataUsingEncoding:1];
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      [v24 appendData:v43];
      char v128 = 0;
      v44 = &v128;
LABEL_207:
      [v24 appendBytes:v44 length:1];

      goto LABEL_139;
    case 8LL:
    case 0xBLL:
    case 0xFLL:
      [*((id *)v20 + 7) getUUIDBytes:&v136];
      v29 = &v136;
      v30 = v24;
      uint64_t v31 = 16LL;
      goto LABEL_138;
    case 9LL:
      v115 = v24;
      v112 = v7;
      BOOL v110 = v4;
      __int128 v123 = 0u;
      __int128 v124 = 0u;
      __int128 v121 = 0u;
      __int128 v122 = 0u;
      id v47 = *((id *)v20 + 8);
      uint64_t v48 = [v47 countByEnumeratingWithState:&v121 objects:__strerrbuf count:16];
      if (!v48) {
        goto LABEL_134;
      }
      uint64_t v49 = v48;
      uint64_t v50 = *(void *)v122;
      break;
    case 0xELL:
      LODWORD(v136) = -1;
      v29 = &v136;
LABEL_136:
      v30 = v24;
LABEL_137:
      uint64_t v31 = 4LL;
LABEL_138:
      [v30 appendBytes:v29 length:v31];
      goto LABEL_139;
    default:
      goto LABEL_139;
  }

  while (2)
  {
    uint64_t v51 = 0LL;
    while (2)
    {
      if (*(void *)v122 != v50) {
        objc_enumerationMutation(v47);
      }
      uint64_t v52 = *(void *)(*((void *)&v121 + 1) + 8 * v51);
      if (!v52) {
        goto LABEL_132;
      }
      v53 = (objc_class *)MEMORY[0x189603FB8];
      id v54 = v116;
      id v55 = objc_alloc_init(v53);
      v56 = v55;
      char v57 = 2;
      switch(*(void *)(v52 + 24))
      {
        case 1LL:
          break;
        case 2LL:
          if (*(_DWORD *)(v52 + 12)) {
            char v57 = 8;
          }
          else {
            char v57 = 1;
          }
          break;
        case 3LL:
          char v57 = 3;
          break;
        case 4LL:
          char v57 = 4;
          break;
        case 5LL:
          char v57 = 5;
          break;
        case 6LL:
          char v57 = 6;
          break;
        case 7LL:
          char v57 = 7;
          break;
        default:
          char v57 = 0;
          break;
      }

      char v128 = v57;
      [v55 appendBytes:&v128 length:1];
      if (*(void *)(v52 + 40))
      {
        LOBYTE(v58) = 0x80;
      }

      else
      {
        unint64_t v59 = *(void *)(v52 + 48);
        BOOL v60 = v59 > 7;
        unint64_t v58 = 0x4020100402010800uLL >> (8 * v59);
        if (v60) {
          LOBYTE(v58) = 0;
        }
      }

      char v127 = v58;
      [v56 appendBytes:&v127 length:1];
      uint64_t v62 = *(void *)(v52 + 24);
      if ((unint64_t)(v62 - 5) < 2)
      {
        uint64_t v136 = 0LL;
        uint64_t v137 = 0LL;
        [*(id *)(v52 + 16) getUUIDBytes:&v136];
        v61 = &v136;
        v63 = v56;
        uint64_t v64 = 16LL;
LABEL_123:
        [v63 appendBytes:v61 length:v64];
        goto LABEL_124;
      }

      if (v62 == 2)
      {
        v61 = (uint64_t *)(v52 + 12);
        if (!*(_DWORD *)(v52 + 12)) {
          goto LABEL_124;
        }
LABEL_122:
        v63 = v56;
        uint64_t v64 = 4LL;
        goto LABEL_123;
      }

      if (v62 == 7)
      {
        v61 = (uint64_t *)(v52 + 8);
        goto LABEL_122;
      }

- (unint64_t)addPolicy:(id)a3
{
  return -[NEPolicySession addPolicy:storeLocally:](self, "addPolicy:storeLocally:", a3, 0LL);
}

- (id)dumpKernelPolicies
{
  uint64_t v137 = *MEMORY[0x1895F89C0];
  uint64_t v2 = 0x80000LL;
  int v3 = (unsigned int *)malloc(0x80000uLL);
  if (!v3)
  {
    uint64_t v2 = 0x40000LL;
    int v3 = (unsigned int *)malloc(0x40000uLL);
    if (!v3)
    {
      int v15 = *__error();
      if (strerror_r(v15, __strerrbuf, 0x80uLL)) {
        __strerrbuf[0] = 0;
      }
      ne_log_obj();
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134218498;
        *(void *)&uint8_t buf[4] = 0x40000LL;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v15;
        *(_WORD *)&buf[18] = 2080;
        v133 = __strerrbuf;
        _os_log_fault_impl( &dword_1876B1000,  v16,  OS_LOG_TYPE_FAULT,  "Failed to allocate memory for policy dump (%zu bytes): [%d] %s",  buf,  0x1Cu);
      }

      goto LABEL_24;
    }
  }

  __memset_chk();
  if (necp_session_action())
  {
    BOOL v4 = __error();
    int v5 = *v4;
    if (*v4 != 12)
    {
      if (strerror_r(*v4, __strerrbuf, 0x80uLL)) {
        __strerrbuf[0] = 0;
      }
      ne_log_obj();
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&uint8_t buf[4] = v5;
        *(_WORD *)&buf[8] = 2080;
        *(void *)&buf[10] = __strerrbuf;
        _os_log_fault_impl(&dword_1876B1000, v12, OS_LOG_TYPE_FAULT, "Failed to dump all policies: [%d] %s", buf, 0x12u);
      }

      goto LABEL_23;
    }

    if (strerror_r(12, __strerrbuf, 0x80uLL)) {
      __strerrbuf[0] = 0;
    }
    ne_log_obj();
    int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&uint8_t buf[4] = 12;
      *(_WORD *)&buf[8] = 2080;
      *(void *)&buf[10] = __strerrbuf;
      __int16 v7 = "Failed to dump all policies: [%d] %s";
      id v8 = buf;
      id v9 = v6;
      uint32_t v10 = 18;
LABEL_21:
      _os_log_error_impl(&dword_1876B1000, v9, OS_LOG_TYPE_ERROR, v7, v8, v10);
    }

- (id)dumpDomainTries
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  uint64_t v2 = 800LL;
  int v3 = (unsigned int *)malloc(0x320uLL);
  if (!v3)
  {
    uint64_t v2 = 400LL;
    int v3 = (unsigned int *)malloc(0x190uLL);
    if (!v3)
    {
      int v13 = *__error();
      if (strerror_r(v13, __strerrbuf, 0x80uLL)) {
        __strerrbuf[0] = 0;
      }
      ne_log_obj();
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134218498;
        *(void *)id v29 = 400LL;
        *(_WORD *)&v29[8] = 1024;
        *(_DWORD *)&v29[10] = v13;
        __int16 v30 = 2080;
        uint64_t v31 = __strerrbuf;
        _os_log_fault_impl( &dword_1876B1000,  v14,  OS_LOG_TYPE_FAULT,  "Failed to allocate memory for trie dump (%zu bytes): [%d] %s",  buf,  0x1Cu);
      }

      goto LABEL_26;
    }
  }

  __memset_chk();
  if (!necp_session_action())
  {
    uint64_t v7 = *v3;
    if (!(_DWORD)v7) {
      goto LABEL_15;
    }
    uint64_t v8 = v2 - 4;
    if (40 * v7 <= (unint64_t)(v2 - 4))
    {
      *(void *)&__strerrbuf[16] = 0x1400000014LL;
      *(_OWORD *)__strerrbuf = xmmword_187872FA0;
      [MEMORY[0x189607940] string];
      int v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 appendToStringAtColumnWithContent:__strerrbuf column:0 content:"ID" appendAsNewLine:0 addNewLine:0];
      [v15 appendToStringAtColumnWithContent:__strerrbuf column:1 content:"MEMORY" appendAsNewLine:0 addNewLine:0];
      [v15 appendToStringAtColumnWithContent:__strerrbuf column:2 content:"NODES(MEM:COUNT)" appendAsNewLine:0 addNewLine:0];
      [v15 appendToStringAtColumnWithContent:__strerrbuf column:3 content:"MAPS(MEM:COUNT)" appendAsNewLine:0 addNewLine:0];
      [v15 appendToStringAtColumnWithContent:__strerrbuf column:4 content:"BYTES(MEM:COUNT)" appendAsNewLine:0 addNewLine:0];
      [v15 appendToStringAtColumnWithContent:__strerrbuf column:5 content:"FLAGS" appendAsNewLine:0 addNewLine:1];
      uint64_t v16 = 0LL;
      v27 = v3;
      do
      {
        uint64_t v17 = &v3[v16];
        id v18 = objc_msgSend( objc_alloc(NSString), "initWithFormat:", @"%u", v17[1]);
        objc_msgSend( v15,  "appendToStringAtColumnWithContent:column:content:appendAsNewLine:addNewLine:",  __strerrbuf,  0,  objc_msgSend(v18, "UTF8String"),  0,  0);
        id v19 = objc_msgSend( objc_alloc(NSString), "initWithFormat:", @"%u", v17[2]);
        objc_msgSend( v15,  "appendToStringAtColumnWithContent:column:content:appendAsNewLine:addNewLine:",  __strerrbuf,  1,  objc_msgSend(v19, "UTF8String"),  0,  0);
        id v20 = objc_msgSend( objc_alloc(NSString), "initWithFormat:", @"%u : %u", v17[3], v17[6]);
        objc_msgSend( v15,  "appendToStringAtColumnWithContent:column:content:appendAsNewLine:addNewLine:",  __strerrbuf,  2,  objc_msgSend(v20, "UTF8String"),  0,  0);
        id v21 = objc_msgSend( objc_alloc(NSString), "initWithFormat:", @"%u : %u", v17[4], v17[7]);
        objc_msgSend( v15,  "appendToStringAtColumnWithContent:column:content:appendAsNewLine:addNewLine:",  __strerrbuf,  3,  objc_msgSend(v21, "UTF8String"),  0,  0);
        id v22 = objc_msgSend( objc_alloc(NSString), "initWithFormat:", @"%u : %u", v17[5], v17[8]);
        objc_msgSend( v15,  "appendToStringAtColumnWithContent:column:content:appendAsNewLine:addNewLine:",  __strerrbuf,  4,  objc_msgSend(v22, "UTF8String"),  0,  0);
        unint64_t v23 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithFormat:@"[ "];
        v24 = v23;
        unsigned int v25 = v17[10];
        if ((v25 & 1) != 0)
        {
          [v23 appendFormat:@"R|"];
          unsigned int v25 = v17[10];
        }

        if ((v25 & 2) != 0) {
          [v24 appendFormat:@"P|"];
        }
        [v24 appendFormat:@" ]"];
        id v26 = v24;
        objc_msgSend( v15,  "appendToStringAtColumnWithContent:column:content:appendAsNewLine:addNewLine:",  __strerrbuf,  5,  objc_msgSend(v26, "UTF8String"),  0,  1);

        v16 += 10LL;
        int v3 = v27;
      }

      while (10 * v7 != v16);
      free(v27);
      return v15;
    }

    ne_log_obj();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    *(_DWORD *)__strerrbuf = 67109376;
    *(_DWORD *)&__strerruint8_t buf[4] = v7;
    *(_WORD *)&__strerrbuf[8] = 2048;
    *(void *)&__strerrbuf[10] = v8;
    uint32_t v10 = "Received trie count <%d> invalid with buffer size <%zu>";
    unint64_t v11 = __strerrbuf;
LABEL_36:
    _os_log_error_impl(&dword_1876B1000, v9, OS_LOG_TYPE_ERROR, v10, v11, 0x12u);
    goto LABEL_19;
  }

  BOOL v4 = __error();
  int v5 = *v4;
  if (*v4 != 12)
  {
    if (v5 != 2)
    {
      if (strerror_r(*v4, __strerrbuf, 0x80uLL)) {
        __strerrbuf[0] = 0;
      }
      ne_log_obj();
      int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)id v29 = v5;
        *(_WORD *)&v29[4] = 2080;
        *(void *)&v29[6] = __strerrbuf;
        _os_log_fault_impl(&dword_1876B1000, v6, OS_LOG_TYPE_FAULT, "Failed to dump all tries: [%d] %s", buf, 0x12u);
      }

      goto LABEL_20;
    }

- (BOOL)apply
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  int v2 = necp_session_action();
  if (v2)
  {
    int v3 = *__error();
    if (strerror_r(v3, __strerrbuf, 0x80uLL)) {
      __strerrbuf[0] = 0;
    }
    ne_log_obj();
    BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      v6[0] = 67109378;
      v6[1] = v3;
      __int16 v7 = 2080;
      uint64_t v8 = __strerrbuf;
      _os_log_fault_impl( &dword_1876B1000,  v4,  OS_LOG_TYPE_FAULT,  "Failed to apply policies: [%d] %s",  (uint8_t *)v6,  0x12u);
    }
  }

  return v2 == 0;
}

- (id)policyWithID:(unint64_t)a3
{
  if (self) {
    self = (NEPolicySession *)objc_getProperty(self, a2, 32LL, 1);
  }
  BOOL v4 = (void *)MEMORY[0x189607968];
  int v5 = self;
  [v4 numberWithUnsignedInteger:a3];
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEPolicySession objectForKey:](v5, "objectForKey:", v6);
  __int16 v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)removePolicyWithID:(unint64_t)a3
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  int v13 = a3;
  if (!self)
  {
    id Property = 0LL;
LABEL_9:
    uint64_t v10 = (void *)MEMORY[0x189607968];
    id v11 = Property;
    [v10 numberWithUnsignedInteger:a3];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 removeObjectForKey:v12];

    return 1;
  }

  if (!necp_session_action())
  {
    id Property = objc_getProperty(self, v5, 32LL, 1);
    goto LABEL_9;
  }

- (BOOL)removeAllPolicies
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (!self)
  {
    id Property = 0LL;
LABEL_9:
    [Property removeAllObjects];
    return 1;
  }

  if (!necp_session_action())
  {
    id Property = objc_getProperty(self, v3, 32LL, 1);
    goto LABEL_9;
  }

- (void).cxx_destruct
{
}

+ (uint64_t)copyTLVForBytes:(uint64_t)a1 messageLength:(uint64_t)a2 type:(unint64_t)a3 includeHeaderOffset:(int)a4 n:(int)a5 hasFlags:(int)a6
{
  uint64_t result = 0LL;
  if (!a2 || !a3) {
    return result;
  }
  int v12 = 0;
  unint64_t v13 = 0LL;
  while (1)
  {
    uint64_t v14 = a2 + v13;
LABEL_7:
    v13 += *(unsigned int *)(v14 + 1) + 5LL;
    if (v13 >= a3) {
      return 0LL;
    }
  }

  if (v12 != a5)
  {
    ++v12;
    goto LABEL_7;
  }

  uint64_t v15 = 5LL;
  if (a6) {
    uint64_t v15 = 6LL;
  }
  [MEMORY[0x189603F48] dataWithBytes:v14 + v15 length:*(unsigned int *)(v14 + 1)];
  return objc_claimAutoreleasedReturnValue();
}

+ (void)addTLVToMessage:(char)a3 type:(uint64_t)a4 length:(uint64_t)a5 value:
{
  char v9 = a3;
  id v7 = a2;
  objc_opt_self();
  [v7 appendBytes:&v9 length:1];
  int v8 = a4;
  [v7 appendBytes:&v8 length:4];
  [v7 appendBytes:a5 length:a4];
}

uint64_t __39__NEPolicySession_initWithSessionName___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v3 name],
        int v4 = (void *)objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 isEqualToString:*(void *)(a1 + 32)],
        v4,
        v5))
  {
    [v3 handle];
    int v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = dup([v6 fileDescriptor]);

    uint64_t v7 = 0LL;
  }

  else
  {
    uint64_t v7 = 1LL;
  }

  return v7;
}

uint64_t __39__NEPolicySession_initWithSessionName___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    [v3 name];
    int v4 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  return v5;
}

@end