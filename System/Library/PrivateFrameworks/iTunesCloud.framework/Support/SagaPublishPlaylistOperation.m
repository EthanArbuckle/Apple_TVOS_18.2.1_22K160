@interface SagaPublishPlaylistOperation
- (NSString)playlistGlobalID;
- (NSString)playlistShareURL;
- (SagaPublishPlaylistOperation)initWithClientIdentity:(id)a3 sagaID:(unint64_t)a4;
- (SagaPublishPlaylistOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 sagaID:(unint64_t)a5;
- (void)main;
@end

@implementation SagaPublishPlaylistOperation

- (SagaPublishPlaylistOperation)initWithClientIdentity:(id)a3 sagaID:(unint64_t)a4
{
  id v6 = a3;
  v8 = (void *)objc_opt_new(&OBJC_CLASS___ICConnectionConfiguration, v7);
  v9 = -[SagaPublishPlaylistOperation initWithConfiguration:clientIdentity:sagaID:]( self,  "initWithConfiguration:clientIdentity:sagaID:",  v8,  v6,  a4);

  return v9;
}

- (SagaPublishPlaylistOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 sagaID:(unint64_t)a5
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SagaPublishPlaylistOperation;
  result = -[CloudLibraryOperation initWithConfiguration:clientIdentity:]( &v7,  "initWithConfiguration:clientIdentity:",  a3,  a4);
  if (result) {
    result->super._status = a5;
  }
  return result;
}

- (void)main
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SagaPublishPlaylistOperation - (playlist cloud id = %llu)",  self->super._status));
  id v4 = [[MSVXPCTransaction alloc] initWithName:v3];
  [v4 beginTransaction];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation clientIdentity](self, "clientIdentity"));
  [v5 setClientIdentity:v6];

  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[ML3ComparisonPredicate predicateWithProperty:equalToInt64:]( &OBJC_CLASS___ML3ComparisonPredicate,  "predicateWithProperty:equalToInt64:",  ML3ContainerPropertyStoreCloudID,  self->super._status));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[ML3Container anyInLibrary:predicate:](&OBJC_CLASS___ML3Container, "anyInLibrary:predicate:", v7, v8));

  if ([v9 existsInLibrary])
  {
    v28 = v3;
    os_log_t v10 = (os_log_t)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation connection](self, "connection"));
    id v11 = -[os_log_s databaseID](v10, "databaseID");
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->super._status));
    v38 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v38, 1LL));
    uint64_t v27 = ML3ContainerPropertyCloudIsPublic;
    uint64_t v35 = ML3ContainerPropertyCloudIsPublic;
    v36 = &__kCFBooleanTrue;
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v36,  &v35,  1LL));
    v37 = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v37, 1LL));
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[ICBulkSetContainerPropertyRequest requestWithDatabaseID:containerIDs:properties:]( &OBJC_CLASS___ICBulkSetContainerPropertyRequest,  "requestWithDatabaseID:containerIDs:properties:",  v11,  v13,  v15));

    [v16 setVerificationInteractionLevel:2];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_10004599C;
    v29[3] = &unk_1001A6E30;
    v29[4] = self;
    v17 = dispatch_semaphore_create(0LL);
    v30 = v17;
    -[os_log_s sendRequest:withResponseHandler:](v10, "sendRequest:withResponseHandler:", v16, v29);
    dispatch_semaphore_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
    if (-[NSError length](self->super._error, "length"))
    {
      p_sagaID = &self->_sagaID;
      if ([(id)self->_sagaID length]) {
        v19 = (__CFString *)*p_sagaID;
      }
      else {
        v19 = &stru_1001A7960;
      }
      objc_storeStrong((id *)&self->_sagaID, v19);
      error = self->super._error;
      v34[0] = &__kCFBooleanTrue;
      v34[1] = error;
      v34[2] = *p_sagaID;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v34, 3LL));
      v33[0] = v27;
      v33[1] = ML3ContainerPropertyCloudGlobalID;
      v33[2] = ML3ContainerPropertyCloudShareURL;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v33, 3LL));
      [v9 setValues:v22 forProperties:v23];
    }

    v3 = v28;
  }

  else
  {
    os_log_t v10 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int64_t status = self->super._status;
      *(_DWORD *)buf = 134217984;
      int64_t v32 = status;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Playlist with cloud id = %llu is not in the database, skipping publish request.",  buf,  0xCu);
    }
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  uint64_t v25 = MSVTCCIdentityForCurrentProcess();
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  [v24 setClientIdentity:v26];

  [v4 endTransaction];
}

- (NSString)playlistGlobalID
{
  return (NSString *)&self->super._error->super.isa;
}

- (NSString)playlistShareURL
{
  return (NSString *)self->_sagaID;
}

- (void).cxx_destruct
{
}

@end