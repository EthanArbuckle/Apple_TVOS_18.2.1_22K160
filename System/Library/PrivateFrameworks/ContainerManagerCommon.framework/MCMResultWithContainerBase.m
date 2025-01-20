@interface MCMResultWithContainerBase
- (BOOL)encodeResultOntoReply:(id)a3;
- (BOOL)existed;
- (BOOL)transient;
- (MCMPOSIXUser)posixUser;
- (MCMResultWithContainerBase)initWithContainerPath:(id)a3 containerIdentity:(id)a4 uuid:(id)a5 sandboxToken:(const char *)a6 includePath:(BOOL)a7;
- (MCMResultWithContainerBase)initWithMetadata:(id)a3 sandboxToken:(const char *)a4 includePath:(BOOL)a5 includeInfo:(BOOL)a6 includeUserManagedAssetsRelPath:(BOOL)a7 includeCreator:(BOOL)a8;
- (MCMResultWithContainerBase)initWithUUID:(id)a3 containerPathIdentifier:(id)a4 identifier:(id)a5 containerClass:(unint64_t)a6 POSIXUser:(id)a7 personaUniqueString:(id)a8 sandboxToken:(const char *)a9 existed:(BOOL)a10 url:(id)a11 info:(id)a12 transient:(BOOL)a13 userManagedAssetsRelPath:(id)a14 creator:(id)a15;
- (NSDictionary)info;
- (NSString)containerPathIdentifier;
- (NSString)creator;
- (NSString)identifier;
- (NSString)personaUniqueString;
- (NSString)userManagedAssetsRelPath;
- (NSURL)url;
- (NSUUID)uuid;
- (char)sandboxToken;
- (unint64_t)containerClass;
- (void)dealloc;
@end

@implementation MCMResultWithContainerBase

- (BOOL)encodeResultOntoReply:(id)a3
{
  v24[2] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___MCMResultWithContainerBase;
  BOOL v5 = -[MCMResultBase encodeResultOntoReply:](&v23, sel_encodeResultOntoReply_, v4);
  if (v5)
  {
    v6 = -[MCMResultBase error](self, "error");
    if (!v6)
    {
      xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
      v8 = -[MCMResultWithContainerBase url](self, "url");
      if (v8)
      {
        id v9 = -[MCMResultWithContainerBase url](self, "url");
        [v9 fileSystemRepresentation];
      }
      v10 = -[MCMResultWithContainerBase info](self, "info");
      if (v10)
      {
        v11 = -[MCMResultWithContainerBase info](self, "info");
        v10 = (void *)_CFXPCCreateXPCObjectFromCFObject();
      }
      v12 = -[MCMResultWithContainerBase userManagedAssetsRelPath](self, "userManagedAssetsRelPath");
      if (v12)
      {
        id v13 = -[MCMResultWithContainerBase userManagedAssetsRelPath](self, "userManagedAssetsRelPath");
        [v13 UTF8String];
      }
      v14 = -[MCMResultWithContainerBase creator](self, "creator");
      if (v14)
      {
        id v15 = -[MCMResultWithContainerBase creator](self, "creator");
        [v15 UTF8String];
      }

      -[MCMResultWithContainerBase existed](self, "existed");
      -[MCMResultWithContainerBase sandboxToken](self, "sandboxToken");
      -[MCMResultWithContainerBase transient](self, "transient");
      container_xpc_encode_container_metadata_as_object();
      v24[0] = 0LL;
      v24[1] = 0LL;
      v16 = -[MCMResultWithContainerBase uuid](self, "uuid");
      [v16 getUUIDBytes:v24];

      id v17 = -[MCMResultWithContainerBase identifier](self, "identifier");
      [v17 UTF8String];
      -[MCMResultWithContainerBase containerClass](self, "containerClass");
      v18 = -[MCMResultWithContainerBase posixUser](self, "posixUser");
      [v18 UID];
      -[MCMResultWithContainerBase containerPathIdentifier](self, "containerPathIdentifier");
      id v19 = v22 = v10;
      [v19 UTF8String];
      id v20 = -[MCMResultWithContainerBase personaUniqueString](self, "personaUniqueString");
      [v20 UTF8String];
      container_xpc_encode_container_as_object();
    }
  }

  return v5;
}

- (MCMResultWithContainerBase)initWithUUID:(id)a3 containerPathIdentifier:(id)a4 identifier:(id)a5 containerClass:(unint64_t)a6 POSIXUser:(id)a7 personaUniqueString:(id)a8 sandboxToken:(const char *)a9 existed:(BOOL)a10 url:(id)a11 info:(id)a12 transient:(BOOL)a13 userManagedAssetsRelPath:(id)a14 creator:(id)a15
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  id v20 = a3;
  id v30 = a4;
  id v21 = a4;
  id v36 = a5;
  id v35 = a7;
  id v32 = a8;
  id v34 = a8;
  id v33 = a11;
  id v22 = a12;
  id v23 = a14;
  id v24 = a15;
  v37.receiver = self;
  v37.super_class = (Class)&OBJC_CLASS___MCMResultWithContainerBase;
  v25 = -[MCMResultBase init](&v37, sel_init);
  v26 = v25;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_uuid, a3);
    v26->_existed = a10;
    objc_storeStrong((id *)&v26->_containerPathIdentifier, v30);
    objc_storeStrong((id *)&v26->_identifier, a5);
    v26->_containerClass = a6;
    objc_storeStrong((id *)&v26->_posixUser, a7);
    objc_storeStrong((id *)&v26->_personaUniqueString, v32);
    if (a9) {
      v27 = strndup(a9, 0x800uLL);
    }
    else {
      v27 = 0LL;
    }
    v26->_sandboxToken = v27;
    objc_storeStrong((id *)&v26->_url, a11);
    objc_storeStrong((id *)&v26->_info, a12);
    v26->_transient = a13;
    objc_storeStrong((id *)&v26->_userManagedAssetsRelPath, a14);
    objc_storeStrong((id *)&v26->_creator, a15);
  }

  return v26;
}

- (MCMResultWithContainerBase)initWithContainerPath:(id)a3 containerIdentity:(id)a4 uuid:(id)a5 sandboxToken:(const char *)a6 includePath:(BOOL)a7
{
  BOOL v7 = a7;
  id v10 = a3;
  id v23 = a5;
  id v11 = a4;
  [v10 containerClassPath];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 userIdentity];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 containerPathIdentifier];
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 identifier];
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v14 = [v12 containerClass];
  [v13 posixUser];
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 personaUniqueString];
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  char v17 = [v10 exists];
  if (v7)
  {
    [v10 containerDataURL];
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v18 = 0LL;
  }

  LOBYTE(v22) = [v10 transient];
  LOBYTE(v21) = v17;
  id v19 = -[MCMResultWithContainerBase initWithUUID:containerPathIdentifier:identifier:containerClass:POSIXUser:personaUniqueString:sandboxToken:existed:url:info:transient:userManagedAssetsRelPath:creator:]( self,  "initWithUUID:containerPathIdentifier:identifier:containerClass:POSIXUser:personaUniqueString:sandboxToken:exis ted:url:info:transient:userManagedAssetsRelPath:creator:",  v23,  v25,  v27,  v14,  v15,  v16,  a6,  v21,  v18,  0LL,  v22,  0LL,  0LL);

  if (v7) {
  return v19;
  }
}

- (MCMResultWithContainerBase)initWithMetadata:(id)a3 sandboxToken:(const char *)a4 includePath:(BOOL)a5 includeInfo:(BOOL)a6 includeUserManagedAssetsRelPath:(BOOL)a7 includeCreator:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  BOOL v10 = a6;
  BOOL v11 = a5;
  id v12 = a3;
  id v13 = v12;
  if (v9 && [v12 conformsToProtocol:&unk_18C735DA0])
  {
    [v13 userManagedAssetsDirName];
    id v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8) {
      goto LABEL_8;
    }
  }

  else
  {
    id v35 = 0LL;
    if (!v8) {
      goto LABEL_8;
    }
  }

  if ([v13 conformsToProtocol:&unk_18C735DA0])
  {
    [v13 creator];
    id v34 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  p_sandboxToken = &self->_sandboxToken;
  sandboxToken = self->_sandboxToken;
  if (sandboxToken)
  {
    free(sandboxToken);
    memset_s(p_sandboxToken, 8uLL, 0, 8uLL);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MCMResultWithContainerBase;
  -[MCMResultWithContainerBase dealloc](&v5, sel_dealloc);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSString)containerPathIdentifier
{
  return self->_containerPathIdentifier;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)containerClass
{
  return self->_containerClass;
}

- (MCMPOSIXUser)posixUser
{
  return self->_posixUser;
}

- (NSString)personaUniqueString
{
  return self->_personaUniqueString;
}

- (char)sandboxToken
{
  return self->_sandboxToken;
}

- (BOOL)existed
{
  return self->_existed;
}

- (NSURL)url
{
  return self->_url;
}

- (NSDictionary)info
{
  return self->_info;
}

- (BOOL)transient
{
  return self->_transient;
}

- (NSString)userManagedAssetsRelPath
{
  return self->_userManagedAssetsRelPath;
}

- (NSString)creator
{
  return self->_creator;
}

- (void).cxx_destruct
{
}

@end