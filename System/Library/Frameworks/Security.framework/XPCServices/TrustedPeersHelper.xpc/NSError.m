@interface NSError
+ (void)setDefaultRetryIntervalForTests:(double)a3;
- (BOOL)_isCKServerInternalError;
- (BOOL)_isRetryableAKError;
- (BOOL)_isRetryableNSURLError;
- (BOOL)ckksIsCKErrorRecordChangedError;
- (BOOL)isCKInternalServerHTTPError;
- (BOOL)isCKKSServerPluginError:(int64_t)a3;
- (BOOL)isCKServerInternalError;
- (BOOL)isCuttlefishError:(int64_t)a3;
- (BOOL)isRetryable;
- (double)cuttlefishRetryAfter;
- (double)retryInterval;
@end

@implementation NSError

- (BOOL)_isCKServerInternalError
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSError userInfo](self, "userInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:NSUnderlyingErrorKey]);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](self, "domain"));
  if ([v5 isEqualToString:@"CKErrorDomain"])
  {
    NSInteger v6 = -[NSError code](self, "code");
    BOOL v7 = 0;
    if (v6 == 15 && v4)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue([v4 domain]);
      else {
        BOOL v7 = 0;
      }
    }
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)isCuttlefishError:(int64_t)a3
{
  v4 = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](v4, "domain"));
  id v6 = -[NSError code](v4, "code");

  if (v6 == (id)15)
  {
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSError userInfo](v4, "userInfo"));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:NSUnderlyingErrorKey]);

    v8 = (void *)objc_claimAutoreleasedReturnValue([v5 domain]);
    id v9 = [v5 code];

    if (v9 == (id)6000)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue([v5 userInfo]);
      v8 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:NSUnderlyingErrorKey]);

      v11 = (void *)objc_claimAutoreleasedReturnValue([v8 domain]);
      if ([v11 isEqualToString:CuttlefishErrorDomain])
      {
        id v12 = [v8 code];

        if (v12 == (id)a3)
        {
          BOOL v13 = 1;
LABEL_12:

          goto LABEL_13;
        }
      }

      else
      {
      }

- (BOOL)_isRetryableNSURLError
{
  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](v2, "domain"));
  unsigned int v4 = [v3 isEqualToString:NSURLErrorDomain];

  if (v4) {
    BOOL v5 = (((unint64_t)-[NSError code](v2, "code") + 1009) & 0xFFFFFFFFFFFFFFF7LL) == 0;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_isRetryableAKError
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSError userInfo](self, "userInfo"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:NSUnderlyingErrorKey]);

  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](self, "domain"));
  unsigned __int8 v6 = 0;

  return v6;
}

- (BOOL)isRetryable
{
  if (-[NSError isCuttlefishError:](self, "isCuttlefishError:", 1021LL)
    || -[NSError isCuttlefishError:](self, "isCuttlefishError:", 1019LL)
    || -[NSError isCuttlefishError:](self, "isCuttlefishError:", 1002LL)
    || -[NSError isCuttlefishError:](self, "isCuttlefishError:", 1004LL)
    || -[NSError isCuttlefishError:](self, "isCuttlefishError:", 1016LL)
    || -[NSError isCuttlefishError:](self, "isCuttlefishError:", 1017LL)
    || -[NSError isCuttlefishError:](self, "isCuttlefishError:", 1038LL))
  {
    goto LABEL_8;
  }

  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](self, "domain"));
  unsigned int v5 = [v4 isEqualToString:TrustedPeersHelperErrorDomain];

  if (v5)
  {
    LOBYTE(v3) = (id)-[NSError code](self, "code") == (id)36;
    return v3;
  }

  if (-[NSError _isRetryableNSURLError](self, "_isRetryableNSURLError")) {
    goto LABEL_8;
  }
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](self, "domain"));
  unsigned int v7 = [v6 isEqualToString:@"CKErrorDomain"];

  if (!v7)
  {
    if (!-[NSError _isCKServerInternalError](self, "_isCKServerInternalError"))
    {
      LOBYTE(v3) = -[NSError _isRetryableAKError](self, "_isRetryableAKError");
      return v3;
    }

    goto LABEL_8;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSError userInfo](self, "userInfo"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"CKRetryAfter"]);

  if (v9)
  {
LABEL_8:
    LOBYTE(v3) = 1;
    return v3;
  }

  unint64_t v10 = -[NSError code](self, "code");
  if (v10 >= 8) {
    LOBYTE(v3) = 0;
  }
  else {
    return (0x98u >> v10) & 1;
  }
  return v3;
}

- (double)cuttlefishRetryAfter
{
  v2 = self;
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](v2, "domain"));
  double v4 = 0.0;
  id v5 = -[NSError code](v2, "code");

  if (v5 == (id)15)
  {
    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSError userInfo](v2, "userInfo"));
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:NSUnderlyingErrorKey]);

    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
    if ([v7 isEqualToString:@"CKInternalErrorDomain"])
    {
      id v8 = [v3 code];

      if (v8 != (id)6000)
      {
LABEL_9:

        goto LABEL_10;
      }

      id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
      unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:NSUnderlyingErrorKey]);

      unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 domain]);
      LODWORD(v9) = [v10 isEqualToString:CuttlefishErrorDomain];

      if ((_DWORD)v9)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue([v7 userInfo]);
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:CuttlefishErrorRetryAfterKey]);

        if (v12)
        {
          [v12 doubleValue];
          double v4 = v13;
        }
      }
    }

    goto LABEL_9;
  }

- (double)retryInterval
{
  v2 = self;
  uint64_t v14 = 0LL;
  v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  v17 = sub_1001BFFD0;
  v18 = sub_1001BFFE0;
  id v19 = 0LL;
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](v2, "domain"));
  unsigned int v4 = [v3 isEqualToString:@"CKErrorDomain"];

  if (v4)
  {
    if ((id)-[NSError code](v2, "code") == (id)2)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSError userInfo](v2, "userInfo"));
      unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"CKPartialErrors"]);

      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_1001BFFE8;
      v13[3] = &unk_10023DB80;
      v13[4] = &v14;
      [v6 enumerateKeysAndObjectsUsingBlock:v13];
    }

    else
    {
      unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSError userInfo](v2, "userInfo"));
      uint64_t v7 = objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"CKRetryAfter"]);
      id v8 = (void *)v15[5];
      v15[5] = v7;
    }
  }

  id v9 = (void *)v15[5];
  if (v9)
  {
    [v9 doubleValue];
    double v11 = v10;
  }

  else
  {
    double v11 = 0.0;
  }

  _Block_object_dispose(&v14, 8);

  -[NSError cuttlefishRetryAfter](v2, "cuttlefishRetryAfter");
  if (v11 >= result) {
    double result = v11;
  }
  if (result == 0.0) {
    return *(double *)&qword_100257FB8;
  }
  return result;
}

+ (void)setDefaultRetryIntervalForTests:(double)a3
{
  qword_100257FB8 = *(void *)&a3;
}

- (BOOL)ckksIsCKErrorRecordChangedError
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSError userInfo](self, "userInfo"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:CKPartialErrorsByItemIDKey]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](self, "domain"));
  if (![v5 isEqualToString:CKErrorDomain] || (id)-[NSError code](self, "code") != (id)2)
  {

    goto LABEL_18;
  }

  if (!v4)
  {
LABEL_18:
    BOOL v14 = 0;
    goto LABEL_19;
  }

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectEnumerator", 0));
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 domain]);
        if (![v12 isEqualToString:CKErrorDomain])
        {

LABEL_21:
          BOOL v14 = 0;
          goto LABEL_22;
        }

        if ([v11 code] == (id)22 || objc_msgSend(v11, "code") == (id)14)
        {
        }

        else
        {
          id v13 = [v11 code];

          if (v13 != (id)11) {
            goto LABEL_21;
          }
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  BOOL v14 = 1;
LABEL_22:

LABEL_19:
  return v14;
}

- (BOOL)isCKKSServerPluginError:(int64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSError userInfo](self, "userInfo"));
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:NSUnderlyingErrorKey]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 userInfo]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:NSUnderlyingErrorKey]);

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](self, "domain"));
  if ([v9 isEqualToString:CKErrorDomain])
  {
    BOOL v10 = 0;
    if ((id)-[NSError code](self, "code") == (id)15 && v6)
    {
      double v11 = (void *)objc_claimAutoreleasedReturnValue([v6 domain]);
      if (![v11 isEqualToString:CKUnderlyingErrorDomain]
        || ([v6 code] == (id)6000 ? (BOOL v12 = v8 == 0) : (BOOL v12 = 1), v12))
      {
        BOOL v10 = 0;
      }

      else
      {
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 domain]);
        else {
          BOOL v10 = 0;
        }
      }
    }
  }

  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)isCKServerInternalError
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSError userInfo](self, "userInfo"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:NSUnderlyingErrorKey]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](self, "domain"));
  if ([v5 isEqualToString:CKErrorDomain])
  {
    NSInteger v6 = -[NSError code](self, "code");
    BOOL v7 = 0;
    if (v6 == 15 && v4)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 domain]);
      else {
        BOOL v7 = 0;
      }
    }
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)isCKInternalServerHTTPError
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSError userInfo](self, "userInfo"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:NSUnderlyingErrorKey]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](self, "domain"));
  if ([v5 isEqualToString:CKErrorDomain])
  {
    NSInteger v6 = -[NSError code](self, "code");
    BOOL v7 = 0;
    if (v6 == 15 && v4)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 domain]);
      else {
        BOOL v7 = 0;
      }
    }
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

@end