@interface MSDContentFilesUninstallOperation
- (BOOL)_clearDataContainer:(id)a3 ofType:(id)a4;
- (BOOL)_removeContentFiles;
- (id)methodSelectors;
- (int64_t)type;
@end

@implementation MSDContentFilesUninstallOperation

- (id)methodSelectors
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](&OBJC_CLASS___NSValue, "valueWithPointer:", "_removeContentFiles"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v2, 0LL));

  return v3;
}

- (int64_t)type
{
  return 4LL;
}

- (BOOL)_removeContentFiles
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 identifier]);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 containerType]);

  id v7 = sub_10003A95C();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543618;
    v12 = v4;
    __int16 v13 = 2114;
    v14 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Deleting content files from container %{public}@ of type %{public}@",  (uint8_t *)&v11,  0x16u);
  }

  BOOL v9 = -[MSDContentFilesUninstallOperation _clearDataContainer:ofType:](self, "_clearDataContainer:ofType:", v4, v6);
  return v9;
}

- (BOOL)_clearDataContainer:(id)a3 ofType:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 isEqualToString:@"AppData"])
  {
    uint64_t v7 = 2LL;
  }

  else if ([v6 isEqualToString:@"GroupData"])
  {
    uint64_t v7 = 7LL;
  }

  else
  {
    if (([v6 isEqualToString:@"ExtensionData"] & 1) == 0)
    {
      id v15 = sub_10003A95C();
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_10009AB34((uint64_t)v6, v16);
      }

      goto LABEL_17;
    }

    uint64_t v7 = 4LL;
  }

  id v8 = sub_10003A95C();
  BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v25 = v5;
    __int16 v26 = 2114;
    id v27 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Clearing data container: %{public}@ (%{public}@)",  buf,  0x16u);
  }

  id v10 = v5;
  uint64_t v11 = container_create_or_lookup_for_current_user( v7,  [v10 cStringUsingEncoding:4],  0,  0,  &v22,  &v23);
  if (!v11)
  {
    id v17 = sub_10003A95C();
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      id v25 = v10;
      __int16 v26 = 2114;
      id v27 = v6;
      __int16 v28 = 2048;
      uint64_t v29 = v23;
      _os_log_error_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "Cannot create container object for %{public}@(%{public}@): %lld",  buf,  0x20u);
    }

LABEL_17:
    BOOL v13 = 0;
    goto LABEL_13;
  }

  uint64_t v12 = v11;
  uint64_t v23 = container_delete_all_container_content();
  BOOL v13 = v23 == 1;
  if (v23 != 1)
  {
    id v19 = sub_10003A95C();
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      id v25 = v10;
      __int16 v26 = 2114;
      id v27 = v6;
      __int16 v28 = 2048;
      uint64_t v29 = v23;
      _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "Cannot remove data for container %{public}@(%{public}@), error code is %lld",  buf,  0x20u);
    }
  }

  container_free_object(v12);
LABEL_13:

  return v13;
}

@end