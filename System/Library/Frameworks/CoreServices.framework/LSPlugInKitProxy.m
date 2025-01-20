@interface LSPlugInKitProxy
+ (BOOL)supportsSecureCoding;
+ (id)containingBundleIdentifiersForPlugInBundleIdentifiers:(id)a3 error:(id *)a4;
+ (id)plugInKitProxyForPlugin:(unsigned int)a3 withContext:(LSContext *)a4;
+ (id)plugInKitProxyForPlugin:(unsigned int)a3 withContext:(LSContext *)a4 applicationExtensionRecord:(id)a5 resolveAndDetach:(BOOL)a6;
+ (id)plugInKitProxyForUUID:(id)a3 bundleIdentifier:(id)a4 pluginIdentifier:(id)a5 effectiveIdentifier:(id)a6 version:(id)a7 bundleURL:(id)a8;
+ (id)pluginKitProxyForIdentifier:(id)a3;
+ (id)pluginKitProxyForURL:(id)a3;
+ (id)pluginKitProxyForUUID:(id)a3;
- (BOOL)UPPValidated;
- (BOOL)_usesSystemPersona;
- (BOOL)freeProfileValidated;
- (BOOL)isOnSystemPartition;
- (BOOL)pluginCanProvideIcon;
- (BOOL)profileValidated;
- (LSBundleProxy)containingBundle;
- (LSExtensionPoint)extensionPoint;
- (LSPlugInKitProxy)initWithCoder:(id)a3;
- (NSDate)registrationDate;
- (NSDictionary)infoPlist;
- (NSDictionary)pluginKitDictionary;
- (NSNumber)platform;
- (NSString)originalIdentifier;
- (NSString)pluginIdentifier;
- (NSString)protocol;
- (NSString)teamID;
- (NSUUID)pluginUUID;
- (id)_initWithPlugin:(unsigned int)a3 andContext:(LSContext *)a4 applicationExtensionRecord:(id)a5 resolveAndDetach:(BOOL)a6;
- (id)_initWithUUID:(id)a3 bundleIdentifier:(id)a4 pluginIdentifier:(id)a5 effectiveIdentifier:(id)a6 version:(id)a7 bundleURL:(id)a8;
- (id)_localizedNameWithPreferredLocalizations:(id)a3 useShortNameOnly:(BOOL)a4;
- (id)_managedPersonas;
- (id)_stringLocalizerForTable:(id)a3;
- (id)boundIconsDictionary;
- (id)bundleType;
- (id)correspondingApplicationExtensionRecord;
- (id)dataContainerURL;
- (id)description;
- (id)groupContainerURLs;
- (id)iconDataForVariant:(int)a3 withOptions:(int)a4;
- (id)objectForInfoDictionaryKey:(id)a3 ofClass:(Class)a4 inScope:(unint64_t)a5;
- (id)signerIdentity;
- (id)signerOrganization;
- (unint64_t)compatibilityState;
- (void)detach;
- (void)encodeWithCoder:(id)a3;
- (void)extensionPoint;
@end

@implementation LSPlugInKitProxy

+ (id)plugInKitProxyForPlugin:(unsigned int)a3 withContext:(LSContext *)a4
{
  return (id)[objc_alloc((Class)a1) _initWithPlugin:*(void *)&a3 andContext:a4 applicationExtensionRecord:0 resolveAndDetach:1];
}

+ (id)plugInKitProxyForPlugin:(unsigned int)a3 withContext:(LSContext *)a4 applicationExtensionRecord:(id)a5 resolveAndDetach:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v8 = *(void *)&a3;
  id v10 = a5;
  v11 = (void *)[objc_alloc((Class)a1) _initWithPlugin:v8 andContext:a4 applicationExtensionRecord:v10 resolveAndDetach:v6];

  return v11;
}

+ (id)pluginKitProxyForUUID:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  uint64_t v11 = 0LL;
  v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  v14 = __Block_byref_object_copy__29;
  v15 = __Block_byref_object_dispose__29;
  id v16 = 0LL;
  v4 = +[LSPlugInQuery pluginQueryWithUUID:](&OBJC_CLASS___LSPlugInQuery, "pluginQueryWithUUID:", v3);
  v5 = +[_LSQueryContext defaultContext](&OBJC_CLASS____LSQueryContext, "defaultContext");
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __42__LSPlugInKitProxy_pluginKitProxyForUUID___block_invoke;
  v10[3] = &unk_189D723E0;
  v10[4] = &v11;
  [v5 enumerateResolvedResultsOfQuery:v4 withBlock:v10];

  BOOL v6 = (void *)v12[5];
  if (!v6)
  {
    _LSDefaultLog();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v3;
      _os_log_impl(&dword_183E58000, v7, OS_LOG_TYPE_DEFAULT, "Failed to find plugin with UUID %@", buf, 0xCu);
    }

    BOOL v6 = (void *)v12[5];
  }

  id v8 = v6;

  _Block_object_dispose(&v11, 8);
  return v8;
}

void __42__LSPlugInKitProxy_pluginKitProxyForUUID___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v10 = a2;
  id v8 = a3;
  v9 = (void *)MEMORY[0x186E2A59C]();
  if (v10)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
    *a4 = 1;
  }

  objc_autoreleasePoolPop(v9);
}

+ (id)pluginKitProxyForIdentifier:(id)a3
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  uint64_t v23 = 0LL;
  v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  v26 = __Block_byref_object_copy__29;
  v27 = __Block_byref_object_dispose__29;
  [MEMORY[0x189603FA8] arrayWithCapacity:0];
  id v28 = (id)objc_claimAutoreleasedReturnValue();
  v4 = +[LSPlugInQuery pluginQueryWithIdentifier:](&OBJC_CLASS___LSPlugInQuery, "pluginQueryWithIdentifier:", v3);
  v5 = +[_LSQueryContext defaultContext](&OBJC_CLASS____LSQueryContext, "defaultContext");
  v22[0] = MEMORY[0x1895F87A8];
  v22[1] = 3221225472LL;
  v22[2] = __48__LSPlugInKitProxy_pluginKitProxyForIdentifier___block_invoke;
  v22[3] = &unk_189D723E0;
  v22[4] = &v23;
  [v5 enumerateResolvedResultsOfQuery:v4 withBlock:v22];

  uint64_t v6 = [(id)v24[5] count];
  v7 = (void *)v24[5];
  if (v6 == 1)
  {
    [v7 objectAtIndexedSubscript:0];
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }

  else if ((unint64_t)[v7 count] < 2)
  {
    id v8 = 0LL;
  }

  else
  {
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    id v9 = (id)v24[5];
    id v8 = 0LL;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v29 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v19;
LABEL_6:
      uint64_t v12 = 0LL;
      uint64_t v13 = v8;
      while (1)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v9);
        }
        id v8 = *(id *)(*((void *)&v18 + 1) + 8 * v12);

        objc_msgSend(v8, "pluginIdentifier", (void)v18);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 originalIdentifier];
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        char v16 = [v14 isEqualToString:v15];

        if ((v16 & 1) == 0) {
          break;
        }
        ++v12;
        uint64_t v13 = v8;
        if (v10 == v12)
        {
          uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v29 count:16];
          if (v10) {
            goto LABEL_6;
          }
          goto LABEL_12;
        }
      }
    }

    else
    {
LABEL_12:

      [(id)v24[5] objectAtIndexedSubscript:0];
      id v9 = v8;
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  _Block_object_dispose(&v23, 8);
  return v8;
}

void __48__LSPlugInKitProxy_pluginKitProxyForIdentifier___block_invoke( uint64_t a1,  void *a2,  uint64_t a3,  _BYTE *a4)
{
  id v6 = a2;
  if (v6)
  {
    uint64_t v10 = v6;
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v6];
    [v10 pluginIdentifier];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 originalIdentifier];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    char v9 = [v7 isEqualToString:v8];

    id v6 = v10;
    if ((v9 & 1) == 0) {
      *a4 = 1;
    }
  }
}

+ (id)pluginKitProxyForURL:(id)a3
{
  id v3 = a3;
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000LL;
  uint64_t v13 = __Block_byref_object_copy__29;
  v14 = __Block_byref_object_dispose__29;
  id v15 = 0LL;
  CFErrorRef v4 = _LSCreateResolvedURL(v3);
  v5 = +[LSPlugInQuery pluginQueryWithURL:](&OBJC_CLASS___LSPlugInQuery, "pluginQueryWithURL:", v4);
  +[_LSQueryContext defaultContext](&OBJC_CLASS____LSQueryContext, "defaultContext");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __41__LSPlugInKitProxy_pluginKitProxyForURL___block_invoke;
  v9[3] = &unk_189D723E0;
  v9[4] = &v10;
  [v6 enumerateResolvedResultsOfQuery:v5 withBlock:v9];

  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __41__LSPlugInKitProxy_pluginKitProxyForURL___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v14 = a2;
  id v8 = a3;
  char v9 = (void *)MEMORY[0x186E2A59C]();
  if (v14)
  {
    id v10 = v14;
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8LL);
    uint64_t v13 = *(void *)(v11 + 40);
    uint64_t v12 = (id *)(v11 + 40);
    if (!v13)
    {
      objc_storeStrong(v12, a2);
      *a4 = 1;
    }
  }

  objc_autoreleasePoolPop(v9);
}

+ (id)plugInKitProxyForUUID:(id)a3 bundleIdentifier:(id)a4 pluginIdentifier:(id)a5 effectiveIdentifier:(id)a6 version:(id)a7 bundleURL:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  __int128 v20 = (void *)[objc_alloc((Class)a1) _initWithUUID:v19 bundleIdentifier:v18 pluginIdentifier:v17 effectiveIdentifier:v16 version:v15 bundleURL:v14];

  return v20;
}

- (id)_initWithPlugin:(unsigned int)a3 andContext:(LSContext *)a4 applicationExtensionRecord:(id)a5 resolveAndDetach:(BOOL)a6
{
  BOOL v41 = a6;
  uint64_t v7 = *(void *)&a3;
  uint64_t v68 = *MEMORY[0x1895F89C0];
  id v46 = a5;
  uint64_t v60 = 0LL;
  v61 = &v60;
  uint64_t v62 = 0x3032000000LL;
  v63 = __Block_byref_object_copy__29;
  v64 = __Block_byref_object_dispose__29;
  id v65 = 0LL;
  id v8 = (int *)_LSGetPlugin((uint64_t)a4->db, v7);
  uint64_t v9 = (uint64_t)v8;
  if (!v8) {
    goto LABEL_33;
  }
  if (*v8)
  {
    id v10 = _LSAliasCopyResolvedNode(a4->db, *v8, 0LL, 0LL, 0LL);
    uint64_t v11 = v10;
    if (v10)
    {
      [v10 URL];
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_6;
    }

void __91__LSPlugInKitProxy__initWithPlugin_andContext_applicationExtensionRecord_resolveAndDetach___block_invoke( uint64_t a1,  uint64_t a2,  int a3,  _BYTE *a4)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (a3)
  {
    v5 = (void *)_CSStringCopyCFString();
    if (v5)
    {
      id v6 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDString:v5];
      if (v6)
      {
        uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
        if (!v7)
        {
          uint64_t v8 = [MEMORY[0x189603FA8] array];
          uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8LL);
          id v10 = *(void **)(v9 + 40);
          *(void *)(v9 + 40) = v8;

          uint64_t v7 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
        }

        [v7 addObject:v6];
      }

      else
      {
        _LSDefaultLog();
        uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v12 = *(void *)(a1 + 32);
          int v13 = 138412546;
          uint64_t v14 = v12;
          __int16 v15 = 2112;
          id v16 = v5;
          _os_log_impl( &dword_183E58000,  v11,  OS_LOG_TYPE_DEFAULT,  "Launch Services: Failed to create a UUID for %@ from invalid string %@",  (uint8_t *)&v13,  0x16u);
        }
      }
    }
  }

  else
  {
    *a4 = 1;
  }

- (id)_initWithUUID:(id)a3 bundleIdentifier:(id)a4 pluginIdentifier:(id)a5 effectiveIdentifier:(id)a6 version:(id)a7 bundleURL:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___LSPlugInKitProxy;
  id v18 = -[LSBundleProxy _initWithBundleUnit:context:bundleType:bundleID:localizedName:bundleContainerURL:dataContainerURL:resourcesDirectoryURL:iconsDictionary:iconFileNames:version:]( &v32,  sel__initWithBundleUnit_context_bundleType_bundleID_localizedName_bundleContainerURL_dataContainerURL_resourcesDirectoryURL_iconsDictionary_iconFileNames_version_,  0LL,  0LL,  6LL,  a4,  0LL,  0LL,  0LL,  v17,  0LL,  0LL,  a7);
  if (v18)
  {
    id v19 = v16 ? v16 : v15;
    uint64_t v20 = [v19 copy];
    __int128 v21 = (void *)v18[22];
    v18[22] = v20;

    uint64_t v22 = [v15 copy];
    uint64_t v23 = (void *)v18[23];
    v18[23] = v22;

    uint64_t v24 = [v14 copy];
    id v25 = (void *)v18[25];
    v18[25] = v24;

    *((_BYTE *)v18 + 168) = 1;
    if (v17)
    {
      v26 = -[FSNode initWithURL:flags:error:]( objc_alloc(&OBJC_CLASS___FSNode),  "initWithURL:flags:error:",  v17,  0LL,  0LL);
      v27 = v26;
      if (v26)
      {
        -[FSNode volumeNodeWithFlags:error:](v26, "volumeNodeWithFlags:error:", 0LL, 0LL);
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (v28)
        {
          v29 = +[FSNode rootVolumeNode](&OBJC_CLASS___FSNode, "rootVolumeNode");
          int v30 = [v28 isEqual:v29];

          if (v30) {
            *((_BYTE *)v18 + 168) = 1;
          }
        }
      }
    }
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LSPlugInKitProxy)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___LSPlugInKitProxy;
  v5 = -[LSBundleProxy initWithCoder:](&v23, sel_initWithCoder_, v4);
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"pluginIdentifier");
    pluginIdentifier = v5->_pluginIdentifier;
    v5->_pluginIdentifier = (NSString *)v6;

    uint64_t v8 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"originalIdentifier");
    originalIdentifier = v5->_originalIdentifier;
    v5->_originalIdentifier = (NSString *)v8;

    uint64_t v10 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"protocol");
    protocol = v5->_protocol;
    v5->_protocol = (NSString *)v10;

    uint64_t v12 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"extensionPointID");
    extensionPointID = v5->_extensionPointID;
    v5->_extensionPointID = (NSString *)v12;

    v5->_platform = [v4 decodeInt32ForKey:@"platform"];
    uint64_t v14 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"pluginUUID");
    pluginUUID = v5->_pluginUUID;
    v5->_pluginUUID = (NSUUID *)v14;

    uint64_t v16 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"registrationDate");
    registrationDate = v5->_registrationDate;
    v5->_registrationDate = (NSDate *)v16;

    uint64_t v18 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"containingBundle");
    containingBundle = v5->_containingBundle;
    v5->_containingBundle = (LSBundleProxy *)v18;

    v5->_onSystemPartition = [v4 decodeBoolForKey:@"isOnSystemPartition"];
    uint64_t v20 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"appexRecord");
    appexRecord = v5->_appexRecord;
    v5->_appexRecord = (LSApplicationExtensionRecord *)v20;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___LSPlugInKitProxy;
  id v4 = a3;
  -[LSBundleProxy encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend( v4,  "encodeObject:forKey:",  self->_pluginIdentifier,  @"pluginIdentifier",  v5.receiver,  v5.super_class);
  [v4 encodeObject:self->_originalIdentifier forKey:@"originalIdentifier"];
  [v4 encodeObject:self->_protocol forKey:@"protocol"];
  [v4 encodeObject:self->_extensionPointID forKey:@"extensionPointID"];
  [v4 encodeInt32:self->_platform forKey:@"platform"];
  [v4 encodeObject:self->_pluginUUID forKey:@"pluginUUID"];
  [v4 encodeObject:self->_registrationDate forKey:@"registrationDate"];
  [v4 encodeObject:self->_containingBundle forKey:@"containingBundle"];
  [v4 encodeBool:self->_onSystemPartition forKey:@"isOnSystemPartition"];
  [v4 encodeObject:self->_appexRecord forKey:@"appexRecord"];
}

- (id)objectForInfoDictionaryKey:(id)a3 ofClass:(Class)a4 inScope:(unint64_t)a5
{
  id v8 = a3;
  uint64_t v9 = (void *)MEMORY[0x186E2A59C]();
  -[LSBundleProxy _infoDictionary](self, "_infoDictionary");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = 0LL;
  if (a5 == 2)
  {
    uint64_t v12 = 0LL;
    goto LABEL_8;
  }

  if (a5 == 1)
  {
    [v10 objectForKey:@"NSExtension" ofClass:objc_opt_class()];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 objectForKey:v8];
    int v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = 0LL;
    if (!a4) {
      goto LABEL_13;
    }
    goto LABEL_10;
  }

  uint64_t v12 = 0LL;
  int v13 = 0LL;
  if (a5) {
    goto LABEL_13;
  }
  [v10 objectForKey:@"NSExtension" ofClass:objc_opt_class()];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 objectForKeyedSubscript:@"NSExtensionAttributes"];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 objectForKey:v8];
  int v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
LABEL_8:
    [v10 objectForKey:v8 ofClass:a4];
    int v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }

  if (!a4) {
    goto LABEL_13;
  }
LABEL_10:
  if (v13 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    int v13 = 0LL;
  }

- (NSNumber)platform
{
  if (self->_platform)
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v2 = 0LL;
  }

  return (NSNumber *)v2;
}

- (unint64_t)compatibilityState
{
  return -[LSBundleProxy compatibilityState](self->_containingBundle, "compatibilityState");
}

- (NSDictionary)pluginKitDictionary
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKey:@"NSExtension" ofClass:objc_opt_class()];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSDictionary)infoPlist
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LSLazyPropertyList propertyList](v2);
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (BOOL)pluginCanProvideIcon
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  char v4 = [v3 isEqualToString:&stru_189D7B4C8];

  if ((v4 & 1) != 0) {
    return 1;
  }
  -[LSPlugInKitProxy containingBundle](self, "containingBundle");
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 bundleIdentifier];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  char v7 = [v6 isEqualToString:@"com.apple.share"];

  if ((v7 & 1) != 0) {
    return 1;
  }
  -[LSPlugInKitProxy containingBundle](self, "containingBundle");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v8 = v9 == 0LL;

  return v8;
}

- (LSExtensionPoint)extensionPoint
{
  extensionPointID = self->_extensionPointID;
  if (extensionPointID)
  {
    char v4 = extensionPointID;
LABEL_4:
    -[LSPlugInKitProxy platform](self, "platform");
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 unsignedLongValue];

    [MEMORY[0x189607968] numberWithUnsignedInt:v6];
    char v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[LSExtensionPoint extensionPointForIdentifier:platform:]( &OBJC_CLASS___LSExtensionPoint,  "extensionPointForIdentifier:platform:",  v4,  v7);
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_5;
  }

  -[LSPlugInKitProxy protocol](self, "protocol");
  char v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (v4) {
    goto LABEL_4;
  }
  _LSDefaultLog();
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[LSPlugInKitProxy extensionPoint].cold.1((uint64_t)self, v10);
  }

  char v4 = 0LL;
  BOOL v8 = 0LL;
LABEL_5:

  return (LSExtensionPoint *)v8;
}

- (id)boundIconsDictionary
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKey:@"CFBundleIcons" ofClass:objc_opt_class()];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)iconDataForVariant:(int)a3 withOptions:(int)a4
{
  return 0LL;
}

- (id)bundleType
{
  return @"PluginKitPlugin";
}

- (BOOL)profileValidated
{
  return -[LSBundleRecord isProfileValidated](self->_appexRecord, "isProfileValidated");
}

- (BOOL)UPPValidated
{
  return -[LSBundleRecord isUPPValidated](self->_appexRecord, "isUPPValidated");
}

- (BOOL)freeProfileValidated
{
  return -[LSBundleRecord isFreeProfileValidated](self->_appexRecord, "isFreeProfileValidated");
}

- (id)signerOrganization
{
  return -[LSBundleRecord signerOrganization](self->_appexRecord, "signerOrganization");
}

- (id)signerIdentity
{
  return -[LSBundleRecord signerIdentity](self->_appexRecord, "signerIdentity");
}

- (id)_stringLocalizerForTable:(id)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  appexRecord = self->_appexRecord;
  id v5 = a3;
  uint64_t v6 = -[LSBundleRecord platform](appexRecord, "platform");
  -[LSBundleRecord SDKVersion](self->_appexRecord, "SDKVersion");
  char v7 = (void *)objc_claimAutoreleasedReturnValue();
  _LSVersionNumberMakeWithString(v14, v7);
  uint64_t v8 = _LSMakeDYLDVersionFromVersionNumber(v14);

  BOOL v9 = +[_LSStringLocalizer useLegacyLocalizationListForPlatform:sdkVersion:]( &OBJC_CLASS____LSStringLocalizer,  "useLegacyLocalizationListForPlatform:sdkVersion:",  v6,  v8);
  uint64_t v10 = objc_alloc(&OBJC_CLASS____LSStringLocalizer);
  -[LSBundleProxy bundleURL](self, "bundleURL");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = -[_LSStringLocalizer initWithBundleURL:stringsFile:legacyLocalizationList:]( v10,  "initWithBundleURL:stringsFile:legacyLocalizationList:",  v11,  v5,  v9);

  return v12;
}

- (NSString)teamID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [v2 teamID];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v3 = 0LL;
  }

  return (NSString *)v3;
}

- (id)description
{
  id v3 = (void *)NSString;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___LSPlugInKitProxy;
  -[LSPlugInKitProxy description](&v11, sel_description);
  char v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LSPlugInKitProxy pluginIdentifier](self, "pluginIdentifier");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LSPlugInKitProxy pluginUUID](self, "pluginUUID");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 UUIDString];
  char v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LSBundleProxy bundleVersion](self, "bundleVersion");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"%@ pluginID=%@ UUID=%@ version=%@", v4, v5, v7, v8];
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_managedPersonas
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 _managedPersonas];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_usesSystemPersona
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  char v3 = [v2 _usesSystemPersona];

  return v3;
}

- (id)dataContainerURL
{
  return -[LSBundleRecord dataContainerURL](self->_appexRecord, "dataContainerURL");
}

- (id)groupContainerURLs
{
  return -[LSBundleRecord groupContainerURLs](self->_appexRecord, "groupContainerURLs");
}

- (void)detach
{
}

- (NSString)pluginIdentifier
{
  return self->_pluginIdentifier;
}

- (NSString)originalIdentifier
{
  return self->_originalIdentifier;
}

- (NSString)protocol
{
  return self->_protocol;
}

- (NSUUID)pluginUUID
{
  return self->_pluginUUID;
}

- (NSDate)registrationDate
{
  return self->_registrationDate;
}

- (LSBundleProxy)containingBundle
{
  return self->_containingBundle;
}

- (BOOL)isOnSystemPartition
{
  return self->_onSystemPartition;
}

- (void).cxx_destruct
{
}

- (id)_localizedNameWithPreferredLocalizations:(id)a3 useShortNameOnly:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  appexRecord = self->_appexRecord;
  if (v4)
  {
    if (v6) {
      -[LSBundleRecord localizedShortNameWithPreferredLocalizations:]( appexRecord,  "localizedShortNameWithPreferredLocalizations:",  v6);
    }
    else {
      -[LSBundleRecord localizedShortName](appexRecord, "localizedShortName");
    }
  }

  else if (v6)
  {
    -[LSBundleRecord localizedNameWithPreferredLocalizations:]( appexRecord,  "localizedNameWithPreferredLocalizations:",  v6);
  }

  else
  {
    -[LSBundleRecord localizedName](appexRecord, "localizedName");
  }
  uint64_t v8 = ;
  BOOL v9 = (void *)v8;

  return v9;
}

+ (id)containingBundleIdentifiersForPlugInBundleIdentifiers:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  uint64_t v22 = __Block_byref_object_copy__29;
  objc_super v23 = __Block_byref_object_dispose__29;
  id v24 = 0LL;
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  uint64_t v16 = __Block_byref_object_copy__29;
  id v17 = __Block_byref_object_dispose__29;
  id v18 = 0LL;
  uint64_t v6 = MEMORY[0x1895F87A8];
  v12[0] = (void (*)(void, void))MEMORY[0x1895F87A8];
  v12[1] = (void (*)(void, void))3221225472LL;
  v12[2] = (void (*)(void, void))__108__LSPlugInKitProxy_ContainingBundleIdentifier__containingBundleIdentifiersForPlugInBundleIdentifiers_error___block_invoke;
  v12[3] = (void (*)(void, void))&unk_189D731E8;
  v12[4] = (void (*)(void, void))&v13;
  +[_LSDService synchronousXPCProxyWithErrorHandler:]((uint64_t)&OBJC_CLASS____LSDReadService, v12);
  char v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472LL;
  v11[2] = __108__LSPlugInKitProxy_ContainingBundleIdentifier__containingBundleIdentifiersForPlugInBundleIdentifiers_error___block_invoke_2;
  v11[3] = &unk_189D73380;
  v11[4] = &v19;
  v11[5] = &v13;
  [v7 mapPlugInBundleIdentifiersToContainingBundleIdentifiers:v5 completionHandler:v11];
  uint64_t v8 = (void *)v20[5];
  if (a4 && !v8)
  {
    *a4 = (id) v14[5];
    uint64_t v8 = (void *)v20[5];
  }

  id v9 = v8;

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

void __108__LSPlugInKitProxy_ContainingBundleIdentifier__containingBundleIdentifiersForPlugInBundleIdentifiers_error___block_invoke( uint64_t a1,  void *a2)
{
}

void __108__LSPlugInKitProxy_ContainingBundleIdentifier__containingBundleIdentifiersForPlugInBundleIdentifiers_error___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)correspondingApplicationExtensionRecord
{
  return self->_appexRecord;
}

- (void)extensionPoint
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( &dword_183E58000,  a2,  OS_LOG_TYPE_ERROR,  "Failed to get the extension point ID of plugin %@",  (uint8_t *)&v2,  0xCu);
}

@end