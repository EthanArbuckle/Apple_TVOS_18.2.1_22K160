@interface ASXExtractor
- (ASXExtractor)init;
- (id)_sigx;
- (id)currentSignature;
- (int)sampleRate;
- (void)appendAcousticData:(id)a3 sampleCount:(int)a4;
- (void)reset;
- (void)setSampleRate:(int)a3;
@end

@implementation ASXExtractor

- (ASXExtractor)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___ASXExtractor;
  result = -[ASXExtractor init](&v3, "init");
  if (result) {
    result->_sampleRate = 16000;
  }
  return result;
}

- (id)_sigx
{
  p_sigx = &self->_sigx;
  sigx = self->_sigx;
  if (!sigx)
  {
    v5 = objc_alloc(&OBJC_CLASS___SigX);
    uint64_t sampleRate = self->_sampleRate;
    id v12 = 0LL;
    v7 = -[SigX initWithSignatureType:sampleRate:error:]( v5,  "initWithSignatureType:sampleRate:error:",  2LL,  sampleRate,  &v12);
    id v8 = v12;
    if (v8)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        id v9 = [v8 code];
        int v10 = self->_sampleRate;
        *(_DWORD *)buf = 134218240;
        id v14 = v9;
        __int16 v15 = 1024;
        int v16 = v10;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Error %ld setting sample rate %d",  buf,  0x12u);
      }
    }

    else
    {
      objc_storeStrong((id *)p_sigx, v7);
    }

    sigx = *p_sigx;
  }

  return sigx;
}

- (void)setSampleRate:(int)a3
{
  if (self->_sampleRate != a3)
  {
    self->_uint64_t sampleRate = a3;
    sigx = self->_sigx;
    if (sigx)
    {
      self->_sigx = 0LL;
    }
  }

- (void)appendAcousticData:(id)a3 sampleCount:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASXExtractor _sigx](self, "_sigx"));
  if (v7)
  {
    id v10 = 0LL;
    objc_msgSend(v7, "flowIntSamples:sampleCount:error:", objc_msgSend(v6, "bytes"), v4, &v10);
    id v8 = v10;
    if (v8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      id v9 = [v8 code];
      *(_DWORD *)buf = 134217984;
      id v12 = v9;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Error appending acoustic data %ld",  buf,  0xCu);
    }
  }
}

- (id)currentSignature
{
  sigx = self->_sigx;
  if (!sigx) {
    return 0LL;
  }
  __p = 0LL;
  id v10 = 0LL;
  uint64_t v11 = 0LL;
  id v8 = 0LL;
  -[SigX getSignature:error:](sigx, "getSignature:error:", &__p, &v8);
  id v3 = v8;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      id v7 = [v3 code];
      *(_DWORD *)buf = 134217984;
      id v13 = v7;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Error getting signature %ld",  buf,  0xCu);
    }

    uint64_t v4 = 0LL;
  }

  else
  {
    id v6 = objc_alloc(&OBJC_CLASS___NSData);
    uint64_t v4 = -[NSData initWithBytes:length:](v6, "initWithBytes:length:", __p, v10 - (_BYTE *)__p);
  }

  if (__p)
  {
    id v10 = __p;
    operator delete(__p);
  }

  return v4;
}

- (void)reset
{
  sigx = self->_sigx;
  if (sigx)
  {
    id v5 = 0LL;
    -[SigX resetWithError:](sigx, "resetWithError:", &v5);
    id v3 = v5;
    if (v3)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        id v4 = [v3 code];
        *(_DWORD *)buf = 134217984;
        id v7 = v4;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Error resetting %ld",  buf,  0xCu);
      }
    }
  }

- (int)sampleRate
{
  return self->_sampleRate;
}

- (void).cxx_destruct
{
}

@end