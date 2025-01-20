@interface RBSDextProcessIdentity
- (BOOL)_matchesIdentity:(id)a3;
- (BOOL)isAnonymous;
- (BOOL)isDext;
- (RBSDextProcessIdentity)initWithDecodeFromJob:(id)a3 uuid:(id)a4;
- (RBSDextProcessIdentity)initWithRBSXPCCoder:(id)a3;
- (id)_initDextWithServerName:(id)a3 label:(id)a4 containingAppBundleID:(id)a5;
- (id)_initDextWithServerName:(id)a3 tagString:(id)a4 containingAppBundleID:(id)a5;
- (id)debugDescription;
- (id)dextContainingAppBundleID;
- (id)dextLabel;
- (id)dextServerName;
- (id)encodeForJob;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSDextProcessIdentity

- (id)_initDextWithServerName:(id)a3 label:(id)a4 containingAppBundleID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___RBSDextProcessIdentity;
  id v11 = -[RBSProcessIdentity _init](&v23, sel__init);
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    v13 = (void *)*((void *)v11 + 7);
    *((void *)v11 + 7) = v12;

    uint64_t v14 = [v9 copy];
    v15 = (void *)*((void *)v11 + 8);
    *((void *)v11 + 8) = v14;

    uint64_t v16 = [v10 copy];
    v17 = (void *)*((void *)v11 + 9);
    *((void *)v11 + 9) = v16;

    uint64_t v18 = [NSString stringWithFormat:@"dext<%@>", *((void *)v11 + 8)];
    v19 = (void *)*((void *)v11 + 2);
    *((void *)v11 + 2) = v18;

    uint64_t v20 = [*((id *)v11 + 2) hash];
    *((void *)v11 + 3) = [*((id *)v11 + 9) hash] ^ v20;
    id v21 = v11;
  }

  return v11;
}

- (id)_initDextWithServerName:(id)a3 tagString:(id)a4 containingAppBundleID:(id)a5
{
  id v8 = (void *)NSString;
  id v9 = a5;
  id v10 = a3;
  [v8 stringWithFormat:@"%@-%@", v10, a4];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  id v12 = -[RBSDextProcessIdentity _initDextWithServerName:label:containingAppBundleID:]( self,  "_initDextWithServerName:label:containingAppBundleID:",  v10,  v11,  v9);

  return v12;
}

- (BOOL)isAnonymous
{
  return 0;
}

- (id)dextServerName
{
  return self->_serverName;
}

- (id)dextLabel
{
  return self->_label;
}

- (id)dextContainingAppBundleID
{
  return self->_bundleID;
}

- (BOOL)isDext
{
  return 1;
}

- (BOOL)_matchesIdentity:(id)a3
{
  v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class()) {
    goto LABEL_2;
  }
  label = self->_label;
  id v9 = (NSString *)v4[8];
  if (label != v9)
  {
    BOOL v10 = !label || v9 == 0LL;
  }

  bundleID = self->_bundleID;
  id v12 = (NSString *)v4[9];
  if (bundleID == v12)
  {
    char v6 = 1;
    goto LABEL_3;
  }

  if (bundleID && v12 != 0LL) {
    char v6 = -[NSString isEqual:](bundleID, "isEqual:");
  }
  else {
LABEL_2:
  }
    char v6 = 0;
LABEL_3:

  return v6;
}

- (id)debugDescription
{
  return self->super._description;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  serverName = self->_serverName;
  id v5 = a3;
  [v5 encodeObject:serverName forKey:@"_serverName"];
  [v5 encodeObject:self->_label forKey:@"_label"];
  [v5 encodeObject:self->_bundleID forKey:@"_bundleID"];
}

- (RBSDextProcessIdentity)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_serverName"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_label"];
  char v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_bundleID"];
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  id v8 = -[RBSDextProcessIdentity _initDextWithServerName:label:containingAppBundleID:]( self,  "_initDextWithServerName:label:containingAppBundleID:",  v5,  v6,  v7);
  return v8;
}

- (id)encodeForJob
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_int64(empty, "TYPE", 5LL);
  id v4 = -[NSString UTF8String](self->_serverName, "UTF8String");
  if (v4) {
    xpc_dictionary_set_string(empty, "DSER", v4);
  }
  id v5 = -[NSString UTF8String](self->_label, "UTF8String");
  if (v5) {
    xpc_dictionary_set_string(empty, "DLAB", v5);
  }
  char v6 = -[NSString UTF8String](self->_bundleID, "UTF8String");
  if (v6) {
    xpc_dictionary_set_string(empty, "EAI", v6);
  }
  return empty;
}

- (RBSDextProcessIdentity)initWithDecodeFromJob:(id)a3 uuid:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    rbs_general_log();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[RBSDextProcessIdentity initWithDecodeFromJob:uuid:].cold.1((uint64_t)v7, v8);
    }
  }

  string = xpc_dictionary_get_string(v6, "DSER");
  if (string)
  {
    [NSString stringWithUTF8String:string];
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    BOOL v10 = 0LL;
  }

  id v11 = xpc_dictionary_get_string(v6, "DLAB");
  if (v11)
  {
    [NSString stringWithUTF8String:v11];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v12 = 0LL;
  }

  v13 = xpc_dictionary_get_string(v6, "EAI");
  if (v13)
  {
    [NSString stringWithUTF8String:v13];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v14 = 0LL;
  }

  v15 = -[RBSDextProcessIdentity _initDextWithServerName:label:containingAppBundleID:]( self,  "_initDextWithServerName:label:containingAppBundleID:",  v10,  v12,  v14);

  return v15;
}

- (void).cxx_destruct
{
}

- (void)initWithDecodeFromJob:(uint64_t)a1 uuid:(os_log_s *)a2 .cold.1(uint64_t a1, os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl( &dword_185F67000,  a2,  OS_LOG_TYPE_FAULT,  "There is no reason an dext identity should have a UUID: %@",  (uint8_t *)&v2,  0xCu);
}

@end