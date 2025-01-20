@interface GEOMAResource
+ (BOOL)_fixPermissionsAndRemoveResourceAt:(id)a3 error:(id *)a4;
+ (BOOL)_removeResourceAt:(id)a3 error:(id *)a4;
+ (BOOL)removeResourceAt:(id)a3 error:(id *)a4;
+ (void)onFileAccessQueueAsync:(id)a3;
+ (void)onFileAccessQueueSync:(id)a3;
- (BOOL)isAvailableForUse;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOnDisk;
- (BOOL)remove:(id *)a3;
- (GEOMAResource)initWithMobileAsset:(id)a3 info:(id)a4;
- (GEOMAResource)initWithResourceFolder:(id)a3 info:(id)a4;
- (GEOMAResourceInfo)resourceInfo;
- (NSDictionary)attributes;
- (NSString)assetId;
- (NSString)contentVersion;
- (id)_getLocalFileUrl;
- (id)_getPlistURL;
- (id)description;
- (id)getLocalFileUrl;
- (int64_t)compare:(id)a3;
- (int64_t)state;
- (unint64_t)hash;
- (unint64_t)size;
- (void)_relocateOnQueue:(id)a3 completion:(id)a4;
- (void)downloadWithOptions:(id)a3;
- (void)downloadWithOptions:(id)a3 queue:(id)a4 completion:(id)a5;
@end

@implementation GEOMAResource

- (GEOMAResource)initWithMobileAsset:(id)a3 info:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___GEOMAResource;
  v9 = -[GEOMAResource init](&v15, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_asset, a3);
    uint64_t v11 = objc_claimAutoreleasedReturnValue(-[MAAsset attributes](v10->_asset, "attributes"));
    attributes = v10->_attributes;
    v10->_attributes = (NSDictionary *)v11;

    cacheURL = v10->_cacheURL;
    v10->_cacheURL = 0LL;

    objc_storeStrong((id *)&v10->_info, a4);
  }

  return v10;
}

- (GEOMAResource)initWithResourceFolder:(id)a3 info:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___GEOMAResource;
  v9 = -[GEOMAResource init](&v24, "init");
  v10 = v9;
  if (!v9) {
    goto LABEL_5;
  }
  objc_storeStrong((id *)&v9->_cacheURL, a3);
  objc_storeStrong((id *)&v10->_info, a4);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[GEOMAResource _getPlistURL](v10, "_getPlistURL"));
  id v23 = 0LL;
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfURL:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfURL:options:error:",  v11,  0LL,  &v23));
  id v13 = v23;
  if (!v12)
  {
    id v18 = sub_100018084();
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138478083;
      v26 = v11;
      __int16 v27 = 2112;
      id v28 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "Unable to read plist at %{private}@: %@",  buf,  0x16u);
    }

    goto LABEL_11;
  }

  id v22 = 0LL;
  uint64_t v14 = objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization propertyListWithData:options:format:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "propertyListWithData:options:format:error:",  v12,  0LL,  0LL,  &v22));
  id v15 = v22;

  attributes = v10->_attributes;
  v10->_attributes = (NSDictionary *)v14;

  if (!v10->_attributes)
  {
    id v20 = sub_100018084();
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138478083;
      v26 = v11;
      __int16 v27 = 2112;
      id v28 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "Unable to decode plist at %{private}@: %@",  buf,  0x16u);
    }

    id v13 = v15;
LABEL_11:

    v17 = 0LL;
    goto LABEL_12;
  }

LABEL_5:
  v17 = v10;
LABEL_12:

  return v17;
}

- (NSString)assetId
{
  asset = self->_asset;
  if (asset) {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MAAsset assetId](asset, "assetId"));
  }
  else {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL lastPathComponent](self->_cacheURL, "lastPathComponent"));
  }
  return (NSString *)v4;
}

- (BOOL)isAvailableForUse
{
  return self->_cacheURL != 0LL;
}

- (BOOL)isOnDisk
{
  unint64_t v2 = -[GEOMAResource state](self, "state");
  return (v2 < 7) & (0x6Cu >> v2);
}

- (int64_t)state
{
  if (self->_cacheURL) {
    return 2LL;
  }
  asset = self->_asset;
  if (asset) {
    return (int64_t)-[MAAsset state](asset, "state");
  }
  else {
    return 1LL;
  }
}

- (id)_getLocalFileUrl
{
  if (self->_asset)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOMAResourceInfo baseURL](self->_info, "baseURL"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MAAsset assetId](self->_asset, "assetId"));
    v5 = (NSURL *)objc_claimAutoreleasedReturnValue([v3 URLByAppendingPathComponent:v4 isDirectory:1]);
  }

  else
  {
    v5 = self->_cacheURL;
  }

  return v5;
}

- (id)_getPlistURL
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[GEOMAResource _getLocalFileUrl](self, "_getLocalFileUrl"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 URLByAppendingPathComponent:@".MAAttributes.plist"]);

  return v3;
}

- (id)getLocalFileUrl
{
  asset = self->_asset;
  if (asset && (-[MAAsset state](asset, "state") == (id)2 || -[MAAsset state](self->_asset, "state") == (id)3)) {
    v4 = (NSURL *)objc_claimAutoreleasedReturnValue(-[GEOMAResource _getLocalFileUrl](self, "_getLocalFileUrl"));
  }
  else {
    v4 = self->_cacheURL;
  }
  return v4;
}

- (unint64_t)size
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[GEOMAResource attributes](self, "attributes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"_UnarchivedSize"]);
  id v4 = [v3 unsignedLongLongValue];

  return (unint64_t)v4;
}

- (NSString)contentVersion
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[GEOMAResource attributes](self, "attributes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKeyedSubscript:@"_ContentVersion"]);

  return (NSString *)v3;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOMAResource contentVersion](self, "contentVersion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 contentVersion]);
  int64_t v7 = (int64_t)[v5 compare:v6];

  if (!v7)
  {
    id v8 = -[GEOMAResource state](self, "state");
    if (v8 == [v4 state])
    {
      int64_t v7 = 0LL;
      goto LABEL_15;
    }

    if ((id)-[GEOMAResource state](self, "state") == (id)2) {
      goto LABEL_14;
    }
    if ([v4 state] == (id)2) {
      goto LABEL_12;
    }
    if ((id)-[GEOMAResource state](self, "state") == (id)3) {
      goto LABEL_14;
    }
    if ([v4 state] == (id)3) {
      goto LABEL_12;
    }
    if ((id)-[GEOMAResource state](self, "state") == (id)5) {
      goto LABEL_14;
    }
    if ([v4 state] == (id)5)
    {
LABEL_12:
      int64_t v7 = -1LL;
      goto LABEL_15;
    }

    if ((id)-[GEOMAResource state](self, "state") == (id)6) {
      goto LABEL_14;
    }
    if ([v4 state] == (id)6) {
      goto LABEL_12;
    }
    if ((id)-[GEOMAResource state](self, "state") == (id)4)
    {
LABEL_14:
      int64_t v7 = 1LL;
      goto LABEL_15;
    }

    if ([v4 state] == (id)4) {
      int64_t v7 = -1LL;
    }
    else {
      int64_t v7 = 0LL;
    }
  }

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___GEOMAResource, v5, v6);
  if ((objc_opt_isKindOfClass(v4, v7) & 1) != 0)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[GEOMAResource assetId](self, "assetId"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 assetId]);
    unsigned __int8 v10 = [v8 isEqual:v9];
  }

  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[GEOMAResource assetId](self, "assetId"));
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (void)downloadWithOptions:(id)a3
{
}

- (void)downloadWithOptions:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8 = a3;
  global_queue = (dispatch_queue_s *)a4;
  id v10 = a5;
  if (!global_queue)
  {
    uint64_t v11 = qos_class_self();
    global_queue = (dispatch_queue_s *)geo_get_global_queue(v11);
  }

  asset = self->_asset;
  if (asset)
  {
    unint64_t v13 = (unint64_t)-[MAAsset state](asset, "state");
    if (v13 > 6) {
      goto LABEL_13;
    }
    if (((1LL << v13) & 0x6C) != 0)
    {
      id v14 = sub_100018084();
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "Found installed copy, relocating it",  buf,  2u);
      }

      id v16 = sub_100018B08();
      v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v16);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100018B48;
      block[3] = &unk_100059940;
      block[4] = self;
      v29 = global_queue;
      id v30 = v10;
      dispatch_async(v17, block);

      id v18 = v29;
      goto LABEL_20;
    }

    if (v13 != 4 || v10)
    {
LABEL_13:
      id v19 = sub_100018084();
      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Requesting download of asset", buf, 2u);
      }

      v21 = self->_asset;
      id v22 = v8;
      if (!v8) {
        id v22 = (void *)objc_claimAutoreleasedReturnValue(-[GEOMAResourceInfo downloadOptions](self->_info, "downloadOptions"));
      }
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472LL;
      v25[2] = sub_100018B58;
      v25[3] = &unk_100059990;
      v25[4] = self;
      v26 = global_queue;
      id v27 = v10;
      -[MAAsset startDownload:completionWithError:](v21, "startDownload:completionWithError:", v22, v25);
      if (!v8) {

      }
      id v18 = v26;
      goto LABEL_20;
    }

    id v23 = sub_100018084();
    objc_super v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEBUG,  "MA is already downloading this for us",  buf,  2u);
    }
  }

  else if (v10)
  {
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_100018AF4;
    v32[3] = &unk_1000591E0;
    v33 = (dispatch_queue_s *)v10;
    dispatch_async(global_queue, v32);
    id v18 = v33;
LABEL_20:
  }
}

- (void)_relocateOnQueue:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v64[0] = _NSConcreteStackBlock;
  v64[1] = 3221225472LL;
  v64[2] = sub_1000192DC;
  v64[3] = &unk_1000599B8;
  id v55 = a4;
  id v66 = v55;
  id v54 = v6;
  id v65 = v54;
  uint64_t v7 = objc_retainBlock(v64);
  uint64_t v8 = objc_claimAutoreleasedReturnValue(-[MAAsset getLocalUrl](self->_asset, "getLocalUrl"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[GEOMAResource _getLocalFileUrl](self, "_getLocalFileUrl"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 path]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 stringByDeletingLastPathComponent]);
  unsigned __int8 v13 = [v10 fileExistsAtPath:v12];

  if ((v13 & 1) == 0)
  {
    NSFileAttributeKey v69 = NSFilePosixPermissions;
    v70 = &off_10005E168;
    id v14 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v70,  &v69,  1LL));
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v9 URLByDeletingLastPathComponent]);
    id v63 = 0LL;
    unsigned __int8 v17 = [v15 createDirectoryAtURL:v16 withIntermediateDirectories:1 attributes:v14 error:&v63];
    id v18 = v63;

    if ((v17 & 1) == 0)
    {
      id v46 = sub_100018084();
      v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v68 = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_ERROR,  "Unable to create directory for asset: %@",  buf,  0xCu);
      }

      ((void (*)(void *, uint64_t, id))v7[2])(v7, 7LL, v18);
      goto LABEL_22;
    }
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v9 path]);
  unsigned int v21 = [v19 fileExistsAtPath:v20];

  if (!v21) {
    goto LABEL_9;
  }
  id v22 = sub_100018084();
  id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Found existing copy at destination, will remove it",  buf,  2u);
  }

  id v62 = 0LL;
  unsigned __int8 v26 = objc_msgSend((id)objc_opt_class(self, v24, v25), "_removeResourceAt:error:", v9, &v62);
  id v27 = v62;
  id v14 = v27;
  if ((v26 & 1) == 0)
  {
    ((void (*)(void *, uint64_t, id))v7[2])(v7, 7LL, v27);
LABEL_22:
    v29 = (void *)v8;
    goto LABEL_31;
  }

LABEL_9:
  id v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v61 = 0LL;
  v29 = (void *)v8;
  unsigned __int8 v30 = [v28 copyItemAtURL:v8 toURL:v9 error:&v61];
  id v14 = v61;

  if ((v30 & 1) != 0)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[GEOMAResource attributes](self, "attributes"));
    id v60 = 0LL;
    v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v31,  200LL,  0LL,  &v60));
    id v33 = v60;

    if (v32)
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[GEOMAResource _getPlistURL](self, "_getPlistURL"));
      id v59 = v33;
      unsigned __int8 v35 = [v32 writeToURL:v34 options:0x10000000 error:&v59];
      id v36 = v59;

      id v37 = sub_100018084();
      v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
      v39 = v38;
      if ((v35 & 1) != 0)
      {
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEBUG, "Asseet relocation successful", buf, 2u);
        }

        objc_storeStrong((id *)&self->_cacheURL, v9);
        asset = self->_asset;
        self->_asset = 0LL;
        v41 = asset;

        v56[0] = _NSConcreteStackBlock;
        v56[1] = 3221225472LL;
        v56[2] = sub_100019368;
        v56[3] = &unk_1000599E0;
        v57 = v7;
        uint64_t v58 = 0LL;
        -[MAAsset purgeWithError:](v41, "purgeWithError:", v56);
      }

      else
      {
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v68 = v36;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "Unable write info plist: %@", buf, 0xCu);
        }

        objc_msgSend((id)objc_opt_class(self, v52, v53), "_removeResourceAt:error:", v9, 0);
        ((void (*)(void *, uint64_t, id))v7[2])(v7, 7LL, v36);
      }

      id v33 = v36;
    }

    else
    {
      id v48 = sub_100018084();
      v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v68 = v33;
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "Unable create info plist: %@", buf, 0xCu);
      }

      objc_msgSend((id)objc_opt_class(self, v50, v51), "_removeResourceAt:error:", v9, 0);
      ((void (*)(void *, uint64_t, id))v7[2])(v7, 7LL, v33);
    }
  }

  else
  {
    id v42 = sub_100018084();
    v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v68 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_ERROR,  "Unable to copy resource into place: %@",  buf,  0xCu);
    }

    objc_msgSend((id)objc_opt_class(self, v44, v45), "_removeResourceAt:error:", v9, 0);
    ((void (*)(void *, uint64_t, id))v7[2])(v7, 7LL, v14);
  }

- (BOOL)remove:(id *)a3
{
  id v3 = a3;
  uint64_t v5 = (void *)objc_opt_class(self, a2, a3);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[GEOMAResource getLocalFileUrl](self, "getLocalFileUrl"));
  LOBYTE(v3) = [v5 removeResourceAt:v6 error:v3];

  return (char)v3;
}

+ (BOOL)removeResourceAt:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = sub_100018B08();
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v7);
  dispatch_assert_queue_not_V2(v8);

  uint64_t v25 = 0LL;
  unsigned __int8 v26 = &v25;
  uint64_t v27 = 0x2020000000LL;
  uint64_t v19 = 0LL;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  id v22 = sub_100019518;
  id v23 = sub_100019528;
  id v24 = 0LL;
  id v9 = sub_100018B08();
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v9);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100019530;
  v14[3] = &unk_100059A08;
  id v16 = &v25;
  id v18 = a1;
  id v11 = v6;
  id v15 = v11;
  unsigned __int8 v17 = &v19;
  dispatch_sync(v10, v14);

  if (a4) {
    *a4 = (id) v20[5];
  }
  char v12 = *((_BYTE *)v26 + 24);

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v12;
}

+ (BOOL)_removeResourceAt:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v15 = 0LL;
  unsigned __int8 v8 = [v7 removeItemAtURL:v6 error:&v15];
  id v9 = v15;

  if ((v8 & 1) == 0)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 domain]);
    if ([v10 isEqual:NSCocoaErrorDomain])
    {
      id v11 = [v9 code];

      if (v11 == (id)513)
      {
        unsigned __int8 v8 = [a1 _fixPermissionsAndRemoveResourceAt:v6 error:a4];
        goto LABEL_11;
      }
    }

    else
    {
    }

    id v12 = sub_100018084();
    unsigned __int8 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v17 = a1;
      __int16 v18 = 2112;
      id v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Unable to delete resource %@: %@", buf, 0x16u);
    }
  }

  if (a4) {
    *a4 = v9;
  }
LABEL_11:

  return v8;
}

+ (BOOL)_fixPermissionsAndRemoveResourceAt:(id)a3 error:(id *)a4
{
  id v6 = a3;
  NSFileAttributeKey v27 = NSFilePosixPermissions;
  id v28 = &off_10005E168;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v28,  &v27,  1LL));
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
  id v22 = 0LL;
  unsigned __int8 v10 = [v8 setAttributes:v7 ofItemAtPath:v9 error:&v22];
  id v11 = v22;

  if ((v10 & 1) != 0)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v21 = v11;
    unsigned __int8 v13 = [v12 removeItemAtURL:v6 error:&v21];
    id v14 = v21;

    if ((v13 & 1) != 0)
    {
      BOOL v15 = 1;
      id v11 = v14;
      if (!a4) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }

    id v11 = v14;
  }

  else
  {
    id v16 = sub_100018084();
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v11;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Unable to fix permissions: %@", buf, 0xCu);
    }
  }

  id v18 = sub_100018084();
  id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v24 = a1;
    __int16 v25 = 2112;
    id v26 = v11;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Unable to delete resource %@: %@", buf, 0x16u);
  }

  BOOL v15 = 0;
  if (a4) {
LABEL_12:
  }
    *a4 = v11;
LABEL_13:

  return v15;
}

- (id)description
{
  id v3 = (objc_class *)objc_opt_class(self, a2);
  id v4 = NSStringFromClass(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[GEOMAResource assetId](self, "assetId"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[GEOMAResource contentVersion](self, "contentVersion"));
  int64_t v8 = -[GEOMAResource state](self, "state");
  else {
    id v9 = off_100059A48[v8 - 1];
  }
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ %p - id: %@ ver: %@ state: %@>",  v5,  self,  v6,  v7,  v9));

  return v10;
}

+ (void)onFileAccessQueueSync:(id)a3
{
  id v3 = a3;
  id v4 = sub_100018B08();
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v4);
  dispatch_sync(v5, v3);
}

+ (void)onFileAccessQueueAsync:(id)a3
{
  id v3 = a3;
  id v4 = sub_100018B08();
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v4);
  dispatch_async(v5, v3);
}

- (GEOMAResourceInfo)resourceInfo
{
  return (GEOMAResourceInfo *)objc_getProperty(self, a2, 32LL, 1);
}

- (NSDictionary)attributes
{
  return (NSDictionary *)objc_getProperty(self, a2, 16LL, 1);
}

- (void).cxx_destruct
{
}

@end