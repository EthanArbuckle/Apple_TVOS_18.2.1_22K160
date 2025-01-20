@interface CSOnDeviceCompilationRemoraConnectionHandler
- (void)_addEndpointToCache:(id)a3;
- (void)homeHubManager:(id)a3 didActivateEndpoint:(id)a4;
- (void)homeHubManager:(id)a3 didAddEndpoint:(id)a4;
- (void)homeHubManager:(id)a3 didDeactivateEndpoint:(id)a4;
- (void)homeHubManager:(id)a3 didDeleteEndpoint:(id)a4;
- (void)start;
@end

@implementation CSOnDeviceCompilationRemoraConnectionHandler

- (void)start
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[CSHomeHubManager sharedManager](&OBJC_CLASS___CSHomeHubManager, "sharedManager"));
  [v3 addObserver:self];
}

- (void)homeHubManager:(id)a3 didAddEndpoint:(id)a4
{
}

- (void)homeHubManager:(id)a3 didDeleteEndpoint:(id)a4
{
}

- (void)homeHubManager:(id)a3 didActivateEndpoint:(id)a4
{
}

- (void)homeHubManager:(id)a3 didDeactivateEndpoint:(id)a4
{
}

- (void)_addEndpointToCache:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 accessoryId]);
  id v5 = (id)objc_claimAutoreleasedReturnValue([v3 UUIDString]);

  v4 = (void *)objc_claimAutoreleasedReturnValue( +[CSVoiceTriggerAssetHandler sharedHandler]( &OBJC_CLASS___CSVoiceTriggerAssetHandlerMac,  "sharedHandler"));
  [v4 getVoiceTriggerAssetWithEndpointId:v5 completion:&stru_10022CE90];
}

@end