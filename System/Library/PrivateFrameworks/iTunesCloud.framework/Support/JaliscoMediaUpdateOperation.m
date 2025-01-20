@interface JaliscoMediaUpdateOperation
+ (id)logCategory;
+ (id)oversizeLogCategory;
- (BOOL)preflightImport;
- (JaliscoMediaUpdateOperation)initWithConfiguration:(id)a3 reason:(int64_t)a4 supportedMediaKindsHandler:(id)a5 clientIdentity:(id)a6;
- (id)newImporter;
- (id)queryFilterPercentEscaped;
- (int64_t)localDatabaseRevision;
- (void)handleSuccess:(int64_t)a3;
@end

@implementation JaliscoMediaUpdateOperation

- (JaliscoMediaUpdateOperation)initWithConfiguration:(id)a3 reason:(int64_t)a4 supportedMediaKindsHandler:(id)a5 clientIdentity:(id)a6
{
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___JaliscoMediaUpdateOperation;
  v12 = -[JaliscoUpdateOperation initWithConfiguration:reason:clientIdentity:]( &v15,  "initWithConfiguration:reason:clientIdentity:",  a3,  a4,  a6);
  v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->super._powerEventEndName, a5);
  }

  return v13;
}

- (id)queryFilterPercentEscaped
{
  v2 = -[ICDJaliscoMediaFilter initWithKindsToExclude:supportedMediaKindsHandler:]( objc_alloc(&OBJC_CLASS___ICDJaliscoMediaFilter),  "initWithKindsToExclude:supportedMediaKindsHandler:",  &__NSArray0__struct,  self->super._powerEventEndName);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICDJaliscoMediaFilter daapQueryFilterString](v2, "daapQueryFilterString"));

  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSCharacterSet URLQueryAllowedCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "URLQueryAllowedCharacterSet"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAddingPercentEncodingWithAllowedCharacters:v4]);

  return v5;
}

- (int64_t)localDatabaseRevision
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  id v3 = [v2 jaliscoOnDiskDatabaseRevision];

  return (int64_t)v3;
}

- (BOOL)preflightImport
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation configuration](self, "configuration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 userIdentity]);

  v5 = (void *)objc_claimAutoreleasedReturnValue( +[ICPrivacyInfo sharedPrivacyInfoForUserIdentity:]( &OBJC_CLASS___ICPrivacyInfo,  "sharedPrivacyInfoForUserIdentity:",  v4));
  unsigned int v6 = [v5 privacyAcknowledgementRequiredForMedia];

  v7 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      int v16 = 138543362;
      v17 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Skipping update because privacy acknowledgement is required",  (uint8_t *)&v16,  0xCu);
    }

    BOOL v9 = 0;
  }

  else
  {
    if (v8)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation connection](self, "connection"));
      v12 = (JaliscoMediaUpdateOperation *)objc_opt_class(v10, v11);
      v13 = v12;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation connection](self, "connection"));
      int v16 = 138543618;
      v17 = v12;
      __int16 v18 = 2048;
      v19 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Updating using connection: <%{public}@ %p>",  (uint8_t *)&v16,  0x16u);
    }

    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation connection](self, "connection"));
    BOOL v9 = v7 != 0LL;
  }

  return v9;
}

- (id)newImporter
{
  id v3 = objc_alloc(&OBJC_CLASS___JaliscoMediaImporter);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation connection](self, "connection"));
  v5 = -[JaliscoMediaImporter initWithConnection:supportedMediaKindsHandler:]( v3,  "initWithConnection:supportedMediaKindsHandler:",  v4,  self->super._powerEventEndName);

  return v5;
}

- (void)handleSuccess:(int64_t)a3
{
  unsigned int v5 = -[JaliscoMediaUpdateOperation localDatabaseRevision](self, "localDatabaseRevision");
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  [v6 setJaliscoOnDiskDatabaseRevision:a3];

  if (!v5)
  {
    v7 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134217984;
      uint64_t v11 = 610000LL;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Setting initial user version: %lli",  (uint8_t *)&v10,  0xCu);
    }

    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
    objc_msgSend(v8, "icd_setSagaDatabaseUserVersion:", 610000);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification( DarwinNotifyCenter,  ICCloudClientInitialCloudLibraryImportCompletedNotification,  0LL,  0LL,  1u);
  }

- (void).cxx_destruct
{
}

+ (id)logCategory
{
  return os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
}

+ (id)oversizeLogCategory
{
  return os_log_create("com.apple.amp.itunescloudd", "PurchaseSync_Oversize");
}

@end