@interface AVSystemController
+ (id)pb_measuredHDMILatencyDefaultValueDictionary;
@end

@implementation AVSystemController

+ (id)pb_measuredHDMILatencyDefaultValueDictionary
{
  v3[0] = AVSystemController_MeasuredHDMILatency_MeasuredAudioHDMILatency24Hz;
  v3[1] = AVSystemController_MeasuredHDMILatency_MeasuredAudioHDMILatency60Hz;
  v4[0] = &off_1003FECA0;
  v4[1] = &off_1003FECA0;
  v3[2] = AVSystemController_MeasuredHDMILatency_MeasuredVideoHDMILatency24Hz;
  v3[3] = AVSystemController_MeasuredHDMILatency_MeasuredVideoHDMILatency60Hz;
  v4[2] = &off_1003FECA0;
  v4[3] = &off_1003FECA0;
  return (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  4LL));
}

@end