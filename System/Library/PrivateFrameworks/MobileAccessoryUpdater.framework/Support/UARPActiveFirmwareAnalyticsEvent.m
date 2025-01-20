@interface UARPActiveFirmwareAnalyticsEvent
- (BOOL)share3rdParty;
- (NSString)activeFirmwareVersion;
- (NSString)countryCode;
- (NSString)downloadURL;
- (NSString)manufacturerName;
- (NSString)modelName;
- (id)description;
- (int64_t)channelType;
- (int64_t)transport;
- (void)dealloc;
- (void)send;
- (void)setActiveFirmwareVersion:(id)a3;
- (void)setChannelType:(int64_t)a3;
- (void)setCountryCode:(id)a3;
- (void)setDownloadURL:(id)a3;
- (void)setManufacturerName:(id)a3;
- (void)setModelName:(id)a3;
- (void)setShare3rdParty:(BOOL)a3;
- (void)setTransport:(int64_t)a3;
- (void)updateWithAccessoryID:(id)a3;
@end

@implementation UARPActiveFirmwareAnalyticsEvent

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___UARPActiveFirmwareAnalyticsEvent;
  -[UARPActiveFirmwareAnalyticsEvent dealloc](&v3, "dealloc");
}

- (void)send
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1000066A8;
  v2[3] = &unk_100075360;
  v2[4] = self;
  AnalyticsSendEventLazy(@"com.apple.aud.uarp.ActiveFirmware", v2);
}

- (void)updateWithAccessoryID:(id)a3
{
}

- (id)description
{
  objc_super v3 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"<Model Name = %@>, ", self->_modelName);
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"<Active Firmware Version = %@>",  self->_activeFirmwareVersion);
  return +[NSString stringWithString:](&OBJC_CLASS___NSString, "stringWithString:", v3);
}

- (NSString)manufacturerName
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setManufacturerName:(id)a3
{
}

- (NSString)modelName
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setModelName:(id)a3
{
}

- (NSString)countryCode
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setCountryCode:(id)a3
{
}

- (NSString)downloadURL
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setDownloadURL:(id)a3
{
}

- (NSString)activeFirmwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setActiveFirmwareVersion:(id)a3
{
}

- (int64_t)transport
{
  return self->_transport;
}

- (void)setTransport:(int64_t)a3
{
  self->_transport = a3;
}

- (int64_t)channelType
{
  return self->_channelType;
}

- (void)setChannelType:(int64_t)a3
{
  self->_channelType = a3;
}

- (BOOL)share3rdParty
{
  return self->_share3rdParty;
}

- (void)setShare3rdParty:(BOOL)a3
{
  self->_share3rdParty = a3;
}

@end