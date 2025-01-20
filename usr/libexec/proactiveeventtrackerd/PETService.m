@interface PETService
+ (void)clearAllLogs;
+ (void)updateMobileAssetMetadataWithXPCActivity:(id)a3;
- (BOOL)_writeUploadForTransparency:(id)a3;
- (PETService)init;
- (id)_createMetadataFrom:(id)a3 submissionId:(id)a4 messageName:(id)a5 typeId:(unsigned int)a6;
- (void)_uploadBatchedDataToPFA:(id)a3 schema:(id)a4 messageGroup:(id)a5;
- (void)_uploadGMSDataToPFA:(id)a3;
- (void)_uploadToFBFv2WithUpload:(id)a3;
- (void)_uploadWithUploadPackage:(id)a3;
- (void)upload;
@end

@implementation PETService

- (PETService)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PETService;
  v2 = -[PETService init](&v8, "init");
  if (!v2)
  {
LABEL_6:
    v5 = v2;
    goto LABEL_10;
  }

  v2->_isInternalDevice = +[_PASDeviceInfo isInternalBuild]( &OBJC_CLASS____PASDeviceInfo,  "isInternalBuild");
  v3 = -[PETEventTracker2 initWithAsyncEnabled:]( objc_alloc(&OBJC_CLASS___PETEventTracker2),  "initWithAsyncEnabled:",  0LL);
  tracker = v2->_tracker;
  v2->_tracker = v3;

  if (v2->_tracker)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "PETService has been initialized",  v7,  2u);
    }

    AnalyticsSendEvent(@"com.apple.proactive.petd.inited", &off_10000CCB0);
    goto LABEL_6;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_FAULT,  "Failed to initialize the tracker",  v7,  2u);
  }

  AnalyticsSendEvent(@"com.apple.proactive.petd.error_init", &off_10000CC88);
  v5 = 0LL;
LABEL_10:

  return v5;
}

- (void)upload
{
  v3 = objc_alloc(&OBJC_CLASS___PETServiceUploadAssembler);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PETEventTracker2 rootDir](self->_tracker, "rootDir"));
  v5 = -[PETServiceUploadAssembler initWithRootDir:](v3, "initWithRootDir:", v4);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( -[PETServiceUploadAssembler assembleAggregatedUploadWithTracker:]( v5,  "assembleAggregatedUploadWithTracker:",  self->_tracker));
    if (v6) {
      -[PETService _uploadWithUploadPackage:](self, "_uploadWithUploadPackage:", v6);
    }
    tracker = self->_tracker;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100006A78;
    v8[3] = &unk_10000C430;
    v9 = v5;
    v10 = self;
    -[PETEventTracker2 enumerateMessageGroups:](tracker, "enumerateMessageGroups:", v8);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_FAULT,  "Failed to initialize the upload assembler",  buf,  2u);
  }
}

- (BOOL)_writeUploadForTransparency:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 aggregatedMessages]);
  id v7 = [v6 countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v44;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v44 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = (void *)objc_claimAutoreleasedReturnValue( +[PETEventTracker2 formattedTextForAggregatedMessage:]( &OBJC_CLASS___PETEventTracker2,  "formattedTextForAggregatedMessage:",  *(void *)(*((void *)&v43 + 1) + 8LL * (void)i)));
        -[NSMutableArray addObject:](v5, "addObject:", v11);
      }

      id v8 = [v6 countByEnumeratingWithState:&v43 objects:v48 count:16];
    }

    while (v8);
  }

  if (!-[NSMutableArray count](v5, "count")) {
    goto LABEL_10;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue([@"proactive_event_tracker-" stringByAppendingString:@"aggregated"]);
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472LL;
  v41[2] = sub_100006980;
  v41[3] = &unk_10000C458;
  v42 = v5;
  int v13 = OSAWriteLogForSubmission(@"303", v12, 0LL, 0LL, v41);

  if (!v13)
  {
    char v29 = 0;
  }

  else
  {
LABEL_10:
    v14 = objc_alloc(&OBJC_CLASS___PETServiceUploadAssembler);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PETEventTracker2 rootDir](self->_tracker, "rootDir"));
    v16 = -[PETServiceUploadAssembler initWithRootDir:](v14, "initWithRootDir:", v15);

    v33 = v16;
    if (v16)
    {
      v17 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
      v18 = (void *)objc_claimAutoreleasedReturnValue([v4 metadata]);
      v19 = (void *)objc_claimAutoreleasedReturnValue([v18 messageGroup]);

      __int128 v38 = 0u;
      __int128 v39 = 0u;
      __int128 v36 = 0u;
      __int128 v37 = 0u;
      id v31 = v4;
      id obj = (id)objc_claimAutoreleasedReturnValue([v4 unaggregatedMessages]);
      id v20 = [obj countByEnumeratingWithState:&v36 objects:v47 count:16];
      if (v20)
      {
        id v21 = v20;
        uint64_t v22 = *(void *)v37;
        do
        {
          for (j = 0LL; j != v21; j = (char *)j + 1)
          {
            if (*(void *)v37 != v22) {
              objc_enumerationMutation(obj);
            }
            uint64_t v24 = *(void *)(*((void *)&v36 + 1) + 8LL * (void)j);
            v25 = (void *)objc_claimAutoreleasedReturnValue(-[PETServiceUploadAssembler petConfig](v33, "petConfig"));
            v26 = (void *)objc_claimAutoreleasedReturnValue( +[PETEventTracker2 formattedTextForUnaggregatedMessage:messageGroup:config:]( &OBJC_CLASS___PETEventTracker2,  "formattedTextForUnaggregatedMessage:messageGroup:config:",  v24,  v19,  v25));

            -[NSMutableArray addObject:](v17, "addObject:", v26);
          }

          id v21 = [obj countByEnumeratingWithState:&v36 objects:v47 count:16];
        }

        while (v21);
      }

      if (-[NSMutableArray count](v17, "count"))
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue([v19 stringByReplacingOccurrencesOfString:@"." withString:@"_"]);
        v28 = (void *)objc_claimAutoreleasedReturnValue([@"proactive_event_tracker-" stringByAppendingString:v27]);
        v34[0] = _NSConcreteStackBlock;
        v34[1] = 3221225472LL;
        v34[2] = sub_100006A0C;
        v34[3] = &unk_10000C458;
        v35 = v17;
        char v29 = OSAWriteLogForSubmission(@"303", v28, 0LL, 0LL, v34);
      }

      else
      {
        char v29 = 1;
      }

      id v4 = v31;
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_FAULT,  "Failed to initialize the upload assembler",  buf,  2u);
      }

      char v29 = 0;
    }
  }

  return v29;
}

- (void)_uploadToFBFv2WithUpload:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 metadata]);
  [v4 setUploadService:2];

  [v3 clearUnaggregatedMessages];
  [v3 clearAggregatedMessages];
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 data]);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Sending upload data to FBFv2.",  buf,  2u);
  }

  id v6 = [[PETSchemaPETUpload alloc] initWithData:v5];
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 wrapAsAnyEvent]);
  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[FLLogger sharedLogger](&OBJC_CLASS___FLLogger, "sharedLogger"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1000066EC;
    v9[3] = &unk_10000C480;
    id v10 = v3;
    id v11 = v5;
    [v8 reportSiriInstrumentationEvent:v7 forBundleID:@"com.apple.proactive.eventtracker" completion:v9];
  }
}

- (id)_createMetadataFrom:(id)a3 submissionId:(id)a4 messageName:(id)a5 typeId:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = (void *)objc_opt_new(&OBJC_CLASS___COMAPPLEPETCOMMONPETMetadata);
  int v13 = (void *)objc_claimAutoreleasedReturnValue([v11 metadata]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 device]);
  [v12 setDevice:v14];

  v15 = (void *)objc_claimAutoreleasedReturnValue([v11 metadata]);
  objc_msgSend(v12, "setIsInternal:", objc_msgSend(v15, "isInternal"));

  v16 = (void *)objc_claimAutoreleasedReturnValue([v11 metadata]);
  objc_msgSend(v12, "setIsSeed:", objc_msgSend(v16, "isSeed"));

  v17 = (void *)objc_claimAutoreleasedReturnValue([v11 metadata]);
  objc_msgSend(v12, "setIsGm:", objc_msgSend(v17, "isGm"));

  v18 = (void *)objc_claimAutoreleasedReturnValue([v11 metadata]);
  objc_msgSend(v12, "setIsInternalCarry:", objc_msgSend(v18, "isInternalCarry"));

  v19 = (void *)objc_claimAutoreleasedReturnValue([v11 metadata]);
  objc_msgSend(v12, "setUploadTime:", objc_msgSend(v19, "uploadTime"));

  id v20 = (void *)objc_claimAutoreleasedReturnValue([v11 metadata]);
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 build]);
  [v12 setBuild:v21];

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v11 metadata]);
  objc_msgSend(v12, "setConfigVersion:", objc_msgSend(v22, "configVersion"));

  v23 = (void *)objc_claimAutoreleasedReturnValue([v11 metadata]);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 country]);
  [v12 setCountry:v24];

  v25 = (void *)objc_claimAutoreleasedReturnValue([v11 metadata]);
  v26 = (void *)objc_claimAutoreleasedReturnValue([v25 language]);
  [v12 setLanguage:v26];

  v27 = (void *)objc_claimAutoreleasedReturnValue([v11 metadata]);
  v28 = (void *)objc_claimAutoreleasedReturnValue([v27 messageGroup]);
  [v12 setMessageGroup:v28];

  char v29 = (void *)objc_claimAutoreleasedReturnValue([v11 metadata]);
  v30 = (void *)objc_claimAutoreleasedReturnValue([v29 platform]);
  [v12 setPlatform:v30];

  [v12 setUploadService:3];
  [v12 setPseudoDeviceId:v10];

  [v12 setMessageName:v9];
  [v12 setTypeId:v6];
  return v12;
}

- (void)_uploadGMSDataToPFA:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v7 = v3;
  id obj = (id)objc_claimAutoreleasedReturnValue([v3 unaggregatedMessages]);
  id v8 = [obj countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v27;
    do
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)v11);
        int v13 = (void *)objc_opt_new(&OBJC_CLASS___COMAPPLEPROACTIVEGMSGMSPETUploadEvent);
        v14 = (void *)objc_claimAutoreleasedReturnValue([v12 name]);
        v15 = (void *)objc_claimAutoreleasedReturnValue( -[PETService _createMetadataFrom:submissionId:messageName:typeId:]( self,  "_createMetadataFrom:submissionId:messageName:typeId:",  v7,  v5,  v14,  [v12 typeId]));
        [v13 setMetadata:v15];

        id v16 = objc_alloc(&OBJC_CLASS___PBDataReader);
        v17 = (void *)objc_claimAutoreleasedReturnValue([v12 rawBytes]);
        id v18 = [v16 initWithData:v17];

        v19 = (void *)objc_opt_new(&OBJC_CLASS___COMAPPLEPROACTIVEGMSGMSUberEvent);
        COMAPPLEPROACTIVEGMSGMSUberEventReadFrom(v19, v18);
        [v13 setUberEvent:v19];
        id v20 = (void *)objc_claimAutoreleasedReturnValue([v13 data]);
        [v6 addObject:v20];

        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [obj countByEnumeratingWithState:&v26 objects:v34 count:16];
    }

    while (v9);
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v21 = [v6 count];
    *(_DWORD *)buf = 134218242;
    id v31 = v21;
    __int16 v32 = 2112;
    v33 = @"com.apple.proactive.gms.PetUploadEvent";
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Repackaged %lu GMS messages, ready for uploading to PFA with schema: %@",  buf,  0x16u);
  }

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v7 metadata]);
  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 messageGroup]);
  -[PETService _uploadBatchedDataToPFA:schema:messageGroup:]( self,  "_uploadBatchedDataToPFA:schema:messageGroup:",  v6,  @"com.apple.proactive.gms.PetUploadEvent",  v23);
}

- (void)_uploadBatchedDataToPFA:(id)a3 schema:(id)a4 messageGroup:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[FLLogger sharedLoggerWithPersistenceConfiguration:]( &OBJC_CLASS___FLLogger,  "sharedLoggerWithPersistenceConfiguration:",  1LL));
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id v11 = v7;
  id v12 = [v11 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v12)
  {
    id v14 = v12;
    uint64_t v15 = *(void *)v24;
    *(void *)&__int128 v13 = 138412290LL;
    __int128 v19 = v13;
    do
    {
      id v16 = 0LL;
      do
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v11);
        }
        uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 8LL * (void)v16);
        if ((objc_opt_respondsToSelector(v10, "reportDataPlatformBatchedEvent:forBundleID:ofSchema:completion:") & 1) != 0)
        {
          v20[0] = _NSConcreteStackBlock;
          v20[1] = 3221225472LL;
          v20[2] = sub_1000064CC;
          v20[3] = &unk_10000C480;
          id v21 = v9;
          uint64_t v22 = v17;
          [v10 reportDataPlatformBatchedEvent:v17 forBundleID:@"com.apple.proactive" ofSchema:v8 completion:v20];
          id v18 = v21;
        }

        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v19;
            id v30 = v9;
            _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "%@ is failed to upload to PFA backend",  buf,  0xCu);
          }

          v27[0] = @"reason";
          v27[1] = @"group";
          v28[0] = @"PFA-backend is not available ";
          v28[1] = v9;
          id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v28,  v27,  2LL,  v19));
          AnalyticsSendEvent(@"com.apple.proactive.petd.upload_failed", v18);
        }

        id v16 = (char *)v16 + 1;
      }

      while (v14 != v16);
      id v14 = [v11 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }

    while (v14);
  }
}

- (void)_uploadWithUploadPackage:(id)a3
{
  id v4 = a3;
  if ((+[_PASDeviceInfo isDNUEnabled](&OBJC_CLASS____PASDeviceInfo, "isDNUEnabled") & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 metadata]);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 messageGroup]);

    if (!v6)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 metadata]);
      [v7 setMessageGroup:@"null"];
    }

    if (-[PETService _writeUploadForTransparency:](self, "_writeUploadForTransparency:", v4))
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[PETMetadata getCountryCode](&OBJC_CLASS___PETMetadata, "getCountryCode"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 metadata]);
      if ([v9 isInternal])
      {
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 metadata]);
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 messageGroup]);
        unsigned int v12 = [v11 isEqualToString:@"com.apple.generativefunctions.instrumentation.UberEvent"];

        if (v12)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v4 metadata]);
            id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 messageGroup]);
            int v18 = 138412290;
            __int128 v19 = v14;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Found GMS Event Message Group: %@",  (uint8_t *)&v18,  0xCu);
          }

          -[PETService _uploadGMSDataToPFA:](self, "_uploadGMSDataToPFA:", v4);
        }
      }

      else
      {
      }

      -[PETService _uploadToFBFv2WithUpload:](self, "_uploadToFBFv2WithUpload:", v4);
    }

    else
    {
      v20[0] = @"reason";
      v20[1] = @"group";
      v21[0] = @"write_osa";
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v4 metadata]);
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 messageGroup]);
      v21[1] = v16;
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  2LL));
      AnalyticsSendEvent(@"com.apple.proactive.petd.upload_failed", v17);

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v18) = 0;
        _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_FAULT,  "Failed to write upload data to OSAnalytics for transparency",  (uint8_t *)&v18,  2u);
      }
    }
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "DNU is disabled. Skip uploading",  (uint8_t *)&v18,  2u);
  }
}

- (void).cxx_destruct
{
}

+ (void)updateMobileAssetMetadataWithXPCActivity:(id)a3
{
  id v3 = (_xpc_activity_s *)a3;
  dispatch_queue_t v4 = dispatch_queue_create("PETAsset-notifications", 0LL);
  id v5 = [[_PASAsset2 alloc] initWithAssetTypeDescriptorPath:@"/System/Library/AssetTypeDescriptors/com.apple.MobileAsset.AssetTypeDescriptor.ProactiveEventTrackerAssets.plist" defaultBundlePath:0 matchingKeysAndValues:0 notificationQueue:v4 logHandle:&_os_log_default];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Kicking off mobile asset metadata download.",  buf,  2u);
  }

  if (!xpc_activity_set_state(v3, 4LL) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Error setting XPC activity state to CONTINUE",  buf,  2u);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100006C88;
  v7[3] = &unk_10000C4A8;
  id v8 = v3;
  uint64_t v6 = v3;
  [v5 downloadMetadataWithCompletion:v7];
}

+ (void)clearAllLogs
{
  id v3 = -[PETEventTracker2 initWithAsyncEnabled:]( objc_alloc(&OBJC_CLASS___PETEventTracker2),  "initWithAsyncEnabled:",  0LL);
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PETEventTracker2 aggregateState](v3, "aggregateState"));
  [v2 reset];

  -[PETEventTracker2 clearLogStores](v3, "clearLogStores");
}

@end