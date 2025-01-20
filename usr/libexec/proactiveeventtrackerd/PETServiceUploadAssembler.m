@interface PETServiceUploadAssembler
+ (id)loadPET1Config;
+ (id)loadPETConfig;
- (BOOL)_canLog:(id)a3 messageGroup:(id)a4 isInternal:(BOOL)a5;
- (BOOL)_canLogPET1Key:(id)a3;
- (BOOL)_checkMessageSampling:(id)a3;
- (BOOL)_checkSampling:(id)a3;
- (BOOL)isConfigEnabled;
- (NSDictionary)pet1Config;
- (NSUUID)deviceId;
- (PETConfig)petConfig;
- (PETServiceUploadAssembler)initWithRootDir:(id)a3;
- (id)assembleAggregatedUploadWithTracker:(id)a3;
- (id)assembleUnaggregatedUploadWithTracker:(id)a3 messageGroup:(id)a4;
- (void)setDeviceId:(id)a3;
- (void)setIsConfigEnabled:(BOOL)a3;
- (void)setPet1Config:(id)a3;
- (void)setPetConfig:(id)a3;
@end

@implementation PETServiceUploadAssembler

- (PETServiceUploadAssembler)initWithRootDir:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___PETServiceUploadAssembler;
  v5 = -[PETServiceUploadAssembler init](&v19, "init");
  if (!v5) {
    goto LABEL_17;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[PETServiceUploadAssembler loadPETConfig](&OBJC_CLASS___PETServiceUploadAssembler, "loadPETConfig"));
  -[PETServiceUploadAssembler setPetConfig:](v5, "setPetConfig:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PETServiceUploadAssembler petConfig](v5, "petConfig"));
  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_FAULT,  "Failed to load PET configuration",  v18,  2u);
    }

    v11 = &off_10000CD00;
    goto LABEL_12;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[PETServiceUploadAssembler loadPET1Config](&OBJC_CLASS___PETServiceUploadAssembler, "loadPET1Config"));
  -[PETServiceUploadAssembler setPet1Config:](v5, "setPet1Config:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PETServiceUploadAssembler pet1Config](v5, "pet1Config"));
  if (!v9)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_FAULT,  "Failed to load PET 1.0 configuration",  v18,  2u);
    }

    v11 = &off_10000CD28;
LABEL_12:
    AnalyticsSendEvent(@"com.apple.proactive.petd.assembler.error_init", v11);
    goto LABEL_13;
  }

  else {
    BOOL v10 = 1LL;
  }
  -[PETServiceUploadAssembler setIsConfigEnabled:](v5, "setIsConfigEnabled:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingPathComponent:@"device_id"]);
  id v14 = [[_PASDeviceIdentifier alloc] initWithBasePath:v13];
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 UUID]);
  -[PETServiceUploadAssembler setDeviceId:](v5, "setDeviceId:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PETServiceUploadAssembler deviceId](v5, "deviceId"));
  if (v16)
  {

LABEL_17:
    v12 = v5;
    goto LABEL_18;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v18 = 0;
    _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_FAULT,  "Failed to generate device identifer for sampling",  v18,  2u);
  }

  AnalyticsSendEvent(@"com.apple.proactive.petd.assembler.error_init", &off_10000CD50);

LABEL_13:
  v12 = 0LL;
LABEL_18:

  return v12;
}

- (id)assembleAggregatedUploadWithTracker:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 aggregateState]);
  unsigned __int8 v6 = [v5 checkIntegrity];

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_opt_new(&OBJC_CLASS___PETUpload);
    v8 = objc_opt_new(&OBJC_CLASS___PETMetadata);
    [v7 setMetadata:v8];

    v9 = (void *)objc_claimAutoreleasedReturnValue([v7 metadata]);
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[PETServiceUploadAssembler petConfig](self, "petConfig"));
    objc_msgSend(v9, "setMetadataWithConfigVersion:", objc_msgSend(v10, "version"));

    BOOL v11 = -[PETServiceUploadAssembler isConfigEnabled](self, "isConfigEnabled");
    v12 = (void *)objc_claimAutoreleasedReturnValue([v7 metadata]);
    [v12 setIsConfigEnabled:v11];

    v13 = (void *)objc_claimAutoreleasedReturnValue([v7 metadata]);
    [v13 setMessageGroup:@"_aggregated"];

    [v7 setIsCompressed:1];
    else {
      unsigned __int8 v14 = +[_PASDeviceInfo isInternalBuild](&OBJC_CLASS____PASDeviceInfo, "isInternalBuild");
    }
    *(void *)v37 = 0LL;
    v38 = v37;
    uint64_t v39 = 0x2020000000LL;
    char v40 = 0;
    v29 = _NSConcreteStackBlock;
    uint64_t v30 = 3221225472LL;
    v31 = sub_100007EEC;
    v32 = &unk_10000C4D0;
    v16 = objc_opt_new(&OBJC_CLASS___PETServiceMessageCompressor);
    v33 = v16;
    v34 = self;
    unsigned __int8 v36 = v14;
    v35 = v37;
    [v4 enumerateAggregatedMessagesWithBlock:&v29 clearStore:1];
    -[PETServiceMessageCompressor close](v16, "close", v29, v30, v31, v32);
    if (v38[24])
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[PETServiceMessageCompressor compressedMessages](v16, "compressedMessages"));
      BOOL v18 = v17 == 0LL;

      if (v18)
      {
        AnalyticsSendEvent(@"com.apple.proactive.petd.assembler.compression_error", &off_10000CDC8);
      }

      else
      {
        objc_super v19 = (void *)objc_claimAutoreleasedReturnValue(-[PETServiceMessageCompressor compressedMessages](v16, "compressedMessages"));
        BOOL v20 = (unint64_t)[v19 length] > 0x1F8000;

        if (!v20)
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[PETServiceMessageCompressor compressedMessages](v16, "compressedMessages"));
          [v7 setCompressedMessages:v28];

          id v15 = v7;
          goto LABEL_16;
        }

        id v21 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[PETServiceMessageCompressor compressedMessages](v16, "compressedMessages"));
          id v23 = [v22 length];
          *(_DWORD *)buf = 134218240;
          id v44 = v23;
          __int16 v45 = 2048;
          uint64_t v46 = 2064384LL;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Dropping aggregated messages (size %lu) due to exceeding MAX_UPLOAD_BYTES (%lu)",  buf,  0x16u);
        }

        v41[0] = @"size";
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[PETServiceMessageCompressor compressedMessages](v16, "compressedMessages"));
        v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v24 length]));
        v41[1] = @"group";
        v42[0] = v25;
        v42[1] = @"_aggregated";
        v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v42,  v41,  2LL));
        AnalyticsSendEvent(@"com.apple.proactive.petd.assembler.upload_dropped", v26);
      }
    }

    id v15 = 0LL;
LABEL_16:

    _Block_object_dispose(v37, 8);
    goto LABEL_17;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v37 = 0;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "The aggregate state is corrupt. Resetting the state store",  v37,  2u);
  }

  AnalyticsSendEvent(@"com.apple.proactive.petd.assembler.upload_dropped", &off_10000CD78);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 aggregateState]);
  [v7 reset];
  id v15 = 0LL;
LABEL_17:

  return v15;
}

- (id)assembleUnaggregatedUploadWithTracker:(id)a3 messageGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_opt_new(&OBJC_CLASS___PETUpload);
  v9 = objc_opt_new(&OBJC_CLASS___PETMetadata);
  [v8 setMetadata:v9];

  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v8 metadata]);
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[PETServiceUploadAssembler petConfig](self, "petConfig"));
  objc_msgSend(v10, "setMetadataWithConfigVersion:", objc_msgSend(v11, "version"));

  BOOL v12 = -[PETServiceUploadAssembler isConfigEnabled](self, "isConfigEnabled");
  v13 = (void *)objc_claimAutoreleasedReturnValue([v8 metadata]);
  [v13 setIsConfigEnabled:v12];

  unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v8 metadata]);
  [v14 setMessageGroup:v7];

  [v8 setIsCompressed:1];
  else {
    unsigned __int8 v15 = +[_PASDeviceInfo isInternalBuild](&OBJC_CLASS____PASDeviceInfo, "isInternalBuild");
  }
  uint64_t v43 = 0LL;
  id v44 = &v43;
  uint64_t v45 = 0x2020000000LL;
  char v46 = 0;
  v33 = _NSConcreteStackBlock;
  uint64_t v34 = 3221225472LL;
  v35 = sub_100007C70;
  unsigned __int8 v36 = &unk_10000C4F8;
  v16 = objc_opt_new(&OBJC_CLASS___PETServiceMessageCompressor);
  v37 = v16;
  v38 = self;
  id v17 = v7;
  id v39 = v17;
  unsigned __int8 v42 = v15;
  id v18 = v8;
  id v40 = v18;
  v41 = &v43;
  [v6 enumerateMessagesWithBlock:&v33 messageGroup:v17 clearStore:1];
  -[PETServiceMessageCompressor close](v16, "close", v33, v34, v35, v36);
  if (*((_BYTE *)v44 + 24))
  {
    objc_super v19 = (void *)objc_claimAutoreleasedReturnValue(-[PETServiceMessageCompressor compressedMessages](v16, "compressedMessages"));
    BOOL v20 = v19 == 0LL;

    if (v20)
    {
      v53 = @"group";
      id v54 = v17;
      v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v54,  &v53,  1LL));
      AnalyticsSendEvent(@"com.apple.proactive.petd.assembler.compression_error", v29);
    }

    else
    {
      id v21 = (void *)objc_claimAutoreleasedReturnValue(-[PETServiceMessageCompressor compressedMessages](v16, "compressedMessages"));
      BOOL v22 = (unint64_t)[v21 length] > 0x1F8000;

      if (!v22)
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[PETServiceMessageCompressor compressedMessages](v16, "compressedMessages"));
        [v18 setCompressedMessages:v32];

        id v30 = v18;
        goto LABEL_12;
      }

      id v23 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[PETServiceMessageCompressor compressedMessages](v16, "compressedMessages"));
        id v25 = [v24 length];
        *(_DWORD *)buf = 134218240;
        id v50 = v25;
        __int16 v51 = 2048;
        uint64_t v52 = 2064384LL;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Dropping aggregated messages (size %lu) due to exceeding MAX_UPLOAD_BYTES (%lu)",  buf,  0x16u);
      }

      v47[0] = @"size";
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[PETServiceMessageCompressor compressedMessages](v16, "compressedMessages"));
      v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v26 length]));
      v47[1] = @"group";
      v48[0] = v27;
      v48[1] = v17;
      v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v48,  v47,  2LL));
      AnalyticsSendEvent(@"com.apple.proactive.petd.assembler.upload_dropped", v28);
    }
  }

  id v30 = 0LL;
LABEL_12:

  _Block_object_dispose(&v43, 8);
  return v30;
}

- (BOOL)_canLogPET1Key:(id)a3
{
  return 0;
}

- (BOOL)_canLog:(id)a3 messageGroup:(id)a4 isInternal:(BOOL)a5
{
  id v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue([a3 name]);
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[PETServiceUploadAssembler petConfig](self, "petConfig"));
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v10 whitelistForMessageName:v9]);

  if (v11
    && (a5 || -[PETServiceUploadAssembler _checkSampling:](self, "_checkSampling:", v9))
    && (BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[PETServiceUploadAssembler petConfig](self, "petConfig")),
        unsigned int v13 = [v12 isTVOSEnabledForMessageName:v9 messageGroup:v8],
        v12,
        v13))
  {
    unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(+[PETMetadata getCountryCode](&OBJC_CLASS___PETMetadata, "getCountryCode"));
    BOOL v17 = 1;
    if ([v14 isEqualToString:@"CN"])
    {
      unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue(-[PETServiceUploadAssembler petConfig](self, "petConfig"));
      unsigned int v16 = [v15 isChinaEnabledForMessageName:v9 messageGroup:v8];

      if (!v16) {
        BOOL v17 = 0;
      }
    }
  }

  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (BOOL)_checkSampling:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PETServiceUploadAssembler petConfig](self, "petConfig"));
  [v5 deviceSamplingForMessageName:v4 isSeed:0];
  double v7 = v6;

  BOOL v8 = 0;
  if (v7 > 0.0)
  {
    if (v7 >= 1.0)
    {
      BOOL v8 = 1;
    }

    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[PETServiceUploadAssembler petConfig](self, "petConfig"));
      BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v9 groupForMessageName:v4]);

      BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[PETServiceUploadAssembler deviceId](self, "deviceId"));
      BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[PETServiceUploadAssembler petConfig](self, "petConfig"));
      unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@%@%lu",  v11,  v10,  [v12 version]));

      id v14 = v13;
      unsigned __int8 v15 = (const char *)[v14 UTF8String];
      CC_LONG v16 = strlen(v15);
      CC_MD5(v15, v16, md);
      LODWORD(v17) = *(_DWORD *)md;
      BOOL v8 = v7 * 4294967300.0 > (double)v17;
    }
  }

  return v8;
}

- (BOOL)_checkMessageSampling:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PETServiceUploadAssembler petConfig](self, "petConfig"));
  [v5 messageSamplingForMessageName:v4 isSeed:0];
  double v7 = v6;

  BOOL result = 0;
  if (v7 > 0.0) {
    return v7 >= 1.0 || v7 * 4294967300.0 > (double)arc4random();
  }
  return result;
}

- (PETConfig)petConfig
{
  return (PETConfig *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setPetConfig:(id)a3
{
}

- (NSDictionary)pet1Config
{
  return (NSDictionary *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setPet1Config:(id)a3
{
}

- (BOOL)isConfigEnabled
{
  return self->_isConfigEnabled;
}

- (void)setIsConfigEnabled:(BOOL)a3
{
  self->_isConfigEnabled = a3;
}

- (NSUUID)deviceId
{
  return (NSUUID *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setDeviceId:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)loadPETConfig
{
  v2 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___PETEventTracker2, a2));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 pathForResource:@"pet_config" ofType:@"plist"]);

  if (v4)
  {
    v5 = -[PETConfig initWithFile:](objc_alloc(&OBJC_CLASS___PETConfig), "initWithFile:", v4);
    dispatch_queue_t v6 = dispatch_queue_create("PETAsset-notifications", 0LL);
    id v7 = [[_PASAsset2 alloc] initWithAssetTypeDescriptorPath:@"/System/Library/AssetTypeDescriptors/com.apple.MobileAsset.AssetTypeDescriptor.ProactiveEventTrackerAssets.plist" defaultBundlePath:0 matchingKeysAndValues:0 notificationQueue:v6 logHandle:&_os_log_default];
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v7 filesystemPathForAssetDataRelativePath:@"pet_config.plist"]);
    if (v8)
    {
      v9 = -[PETConfig initWithFile:](objc_alloc(&OBJC_CLASS___PETConfig), "initWithFile:", v8);
      id v10 = -[PETConfig version](v5, "version");
      if (v10 <= -[PETConfig version](v9, "version")) {
        BOOL v11 = v9;
      }
      else {
        BOOL v11 = v5;
      }
      BOOL v12 = v11;
    }

    else
    {
      BOOL v12 = v5;
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v14 = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Failed to load PET config from the bundle",  v14,  2u);
    }

    BOOL v12 = 0LL;
  }

  return v12;
}

+ (id)loadPET1Config
{
  dispatch_queue_t v2 = dispatch_queue_create("PETAsset-notifications", 0LL);
  id v3 = [[_PASAsset2 alloc] initWithAssetTypeDescriptorPath:@"/System/Library/AssetTypeDescriptors/com.apple.MobileAsset.AssetTypeDescriptor.ProactiveEventTrackerAssets.plist" defaultBundlePath:0 matchingKeysAndValues:0 notificationQueue:v2 logHandle:&_os_log_default];
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 filesystemPathForAssetDataRelativePath:@"pet1_config.plist"]);
  if (v5
    || (dispatch_queue_t v6 = +[NSBundle bundleForClass:]( NSBundle,  "bundleForClass:",  objc_opt_class(PETEventTracker2, v4)),  v7 = (void *)objc_claimAutoreleasedReturnValue(v6),  v5 = (void *)objc_claimAutoreleasedReturnValue([v7 pathForResource:@"pet1_config" ofType:@"plist"]),  v7,  v5))
  {
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfFile:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfFile:",  v5));
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v10 = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Failed to load PET1 config from the bundle",  v10,  2u);
    }

    BOOL v8 = 0LL;
  }

  return v8;
}

@end