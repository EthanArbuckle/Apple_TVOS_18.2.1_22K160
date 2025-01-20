@interface APUIAirPlaySetupPayload
+ (BOOL)supportsSecureCoding;
- (APUIAirPlaySetupPayload)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNetworkHidden;
- (BOOL)routeToReceiver;
- (NSString)brokerToken;
- (NSString)captivePortalAuthToken;
- (NSString)receiverToken;
- (NSString)wifiPassphrase;
- (NSString)wifiSSID;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setBrokerToken:(id)a3;
- (void)setCaptivePortalAuthToken:(id)a3;
- (void)setIsNetworkHidden:(BOOL)a3;
- (void)setReceiverToken:(id)a3;
- (void)setRouteToReceiver:(BOOL)a3;
- (void)setWifiPassphrase:(id)a3;
- (void)setWifiSSID:(id)a3;
@end

@implementation APUIAirPlaySetupPayload

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (APUIAirPlaySetupPayload)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___APUIAirPlaySetupPayload;
  v5 = -[APUIAirPlaySetupPayload init](&v17, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"wifiSSID"];
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[APUIAirPlaySetupPayload setWifiSSID:](v5, "setWifiSSID:", v7);

    id v8 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"wifiPassphrase"];
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[APUIAirPlaySetupPayload setWifiPassphrase:](v5, "setWifiPassphrase:", v9);

    id v10 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"brokerToken"];
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[APUIAirPlaySetupPayload setBrokerToken:](v5, "setBrokerToken:", v11);

    id v12 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"receiverToken"];
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    -[APUIAirPlaySetupPayload setReceiverToken:](v5, "setReceiverToken:", v13);

    -[APUIAirPlaySetupPayload setIsNetworkHidden:]( v5,  "setIsNetworkHidden:",  [v4 decodeBoolForKey:@"isNetworkHidden"]);
    -[APUIAirPlaySetupPayload setRouteToReceiver:]( v5,  "setRouteToReceiver:",  [v4 decodeBoolForKey:@"routeToReceiver"]);
    id v14 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"captivePortalAuthToken"];
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    -[APUIAirPlaySetupPayload setCaptivePortalAuthToken:](v5, "setCaptivePortalAuthToken:", v15);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APUIAirPlaySetupPayload wifiSSID](self, "wifiSSID"));
  [v4 encodeObject:v5 forKey:@"wifiSSID"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[APUIAirPlaySetupPayload wifiPassphrase](self, "wifiPassphrase"));
  [v4 encodeObject:v6 forKey:@"wifiPassphrase"];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[APUIAirPlaySetupPayload brokerToken](self, "brokerToken"));
  [v4 encodeObject:v7 forKey:@"brokerToken"];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[APUIAirPlaySetupPayload receiverToken](self, "receiverToken"));
  [v4 encodeObject:v8 forKey:@"receiverToken"];

  objc_msgSend( v4,  "encodeBool:forKey:",  -[APUIAirPlaySetupPayload isNetworkHidden](self, "isNetworkHidden"),  @"isNetworkHidden");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[APUIAirPlaySetupPayload routeToReceiver](self, "routeToReceiver"),  @"routeToReceiver");
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[APUIAirPlaySetupPayload captivePortalAuthToken](self, "captivePortalAuthToken"));
  [v4 encodeObject:v9 forKey:@"captivePortalAuthToken"];
}

- (id)description
{
  uint64_t v26 = objc_opt_class(self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APUIAirPlaySetupPayload wifiSSID](self, "wifiSSID"));
  if (v3 && !IsAppleInternalBuild())
  {
    int v5 = 0;
    id v4 = @"#Redacted#";
  }

  else
  {
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue(-[APUIAirPlaySetupPayload wifiSSID](self, "wifiSSID"));
    int v5 = 1;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[APUIAirPlaySetupPayload wifiPassphrase](self, "wifiPassphrase"));
  if (v6 && !IsAppleInternalBuild())
  {
    int v25 = 0;
    v7 = @"#Redacted#";
  }

  else
  {
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue(-[APUIAirPlaySetupPayload wifiPassphrase](self, "wifiPassphrase"));
    int v25 = 1;
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[APUIAirPlaySetupPayload brokerToken](self, "brokerToken"));
  if (v24 && !IsAppleInternalBuild())
  {
    int v22 = 0;
    v23 = @"#Redacted#";
  }

  else
  {
    v23 = (const __CFString *)objc_claimAutoreleasedReturnValue(-[APUIAirPlaySetupPayload brokerToken](self, "brokerToken"));
    int v22 = 1;
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[APUIAirPlaySetupPayload receiverToken](self, "receiverToken"));
  if (v21 && !IsAppleInternalBuild())
  {
    int v20 = 0;
    v27 = @"#Redacted#";
  }

  else
  {
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue(-[APUIAirPlaySetupPayload receiverToken](self, "receiverToken"));
    int v20 = 1;
  }

  BOOL v8 = -[APUIAirPlaySetupPayload routeToReceiver](self, "routeToReceiver");
  BOOL v9 = -[APUIAirPlaySetupPayload isNetworkHidden](self, "isNetworkHidden");
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[APUIAirPlaySetupPayload captivePortalAuthToken](self, "captivePortalAuthToken"));
  if (v10 && !IsAppleInternalBuild())
  {
    BOOL v19 = v8;
    v15 = (__CFString *)v23;
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ %p wifiSSID=%@ wifiPassphrase=%@ brokerToken=%@ receiverToken=%@ routeToReceiver=%d isNetworkHidden=%d captivePortalAuthToken=%@>",  v26,  self,  v4,  v7,  v23,  v27,  v19,  v9,  @"#Redacted#"));
  }

  else
  {
    v11 = v6;
    int v12 = v5;
    v13 = v3;
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[APUIAirPlaySetupPayload captivePortalAuthToken](self, "captivePortalAuthToken"));
    BOOL v18 = v8;
    v15 = (__CFString *)v23;
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ %p wifiSSID=%@ wifiPassphrase=%@ brokerToken=%@ receiverToken=%@ routeToReceiver=%d isNetworkHidden=%d captivePortalAuthToken=%@>",  v26,  self,  v4,  v7,  v23,  v27,  v18,  v9,  v14));

    v3 = v13;
    int v5 = v12;
    id v6 = v11;
  }

  if (v20) {
  if (v22)
  }

  if (v25) {
  if (v5)
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  if (!v5 || (Class v6 = NSClassFromString(@"APUIAirPlaySetupPayload"), (objc_opt_isKindOfClass(v5, v6) & 1) == 0))
  {
    BOOL v39 = 0;
    BOOL v8 = 0LL;
    goto LABEL_48;
  }

  id v7 = v5;
  BOOL v8 = v7;
  wifiSSID = self->_wifiSSID;
  if (!wifiSSID)
  {
    uint64_t v15 = objc_claimAutoreleasedReturnValue([v7 wifiSSID]);
    if (!v15) {
      goto LABEL_12;
    }
    BOOL isNetworkHidden = v15;
    if (!self->_wifiSSID) {
      goto LABEL_46;
    }
  }

  uint64_t v10 = objc_claimAutoreleasedReturnValue([v8 wifiSSID]);
  if (!v10) {
    goto LABEL_45;
  }
  v11 = (void *)v10;
  int v12 = self->_wifiSSID;
  v13 = (void *)objc_claimAutoreleasedReturnValue([v8 wifiSSID]);
  unsigned int v14 = -[NSString isEqualToString:](v12, "isEqualToString:", v13);

  if (wifiSSID)
  {
    if (!v14) {
      goto LABEL_47;
    }
  }

  else
  {

    if ((v14 & 1) == 0) {
      goto LABEL_47;
    }
  }

- (NSString)wifiSSID
{
  return self->_wifiSSID;
}

- (void)setWifiSSID:(id)a3
{
}

- (NSString)wifiPassphrase
{
  return self->_wifiPassphrase;
}

- (void)setWifiPassphrase:(id)a3
{
}

- (NSString)captivePortalAuthToken
{
  return self->_captivePortalAuthToken;
}

- (void)setCaptivePortalAuthToken:(id)a3
{
}

- (BOOL)isNetworkHidden
{
  return self->_isNetworkHidden;
}

- (void)setIsNetworkHidden:(BOOL)a3
{
  self->_BOOL isNetworkHidden = a3;
}

- (NSString)brokerToken
{
  return self->_brokerToken;
}

- (void)setBrokerToken:(id)a3
{
}

- (NSString)receiverToken
{
  return self->_receiverToken;
}

- (void)setReceiverToken:(id)a3
{
}

- (BOOL)routeToReceiver
{
  return self->_routeToReceiver;
}

- (void)setRouteToReceiver:(BOOL)a3
{
  self->_int routeToReceiver = a3;
}

- (void).cxx_destruct
{
}

@end