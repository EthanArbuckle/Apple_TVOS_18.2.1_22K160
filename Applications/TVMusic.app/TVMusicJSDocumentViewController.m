@interface TVMusicJSDocumentViewController
- (BOOL)shouldUpdateOnViewDidAppear;
- (BOOL)updatePending;
- (BOOL)visibleOnScreen;
- (MPModelGenericObject)representedObject;
- (MPSectionedCollection)itemObjects;
- (NSDictionary)contextDictionary;
- (NSMutableArray)updateRequests;
- (NSString)identifier;
- (TVMusicJSDocumentViewController)initWithContextDictionary:(id)a3 identifier:(id)a4;
- (id)songsRequest;
- (void)_modelResponseDidInvalidate:(id)a3;
- (void)_performRequestForItemDataWithCompletion:(id)a3;
- (void)_updateDocument;
- (void)dealloc;
- (void)didCompleteDocumentCreationWithStatus:(int64_t)a3 errorDictionary:(id)a4;
- (void)removeViewController;
- (void)serviceRequest:(id)a3 didCompleteWithStatus:(int64_t)a4 errorDictionary:(id)a5;
- (void)setContextDictionary:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setItemObjects:(id)a3;
- (void)setShouldUpdateOnViewDidAppear:(BOOL)a3;
- (void)setUpdatePending:(BOOL)a3;
- (void)setUpdateRequests:(id)a3;
- (void)setVisibleOnScreen:(BOOL)a3;
- (void)updateServiceRequest:(id)a3 documentDidChange:(id)a4;
- (void)updateWithContextDictionary:(id)a3 forceUpdate:(BOOL)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TVMusicJSDocumentViewController

- (TVMusicJSDocumentViewController)initWithContextDictionary:(id)a3 identifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicAppDelegate theApp](&OBJC_CLASS___TVMusicAppDelegate, "theApp"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 appController]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 appContext]);

  id v12 = [[IKServiceContext alloc] initWithContextDictionary:v7 element:0];
  id v13 = [[IKDocumentServiceRequest alloc] initWithAppContext:v11 serviceContext:v12];
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___TVMusicJSDocumentViewController;
  v14 = -[TVMusicJSDocumentViewController initWithDocumentServiceRequest:](&v20, "initWithDocumentServiceRequest:", v13);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_contextDictionary, a3);
    objc_storeStrong((id *)&v15->_identifier, a4);
    uint64_t v16 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 5LL));
    updateRequests = v15->_updateRequests;
    v15->_updateRequests = (NSMutableArray *)v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v18 addObserver:v15 selector:"_modelResponseDidInvalidate:" name:MPModelResponseDidInvalidateNotification object:0];
  }

  return v15;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSDocumentViewController identifier](self, "identifier"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicCachedLibraryRequest sharedInstance]( &OBJC_CLASS___TVMusicCachedLibraryRequest,  "sharedInstance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSDocumentViewController identifier](self, "identifier"));
    [v4 clearCacheForIdentifier:v5];
  }

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVMusicJSDocumentViewController;
  -[TVMusicJSDocumentViewController dealloc](&v6, "dealloc");
}

- (id)songsRequest
{
  return 0LL;
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVMusicJSDocumentViewController;
  -[TVMusicJSDocumentViewController viewDidLoad](&v8, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSDocumentViewController songsRequest](self, "songsRequest"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSDocumentViewController identifier](self, "identifier"));

  if (v4 && v3)
  {
    objc_initWeak(&location, self);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_10006E2DC;
    v5[3] = &unk_10026BA58;
    objc_copyWeak(&v6, &location);
    -[TVMusicJSDocumentViewController _performRequestForItemDataWithCompletion:]( self,  "_performRequestForItemDataWithCompletion:",  v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVMusicJSDocumentViewController;
  -[TVMusicJSDocumentViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  -[TVMusicJSDocumentViewController setVisibleOnScreen:](self, "setVisibleOnScreen:", 0LL);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVMusicJSDocumentViewController;
  -[TVMusicJSDocumentViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  if (-[TVMusicJSDocumentViewController shouldUpdateOnViewDidAppear](self, "shouldUpdateOnViewDidAppear"))
  {
    -[TVMusicJSDocumentViewController reloadData](self, "reloadData");
    -[TVMusicJSDocumentViewController setShouldUpdateOnViewDidAppear:](self, "setShouldUpdateOnViewDidAppear:", 0LL);
  }

  -[TVMusicJSDocumentViewController setVisibleOnScreen:](self, "setVisibleOnScreen:", 1LL);
}

- (void)updateWithContextDictionary:(id)a3 forceUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  -[TVMusicJSDocumentViewController setContextDictionary:](self, "setContextDictionary:", v6);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSDocumentViewController identifier](self, "identifier"));

  if (v7)
  {
    if (v4)
    {
      objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicCachedLibraryRequest sharedInstance]( &OBJC_CLASS___TVMusicCachedLibraryRequest,  "sharedInstance"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSDocumentViewController identifier](self, "identifier"));
      [v8 clearCacheForIdentifier:v9];

      -[TVMusicJSDocumentViewController _updateDocument](self, "_updateDocument");
    }

    else
    {
      objc_initWeak((id *)buf, self);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = sub_10006E5D4;
      v12[3] = &unk_10026BA58;
      objc_copyWeak(&v13, (id *)buf);
      -[TVMusicJSDocumentViewController _performRequestForItemDataWithCompletion:]( self,  "_performRequestForItemDataWithCompletion:",  v12);
      objc_destroyWeak(&v13);
      objc_destroyWeak((id *)buf);
    }
  }

  else
  {
    id v10 = sub_10006E594();
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Can't update without an identifier: %@",  buf,  0xCu);
    }
  }
}

- (MPModelGenericObject)representedObject
{
  return 0LL;
}

- (void)removeViewController
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  BOOL v4 = sub_10006E7EC;
  v5 = &unk_100268CF0;
  id v6 = self;
  v2 = v3;
  if (+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread"))
  {
    v4((uint64_t)v2);
  }

  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10006F26C;
    block[3] = &unk_100268D60;
    objc_super v8 = v2;
    dispatch_async(&_dispatch_main_q, block);
  }
}

- (void)_updateDocument
{
  id v3 = sub_10006E594();
  BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSDocumentViewController representedObject](self, "representedObject"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 anyObject]);
    int v17 = 138412290;
    v18 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Updating document data for %@",  (uint8_t *)&v17,  0xCu);
  }

  id v7 = objc_alloc(&OBJC_CLASS___IKServiceContext);
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSDocumentViewController contextDictionary](self, "contextDictionary"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSDocumentViewController appDocument](self, "appDocument"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 templateElement]);
  id v11 = [v7 initWithContextDictionary:v8 element:v10];

  id v12 = objc_alloc(&OBJC_CLASS___IKUpdateServiceRequest);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSDocumentViewController documentServiceRequest](self, "documentServiceRequest"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 appContext]);
  id v15 = [v12 initWithAppContext:v14 serviceContext:v11];

  [v15 setDelegate:self];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSDocumentViewController updateRequests](self, "updateRequests"));
  [v16 addObject:v15];

  [v15 send];
}

- (void)_performRequestForItemDataWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[TVMusicCachedLibraryRequest sharedInstance]( &OBJC_CLASS___TVMusicCachedLibraryRequest,  "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSDocumentViewController songsRequest](self, "songsRequest"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSDocumentViewController identifier](self, "identifier"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10006EB54;
  v9[3] = &unk_10026BAA8;
  id v10 = v4;
  id v8 = v4;
  [v5 performRequest:v6 withIdentifier:v7 ignoreCache:1 completion:v9];
}

- (void)updateServiceRequest:(id)a3 documentDidChange:(id)a4
{
  id v5 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicJSDocumentViewController updateRequests](self, "updateRequests"));
  [v6 removeObject:v5];
}

- (void)serviceRequest:(id)a3 didCompleteWithStatus:(int64_t)a4 errorDictionary:(id)a5
{
  id v8 = a3;
  v9 = (char *)a5;
  id v10 = sub_10006E594();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v24 = "-[TVMusicJSDocumentViewController serviceRequest:didCompleteWithStatus:errorDictionary:]";
    __int16 v25 = 2080;
    v26 = "-[TVMusicJSDocumentViewController serviceRequest:didCompleteWithStatus:errorDictionary:]";
    __int16 v27 = 2048;
    int64_t v28 = a4;
    __int16 v29 = 2112;
    v30 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s: %s: status: %ld, error dict: %@",  buf,  0x2Au);
  }

  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___TVMusicJSDocumentViewController;
  -[TVMusicJSDocumentViewController serviceRequest:didCompleteWithStatus:errorDictionary:]( &v22,  "serviceRequest:didCompleteWithStatus:errorDictionary:",  v8,  a4,  v9);
  uint64_t v13 = objc_opt_class(&OBJC_CLASS___IKUpdateServiceRequest, v12);
  if ((objc_opt_isKindOfClass(v8, v13) & 1) != 0)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSDocumentViewController updateRequests](self, "updateRequests"));
    [v15 removeObject:v8];
  }

  if (a4)
  {
    id v16 = sub_10006E594();
    int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      v24 = (const char *)a4;
      __int16 v25 = 2112;
      v26 = v9;
      __int16 v27 = 2112;
      int64_t v28 = (int64_t)v8;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Unexpected document request completion: status = %ld, error dict = %@, request = %@",  buf,  0x20u);
    }
  }

  else
  {
    uint64_t v18 = objc_opt_class(&OBJC_CLASS___IKDocumentServiceRequest, v14);
    if ((objc_opt_isKindOfClass(v8, v18) & 1) != 0) {
      v19 = v8;
    }
    else {
      v19 = 0LL;
    }
    int v17 = v19;
    objc_super v20 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s appDocument](v17, "appDocument"));

    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s appDocument](v17, "appDocument"));
      -[TVMusicJSDocumentViewController replaceAppDocumentWithAppDocument:]( self,  "replaceAppDocumentWithAppDocument:",  v21);
    }
  }
}

- (void)didCompleteDocumentCreationWithStatus:(int64_t)a3 errorDictionary:(id)a4
{
  id v5 = a4;
  id v6 = sub_10006E594();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315906;
    v9 = "-[TVMusicJSDocumentViewController didCompleteDocumentCreationWithStatus:errorDictionary:]";
    __int16 v10 = 2080;
    id v11 = "-[TVMusicJSDocumentViewController didCompleteDocumentCreationWithStatus:errorDictionary:]";
    __int16 v12 = 2048;
    int64_t v13 = a3;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s: %s: status: %ld, error dict: %@",  (uint8_t *)&v8,  0x2Au);
  }
}

- (void)_modelResponseDidInvalidate:(id)a3
{
  if (!-[TVMusicJSDocumentViewController updatePending](self, "updatePending", a3))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicJSDocumentViewController identifier](self, "identifier"));

    if (v4)
    {
      -[TVMusicJSDocumentViewController setUpdatePending:](self, "setUpdatePending:", 1LL);
      objc_initWeak(&location, self);
      dispatch_time_t v5 = dispatch_time(0LL, 1000000000LL);
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472LL;
      v6[2] = sub_10006F08C;
      v6[3] = &unk_100269B10;
      objc_copyWeak(&v7, &location);
      dispatch_after(v5, &_dispatch_main_q, v6);
      objc_destroyWeak(&v7);
      objc_destroyWeak(&location);
    }
  }

- (NSDictionary)contextDictionary
{
  return self->_contextDictionary;
}

- (void)setContextDictionary:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (BOOL)visibleOnScreen
{
  return self->_visibleOnScreen;
}

- (void)setVisibleOnScreen:(BOOL)a3
{
  self->_visibleOnScreen = a3;
}

- (BOOL)shouldUpdateOnViewDidAppear
{
  return self->_shouldUpdateOnViewDidAppear;
}

- (void)setShouldUpdateOnViewDidAppear:(BOOL)a3
{
  self->_shouldUpdateOnViewDidAppear = a3;
}

- (BOOL)updatePending
{
  return self->_updatePending;
}

- (void)setUpdatePending:(BOOL)a3
{
  self->_updatePending = a3;
}

- (NSMutableArray)updateRequests
{
  return self->_updateRequests;
}

- (void)setUpdateRequests:(id)a3
{
}

- (MPSectionedCollection)itemObjects
{
  return self->_itemObjects;
}

- (void)setItemObjects:(id)a3
{
}

- (void).cxx_destruct
{
}

@end