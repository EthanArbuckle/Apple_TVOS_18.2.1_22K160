@interface DSFilesystemMetadataSnapshotService
+ (id)_validateOptions:(id)a3 error:(id *)a4;
- (id)generateFilesystemMetadataSnapshotWithOptions:(id)a3 reply:(id)a4;
@end

@implementation DSFilesystemMetadataSnapshotService

+ (id)_validateOptions:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = shared_filesystem_metadata_snapshot_service_log_handle();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v95 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Validating options: %{public}@", buf, 0xCu);
  }

  if (a4) {
    *a4 = 0LL;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if (!v5)
  {
    v9 = @"FilesystemMetadatSnapshotOptionShouldHashVolumeListings";
LABEL_36:
    v38 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v9]);

    if (v38)
    {
      if (!v8) {
        goto LABEL_42;
      }
    }

    else
    {
      [v8 setObject:&__kCFBooleanFalse forKeyedSubscript:v9];
      if (!v8) {
        goto LABEL_42;
      }
    }

    if ([v8 count])
    {
      id v39 = [v8 copy];
      goto LABEL_43;
    }

- (id)generateFilesystemMetadataSnapshotWithOptions:(id)a3 reply:(id)a4
{
  id v6 = (void (**)(id, void, id))a4;
  id v7 = a3;
  id v8 = shared_filesystem_metadata_snapshot_service_log_handle();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Validating options", buf, 2u);
  }

  id v34 = 0LL;
  id v10 = [(id)objc_opt_class(self) _validateOptions:v7 error:&v34];
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  id v12 = v34;
  if (v12)
  {
    id v13 = shared_filesystem_metadata_snapshot_service_log_handle();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10002B8D8(v14, v15, v16, v17, v18, v19, v20, v21);
    }

    v6[2](v6, 0LL, v12);
  }

  id v22 = shared_filesystem_metadata_snapshot_service_log_handle();
  v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Creating snapshot request", buf, 2u);
  }

  v24 = -[DSSnapshotRequest initWithOptions:](objc_alloc(&OBJC_CLASS___DSSnapshotRequest), "initWithOptions:", v11);
  id v25 = shared_filesystem_metadata_snapshot_service_log_handle();
  id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
    sub_10002B89C(v26);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100007EA8;
  block[3] = &unk_1000607D8;
  id v32 = v24;
  id v33 = v6;
  uint64_t v27 = v6;
  v28 = v24;
  dispatch_async(&_dispatch_main_q, block);
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[DSSnapshotRequest progress](v28, "progress"));

  return v29;
}

@end