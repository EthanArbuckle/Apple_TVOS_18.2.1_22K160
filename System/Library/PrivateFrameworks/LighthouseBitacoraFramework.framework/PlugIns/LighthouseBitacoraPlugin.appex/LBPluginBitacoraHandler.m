@interface LBPluginBitacoraHandler
+ (BOOL)emitPerformTrialTaskEvent:(id)a3 succeeded:(BOOL)a4 error:(id)a5;
+ (BOOL)emitStopEvent:(id)a3 succeeded:(BOOL)a4 error:(id)a5;
@end

@implementation LBPluginBitacoraHandler

+ (BOOL)emitPerformTrialTaskEvent:(id)a3 succeeded:(BOOL)a4 error:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[LBFEventManager sharedInstance](&OBJC_CLASS___LBFEventManager, "sharedInstance"));
  id v10 = objc_alloc(&OBJC_CLASS___LBFTrialIdentifiers);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v8 experimentId]);
  id v12 = [v8 deploymentId];
  v13 = (void *)objc_claimAutoreleasedReturnValue([v8 treatmentId]);

  id v14 = [v10 initWithExperimentID:v11 deploymentID:v12 treatmentID:v13];
  id v15 = [[LBFLighthouseEvent alloc] initWithPerformTrialTaskStatus:v5 error:v7 usePrivateUpload:0];

  uint64_t v17 = 0LL;
  LOBYTE(v7) = [v9 addLighthousePluginEvent:v15 identifiers:v14 error:&v17];

  return (char)v7;
}

+ (BOOL)emitStopEvent:(id)a3 succeeded:(BOOL)a4 error:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[LBFEventManager sharedInstance](&OBJC_CLASS___LBFEventManager, "sharedInstance"));
  id v10 = objc_alloc(&OBJC_CLASS___LBFTrialIdentifiers);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v8 experimentId]);
  id v12 = [v8 deploymentId];
  v13 = (void *)objc_claimAutoreleasedReturnValue([v8 treatmentId]);

  id v14 = [v10 initWithExperimentID:v11 deploymentID:v12 treatmentID:v13];
  id v15 = [[LBFLighthouseEvent alloc] initWithStop:v5 error:v7];

  uint64_t v17 = 0LL;
  LOBYTE(v7) = [v9 addLighthousePluginEvent:v15 identifiers:v14 error:&v17];

  return (char)v7;
}

@end