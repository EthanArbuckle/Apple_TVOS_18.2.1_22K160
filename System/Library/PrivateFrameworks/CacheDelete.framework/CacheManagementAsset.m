@interface CacheManagementAsset
+ (id)assetFromData:(id)a3;
+ (id)assetFromFile:(id)a3 withIdentifier:(id)a4;
+ (id)assetFromPath:(id)a3 withIdentifier:(id)a4;
+ (id)assetFromPath:(id)a3 withIdentifier:(id)a4 createIfAbsent:(BOOL)a5;
+ (id)assetWithRelativePath:(id)a3 identifier:(id)a4 expirationDate:(id)a5 contentType:(id)a6 metadata:(id)a7 priority:(int)a8;
- ($62504CD8620D4E4BE208444870B73508)createFlattenedAsset:(int64_t *)a3;
- (CacheManagementAsset)initWithCoder:(id)a3;
- (CacheManagementAsset)initWithFlattenedAsset:(id *)a3;
- (CacheManagementAsset)initWithRelativePath:(id)a3 identifier:(id)a4 expirationDate:(id)a5 contentType:(id)a6 metadata:(id)a7 priority:(int)a8;
- (NSData)metadata;
- (NSString)absolutePath;
- (NSString)contentType;
- (NSString)displayName;
- (NSString)identifier;
- (NSString)relativePath;
- (double)consumed_date;
- (double)download_completion_date;
- (double)download_start_date;
- (double)expiration_date;
- (double)last_viewed_date;
- (id)consumedDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)downloadCompletionDate;
- (id)downloadStartDate;
- (id)expirationDate;
- (id)fullPath;
- (id)lastViewedDate;
- (int)priority;
- (int)purgeabilityScoreAtUrgency:(int)a3;
- (int64_t)size;
- (int64_t)sizeCached:(BOOL)a3;
- (unsigned)assetVersion;
- (void)commit;
- (void)encodeWithCoder:(id)a3;
- (void)setAbsolutePath:(id)a3;
- (void)setConsumedDate:(id)a3;
- (void)setConsumed_date:(double)a3;
- (void)setContentType:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setDownloadCompletionDate:(id)a3;
- (void)setDownloadStartDate:(id)a3;
- (void)setDownload_completion_date:(double)a3;
- (void)setDownload_start_date:(double)a3;
- (void)setExpirationDate:(id)a3;
- (void)setExpiration_date:(double)a3;
- (void)setLastViewedDate:(id)a3;
- (void)setLast_viewed_date:(double)a3;
- (void)setMetadata:(id)a3;
- (void)setPriority:(int)a3;
- (void)setRelativePath:(id)a3;
@end

@implementation CacheManagementAsset

- (CacheManagementAsset)initWithRelativePath:(id)a3 identifier:(id)a4 expirationDate:(id)a5 contentType:(id)a6 metadata:(id)a7 priority:(int)a8
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v15 = a3;
  id v25 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if (v15 && [v15 length])
  {
    v26.receiver = self;
    v26.super_class = (Class)&OBJC_CLASS___CacheManagementAsset;
    v19 = -[CacheManagementAsset init](&v26, sel_init);
    v20 = v19;
    if (v19)
    {
      v19->_assetVersion = 2;
      if (v16) {
        [v16 timeIntervalSinceReferenceDate];
      }
      else {
        double v21 = nan("");
      }
      v20->_expiration_date = v21;
      objc_storeStrong((id *)&v20->_contentType, a6);
      objc_storeStrong((id *)&v20->_metadata, a7);
      v20->_priority = a8;
      objc_storeStrong((id *)&v20->_relativePath, a3);
      objc_storeStrong((id *)&v20->_identifier, a4);
      v20->_consumed_date = nan("");
      v20->_download_start_date = nan("");
      v20->_download_completion_date = nan("");
      v20->_last_viewed_date = nan("");
    }

    self = v20;
    v23 = self;
  }

  else
  {
    CDGetLogHandle((uint64_t)"client");
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v15;
      _os_log_error_impl(&dword_1874E4000, v22, OS_LOG_TYPE_ERROR, "parameter error relativePath: %@", buf, 0xCu);
    }

    v23 = 0LL;
  }

  return v23;
}

- (CacheManagementAsset)initWithFlattenedAsset:(id *)a3
{
  uint64_t v57 = *MEMORY[0x1895F89C0];
  v48.receiver = self;
  v48.super_class = (Class)&OBJC_CLASS___CacheManagementAsset;
  v4 = -[CacheManagementAsset init](&v48, sel_init);
  if (!v4) {
    goto LABEL_52;
  }
  if (!a3)
  {
    CDGetLogHandle((uint64_t)"client");
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v37 = "Parameter error, asset is NULL";
LABEL_37:
      v38 = v12;
      uint32_t v39 = 2;
      goto LABEL_38;
    }

    goto LABEL_15;
  }

  if ((*(int64_t *)((_BYTE *)&a3->var10 + 1) & 0x8000000000000000LL) == 0
    && (*(int64_t *)((_BYTE *)&a3->var9 + 1) & 0x8000000000000000LL) == 0
    && (*(int64_t *)((_BYTE *)&a3->var8 + 1) & 0x8000000000000000LL) == 0
    && (*(void *)((_BYTE *)&a3->var6 + 1) & 0x8000000000000000LL) == 0)
  {
    CDGetLogHandle((uint64_t)"client");
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      flattenedAssetDescription(&a3->var0);
      v6 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v50 = v6;
      _os_log_impl(&dword_1874E4000, v5, OS_LOG_TYPE_DEFAULT, "initWithFlattenedAsset: %@", buf, 0xCu);
    }

    v4->_assetVersion = a3->var0;
    v4->_expiration_date = *(double *)(&a3->var0 + 1);
    v4->_consumed_date = *(double *)((char *)&a3->var1 + 4);
    v4->_download_start_date = *(double *)((char *)&a3->var2 + 4);
    v4->_download_completion_date = *(double *)((char *)&a3->var3 + 4);
    v4->_last_viewed_date = *(double *)((char *)&a3->var4 + 4);
    v4->_priority = HIDWORD(a3->var5);
    if (*(uint64_t *)((char *)&a3->var6 + 1) < 1)
    {
      int v10 = 0;
    }

    else
    {
      v7 = (char *)&a3->var12 + 1;
      uint64_t v8 = [NSString stringWithCString:(char *)&a3->var12 + 1 encoding:4];
      identifier = v4->_identifier;
      v4->_identifier = (NSString *)v8;

      if (!v4->_identifier)
      {
        CDGetLogHandle((uint64_t)"client");
        v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v50 = v7;
          v37 = "stringWithCString failed for %s";
          v38 = v12;
          uint32_t v39 = 12;
LABEL_38:
          _os_log_error_impl(&dword_1874E4000, v38, OS_LOG_TYPE_ERROR, v37, buf, v39);
          goto LABEL_15;
        }

        goto LABEL_15;
      }

      int v10 = *(int *)((char *)&a3->var6 + 1);
    }

    if (*(uint64_t *)((char *)&a3->var8 + 1) >= 1)
    {
      v14 = (char *)&a3->var12 + v10 + 1;
      uint64_t v15 = [NSString stringWithCString:v14 encoding:4];
      relativePath = v4->_relativePath;
      v4->_relativePath = (NSString *)v15;

      if (!v4->_relativePath)
      {
        CDGetLogHandle((uint64_t)"client");
        v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          goto LABEL_15;
        }
        v40 = __error();
        v41 = strerror(*v40);
        *(_DWORD *)buf = 136315394;
        v50 = v14;
        __int16 v51 = 2080;
        v52 = v41;
        v37 = "stringWithCString failed for %s : %s";
        v38 = v12;
        uint32_t v39 = 22;
        goto LABEL_38;
      }

      v10 += *(_DWORD *)((char *)&a3->var8 + 1);
    }

    if (*(uint64_t *)((char *)&a3->var9 + 1) >= 1)
    {
      id v17 = (char *)&a3->var12 + v10 + 1;
      uint64_t v18 = [NSString stringWithCString:v17 encoding:4];
      contentType = v4->_contentType;
      v4->_contentType = (NSString *)v18;

      if (!v4->_contentType)
      {
        CDGetLogHandle((uint64_t)"client");
        v42 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          v46 = *(char **)((char *)&a3->var9 + 1);
          *(_DWORD *)buf = 134218242;
          v50 = v46;
          __int16 v51 = 2080;
          v52 = v17;
          _os_log_error_impl( &dword_1874E4000,  v42,  OS_LOG_TYPE_ERROR,  "stringWithCString failed for content type: [len: %zd] %s",  buf,  0x16u);
        }

        goto LABEL_16;
      }

      v10 += *(_DWORD *)((char *)&a3->var9 + 1);
    }

    uint64_t v20 = objc_msgSend(MEMORY[0x189603F48], "dataWithBytes:length:", (char *)&a3->var12 + v10 + 1);
    metadata = v4->_metadata;
    v4->_metadata = (NSData *)v20;

    if (v4->_metadata)
    {
      v10 += *(_DWORD *)((char *)&a3->var10 + 1);
LABEL_27:
      if (*(uint64_t *)((char *)&a3->var11 + 1) < 1
        || (v22 = (char *)&a3->var12 + v10 + 1,
            [NSString stringWithCString:v22 encoding:4],
            uint64_t v23 = objc_claimAutoreleasedReturnValue(),
            displayName = v4->_displayName,
            v4->_displayName = (NSString *)v23,
            displayName,
            v4->_displayName))
      {
        -[CacheManagementAsset fullPath](v4, "fullPath");
        id v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_super v26 = v25;
        if (v25)
        {
          id v27 = v25;
          if ([v27 fileSystemRepresentation])
          {
            uint64_t v28 = objc_msgSend( NSString, "stringWithUTF8String:", objc_msgSend(v27, "fileSystemRepresentation"));
            absolutePath = v4->_absolutePath;
            v4->_absolutePath = (NSString *)v28;
LABEL_51:

LABEL_52:
            v13 = v4;
            goto LABEL_53;
          }

          CDGetLogHandle((uint64_t)"client");
          absolutePath = (void *)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled((os_log_t)absolutePath, OS_LOG_TYPE_ERROR)) {
            goto LABEL_51;
          }
          v47 = v4->_relativePath;
          *(_DWORD *)buf = 138412290;
          v50 = (char *)v47;
          v44 = "Unable to get absolute path (fileSystemRepresentation) for %@";
        }

        else
        {
          CDGetLogHandle((uint64_t)"client");
          absolutePath = (void *)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled((os_log_t)absolutePath, OS_LOG_TYPE_ERROR)) {
            goto LABEL_51;
          }
          v43 = v4->_relativePath;
          *(_DWORD *)buf = 138412290;
          v50 = (char *)v43;
          v44 = "Unable to get absolute path (NSURL) for %@";
        }

        _os_log_error_impl(&dword_1874E4000, (os_log_t)absolutePath, OS_LOG_TYPE_ERROR, v44, buf, 0xCu);
        goto LABEL_51;
      }

      CDGetLogHandle((uint64_t)"client");
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        goto LABEL_13;
      }
      *(_DWORD *)buf = 136315138;
      v50 = v22;
      v34 = "stringWithCString failed for display name: %s";
      v35 = v11;
      uint32_t v36 = 12;
      goto LABEL_33;
    }

    CDGetLogHandle((uint64_t)"client");
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v37 = "dataWithBytes failed for metadata";
      goto LABEL_37;
    }

- ($62504CD8620D4E4BE208444870B73508)createFlattenedAsset:(int64_t *)a3
{
  uint64_t v55 = *MEMORY[0x1895F89C0];
  CDGetLogHandle((uint64_t)"client");
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    -[CacheManagementAsset description](self, "description");
    objc_super v48 = (void *)objc_claimAutoreleasedReturnValue();
    int v53 = 138412290;
    uint64_t v54 = (uint64_t)v48;
    _os_log_debug_impl(&dword_1874E4000, v5, OS_LOG_TYPE_DEBUG, "flattening %@", (uint8_t *)&v53, 0xCu);
  }
  v6 = -[CacheManagementAsset identifier](self, "identifier");
  if (v6)
  {
    v7 = -[CacheManagementAsset identifier](self, "identifier");
    uint64_t v8 = [v7 maximumLengthOfBytesUsingEncoding:4];

    if (v8 <= -2)
    {
      CDGetLogHandle((uint64_t)"client");
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v53 = 134217984;
        uint64_t v54 = 0LL;
        int v10 = "identifier is too long: %ld";
LABEL_61:
        _os_log_error_impl(&dword_1874E4000, v9, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v53, 0xCu);
        goto LABEL_62;
      }

      goto LABEL_62;
    }

    uint64_t v11 = v8 + 1;
    size_t v12 = v8 + 90;
  }

  else
  {
    uint64_t v11 = 0LL;
    size_t v12 = 89LL;
  }
  v13 = -[CacheManagementAsset relativePath](self, "relativePath");
  if (v13)
  {
    id v14 = -[CacheManagementAsset relativePath](self, "relativePath");
    int64_t v15 = strlen((const char *)[v14 fileSystemRepresentation]);
    uint64_t v16 = v15 + 1;

    if (v15 <= -2)
    {
      CDGetLogHandle((uint64_t)"client");
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v53 = 134217984;
        uint64_t v54 = v15 + 1;
        int v10 = "relative_path_len too long: %ld";
        goto LABEL_61;
      }

+ (id)assetWithRelativePath:(id)a3 identifier:(id)a4 expirationDate:(id)a5 contentType:(id)a6 metadata:(id)a7 priority:(int)a8
{
  uint64_t v8 = *(void *)&a8;
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (!v13 || ![v13 length])
  {
    CDGetLogHandle((uint64_t)"client");
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v13;
      _os_log_error_impl(&dword_1874E4000, v18, OS_LOG_TYPE_ERROR, "parameter error relativePath: %@", buf, 0xCu);
    }

    goto LABEL_7;
  }

  stripScheme(v13);
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    uint64_t v21 = fullPathToAsset(v13, v14);
    if (v21)
    {
      v22 = (void *)v21;
      bzero(buf, 0x400uLL);
      id v23 = v22;
      if (realpath_DARWIN_EXTSN((const char *)[v23 fileSystemRepresentation], (char *)buf))
      {

        goto LABEL_4;
      }

      CDGetLogHandle((uint64_t)"client");
      v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        uint64_t v25 = [v23 fileSystemRepresentation];
        uint64_t v26 = __error();
        uint64_t v27 = strerror(*v26);
        int v28 = 136446466;
        uint64_t v29 = v25;
        __int16 v30 = 2082;
        uint64_t v31 = v27;
        _os_log_error_impl( &dword_1874E4000,  v24,  OS_LOG_TYPE_ERROR,  "realpath failed for %{public}s : %{public}s",  (uint8_t *)&v28,  0x16u);
      }
    }

    uint64_t v18 = 0LL;
LABEL_7:
    uint64_t v19 = 0LL;
    goto LABEL_8;
  }

+ (id)assetFromData:(id)a3
{
  return -[CacheManagementAsset initWithFlattenedAsset:]( [CacheManagementAsset alloc], "initWithFlattenedAsset:", [a3 bytes]);
}

+ (id)assetFromFile:(id)a3 withIdentifier:(id)a4
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = a4;
  CDGetLogHandle((uint64_t)"client");
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v17 = 138412802;
    uint64_t v18 = objc_opt_class();
    __int16 v19 = 2112;
    id v20 = v5;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_debug_impl( &dword_1874E4000,  v7,  OS_LOG_TYPE_DEBUG,  "assetFromFile: (%@) %@ withIdentifier: %@",  (uint8_t *)&v17,  0x20u);
  }

  if (!v5 || ![v5 length])
  {
    CDGetLogHandle((uint64_t)"client");
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v17 = 138543362;
      uint64_t v18 = (uint64_t)v5;
      _os_log_error_impl( &dword_1874E4000,  v9,  OS_LOG_TYPE_ERROR,  "parameter error relativePath: %{public}@",  (uint8_t *)&v17,  0xCu);
    }

+ (id)assetFromPath:(id)a3 withIdentifier:(id)a4 createIfAbsent:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v89 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  if (v7 && [v7 length])
  {
    stripScheme(v7);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    nonContainerForID((uint64_t)v8);
    int v10 = (void *)objc_claimAutoreleasedReturnValue();
    bzero(v87, 0x400uLL);
    if (!v9) {
      id v9 = v7;
    }
    id v11 = v9;
    if (!realpath_DARWIN_EXTSN((const char *)[v11 fileSystemRepresentation], (char *)v87))
    {
      CDGetLogHandle((uint64_t)"client");
      __int16 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        uint64_t v74 = [v11 fileSystemRepresentation];
        v75 = __error();
        v76 = strerror(*v75);
        *(_DWORD *)buf = 136446466;
        *(void *)&uint8_t buf[4] = v74;
        *(_WORD *)&buf[12] = 2082;
        *(void *)v86 = v76;
        _os_log_error_impl( &dword_1874E4000,  v21,  OS_LOG_TYPE_ERROR,  "realpath failed for %{public}s : %{public}s",  buf,  0x16u);
      }

      id v20 = 0LL;
      goto LABEL_85;
    }

    if (v10)
    {
      [NSString stringWithUTF8String:v87];
      size_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      id v13 = (void *)NSString;
      v79 = v10;
      id v14 = v10;
      objc_msgSend(v13, "stringWithUTF8String:", objc_msgSend(v14, "fileSystemRepresentation"));
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 rangeOfString:v15];
      uint64_t v17 = v16;

      if (!v17)
      {
        CDGetLogHandle((uint64_t)"client");
        __int16 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          *(void *)&uint8_t buf[4] = [v14 fileSystemRepresentation];
          *(_WORD *)&buf[12] = 2082;
          *(void *)v86 = v87;
          _os_log_error_impl( &dword_1874E4000,  v21,  OS_LOG_TYPE_ERROR,  "Asset is not in expected location: %{public}s asset: %{public}s",  buf,  0x16u);
        }

        id v20 = 0LL;
        int v10 = v79;
        goto LABEL_85;
      }

      [NSString stringWithUTF8String:v87];
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      [v18 substringFromIndex:v17];
      __int16 v19 = (void *)objc_claimAutoreleasedReturnValue();

      int v10 = v79;
    }

    else
    {
      __int16 v19 = 0LL;
    }

    XAttr = getXAttr((const char *)v87, "com.apple.CacheManagementAsset", 0LL);
    uint64_t v23 = XAttr;
    if (XAttr)
    {
      if (*XAttr == 2)
      {
        v24 = v10;
        uint64_t v25 = -[CacheManagementAsset initWithFlattenedAsset:]( objc_alloc(&OBJC_CLASS___CacheManagementAsset),  "initWithFlattenedAsset:",  XAttr);
        if (v25)
        {
          uint64_t v26 = v25;
          [NSString stringWithUTF8String:v87];
          uint64_t v27 = v23;
          int v28 = (void *)objc_claimAutoreleasedReturnValue();
          [v26 setAbsolutePath:v28];

          uint64_t v29 = v27;
          __int16 v30 = 0LL;
          id v31 = 0LL;
LABEL_83:
          free(v29);
          goto LABEL_84;
        }

        CDGetLogHandle((uint64_t)"client");
        uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446210;
          *(void *)&uint8_t buf[4] = v87;
          _os_log_error_impl( &dword_1874E4000,  v32,  OS_LOG_TYPE_ERROR,  "unable to create asset from file: %{public}s",  buf,  0xCu);
        }

+ (id)assetFromPath:(id)a3 withIdentifier:(id)a4
{
  return (id)[a1 assetFromPath:a3 withIdentifier:a4 createIfAbsent:1];
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CacheManagementAsset initWithFlattenedAsset:]( +[CacheManagementAsset allocWithZone:](&OBJC_CLASS___CacheManagementAsset, "allocWithZone:", a3),  "initWithFlattenedAsset:",  -[CacheManagementAsset createFlattenedAsset:](self, "createFlattenedAsset:", 0LL));
}

- (CacheManagementAsset)initWithCoder:(id)a3
{
  id v4 = a3;
  if (self)
  {
    [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CACHE_MANAGEMENT_ASSET_DATA"];
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      id v7 = 0LL;
      goto LABEL_6;
    }

    id v6 = v5;
    self = -[CacheManagementAsset initWithFlattenedAsset:](self, "initWithFlattenedAsset:", [v6 bytes]);
  }

  self = self;
  id v7 = self;
LABEL_6:

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v7 = 0LL;
  BOOL v5 = -[CacheManagementAsset createFlattenedAsset:](self, "createFlattenedAsset:", &v7);
  if (v5)
  {
    [MEMORY[0x189603F48] dataWithBytes:v5 length:v7];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 encodeObject:v6 forKey:@"CACHE_MANAGEMENT_ASSET_DATA"];
  }
}

- (void)setExpirationDate:(id)a3
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  CDGetLogHandle((uint64_t)"client");
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_debug_impl(&dword_1874E4000, v5, OS_LOG_TYPE_DEBUG, "setExpirationDate: %@", (uint8_t *)&v7, 0xCu);
  }

  if (v4) {
    [v4 timeIntervalSinceReferenceDate];
  }
  else {
    double v6 = nan("");
  }
  -[CacheManagementAsset setExpiration_date:](self, "setExpiration_date:", v6);
}

- (id)expirationDate
{
  v3 = (void *)MEMORY[0x189603F50];
  -[CacheManagementAsset expiration_date](self, "expiration_date");
  objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setConsumedDate:(id)a3
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  CDGetLogHandle((uint64_t)"client");
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_debug_impl(&dword_1874E4000, v5, OS_LOG_TYPE_DEBUG, "setConsumedDate: %@", (uint8_t *)&v7, 0xCu);
  }

  if (v4) {
    [v4 timeIntervalSinceReferenceDate];
  }
  else {
    double v6 = nan("");
  }
  -[CacheManagementAsset setConsumed_date:](self, "setConsumed_date:", v6);
}

- (id)consumedDate
{
  v3 = (void *)MEMORY[0x189603F50];
  -[CacheManagementAsset consumed_date](self, "consumed_date");
  objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setDownloadStartDate:(id)a3
{
  if (a3) {
    [a3 timeIntervalSinceReferenceDate];
  }
  else {
    double v4 = nan("");
  }
  -[CacheManagementAsset setDownload_start_date:](self, "setDownload_start_date:", v4);
}

- (id)downloadStartDate
{
  v3 = (void *)MEMORY[0x189603F50];
  -[CacheManagementAsset download_start_date](self, "download_start_date");
  objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setDownloadCompletionDate:(id)a3
{
  if (a3) {
    [a3 timeIntervalSinceReferenceDate];
  }
  else {
    double v4 = nan("");
  }
  -[CacheManagementAsset setDownload_completion_date:](self, "setDownload_completion_date:", v4);
}

- (id)downloadCompletionDate
{
  v3 = (void *)MEMORY[0x189603F50];
  -[CacheManagementAsset download_completion_date](self, "download_completion_date");
  objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setLastViewedDate:(id)a3
{
  if (a3) {
    [a3 timeIntervalSinceReferenceDate];
  }
  else {
    double v4 = nan("");
  }
  -[CacheManagementAsset setLast_viewed_date:](self, "setLast_viewed_date:", v4);
}

- (id)lastViewedDate
{
  v3 = (void *)MEMORY[0x189603F50];
  -[CacheManagementAsset last_viewed_date](self, "last_viewed_date");
  objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSData)metadata
{
  return self->_metadata;
}

- (id)fullPath
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  v3 = -[CacheManagementAsset absolutePath](self, "absolutePath");
  if (v3)
  {
    id v4 = -[CacheManagementAsset absolutePath]( self,  "absolutePath",  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
    int v5 = stat((const char *)[v4 fileSystemRepresentation], &v17);

    if (!v5)
    {
      id v14 = (void *)MEMORY[0x189604030];
      id v13 = -[CacheManagementAsset absolutePath](self, "absolutePath");
      uint64_t v15 = [v13 fileSystemRepresentation];
      [v14 fileURLWithFileSystemRepresentation:v15 isDirectory:(v17.st_mode & 0xF000) == 0x4000 relativeToURL:0];
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }

    -[CacheManagementAsset setAbsolutePath:](self, "setAbsolutePath:", 0LL);
  }

  else
  {
    CDGetLogHandle((uint64_t)"client");
    double v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[CacheManagementAsset identifier](self, "identifier");
      int v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CacheManagementAsset relativePath](self, "relativePath");
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      v17.st_dev = 138412546;
      *(void *)&v17.st_mode = v7;
      WORD2(v17.st_ino) = 2112;
      *(__darwin_ino64_t *)((char *)&v17.st_ino + 6) = (__darwin_ino64_t)v8;
      _os_log_impl( &dword_1874E4000,  v6,  OS_LOG_TYPE_DEFAULT,  "[%@] No AbsolutePath, calculating for relativePath: \"%@\"",  (uint8_t *)&v17,  0x16u);
    }
  }

  -[CacheManagementAsset relativePath](self, "relativePath");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CacheManagementAsset identifier](self, "identifier");
  int v10 = (void *)objc_claimAutoreleasedReturnValue();
  fullPathToAsset(v9, v10);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    size_t v12 = (void *)NSString;
    id v11 = v11;
    objc_msgSend(v12, "stringWithUTF8String:", objc_msgSend(v11, "fileSystemRepresentation"));
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    -[CacheManagementAsset setAbsolutePath:](self, "setAbsolutePath:", v13);
LABEL_10:
  }

  return v11;
}

- (void)commit
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  uint64_t v30 = 0LL;
  v3 = -[CacheManagementAsset createFlattenedAsset:](self, "createFlattenedAsset:", &v30);
  if (!v3) {
    return;
  }
  p_var0 = &v3->var0;
  CDGetLogHandle((uint64_t)"client");
  int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    flattenedAssetDescription(p_var0);
    double v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    size_t v32 = (size_t)v6;
    _os_log_impl(&dword_1874E4000, v5, OS_LOG_TYPE_DEFAULT, "attempting to commit flattenedAsset: %@", buf, 0xCu);
  }

  id v7 = -[CacheManagementAsset fullPath](self, "fullPath");
  -[CacheManagementAsset absolutePath](self, "absolutePath");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    CDGetLogHandle((uint64_t)"client");
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[CacheManagementAsset description](self, "description");
      stat v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      size_t v32 = (size_t)v17;
      _os_log_error_impl(&dword_1874E4000, v9, OS_LOG_TYPE_ERROR, "Unable to get absolute path for: %@", buf, 0xCu);
    }

    goto LABEL_23;
  }

  flattenedAssetDescription(p_var0);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  id v10 = -[CacheManagementAsset absolutePath](self, "absolutePath");
  id v11 = (const char *)[v10 fileSystemRepresentation];
  size_t v12 = v30;
  if (v30 < 1)
  {
    CDGetLogHandle((uint64_t)"client");
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      size_t v32 = v12;
      _os_log_error_impl( &dword_1874E4000,  v18,  OS_LOG_TYPE_ERROR,  "parameter error: buflen is less than zero (%ld)",  buf,  0xCu);
    }

    goto LABEL_16;
  }

  id v13 = v11;
  int v14 = openFile(v11);
  if (v14 != -1)
  {
    int v15 = v14;
    if (fsetxattr(v14, "com.apple.CacheManagementAsset", p_var0, v12, 0, 0))
    {
      CDGetLogHandle((uint64_t)"client");
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        int v28 = __error();
        uint64_t v29 = strerror(*v28);
        *(_DWORD *)buf = 136315394;
        size_t v32 = (size_t)v13;
        __int16 v33 = 2080;
        uint64_t v34 = (uint64_t)v29;
        _os_log_error_impl(&dword_1874E4000, v16, OS_LOG_TYPE_ERROR, "fsetxattr(%s) failed: %s", buf, 0x16u);
      }

      close(v15);
      goto LABEL_16;
    }

    close(v15);

    id v20 = -[CacheManagementAsset absolutePath](self, "absolutePath");
    removexattr((const char *)[v20 fileSystemRepresentation], "com.apple.coremedia.asset.name", 1);

    id v21 = -[CacheManagementAsset absolutePath](self, "absolutePath");
    removexattr((const char *)[v21 fileSystemRepresentation], "com.apple.coremedia.asset.image", 1);

    CDGetLogHandle((uint64_t)"client");
    id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = v30;
      id v24 = -[CacheManagementAsset absolutePath](self, "absolutePath");
      uint64_t v25 = [v24 fileSystemRepresentation];
      uint64_t v26 = @"no asset description available";
      *(_DWORD *)buf = 134218498;
      size_t v32 = v23;
      if (v9) {
        uint64_t v26 = (const __CFString *)v9;
      }
      __int16 v33 = 2080;
      uint64_t v34 = v25;
      __int16 v35 = 2112;
      int v36 = v26;
      _os_log_impl(&dword_1874E4000, v22, OS_LOG_TYPE_DEFAULT, "wrote asset (%ld bytes) to file: %s %@", buf, 0x20u);
    }

LABEL_23:
    free(p_var0);
    return;
  }

- (int)purgeabilityScoreAtUrgency:(int)a3
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603F50] date];
  int v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 timeIntervalSinceReferenceDate];
  double v7 = v6;

  uint64_t v8 = -[CacheManagementAsset expirationDate](self, "expirationDate");
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    -[CacheManagementAsset expirationDate](self, "expirationDate");
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 timeIntervalSinceReferenceDate];
    double v12 = v11;

    if (v7 > v12) {
      goto LABEL_8;
    }
  }

  CDGetLogHandle((uint64_t)"client");
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    -[CacheManagementAsset relativePath](self, "relativePath");
    int v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CacheManagementAsset expirationDate](self, "expirationDate");
    int v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 timeIntervalSinceReferenceDate];
    int v40 = 138412802;
    BOOL v41 = v14;
    __int16 v42 = 2048;
    *(void *)id v43 = v16;
    *(_WORD *)&v43[8] = 2048;
    double v44 = v7;
    _os_log_impl( &dword_1874E4000,  v13,  OS_LOG_TYPE_DEFAULT,  "%@ CacheManagementAssetPurgeabilityScore expirationDate: %f, now: %f",  (uint8_t *)&v40,  0x20u);
  }

  if (-[CacheManagementAsset priority](self, "priority") > a3 || !-[CacheManagementAsset priority](self, "priority")) {
    goto LABEL_22;
  }
  if (-[CacheManagementAsset priority](self, "priority") == 1
    || a3 >= 2 && -[CacheManagementAsset priority](self, "priority") <= a3)
  {
LABEL_8:
    int v17 = 1;
    goto LABEL_23;
  }

  uint64_t v18 = -[CacheManagementAsset consumedDate](self, "consumedDate");
  if (v18)
  {
    __int16 v19 = (void *)v18;
    -[CacheManagementAsset consumedDate](self, "consumedDate");
    id v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 timeIntervalSinceReferenceDate];
    double v22 = v21;

    if (v7 > v22)
    {
      int v17 = 2;
      goto LABEL_23;
    }
  }

  CDGetLogHandle((uint64_t)"client");
  uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    -[CacheManagementAsset relativePath](self, "relativePath");
    id v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[CacheManagementAsset downloadStartDate](self, "downloadStartDate");
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    [v25 timeIntervalSinceReferenceDate];
    int v40 = 138412802;
    BOOL v41 = v24;
    __int16 v42 = 2048;
    *(void *)id v43 = v26;
    *(_WORD *)&v43[8] = 2048;
    double v44 = v7;
    _os_log_impl( &dword_1874E4000,  v23,  OS_LOG_TYPE_DEFAULT,  "%@ CacheManagementAssetPurgeabilityScore downloadStartDate: %f, now: %f",  (uint8_t *)&v40,  0x20u);
  }

  uint64_t v27 = -[CacheManagementAsset downloadStartDate](self, "downloadStartDate");
  if (v27)
  {
    int v28 = (void *)v27;
    -[CacheManagementAsset downloadStartDate](self, "downloadStartDate");
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
    [v29 timeIntervalSinceReferenceDate];
    double v31 = v7 - v30;

    if (v31 > 129600.0)
    {
      int v17 = 4;
      goto LABEL_23;
    }
  }

  CDGetLogHandle((uint64_t)"client");
  size_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    -[CacheManagementAsset relativePath](self, "relativePath");
    __int16 v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[CacheManagementAsset downloadStartDate](self, "downloadStartDate");
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
    [v34 timeIntervalSinceReferenceDate];
    int v40 = 138412802;
    BOOL v41 = v33;
    __int16 v42 = 2048;
    *(void *)id v43 = v35;
    *(_WORD *)&v43[8] = 2048;
    double v44 = v7;
    _os_log_impl( &dword_1874E4000,  v32,  OS_LOG_TYPE_DEFAULT,  "%@ CacheManagementAssetPurgeabilityScore downloadStartDate: %f, now: %f",  (uint8_t *)&v40,  0x20u);
  }

LABEL_22:
  int v17 = 0;
LABEL_23:
  CDGetLogHandle((uint64_t)"client");
  int v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    -[CacheManagementAsset relativePath](self, "relativePath");
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
    int v38 = -[CacheManagementAsset priority](self, "priority");
    int v40 = 138413058;
    BOOL v41 = v37;
    __int16 v42 = 1024;
    *(_DWORD *)id v43 = v17;
    *(_WORD *)&v43[4] = 1024;
    *(_DWORD *)&v43[6] = v38;
    LOWORD(v44) = 1024;
    *(_DWORD *)((char *)&v44 + 2) = a3;
    _os_log_impl( &dword_1874E4000,  v36,  OS_LOG_TYPE_DEFAULT,  "%@ CacheManagementAssetPurgeabilityScore assigning score %d, priority: %d, urgency: %d",  (uint8_t *)&v40,  0x1Eu);
  }

  return v17;
}

- (int64_t)size
{
  id v3 = -[CacheManagementAsset fullPath](self, "fullPath");
  -[CacheManagementAsset absolutePath](self, "absolutePath");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4) {
    return -1LL;
  }
  -[CacheManagementAsset absolutePath](self, "absolutePath");
  int v5 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v6 = diskUsageList(v5, 0LL);

  return v6;
}

- (int64_t)sizeCached:(BOOL)a3
{
  BOOL v3 = a3;
  if (qword_18C4C4180 != -1) {
    dispatch_once(&qword_18C4C4180, &__block_literal_global);
  }
  if (v3)
  {
    objc_msgSend(MEMORY[0x189603F50], "date", *(double *)&_MergedGlobals_0);
    int v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 timeIntervalSinceReferenceDate];
    if (v6 - *(double *)&_MergedGlobals_0 <= 300.0)
    {
      uint64_t v7 = sizeCached__result;

      if (v7 != -1) {
        return sizeCached__result;
      }
    }

    else
    {
    }
  }

  int64_t result = -[CacheManagementAsset size](self, "size");
  sizeCached__int64_t result = result;
  return result;
}

void __35__CacheManagementAsset_sizeCached___block_invoke()
{
  _MergedGlobals_0 = nan("");
}

- (id)description
{
  id v20 = (void *)NSString;
  -[CacheManagementAsset displayName](self, "displayName");
  __int16 v19 = (void *)objc_claimAutoreleasedReturnValue();
  id v21 = -[CacheManagementAsset relativePath](self, "relativePath");
  uint64_t v17 = [v21 fileSystemRepresentation];
  -[CacheManagementAsset identifier](self, "identifier");
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CacheManagementAsset contentType](self, "contentType");
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = -[CacheManagementAsset priority](self, "priority");
  uint64_t v4 = -[CacheManagementAsset purgeabilityScoreAtUrgency:](self, "purgeabilityScoreAtUrgency:", 2LL);
  -[CacheManagementAsset thumbnailData](self, "thumbnailData");
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18) {
    int v5 = "YES";
  }
  else {
    int v5 = "NO";
  }
  int64_t v6 = -[CacheManagementAsset size](self, "size");
  -[CacheManagementAsset expirationDate](self, "expirationDate");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CacheManagementAsset downloadStartDate](self, "downloadStartDate");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CacheManagementAsset downloadCompletionDate](self, "downloadCompletionDate");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CacheManagementAsset consumedDate](self, "consumedDate");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CacheManagementAsset lastViewedDate](self, "lastViewedDate");
  double v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CacheManagementAsset absolutePath](self, "absolutePath");
  double v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 stringWithFormat:@"CacheManagementAsset displayName: %@, relativePath: %s, identifier: %@, contentType: %@\npriority: %d, purgeabilityScore [u:2]: %d, has thumbnail: %s, size: %lld\nexpirationDate: %@\ndownloadStartDate: %@\ndownloadCompletionDate: %@\nconsumedDate: %@\nlastViewedDate: %@\nabsolutePath: %@", v19, v17, v16, v3, v15, v4, v5, v6, v7, v8, v9, v10, v11, v12];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)relativePath
{
  return self->_relativePath;
}

- (void)setRelativePath:(id)a3
{
}

- (NSString)contentType
{
  return self->_contentType;
}

- (void)setContentType:(id)a3
{
}

- (void)setMetadata:(id)a3
{
}

- (int)priority
{
  return self->_priority;
}

- (void)setPriority:(int)a3
{
  self->_priority = a3;
}

- (unsigned)assetVersion
{
  return self->_assetVersion;
}

- (double)expiration_date
{
  return self->_expiration_date;
}

- (void)setExpiration_date:(double)a3
{
  self->_expiration_date = a3;
}

- (double)consumed_date
{
  return self->_consumed_date;
}

- (void)setConsumed_date:(double)a3
{
  self->_consumed_date = a3;
}

- (double)download_start_date
{
  return self->_download_start_date;
}

- (void)setDownload_start_date:(double)a3
{
  self->_download_start_date = a3;
}

- (double)download_completion_date
{
  return self->_download_completion_date;
}

- (void)setDownload_completion_date:(double)a3
{
  self->_download_completion_date = a3;
}

- (double)last_viewed_date
{
  return self->_last_viewed_date;
}

- (void)setLast_viewed_date:(double)a3
{
  self->_last_viewed_date = a3;
}

- (NSString)absolutePath
{
  return (NSString *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setAbsolutePath:(id)a3
{
}

- (void).cxx_destruct
{
}

@end