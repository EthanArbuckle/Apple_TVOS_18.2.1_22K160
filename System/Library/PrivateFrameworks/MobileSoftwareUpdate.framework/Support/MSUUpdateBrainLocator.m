@interface MSUUpdateBrainLocator
+ (id)brainLocatorWithUpdateAttributes:(id)a3;
+ (id)locatorsDictionary;
+ (id)locatorsStateQueue;
+ (id)newBrainAssetName:(id)a3;
+ (id)stateSummary:(id)a3;
- (BOOL)_purgeInstalledUpdateBrains:(id *)a3;
- (BOOL)cancelAllDownloadsExcept:(id)a3 error:(id *)a4;
- (BOOL)cancelInstall:(id *)a3;
- (BOOL)purgeInstalledUpdateBrains:(id *)a3;
- (MAAsset)brainAsset;
- (MSUUpdateBrainLocator)initWithUpdateAssetAttributes:(id)a3;
- (NSDictionary)updateAssetAttributes;
- (NSString)brainVersion;
- (NSString)deviceType;
- (char)copyUpdateBrainPath:(id *)a3;
- (id)newBestAssetFromResults:(id)a3 error:(id *)a4;
- (id)newBrainAsset:(id *)a3;
- (id)newBrainQuery;
- (id)newFilteredBrainQuery;
- (void)_clientRequestBegin:(id)a3;
- (void)_clientRequestComplete:(id)a3 nameForNumber:(id)a4 valueForNumber:(int64_t)a5 withError:(id)a6 handler:(id)a7;
- (void)_clientRequestComplete:(id)a3 reportingState:(id)a4 withError:(id)a5 moreToCome:(BOOL)a6 handler:(id)a7;
- (void)_clientRequestComplete:(id)a3 withError:(id)a4;
- (void)_clientRequestComplete:(id)a3 withError:(id)a4 handler:(id)a5;
- (void)_clientRequestComplete:(id)a3 withError:(id)a4 wasSuccessful:(BOOL)a5;
- (void)adjustDownloadOptions:(id)a3 handler:(id)a4;
- (void)adjustMADownloadOptions:(id)a3 callback:(id)a4;
- (void)appendCatalogDownloadOptionsToExistingOptions:(id)a3;
- (void)createBestAsset:(id)a3;
- (void)dealloc;
- (void)downloadBrainAsset:(id)a3 handler:(id)a4;
- (void)installMAUpdateBrain:(id)a3 handler:(id)a4;
- (void)installUpdateBrain:(id)a3 handler:(id)a4;
- (void)requiredDiskSpace:(id)a3;
- (void)setUpdateAssetAttributes:(id)a3;
@end

@implementation MSUUpdateBrainLocator

+ (id)brainLocatorWithUpdateAttributes:(id)a3
{
  uint64_t v13 = 0LL;
  v14 = &v13;
  uint64_t v15 = 0x3052000000LL;
  v16 = __Block_byref_object_copy__3;
  v17 = __Block_byref_object_dispose__3;
  uint64_t v18 = 0LL;
  if (os_variant_allows_internal_security_policies("com.apple.MobileSoftwareUpdate", a2))
  {
    CFPropertyListRef v4 = _MSUPreferencesCopyValue(@"MSUUpdateBrainLocationOverride");
    v5 = v4;
    if (v4)
    {
      CFTypeID v6 = CFGetTypeID(v4);
      if (v6 == CFStringGetTypeID())
      {
        v7 = a3
           ? CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0LL, (CFDictionaryRef)a3)
           : CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
        v8 = v7;
        if (v7)
        {
          CFDictionarySetValue(v7, @"__msu_brain-location_key", v5);
          v9 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543874;
            v20 = @"MSUUpdateBrainLocationOverride";
            __int16 v21 = 2114;
            v22 = @"com.apple.MobileSoftwareUpdate";
            __int16 v23 = 2114;
            v24 = v5;
            _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[BRAIN_LOCATOR] WARNING WARNING WARNING: '%{public}@' default is defined in '%{public}@' domain with path {%{public}@}. Will attempt to use specified custom brain path.",  buf,  0x20u);
          }

          a3 = v8;
        }
      }

      CFRelease(v5);
    }
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = __58__MSUUpdateBrainLocator_brainLocatorWithUpdateAttributes___block_invoke;
  v12[3] = &unk_1000592D8;
  v12[4] = a3;
  v12[5] = &v13;
  dispatch_sync( (dispatch_queue_t)+[MSUUpdateBrainLocator locatorsStateQueue]( &OBJC_CLASS___MSUUpdateBrainLocator,  "locatorsStateQueue"),  v12);
  v10 = (void *)v14[5];
  _Block_object_dispose(&v13, 8);
  return v10;
}

void __58__MSUUpdateBrainLocator_brainLocatorWithUpdateAttributes___block_invoke(uint64_t a1)
{
  v2 = *(NSNull **)(a1 + 32);
  if (!v2) {
    v2 = +[NSNull null](&OBJC_CLASS___NSNull, "null");
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend( +[MSUUpdateBrainLocator locatorsDictionary]( MSUUpdateBrainLocator,  "locatorsDictionary"),  "objectForKey:",  v2);
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL))
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) = -[MSUUpdateBrainLocator initWithUpdateAssetAttributes:]( objc_alloc(&OBJC_CLASS___MSUUpdateBrainLocator),  "initWithUpdateAssetAttributes:",  *(void *)(a1 + 32));
    objc_msgSend( +[MSUUpdateBrainLocator locatorsDictionary](MSUUpdateBrainLocator, "locatorsDictionary"),  "setObject:forKey:",  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40),  v2);
  }

+ (id)locatorsStateQueue
{
  if (locatorsStateQueue_queueOnce != -1) {
    dispatch_once(&locatorsStateQueue_queueOnce, &__block_literal_global_4);
  }
  return (id)locatorsStateQueue_queue;
}

void __43__MSUUpdateBrainLocator_locatorsStateQueue__block_invoke(id a1)
{
  locatorsStateQueue_queue = (uint64_t)dispatch_queue_create( "com.apple.mobile.softwareupdate.MSUUpdateBrainLocator",  0LL);
}

+ (id)locatorsDictionary
{
  if (locatorsDictionary_locatorsOnce != -1) {
    dispatch_once(&locatorsDictionary_locatorsOnce, &__block_literal_global_8);
  }
  return (id)locatorsDictionary_locators;
}

void __43__MSUUpdateBrainLocator_locatorsDictionary__block_invoke(id a1)
{
  locatorsDictionary_locators = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
}

- (MSUUpdateBrainLocator)initWithUpdateAssetAttributes:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MSUUpdateBrainLocator;
  CFPropertyListRef v4 = -[MSUUpdateBrainLocator init](&v6, "init");
  if (v4)
  {
    v4->_updateAssetAttributes = (NSDictionary *)a3;
    v4->_brainAsset = 0LL;
    v4->_brainVersion = 0LL;
  }

  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MSUUpdateBrainLocator;
  -[MSUUpdateBrainLocator dealloc](&v3, "dealloc");
}

- (NSString)deviceType
{
  return (NSString *)(id)MGCopyAnswer(@"ProductType", 0LL);
}

- (char)copyUpdateBrainPath:(id *)a3
{
  v27 = 0LL;
  -[MSUUpdateBrainLocator _clientRequestBegin:](self, "_clientRequestBegin:", @"copyUpdateBrainPath");
  if (-[MSUUpdateBrainLocator updateAssetAttributes](self, "updateAssetAttributes")
    && (v5 = -[NSDictionary objectForKey:]( -[MSUUpdateBrainLocator updateAssetAttributes](self, "updateAssetAttributes"),  "objectForKey:",  @"__msu_brain-location_key")) != 0 && (objc_super v6 = v5, [v5 UTF8String]))
  {
    v7 = strdup((const char *)[v6 UTF8String]);
    v8 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v29 = @"copyUpdateBrainPath";
      __int16 v30 = 2082;
      uint64_t v31 = (uint64_t)v7;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[BRAIN_LOCATOR] {%{public}@} | Using provided local brain location at: %{public}s",  buf,  0x16u);
    }

    v9 = 0LL;
    id v10 = 0LL;
  }

  else
  {
    id v10 = -[MSUUpdateBrainLocator newFilteredBrainQuery](self, "newFilteredBrainQuery");
    [v10 returnTypes:1];
    [v10 setDoNotBlockOnNetworkStatus:1];
    v11 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v29 = @"copyUpdateBrainPath";
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[BRAIN_LOCATOR] {%{public}@} | queryMetaDataSync...",  buf,  0xCu);
    }

    id v12 = [v10 queryMetaDataSync];
    if (v12)
    {
      char v13 = MAStringForMAQueryResult(v12);
      CFErrorRef error_internal_cf = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  35LL,  0LL,  0LL,  @"Failed to query for update brain asset, result:%@",  v14,  v15,  v16,  v13);
      v27 = (id)CFMakeCollectable(error_internal_cf);
      if (os_log_type_enabled( (os_log_t)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog"),  OS_LOG_TYPE_ERROR))
      {
        -[MSUUpdateBrainLocator copyUpdateBrainPath:].cold.1();
      }
    }

    else
    {
      uint64_t v18 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = MAStringForMAQueryResult(0LL);
        *(_DWORD *)buf = 138543618;
        v29 = @"copyUpdateBrainPath";
        __int16 v30 = 2114;
        uint64_t v31 = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "[BRAIN_LOCATOR] {%{public}@} | ...queryMetaDataSync | SUCCESS | MAQueryResult:%{public}@",  buf,  0x16u);
      }

      id v20 = -[MSUUpdateBrainLocator newBestAssetFromResults:error:]( self,  "newBestAssetFromResults:error:",  [v10 results],  &v27);
      if (v20)
      {
        v9 = v20;
        v7 = strdup((const char *)objc_msgSend(objc_msgSend(objc_msgSend(v20, "getLocalUrl"), "path"), "UTF8String"));
        goto LABEL_17;
      }

      if (!v27)
      {
        CFErrorRef v25 = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  35LL,  0LL,  0LL,  @"Could not find best update brain asset from results",  v21,  v22,  v23,  v26);
        v7 = 0LL;
        v9 = 0LL;
        v27 = (id)CFMakeCollectable(v25);
        goto LABEL_17;
      }
    }

    v7 = 0LL;
    v9 = 0LL;
  }

- (id)newFilteredBrainQuery
{
  objc_super v3 = +[NSNull null](&OBJC_CLASS___NSNull, "null");
  CFPropertyListRef v4 = (const __CFString *)MGCopyAnswer(@"DeviceClass", 0LL);
  if (v4)
  {
    id v5 = v4;
    CFTypeID v6 = CFGetTypeID(v4);
    if (v6 == CFStringGetTypeID())
    {
      CFComparisonResult v7 = CFStringCompare(v5, @"AudioAccessory", 0LL);
      CFRelease(v5);
      if (v7 == kCFCompareEqualTo)
      {
        v8 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
        uint64_t v9 = 21LL;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          int v16 = 21;
          id v10 = "[BRAIN_LOCATOR] {newFilteredBrainQuery} | Using audio accessory _CompatibilityVersion=%d";
LABEL_9:
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v10, buf, 8u);
          goto LABEL_10;
        }

        goto LABEL_10;
      }
    }

    else
    {
      CFRelease(v5);
    }
  }

  v8 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  uint64_t v9 = 20LL;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v16 = 20;
    id v10 = "[BRAIN_LOCATOR] {newFilteredBrainQuery} | Using standard _CompatibilityVersion=%d";
    goto LABEL_9;
  }

- (id)newBestAssetFromResults:(id)a3 error:(id *)a4
{
  CFComparisonResult v7 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v43 = [a3 count];
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[BRAIN_LOCATOR] {newBestAssetFromResults} | starting with: %lu query results",  buf,  0xCu);
  }

  if (!a3 || ![a3 count])
  {
    CFErrorRef error_internal_cf = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  803LL,  0LL,  0LL,  @"Query resulted in no update brain assets",  v8,  v9,  v10,  v33);
    v29 = (id)CFMakeCollectable(error_internal_cf);
    uint64_t v31 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "[BRAIN_LOCATOR] {newBestAssetFromResults} | Nil array or zero assets from brain query, aborting",  buf,  2u);
    }

    goto LABEL_18;
  }

  id v11 = [a3 sortedArrayUsingComparator:&__block_literal_global_28];
  id v12 = objc_msgSend(objc_msgSend(v11, "lastObject"), "attributes");
  id v13 = [v12 objectForKey:ASAttributeContentVersion];
  id v14 = objc_msgSend(objc_msgSend(v11, "lastObject"), "attributes");
  id v15 = [v14 objectForKey:ASAttributeMasteredVersion];
  id v16 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = __55__MSUUpdateBrainLocator_newBestAssetFromResults_error___block_invoke_32;
  v39[3] = &unk_100059380;
  v39[4] = v13;
  v39[5] = v15;
  v39[6] = v16;
  [v11 enumerateObjectsUsingBlock:v39];
  id v17 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  id v18 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472LL;
  v38[2] = __55__MSUUpdateBrainLocator_newBestAssetFromResults_error___block_invoke_2;
  v38[3] = &unk_100059380;
  v38[4] = v17;
  v38[5] = self;
  v38[6] = v18;
  [v16 enumerateObjectsUsingBlock:v38];
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  v40[0] = v17;
  v40[1] = v18;
  uint64_t v19 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v40, 2LL);
  id v20 = -[NSArray countByEnumeratingWithState:objects:count:]( v19,  "countByEnumeratingWithState:objects:count:",  &v34,  v41,  16LL);
  if (v20)
  {
    uint64_t v21 = *(void *)v35;
    do
    {
      uint64_t v22 = 0LL;
      do
      {
        if (*(void *)v35 != v21) {
          objc_enumerationMutation(v19);
        }
        [*(id *)(*((void *)&v34 + 1) + 8 * (void)v22) sortUsingComparator:&__block_literal_global_35];
        uint64_t v22 = (char *)v22 + 1;
      }

      while (v20 != v22);
      id v20 = -[NSArray countByEnumeratingWithState:objects:count:]( v19,  "countByEnumeratingWithState:objects:count:",  &v34,  v41,  16LL);
    }

    while (v20);
  }

  if (![v18 count] && (id v18 = v17, !objc_msgSend(v17, "count"))
    || (id v26 = [v18 lastObject], v27 = v26, !v26))
  {
    CFErrorRef v28 = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  805LL,  0LL,  0LL,  @"No matching update brains found",  v23,  v24,  v25,  v33);
    v29 = (id)CFMakeCollectable(v28);
LABEL_18:
    id v26 = 0LL;
    if (a4 && v29)
    {
      id v26 = 0LL;
      *a4 = v29;
    }
  }

  return v26;
}

int64_t __55__MSUUpdateBrainLocator_newBestAssetFromResults_error___block_invoke( id a1,  MAAsset *a2,  MAAsset *a3)
{
  id v5 = -[MAAsset attributes](a2, "attributes");
  int64_t result = (int64_t)objc_msgSend( objc_msgSend(v5, "objectForKey:", ASAttributeContentVersion),  "compare:",  objc_msgSend( -[MAAsset attributes](a3, "attributes"),  "objectForKey:",  ASAttributeContentVersion));
  if (!result)
  {
    id v7 = -[MAAsset attributes](a2, "attributes");
    uint64_t v8 = ASAttributeMasteredVersion;
    if ([v7 objectForKey:ASAttributeMasteredVersion]
      || (int64_t result = (int64_t)objc_msgSend(-[MAAsset attributes](a3, "attributes"), "objectForKey:", v8)) != 0)
    {
      if (objc_msgSend(-[MAAsset attributes](a2, "attributes"), "objectForKey:", v8))
      {
        if (objc_msgSend(-[MAAsset attributes](a3, "attributes"), "objectForKey:", v8))
        {
          uint64_t v9 = objc_alloc_init(&OBJC_CLASS___NSNumberFormatter);
          -[NSNumberFormatter setFormatterBehavior:]( v9,  "setFormatterBehavior:",  +[NSNumberFormatter defaultFormatterBehavior](&OBJC_CLASS___NSNumberFormatter, "defaultFormatterBehavior"));
          return -[NSNumber compare:]( -[NSNumberFormatter numberFromString:]( v9,  "numberFromString:",  objc_msgSend(-[MAAsset attributes](a2, "attributes"), "objectForKey:", v8)),  "compare:",  -[NSNumberFormatter numberFromString:]( v9,  "numberFromString:",  objc_msgSend(-[MAAsset attributes](a3, "attributes"), "objectForKey:", v8)));
        }

        else
        {
          return 1LL;
        }
      }

      else
      {
        return -1LL;
      }
    }
  }

  return result;
}

id __55__MSUUpdateBrainLocator_newBestAssetFromResults_error___block_invoke_32( uint64_t a1,  void *a2,  uint64_t a3,  _BYTE *a4)
{
  id v7 = [a2 attributes];
  id result = objc_msgSend( objc_msgSend(v7, "objectForKey:", ASAttributeContentVersion),  "isEqualToNumber:",  *(void *)(a1 + 32));
  if ((_DWORD)result)
  {
    if (!*(void *)(a1 + 40)
      || (id v9 = [a2 attributes],
          id result = objc_msgSend( objc_msgSend(v9, "objectForKey:", ASAttributeMasteredVersion),  "isEqualToString:",  *(void *)(a1 + 40)),  (_DWORD)result))
    {
      id result = [*(id *)(a1 + 48) addObject:a2];
    }
  }

  *a4 = 0;
  return result;
}

id __55__MSUUpdateBrainLocator_newBestAssetFromResults_error___block_invoke_2( id *a1,  void *a2,  uint64_t a3,  _BYTE *a4)
{
  id v7 = [a2 attributes];
  if (![v7 objectForKey:MSUBrainAttributeSupportedDevicesKey])
  {
    uint64_t v10 = a1 + 4;
    goto LABEL_5;
  }

  id v8 = [a2 attributes];
  id result = objc_msgSend( objc_msgSend(v8, "objectForKey:", MSUBrainAttributeSupportedDevicesKey),  "containsObject:",  objc_msgSend(a1[5], "deviceType"));
  if ((_DWORD)result)
  {
    uint64_t v10 = a1 + 6;
LABEL_5:
    id result = [*v10 addObject:a2];
  }

  *a4 = 0;
  return result;
}

int64_t __55__MSUUpdateBrainLocator_newBestAssetFromResults_error___block_invoke_3( id a1,  MAAsset *a2,  MAAsset *a3)
{
  return -[NSNumber compare:]( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  dword_100041A88[(void)-[MAAsset state](a2, "state")]),  "compare:",  +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  dword_100041A88[(void)-[MAAsset state](a3, "state")]));
}

- (void)installUpdateBrain:(id)a3 handler:(id)a4
{
}

- (void)installMAUpdateBrain:(id)a3 handler:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = __54__MSUUpdateBrainLocator_installMAUpdateBrain_handler___block_invoke;
  v7[3] = &unk_100059468;
  v7[4] = self;
  v7[5] = @"installMAUpdateBrain";
  v7[6] = a3;
  v7[7] = a4;
  -[MSUUpdateBrainLocator downloadBrainAsset:handler:](self, "downloadBrainAsset:handler:", a3, v7);
}

void __54__MSUUpdateBrainLocator_installMAUpdateBrain_handler___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  CFTypeID v6 = +[MSUUpdateBrainLocator locatorsStateQueue](&OBJC_CLASS___MSUUpdateBrainLocator, "locatorsStateQueue");
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = __54__MSUUpdateBrainLocator_installMAUpdateBrain_handler___block_invoke_2;
  v8[3] = &unk_100059440;
  v8[4] = a3;
  v8[5] = a2;
  __int128 v7 = *(_OWORD *)(a1 + 48);
  __int128 v9 = *(_OWORD *)(a1 + 32);
  __int128 v10 = v7;
  dispatch_sync(v6, v8);
}

id __54__MSUUpdateBrainLocator_installMAUpdateBrain_handler___block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  if (*(void *)(a1 + 32)) {
    return objc_msgSend( *(id *)(a1 + 48),  "_clientRequestComplete:reportingState:withError:moreToCome:handler:",  *(void *)(a1 + 56),  0);
  }
  if (!*(void *)(a1 + 40))
  {
    CFErrorRef error_internal_cf = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  806LL,  0LL,  0LL,  @"Unable to download update brain asset",  a6,  a7,  a8,  v34);
    (id)CFMakeCollectable(error_internal_cf);
    return objc_msgSend( *(id *)(a1 + 48),  "_clientRequestComplete:reportingState:withError:moreToCome:handler:",  *(void *)(a1 + 56),  0);
  }

  id v10 = +[MSUUpdateBrainLocator newBrainAssetName:](&OBJC_CLASS___MSUUpdateBrainLocator, "newBrainAssetName:");
  [*(id *)(a1 + 40) logAsset];

  *(void *)(*(void *)(a1 + 48) + 8) = objc_msgSend( objc_msgSend( objc_msgSend(*(id *)(a1 + 40), "attributes"),  "objectForKeyedSubscript:",  @"Build"),  "copy");
  if ([*(id *)(a1 + 40) state] == (id)2)
  {
    *(void *)(*(void *)(a1 + 48) + 24LL) = 0LL;
    id v11 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138543618;
      uint64_t v45 = v12;
      __int16 v46 = 2114;
      id v47 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[BRAIN LOCATOR] {%{public}@} | No need to download %{public}@ - it is already installed",  buf,  0x16u);
    }

    return [*(id *)(a1 + 48) _clientRequestComplete:*(void *)(a1 + 56) reportingState:0 withError:0 moreToCome:0 handler:*(void *)(a1 + 72)];
  }

  else
  {
    *(void *)(*(void *)(a1 + 48) + 24LL) = *(id *)(a1 + 40);
    id v14 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(a1 + 56);
      id v16 = *(void **)(*(void *)(a1 + 48) + 8LL);
      *(_DWORD *)buf = 138543874;
      uint64_t v45 = v15;
      __int16 v46 = 2114;
      id v47 = v16;
      __int16 v48 = 2114;
      id v49 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[BRAIN_LOCATOR] {%{public}@} | We have found a brain (%{public}@) we need to download %{public}@, we will commit self-destruction",  buf,  0x20u);
    }

    v42 = @"CommitSelfDestruct";
    id v43 = &__kCFBooleanTrue;
    id v17 = +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v43,  &v42,  1LL);
    v41 = 0LL;
    id v18 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138543362;
      uint64_t v45 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "[BRAIN_LOCATOR] {%{public}@} | Attempting purge of old assets",  buf,  0xCu);
    }

    unsigned int v20 = [*(id *)(a1 + 48) _purgeInstalledUpdateBrains:&v41];
    uint64_t v21 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    uint64_t v22 = v21;
    if (v20)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v23 = *(void *)(a1 + 56);
        *(_DWORD *)buf = 138543362;
        uint64_t v45 = v23;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "[BRAIN_LOCATOR] {%{public}@} | SUCCESS | old assets purged",  buf,  0xCu);
      }
    }

    else if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      __54__MSUUpdateBrainLocator_installMAUpdateBrain_handler___block_invoke_2_cold_1();
    }

    uint64_t v24 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138543362;
      uint64_t v45 = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "[BRAIN_LOCATOR] {%{public}@} | Attempting to cancel other downloads",  buf,  0xCu);
    }

    if (([*(id *)(a1 + 48) cancelAllDownloadsExcept:*(void *)(a1 + 40) error:&v41] & 1) == 0)
    {
      id v26 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v27 = *(void *)(a1 + 56);
        *(_DWORD *)buf = 138543618;
        uint64_t v45 = v27;
        __int16 v46 = 2114;
        id v47 = v41;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "[BRAIN_LOCATOR] {%{public}@} | Cancel failed, error:%{public}@",  buf,  0x16u);
      }
    }

    CFErrorRef v28 = *(void **)(a1 + 40);
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472LL;
    void v40[2] = __54__MSUUpdateBrainLocator_installMAUpdateBrain_handler___block_invoke_48;
    v40[3] = &unk_1000593C8;
    v40[4] = *(void *)(a1 + 56);
    [v28 attachProgressCallBack:v40];
    v29 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v30 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138543618;
      uint64_t v45 = v30;
      __int16 v46 = 2114;
      id v47 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "[BRAIN_LOCATOR] {%{public}@} | %{public}@ | startDownload...",  buf,  0x16u);
    }

    uint64_t v31 = *(void **)(a1 + 40);
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = __54__MSUUpdateBrainLocator_installMAUpdateBrain_handler___block_invoke_54;
    v35[3] = &unk_100059418;
    __int128 v36 = *(_OWORD *)(a1 + 48);
    uint64_t v32 = *(void *)(a1 + 64);
    uint64_t v33 = *(void *)(a1 + 72);
    v38 = v17;
    uint64_t v39 = v33;
    id v37 = v10;
    return [v31 startDownload:v32 then:v35];
  }

void __54__MSUUpdateBrainLocator_installMAUpdateBrain_handler___block_invoke_48(uint64_t a1, void *a2)
{
  CFPropertyListRef v4 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = [a2 totalWritten];
    id v7 = [a2 totalExpected];
    unsigned int v8 = [a2 isStalled];
    __int128 v9 = @"NO";
    int v10 = 138544130;
    uint64_t v11 = v5;
    __int16 v12 = 2048;
    if (v8) {
      __int128 v9 = @"YES";
    }
    id v13 = v6;
    __int16 v14 = 2048;
    id v15 = v7;
    __int16 v16 = 2114;
    id v17 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[BRAIN_LOCATOR] {%{public}@} | Brain download progress: written:%lld, expected:%lld, stalled:%{public}@",  (uint8_t *)&v10,  0x2Au);
  }

void __54__MSUUpdateBrainLocator_installMAUpdateBrain_handler___block_invoke_54(uint64_t a1, uint64_t a2)
{
  CFPropertyListRef v4 = +[MSUUpdateBrainLocator locatorsStateQueue](&OBJC_CLASS___MSUUpdateBrainLocator, "locatorsStateQueue");
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = __54__MSUUpdateBrainLocator_installMAUpdateBrain_handler___block_invoke_2_55;
  v6[3] = &unk_1000593F0;
  uint64_t v9 = *(void *)(a1 + 64);
  uint64_t v10 = a2;
  __int128 v5 = *(_OWORD *)(a1 + 48);
  __int128 v7 = *(_OWORD *)(a1 + 32);
  __int128 v8 = v5;
  dispatch_sync(v4, v6);
}

void __54__MSUUpdateBrainLocator_installMAUpdateBrain_handler___block_invoke_2_55(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 24LL) = 0LL;
  uint64_t v2 = *(void *)(a1 + 72);
  if (v2) {
    BOOL v3 = v2 == 10;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    CFPropertyListRef v4 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      uint64_t v6 = *(void *)(a1 + 48);
      uint64_t v7 = MAStringForMADownloadResult(*(void *)(a1 + 72));
      *(_DWORD *)buf = 138543874;
      uint64_t v21 = v5;
      __int16 v22 = 2114;
      uint64_t v23 = v6;
      __int16 v24 = 2114;
      uint64_t v25 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[BRAIN_LOCATOR] {%{public}@} | %{public}@ | ...startDownload | SUCCESS | MADownLoadResult:%{public}@",  buf,  0x20u);
    }

    __int128 v8 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 56);
    uint64_t v11 = *(void *)(a1 + 64);
    CFTypeRef v12 = 0LL;
  }

  else
  {
    char v13 = MAStringForMADownloadResult(v2);
    CFErrorRef error_internal_cf = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  806LL,  0LL,  0LL,  @"Failed to download update brain asset, MADownLoadResult:%@",  v14,  v15,  v16,  v13);
    CFTypeRef v18 = (id)CFMakeCollectable(error_internal_cf);
    if (os_log_type_enabled( (os_log_t)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog"),  OS_LOG_TYPE_ERROR))
    {
      __54__MSUUpdateBrainLocator_installMAUpdateBrain_handler___block_invoke_2_55_cold_1(a1, (void *)(a1 + 72));
    }

    __int128 v8 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 64);
    uint64_t v10 = 0LL;
    CFTypeRef v12 = v18;
  }

  [v8 _clientRequestComplete:v9 reportingState:v10 withError:v12 moreToCome:0 handler:v11];
}

- (void)adjustMADownloadOptions:(id)a3 callback:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = __58__MSUUpdateBrainLocator_adjustMADownloadOptions_callback___block_invoke;
  v7[3] = &unk_100059490;
  v7[4] = self;
  v7[5] = @"adjustMADownloadOptions";
  v7[6] = a3;
  v7[7] = a4;
  dispatch_sync( (dispatch_queue_t)+[MSUUpdateBrainLocator locatorsStateQueue]( &OBJC_CLASS___MSUUpdateBrainLocator,  "locatorsStateQueue"),  v7);
}

id __58__MSUUpdateBrainLocator_adjustMADownloadOptions_callback___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) brainAsset])
  {
    if ((objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "brainAsset"), "refreshState") & 1) == 0)
    {
      uint64_t v5 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __58__MSUUpdateBrainLocator_adjustMADownloadOptions_callback___block_invoke_cold_2(a1, v5, v6);
      }
    }

    id v7 = +[MSUUpdateBrainLocator newBrainAssetName:]( MSUUpdateBrainLocator,  "newBrainAssetName:",  [*(id *)(a1 + 32) brainAsset]);
    if (objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "brainAsset"), "state") == (id)4)
    {
      uint64_t v11 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        uint64_t v32 = v12;
        __int16 v33 = 2114;
        id v34 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[BRAIN_LOCATOR] {%{public}@} | %{public}@ | configDownloadSync...",  buf,  0x16u);
      }

      id v13 = objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "brainAsset"), "configDownloadSync:", *(void *)(a1 + 48));
      if (v13)
      {
        id v14 = v13;
        char v15 = MAStringForMAOperationResult(v13);
        CFErrorRef error_internal_cf = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  808LL,  0LL,  0LL,  @"Failed to adjust download configuration, MAOperationResult:%@",  v16,  v17,  v18,  v15);
        CFTypeRef v20 = (id)CFMakeCollectable(error_internal_cf);
        uint64_t v21 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v22 = *(void *)(a1 + 40);
          uint64_t v23 = MAStringForMAOperationResult(v14);
          *(_DWORD *)buf = 138543874;
          uint64_t v32 = v22;
          __int16 v33 = 2114;
          id v34 = v7;
          __int16 v35 = 2114;
          uint64_t v36 = v23;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "[BRAIN_LOCATOR] {%{public}@} | %{public}@ | ...configDownloadSync | FAILURE | MAOperationResult:%{public}@",  buf,  0x20u);
        }
      }

      else
      {
        uint64_t v27 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v28 = *(void *)(a1 + 40);
          uint64_t v29 = MAStringForMAOperationResult(0LL);
          *(_DWORD *)buf = 138543874;
          uint64_t v32 = v28;
          __int16 v33 = 2114;
          id v34 = v7;
          __int16 v35 = 2114;
          uint64_t v36 = v29;
          _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "[BRAIN_LOCATOR] {%{public}@} | %{public}@ | ...configDownloadSync | SUCCESS | MAOperationResult:%{public}@",  buf,  0x20u);
        }

        CFTypeRef v20 = 0LL;
      }
    }

    else
    {
      CFErrorRef v26 = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  809LL,  0LL,  0LL,  @"Not adjusting configuration since asset is not in downloading state",  v8,  v9,  v10,  v30);
      CFTypeRef v20 = (id)CFMakeCollectable(v26);
      if (os_log_type_enabled( (os_log_t)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog"),  OS_LOG_TYPE_ERROR))
      {
        __58__MSUUpdateBrainLocator_adjustMADownloadOptions_callback___block_invoke_cold_1();
      }
    }

    return [*(id *)(a1 + 32) _clientRequestComplete:*(void *)(a1 + 40) withError:v20 handler:*(void *)(a1 + 56)];
  }

  else
  {
    CFErrorRef v24 = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  807LL,  0LL,  0LL,  @"Attempted to change download priority of a nil asset",  v2,  v3,  v4,  v30);
    return [*(id *)(a1 + 32) _clientRequestComplete:*(void *)(a1 + 40) withError:(id)CFMakeCollectable(v24) handler:*(void *)(a1 + 56)];
  }

- (void)adjustDownloadOptions:(id)a3 handler:(id)a4
{
  uint64_t v6 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = [a3 safeSummary];
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[BRAIN_LOCATOR] {adjustDownloadOptions} | Ignored options are: %{public}@",  (uint8_t *)&v7,  0xCu);
  }

  (*((void (**)(id, void))a4 + 2))(a4, 0LL);
}

- (BOOL)cancelInstall:(id *)a3
{
  char v30 = 0LL;
  -[MSUUpdateBrainLocator _clientRequestBegin:](self, "_clientRequestBegin:", @"cancelInstall");
  id v8 = -[MSUUpdateBrainLocator newBrainAsset:](self, "newBrainAsset:", &v30);
  if (!v8)
  {
    if (v30)
    {
      BOOL v20 = 0LL;
      id v9 = 0LL;
    }

    else
    {
      CFErrorRef error_internal_cf = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  807LL,  0LL,  0LL,  @"Could not locate any available update brain asset",  v5,  v6,  v7,  v29);
      BOOL v20 = 0LL;
      id v9 = 0LL;
      char v30 = (id)CFMakeCollectable(error_internal_cf);
    }

    goto LABEL_18;
  }

  id v9 = +[MSUUpdateBrainLocator newBrainAssetName:](&OBJC_CLASS___MSUUpdateBrainLocator, "newBrainAssetName:", v8);
  id v10 = [v8 state];
  uint64_t v11 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10 != (id)4)
  {
    if (v12)
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v32 = @"cancelInstall";
      __int16 v33 = 2114;
      id v34 = v9;
      uint64_t v21 = "[BRAIN_LOCATOR] {%{public}@} | Skipping cancel as %{public}@ is not downloading";
      uint64_t v22 = v11;
      uint32_t v23 = 22;
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
    }

- (void)createBestAsset:(id)a3
{
  CFTypeRef v17 = 0LL;
  id v5 = -[MSUUpdateBrainLocator newFilteredBrainQuery](self, "newFilteredBrainQuery");
  [v5 returnTypes:0];
  uint64_t v6 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[BRAIN_LOCATOR] {createBestAsset} | queryMetaDataSync...",  buf,  2u);
  }

  id v7 = [v5 queryMetaDataSync];
  if (v7)
  {
    char v8 = MAStringForMAQueryResult(v7);
    CFErrorRef error_internal_cf = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  811LL,  0LL,  0LL,  @"Failed to query for assets, MAQueryResult:%@",  v9,  v10,  v11,  v8);
    CFTypeRef v13 = (id)CFMakeCollectable(error_internal_cf);
    CFTypeRef v17 = v13;
    if (os_log_type_enabled( (os_log_t)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog"),  OS_LOG_TYPE_ERROR))
    {
      -[MSUUpdateBrainLocator createBestAsset:].cold.1();
    }

    (*((void (**)(id, void, CFTypeRef))a3 + 2))(a3, 0LL, v13);
  }

  else
  {
    id v14 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = MAStringForMAQueryResult(0LL);
      *(_DWORD *)buf = 138543362;
      uint64_t v19 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[BRAIN_LOCATOR] {createBestAsset} | ...queryMetaDataSync | SUCCESS | MAQueryResult:%{public}@",  buf,  0xCu);
    }

    id v16 = -[MSUUpdateBrainLocator newBestAssetFromResults:error:]( self,  "newBestAssetFromResults:error:",  [v5 results],  &v17);
    (*((void (**)(id, id, void))a3 + 2))(a3, v16, 0LL);
  }
}

- (void)appendCatalogDownloadOptionsToExistingOptions:(id)a3
{
  if (a3)
  {
    id v5 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v6 = (const __CFString *)MGCopyAnswer(@"DeviceClass", 0LL);
    if (v6)
    {
      id v7 = v6;
      CFTypeID v8 = CFGetTypeID(v6);
      if (v8 == CFStringGetTypeID())
      {
        CFComparisonResult v9 = CFStringCompare(v7, @"AudioAccessory", 0LL);
        CFRelease(v7);
        if (v9 == kCFCompareEqualTo)
        {
          uint64_t v10 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
          uint64_t v11 = 21LL;
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            int v18 = 21;
            BOOL v12 = "[BRAIN_LOCATOR] {appendCatalogDownloadOptionsToExistingOptions} | Using audio accessory _CompatibilityVersion=%d";
LABEL_12:
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v12, buf, 8u);
            goto LABEL_13;
          }

          goto LABEL_13;
        }
      }

      else
      {
        CFRelease(v7);
      }
    }

    uint64_t v10 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    uint64_t v11 = 20LL;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v18 = 20;
      BOOL v12 = "[BRAIN_LOCATOR] {appendCatalogDownloadOptionsToExistingOptions} | Using standard _CompatibilityVersion=%d";
      goto LABEL_12;
    }

- (void)downloadBrainAsset:(id)a3 handler:(id)a4
{
  if (a3)
  {
    id v7 = a3;
    id v8 = a3;
  }

  else
  {
    id v8 = (id)objc_opt_new(&OBJC_CLASS___MADownloadOptions);
    [v8 setDiscretionary:0];
  }

  -[MSUUpdateBrainLocator appendCatalogDownloadOptionsToExistingOptions:]( self,  "appendCatalogDownloadOptionsToExistingOptions:",  v8);
  CFComparisonResult v9 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = @"client provided";
    if (!a3) {
      uint64_t v10 = @"default";
    }
    *(_DWORD *)buf = 138543618;
    id v14 = v10;
    __int16 v15 = 2114;
    id v16 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[BRAIN_LOCATOR] {downloadBrainAsset} | Using %{public}@ downloadOptions for brainAssetDownload, options:%{public}@",  buf,  0x16u);
  }

  uint64_t v11 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[BRAIN_LOCATOR] {downloadBrainAsset} | startCatalogDownload...",  buf,  2u);
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = __52__MSUUpdateBrainLocator_downloadBrainAsset_handler___block_invoke;
  v12[3] = &unk_1000594B8;
  v12[5] = v8;
  void v12[6] = a4;
  v12[4] = self;
  +[MAAsset startCatalogDownload:options:completionWithError:]( &OBJC_CLASS___MAAsset,  "startCatalogDownload:options:completionWithError:",  MSUBrainAssetType[0],  v8,  v12);
}

void __52__MSUUpdateBrainLocator_downloadBrainAsset_handler___block_invoke( uint64_t a1,  uint64_t a2,  const void *a3)
{
  if (a2 != 10 && a2)
  {
    char v7 = MAStringForMADownloadResult(a2);
    CFErrorRef error_internal_cf = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  812LL,  a3,  0LL,  @"Failed to download catalog, MADownloadResult:%@",  v8,  v9,  v10,  v7);
    (id)CFMakeCollectable(error_internal_cf);
    if (os_log_type_enabled( (os_log_t)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog"),  OS_LOG_TYPE_ERROR))
    {
      __52__MSUUpdateBrainLocator_downloadBrainAsset_handler___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }

  else
  {
    id v5 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v13 = MAStringForMADownloadResult(a2);
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[BRAIN_LOCATOR] {downloadBrainAsset} | ...startCatalogDownload | SUCCESS | MADownLoadResult:%{public}@",  buf,  0xCu);
    }

    [*(id *)(a1 + 32) createBestAsset:*(void *)(a1 + 48)];
  }
}

- (id)newBrainAsset:(id *)a3
{
  id v5 = -[MSUUpdateBrainLocator newFilteredBrainQuery](self, "newFilteredBrainQuery");
  unint64_t v38 = 0LL;
  uint64_t v32 = 0LL;
  __int16 v33 = &v32;
  uint64_t v34 = 0x3052000000LL;
  __int16 v35 = __Block_byref_object_copy__3;
  uint64_t v36 = __Block_byref_object_dispose__3;
  dispatch_semaphore_t v37 = 0LL;
  dispatch_semaphore_t v37 = dispatch_semaphore_create(0LL);
  uint64_t v26 = 0LL;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3052000000LL;
  char v29 = __Block_byref_object_copy__3;
  char v30 = __Block_byref_object_dispose__3;
  uint64_t v31 = 0LL;
  uint64_t v6 = (void *)objc_opt_new(&OBJC_CLASS___MADownloadOptions);
  -[MSUUpdateBrainLocator appendCatalogDownloadOptionsToExistingOptions:]( self,  "appendCatalogDownloadOptionsToExistingOptions:",  v6);
  [v6 setDiscretionary:0];
  char v7 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[BRAIN_LOCATOR] {newBrainAsset} | startCatalogDownload...",  buf,  2u);
  }

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = __39__MSUUpdateBrainLocator_newBrainAsset___block_invoke;
  v24[3] = &unk_1000594E0;
  v24[4] = v5;
  v24[5] = v6;
  v24[6] = &v26;
  v24[7] = &v32;
  +[MAAsset startCatalogDownload:options:then:]( &OBJC_CLASS___MAAsset,  "startCatalogDownload:options:then:",  MSUBrainAssetType[0],  v6,  v24);
  uint64_t v8 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[BRAIN_LOCATOR] {newBrainAsset} | BEGIN WAIT | startCatalogDownload",  buf,  2u);
  }

  uint64_t v9 = (dispatch_semaphore_s *)v33[5];
  dispatch_time_t v10 = dispatch_time(0LL, 1200000000000LL);
  dispatch_semaphore_wait(v9, v10);
  uint64_t v11 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[BRAIN_LOCATOR] {newBrainAsset} | END WAIT | startCatalogDownload",  buf,  2u);
  }

  dispatch_release((dispatch_object_t)v33[5]);

  uint64_t v15 = v27[5];
  if (!v15)
  {
    CFErrorRef error_internal_cf = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  803LL,  0LL,  0LL,  @"Could not get assets of type %@",  v12,  v13,  v14,  (char)MSUBrainAssetType[0]);
    BOOL v20 = (id)CFMakeCollectable(error_internal_cf);
    goto LABEL_11;
  }

  unint64_t v16 = -[MSUUpdateBrainLocator newBestAssetFromResults:error:](self, "newBestAssetFromResults:error:", v15, &v38);

  BOOL v20 = (void *)v38;
  if (!(v16 | v38))
  {
    CFErrorRef v21 = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  805LL,  0LL,  0LL,  @"Could not determine best update brain asset of type %@",  v17,  v18,  v19,  (char)MSUBrainAssetType[0]);
    BOOL v20 = (id)CFMakeCollectable(v21);
LABEL_11:
    unint64_t v16 = 0LL;
    unint64_t v38 = (unint64_t)v20;
  }

  if (a3 && v20) {
    *a3 = v20;
  }
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);
  return (id)v16;
}

uint64_t __39__MSUUpdateBrainLocator_newBrainAsset___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 != 10 && a2)
  {
    uint64_t v9 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __39__MSUUpdateBrainLocator_newBrainAsset___block_invoke_cold_1(a2, v9);
    }
  }

  else
  {
    uint64_t v4 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543362;
      uint64_t v12 = MAStringForMADownloadResult(a2);
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[BRAIN_LOCATOR] {newBrainAsset} | ...startCatalogDownload | SUCCESS | MADownLoadResult:%{public}@",  (uint8_t *)&v11,  0xCu);
    }

    id v5 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[BRAIN_LOCATOR] {newBrainAsset} | queryMetaDataSync...",  (uint8_t *)&v11,  2u);
    }

    id v6 = [*(id *)(a1 + 32) queryMetaDataSync];
    char v7 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    uint64_t v8 = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __39__MSUUpdateBrainLocator_newBrainAsset___block_invoke_cold_2((uint64_t)v6, v8);
      }
    }

    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v11) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[BRAIN_LOCATOR] {newBrainAsset} | ...queryMetaDataSync | SUCCESS",  (uint8_t *)&v11,  2u);
      }

      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) results];
    }
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL));
}

- (id)newBrainQuery
{
  id v2 = objc_alloc(&OBJC_CLASS___MAAssetQuery);
  return [v2 initWithType:MSUBrainAssetType[0]];
}

- (BOOL)purgeInstalledUpdateBrains:(id *)a3
{
  char v7 = 0LL;
  -[MSUUpdateBrainLocator _clientRequestBegin:](self, "_clientRequestBegin:", @"purgeInstalledUpdateBrains");
  BOOL v5 = -[MSUUpdateBrainLocator _purgeInstalledUpdateBrains:](self, "_purgeInstalledUpdateBrains:", &v7);
  -[MSUUpdateBrainLocator _clientRequestComplete:withError:wasSuccessful:]( self,  "_clientRequestComplete:withError:wasSuccessful:",  @"purgeInstalledUpdateBrains",  v7,  v5);
  if (a3 && v7) {
    *a3 = v7;
  }
  return v5;
}

- (BOOL)_purgeInstalledUpdateBrains:(id *)a3
{
  id v4 = -[MSUUpdateBrainLocator newBrainQuery](self, "newBrainQuery");
  [v4 returnTypes:1];
  [v4 setDoNotBlockOnNetworkStatus:1];
  BOOL v5 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v44 = @"purgeInstalledUpdateBrains";
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[BRAIN_LOCATOR] {%{public}@} | queryMetaDataSync...",  buf,  0xCu);
  }

  if ([v4 queryMetaDataSync])
  {
    CFErrorRef error_internal_cf = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  811LL,  0LL,  0LL,  @"Failed to query for installed update brains",  v6,  v7,  v8,  v34);
    dispatch_time_t v10 = (id)CFMakeCollectable(error_internal_cf);
    if (os_log_type_enabled( (os_log_t)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog"),  OS_LOG_TYPE_ERROR))
    {
      -[MSUUpdateBrainLocator _purgeInstalledUpdateBrains:].cold.1();
    }

    BOOL v11 = 1;
  }

  else
  {
    uint64_t v36 = a3;
    id v12 = [v4 results];
    uint64_t v13 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = MAStringForMAQueryResult(0LL);
      *(_DWORD *)buf = 138543618;
      v44 = @"purgeInstalledUpdateBrains";
      __int16 v45 = 2114;
      uint64_t v46 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "[BRAIN_LOCATOR] {%{public}@} | ...queryMetaDataSync | SUCCESS | MAQueryResult:%{public}@",  buf,  0x16u);
    }

    id v35 = v4;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    id v15 = [v12 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v15)
    {
      id v16 = v15;
      CFTypeRef v37 = 0LL;
      uint64_t v17 = *(void *)v39;
      char v18 = 1;
      do
      {
        for (i = 0LL; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v39 != v17) {
            objc_enumerationMutation(v12);
          }
          BOOL v20 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)i);
          CFErrorRef v21 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v44 = @"purgeInstalledUpdateBrains";
            _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "[BRAIN_LOCATOR] {%{public}@} | purgeSync...",  buf,  0xCu);
          }

          id v22 = [v20 purgeSync];
          if (v22)
          {
            id v23 = v22;
            if ((v18 & 1) != 0)
            {
              char v24 = MAStringForMAPurgeResult(v22);
              CFErrorRef v28 = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  813LL,  0LL,  0LL,  @"Failed to purge update brain asset: %@",  v25,  v26,  v27,  v24);
              CFTypeRef v37 = (id)CFMakeCollectable(v28);
              char v18 = 0;
            }

            char v29 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              uint64_t v30 = MAStringForMAPurgeResult(v23);
              *(_DWORD *)buf = 138543618;
              v44 = @"purgeInstalledUpdateBrains";
              __int16 v45 = 2114;
              uint64_t v46 = v30;
              _os_log_error_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_ERROR,  "[BRAIN_LOCATOR] {%{public}@} | ...purgeSync | FAILURE | MAPurgeResult:%{public}@",  buf,  0x16u);
            }
          }

          else
          {
            uint64_t v31 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v32 = MAStringForMAPurgeResult(0LL);
              *(_DWORD *)buf = 138543618;
              v44 = @"purgeInstalledUpdateBrains";
              __int16 v45 = 2114;
              uint64_t v46 = v32;
              _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "[BRAIN_LOCATOR] {%{public}@} | ...purgeSync | SUCCESS | MAPurgeResult:%{public}@",  buf,  0x16u);
            }
          }
        }

        id v16 = [v12 countByEnumeratingWithState:&v38 objects:v42 count:16];
      }

      while (v16);
    }

    else
    {
      CFTypeRef v37 = 0LL;
      char v18 = 1;
    }

    BOOL v11 = v18 & 1;
    id v4 = v35;
    a3 = v36;
    dispatch_time_t v10 = (void *)v37;
  }

  if (a3 && v10) {
    *a3 = v10;
  }
  return v11;
}

- (void)requiredDiskSpace:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = __43__MSUUpdateBrainLocator_requiredDiskSpace___block_invoke;
  v5[3] = &unk_100059508;
  v5[4] = self;
  v5[5] = @"requiredDiskSpace";
  v5[6] = a3;
  -[MSUUpdateBrainLocator downloadBrainAsset:handler:](self, "downloadBrainAsset:handler:", 0LL, v5);
}

id __43__MSUUpdateBrainLocator_requiredDiskSpace___block_invoke( void *a1,  void *a2,  const void *a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  CFTypeRef v8 = a3;
  if (!a2 || a3)
  {
    if (!a3)
    {
      CFErrorRef error_internal_cf = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  806LL,  0LL,  0LL,  @"Failed to download update brain asset",  0LL,  a7,  a8,  v27);
      CFTypeRef v8 = (id)CFMakeCollectable(error_internal_cf);
    }

    BOOL v11 = (void *)a1[4];
    uint64_t v12 = a1[5];
    uint64_t v13 = a1[6];
    uint64_t v14 = 0LL;
    return [v11 _clientRequestComplete:v12 nameForNumber:v14 valueForNumber:0 withError:v8 handler:v13];
  }

  if ([a2 state] == (id)2)
  {
    BOOL v11 = (void *)a1[4];
    uint64_t v12 = a1[5];
    uint64_t v13 = a1[6];
    uint64_t v14 = @"requiredSpace";
    CFTypeRef v8 = 0LL;
    return [v11 _clientRequestComplete:v12 nameForNumber:v14 valueForNumber:0 withError:v8 handler:v13];
  }

  uint64_t v28 = 0LL;
  if ([a2 spaceCheck:&v28])
  {
    BOOL v20 = (void *)a1[4];
    uint64_t v21 = a1[5];
    uint64_t v22 = v28;
    uint64_t v23 = a1[6];
    char v24 = @"requiredSpace";
    CFTypeRef v25 = 0LL;
  }

  else
  {
    CFErrorRef v26 = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  814LL,  0LL,  0LL,  @"Could not determine disk space requirements for update brain asset",  v17,  v18,  v19,  v27);
    CFTypeRef v25 = (id)CFMakeCollectable(v26);
    BOOL v20 = (void *)a1[4];
    uint64_t v21 = a1[5];
    uint64_t v23 = a1[6];
    char v24 = 0LL;
    uint64_t v22 = 0LL;
  }

  return [v20 _clientRequestComplete:v21 nameForNumber:v24 valueForNumber:v22 withError:v25 handler:v23];
}

- (BOOL)cancelAllDownloadsExcept:(id)a3 error:(id *)a4
{
  id v6 = +[MSUUpdateBrainLocator newBrainAssetName:](&OBJC_CLASS___MSUUpdateBrainLocator, "newBrainAssetName:");
  uint64_t v7 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v48 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[BRAIN_LOCATOR] {cancelAllDownloadsExcept} | %{public}@",  buf,  0xCu);
  }

  id v8 = -[MSUUpdateBrainLocator newBrainQuery](self, "newBrainQuery");
  [v8 returnTypes:0];
  __int128 v39 = v8;
  if ([v8 queryMetaDataSync])
  {
    CFErrorRef error_internal_cf = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  811LL,  0LL,  0LL,  @"Failed to query for update brains",  v9,  v10,  v11,  v38);
    v42 = (id)CFMakeCollectable(error_internal_cf);
    BOOL v41 = 0;
    goto LABEL_28;
  }

  id v13 = [v8 results];
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  id v14 = [v13 countByEnumeratingWithState:&v43 objects:v53 count:16];
  if (!v14)
  {
    v42 = 0LL;
    BOOL v41 = 1;
    goto LABEL_28;
  }

  id v15 = v14;
  v42 = 0LL;
  uint64_t v16 = *(void *)v44;
  BOOL v41 = 1;
  do
  {
    uint64_t v17 = 0LL;
    do
    {
      if (*(void *)v44 != v16) {
        objc_enumerationMutation(v13);
      }
      uint64_t v18 = *(void **)(*((void *)&v43 + 1) + 8LL * (void)v17);
      id v19 = +[MSUUpdateBrainLocator newBrainAssetName:](&OBJC_CLASS___MSUUpdateBrainLocator, "newBrainAssetName:", v18);
      if ((objc_msgSend(objc_msgSend(v18, "assetId"), "isEqualToString:", objc_msgSend(a3, "assetId")) & 1) != 0
        || [v18 state] != (id)4)
      {
        char v29 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
        if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_21;
        }
        *(_DWORD *)buf = 138543362;
        id v48 = v19;
        uint64_t v30 = v29;
        uint64_t v31 = "[BRAIN_LOCATOR] {cancelAllDownloadsExcept} | %{public}@ | not canceling";
        uint32_t v32 = 12;
        goto LABEL_20;
      }

      BOOL v20 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v48 = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "[BRAIN_LOCATOR] {cancelAllDownloadsExcept} | %{public}@ | cancelDownloadSync...",  buf,  0xCu);
      }

      id v21 = [v18 cancelDownloadSync];
      if (v21)
      {
        id v22 = v21;
        char v23 = MAStringForMACancelDownloadResult(v21);
        CFErrorRef v27 = _create_error_internal_cf( @"MobileSoftwareUpdateErrorDomain",  815LL,  0LL,  0LL,  @"Failed to cancel asset download, MACancelDownloadResult:%@",  v24,  v25,  v26,  v23);
        v42 = (id)CFMakeCollectable(v27);
        uint64_t v28 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          uint64_t v35 = MAStringForMACancelDownloadResult(v22);
          *(_DWORD *)buf = 138543874;
          id v48 = v19;
          __int16 v49 = 2114;
          uint64_t v50 = v35;
          __int16 v51 = 2114;
          v52 = v42;
          _os_log_error_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "[BRAIN_LOCATOR] {cancelAllDownloadsExcept} | %{public}@ | ...cancelDownloadSync | FAILURE | MACancelDownload Result:%{public}@, error:%{public}@",  buf,  0x20u);
        }

        BOOL v41 = 0;
      }

      else
      {
        __int16 v33 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v34 = MAStringForMACancelDownloadResult(0LL);
          *(_DWORD *)buf = 138543618;
          id v48 = v19;
          __int16 v49 = 2114;
          uint64_t v50 = v34;
          uint64_t v30 = v33;
          uint64_t v31 = "[BRAIN_LOCATOR] {cancelAllDownloadsExcept} | %{public}@ | ...cancelDownloadSync | SUCCESS | MACancelDown"
                "loadResult:%{public}@";
          uint32_t v32 = 22;
LABEL_20:
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, v31, buf, v32);
        }
      }

- (void)_clientRequestBegin:(id)a3
{
  id v4 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[BRAIN_LOCATOR] | %{public}@ | BEGIN client request",  (uint8_t *)&v5,  0xCu);
  }

- (void)_clientRequestComplete:(id)a3 withError:(id)a4
{
  id v6 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  uint64_t v7 = v6;
  if (a4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[MSUUpdateBrainLocator _clientRequestComplete:withError:].cold.1();
    }
  }

  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[BRAIN_LOCATOR] | %{public}@ | END client request | SUCCESS",  (uint8_t *)&v8,  0xCu);
  }

- (void)_clientRequestComplete:(id)a3 withError:(id)a4 wasSuccessful:(BOOL)a5
{
  BOOL v5 = a5;
  int v8 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  id v9 = v8;
  if (a4)
  {
    BOOL v10 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (v5)
    {
      if (v10) {
        -[MSUUpdateBrainLocator _clientRequestComplete:withError:wasSuccessful:].cold.1();
      }
    }

    else if (v10)
    {
      -[MSUUpdateBrainLocator _clientRequestComplete:withError:].cold.1();
    }
  }

  else
  {
    BOOL v11 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (!v11) {
        return;
      }
      int v13 = 138543362;
      id v14 = a3;
      uint64_t v12 = "[BRAIN_LOCATOR] | %{public}@ | END client request | SUCCESS";
    }

    else
    {
      if (!v11) {
        return;
      }
      int v13 = 138543362;
      id v14 = a3;
      uint64_t v12 = "[BRAIN_LOCATOR] | %{public}@ | END client request | FAILURE | no error provided";
    }

    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v13, 0xCu);
  }

- (void)_clientRequestComplete:(id)a3 withError:(id)a4 handler:(id)a5
{
  int v8 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  id v9 = v8;
  if (a5)
  {
    if (a4)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[MSUUpdateBrainLocator _clientRequestComplete:withError:handler:].cold.2();
      }
    }

    else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      id v11 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[BRAIN_LOCATOR] | %{public}@ | END client request (calling completion handler) | SUCCESS",  (uint8_t *)&v10,  0xCu);
    }

    (*((void (**)(id, id))a5 + 2))(a5, a4);
  }

  else if (a4)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[MSUUpdateBrainLocator _clientRequestComplete:withError:handler:].cold.1();
    }
  }

  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543362;
    id v11 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[BRAIN_LOCATOR] | %{public}@ | END client request (no completion handler) | SUCCESS",  (uint8_t *)&v10,  0xCu);
  }

- (void)_clientRequestComplete:(id)a3 reportingState:(id)a4 withError:(id)a5 moreToCome:(BOOL)a6 handler:(id)a7
{
  BOOL v8 = a6;
  uint64_t v12 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
  int v13 = v12;
  if (a7)
  {
    if (a5)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[MSUUpdateBrainLocator _clientRequestComplete:withError:handler:].cold.2();
      }
    }

    else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = +[MSUUpdateBrainLocator stateSummary:](&OBJC_CLASS___MSUUpdateBrainLocator, "stateSummary:", a4);
      id v15 = @"NO";
      int v18 = 138543874;
      id v19 = a3;
      __int16 v20 = 2114;
      if (v8) {
        id v15 = @"YES";
      }
      id v21 = v14;
      __int16 v22 = 2114;
      char v23 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "[BRAIN_LOCATOR] | %{public}@ | END client request (calling completion handler) | SUCCESS | state:%{public}@, mor eToCome:%{public}@",  (uint8_t *)&v18,  0x20u);
    }

    (*((void (**)(id, id, id, BOOL))a7 + 2))(a7, a4, a5, v8);
  }

  else if (a5)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[MSUUpdateBrainLocator _clientRequestComplete:withError:handler:].cold.1();
    }
  }

  else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = +[MSUUpdateBrainLocator stateSummary:](&OBJC_CLASS___MSUUpdateBrainLocator, "stateSummary:", a4);
    uint64_t v17 = @"NO";
    int v18 = 138543874;
    id v19 = a3;
    __int16 v20 = 2114;
    if (v8) {
      uint64_t v17 = @"YES";
    }
    id v21 = v16;
    __int16 v22 = 2114;
    char v23 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "[BRAIN_LOCATOR] | %{public}@ | END client request (no completion handler) | SUCCESS | state:%{public}@, moreToCome:%{public}@",  (uint8_t *)&v18,  0x20u);
  }

- (void)_clientRequestComplete:(id)a3 nameForNumber:(id)a4 valueForNumber:(int64_t)a5 withError:(id)a6 handler:(id)a7
{
  if (a6)
  {
    BOOL v10 = os_log_type_enabled( (os_log_t)objc_msgSend( +[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger", a3, a4, a5),  "oslog"),  OS_LOG_TYPE_ERROR);
    if (a7)
    {
      if (v10) {
        -[MSUUpdateBrainLocator _clientRequestComplete:withError:handler:].cold.2();
      }
      id v11 = 0LL;
LABEL_9:
      (*((void (**)(id, NSNumber *, id))a7 + 2))(a7, v11, a6);
      return;
    }

    if (v10) {
      -[MSUUpdateBrainLocator _clientRequestComplete:withError:handler:].cold.1();
    }
  }

  else
  {
    id v11 = +[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a5);
    id v14 = (os_log_s *)objc_msgSend(+[SUCoreLog sharedLogger](SUCoreLog, "sharedLogger"), "oslog");
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (a7)
    {
      if (v15)
      {
        int v16 = 138543874;
        id v17 = a3;
        __int16 v18 = 2114;
        id v19 = a4;
        __int16 v20 = 2048;
        int64_t v21 = a5;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[BRAIN_LOCATOR] | %{public}@ | END client request (calling completion handler) | SUCCESS | %{public}@=%llu",  (uint8_t *)&v16,  0x20u);
      }

      goto LABEL_9;
    }

    if (v15)
    {
      int v16 = 138543874;
      id v17 = a3;
      __int16 v18 = 2114;
      id v19 = a4;
      __int16 v20 = 2048;
      int64_t v21 = a5;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[BRAIN_LOCATOR] | %{public}@ | END client request (no completion handler) | SUCCESS | %{public}@=%lld",  (uint8_t *)&v16,  0x20u);
    }
  }

+ (id)stateSummary:(id)a3
{
  if (!a3) {
    return @"NONE";
  }
  id v4 = @"CommitSelfDestruct";
  return (id)v4;
}

+ (id)newBrainAssetName:(id)a3
{
  return -[NSString initWithFormat:]( [NSString alloc],  "initWithFormat:",  @"brainAsset[%@](%@)",  [a3 assetId],  MAStringForMAAssetState(objc_msgSend(a3, "state")));
}

- (NSString)brainVersion
{
  return self->_brainVersion;
}

- (NSDictionary)updateAssetAttributes
{
  return self->_updateAssetAttributes;
}

- (void)setUpdateAssetAttributes:(id)a3
{
}

- (MAAsset)brainAsset
{
  return self->_brainAsset;
}

- (void)copyUpdateBrainPath:.cold.1()
{
}

- (void)newBestAssetFromResults:error:.cold.1()
{
  OUTLINED_FUNCTION_0( (void *)&_mh_execute_header,  v0,  v1,  "[BRAIN_LOCATOR] {newBestAssetFromResults} | FAILURE | Exception %{public}@ occurred while sorting brain asset results=%{public}@");
  OUTLINED_FUNCTION_4();
}

void __54__MSUUpdateBrainLocator_installMAUpdateBrain_handler___block_invoke_2_cold_1()
{
}

void __54__MSUUpdateBrainLocator_installMAUpdateBrain_handler___block_invoke_2_55_cold_1( uint64_t a1,  void *a2)
{
}

void __58__MSUUpdateBrainLocator_adjustMADownloadOptions_callback___block_invoke_cold_1()
{
}

void __58__MSUUpdateBrainLocator_adjustMADownloadOptions_callback___block_invoke_cold_2( uint64_t a1,  os_log_s *a2,  uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = 138543362;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_7( (void *)&_mh_execute_header,  a2,  a3,  "[BRAIN_LOCATOR] {%{public}@} | Could not determine state of asset while trying to adjust priority, attempting anyway",  (uint8_t *)&v4);
  OUTLINED_FUNCTION_4();
}

- (void)createBestAsset:.cold.1()
{
}

- (void)appendCatalogDownloadOptionsToExistingOptions:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "[BRAIN_LOCATOR] {appendCatalogDownloadOptionsToExistingOptions} | Invalid options argument passed",  v1,  2u);
}

void __52__MSUUpdateBrainLocator_downloadBrainAsset_handler___block_invoke_cold_1()
{
}

void __39__MSUUpdateBrainLocator_newBrainAsset___block_invoke_cold_1(uint64_t a1, os_log_s *a2)
{
  int v4 = 138543362;
  uint64_t v5 = MAStringForMADownloadResult(a1);
  OUTLINED_FUNCTION_7( (void *)&_mh_execute_header,  a2,  v3,  "[BRAIN_LOCATOR] {newBrainAsset} | ...startCatalogDownload | FAILURE | MADownLoadResult:%{public}@",  (uint8_t *)&v4);
  OUTLINED_FUNCTION_5();
}

void __39__MSUUpdateBrainLocator_newBrainAsset___block_invoke_cold_2(uint64_t a1, os_log_s *a2)
{
  int v4 = 138543362;
  uint64_t v5 = MAStringForMAQueryResult(a1);
  OUTLINED_FUNCTION_7( (void *)&_mh_execute_header,  a2,  v3,  "[BRAIN_LOCATOR] {newBrainAsset} | ...queryMetaDataSync | FAILURE | MAQueryResult:%{public}@",  (uint8_t *)&v4);
  OUTLINED_FUNCTION_5();
}

- (void)_purgeInstalledUpdateBrains:.cold.1()
{
}

- (void)_clientRequestComplete:withError:.cold.1()
{
}

- (void)_clientRequestComplete:withError:wasSuccessful:.cold.1()
{
}

- (void)_clientRequestComplete:withError:handler:.cold.1()
{
}

- (void)_clientRequestComplete:withError:handler:.cold.2()
{
}

@end