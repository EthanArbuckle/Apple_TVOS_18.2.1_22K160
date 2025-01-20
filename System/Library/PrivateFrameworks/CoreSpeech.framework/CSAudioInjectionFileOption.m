@interface CSAudioInjectionFileOption
- (AudioStreamBasicDescription)outASBD;
- (CSAudioInjectionFileOption)initWithAudioURL:(id)a3 withScaleFactor:(float)a4 outASBD:(AudioStreamBasicDescription *)a5;
- (NSURL)audioURL;
- (OpaqueExtAudioFile)fFile;
- (float)scaleFactor;
- (id)description;
- (void)setFFile:(OpaqueExtAudioFile *)a3;
- (void)setOutASBD:(AudioStreamBasicDescription *)a3;
@end

@implementation CSAudioInjectionFileOption

- (CSAudioInjectionFileOption)initWithAudioURL:(id)a3 withScaleFactor:(float)a4 outASBD:(AudioStreamBasicDescription *)a5
{
  id v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___CSAudioInjectionFileOption;
  v10 = -[CSAudioInjectionFileOption init](&v15, "init");
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_audioURL, a3);
    __int128 v12 = *(_OWORD *)&a5->mSampleRate;
    __int128 v13 = *(_OWORD *)&a5->mBytesPerPacket;
    *(void *)&v11->_outASBD.mBitsPerChannel = *(void *)&a5->mBitsPerChannel;
    *(_OWORD *)&v11->_outASBD.mSampleRate = v12;
    *(_OWORD *)&v11->_outASBD.mBytesPerPacket = v13;
    v11->_scaleFactor = a4;
  }

  return v11;
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"audioURL : %@, numberOfChannels : %lu, scaleFactor: %f",  self->_audioURL,  self->_outASBD.mChannelsPerFrame,  self->_scaleFactor);
}

- (NSURL)audioURL
{
  return self->_audioURL;
}

- (AudioStreamBasicDescription)outASBD
{
  __int128 v3 = *(_OWORD *)&self[1].mFormatID;
  *(_OWORD *)&retstr->mSampleRate = *(_OWORD *)&self->mBitsPerChannel;
  *(_OWORD *)&retstr->mBytesPerPacket = v3;
  *(void *)&retstr->mBitsPerChannel = *(void *)&self[1].mBytesPerFrame;
  return self;
}

- (void)setOutASBD:(AudioStreamBasicDescription *)a3
{
  __int128 v3 = *(_OWORD *)&a3->mSampleRate;
  __int128 v4 = *(_OWORD *)&a3->mBytesPerPacket;
  *(void *)&self->_outASBD.mBitsPerChannel = *(void *)&a3->mBitsPerChannel;
  *(_OWORD *)&self->_outASBD.mSampleRate = v3;
  *(_OWORD *)&self->_outASBD.mBytesPerPacket = v4;
}

- (OpaqueExtAudioFile)fFile
{
  return self->_fFile;
}

- (void)setFFile:(OpaqueExtAudioFile *)a3
{
  self->_fFile = a3;
}

- (float)scaleFactor
{
  return self->_scaleFactor;
}

- (void).cxx_destruct
{
}

@end