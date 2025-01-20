@interface CMContinuityCaptureAudioStream
- (CMContinuityCaptureAudioStream)initWithDirection:(unsigned int)a3 owningDevice:(id)a4 deviceMode:(unsigned int)a5 plugin:(id)a6;
- (id)readInputBlock;
- (id)writeMixBlock;
- (void)startStream;
- (void)stopStream;
- (void)updateFormatsForDeviceMode:(unsigned int)a3;
- (void)writeAudioData:(id)a3 numSamples:(unsigned int)a4 startingSampleTime:(unint64_t)a5 zeroIndexSampleTimeUpdatedOut:(BOOL *)a6 zeroIndexSampleTimeOut:(double *)a7;
@end

@implementation CMContinuityCaptureAudioStream

- (CMContinuityCaptureAudioStream)initWithDirection:(unsigned int)a3 owningDevice:(id)a4 deviceMode:(unsigned int)a5 plugin:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___CMContinuityCaptureAudioStream;
  v11 = -[CMContinuityCaptureAudioStream initWithDirection:withPlugin:](&v14, "initWithDirection:withPlugin:", v8, a6);
  v12 = v11;
  if (v11)
  {
    -[CMContinuityCaptureAudioStream setStartingChannel:](v11, "setStartingChannel:", 1LL);
    objc_storeWeak((id *)&v12->_owningDevice, v10);
    v12->_ringBufferSampleCount = [v10 timestampPeriod];
    -[CMContinuityCaptureAudioStream updateFormatsForDeviceMode:](v12, "updateFormatsForDeviceMode:", v7);
  }

  return v12;
}

- (id)readInputBlock
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_5C24;
  v3[3] = &unk_10530;
  v3[4] = &self->_ringBuffer;
  return objc_retainBlock(v3);
}

- (id)writeMixBlock
{
  return &stru_10570;
}

- (void)startStream
{
  p_ringBuffer = &self->_ringBuffer;
  size_t ringBufferSampleCount = self->_ringBufferSampleCount;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CMContinuityCaptureAudioStream physicalFormat](self, "physicalFormat"));
  unsigned int v6 = [v5 bytesPerFrame];
  p_ringBuffer->totalSampleCount = ringBufferSampleCount;
  p_ringBuffer->bytesPerSample = v6;
  p_ringBuffer->buffer = (char *)calloc(ringBufferSampleCount, v6);
  p_ringBuffer->totalSize = v6 * ringBufferSampleCount;
  p_ringBuffer->valid = 1;

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CMContinuityCaptureAudioStream;
  -[CMContinuityCaptureAudioStream startStream](&v7, "startStream");
}

- (void)stopStream
{
  self->_ringBuffer.valid = 0;
  free(self->_ringBuffer.buffer);
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CMContinuityCaptureAudioStream;
  -[CMContinuityCaptureAudioStream stopStream](&v3, "stopStream");
}

- (void)writeAudioData:(id)a3 numSamples:(unsigned int)a4 startingSampleTime:(unint64_t)a5 zeroIndexSampleTimeUpdatedOut:(BOOL *)a6 zeroIndexSampleTimeOut:(double *)a7
{
  v12 = (char *)[a3 bytes];
  p_ringBuffer = &self->_ringBuffer;
  if (p_ringBuffer->valid)
  {
    uint64_t bytesPerSample = p_ringBuffer->bytesPerSample;
    size_t v15 = bytesPerSample * a4;
    if ((_DWORD)v15)
    {
      unint64_t totalSize = p_ringBuffer->totalSize;
      if (v15 < totalSize)
      {
        v17 = v12;
        unint64_t v18 = bytesPerSample * a5 % totalSize;
        if (((int)v15 + (int)v18 - 1) % totalSize <= v18)
        {
          size_t v20 = (totalSize - v18);
          memcpy(&p_ringBuffer->buffer[v18], v12, v20);
          memcpy(p_ringBuffer->buffer, &v17[v20], (v15 - v20));
          a5 += (int)(v20 / p_ringBuffer->bytesPerSample);
        }

        else
        {
          memcpy(&p_ringBuffer->buffer[v18], v12, v15);
          if ((_DWORD)v18)
          {
            BOOL v19 = 0;
            if (!a6)
            {
LABEL_11:
              if (a7) {
                *a7 = p_ringBuffer->zeroIndexSampleTime;
              }
              return;
            }

- (void)updateFormatsForDeviceMode:(unsigned int)a3
{
  uint64_t v23 = 0LL;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  if (a3 == 1667329132)
  {
    v4 = &ContinuityCaptureTelephonyModeOutputASBD;
  }

  else
  {
    if (a3 != 1684434036) {
      goto LABEL_6;
    }
    v4 = &ContinuityCaptureDefaultModeOutputASBD;
  }

  __int128 v5 = v4[1];
  __int128 v21 = *v4;
  __int128 v22 = v5;
  uint64_t v23 = *((void *)v4 + 4);
LABEL_6:
  id v6 = [[ASDStreamFormat alloc] initWithAudioStreamBasicDescription:&v21];
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owningDevice);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "samplingRates", 0));

  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v28 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      v13 = 0LL;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_super v14 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)v13);
        id v15 = [v6 copy];
        [v14 doubleValue];
        objc_msgSend(v15, "setSampleRate:");
        [v14 doubleValue];
        objc_msgSend(v15, "setMinimumSampleRate:");
        [v14 doubleValue];
        objc_msgSend(v15, "setMaximumSampleRate:");
        [v7 addObject:v15];

        v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v17 objects:v28 count:16];
    }

    while (v11);
  }

  id v16 = objc_loadWeakRetained((id *)&self->_owningDevice);
  [v16 samplingRate];
  objc_msgSend(v6, "setSampleRate:");

  -[CMContinuityCaptureAudioStream setPhysicalFormat:](self, "setPhysicalFormat:", v6);
  -[CMContinuityCaptureAudioStream setPhysicalFormats:](self, "setPhysicalFormats:", v7);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v25 = self;
    __int16 v26 = 2112;
    id v27 = v6;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ updated format to %@", buf, 0x16u);
  }
}

- (void).cxx_destruct
{
}

@end