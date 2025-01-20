@interface MCMStaticConfiguration
+ (id)defaultPlistDirectoryURL;
- (BOOL)attemptMetadataReconstructionIfMissing;
- (BOOL)errorOnPersonaPropagationFailure;
- (BOOL)loadWithError:(id *)a3;
- (BOOL)override_initNonBoolPropertiesWithPlist:(id)a3 error:(id *)a4;
- (Class)containerConfigClass;
- (MCMPOSIXUser)defaultUser;
- (NSDictionary)containerConfigMap;
- (NSString)debugDescription;
- (id)_posixUserFromPlistValue:(id)a3;
- (id)configForContainerClass:(unint64_t)a3;
- (id)descriptionForContainerConfiguration;
- (id)initFromPlistAtPathOrName:(id)a3 defaultPlistDirectoryURL:(id)a4;
- (void)setContainerConfigClass:(Class)a3;
@end

@implementation MCMStaticConfiguration

- (id)initFromPlistAtPathOrName:(id)a3 defaultPlistDirectoryURL:(id)a4
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MCMStaticConfiguration;
  v4 = -[MCMPlistReadOnly initFromPlistAtPathOrName:defaultPlistDirectoryURL:conformingToProtocol:]( &v8,  sel_initFromPlistAtPathOrName_defaultPlistDirectoryURL_conformingToProtocol_,  a3,  a4,  &unk_18C7390A8);
  v5 = v4;
  if (v4)
  {
    v6 = (void *)v4[11];
    v4[11] = 0LL;
  }

  return v5;
}

- (id)configForContainerClass:(unint64_t)a3
{
  containerConfigMapByEnum = self->_containerConfigMapByEnum;
  [MEMORY[0x189607968] numberWithUnsignedLongLong:container_class_normalized()];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NSDictionary objectForKeyedSubscript:](containerConfigMapByEnum, "objectForKeyedSubscript:", v4);
  return v5;
}

- (BOOL)loadWithError:(id *)a3
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603FC8] dictionary];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___MCMStaticConfiguration;
  id v27 = 0LL;
  unsigned int v6 = -[MCMPlistReadOnly loadWithError:](&v26, sel_loadWithError_, &v27);
  id v7 = v27;
  objc_super v8 = v7;
  if (v6)
  {
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    -[MCMStaticConfiguration containerConfigMap](self, "containerConfigMap");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v28 count:16];
    if (!v10)
    {
LABEL_12:

      v20 = (NSDictionary *)[v5 copy];
      containerConfigMapByEnum = self->_containerConfigMapByEnum;
      self->_containerConfigMapByEnum = v20;

      BOOL v22 = 1;
      id v18 = v8;
      goto LABEL_17;
    }

    uint64_t v11 = v10;
    v24 = a3;
    uint64_t v12 = *(void *)v30;
LABEL_4:
    uint64_t v13 = 0LL;
    while (1)
    {
      if (*(void *)v30 != v12) {
        objc_enumerationMutation(v9);
      }
      uint64_t v14 = *(void *)(*((void *)&v29 + 1) + 8 * v13);
      v15 = -[MCMStaticConfiguration containerConfigMap](self, "containerConfigMap");
      [v15 objectForKeyedSubscript:v14];
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        id v25 = v8;
        int v17 = [v16 loadWithError:&v25];
        id v18 = v25;

        if (!v17)
        {

          a3 = v24;
          if (v24) {
            goto LABEL_14;
          }
LABEL_16:
          BOOL v22 = 0;
          goto LABEL_17;
        }

        objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(v16, "containerClass"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        [v5 setObject:v16 forKeyedSubscript:v19];

        objc_super v8 = v18;
      }

      if (v11 == ++v13)
      {
        uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v28 count:16];
        if (v11) {
          goto LABEL_4;
        }
        goto LABEL_12;
      }
    }
  }

  id v18 = v7;
  if (!a3) {
    goto LABEL_16;
  }
LABEL_14:
  id v18 = v18;
  BOOL v22 = 0;
  *a3 = v18;
LABEL_17:

  return v22;
}

- (BOOL)override_initNonBoolPropertiesWithPlist:(id)a3 error:(id *)a4
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  [v5 objectForKeyedSubscript:@"containerConfiguration"];
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  id v7 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v8 = v7;
  }
  else {
    id v8 = 0LL;
  }
  v38 = v5;

  uint64_t v9 = (void *)MEMORY[0x189604A60];
  if (v8) {
    uint64_t v9 = v8;
  }
  id v10 = v9;

  [MEMORY[0x189603FC8] dictionary];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = self;
  uint64_t v12 = -[MCMStaticConfiguration containerConfigClass](self, "containerConfigClass");
  if (!v12) {
    uint64_t v12 = (objc_class *)objc_opt_class();
  }
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  id v13 = v10;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v40 objects:v39 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v41;
    uint64_t v17 = MEMORY[0x189604A60];
    do
    {
      for (uint64_t i = 0LL; i != v15; ++i)
      {
        if (*(void *)v41 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v19 = *(void *)(*((void *)&v40 + 1) + 8 * i);
        [v13 objectForKeyedSubscript:v19];
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        id v21 = v20;
        if ((objc_opt_isKindOfClass() & 1) != 0) {
          id v22 = v21;
        }
        else {
          id v22 = 0LL;
        }

        [v11 setObject:v23 forKeyedSubscript:v19];
      }

      uint64_t v15 = [v13 countByEnumeratingWithState:&v40 objects:v39 count:16];
    }

    while (v15);
  }

  uint64_t v24 = [v11 copy];
  containerConfigMap = v37->_containerConfigMap;
  v37->_containerConfigMap = (NSDictionary *)v24;

  NSStringFromSelector(sel_defaultUser);
  objc_super v26 = (void *)objc_claimAutoreleasedReturnValue();
  [v38 objectForKeyedSubscript:v26];
  id v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27
    && (-[MCMStaticConfiguration _posixUserFromPlistValue:](v37, "_posixUserFromPlistValue:", v27),
        uint64_t v28 = objc_claimAutoreleasedReturnValue(),
        defaultUser = v37->_defaultUser,
        v37->_defaultUser = (MCMPOSIXUser *)v28,
        defaultUser,
        !v37->_defaultUser))
  {
    uint64_t v33 = objc_alloc(&OBJC_CLASS___MCMError);
    v34 = -[MCMPlistReadOnly sourceFileURL](v37, "sourceFileURL");
    [v34 path];
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v30 = -[MCMError initWithErrorType:category:path:POSIXerrno:]( v33,  "initWithErrorType:category:path:POSIXerrno:",  149LL,  5LL,  v35,  100LL);

    if (a4)
    {
      __int128 v30 = v30;
      BOOL v31 = 0;
      *a4 = v30;
    }

    else
    {
      BOOL v31 = 0;
    }
  }

  else
  {
    __int128 v30 = 0LL;
    BOOL v31 = 1;
  }

  return v31;
}

- (NSString)debugDescription
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MCMStaticConfiguration;
  v3 = -[MCMPlistReadOnly descriptionOfBoolPropertiesWithIndentString:]( &v10,  sel_descriptionOfBoolPropertiesWithIndentString_,  0LL);
  NSStringFromSelector(sel_defaultUser);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMStaticConfiguration defaultUser](self, "defaultUser");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringByAppendingFormat:@"%@: %@\n", v4, v5];
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MCMStaticConfiguration descriptionForContainerConfiguration](self, "descriptionForContainerConfiguration");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 stringByAppendingString:v7];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (id)_posixUserFromPlistValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    [v3 objectForKeyedSubscript:@"type"];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    id v5 = v4;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v6 = v5;
    }
    else {
      id v6 = 0LL;
    }

    if ([v6 isEqualToString:@"current"])
    {
      +[MCMPOSIXUser currentPOSIXUser](&OBJC_CLASS___MCMPOSIXUser, "currentPOSIXUser");
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v7 = 0LL;
    }
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      +[MCMPOSIXUser posixUserWithName:](&OBJC_CLASS___MCMPOSIXUser, "posixUserWithName:", v3);
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v7 = 0LL;
    }
  }

  return v7;
}

- (id)descriptionForContainerConfiguration
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  -[MCMStaticConfiguration containerConfigMap](self, "containerConfigMap");
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [obj countByEnumeratingWithState:&v18 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v19;
    id v6 = @"containerConfiguration: {\n";
    do
    {
      for (uint64_t i = 0LL; i != v4; ++i)
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        -[MCMStaticConfiguration containerConfigMap](self, "containerConfigMap");
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
        [v9 objectForKeyedSubscript:v8];
        objc_super v10 = (void *)objc_claimAutoreleasedReturnValue();

        -[__CFString stringByAppendingFormat:](v6, "stringByAppendingFormat:", @"\t%@: {\n", v8);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

        [v10 debugDescriptionWithIndentString:@"\t\t"];
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v11 stringByAppendingString:v12];
        id v13 = (void *)objc_claimAutoreleasedReturnValue();

        [v13 stringByAppendingString:@"\t}\n"];
        id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }

      uint64_t v4 = [obj countByEnumeratingWithState:&v18 objects:v17 count:16];
    }

    while (v4);
  }

  else
  {
    id v6 = @"containerConfiguration: {\n";
  }

  -[__CFString stringByAppendingString:](v6, "stringByAppendingString:", @"}\n");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (Class)containerConfigClass
{
  return self->_containerConfigClass;
}

- (void)setContainerConfigClass:(Class)a3
{
  self->_containerConfigClass = a3;
}

- (BOOL)errorOnPersonaPropagationFailure
{
  return self->_errorOnPersonaPropagationFailure;
}

- (BOOL)attemptMetadataReconstructionIfMissing
{
  return self->_attemptMetadataReconstructionIfMissing;
}

- (MCMPOSIXUser)defaultUser
{
  return self->_defaultUser;
}

- (NSDictionary)containerConfigMap
{
  return self->_containerConfigMap;
}

- (void).cxx_destruct
{
}

+ (id)defaultPlistDirectoryURL
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  if (defaultPlistDirectoryURL_onceToken != -1) {
    dispatch_once(&defaultPlistDirectoryURL_onceToken, &__block_literal_global_6306);
  }
  container_log_handle_for_category();
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    [(id)defaultPlistDirectoryURL_defaultURL path];
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_188846000, v2, OS_LOG_TYPE_DEFAULT, "defaultPlistDirectoryURL: [%@]", (uint8_t *)&v5, 0xCu);
  }

  return (id)defaultPlistDirectoryURL_defaultURL;
}

void __50__MCMStaticConfiguration_defaultPlistDirectoryURL__block_invoke()
{
  uint64_t v0 = [MEMORY[0x189604030] fileURLWithFileSystemRepresentation:"/System/Library/PrivateFrameworks/ContainerManagerCommon.framework" isDirectory:1 relativeToURL:0];
  v1 = (void *)defaultPlistDirectoryURL_defaultURL;
  defaultPlistDirectoryURL_defaultURL = v0;
}

@end