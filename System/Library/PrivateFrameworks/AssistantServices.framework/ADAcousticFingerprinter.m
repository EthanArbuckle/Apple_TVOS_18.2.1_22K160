@interface ADAcousticFingerprinter
- (ADAcousticFingerprinter)init;
- (ADAcousticFingerprinterDelegate)delegate;
- (BOOL)_needsConversion;
- (id)_connection;
- (id)_convertPCMDataForFingerprinting:(id)a3;
- (id)_service;
- (id)_serviceWithErrorHandler:(id)a3;
- (unint64_t)_samplesPerInterval;
- (void)_cleanUpConnection;
- (void)_configureWithCurrentASBD;
- (void)_connectionInterrupted;
- (void)_connectionInvalidated;
- (void)appendPCMData:(id)a3;
- (void)dealloc;
- (void)flush;
- (void)reset;
- (void)setASBD:(AudioStreamBasicDescription *)a3;
- (void)setDelegate:(id)a3;
- (void)setFingerprintInterval:(double)a3;
@end

@implementation ADAcousticFingerprinter

- (ADAcousticFingerprinter)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___ADAcousticFingerprinter;
  v2 = -[ADAcousticFingerprinter init](&v8, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("ADAcousticFingerprinter", v4);
    v6 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v5;

    *((void *)v2 + 6) = 0x40CF400000000000LL;
    *(_OWORD *)(v2 + 56) = 0u;
    *(_OWORD *)(v2 + 72) = 0u;
    *((void *)v2 + 11) = 0x3FF0000000000000LL;
    *((void *)v2 + 5) = [v2 _samplesPerInterval];
  }

  return (ADAcousticFingerprinter *)v2;
}

- (void)dealloc
{
  fingerprinterConverter = self->_fingerprinterConverter;
  -[ADAcousticFingerprinter _cleanUpConnection](self, "_cleanUpConnection");
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___ADAcousticFingerprinter;
  -[ADAcousticFingerprinter dealloc](&v4, "dealloc");
}

- (id)_connection
{
  asxConnection = self->_asxConnection;
  if (!asxConnection)
  {
    objc_super v4 = -[NSXPCConnection initWithServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCConnection),  "initWithServiceName:",  @"com.apple.siri.acousticsignature");
    dispatch_queue_t v5 = self->_asxConnection;
    self->_asxConnection = v4;

    -[NSXPCConnection _setQueue:](self->_asxConnection, "_setQueue:", self->_queue);
    v6 = self->_asxConnection;
    v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___ASXSignatureExtracting));
    -[NSXPCConnection setRemoteObjectInterface:](v6, "setRemoteObjectInterface:", v7);

    objc_initWeak(&location, self);
    objc_super v8 = self->_asxConnection;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100135B90;
    v13[3] = &unk_1004FAF58;
    objc_copyWeak(&v14, &location);
    -[NSXPCConnection setInterruptionHandler:](v8, "setInterruptionHandler:", v13);
    v9 = self->_asxConnection;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100135BBC;
    v11[3] = &unk_1004FAF58;
    objc_copyWeak(&v12, &location);
    -[NSXPCConnection setInvalidationHandler:](v9, "setInvalidationHandler:", v11);
    -[NSXPCConnection resume](self->_asxConnection, "resume");
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
    asxConnection = self->_asxConnection;
  }

  return asxConnection;
}

- (void)_connectionInterrupted
{
  dispatch_queue_attr_t v3 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    dispatch_queue_t v5 = "-[ADAcousticFingerprinter _connectionInterrupted]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }

  -[ADAcousticFingerprinter _cleanUpConnection](self, "_cleanUpConnection");
}

- (void)_connectionInvalidated
{
  dispatch_queue_attr_t v3 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    dispatch_queue_t v5 = "-[ADAcousticFingerprinter _connectionInvalidated]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }

  -[ADAcousticFingerprinter _cleanUpConnection](self, "_cleanUpConnection");
}

- (void)_cleanUpConnection
{
  asxConnection = self->_asxConnection;
  if (asxConnection)
  {
    -[NSXPCConnection setExportedObject:](asxConnection, "setExportedObject:", 0LL);
    -[NSXPCConnection invalidate](self->_asxConnection, "invalidate");
    int v4 = self->_asxConnection;
    self->_asxConnection = 0LL;
  }

- (id)_service
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ADAcousticFingerprinter _connection](self, "_connection"));
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 remoteObjectProxy]);

  return v3;
}

- (id)_serviceWithErrorHandler:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADAcousticFingerprinter _connection](self, "_connection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 remoteObjectProxyWithErrorHandler:v4]);

  return v6;
}

- (unint64_t)_samplesPerInterval
{
  return (unint64_t)(self->_sourceASBD.mSampleRate * self->_interval);
}

- (void)setFingerprintInterval:(double)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100135B80;
  v4[3] = &unk_1004FD0A0;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)setASBD:(AudioStreamBasicDescription *)a3
{
  if (a3)
  {
    __int128 v3 = *(_OWORD *)&a3->mSampleRate;
    __int128 v4 = *(_OWORD *)&a3->mBytesPerPacket;
    *(void *)&self->_sourceASBD.mBitsPerChannel = *(void *)&a3->mBitsPerChannel;
    *(_OWORD *)&self->_sourceASBD.mSampleRate = v3;
    *(_OWORD *)&self->_sourceASBD.mBytesPerPacket = v4;
    -[ADAcousticFingerprinter _configureWithCurrentASBD](self, "_configureWithCurrentASBD");
  }

- (void)_configureWithCurrentASBD
{
  self->_nextFingerprintSampleNumber = -[ADAcousticFingerprinter _samplesPerInterval](self, "_samplesPerInterval");
  __int128 v3 = (os_log_s *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    int mSampleRate = (int)self->_sourceASBD.mSampleRate;
    LODWORD(buf.mSampleRate) = 136315394;
    *(void *)((char *)&buf.mSampleRate + 4) = "-[ADAcousticFingerprinter _configureWithCurrentASBD]";
    LOWORD(buf.mFormatFlags) = 1024;
    *(AudioFormatFlags *)((char *)&buf.mFormatFlags + 2) = mSampleRate;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%s Setting sample rate to %d",  (uint8_t *)&buf,  0x12u);
  }

  uint64_t v5 = sub_100135848((uint64_t)self->_sourceASBD.mSampleRate);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ADAcousticFingerprinter _service](self, "_service"));
  [v6 setSampleRate:v5];

  fingerprinterConverter = self->_fingerprinterConverter;
  if (fingerprinterConverter)
  {
    AudioConverterDispose(fingerprinterConverter);
    self->_fingerprinterConverter = 0LL;
  }

  if (-[ADAcousticFingerprinter _needsConversion](self, "_needsConversion"))
  {
    *(_OWORD *)&buf.int mSampleRate = xmmword_1003C9DF8;
    *(_OWORD *)&buf.mBytesPerPacket = unk_1003C9E08;
    *(void *)&buf.mBitsPerChannel = 16LL;
    buf.int mSampleRate = self->_sourceASBD.mSampleRate;
    OSStatus v8 = AudioConverterNew(&self->_sourceASBD, &buf, &self->_fingerprinterConverter);
    if (v8)
    {
      unsigned int v10 = bswap32(v8);
      v9 = (os_log_s *)AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v11 = 136315650;
        id v12 = "-[ADAcousticFingerprinter _configureWithCurrentASBD]";
        __int16 v13 = 1042;
        int v14 = 4;
        __int16 v15 = 2082;
        v16 = &v10;
        _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%s Could not make Fingerprinter decoder: %{public}.4s",  v11,  0x1Cu);
      }
    }
  }

- (BOOL)_needsConversion
{
  return self->_sourceASBD.mFormatFlags != 12 || self->_sourceASBD.mBytesPerPacket != 2;
}

- (id)_convertPCMDataForFingerprinting:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && self->_fingerprinterConverter)
  {
    unint64_t v6 = 2 * (uint64_t)[v4 length] / (unint64_t)self->_sourceASBD.mBytesPerPacket;
    unint64_t v7 = (unint64_t)[v5 length] / self->_sourceASBD.mBytesPerPacket;
    OSStatus v8 = -[NSMutableData initWithLength:](objc_alloc(&OBJC_CLASS___NSMutableData), "initWithLength:", v6);
    UInt32 ioOutputDataPacketSize = v7;
    outOutputData.mNumberBuffers = 1;
    outOutputData.mBuffers[0].mNumberChannels = 1;
    outOutputData.mBuffers[0].mDataByteSize = -[NSMutableData length](v8, "length");
    v9 = v8;
    outOutputData.mBuffers[0].mData = -[NSMutableData mutableBytes](v9, "mutableBytes");
    fingerprinterConverter = self->_fingerprinterConverter;
    inInputDataProcUserData[0] = _NSConcreteStackBlock;
    inInputDataProcUserData[1] = 3221225472LL;
    inInputDataProcUserData[2] = sub_100135AD4;
    inInputDataProcUserData[3] = &unk_1004F2AD8;
    int v17 = v7;
    id v16 = v5;
    OSStatus v11 = AudioConverterFillComplexBuffer( fingerprinterConverter,  (AudioConverterComplexInputDataProc)sub_100135B28,  inInputDataProcUserData,  &ioOutputDataPacketSize,  &outOutputData,  0LL);
    -[NSMutableData setLength:](v9, "setLength:", 2 * ioOutputDataPacketSize);
    if (v11)
    {
      unsigned int v14 = bswap32(v11);
      id v12 = (os_log_s *)AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)AudioStreamBasicDescription buf = 136315650;
        v21 = "-[ADAcousticFingerprinter _convertPCMDataForFingerprinting:]";
        __int16 v22 = 1042;
        int v23 = 4;
        __int16 v24 = 2082;
        v25 = &v14;
        _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%s Error during conversion for fingerprinter %{public}.4s",  buf,  0x1Cu);
      }
    }
  }

  else
  {
    v9 = (NSMutableData *)v4;
  }

  return v9;
}

- (void)appendPCMData:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10013565C;
  v7[3] = &unk_1004FD968;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)flush
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10013544C;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)reset
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001353E8;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(queue, block);
}

- (ADAcousticFingerprinterDelegate)delegate
{
  return (ADAcousticFingerprinterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end