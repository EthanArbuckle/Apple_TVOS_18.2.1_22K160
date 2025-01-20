@interface RestoreDownloadItem
- (BOOL)hasRestoreData;
- (DownloadSessionProperties)downloadSessionProperties;
- (NSError)error;
- (NSString)clientIdentifier;
- (NSString)vendorIdentifier;
- (RestoreDownloadItem)initWithDownloadIdentifier:(int64_t)a3;
- (id)copyRestoreDictionary;
- (id)description;
- (int64_t)downloadIdentifier;
- (int64_t)handlerIdentifier;
- (int64_t)restoreDataSize;
- (void)dealloc;
- (void)setClientIdentifier:(id)a3;
- (void)setDownloadSessionProperties:(id)a3;
- (void)setError:(id)a3;
- (void)setHandlerIdentifier:(int64_t)a3;
- (void)setHasRestoreData:(BOOL)a3;
- (void)setRestoreDataSize:(int64_t)a3;
- (void)setVendorIdentifier:(id)a3;
@end

@implementation RestoreDownloadItem

- (RestoreDownloadItem)initWithDownloadIdentifier:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___RestoreDownloadItem;
  result = -[RestoreDownloadItem init](&v5, "init");
  if (result) {
    result->_downloadIdentifier = a3;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___RestoreDownloadItem;
  -[RestoreDownloadItem dealloc](&v3, "dealloc");
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"{ d: %lld itemID: %@ t: %@ a: %@  c: %@ }",  -[RestoreDownloadItem downloadIdentifier](self, "downloadIdentifier"),  -[RestoreDownloadItem storeItemID](self, "storeItemID"),  -[RestoreDownloadItem title](self, "title"),  -[RestoreDownloadItem storeAccountID](self, "storeAccountID"),  -[RestoreDownloadItem clientIdentifier](self, "clientIdentifier"));
}

- (id)copyRestoreDictionary
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___RestoreDownloadItem;
  id v3 = -[RestoreDownloadItem copyRestoreDictionary](&v7, "copyRestoreDictionary");
  if (SSDownloadKindIsSoftwareKind(-[RestoreDownloadItem downloadKind](self, "downloadKind")))
  {
    vendorIdentifier = self->_vendorIdentifier;
    if (vendorIdentifier
      || (id v6 = -[RestoreDownloadItem bundleID](self, "bundleID")) != 0LL
      && (vendorIdentifier = (NSString *)objc_msgSend( objc_msgSend( +[LSApplicationProxy applicationProxyForIdentifier:placeholder:]( LSApplicationProxy,  "applicationProxyForIdentifier:placeholder:",  v6,  1),  "deviceIdentifierForVendor"),  "UUIDString")) != 0)
    {
      [v3 setObject:vendorIdentifier forKey:@"vid"];
    }
  }

  return v3;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
}

- (int64_t)downloadIdentifier
{
  return self->_downloadIdentifier;
}

- (DownloadSessionProperties)downloadSessionProperties
{
  return self->_downloadSessionProperties;
}

- (void)setDownloadSessionProperties:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (int64_t)handlerIdentifier
{
  return self->_handlerIdentifier;
}

- (void)setHandlerIdentifier:(int64_t)a3
{
  self->_handlerIdentifier = a3;
}

- (BOOL)hasRestoreData
{
  return self->_hasRestoreData;
}

- (void)setHasRestoreData:(BOOL)a3
{
  self->_hasRestoreData = a3;
}

- (int64_t)restoreDataSize
{
  return self->_restoreDataSize;
}

- (void)setRestoreDataSize:(int64_t)a3
{
  self->_restoreDataSize = a3;
}

- (NSString)vendorIdentifier
{
  return self->_vendorIdentifier;
}

- (void)setVendorIdentifier:(id)a3
{
}

@end