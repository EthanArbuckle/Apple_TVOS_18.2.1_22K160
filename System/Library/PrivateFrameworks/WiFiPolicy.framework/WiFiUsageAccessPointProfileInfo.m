@interface WiFiUsageAccessPointProfileInfo
- (NSData)beacon;
- (NSDictionary)apProfileWPSInfo;
- (NSString)apProfileID;
- (NSString)apProfileVersion;
- (NSString)apProfile_shortID;
- (NSString)bssid;
- (NSString)ssid;
- (void)setApProfileID:(id)a3;
- (void)setApProfileVersion:(id)a3;
- (void)setApProfileWPSInfo:(id)a3;
- (void)setApProfile_shortID:(id)a3;
- (void)setBeacon:(id)a3;
- (void)setBssid:(id)a3;
- (void)setSsid:(id)a3;
@end

@implementation WiFiUsageAccessPointProfileInfo

- (NSString)bssid
{
  return self->_bssid;
}

- (void)setBssid:(id)a3
{
}

- (NSString)ssid
{
  return self->_ssid;
}

- (void)setSsid:(id)a3
{
}

- (NSDictionary)apProfileWPSInfo
{
  return self->_apProfileWPSInfo;
}

- (void)setApProfileWPSInfo:(id)a3
{
}

- (NSString)apProfileVersion
{
  return self->_apProfileVersion;
}

- (void)setApProfileVersion:(id)a3
{
}

- (NSString)apProfile_shortID
{
  return self->_apProfile_shortID;
}

- (void)setApProfile_shortID:(id)a3
{
}

- (NSString)apProfileID
{
  return self->_apProfileID;
}

- (void)setApProfileID:(id)a3
{
}

- (NSData)beacon
{
  return self->_beacon;
}

- (void)setBeacon:(id)a3
{
}

- (void).cxx_destruct
{
}

@end