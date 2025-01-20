@interface NSHTTPCookie2LookupFilter
- (BOOL)httpOnly;
- (BOOL)ignoreHTTPOnlyCookie;
- (BOOL)ignoreHostOnlyFlag;
- (BOOL)ignoreSecureFlag;
- (BOOL)isSafe;
- (BOOL)isTopLevelNavigation;
- (BOOL)matchCookie:(id)a3;
- (BOOL)secure;
- (NSDate)newerThanCreationDate;
- (NSDate)newerThanExpirationDate;
- (NSDate)newerThanLastAccess;
- (NSDate)olderThanCreationDate;
- (NSDate)olderThanExpirationDate;
- (NSDate)olderThanLastAccess;
- (NSHTTPCookie2LookupFilter)initWithCookie:(id)a3;
- (NSString)domain;
- (NSString)name;
- (NSString)partition;
- (NSString)path;
- (NSString)value;
- (NSURL)inURL;
- (NSURL)mainDocumentURL;
- (NSURL)siteForCookies;
- (int64_t)_flags;
- (int64_t)sameSite;
- (unint64_t)acceptPolicy;
- (void)setAcceptPolicy:(unint64_t)a3;
- (void)setDomain:(id)a3;
- (void)setHttpOnly:(BOOL)a3;
- (void)setIgnoreHTTPOnlyCookie:(BOOL)a3;
- (void)setIgnoreHostOnlyFlag:(BOOL)a3;
- (void)setIgnoreSecureFlag:(BOOL)a3;
- (void)setInURL:(id)a3;
- (void)setIsSafe:(BOOL)a3;
- (void)setIsTopLevelNavigation:(BOOL)a3;
- (void)setMainDocumentURL:(id)a3;
- (void)setName:(id)a3;
- (void)setNewerThanCreationDate:(id)a3;
- (void)setNewerThanExpirationDate:(id)a3;
- (void)setNewerThanLastAccess:(id)a3;
- (void)setOlderThanCreationDate:(id)a3;
- (void)setOlderThanExpirationDate:(id)a3;
- (void)setOlderThanLastAccess:(id)a3;
- (void)setPartition:(id)a3;
- (void)setPath:(id)a3;
- (void)setSameSite:(int64_t)a3;
- (void)setSecure:(BOOL)a3;
- (void)setSiteForCookies:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation NSHTTPCookie2LookupFilter

- (NSHTTPCookie2LookupFilter)initWithCookie:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___NSHTTPCookie2LookupFilter;
  v5 = -[NSHTTPCookie2LookupFilter init](&v17, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 name];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 domain];
    domain = v5->_domain;
    v5->_domain = (NSString *)v8;

    uint64_t v10 = [v4 path];
    path = v5->_path;
    v5->_path = (NSString *)v10;

    uint64_t v12 = [v4 value];
    value = v5->_value;
    v5->_value = (NSString *)v12;

    uint64_t v14 = [v4 partition];
    partition = v5->_partition;
    v5->_partition = (NSString *)v14;

    v5->_secure = [v4 secure];
    v5->_httpOnly = [v4 httpOnly];
    v5->_sameSite = [v4 sameSite];
  }

  return v5;
}

- (int64_t)_flags
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v4 = v3 != 0LL;
  v5 = -[NSHTTPCookie2LookupFilter value](self, "value");
  if (v5) {
    uint64_t v6 = (2LL * v4) | 4;
  }
  else {
    uint64_t v6 = 2LL * v4;
  }
  v7 = -[NSHTTPCookie2LookupFilter domain](self, "domain");
  if (v7) {
    v6 |= 8uLL;
  }
  -[NSHTTPCookie2LookupFilter path](self, "path");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8) {
    uint64_t v9 = v6 | 0x10;
  }
  else {
    uint64_t v9 = v6;
  }
  if (-[NSHTTPCookie2LookupFilter sameSite](self, "sameSite")) {
    uint64_t v10 = v9 | 0x20;
  }
  else {
    uint64_t v10 = v9;
  }
  v11 = -[NSHTTPCookie2LookupFilter partition](self, "partition");
  if (v11) {
    v10 |= 0x40uLL;
  }
  -[NSHTTPCookie2LookupFilter newerThanCreationDate](self, "newerThanCreationDate");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12) {
    v10 |= 0x80uLL;
  }
  v13 = -[NSHTTPCookie2LookupFilter newerThanExpirationDate](self, "newerThanExpirationDate");
  if (v13) {
    v10 |= 0x100uLL;
  }
  -[NSHTTPCookie2LookupFilter newerThanLastAccess](self, "newerThanLastAccess");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14) {
    v10 |= 0x200uLL;
  }
  v15 = -[NSHTTPCookie2LookupFilter olderThanCreationDate](self, "olderThanCreationDate");
  if (v15) {
    v10 |= 0x400uLL;
  }
  v16 = -[NSHTTPCookie2LookupFilter olderThanExpirationDate](self, "olderThanExpirationDate");
  if (v16) {
    v10 |= 0x800uLL;
  }
  -[NSHTTPCookie2LookupFilter olderThanLastAccess](self, "olderThanLastAccess");
  objc_super v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17) {
    int64_t v18 = v10 | 0x1000;
  }
  else {
    int64_t v18 = v10;
  }
  if (-[NSHTTPCookie2LookupFilter secure](self, "secure")) {
    v18 |= 0x2000uLL;
  }
  if (-[NSHTTPCookie2LookupFilter httpOnly](self, "httpOnly")) {
    v18 |= 0x4000uLL;
  }
  if (-[NSHTTPCookie2LookupFilter ignoreHostOnlyFlag](self, "ignoreHostOnlyFlag")) {
    return v18 | 0x8000;
  }
  else {
    return v18;
  }
}

- (void)setPath:(id)a3
{
  id v7 = a3;
  [MEMORY[0x189607810] URLPathAllowedCharacterSet];
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 stringByAddingPercentEncodingWithAllowedCharacters:v4];
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  path = self->_path;
  self->_path = v5;
}

- (void)setDomain:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v13 = v4;
    id v5 = v4;
    uint64_t v6 = v5;
    if (([v5 hasPrefix:@"."] & 1) == 0)
    {
      uint64_t v7 = [@"." stringByAppendingString:v5];

      uint64_t v6 = (void *)v7;
    }

    if ([v6 hasSuffix:@"."])
    {
      uint64_t v8 = objc_msgSend(v6, "substringToIndex:", objc_msgSend(v6, "length") - 1);

      uint64_t v6 = (void *)v8;
    }

    [MEMORY[0x189607810] URLHostAllowedCharacterSet];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 stringByAddingPercentEncodingWithAllowedCharacters:v9];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 lowercaseString];
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    domain = self->_domain;
    self->_domain = v11;

    id v4 = v13;
  }
}

- (BOOL)matchCookie:(id)a3
{
  id v4 = a3;
  -[NSHTTPCookie2LookupFilter domain](self, "domain");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (!-[NSHTTPCookie2LookupFilter ignoreHostOnlyFlag](self, "ignoreHostOnlyFlag")
      && ([v4 hostOnly] & 1) != 0
      || (-[NSHTTPCookie2LookupFilter domain](self, "domain"),
          uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue(),
          int v7 = +[NSHTTPCookieStorageUtils looksLikeIPAddress:]((uint64_t)&OBJC_CLASS___NSHTTPCookieStorageUtils, v6),
          v6,
          v7))
    {
      [v4 domain];
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSHTTPCookie2LookupFilter domain](self, "domain");
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v10 = [v8 caseInsensitiveCompare:v9];

      if (v10) {
        goto LABEL_19;
      }
    }

    else
    {
      v11 = -[NSHTTPCookie2LookupFilter domain](self, "domain");
      [v4 domain];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      char v13 = [v11 hasSuffix:v12];

      if ((v13 & 1) == 0) {
        goto LABEL_19;
      }
    }
  }

  -[NSHTTPCookie2LookupFilter path](self, "path");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14) {
    goto LABEL_48;
  }
  v15 = -[NSHTTPCookie2LookupFilter path](self, "path");
  [v4 path];
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  char v17 = [v15 isEqualToString:v16];

  if ((v17 & 1) != 0) {
    goto LABEL_48;
  }
  [v4 path];
  int64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  char v19 = [v18 isEqualToString:@"/"];

  if ((v19 & 1) != 0) {
    goto LABEL_48;
  }
  [v4 path];
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v20 hasSuffix:@"/"])
  {
    [v4 path];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    [v4 path];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v22 stringByAppendingString:@"/"];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23 = -[NSHTTPCookie2LookupFilter path](self, "path");
  char v24 = [v23 hasPrefix:v21];

  if ((v24 & 1) != 0)
  {
LABEL_48:
    v25 = -[NSHTTPCookie2LookupFilter name](self, "name");
    if (!v25) {
      goto LABEL_17;
    }
    v26 = -[NSHTTPCookie2LookupFilter name](self, "name");
    [v4 name];
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    char v28 = [v26 isEqualToString:v27];

    if ((v28 & 1) != 0)
    {
LABEL_17:
      [v4 partition];
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v29 isEqualToString:@"none"])
      {
        v30 = 0LL;
      }

      else
      {
        [v4 partition];
        v30 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v32 = -[NSHTTPCookie2LookupFilter partition](self, "partition");
      if ([v32 isEqualToString:&stru_189C1D1D8])
      {
        v33 = 0LL;
      }

      else
      {
        v33 = -[NSHTTPCookie2LookupFilter partition](self, "partition");
      }

      if (v30 && v33 != v30 && ([v33 isEqualToString:v30] & 1) == 0) {
        goto LABEL_42;
      }
      v34 = -[NSHTTPCookie2LookupFilter siteForCookies](self, "siteForCookies");
      if (!v34) {
        goto LABEL_34;
      }
      uint64_t v35 = [v4 sameSite];
      if (v35 == 1)
      {
        if (-[NSHTTPCookie2LookupFilter isSafe](self, "isSafe")
          && -[NSHTTPCookie2LookupFilter isTopLevelNavigation](self, "isTopLevelNavigation"))
        {
          goto LABEL_34;
        }
      }

      else if (v35 != 2)
      {
LABEL_34:
        if ((-[NSHTTPCookie2LookupFilter ignoreSecureFlag](self, "ignoreSecureFlag")
           || -[NSHTTPCookie2LookupFilter secure](self, "secure")
           || ([v4 secure] & 1) == 0)
          && (-[NSHTTPCookie2LookupFilter ignoreHTTPOnlyCookie](self, "ignoreHTTPOnlyCookie")
           || !-[NSHTTPCookie2LookupFilter httpOnly](self, "httpOnly")
           || [v4 httpOnly]))
        {
          v39 = -[NSHTTPCookie2LookupFilter newerThanExpirationDate](self, "newerThanExpirationDate");
          if (v39)
          {
            [v4 expirationDate];
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = -[NSHTTPCookie2LookupFilter newerThanExpirationDate](self, "newerThanExpirationDate");
            BOOL v42 = v40 < v41;

            char v31 = !v42;
          }

          else
          {
            char v31 = 1;
          }

          goto LABEL_44;
        }

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (NSString)domain
{
  return self->_domain;
}

- (NSString)path
{
  return self->_path;
}

- (NSString)partition
{
  return self->_partition;
}

- (void)setPartition:(id)a3
{
}

- (int64_t)sameSite
{
  return self->_sameSite;
}

- (void)setSameSite:(int64_t)a3
{
  self->_sameSite = a3;
}

- (NSDate)newerThanCreationDate
{
  return self->_newerThanCreationDate;
}

- (void)setNewerThanCreationDate:(id)a3
{
}

- (NSDate)newerThanExpirationDate
{
  return self->_newerThanExpirationDate;
}

- (void)setNewerThanExpirationDate:(id)a3
{
}

- (NSDate)newerThanLastAccess
{
  return self->_newerThanLastAccess;
}

- (void)setNewerThanLastAccess:(id)a3
{
}

- (NSDate)olderThanCreationDate
{
  return self->_olderThanCreationDate;
}

- (void)setOlderThanCreationDate:(id)a3
{
}

- (NSDate)olderThanExpirationDate
{
  return self->_olderThanExpirationDate;
}

- (void)setOlderThanExpirationDate:(id)a3
{
}

- (NSDate)olderThanLastAccess
{
  return self->_olderThanLastAccess;
}

- (void)setOlderThanLastAccess:(id)a3
{
}

- (BOOL)secure
{
  return self->_secure;
}

- (void)setSecure:(BOOL)a3
{
  self->_secure = a3;
}

- (BOOL)httpOnly
{
  return self->_httpOnly;
}

- (void)setHttpOnly:(BOOL)a3
{
  self->_httpOnly = a3;
}

- (BOOL)ignoreHostOnlyFlag
{
  return self->_ignoreHostOnlyFlag;
}

- (void)setIgnoreHostOnlyFlag:(BOOL)a3
{
  self->_ignoreHostOnlyFlag = a3;
}

- (BOOL)ignoreHTTPOnlyCookie
{
  return self->_ignoreHTTPOnlyCookie;
}

- (void)setIgnoreHTTPOnlyCookie:(BOOL)a3
{
  self->_ignoreHTTPOnlyCookie = a3;
}

- (BOOL)ignoreSecureFlag
{
  return self->_ignoreSecureFlag;
}

- (void)setIgnoreSecureFlag:(BOOL)a3
{
  self->_ignoreSecureFlag = a3;
}

- (NSURL)inURL
{
  return self->_inURL;
}

- (void)setInURL:(id)a3
{
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