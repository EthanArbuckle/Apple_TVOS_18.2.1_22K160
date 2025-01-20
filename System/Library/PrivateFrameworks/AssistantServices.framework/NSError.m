@interface NSError
+ (id)_ad_alarmStoreErrorWithCode:(int64_t)a3;
+ (id)_ad_timerStoreErrorWithCode:(int64_t)a3;
+ (id)ad_calendarErrorWithCode:(int64_t)a3;
+ (id)ad_siriTaskHandlerAceTranslationFailureError;
+ (id)ad_siriTaskHandlerErrorWithCode:(int64_t)a3;
- (BOOL)ad_isAssistantNotReadyError;
- (BOOL)ad_isInAssistantErrorDomain;
- (BOOL)ad_isNetworkDownError;
- (BOOL)ad_isPeerConnectionError;
- (BOOL)ad_isPeerNotNearbyError;
- (BOOL)ad_isPeerRemoteError;
- (BOOL)ad_isRetryableConnectionError;
- (BOOL)ad_isRetryableSessionError;
- (BOOL)ad_isStricterRetryableConnectionError;
- (BOOL)ad_isStricterUnreachableError;
- (BOOL)ad_isUnreachableError;
- (BOOL)ad_isUnrecoverablePeerError;
- (BOOL)ad_requiresDampedRetry:(int64_t *)a3;
@end

@implementation NSError

+ (id)_ad_timerStoreErrorWithCode:(int64_t)a3
{
  return  [objc_alloc((Class)a1) initWithDomain:@"com.apple.siri.TimerStore" code:a3 userInfo:&__NSDictionary0__struct];
}

- (BOOL)ad_isInAssistantErrorDomain
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](self, "domain"));
  unsigned __int8 v3 = [v2 isEqualToString:kAFAssistantErrorDomain];

  return v3;
}

- (BOOL)ad_isAssistantNotReadyError
{
  BOOL v3 = -[NSError ad_isInAssistantErrorDomain](self, "ad_isInAssistantErrorDomain");
  if (v3) {
    LOBYTE(v3) = (id)-[NSError code](self, "code") == (id)6;
  }
  return v3;
}

- (BOOL)ad_isUnreachableError
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](self, "domain"));
  uint64_t v4 = -[NSError code](self, "code");
  if ((([v3 isEqualToString:NSPOSIXErrorDomain] & 1) != 0
     || [v3 isEqualToString:kNWErrorDomainPOSIX])
    && ((v4 - 49) & 0xFFFFFFFFFFFFFFFDLL) == 0)
  {
    goto LABEL_25;
  }

  if (![v3 isEqualToString:kNWErrorDomainDNS] || (unsigned int v5 = 1, v4 != -65554) && v4 != -65537)
  {
    else {
      BOOL v6 = 1;
    }
    if (!v6) {
      goto LABEL_25;
    }
    if ([v3 isEqualToString:SiriCoreSiriConnectionErrorDomain])
    {
      unsigned int v5 = 1;
      if (v4 > 21)
      {
      }

      else if (v4)
      {
        if (v4 == 4 || v4 == 16 && -[NSError ad_isNetworkDownError](self, "ad_isNetworkDownError")) {
          goto LABEL_26;
        }
      }

      else
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSError userInfo](self, "userInfo"));
        v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:SiriCoreSiriConnectionHTTPErrorStatusCodeKey]);
        unsigned int v9 = [v8 intValue];

        unsigned int v5 = 1;
        if (v9 == 406 || v9 == 503) {
          goto LABEL_26;
        }
      }
    }

    if ([v3 isEqualToString:kAFAssistantErrorDomain] && v4 == 14)
    {
LABEL_25:
      unsigned int v5 = 1;
      goto LABEL_26;
    }

    unsigned int v5 = -[NSError sn_isNetworkUnreachable](self, "sn_isNetworkUnreachable");
  }

- (BOOL)ad_isRetryableConnectionError
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](self, "domain"));
  NSInteger v4 = -[NSError code](self, "code");
  if (-[NSError ad_isUnreachableError](self, "ad_isUnreachableError")) {
    goto LABEL_2;
  }
  if ([v3 isEqualToString:kAFAssistantErrorDomain])
  {
    if ((v4 & 0xFFFFFFFFFFFFFFFELL) == 0x3E8)
    {
      BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSError userInfo](self, "userInfo"));
      v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:NSUnderlyingErrorKey]);

      if (v7)
      {
        if (objc_msgSend(v7, "ad_isUnrecoverablePeerError"))
        {

LABEL_2:
          unsigned int v5 = 0;
          goto LABEL_13;
        }

        unsigned __int8 v8 = objc_msgSend(v7, "ad_isUnreachableError");

        if ((v8 & 1) != 0) {
          goto LABEL_2;
        }
      }
    }
  }

  if ([v3 isEqualToString:SiriCoreSiriConnectionErrorDomain])
  {
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSError userInfo](self, "userInfo"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:NSUnderlyingErrorKey]);

    if (v10)
    {
      unsigned __int8 v11 = objc_msgSend(v10, "ad_isUnreachableError");

      if ((v11 & 1) != 0) {
        goto LABEL_2;
      }
    }
  }

  unsigned int v5 = -[NSError sn_isNetworkConnectionRetryable](self, "sn_isNetworkConnectionRetryable");
LABEL_13:
  v12 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v13 = @"NO";
    int v15 = 136315650;
    v16 = "-[NSError(ADSiriUtilities) ad_isRetryableConnectionError]";
    __int16 v17 = 2112;
    v18 = self;
    if (v5) {
      int v13 = @"YES";
    }
    __int16 v19 = 2112;
    v20 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s Error %@ is retryable: %@",  (uint8_t *)&v15,  0x20u);
  }

  return v5;
}

- (BOOL)ad_isStricterUnreachableError
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](self, "domain"));
  unint64_t v4 = -[NSError code](self, "code");
  if ((([v3 isEqualToString:NSPOSIXErrorDomain] & 1) != 0
     || [v3 isEqualToString:kNWErrorDomainPOSIX])
    && v4 <= 0x3D
    && ((1LL << v4) & 0x2060000000000000LL) != 0
    || ([v3 isEqualToString:SiriCoreSiriConnectionErrorDomain]
      ? (BOOL v5 = v4 - 5 >= 2)
      : (BOOL v5 = 1),
        !v5))
  {
    unsigned __int8 v6 = 1;
  }

  else
  {
    unsigned __int8 v6 = -[NSError sn_isNetworkUnreachableForServerCause]( self,  "sn_isNetworkUnreachableForServerCause");
  }

  return v6;
}

- (BOOL)ad_isStricterRetryableConnectionError
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](self, "domain"));
  if (-[NSError ad_isStricterUnreachableError](self, "ad_isStricterUnreachableError")
    || [v3 isEqualToString:SiriCoreSiriConnectionErrorDomain]
    && (BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSError userInfo](self, "userInfo")),
        unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:NSUnderlyingErrorKey]),
        v5,
        v6)
    && (unsigned __int8 v7 = objc_msgSend(v6, "ad_isStricterUnreachableError"), v6, (v7 & 1) != 0))
  {
    unsigned int v4 = 0;
  }

  else
  {
    unsigned int v4 = -[NSError sn_isNetworkUnreachableForServerCause](self, "sn_isNetworkUnreachableForServerCause") ^ 1;
  }

  unsigned __int8 v8 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    unsigned int v9 = @"NO";
    int v11 = 136315650;
    v12 = "-[NSError(ADSiriUtilities) ad_isStricterRetryableConnectionError]";
    __int16 v13 = 2112;
    v14 = self;
    if (v4) {
      unsigned int v9 = @"YES";
    }
    __int16 v15 = 2112;
    v16 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s Error %@ is stricter retryable: %@",  (uint8_t *)&v11,  0x20u);
  }

  return v4;
}

- (BOOL)ad_isUnrecoverablePeerError
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](self, "domain"));
  NSInteger v4 = -[NSError code](self, "code");
  unsigned __int8 v5 = [v3 isEqualToString:@"ADPeerStreamConnectionErrorDomain"];
  if ((v4 & 0xFFFFFFFFFFFFFFFDLL) != 0) {
    BOOL v6 = 0;
  }
  else {
    BOOL v6 = v5;
  }

  return v6;
}

- (BOOL)ad_isRetryableSessionError
{
  unsigned int v3 = -[NSError ad_isRetryableConnectionError](self, "ad_isRetryableConnectionError");
  NSInteger v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](self, "domain"));
  NSInteger v5 = -[NSError code](self, "code");
  if (v3)
  {
    unint64_t v6 = v5;
    if ((([v4 isEqualToString:NSPOSIXErrorDomain] & 1) != 0
       || [v4 isEqualToString:kNWErrorDomainPOSIX])
      && v6 == 60)
    {
      unsigned int v3 = 0;
    }

    else if (![v4 isEqualToString:kAFAssistantErrorDomain] {
           || ((unsigned int v3 = 0, v6 > 0x19) || ((1LL << v6) & 0x2000042) == 0) && v6 - 300 >= 2 && v6 != 7000)
    }
    {
      unsigned int v3 = -[NSError sn_isNetworkOperationRetryable](self, "sn_isNetworkOperationRetryable");
    }
  }

  unsigned __int8 v7 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    unsigned __int8 v8 = @"NO";
    int v10 = 136315650;
    int v11 = "-[NSError(ADSiriUtilities) ad_isRetryableSessionError]";
    __int16 v12 = 2112;
    __int16 v13 = self;
    if (v3) {
      unsigned __int8 v8 = @"YES";
    }
    __int16 v14 = 2112;
    __int16 v15 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s Error %@ is retryable session error: %@",  (uint8_t *)&v10,  0x20u);
  }

  return v3;
}

- (BOOL)ad_isPeerConnectionError
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](self, "domain"));
  unint64_t v4 = -[NSError code](self, "code");
  if (([v3 isEqualToString:@"ADPeerStreamConnectionErrorDomain"] & 1) != 0
    || ([v3 isEqualToString:IDSErrorDomain] & 1) != 0)
  {
    unsigned int v5 = 1;
  }

  else
  {
    else {
      BOOL v6 = 1;
    }
    if (v6) {
      unsigned int v5 = 0;
    }
    else {
      unsigned int v5 = (0x10030010u >> v4) & 1;
    }
  }

  unsigned __int8 v7 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    unsigned __int8 v8 = @"NO";
    int v10 = 136315650;
    int v11 = "-[NSError(ADSiriUtilities) ad_isPeerConnectionError]";
    __int16 v12 = 2112;
    __int16 v13 = self;
    if (v5) {
      unsigned __int8 v8 = @"YES";
    }
    __int16 v14 = 2112;
    __int16 v15 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "%s Error %@ is peerError: %@",  (uint8_t *)&v10,  0x20u);
  }

  return v5;
}

- (BOOL)ad_isPeerNotNearbyError
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](self, "domain"));
  if ((-[NSError code](self, "code") & 0xFFFFFFFFFFFFFFFDLL) != 0) {
    unsigned int v4 = 0;
  }
  else {
    unsigned int v4 = [v3 isEqualToString:@"ADPeerStreamConnectionErrorDomain"];
  }
  unsigned int v5 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    BOOL v6 = @"NO";
    int v8 = 136315650;
    unsigned int v9 = "-[NSError(ADSiriUtilities) ad_isPeerNotNearbyError]";
    __int16 v10 = 2112;
    int v11 = self;
    if (v4) {
      BOOL v6 = @"YES";
    }
    __int16 v12 = 2112;
    __int16 v13 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "%s Error %@ is PeerNotNearbyError: %@",  (uint8_t *)&v8,  0x20u);
  }

  return v4;
}

- (BOOL)ad_isPeerRemoteError
{
  unsigned __int8 v3 = -[NSError ad_isUnreachableError](self, "ad_isUnreachableError");
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](self, "domain"));
  unsigned int v5 = v4;
  if ((v3 & 1) != 0)
  {
    BOOL v6 = 1;
  }

  else if (([v4 isEqualToString:NSPOSIXErrorDomain] & 1) != 0 {
         || [v5 isEqualToString:kNWErrorDomainPOSIX])
  }
  {
    NSInteger v7 = -[NSError code](self, "code");
    BOOL v6 = v7 == 54 || v7 == 32;
  }

  else
  {
    BOOL v6 = 0;
  }

  unsigned int v9 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    __int16 v10 = @"NO";
    int v12 = 136315650;
    __int16 v13 = "-[NSError(ADSiriUtilities) ad_isPeerRemoteError]";
    __int16 v14 = 2112;
    __int16 v15 = self;
    if (v6) {
      __int16 v10 = @"YES";
    }
    __int16 v16 = 2112;
    __int16 v17 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "%s Error %@ is peerRemoteError: %@",  (uint8_t *)&v12,  0x20u);
  }

  return v6;
}

- (BOOL)ad_requiresDampedRetry:(int64_t *)a3
{
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](self, "domain"));
  if (([v5 isEqualToString:NSPOSIXErrorDomain] & 1) != 0
    || [v5 isEqualToString:kNWErrorDomainPOSIX])
  {
    unint64_t v6 = -[NSError code](self, "code");
    if (v6 <= 0x37 && ((1LL << v6) & 0xC4000000000000LL) != 0)
    {
      if (a3) {
        *a3 = -[NSError code](self, "code");
      }
      goto LABEL_7;
    }
  }

  else
  {
    int v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSError userInfo](self, "userInfo"));
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:NSUnderlyingErrorKey]);

    if (v9)
    {
      unsigned __int8 v10 = objc_msgSend(v9, "ad_requiresDampedRetry:", a3);

      if ((v10 & 1) != 0)
      {
LABEL_7:
        unsigned int v7 = 1;
        goto LABEL_11;
      }
    }
  }

  unsigned int v7 = -[NSError sn_isNetworkConnectionRetryableAfterDelay]( self,  "sn_isNetworkConnectionRetryableAfterDelay");
LABEL_11:
  int v11 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v12 = @"NO";
    int v14 = 136315650;
    __int16 v15 = "-[NSError(ADSiriUtilities) ad_requiresDampedRetry:]";
    __int16 v16 = 2112;
    __int16 v17 = self;
    if (v7) {
      int v12 = @"YES";
    }
    __int16 v18 = 2112;
    __int16 v19 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "%s Error %@ requires damped retry: %@",  (uint8_t *)&v14,  0x20u);
  }

  return v7;
}

- (BOOL)ad_isNetworkDownError
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSError userInfo](self, "userInfo"));
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v3 objectForKey:NSUnderlyingErrorKey]);
  unsigned int v5 = (void *)v4;
  if (v4) {
    unint64_t v6 = (NSError *)v4;
  }
  else {
    unint64_t v6 = self;
  }
  unsigned int v7 = v6;

  if ((id)-[NSError code](v7, "code") == (id)50)
  {
    int v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](v7, "domain"));
    if ([v8 isEqualToString:kNWErrorDomainPOSIX])
    {

LABEL_8:
      unsigned int v11 = 1;
      goto LABEL_10;
    }

    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSError domain](v7, "domain"));
    unsigned __int8 v10 = [v9 isEqualToString:NSPOSIXErrorDomain];

    if ((v10 & 1) != 0) {
      goto LABEL_8;
    }
  }

  unsigned int v11 = -[NSError sn_isNetworkDown](self, "sn_isNetworkDown");
LABEL_10:
  int v12 = (os_log_s *)AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    __int16 v13 = @"NO";
    int v15 = 136315650;
    __int16 v16 = "-[NSError(ADSiriUtilities) ad_isNetworkDownError]";
    __int16 v17 = 2112;
    __int16 v18 = self;
    if (v11) {
      __int16 v13 = @"YES";
    }
    __int16 v19 = 2112;
    v20 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "%s Error %@ is network down: %@",  (uint8_t *)&v15,  0x20u);
  }

  return v11;
}

+ (id)_ad_alarmStoreErrorWithCode:(int64_t)a3
{
  return  [objc_alloc((Class)a1) initWithDomain:@"com.apple.siri.AlarmStore" code:a3 userInfo:&__NSDictionary0__struct];
}

+ (id)ad_calendarErrorWithCode:(int64_t)a3
{
  return [a1 errorWithDomain:@"com.apple.siri.calendar.Error" code:a3 userInfo:&__NSDictionary0__struct];
}

+ (id)ad_siriTaskHandlerErrorWithCode:(int64_t)a3
{
  return  [objc_alloc((Class)a1) initWithDomain:@"com.apple.siri.TaskServiceErrorDomain" code:a3 userInfo:0];
}

+ (id)ad_siriTaskHandlerAceTranslationFailureError
{
  return _objc_msgSend(a1, "ad_siriTaskHandlerErrorWithCode:", 100);
}

@end