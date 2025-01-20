@interface NSHTTPCookie2StorageFilter
- (BOOL)isSafe;
- (BOOL)isTopLevelNavigation;
- (BOOL)isTrusted;
- (BOOL)overwriteHTTPOnlyCookies;
- (NSHTTPCookie2StorageFilter)init;
- (NSString)partition;
- (NSURL)mainDocumentURL;
- (NSURL)siteForCookies;
- (NSURL)url;
- (unint64_t)acceptPolicy;
- (void)setAcceptPolicy:(unint64_t)a3;
- (void)setIsSafe:(BOOL)a3;
- (void)setIsTopLevelNavigation:(BOOL)a3;
- (void)setMainDocumentURL:(id)a3;
- (void)setOverwriteHTTPOnlyCookies:(BOOL)a3;
- (void)setPartition:(id)a3;
- (void)setSiteForCookies:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation NSHTTPCookie2StorageFilter

- (NSHTTPCookie2StorageFilter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSHTTPCookie2StorageFilter;
  result = -[NSHTTPCookie2StorageFilter init](&v3, sel_init);
  if (result) {
    result->_isTrusted = 1;
  }
  return result;
}

- (BOOL)isTrusted
{
  urlScheme = self->_urlScheme;
  if (urlScheme && !self->_isTrustedCached)
  {
    BOOL v4 = 1;
    self->_isTrustedCached = 1;
    if (-[NSString caseInsensitiveCompare:](urlScheme, "caseInsensitiveCompare:", @"https")) {
      BOOL v4 = -[NSString caseInsensitiveCompare:](self->_urlScheme, "caseInsensitiveCompare:", @"wss") == NSOrderedSame;
    }
    self->_isTrusted = v4;
  }

  return self->_isTrusted;
}

- (void)setUrl:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v8 = v5;
    objc_storeStrong((id *)&self->_url, a3);
    [v8 scheme];
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    urlScheme = self->_urlScheme;
    self->_urlScheme = v6;

    id v5 = v8;
  }
}

- (NSURL)url
{
  return self->_url;
}

- (NSURL)mainDocumentURL
{
  return self->_mainDocumentURL;
}

- (void)setMainDocumentURL:(id)a3
{
}

- (NSURL)siteForCookies
{
  return self->_siteForCookies;
}

- (void)setSiteForCookies:(id)a3
{
}

- (NSString)partition
{
  return self->_partition;
}

- (void)setPartition:(id)a3
{
}

- (BOOL)isTopLevelNavigation
{
  return self->_isTopLevelNavigation;
}

- (void)setIsTopLevelNavigation:(BOOL)a3
{
  self->_isTopLevelNavigation = a3;
}

- (BOOL)isSafe
{
  return self->_isSafe;
}

- (void)setIsSafe:(BOOL)a3
{
  self->_isSafe = a3;
}

- (BOOL)overwriteHTTPOnlyCookies
{
  return self->_overwriteHTTPOnlyCookies;
}

- (void)setOverwriteHTTPOnlyCookies:(BOOL)a3
{
  self->_overwriteHTTPOnlyCookies = a3;
}

- (unint64_t)acceptPolicy
{
  return self->_acceptPolicy;
}

- (void)setAcceptPolicy:(unint64_t)a3
{
  self->_acceptPolicy = a3;
}

- (void).cxx_destruct
{
}

@end