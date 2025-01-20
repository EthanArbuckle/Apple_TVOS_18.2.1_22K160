@interface JaliscoImporter
+ (OS_os_log)logCategory;
+ (OS_os_log)oversizeLogCategory;
- (BOOL)includeFlavors;
- (BOOL)includeHiddenItems;
- (BOOL)includePreorders;
- (BOOL)isCancelled;
- (BOOL)needsUpdateForTokens;
- (BOOL)parser:(id)a3 shouldParseCode:(unsigned int)a4;
- (BOOL)parser:(id)a3 shouldParseCodeAsContainer:(unsigned int)a4;
- (BOOL)shouldRestart;
- (CloudLibraryConnection)connection;
- (ICConnectionConfiguration)configuration;
- (JaliscoImporter)initWithConnection:(id)a3;
- (ML3MusicLibrary)musicLibrary;
- (NSMutableArray)itemsFiles;
- (NSString)currentPaginationToken;
- (NSString)description;
- (NSString)updateBaseDirectory;
- (OS_tcc_identity)clientIdentity;
- (float)progress;
- (id)metadataKeys;
- (id)purchaseTokens;
- (id)queryFilter;
- (id)updateLibraryFromRevision:(unsigned int)a3 toRevision:(unsigned int)a4 withResponse:(id)a5 clientIdentity:(id)a6 itemsFiles:(id)a7;
- (unsigned)currentPageNumber;
- (unsigned)onDiskRevision;
- (unsigned)restartCount;
- (unsigned)updateFromRevision;
- (unsigned)updateToRevision;
- (void)_performNextItemsPageRequestWithCompletion:(id)a3;
- (void)_processItemsPageResponse:(id)a3 withCompletion:(id)a4;
- (void)cancel;
- (void)importTracksUpToRevision:(unsigned int)a3 clientIdentity:(id)a4 withCompletionHandler:(id)a5;
- (void)parser:(id)a3 didParseDataCode:(unsigned int)a4 bytes:(char *)a5 contentLength:(unsigned int)a6;
- (void)parser:(id)a3 didStartContainerCode:(unsigned int)a4 contentLength:(unsigned int)a5;
- (void)setClientIdentity:(id)a3;
- (void)setCurrentPageNumber:(unsigned int)a3;
- (void)setCurrentPaginationToken:(id)a3;
- (void)setItemsFiles:(id)a3;
- (void)setProgress:(float)a3;
- (void)setRestartCount:(unsigned int)a3;
- (void)setShouldRestart:(BOOL)a3;
- (void)setUpdateBaseDirectory:(id)a3;
- (void)setUpdateFromRevision:(unsigned int)a3;
- (void)setUpdateToRevision:(unsigned int)a3;
@end

@implementation JaliscoImporter

- (JaliscoImporter)initWithConnection:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v15 handleFailureInMethod:a2, self, @"JaliscoImporter.m", 58, @"Invalid parameter not satisfying: %@", @"connection" object file lineNumber description];
  }

  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___JaliscoImporter;
  v7 = -[JaliscoImporter init](&v16, "init");
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_connection, a3);
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v6 configuration]);
    configuration = v8->_configuration;
    v8->_configuration = (ICConnectionConfiguration *)v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue([v6 userIdentity]);
    uint64_t v12 = objc_claimAutoreleasedReturnValue( +[ML3MusicLibrary musicLibraryForUserAccount:]( &OBJC_CLASS___ML3MusicLibrary,  "musicLibraryForUserAccount:",  v11));
    musicLibrary = v8->_musicLibrary;
    v8->_musicLibrary = (ML3MusicLibrary *)v12;
  }

  return v8;
}

- (void)setProgress:(float)a3
{
  self->_progress = a3;
}

- (id)queryFilter
{
  return 0LL;
}

- (id)metadataKeys
{
  return 0LL;
}

- (id)purchaseTokens
{
  return 0LL;
}

- (id)updateLibraryFromRevision:(unsigned int)a3 toRevision:(unsigned int)a4 withResponse:(id)a5 clientIdentity:(id)a6 itemsFiles:(id)a7
{
  return 0LL;
}

- (unsigned)onDiskRevision
{
  return 0;
}

- (BOOL)includeFlavors
{
  return 1;
}

- (BOOL)includeHiddenItems
{
  return 0;
}

- (BOOL)includePreorders
{
  return 0;
}

- (BOOL)needsUpdateForTokens
{
  return 0;
}

- (void)cancel
{
  self->_isCancelled = 1;
}

- (void)importTracksUpToRevision:(unsigned int)a3 clientIdentity:(id)a4 withCompletionHandler:(id)a5
{
  v8 = (OS_tcc_identity *)a4;
  id v9 = a5;
  self->_shouldRestart = 0;
  currentPaginationToken = self->_currentPaginationToken;
  self->_currentPaginationToken = 0LL;

  *(void *)&self->_currentPageNumber = 1LL;
  v11 = NSTemporaryDirectory();
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v36[0] = v12;
  v36[1] = @"com.apple.MediaServices";
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 UUIDString]);
  v36[2] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v36, 3LL));
  objc_super v16 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v15));
  updateBaseDirectory = self->_updateBaseDirectory;
  self->_updateBaseDirectory = v16;

  self->_updateToRevision = a3;
  self->_unsigned int updateFromRevision = -[JaliscoImporter onDiskRevision](self, "onDiskRevision");
  v18 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( &OBJC_CLASS___NSMutableArray,  "arrayWithCapacity:",  3LL));
  itemsFiles = self->_itemsFiles;
  self->_itemsFiles = v18;

  clientIdentity = self->_clientIdentity;
  self->_clientIdentity = v8;
  v21 = v8;

  int v22 = _os_feature_enabled_impl("MediaPlayer", "JaliscoPagination");
  v23 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int updateFromRevision = self->_updateFromRevision;
    *(_DWORD *)buf = 138544130;
    v29 = self;
    __int16 v30 = 1024;
    unsigned int v31 = a3;
    __int16 v32 = 1024;
    unsigned int v33 = updateFromRevision;
    __int16 v34 = 1024;
    int v35 = v22;
    _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Importing tracks up to revision %u. onDiskRevision=%u, supportsPagination=%{BOOL}u",  buf,  0x1Eu);
  }

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_100044634;
  v26[3] = &unk_1001A50C0;
  id v27 = v9;
  id v25 = v9;
  -[JaliscoImporter _performNextItemsPageRequestWithCompletion:]( self,  "_performNextItemsPageRequestWithCompletion:",  v26);
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[JaliscoImporter configuration](self, "configuration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userIdentity]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ %p [identity=%@, revision %u --> %u]>",  v3,  self,  v5,  self->_updateFromRevision,  self->_updateToRevision));

  return (NSString *)v6;
}

- (void)_performNextItemsPageRequestWithCompletion:(id)a3
{
  id v29 = a3;
  uint64_t currentPageNumber = self->_currentPageNumber;
  self->_uint64_t currentPageNumber = currentPageNumber + 1;
  uint64_t v5 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"items_%u.daap",  currentPageNumber));
  v39[0] = self->_updateBaseDirectory;
  v39[1] = v5;
  __int16 v30 = (void *)v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v39, 2LL));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPathComponents:](&OBJC_CLASS___NSURL, "fileURLWithPathComponents:", v6));

  if (self->_currentPaginationToken) {
    v8 = 0LL;
  }
  else {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[JaliscoImporter purchaseTokens](self, "purchaseTokens"));
  }
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[JaliscoImporter connection](self, "connection"));
  id v10 = [v9 databaseID];
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[JaliscoImporter metadataKeys](self, "metadataKeys"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 componentsJoinedByString:@","]);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[JaliscoImporter queryFilter](self, "queryFilter"));
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[ICItemsRequest requestWithDatabaseID:metadataFilter:queryFilter:purchaseTokens:includeHiddenItems:includePreorders:paginationToken:]( &OBJC_CLASS___ICItemsRequest,  "requestWithDatabaseID:metadataFilter:queryFilter:purchaseTokens:includeHiddenItems:includePreorders: paginationToken:",  v10,  v12,  v13,  v8,  -[JaliscoImporter includeHiddenItems](self, "includeHiddenItems"),  -[JaliscoImporter includePreorders](self, "includePreorders"),  self->_currentPaginationToken));

  [v14 setResponseDataDestinationFileURL:v7];
  if (-[JaliscoImporter includeFlavors](self, "includeFlavors")) {
    [v14 setValue:@"1" forArgument:@"includeItemFlavors"];
  }
  unsigned int updateFromRevision = self->_updateFromRevision;
  if (updateFromRevision && self->_updateToRevision > updateFromRevision)
  {
    objc_super v16 = (char *)&v35 + 1;
    v17.quot = self->_updateFromRevision;
    do
    {
      div_t v17 = div(v17.quot, 10);
      unint64_t v18 = HIDWORD(*(unint64_t *)&v17);
      if (v17.rem < 0) {
        LODWORD(v18) = -v17.rem;
      }
      *(v16 - 2) = v18 + 48;
      v19 = (const UInt8 *)(v16 - 2);
      --v16;
    }

    while (v17.quot);
    if ((updateFromRevision & 0x80000000) != 0)
    {
      *(v16 - 2) = 45;
      v19 = (const UInt8 *)(v16 - 2);
    }

    v20 = (__CFString *)CFStringCreateWithBytes(0LL, v19, (char *)&v35 - (char *)v19, 0x8000100u, 0);
    [v14 setValue:v20 forArgument:@"delta"];

    unsigned int updateToRevision = self->_updateToRevision;
    int v22 = (char *)&v35 + 1;
    v23.quot = updateToRevision;
    do
    {
      div_t v23 = div(v23.quot, 10);
      unint64_t v24 = HIDWORD(*(unint64_t *)&v23);
      if (v23.rem < 0) {
        LODWORD(v24) = -v23.rem;
      }
      *(v22 - 2) = v24 + 48;
      id v25 = (const UInt8 *)(v22 - 2);
      --v22;
    }

    while (v23.quot);
    if ((updateToRevision & 0x80000000) != 0)
    {
      *(v22 - 2) = 45;
      id v25 = (const UInt8 *)(v22 - 2);
    }

    v26 = (__CFString *)CFStringCreateWithBytes(0LL, v25, (char *)&v35 - (char *)v25, 0x8000100u, 0);
    [v14 setValue:v26 forArgument:@"revision-id"];
  }

  id v27 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    __int16 v34 = self;
    __int16 v35 = 2114;
    v36 = v14;
    __int16 v37 = 2114;
    v38 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Sending items request %{public}@ on connection %{public}@",  buf,  0x20u);
  }

  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_10004440C;
  v31[3] = &unk_1001A2D00;
  v31[4] = self;
  id v32 = v29;
  id v28 = v29;
  [v9 sendRequest:v14 withResponseHandler:v31];
}

- (void)_processItemsPageResponse:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  itemsFiles = self->_itemsFiles;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 responseDataFileURL]);
  -[NSMutableArray addObject:](itemsFiles, "addObject:", v9);

  self->_shouldRestart = 0;
  currentPaginationToken = self->_currentPaginationToken;
  self->_currentPaginationToken = 0LL;

  int v11 = _os_feature_enabled_impl("MediaPlayer", "JaliscoPagination");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 responseDataFileURL]);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSInputStream inputStreamWithURL:](&OBJC_CLASS___NSInputStream, "inputStreamWithURL:", v12));

  id v14 = [[DKDAAPParser alloc] initWithStream:v13];
  [v14 setDelegate:self];
  [v14 parse];
  if (self->_shouldRestart)
  {
    v15 = os_log_create("com.apple.amp.itunescloudd", "Default");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int restartCount = self->_restartCount;
      int v25 = 138543618;
      v26 = self;
      __int16 v27 = 1024;
      LODWORD(v28) = restartCount;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Server requested restart. restartCount=%u",  (uint8_t *)&v25,  0x12u);
    }

    div_t v17 = self->_currentPaginationToken;
    self->_currentPaginationToken = 0LL;

    -[NSMutableArray removeAllObjects](self->_itemsFiles, "removeAllObjects");
    unsigned int v18 = self->_restartCount + 1;
    self->_uint64_t currentPageNumber = 1;
    self->_unsigned int restartCount = v18;
    goto LABEL_9;
  }

  if (self->_currentPaginationToken) {
    int v19 = v11;
  }
  else {
    int v19 = 0;
  }
  if (v19 == 1)
  {
LABEL_9:
    -[JaliscoImporter _performNextItemsPageRequestWithCompletion:]( self,  "_performNextItemsPageRequestWithCompletion:",  v7);
    goto LABEL_10;
  }

  v20 = os_log_create("com.apple.amp.itunescloudd", "Default");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 138543362;
    v26 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Fetched last batch of items - performing import",  (uint8_t *)&v25,  0xCu);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue( -[JaliscoImporter updateLibraryFromRevision:toRevision:withResponse:clientIdentity:itemsFiles:]( self,  "updateLibraryFromRevision:toRevision:withResponse:clientIdentity:itemsFiles:",  self->_updateFromRevision,  self->_updateToRevision,  v6,  self->_clientIdentity,  self->_itemsFiles));
  int v22 = os_log_create("com.apple.amp.itunescloudd", "Default");
  div_t v23 = v22;
  if (v21)
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "msv_description"));
      int v25 = 138543618;
      v26 = self;
      __int16 v27 = 2114;
      id v28 = v24;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "%{public}@ Import completed error=%{public}@",  (uint8_t *)&v25,  0x16u);
    }
  }

  else if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 138543362;
    v26 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Import completed",  (uint8_t *)&v25,  0xCu);
  }

  v7[2](v7, v21);
LABEL_10:
}

- (BOOL)parser:(id)a3 shouldParseCode:(unsigned int)a4
{
  BOOL v4 = a4 == 1836081511 || a4 == 1836413554;
  BOOL v5 = a4 == 1633968755 || v4;
  return !self->_shouldRestart && v5;
}

- (BOOL)parser:(id)a3 shouldParseCodeAsContainer:(unsigned int)a4
{
  return a4 == 1836413554 || a4 == 1633968755;
}

- (void)parser:(id)a3 didStartContainerCode:(unsigned int)a4 contentLength:(unsigned int)a5
{
  if (a4 == 1836413554) {
    self->_shouldRestart = 1;
  }
}

- (void)parser:(id)a3 didParseDataCode:(unsigned int)a4 bytes:(char *)a5 contentLength:(unsigned int)a6
{
  if (a4 == 1836081511)
  {
    v7 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  a5,  a6,  4LL);
    currentPaginationToken = self->_currentPaginationToken;
    self->_currentPaginationToken = v7;
  }

- (CloudLibraryConnection)connection
{
  return self->_connection;
}

- (ICConnectionConfiguration)configuration
{
  return self->_configuration;
}

- (ML3MusicLibrary)musicLibrary
{
  return self->_musicLibrary;
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (float)progress
{
  return self->_progress;
}

- (BOOL)shouldRestart
{
  return self->_shouldRestart;
}

- (void)setShouldRestart:(BOOL)a3
{
  self->_shouldRestart = a3;
}

- (NSString)currentPaginationToken
{
  return self->_currentPaginationToken;
}

- (void)setCurrentPaginationToken:(id)a3
{
}

- (unsigned)currentPageNumber
{
  return self->_currentPageNumber;
}

- (void)setCurrentPageNumber:(unsigned int)a3
{
  self->_uint64_t currentPageNumber = a3;
}

- (unsigned)restartCount
{
  return self->_restartCount;
}

- (void)setRestartCount:(unsigned int)a3
{
  self->_unsigned int restartCount = a3;
}

- (NSString)updateBaseDirectory
{
  return self->_updateBaseDirectory;
}

- (void)setUpdateBaseDirectory:(id)a3
{
}

- (unsigned)updateToRevision
{
  return self->_updateToRevision;
}

- (void)setUpdateToRevision:(unsigned int)a3
{
  self->_unsigned int updateToRevision = a3;
}

- (unsigned)updateFromRevision
{
  return self->_updateFromRevision;
}

- (void)setUpdateFromRevision:(unsigned int)a3
{
  self->_unsigned int updateFromRevision = a3;
}

- (NSMutableArray)itemsFiles
{
  return self->_itemsFiles;
}

- (void)setItemsFiles:(id)a3
{
}

- (OS_tcc_identity)clientIdentity
{
  return self->_clientIdentity;
}

- (void)setClientIdentity:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (OS_os_log)logCategory
{
  id v4 = +[JaliscoImporter instanceMethodForSelector:](&OBJC_CLASS___JaliscoImporter, "instanceMethodForSelector:", a2);
  if (v4 == objc_msgSend((id)objc_opt_class(a1, v5), "instanceMethodForSelector:", a2))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    id v10 = (objc_class *)objc_opt_class(a1, v9);
    int v11 = NSStringFromClass(v10);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = NSStringFromSelector(a2);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    [v8 handleFailureInMethod:a2, a1, @"JaliscoImporter.m", 46, @"Subclass %@ must implement -%@ defined in %@.", v12, v14, @"JaliscoImporter" object file lineNumber description];
  }

  id v6 = &_os_log_default;
  return (OS_os_log *)&_os_log_default;
}

+ (OS_os_log)oversizeLogCategory
{
  id v4 = +[JaliscoImporter instanceMethodForSelector:](&OBJC_CLASS___JaliscoImporter, "instanceMethodForSelector:", a2);
  if (v4 == objc_msgSend((id)objc_opt_class(a1, v5), "instanceMethodForSelector:", a2))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    id v10 = (objc_class *)objc_opt_class(a1, v9);
    int v11 = NSStringFromClass(v10);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = NSStringFromSelector(a2);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    [v8 handleFailureInMethod:a2, a1, @"JaliscoImporter.m", 51, @"Subclass %@ must implement -%@ defined in %@.", v12, v14, @"JaliscoImporter" object file lineNumber description];
  }

  id v6 = &_os_log_default;
  return (OS_os_log *)&_os_log_default;
}

@end