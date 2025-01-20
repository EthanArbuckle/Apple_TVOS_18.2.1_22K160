@interface SagaUploadPlaylistArtworkOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)isPersistent;
- (NSNumber)containerCloudID;
- (NSNumber)dsid;
- (NSString)cuid;
- (NSString)troveID;
- (NSString)userArtworkToken;
- (NSURL)assetURL;
- (SagaUploadPlaylistArtworkOperation)initWithClientIdentity:(id)a3 playlistPersistentID:(int64_t)a4;
- (SagaUploadPlaylistArtworkOperation)initWithCoder:(id)a3;
- (SagaUploadPlaylistArtworkOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 playlistPersistentID:(int64_t)a5;
- (id)_bodyDataWithAdditionalBodyFields:(id)a3;
- (id)_requestWithURL:(id)a3 URLBagKey:(id)a4 timeoutInterval:(double)a5 additionalBodyFields:(id)a6;
- (id)_responseBodyForRequest:(id)a3 retryTimeout:(double)a4 debugName:(id)a5;
- (id)_standardBodyDictionaryWithAdditionalFields:(id)a3;
- (int64_t)playlistPersistentID;
- (unint64_t)assetFileSize;
- (void)_downloadRequestsFromURL:(id)a3 uploadResponsesURL:(id)a4;
- (void)_initiateArtworkUpload;
- (void)_uploadArtworkAssetWithInfo:(id)a3 completionHandler:(id)a4;
- (void)_uploadArtworkAssetWithInfo:(id)a3 uploadResponsesURL:(id)a4 uploadResponseData:(id)a5 postUploadBackOffDelay:(unsigned int)a6 followupDownloadRequestsURL:(id)a7;
- (void)encodeWithCoder:(id)a3;
- (void)main;
- (void)setAssetFileSize:(unint64_t)a3;
- (void)setAssetURL:(id)a3;
- (void)setContainerCloudID:(id)a3;
- (void)setCuid:(id)a3;
- (void)setDsid:(id)a3;
- (void)setPlaylistPersistentID:(int64_t)a3;
- (void)setTroveID:(id)a3;
- (void)setUserArtworkToken:(id)a3;
@end

@implementation SagaUploadPlaylistArtworkOperation

- (SagaUploadPlaylistArtworkOperation)initWithClientIdentity:(id)a3 playlistPersistentID:(int64_t)a4
{
  id v6 = a3;
  v8 = (void *)objc_opt_new(&OBJC_CLASS___ICConnectionConfiguration, v7);
  v9 = -[SagaUploadPlaylistArtworkOperation initWithConfiguration:clientIdentity:playlistPersistentID:]( self,  "initWithConfiguration:clientIdentity:playlistPersistentID:",  v8,  v6,  a4);

  return v9;
}

- (SagaUploadPlaylistArtworkOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4 playlistPersistentID:(int64_t)a5
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SagaUploadPlaylistArtworkOperation;
  result = -[CloudLibraryOperation initWithConfiguration:clientIdentity:]( &v7,  "initWithConfiguration:clientIdentity:",  a3,  a4);
  if (result) {
    result->super._status = a5;
  }
  return result;
}

- (SagaUploadPlaylistArtworkOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SagaUploadPlaylistArtworkOperation;
  v5 = -[CloudLibraryOperation initWithCoder:](&v7, "initWithCoder:", v4);
  if (v5) {
    v5->super._status = (int64_t)[v4 decodeInt64ForKey:@"SagaUploadPlaylistArtworkOperationPlaylistPersistentIDKey"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SagaUploadPlaylistArtworkOperation;
  id v4 = a3;
  -[CloudLibraryOperation encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend( v4,  "encodeInt64:forKey:",  self->super._status,  @"SagaUploadPlaylistArtworkOperationPlaylistPersistentIDKey",  v5.receiver,  v5.super_class);
}

- (BOOL)isPersistent
{
  return 1;
}

- (void)main
{
  if (-[SagaUploadPlaylistArtworkOperation isCancelled](self, "isCancelled"))
  {
    -[CloudLibraryOperation setStatus:](self, "setStatus:", 4LL);
    return;
  }

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation clientIdentity](self, "clientIdentity"));
  [v3 setClientIdentity:v4];

  int64_t status = self->super._status;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
  id v7 = +[ML3Container newWithPersistentID:inLibrary:]( &OBJC_CLASS___ML3Container,  "newWithPersistentID:inLibrary:",  status,  v6);

  if ([v7 existsInLibrary])
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 valueForProperty:ML3ContainerPropertyStoreCloudID]);
    -[SagaUploadPlaylistArtworkOperation setContainerCloudID:](self, "setContainerCloudID:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SagaUploadPlaylistArtworkOperation containerCloudID](self, "containerCloudID"));
    unsigned int v10 = [v9 unsignedIntValue];

    if (v10)
    {
      id v11 = [[ML3ArtworkTokenSet alloc] initWithEntity:v7 artworkType:5];
      v12 = (void *)objc_claimAutoreleasedReturnValue([v11 artworkTokenForSource:100]);
      -[SagaUploadPlaylistArtworkOperation setUserArtworkToken:](self, "setUserArtworkToken:", v12);

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[SagaUploadPlaylistArtworkOperation userArtworkToken](self, "userArtworkToken"));
      if (!v13)
      {
        v43 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          int64_t v44 = self->super._status;
          *(_DWORD *)v70 = 134217984;
          *(void *)&v70[4] = v44;
          _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "Playlist with pid = %lld does not have user set playlist artwork in the database, skipping upload of playlis t artwork to cloud library.",  v70,  0xCu);
        }

        -[CloudLibraryOperation setStatus:](self, "setStatus:", 1LL);
        id v17 = (id)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
        uint64_t v46 = MSVTCCIdentityForCurrentProcess(v17, v45);
        v19 = (void *)objc_claimAutoreleasedReturnValue(v46);
        [v17 setClientIdentity:v19];
        goto LABEL_28;
      }

      id v14 = objc_alloc(&OBJC_CLASS___ML3Artwork);
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[SagaUploadPlaylistArtworkOperation userArtworkToken](self, "userArtworkToken"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
      id v17 = [v14 initWithToken:v15 artworkType:5 musicLibrary:v16];

      v18 = (void *)objc_claimAutoreleasedReturnValue([v17 originalFileURL]);
      -[SagaUploadPlaylistArtworkOperation setAssetURL:](self, "setAssetURL:", v18);

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[SagaUploadPlaylistArtworkOperation assetURL](self, "assetURL"));
      v21 = (void *)objc_claimAutoreleasedReturnValue([v20 path]);
      unsigned __int8 v22 = [v19 fileExistsAtPath:v21];

      if ((v22 & 1) != 0)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[SagaUploadPlaylistArtworkOperation assetURL](self, "assetURL"));
        v24 = (void *)objc_claimAutoreleasedReturnValue([v23 path]);
        v25 = (void *)objc_claimAutoreleasedReturnValue([v19 attributesOfItemAtPath:v24 error:0]);
        -[SagaUploadPlaylistArtworkOperation setAssetFileSize:]( self,  "setAssetFileSize:",  [v25 fileSize]);

        if (-[SagaUploadPlaylistArtworkOperation assetFileSize](self, "assetFileSize"))
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
          v27 = (void *)objc_claimAutoreleasedReturnValue([v26 sagaAccountID]);
          -[SagaUploadPlaylistArtworkOperation setDsid:](self, "setDsid:", v27);

          v28 = (void *)objc_claimAutoreleasedReturnValue(-[SagaUploadPlaylistArtworkOperation dsid](self, "dsid"));
          id v29 = [v28 longLongValue];

          if (!v29)
          {
            os_log_t v57 = sub_1000DD86C();
            v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
            if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)v70 = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_FAULT,  "SagaUploadPlaylistArtworkOperation failed -- Missing DSID",  v70,  2u);
            }

            goto LABEL_26;
          }

          v30 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
          v31 = (void *)objc_claimAutoreleasedReturnValue([v30 sagaCloudLibraryCUID]);
          -[SagaUploadPlaylistArtworkOperation setCuid:](self, "setCuid:", v31);

          v32 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
          v33 = (void *)objc_claimAutoreleasedReturnValue([v32 sagaCloudLibraryTroveID]);
          -[SagaUploadPlaylistArtworkOperation setTroveID:](self, "setTroveID:", v33);

          v34 = (void *)objc_claimAutoreleasedReturnValue(-[SagaUploadPlaylistArtworkOperation cuid](self, "cuid"));
          if ([v34 length])
          {
            v35 = (void *)objc_claimAutoreleasedReturnValue(-[SagaUploadPlaylistArtworkOperation troveID](self, "troveID"));
            id v36 = [v35 length];

            if (v36)
            {
LABEL_35:
              v64 = (void *)objc_claimAutoreleasedReturnValue(-[SagaUploadPlaylistArtworkOperation cuid](self, "cuid"));
              if ([v64 length])
              {
                v65 = (void *)objc_claimAutoreleasedReturnValue(-[SagaUploadPlaylistArtworkOperation troveID](self, "troveID"));
                id v66 = [v65 length];

                if (v66)
                {
                  -[SagaUploadPlaylistArtworkOperation _initiateArtworkUpload](self, "_initiateArtworkUpload");
                  goto LABEL_27;
                }
              }

              else
              {
              }

              os_log_t v67 = sub_1000DD86C();
              v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v67);
              if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
              {
                v68 = (void *)objc_claimAutoreleasedReturnValue(-[SagaUploadPlaylistArtworkOperation cuid](self, "cuid"));
                v69 = (void *)objc_claimAutoreleasedReturnValue(-[SagaUploadPlaylistArtworkOperation troveID](self, "troveID"));
                *(_DWORD *)v70 = 138543618;
                *(void *)&v70[4] = v68;
                *(_WORD *)&v70[12] = 2114;
                *(void *)&v70[14] = v69;
                _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_FAULT,  "SagaUploadPlaylistArtworkOperation failed -- Missing one required parameter: CUID (%{public}@) / TroveID (%{public}@)",  v70,  0x16u);
              }

- (void)_initiateArtworkUpload
{
  if (-[SagaUploadPlaylistArtworkOperation isCancelled](self, "isCancelled"))
  {
    v3 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "SagaUploadPlaylistArtworkOperation cancelled -- After preparing to initiate artwork upload",  buf,  2u);
    }

    -[CloudLibraryOperation setStatus:](self, "setStatus:", 4LL);
  }

  else
  {
    *(void *)buf = 0LL;
    id v11 = buf;
    uint64_t v12 = 0xF810000000LL;
    memset(v15, 0, sizeof(v15));
    v13 = &unk_100166F5B;
    uint64_t v14 = 4000LL;
    CC_MD5_Init((CC_MD5_CTX *)v15);
    v8[0] = 0LL;
    v8[1] = v8;
    v8[2] = 0xF810000000LL;
    memset(v9, 0, sizeof(v9));
    v8[3] = &unk_100166F5B;
    v8[4] = 4256LL;
    CC_SHA256_Init(v9);
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SagaUploadPlaylistArtworkOperation assetURL](self, "assetURL"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1000D93B8;
    v7[3] = &unk_1001A5910;
    v7[4] = buf;
    v7[5] = v8;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1000D9A50;
    v6[3] = &unk_1001A5938;
    v6[5] = buf;
    v6[6] = v8;
    v6[4] = self;
    id v5 = (id)MSVHasherDigestDataBlocksFromURL(v4, v7, v6);

    _Block_object_dispose(v8, 8);
    _Block_object_dispose(buf, 8);
  }

- (void)_downloadRequestsFromURL:(id)a3 uploadResponsesURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!-[SagaUploadPlaylistArtworkOperation isCancelled](self, "isCancelled"))
  {
    v47[0] = @"dsid";
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SagaUploadPlaylistArtworkOperation dsid](self, "dsid"));
    v48[0] = v9;
    v47[1] = @"cuid";
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[SagaUploadPlaylistArtworkOperation cuid](self, "cuid"));
    v48[1] = v10;
    v47[2] = @"troveid";
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SagaUploadPlaylistArtworkOperation troveID](self, "troveID"));
    v48[2] = v11;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v48,  v47,  3LL));

    v13 = (void *)objc_claimAutoreleasedReturnValue( -[SagaUploadPlaylistArtworkOperation _requestWithURL:URLBagKey:timeoutInterval:additionalBodyFields:]( self,  "_requestWithURL:URLBagKey:timeoutInterval:additionalBodyFields:",  v6,  0LL,  v12,  60.0));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[SagaUploadPlaylistArtworkOperation _responseBodyForRequest:retryTimeout:debugName:]( self,  "_responseBodyForRequest:retryTimeout:debugName:",  v13,  @"download requests phase 1 (fetch work items)",  180.0));
    id v15 = 0LL;
    id v16 = 0LL;
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"back-off-delay-in-ms"]);
    else {
      unsigned int v44 = 0;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"payload"]);
    if (!_NSIsNSArray(v18) || ![v18 count])
    {
      id v16 = 0LL;
      id v15 = 0LL;
LABEL_31:

      if (v15 && v16)
      {
        -[SagaUploadPlaylistArtworkOperation _uploadArtworkAssetWithInfo:uploadResponsesURL:uploadResponseData:postUploadBackOffDelay:followupDownloadRequestsURL:]( self,  "_uploadArtworkAssetWithInfo:uploadResponsesURL:uploadResponseData:postUploadBackOffDelay:followupDownloadRequestsURL:",  v15,  v7,  v16,  v44,  v6);
LABEL_37:

        goto LABEL_38;
      }

- (void)_uploadArtworkAssetWithInfo:(id)a3 uploadResponsesURL:(id)a4 uploadResponseData:(id)a5 postUploadBackOffDelay:(unsigned int)a6 followupDownloadRequestsURL:(id)a7
{
  id v12 = a3;
  id v61 = a4;
  id v63 = a5;
  id v62 = a7;
  LODWORD(a5) = -[SagaUploadPlaylistArtworkOperation isCancelled](self, "isCancelled");
  v13 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (!(_DWORD)a5)
  {
    if (v14)
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Uploading artwork asset using info: %{public}@",  (uint8_t *)&buf,  0xCu);
    }

    dispatch_semaphore_t v15 = dispatch_semaphore_create(0LL);
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v93 = 0x3032000000LL;
    v94 = sub_1000D8DB4;
    v95 = sub_1000D8DC4;
    id v96 = 0LL;
    uint64_t v68 = 0LL;
    v69 = &v68;
    uint64_t v70 = 0x3032000000LL;
    v71 = sub_1000D8DB4;
    v72 = sub_1000D8DC4;
    id v73 = 0LL;
    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472LL;
    v64[2] = sub_1000D9330;
    v64[3] = &unk_1001A5960;
    p___int128 buf = &buf;
    os_log_t v67 = &v68;
    id v16 = v15;
    v65 = v16;
    -[SagaUploadPlaylistArtworkOperation _uploadArtworkAssetWithInfo:completionHandler:]( self,  "_uploadArtworkAssetWithInfo:completionHandler:",  v12,  v64);
    dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
    if (v69[5])
    {
      id v17 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        uint64_t v18 = v69[5];
        *(_DWORD *)v90 = 138543362;
        uint64_t v91 = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_FAULT,  "Artwork upload failed with error: %{public}@",  v90,  0xCu);
      }

      -[CloudLibraryOperation setStatus:](self, "setStatus:", 2LL);
      uint64_t v19 = v69[5];
      NSErrorUserInfoKey v88 = NSUnderlyingErrorKey;
      uint64_t v89 = v19;
      id v60 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v89,  &v88,  1LL));
      v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSError ic_cloudClientErrorWithCode:userInfo:]( &OBJC_CLASS___NSError,  "ic_cloudClientErrorWithCode:userInfo:",  2014LL,  v60));
      -[CloudLibraryOperation setError:](self, "setError:", v20);
      goto LABEL_44;
    }

    id v60 = *(id *)(*((void *)&buf + 1) + 40LL);
    uint64_t v21 = (uint64_t)[v60 statusCode];
    if ((v21 & 0xFFFFFFFFFFFFFFFELL) == 0xC8)
    {
      if (a6)
      {
        unsigned int v22 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v90 = 67109120;
          LODWORD(v91) = a6;
          _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Backing off before sending uploadResponsesRequest for %u ms",  v90,  8u);
        }

        usleep(1000 * a6);
      }

      v20 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:@"token"]);
      v86[0] = @"dsid";
      v58 = (void *)objc_claimAutoreleasedReturnValue(-[SagaUploadPlaylistArtworkOperation dsid](self, "dsid"));
      v87[0] = v58;
      v86[1] = @"cuid";
      v56 = (void *)objc_claimAutoreleasedReturnValue(-[SagaUploadPlaylistArtworkOperation cuid](self, "cuid"));
      v87[1] = v56;
      v86[2] = @"troveid";
      uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue(-[SagaUploadPlaylistArtworkOperation troveID](self, "troveID"));
      v87[2] = v55;
      v86[3] = @"payload";
      v83[0] = @"cloud-id";
      uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue(-[SagaUploadPlaylistArtworkOperation containerCloudID](self, "containerCloudID"));
      v83[1] = @"actions";
      v84[0] = v54;
      v81[0] = @"upload-playlist";
      v80[0] = @"action";
      v80[1] = @"assets";
      v78 = @"artwork";
      v76 = @"response-code";
      v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%ld", v21));
      v77 = v53;
      v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v77,  &v76,  1LL));
      v79 = v23;
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v79,  &v78,  1LL));
      v80[2] = @"response-data";
      v81[1] = v24;
      v81[2] = v63;
      int v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v81,  v80,  3LL));
      v82 = v25;
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v82, 1LL));
      v84[1] = v26;
      v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v84,  v83,  2LL));
      v85 = v27;
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v85, 1LL));
      v87[3] = v28;
      v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v87,  v86,  4LL));

      id v29 = (void *)objc_claimAutoreleasedReturnValue( -[SagaUploadPlaylistArtworkOperation _requestWithURL:URLBagKey:timeoutInterval:additionalBodyFields:]( self,  "_requestWithURL:URLBagKey:timeoutInterval:additionalBodyFields:",  v61,  0LL,  v52,  60.0));
      BOOL v59 = (void *)objc_claimAutoreleasedReturnValue( -[SagaUploadPlaylistArtworkOperation _responseBodyForRequest:retryTimeout:debugName:]( self,  "_responseBodyForRequest:retryTimeout:debugName:",  v29,  @"upload responses (report work item responses)",  180.0));
      uint64_t v31 = objc_opt_class(&OBJC_CLASS___NSDictionary, v30);
      if ((objc_opt_isKindOfClass(v59, v31) & 1) != 0)
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue([v59 objectForKey:@"back-off-delay-in-ms"]);
        uint64_t v34 = objc_opt_class(&OBJC_CLASS___NSNumber, v33);
        if ((objc_opt_isKindOfClass(v32, v34) & 1) != 0)
        {
          unsigned int v35 = [v32 unsignedIntValue];

          if (v35)
          {
            os_log_t v36 = sub_1000DD86C();
            v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v90 = 67109120;
              LODWORD(v91) = v35;
              _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "Backing off before sending second downloadRequestsRequest for %u ms",  v90,  8u);
            }

            usleep(1000 * v35);
          }
        }

        else
        {
        }
      }

      v74[0] = @"dsid";
      int64_t v40 = (void *)objc_claimAutoreleasedReturnValue(-[SagaUploadPlaylistArtworkOperation dsid](self, "dsid"));
      v75[0] = v40;
      v74[1] = @"cuid";
      uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(-[SagaUploadPlaylistArtworkOperation cuid](self, "cuid"));
      v75[1] = v41;
      v74[2] = @"troveid";
      uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue(-[SagaUploadPlaylistArtworkOperation troveID](self, "troveID"));
      v75[2] = v42;
      os_log_t v57 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v75,  v74,  3LL));

      v43 = (void *)objc_claimAutoreleasedReturnValue( -[SagaUploadPlaylistArtworkOperation _requestWithURL:URLBagKey:timeoutInterval:additionalBodyFields:]( self,  "_requestWithURL:URLBagKey:timeoutInterval:additionalBodyFields:",  v62,  0LL,  v57,  60.0));
      unsigned int v44 = (void *)objc_claimAutoreleasedReturnValue( -[SagaUploadPlaylistArtworkOperation _responseBodyForRequest:retryTimeout:debugName:]( self,  "_responseBodyForRequest:retryTimeout:debugName:",  v43,  @"download requests phase 2 (fetch work items)",  180.0));
      uint64_t v46 = objc_opt_class(&OBJC_CLASS___NSDictionary, v45);
      if ((objc_opt_isKindOfClass(v44, v46) & 1) != 0)
      {
        v47 = (void *)objc_claimAutoreleasedReturnValue([v44 objectForKey:@"all-work-completed"]);
        unsigned int v48 = [v47 BOOLValue];

        if (v48)
        {
          -[CloudLibraryOperation setStatus:](self, "setStatus:", 1LL);
          v49 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation musicLibrary](self, "musicLibrary"));
          v50 = (void *)objc_claimAutoreleasedReturnValue(-[SagaUploadPlaylistArtworkOperation userArtworkToken](self, "userArtworkToken"));
          [v49 migrateExistingArtworkToken:v50 newArtworkToken:v20 newSourceType:200];

LABEL_41:
LABEL_44:

          _Block_object_dispose(&v68, 8);
          _Block_object_dispose(&buf, 8);

          goto LABEL_45;
        }

        os_log_t v51 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v90 = 138543362;
          uint64_t v91 = (uint64_t)v44;
          _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_ERROR,  "Download request phase 2 did not have all-work-completed=true: %{public}@",  v90,  0xCu);
        }
      }

      else
      {
        os_log_t v51 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v90 = 138543362;
          uint64_t v91 = (uint64_t)v44;
          _os_log_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_ERROR,  "Received unknown response for download request phase 2: %{public}@",  v90,  0xCu);
        }
      }

      -[CloudLibraryOperation setStatus:](self, "setStatus:", 2LL);
      v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSError ic_cloudClientErrorWithCode:userInfo:]( &OBJC_CLASS___NSError,  "ic_cloudClientErrorWithCode:userInfo:",  2014LL,  0LL));
      -[CloudLibraryOperation setError:](self, "setError:", v49);
      goto LABEL_41;
    }

    int64_t v38 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v90 = 134217984;
      uint64_t v91 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_ERROR,  "Received http %ld response when uploading artwork asset.",  v90,  0xCu);
    }

    if (v21 > 399)
    {
      if (v21 == 404 || v21 == 400)
      {
        uint64_t v39 = 3LL;
LABEL_43:
        -[CloudLibraryOperation setStatus:](self, "setStatus:", v39);
        v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSError ic_cloudClientErrorWithCode:userInfo:]( &OBJC_CLASS___NSError,  "ic_cloudClientErrorWithCode:userInfo:",  2014LL,  0LL));
        -[CloudLibraryOperation setError:](self, "setError:", v20);
        goto LABEL_44;
      }
    }

    else
    {
      uint64_t v39 = 1LL;
      if (v21 == 200 || v21 == 204) {
        goto LABEL_43;
      }
    }

    uint64_t v39 = 2LL;
    goto LABEL_43;
  }

  if (v14)
  {
    LOWORD(buf) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "SagaUploadPlaylistArtworkOperation cancelled -- After downloading work items",  (uint8_t *)&buf,  2u);
  }

  -[CloudLibraryOperation setStatus:](self, "setStatus:", 4LL);
LABEL_45:
}

- (void)_uploadArtworkAssetWithInfo:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKey:@"operations"]);
  if (_NSIsNSArray(v7) && [v7 count])
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndex:0]);
    if (_NSIsNSDictionary(v8))
    {
      id v51 = v6;
      v52 = self;
      v50 = v7;
      uint64_t v48 = objc_claimAutoreleasedReturnValue([v8 objectForKey:@"endpoint"]);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:"));
      unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableURLRequest requestWithURL:](&OBJC_CLASS___NSMutableURLRequest, "requestWithURL:", v9));

      v47 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"method"]);
      objc_msgSend(v10, "setHTTPMethod:");
      v49 = v8;
      __int128 v57 = 0u;
      __int128 v58 = 0u;
      __int128 v59 = 0u;
      __int128 v60 = 0u;
      id obj = (id)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"requiredHeaders"]);
      id v11 = [obj countByEnumeratingWithState:&v57 objects:v65 count:16];
      v53 = v10;
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v58;
        do
        {
          BOOL v14 = 0LL;
          do
          {
            if (*(void *)v58 != v13) {
              objc_enumerationMutation(obj);
            }
            dispatch_semaphore_t v15 = *(void **)(*((void *)&v57 + 1) + 8LL * (void)v14);
            id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:@"key"]);
            id v17 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:@"clientGenerated"]);
            uint64_t v18 = v17;
            if (v17 && ![v17 compare:@"true" options:1])
            {
              if ([v16 compare:@"date" options:1])
              {
                v20 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
                if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)__int128 buf = 138543362;
                  v64 = v16;
                  _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_FAULT,  "Unknown required client generated header: %{public}@",  buf,  0xCu);
                }

                uint64_t v19 = 0LL;
              }

              else
              {
                uint64_t v21 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
                unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSLocale localeWithLocaleIdentifier:]( &OBJC_CLASS___NSLocale,  "localeWithLocaleIdentifier:",  @"en_US"));
                -[NSDateFormatter setLocale:](v21, "setLocale:", v22);

                v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSTimeZone timeZoneWithAbbreviation:]( &OBJC_CLASS___NSTimeZone,  "timeZoneWithAbbreviation:",  @"GMT"));
                -[NSDateFormatter setTimeZone:](v21, "setTimeZone:", v23);

                -[NSDateFormatter setDateFormat:](v21, "setDateFormat:", @"EEE',' dd MMM yyyy HH':'mm':'ss 'GMT'");
                uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
                uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v21, "stringFromDate:", v24));

                unsigned int v10 = v53;
              }
            }

            else
            {
              uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:@"value"]);
            }

            if ([v16 length] && objc_msgSend(v19, "length")) {
              [v10 setValue:v19 forHTTPHeaderField:v16];
            }

            BOOL v14 = (char *)v14 + 1;
          }

          while (v12 != v14);
          id v25 = [obj countByEnumeratingWithState:&v57 objects:v65 count:16];
          id v12 = v25;
        }

        while (v25);
      }

      v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration ephemeralSessionConfiguration]( &OBJC_CLASS___NSURLSessionConfiguration,  "ephemeralSessionConfiguration"));
      v27 = (void *)objc_claimAutoreleasedReturnValue( +[ICCloudAvailabilityController sharedController]( &OBJC_CLASS___ICCloudAvailabilityController,  "sharedController"));
      objc_msgSend( v26,  "setAllowsCellularAccess:",  objc_msgSend(v27, "isCellularDataRestrictedForMusic") ^ 1);

      v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSession sessionWithConfiguration:]( &OBJC_CLASS___NSURLSession,  "sessionWithConfiguration:",  v26));
      id v29 = (void *)objc_claimAutoreleasedReturnValue(-[SagaUploadPlaylistArtworkOperation assetURL](v52, "assetURL"));
      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfURL:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfURL:options:error:",  v29,  1LL,  0LL));

      uint64_t v31 = v49;
      v32 = (void *)objc_claimAutoreleasedReturnValue([v49 objectForKey:@"content"]);
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKey:@"type"]);
      id v34 = [v33 compare:@"byterange" options:1];

      if (v34)
      {
        id v6 = v51;
      }

      else
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKey:@"offset"]);
        int64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v32 objectForKey:@"length"]);
        id v39 = [v37 longLongValue];
        id v40 = [v38 longLongValue];
        if (v39 || v40 != (id)-[SagaUploadPlaylistArtworkOperation assetFileSize](v52, "assetFileSize"))
        {
          uint64_t v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "subdataWithRange:", v39, v40));

          uint64_t v30 = (void *)v41;
        }

        id v6 = v51;
      }

      v55[0] = _NSConcreteStackBlock;
      v55[1] = 3221225472LL;
      v55[2] = sub_1000D9224;
      v55[3] = &unk_1001A5988;
      id v56 = v6;
      uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "msv_uploadTaskWithRequest:fromData:completionHandler:", v53, v30, v55));
      uint64_t v43 = ct_green_tea_logger_create("iTunesCloud");
      uint64_t CTGreenTeaOsLogHandle = getCTGreenTeaOsLogHandle();
      uint64_t v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(CTGreenTeaOsLogHandle);
      uint64_t v46 = v45;
      if (v45 && os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "Transmitting image", buf, 2u);
      }

      ct_green_tea_logger_destroy(v43);
      [v42 resume];

      id v7 = v50;
      os_log_t v36 = (void *)v48;
      goto LABEL_29;
    }
  }

  unsigned int v35 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_FAULT,  "Not enough information to upload artwork asset.",  buf,  2u);
  }

  NSErrorUserInfoKey v61 = NSLocalizedDescriptionKey;
  id v62 = @"Not enough information to upload artwork asset.";
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v62,  &v61,  1LL));
  os_log_t v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSError ic_cloudClientErrorWithCode:userInfo:]( &OBJC_CLASS___NSError,  "ic_cloudClientErrorWithCode:userInfo:",  2014LL,  v31));
  (*((void (**)(id, void, void *))v6 + 2))(v6, 0LL, v36);
LABEL_29:
}

- (id)_responseBodyForRequest:(id)a3 retryTimeout:(double)a4 debugName:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v28 = 0LL;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  uint64_t v31 = sub_1000D8DB4;
  v32 = sub_1000D8DC4;
  id v33 = 0LL;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  uint64_t v24 = 0LL;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000LL;
  char v27 = 0;
  do
  {
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v10 timeIntervalSinceDate:v9];
    double v12 = v11;

    if (v12 >= a4) {
      break;
    }
    dispatch_semaphore_t v13 = dispatch_semaphore_create(0LL);
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(+[ICURLSessionManager defaultSession](&OBJC_CLASS___ICURLSessionManager, "defaultSession"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_1000D8E54;
    v18[3] = &unk_1001A59B0;
    id v19 = v8;
    uint64_t v21 = &v24;
    unsigned int v22 = &v28;
    double v23 = a4;
    dispatch_semaphore_t v15 = v13;
    v20 = v15;
    [v14 enqueueDataRequest:v7 withCompletionHandler:v18];

    dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
  }

  while (!*((_BYTE *)v25 + 24));
  id v16 = (id)v29[5];
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v28, 8);
  return v16;
}

- (id)_standardBodyDictionaryWithAdditionalFields:(id)a3
{
  id v3 = a3;
  if ([v3 count]) {
    id v4 = (NSMutableDictionary *)[v3 mutableCopy];
  }
  else {
    id v4 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  2LL);
  }
  id v5 = v4;
  -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", &off_1001B41C8, @"min-compatible-version");
  -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", &off_1001B41C8, @"protocol-version");

  return v5;
}

- (id)_requestWithURL:(id)a3 URLBagKey:(id)a4 timeoutInterval:(double)a5 additionalBodyFields:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  dispatch_semaphore_t v13 = objc_alloc(&OBJC_CLASS___ICStoreRequestContext);
  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibraryOperation userIdentity](self, "userIdentity"));
  dispatch_semaphore_t v15 = -[ICStoreRequestContext initWithIdentity:](v13, "initWithIdentity:", v14);

  if (!v10 && v11)
  {
    uint64_t v36 = 0LL;
    v37 = &v36;
    uint64_t v38 = 0x3032000000LL;
    id v39 = sub_1000D8DB4;
    id v40 = sub_1000D8DC4;
    id v41 = 0LL;
    uint64_t v30 = 0LL;
    uint64_t v31 = &v30;
    uint64_t v32 = 0x3032000000LL;
    id v33 = sub_1000D8DB4;
    id v34 = sub_1000D8DC4;
    id v35 = 0LL;
    dispatch_semaphore_t v16 = dispatch_semaphore_create(0LL);
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[ICURLBagProvider sharedBagProvider](&OBJC_CLASS___ICURLBagProvider, "sharedBagProvider"));
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_1000D8DCC;
    v26[3] = &unk_1001A59D8;
    uint64_t v28 = &v30;
    id v29 = &v36;
    uint64_t v18 = v16;
    char v27 = v18;
    [v17 getBagForRequestContext:v15 withCompletionHandler:v26];

    dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
    id v19 = (void *)objc_claimAutoreleasedReturnValue([(id)v31[5] stringForBagKey:v11]);
    if (v19)
    {
      id v10 = (id)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v19));
    }

    else
    {
      v20 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = v37[5];
        *(_DWORD *)__int128 buf = 138543618;
        id v43 = v11;
        __int16 v44 = 2114;
        uint64_t v45 = v21;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "failed to fetch bag key '%{public}@. err=%{public}@",  buf,  0x16u);
      }

      id v10 = 0LL;
    }

    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(&v36, 8);
  }

  if (v10)
  {
    unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableURLRequest requestWithURL:](&OBJC_CLASS___NSMutableURLRequest, "requestWithURL:", v10));
    [v22 setHTTPMethod:@"POST"];
    [v22 setTimeoutInterval:a5];
    double v23 = (void *)objc_claimAutoreleasedReturnValue( -[SagaUploadPlaylistArtworkOperation _bodyDataWithAdditionalBodyFields:]( self,  "_bodyDataWithAdditionalBodyFields:",  v12));
    if (v23)
    {
      [v22 setValue:@"application/x-apple-plist" forHTTPHeaderField:@"Content-Type"];
      [v22 setValue:@"gzip" forHTTPHeaderField:@"Content-Encoding"];
      [v22 setHTTPBody:v23];
    }

    uint64_t v24 = -[ICStoreURLRequest initWithURLRequest:requestContext:]( objc_alloc(&OBJC_CLASS___ICStoreURLRequest),  "initWithURLRequest:requestContext:",  v22,  v15);
    -[ICStoreURLRequest setShouldUseMescalSigning:](v24, "setShouldUseMescalSigning:", 1LL);
  }

  else
  {
    uint64_t v24 = 0LL;
  }

  return v24;
}

- (id)_bodyDataWithAdditionalBodyFields:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[SagaUploadPlaylistArtworkOperation _standardBodyDictionaryWithAdditionalFields:]( self,  "_standardBodyDictionaryWithAdditionalFields:",  a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v3,  100LL,  0LL,  0LL));
  if ([v4 length])
  {
    id v5 = NSTemporaryDirectory();
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathComponent:@"updateplaylistasset.XXXXXX"]);

    id v18 = 0LL;
    uint64_t v8 = MSVCreateTemporaryFileHandle(v7, &v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    id v10 = v18;
    [v9 writeData:v4];
    [v9 closeFile];

    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v10));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 URLByAppendingPathExtension:@"gz"]);
    dispatch_semaphore_t v13 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v12 path]);
      *(_DWORD *)__int128 buf = 138543362;
      v20 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "Compressing items to upload to path: %{public}@",  buf,  0xCu);
    }

    MSVGzipCompressFile(v11, v12);
    id v15 = objc_claimAutoreleasedReturnValue([v11 path]);
    unlink((const char *)[v15 UTF8String]);

    dispatch_semaphore_t v16 = -[NSData initWithContentsOfURL:options:error:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithContentsOfURL:options:error:",  v12,  1LL,  0LL);
  }

  else
  {
    dispatch_semaphore_t v16 = 0LL;
  }

  return v16;
}

- (int64_t)playlistPersistentID
{
  return self->super._status;
}

- (void)setPlaylistPersistentID:(int64_t)a3
{
  self->super._int64_t status = a3;
}

- (NSNumber)dsid
{
  return (NSNumber *)self->super._error;
}

- (void)setDsid:(id)a3
{
}

- (NSString)cuid
{
  return (NSString *)self->_playlistPersistentID;
}

- (void)setCuid:(id)a3
{
}

- (NSString)troveID
{
  return (NSString *)&self->_dsid->super.super.isa;
}

- (void)setTroveID:(id)a3
{
}

- (NSString)userArtworkToken
{
  return self->_cuid;
}

- (void)setUserArtworkToken:(id)a3
{
}

- (NSNumber)containerCloudID
{
  return (NSNumber *)self->_troveID;
}

- (void)setContainerCloudID:(id)a3
{
}

- (NSURL)assetURL
{
  return (NSURL *)self->_userArtworkToken;
}

- (void)setAssetURL:(id)a3
{
}

- (unint64_t)assetFileSize
{
  return (unint64_t)self->_containerCloudID;
}

- (void)setAssetFileSize:(unint64_t)a3
{
  self->_containerCloudID = (NSNumber *)a3;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end