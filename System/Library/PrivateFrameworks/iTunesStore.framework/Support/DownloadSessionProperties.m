@interface DownloadSessionProperties
- (BOOL)isEqual:(id)a3;
- (BOOL)isStoreDownload;
- (BOOL)shouldSupressErrorDialogs;
- (DownloadSessionProperties)initWithClientIdentifier:(id)a3 handlerIdentifier:(int64_t)a4;
- (NSNumber)duetBudget;
- (NSString)clientIdentifier;
- (NSString)downloadPhase;
- (NSURLAuthenticationChallenge)authenticationChallenge;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)assetIdentifier;
- (int64_t)downloadIdentifier;
- (int64_t)handlerIdentifier;
- (unint64_t)hash;
- (void)dealloc;
- (void)setAssetIdentifier:(int64_t)a3;
- (void)setAuthenticationChallenge:(id)a3;
- (void)setDownloadIdentifier:(int64_t)a3;
- (void)setDownloadPhase:(id)a3;
- (void)setDuetBudget:(id)a3;
- (void)setShouldSupressErrorDialogs:(BOOL)a3;
- (void)setStoreDownload:(BOOL)a3;
@end

@implementation DownloadSessionProperties

- (DownloadSessionProperties)initWithClientIdentifier:(id)a3 handlerIdentifier:(int64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___DownloadSessionProperties;
  v6 = -[DownloadSessionProperties init](&v8, "init");
  if (v6)
  {
    v6->_clientIdentifier = (NSString *)[a3 copy];
    v6->_handlerIdentifier = a4;
  }

  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___DownloadSessionProperties;
  -[DownloadSessionProperties dealloc](&v3, "dealloc");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v5[1] = self->_assetID;
  v5[2] = self->_authenticationChallenge;
  v5[3] = -[NSString copyWithZone:](self->_clientIdentifier, "copyWithZone:", a3);
  v5[4] = self->_downloadID;
  v5[5] = -[NSString copyWithZone:](self->_downloadPhase, "copyWithZone:", a3);
  v5[6] = -[NSNumber copyWithZone:](self->_duetBudget, "copyWithZone:", a3);
  v5[7] = self->_handlerIdentifier;
  *((_BYTE *)v5 + 64) = self->_storeDownload;
  *((_BYTE *)v5 + 65) = self->_shouldSupressErrorDialogs;
  return v5;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___DownloadSessionProperties;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: [A: %lld, D: %lld, H: %lld, P: %@]",  -[DownloadSessionProperties description](&v3, "description"),  self->_assetID,  self->_downloadID,  self->_handlerIdentifier,  self->_downloadPhase);
}

- (unint64_t)hash
{
  return self->_downloadID;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = objc_opt_class(self);
  if (v5 == objc_opt_class(a3)
    && (id v6 = -[DownloadSessionProperties downloadIdentifier](self, "downloadIdentifier"),
        v6 == [a3 downloadIdentifier])
    && (id v7 = -[DownloadSessionProperties assetIdentifier](self, "assetIdentifier"),
        v7 == [a3 assetIdentifier])
    && (id v8 = -[DownloadSessionProperties handlerIdentifier](self, "handlerIdentifier"),
        v8 == [a3 handlerIdentifier]))
  {
    v9 = -[DownloadSessionProperties downloadPhase](self, "downloadPhase");
    if (v9 == [a3 downloadPhase]
      || (unsigned int v10 = -[NSString isEqual:]( -[DownloadSessionProperties downloadPhase](self, "downloadPhase"),  "isEqual:",  [a3 downloadPhase])) != 0)
    {
      v11 = -[DownloadSessionProperties authenticationChallenge](self, "authenticationChallenge");
      if (v11 == [a3 authenticationChallenge]) {
        LOBYTE(v10) = 1;
      }
      else {
        LOBYTE(v10) = -[NSURLAuthenticationChallenge isEqual:]( -[DownloadSessionProperties authenticationChallenge]( self,  "authenticationChallenge"),  "isEqual:",  [a3 authenticationChallenge]);
      }
    }
  }

  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (int64_t)assetIdentifier
{
  return self->_assetID;
}

- (void)setAssetIdentifier:(int64_t)a3
{
  self->_assetID = a3;
}

- (NSURLAuthenticationChallenge)authenticationChallenge
{
  return self->_authenticationChallenge;
}

- (void)setAuthenticationChallenge:(id)a3
{
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (int64_t)downloadIdentifier
{
  return self->_downloadID;
}

- (void)setDownloadIdentifier:(int64_t)a3
{
  self->_downloadID = a3;
}

- (NSString)downloadPhase
{
  return self->_downloadPhase;
}

- (void)setDownloadPhase:(id)a3
{
}

- (NSNumber)duetBudget
{
  return self->_duetBudget;
}

- (void)setDuetBudget:(id)a3
{
}

- (int64_t)handlerIdentifier
{
  return self->_handlerIdentifier;
}

- (BOOL)isStoreDownload
{
  return self->_storeDownload;
}

- (void)setStoreDownload:(BOOL)a3
{
  self->_storeDownload = a3;
}

- (BOOL)shouldSupressErrorDialogs
{
  return self->_shouldSupressErrorDialogs;
}

- (void)setShouldSupressErrorDialogs:(BOOL)a3
{
  self->_shouldSupressErrorDialogs = a3;
}

@end