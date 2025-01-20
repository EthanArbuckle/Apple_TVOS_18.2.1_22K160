@interface CSAudioConverter
+ (id)narrowBandOpusConverter;
+ (id)opusConverter;
+ (id)speexConverter;
- (CSAudioConverter)initWithInASBD:(AudioStreamBasicDescription *)a3 outASBD:(AudioStreamBasicDescription *)a4;
- (CSAudioConverterDelegate)delegate;
- (void)_configureAudioConverter:(OpaqueAudioConverter *)a3;
- (void)_convertBufferedLPCM:(id)a3 allowPartial:(BOOL)a4 timestamp:(unint64_t)a5 arrivalTimestampToAudioRecorder:(unint64_t)a6;
- (void)addSamples:(id)a3 timestamp:(unint64_t)a4 arrivalTimestampToAudioRecorder:(unint64_t)a5;
- (void)dealloc;
- (void)flush;
- (void)reset;
- (void)setDelegate:(id)a3;
@end

@implementation CSAudioConverter

- (CSAudioConverter)initWithInASBD:(AudioStreamBasicDescription *)a3 outASBD:(AudioStreamBasicDescription *)a4
{
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___CSAudioConverter;
  v6 = -[CSAudioConverter init](&v21, "init");
  if (!v6)
  {
LABEL_12:
    v15 = v6;
    goto LABEL_13;
  }

  __int128 v7 = *(_OWORD *)&a3->mBytesPerPacket;
  *(_OWORD *)&inSourceFormat.mSampleRate = *(_OWORD *)&a3->mSampleRate;
  *(_OWORD *)&inSourceFormat.mBytesPerPacket = v7;
  *(void *)&inSourceFormat.mBitsPerChannel = *(void *)&a3->mBitsPerChannel;
  __int128 v8 = *(_OWORD *)&a4->mBytesPerPacket;
  *(_OWORD *)&v19.mSampleRate = *(_OWORD *)&a4->mSampleRate;
  *(_OWORD *)&v19.mBytesPerPacket = v8;
  *(void *)&v19.mBitsPerChannel = *(void *)&a4->mBitsPerChannel;
  OSStatus v9 = AudioConverterNew(&inSourceFormat, &v19, &outAudioConverter);
  if (v9)
  {
    OSStatus v10 = v9;
    v11 = (os_log_s *)CSLogCategoryAudio;
    if (os_log_type_enabled(CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "CreateAudioConverter";
      __int16 v26 = 1026;
      unsigned int v27 = v10;
      v12 = "%s Cannot create AudioConverter using AudioConverterNew : %{public}u";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 0x12u);
      goto LABEL_9;
    }

    goto LABEL_9;
  }

  unsigned int inPropertyData = +[CSConfig audioConverterBitrate](&OBJC_CLASS___CSConfig, "audioConverterBitrate");
  OSStatus v13 = AudioConverterSetProperty(outAudioConverter, 0x62726174u, 4u, &inPropertyData);
  AudioConverterRef v14 = outAudioConverter;
  if (!v13)
  {
    v6->_opusConverter = outAudioConverter;
    if (!v14)
    {
      v15 = 0LL;
      goto LABEL_13;
    }

    -[CSAudioConverter _configureAudioConverter:](v6, "_configureAudioConverter:");
    uint64_t v16 = objc_claimAutoreleasedReturnValue(+[NSMutableData data](&OBJC_CLASS___NSMutableData, "data"));
    bufferedLPCM = v6->_bufferedLPCM;
    v6->_bufferedLPCM = (NSMutableData *)v16;

    goto LABEL_12;
  }

  AudioConverterDispose(outAudioConverter);
  v11 = (os_log_s *)CSLogCategoryAudio;
  if (os_log_type_enabled(CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v25 = "CreateAudioConverter";
    __int16 v26 = 1026;
    unsigned int v27 = inPropertyData;
    v12 = "%s Cannot set encoder bit rate : %{public}u";
    goto LABEL_8;
  }

- (void)dealloc
{
  opusConverter = self->_opusConverter;
  if (opusConverter)
  {
    AudioConverterDispose(opusConverter);
    self->_opusConverter = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CSAudioConverter;
  -[CSAudioConverter dealloc](&v4, "dealloc");
}

- (void)addSamples:(id)a3 timestamp:(unint64_t)a4 arrivalTimestampToAudioRecorder:(unint64_t)a5
{
  id v9 = a3;
  __int128 v8 = v9;
  if (+[CSConfig inputRecordingIsFloat](&OBJC_CLASS___CSConfig, "inputRecordingIsFloat"))
  {
    __int128 v8 = (void *)objc_claimAutoreleasedReturnValue( +[CSFLPCMTypeConverter convertToShortLPCMBufFromFloatLPCMBuf:]( &OBJC_CLASS___CSFLPCMTypeConverter,  "convertToShortLPCMBufFromFloatLPCMBuf:",  v9));
  }

  -[NSMutableData appendData:](self->_bufferedLPCM, "appendData:", v8);
  -[CSAudioConverter _convertBufferedLPCM:allowPartial:timestamp:arrivalTimestampToAudioRecorder:]( self,  "_convertBufferedLPCM:allowPartial:timestamp:arrivalTimestampToAudioRecorder:",  self->_bufferedLPCM,  0LL,  a4,  a5);
  self->_lastTimestamp = a4;
  self->_lastArrivalTimestampToAudioRecorder = a5;
}

- (void)flush
{
}

- (void)_convertBufferedLPCM:(id)a3 allowPartial:(BOOL)a4 timestamp:(unint64_t)a5 arrivalTimestampToAudioRecorder:(unint64_t)a6
{
  unint64_t v39 = a6;
  unint64_t v38 = a5;
  BOOL v42 = a4;
  v44 = self;
  id v43 = a3;
  uint64_t v51 = 0LL;
  v52 = &v51;
  uint64_t v53 = 0x2020000000LL;
  int v54 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if ([v43 length])
  {
    *(void *)&__int128 v7 = 136315138LL;
    __int128 v40 = v7;
    *(void *)&__int128 v7 = 136316162LL;
    __int128 v41 = v7;
    while (1)
    {
      uint64_t v8 = ((uint64_t (*)(void))__chkstk_darwin)();
      outOutputData.mBuffers[0].mData = (char *)&v38 - ((v9 + 15) & 0x1FFFFFFF0LL);
      UInt32 v11 = *(_DWORD *)(v10 + 76);
      UInt32 ioOutputDataPacketSize = *(_DWORD *)(v10 + 72);
      outOutputData.mNumberBuffers = 1;
      outOutputData.mBuffers[0].mNumberChannels = 1;
      outOutputData.mBuffers[0].mDataByteSize = v11;
      __chkstk_darwin(v8);
      OSStatus v13 = (AudioStreamPacketDescription *)(&v38 - 2 * v12);
      v15 = *(OpaqueAudioConverter **)(v14 + 8);
      inInputDataProcUserData[0] = _NSConcreteStackBlock;
      inInputDataProcUserData[1] = 3221225472LL;
      inInputDataProcUserData[2] = sub_100146E68;
      inInputDataProcUserData[3] = &unk_10022EAC0;
      id v16 = v43;
      id v46 = v16;
      v47 = &v51;
      BOOL v48 = v42;
      OSStatus v17 = AudioConverterFillComplexBuffer( v15,  (AudioConverterComplexInputDataProc)sub_100147034,  inInputDataProcUserData,  &ioOutputDataPacketSize,  &outOutputData,  v13);
      int v18 = v17;
      UInt32 v19 = ioOutputDataPacketSize;
      if (v17 | ioOutputDataPacketSize)
      {
        if (v17 != 1836086393 && v17) {
          goto LABEL_18;
        }
      }

      else
      {
        v20 = (os_log_s *)CSLogCategoryAudio;
        if (!os_log_type_enabled(CSLogCategoryAudio, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_20;
        }
        *(_DWORD *)buf = v40;
        v56 = "-[CSAudioConverter _convertBufferedLPCM:allowPartial:timestamp:arrivalTimestampToAudioRecorder:]";
        _os_log_debug_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEBUG,  "%s Override result as 'mpty'",  buf,  0xCu);
        int v18 = 1836086393;
        UInt32 v19 = ioOutputDataPacketSize;
      }

      if (v19)
      {
        unint64_t v21 = 0LL;
        p_mDataByteSize = &v13->mDataByteSize;
        do
        {
          v23 = (os_log_s *)CSLogContextFacilityCoreSpeech;
          if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEBUG))
          {
            double outPacketSizeInSec = v44->_outPacketSizeInSec;
            unsigned int v26 = *p_mDataByteSize;
            *(_DWORD *)buf = v41;
            v56 = "-[CSAudioConverter _convertBufferedLPCM:allowPartial:timestamp:arrivalTimestampToAudioRecorder:]";
            __int16 v57 = 1026;
            int v58 = v21 + 1;
            __int16 v59 = 1026;
            UInt32 v60 = v19;
            __int16 v61 = 2050;
            double v62 = outPacketSizeInSec;
            __int16 v63 = 1024;
            unsigned int v64 = v26;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEBUG,  "%s [%{public}02u of %{public}02u %{public}fs] Opus packet with %u bytes",  buf,  0x28u);
          }

          v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  (char *)outOutputData.mBuffers[0].mData + *(void *)(p_mDataByteSize - 3),  *p_mDataByteSize,  v38,  v39));
          [v6 addObject:v24];

          ++v21;
          UInt32 v19 = ioOutputDataPacketSize;
          p_mDataByteSize += 4;
        }

        while (v21 < ioOutputDataPacketSize);
      }

      if (v18) {
        break;
      }
    }

    if (v18 == 1836086393) {
      goto LABEL_20;
    }
LABEL_18:
    v28 = (os_log_s *)CSLogCategoryAudio;
    if (os_log_type_enabled(CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v56 = "-[CSAudioConverter _convertBufferedLPCM:allowPartial:timestamp:arrivalTimestampToAudioRecorder:]";
      __int16 v57 = 1026;
      int v58 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "%s AudioConverter is sad: 0x%{public}xd",  buf,  0x12u);
    }

- (void)reset
{
  v3 = (os_log_s *)CSLogCategoryAudio;
  if (os_log_type_enabled(CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    v5 = "-[CSAudioConverter reset]";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s Resetting AudioConverter buffer",  (uint8_t *)&v4,  0xCu);
  }

  -[NSMutableData setLength:](self->_bufferedLPCM, "setLength:", 0LL);
  AudioConverterReset(self->_opusConverter);
}

- (void)_configureAudioConverter:(OpaqueAudioConverter *)a3
{
  double v6 = v5;
  +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
  unsigned int v8 = (v6 * v7);
  uint64_t v9 = (void *)CSLogCategoryAudio;
  if (os_log_type_enabled(CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = v9;
    +[CSConfig inputRecordingBufferDuration](&OBJC_CLASS___CSConfig, "inputRecordingBufferDuration");
    uint64_t v12 = v11;
    +[CSConfig inputRecordingSampleRate](&OBJC_CLASS___CSConfig, "inputRecordingSampleRate");
    *(_DWORD *)buf = 136315906;
    int v36 = "-[CSAudioConverter _configureAudioConverter:]";
    __int16 v37 = 2050;
    uint64_t v38 = v12;
    __int16 v39 = 2050;
    double v40 = v13;
    __int16 v41 = 1026;
    unsigned int v42 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s createAudioConverter : initial frames per buffer = dur %{public}.2f * sr %{public}.2f = %{public}u",  buf,  0x26u);
  }

  UInt32 ioPropertyDataSize = 40;
  OSStatus Property = AudioConverterGetProperty(a3, 0x61636F64u, &ioPropertyDataSize, &self->_opusOutASBD);
  if (Property)
  {
    OSStatus v15 = Property;
    id v16 = (os_log_s *)CSLogCategoryAudio;
    if (os_log_type_enabled(CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      int v36 = "-[CSAudioConverter _configureAudioConverter:]";
      __int16 v37 = 1026;
      LODWORD(v38) = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%s Failed to get audioConverter property (kAudioConverterCurrentOutputStreamDescription) : %{public}d",  buf,  0x12u);
    }
  }

  double mSampleRate = self->_opusOutASBD.mSampleRate;
  if (self->_opusOutASBD.mFormatID != 1936745848) {
    self->_recordBasePacketsPerSecond = (mSampleRate / (double)v8);
  }
  UInt32 mBytesPerPacket = self->_opusOutASBD.mBytesPerPacket;
  UInt32 mFramesPerPacket = self->_opusOutASBD.mFramesPerPacket;
  float v20 = (double)mFramesPerPacket / mSampleRate;
  self->_double outPacketSizeInSec = v20;
  unsigned int outPropertyData = 2100;
  UInt32 v33 = mBytesPerPacket;
  UInt32 ioPropertyDataSize = 4;
  OSStatus v21 = AudioConverterGetProperty(a3, 0x6D6F6273u, &ioPropertyDataSize, &outPropertyData);
  v22 = (os_log_s *)CSLogCategoryAudio;
  BOOL v23 = os_log_type_enabled(CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT);
  if (v21)
  {
    if (!v23) {
      goto LABEL_14;
    }
    *(_DWORD *)buf = 136315394;
    int v36 = "-[CSAudioConverter _configureAudioConverter:]";
    __int16 v37 = 1026;
    LODWORD(v38) = v21;
    v24 = "%s _configureAudioConverter: AudioConverterGetProperty(kAudioConverterPropertyMinimumOutputBufferSize) returne"
          "d status %{public}d";
  }

  else
  {
    if (!v23) {
      goto LABEL_14;
    }
    *(_DWORD *)buf = 136315394;
    int v36 = "-[CSAudioConverter _configureAudioConverter:]";
    __int16 v37 = 1026;
    LODWORD(v38) = outPropertyData;
    v24 = "%s _configureAudioConverter: encoded audio needs minimum of %{public}u bytes per output buffer";
  }

  _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, v24, buf, 0x12u);
LABEL_14:
  if (v8 == v8 % mFramesPerPacket) {
    unsigned int v25 = 1;
  }
  else {
    unsigned int v25 = v8 / mFramesPerPacket * mFramesPerPacket;
  }
  self->_unsigned int convertPacketCount = v25 / self->_opusOutASBD.mFramesPerPacket + 1;
  unsigned int v26 = (os_log_s *)CSLogCategoryAudio;
  if (os_log_type_enabled(CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    int v36 = "-[CSAudioConverter _configureAudioConverter:]";
    __int16 v37 = 1026;
    LODWORD(v38) = v25;
    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "%s _configureAudioConverter: final framesPerBuffer: %{public}u",  buf,  0x12u);
    unsigned int v26 = (os_log_s *)CSLogCategoryAudio;
  }

  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int convertPacketCount = self->_convertPacketCount;
    *(_DWORD *)buf = 136315394;
    int v36 = "-[CSAudioConverter _configureAudioConverter:]";
    __int16 v37 = 1026;
    LODWORD(v38) = convertPacketCount;
    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "%s _configureAudioConverter: _convertPacketCount: %{public}u",  buf,  0x12u);
  }

  UInt32 ioPropertyDataSize = 4;
  OSStatus v28 = AudioConverterGetProperty(a3, 0x786F7073u, &ioPropertyDataSize, &v33);
  v29 = (os_log_s *)CSLogCategoryAudio;
  if (os_log_type_enabled(CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    int v36 = "-[CSAudioConverter _configureAudioConverter:]";
    __int16 v37 = 1026;
    LODWORD(v38) = v28;
    _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "%s _configureAudioConverter: AudioConverterGetProperty(MaximumOutputPacketSize): returned status %{public}d",  buf,  0x12u);
  }

  if (!v28)
  {
    v30 = (os_log_s *)CSLogCategoryAudio;
    if (os_log_type_enabled(CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      int v36 = "-[CSAudioConverter _configureAudioConverter:]";
      __int16 v37 = 1026;
      LODWORD(v38) = v33;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "%s createAudioConverter: outputSizePerPacket: %{public}u",  buf,  0x12u);
      v30 = (os_log_s *)CSLogCategoryAudio;
    }

    if (outPropertyData <= v33 * self->_convertPacketCount) {
      unsigned int v31 = v33 * self->_convertPacketCount;
    }
    else {
      unsigned int v31 = outPropertyData;
    }
    self->_convertAudioCapacity = v31;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      int v36 = "-[CSAudioConverter _configureAudioConverter:]";
      __int16 v37 = 1026;
      LODWORD(v38) = v31;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "%s _configureAudioConverter: _convertAudioCapacity %{public}u bytes",  buf,  0x12u);
    }
  }

- (CSAudioConverterDelegate)delegate
{
  return (CSAudioConverterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)opusConverter
{
  v2 = objc_alloc(&OBJC_CLASS___CSAudioConverter);
  +[CSFAudioStreamBasicDescriptionFactory lpcmInt16ASBD]( &OBJC_CLASS___CSFAudioStreamBasicDescriptionFactory,  "lpcmInt16ASBD");
  +[CSFAudioStreamBasicDescriptionFactory opusASBD](&OBJC_CLASS___CSFAudioStreamBasicDescriptionFactory, "opusASBD");
  return -[CSAudioConverter initWithInASBD:outASBD:](v2, "initWithInASBD:outASBD:", v5, &v4);
}

+ (id)narrowBandOpusConverter
{
  v2 = objc_alloc(&OBJC_CLASS___CSAudioConverter);
  +[CSFAudioStreamBasicDescriptionFactory lpcmInt16NarrowBandASBD]( &OBJC_CLASS___CSFAudioStreamBasicDescriptionFactory,  "lpcmInt16NarrowBandASBD");
  +[CSFAudioStreamBasicDescriptionFactory opusNarrowBandASBD]( &OBJC_CLASS___CSFAudioStreamBasicDescriptionFactory,  "opusNarrowBandASBD");
  return -[CSAudioConverter initWithInASBD:outASBD:](v2, "initWithInASBD:outASBD:", v5, &v4);
}

+ (id)speexConverter
{
  v2 = objc_alloc(&OBJC_CLASS___CSAudioConverter);
  +[CSFAudioStreamBasicDescriptionFactory lpcmInt16ASBD]( &OBJC_CLASS___CSFAudioStreamBasicDescriptionFactory,  "lpcmInt16ASBD");
  +[CSFAudioStreamBasicDescriptionFactory speexASBD](&OBJC_CLASS___CSFAudioStreamBasicDescriptionFactory, "speexASBD");
  return -[CSAudioConverter initWithInASBD:outASBD:](v2, "initWithInASBD:outASBD:", v5, &v4);
}

@end