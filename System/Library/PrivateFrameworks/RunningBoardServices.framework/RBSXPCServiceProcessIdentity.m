@interface RBSXPCServiceProcessIdentity
+ (BOOL)shouldManageExtensionWithExtensionPoint:(id)a3;
- (BOOL)_matchesIdentity:(id)a3;
- (BOOL)inheritsCoalitionBand;
- (BOOL)isAnonymous;
- (BOOL)isEqualToIdentity:(id)a3;
- (BOOL)isExtension;
- (BOOL)isExternal;
- (BOOL)isMultiInstanceExtension;
- (BOOL)isXPCService;
- (BOOL)supportsLaunchingDirectly;
- (RBSXPCServiceProcessIdentity)initWithDecodeFromJob:(id)a3 uuid:(id)a4;
- (RBSXPCServiceProcessIdentity)initWithRBSXPCCoder:(id)a3;
- (id)_initWithXPCServiceID:(id)a3 pid:(int)a4 auid:(unsigned int)a5;
- (id)encodeForJob;
- (id)hostIdentifier;
- (id)hostIdentity;
- (id)personaString;
- (id)uuid;
- (id)validationToken;
- (id)xpcServiceIdentifier;
- (unsigned)defaultManageFlags;
- (void)encodeForJob;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSXPCServiceProcessIdentity

- (id)_initWithXPCServiceID:(id)a3 pid:(int)a4 auid:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v9 = a3;
  v44.receiver = self;
  v44.super_class = (Class)&OBJC_CLASS___RBSXPCServiceProcessIdentity;
  v10 = -[RBSProcessIdentity _init](&v44, sel__init);
  v11 = v10;
  if (v10)
  {
    id v43 = v9;
    v12 = v10 + 7;
    objc_storeStrong(v10 + 7, a3);
    if (a4 >= 1) {
      *((_DWORD *)v11 + 2) = a4;
    }
    [*v12 definition];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v13 variant];

    if (v14 == 3) {
      v15 = @"extextension";
    }
    else {
      v15 = @"xpcservice";
    }
    v16 = (void *)NSString;
    [*v12 definition];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 identifier];
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = [*v12 host];
    v20 = (void *)v19;
    if (v19) {
      v21 = (const __CFString *)v19;
    }
    else {
      v21 = @"no host";
    }
    [*v12 validationToken];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v23 = [v22 hash];
    if ((_DWORD)v5) {
      [v16 stringWithFormat:@"%@<%@(%@)(%d)>{vt hash: %lu}", v15, v18, v21, v5, v23];
    }
    else {
    uint64_t v24 = [v16 stringWithFormat:@"%@<%@(%@)>{vt hash: %lu}", v15, v18, v21, v23];
    }
    id v25 = v11[2];
    v11[2] = (id)v24;

    [v11 uuid];
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      v27 = (void *)NSString;
      id v28 = v11[2];
      [v11 uuid];
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v30 = [v27 stringWithFormat:@"%@[uuid:%@]", v28, v29];
      id v31 = v11[2];
      v11[2] = (id)v30;
    }

    [v11 personaString];
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      v33 = (void *)NSString;
      id v34 = v11[2];
      [v11 personaString];
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v36 = [v33 stringWithFormat:@"%@{persona:%@}", v34, v35];
      id v37 = v11[2];
      v11[2] = (id)v36;
    }

    uint64_t v38 = *((unsigned int *)v11 + 2);
    if ((_DWORD)v38)
    {
      uint64_t v39 = [NSString stringWithFormat:@"%@:%d", v11[2], v38];
      id v40 = v11[2];
      v11[2] = (id)v39;
    }

    v11[3] = (id)[*v12 hash];
    v41 = v11;
    id v9 = v43;
  }

  return v11;
}

- (BOOL)isExtension
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = [v2 variant] > 1;

  return v3;
}

- (BOOL)isMultiInstanceExtension
{
  if (!-[RBSXPCServiceProcessIdentity isExtension](self, "isExtension")) {
    return 0;
  }
  -[RBSXPCServiceIdentity uuid](self->_serviceIdentity, "uuid");
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v4 = v3 != 0LL;

  return v4;
}

+ (BOOL)shouldManageExtensionWithExtensionPoint:(id)a3
{
  return 1;
}

- (unsigned)defaultManageFlags
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (defaultManageFlags_onceToken != -1) {
    dispatch_once(&defaultManageFlags_onceToken, &__block_literal_global_1);
  }
  BOOL v3 = (void *)defaultManageFlags___xpcserviceUnmanagedSet;
  -[RBSXPCServiceIdentity definition](self->_serviceIdentity, "definition");
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 identifier];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = [v3 containsObject:v5];

  if ((_DWORD)v3)
  {
    rbs_process_log();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      serviceIdentity = self->_serviceIdentity;
      int v12 = 138412290;
      v13 = serviceIdentity;
      _os_log_impl(&dword_185F67000, v6, OS_LOG_TYPE_INFO, "Not managing %@", (uint8_t *)&v12, 0xCu);
    }

    return 0;
  }

  else
  {
    -[RBSXPCServiceIdentity host](self->_serviceIdentity, "host");
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 identity];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    unsigned __int8 v11 = [v10 defaultManageFlags];

    return v11;
  }

void __50__RBSXPCServiceProcessIdentity_defaultManageFlags__block_invoke()
{
  uint64_t v0 = objc_msgSend( objc_alloc(MEMORY[0x189604010]),  "initWithObjects:",  @"com.apple.FileProvider.ArchiveService",  @"com.apple.SMBClientProvider.FileProvider",  @"com.apple.SafariServices.ContentBlockerLoader",  @"com.apple.CallKit.CallDirectory",  @"com.apple.AppleMediaServicesUI.SpyglassPurchases",  0);
  v1 = (void *)defaultManageFlags___xpcserviceUnmanagedSet;
  defaultManageFlags___xpcserviceUnmanagedSet = v0;
}

- (BOOL)isXPCService
{
  return 1;
}

- (BOOL)isExternal
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = [v2 variant] == 3;

  return v3;
}

- (BOOL)isAnonymous
{
  return 0;
}

- (id)xpcServiceIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 identifier];
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)hostIdentity
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 identity];
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)hostIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 identifier];
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)uuid
{
  return -[RBSXPCServiceIdentity uuid](self->_serviceIdentity, "uuid");
}

- (id)personaString
{
  return -[RBSXPCServiceIdentity personaString](self->_serviceIdentity, "personaString");
}

- (id)validationToken
{
  return -[RBSXPCServiceIdentity validationToken](self->_serviceIdentity, "validationToken");
}

- (BOOL)supportsLaunchingDirectly
{
  if (!-[RBSXPCServiceProcessIdentity isExtension](self, "isExtension")) {
    return 0;
  }
  -[RBSXPCServiceProcessIdentity hostIdentity](self, "hostIdentity");
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[RBSProcessHandle currentProcess](&OBJC_CLASS___RBSProcessHandle, "currentProcess");
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 identity];
  v6 = (void *)v5;
  if (v3 == (void *)v5)
  {
    char v7 = 1;
  }

  else
  {
    char v7 = 0;
    if (v3 && v5) {
      char v7 = [v3 isEqual:v5];
    }
  }

  return v7;
}

- (BOOL)inheritsCoalitionBand
{
  serviceIdentity = self->_serviceIdentity;
  if (!serviceIdentity) {
    return 0;
  }
  -[RBSXPCServiceIdentity definition](serviceIdentity, "definition");
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v4 = [v3 variant] == 1 && objc_msgSend(v3, "scope") == 1;

  return v4;
}

- (id)encodeForJob
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_int64(empty, "TYPE", 4LL);
  int64_t pid = self->super._pid;
  if ((_DWORD)pid) {
    xpc_dictionary_set_int64(empty, "p", pid);
  }
  -[RBSXPCServiceProcessIdentity hostIdentifier](self, "hostIdentifier");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  int v6 = [v5 pid];

  if (v6) {
    xpc_dictionary_set_int64(empty, "h", v6);
  }
  -[RBSXPCServiceProcessIdentity hostIdentity](self, "hostIdentity");
  char v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 uuid];
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    [v8 getUUIDBytes:uuid];
    xpc_dictionary_set_uuid(empty, "hu", uuid);
  }

  -[RBSXPCServiceIdentity host](self->_serviceIdentity, "host");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 identity];
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    [v10 encodeForJob];
    unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      xpc_dictionary_set_value(empty, "H", v11);
    }

    else
    {
      rbs_process_log();
      int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        -[RBSXPCServiceProcessIdentity encodeForJob].cold.1((uint64_t)v10, (uint64_t)self, v12);
      }
    }
  }

  id v13 = -[RBSXPCServiceProcessIdentity xpcServiceIdentifier](self, "xpcServiceIdentifier");
  uint64_t v14 = (const char *)[v13 UTF8String];

  if (v14) {
    xpc_dictionary_set_string(empty, "i", v14);
  }
  id v15 = -[RBSXPCServiceProcessIdentity personaString](self, "personaString");
  v16 = (const char *)[v15 UTF8String];

  if (v16) {
    xpc_dictionary_set_string(empty, "o", v16);
  }
  v17 = -[RBSXPCServiceProcessIdentity validationToken](self, "validationToken");
  v18 = v17;
  if (v17)
  {
    id v19 = v17;
    xpc_dictionary_set_data(empty, "v", (const void *)[v19 bytes], objc_msgSend(v19, "length"));
  }
  v20 = -[RBSXPCServiceIdentity definition](self->_serviceIdentity, "definition");
  int64_t v21 = [v20 variant];

  xpc_dictionary_set_int64(empty, "r", v21);
  return empty;
}

- (RBSXPCServiceProcessIdentity)initWithDecodeFromJob:(id)a3 uuid:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  string = xpc_dictionary_get_string(v6, "i");
  if (string)
  {
    [NSString stringWithUTF8String:string];
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    int64_t int64 = xpc_dictionary_get_int64(v6, "p");
    int64_t v9 = xpc_dictionary_get_int64(v6, "h");
    uuid = xpc_dictionary_get_uuid(v6, "hu");
    if (uuid) {
      unsigned __int8 v11 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:uuid];
    }
    else {
      unsigned __int8 v11 = 0LL;
    }
    xpc_dictionary_get_value(v6, "H");
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      +[RBSProcessIdentity decodeFromJob:uuid:](&OBJC_CLASS___RBSProcessIdentity, "decodeFromJob:uuid:", v13, v11);
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v14 = 0LL;
    }

    int64_t v26 = xpc_dictionary_get_int64(v6, "e");
    int64_t v25 = xpc_dictionary_get_int64(v6, "r");
    id v15 = xpc_dictionary_get_string(v6, "o");
    if (v15)
    {
      [NSString stringWithUTF8String:v15];
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v27 = 0LL;
    }

    size_t length = 0LL;
    data = (void *)xpc_dictionary_get_data(v6, "v", &length);
    id v17 = v7;
    if (data)
    {
      id v18 = objc_alloc(MEMORY[0x189603F48]);
      data = (void *)[v18 initWithBytes:data length:length];
    }

    id v19 = 0LL;
    if ((_DWORD)v9) {
      uint64_t v20 = 1LL;
    }
    else {
      uint64_t v20 = 3LL;
    }
    if ((_DWORD)v9 && v14)
    {
      +[RBSProcessIdentifier identifierWithPid:](&OBJC_CLASS___RBSProcessIdentifier, "identifierWithPid:", v9);
      int64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[RBSProcessInstance instanceWithIdentifier:identity:]( &OBJC_CLASS___RBSProcessInstance,  "instanceWithIdentifier:identity:",  v21,  v14);
      id v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v22 = +[RBSXPCServiceDefinition definitionWithIdentifier:variant:scope:]( &OBJC_CLASS___RBSXPCServiceDefinition,  "definitionWithIdentifier:variant:scope:",  v29,  v25,  v20);
    id v7 = v17;
    +[RBSXPCServiceIdentity identityWithDefinition:sessionID:host:UUID:persona:validationToken:]( &OBJC_CLASS___RBSXPCServiceIdentity,  "identityWithDefinition:sessionID:host:UUID:persona:validationToken:",  v22,  0LL,  v19,  v17,  v27,  data);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    self = (RBSXPCServiceProcessIdentity *) -[RBSXPCServiceProcessIdentity _initWithXPCServiceID:pid:auid:]( self,  "_initWithXPCServiceID:pid:auid:",  v23,  int64,  v26);

    int v12 = self;
  }

  else
  {
    int v12 = 0LL;
  }

  return v12;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_serviceIdentity forKey:@"_serviceIdentity"];
  if (self->super._pid >= 1) {
    objc_msgSend(v4, "encodeInt64:forKey:");
  }
}

- (RBSXPCServiceProcessIdentity)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_serviceIdentity"];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v4 decodeInt64ForKey:@"_pid"];

  id v7 = (RBSXPCServiceProcessIdentity *) -[RBSXPCServiceProcessIdentity _initWithXPCServiceID:pid:auid:]( self,  "_initWithXPCServiceID:pid:auid:",  v5,  v6,  0LL);
  return v7;
}

- (BOOL)isEqualToIdentity:(id)a3
{
  id v4 = (RBSXPCServiceProcessIdentity *)a3;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }

  else
  {
    unint64_t v5 = -[RBSProcessIdentity hash](self, "hash");
    BOOL v6 = v5 == -[RBSProcessIdentity hash](v4, "hash")
      && -[RBSXPCServiceProcessIdentity _matchesIdentity:](self, "_matchesIdentity:", v4);
  }

  return v6;
}

- (BOOL)_matchesIdentity:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class()) {
    goto LABEL_2;
  }
  serviceIdentity = self->_serviceIdentity;
  int64_t v9 = (RBSXPCServiceIdentity *)v4[7];
  if (serviceIdentity == v9)
  {
    char v6 = 1;
    goto LABEL_3;
  }

  if (!serviceIdentity || v9 == 0LL) {
LABEL_2:
  }
    char v6 = 0;
  else {
    char v6 = -[RBSXPCServiceIdentity isEqual:](serviceIdentity, "isEqual:");
  }
LABEL_3:

  return v6;
}

- (void).cxx_destruct
{
}

- (void)encodeForJob
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_fault_impl( &dword_185F67000,  log,  OS_LOG_TYPE_FAULT,  "error encoding host identity for job: %@ of %@",  (uint8_t *)&v3,  0x16u);
}

@end