@interface UARPAnalyticsAUDUpdateFirmwareState
+ (BOOL)supportsSecureCoding;
- (BOOL)downloadUserIntent;
- (UARPAnalyticsAUDUpdateFirmwareState)initWithAccessoryID:(id)a3 assetID:(id)a4;
- (UARPAnalyticsAUDUpdateFirmwareState)initWithCoder:(id)a3;
- (UARPAssetID)assetID;
- (id)description;
- (int64_t)downloadStatus;
- (unint64_t)downloadConsentDuration;
- (void)dealloc;
- (void)dumpWithTabDepth:(unint64_t)a3 dumpString:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)reset;
- (void)setAssetAvailableForDownload;
- (void)setDownloadComplete:(int64_t)a3;
- (void)setDownloadConsentDurationEnd;
- (void)setDownloadConsentDurationStart;
- (void)setDownloadConsentReceived:(BOOL)a3;
- (void)setDownloadConsentRequested;
@end

@implementation UARPAnalyticsAUDUpdateFirmwareState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UARPAnalyticsAUDUpdateFirmwareState)initWithAccessoryID:(id)a3 assetID:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___UARPAnalyticsAUDUpdateFirmwareState;
  v6 = -[UARPAnalyticsAUDUpdateFirmwareState init](&v8, "init");
  if (v6)
  {
    v6->_assetID = (UARPAssetID *)[a4 copy];
    v6->_accessoryID = (UARPAccessoryID *)[a3 copy];
  }

  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___UARPAnalyticsAUDUpdateFirmwareState;
  -[UARPAnalyticsAUDUpdateFirmwareState dealloc](&v3, "dealloc");
}

- (void)reset
{
  self->_downloadConsentDurationStart = 0LL;
  self->_downloadUserIntent = 0;

  self->_downloadConsentDurationEnd = 0LL;
  self->_downloadStatus = 0LL;
}

- (void)setAssetAvailableForDownload
{
}

- (void)setDownloadConsentRequested
{
}

- (void)setDownloadConsentReceived:(BOOL)a3
{
  if (self->_downloadConsentDurationStart) {
    -[UARPAnalyticsAUDUpdateFirmwareState setDownloadConsentDurationEnd](self, "setDownloadConsentDurationEnd");
  }
  self->_downloadUserIntent = a3;
  objc_sync_exit(self);
}

- (void)setDownloadComplete:(int64_t)a3
{
  self->_downloadStatus = a3;
  objc_sync_exit(self);
}

- (unint64_t)downloadConsentDuration
{
  if (self->_downloadConsentDurationStart && (downloadConsentDurationEnd = self->_downloadConsentDurationEnd) != 0LL)
  {
    -[NSDate timeIntervalSinceDate:](downloadConsentDurationEnd, "timeIntervalSinceDate:");
    unint64_t v5 = (unint64_t)v4;
  }

  else
  {
    unint64_t v5 = 0LL;
  }

  objc_sync_exit(self);
  return v5;
}

- (void)setDownloadConsentDurationStart
{
  self->_downloadConsentDurationEnd = objc_alloc_init(&OBJC_CLASS___NSDate);
}

- (void)setDownloadConsentDurationEnd
{
  self->_downloadConsentDurationEnd = objc_alloc_init(&OBJC_CLASS___NSDate);
}

- (id)description
{
  objc_super v3 = (objc_class *)objc_opt_class(self);
  double v4 = NSStringFromClass(v3);
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: MF=%@ MN=%@ SN=%@ %@ -> %@ (%s)>",  v4,  -[UARPAccessoryID manufacturer](self->_accessoryID, "manufacturer"),  -[UARPAccessoryID modelName](self->_accessoryID, "modelName"),  -[UARPAccessoryID serialNumber](self->_accessoryID, "serialNumber"),  -[UARPAccessoryID firmwareVersion](self->_accessoryID, "firmwareVersion"),  -[UARPAssetID assetVersion](self->_assetID, "assetVersion"),  sub_100013C04(self->_downloadStatus));
}

- (void)encodeWithCoder:(id)a3
{
}

- (UARPAnalyticsAUDUpdateFirmwareState)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___UARPAnalyticsAUDUpdateFirmwareState;
  double v4 = -[UARPAnalyticsAUDUpdateFirmwareState init](&v6, "init");
  if (v4)
  {
    v4->_assetID = (UARPAssetID *)[a3 decodeObjectForKey:@"assetID"];
    v4->_downloadUserIntent = [a3 decodeBoolForKey:@"downloadUserIntent"];
    v4->_downloadStatus = (int64_t)[a3 decodeIntegerForKey:@"downloadStatus"];
    v4->_downloadConsentDurationStart = (NSDate *) [a3 decodeObjectForKey:@"downloadConsentDurationStart"];
    v4->_downloadConsentDurationEnd = (NSDate *) [a3 decodeObjectForKey:@"downloadConsentDurationEnd"];
    v4->_accessoryID = (UARPAccessoryID *)[a3 decodeObjectForKey:@"accessoryID"];
  }

  return v4;
}

- (void)dumpWithTabDepth:(unint64_t)a3 dumpString:(id)a4
{
  unint64_t v7 = a3 + 1;
  objc_msgSend( a4,  "appendWithTabDepth:format:",  v7,  @"Download Consent Duration: %lu s\n",  -[UARPAnalyticsAUDUpdateFirmwareState downloadConsentDuration](self, "downloadConsentDuration"));
  if (self->_downloadUserIntent) {
    objc_super v8 = "yes";
  }
  else {
    objc_super v8 = "no";
  }
  objc_msgSend(a4, "appendWithTabDepth:format:", v7, @"Download User Intent: %s\n", v8);
  objc_msgSend( a4,  "appendWithTabDepth:format:",  v7,  @"Download Status: %s\n",  sub_100013C04(self->_downloadStatus));
}

- (UARPAssetID)assetID
{
  return self->_assetID;
}

- (BOOL)downloadUserIntent
{
  return self->_downloadUserIntent;
}

- (int64_t)downloadStatus
{
  return self->_downloadStatus;
}

@end