@interface MAAsset
+ (id)getLoadResultFromMessage:(id)a3;
+ (id)loadSync:(id)a3 allowingDifferences:(id)a4 error:(id *)a5;
+ (id)loadSync:(id)a3 allowingDifferences:(id)a4 withPurpose:(id)a5 error:(id *)a6;
+ (id)loadSync:(id)a3 error:(id *)a4;
+ (id)loadSync:(id)a3 withPurpose:(id)a4 error:(id *)a5;
+ (void)cancelCatalogDownload:(id)a3 then:(id)a4;
+ (void)cancelCatalogDownload:(id)a3 withPurpose:(id)a4 then:(id)a5;
+ (void)startCatalogDownload:(id)a3 options:(id)a4 completionWithError:(id)a5;
+ (void)startCatalogDownload:(id)a3 options:(id)a4 then:(id)a5;
+ (void)startCatalogDownload:(id)a3 then:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)nonUserInitiatedDownloadsAllowed;
- (BOOL)overrideGarbageCollectionThreshold:(unint64_t)a3;
- (BOOL)refreshState;
- (BOOL)spaceCheck:(int64_t *)a3;
- (BOOL)wasDownloadable;
- (BOOL)wasInCatalog;
- (BOOL)wasLocal;
- (BOOL)wasPreinstalled;
- (BOOL)wasPurgeable;
- (MAAsset)initWithAttributes:(id)a3;
- (NSDictionary)attributes;
- (NSString)assetId;
- (NSString)assetType;
- (NSString)purpose;
- (id)absoluteAssetId;
- (id)assetProperty:(id)a3;
- (id)assetServerUrl;
- (id)description;
- (id)getLocalFilePath;
- (id)getLocalFileUrl;
- (id)hashToString:(id)a3;
- (int64_t)calculateTimeout;
- (int64_t)cancelDownloadSync;
- (int64_t)configDownloadSync:(id)a3;
- (int64_t)purgeSync;
- (int64_t)state;
- (unint64_t)hash;
- (void)_invokeClientDownloadCompletionAlreadyOnQueue:(int64_t)a3 asset:(id)a4 completionBlockWithError:(id)a5;
- (void)attachProgressCallBack:(id)a3;
- (void)cancelDownload:(id)a3;
- (void)commonAssetDownload:(id)a3 options:(id)a4 then:(id)a5;
- (void)configDownload:(id)a3 completion:(id)a4;
- (void)invokeClientDownloadCompletion:(int64_t)a3 asset:(id)a4 completionBlockWithError:(id)a5;
- (void)logAsset;
- (void)purge:(id)a3;
- (void)purgeWithError:(id)a3;
- (void)startDownload:(id)a3;
- (void)startDownload:(id)a3 completionWithError:(id)a4;
- (void)startDownload:(id)a3 then:(id)a4;
- (void)startDownloadWithExtractor:(id)a3 completion:(id)a4;
- (void)startDownloadWithExtractor:(id)a3 options:(id)a4 completion:(id)a5;
- (void)startDownloadWithExtractor:(id)a3 options:(id)a4 completionWithError:(id)a5;
@end

@implementation MAAsset

- (BOOL)wasLocal
{
  return (self->_state < 7uLL) & (0x6Cu >> self->_state);
}

- (BOOL)wasPreinstalled
{
  return (unint64_t)(self->_state - 5) < 2;
}

- (BOOL)wasPurgeable
{
  return (self->_state < 7uLL) & (0x5Cu >> self->_state);
}

- (BOOL)wasInCatalog
{
  return (self->_state < 5uLL) & (0x16u >> self->_state);
}

- (BOOL)wasDownloadable
{
  int64_t state = self->_state;
  return state == 1 || state == 4;
}

- (MAAsset)initWithAttributes:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___MAAsset;
  v5 = -[MAAsset init](&v19, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 objectForKey:@"AssetProperties"];
    attributes = v5->_attributes;
    v5->_attributes = (NSDictionary *)v6;

    uint64_t v8 = -[NSDictionary objectForKey:](v5->_attributes, "objectForKey:", @"AssetPurpose");
    purpose = v5->_purpose;
    v5->_purpose = (NSString *)v8;

    [v4 objectForKey:@"AssetAddedProperties"];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      [v10 objectForKey:@"AssetState"];
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12) {
        v12 = (void *)[v12 integerValue];
      }
      v5->_int64_t state = (int64_t)v12;
      uint64_t v14 = [v11 objectForKey:@"AssetType"];
      assetType = v5->_assetType;
      v5->_assetType = (NSString *)v14;

      uint64_t v16 = [v11 objectForKey:@"AssetId"];
      assetId = v5->_assetId;
      v5->_assetId = (NSString *)v16;
    }
  }

  return v5;
}

+ (id)getLoadResultFromMessage:(id)a3
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  data = xpc_dictionary_get_data(v3, (const char *)[@"xmlData" UTF8String], &length);
  if (!data)
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"+[MAAsset getLoadResultFromMessage:]",  @"load rawData is null skipping",  v5,  v6,  v7,  v8,  v37);
    v33 = 0LL;
    uint64_t v14 = 0LL;
    v15 = 0LL;
    v13 = 0LL;
LABEL_22:
    id v27 = 0LL;
    id v24 = 0LL;
    goto LABEL_23;
  }

  [MEMORY[0x189603F48] dataWithBytesNoCopy:data length:length freeWhenDone:0];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"+[MAAsset getLoadResultFromMessage:]",  @"load data is null skipping",  v9,  v10,  v11,  v12,  v37);
    v33 = 0LL;
    uint64_t v14 = 0LL;
    v15 = 0LL;
    goto LABEL_22;
  }

  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x189607908]) initForReadingFromData:v13 error:0];
  [v14 decodePropertyListForKey:*MEMORY[0x1896075C8]];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 finishDecoding];
  if (!v15)
  {
    v34 = @"load allData is null skipping";
LABEL_21:
    _MobileAssetLog(0LL, 6, (uint64_t)"+[MAAsset getLoadResultFromMessage:]", v34, v16, v17, v18, v19, v37);
    v33 = 0LL;
    goto LABEL_22;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v34 = @"load allData is not a dictionary";
    goto LABEL_21;
  }

  [v15 objectForKey:@"assetsToFrameWork"];
  id v24 = (id)objc_claimAutoreleasedReturnValue();
  if (v24 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    id v24 = v24;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      id v27 = 0LL;
      uint64_t v28 = *(void *)v38;
      while (2)
      {
        uint64_t v29 = 0LL;
        v30 = v27;
        do
        {
          if (*(void *)v38 != v28) {
            objc_enumerationMutation(v24);
          }
          id v27 = *(id *)(*((void *)&v37 + 1) + 8 * v29);

          v31 = objc_alloc(&OBJC_CLASS___MAAsset);
          uint64_t v32 = -[MAAsset initWithAttributes:](v31, "initWithAttributes:", v27, (void)v37);
          if (v32)
          {
            v33 = (void *)v32;
            goto LABEL_26;
          }

          ++v29;
          v30 = v27;
        }

        while (v26 != v29);
        uint64_t v26 = [v24 countByEnumeratingWithState:&v37 objects:v42 count:16];
        if (v26) {
          continue;
        }
        break;
      }
    }

    v33 = 0LL;
    id v27 = 0LL;
LABEL_26:
  }

  else
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"+[MAAsset getLoadResultFromMessage:]",  @"attributes is nil",  v20,  v21,  v22,  v23,  v37);
    v33 = 0LL;
    id v27 = 0LL;
  }

+ (id)loadSync:(id)a3 error:(id *)a4
{
  return (id)[a1 loadSync:a3 allowingDifferences:0 withPurpose:0 error:a4];
}

+ (id)loadSync:(id)a3 withPurpose:(id)a4 error:(id *)a5
{
  return (id)[a1 loadSync:a3 allowingDifferences:0 withPurpose:a4 error:a5];
}

+ (id)loadSync:(id)a3 allowingDifferences:(id)a4 error:(id *)a5
{
  return (id)[a1 loadSync:a3 allowingDifferences:a4 withPurpose:0 error:a5];
}

+ (id)loadSync:(id)a3 allowingDifferences:(id)a4 withPurpose:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  xpc_object_t v13 = xpc_dictionary_create(0LL, 0LL, 0LL);
  id v14 = [v10 assetType];
  xpc_dictionary_set_string(v13, "AssetType", (const char *)[v14 UTF8String]);

  v74 = v12;
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    [v10 encodeAsPlist];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    addObjectToMessage(v19, v13, "loadAssetIdLength", "loadAssetId");
    xpc_dictionary_set_uint64(v13, "messageAction", 0x1BuLL);
    uint64_t v20 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    v71 = getprogname();
    uint64_t v21 = (id) CFStringCreateWithFormat(v20, 0LL, @"%s");
    xpc_dictionary_set_string(v13, "clientName", (const char *)-[__CFString UTF8String](v21, "UTF8String"));
    if (v12) {
      xpc_dictionary_set_string(v13, "Purpose", (const char *)[v12 UTF8String]);
    }
    if (!v11)
    {
      +[MAAssetDiff defaultAllowedDifferences](&OBJC_CLASS___MAAssetDiff, "defaultAllowedDifferences");
      id v11 = (id)objc_claimAutoreleasedReturnValue();
    }

    v75 = v11;
    [v11 encodeAsPlist];
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v23 = addObjectToMessage(v22, v13, "allowedDifferencesLength", "allowedDifferences");
    uint64_t v76 = 12LL;
    _getCommsManager(v23, v24, v25, v26, v27, v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    [NSString stringWithUTF8String:"+[MAAsset loadSync:allowingDifferences:withPurpose:error:]"];
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
    [v31 sendSync:v13 gettingResponseCode:&v76 codeForXpcError:1 loggingName:v32];
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    unint64_t v38 = v76;
    if (v76 != 1)
    {
      [a1 getLoadResultFromMessage:v33];
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v52;
      if (v52)
      {
        [v52 absoluteAssetId];
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        [v57 description];
        v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        v45 = @"nothing";
      }

      if (v38 == 14)
      {
        [v46 absoluteAssetId];
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        [v10 diffFrom:v58];
        v59 = (void *)objc_claimAutoreleasedReturnValue();

        _MobileAssetLog( 0LL,  6,  (uint64_t)"+[MAAsset loadSync:allowingDifferences:withPurpose:error:]",  @"Asset load result for %@: %ld (MAQueryHasAllowedDifferences). Found match %@ within allowed differences %@ (actual differences were %@)",  v60,  v61,  v62,  v63,  (uint64_t)v10);
      }

      else
      {
        if (!v38)
        {
          _MobileAssetLog( 0LL,  6,  (uint64_t)"+[MAAsset loadSync:allowingDifferences:withPurpose:error:]",  @"Asset load result for %@: %ld (MAQuerySuccessful). Found %@.",  v53,  v54,  v55,  v56,  (uint64_t)v10);
          goto LABEL_24;
        }

        stringForMAQueryResult(v38);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        _MobileAssetLog( 0LL,  6,  (uint64_t)"+[MAAsset loadSync:allowingDifferences:withPurpose:error:]",  @"Asset load result for %@: %ld (%@)",  v64,  v65,  v66,  v67,  (uint64_t)v10);
      }

      goto LABEL_24;
    }

    _MobileAssetLog( 0LL,  6,  (uint64_t)"+[MAAsset loadSync:allowingDifferences:withPurpose:error:]",  @"Asset load failed due to XPC",  v34,  v35,  v36,  v37,  (uint64_t)v71);
    if (!a6)
    {
      v45 = 0LL;
      v46 = 0LL;
      goto LABEL_24;
    }

    MAError( @"com.apple.MobileAssetError.Query",  1LL,  @"Asset load failed due to an XPC error",  v39,  v40,  v41,  v42,  v43,  v72);
    id v44 = (id)objc_claimAutoreleasedReturnValue();
    v45 = 0LL;
    v46 = 0LL;
  }

  else
  {
    v75 = v11;
    _MobileAssetLog( 0LL,  6,  (uint64_t)"+[MAAsset loadSync:allowingDifferences:withPurpose:error:]",  @"Asset load failed due to nil or invalid type",  v15,  v16,  v17,  v18,  v70);
    if (!a6)
    {
      v45 = 0LL;
      uint64_t v21 = 0LL;
      v46 = 0LL;
      v33 = 0LL;
      uint64_t v19 = 0LL;
      uint64_t v22 = 0LL;
      goto LABEL_24;
    }

    MAError( @"com.apple.MobileAssetError.Query",  8LL,  @"Asset load failed due to the absoluteId being nil or the wrong type",  v47,  v48,  v49,  v50,  v51,  v73);
    id v44 = (id)objc_claimAutoreleasedReturnValue();
    v45 = 0LL;
    uint64_t v21 = 0LL;
    v46 = 0LL;
    v33 = 0LL;
    uint64_t v19 = 0LL;
    uint64_t v22 = 0LL;
  }

  *a6 = v44;
LABEL_24:
  id v68 = v46;

  return v68;
}

- (BOOL)nonUserInitiatedDownloadsAllowed
{
  return 1;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_assetId, "hash");
}

- (id)assetServerUrl
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    id v4 = 0LL;
    goto LABEL_5;
  }

  -[NSDictionary objectForKey:](self->_attributes, "objectForKey:", @"__BaseURL");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
LABEL_5:
    uint64_t v6 = 0LL;
    goto LABEL_6;
  }

  [MEMORY[0x189604030] URLWithString:v4];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 URLByAppendingPathComponent:v3];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  id v7 = v6;

  return v7;
}

- (void)attachProgressCallBack:(id)a3
{
  id v4 = a3;
  _getCommsManager((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  [v12 attachProgressHandler:self->_assetType assetId:self->_assetId callBack:v4 withPurpose:self->_purpose];
}

- (id)getLocalFilePath
{
  int64_t state = self->_state;
  assetType = self->_assetType;
  if (state == 5)
  {
    getLocalUrlFromTypeAndIdGivenDefaultRepoWithPurpose(assetType, self->_assetId, 5LL, 0LL, 0LL);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 path];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    _MAensureExtension(assetType);
    _MAsendUpdateClientAccessGetPathWithPurposeSync(self->_assetType, self->_assetId, self->_state, self->_purpose);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)getLocalFileUrl
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    [MEMORY[0x189604030] fileURLWithPath:v2 isDirectory:1];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v3 = 0LL;
  }

  return v3;
}

- (id)assetProperty:(id)a3
{
  return -[NSDictionary objectForKey:](self->_attributes, "objectForKey:", a3);
}

- (id)description
{
  return (id)objc_msgSend( NSString,  "stringWithFormat:",  @"assetType: %@; assetId: %@ State: %ld",
               self->_assetType,
               self->_assetId,
               self->_state);
}

- (void)logAsset
{
  *(_OWORD *)id v12 = *(_OWORD *)&self->_assetId;
  purposeDirectoryName(self->_purpose);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MAAsset logAsset]",  @"assetId: %@ State: %ld attributes: %@ purpose: %@",  v3,  v4,  v5,  v6,  (uint64_t)v12[0]);

  if (-[MAAsset wasLocal](self, "wasLocal"))
  {
    -[MAAsset getLocalUrl](self, "getLocalUrl");
    xpc_object_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MAAsset logAsset]",  @"The asset is installed at: %@",  v7,  v8,  v9,  v10,  (uint64_t)v13);
  }

- (id)absoluteAssetId
{
  uint64_t v3 = objc_alloc(&OBJC_CLASS___MAAbsoluteAssetId);
  -[MAAsset assetId](self, "assetId");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAsset assetType](self, "assetType");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAsset attributes](self, "attributes");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = -[MAAbsoluteAssetId initWithAssetId:forAssetType:attributes:]( v3,  "initWithAssetId:forAssetType:attributes:",  v4,  v5,  v6);

  return v7;
}

- (void)startDownloadWithExtractor:(id)a3 completion:(id)a4
{
}

- (void)startDownloadWithExtractor:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __57__MAAsset_startDownloadWithExtractor_options_completion___block_invoke;
  v10[3] = &unk_189FFA460;
  id v11 = v8;
  id v9 = v8;
  -[MAAsset startDownloadWithExtractor:options:completionWithError:]( self,  "startDownloadWithExtractor:options:completionWithError:",  a3,  a4,  v10);
}

uint64_t __57__MAAsset_startDownloadWithExtractor_options_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)startDownloadWithExtractor:(id)a3 options:(id)a4 completionWithError:(id)a5
{
  id v17 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (void *)MEMORY[0x1895A1E98]();
  -[NSDictionary objectForKey:](self->_attributes, "objectForKey:", @"_Measurement");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAsset hashToString:](self, "hashToString:", v11);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSDictionary objectForKey:](self->_attributes, "objectForKey:", @"_UnarchivedSize");
  xpc_object_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](self->_attributes, "objectForKey:", @"_LengthOfDataRange");
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = v14;
  if (v12 && v14 && v13)
  {
    (*((void (**)(id, void, uint64_t, void *, void, void))v17 + 2))( v17,  0,  2,  v12,  (int)[v14 intValue],  (int)objc_msgSend(v13, "intValue"));
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAAsset commonAssetDownload:options:then:](self, "commonAssetDownload:options:then:", v16, v8, v9);
  }

  else
  {
    -[MAAsset invokeClientDownloadCompletion:asset:completionBlockWithError:]( self,  "invokeClientDownloadCompletion:asset:completionBlockWithError:",  3LL,  self,  v9);
  }

  objc_autoreleasePoolPop(v10);
}

- (id)hashToString:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 bytes];
  [MEMORY[0x189607940] string];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v3 length])
  {
    unint64_t v6 = 0LL;
    do
      objc_msgSend(v5, "appendFormat:", @"%02x", *(unsigned __int8 *)(v4 + v6++));
    while ([v3 length] > v6);
  }

  return v5;
}

- (void)startDownload:(id)a3
{
}

- (void)startDownload:(id)a3 then:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __30__MAAsset_startDownload_then___block_invoke;
  v8[3] = &unk_189FFA460;
  id v9 = v6;
  id v7 = v6;
  -[MAAsset startDownload:completionWithError:](self, "startDownload:completionWithError:", a3, v8);
}

uint64_t __30__MAAsset_startDownload_then___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)startDownload:(id)a3 completionWithError:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1895A1E98]();
  -[MAAsset commonAssetDownload:options:then:](self, "commonAssetDownload:options:then:", 0LL, v8, v6);
  objc_autoreleasePoolPop(v7);
}

- (int64_t)calculateTimeout
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 longLongValue];

  return calculateTimeout(v3, v4, v5, v6, v7, v8, v9, v10);
}

- (void)_invokeClientDownloadCompletionAlreadyOnQueue:(int64_t)a3 asset:(id)a4 completionBlockWithError:(id)a5
{
  id v18 = a4;
  uint64_t v7 = (void (**)(id, int64_t, void *))a5;
  _getClientCallbackQueue();
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (isDownloadResultFailure(a3))
  {
    errorStringForMADownloadResult(a3);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 assetType];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 assetId];
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    MAErrorForDownloadResultWithUnderlying( a3,  0LL,  @"%@ (Asset download for %@ %@)",  v11,  v12,  v13,  v14,  v15,  (uint64_t)v9);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v16 = 0LL;
  }

  v7[2](v7, a3, v16);
}

- (void)invokeClientDownloadCompletion:(int64_t)a3 asset:(id)a4 completionBlockWithError:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  _getClientCallbackQueue();
  uint64_t v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __73__MAAsset_invokeClientDownloadCompletion_asset_completionBlockWithError___block_invoke;
  v13[3] = &unk_189FFA488;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, v13);
}

uint64_t __73__MAAsset_invokeClientDownloadCompletion_asset_completionBlockWithError___block_invoke( uint64_t a1)
{
  return [*(id *)(a1 + 32) _invokeClientDownloadCompletionAlreadyOnQueue:*(void *)(a1 + 56) asset:*(void *)(a1 + 40) completionBlockWithError:*(void *)(a1 + 48)];
}

- (void)commonAssetDownload:(id)a3 options:(id)a4 then:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_assetId && self->_assetType)
  {
    if (!self->_purpose || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      -[MAAsset assetProperty:](self, "assetProperty:", @"__BaseURL");
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[MAAsset assetProperty:](self, "assetProperty:", @"__RelativePath");
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary objectForKey:](self->_attributes, "objectForKey:", @"_DownloadSize");
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v14 = [v13 longLongValue];

      int64_t state = self->_state;
      if (state == 6)
      {
        int64_t v16 = self;
        uint64_t v17 = 29LL;
      }

      else
      {
        if (state != 5)
        {
          if (v9) {
            id v20 = v9;
          }
          else {
            id v20 = (id)objc_opt_new();
          }
          uint64_t v21 = v20;
          suAssetTypes();
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
          int v23 = [v22 containsObject:self->_assetType];

          if (v23) {
            [v9 setAllowDaemonConnectionRetries:1];
          }
          if ([v9 discretionary]
            && !-[MAAsset nonUserInitiatedDownloadsAllowed](self, "nonUserInitiatedDownloadsAllowed"))
          {
            _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MAAsset commonAssetDownload:options:then:]",  @"Cannot download %@ %@ unless the download is user-initiated (non-discretionary) as the user has turned off background system file updates (check first if nonUserInitiatedDownloadsAllowed).",  v24,  v25,  v26,  v27,  (uint64_t)self->_assetType);
            -[MAAsset invokeClientDownloadCompletion:asset:completionBlockWithError:]( self,  "invokeClientDownloadCompletion:asset:completionBlockWithError:",  34LL,  self,  v10);

            goto LABEL_27;
          }

          if ([v21 timeoutIntervalForResource] == -1) {
            objc_msgSend(v21, "setTimeoutIntervalForResource:", -[MAAsset calculateTimeout](self, "calculateTimeout"));
          }
          uint64_t v38 = v14;
          uint64_t v39 = v11;
          -[NSDictionary objectForKey:](self->_attributes, "objectForKey:", @"__CanUseLocalCacheServer");
          uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
          char v29 = objc_opt_respondsToSelector();
          if (v9 && (v29 & 1) != 0)
          {
            objc_msgSend(v21, "setCanUseLocalCacheServer:", objc_msgSend(v28, "BOOLValue"));
            unsigned int v30 = [v21 canUseLocalCacheServer];
            _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MAAsset commonAssetDownload:options:then:]",  @"The cache server is: %d",  v31,  v32,  v33,  v34,  v30);
          }

          assetType = self->_assetType;
          assetId = self->_assetId;
          id v11 = v21;
          purpose = self->_purpose;
          v40[0] = MEMORY[0x1895F87A8];
          v40[1] = 3221225472LL;
          v40[2] = __44__MAAsset_commonAssetDownload_options_then___block_invoke;
          v40[3] = &unk_189FFA4B0;
          v40[4] = self;
          id v41 = v10;
          _MAsendDownloadAsset(v11, assetType, assetId, v38, v39, v12, 0LL, v8, purpose, v40);

          goto LABEL_26;
        }

        int64_t v16 = self;
        uint64_t v17 = 15LL;
      }

      -[MAAsset invokeClientDownloadCompletion:asset:completionBlockWithError:]( v16,  "invokeClientDownloadCompletion:asset:completionBlockWithError:",  v17,  self,  v10);

LABEL_26:
      goto LABEL_27;
    }

    id v18 = self;
    uint64_t v19 = 74LL;
  }

  else
  {
    id v18 = self;
    uint64_t v19 = 23LL;
  }

  -[MAAsset invokeClientDownloadCompletion:asset:completionBlockWithError:]( v18,  "invokeClientDownloadCompletion:asset:completionBlockWithError:",  v19,  self,  v10);
LABEL_27:
}

void __44__MAAsset_commonAssetDownload_options_then___block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  if (xdict)
  {
    if (MEMORY[0x1895A2258]() == MEMORY[0x1895F9268])
    {
      uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 16LL);
      int64_t int64 = 1LL;
      stringForMADownloadResult(1uLL);
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MAAsset commonAssetDownload:options:then:]_block_invoke",  @"Error on the download asset reply for %@, response: %ld (%@)",  v16,  v17,  v18,  v19,  v15);
    }

    else
    {
      int64_t int64 = xpc_dictionary_get_int64(xdict, "Result");
      uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 16LL);
      stringForMADownloadResult(int64);
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MAAsset commonAssetDownload:options:then:]_block_invoke",  @"Got the download asset reply for %@, response: %ld (%@)",  v6,  v7,  v8,  v9,  v4);
    }
  }

  else
  {
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 16LL);
    int64_t int64 = 1LL;
    stringForMADownloadResult(1uLL);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MAAsset commonAssetDownload:options:then:]_block_invoke",  @"Error on the download asset reply for %@, response: %ld (%@) due to no xpc message",  v11,  v12,  v13,  v14,  v10);
  }

  [*(id *)(a1 + 32) _invokeClientDownloadCompletionAlreadyOnQueue:int64 asset:*(void *)(a1 + 32) completionBlockWithError:*(void *)(a1 + 40)];
}

+ (void)startCatalogDownload:(id)a3 then:(id)a4
{
}

+ (void)startCatalogDownload:(id)a3 options:(id)a4 then:(id)a5
{
  id v7 = a5;
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __45__MAAsset_startCatalogDownload_options_then___block_invoke;
  v9[3] = &unk_189FFA460;
  id v10 = v7;
  id v8 = v7;
  +[MAAsset startCatalogDownload:options:completionWithError:]( &OBJC_CLASS___MAAsset,  "startCatalogDownload:options:completionWithError:",  a3,  a4,  v9);
}

uint64_t __45__MAAsset_startCatalogDownload_options_then___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (void)startCatalogDownload:(id)a3 options:(id)a4 completionWithError:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)MEMORY[0x1895A1E98]();
  v21[0] = 0LL;
  v21[1] = v21;
  v21[2] = 0x2020000000LL;
  v21[3] = 1LL;
  if (v8) {
    id v11 = v8;
  }
  else {
    id v11 = (id)objc_opt_new();
  }
  uint64_t v12 = v11;
  if ([v11 timeoutIntervalForResource] == -1) {
    [v12 setTimeoutIntervalForResource:900];
  }
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __60__MAAsset_startCatalogDownload_options_completionWithError___block_invoke;
  v16[3] = &unk_189FFA528;
  id v20 = v21;
  id v13 = v7;
  id v17 = v13;
  id v14 = v12;
  id v18 = v14;
  id v15 = v9;
  id v19 = v15;
  _MAsendDownloadMetaData(v13, v14, v16);

  _Block_object_dispose(v21, 8);
  objc_autoreleasePoolPop(v10);
}

void __60__MAAsset_startCatalogDownload_options_completionWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1LL;
  if (v3)
  {
    if (MEMORY[0x1895A2258](v3) == MEMORY[0x1895F9268])
    {
      uint64_t v16 = *(void *)(a1 + 32);
      stringForMADownloadResult(*(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL));
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      _MobileAssetLog( 0LL,  6,  (uint64_t)"+[MAAsset startCatalogDownload:options:completionWithError:]_block_invoke",  @"Error on the download meta data reply for %@, response: %ld (%@)",  v17,  v18,  v19,  v20,  v16);
    }

    else
    {
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = xpc_dictionary_get_int64(v4, "Result");
      uint64_t v5 = *(void *)(a1 + 32);
      stringForMADownloadResult(*(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL));
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      _MobileAssetLog( 0LL,  6,  (uint64_t)"+[MAAsset startCatalogDownload:options:completionWithError:]_block_invoke",  @"Got the download meta data reply for %@, response: %ld (%@)",  v7,  v8,  v9,  v10,  v5);
    }
  }

  else
  {
    uint64_t v11 = *(void *)(a1 + 32);
    stringForMADownloadResult(*(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    _MobileAssetLog( 0LL,  6,  (uint64_t)"+[MAAsset startCatalogDownload:options:completionWithError:]_block_invoke",  @"Error on the download meta data reply for %@, response: %ld (%@) due to not having an xpc message",  v12,  v13,  v14,  v15,  v11);
  }

  uint64_t v25 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL);
  if (v25 == 13)
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"+[MAAsset startCatalogDownload:options:completionWithError:]_block_invoke",  @"Will retry download meta data for %@, after %ld seconds",  v21,  v22,  v23,  v24,  *(void *)(a1 + 32));
    dispatch_time_t v26 = dispatch_time(0LL, 2000000000LL);
    if (getRetryXpcDelayQueue_onceToken_0 != -1) {
      dispatch_once(&getRetryXpcDelayQueue_onceToken_0, &__block_literal_global_2);
    }
    uint64_t v27 = (dispatch_queue_s *)getRetryXpcDelayQueue_retryQueue_0;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __60__MAAsset_startCatalogDownload_options_completionWithError___block_invoke_2;
    block[3] = &unk_189FFA500;
    id v39 = *(id *)(a1 + 32);
    id v40 = *(id *)(a1 + 40);
    __int128 v37 = *(_OWORD *)(a1 + 48);
    id v28 = (id)v37;
    __int128 v41 = v37;
    dispatch_after(v26, v27, block);
  }

  else if (*(void *)(a1 + 48))
  {
    if (isDownloadResultFailure(v25))
    {
      unint64_t v29 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL);
      errorStringForMADownloadResult(v29);
      unsigned int v30 = (void *)objc_claimAutoreleasedReturnValue();
      MAErrorForDownloadResultWithUnderlying( v29,  0LL,  @"%@ (Catalog download for %@)",  v31,  v32,  v33,  v34,  v35,  (uint64_t)v30);
      uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v36 = 0LL;
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }
}

void __60__MAAsset_startCatalogDownload_options_completionWithError___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __60__MAAsset_startCatalogDownload_options_completionWithError___block_invoke_3;
  v4[3] = &unk_189FFA4D8;
  uint64_t v7 = *(void *)(a1 + 56);
  id v5 = v2;
  id v6 = *(id *)(a1 + 48);
  _MAsendDownloadMetaData(v5, v3, v4);
}

void __60__MAAsset_startCatalogDownload_options_completionWithError___block_invoke_3(void *a1, void *a2)
{
  id v3 = a2;
  *(void *)(*(void *)(a1[6] + 8LL) + 24LL) = 1LL;
  xpc_object_t xdict = v3;
  if (v3)
  {
    if (MEMORY[0x1895A2258]() == MEMORY[0x1895F9268])
    {
      *(void *)(*(void *)(a1[6] + 8LL) + 24LL) = 1LL;
    }

    else
    {
      *(void *)(*(void *)(a1[6] + 8LL) + 24LL) = xpc_dictionary_get_int64(xdict, "Result");
      if (!isDownloadResultFailure(*(void *)(*(void *)(a1[6] + 8LL) + 24LL)))
      {
        uint64_t v4 = a1[4];
        stringForMADownloadResult(*(void *)(*(void *)(a1[6] + 8LL) + 24LL));
        id v5 = (void *)objc_claimAutoreleasedReturnValue();
        _MobileAssetLog( 0LL,  6,  (uint64_t)"+[MAAsset startCatalogDownload:options:completionWithError:]_block_invoke_3",  @"Got the retry download meta data reply for %@, response: %ld (%@)",  v6,  v7,  v8,  v9,  v4);
        uint64_t v10 = 0LL;
        goto LABEL_8;
      }
    }

    unint64_t v23 = *(void *)(*(void *)(a1[6] + 8LL) + 24LL);
    errorStringForMADownloadResult(v23);
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    MAErrorForDownloadResultWithUnderlying( v23,  0LL,  @"%@ (Catalog download for %@)",  v25,  v26,  v27,  v28,  v29,  (uint64_t)v24);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v30 = a1[4];
    stringForMADownloadResult(*(void *)(*(void *)(a1[6] + 8LL) + 24LL));
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    _MobileAssetLog( 0LL,  6,  (uint64_t)"+[MAAsset startCatalogDownload:options:completionWithError:]_block_invoke_3",  @"Error on the retry download meta data reply for %@, response: %ld (%@)",  v31,  v32,  v33,  v34,  v30);
  }

  else
  {
    *(void *)(*(void *)(a1[6] + 8LL) + 24LL) = 24LL;
    unint64_t v11 = *(void *)(*(void *)(a1[6] + 8LL) + 24LL);
    errorStringForMADownloadResult(v11);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    MAErrorForDownloadResultWithUnderlying( v11,  0LL,  @"%@ (Catalog download for %@)",  v13,  v14,  v15,  v16,  v17,  (uint64_t)v12);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v18 = a1[4];
    stringForMADownloadResult(*(void *)(*(void *)(a1[6] + 8LL) + 24LL));
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    _MobileAssetLog( 0LL,  6,  (uint64_t)"+[MAAsset startCatalogDownload:options:completionWithError:]_block_invoke_3",  @"Error on the retry download meta data reply for %@, response: %ld (%@) due to not having an xpc message",  v19,  v20,  v21,  v22,  v18);
  }

- (void)purge:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __17__MAAsset_purge___block_invoke;
  v6[3] = &unk_189FFA460;
  id v7 = v4;
  id v5 = v4;
  -[MAAsset purgeWithError:](self, "purgeWithError:", v6);
}

uint64_t __17__MAAsset_purge___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)purgeWithError:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1895A1E98]();
  uint64_t state = self->_state;
  if (state != 5)
  {
    assetType = self->_assetType;
    assetId = self->_assetId;
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __26__MAAsset_purgeWithError___block_invoke_2;
    v11[3] = &unk_189FFA4B0;
    v11[4] = self;
    id v12 = v4;
    _MAsendPurgeAsset(assetType, assetId, state, v11);
    uint64_t v8 = v12;
    goto LABEL_5;
  }

  if (v4)
  {
    _getClientCallbackQueue();
    id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __26__MAAsset_purgeWithError___block_invoke;
    block[3] = &unk_189FFA550;
    id v14 = v4;
    dispatch_async(v7, block);

    uint64_t v8 = v14;
LABEL_5:
  }

  objc_autoreleasePoolPop(v5);
}

void __26__MAAsset_purgeWithError___block_invoke(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MAError(@"com.apple.MobileAssetError.Purge", 7LL, @"%@", v3, v4, v5, v6, v7, (uint64_t)v2);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __26__MAAsset_purgeWithError___block_invoke_2(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  if (MEMORY[0x1895A2258]() == MEMORY[0x1895F9268])
  {
    uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 16LL);
    int64_t int64 = 5LL;
    stringForMAPurgeResult(5uLL);
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MAAsset purgeWithError:]_block_invoke_2",  @"Error on the purge asset reply for %@, response: %ld (%@) due to XPC_TYPE_ERROR",  v16,  v17,  v18,  v19,  v15);

    errorStringForMAPurgeResult(5LL);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    MAError(@"com.apple.MobileAssetError.Purge", 5LL, @"%@", v20, v21, v22, v23, v24, (uint64_t)v9);
    goto LABEL_5;
  }

  int64_t int64 = xpc_dictionary_get_int64(xdict, "Result");
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 16LL);
  stringForMAPurgeResult(int64);
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MAAsset purgeWithError:]_block_invoke_2",  @"Got the purge asset reply for %@, response: %ld (%@)",  v5,  v6,  v7,  v8,  v4);

  if (int64)
  {
    errorStringForMAPurgeResult(int64);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    MAError(@"com.apple.MobileAssetError.Purge", int64, @"%@", v10, v11, v12, v13, v14, (uint64_t)v9);
LABEL_5:
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }

  uint64_t v25 = 0LL;
LABEL_7:
  uint64_t v26 = *(void *)(a1 + 40);
  if (v26) {
    (*(void (**)(uint64_t, int64_t, void *))(v26 + 16))(v26, int64, v25);
  }
}

- (int64_t)purgeSync
{
  if (self->_state == 5) {
    return 7LL;
  }
  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v4, "AssetType", -[NSString UTF8String](self->_assetType, "UTF8String"));
  xpc_dictionary_set_string(v4, "AssetId", -[NSString UTF8String](self->_assetId, "UTF8String"));
  purpose = self->_purpose;
  if (purpose) {
    xpc_dictionary_set_string(v4, "Purpose", -[NSString UTF8String](purpose, "UTF8String"));
  }
  xpc_dictionary_set_uint64(v4, "messageAction", 5uLL);
  xpc_dictionary_set_uint64(v4, "assetState", self->_state);
  id v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s", getprogname());
  xpc_dictionary_set_string(v4, "clientName", (const char *)[v6 UTF8String]);
  unint64_t v29 = 5LL;
  _getCommsManager(v7, v8, v9, v10, v11, v12, v13, v14);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  [NSString stringWithUTF8String:"-[MAAsset purgeSync]"];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  id v17 = (id)[v15 sendSync:v4 gettingResponseCode:&v29 codeForXpcError:5 loggingName:v16];

  uint64_t v2 = v29;
  stringForMAPurgeResult(v29);
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MAAsset purgeSync]",  @"Result from purge sync: %ld (%@)",  v18,  v19,  v20,  v21,  v2);

  if (v2) {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MAAsset purgeSync]",  @"Purge sync check failure server side",  v22,  v23,  v24,  v25,  v27);
  }

  return v2;
}

+ (void)cancelCatalogDownload:(id)a3 withPurpose:(id)a4 then:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (void *)MEMORY[0x1895A1E98]();
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __50__MAAsset_cancelCatalogDownload_withPurpose_then___block_invoke;
  v13[3] = &unk_189FFA4B0;
  id v11 = v7;
  id v14 = v11;
  id v12 = v9;
  id v15 = v12;
  _MAsendCancelDownloadMetaData(v11, (uint64_t)v8, v13);

  objc_autoreleasePoolPop(v10);
}

void __50__MAAsset_cancelCatalogDownload_withPurpose_then___block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  if (MEMORY[0x1895A2258]() == MEMORY[0x1895F9268])
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"+[MAAsset cancelCatalogDownload:withPurpose:then:]_block_invoke",  @"Error on the cancel catalog asset reply",  v3,  v4,  v5,  v6,  v11);
  }

  else
  {
    xpc_dictionary_get_int64(xdict, "Result");
    _MobileAssetLog( 0LL,  6,  (uint64_t)"+[MAAsset cancelCatalogDownload:withPurpose:then:]_block_invoke",  @"Got the cancel catalog reply for %@, response: %ld",  v7,  v8,  v9,  v10,  *(void *)(a1 + 32));
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

+ (void)cancelCatalogDownload:(id)a3 then:(id)a4
{
}

- (void)cancelDownload:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1895A1E98]();
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MAAsset cancelDownload:]",  @"the current state is: %ld",  v6,  v7,  v8,  v9,  self->_state);
  if ((unint64_t)(self->_state - 5) > 1)
  {
    assetType = self->_assetType;
    assetId = self->_assetId;
    purpose = self->_purpose;
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    v15[2] = __26__MAAsset_cancelDownload___block_invoke_2;
    v15[3] = &unk_189FFA4B0;
    v15[4] = self;
    id v16 = v4;
    _MAsendCancelDownload(assetType, assetId, purpose, v15);
    uint64_t v11 = v16;
  }

  else
  {
    _getClientCallbackQueue();
    uint64_t v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __26__MAAsset_cancelDownload___block_invoke;
    block[3] = &unk_189FF9738;
    void block[4] = self;
    id v18 = v4;
    dispatch_async(v10, block);

    uint64_t v11 = v18;
  }

  objc_autoreleasePoolPop(v5);
}

uint64_t __26__MAAsset_cancelDownload___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 32LL) == 5LL) {
    uint64_t v1 = 6LL;
  }
  else {
    uint64_t v1 = 7LL;
  }
  return (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 40) + 16LL))(*(void *)(a1 + 40), v1);
}

void __26__MAAsset_cancelDownload___block_invoke_2(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  if (MEMORY[0x1895A2258]() == MEMORY[0x1895F9268])
  {
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 16LL);
    stringForMACancelDownloadResult(4uLL);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MAAsset cancelDownload:]_block_invoke_2",  @"Error on the cancel download asset reply for %@, response: %ld (%@)",  v11,  v12,  v13,  v14,  v10);
  }

  else
  {
    int64_t int64 = xpc_dictionary_get_int64(xdict, "Result");
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 16LL);
    stringForMACancelDownloadResult(int64);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MAAsset cancelDownload:]_block_invoke_2",  @"Got the cancel download asset reply for %@, response: %ld (%@)",  v6,  v7,  v8,  v9,  v4);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

- (int64_t)cancelDownloadSync
{
  int64_t state = self->_state;
  if ((unint64_t)(state - 5) > 1)
  {
    xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_string(v5, "AssetType", -[NSString UTF8String](self->_assetType, "UTF8String"));
    xpc_dictionary_set_string(v5, "AssetId", -[NSString UTF8String](self->_assetId, "UTF8String"));
    xpc_dictionary_set_uint64(v5, "messageAction", 6uLL);
    uint64_t v6 = (void *)NSString;
    uint64_t v24 = getprogname();
    id v7 = [v6 stringWithFormat:@"%s"];
    xpc_dictionary_set_string(v5, "clientName", (const char *)[v7 UTF8String]);
    uint64_t v25 = 4LL;
    _getCommsManager(v8, v9, v10, v11, v12, v13, v14, v15);
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    [NSString stringWithUTF8String:"-[MAAsset cancelDownloadSync]"];
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    id v18 = (id)[v16 sendSync:v5 gettingResponseCode:&v25 codeForXpcError:4 loggingName:v17];

    int64_t v3 = v25;
    if (v25) {
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MAAsset cancelDownloadSync]",  @"Cancel sync check failure server side",  v19,  v20,  v21,  v22,  (uint64_t)v24);
    }
  }

  else if (state == 5)
  {
    return 6LL;
  }

  else
  {
    return 7LL;
  }

  return v3;
}

- (void)configDownload:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x1895A1E98]();
  assetType = self->_assetType;
  assetId = self->_assetId;
  purpose = self->_purpose;
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __37__MAAsset_configDownload_completion___block_invoke;
  v13[3] = &unk_189FFA4B0;
  void v13[4] = self;
  id v12 = v7;
  id v14 = v12;
  _MAsendConfigDownload(assetType, assetId, purpose, v6, v13);

  objc_autoreleasePoolPop(v8);
}

void __37__MAAsset_configDownload_completion___block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  if (MEMORY[0x1895A2258]() == MEMORY[0x1895F9268])
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MAAsset configDownload:completion:]_block_invoke",  @"Error on the cancel download asset reply",  v3,  v4,  v5,  v6,  v14);
    int64_t int64 = 2LL;
  }

  else
  {
    int64_t int64 = xpc_dictionary_get_int64(xdict, "Result");
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 16LL);
    stringForMAOperationResult(int64);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MAAsset configDownload:completion:]_block_invoke",  @"Got the config download reply for %@, response: %ld (%@)",  v9,  v10,  v11,  v12,  v8);
  }

  uint64_t v13 = *(void *)(a1 + 40);
  if (v13) {
    (*(void (**)(uint64_t, int64_t))(v13 + 16))(v13, int64);
  }
}

- (int64_t)configDownloadSync:(id)a3
{
  id v4 = a3;
  xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v5, "AssetType", -[NSString UTF8String](self->_assetType, "UTF8String"));
  xpc_dictionary_set_string(v5, "AssetId", -[NSString UTF8String](self->_assetId, "UTF8String"));
  if (isWellFormedPurpose(self->_purpose))
  {
    uint64_t v10 = -[NSString UTF8String](self->_purpose, "UTF8String");
    if (v10) {
      xpc_dictionary_set_string(v5, "Purpose", v10);
    }
    xpc_dictionary_set_uint64(v5, "messageAction", 0x13uLL);
    id v11 = objc_msgSend(NSString, "stringWithFormat:", @"%s", getprogname());
    xpc_dictionary_set_string(v5, "clientName", (const char *)[v11 UTF8String]);
    [v4 encodeAsPlist];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = addObjectToMessage(v12, v5, "downloadConfigLength", "downloadConfig");
    unint64_t v32 = 4LL;
    _getCommsManager(v13, v14, v15, v16, v17, v18, v19, v20);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    [NSString stringWithUTF8String:"-[MAAsset configDownloadSync:]"];
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    id v23 = (id)[v21 sendSync:v5 gettingResponseCode:&v32 codeForXpcError:1 loggingName:v22];

    uint64_t v24 = v32;
    if (v32)
    {
      stringForMAOperationResult(v32);
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MAAsset configDownloadSync:]",  @"Config download sync check failure server side: %lld (%@)",  v25,  v26,  v27,  v28,  v24);
    }
  }

  else
  {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MAAsset configDownloadSync:]",  @"Config download failure due to invalid purpose",  v6,  v7,  v8,  v9,  v30);
    id v11 = 0LL;
    uint64_t v12 = 0LL;
    uint64_t v24 = 2LL;
  }

  return v24;
}

- (BOOL)overrideGarbageCollectionThreshold:(unint64_t)a3
{
  xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v5, "AssetType", -[NSString UTF8String](self->_assetType, "UTF8String"));
  xpc_dictionary_set_string(v5, "AssetId", -[NSString UTF8String](self->_assetId, "UTF8String"));
  xpc_dictionary_set_uint64(v5, "GCOverrideDays", a3);
  xpc_dictionary_set_uint64(v5, "messageAction", 0x19uLL);
  unint64_t v29 = 4LL;
  _getCommsManager(v6, v7, v8, v9, v10, v11, v12, v13);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [NSString stringWithUTF8String:"-[MAAsset overrideGarbageCollectionThreshold:]"];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  id v16 = (id)[v14 sendSync:v5 gettingResponseCode:&v29 codeForXpcError:1 loggingName:v15];

  uint64_t v17 = v29;
  stringForMAOperationResult(v29);
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MAAsset overrideGarbageCollectionThreshold:]",  @"Result from overrideGarbageCollectionThreshold: %ld (%@)",  v18,  v19,  v20,  v21,  v17);

  if (v17) {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MAAsset overrideGarbageCollectionThreshold:]",  @"overrideGarbageCollectionThreshold failure server side",  v22,  v23,  v24,  v25,  v27);
  }

  return v17 == 0;
}

- (BOOL)spaceCheck:(int64_t *)a3
{
  xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
  int64_t v41 = 0LL;
  if (determineUnarchiveSizeFromAttributes(self->_attributes, &v41))
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%lld", v41);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = (const char *)[@"_UnarchivedSize" UTF8String];
    id v12 = v10;
    xpc_dictionary_set_string(v5, v11, (const char *)[v12 UTF8String]);
    xpc_dictionary_set_uint64(v5, "messageAction", 0x11uLL);
    id v13 = objc_msgSend(NSString, "stringWithFormat:", @"%s", getprogname());
    xpc_dictionary_set_string(v5, "clientName", (const char *)[v13 UTF8String]);
    unint64_t v40 = 4LL;
    _getCommsManager(v14, v15, v16, v17, v18, v19, v20, v21);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    [NSString stringWithUTF8String:"-[MAAsset spaceCheck:]"];
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    id v24 = (id)[v22 sendSync:v5 gettingResponseCode:&v40 codeForXpcError:1 loggingName:v23];

    uint64_t v25 = v40;
    stringForMAOperationResult(v40);
    id v39 = (void *)objc_claimAutoreleasedReturnValue();
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MAAsset spaceCheck:]",  @"Result from space check: %ld (%@)",  v26,  v27,  v28,  v29,  v25);

    if (v25)
    {
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MAAsset spaceCheck:]",  @"Space check failure server side",  v30,  v31,  v32,  v33,  v38);
      uint64_t v34 = 1LL;
      if (!a3) {
        goto LABEL_9;
      }
    }

    else
    {
      uint64_t v34 = 0LL;
      if (!a3) {
        goto LABEL_9;
      }
    }

    goto LABEL_8;
  }

  int64_t v41 = 1000000LL;
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MAAsset spaceCheck:]",  @"Unable to get unarchived size for asset. Using default of %lld for non-local asset.",  v6,  v7,  v8,  v9,  1000000LL);
  BOOL v35 = -[MAAsset wasLocal](self, "wasLocal");
  id v12 = 0LL;
  id v13 = 0LL;
  uint64_t v34 = 2LL;
  if (v35) {
    uint64_t v34 = 0LL;
  }
  if (a3) {
LABEL_8:
  }
    *a3 = v41;
LABEL_9:
  BOOL v36 = v34 == 0;

  return v36;
}

- (BOOL)refreshState
{
  xpc_object_t v3 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v3, "AssetType", -[NSString UTF8String](self->_assetType, "UTF8String"));
  xpc_dictionary_set_string(v3, "AssetId", -[NSString UTF8String](self->_assetId, "UTF8String"));
  xpc_dictionary_set_uint64(v3, "messageAction", 8uLL);
  id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", getprogname());
  xpc_dictionary_set_string(v3, "clientName", (const char *)[v4 UTF8String]);
  purpose = self->_purpose;
  if (purpose)
  {
    xpc_dictionary_set_string(v3, "Purpose", -[NSString UTF8String](purpose, "UTF8String"));
    if (self->_purpose) {
      _MobileAssetLog( 0LL,  7,  (uint64_t)"-[MAAsset refreshState]",  @"Refreshing with purpose: %@",  v8,  v9,  v10,  v11,  (uint64_t)self->_purpose);
    }
  }

  unint64_t v43 = 4LL;
  _getCommsManager((uint64_t)purpose, v5, v6, v7, v8, v9, v10, v11);
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  [NSString stringWithUTF8String:"-[MAAsset refreshState]"];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 sendSync:v3 gettingResponseCode:&v43 codeForXpcError:1 loggingName:v14];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v16 = v43;
  if (v43)
  {
    stringForMAOperationResult(v43);
    unint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MAAsset refreshState]",  @"State refresh failure server side: %ld (%@)",  v17,  v18,  v19,  v20,  v16);
  }

  else
  {
    int64_t int64 = xpc_dictionary_get_int64(v15, "StateResult");
    if (int64)
    {
      unint64_t v23 = int64;
      int64_t state = self->_state;
      stringForMAAssetState(state);
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
      stringForMAAssetState(v23);
      int64_t v41 = (void *)objc_claimAutoreleasedReturnValue();
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MAAsset refreshState]",  @"Old state: %ld (%@) --> new state: %lld (%@)",  v26,  v27,  v28,  v29,  state);

      self->_int64_t state = v23;
      _MobileAssetLog( 0LL,  7,  (uint64_t)"-[MAAsset refreshState]",  @"Refresh state completed with result:%ld success:%@",  v30,  v31,  v32,  v33,  0LL);
      BOOL v21 = 1;
      goto LABEL_9;
    }

    assetType = self->_assetType;
    stringForMAAssetState(self->_state);
    uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MAAsset refreshState]",  @"Could not determine state for %@ asset %@; leaving state the same %ld (%@).",
      v36,
      v37,
      v38,
      v39,
      (uint64_t)assetType);
  }

  BOOL v21 = 0;
LABEL_9:

  return v21;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MAAsset assetId](self, "assetId");
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 assetId];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    char v7 = [v5 isEqualToString:v6];
  }

  else
  {
    char v7 = 0;
  }

  return v7;
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (NSString)assetType
{
  return self->_assetType;
}

- (NSString)assetId
{
  return self->_assetId;
}

- (int64_t)state
{
  return self->_state;
}

- (NSString)purpose
{
  return self->_purpose;
}

- (void).cxx_destruct
{
}

@end