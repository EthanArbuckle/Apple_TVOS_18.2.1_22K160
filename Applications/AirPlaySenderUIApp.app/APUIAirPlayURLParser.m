@interface APUIAirPlayURLParser
+ (id)setupPayloadFromAirPlayURL:(id)a3;
@end

@implementation APUIAirPlayURLParser

+ (id)setupPayloadFromAirPlayURL:(id)a3
{
  v3 = (__CFString *)a3;
  v4 = v3;
  if (dword_1000160D0 <= 50)
  {
    if (dword_1000160D0 != -1 || (v3 = (__CFString *)_LogCategory_Initialize(&dword_1000160D0, 33554482LL), (_DWORD)v3))
    {
      else {
        v5 = v4;
      }
      LogPrintF( &dword_1000160D0,  "+[APUIAirPlayURLParser setupPayloadFromAirPlayURL:]",  33554482LL,  "Parsing AirPlay URL: %@",  v5);
    }
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLComponents componentsWithString:](&OBJC_CLASS___NSURLComponents, "componentsWithString:", v4));
  if (!v6)
  {
    uint64_t v26 = 30LL;
LABEL_61:
    APSLogErrorAt(0LL, "+[APUIAirPlayURLParser setupPayloadFromAirPlayURL:]", v26, 0LL);
    v13 = 0LL;
    goto LABEL_54;
  }

  if (dword_1000160D0 <= 50
    && (dword_1000160D0 != -1 || _LogCategory_Initialize(&dword_1000160D0, 33554482LL)))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 scheme]);
    LogPrintF( &dword_1000160D0,  "+[APUIAirPlayURLParser setupPayloadFromAirPlayURL:]",  33554482LL,  "AirPlay URL scheme: %@",  v7);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue([v6 scheme]);
  unsigned __int8 v9 = [v8 isEqualToString:@"airplay"];

  if ((v9 & 1) == 0)
  {
    uint64_t v26 = 33LL;
    goto LABEL_61;
  }

  if (dword_1000160D0 <= 50
    && (dword_1000160D0 != -1 || _LogCategory_Initialize(&dword_1000160D0, 33554482LL)))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v6 host]);
    LogPrintF( &dword_1000160D0,  "+[APUIAirPlayURLParser setupPayloadFromAirPlayURL:]",  33554482LL,  "AirPlay URL host: %@",  v10);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue([v6 host]);
  unsigned __int8 v12 = [v11 isEqualToString:@"setup"];

  if ((v12 & 1) == 0)
  {
    uint64_t v26 = 36LL;
    goto LABEL_61;
  }

  v13 = objc_opt_new(&OBJC_CLASS___APUIAirPlaySetupPayload);
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  v14 = (void *)objc_claimAutoreleasedReturnValue([v6 queryItems]);
  id v15 = [v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (!v15) {
    goto LABEL_53;
  }
  id v16 = v15;
  uint64_t v17 = *(void *)v28;
  while (2)
  {
    for (i = 0LL; i != v16; i = (char *)i + 1)
    {
      if (*(void *)v28 != v17) {
        objc_enumerationMutation(v14);
      }
      v19 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
      v20 = (void *)objc_claimAutoreleasedReturnValue([v19 name]);
      v21 = (void *)objc_claimAutoreleasedReturnValue([v19 value]);
      id v22 = [v21 lengthOfBytesUsingEncoding:4];
      if (!v22)
      {
        uint64_t v24 = 46LL;
        goto LABEL_52;
      }

      unint64_t v23 = (unint64_t)v22;
      if ([v20 isEqualToString:@"bt"])
      {
        if (v23 <= 0x80)
        {
          -[APUIAirPlaySetupPayload setBrokerToken:](v13, "setBrokerToken:", v21);
          goto LABEL_46;
        }

        uint64_t v24 = 49LL;
LABEL_52:
        APSLogErrorAt(0LL, "+[APUIAirPlayURLParser setupPayloadFromAirPlayURL:]", v24, 0LL);

        v13 = 0LL;
        goto LABEL_53;
      }

      if ([v20 isEqualToString:@"rp"])
      {
        if (v23 > 0x80)
        {
          uint64_t v24 = 53LL;
          goto LABEL_52;
        }

        -[APUIAirPlaySetupPayload setReceiverToken:](v13, "setReceiverToken:", v21);
      }

      else if ([v20 isEqualToString:@"rr"])
      {
        -[APUIAirPlaySetupPayload setRouteToReceiver:]( v13,  "setRouteToReceiver:",  [v21 isEqualToString:@"1"]);
      }

      else if ([v20 isEqualToString:@"wid"])
      {
        if (v23 > 0x20)
        {
          uint64_t v24 = 60LL;
          goto LABEL_52;
        }

        -[APUIAirPlaySetupPayload setWifiSSID:](v13, "setWifiSSID:", v21);
      }

      else if ([v20 isEqualToString:@"wp"])
      {
        if (v23 > 0x80)
        {
          uint64_t v24 = 64LL;
          goto LABEL_52;
        }

        -[APUIAirPlaySetupPayload setWifiPassphrase:](v13, "setWifiPassphrase:", v21);
      }

      else if ([v20 isEqualToString:@"ca"])
      {
        if (v23 > 0x400)
        {
          uint64_t v24 = 68LL;
          goto LABEL_52;
        }

        -[APUIAirPlaySetupPayload setCaptivePortalAuthToken:](v13, "setCaptivePortalAuthToken:", v21);
      }

      else if ([v20 isEqualToString:@"h"])
      {
        -[APUIAirPlaySetupPayload setIsNetworkHidden:]( v13,  "setIsNetworkHidden:",  [v21 isEqualToString:@"1"]);
      }

@end