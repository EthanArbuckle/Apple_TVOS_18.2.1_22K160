@interface ADSpeechSamplingSendAudioData
- (ADSpeechSamplingSendAudioData)initWithAudioDataFolders:(id)a3 samplingType:(int64_t)a4;
- (NSArray)audioDataFolders;
- (NSString)samplingComponent;
- (OS_dispatch_queue)queue;
- (id)convertToALACWithPath:(id)a3 withSamplingRateOf:(int)a4;
- (id)makeValidWAVFile:(id)a3 withSamplingRateOf:(int)a4;
- (int64_t)samplingType;
- (void)dealloc;
- (void)enqueueAudioDataWithAudioFileName:(id)a3 audioMetadataDict:(id)a4 folderPath:(id)a5;
- (void)sendAudioDataToServer;
- (void)setAudioDataFolders:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSamplingComponent:(id)a3;
- (void)setSamplingType:(int64_t)a3;
@end

@implementation ADSpeechSamplingSendAudioData

- (ADSpeechSamplingSendAudioData)initWithAudioDataFolders:(id)a3 samplingType:(int64_t)a4
{
  id v7 = a3;
  if ([v7 count])
  {
    v18.receiver = self;
    v18.super_class = (Class)&OBJC_CLASS___ADSpeechSamplingSendAudioData;
    v8 = -[ADSpeechSamplingSendAudioData init](&v18, "init");
    if (v8)
    {
      dispatch_queue_attr_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v10 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v9);
      dispatch_queue_t v11 = dispatch_queue_create("com.apple.siri.speech.sampling.upload", v10);
      queue = v8->_queue;
      v8->_queue = (OS_dispatch_queue *)v11;

      v8->_samplingType = a4;
      v13 = sub_10024D968(a4);
      uint64_t v14 = objc_claimAutoreleasedReturnValue(v13);
      samplingComponent = v8->_samplingComponent;
      v8->_samplingComponent = (NSString *)v14;

      objc_storeStrong((id *)&v8->_audioDataFolders, a3);
    }

    self = v8;
    v16 = self;
  }

  else
  {
    v16 = 0LL;
  }

  return v16;
}

- (void)dealloc
{
  v3 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    samplingComponent = self->_samplingComponent;
    *(_DWORD *)buf = 136315650;
    id v7 = "-[ADSpeechSamplingSendAudioData dealloc]";
    __int16 v8 = 2112;
    dispatch_queue_attr_t v9 = samplingComponent;
    __int16 v10 = 2048;
    dispatch_queue_t v11 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%s %@ Sampling: dealloc - done with %p",  buf,  0x20u);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___ADSpeechSamplingSendAudioData;
  -[ADSpeechSamplingSendAudioData dealloc](&v5, "dealloc");
}

- (void)sendAudioDataToServer
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10024D460;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)enqueueAudioDataWithAudioFileName:(id)a3 audioMetadataDict:(id)a4 folderPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_queue_t v11 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
  {
    samplingComponent = self->_samplingComponent;
    *(_DWORD *)buf = 136315650;
    v57 = "-[ADSpeechSamplingSendAudioData enqueueAudioDataWithAudioFileName:audioMetadataDict:folderPath:]";
    __int16 v58 = 2112;
    v59 = samplingComponent;
    __int16 v60 = 2112;
    id v61 = v8;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "%s %@ Sampling: enqueueAudioDataWithAudioFileName: %@",  buf,  0x20u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v12 = objc_alloc_init(&OBJC_CLASS___DUSchemaSpeechAudioRecord);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v9 valueForKey:@"codec"]);
  [v12 setCodec:v13];

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v10 stringByAppendingPathComponent:v8]);
  v48 = (void *)objc_claimAutoreleasedReturnValue([v9 valueForKey:@"language"]);
  id v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"samplingRate"]);
  uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v16, v17) & 1) == 0)
  {

    id v18 = 0LL;
    goto LABEL_10;
  }

  id v18 = v16;

  if (!v18)
  {
LABEL_10:
    uint64_t v20 = 16000LL;
    goto LABEL_11;
  }

  id v19 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));

  uint64_t v20 = 16000LL;
  if (v18 != v19)
  {
    else {
      uint64_t v20 = 16000LL;
    }
  }

- (id)makeValidWAVFile:(id)a3 withSamplingRateOf:(int)a4
{
  id v6 = a3;
  int v35 = a4;
  id v7 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
  {
    samplingComponent = self->_samplingComponent;
    *(_DWORD *)buf = 136315650;
    id v37 = "-[ADSpeechSamplingSendAudioData makeValidWAVFile:withSamplingRateOf:]";
    __int16 v38 = 2112;
    v39 = samplingComponent;
    __int16 v40 = 2112;
    id v41 = v6;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "%s %@ Sampling: makeValidWAVFile: Adding wav headers to file at path: %@",  buf,  0x20u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByDeletingPathExtension]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 stringByAppendingPathExtension:@"wav"]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithContentsOfFile:](&OBJC_CLASS___NSMutableData, "dataWithContentsOfFile:", v6));
  __int16 v34 = 1;
  __int16 v33 = 16;
  int v32 = 2 * a4;
  __int16 v31 = 2;
  int v29 = 16;
  int v30 = (int)(16 * [v10 length]) >> 3;
  int __ptr = v30 + 46;
  __int16 v27 = 1;
  *__error() = 0;
  id v11 = v9;
  id v12 = fopen((const char *)[v11 cStringUsingEncoding:1], "w");
  if (v12)
  {
    v13 = v12;
    fwrite("RIFF", 1uLL, 4uLL, v12);
    fwrite(&__ptr, 4uLL, 1uLL, v13);
    fwrite("WAVE", 1uLL, 4uLL, v13);
    fwrite("fmt ", 1uLL, 4uLL, v13);
    fwrite(&v29, 4uLL, 1uLL, v13);
    fwrite(&v27, 2uLL, 1uLL, v13);
    fwrite(&v34, 2uLL, 1uLL, v13);
    fwrite(&v35, 4uLL, 1uLL, v13);
    fwrite(&v32, 4uLL, 1uLL, v13);
    fwrite(&v31, 2uLL, 1uLL, v13);
    fwrite(&v33, 2uLL, 1uLL, v13);
    fwrite("data", 1uLL, 4uLL, v13);
    fwrite(&v30, 4uLL, 1uLL, v13);
    fclose(v13);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSFileHandle fileHandleForUpdatingAtPath:]( &OBJC_CLASS___NSFileHandle,  "fileHandleForUpdatingAtPath:",  v11));
    [v14 seekToEndOfFile];
    [v14 writeData:v10];
    [v14 closeFile];
    id v15 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v20 = self->_samplingComponent;
      *(_DWORD *)buf = 136315650;
      id v37 = "-[ADSpeechSamplingSendAudioData makeValidWAVFile:withSamplingRateOf:]";
      __int16 v38 = 2112;
      v39 = v20;
      __int16 v40 = 2112;
      id v41 = v11;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "%s %@ Sampling: makeValidWAVFile: WAV file at path: %@",  buf,  0x20u);
    }

    id v16 = v11;
  }

  else
  {
    uint64_t v17 = (void *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      v21 = self->_samplingComponent;
      v22 = v17;
      int v23 = *__error();
      v24 = __error();
      v25 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", strerror(*v24));
      v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
      *(_DWORD *)buf = 136316162;
      id v37 = "-[ADSpeechSamplingSendAudioData makeValidWAVFile:withSamplingRateOf:]";
      __int16 v38 = 2112;
      v39 = v21;
      __int16 v40 = 2112;
      id v41 = v11;
      __int16 v42 = 1024;
      int v43 = v23;
      __int16 v44 = 2112;
      v45 = v26;
      _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "%s %@ Sampling: makeValidWAVFile: Error opening wav file for writing: %@, errno: %d, errorString: %@",  buf,  0x30u);
    }

    id v16 = 0LL;
  }

  return v16;
}

- (id)convertToALACWithPath:(id)a3 withSamplingRateOf:(int)a4
{
  id v6 = a3;
  id v7 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
  {
    samplingComponent = self->_samplingComponent;
    *(_DWORD *)inPropertyData = 136315650;
    *(void *)&inPropertyData[4] = "-[ADSpeechSamplingSendAudioData convertToALACWithPath:withSamplingRateOf:]";
    *(_WORD *)&inPropertyData[12] = 2112;
    *(void *)&inPropertyData[14] = samplingComponent;
    *(_WORD *)&inPropertyData[22] = 2112;
    uint64_t v68 = (uint64_t)v6;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "%s %@ Sampling: convertToALACWithPath: Converted to ALAC at path: %@",  inPropertyData,  0x20u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByDeletingPathExtension]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 stringByAppendingPathExtension:@"wav"]);
  id v10 = (const __CFURL *)objc_claimAutoreleasedReturnValue([v8 stringByAppendingPathExtension:@"caf"]);
  *(double *)inPropertyData = (float)a4;
  int v69 = 16;
  uint64_t v68 = 0x100000002LL;
  *(_OWORD *)&inPropertyData[8] = xmmword_1003CA2E0;
  inStreamDesc.mSampleRate = *(double *)inPropertyData;
  inStreamDesc.mBitsPerChannel = 0;
  *(_OWORD *)&inStreamDesc.mFormatID = xmmword_1003CA310;
  *(void *)&inStreamDesc.mBytesPerFrame = &_mh_execute_header;
  ExtAudioFileRef inExtAudioFile = 0LL;
  ExtAudioFileRef outExtAudioFile = 0LL;
  id v11 = (const __CFURL *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v9));
  OSStatus v12 = ExtAudioFileOpenURL(v11, &outExtAudioFile);
  if (v12)
  {
    OSStatus v13 = v12;
    uint64_t v14 = (os_log_s *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      id v15 = self->_samplingComponent;
      *(_DWORD *)buf = 136315906;
      __int16 v60 = "-[ADSpeechSamplingSendAudioData convertToALACWithPath:withSamplingRateOf:]";
      __int16 v61 = 2112;
      v62 = v15;
      __int16 v63 = 2112;
      v64 = v11;
      __int16 v65 = 1024;
      OSStatus v66 = v13;
      id v16 = "%s %@ Sampling: convertToALACWithPath: Couldn't open wav file (r) %@ %i";
      uint64_t v17 = v14;
      uint32_t v18 = 38;
LABEL_35:
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, v16, buf, v18);
      goto LABEL_8;
    }

    goto LABEL_8;
  }

  OSStatus v19 = ExtAudioFileSetProperty(outExtAudioFile, 0x63666D74u, 0x28u, inPropertyData);
  if (!v19)
  {
    v24 = (const __CFURL *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v10));
    OSStatus v25 = ExtAudioFileCreateWithURL(v24, 0x63616666u, &inStreamDesc, 0LL, 1u, &inExtAudioFile);
    if (v25)
    {
      OSStatus v26 = v25;
      __int16 v27 = (os_log_s *)AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
      {
        v28 = self->_samplingComponent;
        *(_DWORD *)buf = 136315906;
        __int16 v60 = "-[ADSpeechSamplingSendAudioData convertToALACWithPath:withSamplingRateOf:]";
        __int16 v61 = 2112;
        v62 = v28;
        __int16 v63 = 2112;
        v64 = v24;
        __int16 v65 = 1024;
        OSStatus v66 = v26;
        int v29 = "%s %@ Sampling: convertToALACWithPath: Couldn't open %@ %i";
        int v30 = v27;
        uint32_t v31 = 38;
LABEL_48:
        _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, v29, buf, v31);
      }
    }

    else
    {
      OSStatus v33 = ExtAudioFileSetProperty(inExtAudioFile, 0x63666D74u, 0x28u, inPropertyData);
      if (!v33)
      {
        id v52 = v24;
        id v53 = self;
        v36 = malloc(0x10000uLL);
        while (1)
        {
          *(void *)&ioData.mBuffers[0].mNumberChannels = 0x800000000001LL;
          ioData.mBuffers[0].mData = v36;
          UInt32 ioNumberFrames = 0x4000;
          ioData.mNumberBuffers = 1;
          OSStatus v37 = ExtAudioFileRead(outExtAudioFile, &ioNumberFrames, &ioData);
          if (v37)
          {
            __int16 v38 = (os_log_s *)AFSiriLogContextSpeech;
            if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
            {
              __int16 v42 = v53->_samplingComponent;
              *(_DWORD *)buf = 136315650;
              __int16 v60 = "-[ADSpeechSamplingSendAudioData convertToALACWithPath:withSamplingRateOf:]";
              __int16 v61 = 2112;
              v62 = v42;
              __int16 v63 = 1024;
              LODWORD(v64) = v37;
              _os_log_error_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_ERROR,  "%s %@ Sampling: convertToALACWithPath: Couldn't read from input file: %i",  buf,  0x1Cu);
            }
          }

          UInt32 v39 = ioNumberFrames;
          OSStatus v40 = ExtAudioFileWrite(inExtAudioFile, ioNumberFrames, &ioData);
          if (v40) {
            break;
          }
          if (v37) {
            BOOL v41 = 1;
          }
          else {
            BOOL v41 = v39 == 0;
          }
          if (v41)
          {
            OSStatus v45 = 0;
            v46 = v53;
            goto LABEL_39;
          }
        }

        __int16 v44 = (os_log_s *)AFSiriLogContextSpeech;
        v46 = v53;
        if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
        {
          id v50 = v53->_samplingComponent;
          *(_DWORD *)buf = 136315650;
          __int16 v60 = "-[ADSpeechSamplingSendAudioData convertToALACWithPath:withSamplingRateOf:]";
          __int16 v61 = 2112;
          v62 = v50;
          __int16 v63 = 1024;
          LODWORD(v64) = v40;
          _os_log_error_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_ERROR,  "%s %@ Sampling: convertToALACWithPath: Failure during write: %i",  buf,  0x1Cu);
        }

        OSStatus v45 = v40;
LABEL_39:
        ExtAudioFileDispose(outExtAudioFile);
        ExtAudioFileDispose(inExtAudioFile);
        v47 = (os_log_s *)AFSiriLogContextSpeech;
        if (v40)
        {
          if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
          {
            v49 = v46->_samplingComponent;
            *(_DWORD *)buf = 136315650;
            __int16 v60 = "-[ADSpeechSamplingSendAudioData convertToALACWithPath:withSamplingRateOf:]";
            __int16 v61 = 2112;
            v62 = v49;
            __int16 v63 = 1024;
            LODWORD(v64) = v45;
            _os_log_error_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_ERROR,  "%s %@ Sampling: convertToALACWithPath: Failure during write, so returning nil: %i",  buf,  0x1Cu);
          }

          v22 = 0LL;
        }

        else
        {
          if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
          {
            v51 = v46->_samplingComponent;
            *(_DWORD *)buf = 136315650;
            __int16 v60 = "-[ADSpeechSamplingSendAudioData convertToALACWithPath:withSamplingRateOf:]";
            __int16 v61 = 2112;
            v62 = v51;
            __int16 v63 = 2112;
            v64 = v10;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEBUG,  "%s %@ Sampling: ALAC file at path: %@",  buf,  0x20u);
          }

          v22 = v10;
        }

        v24 = v52;
        goto LABEL_22;
      }

      OSStatus v34 = v33;
      int v35 = (os_log_s *)AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
      {
        v48 = self->_samplingComponent;
        *(_DWORD *)buf = 136315650;
        __int16 v60 = "-[ADSpeechSamplingSendAudioData convertToALACWithPath:withSamplingRateOf:]";
        __int16 v61 = 2112;
        v62 = v48;
        __int16 v63 = 1024;
        LODWORD(v64) = v34;
        int v29 = "%s %@ Sampling: convertToALACWithPath: Couldn't set output's input file format: %i";
        int v30 = v35;
        uint32_t v31 = 28;
        goto LABEL_48;
      }
    }

    if (outExtAudioFile) {
      ExtAudioFileDispose(outExtAudioFile);
    }
    if (inExtAudioFile) {
      ExtAudioFileDispose(inExtAudioFile);
    }
    v22 = 0LL;
LABEL_22:

    goto LABEL_11;
  }

  OSStatus v20 = v19;
  v21 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
  {
    int v43 = self->_samplingComponent;
    *(_DWORD *)buf = 136315650;
    __int16 v60 = "-[ADSpeechSamplingSendAudioData convertToALACWithPath:withSamplingRateOf:]";
    __int16 v61 = 2112;
    v62 = v43;
    __int16 v63 = 1024;
    LODWORD(v64) = v20;
    id v16 = "%s %@ Sampling: convertToALACWithPath: Couldn't set input file format: %i";
    uint64_t v17 = v21;
    uint32_t v18 = 28;
    goto LABEL_35;
  }

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSArray)audioDataFolders
{
  return self->_audioDataFolders;
}

- (void)setAudioDataFolders:(id)a3
{
}

- (int64_t)samplingType
{
  return self->_samplingType;
}

- (void)setSamplingType:(int64_t)a3
{
  self->_samplingType = a3;
}

- (NSString)samplingComponent
{
  return self->_samplingComponent;
}

- (void)setSamplingComponent:(id)a3
{
}

- (void).cxx_destruct
{
}

@end