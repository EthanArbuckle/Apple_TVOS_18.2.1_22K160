@interface DownloadHandle
- (BOOL)isEqual:(id)a3;
- (DownloadHandle)init;
- (DownloadHandle)initWithTransactionIdentifier:(int64_t)a3 downloadIdentifier:(int64_t)a4;
- (id)description;
- (int64_t)downloadID;
- (int64_t)transactionID;
- (unint64_t)hash;
@end

@implementation DownloadHandle

- (DownloadHandle)init
{
  return -[DownloadHandle initWithTransactionIdentifier:downloadIdentifier:]( self,  "initWithTransactionIdentifier:downloadIdentifier:",  0LL,  0LL);
}

- (DownloadHandle)initWithTransactionIdentifier:(int64_t)a3 downloadIdentifier:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___DownloadHandle;
  result = -[DownloadHandle init](&v7, "init");
  if (result)
  {
    result->_downloadID = a4;
    result->_transactionID = a3;
  }

  return result;
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(DH: T:%lld / D:%lld)",  self->_transactionID,  self->_downloadID);
}

- (unint64_t)hash
{
  return self->_downloadID ^ self->_transactionID;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id transactionID = (id)self->_transactionID;
  if (transactionID == [v4 transactionID])
  {
    id downloadID = (id)self->_downloadID;
    BOOL v7 = downloadID == [v4 downloadID];
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (int64_t)downloadID
{
  return self->_downloadID;
}

- (int64_t)transactionID
{
  return self->_transactionID;
}

@end