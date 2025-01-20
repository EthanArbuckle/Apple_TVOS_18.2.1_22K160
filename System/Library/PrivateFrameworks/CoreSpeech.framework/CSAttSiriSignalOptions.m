@interface CSAttSiriSignalOptions
- (CSAttSiriSignalOptions)initWithAttendingOptions:(id)a3 audioStreamRequest:(id)a4;
- (CSAttendingOptions)attendingOptions;
- (CSAudioStreamRequest)audioStreamRequest;
@end

@implementation CSAttSiriSignalOptions

- (CSAttSiriSignalOptions)initWithAttendingOptions:(id)a3 audioStreamRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___CSAttSiriSignalOptions;
  v8 = -[CSAttSiriSignalOptions init](&v14, "init");
  if (v8)
  {
    v9 = (CSAttendingOptions *)[v6 copy];
    attendingOptions = v8->_attendingOptions;
    v8->_attendingOptions = v9;

    v11 = (CSAudioStreamRequest *)[v7 copy];
    audioStreamRequest = v8->_audioStreamRequest;
    v8->_audioStreamRequest = v11;
  }

  return v8;
}

- (CSAttendingOptions)attendingOptions
{
  return self->_attendingOptions;
}

- (CSAudioStreamRequest)audioStreamRequest
{
  return self->_audioStreamRequest;
}

- (void).cxx_destruct
{
}

@end