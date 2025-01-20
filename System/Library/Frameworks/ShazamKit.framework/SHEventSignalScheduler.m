@interface SHEventSignalScheduler
- (void)sendEventSignal:(id)a3;
@end

@implementation SHEventSignalScheduler

- (void)sendEventSignal:(id)a3
{
  id v3 = a3;
  uint64_t v4 = BiomeLibrary();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 Discoverability]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 Signals]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 source]);

  id v9 = [[BMDiscoverabilitySignals alloc] initWithContentIdentifier:v3 context:0 osBuild:0 userInfo:0];
  uint64_t v10 = sh_log_object([v8 sendEvent:v9]);
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 138412290;
    id v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Sent signal event: %@", (uint8_t *)&v12, 0xCu);
  }
}

@end