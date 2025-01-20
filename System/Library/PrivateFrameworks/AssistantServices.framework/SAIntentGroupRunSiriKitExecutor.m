@interface SAIntentGroupRunSiriKitExecutor
- (BOOL)ad_requiresProximityInformationForDeviceContextTuples:(id)a3;
- (id)ad_executionDeviceForDeviceContextTuples:(id)a3 executionContext:(id)a4 proximityMap:(id)a5 sharedUserID:(id)a6 localDeviceIsFollower:(BOOL)a7;
@end

@implementation SAIntentGroupRunSiriKitExecutor

- (BOOL)ad_requiresProximityInformationForDeviceContextTuples:(id)a3
{
  id v3 = a3;
  if (AFSupportsHALFlowRouting(v3, v4))
  {
    id v5 = sub_10029CB20(v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    id v7 = sub_10029C004(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    BOOL v9 = v8 != 0LL;
  }

  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)ad_executionDeviceForDeviceContextTuples:(id)a3 executionContext:(id)a4 proximityMap:(id)a5 sharedUserID:(id)a6 localDeviceIsFollower:(BOOL)a7
{
  id v8 = a3;
  id v37 = a5;
  if (AFSupportsHALFlowRouting(v37, v9))
  {
    id v10 = sub_10029CB20(v8);
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue(v10);
    id v11 = [obj countByEnumeratingWithState:&v38 objects:v48 count:16];
    if (v11)
    {
      id v35 = v8;
      uint64_t v12 = *(void *)v39;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v39 != v12) {
            objc_enumerationMutation(obj);
          }
          v14 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)i);
          v15 = (void *)objc_claimAutoreleasedReturnValue([v14 deviceInfo]);
          v16 = (void *)objc_claimAutoreleasedReturnValue([v15 idsDeviceUniqueIdentifier]);

          v17 = (void *)objc_claimAutoreleasedReturnValue([v37 objectForKey:v16]);
          id v18 = [v17 integerValue];

          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "af_validFlowContext"));
          uint64_t v20 = AFDeviceProximityCompare(v18, 1000LL);
          v21 = (void *)objc_claimAutoreleasedReturnValue([v19 promptContextProto]);

          v22 = (os_log_s *)AFSiriLogContextDaemon;
          if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315650;
            v43 = "-[SAIntentGroupRunSiriKitExecutor(DeviceRouting) ad_executionDeviceForDeviceContextTuples:executionCon"
                  "text:proximityMap:sharedUserID:localDeviceIsFollower:]";
            __int16 v44 = 1024;
            BOOL v45 = v20 == -1;
            __int16 v46 = 1024;
            BOOL v47 = v21 != 0LL;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEBUG,  "%s Candidate: isCloseEnough? %d, flowPrompted? %d",  buf,  0x18u);
          }

          if (v20 == -1 && v21 != 0LL)
          {
            id v11 = v14;

            goto LABEL_18;
          }
        }

        id v11 = [obj countByEnumeratingWithState:&v38 objects:v48 count:16];
      }

      while (v11);
      id v18 = 0LL;
LABEL_18:
      id v8 = v35;
    }

    else
    {
      id v18 = 0LL;
    }

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[ADDeviceCircleManager sharedInstance](&OBJC_CLASS___ADDeviceCircleManager, "sharedInstance"));
    v26 = (void *)objc_claimAutoreleasedReturnValue([v11 deviceInfo]);
    v27 = (void *)objc_claimAutoreleasedReturnValue([v25 managedPeerInfoMatchingPeerInfo:v26]);
    v28 = v27;
    if (v27) {
      id v29 = v27;
    }
    else {
      id v29 = (id)objc_claimAutoreleasedReturnValue([v11 deviceInfo]);
    }
    v30 = v29;

    v31 = -[ADPeerInfo initWithAFPeerInfo:](objc_alloc(&OBJC_CLASS___ADPeerInfo), "initWithAFPeerInfo:", v30);
    v32 = objc_alloc(&OBJC_CLASS___ADDeviceRouterResult);
    v33 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);
    v24 = -[ADDeviceRouterResult initWithPeerInfo:contextIdentifier:proximity:commandRelayProxyIdentifier:error:]( v32,  "initWithPeerInfo:contextIdentifier:proximity:commandRelayProxyIdentifier:error:",  v31,  v33,  v18,  0LL,  0LL);
  }

  else
  {
    v24 = 0LL;
  }

  return v24;
}

@end