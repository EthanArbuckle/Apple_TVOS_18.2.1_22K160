@interface MAManifestStorageService
- (BOOL)_assetTypeSupported:(id)a3;
- (BOOL)_parseSelector:(id)a3 assetType:(id *)a4 specifier:(id *)a5;
- (BOOL)_writeManifest:(id)a3 destination:(id)a4 error:(id *)a5;
- (MAManifestStorageService)init;
- (NSString)repositoryPath;
- (OS_dispatch_queue)queue;
- (id)_errorWithCode:(unint64_t)a3;
- (id)_errorWithCode:(unint64_t)a3 underlyingError:(id)a4;
- (id)_errorWithCode:(unint64_t)a3 underlyingPOSIXError:(int)a4;
- (id)_manifestPathForAssetType:(id)a3 specifier:(id)a4 stage:(BOOL)a5;
- (id)_normalizedIdentifier:(id)a3;
- (id)commitStagedManifestsForSelectors:(id)a3;
- (id)invalidateManifestForAssetType:(id)a3 specifier:(id)a4;
- (id)storeManifest:(id)a3 infoPlist:(id)a4 stage:(BOOL)a5;
- (int)_authenticatePlist:(id)a3 manifest:(id)a4 result:(id *)a5;
- (int)_flashManifest:(id)a3;
- (void)_logBase64Data:(id)a3 description:(id)a4;
- (void)commitStagedManifestsForSelectors:(id)a3 completion:(id)a4;
- (void)invalidateManifestForAssetType:(id)a3 specifier:(id)a4 completion:(id)a5;
- (void)setQueue:(id)a3;
- (void)storeManifest:(id)a3 infoPlist:(id)a4 stage:(BOOL)a5 completion:(id)a6;
@end

@implementation MAManifestStorageService

- (MAManifestStorageService)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MAManifestStorageService;
  v2 = -[MAManifestStorageService init](&v6, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("Manifest Storage Queue", 0LL);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }

  return v2;
}

- (NSString)repositoryPath
{
  id RepositoryPath = getRepositoryPath(@"/private/var/MobileAsset/AssetsV2");
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(RepositoryPath);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:@"manifests"]);

  return (NSString *)v4;
}

- (void)storeManifest:(id)a3 infoPlist:(id)a4 stage:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MAManifestStorageService queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100003B88;
  block[3] = &unk_100008370;
  BOOL v21 = a5;
  block[4] = self;
  id v18 = v10;
  id v19 = v11;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v13, block);
}

- (void)commitStagedManifestsForSelectors:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MAManifestStorageService queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100003CE0;
  block[3] = &unk_100008398;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)invalidateManifestForAssetType:(id)a3 specifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MAManifestStorageService queue](self, "queue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100003E50;
  v15[3] = &unk_1000083C0;
  id v16 = v8;
  id v17 = v9;
  id v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (id)storeManifest:(id)a3 infoPlist:(id)a4 stage:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (![v8 length])
  {
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MAManifestStorageService storeManifest:infoPlist:stage:]",  @"Manifest is nil or empty",  v10,  v11,  v12,  v13,  v42);
    id v20 = self;
    uint64_t v21 = 2LL;
LABEL_7:
    uint64_t v19 = objc_claimAutoreleasedReturnValue(-[MAManifestStorageService _errorWithCode:](v20, "_errorWithCode:", v21));
    goto LABEL_8;
  }

  if (![v9 length])
  {
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MAManifestStorageService storeManifest:infoPlist:stage:]",  @"Info plist is nil or empty",  v14,  v15,  v16,  v17,  v42);
    id v20 = self;
    uint64_t v21 = 4LL;
    goto LABEL_7;
  }

  uint64_t v18 = -[MAManifestStorageService _flashManifest:](self, "_flashManifest:", v8);
  if (!(_DWORD)v18)
  {
    id v44 = 0LL;
    uint64_t v24 = -[MAManifestStorageService _authenticatePlist:manifest:result:]( self,  "_authenticatePlist:manifest:result:",  v9,  v8,  &v44);
    id v25 = v44;
    v26 = v25;
    if ((_DWORD)v24)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue( -[MAManifestStorageService _errorWithCode:underlyingPOSIXError:]( self,  "_errorWithCode:underlyingPOSIXError:",  5LL,  v24));
LABEL_22:

      goto LABEL_9;
    }

    v27 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:kCFBundleIdentifierKey]);
    v28 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:kCFBundleNameKey]);
    if ([v27 length] && objc_msgSend(v28, "length"))
    {
      if (-[MAManifestStorageService _assetTypeSupported:](self, "_assetTypeSupported:", v27))
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue( -[MAManifestStorageService _manifestPathForAssetType:specifier:stage:]( self,  "_manifestPathForAssetType:specifier:stage:",  v27,  v28,  v5));
        id v43 = 0LL;
        unsigned __int8 v38 = -[MAManifestStorageService _writeManifest:destination:error:]( self,  "_writeManifest:destination:error:",  v8,  v37,  &v43);
        id v39 = v43;
        v22 = 0LL;
        if ((v38 & 1) == 0) {
          v22 = (void *)objc_claimAutoreleasedReturnValue( -[MAManifestStorageService _errorWithCode:underlyingError:]( self,  "_errorWithCode:underlyingError:",  7LL,  v39));
        }

        goto LABEL_21;
      }

      _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MAManifestStorageService storeManifest:infoPlist:stage:]",  @"Asset type is unsupported: %@",  v33,  v34,  v35,  v36,  (uint64_t)v27);
      v40 = self;
      uint64_t v41 = 9LL;
    }

    else
    {
      _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MAManifestStorageService storeManifest:infoPlist:stage:]",  @"Asset type (%@) or specifier (%@) missing",  v29,  v30,  v31,  v32,  (uint64_t)v27);
      v40 = self;
      uint64_t v41 = 6LL;
    }

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MAManifestStorageService _errorWithCode:](v40, "_errorWithCode:", v41));
LABEL_21:

    goto LABEL_22;
  }

  uint64_t v19 = objc_claimAutoreleasedReturnValue( -[MAManifestStorageService _errorWithCode:underlyingPOSIXError:]( self,  "_errorWithCode:underlyingPOSIXError:",  3LL,  v18));
LABEL_8:
  v22 = (void *)v19;
LABEL_9:

  return v22;
}

- (int)_flashManifest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = image4_environment_new(&_image4_coprocessor_cryptex1, 5LL);
  uint64_t v23 = v5;
  if (v5)
  {
    uint64_t v10 = v5;
    id v11 = v4;
    uint64_t v12 = image4_environment_flash(v10, [v11 bytes], objc_msgSend(v11, "length"), 0, 0);
    image4_environment_destroy(&v23);
    if ((_DWORD)v12)
    {
      strerror(v12);
      _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MAManifestStorageService _flashManifest:]",  @"Failed to flash manifest: %d (%s)",  v17,  v18,  v19,  v20,  v12);
      -[MAManifestStorageService _logBase64Data:description:]( self,  "_logBase64Data:description:",  v11,  @"failing manifest");
    }

    else
    {
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MAManifestStorageService _flashManifest:]",  @"Successfully flashed manifest",  v13,  v14,  v15,  v16,  v22);
    }
  }

  else
  {
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MAManifestStorageService _flashManifest:]",  @"Failed to instantiate environment",  v6,  v7,  v8,  v9,  v22);
    LODWORD(v12) = 12;
  }

  return v12;
}

- (int)_authenticatePlist:(id)a3 manifest:(id)a4 result:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = image4_environment_new(&_image4_coprocessor_cryptex1, 5LL);
  uint64_t v33 = v10;
  if (v10)
  {
    uint64_t v15 = v10;
    id v16 = v9;
    uint64_t v32 = image4_trust_new( v15,  &_image4_trust_evaluation_exec,  [v16 bytes],  objc_msgSend(v16, "length"),  0);
    id v17 = v8;
    image4_trust_set_payload(v32, 1734962790, [v17 bytes], objc_msgSend(v17, "length"));
    *(void *)__errnum = 0LL;
    id v31 = 0LL;
    image4_trust_evaluate(v32, __errnum, sub_100004470);
    image4_trust_destroy(&v32);
    image4_environment_destroy(&v33);
    uint64_t v22 = __errnum[0];
    if (__errnum[0])
    {
      strerror(__errnum[0]);
      _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MAManifestStorageService _authenticatePlist:manifest:result:]",  @"Plist trust evaluation failed: %d (%s)",  v23,  v24,  v25,  v26,  v22);
      -[MAManifestStorageService _logBase64Data:description:]( self,  "_logBase64Data:description:",  v16,  @"failing manifest");
      -[MAManifestStorageService _logBase64Data:description:]( self,  "_logBase64Data:description:",  v17,  @"failing payload");
      int v27 = __errnum[0];
    }

    else
    {
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MAManifestStorageService _authenticatePlist:manifest:result:]",  @"Authenticated plist: %@",  v18,  v19,  v20,  v21,  (uint64_t)v31);
      int v27 = 0;
      *a5 = v31;
    }
  }

  else
  {
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MAManifestStorageService _authenticatePlist:manifest:result:]",  @"Failed to instantiate environment",  v11,  v12,  v13,  v14,  v29);
    int v27 = 12;
  }

  return v27;
}

- (BOOL)_assetTypeSupported:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MASecureMobileAssetTypes sharedInstance](&OBJC_CLASS___MASecureMobileAssetTypes, "sharedInstance"));
  unsigned __int8 v5 = [v4 supportsDarwin:v3];

  return v5;
}

- (BOOL)_writeManifest:(id)a3 destination:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByDeletingLastPathComponent]);
  [v9 createDirectoryAtPath:v10 withIntermediateDirectories:1 attributes:0 error:0];
  [v9 removeItemAtPath:v7 error:0];
  unsigned int v11 = [v8 writeToFile:v7 options:0 error:a5];

  if (v11) {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MAManifestStorageService _writeManifest:destination:error:]",  @"Wrote manifest to %@",  v12,  v13,  v14,  v15,  (uint64_t)v7);
  }

  return v11;
}

- (id)commitStagedManifestsForSelectors:(id)a3
{
  id v4 = a3;
  size_t v5 = (size_t)[v4 count];
  v57 = (char *)calloc(v5, 0x18uLL);
  v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  if (!v5)
  {
    v53 = 0LL;
    goto LABEL_37;
  }

  uint64_t v6 = 0LL;
  id v7 = (unsigned __int8 *)(v57 + 16);
  size_t v55 = v5;
  id v56 = v4;
  v62 = self;
  do
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:v6]);
    id v65 = 0LL;
    id v66 = 0LL;
    unsigned __int8 v9 = -[MAManifestStorageService _parseSelector:assetType:specifier:]( self,  "_parseSelector:assetType:specifier:",  v8,  &v66,  &v65);
    id v10 = v66;
    id v15 = v65;
    if ((v9 & 1) == 0)
    {
      _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MAManifestStorageService commitStagedManifestsForSelectors:]",  @"Selector missing type or specifier: %@",  v11,  v12,  v13,  v14,  (uint64_t)v8);
      uint64_t v60 = objc_claimAutoreleasedReturnValue( -[MAManifestStorageService _errorWithCode:underlyingPOSIXError:]( self,  "_errorWithCode:underlyingPOSIXError:",  10LL,  22LL));
      int v22 = 1;
      goto LABEL_14;
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue( -[MAManifestStorageService _manifestPathForAssetType:specifier:stage:]( self,  "_manifestPathForAssetType:specifier:stage:",  v10,  v15,  1LL));
    id v17 = (void *)objc_claimAutoreleasedReturnValue( -[MAManifestStorageService _manifestPathForAssetType:specifier:stage:]( self,  "_manifestPathForAssetType:specifier:stage:",  v10,  v15,  0LL));
    if ([v63 fileExistsAtPath:v16])
    {
      v59 = (void *)objc_claimAutoreleasedReturnValue([v17 stringByDeletingLastPathComponent]);
      if ([v63 fileExistsAtPath:v59])
      {
        v58 = 0LL;
      }

      else
      {
        id v64 = 0LL;
        unsigned __int8 v23 = [v63 createDirectoryAtPath:v59 withIntermediateDirectories:1 attributes:0 error:&v64];
        id v24 = v64;
        v58 = v24;
        if ((v23 & 1) == 0)
        {
          id v33 = v24;
          _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MAManifestStorageService commitStagedManifestsForSelectors:]",  @"Failed to create containing directory: %@",  v25,  v26,  v27,  v28,  (uint64_t)v24);
          uint64_t v60 = objc_claimAutoreleasedReturnValue( -[MAManifestStorageService _errorWithCode:underlyingError:]( v62,  "_errorWithCode:underlyingError:",  10LL,  v33));
          int v22 = 1;
          goto LABEL_12;
        }
      }

      id v29 = [v16 fileSystemRepresentation];
      id v30 = v17;
      id v31 = [v30 fileSystemRepresentation];
      unsigned __int8 v32 = [v63 fileExistsAtPath:v30];
      int v22 = 0;
      *((void *)v7 - 2) = v29;
      *((void *)v7 - 1) = v31;
      *id v7 = v32;
      *((_DWORD *)v7 + 1) = 0;
      size_t v5 = v55;
      id v4 = v56;
LABEL_12:

      goto LABEL_13;
    }

    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MAManifestStorageService commitStagedManifestsForSelectors:]",  @"Staged manifest does not exist: %@",  v18,  v19,  v20,  v21,  (uint64_t)v16);
    uint64_t v60 = objc_claimAutoreleasedReturnValue( -[MAManifestStorageService _errorWithCode:underlyingPOSIXError:]( self,  "_errorWithCode:underlyingPOSIXError:",  10LL,  2LL));
    int v22 = 1;
LABEL_13:

LABEL_14:
    if (v22)
    {
      v53 = (void *)v60;
      goto LABEL_37;
    }

    ++v6;
    v7 += 24;
    self = v62;
  }

  while (v5 != v6);
  uint64_t v34 = v57 + 16;
  size_t v35 = v5;
  do
  {
    uint64_t v36 = (const char *)*((void *)v34 - 2);
    v37 = (const char *)*((void *)v34 - 1);
    if ((*v34 & 1) != 0)
    {
      if (!renamex_np(v36, v37, 2u)) {
        goto LABEL_23;
      }
    }

    else if (!rename(v36, v37))
    {
      goto LABEL_23;
    }

    if (*__error()) {
      __error();
    }
LABEL_23:
    v34 += 24;
    --v35;
  }

  while (v35);
  uint64_t v38 = 0LL;
  uint64_t v39 = -(uint64_t)v5;
  char v40 = 1;
LABEL_25:
  char v61 = v40;
  uint64_t v41 = &v57[24 * v38++];
  do
  {
    uint64_t v42 = *(void *)v41;
    int v43 = *((_DWORD *)v41 + 5);
    id v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", *(void *)v41));
    [v63 removeItemAtPath:v44 error:0];

    if (v43)
    {
      strerror(v43);
      _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MAManifestStorageService commitStagedManifestsForSelectors:]",  @"Commit %s -> %s failed: %d %s",  v49,  v50,  v51,  v52,  v42);
      char v40 = 0;
      if (v39 + v38) {
        goto LABEL_25;
      }
      goto LABEL_35;
    }

    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MAManifestStorageService commitStagedManifestsForSelectors:]",  @"Commit %s -> %s succeeded",  v45,  v46,  v47,  v48,  v42);
    v41 += 24;
    ++v38;
  }

  while (v39 + v38 != 1);
  if ((v61 & 1) != 0)
  {
    v53 = 0LL;
    goto LABEL_36;
  }

- (id)invalidateManifestForAssetType:(id)a3 specifier:(id)a4
{
  if (!a3 || !a4)
  {
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MAManifestStorageService invalidateManifestForAssetType:specifier:]",  @"Missing asset type (%@) or specifier (%@)",  v4,  v5,  v6,  v7,  (uint64_t)a3);
    return (id)objc_claimAutoreleasedReturnValue( -[MAManifestStorageService _errorWithCode:underlyingPOSIXError:]( self,  "_errorWithCode:underlyingPOSIXError:",  8LL,  22LL));
  }

  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue( -[MAManifestStorageService _manifestPathForAssetType:specifier:stage:]( self,  "_manifestPathForAssetType:specifier:stage:"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 stringByDeletingLastPathComponent]);

  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MAManifestStorageService invalidateManifestForAssetType:specifier:]",  @"Removing %@",  v11,  v12,  v13,  v14,  (uint64_t)v10);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v28 = 0LL;
  unsigned __int8 v16 = [v15 removeItemAtPath:v10 error:&v28];
  id v17 = v28;

  uint64_t v18 = 0LL;
  if ((v16 & 1) == 0)
  {
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v17 userInfo]);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:NSUnderlyingErrorKey]);

    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 domain]);
    if ([v21 isEqualToString:NSPOSIXErrorDomain])
    {
      id v22 = [v20 code];

      if (v22 == (id)2)
      {
        _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MAManifestStorageService invalidateManifestForAssetType:specifier:]",  @"Ignoring ENOENT for %@",  v23,  v24,  v25,  v26,  (uint64_t)v10);
        uint64_t v18 = 0LL;
LABEL_10:

        goto LABEL_11;
      }
    }

    else
    {
    }

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( -[MAManifestStorageService _errorWithCode:underlyingError:]( self,  "_errorWithCode:underlyingError:",  8LL,  v17));
    goto LABEL_10;
  }

- (id)_manifestPathForAssetType:(id)a3 specifier:(id)a4 stage:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MAManifestStorageService repositoryPath](self, "repositoryPath"));
  uint64_t v11 = v10;
  if (v5)
  {
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v10 stringByAppendingPathComponent:@"staged"]);

    uint64_t v11 = (void *)v12;
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[MAManifestStorageService _normalizedIdentifier:](self, "_normalizedIdentifier:", v8));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v11 stringByAppendingPathComponent:v13]);

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MAManifestStorageService _normalizedIdentifier:](self, "_normalizedIdentifier:", v9));
  unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue([v14 stringByAppendingPathComponent:v15]);

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 stringByAppendingPathComponent:@"SecureMobileAssetCryptex1Ticket.img4"]);
  return v17;
}

- (id)_normalizedIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v3,  "stringByReplacingOccurrencesOfString:withString:options:range:",  @".",  @"_",  2,  0,  objc_msgSend(v3, "length")));

  return v4;
}

- (BOOL)_parseSelector:(id)a3 assetType:(id *)a4 specifier:(id *)a5
{
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 componentsSeparatedByString:@":"]);
  if ([v8 count] == (id)2)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:0]);
    uint64_t v14 = objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:1]);
    uint64_t v19 = (void *)v14;
    if (v13) {
      BOOL v20 = v14 == 0;
    }
    else {
      BOOL v20 = 1;
    }
    BOOL v21 = !v20;
    if (v20)
    {
      _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MAManifestStorageService _parseSelector:assetType:specifier:]",  @"Invalid selector: %@",  v15,  v16,  v17,  v18,  (uint64_t)v7);
    }

    else
    {
      *a4 = v13;
      *a5 = v19;
    }
  }

  else
  {
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MAManifestStorageService _parseSelector:assetType:specifier:]",  @"Invalid selector: %@",  v9,  v10,  v11,  v12,  (uint64_t)v7);
    BOOL v21 = 0;
  }

  return v21;
}

- (void)_logBase64Data:(id)a3 description:(id)a4
{
  id v10 = a4;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([a3 base64EncodedStringWithOptions:0]);
  _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MAManifestStorageService _logBase64Data:description:]",  @"%@:<<<<<<<<<<\n%@%@:>>>>>>>>>>",  v5,  v6,  v7,  v8,  (uint64_t)v10);
}

- (id)_errorWithCode:(unint64_t)a3
{
  return -[MAManifestStorageService _errorWithCode:underlyingError:](self, "_errorWithCode:underlyingError:", a3, 0LL);
}

- (id)_errorWithCode:(unint64_t)a3 underlyingError:(id)a4
{
  id v5 = a4;
  uint64_t v6 = v5;
  if (v5)
  {
    NSErrorUserInfoKey v10 = NSUnderlyingErrorKey;
    id v11 = v5;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"ManifestStorageServiceErrorDomain",  a3,  v7));

  return v8;
}

- (id)_errorWithCode:(unint64_t)a3 underlyingPOSIXError:(int)a4
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  a4,  0LL));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[MAManifestStorageService _errorWithCode:underlyingError:]( self,  "_errorWithCode:underlyingError:",  a3,  v6));

  return v7;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end