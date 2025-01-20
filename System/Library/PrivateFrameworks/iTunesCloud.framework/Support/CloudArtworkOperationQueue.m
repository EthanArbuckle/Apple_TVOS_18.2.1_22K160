@interface CloudArtworkOperationQueue
- (BOOL)_hasValidUserIdentity:(id)a3 forSourceType:(int64_t)a4;
- (CloudArtworkOperationQueue)initWithSourceType:(int64_t)a3 configuration:(id)a4;
- (ICConnectionConfiguration)configuration;
- (id)_artworkURLForInfoDictionary:(id)a3;
- (int64_t)sourceType;
- (void)addOperation:(id)a3;
- (void)addOperations:(id)a3;
@end

@implementation CloudArtworkOperationQueue

- (CloudArtworkOperationQueue)initWithSourceType:(int64_t)a3 configuration:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CloudArtworkOperationQueue;
  v8 = -[CloudArtworkOperationQueue init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    v8->super._private = (id)a3;
    objc_storeStrong(&v8->super._reserved, a4);
  }

  return v9;
}

- (void)addOperation:(id)a3
{
  id v5 = a3;
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___CloudArtworkImportOperation, v6);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v8 handleFailureInMethod:a2 object:self file:@"CloudArtworkOperationQueue.m" lineNumber:38 description:@"Only operations of type CloudArtworkImportOperation are supported"];
  }

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CloudArtworkOperationQueue;
  -[CloudArtworkOperationQueue addOperation:](&v9, "addOperation:", v5);
}

- (void)addOperations:(id)a3
{
  id v5 = a3;
  uint64_t v25 = 0LL;
  v26 = &v25;
  uint64_t v27 = 0x2020000000LL;
  uint64_t v28 = 0LL;
  v23[0] = 0LL;
  v23[1] = v23;
  v23[2] = 0x3032000000LL;
  v23[3] = sub_10004DD50;
  v23[4] = sub_10004DD60;
  id v24 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  v20 = sub_10004DD50;
  v21 = sub_10004DD60;
  id v22 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10004DD68;
  v16[3] = &unk_1001A3080;
  v16[4] = self;
  v16[5] = &v17;
  v16[6] = v23;
  v16[7] = &v25;
  v16[8] = a2;
  [v5 enumerateObjectsUsingBlock:v16];
  if (v26[3])
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CloudArtworkOperationQueue configuration](self, "configuration"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 userIdentity]);
    unsigned int v8 = -[CloudArtworkOperationQueue _hasValidUserIdentity:forSourceType:]( self,  "_hasValidUserIdentity:forSourceType:",  v7,  -[CloudArtworkOperationQueue sourceType](self, "sourceType"));

    if (v8)
    {
      objc_super v9 = (void *)v18[5];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472LL;
      v15[2] = sub_10004DEF4;
      v15[3] = &unk_1001A30D0;
      v15[4] = self;
      v15[5] = v23;
      v15[6] = a2;
      [v9 enumerateKeysAndObjectsUsingBlock:v15];
    }

    else
    {
      v10 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = self->super._private;
        uint64_t v12 = v26[3];
        *(_DWORD *)buf = 134218240;
        id v30 = v11;
        __int16 v31 = 2048;
        uint64_t v32 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "No store account for source_type %ld, canceling %lu requests",  buf,  0x16u);
      }

      v13 = (void *)v18[5];
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_10004E474;
      v14[3] = &unk_1001A3120;
      v14[4] = self;
      v14[5] = v23;
      [v13 enumerateKeysAndObjectsUsingBlock:v14];
    }
  }

  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(&v25, 8);
}

- (id)_artworkURLForInfoDictionary:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:ICArtworkInfoKeyArtworkDictionary]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:ICArtworkInfoKeyArtworkDictionaryCoverArtworkJSON]);
  if ([v4 length])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 dataUsingEncoding:4]);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v5,  0LL,  0LL));

    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSDictionary, v7);
    if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
    {
      id v9 = [[ICStoreArtworkInfo alloc] initWithArtworkResponseDictionary:v6];
      goto LABEL_14;
    }
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:ICArtworkInfoKeyArtworkDictionaryTemplateJSON]);
  if (![v6 length]) {
    goto LABEL_9;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue([v6 dataUsingEncoding:4]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v10,  0LL,  0LL));

  uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSDictionary, v12);
  if ((objc_opt_isKindOfClass(v11, v13) & 1) == 0)
  {

LABEL_9:
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:ICArtworkInfoKeyArtworkDictionaryTemplateURL]);
    if ([v11 length])
    {
      id v14 = objc_alloc(&OBJC_CLASS___ICStoreArtworkInfo);
      __int16 v31 = @"url";
      uint64_t v32 = v11;
      v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v32,  &v31,  1LL));
      id v9 = [v14 initWithArtworkResponseDictionary:v15];
    }

    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:ICArtworkInfoKeyArtworkDictionaryFullURL]);
      id v16 = objc_alloc(&OBJC_CLASS___ICStoreArtworkInfo);
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v15));
      id v9 = [v16 initWithArtworkURL:v17];
    }

    goto LABEL_13;
  }

  id v9 = [[ICStoreArtworkInfo alloc] initWithArtworkResponseDictionary:v11];
LABEL_13:

LABEL_14:
  double BoundingBoxSize = MSVGetMaximumScreenSize();
  double v20 = v19;
  v21 = (void *)objc_claimAutoreleasedReturnValue([v9 sizeInfo]);
  [v21 maxSupportedSize];
  double v23 = v22;
  double v25 = v24;

  if (v23 != CGSizeZero.width || v25 != CGSizeZero.height)
  {
    double BoundingBoxSize = MSVImageUtilitiesMakeBoundingBoxSize(v23, v25, BoundingBoxSize, v20);
    double v20 = v27;
  }

  id v28 = objc_msgSend( v9,  "artworkURLWithSize:cropStyle:format:preferP3ColorSpace:",  ICStoreArtworkInfoCropStyleBoundedBox,  ICStoreArtworkInfoImageFormatJPEG,  MSVDeviceSupportsExtendedColorDisplay(),  BoundingBoxSize,  v20);
  v29 = (void *)objc_claimAutoreleasedReturnValue(v28);

  return v29;
}

- (BOOL)_hasValidUserIdentity:(id)a3 forSourceType:(int64_t)a4
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CloudArtworkOperationQueue configuration](self, "configuration", a3));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 userIdentityStore]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CloudArtworkOperationQueue configuration](self, "configuration"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 userIdentity]);
  id v16 = 0LL;
  v10 = (void *)objc_claimAutoreleasedReturnValue([v7 getPropertiesForUserIdentity:v9 error:&v16]);
  id v11 = v16;

  if (v11)
  {
    uint64_t v12 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "msv_description"));
      *(_DWORD *)buf = 138543618;
      v18 = self;
      __int16 v19 = 2114;
      double v20 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%{public}@ Failed to load identity properties error=%{public}@",  buf,  0x16u);
    }
  }

  if (a4 == 600 || a4 == 200) {
    unsigned __int8 v14 = [v10 isActiveLocker];
  }
  else {
    unsigned __int8 v14 = v10 != 0LL;
  }

  return v14;
}

- (int64_t)sourceType
{
  return (int64_t)self->super._private;
}

- (ICConnectionConfiguration)configuration
{
  return (ICConnectionConfiguration *)self->super._reserved;
}

- (void).cxx_destruct
{
}

@end