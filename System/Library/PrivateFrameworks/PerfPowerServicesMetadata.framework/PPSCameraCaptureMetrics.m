@interface PPSCameraCaptureMetrics
+ (id)allDeclMetrics;
+ (id)cameraInPocketDecision;
+ (id)subsystem;
@end

@implementation PPSCameraCaptureMetrics

+ (id)subsystem
{
  return @"CameraCapture";
}

+ (id)allDeclMetrics
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [(id)objc_opt_class() cameraInPocketDecision];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 addObjectsFromArray:v3];

  return v2;
}

+ (id)cameraInPocketDecision
{
  v15[3] = *MEMORY[0x1895F89C0];
  v2 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v3 = +[PPSCameraCaptureMetrics subsystem](&OBJC_CLASS___PPSCameraCaptureMetrics, "subsystem");
  v4 = +[PPSUnit dimensionless](&OBJC_CLASS___PPSUnit, "dimensionless");
  v5 = +[PPSCadence cadenceEventXPCWithFrequency:](&OBJC_CLASS___PPSCadence, "cadenceEventXPCWithFrequency:", 2LL);
  v6 = -[PPSMetric initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapability:population:obfuscation:privacyClassification:optionalPayload:]( v2,  "initWithName:subsystem:category:version:datatype:unit:cadence:directionality:storage:timeToLive:mode:deviceCapa bility:population:obfuscation:privacyClassification:optionalPayload:",  @"InPocketDecision",  v3,  @"PocketDetection",  5LL,  v4,  v5,  1.0,  0x200000003LL,  0x100000001LL,  0x300000001LL,  0x100000001LL,  0LL);

  v7 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v8 = +[PPSUnit seconds](&OBJC_CLASS___PPSUnit, "seconds");
  v9 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v7,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"DetectionSessionStartTime",  8LL,  v8,  v6,  0LL,  1.0);

  v10 = objc_alloc(&OBJC_CLASS___PPSMetric);
  v11 = +[PPSUnit seconds](&OBJC_CLASS___PPSUnit, "seconds");
  v12 = -[PPSMetric initWithName:version:datatype:unit:baseMetric:optionalPayload:]( v10,  "initWithName:version:datatype:unit:baseMetric:optionalPayload:",  @"DetectionSessionStopTime",  8LL,  v11,  v6,  0LL,  1.0);

  v15[0] = v6;
  v15[1] = v9;
  v15[2] = v12;
  [MEMORY[0x189603F18] arrayWithObjects:v15 count:3];
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end