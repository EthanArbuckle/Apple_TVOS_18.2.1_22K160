@interface SpatialAudioDataFuzzer
+ (id)sharedInstance;
- (SpatialAudioDataFuzzer)init;
- (id)createNoiseSoundProfileFromData:(id)a3;
@end

@implementation SpatialAudioDataFuzzer

+ (id)sharedInstance
{
  if (qword_100008B30 != -1) {
    dispatch_once(&qword_100008B30, &stru_1000041B8);
  }
  return (id)qword_100008B28;
}

- (SpatialAudioDataFuzzer)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SpatialAudioDataFuzzer;
  v2 = -[SpatialAudioDataFuzzer init](&v6, "init");
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (id)createNoiseSoundProfileFromData:(id)a3
{
  v5 = (IR::IRData *)a3;
  if (v5)
  {
    if (!self->_dataFuzzerStructRef)
    {
      objc_super v6 = (SpatialAudioDataFuzzerStruct *)operator new(1uLL);
      *(_BYTE *)objc_super v6 = 0;
      self->_dataFuzzerStructRef = v6;
    }

    NoisySoundProfilePack = (void *)IR::IRData::createNoisySoundProfilePack(v5, v4);
    dataFuzzerStructRef = self->_dataFuzzerStructRef;
    if (dataFuzzerStructRef) {
      operator delete(dataFuzzerStructRef);
    }
    self->_dataFuzzerStructRef = 0LL;
  }

  else
  {
    NoisySoundProfilePack = 0LL;
  }

  return NoisySoundProfilePack;
}

@end