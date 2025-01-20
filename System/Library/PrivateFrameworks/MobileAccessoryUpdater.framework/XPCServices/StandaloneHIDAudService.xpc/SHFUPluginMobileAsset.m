@interface SHFUPluginMobileAsset
- (NSNumber)searchLocal;
- (SHFUPluginMobileAsset)initWithDeviceClass:(id)a3 delegate:(id)a4 info:(id *)a5 options:(id)a6 deviceProperties:(id)a7;
- (id)downloadCatalog;
- (id)findLastestAsset:(id *)a3;
- (void)downloadFirmwareWithOptions:(id)a3;
- (void)findFirmwareWithOptions:(id)a3 remote:(BOOL)a4;
- (void)setSearchLocal:(id)a3;
@end

@implementation SHFUPluginMobileAsset

- (SHFUPluginMobileAsset)initWithDeviceClass:(id)a3 delegate:(id)a4 info:(id *)a5 options:(id)a6 deviceProperties:(id)a7
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SHFUPluginMobileAsset;
  v7 = -[SHFUPlugin initWithDeviceClass:delegate:info:options:deviceProperties:]( &v11,  "initWithDeviceClass:delegate:info:options:deviceProperties:",  a3,  a4,  a5,  a6,  a7);
  if (v7)
  {
    v8 = -[NSNumber initWithBool:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithBool:", 0LL);
    searchLocal = v7->_searchLocal;
    v7->_searchLocal = v8;
  }

  return v7;
}

- (id)downloadCatalog
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPluginMobileAsset searchLocal](self, "searchLocal"));
  unsigned __int8 v4 = [v3 BOOLValue];

  if ((v4 & 1) != 0)
  {
    id v5 = 0LL;
  }

  else
  {
    uint64_t v36 = 0LL;
    v37 = &v36;
    uint64_t v38 = 0x3032000000LL;
    v39 = sub_1000155C0;
    v40 = sub_1000155D0;
    id v41 = 0LL;
    objc_initWeak(&location, self);
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0LL);
    uint64_t v31 = 0LL;
    v32 = &v31;
    uint64_t v33 = 0x2020000000LL;
    int v34 = -1;
    v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin serialQueue](self, "serialQueue"));
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_1000155D8;
    handler[3] = &unk_1000248C0;
    objc_copyWeak(v30, &location);
    v30[1] = "com.apple.MobileAsset.DownloadsReady";
    v29 = &v31;
    v8 = v6;
    v28 = v8;
    uint32_t v9 = notify_register_dispatch("com.apple.MobileAsset.DownloadsReady", &v34, v7, handler);

    id v10 = objc_alloc_init(&OBJC_CLASS___MADownloadOptions);
    [v10 setDiscretionary:0];
    [v10 setAllowsCellularAccess:1];
    uint64_t v23 = 0LL;
    v24 = &v23;
    uint64_t v25 = 0x2020000000LL;
    char v26 = 1;
    do
    {
      dispatch_semaphore_t v11 = dispatch_semaphore_create(0LL);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin mobileAssetType](self, "mobileAssetType"));
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_1000156C0;
      v17[3] = &unk_1000248E8;
      uint32_t v22 = v9;
      v17[4] = self;
      v13 = v8;
      v18 = v13;
      v20 = &v36;
      v21 = &v23;
      v14 = v11;
      v19 = v14;
      +[MAAsset startCatalogDownload:options:then:]( &OBJC_CLASS___MAAsset,  "startCatalogDownload:options:then:",  v12,  v10,  v17);

      dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
    }

    while (*((_BYTE *)v24 + 24));
    int v15 = *((_DWORD *)v32 + 6);
    if (v15 != -1)
    {
      notify_cancel(v15);
      *((_DWORD *)v32 + 6) = -1;
    }

    id v5 = (id)v37[5];
    _Block_object_dispose(&v23, 8);

    objc_destroyWeak(v30);
    _Block_object_dispose(&v31, 8);

    objc_destroyWeak(&location);
    _Block_object_dispose(&v36, 8);
  }

  return v5;
}

- (id)findLastestAsset:(id *)a3
{
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin logHandle](self, "logHandle"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1000180B4(self);
  }

  if (!a3)
  {
    v24 = 0LL;
    return v24;
  }

  dispatch_semaphore_t v6 = (NSError *)objc_claimAutoreleasedReturnValue(-[SHFUPluginMobileAsset downloadCatalog](self, "downloadCatalog"));
  id v7 = objc_alloc(&OBJC_CLASS___MAAssetQuery);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin mobileAssetType](self, "mobileAssetType"));
  id v9 = [v7 initWithType:v8];

  [v9 returnTypes:2];
  uint64_t v10 = ASAttributeCompatibilityVersion;
  dispatch_semaphore_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin compatibilityVersion](self, "compatibilityVersion"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 stringValue]);
  [v9 addKeyValuePair:v10 with:v12];

  unint64_t v13 = (unint64_t)[v9 queryMetaDataSync];
  if ((v13 & 0xFFFFFFFFFFFFFFFDLL) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin mobileAssetType](self, "mobileAssetType"));
    int v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"MobileAsset query failed for %@. MAQueryResult = %ld",  v14,  v13));

    v16 = objc_alloc(&OBJC_CLASS___NSError);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin errorDomain](self, "errorDomain"));
    NSErrorUserInfoKey v49 = NSLocalizedDescriptionKey;
    v50 = v15;
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v50,  &v49,  1LL));
    v19 = v16;
    v20 = v17;
    uint64_t v21 = 48LL;
  }

  else
  {
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin logHandle](self, "logHandle"));
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
      sub_10001803C(self);
    }

    v28 = (void *)objc_claimAutoreleasedReturnValue([v9 results]);
    id v29 = [v28 count];

    if (v29)
    {
      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin logHandle](self, "logHandle"));
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
        sub_100017FC4(v9);
      }

      uint64_t v31 = ASAttributeContentVersion;
      v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SELF.attributes.%@ == %%@.@max.attributes.%@",  ASAttributeContentVersion,  ASAttributeContentVersion));
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v9 results]);
      int v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](&OBJC_CLASS___NSPredicate, "predicateWithFormat:", v32, v33));

      v35 = (void *)objc_claimAutoreleasedReturnValue([v9 results]);
      uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v35 filteredArrayUsingPredicate:v34]);

      if ([v36 count])
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue([v36 objectAtIndexedSubscript:0]);
        uint32_t v22 = 0LL;
      }

      else
      {
        v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Could not find asset with max %@",  v31));
        id v41 = objc_alloc(&OBJC_CLASS___NSError);
        v42 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin errorDomain](self, "errorDomain"));
        NSErrorUserInfoKey v45 = NSLocalizedDescriptionKey;
        v46 = v44;
        v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v46,  &v45,  1LL));
        uint32_t v22 = -[NSError initWithDomain:code:userInfo:](v41, "initWithDomain:code:userInfo:", v42, 7LL, v43);

        v24 = 0LL;
      }

      if (v24) {
        goto LABEL_11;
      }
      goto LABEL_7;
    }

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin compatibilityVersion](self, "compatibilityVersion"));
    id v38 = [v37 intValue];
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin mobileAssetType](self, "mobileAssetType"));
    int v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"MAQueryResult = %ld. No assets with %@ %d found for domain %@",  v13,  v10,  v38,  v39));

    v40 = objc_alloc(&OBJC_CLASS___NSError);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin errorDomain](self, "errorDomain"));
    NSErrorUserInfoKey v47 = NSLocalizedDescriptionKey;
    v48 = v15;
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v48,  &v47,  1LL));
    v19 = v40;
    v20 = v17;
    uint64_t v21 = 2LL;
  }

  uint32_t v22 = -[NSError initWithDomain:code:userInfo:](v19, "initWithDomain:code:userInfo:", v20, v21, v18);

LABEL_7:
  if (v6) {
    uint64_t v23 = v6;
  }
  else {
    uint64_t v23 = v22;
  }
  v24 = 0LL;
  *a3 = v23;
LABEL_11:
  uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin logHandle](self, "logHandle"));
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
    sub_100017F38((uint64_t)v24, v25);
  }

  return v24;
}

- (void)findFirmwareWithOptions:(id)a3 remote:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin logHandle](self, "logHandle"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_10001812C((uint64_t)v6, v4, v7);
  }

  if (v4) {
    uint64_t v8 = +[ASAsset nonUserInitiatedDownloadsAllowed]( &OBJC_CLASS___ASAsset,  "nonUserInitiatedDownloadsAllowed") ^ 1;
  }
  else {
    uint64_t v8 = 1LL;
  }
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v8));
  -[SHFUPluginMobileAsset setSearchLocal:](self, "setSearchLocal:", v9);

  id v54 = 0LL;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPluginMobileAsset findLastestAsset:](self, "findLastestAsset:", &v54));
  dispatch_semaphore_t v11 = (NSError *)v54;
  v12 = v11;
  unint64_t v13 = 0LL;
  if (v10 && !v11)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin latestFirmwareVersions](self, "latestFirmwareVersions"));
    int v15 = (void *)objc_claimAutoreleasedReturnValue([v10 attributes]);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:@"FirmwareVersions"]);
    [v14 addEntriesFromDictionary:v16];

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin delegate](self, "delegate"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin batteryCheckDevice](self, "batteryCheckDevice"));
    id v19 = [v18 BOOLValue];
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin logHandle](self, "logHandle"));
    NSErrorUserInfoKey v47 = v10;
    id v21 = v6;
    uint32_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin options](self, "options"));
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:@"IOMatchLaunchServiceID"]);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin errorDomain](self, "errorDomain"));
    id v53 = 0LL;
    uint64_t v25 = objc_claimAutoreleasedReturnValue( +[SHFUDevice getDevices:hasPowerSource:logHandle:registryEntryID:errorDomain:error:]( &OBJC_CLASS___SHFUDevice,  "getDevices:hasPowerSource:logHandle:registryEntryID:errorDomain:error:",  v17,  v19,  v20,  v23,  v24,  &v53));
    v12 = (NSError *)v53;

    unint64_t v13 = (void *)v25;
    id v6 = v21;
    uint64_t v10 = v47;
  }

  if (v12)
  {
    uint64_t v26 = 0LL;
    BOOL v27 = 0LL;
    goto LABEL_28;
  }

  v46 = v13;
  id v48 = v6;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  id v28 = v13;
  id v29 = [v28 countByEnumeratingWithState:&v49 objects:v67 count:16];
  if (!v29)
  {
    uint64_t v26 = 0LL;
    BOOL v27 = 0LL;
    v12 = 0LL;
    goto LABEL_27;
  }

  id v30 = v29;
  uint64_t v31 = *(void *)v50;
  while (2)
  {
    for (i = 0LL; i != v30; i = (char *)i + 1)
    {
      if (*(void *)v50 != v31) {
        objc_enumerationMutation(v28);
      }
      uint64_t v33 = *(void **)(*((void *)&v49 + 1) + 8LL * (void)i);
      BOOL v27 = -[SHFUPlugin deviceNeedsUpdate:](self, "deviceNeedsUpdate:", v33);
      if (v27)
      {
        unint64_t v36 = (unint64_t)[v10 state];
        v12 = 0LL;
        uint64_t v26 = 1LL;
        if (v36 > 6 || ((1LL << v36) & 0x6C) == 0) {
          goto LABEL_27;
        }
        v37 = (void *)objc_claimAutoreleasedReturnValue([v10 getLocalUrl]);
        -[SHFUPlugin setFirmwareDirectory:](self, "setFirmwareDirectory:", v37);
        v12 = 0LL;
LABEL_26:

        uint64_t v26 = 0LL;
        goto LABEL_27;
      }

      int v34 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin latestFirmwareVersions](self, "latestFirmwareVersions"));
      unsigned __int8 v35 = [v33 hardwareVersionSupportedBy:v34];

      if ((v35 & 1) == 0)
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"Device has HW revision ID %u which does not match FW files",  [v33 hardwareVersion]));
        id v38 = objc_alloc(&OBJC_CLASS___NSError);
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin errorDomain](self, "errorDomain"));
        NSErrorUserInfoKey v65 = NSLocalizedDescriptionKey;
        v66 = v37;
        v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v66,  &v65,  1LL));
        v12 = -[NSError initWithDomain:code:userInfo:](v38, "initWithDomain:code:userInfo:", v39, 44LL, v40);

        goto LABEL_26;
      }
    }

    id v30 = [v28 countByEnumeratingWithState:&v49 objects:v67 count:16];
    uint64_t v26 = 0LL;
    BOOL v27 = 0LL;
    v12 = 0LL;
    if (v30) {
      continue;
    }
    break;
  }

- (void)downloadFirmwareWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin logHandle](self, "logHandle"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1000181E0();
  }

  uint64_t v33 = 0LL;
  int v34 = &v33;
  uint64_t v35 = 0x2020000000LL;
  char v36 = 0;
  uint64_t v27 = 0LL;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  id v30 = sub_1000155C0;
  uint64_t v31 = sub_1000155D0;
  id v32 = 0LL;
  id obj = 0LL;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPluginMobileAsset findLastestAsset:](self, "findLastestAsset:", &obj));
  objc_storeStrong(&v32, obj);
  if (v6 && !v28[5])
  {
    id v7 = objc_alloc_init(&OBJC_CLASS___MADownloadOptions);
    [v7 setDiscretionary:0];
    [v7 setAllowsCellularAccess:1];
    dispatch_semaphore_t v8 = dispatch_semaphore_create(0LL);
    v17 = _NSConcreteStackBlock;
    uint64_t v18 = 3221225472LL;
    id v19 = sub_100016744;
    v20 = &unk_100024910;
    v24 = &v33;
    id v21 = self;
    id v22 = v6;
    uint64_t v25 = &v27;
    id v9 = v8;
    uint64_t v23 = v9;
    [v22 startDownload:v7 then:&v17];
    dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  }

  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin logHandle](self, "logHandle", v17, v18, v19, v20, v21));
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_semaphore_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin targetDevice](self, "targetDevice"));
    int v12 = *((unsigned __int8 *)v34 + 24);
    uint64_t v13 = v28[5];
    *(_DWORD *)buf = 138412802;
    id v38 = v11;
    __int16 v39 = 1024;
    int v40 = v12;
    __int16 v41 = 2112;
    uint64_t v42 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "downloadFirmware: target device %@ successful %d error %@",  buf,  0x1Cu);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin delegate](self, "delegate"));
  int v15 = *((unsigned __int8 *)v34 + 24);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SHFUPlugin pluginInfo](self, "pluginInfo"));
  [v14 didDownload:v15 != 0 info:v16 error:v28[5]];

  if (!*((_BYTE *)v34 + 24))
  {
    -[SHFUPlugin setError:](self, "setError:", v28[5]);
    -[SHFUPlugin setTransaction:](self, "setTransaction:", 0LL);
    -[SHFUPlugin setSerialQueue:](self, "setSerialQueue:", 0LL);
  }

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);
}

- (NSNumber)searchLocal
{
  return self->_searchLocal;
}

- (void)setSearchLocal:(id)a3
{
}

- (void).cxx_destruct
{
}

@end