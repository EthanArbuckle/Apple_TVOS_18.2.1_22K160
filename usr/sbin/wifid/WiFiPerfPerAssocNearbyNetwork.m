@interface WiFiPerfPerAssocNearbyNetwork
- (BOOL)isEqual:(id)a3;
- (NSNumber)channel;
- (NSNumber)channelFlags;
- (NSNumber)rssi;
- (NSString)SSID;
- (NSString)bssid;
- (WiFiPerfPerAssocNearbyNetwork)init;
- (WiFiPerfPerAssocNearbyNetwork)initWithSSID:(id)a3 rssi:(id)a4 bssid:(id)a5 channel:(id)a6 channelFlags:(id)a7 andOrigin:(unint64_t)a8;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)origin;
@end

@implementation WiFiPerfPerAssocNearbyNetwork

- (WiFiPerfPerAssocNearbyNetwork)initWithSSID:(id)a3 rssi:(id)a4 bssid:(id)a5 channel:(id)a6 channelFlags:(id)a7 andOrigin:(unint64_t)a8
{
  v14 = (NSString *)a3;
  v15 = (NSNumber *)a4;
  v16 = (NSString *)a5;
  v17 = (NSNumber *)a6;
  v18 = (NSNumber *)a7;
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___WiFiPerfPerAssocNearbyNetwork;
  v19 = -[WiFiPerfPerAssocNearbyNetwork init](&v30, "init");
  SSID = v19->_SSID;
  v19->_SSID = v14;
  v21 = v14;

  rssi = v19->_rssi;
  v19->_rssi = v15;
  v23 = v15;

  bssid = v19->_bssid;
  v19->_bssid = v16;
  v25 = v16;

  channel = v19->_channel;
  v19->_channel = v17;
  v27 = v17;

  channelFlags = v19->_channelFlags;
  v19->_channelFlags = v18;
  v19->_origin = a8;

  return v19;
}

- (WiFiPerfPerAssocNearbyNetwork)init
{
  id v2 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  @"WiFiPerfPerAssocNearbyNetwork is useless without values - use the exposed initWith...",  0LL));
  objc_exception_throw(v2);
  return (WiFiPerfPerAssocNearbyNetwork *)-[WiFiPerfPerAssocNearbyNetwork dictionaryRepresentation](v3, v4);
}

- (id)dictionaryRepresentation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiPerfPerAssocNearbyNetwork bssid](self, "bssid"));

  if (v3)
  {
    SEL v4 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiPerfPerAssocNearbyNetwork rssi](self, "rssi"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiPerfPerAssocNearbyNetwork bssid](self, "bssid"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiPerfPerAssocNearbyNetwork channel](self, "channel"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiPerfPerAssocNearbyNetwork channelFlags](self, "channelFlags"));
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[WiFiPerfPerAssocNearbyNetwork origin](self, "origin")));
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v4,  @"RSSI",  v5,  @"BSSID",  v6,  @"CHANNEL",  v7,  @"CHANNEL_FLAGS",  v8,  @"pppAPESSOrigin",  0LL));
  }

  else
  {
    v9 = 0LL;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_6;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiPerfPerAssocNearbyNetwork bssid](self, "bssid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 bssid]);
  unsigned int v7 = [v5 isEqualToString:v6];

  if (!v7) {
    goto LABEL_6;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiPerfPerAssocNearbyNetwork channel](self, "channel"));
  id v9 = [v8 unsignedIntegerValue];
  v10 = (void *)objc_claimAutoreleasedReturnValue([v4 channel]);
  id v11 = [v10 unsignedIntegerValue];

  if (v9 == v11) {
    BOOL v12 = 1;
  }
  else {
LABEL_6:
  }
    BOOL v12 = 0;

  return v12;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiPerfPerAssocNearbyNetwork SSID](self, "SSID"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiPerfPerAssocNearbyNetwork bssid](self, "bssid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiPerfPerAssocNearbyNetwork channel](self, "channel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiPerfPerAssocNearbyNetwork rssi](self, "rssi"));
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"WiFiPerfPerAssocNearbyNetwork with SSID: %@ bssid: %@ channel: %@ RSSI: %@ ORIGIN: %d",  v3,  v4,  v5,  v6,  -[WiFiPerfPerAssocNearbyNetwork origin](self, "origin")));

  return v7;
}

- (unint64_t)hash
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[WiFiPerfPerAssocNearbyNetwork bssid](self, "bssid"));
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (NSString)SSID
{
  return self->_SSID;
}

- (NSNumber)rssi
{
  return self->_rssi;
}

- (NSString)bssid
{
  return self->_bssid;
}

- (NSNumber)channel
{
  return self->_channel;
}

- (NSNumber)channelFlags
{
  return self->_channelFlags;
}

- (unint64_t)origin
{
  return self->_origin;
}

- (void).cxx_destruct
{
}

@end