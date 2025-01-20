@interface CSSiriAudioMessageFile
- (CSPlainAudioFileWriter)audioFileWriter;
- (CSSiriAudioMessageFile)initWithRequestUUID:(id)a3;
- (NSString)requestUUID;
- (NSURL)recordedAudioFileURL;
- (void)_removeRecordedAudio;
- (void)appendAudioChunk:(id)a3;
- (void)dealloc;
- (void)endAudio;
- (void)prepareFile;
- (void)setAudioFileWriter:(id)a3;
- (void)setRecordedAudioFileURL:(id)a3;
- (void)setRequestUUID:(id)a3;
@end

@implementation CSSiriAudioMessageFile

- (CSSiriAudioMessageFile)initWithRequestUUID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CSSiriAudioMessageFile;
  v6 = -[CSSiriAudioMessageFile init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_requestUUID, a3);
  }

  return v7;
}

- (void)prepareFile
{
  uint64_t v3 = AFUserSupportDirectoryPath(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingPathComponent:@"RecordedAudio"]);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  [v6 createDirectoryAtPath:v5 withIntermediateDirectories:1 attributes:0 error:0];

  v7 = objc_alloc(&OBJC_CLASS___NSString);
  requestUUID = (const __CFString *)self->_requestUUID;
  if (!requestUUID) {
    requestUUID = @"Unknown";
  }
  objc_super v9 = -[NSString initWithFormat:](v7, "initWithFormat:", @"%@.wav", requestUUID);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v5 stringByAppendingPathComponent:v9]);
  v11 = (os_log_s *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[CSSiriAudioMessageFile prepareFile]";
    __int16 v22 = 2112;
    v23 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s Creating recorded audio file in %@",  buf,  0x16u);
  }

  v12 = (NSURL *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v10));
  recordedAudioFileURL = self->_recordedAudioFileURL;
  self->_recordedAudioFileURL = v12;

  v14 = objc_alloc(&OBJC_CLASS___CSPlainAudioFileWriter);
  v15 = self->_recordedAudioFileURL;
  +[CSFAudioStreamBasicDescriptionFactory lpcmMonoInterleavedASBD]( &OBJC_CLASS___CSFAudioStreamBasicDescriptionFactory,  "lpcmMonoInterleavedASBD");
  +[CSFAudioStreamBasicDescriptionFactory lpcmMonoInterleavedASBD]( &OBJC_CLASS___CSFAudioStreamBasicDescriptionFactory,  "lpcmMonoInterleavedASBD");
  v16 = -[CSPlainAudioFileWriter initWithURL:inputFormat:outputFormat:]( v14,  "initWithURL:inputFormat:outputFormat:",  v15,  v19,  v18);
  audioFileWriter = self->_audioFileWriter;
  self->_audioFileWriter = v16;
}

- (void)appendAudioChunk:(id)a3
{
  audioFileWriter = self->_audioFileWriter;
  id v4 = a3;
  id v7 = objc_claimAutoreleasedReturnValue([v4 data]);
  id v5 = [v7 bytes];
  id v6 = [v4 numSamples];

  -[CSPlainAudioFileWriter addSamples:numSamples:](audioFileWriter, "addSamples:numSamples:", v5, v6);
}

- (void)endAudio
{
  audioFileWriter = self->_audioFileWriter;
  self->_audioFileWriter = 0LL;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CSSiriAudioMessageFile;
  -[CSSiriAudioMessageFile dealloc](&v3, "dealloc");
}

- (void)_removeRecordedAudio
{
  if (self->_recordedAudioFileURL
    && (!CSIsInternalBuild(self) || (_AFPreferencesKeepRecorededAudioFiles() & 1) == 0))
  {
    -[CSPlainAudioFileWriter endAudio](self->_audioFileWriter, "endAudio");
    objc_super v3 = (os_log_s *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      recordedAudioFileURL = self->_recordedAudioFileURL;
      *(_DWORD *)buf = 136315650;
      v16 = "-[CSSiriAudioMessageFile _removeRecordedAudio]";
      __int16 v17 = 2048;
      v18 = self;
      __int16 v19 = 2112;
      v20 = recordedAudioFileURL;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s %p Removing recorded audio at %@...",  buf,  0x20u);
    }

    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v6 = self->_recordedAudioFileURL;
    id v14 = 0LL;
    unsigned int v7 = [v5 removeItemAtURL:v6 error:&v14];
    id v8 = v14;

    objc_super v9 = (void *)CSLogContextFacilityCoreSpeech;
    if (!v7 || v8)
    {
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        v11 = self->_recordedAudioFileURL;
        v12 = v9;
        v13 = (void *)objc_claimAutoreleasedReturnValue([v8 localizedDescription]);
        *(_DWORD *)buf = 136315906;
        v16 = "-[CSSiriAudioMessageFile _removeRecordedAudio]";
        __int16 v17 = 2048;
        v18 = self;
        __int16 v19 = 2112;
        v20 = v11;
        __int16 v21 = 2112;
        __int16 v22 = v13;
        _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%s %p Failed to remove recorded audio at %@ (error = %@).",  buf,  0x2Au);
      }
    }

    else if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      v10 = self->_recordedAudioFileURL;
      *(_DWORD *)buf = 136315650;
      v16 = "-[CSSiriAudioMessageFile _removeRecordedAudio]";
      __int16 v17 = 2048;
      v18 = self;
      __int16 v19 = 2112;
      v20 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v9,  OS_LOG_TYPE_DEFAULT,  "%s %p Removed recorded audio at %@.",  buf,  0x20u);
    }
  }

- (NSString)requestUUID
{
  return self->_requestUUID;
}

- (void)setRequestUUID:(id)a3
{
}

- (NSURL)recordedAudioFileURL
{
  return self->_recordedAudioFileURL;
}

- (void)setRecordedAudioFileURL:(id)a3
{
}

- (CSPlainAudioFileWriter)audioFileWriter
{
  return self->_audioFileWriter;
}

- (void)setAudioFileWriter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end