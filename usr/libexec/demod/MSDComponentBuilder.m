@interface MSDComponentBuilder
- (BOOL)forBackgroundDownload;
- (BOOL)isCriticalUpdate;
- (BOOL)verifyHashBeforeStaging;
- (MSDComponentBuilder)initWithSignedManifest:(id)a3 andOptions:(id)a4;
- (MSDSignedManifest)signedManifest;
- (NSString)appItemToDefer;
- (id)_buildAppComponentsNotInManifest:(id)a3;
- (id)buildComponentsFromManifest;
- (id)buildComponentsNotInManifest;
- (void)setAppItemToDefer:(id)a3;
- (void)setForBackgroundDownload:(BOOL)a3;
- (void)setIsCriticalUpdate:(BOOL)a3;
- (void)setSignedManifest:(id)a3;
- (void)setVerifyHashBeforeStaging:(BOOL)a3;
@end

@implementation MSDComponentBuilder

- (MSDComponentBuilder)initWithSignedManifest:(id)a3 andOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___MSDComponentBuilder;
  v8 = -[MSDComponentBuilder init](&v18, "init");
  v9 = v8;
  if (v8)
  {
    -[MSDComponentBuilder setSignedManifest:](v8, "setSignedManifest:", v6);
    -[MSDComponentBuilder setIsCriticalUpdate:](v9, "setIsCriticalUpdate:", 0LL);
    -[MSDComponentBuilder setForBackgroundDownload:](v9, "setForBackgroundDownload:", 0LL);
    -[MSDComponentBuilder setVerifyHashBeforeStaging:](v9, "setVerifyHashBeforeStaging:", 0LL);
    -[MSDComponentBuilder setAppItemToDefer:](v9, "setAppItemToDefer:", 0LL);
    v10 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"IsCriticalUpdate"]);
    v11 = v10;
    if (v10) {
      -[MSDComponentBuilder setIsCriticalUpdate:](v9, "setIsCriticalUpdate:", [v10 BOOLValue]);
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"ForBackgroundDownload"]);
    v13 = v12;
    if (v12) {
      -[MSDComponentBuilder setForBackgroundDownload:](v9, "setForBackgroundDownload:", [v12 BOOLValue]);
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"VerifyHashBeforeStaging"]);
    v15 = v14;
    if (v14) {
      -[MSDComponentBuilder setVerifyHashBeforeStaging:]( v9,  "setVerifyHashBeforeStaging:",  [v14 BOOLValue]);
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"AppItemToDefer"]);
    if (v16) {
      -[MSDComponentBuilder setAppItemToDefer:](v9, "setAppItemToDefer:", v16);
    }
  }

  return v9;
}

- (id)buildComponentsNotInManifest
{
  v3 = objc_alloc(&OBJC_CLASS___MSDOperationBuilder);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentBuilder signedManifest](self, "signedManifest"));
  v5 = -[MSDOperationBuilder initWithSignedManifest:forBackgroundDownload:verifyHashBeforeStaging:]( v3,  "initWithSignedManifest:forBackgroundDownload:verifyHashBeforeStaging:",  v4,  -[MSDComponentBuilder forBackgroundDownload](self, "forBackgroundDownload"),  -[MSDComponentBuilder verifyHashBeforeStaging](self, "verifyHashBeforeStaging"));

  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentBuilder _buildAppComponentsNotInManifest:](self, "_buildAppComponentsNotInManifest:", v5));
  if (v7)
  {
    -[NSMutableArray addObjectsFromArray:](v6, "addObjectsFromArray:", v7);
    v8 = v6;
  }

  else
  {
    v8 = 0LL;
  }

  return v8;
}

- (id)buildComponentsFromManifest
{
  unsigned __int8 v3 = -[MSDComponentBuilder isCriticalUpdate](self, "isCriticalUpdate");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentBuilder signedManifest](self, "signedManifest"));
  v5 = v4;
  if ((v3 & 1) != 0) {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 criticalComponents]);
  }
  else {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v4 installationOrder]);
  }
  id v7 = (void *)v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAppHelper sharedInstance](&OBJC_CLASS___MSDAppHelper, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 installedApps]);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentBuilder signedManifest](self, "signedManifest"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v10 getVersion]));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MSDProgressUpdater sharedInstance](&OBJC_CLASS___MSDProgressUpdater, "sharedInstance"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 bundleInProgress]);

  v46[0] = 0LL;
  v46[1] = v46;
  v46[2] = 0x3032000000LL;
  v46[3] = sub_100071090;
  v46[4] = sub_1000710A0;
  v14 = objc_alloc(&OBJC_CLASS___MSDOperationBuilder);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentBuilder signedManifest](self, "signedManifest"));
  v47 = -[MSDOperationBuilder initWithSignedManifest:forBackgroundDownload:verifyHashBeforeStaging:]( v14,  "initWithSignedManifest:forBackgroundDownload:verifyHashBeforeStaging:",  v15,  -[MSDComponentBuilder forBackgroundDownload](self, "forBackgroundDownload"),  -[MSDComponentBuilder verifyHashBeforeStaging](self, "verifyHashBeforeStaging"));

  uint64_t v40 = 0LL;
  v41 = &v40;
  uint64_t v42 = 0x3032000000LL;
  v43 = sub_100071090;
  v44 = sub_1000710A0;
  id v45 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v7 count]));
  uint64_t v34 = 0LL;
  v35 = &v34;
  uint64_t v36 = 0x3032000000LL;
  v37 = sub_100071090;
  v38 = sub_1000710A0;
  id v39 = 0LL;
  uint64_t v30 = 0LL;
  v31 = &v30;
  uint64_t v32 = 0x2020000000LL;
  char v33 = 1;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000710A8;
  v21[3] = &unk_1000FA780;
  id v16 = v11;
  id v22 = v16;
  id v17 = v13;
  id v23 = v17;
  v24 = self;
  v26 = v46;
  id v18 = v9;
  id v25 = v18;
  v27 = &v34;
  v28 = &v40;
  v29 = &v30;
  [v7 enumerateObjectsUsingBlock:v21];
  if (*((_BYTE *)v31 + 24))
  {
    if (v35[5]) {
      objc_msgSend((id)v41[5], "addObject:");
    }
    id v19 = [(id)v41[5] copy];
  }

  else
  {
    id v19 = 0LL;
  }

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(v46, 8);

  return v19;
}

- (id)_buildAppComponentsNotInManifest:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentBuilder signedManifest](self, "signedManifest"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 getAppList]);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAppHelper sharedInstance](&OBJC_CLASS___MSDAppHelper, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 installedApps]);

  id v10 = sub_10003A95C();
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Building components for removing app not in manifest...",  buf,  2u);
  }

  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id v12 = v9;
  id v13 = [v12 countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v13)
  {
    id v15 = v13;
    uint64_t v16 = *(void *)v38;
    *(void *)&__int128 v14 = 138543362LL;
    __int128 v36 = v14;
    while (2)
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v38 != v16) {
          objc_enumerationMutation(v12);
        }
        uint64_t v18 = *(void *)(*((void *)&v37 + 1) + 8LL * (void)i);
        id v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v18, v36, (void)v37));

        if (!v19)
        {
          id v20 = sub_10003A95C();
          v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v36;
            uint64_t v42 = v18;
            _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Building component for removing app: %{public}@",  buf,  0xCu);
          }

          id v22 = (void *)objc_claimAutoreleasedReturnValue([v4 buildAppRemovalOperationsWithIdentifier:v18]);
          if (!v22
            || (id v23 = -[MSDComponent initWithName:andOperations:]( objc_alloc(&OBJC_CLASS___MSDComponent),  "initWithName:andOperations:",  v18,  v22)) == 0LL)
          {

            id v27 = sub_10003A95C();
            v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
              sub_10009CE10(v28, v29, v30, v31, v32, v33, v34, v35);
            }

            id v25 = 0LL;
            goto LABEL_17;
          }

          v24 = v23;
          -[MSDComponent setForRemoval:](v23, "setForRemoval:", 1LL);
          -[NSMutableArray addObject:](v5, "addObject:", v24);
        }
      }

      id v15 = [v12 countByEnumeratingWithState:&v37 objects:v43 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }

  id v25 = v5;
LABEL_17:

  return v25;
}

- (BOOL)isCriticalUpdate
{
  return self->_isCriticalUpdate;
}

- (void)setIsCriticalUpdate:(BOOL)a3
{
  self->_isCriticalUpdate = a3;
}

- (BOOL)forBackgroundDownload
{
  return self->_forBackgroundDownload;
}

- (void)setForBackgroundDownload:(BOOL)a3
{
  self->_forBackgroundDownload = a3;
}

- (BOOL)verifyHashBeforeStaging
{
  return self->_verifyHashBeforeStaging;
}

- (void)setVerifyHashBeforeStaging:(BOOL)a3
{
  self->_verifyHashBeforeStaging = a3;
}

- (NSString)appItemToDefer
{
  return self->_appItemToDefer;
}

- (void)setAppItemToDefer:(id)a3
{
}

- (MSDSignedManifest)signedManifest
{
  return self->_signedManifest;
}

- (void)setSignedManifest:(id)a3
{
}

- (void).cxx_destruct
{
}

@end