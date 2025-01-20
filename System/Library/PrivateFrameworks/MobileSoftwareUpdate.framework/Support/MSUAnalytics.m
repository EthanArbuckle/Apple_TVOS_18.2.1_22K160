@interface MSUAnalytics
- (BOOL)addCacheDeleteInfoToDictionary:(id)a3;
- (BOOL)addMobileAssetStatsToDictionary:(id)a3;
- (BOOL)addSoftwareUpdateInfoToDictionary:(id)a3;
- (MSUAnalytics)initWithPhase:(int)a3;
- (OS_dispatch_queue)SSOQueue;
- (OS_dispatch_queue)mainQueue;
- (id)copyAnalyticsData;
- (id)copyAnalyticsDataForPreflight;
- (id)copyAppleConnectPersonID;
- (id)copyGenericAnalyticsData;
- (id)copySerialNumber;
- (id)getStringForPhase;
- (int)updatePhase;
- (void)addTargetVolumeDriveInfoToDictionary:(id)a3;
- (void)setMainQueue:(id)a3;
- (void)setSSOQueue:(id)a3;
- (void)setUpdatePhase:(int)a3;
@end

@implementation MSUAnalytics

- (MSUAnalytics)initWithPhase:(int)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MSUAnalytics;
  v4 = -[MSUAnalytics init](&v10, "init");
  if (v4)
  {
    dispatch_queue_t v5 = dispatch_queue_create("MSUAnalyticsMainQueue", 0LL);
    -[MSUAnalytics setMainQueue:](v4, "setMainQueue:", v5);

    dispatch_queue_attr_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v6);
    dispatch_queue_t v8 = dispatch_queue_create("MSUAnalyticsSSOQueue", v7);
    -[MSUAnalytics setSSOQueue:](v4, "setSSOQueue:", v8);

    v4->_updatePhase = a3;
  }

  return v4;
}

- (id)getStringForPhase
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MSUAnalytics mainQueue](self, "mainQueue"));
  dispatch_assert_queue_V2(v3);

  unsigned int v4 = -[MSUAnalytics updatePhase](self, "updatePhase");
  if (v4 > 5) {
    return @"Invalid";
  }
  else {
    return *(&off_100059210 + (int)v4);
  }
}

- (BOOL)addSoftwareUpdateInfoToDictionary:(id)a3
{
  unsigned int v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MSUAnalytics mainQueue](self, "mainQueue"));
  dispatch_assert_queue_V2(v4);

  if (a3)
  {
    objc_super v10 = @"SUManager/SoftwareUpdateServices not supported on this platform.Unable to add data to dictionary\n";
  }

  else
  {
    v12 = "-[MSUAnalytics addSoftwareUpdateInfoToDictionary:]";
    objc_super v10 = @"Invalid dict passed to %s\n";
  }

  logfunction("", 1, v10, v5, v6, v7, v8, v9, (char)v12);
  return 0;
}

- (BOOL)addCacheDeleteInfoToDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MSUAnalytics mainQueue](self, "mainQueue"));
  dispatch_assert_queue_V2(v5);

  if (v4)
  {
    logfunction(", 1, @"Attempting to determine purgable space on system\n"", v6, v7, v8, v9, v10, v19);
    CFErrorRef v21 = 0LL;
    uint64_t v11 = purgeable_data_space(4, &v21);
    if (v21)
    {
      logfunction(", 1, @"Failed to get available purgable space.\n"", v12, v13, v14, v15, v16, v20);
      [v4 setObject:@"UNKNOWN" forKeyedSubscript:@"purgeableSpaceMB"];
    }

    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v11 / 0x100000));
      [v4 setObject:v17 forKeyedSubscript:@"purgeableSpaceMB"];
    }
  }

  else
  {
    logfunction( ",  1,  @"Invalid dictionary passed to %s\n",  v6,  v7,  v8,  v9,  v10,  (char)"-[MSUAnalytics addCacheDeleteInfoToDictionary:]"");
  }

  return v4 != 0LL;
}

- (BOOL)addMobileAssetStatsToDictionary:(id)a3
{
  id v24 = a3;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v44[0] = NSURLFileResourceTypeKey;
  v44[1] = NSURLFileAllocatedSizeKey;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v44, 2LL));
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  id v28 = [&off_100063CE8 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v28)
  {
    unint64_t v31 = 0LL;
    uint64_t v25 = *(void *)v39;
    do
    {
      uint64_t v3 = 0LL;
      do
      {
        if (*(void *)v39 != v25) {
          objc_enumerationMutation(&off_100063CE8);
        }
        uint64_t v30 = v3;
        v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL URLWithString:]( &OBJC_CLASS___NSURL,  "URLWithString:",  *(void *)(*((void *)&v38 + 1) + 8 * v3)));
        id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:"));
        __int128 v34 = 0u;
        __int128 v35 = 0u;
        __int128 v36 = 0u;
        __int128 v37 = 0u;
        id v5 = [v4 countByEnumeratingWithState:&v34 objects:v42 count:16];
        if (v5)
        {
          id v6 = v5;
          uint64_t v7 = *(void *)v35;
          do
          {
            for (i = 0LL; i != v6; i = (char *)i + 1)
            {
              if (*(void *)v35 != v7) {
                objc_enumerationMutation(v4);
              }
              uint64_t v9 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)i);
              id v33 = 0LL;
              unsigned int v10 = [v9 getResourceValue:&v33 forKey:NSURLFileResourceTypeKey error:0];
              id v11 = v33;
              uint64_t v12 = v11;
              if (v10 && [v11 isEqualToString:NSURLFileResourceTypeRegular])
              {
                id v32 = 0LL;
                unsigned int v13 = [v9 getResourceValue:&v32 forKey:NSURLFileAllocatedSizeKey error:0];
                id v14 = v32;
                uint64_t v15 = v14;
                if (v13) {
                  v31 += (unint64_t)[v14 unsignedIntegerValue];
                }
              }

              else
              {
                uint64_t v15 = 0LL;
              }
            }

            id v6 = [v4 countByEnumeratingWithState:&v34 objects:v42 count:16];
          }

          while (v6);
        }

        uint64_t v3 = v30 + 1;
      }

      while ((id)(v30 + 1) != v28);
      id v28 = [&off_100063CE8 countByEnumeratingWithState:&v38 objects:v43 count:16];
    }

    while (v28);
  }

  else
  {
    unint64_t v31 = 0LL;
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v31 >> 20));
  logfunction(", 1, @"Total Size taken by MobileAssets is %@MB\n"", v17, v18, v19, v20, v21, (char)v16);

  v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  v31 >> 20));
  [v24 setObject:v22 forKeyedSubscript:@"mobileAssetsSpaceMB"];

  return 0;
}

BOOL __48__MSUAnalytics_addMobileAssetStatsToDictionary___block_invoke(id a1, NSURL *a2, NSError *a3)
{
  return 1;
}

- (void)addTargetVolumeDriveInfoToDictionary:(id)a3
{
}

- (id)copySerialNumber
{
  v2 = (void *)MGCopyAnswer(@"SerialNumber", 0LL);
  if (!v2)
  {
    uint64_t v9 = @"NO";
LABEL_6:
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSString);
    objc_opt_isKindOfClass(v2, v10);
    logfunction( ",  1,  @"Unable to determine serial number: ValidObject: %@ isString: %@\n"",  v11,  v12,  v13,  v14,  v15,  (char)v9);

    return 0LL;
  }

  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) == 0)
  {
    uint64_t v9 = @"YES";
    goto LABEL_6;
  }

  logfunction(", 1, @"Successfully read serial number : %@\n"", v4, v5, v6, v7, v8, (char)v2);
  return v2;
}

- (id)copyAppleConnectPersonID
{
  return 0LL;
}

- (id)copyAnalyticsDataForPreflight
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MSUAnalytics mainQueue](self, "mainQueue"));
  dispatch_assert_queue_V2(v3);

  uint64_t v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  if (v9)
  {
    -[MSUAnalytics addSoftwareUpdateInfoToDictionary:](self, "addSoftwareUpdateInfoToDictionary:", v9);
    -[MSUAnalytics addCacheDeleteInfoToDictionary:](self, "addCacheDeleteInfoToDictionary:", v9);
    -[MSUAnalytics addMobileAssetStatsToDictionary:](self, "addMobileAssetStatsToDictionary:", v9);
    -[MSUAnalytics addTargetVolumeDriveInfoToDictionary:](self, "addTargetVolumeDriveInfoToDictionary:", v9);
    if (MGGetBoolAnswer(@"InternalBuild"))
    {
      id v15 = -[MSUAnalytics copyAppleConnectPersonID](self, "copyAppleConnectPersonID");
      if (v15) {
        -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v15, @"personId");
      }
      id v16 = -[MSUAnalytics copySerialNumber](self, "copySerialNumber");
      if (v16) {
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v9,  "setObject:forKeyedSubscript:",  v16,  @"serialNumber");
      }
    }

    logfunction(", 1, @"UsageInfoForPreflight is %@\n"", v10, v11, v12, v13, v14, (char)v9);
    uint64_t v17 = v9;
  }

  else
  {
    logfunction( ",  1,  @"Failed to allocate downloadInfo dict for additional preflight data\n"",  v4,  v5,  v6,  v7,  v8,  v19);
  }

  return v9;
}

- (id)copyGenericAnalyticsData
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MSUAnalytics mainQueue](self, "mainQueue"));
  dispatch_assert_queue_V2(v3);

  uint64_t v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  if (v9)
  {
    if (MGGetBoolAnswer(@"InternalBuild"))
    {
      if (-[MSUAnalytics updatePhase](self, "updatePhase") == 5)
      {
        logfunction(", 1, @"Skipping collection of personID for updateFinished\n"", v10, v11, v12, v13, v14, v39);
      }

      else
      {
        logfunction(", 1, @"Attempting to read personID\n"", v10, v11, v12, v13, v14, v39);
        id v25 = -[MSUAnalytics copyAppleConnectPersonID](self, "copyAppleConnectPersonID");
        if (v25)
        {
          logfunction(", 1, @"Successfully read personID: %@\n"", v20, v21, v22, v23, v24, (char)v25);
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v9,  "setObject:forKeyedSubscript:",  v25,  @"personId");
        }

        else
        {
          logfunction(", 1, @"Failed to read personID\n"", v20, v21, v22, v23, v24, v41);
        }
      }

      logfunction(", 1, @"Attempting to read serial number\n"", v15, v16, v17, v18, v19, v40);
      id v31 = -[MSUAnalytics copySerialNumber](self, "copySerialNumber");
      if (v31)
      {
        logfunction(", 1, @"Successfully read serial number %@\n"", v26, v27, v28, v29, v30, (char)v31);
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v9,  "setObject:forKeyedSubscript:",  v31,  @"serialNumber");
      }

      else
      {
        logfunction(", 1, @"Failed to read serial number\n"", v26, v27, v28, v29, v30, v42);
      }
    }

    -[MSUAnalytics addTargetVolumeDriveInfoToDictionary:](self, "addTargetVolumeDriveInfoToDictionary:", v9);
    logfunction(", 1, @"Additional analytics data is %@\n"", v32, v33, v34, v35, v36, (char)v9);
    __int128 v37 = v9;
  }

  else
  {
    logfunction( ",  1,  @"Failed to allocate downloadInfo dict for additional generic data\n"",  v4,  v5,  v6,  v7,  v8,  v39);
  }

  return v9;
}

- (id)copyAnalyticsData
{
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  uint64_t v10 = __Block_byref_object_copy__1;
  uint64_t v11 = __Block_byref_object_dispose__1;
  id v12 = 0LL;
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MSUAnalytics mainQueue](self, "mainQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = __33__MSUAnalytics_copyAnalyticsData__block_invoke;
  v6[3] = &unk_1000591F0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __33__MSUAnalytics_copyAnalyticsData__block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8,  char a9)
{
  if (![*(id *)(a1 + 32) updatePhase]
    || [*(id *)(a1 + 32) updatePhase] >= 6)
  {
    uint64_t v15 = @"Invalid phase set in MSUAnalytics object\n";
LABEL_4:
    logfunction("", 1, v15, v10, v11, v12, v13, v14, a9);
    return;
  }

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) getStringForPhase]);
  logfunction(", 1, @"Attempting to gather analytics data for phase : %@\n"", v17, v18, v19, v20, v21, (char)v16);

  unsigned int v22 = [*(id *)(a1 + 32) updatePhase];
  if (v22 - 3 >= 3)
  {
    if (v22 != 2)
    {
      uint64_t v15 = @"Copying data for this phase is currently unsupported.\n";
      goto LABEL_4;
    }

    id v23 = [*(id *)(a1 + 32) copyAnalyticsDataForPreflight];
  }

  else
  {
    id v23 = [*(id *)(a1 + 32) copyGenericAnalyticsData];
  }

  uint64_t v24 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v25 = *(void **)(v24 + 40);
  *(void *)(v24 + 40) = v23;
}

- (int)updatePhase
{
  return self->_updatePhase;
}

- (void)setUpdatePhase:(int)a3
{
  self->_updatePhase = a3;
}

- (OS_dispatch_queue)mainQueue
{
  return self->_mainQueue;
}

- (void)setMainQueue:(id)a3
{
}

- (OS_dispatch_queue)SSOQueue
{
  return self->_SSOQueue;
}

- (void)setSSOQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end