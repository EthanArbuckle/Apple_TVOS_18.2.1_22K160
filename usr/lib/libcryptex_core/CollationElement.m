@interface CollationElement
+ (id)scopeToString:(int64_t)a3;
- (CollationElement)initWithBundle:(id)a3 version:(id)a4 atPath:(id)a5 withScope:(int64_t)a6 withCommand:(id)a7 withCommandArgs:(id)a8 withEnv:(id)a9;
- (CollationElement)initWithXPC:(id)a3;
- (NSArray)cle_command_args;
- (NSDictionary)cle_env;
- (NSString)cle_bundle_id;
- (NSString)cle_bundle_version;
- (NSString)cle_command;
- (NSString)cle_mnt_path;
- (id)copyAbsolutePath:(id)a3;
- (id)description;
- (id)package;
- (int64_t)cle_scope;
@end

@implementation CollationElement

+ (id)scopeToString:(int64_t)a3
{
  v3 = @"SCOPE_UNK";
  if (a3 == 2) {
    v3 = @"SCOPE_USER";
  }
  if (a3 == 1) {
    return @"SCOPE_SYSTEM";
  }
  else {
    return (id)v3;
  }
}

- (id)description
{
  v3 = (void *)NSString;
  cle_bundle_id = self->_cle_bundle_id;
  v5 = +[CollationElement scopeToString:]( &OBJC_CLASS___CollationElement,  "scopeToString:",  -[CollationElement cle_scope](self, "cle_scope"));
  [v3 stringWithFormat:@"[bundle: %@, scope: %@, mount: %@, cmd: %@, env: %@]", cle_bundle_id, v5, self->_cle_mnt_path, self->_cle_command, self->_cle_env];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)copyAbsolutePath:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (CollationElement)initWithBundle:(id)a3 version:(id)a4 atPath:(id)a5 withScope:(int64_t)a6 withCommand:(id)a7 withCommandArgs:(id)a8 withEnv:(id)a9
{
  id v24 = a3;
  id v23 = a4;
  id v22 = a5;
  id v21 = a7;
  id v16 = a8;
  id v17 = a9;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___CollationElement;
  v18 = -[CollationElement init](&v25, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_cle_scope = a6;
    objc_storeStrong((id *)&v18->_cle_mnt_path, a5);
    objc_storeStrong((id *)&v19->_cle_bundle_id, a3);
    objc_storeStrong((id *)&v19->_cle_bundle_version, a4);
    objc_storeStrong((id *)&v19->_cle_command, a7);
    objc_storeStrong((id *)&v19->_cle_env, a9);
    objc_storeStrong((id *)&v19->_cle_command_args, a8);
  }

  return v19;
}

- (CollationElement)initWithXPC:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___CollationElement;
  v5 = -[CollationElement init](&v22, sel_init);
  if (v5)
  {
    string = xpc_dictionary_get_string(v4, "cmd");
    v5->_cle_scope = xpc_dictionary_get_int64(v4, "scope");
    uint64_t v7 = objc_msgSend(NSString, "stringWithUTF8String:", xpc_dictionary_get_string(v4, "mntpath"));
    cle_mnt_path = v5->_cle_mnt_path;
    v5->_cle_mnt_path = (NSString *)v7;

    uint64_t v9 = objc_msgSend(NSString, "stringWithUTF8String:", xpc_dictionary_get_string(v4, "cryptex_bundleid"));
    cle_bundle_id = v5->_cle_bundle_id;
    v5->_cle_bundle_id = (NSString *)v9;

    uint64_t v11 = objc_msgSend(NSString, "stringWithUTF8String:", xpc_dictionary_get_string(v4, "version"));
    cle_bundle_version = v5->_cle_bundle_version;
    v5->_cle_bundle_version = (NSString *)v11;

    if (string)
    {
      uint64_t v13 = [NSString stringWithUTF8String:string];
      cle_command = v5->_cle_command;
      v5->_cle_command = (NSString *)v13;
    }

    xpc_dictionary_get_dictionary(v4, "env");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      uint64_t v16 = _CFXPCCreateCFObjectFromXPCObject();
      cle_env = v5->_cle_env;
      v5->_cle_env = (NSDictionary *)v16;
    }

    xpc_dictionary_get_array(v4, "cmd_arg");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      uint64_t v19 = _CFXPCCreateCFObjectFromXPCObject();
      cle_command_args = v5->_cle_command_args;
      v5->_cle_command_args = (NSArray *)v19;
    }
  }

  return v5;
}

- (id)package
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_int64(empty, "scope", -[CollationElement cle_scope](self, "cle_scope"));
  id v4 = +[CollationElement scopeToString:]( &OBJC_CLASS___CollationElement,  "scopeToString:",  -[CollationElement cle_scope](self, "cle_scope"));
  xpc_dictionary_set_string(empty, "scope_string", (const char *)[v4 UTF8String]);

  id v5 = -[CollationElement cle_bundle_id](self, "cle_bundle_id");
  xpc_dictionary_set_string(empty, "cryptex_bundleid", (const char *)[v5 UTF8String]);

  id v6 = -[CollationElement cle_mnt_path](self, "cle_mnt_path");
  xpc_dictionary_set_string(empty, "mntpath", (const char *)[v6 UTF8String]);

  id v7 = -[CollationElement cle_bundle_version](self, "cle_bundle_version");
  xpc_dictionary_set_string(empty, "version", (const char *)[v7 UTF8String]);
  v8 = -[CollationElement cle_command](self, "cle_command");
  if (v8)
  {
    id v9 = -[CollationElement cle_command](self, "cle_command");
    xpc_dictionary_set_string(empty, "command", (const char *)[v9 UTF8String]);
  }
  v10 = -[CollationElement cle_env](self, "cle_env");
  if (v10)
  {
    -[CollationElement cle_env](self, "cle_env");
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    xpc_dictionary_set_value(empty, "env", v12);
  }

  -[CollationElement cle_command_args](self, "cle_command_args");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = -[CollationElement cle_command_args](self, "cle_command_args");
    v15 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    xpc_dictionary_set_value(empty, "cmd_arg", v15);
  }

  return empty;
}

- (int64_t)cle_scope
{
  return self->_cle_scope;
}

- (NSString)cle_bundle_id
{
  return self->_cle_bundle_id;
}

- (NSString)cle_bundle_version
{
  return self->_cle_bundle_version;
}

- (NSString)cle_mnt_path
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (NSString)cle_command
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (NSDictionary)cle_env
{
  return (NSDictionary *)objc_getProperty(self, a2, 48LL, 1);
}

- (NSArray)cle_command_args
{
  return (NSArray *)objc_getProperty(self, a2, 56LL, 1);
}

- (void).cxx_destruct
{
}

@end