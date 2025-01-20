@interface RBSOpaqueProcessIdentity
+ (BOOL)supportsRBSXPCSecureCoding;
- (RBSOpaqueProcessIdentity)initWithDecodeFromJob:(id)a3 uuid:(id)a4;
- (RBSOpaqueProcessIdentity)initWithRBSXPCCoder:(id)a3;
- (id)_initOpaqueWithPid:(int)a3 auid:(unsigned int)a4 description:(id)a5;
- (id)_initOpaqueWithPid:(int)a3 name:(id)a4 auid:(unsigned int)a5;
- (id)encodeForJob;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSOpaqueProcessIdentity

- (id)_initOpaqueWithPid:(int)a3 auid:(unsigned int)a4 description:(id)a5
{
  id v7 = a5;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___RBSOpaqueProcessIdentity;
  v8 = -[RBSProcessIdentity _init](&v14, sel__init);
  v9 = v8;
  if (v8)
  {
    v8[2] = a3;
    uint64_t v10 = [v7 copy];
    v11 = (void *)*((void *)v9 + 2);
    *((void *)v9 + 2) = v10;

    *((void *)v9 + 3) = (int)v9[2];
    v12 = v9;
  }

  return v9;
}

- (id)_initOpaqueWithPid:(int)a3 name:(id)a4 auid:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a3;
  [NSString stringWithFormat:@"anon<%@>", a4];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = -[RBSOpaqueProcessIdentity _initOpaqueWithPid:auid:description:]( self,  "_initOpaqueWithPid:auid:description:",  v6,  v5,  v8);

  return v9;
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  uint64_t pid = self->super._pid;
  id v5 = a3;
  [v5 encodeInt64:pid forKey:@"_pid"];
  [v5 encodeObject:self->super._description forKey:@"_description"];
}

- (RBSOpaqueProcessIdentity)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeInt64ForKey:@"_pid"];
  [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_description"];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  id v7 = -[RBSOpaqueProcessIdentity _initOpaqueWithPid:auid:description:]( self,  "_initOpaqueWithPid:auid:description:",  v5,  0LL,  v6);
  return v7;
}

- (id)encodeForJob
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_int64(empty, "TYPE", 7LL);
  xpc_dictionary_set_int64(empty, "p", self->super._pid);
  id v4 = -[NSString UTF8String](self->super._description, "UTF8String");
  if (v4) {
    xpc_dictionary_set_string(empty, "d", v4);
  }
  return empty;
}

- (RBSOpaqueProcessIdentity)initWithDecodeFromJob:(id)a3 uuid:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    rbs_general_log();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[RBSOpaqueProcessIdentity initWithDecodeFromJob:uuid:].cold.1((uint64_t)v7, v8);
    }
  }

  int64_t int64 = xpc_dictionary_get_int64(v6, "p");
  string = xpc_dictionary_get_string(v6, "d");
  if (string)
  {
    [NSString stringWithUTF8String:string];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v11 = 0LL;
  }

  v12 = -[RBSOpaqueProcessIdentity _initOpaqueWithPid:auid:description:]( self,  "_initOpaqueWithPid:auid:description:",  int64,  0LL,  v11);

  return v12;
}

- (void)initWithDecodeFromJob:(uint64_t)a1 uuid:(os_log_s *)a2 .cold.1(uint64_t a1, os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl( &dword_185F67000,  a2,  OS_LOG_TYPE_FAULT,  "There is no reason an opaque identity should have a UUID %@:",  (uint8_t *)&v2,  0xCu);
}

@end