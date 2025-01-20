@interface MCMPlistReadOnly
- (BOOL)_initPropertiesWithPlist:(id)a3 conformingToProtocol:(id)a4 error:(id *)a5;
- (BOOL)_isNonatomicReadonlyBoolPropertyTypeWithAttributes:(const char *)a3;
- (BOOL)keepArtifacts;
- (BOOL)loadWithError:(id *)a3;
- (BOOL)override_initNonBoolPropertiesWithPlist:(id)a3 error:(id *)a4;
- (MCMFileManagerReadsData)fileManager;
- (MCMPlistReadOnly)initWithPreprocessedPlist:(id)a3 conformingToProtocol:(id)a4;
- (MCMPlistReadOnly)initWithRawPlist:(id)a3 preprocessedPlist:(id)a4 pathOrName:(id)a5 protocol:(id)a6 defaultPlistDirectoryURL:(id)a7;
- (NSCountedSet)numIncludes;
- (NSDictionary)preprocessedPlist;
- (NSDictionary)rawPlist;
- (NSString)pathOrName;
- (NSURL)defaultPlistDirectoryURL;
- (NSURL)sourceFileURL;
- (Protocol)protocol;
- (id)_plistByPreprocessingPlist:(id)a3 conformingToProtocol:(id)a4 error:(id *)a5;
- (id)_plistByResolvingFeatureFlagsInMutablePlist:(id)a3 error:(id *)a4;
- (id)_plistByResolvingIncludeInMutablePlist:(id)a3 conformingToProtocol:(id)a4 error:(id *)a5;
- (id)_urlByResolvingConfigName:(id)a3 defaultPlistDirectoryURL:(id)a4 error:(id *)a5;
- (id)descriptionOfBoolPropertiesWithIndentString:(id)a3;
- (id)featureFlagProvider;
- (id)initFromPlist:(id)a3 defaultPlistDirectoryURL:(id)a4 conformingToProtocol:(id)a5;
- (id)initFromPlistAtPathOrName:(id)a3 defaultPlistDirectoryURL:(id)a4 conformingToProtocol:(id)a5;
- (void)_forEachBoolPropertyUsingObjCMagicInProtocol:(id)a3 runBlock:(id)a4;
- (void)_initBoolPropertiesUsingObjCMagicWithPlist:(id)a3 conformingToProtocol:(id)a4;
- (void)_initBoolPropertyWithName:(id)a3 entry:(id)a4;
- (void)setFeatureFlagProvider:(id)a3;
- (void)setFileManager:(id)a3;
- (void)setKeepArtifacts:(BOOL)a3;
- (void)setNumIncludes:(id)a3;
@end

@implementation MCMPlistReadOnly

- (id)initFromPlistAtPathOrName:(id)a3 defaultPlistDirectoryURL:(id)a4 conformingToProtocol:(id)a5
{
  return -[MCMPlistReadOnly initWithRawPlist:preprocessedPlist:pathOrName:protocol:defaultPlistDirectoryURL:]( self,  "initWithRawPlist:preprocessedPlist:pathOrName:protocol:defaultPlistDirectoryURL:",  0LL,  0LL,  a3,  a5,  a4);
}

- (id)initFromPlist:(id)a3 defaultPlistDirectoryURL:(id)a4 conformingToProtocol:(id)a5
{
  return -[MCMPlistReadOnly initWithRawPlist:preprocessedPlist:pathOrName:protocol:defaultPlistDirectoryURL:]( self,  "initWithRawPlist:preprocessedPlist:pathOrName:protocol:defaultPlistDirectoryURL:",  a3,  0LL,  0LL,  a5,  a4);
}

- (MCMPlistReadOnly)initWithPreprocessedPlist:(id)a3 conformingToProtocol:(id)a4
{
  return -[MCMPlistReadOnly initWithRawPlist:preprocessedPlist:pathOrName:protocol:defaultPlistDirectoryURL:]( self,  "initWithRawPlist:preprocessedPlist:pathOrName:protocol:defaultPlistDirectoryURL:",  0LL,  a3,  0LL,  a4,  0LL);
}

- (MCMPlistReadOnly)initWithRawPlist:(id)a3 preprocessedPlist:(id)a4 pathOrName:(id)a5 protocol:(id)a6 defaultPlistDirectoryURL:(id)a7
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  id v13 = a3;
  id v32 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___MCMPlistReadOnly;
  v17 = -[MCMPlistReadOnly init](&v33, sel_init);
  if (!v17) {
    goto LABEL_9;
  }
  id v31 = v13;
  uint64_t v18 = objc_opt_new();
  numIncludes = v17->_numIncludes;
  v17->_numIncludes = (NSCountedSet *)v18;

  p_rawPlist = &v17->_rawPlist;
  objc_storeStrong((id *)&v17->_rawPlist, a3);
  objc_storeStrong((id *)&v17->_preprocessedPlist, a4);
  p_pathOrName = &v17->_pathOrName;
  objc_storeStrong((id *)&v17->_pathOrName, a5);
  objc_storeStrong((id *)&v17->_protocol, a6);
  p_defaultPlistDirectoryURL = &v17->_defaultPlistDirectoryURL;
  objc_storeStrong((id *)&v17->_defaultPlistDirectoryURL, a7);
  uint64_t v23 = +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
  fileManager = v17->_fileManager;
  v17->_fileManager = (MCMFileManagerReadsData *)v23;

  id featureFlagProvider = v17->_featureFlagProvider;
  v17->_id featureFlagProvider = 0LL;

  v17->_keepArtifacts = 0;
  if ((-[MCMPlistReadOnly conformsToProtocol:](v17, "conformsToProtocol:", v15) & 1) == 0)
  {
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v36 = 0u;
    os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    v28 = (objc_class *)objc_opt_class();
    id v29 = NSStringFromClass(v28);
    uint64_t v30 = [v29 UTF8String];
    int v34 = 136315138;
    uint64_t v35 = v30;
    _os_log_send_and_compose_impl();

    _os_crash_msg();
    __break(1u);
LABEL_11:
    _os_crash();
    __break(1u);
LABEL_12:
    _os_crash();
    __break(1u);
    goto LABEL_13;
  }

  v26 = *p_rawPlist;
  if (*p_rawPlist && !*p_defaultPlistDirectoryURL) {
    goto LABEL_11;
  }
  id v13 = v31;
  if (*p_pathOrName && !*p_defaultPlistDirectoryURL) {
    goto LABEL_12;
  }
  if (v26 || *p_pathOrName | (uint64_t)v17->_preprocessedPlist)
  {
LABEL_9:

    return v17;
  }

- (BOOL)loadWithError:(id *)a3
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  v5 = (void *)MEMORY[0x1895CE3A8](self, a2);
  if (self->_pathOrName)
  {
    v6 = -[MCMPlistReadOnly pathOrName](self, "pathOrName");
    v7 = -[MCMPlistReadOnly defaultPlistDirectoryURL](self, "defaultPlistDirectoryURL");
    id v35 = 0LL;
    -[MCMPlistReadOnly _urlByResolvingConfigName:defaultPlistDirectoryURL:error:]( self,  "_urlByResolvingConfigName:defaultPlistDirectoryURL:error:",  v6,  v7,  &v35);
    v8 = (NSURL *)objc_claimAutoreleasedReturnValue();
    v9 = (MCMError *)v35;
    sourceFileURL = self->_sourceFileURL;
    self->_sourceFileURL = v8;

    v11 = self->_sourceFileURL;
    if (!v11) {
      goto LABEL_20;
    }
    v12 = (void *)MEMORY[0x189603F68];
    -[MCMPlistReadOnly fileManager](self, "fileManager");
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    id v34 = 0LL;
    objc_msgSend(v12, "MCM_dictionaryWithContentsOfURL:options:fileManager:fsNode:error:", v11, 0, v13, 0, &v34);
    id v14 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    id v15 = v34;
    rawPlist = self->_rawPlist;
    self->_rawPlist = v14;

    if (!self->_rawPlist)
    {
      container_log_handle_for_category();
      v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        -[NSURL path](self->_sourceFileURL, "path");
        id v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        __int128 v37 = v31;
        __int16 v38 = 2112;
        id v39 = v15;
        _os_log_error_impl( &dword_188846000,  v28,  OS_LOG_TYPE_ERROR,  "Failed to read config file [%@]; error = %@",
          buf,
          0x16u);
      }

      id v29 = -[MCMError initWithNSError:url:defaultErrorType:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithNSError:url:defaultErrorType:",  v15,  self->_sourceFileURL,  149LL);
      v9 = v29;
      goto LABEL_20;
    }
  }

  else
  {
    v9 = 0LL;
  }

  v17 = self->_rawPlist;
  if (v17)
  {
    protocol = self->_protocol;
    objc_super v33 = v9;
    -[MCMPlistReadOnly _plistByPreprocessingPlist:conformingToProtocol:error:]( self,  "_plistByPreprocessingPlist:conformingToProtocol:error:",  v17,  protocol,  &v33);
    v19 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v20 = v33;

    preprocessedPlist = self->_preprocessedPlist;
    self->_preprocessedPlist = v19;

    if (!self->_preprocessedPlist)
    {
      v9 = v20;
      goto LABEL_20;
    }

    if (!self->_keepArtifacts)
    {
      v22 = self->_rawPlist;
      self->_rawPlist = 0LL;
    }
  }

  else
  {
    v20 = v9;
  }

  uint64_t v23 = self->_preprocessedPlist;
  if (v23)
  {
    v24 = self->_protocol;
    id v32 = v20;
    BOOL v25 = -[MCMPlistReadOnly _initPropertiesWithPlist:conformingToProtocol:error:]( self,  "_initPropertiesWithPlist:conformingToProtocol:error:",  v23,  v24,  &v32);
    v9 = v32;

    if (v25)
    {
      if (!self->_keepArtifacts)
      {
        v26 = self->_preprocessedPlist;
        self->_preprocessedPlist = 0LL;
      }

      objc_autoreleasePoolPop(v5);
      BOOL v27 = 1;
      goto LABEL_23;
    }

- (id)descriptionOfBoolPropertiesWithIndentString:(id)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  id v15 = __Block_byref_object_copy__4513;
  id v16 = __Block_byref_object_dispose__4514;
  v17 = &stru_18A29E970;
  protocol = self->_protocol;
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __64__MCMPlistReadOnly_descriptionOfBoolPropertiesWithIndentString___block_invoke;
  v9[3] = &unk_18A29D728;
  v9[4] = self;
  v11 = &v12;
  id v6 = v4;
  id v10 = v6;
  -[MCMPlistReadOnly _forEachBoolPropertyUsingObjCMagicInProtocol:runBlock:]( self,  "_forEachBoolPropertyUsingObjCMagicInProtocol:runBlock:",  protocol,  v9);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (BOOL)override_initNonBoolPropertiesWithPlist:(id)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)_initPropertiesWithPlist:(id)a3 conformingToProtocol:(id)a4 error:(id *)a5
{
  v13[1] = *(id *)MEMORY[0x1895F89C0];
  id v8 = a3;
  -[MCMPlistReadOnly _initBoolPropertiesUsingObjCMagicWithPlist:conformingToProtocol:]( self,  "_initBoolPropertiesUsingObjCMagicWithPlist:conformingToProtocol:",  v8,  a4);
  v13[0] = 0LL;
  BOOL v9 = -[MCMPlistReadOnly override_initNonBoolPropertiesWithPlist:error:]( self,  "override_initNonBoolPropertiesWithPlist:error:",  v8,  v13);

  id v10 = v13[0];
  v11 = v10;
  if (a5 && !v9) {
    *a5 = v10;
  }

  return v9;
}

- (void)_initBoolPropertiesUsingObjCMagicWithPlist:(id)a3 conformingToProtocol:(id)a4
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __84__MCMPlistReadOnly__initBoolPropertiesUsingObjCMagicWithPlist_conformingToProtocol___block_invoke;
  v8[3] = &unk_18A29D750;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  -[MCMPlistReadOnly _forEachBoolPropertyUsingObjCMagicInProtocol:runBlock:]( self,  "_forEachBoolPropertyUsingObjCMagicInProtocol:runBlock:",  a4,  v8);
}

- (void)_initBoolPropertyWithName:(id)a3 entry:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_opt_class();
  id v10 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (!v10)
    {
      uint64_t v8 = 0LL;
      goto LABEL_6;
    }

    uint64_t v8 = [v10 BOOLValue];
  }

  else
  {
    uint64_t v8 = 0LL;
  }

LABEL_6:
  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", v8, v10);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMPlistReadOnly setValue:forKey:](self, "setValue:forKey:", v9, v7);
}

- (id)_plistByPreprocessingPlist:(id)a3 conformingToProtocol:(id)a4 error:(id *)a5
{
  v17[1] = *(id *)MEMORY[0x1895F89C0];
  id v8 = a4;
  id v9 = (void *)[a3 mutableCopy];
  v17[0] = 0LL;
  -[MCMPlistReadOnly _plistByResolvingFeatureFlagsInMutablePlist:error:]( self,  "_plistByResolvingFeatureFlagsInMutablePlist:error:",  v9,  v17);
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = v17[0];

  if (v10)
  {
    id v16 = v11;
    -[MCMPlistReadOnly _plistByResolvingIncludeInMutablePlist:conformingToProtocol:error:]( self,  "_plistByResolvingIncludeInMutablePlist:conformingToProtocol:error:",  v10,  v8,  &v16);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    id v13 = v16;

    id v11 = v13;
    if (!a5) {
      goto LABEL_7;
    }
  }

  else
  {
    uint64_t v12 = 0LL;
    if (!a5) {
      goto LABEL_7;
    }
  }

  if (!v12) {
    *a5 = v11;
  }
LABEL_7:
  objc_msgSend(v12, "MCM_deepCopy");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_plistByResolvingFeatureFlagsInMutablePlist:(id)a3 error:(id *)a4
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  -[MCMPlistReadOnly featureFlagProvider](self, "featureFlagProvider");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v30 = 0LL;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000LL;
  objc_super v33 = __Block_byref_object_copy__4513;
  id v34 = __Block_byref_object_dispose__4514;
  id v35 = 0LL;
  uint64_t v26 = 0LL;
  BOOL v27 = &v26;
  uint64_t v28 = 0x2020000000LL;
  char v29 = 0;
  id v8 = v6;
  uint64_t v18 = MEMORY[0x1895F87A8];
  uint64_t v19 = 3221225472LL;
  v20 = __70__MCMPlistReadOnly__plistByResolvingFeatureFlagsInMutablePlist_error___block_invoke;
  v21 = &unk_18A29D778;
  v24 = &v26;
  id v9 = v7;
  v22 = self;
  id v23 = v9;
  BOOL v25 = &v30;
  objc_msgSend(v8, "MCM_replaceDeepDictionariesWithReplaceHandler:", &v18);
  id v10 = v8;
  if (*((_BYTE *)v27 + 24))
  {
    if (v31[5]) {
      goto LABEL_6;
    }
    container_log_handle_for_category();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v17 = -[NSURL path](self->_sourceFileURL, "path", v18, v19, v20, v21);
      *(_DWORD *)buf = 138412290;
      __int128 v37 = v17;
      _os_log_error_impl(&dword_188846000, v11, OS_LOG_TYPE_ERROR, "Config file invalid [%@]", buf, 0xCu);
    }

    uint64_t v12 = objc_alloc(&OBJC_CLASS___MCMError);
    -[NSURL path](self->_sourceFileURL, "path");
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = -[MCMError initWithErrorType:category:path:POSIXerrno:]( v12,  "initWithErrorType:category:path:POSIXerrno:",  149LL,  5LL,  v13,  100LL);
    id v15 = (void *)v31[5];
    v31[5] = v14;

    id v10 = v8;
    if (*((_BYTE *)v27 + 24))
    {
LABEL_6:
      if (a4) {
        *a4 = (id) v31[5];
      }

      id v10 = 0LL;
    }
  }

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);

  return v10;
}

- (id)_plistByResolvingIncludeInMutablePlist:(id)a3 conformingToProtocol:(id)a4 error:(id *)a5
{
  id v34 = a5;
  uint64_t v46 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v35 = a4;
  id v8 = v7;
  id v9 = 0LL;
  id v10 = 0LL;
  __int128 v36 = v8;
  while (1)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", @"#Include", v34);
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    id v12 = v11;
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v13 = v12;
    }
    else {
      id v13 = 0LL;
    }

    if (!v13)
    {
      BOOL v25 = v34;
      goto LABEL_25;
    }

    [v8 removeObjectForKey:@"#Include"];
    -[MCMPlistReadOnly defaultPlistDirectoryURL](self, "defaultPlistDirectoryURL");
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    id v39 = v10;
    -[MCMPlistReadOnly _urlByResolvingConfigName:defaultPlistDirectoryURL:error:]( self,  "_urlByResolvingConfigName:defaultPlistDirectoryURL:error:",  v13,  v14,  &v39);
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    id v16 = v39;

    if (!v15)
    {
      container_log_handle_for_category();
      uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        -[MCMPlistReadOnly defaultPlistDirectoryURL](self, "defaultPlistDirectoryURL");
        uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
        [v30 path];
        id v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        id v41 = v13;
        __int16 v42 = 2112;
        uint64_t v43 = (uint64_t)v31;
        __int16 v44 = 2112;
        v45 = v16;
        _os_log_error_impl( &dword_188846000,  v26,  OS_LOG_TYPE_ERROR,  "Could not resolve config file name [%@] using default directory [%@]; error = %@",
          buf,
          0x20u);
      }

      id v15 = 0LL;
      goto LABEL_18;
    }
    v17 = -[MCMPlistReadOnly numIncludes](self, "numIncludes");
    [v17 addObject:v15];

    -[MCMPlistReadOnly numIncludes](self, "numIncludes");
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v19 = [v18 countForObject:v15];

    if (v19 >= 0x1F)
    {
      container_log_handle_for_category();
      BOOL v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        [v15 path];
        uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        id v41 = v32;
        __int16 v42 = 2048;
        uint64_t v43 = 30LL;
        _os_log_error_impl( &dword_188846000,  v27,  OS_LOG_TYPE_ERROR,  "[%@] exceeded maximum inclusions (%lu), possible recursion",  buf,  0x16u);
      }

      uint64_t v26 = (os_log_s *)v16;
      id v16 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 150LL);
LABEL_18:
      BOOL v25 = v34;
      goto LABEL_24;
    }

    v20 = (void *)MEMORY[0x189603F68];
    v21 = -[MCMPlistReadOnly fileManager](self, "fileManager");
    id v38 = 0LL;
    objc_msgSend(v20, "MCM_dictionaryWithContentsOfURL:options:fileManager:fsNode:error:", v15, 0, v21, 0, &v38);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    id v23 = v38;

    if (!v22)
    {
      container_log_handle_for_category();
      uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      BOOL v25 = v34;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        [v15 path];
        objc_super v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        id v41 = v33;
        __int16 v42 = 2112;
        uint64_t v43 = (uint64_t)v23;
        _os_log_error_impl( &dword_188846000,  v28,  OS_LOG_TYPE_ERROR,  "Could not read config file [%@]; error = %@",
          buf,
          0x16u);
      }

      id v10 = -[MCMError initWithNSError:url:defaultErrorType:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithNSError:url:defaultErrorType:",  v23,  v15,  149LL);
      v22 = 0LL;
      goto LABEL_23;
    }

    objc_msgSend(v8, "MCM_overlayDictionary:existingValuesTakePrecedent:", v22, 1);
    __int128 v37 = v16;
    uint64_t v24 = -[MCMPlistReadOnly _plistByResolvingFeatureFlagsInMutablePlist:error:]( self,  "_plistByResolvingFeatureFlagsInMutablePlist:error:",  v8,  &v37);
    id v10 = v37;

    if (!v24) {
      break;
    }

    id v9 = v13;
    id v8 = (id)v24;
  }

  id v8 = 0LL;
  BOOL v25 = v34;
LABEL_23:

  uint64_t v26 = (os_log_s *)v15;
  id v15 = v23;
  id v16 = v10;
LABEL_24:

  id v10 = v16;
LABEL_25:
  if (v10)
  {

    id v8 = 0LL;
  }

  if (v25 && !v8) {
    *BOOL v25 = v10;
  }

  return v8;
}

- (id)_urlByResolvingConfigName:(id)a3 defaultPlistDirectoryURL:(id)a4 error:(id *)a5
{
  v18[1] = *(id *)MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  if ([v8 hasPrefix:@"/"])
  {
    [MEMORY[0x189604030] fileURLWithPath:v8 isDirectory:0];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    if ([v8 hasPrefix:@"./"])
    {
      -[NSURL URLByDeletingLastPathComponent](self->_sourceFileURL, "URLByDeletingLastPathComponent");
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 URLByAppendingPathComponent:v8 isDirectory:0];
    }

    else
    {
      [v9 URLByAppendingPathComponent:v8 isDirectory:0];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 URLByAppendingPathExtension:@"plist"];
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  -[MCMPlistReadOnly fileManager](self, "fileManager");
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = 0LL;
  [v12 realPathForURL:v10 isDirectory:0 error:v18];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  id v14 = v18[0];

  id v15 = 0LL;
  if (!v13)
  {
    id v16 = -[MCMError initWithNSError:url:defaultErrorType:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithNSError:url:defaultErrorType:",  v14,  v10,  149LL);
    id v15 = v16;
    if (a5)
    {
      id v15 = v16;
      *a5 = v15;
    }
  }

  return v13;
}

- (void)_forEachBoolPropertyUsingObjCMagicInProtocol:(id)a3 runBlock:(id)a4
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v6 = (void (**)(id, void *))a4;
  unsigned int outCount = 0;
  id v7 = protocol_copyPropertyList2((Protocol *)a3, &outCount, 1, 1);
  if (outCount)
  {
    for (unint64_t i = 0LL; i < outCount; ++i)
    {
      id v9 = v7[i];
      Name = property_getName(v9);
      Attributes = property_getAttributes(v9);
      [NSString stringWithUTF8String:Name];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[MCMPlistReadOnly _isNonatomicReadonlyBoolPropertyTypeWithAttributes:]( self,  "_isNonatomicReadonlyBoolPropertyTypeWithAttributes:",  Attributes))
      {
        v6[2](v6, v12);
      }
    }
  }

  free(v7);
}

- (BOOL)_isNonatomicReadonlyBoolPropertyTypeWithAttributes:(const char *)a3
{
  if (_isNonatomicReadonlyBoolPropertyTypeWithAttributes__onceToken != -1) {
    dispatch_once(&_isNonatomicReadonlyBoolPropertyTypeWithAttributes__onceToken, &__block_literal_global_4495);
  }
  if (!strncmp( _isNonatomicReadonlyBoolPropertyTypeWithAttributes__BOOLType,  a3,  _isNonatomicReadonlyBoolPropertyTypeWithAttributes__BOOLTypeLen))
  {
    size_t v5 = strnlen(a3, 0x64uLL);
    id v4 = strnstr(a3, ",N", v5);
    if (v4) {
      LOBYTE(v4) = strnstr(a3, ",R", v5) != 0LL;
    }
  }

  else
  {
    LOBYTE(v4) = 0;
  }

  return (char)v4;
}

- (NSCountedSet)numIncludes
{
  return self->_numIncludes;
}

- (void)setNumIncludes:(id)a3
{
}

- (NSURL)defaultPlistDirectoryURL
{
  return self->_defaultPlistDirectoryURL;
}

- (Protocol)protocol
{
  return self->_protocol;
}

- (NSString)pathOrName
{
  return self->_pathOrName;
}

- (NSDictionary)rawPlist
{
  return self->_rawPlist;
}

- (NSDictionary)preprocessedPlist
{
  return self->_preprocessedPlist;
}

- (NSURL)sourceFileURL
{
  return self->_sourceFileURL;
}

- (MCMFileManagerReadsData)fileManager
{
  return self->_fileManager;
}

- (void)setFileManager:(id)a3
{
}

- (id)featureFlagProvider
{
  return self->_featureFlagProvider;
}

- (void)setFeatureFlagProvider:(id)a3
{
}

- (BOOL)keepArtifacts
{
  return self->_keepArtifacts;
}

- (void)setKeepArtifacts:(BOOL)a3
{
  self->_keepArtifacts = a3;
}

- (void).cxx_destruct
{
}

size_t __71__MCMPlistReadOnly__isNonatomicReadonlyBoolPropertyTypeWithAttributes___block_invoke()
{
  size_t result = strnlen(_isNonatomicReadonlyBoolPropertyTypeWithAttributes__BOOLType, 0x64uLL);
  _isNonatomicReadonlyBoolPropertyTypeWithAttributes__BOOLTypeLen = result;
  return result;
}

id __70__MCMPlistReadOnly__plistByResolvingFeatureFlagsInMutablePlist_error___block_invoke( void *a1,  void *a2,  void *a3)
{
  uint64_t v47 = *MEMORY[0x1895F89C0];
  size_t v5 = a2;
  id v6 = a3;
  id v7 = (void *)[v6 mutableCopy];
  id v8 = @"#IfFeatureFlagEnabled";
  uint64_t v9 = [v6 objectForKeyedSubscript:@"#IfFeatureFlagEnabled"];
  id v10 = @"#IfFeatureFlagDisabled";
  uint64_t v11 = [v6 objectForKeyedSubscript:@"#IfFeatureFlagDisabled"];
  [v6 objectForKeyedSubscript:@"#Then"];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 objectForKeyedSubscript:@"#Else"];
  id v39 = (void *)objc_claimAutoreleasedReturnValue();

  id v38 = (__CFString *)v5;
  if (v9 | v11)
  {
    if (v9 && v11)
    {
      *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = 1;
      container_log_handle_for_category();
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        __int16 v42 = @"#IfFeatureFlagEnabled";
        __int16 v43 = 2112;
        __int16 v44 = @"#IfFeatureFlagDisabled";
        __int16 v45 = 2112;
        uint64_t v46 = v5;
        uint64_t v14 = "Invalid plist; both [%@] and [%@] specified but only one should be at [%@]";
        id v15 = v13;
        uint32_t v16 = 32;
LABEL_38:
        _os_log_error_impl(&dword_188846000, v15, OS_LOG_TYPE_ERROR, v14, buf, v16);
      }
    }

    else
    {
      if (v12)
      {
        if (v9) {
          unint64_t v19 = (void *)v9;
        }
        else {
          unint64_t v19 = (void *)v11;
        }
        id v18 = v19;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          id v17 = v18;
          [v17 componentsSeparatedByString:@"/"];
          id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (-[os_log_s count](v13, "count") == 2)
          {
            uint64_t v20 = a1[5];
            id v21 = -[os_log_s objectAtIndexedSubscript:](v13, "objectAtIndexedSubscript:", 0LL);
            if (v20)
            {
              uint64_t v37 = [v21 UTF8String];
              id v22 = -[os_log_s objectAtIndexedSubscript:](v13, "objectAtIndexedSubscript:", 1LL);
              int v23 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v20 + 16))( v20,  v37,  [v22 UTF8String]);
            }

            else
            {
              [v21 UTF8String];
              id v22 = -[os_log_s objectAtIndexedSubscript:](v13, "objectAtIndexedSubscript:", 1LL);
              [v22 UTF8String];
              int v23 = _os_feature_enabled_impl();
            }

            int v31 = v23;

            if (v9 && v31 || (!v11 ? (char v32 = 1) : (char v32 = v31), (v32 & 1) == 0)) {
              id v33 = v12;
            }
            else {
              id v33 = v39;
            }
            id v34 = v33;

            id v18 = v17;
            id v7 = v34;
          }

          else
          {
            *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = 1;
            container_log_handle_for_category();
            uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              if (!v9) {
                id v8 = @"#IfFeatureFlagDisabled";
              }
              *(_DWORD *)buf = 138412802;
              __int16 v42 = v8;
              __int16 v43 = 2048;
              __int16 v44 = (const __CFString *)-[os_log_s count](v13, "count");
              __int16 v45 = 2112;
              uint64_t v46 = v38;
              _os_log_error_impl( &dword_188846000,  v30,  OS_LOG_TYPE_ERROR,  "Invalid plist; value of [%@] should be a feature flag string with two components but has %lu components at [%@]",
                buf,
                0x20u);
            }

            id v18 = v17;
          }
        }

        else
        {
          *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = 1;
          container_log_handle_for_category();
          id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            if (v9) {
              id v10 = @"#IfFeatureFlagEnabled";
            }
            id v35 = (objc_class *)objc_opt_class();
            NSStringFromClass(v35);
            __int128 v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            __int16 v42 = v10;
            __int16 v43 = 2112;
            __int16 v44 = v36;
            __int16 v45 = 2112;
            uint64_t v46 = v38;
            _os_log_error_impl( &dword_188846000,  v13,  OS_LOG_TYPE_ERROR,  "Invalid plist; value of [%@] should be an string but is a [%@] at [%@]",
              buf,
              0x20u);
          }

          id v17 = 0LL;
        }

        goto LABEL_17;
      }

      *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = 1;
      container_log_handle_for_category();
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        __int16 v42 = @"#Then";
        __int16 v43 = 2112;
        __int16 v44 = v5;
        uint64_t v14 = "Invalid plist; no [%@] specified at [%@]";
        id v15 = v13;
        uint32_t v16 = 22;
        goto LABEL_38;
      }
    }

    id v17 = 0LL;
    id v18 = 0LL;
LABEL_17:

    goto LABEL_18;
  }

  id v17 = 0LL;
  id v18 = 0LL;
LABEL_18:
  if (!*(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      uint64_t v24 = (void *)a1[4];
      [v24 protocol];
      BOOL v25 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v26 = *(void *)(a1[7] + 8LL);
      id obj = *(id *)(v26 + 40);
      uint64_t v27 = [v24 _plistByResolvingIncludeInMutablePlist:v7 conformingToProtocol:v25 error:&obj];
      objc_storeStrong((id *)(v26 + 40), obj);

      id v7 = (void *)v27;
      if (!v27) {
        *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = 1;
      }
    }
  }

  id v28 = v7;

  return v28;
}

void __84__MCMPlistReadOnly__initBoolPropertiesUsingObjCMagicWithPlist_conformingToProtocol___block_invoke( uint64_t a1,  void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  id v4 = a2;
  [v3 objectForKeyedSubscript:v4];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_initBoolPropertyWithName:entry:", v4);
}

void __64__MCMPlistReadOnly_descriptionOfBoolPropertiesWithIndentString___block_invoke(void *a1, void *a2)
{
  v3 = (void *)a1[4];
  id v4 = a2;
  [v3 valueForKey:v4];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  int v6 = [v5 BOOLValue];

  id v7 = @"NO";
  if (v6) {
    id v7 = @"YES";
  }
  id v8 = &stru_18A29E970;
  if (a1[5]) {
    id v8 = (const __CFString *)a1[5];
  }
  uint64_t v9 = [*(id *)(*(void *)(a1[6] + 8) + 40) stringByAppendingFormat:@"%@%@: %@\n", v8, v4, v7];

  uint64_t v10 = *(void *)(a1[6] + 8LL);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
}

@end