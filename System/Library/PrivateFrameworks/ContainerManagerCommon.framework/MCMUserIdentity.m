@interface MCMUserIdentity
+ (BOOL)isUserIdentityRequiredForContainerClass:(unint64_t)a3;
+ (MCMUserIdentity)userIdentityWithPlist:(id)a3 cache:(id)a4 error:(unint64_t *)a5;
+ (id)_identifierForPOSIXUID:(unsigned int)a3 personaUniqueString:(id)a4 personaType:(int)a5;
- (BOOL)homeDirectoryExists;
- (BOOL)isDataSeparated;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToUserIdentity:(id)a3;
- (BOOL)isNoSpecificPersona;
- (BOOL)isStrictlyEqualToUserIdentity:(id)a3;
- (MCMPOSIXUser)posixUser;
- (MCMUserIdentity)init;
- (MCMUserIdentity)initWithPOSIXUser:(id)a3 homeDirectoryURL:(id)a4 personaUniqueString:(id)a5 personaType:(int)a6 kernelPersonaID:(unsigned int)a7;
- (MCMUserIdentity)initWithPlist:(id)a3 cache:(id)a4 error:(unint64_t *)a5;
- (MCMUserIdentity)initWithVersion1PlistDictionary:(id)a3 cache:(id)a4 error:(unint64_t *)a5;
- (MCMUserIdentity)initWithVersion2PlistDictionary:(id)a3 cache:(id)a4 error:(unint64_t *)a5;
- (MCMUserIdentity)userIdentityWithPOSIXUser:(id)a3;
- (NSString)identifier;
- (NSString)personaUniqueString;
- (NSString)shortDescription;
- (NSURL)homeDirectoryURL;
- (id)_descriptionForPersonaType:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)plist;
- (int)personaType;
- (int64_t)extensionHandle;
- (unint64_t)hash;
- (unsigned)kernelPersonaID;
- (void)dealloc;
- (void)setExtensionHandle:(int64_t)a3;
@end

@implementation MCMUserIdentity

- (MCMUserIdentity)init
{
  id v3 = containermanager_copy_global_configuration();
  [v3 defaultUser];
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  [v4 homeDirectoryURL];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MCMUserIdentity initWithPOSIXUser:homeDirectoryURL:personaUniqueString:personaType:kernelPersonaID:]( self,  "initWithPOSIXUser:homeDirectoryURL:personaUniqueString:personaType:kernelPersonaID:",  v4,  v5,  0,  2,  [v4 UID]);

  return v6;
}

- (MCMUserIdentity)initWithPOSIXUser:(id)a3 homeDirectoryURL:(id)a4 personaUniqueString:(id)a5 personaType:(int)a6 kernelPersonaID:(unsigned int)a7
{
  uint64_t v8 = *(void *)&a6;
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  if (v13)
  {
    if (v14) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }

  container_log_handle_for_category();
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_188846000, v16, OS_LOG_TYPE_FAULT, "POSIX user cannot be nil", buf, 2u);
  }

  if (!v14)
  {
LABEL_7:
    container_log_handle_for_category();
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v13;
      _os_log_fault_impl(&dword_188846000, v17, OS_LOG_TYPE_FAULT, "Home directory cannot be nil, user '%@'", buf, 0xCu);
    }
  }

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  if ((self->_extensionHandle & 0x8000000000000000LL) == 0)
  {
    sandbox_extension_release();
    self->_extensionHandle = -1LL;
  }

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MCMUserIdentity;
  -[MCMUserIdentity dealloc](&v3, sel_dealloc);
}

- (MCMUserIdentity)initWithPlist:(id)a3 cache:(id)a4 error:(unint64_t *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      id v10 = v8;
      [v10 objectForKeyedSubscript:@"version"];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      int v12 = [v11 isEqual:@"2"];

      if (v12)
      {
        id v13 = -[MCMUserIdentity initWithVersion2PlistDictionary:cache:error:]( self,  "initWithVersion2PlistDictionary:cache:error:",  v10,  v9,  a5);
      }

      else
      {
        [v10 objectForKeyedSubscript:@"version"];
        id v14 = (void *)objc_claimAutoreleasedReturnValue();
        int v15 = [v14 isEqual:@"1"];

        if (!v15)
        {
LABEL_8:

          goto LABEL_9;
        }

        id v13 = -[MCMUserIdentity initWithVersion1PlistDictionary:cache:error:]( self,  "initWithVersion1PlistDictionary:cache:error:",  v10,  v9,  a5);
      }

      self = v13;
      goto LABEL_8;
    }
  }

- (MCMUserIdentity)initWithVersion1PlistDictionary:(id)a3 cache:(id)a4 error:(unint64_t *)a5
{
  v30[2] = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  [v8 objectForKeyedSubscript:@"posixUID"];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 objectForKeyedSubscript:@"posixGID"];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 objectForKeyedSubscript:@"personaIdentifier"];
  int v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    container_log_handle_for_category();
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      int v27 = 138412802;
      *(void *)v28 = @"posixUID";
      *(_WORD *)&v28[8] = 2112;
      *(void *)v29 = objc_opt_class();
      *(_WORD *)&v29[8] = 2112;
      v30[0] = v8;
      id v24 = *(id *)v29;
      _os_log_error_impl( &dword_188846000,  v20,  OS_LOG_TYPE_ERROR,  "Invalid user identity plist data. Expected number for %@, got %@. Data: %@",  (uint8_t *)&v27,  0x20u);
    }

LABEL_15:
    v17 = 0LL;
    v19 = 0LL;
    unint64_t v22 = 75LL;
    if (!a5) {
      goto LABEL_18;
    }
    goto LABEL_16;
  }

  uint64_t v13 = [v10 unsignedIntegerValue];
  if (!v11 || (uint64_t v14 = v13, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    container_log_handle_for_category();
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      int v27 = 138412802;
      *(void *)v28 = @"posixGID";
      *(_WORD *)&v28[8] = 2112;
      *(void *)v29 = objc_opt_class();
      *(_WORD *)&v29[8] = 2112;
      v30[0] = v8;
      id v26 = *(id *)v29;
      _os_log_error_impl( &dword_188846000,  v21,  OS_LOG_TYPE_ERROR,  "Invalid user identity plist data. Expected number for %@, got %@. Data: %@",  (uint8_t *)&v27,  0x20u);
    }

    goto LABEL_14;
  }

  int v15 = [v11 unsignedIntegerValue];
  uint64_t v16 = +[MCMPOSIXUser posixUserWithUID:](&OBJC_CLASS___MCMPOSIXUser, "posixUserWithUID:", v14);
  if (!v16)
  {
    int v25 = v14;
    container_log_handle_for_category();
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      int v27 = 67109890;
      *(_DWORD *)v28 = v15;
      *(_WORD *)&v28[4] = 1024;
      *(_DWORD *)&v28[6] = v25;
      strcpy(v29, "@\b");
      v29[3] = 0;
      *(_WORD *)&v29[4] = 0;
      *(_DWORD *)&v29[6] = 0;
      LOWORD(v30[0]) = 2112;
      *(void *)((char *)v30 + 2) = v8;
      _os_log_error_impl( &dword_188846000,  v21,  OS_LOG_TYPE_ERROR,  "Invalid user identity plist data. Could not get matching uid passwd data. gid: %d, uid: %d, User: %@, Data: %@",  (uint8_t *)&v27,  0x22u);
    }

- (MCMUserIdentity)initWithVersion2PlistDictionary:(id)a3 cache:(id)a4 error:(unint64_t *)a5
{
  v39[2] = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  [v7 objectForKeyedSubscript:@"posixUID"];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 objectForKeyedSubscript:@"posixGID"];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 objectForKeyedSubscript:@"type"];
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v34 = [v7 objectForKeyedSubscript:@"personaUniqueString"];
  if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    container_log_handle_for_category();
    int v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)v37 = @"posixUID";
      *(_WORD *)&v37[8] = 2112;
      *(void *)v38 = objc_opt_class();
      *(_WORD *)&v38[8] = 2112;
      v39[0] = v7;
      id v29 = *(id *)v38;
      _os_log_error_impl( &dword_188846000,  v25,  OS_LOG_TYPE_ERROR,  "Invalid user identity plist data. Expected number for %@, got %@. Data: %@",  buf,  0x20u);
    }

    goto LABEL_22;
  }

  uint64_t v11 = [v9 unsignedIntegerValue];
  if (!v10 || (uint64_t v12 = v11, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    container_log_handle_for_category();
    id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)v37 = @"posixGID";
      *(_WORD *)&v37[8] = 2112;
      *(void *)v38 = objc_opt_class();
      *(_WORD *)&v38[8] = 2112;
      v39[0] = v7;
      id v30 = *(id *)v38;
      _os_log_error_impl( &dword_188846000,  v26,  OS_LOG_TYPE_ERROR,  "Invalid user identity plist data. Expected number for %@, got %@. Data: %@",  buf,  0x20u);
    }

    goto LABEL_26;
  }

  int v13 = [v10 unsignedIntegerValue];
  uint64_t v14 = +[MCMPOSIXUser posixUserWithUID:](&OBJC_CLASS___MCMPOSIXUser, "posixUserWithUID:", v12);
  if (!v14)
  {
    container_log_handle_for_category();
    int v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)v37 = v13;
      *(_WORD *)&v37[4] = 1024;
      *(_DWORD *)&v37[6] = v12;
      strcpy(v38, "@\b");
      v38[3] = 0;
      *(_WORD *)&v38[4] = 0;
      *(_DWORD *)&v38[6] = 0;
      LOWORD(v39[0]) = 2112;
      *(void *)((char *)v39 + 2) = v7;
      _os_log_error_impl( &dword_188846000,  v25,  OS_LOG_TYPE_ERROR,  "Invalid user identity plist data. Could not get matching uid passwd data. gid: %d, uid: %d, User: %@, Data: %@",  buf,  0x22u);
    }

- (id)plist
{
  v17[4] = *MEMORY[0x1895F89C0];
  v16[0] = @"posixUID";
  objc_super v3 = (void *)MEMORY[0x189607968];
  -[MCMUserIdentity posixUser](self, "posixUser");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithUnsignedInt:", objc_msgSend(v4, "UID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v5;
  v16[1] = @"posixGID";
  v6 = (void *)MEMORY[0x189607968];
  -[MCMUserIdentity posixUser](self, "posixUser");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithUnsignedInt:", objc_msgSend(v7, "primaryGID"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v8;
  v16[2] = @"type";
  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:", -[MCMUserIdentity personaType](self, "personaType"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = @"version";
  v17[2] = v9;
  v17[3] = @"2";
  [MEMORY[0x189603F68] dictionaryWithObjects:v17 forKeys:v16 count:4];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = (void *)[v10 mutableCopy];

  -[MCMUserIdentity personaUniqueString](self, "personaUniqueString");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[MCMUserIdentity personaUniqueString](self, "personaUniqueString");
    int v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 setObject:v13 forKeyedSubscript:@"personaUniqueString"];
  }

  uint64_t v14 = (void *)[v11 copy];

  return v14;
}

- (BOOL)isDataSeparated
{
  return -[MCMUserIdentity personaType](self, "personaType") == 1;
}

- (BOOL)isNoSpecificPersona
{
  return -[MCMUserIdentity personaType](self, "personaType") == 2;
}

- (BOOL)homeDirectoryExists
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMUserIdentity homeDirectoryURL](self, "homeDirectoryURL");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = [v3 itemExistsAtURL:v4];

  return (char)self;
}

- (MCMUserIdentity)userIdentityWithPOSIXUser:(id)a3
{
  id v4 = a3;
  v5 = -[MCMUserIdentity personaUniqueString](self, "personaUniqueString");
  v6 = -[MCMUserIdentity homeDirectoryURL](self, "homeDirectoryURL");
  if (!-[MCMUserIdentity isDataSeparated](self, "isDataSeparated"))
  {
    uint64_t v7 = [v4 homeDirectoryURL];

    v6 = (void *)v7;
  }

  id v8 = -[MCMUserIdentity initWithPOSIXUser:homeDirectoryURL:personaUniqueString:personaType:kernelPersonaID:]( objc_alloc(&OBJC_CLASS___MCMUserIdentity),  "initWithPOSIXUser:homeDirectoryURL:personaUniqueString:personaType:kernelPersonaID:",  v4,  v6,  v5,  -[MCMUserIdentity personaType](self, "personaType"),  -[MCMUserIdentity kernelPersonaID](self, "kernelPersonaID"));

  return v8;
}

- (id)description
{
  v5[5] = *MEMORY[0x1895F89C0];
  objc_super v3 = objc_alloc(&OBJC_CLASS___MCMLazyDescription);
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __30__MCMUserIdentity_description__block_invoke;
  v5[3] = &unk_18A29E720;
  v5[4] = self;
  return -[MCMLazyDescription initWithDescriber:](v3, "initWithDescriber:", v5);
}

- (NSString)shortDescription
{
  v5[5] = *MEMORY[0x1895F89C0];
  objc_super v3 = objc_alloc(&OBJC_CLASS___MCMLazyDescription);
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __35__MCMUserIdentity_shortDescription__block_invoke;
  v5[3] = &unk_18A29E720;
  v5[4] = self;
  return (NSString *)-[MCMLazyDescription initWithDescriber:](v3, "initWithDescriber:", v5);
}

- (id)_descriptionForPersonaType:(int)a3
{
  else {
    return off_18A29D878[a3];
  }
}

- (unint64_t)hash
{
  return -[NSString hash](self->_identifier, "hash");
}

- (BOOL)isEqualToUserIdentity:(id)a3
{
  return -[NSString isEqual:](self->_identifier, "isEqual:", *((void *)a3 + 5));
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MCMUserIdentity *)a3;
  v5 = v4;
  if (self == v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[MCMUserIdentity isEqualToUserIdentity:](self, "isEqualToUserIdentity:", v5);

  return v6;
}

- (BOOL)isStrictlyEqualToUserIdentity:(id)a3
{
  id v4 = a3;
  if (-[MCMUserIdentity isEqualToUserIdentity:](self, "isEqualToUserIdentity:", v4)) {
    BOOL v5 = self->_personaType == v4[5];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    id v6 = -[MCMPOSIXUser copyWithZone:](self->_posixUser, "copyWithZone:", a3);
    uint64_t v7 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v6;

    uint64_t v8 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
    id v9 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v8;

    uint64_t v10 = -[NSURL copyWithZone:](self->_homeDirectoryURL, "copyWithZone:", a3);
    uint64_t v11 = *(void **)(v5 + 8);
    *(void *)(v5 + 8) = v10;

    uint64_t v12 = -[NSString copyWithZone:](self->_personaUniqueString, "copyWithZone:", a3);
    int v13 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v12;

    *(_DWORD *)(v5 + 20) = self->_personaType;
    *(_DWORD *)(v5 + 16) = self->_kernelPersonaID;
  }

  return (id)v5;
}

- (NSString)personaUniqueString
{
  return self->_personaUniqueString;
}

- (unsigned)kernelPersonaID
{
  return self->_kernelPersonaID;
}

- (int64_t)extensionHandle
{
  return self->_extensionHandle;
}

- (void)setExtensionHandle:(int64_t)a3
{
  self->_extensionHandle = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (MCMPOSIXUser)posixUser
{
  return self->_posixUser;
}

- (NSURL)homeDirectoryURL
{
  return self->_homeDirectoryURL;
}

- (int)personaType
{
  return self->_personaType;
}

- (void).cxx_destruct
{
}

id __35__MCMUserIdentity_shortDescription__block_invoke(uint64_t a1, char a2)
{
  id v4 = (void *)NSString;
  [*(id *)(a1 + 32) posixUser];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 UID];
  [*(id *)(a1 + 32) posixUser];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 primaryGID];
  if ((a2 & 1) != 0)
  {
    id v9 = @"~~";
  }

  else
  {
    [*(id *)(a1 + 32) identifier];
    id v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  [v4 stringWithFormat:@"<%u/%u/%@/%d/%d>", v6, v8, v9, objc_msgSend(*(id *)(a1 + 32), "personaType"), objc_msgSend(*(id *)(a1 + 32), "kernelPersonaID")];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((a2 & 1) == 0) {

  }
  return v10;
}

id __30__MCMUserIdentity_description__block_invoke(uint64_t a1, int a2)
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 path];
  uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  [*(id *)(a1 + 32) posixUser];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 homeDirectoryURL];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 path];

  int v9 = -[__CFString isEqualToString:](v5, "isEqualToString:", v8);
  id v26 = (void *)v8;
  if ((v9 & 1) != 0 || a2)
  {
    if (v9) {
      uint64_t v10 = 0LL;
    }
    else {
      uint64_t v10 = @"<cm-redacted>";
    }

    uint64_t v5 = (__CFString *)v10;
  }

  v23 = (void *)NSString;
  uint64_t v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  int v25 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = *(void **)(a1 + 32);
  [v12 posixUser];
  int v13 = (void *)objc_claimAutoreleasedReturnValue();
  id v24 = v13;
  if (a2) {
    [v13 redactedDescription];
  }
  else {
    [v13 description];
  }
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) identifier];
  int v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5) {
    unint64_t v16 = ", homeDirectoryURL = [";
  }
  else {
    unint64_t v16 = "";
  }
  if (v5) {
    v17 = v5;
  }
  else {
    v17 = &stru_18A29E970;
  }
  if (v5) {
    uint64_t v18 = "]";
  }
  else {
    uint64_t v18 = "";
  }
  objc_msgSend(*(id *)(a1 + 32), "_descriptionForPersonaType:", objc_msgSend(*(id *)(a1 + 32), "personaType"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) personaUniqueString];
  unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend( v23,  "stringWithFormat:",  @"<%@: %p; posixUser = %@, identifier = %@%s%@%s, personaType = %@, personaUniqueString = %@, kernelPersonaID = %d>",
    v25,
    v12,
    v14,
    v15,
    v16,
    v17,
    v18,
    v19,
    v20,
    [*(id *)(a1 + 32) kernelPersonaID]);
  id v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (MCMUserIdentity)userIdentityWithPlist:(id)a3 cache:(id)a4 error:(unint64_t *)a5
{
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = (void *)[objc_alloc((Class)a1) initWithPlist:v9 cache:v8 error:a5];

  return (MCMUserIdentity *)v10;
}

+ (BOOL)isUserIdentityRequiredForContainerClass:(unint64_t)a3
{
  id v4 = containermanager_copy_global_configuration();
  char v5 = [v4 isGlobalBundleContainerWithContainerClass:a3];

  if ((v5 & 1) != 0) {
    return 0;
  }
  id v7 = containermanager_copy_global_configuration();
  char v8 = [v7 isGlobalSystemContainerWithContainerClass:a3];

  return v8 ^ 1;
}

+ (id)_identifierForPOSIXUID:(unsigned int)a3 personaUniqueString:(id)a4 personaType:(int)a5
{
  uint64_t v6 = *(void *)&a3;
  id v7 = a4;
  char v8 = v7;
  if (v7 && a5 == 1)
  {
    id v9 = v7;
  }

  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%u", v6);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }

  uint64_t v10 = v9;

  return v10;
}

@end