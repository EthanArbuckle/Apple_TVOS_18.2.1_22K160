@interface SASExtractSpeechData
- (BOOL)ad_requiresDeviceContext;
- (BOOL)ad_requiresProximityInformationForDeviceContextTuples:(id)a3;
- (id)ad_executionDeviceForDeviceContextTuples:(id)a3 executionContext:(id)a4 proximityMap:(id)a5 sharedUserID:(id)a6 localDeviceIsFollower:(BOOL)a7;
@end

@implementation SASExtractSpeechData

- (BOOL)ad_requiresDeviceContext
{
  return 0;
}

- (BOOL)ad_requiresProximityInformationForDeviceContextTuples:(id)a3
{
  return 0;
}

- (id)ad_executionDeviceForDeviceContextTuples:(id)a3 executionContext:(id)a4 proximityMap:(id)a5 sharedUserID:(id)a6 localDeviceIsFollower:(BOOL)a7
{
  id v7 = a4;
  v8 = v7;
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v7 originPeerInfo]);

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue([v8 originPeerInfo]);
    }

    else
    {
      v12 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        int v14 = 136315394;
        v15 = "ADDeviceRouterResultForExecutionContextWithOriginPeer";
        __int16 v16 = 2112;
        v17 = v8;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "%s #hal executionContext: %@, doesn't have originPeer",  (uint8_t *)&v14,  0x16u);
      }

      v10 = 0LL;
    }

    v11 = -[ADDeviceRouterResult initWithPeerInfo:contextIdentifier:proximity:commandRelayProxyIdentifier:error:]( objc_alloc(&OBJC_CLASS___ADDeviceRouterResult),  "initWithPeerInfo:contextIdentifier:proximity:commandRelayProxyIdentifier:error:",  v10,  0LL,  0LL,  0LL,  0LL);
  }

  else
  {
    v11 = 0LL;
  }

  return v11;
}

@end