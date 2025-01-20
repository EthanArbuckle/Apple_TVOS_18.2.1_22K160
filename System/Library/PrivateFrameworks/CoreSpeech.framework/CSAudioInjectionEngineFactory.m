@interface CSAudioInjectionEngineFactory
+ (id)engineWithDeviceType:(int64_t)a3 streamHandleId:(unint64_t)a4;
@end

@implementation CSAudioInjectionEngineFactory

+ (id)engineWithDeviceType:(int64_t)a3 streamHandleId:(unint64_t)a4
{
  else {
    v4 = (&off_10022E838)[a3 - 5];
  }
  return [objc_alloc(*v4) initWithStreamHandleId:a4];
}

@end