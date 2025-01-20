@interface _PBSnapshotSaveOperation
- (XBApplicationSnapshot)snapshot;
- (XBApplicationSnapshotManifest)snapshotManifest;
- (XBSnapshotDataProvider)provider;
- (_PBSnapshotSaveOperation)initWithSnapshot:(id)a3 dataProvider:(id)a4 manifest:(id)a5;
- (id)generationCompletion;
- (void)cancel;
- (void)main;
- (void)setGenerationCompletion:(id)a3;
@end

@implementation _PBSnapshotSaveOperation

- (_PBSnapshotSaveOperation)initWithSnapshot:(id)a3 dataProvider:(id)a4 manifest:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS____PBSnapshotSaveOperation;
  id v12 = -[_PBSnapshotSaveOperation init](&v16, "init");
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)v12 + 4, a3);
    objc_storeStrong((id *)v13 + 5, a4);
    objc_storeStrong((id *)v13 + 3, a5);
    *((void *)v13 + 1) = [v9 userInterfaceStyle];
    uint64_t v14 = objc_opt_class(&OBJC_CLASS___PBSavedSnapshotDataProvider);
    *((_BYTE *)v13 + 16) = (objc_opt_isKindOfClass(v10, v14) & 1) == 0;
  }

  return (_PBSnapshotSaveOperation *)v13;
}

- (void)main
{
  v3 = dispatch_semaphore_create(0LL);
  id v4 = *(id *)&self->super._shouldPerformASAP;
  id v5 = sub_100083F78();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  spid = (char *)os_signpost_id_make_with_pointer(v6, self);

  id v7 = sub_100083F78();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = v8;
  unint64_t v36 = (unint64_t)(spid - 1);
  if ((unint64_t)(spid - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    id v10 = sub_1000BD564(v4);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v11;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v9,  OS_SIGNPOST_INTERVAL_BEGIN,  (os_signpost_id_t)spid,  "SaveSnapshot",  "%@",  (uint8_t *)&buf,  0xCu);
  }

  id v12 = sub_100083F78();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = sub_1000BD564(v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v15;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "SNAPSHOT: Begin %@", (uint8_t *)&buf, 0xCu);
  }

  if ((-[_PBSnapshotSaveOperation isCancelled](self, "isCancelled") & 1) != 0)
  {
    id v16 = sub_100083F78();
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "SNAPSHOT: Cancelled", (uint8_t *)&buf, 2u);
    }

    id v18 = sub_100083F78();
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    v20 = v19;
    if (v36 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v19))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v20,  OS_SIGNPOST_EVENT,  (os_signpost_id_t)spid,  "SaveSnapshot.cancelled",  "",  (uint8_t *)&buf,  2u);
    }

    uint64_t v21 = dispatch_semaphore_signal(v3);
  }

  else
  {
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v49 = 0x2020000000LL;
    char v50 = 1;
    objc_initWeak(&location, v4);
    v22 = dispatch_group_create();
    dispatch_group_enter(v22);
    targetUserInterfaceStyle = (void *)self->super._targetUserInterfaceStyle;
    snapshotManifest = self->_snapshotManifest;
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472LL;
    v42[2] = sub_1000C16AC;
    v42[3] = &unk_1003D5848;
    v46 = spid;
    id v25 = v4;
    id v43 = v25;
    p___int128 buf = &buf;
    v26 = v22;
    v44 = v26;
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472LL;
    v39[2] = sub_1000C1758;
    v39[3] = &unk_1003D04E0;
    v41[1] = spid;
    objc_copyWeak(v41, &location);
    v40 = v3;
    [targetUserInterfaceStyle generateImageForSnapshot:v25 dataProvider:snapshotManifest writeToFile:1 imageGeneratedHandler:v42 imageDataSavedHandler:v39];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000C1800;
    block[3] = &unk_1003D5870;
    block[4] = self;
    block[5] = &buf;
    dispatch_group_notify(v26, &_dispatch_main_q, block);

    objc_destroyWeak(v41);
    objc_destroyWeak(&location);
    _Block_object_dispose(&buf, 8);
  }

  CABackingStoreCollectBlocking(v21);
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  id v27 = sub_100083F78();
  v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v29 = sub_1000BD564(v4);
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v30;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "SNAPSHOT: End %@", (uint8_t *)&buf, 0xCu);
  }

  id v31 = sub_100083F78();
  v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
  v33 = v32;
  if (v36 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v32))
  {
    v34 = sub_1000BD564(v4);
    v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v35;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v33,  OS_SIGNPOST_INTERVAL_END,  (os_signpost_id_t)spid,  "SaveSnapshot",  "%@",  (uint8_t *)&buf,  0xCu);
  }
}

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____PBSnapshotSaveOperation;
  -[_PBSnapshotSaveOperation cancel](&v4, "cancel");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C18E8;
  block[3] = &unk_1003CFF08;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (XBApplicationSnapshotManifest)snapshotManifest
{
  return (XBApplicationSnapshotManifest *)self->super._targetUserInterfaceStyle;
}

- (XBApplicationSnapshot)snapshot
{
  return *(XBApplicationSnapshot **)&self->super._shouldPerformASAP;
}

- (XBSnapshotDataProvider)provider
{
  return self->_snapshotManifest;
}

- (id)generationCompletion
{
  return self->_snapshot;
}

- (void)setGenerationCompletion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end