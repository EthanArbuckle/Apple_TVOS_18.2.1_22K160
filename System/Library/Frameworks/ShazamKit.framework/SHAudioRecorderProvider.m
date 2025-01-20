@interface SHAudioRecorderProvider
+ (id)availableRecorders;
+ (id)iOSAudioRecorders;
+ (id)macOSAudioRecorders;
+ (id)simulatorRecorders;
+ (id)tvOSAudioRecorders;
+ (id)watchOSAudioRecorders;
@end

@implementation SHAudioRecorderProvider

+ (id)simulatorRecorders
{
  return [a1 iOSAudioRecorders];
}

+ (id)iOSAudioRecorders
{
  v2 = -[SHAudioRecorder initWithRecordingSource:]( objc_alloc(&OBJC_CLASS___SHAudioRecorder),  "initWithRecordingSource:",  2LL);
  v6[0] = v2;
  v3 = -[SHAudioRecorder initWithRecordingSource:]( objc_alloc(&OBJC_CLASS___SHAudioRecorder),  "initWithRecordingSource:",  1LL);
  v6[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v6, 2LL));

  return v4;
}

+ (id)watchOSAudioRecorders
{
  v2 = -[SHAudioRecorder initWithRecordingSource:]( objc_alloc(&OBJC_CLASS___SHAudioRecorder),  "initWithRecordingSource:",  2LL);
  v5 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v5, 1LL));

  return v3;
}

+ (id)tvOSAudioRecorders
{
  int v2 = MGGetSInt32Answer(@"DeviceClassNumber", 0LL);
  v3 = objc_alloc(&OBJC_CLASS___SHAudioRecorder);
  if (v2 == 4)
  {
    v4 = -[SHAudioRecorder initWithRecordingSource:](v3, "initWithRecordingSource:", 1LL);
    v9 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
  }

  else
  {
    v4 = -[SHAudioRecorder initWithRecordingSource:](v3, "initWithRecordingSource:", 2LL);
    v6 = -[SHAudioRecorder initWithRecordingSource:]( objc_alloc(&OBJC_CLASS___SHAudioRecorder),  "initWithRecordingSource:",  1LL,  v4);
    v8[1] = v6;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v8, 2LL));
  }

  return v5;
}

+ (id)macOSAudioRecorders
{
  int v2 = -[SHAudioRecorder initWithRecordingSource:]( objc_alloc(&OBJC_CLASS___SHAudioRecorder),  "initWithRecordingSource:",  2LL);
  v6[0] = v2;
  v3 = -[SHAudioRecorder initWithRecordingSource:]( objc_alloc(&OBJC_CLASS___SHAudioRecorder),  "initWithRecordingSource:",  1LL);
  v6[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v6, 2LL));

  return v4;
}

+ (id)availableRecorders
{
  return [a1 tvOSAudioRecorders];
}

@end