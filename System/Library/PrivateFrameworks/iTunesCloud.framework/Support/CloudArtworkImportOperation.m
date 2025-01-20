@interface CloudArtworkImportOperation
- (BOOL)allowsCellularData;
- (CloudArtworkImportOperation)initWithURLSession:(id)a3 configuration:(id)a4 cloudID:(unint64_t)a5 artworkToken:(id)a6 artworkType:(int64_t)a7 sourceType:(int64_t)a8 clientIdentity:(id)a9;
- (ICURLSession)URLSession;
- (NSString)artworkToken;
- (NSURL)assetURL;
- (id)_resizedImageDataFromLocation:(id)a3;
- (id)description;
- (int64_t)artworkType;
- (int64_t)sourceType;
- (unint64_t)cloudID;
- (unsigned)mediaType;
- (void)addCompletionHandler:(id)a3;
- (void)callCompletionHandlers;
- (void)cancel;
- (void)setAllowsCellularData:(BOOL)a3;
- (void)setAssetURL:(id)a3;
- (void)setMediaType:(unsigned int)a3;
- (void)start;
@end

@implementation CloudArtworkImportOperation

- (CloudArtworkImportOperation)initWithURLSession:(id)a3 configuration:(id)a4 cloudID:(unint64_t)a5 artworkToken:(id)a6 artworkType:(int64_t)a7 sourceType:(int64_t)a8 clientIdentity:(id)a9
{
  id v16 = a3;
  id v17 = a6;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___CloudArtworkImportOperation;
  v18 = -[CloudLibraryOperation initWithConfiguration:clientIdentity:]( &v22,  "initWithConfiguration:clientIdentity:",  a4,  a9);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)(v18 + 114), a3);
    *(void *)(v19 + 122) = a5;
    objc_storeStrong((id *)(v19 + 130), a6);
    *(void *)(v19 + 138) = a7;
    *(void *)(v19 + 146) = a8;
    v19[106] = 1;
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[CloudArtworkImportSetupOperation sharedSetupOperation]( &OBJC_CLASS___CloudArtworkImportSetupOperation,  "sharedSetupOperation"));
    [v19 addDependency:v20];
  }

  return (CloudArtworkImportOperation *)v19;
}

- (void)addCompletionHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = *(void **)((char *)&self->super.super._status + 2);
    id v9 = v4;
    if (!v5)
    {
      int64_t v6 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      v7 = *(void **)((char *)&self->super.super._status + 2);
      *(int64_t *)((char *)&self->super.super._status + 2) = v6;

      v5 = *(void **)((char *)&self->super.super._status + 2);
    }

    id v8 = [v9 copy];
    [v5 addObject:v8];

    id v4 = v9;
  }
}

- (void)callCompletionHandlers
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v3 = *(id *)((char *)&self->super.super._status + 2);
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      v7 = 0LL;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8LL * (void)v7);
        id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation error](self, "error", (void)v11));
        (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

        v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v5);
  }

  v10 = *(void **)((char *)&self->super.super._status + 2);
  *(int64_t *)((char *)&self->super.super._status + 2) = 0LL;
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p [cloud_id=%llu, artworkType=%lld, sourceType=%lld]>",  objc_opt_class(self, a2),  self,  -[CloudArtworkImportOperation cloudID](self, "cloudID"),  -[CloudArtworkImportOperation artworkType](self, "artworkType"),  -[CloudArtworkImportOperation sourceType](self, "sourceType"));
}

- (void)start
{
  v74.receiver = self;
  v74.super_class = (Class)&OBJC_CLASS___CloudArtworkImportOperation;
  -[CloudLibraryConcurrentOperation start](&v74, "start");
  unsigned int v3 = -[CloudArtworkImportOperation isCancelled](self, "isCancelled");
  id v4 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (!v3)
  {
    if (v5)
    {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CloudArtworkImportOperation artworkToken](self, "artworkToken"));
      *(_DWORD *)buf = 138543618;
      v79 = self;
      __int16 v80 = 2114;
      *(void *)v81 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Starting artwork import using token '%{public}@'",  buf,  0x16u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[ICStorageManager sharedManager](&OBJC_CLASS___ICStorageManager, "sharedManager"));
    unsigned int v10 = [v9 cachingEnabled];
    unint64_t v11 = (unint64_t)[v9 storageSpaceAvailable];
    unint64_t v12 = v11;
    if (!v10 || v11 >> 12 <= 0x18)
    {
      v28 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v79 = self;
        __int16 v80 = 1024;
        *(_DWORD *)v81 = v10;
        *(_WORD *)&v81[4] = 2048;
        *(void *)&v81[6] = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "%{public}@ Not enough free space to download artwork. cachingEnabled=%d, storageSpaceAvailable=%lld",  buf,  0x1Cu);
      }

      -[CloudLibraryConcurrentOperation finish](self, "finish");
      v68[0] = _NSConcreteStackBlock;
      v68[1] = 3221225472LL;
      v68[2] = sub_1000B4AC0;
      v68[3] = &unk_1001A4C10;
      id v69 = v7;
      v70 = self;
      char v73 = v10;
      id v71 = v8;
      unint64_t v72 = v12;
      AnalyticsSendEventLazy(@"com.apple.iTunesCloud.itunescloudd.cloudArtworkImportOperation", v68);

      v19 = v69;
      goto LABEL_41;
    }

    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[CloudArtworkImportOperation artworkToken](self, "artworkToken"));
    id v14 = [v13 length];

    if (!v14)
    {
      v29 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v79 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "%{public}@ Cannot import artwork without artwork token.",  buf,  0xCu);
      }

      -[CloudLibraryConcurrentOperation finish](self, "finish");
      v64[0] = _NSConcreteStackBlock;
      v64[1] = 3221225472LL;
      v64[2] = sub_1000B4BC0;
      v64[3] = &unk_1001A4C38;
      id v65 = v7;
      v66 = self;
      id v67 = v8;
      AnalyticsSendEventLazy(@"com.apple.iTunesCloud.itunescloudd.cloudArtworkImportOperation", v64);

      v19 = v65;
      goto LABEL_41;
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CloudArtworkImportOperation assetURL](self, "assetURL"));

    if (!v15)
    {
      v30 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v79 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "%{public}@ Cannot import artwork without an asset URL.",  buf,  0xCu);
      }

      -[CloudLibraryConcurrentOperation finish](self, "finish");
      v60[0] = _NSConcreteStackBlock;
      v60[1] = 3221225472LL;
      v60[2] = sub_1000B4C78;
      v60[3] = &unk_1001A4C38;
      id v61 = v7;
      v62 = self;
      id v63 = v8;
      AnalyticsSendEventLazy(@"com.apple.iTunesCloud.itunescloudd.cloudArtworkImportOperation", v60);

      v19 = v61;
      goto LABEL_41;
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[ICDeviceInfo currentDeviceInfo](&OBJC_CLASS___ICDeviceInfo, "currentDeviceInfo"));
    if ([v16 isWatch])
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue(+[ICEnvironmentMonitor sharedMonitor](&OBJC_CLASS___ICEnvironmentMonitor, "sharedMonitor"));
      if (![v17 isCharging])
      {
        char v34 = _os_feature_enabled_impl("NanoMusicSync", "OffPuckDownloads");

        if ((v34 & 1) == 0)
        {
          os_log_t v35 = sub_1000DD848();
          v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v79 = self;
            _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_ERROR,  "%{public}@ Cannot import artwork on the watch while its not plugged in",  buf,  0xCu);
          }

          -[CloudLibraryConcurrentOperation finish](self, "finish");
          v56[0] = _NSConcreteStackBlock;
          v56[1] = 3221225472LL;
          v56[2] = sub_1000B4D30;
          v56[3] = &unk_1001A4C38;
          id v57 = v7;
          v58 = self;
          id v59 = v8;
          AnalyticsSendEventLazy(@"com.apple.iTunesCloud.itunescloudd.cloudArtworkImportOperation", v56);

          v19 = v57;
          goto LABEL_41;
        }

- (void)cancel
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CloudArtworkImportOperation;
  -[CloudArtworkImportOperation cancel](&v3, "cancel");
}

- (id)_resizedImageDataFromLocation:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICDeviceInfo currentDeviceInfo](&OBJC_CLASS___ICDeviceInfo, "currentDeviceInfo"));
  if ([v4 isWatch])
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 path]);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v5 attributesOfItemAtPath:v6 error:0]);
    id v8 = [v7 fileSize];

    uint64_t ImageSource = MSVImageUtilitiesCreateImageSource(v3);
    if (!ImageSource)
    {
      unint64_t v11 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 138543362;
        id v22 = v3;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "failed to create image source for resizing image at '%{public}@'",  (uint8_t *)&v21,  0xCu);
      }

      id v16 = 0LL;
      goto LABEL_26;
    }

    unsigned int v10 = (const void *)ImageSource;
    unint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](&OBJC_CLASS___NSMutableData, "data"));
    uint64_t DataImageDestination = MSVImageUtilitiesCreateDataImageDestination(0LL, v11, 1LL);
    if (!DataImageDestination)
    {
      id v17 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 138543362;
        id v22 = v3;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "failed to create image destination for resizing image at '%{public}@'",  (uint8_t *)&v21,  0xCu);
      }

      id v16 = 0LL;
      goto LABEL_25;
    }

    __int128 v13 = (void *)DataImageDestination;
    [v4 mainScreenSize];
    if (v14 >= v15.n128_f64[0]) {
      v15.n128_f64[0] = v14;
    }
    if (MSVImageUtilitiesResizeSourceImageToJPEGDestination(v10, 0LL, v13, 0.7, v15))
    {
      if (CGImageDestinationFinalize((CGImageDestinationRef)v13))
      {
        if (-[os_log_s length](v11, "length") < v8)
        {
          id v16 = v11;
LABEL_24:
          CFRelease(v13);
LABEL_25:
          CFRelease(v10);
LABEL_26:

          goto LABEL_27;
        }

- (ICURLSession)URLSession
{
  return *(ICURLSession **)((char *)&self->_completionHandlers + 2);
}

- (unint64_t)cloudID
{
  return *(unint64_t *)((char *)&self->_urlRequest + 2);
}

- (NSString)artworkToken
{
  return *(NSString **)(&self->_allowsCellularData + 2);
}

- (int64_t)artworkType
{
  return *(int64_t *)((char *)&self->_URLSession + 2);
}

- (int64_t)sourceType
{
  return *(unint64_t *)((char *)&self->_cloudID + 2);
}

- (unsigned)mediaType
{
  return *(_DWORD *)(&self->super._finished + 5);
}

- (void)setMediaType:(unsigned int)a3
{
  *(_DWORD *)(&self->super._finished + 5) = a3;
}

- (NSURL)assetURL
{
  return *(NSURL **)((char *)&self->_artworkToken + 2);
}

- (void)setAssetURL:(id)a3
{
}

- (BOOL)allowsCellularData
{
  return *(&self->super._finished + 1);
}

- (void)setAllowsCellularData:(BOOL)a3
{
  *(&self->super._finished + 1) = a3;
}

- (void).cxx_destruct
{
}

@end