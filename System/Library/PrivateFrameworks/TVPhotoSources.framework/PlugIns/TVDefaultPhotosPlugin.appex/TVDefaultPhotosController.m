@interface TVDefaultPhotosController
+ (void)initialize;
- (TVDefaultPhotosController)init;
- (id)_localizedCollectionIdentifierFromDictionary:(id)a3;
- (id)_photoCollectionFromExternalDict:(id)a3 photoCollectionRemoteURL:(id)a4;
- (id)completionBlock;
- (void)_fetchPhotoCollectionsWithCompletion:(id)a3;
- (void)_notificationForExtensionRequestWithItems:(id)a3;
- (void)_photoAssetsFromRemoteURL:(id)a3 completion:(id)a4;
- (void)_urlBagDidLoadNotification:(id)a3;
- (void)dealloc;
- (void)fetchAssetsForCollectionWithIdentifier:(id)a3 options:(id)a4 completion:(id)a5;
- (void)fetchCollectionsWithCompletion:(id)a3;
- (void)setCompletionBlock:(id)a3;
@end

@implementation TVDefaultPhotosController

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___TVDefaultPhotosController, a2) == a1)
  {
    os_log_t v2 = os_log_create("com.apple.TVPhotoSources.TVDefaultPhotosPlugin", "TVDefaultPhotosController");
    v3 = (void *)qword_1000082A8;
    qword_1000082A8 = (uint64_t)v2;
  }

- (TVDefaultPhotosController)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVDefaultPhotosController;
  os_log_t v2 = -[TVDefaultPhotosController init](&v4, "init");
  if (v2)
  {
    +[TVSNetworkUtilities setupNetworkMonitoring](&OBJC_CLASS___TVSNetworkUtilities, "setupNetworkMonitoring");
    +[TVSStoreFront connect](&OBJC_CLASS___TVSStoreFront, "connect");
  }

  return v2;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self name:TVSURLBagDidLoadNotification object:0];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVDefaultPhotosController;
  -[TVDefaultPhotosController dealloc](&v4, "dealloc");
}

- (void)fetchAssetsForCollectionWithIdentifier:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (os_log_s *)qword_1000082A8;
  if (os_log_type_enabled((os_log_t)qword_1000082A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v21 = v8;
    __int16 v22 = 2114;
    id v23 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Fetching assets for collection identifier %{public}@. Options %{public}@",  buf,  0x16u);
  }

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100001D2C;
  v15[3] = &unk_100004210;
  id v16 = v8;
  v17 = self;
  v18 = v17;
  id v19 = v10;
  v12 = v17;
  id v13 = v10;
  id v14 = v8;
  -[TVDefaultPhotosController _fetchPhotoCollectionsWithCompletion:](v12, "_fetchPhotoCollectionsWithCompletion:", v15);
}

- (void)fetchCollectionsWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = (os_log_s *)qword_1000082A8;
  if (os_log_type_enabled((os_log_t)qword_1000082A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Fetching all collections...", buf, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[TVSStoreURLBag sharedInstance](&OBJC_CLASS___TVSStoreURLBag, "sharedInstance"));
  unsigned __int8 v7 = [v6 isValid];

  if ((v7 & 1) != 0)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100002058;
    v9[3] = &unk_1000041E8;
    id v10 = self;
    id v11 = v4;
    id v8 = v10;
    -[TVDefaultPhotosController _fetchPhotoCollectionsWithCompletion:](v8, "_fetchPhotoCollectionsWithCompletion:", v9);
  }

  else
  {
    -[TVDefaultPhotosController setCompletionBlock:](self, "setCompletionBlock:", v4);
    id v8 = (TVDefaultPhotosController *)objc_claimAutoreleasedReturnValue( +[NSNotificationCenter defaultCenter]( &OBJC_CLASS___NSNotificationCenter,  "defaultCenter"));
    -[TVDefaultPhotosController addObserver:selector:name:object:]( v8,  "addObserver:selector:name:object:",  self,  "_urlBagDidLoadNotification:",  TVSURLBagDidLoadNotification,  0LL);
  }
}

- (void)_urlBagDidLoadNotification:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVSStoreURLBag sharedInstance](&OBJC_CLASS___TVSStoreURLBag, "sharedInstance", a3));
  unsigned int v5 = [v4 isValid];

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v6 removeObserver:self name:TVSURLBagDidLoadNotification object:0];

    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVDefaultPhotosController completionBlock](self, "completionBlock"));
    -[TVDefaultPhotosController fetchCollectionsWithCompletion:](self, "fetchCollectionsWithCompletion:", v7);

    -[TVDefaultPhotosController setCompletionBlock:](self, "setCompletionBlock:", 0LL);
  }

- (void)_photoAssetsFromRemoteURL:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unsigned __int8 v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v8 = objc_alloc(&OBJC_CLASS___SSMutableURLRequestProperties);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v5));
  id v10 = [v8 initWithURL:v9];

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[TVSStoreURLBag sharedInstance](&OBJC_CLASS___TVSStoreURLBag, "sharedInstance"));
  uint64_t v24 = 0LL;
  v25 = &v24;
  uint64_t v26 = 0x3032000000LL;
  v27 = sub_1000023A8;
  v28 = sub_1000023B8;
  id v29 = (id)objc_claimAutoreleasedReturnValue([v11 valueForKey:@"photoScreensaverSources"]);
  v12 = (os_log_s *)qword_1000082A8;
  if (os_log_type_enabled((os_log_t)qword_1000082A8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = v25[5];
    *(_DWORD *)buf = 138543362;
    uint64_t v31 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Photo Collections url %{public}@", buf, 0xCu);
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[TVSDocumentLoader documentLoaderWithRequestProperties:]( &OBJC_CLASS___TVSDocumentLoader,  "documentLoaderWithRequestProperties:",  v10));
  id v15 = objc_alloc_init(&OBJC_CLASS___TVSDocumentPlistDeserializationPostProcessor);
  [v14 setPostprocessor:v15];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1000023C0;
  v19[3] = &unk_100004238;
  id v16 = v5;
  id v20 = v16;
  id v23 = &v24;
  v17 = v7;
  id v21 = v17;
  id v18 = v6;
  id v22 = v18;
  [v14 loadWithCompletionHandler:v19];

  _Block_object_dispose(&v24, 8);
}

- (void)_fetchPhotoCollectionsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[TVSStoreURLBag sharedInstance](&OBJC_CLASS___TVSStoreURLBag, "sharedInstance"));
  uint64_t v23 = 0LL;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  uint64_t v26 = sub_1000023A8;
  v27 = sub_1000023B8;
  id v28 = (id)objc_claimAutoreleasedReturnValue([v6 valueForKey:@"photoScreensaverSources"]);
  unsigned __int8 v7 = (os_log_s *)qword_1000082A8;
  if (os_log_type_enabled((os_log_t)qword_1000082A8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = v24[5];
    *(_DWORD *)buf = 138543362;
    uint64_t v32 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Photo Collections url %{public}@", buf, 0xCu);
  }

  id v29 = @"Cache-Control";
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"max-age=%lu",  86400LL));
  v30 = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v30,  &v29,  1LL));

  id v11 = objc_alloc(&OBJC_CLASS___SSMutableURLRequestProperties);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v24[5]));
  id v13 = [v11 initWithURL:v12];

  [v13 setHTTPHeaders:v10];
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[TVSDocumentLoader documentLoaderWithRequestProperties:]( &OBJC_CLASS___TVSDocumentLoader,  "documentLoaderWithRequestProperties:",  v13));
  id v15 = objc_alloc_init(&OBJC_CLASS___TVSDocumentPlistDeserializationPostProcessor);
  [v14 setPostprocessor:v15];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1000028DC;
  v18[3] = &unk_100004260;
  id v22 = &v23;
  id v16 = v5;
  id v19 = v16;
  id v20 = self;
  id v17 = v4;
  id v21 = v17;
  [v14 loadWithCompletionHandler:v18];

  _Block_object_dispose(&v23, 8);
}

- (id)_photoCollectionFromExternalDict:(id)a3 photoCollectionRemoteURL:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(&OBJC_CLASS___TVMutablePhotoCollection);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[TVDefaultPhotosController _localizedCollectionIdentifierFromDictionary:]( self,  "_localizedCollectionIdentifierFromDictionary:",  v7));
  [v8 setCollectionName:v9];
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"CollectionIdentifier"]);
  [v8 setCollectionIdentifier:v10];
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"CollectionURL"]);

  v12 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByReplacingOccurrencesOfString:@"Collections.plist" withString:v11]);
  [v8 setRemoteURL:v12];
  [v8 setHasExternalURLs:1];

  return v8;
}

- (id)_localizedCollectionIdentifierFromDictionary:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKey:@"CollectionName"]);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDictionary, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 allKeys]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle preferredLocalizationsFromArray:]( &OBJC_CLASS___NSBundle,  "preferredLocalizationsFromArray:",  v7));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 firstObject]);
    id v10 = (os_log_s *)qword_1000082A8;
    if (os_log_type_enabled((os_log_t)qword_1000082A8, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138543362;
      id v18 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Preferred localization id %{public}@",  (uint8_t *)&v17,  0xCu);
    }

    if ([v9 length])
    {
      id v11 = (__CFString *)objc_claimAutoreleasedReturnValue([v3 objectForKey:v9]);
      if (!-[__CFString length](v11, "length"))
      {
        v12 = (os_log_s *)qword_1000082A8;
        if (os_log_type_enabled((os_log_t)qword_1000082A8, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v17) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "We found a preferred localization identifier but we could not find an appropriate mapping for the id in our server list. We fall back to 'en'",  (uint8_t *)&v17,  2u);
        }

        uint64_t v13 = objc_claimAutoreleasedReturnValue([v3 objectForKey:@"en"]);

        id v11 = (__CFString *)v13;
      }
    }

    else
    {
      id v15 = (os_log_s *)qword_1000082A8;
      if (os_log_type_enabled((os_log_t)qword_1000082A8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v17) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "We don't have a preferred localization identifier. We fall back to 'en'",  (uint8_t *)&v17,  2u);
      }

      id v11 = (__CFString *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"en"]);
    }
  }

  else
  {
    uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSString, v6);
    if ((objc_opt_isKindOfClass(v3, v14) & 1) != 0) {
      id v11 = v3;
    }
    else {
      id v11 = &stru_100004380;
    }
  }

  return v11;
}

- (void)_notificationForExtensionRequestWithItems:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVDefaultPhotosController;
  -[TVDefaultPhotosController completedExtensionRequestWithItems:](&v3, "completedExtensionRequestWithItems:", a3);
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end