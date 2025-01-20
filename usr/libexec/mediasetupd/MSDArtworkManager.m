@interface MSDArtworkManager
- (BOOL)removeCachedIconImage;
- (MSDArtworkManager)initWithServiceID:(id)a3 remoteImageURL:(id)a4;
- (NSString)serviceID;
- (NSURL)remoteImageURL;
- (id)_fetchImageFromInternetURL;
- (id)_returnGenericAppIcon;
- (id)_saveDataInLocalCacheDir:(id)a3 withName:(id)a4;
- (id)_saveISIconInLocalCacheDir:(id)a3 withName:(id)a4;
- (id)getLocalCachedImageURL;
- (void)getDataFromURL:(id)a3 completionHandler:(id)a4;
@end

@implementation MSDArtworkManager

- (MSDArtworkManager)initWithServiceID:(id)a3 remoteImageURL:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v35.receiver = self;
  v35.super_class = (Class)&OBJC_CLASS___MSDArtworkManager;
  v9 = -[MSDArtworkManager init](&v35, "init");
  v10 = v9;
  if (!v9)
  {
LABEL_8:
    v23 = v10;
    goto LABEL_12;
  }

  if (v7)
  {
    objc_storeStrong((id *)&v9->_serviceID, a3);
    objc_storeStrong((id *)&v10->_remoteImageURL, a4);
    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v10->_serviceID));
    serviceIconImageName = v10->_serviceIconImageName;
    v10->_serviceIconImageName = (NSString *)v11;

    uint64_t v13 = objc_claimAutoreleasedReturnValue( -[NSString stringByAppendingPathExtension:]( v10->_serviceIconImageName,  "stringByAppendingPathExtension:",  @"png"));
    v14 = v10->_serviceIconImageName;
    v10->_serviceIconImageName = (NSString *)v13;

    *(_OWORD *)&v10->_iconImageScale = xmmword_100048BA0;
    v10->_iconImageSize.height = 256.0;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v34 = 0LL;
    uint64_t v16 = objc_claimAutoreleasedReturnValue([v15 URLForDirectory:13 inDomain:1 appropriateForURL:0 create:0 error:&v34]);
    id v17 = v34;
    localCacheDirURL = v10->_localCacheDirURL;
    v10->_localCacheDirURL = (NSURL *)v16;

    uint64_t v19 = objc_claimAutoreleasedReturnValue( -[NSURL URLByAppendingPathComponent:]( v10->_localCacheDirURL,  "URLByAppendingPathComponent:",  @"com.apple.mediasetupd"));
    v20 = v10->_localCacheDirURL;
    v10->_localCacheDirURL = (NSURL *)v19;

    if (v17)
    {
      id v21 = sub_10003E9DC();
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_10000D59C();
      }
    }

    goto LABEL_8;
  }

  id v24 = sub_10003E9DC();
  v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
    sub_10000D56C(v25, v26, v27, v28, v29, v30, v31, v32);
  }

  v23 = 0LL;
LABEL_12:

  return v23;
}

- (id)getLocalCachedImageURL
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[NSURL URLByAppendingPathComponent:]( self->_localCacheDirURL,  "URLByAppendingPathComponent:",  self->_serviceIconImageName));
  if (-[NSString isEqualToString:](self->_serviceID, "isEqualToString:", kAppleMusicServiceIdentifier))
  {
    id v4 = objc_alloc(&OBJC_CLASS___ISIcon);
    id v5 = [v4 initWithBundleIdentifier:kAppleMusicBundleIdentifier];
    uint64_t v6 = objc_claimAutoreleasedReturnValue( -[MSDArtworkManager _saveISIconInLocalCacheDir:withName:]( self,  "_saveISIconInLocalCacheDir:withName:",  v5,  self->_serviceIconImageName));
LABEL_8:
    id v10 = (id)v6;

    goto LABEL_9;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 path]);
  unsigned int v9 = [v7 fileExistsAtPath:v8];

  if (!v9)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[MSDArtworkManager _fetchImageFromInternetURL](self, "_fetchImageFromInternetURL"));
    if (v5) {
      uint64_t v6 = objc_claimAutoreleasedReturnValue( -[MSDArtworkManager _saveDataInLocalCacheDir:withName:]( self,  "_saveDataInLocalCacheDir:withName:",  v5,  self->_serviceIconImageName));
    }
    else {
      uint64_t v6 = objc_claimAutoreleasedReturnValue(-[MSDArtworkManager _returnGenericAppIcon](self, "_returnGenericAppIcon"));
    }
    goto LABEL_8;
  }

  id v10 = v3;
LABEL_9:

  return v10;
}

- (id)_returnGenericAppIcon
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ISIcon genericApplicationIcon](&OBJC_CLASS___ISIcon, "genericApplicationIcon"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[MSDArtworkManager _saveISIconInLocalCacheDir:withName:]( self,  "_saveISIconInLocalCacheDir:withName:",  v3,  @"genericIcon.png"));

  return v4;
}

- (id)_saveDataInLocalCacheDir:(id)a3 withName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v6)
  {
    id v22 = sub_10003E9DC();
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_10000D5FC(v23, v24, v25, v26, v27, v28, v29, v30);
    }
    goto LABEL_17;
  }

  if (!v7)
  {
    id v35 = sub_10003E9DC();
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_10000D62C(v23, v36, v37, v38, v39, v40, v41, v42);
    }
LABEL_17:

LABEL_18:
    uint64_t v31 = 0LL;
    goto LABEL_19;
  }

  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  localCacheDirURL = self->_localCacheDirURL;
  p_localCacheDirURL = &self->_localCacheDirURL;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](localCacheDirURL, "path"));
  unsigned __int8 v13 = [v9 fileExistsAtPath:v12];

  if ((v13 & 1) == 0)
  {
    id v14 = sub_10003E9DC();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](*p_localCacheDirURL, "path"));
      *(_DWORD *)buf = 138477827;
      id v46 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Directory for icon file path (%{private}@) does not exist, will try to create now",  buf,  0xCu);
    }

    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    v18 = *p_localCacheDirURL;
    id v44 = 0LL;
    [v17 createDirectoryAtURL:v18 withIntermediateDirectories:1 attributes:0 error:&v44];
    id v19 = v44;

    if (v19)
    {
      id v20 = sub_10003E9DC();
      id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_10000D65C((id *)p_localCacheDirURL, (uint64_t)v19, v21);
      }

      goto LABEL_18;
    }
  }

  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL URLByAppendingPathComponent:](*p_localCacheDirURL, "URLByAppendingPathComponent:", v8));
  id v32 = sub_10003E9DC();
  v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    id v34 = (void *)objc_claimAutoreleasedReturnValue([v31 path]);
    *(_DWORD *)buf = 138478083;
    id v46 = v6;
    __int16 v47 = 2113;
    v48 = v34;
    _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "Saving image %{private}@ to path %{private}@",  buf,  0x16u);
  }

  [v6 writeToURL:v31 atomically:1];
LABEL_19:

  return v31;
}

- (id)_saveISIconInLocalCacheDir:(id)a3 withName:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_msgSend( [ISImageDescriptor alloc],  "initWithSize:scale:",  self->_iconImageSize.width,  self->_iconImageSize.height,  self->_iconImageScale);
  [v8 setShouldApplyMask:0];
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v7 prepareImageForDescriptor:v8]);

  id v10 = (UIImage *)objc_claimAutoreleasedReturnValue( +[UIImage imageWithCGImage:]( UIImage,  "imageWithCGImage:",  [v9 CGImage]));
  uint64_t v11 = UIImagePNGRepresentation(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue( -[MSDArtworkManager _saveDataInLocalCacheDir:withName:]( self,  "_saveDataInLocalCacheDir:withName:",  v12,  v6));

  return v13;
}

- (id)_fetchImageFromInternetURL
{
  if (self->_remoteImageURL)
  {
    v3 = dispatch_group_create();
    dispatch_group_enter(v3);
    uint64_t v20 = 0LL;
    id v21 = &v20;
    uint64_t v22 = 0x3032000000LL;
    v23 = sub_10000CFCC;
    uint64_t v24 = sub_10000CFDC;
    id v25 = 0LL;
    remoteImageURL = self->_remoteImageURL;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10000CFE4;
    v17[3] = &unk_100060DB0;
    id v19 = &v20;
    id v5 = v3;
    v18 = v5;
    -[MSDArtworkManager getDataFromURL:completionHandler:]( self,  "getDataFromURL:completionHandler:",  remoteImageURL,  v17);
    dispatch_time_t v6 = dispatch_time(0LL, 1000000000LL * MSMaxWaitTimeForServiceIconDownload);
    dispatch_group_wait(v5, v6);
    id v7 = (id)v21[5];

    _Block_object_dispose(&v20, 8);
  }

  else
  {
    id v8 = sub_10003E9DC();
    id v5 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR)) {
      sub_10000D700((os_log_s *)v5, v9, v10, v11, v12, v13, v14, v15);
    }
    id v7 = 0LL;
  }

  return v7;
}

- (void)getDataFromURL:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration ephemeralSessionConfiguration]( &OBJC_CLASS___NSURLSessionConfiguration,  "ephemeralSessionConfiguration"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSession sessionWithConfiguration:](&OBJC_CLASS___NSURLSession, "sessionWithConfiguration:", v7));

  uint64_t v9 = -[NSURLRequest initWithURL:](objc_alloc(&OBJC_CLASS___NSURLRequest), "initWithURL:", v6);
  id v10 = sub_10003E9DC();
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLRequest URL](v9, "URL"));
    *(_DWORD *)buf = 138412546;
    v18 = v12;
    __int16 v19 = 2112;
    uint64_t v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Executing fetch %@ withSession %@", buf, 0x16u);
  }

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10000D238;
  v15[3] = &unk_100060DD8;
  id v16 = v5;
  id v13 = v5;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v8 dataTaskWithRequest:v9 completionHandler:v15]);
  [v14 resume];
  [v8 finishTasksAndInvalidate];
}

- (BOOL)removeCachedIconImage
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[NSURL URLByAppendingPathComponent:]( self->_localCacheDirURL,  "URLByAppendingPathComponent:",  self->_serviceIconImageName));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 path]);
  unsigned int v5 = [v3 fileExistsAtPath:v4];

  id v6 = sub_10003E9DC();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v2 path]);
      *(_DWORD *)buf = 138477827;
      id v17 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Going to remove item at URL %{private}@",  buf,  0xCu);
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v15 = 0LL;
    [v10 removeItemAtURL:v2 error:&v15];
    id v8 = (os_log_s *)v15;

    if (!v8)
    {
      BOOL v13 = 1;
      goto LABEL_11;
    }

    id v11 = sub_10003E9DC();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10000D844();
    }
  }

  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    sub_10000D8A4();
  }

  BOOL v13 = 0;
LABEL_11:

  return v13;
}

- (NSString)serviceID
{
  return self->_serviceID;
}

- (NSURL)remoteImageURL
{
  return self->_remoteImageURL;
}

- (void).cxx_destruct
{
}

  ;
}

@end