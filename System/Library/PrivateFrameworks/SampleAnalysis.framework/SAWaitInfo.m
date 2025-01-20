@interface SAWaitInfo
+ (SAWaitInfo)stateWithPAStyleSerializedWaitInfo:(uint64_t)a1;
+ (id)classDictionaryKey;
+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4;
+ (id)waitInfoWithKCDataWaitInfo:(void *)a3 portName:(unint64_t)a4 flags:(unint64_t)a5 domain:;
- (BOOL)_displaysContentForPid:(uint64_t)a3 tid:(char)a4 options:(void *)a5 displayString:(void *)a6 nameCallback:;
- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSString)debugDescription;
- (SAWaitInfo)init;
- (SAWaitInfo)initWithKCDataWaitInfo:(const stackshot_thread_waitinfo_v2 *)a3;
- (id)descriptionForPid:(int)a3 tid:(unint64_t)a4 options:(unint64_t)a5 nameCallback:(id)a6;
- (int)blockingPid;
- (int64_t)compare:(id)a3;
- (uint64_t)displaysSameContentAs:(int)a3 forPid:(uint64_t)a4 tid:(char)a5 displayOptions:;
- (uint64_t)matchesKCDataWaitInfo:(void *)a3 portName:(uint64_t)a4 flags:(uint64_t)a5 domain:;
- (unint64_t)blockingTid;
- (unint64_t)context;
- (unint64_t)hash;
- (unint64_t)owner;
- (unint64_t)sizeInBytesForSerializedVersion;
- (unsigned)type;
- (void)addSelfToSerializationDictionary:(id)a3;
- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6;
@end

@implementation SAWaitInfo

- (SAWaitInfo)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SAWaitInfo;
  return (SAWaitInfo *)-[SABlockingInfo _init](&v3, sel__init);
}

- (SAWaitInfo)initWithKCDataWaitInfo:(const stackshot_thread_waitinfo_v2 *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SAWaitInfo;
  result = -[SABlockingInfo _init](&v5, sel__init);
  if (result)
  {
    result->_owner = a3->owner;
    result->_context = a3->context;
    result->_type = a3->wait_type;
  }

  return result;
}

+ (id)waitInfoWithKCDataWaitInfo:(void *)a3 portName:(unint64_t)a4 flags:(unint64_t)a5 domain:
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  v10 = (objc_class *)objc_opt_self();
  if (v9)
  {
    v11 = objc_alloc(&OBJC_CLASS___SAWaitInfoWithPortLabel);
    id v12 = v9;
    if (v11)
    {
      v20.receiver = v11;
      v20.super_class = (Class)&OBJC_CLASS___SAWaitInfoWithPortLabel;
      v13 = (id *)objc_msgSendSuper2(&v20, sel_initWithKCDataWaitInfo_, a2);
      uint64_t v14 = (uint64_t)v13;
      if (v13)
      {
        objc_storeStrong(v13 + 4, a3);
        if (a4 >= 0x10000)
        {
          int v16 = *__error();
          _sa_logt();
          v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 134217984;
            unint64_t v22 = a4;
            _os_log_fault_impl( &dword_186C92000,  v17,  OS_LOG_TYPE_FAULT,  "port label flags 0x%llx is too large",  buf,  0xCu);
          }

          *__error() = v16;
        }

        *(_WORD *)(v14 + 40) = a4;
        if (a5 >= 0x100)
        {
          int v18 = *__error();
          _sa_logt();
          v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 134217984;
            unint64_t v22 = a5;
            _os_log_fault_impl( &dword_186C92000,  v19,  OS_LOG_TYPE_FAULT,  "port label domain %llu is too large",  buf,  0xCu);
          }

          *__error() = v18;
        }

        *(_BYTE *)(v14 + 42) = a5;
      }
    }

    else
    {
      uint64_t v14 = 0LL;
    }
  }

  else
  {
    uint64_t v14 = [[v10 alloc] initWithKCDataWaitInfo:a2];
  }

  return (id)v14;
}

- (uint64_t)displaysSameContentAs:(int)a3 forPid:(uint64_t)a4 tid:(char)a5 displayOptions:
{
  id v9 = a2;
  v10 = v9;
  if (a1)
  {
    if ((void *)a1 == v9) {
      goto LABEL_24;
    }
    if (v9)
    {
      if (*(void *)(a1 + 16) != v9[2]) {
        goto LABEL_22;
      }
      uint64_t v11 = [(id)a1 portFlags];
      if (v11 != [v10 portFlags]) {
        goto LABEL_22;
      }
      id v12 = (void *)[(id)a1 portDomain];
      [(id)a1 portName];
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        [v10 portName];
        id v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v12) {
          goto LABEL_24;
        }
      }

      uint64_t v14 = [(id)a1 portName];
      if (v14)
      {
        v15 = (void *)v14;
        uint64_t v16 = [v10 portName];
        if (v16)
        {
          v17 = (void *)v16;
          [(id)a1 portName];
          int v18 = (void *)objc_claimAutoreleasedReturnValue();
          [v10 portName];
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          char v20 = [v18 isEqualToString:v19];

          if (v13)
          {

            if ((v20 & 1) != 0) {
              goto LABEL_24;
            }
            goto LABEL_22;
          }

          if ((v20 & 1) != 0)
          {
LABEL_24:
            a1 = 1LL;
            goto LABEL_25;
          }

- (BOOL)_displaysContentForPid:(uint64_t)a3 tid:(char)a4 options:(void *)a5 displayString:(void *)a6 nameCallback:
{
  uint64_t v116 = *MEMORY[0x1895F89C0];
  id v11 = a6;
  id v12 = (void (**)(void, void, void))v11;
  if (!a1)
  {
LABEL_279:
    BOOL v13 = 0LL;
    goto LABEL_276;
  }

  if ((a5 != 0LL) != (v11 != 0LL))
  {
    int v102 = *__error();
    _sa_logt();
    v103 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    BOOL v104 = v12 != 0LL;
    if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
    {
      LODWORD(a5) = a5 != 0LL;
      *(_DWORD *)buf = 67109376;
      int v113 = (int)a5;
      __int16 v114 = 1024;
      BOOL v115 = v104;
      _os_log_error_impl(&dword_186C92000, v103, OS_LOG_TYPE_ERROR, "string_out:%d StringForPidAndTid:%d", buf, 0xEu);
    }

    else
    {
      LOBYTE(a5) = a5 != 0LL;
    }

    *__error() = v102;
    _SASetCrashLogMessage(2202, "string_out:%d StringForPidAndTid:%d", v105, v106, v107, v108, v109, v110, (char)a5);
    _os_crash();
    __break(1u);
  }

  BOOL v13 = 0LL;
  uint64_t v14 = a4 & 1;
  switch(*(_BYTE *)(a1 + 8))
  {
    case 0:
      int v15 = *__error();
      _sa_logt();
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_186C92000, v16, OS_LOG_TYPE_ERROR, "waitinfo has no type", buf, 2u);
      }

      BOOL v13 = 0LL;
      *__error() = v15;
      goto LABEL_276;
    case 1:
      uint64_t v21 = *(void *)(a1 + 16) | v14;
      BOOL v13 = v21 != 0;
      if (a5 && v21)
      {
        unint64_t v22 = (void *)[@"kernel mutex" mutableCopy];
        uint64_t v23 = v22;
        if ((a4 & 2) != 0) {
          objc_msgSend(v22, "appendFormat:", @" address 0x%llx", *(void *)(a1 + 24));
        }
        uint64_t v24 = *(void *)(a1 + 16);
        if (!v24) {
          goto LABEL_210;
        }
        if (v24 != -6) {
          goto LABEL_208;
        }
        v25 = @" in spin mode";
        goto LABEL_211;
      }

      goto LABEL_276;
    case 2:
      if ((a4 & 1) == 0)
      {
        [(id)a1 portName];
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v26)
        {
          uint64_t v27 = *(void *)(a1 + 16);
          if (v27 != -3 && v27 != -5) {
            goto LABEL_279;
          }
        }
      }

      if (!a5) {
        goto LABEL_275;
      }
      v17 = (void *)[@"mach_msg receive" mutableCopy];
      if ((a4 & 2) != 0
        || ((uint64_t v29 = *(void *)(a1 + 16), v29 != -5) ? (v30 = v29 == -3) : (v30 = 1),
            v30
         || ([(id)a1 portName], v31 = (void *)objc_claimAutoreleasedReturnValue(), v31, v31)))
      {
        uint64_t v32 = *(void *)(a1 + 16);
        v33 = @" on port";
        if (v32 == -5) {
          v33 = @" on intransit port";
        }
        if (v32 == -3) {
          v34 = @" on locked port";
        }
        else {
          v34 = v33;
        }
        [v17 appendFormat:v34];
        [(id)a1 portName];
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        if (v35)
        {
          [(id)a1 portName];
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          [v17 appendFormat:@" name \"%@\"", v36];
        }

        if ([(id)a1 portFlags]) {
          objc_msgSend(v17, "appendFormat:", @" flags 0x%llx", objc_msgSend((id)a1, "portFlags"));
        }
        if ([(id)a1 portDomain]) {
          objc_msgSend(v17, "appendFormat:", @" in domain %llu", objc_msgSend((id)a1, "portDomain"));
        }
        if ((a4 & 2) != 0) {
          objc_msgSend(v17, "appendFormat:", @" address 0x%llx", *(void *)(a1 + 24));
        }
        unint64_t v37 = *(void *)(a1 + 16);
      }

      goto LABEL_197;
    case 3:
      if ((a4 & 1) != 0
        || ([(id)a1 portName], v38 = (void *)objc_claimAutoreleasedReturnValue(), v38, v38))
      {
        if (!a5) {
          goto LABEL_275;
        }
      }

      else
      {
        uint64_t v98 = *(void *)(a1 + 16);
        BOOL v13 = v98 == -4;
        if (!a5 || v98 != -4) {
          goto LABEL_276;
        }
      }

      v17 = (void *)[@"mach_msg receive" mutableCopy];
      if ((a4 & 2) != 0
        || *(void *)(a1 + 16) == -4LL
        || ([(id)a1 portName], v39 = (void *)objc_claimAutoreleasedReturnValue(), v39, v39))
      {
        if (*(void *)(a1 + 16) == -4LL) {
          v40 = @" on locked port set";
        }
        else {
          v40 = @" on port set";
        }
        [v17 appendFormat:v40];
        [(id)a1 portName];
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        if (v41)
        {
          [(id)a1 portName];
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          [v17 appendFormat:@" name \"%@\"", v42];
        }

        if ([(id)a1 portFlags]) {
          objc_msgSend(v17, "appendFormat:", @" flags 0x%llx", objc_msgSend((id)a1, "portFlags"));
        }
        if ([(id)a1 portDomain]) {
          objc_msgSend(v17, "appendFormat:", @" in domain %llu", objc_msgSend((id)a1, "portDomain"));
        }
LABEL_68:
        if ((a4 & 2) != 0) {
          objc_msgSend(v17, "appendFormat:", @" address 0x%llx", *(void *)(a1 + 24));
        }
      }

      goto LABEL_197;
    case 4:
      if ((a4 & 1) != 0
        || ((uint64_t v43 = *(void *)(a1 + 16), (unint64_t)(v43 + 3) >= 2) ? (v44 = v43 == -5) : (v44 = 1),
            v44 || (v43 ? (BOOL v96 = (int)v43 <= 0) : (BOOL v96 = 1), !v96)))
      {
        if (!a5) {
          goto LABEL_275;
        }
      }

      else
      {
        [(id)a1 portName];
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        BOOL v13 = v97 != 0LL;

        if (!a5 || !v97) {
          goto LABEL_276;
        }
      }

      v17 = (void *)[@"mach_msg send" mutableCopy];
      if ((a4 & 2) != 0
        || ((uint64_t v45 = *(void *)(a1 + 16), v45 != -5) ? (v46 = v45 == -3) : (v46 = 1),
            v46
         || ([(id)a1 portName], v47 = (void *)objc_claimAutoreleasedReturnValue(), v47, v47)))
      {
        uint64_t v48 = *(void *)(a1 + 16);
        v49 = @" on port";
        if (v48 == -5) {
          v49 = @" on intransit port";
        }
        if (v48 == -3) {
          v50 = @" on locked port";
        }
        else {
          v50 = v49;
        }
        [v17 appendFormat:v50];
        [(id)a1 portName];
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        if (v51)
        {
          [(id)a1 portName];
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          [v17 appendFormat:@" name \"%@\"", v52];
        }

        if ([(id)a1 portFlags]) {
          objc_msgSend(v17, "appendFormat:", @" flags 0x%llx", objc_msgSend((id)a1, "portFlags"));
        }
        if ([(id)a1 portDomain]) {
          objc_msgSend(v17, "appendFormat:", @" in domain %llu", objc_msgSend((id)a1, "portDomain"));
        }
        if ((a4 & 2) != 0) {
          objc_msgSend(v17, "appendFormat:", @" address 0x%llx", *(void *)(a1 + 24));
        }
      }

      uint64_t v53 = *(void *)(a1 + 16);
      switch(v53)
      {
        case -5LL:
        case -3LL:
          goto LABEL_197;
        case -2LL:
          uint64_t v53 = 0LL;
          *(void *)(a1 + 16) = 0LL;
          goto LABEL_245;
        case 0LL:
          goto LABEL_247;
        default:
          goto LABEL_244;
      }

      goto LABEL_197;
    case 5:
      if ((a4 & 1) != 0)
      {
        if (!a5) {
          goto LABEL_275;
        }
      }

      else
      {
        [(id)a1 portName];
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        BOOL v13 = v54 != 0LL;

        if (!a5 || !v54) {
          goto LABEL_276;
        }
      }

      v17 = (void *)[@"mach_msg send" mutableCopy];
      if ((a4 & 2) != 0) {
        goto LABEL_220;
      }
      [(id)a1 portName];
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      if (v89 || [(id)a1 portFlags])
      {
      }

      else if (![(id)a1 portDomain])
      {
        goto LABEL_228;
      }

- (BOOL)isEqual:(id)a3
{
  objc_super v5 = (SAWaitInfo *)a3;
  if (self == v5)
  {
    char v17 = 1;
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        v7 = v6;
        if (self->_type != v6->_type
          || self->_context != v6->_context
          || (unint64_t v8 = -[SABlockingInfo portFlags](self, "portFlags"), v8 != -[SABlockingInfo portFlags](v7, "portFlags"))
          || (unint64_t v9 = -[SABlockingInfo portDomain](self, "portDomain"), v9 != -[SABlockingInfo portDomain]( v7,  "portDomain"))
          || self->_owner != v7->_owner)
        {
          char v17 = 0;
LABEL_18:

          goto LABEL_19;
        }
        v10 = -[SABlockingInfo portName](self, "portName");
        if (!v10)
        {
          -[SABlockingInfo portName](v7, "portName");
          objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v3)
          {
            char v17 = 1;
LABEL_24:

            goto LABEL_25;
          }
        }

        uint64_t v11 = -[SABlockingInfo portName](self, "portName");
        if (v11)
        {
          id v12 = (void *)v11;
          uint64_t v13 = -[SABlockingInfo portName](v7, "portName");
          if (v13)
          {
            uint64_t v14 = (void *)v13;
            -[SABlockingInfo portName](self, "portName");
            int v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[SABlockingInfo portName](v7, "portName");
            uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
            char v17 = [v15 isEqualToString:v16];

            if (!v10) {
              goto LABEL_24;
            }
LABEL_25:

            goto LABEL_18;
          }
        }

        char v17 = 0;
        if (!v10) {
          goto LABEL_24;
        }
        goto LABEL_25;
      }
    }

    char v17 = 0;
  }

- (int64_t)compare:(id)a3
{
  v4 = a3;
  unsigned int type = self->_type;
  unsigned int v6 = *((unsigned __int16 *)v4 + 4);
  if (type > v6) {
    goto LABEL_7;
  }
  if (type < v6)
  {
LABEL_5:
    int64_t v9 = -1LL;
    goto LABEL_8;
  }

  unint64_t owner = self->_owner;
  unint64_t v8 = v4[2];
  if (owner > v8) {
    goto LABEL_7;
  }
  if (owner < v8) {
    goto LABEL_5;
  }
  unint64_t context = self->_context;
  unint64_t v11 = v4[3];
  if (context > v11)
  {
LABEL_7:
    int64_t v9 = 1LL;
    goto LABEL_8;
  }

  if (context >= v11) {
    int64_t v9 = 0LL;
  }
  else {
    int64_t v9 = -1LL;
  }
LABEL_8:

  return v9;
}

- (uint64_t)matchesKCDataWaitInfo:(void *)a3 portName:(uint64_t)a4 flags:(uint64_t)a5 domain:
{
  unint64_t v9 = a3;
  if (a1
    && *(_WORD *)(a1 + 8) == *(unsigned __int8 *)(a2 + 24)
    && *(void *)(a1 + 24) == *(void *)(a2 + 16)
    && *(void *)(a1 + 16) == *(void *)a2
    && [(id)a1 portDomain] == a5
    && [(id)a1 portFlags] == a4)
  {
    uint64_t v10 = [(id)a1 portName];
    if (v9 | v10)
    {
      uint64_t v11 = [(id)a1 portName];
      id v12 = (void *)v11;
      uint64_t v13 = 0LL;
      if (v9 && v11)
      {
        [(id)a1 portName];
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v13 = [v14 isEqualToString:v9];
      }
    }

    else
    {
      uint64_t v13 = 1LL;
    }
  }

  else
  {
    uint64_t v13 = 0LL;
  }

  return v13;
}

- (unint64_t)hash
{
  return self->_context ^ self->_type ^ self->_owner;
}

- (NSString)debugDescription
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();

  id v4 = objc_alloc(NSString);
  objc_super v5 = v4;
  uint64_t type = self->_type;
  unint64_t context = self->_context;
  unint64_t owner = self->_owner;
  if (v3)
  {
    -[SABlockingInfo portName](self, "portName");
    unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = (void *)[v5 initWithFormat:@"[ wait_type:0x%x, context:0x%llx, owner:0x%llx, port name:%@, flags:0x%llx, domain:%llu]", type, context, owner, v9, -[SABlockingInfo portFlags](self, "portFlags"), -[SABlockingInfo portDomain](self, "portDomain")];
  }

  else
  {
    uint64_t v10 = (void *)objc_msgSend( v4,  "initWithFormat:",  @"[ wait_type:0x%x, context:0x%llx, owner:0x%llx ]",  type,  self->_context,  owner);
  }

  return (NSString *)v10;
}

- (unint64_t)blockingTid
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  int type_low = LOBYTE(self->_type);
  unint64_t result = 0LL;
  switch(type_low)
  {
    case 0:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 12:
    case 13:
    case 14:
    case 15:
    case 17:
    case 21:
    case 22:
    case 23:
    case 24:
    case 25:
    case 26:
    case 27:
    case 28:
    case 29:
      return result;
    case 1:
      unint64_t owner = self->_owner;
      BOOL v9 = owner == -6LL;
      goto LABEL_8;
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 18:
    case 19:
    case 20:
    case 30:
    case 31:
      unint64_t result = self->_owner;
      break;
    case 16:
      unint64_t owner = self->_owner;
      BOOL v9 = (owner & 0xFFFFFFFFFFFFFFFELL) == -8LL;
LABEL_8:
      if (v9) {
        unint64_t result = 0LL;
      }
      else {
        unint64_t result = owner;
      }
      break;
    default:
      int v5 = *__error();
      _sa_logt();
      unsigned int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        int type = self->_type;
        v11[0] = 67109120;
        v11[1] = type;
        _os_log_fault_impl(&dword_186C92000, v6, OS_LOG_TYPE_FAULT, "waitinfo has unknown type %u", (uint8_t *)v11, 8u);
      }

      v7 = __error();
      unint64_t result = 0LL;
      int *v7 = v5;
      break;
  }

  return result;
}

- (int)blockingPid
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  unsigned int type_low = LOBYTE(self->_type);
  if (type_low > 0x1F)
  {
    int v6 = *__error();
    _sa_logt();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      int type = self->_type;
      v11[0] = 67109120;
      v11[1] = type;
      _os_log_fault_impl(&dword_186C92000, v7, OS_LOG_TYPE_FAULT, "waitinfo has unknown type %u", (uint8_t *)v11, 8u);
    }

    *__error() = v6;
    return -1;
  }

  int v4 = 1 << type_low;
  if ((v4 & 0xFFFDFFAF) != 0) {
    return -1;
  }
  if ((v4 & 0x20040) != 0)
  {
    if (SLODWORD(self->_owner) < 0) {
      return -1;
    }
    else {
      return self->_owner;
    }
  }

  else
  {
    unint64_t owner = self->_owner;
    if (owner == -5LL || owner == -3LL) {
      return -1;
    }
    if (owner == -2LL)
    {
      return 0;
    }

    else if ((owner & 0x80000000) != 0LL)
    {
      return -1;
    }

    else
    {
      return self->_owner;
    }
  }

- (id)descriptionForPid:(int)a3 tid:(unint64_t)a4 options:(unint64_t)a5 nameCallback:(id)a6
{
  id v7 = 0LL;
  -[SAWaitInfo _displaysContentForPid:tid:options:displayString:nameCallback:]((uint64_t)self, a3, a4, a5, &v7, a6);
  return v7;
}

- (unsigned)type
{
  return self->_type;
}

- (unint64_t)owner
{
  return self->_owner;
}

- (unint64_t)context
{
  return self->_context;
}

+ (id)classDictionaryKey
{
  return @"SAWaitInfo";
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  return 44LL;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v8 = a5;
  if (-[SAWaitInfo sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion") != a4)
  {
    int v11 = *__error();
    _sa_logt();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = -[SAWaitInfo debugDescription](self, "debugDescription");
      *(_DWORD *)buf = 136315650;
      uint64_t v23 = [v13 UTF8String];
      __int16 v24 = 2048;
      unint64_t v25 = -[SAWaitInfo sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
      __int16 v26 = 2048;
      unint64_t v27 = a4;
      _os_log_error_impl(&dword_186C92000, v12, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);
    }

    *__error() = v11;
    id v14 = -[SAWaitInfo debugDescription](self, "debugDescription");
    char v15 = [v14 UTF8String];
    -[SAWaitInfo sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
    _SASetCrashLogMessage(5534, "%s: size %lu != buffer length %lu", v16, v17, v18, v19, v20, v21, v15);

    _os_crash();
    __break(1u);
  }

  *(_WORD *)&a3->var0 = 513;
  a3->var2 = self->_type;
  *(void *)(&a3->var2 + 1) = self->_owner;
  *(unint64_t *)((char *)&a3->var3 + 4) = self->_context;
  -[SABlockingInfo portName](self, "portName");
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(unint64_t *)((char *)&a3->var4 + 4) = SASerializableIndexForPointerFromSerializationDictionary(v9, v8);

  *(unint64_t *)((char *)&a3->var5 + 4) = -[SABlockingInfo portFlags](self, "portFlags");
  *(unint64_t *)((char *)&a3->var6 + 4) = -[SABlockingInfo portDomain](self, "portDomain");

  return 1;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v7 = a3;
  [(id)objc_opt_class() classDictionaryKey];
  int v4 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v5 = SASerializableAddInstanceToSerializationDictionaryWithClassKey(v7, self, v4);

  if (v5)
  {
    -[SABlockingInfo portName](self, "portName");
    int v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 addSelfToSerializationDictionary:v7];
  }
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  if (a4 <= 0x13)
  {
    int v8 = *__error();
    _sa_logt();
    BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v26 = a4;
      __int16 v27 = 2048;
      uint64_t v28 = 20LL;
      _os_log_error_impl( &dword_186C92000,  v9,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SAWaitInfo struct %lu",  buf,  0x16u);
    }

    *__error() = v8;
    _SASetCrashLogMessage(5565, "bufferLength %lu < serialized SAWaitInfo struct %lu", v10, v11, v12, v13, v14, v15, a4);
    _os_crash();
    __break(1u);
LABEL_14:
    int v16 = *__error();
    _sa_logt();
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v26 = a4;
      __int16 v27 = 2048;
      uint64_t v28 = 44LL;
      _os_log_error_impl( &dword_186C92000,  v17,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SAWaitInfo_v2 struct %lu",  buf,  0x16u);
    }

    *__error() = v16;
    _SASetCrashLogMessage( 5571,  "bufferLength %lu < serialized SAWaitInfo_v2 struct %lu",  v18,  v19,  v20,  v21,  v22,  v23,  a4);
    _os_crash();
    __break(1u);
LABEL_17:
    +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  @"Unknown SAWaitInfo version",  0LL);
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v24);
  }

  if (*((unsigned __int8 *)a3 + 1) < 2u)
  {
LABEL_9:
    int v6 = objc_alloc_init(&OBJC_CLASS___SAWaitInfo);
    goto LABEL_10;
  }

  if (a4 <= 0x2B) {
    goto LABEL_14;
  }
  int v6 = objc_alloc_init(&OBJC_CLASS___SAWaitInfoWithPortLabel);
  -[SAWaitInfoWithPortLabel setPortFlags:](v6, "setPortFlags:", *(void *)((char *)a3 + 28));
  -[SAWaitInfoWithPortLabel setPortDomain:](v6, "setPortDomain:", *(void *)((char *)a3 + 36));
LABEL_10:
  v6->super._int type = *((unsigned __int8 *)a3 + 2);
  v6->super._unint64_t owner = *(void *)((char *)a3 + 4);
  v6->super._unint64_t context = *(void *)((char *)a3 + 12);
  return v6;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  uint64_t v47 = *MEMORY[0x1895F89C0];
  id v42 = a5;
  id v10 = a6;
  if (a4 <= 0x13)
  {
    int v16 = *__error();
    _sa_logt();
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v44 = a4;
      __int16 v45 = 2048;
      uint64_t v46 = 20LL;
      _os_log_error_impl( &dword_186C92000,  v17,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SAWaitInfo struct %lu",  buf,  0x16u);
    }

    *__error() = v16;
    _SASetCrashLogMessage(5599, "bufferLength %lu < serialized SAWaitInfo struct %lu", v18, v19, v20, v21, v22, v23, a4);
    _os_crash();
    __break(1u);
    goto LABEL_14;
  }

  uint64_t v11 = v10;
  if (a4 <= 0x2B)
  {
LABEL_14:
    int v24 = *__error();
    _sa_logt();
    self = (SAWaitInfo *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)self, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      unint64_t v44 = a4;
      __int16 v45 = 2048;
      uint64_t v46 = 44LL;
      _os_log_error_impl( &dword_186C92000,  (os_log_t)self,  OS_LOG_TYPE_ERROR,  "bufferLength %lu < serialized SAWaitInfo_v2 struct %lu",  buf,  0x16u);
    }

    *__error() = v24;
    _SASetCrashLogMessage( 5603,  "bufferLength %lu < serialized SAWaitInfo_v2 struct %lu",  v25,  v26,  v27,  v28,  v29,  v30,  a4);
    _os_crash();
    __break(1u);
LABEL_17:
    int v31 = *__error();
    _sa_logt();
    uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      ClassName = object_getClassName(self);
      *(_DWORD *)buf = 136315138;
      unint64_t v44 = (unint64_t)ClassName;
      _os_log_error_impl( &dword_186C92000,  v32,  OS_LOG_TYPE_ERROR,  "wait info with port info, but class is %s",  buf,  0xCu);
    }

    *__error() = v31;
    char v34 = object_getClassName(self);
    _SASetCrashLogMessage(5609, "wait info with port info, but class is %s", v35, v36, v37, v38, v39, v40, v34);
    _os_crash();
    __break(1u);
LABEL_20:
    +[SAException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___SAException,  "exceptionWithName:reason:userInfo:",  @"Decoding failure",  @"Unknown SAWaitInfo version",  0LL);
    id v41 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v41);
  }

  if (*(void *)((char *)a3 + 20) != -1LL || *(void *)((char *)a3 + 28) || *(void *)((char *)a3 + 36))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      unint64_t v12 = *(void *)((char *)a3 + 20);
      uint64_t v13 = self;
      uint64_t v14 = (void *)objc_opt_class();
      _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass( v12,  v42,  v11,  v14,  0);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SAWaitInfo setPortName:](v13, "setPortName:", v15);

      goto LABEL_10;
    }

    goto LABEL_17;
  }

+ (SAWaitInfo)stateWithPAStyleSerializedWaitInfo:(uint64_t)a1
{
  objc_super v3 = objc_alloc_init(&OBJC_CLASS___SAWaitInfo);
  v3->_int type = *(unsigned __int8 *)(a2 + 24);
  v3->_unint64_t owner = *(void *)(a2 + 8);
  v3->_unint64_t context = *(void *)(a2 + 16);
  return v3;
}

@end