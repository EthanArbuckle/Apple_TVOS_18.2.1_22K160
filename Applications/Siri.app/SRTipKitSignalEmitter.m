@interface SRTipKitSignalEmitter
+ (void)_checkAndEmitBluetoothInvocationSourcePerVehicle:(id)a3 forRequestOptions:(id)a4 btManager:(id)a5;
+ (void)_checkAndEmitCarPlayInvocationSourcePerVehicle:(id)a3 forRequestOptions:(id)a4 accessoryManager:(id)a5;
+ (void)_checkAndEmitHSSignalsWithSource:(id)a3 forRequestOptions:(id)a4;
+ (void)checkAndEmitSignalsForRequestOptions:(id)a3;
@end

@implementation SRTipKitSignalEmitter

+ (void)checkAndEmitSignalsForRequestOptions:(id)a3
{
  id v4 = a3;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10000D19C;
  v8[3] = &unk_1000BA0A0;
  id v9 = v4;
  id v10 = a1;
  id v7 = v4;
  dispatch_async(v6, v8);
}

+ (void)_checkAndEmitHSSignalsWithSource:(id)a3 forRequestOptions:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  if ([v5 isForStark])
  {
    if ([v5 requestSource] == (id)8 || objc_msgSend(v5, "requestSource") == (id)44)
    {
      v6 = @"com.apple.siri.hs.on.carplay";
LABEL_8:
      id v7 = [[BMDiscoverabilitySignalEvent alloc] initWithIdentifier:v6 bundleID:@"com.apple.siri" context:0];
      [v8 sendEvent:v7];

      goto LABEL_9;
    }

    if ([v5 requestSource] == (id)10 || objc_msgSend(v5, "requestSource") == (id)43)
    {
      v6 = @"com.apple.siri.button.on.carplay";
      goto LABEL_8;
    }
  }

+ (void)_checkAndEmitCarPlayInvocationSourcePerVehicle:(id)a3 forRequestOptions:(id)a4 accessoryManager:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a5 connectedAccessories]);
  id v10 = objc_alloc_init(&OBJC_CLASS___NSData);
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  id v11 = v9;
  id v12 = [v11 countByEnumeratingWithState:&v30 objects:v40 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v31;
    while (2)
    {
      for (i = 0LL; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v31 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
        if (objc_msgSend(v16, "supportsCarPlay", (void)v30))
        {
          v17 = (void *)AFSiriLogContextConnection;
          if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
          {
            v18 = v17;
            v19 = (__CFString *)objc_claimAutoreleasedReturnValue([v16 certSerial]);
            *(_DWORD *)buf = 136315394;
            v35 = "+[SRTipKitSignalEmitter _checkAndEmitCarPlayInvocationSourcePerVehicle:forRequestOptions:accessoryManager:]";
            __int16 v36 = 2112;
            v37 = v19;
            _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%s #tipKitSignalEmitter certSerial %@",  buf,  0x16u);
          }

          uint64_t v20 = objc_claimAutoreleasedReturnValue([v16 certSerial]);

          id v10 = (NSData *)v20;
          goto LABEL_13;
        }
      }

      id v13 = [v11 countByEnumeratingWithState:&v30 objects:v40 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

+ (void)_checkAndEmitBluetoothInvocationSourcePerVehicle:(id)a3 forRequestOptions:(id)a4 btManager:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "connectedDevices", 0));
  id v11 = [v10 countByEnumeratingWithState:&v24 objects:v34 count:16];
  if (v11)
  {
    id v12 = v11;
    id v13 = 0LL;
    uint64_t v14 = *(void *)v25;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v10);
        }
        v16 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
        if ((objc_msgSend(v16, "ac_isEyesFree") & 1) != 0
          || objc_msgSend(v16, "ac_isBluetoothVehicle"))
        {
          uint64_t v17 = objc_claimAutoreleasedReturnValue([v16 address]);

          id v13 = (void *)v17;
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v24 objects:v34 count:16];
    }

    while (v12);
  }

  else
  {
    id v13 = 0LL;
  }

  if ((([v8 isForEyesFree] & 1) != 0 || objc_msgSend( v8,  "isForBluetoothCar"))
    && v13)
  {
    v18 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setValue:forKey:](v18, "setValue:forKey:", v13, @"btAddress");
    -[NSMutableDictionary setValue:forKey:](v18, "setValue:forKey:", @"YES", @"isBluetoothCar");
    -[NSMutableDictionary setValue:forKey:](v18, "setValue:forKey:", @"NO", @"isCarPlay");
    uint64_t v19 = (uint64_t)[v8 requestSource];
    uint64_t v20 = &stru_1000BC638;
    if (v19 > 7)
    {
      if (v19 == 8)
      {
        uint64_t v20 = @"com.apple.siri.hs.on.bt";
      }

      else
      {
        if (v19 != 43)
        {
LABEL_24:
          v21 = (void *)AFSiriLogContextConnection;
          if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
            sub_100069FD8(v21);
          }
          goto LABEL_28;
        }

        uint64_t v20 = @"com.apple.siri.steering.wheel";
      }
    }

    else
    {
      if (v19 != 2)
      {
        if (v19 == 5) {
          uint64_t v20 = @"com.apple.siri.bt.headset";
        }
        goto LABEL_24;
      }

      uint64_t v20 = @"com.apple.siri.lock.button";
    }

@end