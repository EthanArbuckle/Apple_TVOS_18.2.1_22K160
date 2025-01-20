@interface TVMusicScreenSaverService
+ (void)initialize;
- (ICCloudClient)iTunesCloudClient;
- (NSObject)syncObserverToken;
- (TVMusicScreenSaverService)init;
- (TVPhotoServerInterface)remotePhotoServerInterface;
- (void)_fetchPhotoAssetsForAlbumArtwork:(id)a3;
- (void)_getArtworkURLsForAlbums:(id)a3 completion:(id)a4;
- (void)photoAssetsWithOptions:(id)a3 responseBlock:(id)a4;
- (void)registerRemotePhotoServer:(id)a3;
- (void)setITunesCloudClient:(id)a3;
- (void)setRemotePhotoServerInterface:(id)a3;
- (void)setSyncObserverToken:(id)a3;
@end

@implementation TVMusicScreenSaverService

+ (void)initialize
{
  os_log_t v2 = os_log_create("com.apple.TVMusic", "TVMusicScreenSaverService");
  v3 = (void *)qword_1002BE9F8;
  qword_1002BE9F8 = (uint64_t)v2;
}

- (TVMusicScreenSaverService)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVMusicScreenSaverService;
  os_log_t v2 = -[TVMusicScreenSaverService init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(&OBJC_CLASS___ICCloudClient);
    iTunesCloudClient = v2->_iTunesCloudClient;
    v2->_iTunesCloudClient = v3;
  }

  return v2;
}

- (void)photoAssetsWithOptions:(id)a3 responseBlock:(id)a4
{
  id v5 = a4;
  objc_super v6 = (os_log_s *)qword_1002BE9F8;
  if (os_log_type_enabled((os_log_t)qword_1002BE9F8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PhotoAssets request", v7, 2u);
  }

  -[TVMusicScreenSaverService _fetchPhotoAssetsForAlbumArtwork:](self, "_fetchPhotoAssetsForAlbumArtwork:", v5);
}

- (void)registerRemotePhotoServer:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)qword_1002BE9F8;
  if (os_log_type_enabled((os_log_t)qword_1002BE9F8, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "RegisterRemotePhotoServer: %@",  (uint8_t *)&v6,  0xCu);
  }

  -[TVMusicScreenSaverService setRemotePhotoServerInterface:](self, "setRemotePhotoServerInterface:", v4);
}

- (void)_fetchPhotoAssetsForAlbumArtwork:(id)a3
{
  id v4 = a3;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  int v6 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicMPLibraryRequestFactory albumsLibraryRequest]( &OBJC_CLASS___TVMusicMPLibraryRequestFactory,  "albumsLibraryRequest"));
  id v7 = objc_alloc(&OBJC_CLASS___MPPropertySet);
  uint64_t v15 = MPModelRelationshipAlbumRepresentativeSong;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MPPropertySet emptyPropertySet](&OBJC_CLASS___MPPropertySet, "emptyPropertySet"));
  v16 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));
  id v10 = [v7 initWithProperties:&__NSArray0__struct relationships:v9];
  [v6 setItemProperties:v10];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100094C1C;
  v12[3] = &unk_10026C968;
  v12[4] = self;
  id v13 = v4;
  CFAbsoluteTime v14 = Current;
  id v11 = v4;
  [v6 performWithResponseHandler:v12];
}

- (void)_getArtworkURLsForAlbums:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v101 = 0LL;
  v102 = &v101;
  uint64_t v103 = 0x2020000000LL;
  char v104 = 0;
  v99[0] = 0LL;
  v99[1] = v99;
  v99[2] = 0x3032000000LL;
  v99[3] = sub_100095DEC;
  v99[4] = sub_100095DFC;
  id v100 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v5 count]));
  dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
  queue = dispatch_queue_create("com.apple.TVMusic.TVMusicScreenSaverService", v8);

  v65 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v5 count]));
  v64 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v5 count]));
  v63 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaLibrary defaultMediaLibrary](&OBJC_CLASS___MPMediaLibrary, "defaultMediaLibrary"));
  v98[0] = 0LL;
  v98[1] = v98;
  v98[2] = 0x2020000000LL;
  v98[3] = [v5 count];
  v94[0] = _NSConcreteStackBlock;
  v94[1] = 3221225472LL;
  v94[2] = sub_100095E04;
  v94[3] = &unk_10026C990;
  v96 = &v101;
  v97 = v99;
  id v56 = v6;
  id v95 = v56;
  v59 = objc_retainBlock(v94);
  __int128 v92 = 0u;
  __int128 v93 = 0u;
  __int128 v90 = 0u;
  __int128 v91 = 0u;
  obunint64_t j = v5;
  id v9 = [obj countByEnumeratingWithState:&v90 objects:v107 count:16];
  if (v9)
  {
    uint64_t v60 = *(void *)v91;
    uint64_t v57 = MPMediaItemPropertyPurchaseHistoryID;
    *(void *)&__int128 v10 = 138412290LL;
    __int128 v55 = v10;
LABEL_3:
    uint64_t v11 = 0LL;
    while (1)
    {
      if (*(void *)v91 != v60) {
        objc_enumerationMutation(obj);
      }
      if (*((_BYTE *)v102 + 24)) {
        break;
      }
      v12 = *(void **)(*((void *)&v90 + 1) + 8 * v11);
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 representativeSong]);
      CFAbsoluteTime v14 = (void *)objc_claimAutoreleasedReturnValue([v13 identifiers]);

      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 library]);
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "itemWithPersistentID:", objc_msgSend(v15, "persistentID")));

      v17 = (void *)objc_claimAutoreleasedReturnValue([v16 artwork]);
      [v17 bounds];
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "imageWithSize:", v18, v19));
      v21 = (void *)objc_claimAutoreleasedReturnValue([v20 artworkCatalogBackingFileURL]);
      v22 = v21;
      if (v21)
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_100095F10;
        block[3] = &unk_10026C9B8;
        v88 = v99;
        id v86 = v21;
        v89 = v98;
        v87 = v59;
        dispatch_async(queue, block);
      }

      else
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue([v14 personalizedStore]);
        BOOL v24 = [v23 cloudID] == 0;

        if (v24)
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue([v14 universalStore]);
          BOOL v28 = [v27 purchasedAdamID] == 0;

          if (v28) {
            goto LABEL_17;
          }
          v29 = (void *)objc_claimAutoreleasedReturnValue([v14 library]);
          v30 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v63,  "itemWithPersistentID:verifyExistence:",  objc_msgSend(v29, "persistentID"),  0));

          v31 = (void *)objc_claimAutoreleasedReturnValue([v30 valueForProperty:v57]);
          if (![v31 longLongValue])
          {

LABEL_17:
            v84[0] = _NSConcreteStackBlock;
            v84[1] = 3221225472LL;
            v84[2] = sub_100095FA4;
            v84[3] = &unk_10026B000;
            v84[4] = v98;
            dispatch_async(queue, v84);
            v32 = (os_log_s *)qword_1002BE9F8;
            if (os_log_type_enabled((os_log_t)qword_1002BE9F8, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v55;
              uint64_t v106 = (uint64_t)v12;
              _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Can't get an image for album: %@",  buf,  0xCu);
            }

            goto LABEL_11;
          }

          [v64 addObject:v31];
        }

        else
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue([v14 personalizedStore]);
          v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( NSNumber,  "numberWithUnsignedLongLong:",  [v25 cloudID]));
          [v65 addObject:v26];
        }
      }

- (TVPhotoServerInterface)remotePhotoServerInterface
{
  return self->_remotePhotoServerInterface;
}

- (void)setRemotePhotoServerInterface:(id)a3
{
}

- (NSObject)syncObserverToken
{
  return self->_syncObserverToken;
}

- (void)setSyncObserverToken:(id)a3
{
}

- (ICCloudClient)iTunesCloudClient
{
  return self->_iTunesCloudClient;
}

- (void)setITunesCloudClient:(id)a3
{
}

- (void).cxx_destruct
{
}

@end