@interface RBSOSServiceProcessIdentity
- (BOOL)_matchesIdentity:(id)a3;
- (BOOL)hasConsistentLaunchdJob;
- (BOOL)isAngel;
- (BOOL)isAnonymous;
- (BOOL)isDaemon;
- (BOOL)supportsLaunchingDirectly;
- (BOOL)treatedAsAnAppByFrontBoard:(id *)a3;
- (RBSOSServiceProcessIdentity)initWithDecodeFromJob:(id)a3 uuid:(id)a4;
- (RBSOSServiceProcessIdentity)initWithRBSXPCCoder:(id)a3;
- (id)_initAngelWithJobLabel:(id)a3;
- (id)_initDaemonWithJobLabel:(id)a3 pid:(int)a4 auid:(unsigned int)a5;
- (id)_initServiceWithJobLabel:(id)a3 pid:(int)a4 auid:(unsigned int)a5 type:(unsigned __int8)a6;
- (id)_initUnknownOSServiceWithJobLabel:(id)a3;
- (id)angelJobLabel;
- (id)consistentLaunchdJobLabel;
- (id)daemonJobLabel;
- (id)debugDescription;
- (id)encodeForJob;
- (unsigned)osServiceType;
- (void)encodeForJob;
- (void)encodeWithRBSXPCCoder:(id)a3;
- (void)setOsServiceType:(unsigned __int8)a3;
@end

@implementation RBSOSServiceProcessIdentity

- (id)_initServiceWithJobLabel:(id)a3 pid:(int)a4 auid:(unsigned int)a5 type:(unsigned __int8)a6
{
  uint64_t v7 = *(void *)&a5;
  id v11 = a3;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___RBSOSServiceProcessIdentity;
  v12 = -[RBSProcessIdentity _init](&v22, sel__init);
  v13 = v12;
  if (v12)
  {
    *((_DWORD *)v12 + 2) = a4;
    objc_storeStrong(v12 + 7, a3);
    v14 = v13 + 7;
    if ((_DWORD)v7) {
      [NSString stringWithFormat:@"osservice<%@(%d)>", *v14, v7];
    }
    else {
    uint64_t v15 = [NSString stringWithFormat:@"osservice<%@>", *v14];
    }
    id v16 = v13[2];
    v13[2] = (id)v15;

    uint64_t v17 = *((unsigned int *)v13 + 2);
    if ((_DWORD)v17)
    {
      uint64_t v18 = [NSString stringWithFormat:@"%@:%d", v13[2], v17];
      id v19 = v13[2];
      v13[2] = (id)v18;
    }

    v13[3] = (id)[v13[2] hash];
    *((_BYTE *)v13 + 64) = a6;
    v20 = v13;
  }

  return v13;
}

- (id)_initAngelWithJobLabel:(id)a3
{
  return -[RBSOSServiceProcessIdentity _initServiceWithJobLabel:pid:auid:type:]( self,  "_initServiceWithJobLabel:pid:auid:type:",  a3,  0LL,  0LL,  3LL);
}

- (id)_initDaemonWithJobLabel:(id)a3 pid:(int)a4 auid:(unsigned int)a5
{
  return -[RBSOSServiceProcessIdentity _initServiceWithJobLabel:pid:auid:type:]( self,  "_initServiceWithJobLabel:pid:auid:type:",  a3,  *(void *)&a4,  *(void *)&a5,  2LL);
}

- (id)_initUnknownOSServiceWithJobLabel:(id)a3
{
  return -[RBSOSServiceProcessIdentity _initServiceWithJobLabel:pid:auid:type:]( self,  "_initServiceWithJobLabel:pid:auid:type:",  a3,  0LL,  0LL,  1LL);
}

- (BOOL)_matchesIdentity:(id)a3
{
  v4 = a3;
  uint64_t v5 = objc_opt_class();
  BOOL v6 = v5 == objc_opt_class()
    && ((jobLabel = self->_jobLabel, v8 = (NSString *)v4[7], jobLabel == v8)

  return v6;
}

- (id)debugDescription
{
  v3 = self->_jobLabel;
  uint64_t v4 = -[RBSProcessIdentity auid](self, "auid");
  uint64_t v5 = v4;
  BOOL v6 = (void *)NSString;
  uint64_t pid = self->super._pid;
  else {
    v8 = @" pid=";
  }
  if ((int)pid < 1)
  {
    BOOL v9 = &stru_189DE1D08;
    if ((_DWORD)v4) {
      goto LABEL_6;
    }
  }

  else
  {
    [MEMORY[0x189607968] numberWithInt:pid];
    BOOL v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)v5)
    {
LABEL_6:
      [MEMORY[0x189607968] numberWithUnsignedInt:v5];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 stringWithFormat:@"<type=%@ identifier=%@%@%@%@%@>", @"daemon", v3, v8, v9, @" AUID=", v10];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    }
  }

  [v6 stringWithFormat:@"<type=%@ identifier=%@%@%@%@%@>", @"daemon", v3, v8, v9, &stru_189DE1D08, &stru_189DE1D08];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v11;
}

- (id)encodeForJob
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  p_type = &self->_type;
  if (self->_type <= 1u) {
    -[RBSOSServiceProcessIdentity encodeForJob].cold.1(&v8, v9);
  }
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_int64(empty, "TYPE", 6LL);
  jobLabel = self->_jobLabel;
  if (jobLabel)
  {
    BOOL v6 = -[NSString UTF8String](jobLabel, "UTF8String");
    if (v6) {
      xpc_dictionary_set_string(empty, "l", v6);
    }
  }

  xpc_dictionary_set_int64(empty, "p", self->super._pid);
  xpc_dictionary_set_int64(empty, "t", *p_type);
  return empty;
}

- (RBSOSServiceProcessIdentity)initWithDecodeFromJob:(id)a3 uuid:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    rbs_general_log();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[RBSOSServiceProcessIdentity initWithDecodeFromJob:uuid:].cold.1((uint64_t)v7, v8);
    }
  }

  int64_t int64 = xpc_dictionary_get_int64(v6, "p");
  string = xpc_dictionary_get_string(v6, "l");
  if (string)
  {
    [NSString stringWithUTF8String:string];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v11 = 0LL;
  }

  v12 = -[RBSOSServiceProcessIdentity _initServiceWithJobLabel:pid:auid:type:]( self,  "_initServiceWithJobLabel:pid:auid:type:",  v11,  int64,  0LL,  xpc_dictionary_get_int64(v6, "t"));

  return v12;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  jobLabel = self->_jobLabel;
  id v5 = a3;
  [v5 encodeObject:jobLabel forKey:@"_jobLabel"];
  [v5 encodeInt64:self->super._pid forKey:@"_pid"];
  [v5 encodeInt64:self->_type forKey:@"_type"];
}

- (RBSOSServiceProcessIdentity)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeInt64ForKey:@"_pid"];
  [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_jobLabel"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned __int8 v7 = [v4 decodeInt64ForKey:@"_type"];

  uint64_t v8 = (RBSOSServiceProcessIdentity *) -[RBSOSServiceProcessIdentity _initServiceWithJobLabel:pid:auid:type:]( self,  "_initServiceWithJobLabel:pid:auid:type:",  v6,  v5,  0LL,  v7);
  return v8;
}

- (id)daemonJobLabel
{
  return (id)-[NSString copy](self->_jobLabel, "copy");
}

- (id)angelJobLabel
{
  return (id)-[NSString copy](self->_jobLabel, "copy");
}

- (id)consistentLaunchdJobLabel
{
  return (id)-[NSString copy](self->_jobLabel, "copy");
}

- (BOOL)isAngel
{
  return 1;
}

- (BOOL)isDaemon
{
  return 1;
}

- (BOOL)isAnonymous
{
  return 0;
}

- (BOOL)supportsLaunchingDirectly
{
  return 1;
}

- (BOOL)hasConsistentLaunchdJob
{
  return 1;
}

- (unsigned)osServiceType
{
  return self->_type;
}

- (void)setOsServiceType:(unsigned __int8)a3
{
  if (self->_type == 1) {
    self->_type = a3;
  }
}

- (BOOL)treatedAsAnAppByFrontBoard:(id *)a3
{
  int type = self->_type;
  if (type == 2) {
    return 0;
  }
  if (type == 3) {
    return 1;
  }
  +[RBSConnection sharedInstance](&OBJC_CLASS___RBSConnection, "sharedInstance");
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = [v7 isIdentityAnAngel:self withError:a3];

  return (char)a3;
}

- (void).cxx_destruct
{
}

- (void)encodeForJob
{
  *a1 = 0LL;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

- (void)initWithDecodeFromJob:(uint64_t)a1 uuid:(os_log_s *)a2 .cold.1(uint64_t a1, os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl( &dword_185F67000,  a2,  OS_LOG_TYPE_FAULT,  "There is no reason a daemon should have a UUID: %@",  (uint8_t *)&v2,  0xCu);
}

@end