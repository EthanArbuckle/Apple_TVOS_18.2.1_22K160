@interface CSP2PService
+ (id)sharedInstance;
- (BOOL)fileURL:(id)a3 matchesFileNamePattern:(id)a4;
- (BOOL)isHeadlessDeviceDataCollectionModeEnabled;
- (BOOL)isInternalWithoutProfile;
- (BOOL)shouldTransferVoiceTriggerLogFileWithURL:(id)a3;
- (CSADCompanionServiceProvider)adCompanionServiceProvider;
- (CSP2PService)init;
- (NSString)lastCommunicatedPeer;
- (NSString)voiceIdentificationBatchId;
- (NSString)voiceTriggerBatchId;
- (OS_dispatch_queue)queue;
- (OS_dispatch_semaphore)sema;
- (id)_getContentsOfDirectory:(id)a3;
- (id)_sendGradingData:(id)a3 withFileName:(id)a4 toPeerId:(id)a5 withCompressedFlag:(BOOL)a6 withUncompressedDataSize:(unint64_t)a7 withBatchId:(id)a8 withRetainFileFlag:(BOOL)a9 withFilePrefix:(id)a10 withCompletion:(id)a11;
- (id)_sha1:(id)a3;
- (id)_spIdSiriDebugGradingDataRootDirectory;
- (id)_spIdSiriDebugTrainedUsersFilePathForLocale:(id)a3;
- (id)_spIdSiriDebugVTDataDirectory;
- (id)_spIdSiriDebugVoiceProfileCacheDirectoryForProfile:(id)a3 locale:(id)a4;
- (id)_spIdSiriDebugVoiceProfileRootDirectoryForProfile:(id)a3 locale:(id)a4;
- (id)_spIdSiriDebugVoiceProfileStoreRootDirectory;
- (id)_spIdSiriDebugVoiceProfileStoreRootDirectoryForLocale:(id)a3;
- (id)_speakerRecognitionAudioLogsGradingDir;
- (void)_compressFilesInDirectory:(id)a3 matchingPredicate:(id)a4 compressedFileAvailable:(id)a5;
- (void)_compressFilesInDirectory:(id)a3 matchingPredicate:(id)a4 sortedByCreationDate:(BOOL)a5 compressedFileAvailable:(id)a6;
- (void)_createDirectoryIfDoesNotExist:(id)a3;
- (void)_getHomeUserIdForSharedSiriId:(id)a3 withCompletion:(id)a4;
- (void)_processFetchVoiceProfileCommandFromPeerId:(id)a3 requestInfo:(id)a4 withReply:(id)a5;
- (void)_processGradingDataFetchCommandWithRequest:(id)a3 fromSenderID:(id)a4 withReply:(id)a5;
- (void)_processGradingDataFetchCommandWithRequest:(id)a3 ofLogType:(unint64_t)a4 fromSenderID:(id)a5 withReply:(id)a6;
- (void)_processParallelRecordingCommandWithRequest:(id)a3 fromSenderID:(id)a4 withReply:(id)a5;
- (void)_processRemoteHeySiriCommandWithRequest:(id)a3 fromSenderID:(id)a4 withReply:(id)a5;
- (void)_processReverseTransferVoiceProfileCommandFromPeerId:(id)a3 requestInfo:(id)a4 withReply:(id)a5;
- (void)_processVoiceProfileDeleteCommandWithRequest:(id)a3 fromSenderID:(id)a4 withReply:(id)a5;
- (void)_processVoiceProfileListQueryCommandFromPeerId:(id)a3 requestInfo:(id)a4 withReply:(id)a5;
- (void)_processVoiceProfileUpdateTriggerFromPeerId:(id)a3 requestInfo:(id)a4 withReply:(id)a5;
- (void)_receiveParallelRecordingFromPeerId:(id)a3 recordingInfo:(id)a4 withReply:(id)a5;
- (void)_receiveVoiceGradingDataFromPeerId:(id)a3 requestInfo:(id)a4 withReply:(id)a5;
- (void)_receiveVoiceProfileFromPeerId:(id)a3 voiceProfileInfo:(id)a4 withReply:(id)a5;
- (void)_sendAcousticGradingDataToPeerId:(id)a3;
- (void)_sendCoreSpeechGradingDataToPeerId:(id)a3;
- (void)_sendCoreSpeechGradingDataToPeerId:(id)a3 forLogType:(unint64_t)a4;
- (void)_sendCoreSpeechMagusGradingDataToPeerId:(id)a3;
- (void)_sendGeckoSpeechLogsToPeerId:(id)a3;
- (void)_sendGradingData:(id)a3 withFileName:(id)a4 toPeerId:(id)a5 withCompressedFlag:(BOOL)a6 withUncompressedDataSize:(unint64_t)a7 withBatchId:(id)a8 withRetainFileFlag:(BOOL)a9 withFilePrefix:(id)a10;
- (void)_sendVoiceProfile:(id)a3 toPeerId:(id)a4;
- (void)_sendVoiceProfileUpdateTriggerToPeerId:(id)a3 forLocale:(id)a4;
- (void)_sendVoiceTriggerGradingDataToPeerId:(id)a3;
- (void)processRemoteCommandWithPayload:(id)a3 fromPeer:(id)a4 withReply:(id)a5;
- (void)sendAcousticGradingDataToNearbyPeer;
- (void)sendCoreSpeechGradingDataToNearbyPeer;
- (void)sendGeckoSpeechLogsToCompanion;
- (void)sendVTNearMissGradingDataToCompanion;
- (void)sendVoiceProfileUpdatedMessageToNearbyPeerForLocale:(id)a3;
- (void)setAdCompanionServiceProvider:(id)a3;
- (void)setLastCommunicatedPeer:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSema:(id)a3;
- (void)setVoiceIdentificationBatchId:(id)a3;
- (void)setVoiceTriggerBatchId:(id)a3;
@end

@implementation CSP2PService

- (CSP2PService)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CSP2PService;
  v2 = -[CSP2PService init](&v8, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.corespeech.p2psvc", 0LL);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    dispatch_semaphore_t v5 = dispatch_semaphore_create(6LL);
    sema = v2->_sema;
    v2->_sema = (OS_dispatch_semaphore *)v5;
  }

  return v2;
}

- (void)processRemoteCommandWithPayload:(id)a3 fromPeer:(id)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000E51A4;
  v15[3] = &unk_10022E288;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (void)sendCoreSpeechGradingDataToNearbyPeer
{
  if (self->_lastCommunicatedPeer && CSIsHorseman(self, a2))
  {
    if (-[CSP2PService isHeadlessDeviceDataCollectionModeEnabled](self, "isHeadlessDeviceDataCollectionModeEnabled"))
    {
      queue = (dispatch_queue_s *)self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000E50DC;
      block[3] = &unk_10022F100;
      block[4] = self;
      dispatch_async(queue, block);
    }
  }

- (void)sendVTNearMissGradingDataToCompanion
{
  if (self->_lastCommunicatedPeer && CSIsHorseman(self, a2))
  {
    if (-[CSP2PService isHeadlessDeviceDataCollectionModeEnabled](self, "isHeadlessDeviceDataCollectionModeEnabled"))
    {
      dispatch_time_t v3 = dispatch_time(0LL, 100000000LL);
      queue = (dispatch_queue_s *)self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000E5014;
      block[3] = &unk_10022F100;
      block[4] = self;
      dispatch_after(v3, queue, block);
    }
  }

- (void)sendVoiceProfileUpdatedMessageToNearbyPeerForLocale:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000E4F2C;
  v7[3] = &unk_10022EFD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)sendAcousticGradingDataToNearbyPeer
{
  if (self->_lastCommunicatedPeer && CSIsHorseman(self, a2))
  {
    if (-[CSP2PService isHeadlessDeviceDataCollectionModeEnabled](self, "isHeadlessDeviceDataCollectionModeEnabled"))
    {
      queue = (dispatch_queue_s *)self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000E4E64;
      block[3] = &unk_10022F100;
      block[4] = self;
      dispatch_async(queue, block);
    }
  }

- (void)sendGeckoSpeechLogsToCompanion
{
  if (self->_lastCommunicatedPeer && CSIsHorseman(self, a2))
  {
    if (-[CSP2PService isHeadlessDeviceDataCollectionModeEnabled](self, "isHeadlessDeviceDataCollectionModeEnabled"))
    {
      dispatch_time_t v3 = dispatch_time(0LL, 100000000LL);
      queue = (dispatch_queue_s *)self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000E4D9C;
      block[3] = &unk_10022F100;
      block[4] = self;
      dispatch_after(v3, queue, block);
    }
  }

- (void)_processRemoteHeySiriCommandWithRequest:(id)a3 fromSenderID:(id)a4 withReply:(id)a5
{
  id v6 = (void (**)(id, void *, void))a5;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"CSP2P_RemoteHeySiriEnable_Key"]);
  unsigned int v8 = [v7 BOOLValue];

  id v9 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  BOOL v10 = os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      *(_DWORD *)buf = 136315138;
      v19 = "-[CSP2PService _processRemoteHeySiriCommandWithRequest:fromSenderID:withReply:]";
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s CSP2P_RemoteHeySiriCmd: ENABLE HeySiri: Not Implemented Yet: ",  buf,  0xCu);
    }

    id v16 = @"CSP2P_RemoteHeySiriStatus_Key";
    id v17 = &off_100238B08;
    v11 = &v17;
    id v12 = &v16;
  }

  else
  {
    if (v10)
    {
      *(_DWORD *)buf = 136315138;
      v19 = "-[CSP2PService _processRemoteHeySiriCommandWithRequest:fromSenderID:withReply:]";
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s CSP2P_RemoteHeySiriCmd: DISABLE HeySiri: Not Implemented Yet: ",  buf,  0xCu);
    }

    id v14 = @"CSP2P_RemoteHeySiriStatus_Key";
    v15 = &off_100238B20;
    v11 = &v15;
    id v12 = &v14;
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v12,  1LL,  v14,  v15,  v16,  v17));
  v6[2](v6, v13, 0LL);
}

- (void)_processParallelRecordingCommandWithRequest:(id)a3 fromSenderID:(id)a4 withReply:(id)a5
{
  id v6 = (void (**)(id, void *, void))a5;
  v7 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"CSP2P_RemoteRecordingStart_Key"]);
  id v8 = [v7 unsignedIntegerValue];

  if (v8 == (id)1)
  {
    id v14 = @"CSP2P_RemoteRecordingStatus_Key";
    v15 = &off_100238B08;
    id v9 = &v15;
    BOOL v10 = &v14;
  }

  else
  {
    id v12 = @"CSP2P_RemoteRecordingStatus_Key";
    id v13 = &off_100238B20;
    id v9 = &v13;
    BOOL v10 = &v12;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v9,  v10,  1LL));
  v6[2](v6, v11, 0LL);
}

- (void)_compressFilesInDirectory:(id)a3 matchingPredicate:(id)a4 compressedFileAvailable:(id)a5
{
}

- (void)_compressFilesInDirectory:(id)a3 matchingPredicate:(id)a4 sortedByCreationDate:(BOOL)a5 compressedFileAvailable:(id)a6
{
  BOOL v7 = a5;
  id v42 = a3;
  id v40 = a4;
  v43 = (void (**)(id, void *, id, id, id, BOOL, void))a6;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  NSURLResourceKey v10 = NSURLIsDirectoryKey;
  v68[0] = NSURLNameKey;
  v68[1] = NSURLIsDirectoryKey;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v68, 2LL));
  id v54 = 0LL;
  v41 = (void *)objc_claimAutoreleasedReturnValue( [v9 contentsOfDirectoryAtURL:v42 includingPropertiesForKeys:v11 options:0 error:&v54]);
  id v12 = v54;

  if (!v12)
  {
    if (v40) {
      id v39 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "filteredArrayUsingPredicate:"));
    }
    else {
      id v39 = v41;
    }
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000LL;
    v65 = sub_1000E2B04;
    v66 = sub_1000E2B14;
    id v67 = 0LL;
    if (v7)
    {
      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472LL;
      v53[2] = sub_1000E4B54;
      v53[3] = &unk_10022CEF8;
      v53[4] = buf;
      id v14 = (id)objc_claimAutoreleasedReturnValue([v39 sortedArrayUsingComparator:v53]);
    }

    else
    {
      id v14 = v39;
    }

    __int128 v51 = 0u;
    __int128 v52 = 0u;
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    id obj = v14;
    id v15 = [obj countByEnumeratingWithState:&v49 objects:v63 count:16];
    id v12 = 0LL;
    if (!v15)
    {
LABEL_36:

      _Block_object_dispose(buf, 8);
      goto LABEL_37;
    }

    uint64_t v45 = *(void *)v50;
LABEL_12:
    id v46 = v15;
    id v16 = 0LL;
    id v17 = v12;
    while (1)
    {
      if (*(void *)v50 != v45) {
        objc_enumerationMutation(obj);
      }
      id v18 = *(void **)(*((void *)&v49 + 1) + 8LL * (void)v16);
      id v47 = 0LL;
      id v48 = 0LL;
      objc_msgSend(v18, "getResourceValue:forKey:error:", &v48, v10, &v47, v39);
      id v19 = v48;
      id v12 = v47;

      if (v12)
      {
        v20 = (os_log_s *)CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v55 = 136315650;
          v56 = "-[CSP2PService _compressFilesInDirectory:matchingPredicate:sortedByCreationDate:compressedFileAvailable:]";
          __int16 v57 = 2112;
          v58 = v18;
          __int16 v59 = 2112;
          id v60 = v12;
          v21 = v20;
          v22 = "%s Could not determine if [%@] is a directory or not. Err=%@";
          uint32_t v23 = 32;
LABEL_21:
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v22, v55, v23);
        }
      }

      else
      {
        if (![v19 BOOLValue])
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue([v18 path]);
          v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:](&OBJC_CLASS___NSData, "dataWithContentsOfFile:", v25));

          id v27 = [v26 length];
          id v28 = v26;
          v29 = (const uint8_t *)[v28 bytes];
          v30 = (uint8_t *)malloc((size_t)v27);
          if (v30)
          {
            v31 = v30;
            size_t v32 = compression_encode_buffer(v30, (size_t)v27, v29, (size_t)v27, 0LL, COMPRESSION_LZFSE);
            if (v32)
            {
              id v33 = (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v31, v32));
              free(v31);
              id v34 = (id)v32;
            }

            else
            {
              v36 = (os_log_s *)CSLogContextFacilityCoreSpeech;
              if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v55 = 136315650;
                v56 = "-[CSP2PService _compressFilesInDirectory:matchingPredicate:sortedByCreationDate:compressedFileAvailable:]";
                __int16 v57 = 2112;
                v58 = v18;
                __int16 v59 = 2048;
                id v60 = v27;
                _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "%s _compressFilesInDirectory: Compression failed for file %@ (%lu) - Sending Uncompressed",  v55,  0x20u);
              }

              free(v31);
              id v33 = v28;
              id v34 = v27;
            }

            v37 = (os_log_s *)CSLogContextFacilityCoreSpeech;
            if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v55 = 136315906;
              v56 = "-[CSP2PService _compressFilesInDirectory:matchingPredicate:sortedByCreationDate:compressedFileAvailable:]";
              __int16 v57 = 2112;
              v58 = v18;
              __int16 v59 = 2048;
              id v60 = v27;
              __int16 v61 = 2048;
              id v62 = v34;
              _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "%s _compressFilesInDirectory: File %@ compressed from %ld to %ld ",  v55,  0x2Au);
            }

            v38 = (void *)objc_claimAutoreleasedReturnValue([v18 path]);
            v43[2](v43, v38, v33, v27, v34, v32 != 0, 0LL);

            NSURLResourceKey v10 = NSURLIsDirectoryKey;
          }

          else
          {
            v35 = (os_log_s *)CSLogContextFacilityCoreSpeech;
            if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v55 = 136315650;
              v56 = "-[CSP2PService _compressFilesInDirectory:matchingPredicate:sortedByCreationDate:compressedFileAvailable:]";
              __int16 v57 = 2112;
              v58 = v18;
              __int16 v59 = 2048;
              id v60 = v27;
              _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "%s _compressFilesInDirectory: Malloc failed for file %@ (%lu) - Discarding",  v55,  0x20u);
            }
          }

          goto LABEL_34;
        }

        v24 = (os_log_s *)CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v55 = 136315394;
          v56 = "-[CSP2PService _compressFilesInDirectory:matchingPredicate:sortedByCreationDate:compressedFileAvailable:]";
          __int16 v57 = 2112;
          v58 = v18;
          v21 = v24;
          v22 = "%s Found dir: %@. Skipping compression";
          uint32_t v23 = 22;
          goto LABEL_21;
        }
      }

- (void)_sendVoiceTriggerGradingDataToPeerId:(id)a3
{
  id v4 = a3;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000E4664;
  v16[3] = &unk_10022CF20;
  v16[4] = self;
  dispatch_semaphore_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", v16));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 voiceTriggerAudioLogDirectory]);
  NSURLResourceKey v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v9));

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000E472C;
  v13[3] = &unk_10022CF70;
  v13[4] = self;
  id v14 = v7;
  id v15 = v4;
  id v11 = v4;
  id v12 = v7;
  -[CSP2PService _compressFilesInDirectory:matchingPredicate:compressedFileAvailable:]( self,  "_compressFilesInDirectory:matchingPredicate:compressedFileAvailable:",  v10,  v5,  v13);
}

- (void)_sendCoreSpeechGradingDataToPeerId:(id)a3
{
}

- (void)_sendCoreSpeechGradingDataToPeerId:(id)a3 forLogType:(unint64_t)a4
{
  id v6 = a3;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1000E4060;
  v18[3] = &unk_10022CF98;
  v18[4] = self;
  v18[5] = a4;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", v18));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 UUIDString]);

  NSURLResourceKey v10 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 assistantAudioFileLogDirectory]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v11));

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000E423C;
  v15[3] = &unk_10022CF70;
  v15[4] = self;
  id v16 = v9;
  id v17 = v6;
  id v13 = v6;
  id v14 = v9;
  -[CSP2PService _compressFilesInDirectory:matchingPredicate:compressedFileAvailable:]( self,  "_compressFilesInDirectory:matchingPredicate:compressedFileAvailable:",  v12,  v7,  v15);
}

- (void)_sendGeckoSpeechLogsToPeerId:(id)a3
{
  id v4 = a3;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000E3BCC;
  v16[3] = &unk_10022CF20;
  v16[4] = self;
  dispatch_semaphore_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", v16));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 geckoAudioLogDirectory]);
  NSURLResourceKey v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v9));

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000E3C3C;
  v13[3] = &unk_10022CF70;
  v13[4] = self;
  id v14 = v7;
  id v15 = v4;
  id v11 = v4;
  id v12 = v7;
  -[CSP2PService _compressFilesInDirectory:matchingPredicate:sortedByCreationDate:compressedFileAvailable:]( self,  "_compressFilesInDirectory:matchingPredicate:sortedByCreationDate:compressedFileAvailable:",  v10,  v5,  1LL,  v13);
}

- (void)_sendCoreSpeechMagusGradingDataToPeerId:(id)a3
{
  id v4 = a3;
  if (CSIsInternalBuild(v4))
  {
    dispatch_semaphore_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", &stru_10022CFD8));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);

    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 mhLogDirectory]);
    NSURLResourceKey v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v9));

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000E3518;
    v12[3] = &unk_10022CF70;
    v12[4] = self;
    id v13 = v7;
    id v14 = v4;
    id v11 = v7;
    -[CSP2PService _compressFilesInDirectory:matchingPredicate:compressedFileAvailable:]( self,  "_compressFilesInDirectory:matchingPredicate:compressedFileAvailable:",  v10,  v5,  v12);
  }
}

- (void)_sendGradingData:(id)a3 withFileName:(id)a4 toPeerId:(id)a5 withCompressedFlag:(BOOL)a6 withUncompressedDataSize:(unint64_t)a7 withBatchId:(id)a8 withRetainFileFlag:(BOOL)a9 withFilePrefix:(id)a10
{
  LOBYTE(v11) = a9;
  id v10 =  -[CSP2PService _sendGradingData:withFileName:toPeerId:withCompressedFlag:withUncompressedDataSize:withBatchId:withRetainFileFlag:withFilePrefix:withCompletion:]( self,  "_sendGradingData:withFileName:toPeerId:withCompressedFlag:withUncompressedDataSize:withBatchId:withRetainFil eFlag:withFilePrefix:withCompletion:",  a3,  a4,  a5,  a6,  a7,  a8,  v11,  a10,  0LL);
}

- (id)_sendGradingData:(id)a3 withFileName:(id)a4 toPeerId:(id)a5 withCompressedFlag:(BOOL)a6 withUncompressedDataSize:(unint64_t)a7 withBatchId:(id)a8 withRetainFileFlag:(BOOL)a9 withFilePrefix:(id)a10 withCompletion:(id)a11
{
  BOOL v53 = a6;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a8;
  id v19 = a10;
  id v20 = a11;
  if (v15 && v16 && v17)
  {
    unint64_t v51 = a7;
    __int128 v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    v21 = (void *)objc_claimAutoreleasedReturnValue([v16 stringByDeletingLastPathComponent]);
    id v52 = v18;
    __int128 v50 = v20;
    if (-[CSP2PService isInternalWithoutProfile](self, "isInternalWithoutProfile"))
    {
      v22 = (NSMutableString *)objc_claimAutoreleasedReturnValue([v16 lastPathComponent]);
    }

    else
    {
      v26 = objc_alloc(&OBJC_CLASS___NSMutableString);
      id v27 = (void *)objc_claimAutoreleasedReturnValue([v16 lastPathComponent]);
      v22 = -[NSMutableString initWithString:](v26, "initWithString:", v27);

      uint64_t v62 = 0LL;
      id v28 = -[NSRegularExpression initWithPattern:options:error:]( objc_alloc(&OBJC_CLASS___NSRegularExpression),  "initWithPattern:options:error:",  @"[a-fA-F0-9]{8}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{12}",  1LL,  &v62);
      id v30 = -[NSRegularExpression rangeOfFirstMatchInString:options:range:]( v28,  "rangeOfFirstMatchInString:options:range:",  v22,  16LL,  0LL,  -[NSMutableString length](v22, "length"));
      if (v30 != (id)0x7FFFFFFFFFFFFFFFLL || v29)
      {
        id v47 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableString substringWithRange:](v22, "substringWithRange:", v30, v29));
        v31 = v21;
        size_t v32 = (void *)objc_claimAutoreleasedReturnValue([v47 dataUsingEncoding:4]);
        id v33 = (void *)objc_claimAutoreleasedReturnValue(-[CSP2PService _sha1:](self, "_sha1:", v32));

        v21 = v31;
        -[NSRegularExpression replaceMatchesInString:options:range:withTemplate:]( v28,  "replaceMatchesInString:options:range:withTemplate:",  v22,  16LL,  0LL,  -[NSMutableString length](v22, "length"),  v33);
      }
    }

    id v48 = v21;
    id v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@%@", v19, v22));
    v35 = (void *)objc_claimAutoreleasedReturnValue([v21 stringByAppendingPathComponent:v34]);

    v65[0] = @"CSP2P_VoiceFileNameToBeGraded_Key";
    v36 = (void *)objc_claimAutoreleasedReturnValue([v35 lastPathComponent]);
    v66[0] = v36;
    v65[1] = @"CSP2P_IsDataCompressed_Key";
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v53));
    v66[1] = v37;
    v66[2] = v15;
    v65[2] = @"CSP2P_VoiceDataToBeGraded_Key";
    v65[3] = @"CSP2P_PeerIdentifier_Key";
    v66[3] = v17;
    v65[4] = @"CSP2P_UncompressedDataSize_Key";
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLong:", v51));
    v65[5] = @"CSP2P_GradingBatchTransferID_Key";
    v66[4] = v38;
    v66[5] = v52;
    id v54 = v15;
    id v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v66,  v65,  6LL));

    v63[0] = @"CSP2P_CommandType_Key";
    v63[1] = @"CSP2P_CommandDict_Key";
    v64[0] = @"com.apple.siridebug.command.transfer.voicegradingdata";
    v64[1] = v39;
    v63[2] = @"type";
    v64[2] = @"corespeech";
    id v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v64,  v63,  3LL));
    id WeakRetained = objc_loadWeakRetained((id *)&self->_adCompanionServiceProvider);
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472LL;
    v56[2] = sub_1000E31FC;
    v56[3] = &unk_10022D000;
    id v57 = v35;
    BOOL v61 = a9;
    id v58 = v16;
    id v60 = v50;
    id v42 = v49;
    id v59 = v42;
    id v43 = v35;
    [WeakRetained sendMessageWithPayload:v40 toPeer:v17 withReply:v56];

    v44 = v59;
    id v45 = v42;
    id v20 = v50;
    id v25 = v45;

    id v15 = v54;
    id v18 = v52;
  }

  else
  {
    uint32_t v23 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      v24 = @"peerId";
      if (v17) {
        v24 = @"unknown";
      }
      if (!v16) {
        v24 = @"fileName";
      }
      if (!v15) {
        v24 = @"fileData";
      }
      *(_DWORD *)buf = 136315394;
      v68 = "-[CSP2PService _sendGradingData:withFileName:toPeerId:withCompressedFlag:withUncompressedDataSize:withBatchI"
            "d:withRetainFileFlag:withFilePrefix:withCompletion:]";
      __int16 v69 = 2112;
      v70 = v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%s %@ is nil - Bailing out", buf, 0x16u);
    }

    if (!v20)
    {
      id v25 = 0LL;
      goto LABEL_22;
    }

    v22 = (NSMutableString *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"CoreSpeech",  3LL,  0LL));
    (*((void (**)(id, void, NSMutableString *))v20 + 2))(v20, 0LL, v22);
    id v25 = 0LL;
  }

LABEL_22:
  return v25;
}

- (void)_receiveParallelRecordingFromPeerId:(id)a3 recordingInfo:(id)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  if (v8 && v9)
  {
    uint64_t v11 = (void *)_IDSCopyIDForDeviceUniqueID(v8);
    if (v11)
    {
      uint64_t v12 = objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileRecordedData_Key"]);
      if (v12)
      {
        id v13 = (void *)v12;
        uint64_t v14 = objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileRemoteFileName_Key"]);
        if (v14)
        {
          id v15 = (void *)v14;
          uint64_t v16 = objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileLocale_Key"]);
          if (v16)
          {
            id v17 = (void *)v16;
            uint64_t v18 = objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileProfileId_Key"]);
            if (v18)
            {
              id v19 = (void *)v18;
              id v20 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"CSP2P_IsDataCompressed_Key"]);

              if (v20)
              {
                v21 = (void *)objc_claimAutoreleasedReturnValue( [v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileRecordedData_Key"]);
                v22 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileProfileId_Key"]);
                uint64_t v23 = objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileLocale_Key"]);
                v24 = (void *)objc_claimAutoreleasedReturnValue( -[CSP2PService _spIdSiriDebugVoiceProfileRootDirectoryForProfile:locale:]( self,  "_spIdSiriDebugVoiceProfileRootDirectoryForProfile:locale:",  v22,  v23));

                v71 = v24;
                id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 stringByAppendingPathComponent:@"remote"]);
                v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
                id v73 = 0LL;
                LOBYTE(v23) = [v26 createDirectoryAtPath:v25 withIntermediateDirectories:1 attributes:0 error:&v73];
                id v27 = v73;

                if ((v23 & 1) == 0)
                {
                  id v45 = (os_log_s *)CSLogContextFacilityCoreSpeech;
                  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315394;
                    v83 = "-[CSP2PService _receiveParallelRecordingFromPeerId:recordingInfo:withReply:]";
                    __int16 v84 = 2112;
                    size_t v85 = (size_t)v27;
                    _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "%s CSP2P_VoiceProfileParallelRecordingTransferCmd: Creating directory failed with error %@",  buf,  0x16u);
                  }

                  if (!v10)
                  {
                    id v47 = v71;
LABEL_65:

                    goto LABEL_32;
                  }

                  id v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"CoreSpeech",  4LL,  0LL));
                  v10[2](v10, 0LL, v46);
                  id v47 = v71;
LABEL_64:

                  goto LABEL_65;
                }

                id v28 = (void *)objc_claimAutoreleasedReturnValue( [v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileRemoteFileName_Key"]);
                uint64_t v29 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@_%@",  v11,  v28));

                __int16 v69 = (void *)v29;
                uint64_t v30 = objc_claimAutoreleasedReturnValue([v25 stringByAppendingPathComponent:v29]);
                v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
                v70 = (void *)v30;
                LODWORD(v30) = [v31 fileExistsAtPath:v30];

                size_t v32 = (void *)CSLogContextFacilityCoreSpeech;
                BOOL v33 = os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT);
                if ((_DWORD)v30)
                {
                  if (v33)
                  {
                    id v34 = v32;
                    v35 = (void *)objc_claimAutoreleasedReturnValue( [v9 objectForKeyedSubscript:@"CSP2P_VoiceFileNameToBeGraded_Key"]);
                    *(_DWORD *)buf = 136315650;
                    v83 = "-[CSP2PService _receiveParallelRecordingFromPeerId:recordingInfo:withReply:]";
                    __int16 v84 = 2112;
                    size_t v85 = (size_t)v35;
                    __int16 v86 = 2112;
                    id v87 = v11;
                    _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "%s Ignoring sync of existing file %@ from %@",  buf,  0x20u);
                  }

                  if (!v10)
                  {
                    id v47 = v71;
                    id v46 = v69;
LABEL_63:

                    goto LABEL_64;
                  }

                  v80 = @"CSP2P_GradingDataTransferStatus_Key";
                  v81 = &off_100238B38;
                  id v36 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v81,  &v80,  1LL));
                  ((void (**)(id, id, void *))v10)[2](v10, v36, 0LL);
LABEL_62:
                  id v47 = v71;
                  id v46 = v69;

                  goto LABEL_63;
                }

                if (v33)
                {
                  *(_DWORD *)buf = 136315650;
                  v83 = "-[CSP2PService _receiveParallelRecordingFromPeerId:recordingInfo:withReply:]";
                  __int16 v84 = 2112;
                  size_t v85 = (size_t)v69;
                  __int16 v86 = 2112;
                  id v87 = v11;
                  _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v32,  OS_LOG_TYPE_DEFAULT,  "%s Syncing parallel recorded audio file - %@ from %@",  buf,  0x20u);
                }

                id v48 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"CSP2P_IsDataCompressed_Key"]);
                unsigned __int8 v49 = [v48 BOOLValue];

                if ((v49 & 1) == 0)
                {
                  id v54 = (void *)CSLogContextFacilityCoreSpeech;
                  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
                  {
                    v55 = v54;
                    v56 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"CSP2P_PeerIdentifier_Key"]);
                    *(_DWORD *)buf = 136315650;
                    v83 = "-[CSP2PService _receiveParallelRecordingFromPeerId:recordingInfo:withReply:]";
                    __int16 v84 = 2112;
                    size_t v85 = (size_t)v70;
                    __int16 v86 = 2112;
                    id v87 = v56;
                    _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_DEFAULT,  "%s Uncompressed file %@ sent by peer %@",  buf,  0x20u);
                  }

                  id v36 = v21;
LABEL_52:
                  id v72 = v27;
                  unsigned __int8 v60 = [v36 writeToFile:v70 options:0 error:&v72];
                  id v61 = v72;

                  if ((v60 & 1) != 0)
                  {
                    if (v10)
                    {
                      v74 = @"CSP2P_VoiceProfileStatus_Key";
                      v75 = &off_100238B38;
                      uint64_t v62 = &v75;
                      v63 = &v74;
LABEL_59:
                      v65 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v62,  v63,  1LL));
                      ((void (**)(id, void *, void *))v10)[2](v10, v65, v61);
                      id v27 = v61;
LABEL_60:

                      goto LABEL_62;
                    }
                  }

                  else
                  {
                    v64 = (os_log_s *)CSLogContextFacilityCoreSpeech;
                    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 136315650;
                      v83 = "-[CSP2PService _receiveParallelRecordingFromPeerId:recordingInfo:withReply:]";
                      __int16 v84 = 2112;
                      size_t v85 = (size_t)v70;
                      __int16 v86 = 2112;
                      id v87 = v61;
                      _os_log_impl( (void *)&_mh_execute_header,  v64,  OS_LOG_TYPE_DEFAULT,  "%s Writing to file(%@) failed!. Err=%@",  buf,  0x20u);
                    }

                    if (v10)
                    {
                      v76 = @"CSP2P_VoiceProfileStatus_Key";
                      v77 = &off_100238B50;
                      uint64_t v62 = &v77;
                      v63 = &v76;
                      goto LABEL_59;
                    }
                  }

                  id v27 = v61;
                  goto LABEL_62;
                }

                size_t v50 = (size_t)[v21 length];
                src_buffer = (uint8_t *)[v21 bytes];
                unint64_t v51 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"CSP2P_UncompressedDataSize_Key"]);

                if (v51)
                {
                  id v52 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"CSP2P_UncompressedDataSize_Key"]);
                  size_t v53 = (size_t)[v52 integerValue];
                }

                else
                {
                  size_t v53 = 3 * v50;
                }

                id v57 = (uint8_t *)malloc(v53);
                if (v57)
                {
                  id v58 = v57;
                  id v59 = +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  v57,  compression_decode_buffer(v57, v53, src_buffer, v50, 0LL, COMPRESSION_LZFSE));
                  id v36 = (id)objc_claimAutoreleasedReturnValue(v59);
                  free(v58);
                  goto LABEL_52;
                }

                v66 = (os_log_s *)CSLogContextFacilityCoreSpeech;
                if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315394;
                  v83 = "-[CSP2PService _receiveParallelRecordingFromPeerId:recordingInfo:withReply:]";
                  __int16 v84 = 2048;
                  size_t v85 = v53;
                  _os_log_error_impl( (void *)&_mh_execute_header,  v66,  OS_LOG_TYPE_ERROR,  "%s ERR: Failed to allocate buffer of size %zu, bailing out",  buf,  0x16u);
                  if (v10) {
                    goto LABEL_68;
                  }
                }

                else if (v10)
                {
LABEL_68:
                  v78 = @"CSP2P_VoiceProfileStatus_Key";
                  v79 = &off_100238B50;
                  v65 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v79,  &v78,  1LL));
                  id v67 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"CoreSpeech",  10LL,  0LL));
                  ((void (**)(id, void *, void *))v10)[2](v10, v65, v67);

                  id v36 = 0LL;
                  goto LABEL_60;
                }

                id v36 = 0LL;
                goto LABEL_62;
              }

              goto LABEL_27;
            }
          }
        }
      }

- (void)_receiveVoiceGradingDataFromPeerId:(id)a3 requestInfo:(id)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, void))a5;
  if (v8 && v9)
  {
    uint64_t v11 = (void *)_IDSCopyIDForDeviceUniqueID(v8);
    if (v11)
    {
      uint64_t v12 = objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"CSP2P_VoiceDataToBeGraded_Key"]);
      if (v12)
      {
        id v13 = (void *)v12;
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"CSP2P_VoiceFileNameToBeGraded_Key"]);

        if (v14)
        {
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"CSP2P_VoiceDataToBeGraded_Key"]);
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( -[CSP2PService _spIdSiriDebugGradingDataRootDirectory]( self,  "_spIdSiriDebugGradingDataRootDirectory"));
          id v17 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"CSP2P_VoiceFileNameToBeGraded_Key"]);
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@_%@",  v11,  v17));

          uint64_t v19 = objc_claimAutoreleasedReturnValue([v16 stringByAppendingPathComponent:v18]);
          id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
          v83 = (void *)v19;
          LODWORD(v19) = [v20 fileExistsAtPath:v19];

          v21 = (void *)CSLogContextFacilityCoreSpeech;
          BOOL v22 = os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT);
          if ((_DWORD)v19)
          {
            if (v22)
            {
              uint64_t v23 = v21;
              v24 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"CSP2P_VoiceFileNameToBeGraded_Key"]);
              *(_DWORD *)buf = 136315650;
              v95 = "-[CSP2PService _receiveVoiceGradingDataFromPeerId:requestInfo:withReply:]";
              __int16 v96 = 2112;
              size_t v97 = (size_t)v24;
              __int16 v98 = 2112;
              id v99 = v11;
              _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "%s Ignoring sync of existing file %@ from %@",  buf,  0x20u);
            }

            id v25 = v83;
            if (!v10) {
              goto LABEL_67;
            }
            v82 = v18;
            v92 = @"CSP2P_GradingDataTransferStatus_Key";
            v93 = &off_100238B38;
            v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v93,  &v92,  1LL));
            v10[2](v10, v26, 0LL);
LABEL_66:

            uint64_t v18 = v82;
LABEL_67:

            goto LABEL_68;
          }

          if (v22)
          {
            *(_DWORD *)buf = 136315650;
            v95 = "-[CSP2PService _receiveVoiceGradingDataFromPeerId:requestInfo:withReply:]";
            __int16 v96 = 2112;
            size_t v97 = (size_t)v18;
            __int16 v98 = 2112;
            id v99 = v11;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v21,  OS_LOG_TYPE_DEFAULT,  "%s Syncing audio file - %@ from %@",  buf,  0x20u);
          }

          v35 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"CSP2P_IsDataCompressed_Key"]);
          unsigned __int8 v36 = [v35 BOOLValue];

          v82 = v18;
          if ((v36 & 1) == 0)
          {
            id v42 = (void *)CSLogContextFacilityCoreSpeech;
            if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v43 = v42;
              v44 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"CSP2P_PeerIdentifier_Key"]);
              *(_DWORD *)buf = 136315650;
              v95 = "-[CSP2PService _receiveVoiceGradingDataFromPeerId:requestInfo:withReply:]";
              __int16 v96 = 2112;
              size_t v97 = (size_t)v83;
              __int16 v98 = 2112;
              id v99 = v44;
              _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "%s Uncompressed file %@ sent by peer %@",  buf,  0x20u);
            }

            id v45 = v15;
            goto LABEL_36;
          }

          v79 = v16;
          size_t v37 = (size_t)[v15 length];
          v38 = (const uint8_t *)[v15 bytes];
          id v39 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"CSP2P_UncompressedDataSize_Key"]);

          if (v39)
          {
            id v40 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"CSP2P_UncompressedDataSize_Key"]);
            size_t v41 = (size_t)[v40 integerValue];
          }

          else
          {
            size_t v41 = 3 * v37;
          }

          id v46 = (uint8_t *)malloc(v41);
          if (v46)
          {
            id v47 = v46;
            id v48 = +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  v46,  compression_decode_buffer(v46, v41, v38, v37, 0LL, COMPRESSION_LZFSE));
            id v45 = (id)objc_claimAutoreleasedReturnValue(v48);
            free(v47);
            uint64_t v16 = v79;
LABEL_36:
            id v85 = 0LL;
            id v25 = v83;
            unsigned int v49 = [v45 writeToFile:v83 options:0 error:&v85];
            id v81 = v85;
            if (v49)
            {
              id v78 = v45;
              size_t v50 = (void *)objc_claimAutoreleasedReturnValue([v83 pathExtension]);
              unint64_t v51 = v83;
              unsigned int v52 = [v50 isEqualToString:@"wav"];

              if (v52)
              {
                size_t v53 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"CSP2P_VoiceFileNameToBeGraded_Key"]);
                uint64_t v77 = objc_claimAutoreleasedReturnValue( [v53 stringByReplacingOccurrencesOfString:@".wav" withString:&stru_10022F858]);

                uint64_t v76 = objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"CSP2P_GradingBatchTransferID_Key"]);
                id v54 = (void *)objc_claimAutoreleasedReturnValue([v83 lastPathComponent]);
                unsigned int v55 = [v54 containsString:@"-almost"];

                v80 = v16;
                if (v55)
                {
                  v56 = (objc_class *)v76;
                  if (v76
                    && (voiceTriggerBatchId = self->_voiceTriggerBatchId) != 0LL
                    && -[NSString isEqualToString:](voiceTriggerBatchId, "isEqualToString:", v76))
                  {
                    id v58 = (void *)v77;
                    id v59 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@.%@",  @"com.apple.siri.SiriDebug.RemoteNearMissGradingTrigger",  @"suppressnotification",  v77);
                  }

                  else
                  {
                    id v58 = (void *)v77;
                    id v59 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@",  @"com.apple.siri.SiriDebug.RemoteNearMissGradingTrigger",  v77,  v75);
                  }

                  id v67 = (void *)objc_claimAutoreleasedReturnValue(v59);
                  uint64_t v68 = 4LL;
                }

                else
                {
                  v56 = (objc_class *)v76;
                  if (v76
                    && (voiceIdentificationBatchId = self->_voiceIdentificationBatchId) != 0LL
                    && -[NSString isEqualToString:](voiceIdentificationBatchId, "isEqualToString:", v76))
                  {
                    id v58 = (void *)v77;
                    v66 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@.%@",  @"com.apple.siri.SiriDebug.SpeakerVoiceGradingTrigger",  @"suppressnotification",  v77);
                  }

                  else
                  {
                    id v58 = (void *)v77;
                    v66 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@",  @"com.apple.siri.SiriDebug.SpeakerVoiceGradingTrigger",  v77,  v75);
                  }

                  id v67 = (void *)objc_claimAutoreleasedReturnValue(v66);
                  uint64_t v68 = 5LL;
                }

                Class v69 = (&self->super.isa)[v68];
                (&self->super.isa)[v68] = v56;
                v70 = v56;

                +[CSSiriDebugConnection launchSiriDebugAppWithMessage:]( &OBJC_CLASS___CSSiriDebugConnection,  "launchSiriDebugAppWithMessage:",  v67);
                uint64_t v16 = v80;
                unint64_t v51 = v83;
              }

              v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
              id v72 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  NSFileProtectionCompleteUntilFirstUserAuthentication,  NSFileProtectionKey));
              id v84 = 0LL;
              [v71 setAttributes:v72 ofItemAtPath:v51 error:&v84];
              id v73 = v84;

              id v25 = v51;
              if (v73)
              {
                v74 = (os_log_s *)CSLogContextFacilityCoreSpeech;
                if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315650;
                  v95 = "-[CSP2PService _receiveVoiceGradingDataFromPeerId:requestInfo:withReply:]";
                  __int16 v96 = 2112;
                  size_t v97 = (size_t)v51;
                  __int16 v98 = 2112;
                  id v99 = v81;
                  _os_log_impl( (void *)&_mh_execute_header,  v74,  OS_LOG_TYPE_DEFAULT,  "%s Error setting remoteP2Plog file to NSFileProtectionCompleteUntilFirstUserAuthentication. file=%@ Err=%@",  buf,  0x20u);
                }
              }

              id v45 = v78;
              v26 = v81;
              if (!v10) {
                goto LABEL_65;
              }
            }

            else
            {
              unsigned __int8 v60 = (os_log_s *)CSLogContextFacilityCoreSpeech;
              v26 = v81;
              if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315650;
                v95 = "-[CSP2PService _receiveVoiceGradingDataFromPeerId:requestInfo:withReply:]";
                __int16 v96 = 2112;
                size_t v97 = (size_t)v83;
                __int16 v98 = 2112;
                id v99 = v81;
                _os_log_impl( (void *)&_mh_execute_header,  v60,  OS_LOG_TYPE_DEFAULT,  "%s Writing to file(%@) failed!. Err=%@",  buf,  0x20u);
              }

              if (!v10) {
                goto LABEL_65;
              }
              __int16 v88 = @"CSP2P_GradingDataTransferStatus_Key";
              id v89 = &off_100238B68;
              id v61 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v89,  &v88,  1LL));
              ((void (**)(id, void *, id))v10)[2](v10, v61, v81);
            }

            __int16 v86 = @"CSP2P_GradingDataTransferStatus_Key";
            id v87 = &off_100238B38;
            v63 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v87,  &v86,  1LL));
            ((void (**)(id, void *, void *))v10)[2](v10, v63, v26);
            goto LABEL_64;
          }

          uint64_t v62 = (os_log_s *)CSLogContextFacilityCoreSpeech;
          uint64_t v16 = v79;
          if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v95 = "-[CSP2PService _receiveVoiceGradingDataFromPeerId:requestInfo:withReply:]";
            __int16 v96 = 2048;
            size_t v97 = v41;
            _os_log_error_impl( (void *)&_mh_execute_header,  v62,  OS_LOG_TYPE_ERROR,  "%s ERR: Failed to allocate buffer of size %zu, bailing out",  buf,  0x16u);
            if (v10) {
              goto LABEL_49;
            }
          }

          else if (v10)
          {
LABEL_49:
            v90 = @"CSP2P_VoiceProfileStatus_Key";
            v91 = &off_100238B50;
            v63 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v91,  &v90,  1LL));
            v64 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"CoreSpeech",  10LL,  0LL));
            ((void (**)(id, void *, void *))v10)[2](v10, v63, v64);

            id v45 = 0LL;
            v26 = 0LL;
            id v25 = v83;
LABEL_64:

LABEL_65:
            goto LABEL_66;
          }

          id v45 = 0LL;
          v26 = 0LL;
          id v25 = v83;
          goto LABEL_65;
        }
      }

      uint64_t v30 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v95 = "-[CSP2PService _receiveVoiceGradingDataFromPeerId:requestInfo:withReply:]";
        __int16 v96 = 2112;
        size_t v97 = (size_t)v9;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "%s received malformed command - %@",  buf,  0x16u);
      }

      if (!v10) {
        goto LABEL_69;
      }
      uint64_t v31 = 3LL;
LABEL_23:
      id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"CoreSpeech",  v31,  0LL));
      ((void (**)(id, void *, void *))v10)[2](v10, 0LL, v15);
LABEL_68:

      goto LABEL_69;
    }

    size_t v32 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v33 = v32;
      id v34 = objc_retainBlock(v10);
      *(_DWORD *)buf = 136315906;
      v95 = "-[CSP2PService _receiveVoiceGradingDataFromPeerId:requestInfo:withReply:]";
      __int16 v96 = 2112;
      size_t v97 = (size_t)v8;
      __int16 v98 = 2112;
      id v99 = v9;
      __int16 v100 = 2112;
      id v101 = v34;
      _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "%s unknown IDS peer with passed Identifier %@, %@ %@",  buf,  0x2Au);
    }

    if (v10)
    {
      uint64_t v31 = 2LL;
      goto LABEL_23;
    }

    uint64_t v11 = 0LL;
LABEL_69:

    goto LABEL_70;
  }

  id v27 = (void *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    id v28 = v27;
    uint64_t v29 = objc_retainBlock(v10);
    *(_DWORD *)buf = 136315906;
    v95 = "-[CSP2PService _receiveVoiceGradingDataFromPeerId:requestInfo:withReply:]";
    __int16 v96 = 2112;
    size_t v97 = (size_t)v9;
    __int16 v98 = 2112;
    id v99 = v8;
    __int16 v100 = 2112;
    id v101 = v29;
    _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "%s received malformed command - %@ %@ %@",  buf,  0x2Au);
  }

  if (v10)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"CoreSpeech",  3LL,  0LL));
    ((void (**)(id, void *, void *))v10)[2](v10, 0LL, v11);
    goto LABEL_69;
  }

- (void)_receiveVoiceProfileFromPeerId:(id)a3 voiceProfileInfo:(id)a4 withReply:(id)a5
{
  id v8 = (uint64_t (*)(uint64_t, uint64_t))a3;
  id v9 = a4;
  id v10 = a5;
  id v101 = v8;
  if (!v8 || !v9)
  {
    uint64_t v29 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v30 = v29;
      id v31 = objc_retainBlock(v10);
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "-[CSP2PService _receiveVoiceProfileFromPeerId:voiceProfileInfo:withReply:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v9;
      *(_WORD *)&buf[22] = 2112;
      v131 = v101;
      *(_WORD *)v132 = 2112;
      *(void *)&v132[2] = v31;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "%s CSP2P_VoiceProfileTransferCmd: received malformed command - %@ %@ %@",  buf,  0x2Au);
    }

    if (v10) {
      goto LABEL_26;
    }
    goto LABEL_28;
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileData_Key"]);
  if (v11)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileFileName_Key"]);
    if (v12)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileSpeakerName_Key"]);
      if (v13)
      {
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileLocale_Key"]);
        if (v14)
        {
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileDataType_Key"]);
          if (v15)
          {
            uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileTotalSegments_Key"]);
            if (v16)
            {
              id v17 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileSegment_Key"]);

              if (v17)
              {
                uint64_t v18 = (void *)CSLogContextFacilityCoreSpeech;
                if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v19 = v18;
                  id v20 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileSegment_Key"]);
                  v21 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue( [v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileTotalSegments_Key"]);
                  *(_DWORD *)buf = 136315906;
                  *(void *)&uint8_t buf[4] = "-[CSP2PService _receiveVoiceProfileFromPeerId:voiceProfileInfo:withReply:]";
                  *(_WORD *)&buf[12] = 2112;
                  *(void *)&buf[14] = v20;
                  *(_WORD *)&buf[22] = 2112;
                  v131 = v21;
                  *(_WORD *)v132 = 2112;
                  *(void *)&v132[2] = v101;
                  _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%s CSP2P_VoiceProfileTransferCmd: Received VoiceProfile Segment (%@/%@) from peerId %@",  buf,  0x2Au);
                }

                BOOL v22 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileData_Key"]);
                size_t v23 = (size_t)[v22 length];

                id v24 = objc_claimAutoreleasedReturnValue( [v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileData_Key"]);
                id v25 = (const uint8_t *)[v24 bytes];

                v26 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"CSP2P_UncompressedDataSize_Key"]);
                if (v26)
                {
                  id v27 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"CSP2P_UncompressedDataSize_Key"]);
                  size_t v28 = (size_t)[v27 integerValue];
                }

                else
                {
                  size_t v28 = 3 * v23;
                }

                id v42 = (uint8_t *)malloc(v28);
                if (!v42)
                {
                  id v89 = (os_log_s *)CSLogContextFacilityCoreSpeech;
                  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136315394;
                    *(void *)&uint8_t buf[4] = "-[CSP2PService _receiveVoiceProfileFromPeerId:voiceProfileInfo:withReply:]";
                    *(_WORD *)&buf[12] = 2048;
                    *(void *)&buf[14] = v28;
                    _os_log_error_impl( (void *)&_mh_execute_header,  v89,  OS_LOG_TYPE_ERROR,  "%s ERR: Failed to allocate buffer of size %zu, bailing out",  buf,  0x16u);
                    if (!v10) {
                      goto LABEL_28;
                    }
                  }

                  else if (!v10)
                  {
                    goto LABEL_28;
                  }

                  v128 = @"CSP2P_VoiceProfileStatus_Key";
                  v129 = &off_100238B50;
                  size_t v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v129,  &v128,  1LL));
                  v90 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"CoreSpeech",  10LL,  0LL));
                  (*((void (**)(id, void *, void *))v10 + 2))(v10, v41, v90);

                  goto LABEL_27;
                }

                uint64_t v43 = v42;
                v44 = +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  v42,  compression_decode_buffer(v42, v28, v25, v23, 0LL, COMPRESSION_LZFSE));
                size_t v41 = (void *)objc_claimAutoreleasedReturnValue(v44);
                free(v43);
                *(void *)buf = 0LL;
                *(void *)&buf[8] = buf;
                *(void *)&buf[16] = 0x3032000000LL;
                v131 = sub_1000E2B04;
                *(void *)v132 = sub_1000E2B14;
                *(void *)&v132[8] = 0LL;
                id v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
                id v46 = (void *)objc_claimAutoreleasedReturnValue([v45 temporaryDirectory]);
                __int16 v98 = (void *)objc_claimAutoreleasedReturnValue([v46 URLByAppendingPathComponent:@"CoreSpeechCache"]);

                id v47 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileLocale_Key"]);
                id v48 = (void *)objc_claimAutoreleasedReturnValue([v98 URLByAppendingPathComponent:v47]);

                unsigned int v49 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileProfileId_Key"]);
                size_t v50 = (void *)objc_claimAutoreleasedReturnValue([v48 URLByAppendingPathComponent:v49]);

                id v99 = v50;
                unint64_t v51 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileDataType_Key"]);
                __int16 v100 = (void *)objc_claimAutoreleasedReturnValue([v99 URLByAppendingPathComponent:v51]);

                unsigned int v52 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileSegment_Key"]);
                LODWORD(v50) = [v52 integerValue] == (id)1;

                if ((_DWORD)v50)
                {
                  dword_10027FFF8 = 0;
                  size_t v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
                  id v54 = (void *)objc_claimAutoreleasedReturnValue([v100 path]);
                  uint64_t v55 = *(void *)&buf[8];
                  id obj = *(id *)(*(void *)&buf[8] + 40LL);
                  unsigned __int8 v56 = [v53 removeItemAtPath:v54 error:&obj];
                  objc_storeStrong((id *)(v55 + 40), obj);

                  if ((v56 & 1) == 0)
                  {
                    id v57 = (os_log_s *)CSLogContextFacilityCoreSpeech;
                    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
                    {
                      id v58 = (void *)objc_claimAutoreleasedReturnValue([v100 path]);
                      uint64_t v59 = *(void *)(*(void *)&buf[8] + 40LL);
                      *(_DWORD *)v122 = 136315650;
                      v123 = "-[CSP2PService _receiveVoiceProfileFromPeerId:voiceProfileInfo:withReply:]";
                      __int16 v124 = 2112;
                      v125 = v58;
                      __int16 v126 = 2112;
                      uint64_t v127 = v59;
                      _os_log_impl( (void *)&_mh_execute_header,  v57,  OS_LOG_TYPE_DEFAULT,  "%s CSP2P_VoiceProfileTransferCmd: Failed to delete the directory %@ with error %@",  v122,  0x20u);
                    }
                  }
                }

                unsigned __int8 v60 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileSegment_Key"]);
                id v61 = [v60 integerValue];
                BOOL v62 = v61 == (id)(dword_10027FFF8 + 1LL);

                if (!v62)
                {
                  v91 = (os_log_s *)CSLogContextFacilityCoreSpeech;
                  if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
                  {
                    v92 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileSegment_Key"]);
                    *(_DWORD *)v122 = 136315650;
                    v123 = "-[CSP2PService _receiveVoiceProfileFromPeerId:voiceProfileInfo:withReply:]";
                    __int16 v124 = 2112;
                    v125 = v92;
                    __int16 v126 = 1024;
                    LODWORD(v127) = dword_10027FFF8 + 1;
                    _os_log_impl( (void *)&_mh_execute_header,  v91,  OS_LOG_TYPE_DEFAULT,  "%s CSP2P_VoiceProfileTransferCmd: received VoiceProfileSegment %@, expected %d",  v122,  0x1Cu);
                  }

                  if (!v10) {
                    goto LABEL_65;
                  }
                  v120 = @"CSP2P_VoiceProfileStatus_Key";
                  v121 = &off_100238B50;
                  id v73 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v121,  &v120,  1LL));
                  id v76 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"CoreSpeech",  4LL,  0LL));
                  (*((void (**)(id, void *, id))v10 + 2))(v10, v73, v76);
                  goto LABEL_63;
                }

                v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
                v64 = (void *)objc_claimAutoreleasedReturnValue([v100 path]);
                uint64_t v65 = *(void *)&buf[8];
                id v106 = *(id *)(*(void *)&buf[8] + 40LL);
                unsigned __int8 v66 = [v63 createDirectoryAtPath:v64 withIntermediateDirectories:1 attributes:0 error:&v106];
                objc_storeStrong((id *)(v65 + 40), v106);

                if ((v66 & 1) == 0)
                {
                  v93 = (os_log_s *)CSLogContextFacilityCoreSpeech;
                  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
                  {
                    v94 = *(void **)(*(void *)&buf[8] + 40LL);
                    *(_DWORD *)v122 = 136315394;
                    v123 = "-[CSP2PService _receiveVoiceProfileFromPeerId:voiceProfileInfo:withReply:]";
                    __int16 v124 = 2112;
                    v125 = v94;
                    _os_log_impl( (void *)&_mh_execute_header,  v93,  OS_LOG_TYPE_DEFAULT,  "%s CSP2P_VoiceProfileTransferCmd: Creating directory failed with error %@",  v122,  0x16u);
                  }

                  if (!v10) {
                    goto LABEL_65;
                  }
                  v118 = @"CSP2P_VoiceProfileStatus_Key";
                  v119 = &off_100238B50;
                  id v73 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v119,  &v118,  1LL));
                  id v76 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"CoreSpeech",  4LL,  0LL));
                  (*((void (**)(id, void *, id))v10 + 2))(v10, v73, v76);
                  goto LABEL_63;
                }

                id v67 = (void *)objc_claimAutoreleasedReturnValue([v100 URLByAppendingPathComponent:@"audio"]);

                uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue([v67 path]);
                -[CSP2PService _createDirectoryIfDoesNotExist:](self, "_createDirectoryIfDoesNotExist:", v68);

                Class v69 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileFileName_Key"]);
                __int16 v100 = (void *)objc_claimAutoreleasedReturnValue([v67 URLByAppendingPathComponent:v69]);

                if (([v41 writeToURL:v100 atomically:0] & 1) == 0)
                {
                  v95 = (os_log_s *)CSLogContextFacilityCoreSpeech;
                  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)v122 = 136315138;
                    v123 = "-[CSP2PService _receiveVoiceProfileFromPeerId:voiceProfileInfo:withReply:]";
                    _os_log_impl( (void *)&_mh_execute_header,  v95,  OS_LOG_TYPE_DEFAULT,  "%s CSP2P_VoiceProfileTransferCmd: Writing to file failed!!!",  v122,  0xCu);
                  }

                  if (!v10) {
                    goto LABEL_65;
                  }
                  v116 = @"CSP2P_VoiceProfileStatus_Key";
                  v117 = &off_100238B50;
                  id v73 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v117,  &v116,  1LL));
                  id v76 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"CoreSpeech",  4LL,  0LL));
                  (*((void (**)(id, void *, id))v10 + 2))(v10, v73, v76);
                  goto LABEL_63;
                }

                ++dword_10027FFF8;
                v70 = (void *)objc_claimAutoreleasedReturnValue( [v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileTotalSegments_Key"]);
                id v71 = [v70 integerValue];
                BOOL v72 = v71 == (id)dword_10027FFF8;

                if (!v72)
                {
                  if (!v10) {
                    goto LABEL_65;
                  }
                  v108 = @"CSP2P_VoiceProfileStatus_Key";
                  v109 = &off_100238B68;
                  id v73 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v109,  &v108,  1LL));
                  (*((void (**)(id, void *, void))v10 + 2))(v10, v73, 0LL);
LABEL_64:

LABEL_65:
                  _Block_object_dispose(buf, 8);

                  goto LABEL_27;
                }

                dword_10027FFF8 = 0;
                id v73 = (void *)objc_claimAutoreleasedReturnValue( +[SSRVoiceProfileManager sharedInstance]( &OBJC_CLASS___SSRVoiceProfileManager,  "sharedInstance"));
                v74 = (void *)objc_claimAutoreleasedReturnValue( +[SSRVoiceProfileManager sharedInstance]( &OBJC_CLASS___SSRVoiceProfileManager,  "sharedInstance"));
                uint64_t v75 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileLocale_Key"]);
                id v76 = [v74 newVoiceProfileWithLocale:v75 withAppDomain:SSRSpeakerRecognitionSiriDebugAppDomain];

                id v77 = objc_alloc(&OBJC_CLASS___SSRVoiceProfileRetrainingContext);
                uint64_t v114 = SSRVoiceRetrainingVoiceProfileKey;
                id v115 = v76;
                id v78 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v115,  &v114,  1LL));
                uint64_t v79 = *(void *)&buf[8];
                id v105 = *(id *)(*(void *)&buf[8] + 40LL);
                id v80 = [v77 initWithVoiceRetrainingContext:v78 error:&v105];
                objc_storeStrong((id *)(v79 + 40), v105);

                if (*(void *)(*(void *)&buf[8] + 40LL)) {
                  goto LABEL_44;
                }
                id v81 = (void *)objc_claimAutoreleasedReturnValue([v99 URLByAppendingPathComponent:@"tdti"]);
                size_t v97 = (void *)objc_claimAutoreleasedReturnValue([v81 URLByAppendingPathComponent:@"audio"]);

                v82 = (void *)objc_claimAutoreleasedReturnValue(-[CSP2PService _getContentsOfDirectory:](self, "_getContentsOfDirectory:", v97));
                v83 = dispatch_group_create();
                dispatch_group_enter(v83);
                v102[0] = _NSConcreteStackBlock;
                v102[1] = 3221225472LL;
                v102[2] = sub_1000E31B0;
                v102[3] = &unk_10022D028;
                v104 = buf;
                id v84 = v83;
                v103 = v84;
                [v73 addUtterances:v82 toProfile:v76 withContext:v80 withCompletion:v102];
                dispatch_time_t v85 = dispatch_time(0LL, 8000000000LL);
                dispatch_group_wait(v84, v85);
                if (!*(void *)(*(void *)&buf[8] + 40LL))
                {
                  __int16 v86 = (void *)objc_claimAutoreleasedReturnValue( [v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileSpeakerName_Key"]);
                  id v87 = [v73 updateVoiceProfile:v76 withUserName:v86];
                }

                if (*(void *)(*(void *)&buf[8] + 40LL))
                {
LABEL_44:
                  if (!v10)
                  {
LABEL_47:

LABEL_63:
                    goto LABEL_64;
                  }

                  v110 = @"CSP2P_VoiceProfileStatus_Key";
                  v111 = &off_100238B50;
                  __int16 v88 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v111,  &v110,  1LL));
                  (*((void (**)(id, void *, void))v10 + 2))( v10,  v88,  *(void *)(*(void *)&buf[8] + 40LL));
                }

                else
                {
                  notify_post("com.apple.siri.corespeech.voiceprofilelist.change");
                  if (!v10) {
                    goto LABEL_47;
                  }
                  v112[0] = @"CSP2P_VoiceProfileStatus_Key";
                  v112[1] = @"CSP2P_VoiceProfileProfileId_Key";
                  v113[0] = &off_100238B38;
                  __int16 v88 = (void *)objc_claimAutoreleasedReturnValue([v76 profileID]);
                  v113[1] = v88;
                  __int16 v96 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v113,  v112,  2LL));
                  (*((void (**)(id, void *, void))v10 + 2))(v10, v96, 0LL);
                }

                goto LABEL_47;
              }

              goto LABEL_23;
            }
          }
        }
      }
    }
  }

- (void)_processVoiceProfileDeleteCommandWithRequest:(id)a3 fromSenderID:(id)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E2CFC;
  block[3] = &unk_10022E7D0;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, block);
}

- (void)_processGradingDataFetchCommandWithRequest:(id)a3 fromSenderID:(id)a4 withReply:(id)a5
{
}

- (void)_processGradingDataFetchCommandWithRequest:(id)a3 ofLogType:(unint64_t)a4 fromSenderID:(id)a5 withReply:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_adCompanionServiceProvider);

  if (WeakRetained)
  {
    if (v10) {
      (*((void (**)(id, void, void))v10 + 2))(v10, 0LL, 0LL);
    }
    switch(a4)
    {
      case 0uLL:
        -[CSP2PService _sendVoiceTriggerGradingDataToPeerId:](self, "_sendVoiceTriggerGradingDataToPeerId:", v9);
        -[CSP2PService _sendCoreSpeechGradingDataToPeerId:](self, "_sendCoreSpeechGradingDataToPeerId:", v9);
        -[CSP2PService _sendCoreSpeechMagusGradingDataToPeerId:](self, "_sendCoreSpeechMagusGradingDataToPeerId:", v9);
        -[CSP2PService _sendAcousticGradingDataToPeerId:](self, "_sendAcousticGradingDataToPeerId:", v9);
        goto LABEL_6;
      case 1uLL:
        -[CSP2PService _sendVoiceTriggerGradingDataToPeerId:](self, "_sendVoiceTriggerGradingDataToPeerId:", v9);
        break;
      case 2uLL:
        -[CSP2PService _sendCoreSpeechGradingDataToPeerId:](self, "_sendCoreSpeechGradingDataToPeerId:", v9);
        break;
      case 3uLL:
        -[CSP2PService _sendCoreSpeechMagusGradingDataToPeerId:](self, "_sendCoreSpeechMagusGradingDataToPeerId:", v9);
        break;
      case 4uLL:
        -[CSP2PService _sendAcousticGradingDataToPeerId:](self, "_sendAcousticGradingDataToPeerId:", v9);
        break;
      case 5uLL:
LABEL_6:
        -[CSP2PService _sendGeckoSpeechLogsToPeerId:](self, "_sendGeckoSpeechLogsToPeerId:", v9);
        break;
      case 6uLL:
        id v14 = self;
        id v15 = v9;
        uint64_t v16 = 1LL;
        goto LABEL_19;
      case 7uLL:
        id v14 = self;
        id v15 = v9;
        uint64_t v16 = 2LL;
        goto LABEL_19;
      case 8uLL:
        goto LABEL_18;
      case 9uLL:
        -[CSP2PService _sendVoiceTriggerGradingDataToPeerId:](self, "_sendVoiceTriggerGradingDataToPeerId:", v9);
LABEL_18:
        id v14 = self;
        id v15 = v9;
        uint64_t v16 = 3LL;
LABEL_19:
        -[CSP2PService _sendCoreSpeechGradingDataToPeerId:forLogType:]( v14,  "_sendCoreSpeechGradingDataToPeerId:forLogType:",  v15,  v16);
        break;
      default:
        break;
    }
  }

  else
  {
    id v12 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315138;
      id v18 = "-[CSP2PService _processGradingDataFetchCommandWithRequest:ofLogType:fromSenderID:withReply:]";
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%s Cannot send data across when _adCompanionServiceProvider is nil - returning",  (uint8_t *)&v17,  0xCu);
    }

    if (v10)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"CoreSpeech",  3LL,  0LL));
      (*((void (**)(id, void, void *))v10 + 2))(v10, 0LL, v13);
    }
  }
}

- (void)_processVoiceProfileListQueryCommandFromPeerId:(id)a3 requestInfo:(id)a4 withReply:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void, void *))a5;
  if ((CSIsHorseman(v9, v10) & 1) == 0)
  {
    v44 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v68 = "-[CSP2PService _processVoiceProfileListQueryCommandFromPeerId:requestInfo:withReply:]";
      __int16 v69 = 2112;
      id v70 = v7;
      _os_log_error_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_ERROR,  "%s ERR: Rejecting command %@ sent to non Horseman device",  buf,  0x16u);
      if (!v9) {
        goto LABEL_49;
      }
    }

    else if (!v9)
    {
      goto LABEL_49;
    }

    uint64_t v45 = 2LL;
LABEL_39:
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"CoreSpeech",  v45,  0LL));
    v9[2](v9, 0LL, v11);
    goto LABEL_48;
  }

  if (!v7 || !v8)
  {
    id v46 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v68 = "-[CSP2PService _processVoiceProfileListQueryCommandFromPeerId:requestInfo:withReply:]";
      __int16 v69 = 2112;
      id v70 = v7;
      __int16 v71 = 2112;
      id v72 = v8;
      _os_log_error_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_ERROR,  "%s ERR: received malformed command - %@ %@",  buf,  0x20u);
      if (!v9) {
        goto LABEL_49;
      }
    }

    else if (!v9)
    {
      goto LABEL_49;
    }

    uint64_t v45 = 3LL;
    goto LABEL_39;
  }

  uint64_t v11 = (void *)_IDSCopyIDForDeviceUniqueID(v7);
  if (!v11)
  {
    id v47 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      size_t v50 = v47;
      unint64_t v51 = objc_retainBlock(v9);
      *(_DWORD *)buf = 136315906;
      uint64_t v68 = "-[CSP2PService _processVoiceProfileListQueryCommandFromPeerId:requestInfo:withReply:]";
      __int16 v69 = 2112;
      id v70 = v7;
      __int16 v71 = 2112;
      id v72 = v51;
      __int16 v73 = 2112;
      id v74 = v8;
      _os_log_error_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_ERROR,  "%s ERR: unknown IDS peer with passed Identifier %@, %@ %@",  buf,  0x2Au);

      if (v9) {
        goto LABEL_42;
      }
    }

    else if (v9)
    {
LABEL_42:
      uint64_t v48 = 2LL;
      goto LABEL_46;
    }

    uint64_t v11 = 0LL;
    goto LABEL_48;
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"CSP2P_VoiceProfileLocale_Key"]);

  if (!v12)
  {
    unsigned int v49 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v68 = "-[CSP2PService _processVoiceProfileListQueryCommandFromPeerId:requestInfo:withReply:]";
      __int16 v69 = 2112;
      id v70 = v8;
      _os_log_error_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_ERROR,  "%s ERR: received malformed command with locale nil - %@",  buf,  0x16u);
      if (!v9) {
        goto LABEL_48;
      }
    }

    else if (!v9)
    {
      goto LABEL_48;
    }

    uint64_t v48 = 3LL;
LABEL_46:
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"CoreSpeech",  v48,  0LL));
    v9[2](v9, 0LL, v13);
    goto LABEL_47;
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"CSP2P_VoiceProfileLocale_Key"]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[SSRVoiceProfileManager sharedInstance](&OBJC_CLASS___SSRVoiceProfileManager, "sharedInstance"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 provisionedVoiceProfilesForLocale:v13]);

  if (!v9) {
    goto LABEL_32;
  }
  size_t v53 = v13;
  id v54 = v11;
  uint64_t v55 = v9;
  id v56 = v8;
  id v57 = v7;
  uint64_t v16 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v62 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  unsigned int v52 = v15;
  id v17 = v15;
  id v18 = [v17 countByEnumeratingWithState:&v62 objects:v66 count:16];
  if (!v18) {
    goto LABEL_31;
  }
  id v19 = v18;
  uint64_t v20 = *(void *)v63;
  uint64_t v59 = SSRSpeakerRecognitionSiriAppDomain;
  do
  {
    for (i = 0LL; i != v19; i = (char *)i + 1)
    {
      if (*(void *)v63 != v20) {
        objc_enumerationMutation(v17);
      }
      BOOL v22 = *(void **)(*((void *)&v62 + 1) + 8LL * (void)i);
      size_t v23 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      id v24 = (void *)objc_claimAutoreleasedReturnValue([v22 sharedSiriId]);

      if (v24)
      {
        id v25 = (void *)objc_claimAutoreleasedReturnValue([v22 sharedSiriId]);
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v23,  "setObject:forKeyedSubscript:",  v25,  @"CSP2P_VoiceProfileSiriProfileId_Key");
      }

      v26 = (void *)objc_claimAutoreleasedReturnValue([v22 profileId]);

      if (v26)
      {
        id v27 = (void *)objc_claimAutoreleasedReturnValue([v22 profileId]);
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v23,  "setObject:forKeyedSubscript:",  v27,  @"CSP2P_VoiceProfileProfileId_Key");
      }

      size_t v28 = (void *)objc_claimAutoreleasedReturnValue([v22 appDomain]);

      if (v28)
      {
        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v22 appDomain]);
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v23,  "setObject:forKeyedSubscript:",  v29,  @"CSP2P_VoiceProfileAppDomain_Key");
      }

      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v22 dateAdded]);

      if (v30)
      {
        id v31 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
        -[NSDateFormatter setDateFormat:](v31, "setDateFormat:", @"yyyyMMddHHmmss");
        size_t v32 = (void *)objc_claimAutoreleasedReturnValue([v22 dateAdded]);
        BOOL v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v31, "stringFromDate:", v32));
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v23,  "setObject:forKeyedSubscript:",  v33,  @"CSP2P_VoiceProfileOnboardTimeStamp_Key");
      }

      id v34 = (void *)objc_claimAutoreleasedReturnValue([v22 homeId]);

      if (v34)
      {
        v35 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([v22 homeId]);
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v23,  "setObject:forKeyedSubscript:",  v35,  @"CSP2P_VoiceProfileHomeUserId_Key");
      }

      else
      {
        unsigned __int8 v36 = (void *)objc_claimAutoreleasedReturnValue([v22 appDomain]);
        unsigned int v37 = [v36 isEqualToString:v59];

        if (!v37) {
          goto LABEL_25;
        }
        v38 = (void *)objc_claimAutoreleasedReturnValue([v22 sharedSiriId]);
        v60[0] = _NSConcreteStackBlock;
        v60[1] = 3221225472LL;
        v60[2] = sub_1000E2CE0;
        v60[3] = &unk_10022D050;
        id v61 = v23;
        -[CSP2PService _getHomeUserIdForSharedSiriId:withCompletion:]( self,  "_getHomeUserIdForSharedSiriId:withCompletion:",  v38,  v60);

        v35 = v61;
      }

LABEL_25:
      id v39 = (void *)objc_claimAutoreleasedReturnValue([v22 userName]);

      if (v39)
      {
        id v40 = (void *)objc_claimAutoreleasedReturnValue([v22 userName]);
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v23,  "setObject:forKeyedSubscript:",  v40,  @"CSP2P_VoiceProfileSpeakerName_Key");
      }

      size_t v41 = (void *)objc_claimAutoreleasedReturnValue([v22 languageCode]);

      if (v41)
      {
        id v42 = (void *)objc_claimAutoreleasedReturnValue([v22 languageCode]);
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v23,  "setObject:forKeyedSubscript:",  v42,  @"CSP2P_VoiceProfileLocale_Key");
      }

      -[NSMutableArray addObject:](v16, "addObject:", v23);
    }

    id v19 = [v17 countByEnumeratingWithState:&v62 objects:v66 count:16];
  }

  while (v19);
LABEL_31:

  uint64_t v43 = -[NSDictionary initWithObjectsAndKeys:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithObjectsAndKeys:",  v16,  @"voiceprofiles",  0LL);
  id v9 = v55;
  ((void (**)(id, NSDictionary *, void *))v55)[2](v55, v43, 0LL);

  id v8 = v56;
  id v7 = v57;
  id v13 = v53;
  uint64_t v11 = v54;
  id v15 = v52;
LABEL_32:

LABEL_47:
LABEL_48:

LABEL_49:
}

- (void)_getHomeUserIdForSharedSiriId:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v27 = 0LL;
  size_t v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  uint64_t v30 = sub_1000E2B04;
  id v31 = sub_1000E2B14;
  id v32 = 0LL;
  id v7 = objc_alloc_init(&OBJC_CLASS___CSDispatchGroup);
  id v8 = objc_alloc_init(&OBJC_CLASS___AFMultiUserConnection);
  id v9 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    unsigned __int8 v36 = "-[CSP2PService _getHomeUserIdForSharedSiriId:withCompletion:]";
    __int16 v37 = 2114;
    id v38 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s Fetching homeUserId for siriProfileId %{public}@",  buf,  0x16u);
  }

  [v7 enter];
  id v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472LL;
  uint64_t v20 = sub_1000E2B1C;
  v21 = &unk_10022D078;
  id v10 = v8;
  id v22 = v10;
  v26 = &v27;
  id v11 = v5;
  id v23 = v11;
  id v12 = v7;
  id v24 = v12;
  id v13 = v6;
  id v25 = v13;
  [v10 getHomeUserIdForSharedUserId:v11 completion:&v18];
  if (objc_msgSend(v12, "waitWithTimeout:", dispatch_time(0, 100000000)))
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"homeUserId query for siriProfileId %@ timedout !",  v11,  v18,  v19,  v20,  v21,  v22,  v23,  v24));
    NSErrorUserInfoKey v33 = NSLocalizedDescriptionKey;
    id v34 = v14;
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v34,  &v33,  1LL));
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  CSErrorDomain,  701LL,  v15));

    id v17 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      unsigned __int8 v36 = "-[CSP2PService _getHomeUserIdForSharedSiriId:withCompletion:]";
      __int16 v37 = 2112;
      id v38 = v14;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s ERR: %@", buf, 0x16u);
      if (!v13) {
        goto LABEL_7;
      }
    }

    else if (!v13)
    {
LABEL_7:

      goto LABEL_8;
    }

    (*((void (**)(id, uint64_t, void *))v13 + 2))(v13, v28[5], v16);
    goto LABEL_7;
  }

- (void)_processFetchVoiceProfileCommandFromPeerId:(id)a3 requestInfo:(id)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_adCompanionServiceProvider);

  if (!WeakRetained)
  {
    uint64_t v20 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v32 = 136315138;
      *(void *)&v32[4] = "-[CSP2PService _processFetchVoiceProfileCommandFromPeerId:requestInfo:withReply:]";
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "%s Cannot send data across when _adCompanionServiceProvider is nil - returning",  v32,  0xCu);
    }

    if (!v10) {
      goto LABEL_24;
    }
    uint64_t v21 = 9LL;
LABEL_22:
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"CoreSpeech",  v21,  0LL));
    v10[2](v10, 0LL, v14);
    goto LABEL_23;
  }

  if ((CSIsHorseman(v12, v13) & 1) == 0)
  {
    id v22 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id v32 = 136315394;
      *(void *)&v32[4] = "-[CSP2PService _processFetchVoiceProfileCommandFromPeerId:requestInfo:withReply:]";
      *(_WORD *)&v32[12] = 2112;
      *(void *)&v32[14] = v8;
      _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "%s ERR: Rejecting command %@ sent to non Horseman device",  v32,  0x16u);
      if (!v10) {
        goto LABEL_24;
      }
    }

    else if (!v10)
    {
      goto LABEL_24;
    }

    uint64_t v21 = 2LL;
    goto LABEL_22;
  }

  if (v8 && v9)
  {
    id v14 = (void *)_IDSCopyIDForDeviceUniqueID(v8);
    if (v14)
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileLocale_Key"]);

      if (v15)
      {
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileProfileId_Key"]);

        if (v16)
        {
          id v17 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileProfileId_Key"]);
          id v18 = (void *)objc_claimAutoreleasedReturnValue( +[SSRVoiceProfileManager sharedInstance]( &OBJC_CLASS___SSRVoiceProfileManager,  "sharedInstance"));
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 voiceProfileForId:v17]);
          if (v19)
          {
            if (v10) {
              v10[2](v10, 0LL, 0LL);
            }
            -[CSP2PService _sendVoiceProfile:toPeerId:](self, "_sendVoiceProfile:toPeerId:", v19, v8);
            goto LABEL_39;
          }

          size_t v28 = (os_log_s *)CSLogContextFacilityCoreSpeech;
          if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)id v32 = 136315394;
            *(void *)&v32[4] = "-[CSP2PService _processFetchVoiceProfileCommandFromPeerId:requestInfo:withReply:]";
            *(_WORD *)&v32[12] = 2112;
            *(void *)&v32[14] = v17;
            _os_log_error_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "%s ERR: Failed to find voice profile with identifier - %@",  v32,  0x16u);
            if (!v10) {
              goto LABEL_39;
            }
          }

          else if (!v10)
          {
LABEL_39:

            goto LABEL_40;
          }

          uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"CoreSpeech",  11LL,  0LL));
          v10[2](v10, 0LL, v29);

          goto LABEL_39;
        }

        v26 = (os_log_s *)CSLogContextFacilityCoreSpeech;
        if (!os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
LABEL_31:
          if (v10)
          {
LABEL_32:
            uint64_t v25 = 3LL;
            goto LABEL_33;
          }

- (void)_sendVoiceProfile:(id)a3 toPeerId:(id)a4
{
  id v6 = a3;
  id v52 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 baseDir]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 stringByAppendingPathComponent:@"Caches/VoiceTrigger/SATUpdate"]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 siriProfileId]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"_%d_%d_%@",  2LL,  1LL,  v10));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 stringByAppendingString:v11]);

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 locale]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 stringByAppendingPathComponent:v13]);

  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v65 = 0LL;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 contentsOfDirectoryAtPath:v14 error:&v65]);
  id v17 = v65;

  if (!v17 && [v16 count]) {
    goto LABEL_24;
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue([v6 siriProfileId]);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"_%d_%d_%@",  5LL,  1LL,  v18));
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v9 stringByAppendingString:v19]);

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v6 locale]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v20 stringByAppendingPathComponent:v21]);

  id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v64 = 0LL;
  uint64_t v23 = objc_claimAutoreleasedReturnValue([v22 contentsOfDirectoryAtPath:v14 error:&v64]);
  id v24 = v64;

  uint64_t v16 = (void *)v23;
  if (!v24)
  {
LABEL_24:
    if ([v16 count])
    {
      uint64_t v48 = v16;
      unsigned int v49 = v9;
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v14 stringByAppendingPathComponent:@"td/audio"]);
      v26 = (void *)objc_claimAutoreleasedReturnValue([v14 stringByAppendingPathComponent:@"tdti/audio"]);
      uint64_t v27 = objc_claimAutoreleasedReturnValue([v14 stringByAppendingPathComponent:@"ti/audio"]);
      v69[0] = v14;
      v69[1] = v25;
      v69[2] = v26;
      v69[3] = v27;
      id v47 = (void *)v27;
      size_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v69, 4LL));
      v63[0] = _NSConcreteStackBlock;
      v63[1] = 3221225472LL;
      v63[2] = sub_1000E2308;
      void v63[3] = &unk_10022CF20;
      v63[4] = self;
      unint64_t v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", v63));
      uint64_t v29 = (void *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v30 = v29;
        id v31 = (void *)objc_claimAutoreleasedReturnValue([v6 profileID]);
        *(_DWORD *)buf = 136315394;
        __int16 v71 = "-[CSP2PService _sendVoiceProfile:toPeerId:]";
        __int16 v72 = 2114;
        __int16 v73 = v31;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "%s CSP2P_VoiceProfileFetchCmd: Transferring voice profile %{public}@",  buf,  0x16u);
      }

      __int128 v61 = 0u;
      __int128 v62 = 0u;
      __int128 v59 = 0u;
      __int128 v60 = 0u;
      id obj = v28;
      id v32 = [obj countByEnumeratingWithState:&v59 objects:v68 count:16];
      if (v32)
      {
        id v33 = v32;
        uint64_t v34 = *(void *)v60;
        do
        {
          for (i = 0LL; i != v33; i = (char *)i + 1)
          {
            if (*(void *)v60 != v34) {
              objc_enumerationMutation(obj);
            }
            uint64_t v36 = *(void *)(*((void *)&v59 + 1) + 8LL * (void)i);
            __int16 v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v36));
            v55[0] = _NSConcreteStackBlock;
            v55[1] = 3221225472LL;
            v55[2] = sub_1000E23B8;
            v55[3] = &unk_10022D0C8;
            uint8_t v55[4] = v36;
            id v56 = v6;
            id v57 = v52;
            id v58 = self;
            -[CSP2PService _compressFilesInDirectory:matchingPredicate:compressedFileAvailable:]( self,  "_compressFilesInDirectory:matchingPredicate:compressedFileAvailable:",  v37,  v51,  v55);
          }

          id v33 = [obj countByEnumeratingWithState:&v59 objects:v68 count:16];
        }

        while (v33);
      }

      id v38 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
      id v39 = (void *)objc_claimAutoreleasedReturnValue([v6 profileID]);
      id v40 = (void *)objc_claimAutoreleasedReturnValue([v6 locale]);
      size_t v41 = -[NSMutableDictionary initWithObjectsAndKeys:]( v38,  "initWithObjectsAndKeys:",  v52,  @"CSP2P_PeerIdentifier_Key",  v39,  @"CSP2P_VoiceProfileProfileId_Key",  v40,  @"CSP2P_VoiceProfileLocale_Key",  &__kCFBooleanTrue,  @"CSP2P_VoiceProfileTransferCompleted_Key",  0LL);

      v66[0] = @"CSP2P_CommandType_Key";
      v66[1] = @"CSP2P_CommandDict_Key";
      v67[0] = @"com.apple.siridebug.command.reverse.transfer.voiceprofile";
      v67[1] = v41;
      v66[2] = @"type";
      v67[2] = @"corespeech";
      id v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v67,  v66,  3LL));
      uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue([v6 siriProfileId]);

      if (v43)
      {
        v44 = (void *)objc_claimAutoreleasedReturnValue([v6 siriProfileId]);
        -[NSMutableDictionary setObject:forKey:]( v41,  "setObject:forKey:",  v44,  @"CSP2P_VoiceProfileSiriProfileId_Key");
      }

      id WeakRetained = objc_loadWeakRetained((id *)&self->_adCompanionServiceProvider);
      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472LL;
      v53[2] = sub_1000E2860;
      v53[3] = &unk_10022D0A0;
      id v54 = v6;
      [WeakRetained sendMessageWithPayload:v42 toPeer:v52 withReply:v53];

      id v24 = 0LL;
      id v9 = v49;
      uint64_t v16 = v48;
      goto LABEL_21;
    }

    id v24 = 0LL;
  }

  id v46 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v71 = "-[CSP2PService _sendVoiceProfile:toPeerId:]";
    __int16 v72 = 2112;
    __int16 v73 = v14;
    __int16 v74 = 2112;
    id v75 = v24;
    _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "%s Cannot read contents of directory: %@, err: %@",  buf,  0x20u);
  }

- (void)_processReverseTransferVoiceProfileCommandFromPeerId:(id)a3 requestInfo:(id)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!CSIsHorseman(v10, v11))
  {
    if (!v8 || !v9)
    {
      id v17 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        dispatch_time_t v85 = "-[CSP2PService _processReverseTransferVoiceProfileCommandFromPeerId:requestInfo:withReply:]";
        __int16 v86 = 2112;
        size_t v87 = (size_t)v8;
        __int16 v88 = 2112;
        id v89 = v9;
        _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%s ERR: received malformed command - %@ %@",  buf,  0x20u);
        if (!v10) {
          goto LABEL_77;
        }
      }

      else if (!v10)
      {
        goto LABEL_77;
      }

      uint64_t v13 = 3LL;
      goto LABEL_14;
    }

    id v14 = (void *)_IDSCopyIDForDeviceUniqueID(v8);
    if (v14)
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileLocale_Key"]);

      if (v15)
      {
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileProfileId_Key"]);
        if (v16)
        {

          goto LABEL_23;
        }

        id v22 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileSiriProfileId_Key"]);

        if (v22)
        {
LABEL_23:
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileLocale_Key"]);
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileProfileId_Key"]);
          if (!v23) {
            uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileSiriProfileId_Key"]);
          }
          id v24 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileTransferCompleted_Key"]);
          unsigned int v25 = [v24 BOOLValue];

          if (v25)
          {
            v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@.%@",  @"com.apple.siri.SiriDebug.VoiceProfileAddedTrigger",  v23,  v21));
            +[CSSiriDebugConnection launchSiriDebugAppWithMessage:]( &OBJC_CLASS___CSSiriDebugConnection,  "launchSiriDebugAppWithMessage:",  v26);
            if (v10) {
              (*((void (**)(id, void, void))v10 + 2))(v10, 0LL, 0LL);
            }
            goto LABEL_38;
          }

          uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileRelativeFilePath_Key"]);

          if (!v27)
          {
            id v40 = (os_log_s *)CSLogContextFacilityCoreSpeech;
            if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              dispatch_time_t v85 = "-[CSP2PService _processReverseTransferVoiceProfileCommandFromPeerId:requestInfo:withReply:]";
              __int16 v86 = 2112;
              size_t v87 = (size_t)v9;
              _os_log_error_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_ERROR,  "%s ERR: received malformed command with relative path nil - %@",  buf,  0x16u);
              if (!v10) {
                goto LABEL_74;
              }
            }

            else if (!v10)
            {
LABEL_74:

              goto LABEL_75;
            }

            v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"CoreSpeech",  3LL,  0LL));
            (*((void (**)(id, void, void *))v10 + 2))(v10, 0LL, v26);
LABEL_38:

            goto LABEL_74;
          }

          uint64_t v28 = objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileRelativeFilePath_Key"]);
          __int16 v72 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"CSP2P_VoiceProfileData_Key"]);
          __int16 v73 = v23;
          __int16 v74 = (void *)objc_claimAutoreleasedReturnValue( -[CSP2PService _spIdSiriDebugVoiceProfileCacheDirectoryForProfile:locale:]( self,  "_spIdSiriDebugVoiceProfileCacheDirectoryForProfile:locale:",  v23,  v21));
          __int16 v71 = (void *)v28;
          uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v74 stringByAppendingPathComponent:v28]);
          uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
          id v31 = (void *)objc_claimAutoreleasedReturnValue([v29 stringByDeletingLastPathComponent]);
          id v77 = 0LL;
          LOBYTE(v28) = [v30 createDirectoryAtPath:v31 withIntermediateDirectories:1 attributes:0 error:&v77];
          id v75 = v77;

          if ((v28 & 1) == 0)
          {
            uint64_t v34 = v29;
            id v42 = (os_log_s *)CSLogContextFacilityCoreSpeech;
            uint64_t v36 = v75;
            if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              dispatch_time_t v85 = "-[CSP2PService _processReverseTransferVoiceProfileCommandFromPeerId:requestInfo:withReply:]";
              __int16 v86 = 2112;
              size_t v87 = (size_t)v75;
              __int16 v37 = "%s CSP2P_VoiceProfileParallelRecordingTransferCmd: Creating directory failed with error %@";
              id v38 = v42;
              uint32_t v39 = 22;
              goto LABEL_45;
            }

- (void)_processVoiceProfileUpdateTriggerFromPeerId:(id)a3 requestInfo:(id)a4 withReply:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!CSIsHorseman(v9, v10))
  {
    if (!v7 || !v8)
    {
      uint64_t v20 = (os_log_s *)CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v27 = "-[CSP2PService _processVoiceProfileUpdateTriggerFromPeerId:requestInfo:withReply:]";
        __int16 v28 = 2112;
        id v29 = v7;
        __int16 v30 = 2112;
        id v31 = v8;
        _os_log_error_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "%s ERR: received malformed command - %@ %@",  buf,  0x20u);
        if (!v9) {
          goto LABEL_26;
        }
      }

      else if (!v9)
      {
        goto LABEL_26;
      }

      uint64_t v12 = 3LL;
      goto LABEL_16;
    }

    uint64_t v13 = _IDSCopyIDForDeviceUniqueID(v7);
    if (v13)
    {
      id v14 = (void *)v13;
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"CSP2P_VoiceProfileLocale_Key"]);

      if (v15)
      {
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"CSP2P_VoiceProfileLocale_Key"]);
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"CSP2P_VoiceProfileTransferCompleted_Key"]);
        unsigned int v18 = [v17 BOOLValue];

        if (v18)
        {
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@.%@",  @"com.apple.siri.SiriDebug.VoiceProfileSyncTrigger",  v14,  v16));
          +[CSSiriDebugConnection launchSiriDebugAppWithMessage:]( &OBJC_CLASS___CSSiriDebugConnection,  "launchSiriDebugAppWithMessage:",  v19);
        }

        if (v9) {
          (*((void (**)(id, void, void))v9 + 2))(v9, 0LL, 0LL);
        }
      }

      else
      {
        uint64_t v23 = (os_log_s *)CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          uint64_t v27 = "-[CSP2PService _processVoiceProfileUpdateTriggerFromPeerId:requestInfo:withReply:]";
          __int16 v28 = 2112;
          id v29 = v8;
          _os_log_error_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "%s ERR: received malformed command with locale nil - %@",  buf,  0x16u);
          if (!v9) {
            goto LABEL_25;
          }
        }

        else if (!v9)
        {
          goto LABEL_25;
        }

        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"CoreSpeech",  3LL,  0LL));
        (*((void (**)(id, void, void *))v9 + 2))(v9, 0LL, v16);
      }

      goto LABEL_25;
    }

    uint64_t v21 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      id v24 = v21;
      id v25 = objc_retainBlock(v9);
      *(_DWORD *)buf = 136315906;
      uint64_t v27 = "-[CSP2PService _processVoiceProfileUpdateTriggerFromPeerId:requestInfo:withReply:]";
      __int16 v28 = 2112;
      id v29 = v7;
      __int16 v30 = 2112;
      id v31 = v25;
      __int16 v32 = 2112;
      id v33 = v8;
      _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "%s ERR: unknown IDS peer with passed Identifier %@, %@ %@",  buf,  0x2Au);

      if (!v9) {
        goto LABEL_20;
      }
    }

    else if (!v9)
    {
LABEL_20:
      id v14 = 0LL;
      goto LABEL_25;
    }

    id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"CoreSpeech",  2LL,  0LL));
    (*((void (**)(id, void, void *))v9 + 2))(v9, 0LL, v22);

    goto LABEL_20;
  }

  uint64_t v11 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v27 = "-[CSP2PService _processVoiceProfileUpdateTriggerFromPeerId:requestInfo:withReply:]";
    __int16 v28 = 2112;
    id v29 = v7;
    _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%s ERR: Rejecting command %@ sent to Horseman device",  buf,  0x16u);
    if (!v9) {
      goto LABEL_26;
    }
    goto LABEL_4;
  }

  if (v9)
  {
LABEL_4:
    uint64_t v12 = 2LL;
LABEL_16:
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"CoreSpeech",  v12,  0LL));
    (*((void (**)(id, void, void *))v9 + 2))(v9, 0LL, v14);
LABEL_25:
  }

- (void)_sendVoiceProfileUpdateTriggerToPeerId:(id)a3 forLocale:(id)a4
{
  id v6 = a3;
  v16[0] = @"CSP2P_PeerIdentifier_Key";
  v16[1] = @"CSP2P_VoiceProfileLocale_Key";
  v17[0] = v6;
  v17[1] = a4;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v17,  v16,  2LL));
  v14[0] = @"CSP2P_CommandType_Key";
  v14[1] = @"CSP2P_CommandDict_Key";
  v15[0] = @"com.apple.siridebug.command.voiceprofile.update.trigger";
  v15[1] = v8;
  v14[2] = @"type";
  v15[2] = @"corespeech";
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  3LL));
  id WeakRetained = objc_loadWeakRetained((id *)&self->_adCompanionServiceProvider);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000E2220;
  v12[3] = &unk_10022D0A0;
  id v13 = v6;
  id v11 = v6;
  [WeakRetained sendMessageWithPayload:v9 toPeer:v11 withReply:v12];
}

- (void)_sendAcousticGradingDataToPeerId:(id)a3
{
  id v4 = a3;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  void v16[2] = sub_1000E1C84;
  v16[3] = &unk_10022CF20;
  v16[4] = self;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", v16));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 assistantAudioFileLogDirectory]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v9));

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000E1DF8;
  v13[3] = &unk_10022CF70;
  v13[4] = self;
  id v14 = v7;
  id v15 = v4;
  id v11 = v4;
  id v12 = v7;
  -[CSP2PService _compressFilesInDirectory:matchingPredicate:compressedFileAvailable:]( self,  "_compressFilesInDirectory:matchingPredicate:compressedFileAvailable:",  v10,  v5,  v13);
}

- (id)_speakerRecognitionAudioLogsGradingDir
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E1BD8;
  block[3] = &unk_10022F100;
  void block[4] = self;
  if (qword_100280008 != -1) {
    dispatch_once(&qword_100280008, block);
  }
  return (id)qword_100280000;
}

- (void)_createDirectoryIfDoesNotExist:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v5 = v4;
  char v17 = 0;
  if (v3)
  {
    unsigned int v6 = [v4 fileExistsAtPath:v3 isDirectory:&v17];
    if (v6) {
      BOOL v7 = v17 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7)
    {
      if (v17) {
        unsigned int v8 = 0;
      }
      else {
        unsigned int v8 = v6;
      }
      if (v8 == 1)
      {
        id v9 = (os_log_s *)CSLogCategorySpkrId;
        if (os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          uint64_t v19 = "-[CSP2PService _createDirectoryIfDoesNotExist:]";
          __int16 v20 = 2112;
          id v21 = v3;
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s Direntry with same name exists, this will be removed: %@",  buf,  0x16u);
        }

        [v5 removeItemAtPath:v3 error:0];
      }

      uint64_t v10 = (os_log_s *)CSLogCategorySpkrId;
      if (os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v19 = "-[CSP2PService _createDirectoryIfDoesNotExist:]";
        __int16 v20 = 2112;
        id v21 = v3;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s Creating Directory : %@", buf, 0x16u);
      }

      id v16 = 0LL;
      [v5 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:&v16];
      id v11 = v16;
      if (v11)
      {
        id v12 = (void *)CSLogCategorySpkrId;
        if (os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_DEFAULT))
        {
          id v13 = v12;
          id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 localizedDescription]);
          *(_DWORD *)buf = 136315394;
          uint64_t v19 = "-[CSP2PService _createDirectoryIfDoesNotExist:]";
          __int16 v20 = 2112;
          id v21 = v14;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s Creating Directory failed : %@",  buf,  0x16u);
        }
      }
    }
  }

  else
  {
    id v15 = (os_log_s *)CSLogCategorySpkrId;
    if (os_log_type_enabled(CSLogCategorySpkrId, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v19 = "-[CSP2PService _createDirectoryIfDoesNotExist:]";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s path is nil - Bailing out", buf, 0xCu);
    }
  }
}

- (id)_spIdSiriDebugVTDataDirectory
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 remoteP2pLogDirectory]);

  -[CSP2PService _createDirectoryIfDoesNotExist:](self, "_createDirectoryIfDoesNotExist:", v4);
  return v4;
}

- (id)_spIdSiriDebugGradingDataRootDirectory
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 remoteGradingDataDirectory]);

  -[CSP2PService _createDirectoryIfDoesNotExist:](self, "_createDirectoryIfDoesNotExist:", v4);
  return v4;
}

- (id)_spIdSiriDebugVoiceProfileStoreRootDirectory
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CSP2PService _spIdSiriDebugVTDataDirectory](self, "_spIdSiriDebugVTDataDirectory"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 stringByAppendingPathComponent:@"VoiceProfileStore"]);

  return v3;
}

- (id)_spIdSiriDebugVoiceProfileStoreRootDirectoryForLocale:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[CSP2PService _spIdSiriDebugVoiceProfileStoreRootDirectory]( self,  "_spIdSiriDebugVoiceProfileStoreRootDirectory"));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:v4]);

  return v6;
}

- (id)_spIdSiriDebugTrainedUsersFilePathForLocale:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[CSP2PService _spIdSiriDebugVoiceProfileStoreRootDirectoryForLocale:]( self,  "_spIdSiriDebugVoiceProfileStoreRootDirectoryForLocale:",  a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 stringByAppendingPathComponent:@"trained_users.json"]);

  return v4;
}

- (id)_spIdSiriDebugVoiceProfileRootDirectoryForProfile:(id)a3 locale:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( -[CSP2PService _spIdSiriDebugVoiceProfileStoreRootDirectoryForLocale:]( self,  "_spIdSiriDebugVoiceProfileStoreRootDirectoryForLocale:",  a4));
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByAppendingPathComponent:v6]);

  return v8;
}

- (id)_spIdSiriDebugVoiceProfileCacheDirectoryForProfile:(id)a3 locale:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue( -[CSP2PService _spIdSiriDebugVoiceProfileStoreRootDirectoryForLocale:]( self,  "_spIdSiriDebugVoiceProfileStoreRootDirectoryForLocale:",  a4));
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 stringByAppendingPathComponent:@"Caches"]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 stringByAppendingPathComponent:v6]);

  return v9;
}

- (id)_getContentsOfDirectory:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  NSURLResourceKey v22 = NSURLNameKey;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v22, 1LL));
  id v15 = 0LL;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( [v4 contentsOfDirectoryAtURL:v3 includingPropertiesForKeys:v5 options:0 error:&v15]);
  id v7 = v15;

  if (v7)
  {
    unsigned int v8 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR)) {
      goto LABEL_3;
    }
    *(_DWORD *)buf = 136315650;
    char v17 = "-[CSP2PService _getContentsOfDirectory:]";
    __int16 v18 = 2112;
    id v19 = v3;
    __int16 v20 = 2112;
    id v21 = v7;
    id v12 = "%s Error reading directory at %@: err: %@";
    id v13 = v8;
    uint32_t v14 = 32;
LABEL_10:
    _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
    goto LABEL_3;
  }

  if ([v6 count])
  {
    id v9 = v6;
    goto LABEL_6;
  }

  id v11 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    char v17 = "-[CSP2PService _getContentsOfDirectory:]";
    __int16 v18 = 2112;
    id v19 = v3;
    id v12 = "%s %@ is empty";
    id v13 = v11;
    uint32_t v14 = 22;
    goto LABEL_10;
  }

- (BOOL)isHeadlessDeviceDataCollectionModeEnabled
{
  if ((CSIsInternalBuild(self) & 1) != 0) {
    return 1;
  }
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
  unsigned __int8 v4 = [v3 isP2PTransferEnabled];

  return v4;
}

- (BOOL)isInternalWithoutProfile
{
  if (CSIsInternalBuild(self))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[CSFPreferences sharedPreferences](&OBJC_CLASS___CSFPreferences, "sharedPreferences"));
    unsigned int v3 = [v2 isP2PTransferEnabled] ^ 1;
  }

  else
  {
    LOBYTE(v3) = 0;
  }

  return v3;
}

- (id)_sha1:(id)a3
{
  id v3 = a3;
  CC_SHA1([v3 bytes], (CC_LONG)objc_msgSend(v3, "length"), md);
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithCapacity:](&OBJC_CLASS___NSMutableString, "stringWithCapacity:", 40LL));
  for (uint64_t i = 0LL; i != 20; ++i)
    objc_msgSend(v4, "appendFormat:", @"%02x", md[i]);

  return v4;
}

- (BOOL)shouldTransferVoiceTriggerLogFileWithURL:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 pathExtension]);
  unsigned int v5 = [v4 isEqualToString:@"wav"];

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 path]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByReplacingOccurrencesOfString:@"wav" withString:@"json"]);

    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v3 path]);
    id v9 = v8;
    uint64_t v10 = @".wav";
    id v11 = @"-synced.json";
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v3 pathExtension]);
    unsigned int v13 = [v12 isEqualToString:@"json"];

    if (!v13)
    {
      unsigned __int8 v17 = 0;
      goto LABEL_10;
    }

    uint32_t v14 = (void *)objc_claimAutoreleasedReturnValue([v3 path]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v14 stringByReplacingOccurrencesOfString:@"json" withString:@"wav"]);

    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v3 path]);
    id v9 = v8;
    uint64_t v10 = @".json";
    id v11 = @"-synced.wav";
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v8 stringByReplacingOccurrencesOfString:v10 withString:v11]);

  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  if ([v16 fileExistsAtPath:v7])
  {
    unsigned __int8 v17 = 1;
  }

  else
  {
    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    unsigned __int8 v17 = [v18 fileExistsAtPath:v15];
  }

LABEL_10:
  return v17;
}

- (BOOL)fileURL:(id)a3 matchesFileNamePattern:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v16 = 0LL;
  id v7 = -[NSRegularExpression initWithPattern:options:error:]( objc_alloc(&OBJC_CLASS___NSRegularExpression),  "initWithPattern:options:error:",  v5,  1LL,  &v16);

  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v6 lastPathComponent]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 lastPathComponent]);

  id v10 = -[NSRegularExpression rangeOfFirstMatchInString:options:range:]( v7,  "rangeOfFirstMatchInString:options:range:",  v8,  16,  0,  [v9 length]);
  uint64_t v12 = v11;

  BOOL v14 = v10 != (id)0x7FFFFFFFFFFFFFFFLL || v12 != 0;
  return v14;
}

- (CSADCompanionServiceProvider)adCompanionServiceProvider
{
  return (CSADCompanionServiceProvider *)objc_loadWeakRetained((id *)&self->_adCompanionServiceProvider);
}

- (void)setAdCompanionServiceProvider:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSString)lastCommunicatedPeer
{
  return self->_lastCommunicatedPeer;
}

- (void)setLastCommunicatedPeer:(id)a3
{
}

- (NSString)voiceTriggerBatchId
{
  return self->_voiceTriggerBatchId;
}

- (void)setVoiceTriggerBatchId:(id)a3
{
}

- (NSString)voiceIdentificationBatchId
{
  return self->_voiceIdentificationBatchId;
}

- (void)setVoiceIdentificationBatchId:(id)a3
{
}

- (OS_dispatch_semaphore)sema
{
  return self->_sema;
}

- (void)setSema:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)sharedInstance
{
  if (qword_10027FFE8 != -1) {
    dispatch_once(&qword_10027FFE8, &stru_10022CED0);
  }
  return (id)qword_10027FFF0;
}

@end