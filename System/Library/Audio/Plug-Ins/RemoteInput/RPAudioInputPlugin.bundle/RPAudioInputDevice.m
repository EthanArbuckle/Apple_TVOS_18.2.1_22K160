@interface RPAudioInputDevice
- (AVAudioFormat)format;
- (NSArray)supportedFormats;
- (NSString)description;
- (NSString)deviceIdentifier;
- (RPAudioInputDeviceDelegate)delegate;
- (id)audioInputBlock;
- (id)statusChangeBlock;
- (void)setAudioInputBlock:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceIdentifier:(id)a3;
- (void)setFormat:(id)a3;
- (void)setStatusChangeBlock:(id)a3;
- (void)setSupportedFormats:(id)a3;
- (void)startRecordingWithCompletionBlock:(id)a3;
- (void)stopRecordingWithCompletionBlock:(id)a3;
@end

@implementation RPAudioInputDevice

- (NSString)description
{
  id v5 = 0LL;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RPAudioInputDevice deviceIdentifier](self, "deviceIdentifier"));
  NSAppendPrintF(&v5, "RPAudioInputDevice ID %@", v2);
  id v3 = v5;

  return (NSString *)v3;
}

- (AVAudioFormat)format
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RPAudioInputDevice supportedFormats](self, "supportedFormats"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 firstObject]);

  return (AVAudioFormat *)v3;
}

- (void)setFormat:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (dword_D090 <= 30
    && ((v6 = v3, dword_D090 != -1) || (int v5 = _LogCategory_Initialize(&dword_D090, 30LL), v4 = v6, v5)))
  {
    LogPrintF(&dword_D090, "-[RPAudioInputDevice setFormat:]", 30LL, "Set format: %@\n", v4);
  }

  else
  {
  }

- (NSArray)supportedFormats
{
  v2 = self;
  objc_sync_enter(v2);
  supportedFormats = v2->_supportedFormats;
  if (!supportedFormats)
  {
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    uint64_t v11 = 0x40CF400000000000LL;
    LODWORD(v12) = 1869641075;
    HIDWORD(v12) = 320;
    DWORD1(v13) = 1;
    v4 = -[AVAudioFormat initWithStreamDescription:]( objc_alloc(&OBJC_CLASS___AVAudioFormat),  "initWithStreamDescription:",  &v11);
    int v5 = v4;
    if (v4)
    {
      v14 = v4;
      uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL));
      v7 = v2->_supportedFormats;
      v2->_supportedFormats = (NSArray *)v6;

      supportedFormats = v2->_supportedFormats;
    }

    else
    {
      if (dword_D090 <= 90 && (dword_D090 != -1 || _LogCategory_Initialize(&dword_D090, 90LL))) {
        LogPrintF( &dword_D090,  "-[RPAudioInputDevice supportedFormats]",  90LL,  "### Create AVAudioFormat failed: %{asbd}\n",  &v11);
      }
      v8 = v2->_supportedFormats;
      v2->_supportedFormats = (NSArray *)&__NSArray0__struct;

      supportedFormats = v2->_supportedFormats;
    }
  }

  v9 = supportedFormats;
  objc_sync_exit(v2);

  return v9;
}

- (void)setSupportedFormats:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (dword_D090 <= 30
    && ((v6 = v3, dword_D090 != -1) || (int v5 = _LogCategory_Initialize(&dword_D090, 30LL), v4 = v6, v5)))
  {
    LogPrintF(&dword_D090, "-[RPAudioInputDevice setSupportedFormats:]", 30LL, "Set supported formats: %##@\n", v4);
  }

  else
  {
  }

- (void)startRecordingWithCompletionBlock:(id)a3
{
  id v3 = (void (**)(id, void))a3;
  v3[2](v3, 0LL);
}

- (void)stopRecordingWithCompletionBlock:(id)a3
{
  v7 = (void (**)(id, void))a3;
  if (_os_feature_enabled_impl("Siri", "tv_push_to_talk"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RPAudioInputDevice delegate](self, "delegate"));
    int v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPAudioInputDevice deviceIdentifier](self, "deviceIdentifier"));
    [v4 stopRecordingWithDeviceId:v5];

    if (dword_D090 <= 30 && (dword_D090 != -1 || _LogCategory_Initialize(&dword_D090, 30LL)))
    {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPAudioInputDevice deviceIdentifier](self, "deviceIdentifier"));
      LogPrintF( &dword_D090,  "-[RPAudioInputDevice stopRecordingWithCompletionBlock:]",  30LL,  "Stop recording with device Id - %@ \n",  v6);
    }

    v7[2](v7, 0LL);
  }
}

- (id)audioInputBlock
{
  return self->_audioInputBlock;
}

- (void)setAudioInputBlock:(id)a3
{
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
}

- (id)statusChangeBlock
{
  return self->_statusChangeBlock;
}

- (void)setStatusChangeBlock:(id)a3
{
}

- (RPAudioInputDeviceDelegate)delegate
{
  return (RPAudioInputDeviceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end