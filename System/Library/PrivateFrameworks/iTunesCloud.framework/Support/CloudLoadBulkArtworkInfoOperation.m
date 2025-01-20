@interface CloudLoadBulkArtworkInfoOperation
- (BOOL)useLongIDs;
- (CloudLoadBulkArtworkInfoOperation)initWithCloudIDs:(id)a3;
- (CloudLoadBulkArtworkInfoOperation)initWithConfiguration:(id)a3 cloudIDs:(id)a4;
- (NSArray)cloudArtworkInfoDictionaries;
- (unsigned)itemKind;
- (void)main;
@end

@implementation CloudLoadBulkArtworkInfoOperation

- (CloudLoadBulkArtworkInfoOperation)initWithCloudIDs:(id)a3
{
  id v4 = a3;
  v6 = (void *)objc_opt_new(&OBJC_CLASS___ICConnectionConfiguration, v5);
  v7 = -[CloudLoadBulkArtworkInfoOperation initWithConfiguration:cloudIDs:]( self,  "initWithConfiguration:cloudIDs:",  v6,  v4);

  return v7;
}

- (CloudLoadBulkArtworkInfoOperation)initWithConfiguration:(id)a3 cloudIDs:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSArray, v9);
  if ((objc_opt_isKindOfClass(v8, v10) & 1) == 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v15 handleFailureInMethod:a2 object:self file:@"CloudLoadBulkArtworkInfoOperation.m" lineNumber:31 description:@"CloudIDs must be an array!"];
  }

  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___CloudLoadBulkArtworkInfoOperation;
  v11 = -[CloudLibraryOperation initWithConfiguration:](&v16, "initWithConfiguration:", v7);
  if (v11)
  {
    id v12 = [v8 copy];
    status = (void *)v11->super._status;
    v11->super._status = (int64_t)v12;
  }

  return v11;
}

- (void)main
{
  v3 = objc_autoreleasePoolPush();
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICDeviceInfo currentDeviceInfo](&OBJC_CLASS___ICDeviceInfo, "currentDeviceInfo"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICEnvironmentMonitor sharedMonitor](&OBJC_CLASS___ICEnvironmentMonitor, "sharedMonitor"));
  if ([v5 isCharging])
  {

LABEL_4:
    goto LABEL_5;
  }

  char v28 = _os_feature_enabled_impl("NanoMusicSync", "OffPuckDownloads");

  if ((v28 & 1) != 0)
  {
LABEL_5:
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[ICDeviceInfo currentDeviceInfo](&OBJC_CLASS___ICDeviceInfo, "currentDeviceInfo"));
    if ([v6 isWatch])
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[ICEnvironmentMonitor sharedMonitor](&OBJC_CLASS___ICEnvironmentMonitor, "sharedMonitor"));
      id v8 = [v7 currentThermalLevel];

      if ((unint64_t)v8 >= 0x14)
      {
        uint64_t v9 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          uint64_t v10 = "Not performing artwork info operation because of elevated thermal levels";
LABEL_19:
          v14 = v9;
          os_log_type_t v15 = OS_LOG_TYPE_ERROR;
          uint32_t v16 = 2;
          goto LABEL_20;
        }

        goto LABEL_21;
      }
    }

    else
    {
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[ICPrivacyInfo sharedPrivacyInfo](&OBJC_CLASS___ICPrivacyInfo, "sharedPrivacyInfo"));
    unsigned int v12 = [v11 privacyAcknowledgementRequiredForMedia];

    if (v12)
    {
      uint64_t v9 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v32 = self;
        uint64_t v10 = "%{public}@ Skipping update because privacy acknowledgement is required";
        v14 = v9;
        os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
        uint32_t v16 = 12;
LABEL_20:
        _os_log_impl((void *)&_mh_execute_header, v14, v15, v10, buf, v16);
        goto LABEL_21;
      }
    }

    else
    {
      v17 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@ - (item count = %lu)",  objc_opt_class(self, v13),  [(id)self->super._status count]);
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      id v18 = [[MSVXPCTransaction alloc] initWithName:v9];
      [v18 beginTransaction];
      v19 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v21 = (CloudLoadBulkArtworkInfoOperation *)objc_opt_class(self, v20);
        status = (void *)self->super._status;
        v23 = v21;
        *(_DWORD *)buf = 138543618;
        v32 = v21;
        __int16 v33 = 2048;
        id v34 = [status count];
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Loading artwork info for %lu cloud IDs",  buf,  0x16u);
      }

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation connection](self, "connection"));
      v25 = -[ICBulkArtworkInfoRequest initWithDatabaseID:cloudIDs:itemKind:useLongIDs:]( [ICBulkArtworkInfoRequest alloc],  "initWithDatabaseID:cloudIDs:itemKind:useLongIDs:",  [v24 databaseID],  self->super._status,  -[CloudLoadBulkArtworkInfoOperation itemKind](self, "itemKind"),  -[CloudLoadBulkArtworkInfoOperation useLongIDs](self, "useLongIDs"));
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472LL;
      v29[2] = sub_10004A880;
      v29[3] = &unk_1001A6E30;
      v29[4] = self;
      dispatch_semaphore_t v30 = dispatch_semaphore_create(0LL);
      v26 = v30;
      [v24 sendRequest:v25 withResponseHandler:v29];
      dispatch_time_t v27 = dispatch_time(0LL, 300000000000LL);
      dispatch_semaphore_wait(v26, v27);
      [v18 endTransaction];
    }

    goto LABEL_21;
  }

  uint64_t v9 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    uint64_t v10 = "Not performing artwork info operation because power is required";
    goto LABEL_19;
  }

- (BOOL)useLongIDs
{
  return (BOOL)self->super._error;
}

- (unsigned)itemKind
{
  return BYTE1(self->super._error);
}

- (NSArray)cloudArtworkInfoDictionaries
{
  return self->_cloudIDs;
}

- (void).cxx_destruct
{
}

@end