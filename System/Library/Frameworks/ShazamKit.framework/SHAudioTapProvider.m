@interface SHAudioTapProvider
- (SHAudioRecordingManager)audioRecordingManager;
- (SHAudioTapProvider)initWithAudioRecordingManager:(id)a3 clientCredentials:(id)a4;
- (SHAudioTapProvider)initWithAudioRecordingManager:(id)a3 clientCredentials:(id)a4 recorderConfiguration:(id)a5;
- (SHClientCredentials)clientCredentials;
- (SHRecorderConfiguration)recorderConfiguration;
- (id)tapForSource:(int64_t)a3;
- (id)tapsForAvailableSources;
@end

@implementation SHAudioTapProvider

- (SHAudioTapProvider)initWithAudioRecordingManager:(id)a3 clientCredentials:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[SHRemoteConfiguration sharedInstance](&OBJC_CLASS___SHRemoteConfiguration, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 recorderConfigurationWithPromise]);

  v10 = -[SHAudioTapProvider initWithAudioRecordingManager:clientCredentials:recorderConfiguration:]( self,  "initWithAudioRecordingManager:clientCredentials:recorderConfiguration:",  v7,  v6,  v9);
  return v10;
}

- (SHAudioTapProvider)initWithAudioRecordingManager:(id)a3 clientCredentials:(id)a4 recorderConfiguration:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___SHAudioTapProvider;
  v12 = -[SHAudioTapProvider init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_audioRecordingManager, a3);
    objc_storeStrong((id *)&v13->_clientCredentials, a4);
    objc_storeStrong((id *)&v13->_recorderConfiguration, a5);
  }

  return v13;
}

- (id)tapsForAvailableSources
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioTapProvider audioRecordingManager](self, "audioRecordingManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 recorders]);

  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v4 count]));
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = (void *)objc_claimAutoreleasedReturnValue( -[SHAudioTapProvider tapForSource:]( self,  "tapForSource:",  objc_msgSend( *(id *)(*((void *)&v14 + 1) + 8 * (void)v10),  "recordingSource",  (void)v14)));
        if (v11) {
          [v5 addObject:v11];
        }

        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v8);
  }

  id v12 = [v5 copy];
  return v12;
}

- (id)tapForSource:(int64_t)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioTapProvider recorderConfiguration](self, "recorderConfiguration"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioTapProvider clientCredentials](self, "clientCredentials"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 attribution]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 containingAppBundleIdentifier]);
  unsigned __int8 v9 = [v5 availableRecordersForClientIdentifier:v8];

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioTapProvider recorderConfiguration](self, "recorderConfiguration"));
  if (v10)
  {
    BOOL v11 = a3 == 2 && (v9 & 2) != 0LL;

    if (!v11 && ((a3 == 1) & v9) == 0) {
      return 0LL;
    }
  }

  uint64_t v13 = sh_log_object(v10);
  __int128 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioTapProvider clientCredentials](self, "clientCredentials"));
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 attribution]);
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 bundleIdentifier]);
    int v27 = 134218242;
    int64_t v28 = a3;
    __int16 v29 = 2112;
    v30 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Returning audio tap for source %li bundle identifier %@",  (uint8_t *)&v27,  0x16u);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioTapProvider clientCredentials](self, "clientCredentials"));
  if ([v18 isEntitledForSource:a3])
  {
    v19 = objc_alloc(&OBJC_CLASS___SHAudioTap);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioTapProvider clientCredentials](self, "clientCredentials"));
    id v21 = [v20 audioTapClient];
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioTapProvider clientCredentials](self, "clientCredentials"));
    v23 = (void *)objc_claimAutoreleasedReturnValue([v22 attribution]);
    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 bundleIdentifier]);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[SHAudioTapProvider clientCredentials](self, "clientCredentials"));
    v26 = -[SHAudioTap initWithRecordingSource:client:bundleIdentifier:canEnableSpectralOutput:]( v19,  "initWithRecordingSource:client:bundleIdentifier:canEnableSpectralOutput:",  a3,  v21,  v24,  [v25 canEnableSpectralOutput]);
  }

  else
  {
    v26 = 0LL;
  }

  return v26;
}

- (SHAudioRecordingManager)audioRecordingManager
{
  return self->_audioRecordingManager;
}

- (SHClientCredentials)clientCredentials
{
  return self->_clientCredentials;
}

- (SHRecorderConfiguration)recorderConfiguration
{
  return self->_recorderConfiguration;
}

- (void).cxx_destruct
{
}

@end