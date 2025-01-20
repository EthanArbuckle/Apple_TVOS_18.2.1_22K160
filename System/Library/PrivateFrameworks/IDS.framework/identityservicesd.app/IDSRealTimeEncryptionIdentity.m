@interface IDSRealTimeEncryptionIdentity
- (BOOL)isExpired;
- (BOOL)isPublicKeyDistributed;
- (BOOL)isTestRunning;
- (IDSPushToken)pushToken;
- (IDSRealTimeEncryptionIdentity)init;
- (NSData)publicIdentityData;
- (NSData)publicKeyData;
- (NSDate)expirationDate;
- (NSString)fromID;
- (NSString)groupID;
- (NSString)participantID;
- (NSString)sessionID;
- (__SecKey)fullIdentity;
- (__SecKey)publicIdentity;
- (id)description;
- (int64_t)wrapMode;
- (void)dealloc;
- (void)setExpirationDate:(id)a3;
- (void)setFromID:(id)a3;
- (void)setFullIdentity:(__SecKey *)a3;
- (void)setGroupID:(id)a3;
- (void)setIsPublicKeyDistributed:(BOOL)a3;
- (void)setIsTestRunning:(BOOL)a3;
- (void)setParticipantID:(id)a3;
- (void)setPublicIdentity:(__SecKey *)a3;
- (void)setPublicIdentityData:(id)a3;
- (void)setPushToken:(id)a3;
- (void)setSessionID:(id)a3;
- (void)setWrapMode:(int64_t)a3;
@end

@implementation IDSRealTimeEncryptionIdentity

- (IDSRealTimeEncryptionIdentity)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___IDSRealTimeEncryptionIdentity;
  result = -[IDSRealTimeEncryptionIdentity init](&v3, "init");
  if (result) {
    result->_lock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (void)dealloc
{
  fullIdentity = self->_fullIdentity;
  if (fullIdentity)
  {
    CFRelease(fullIdentity);
    self->_fullIdentity = 0LL;
  }

  publicIdentity = self->_publicIdentity;
  if (publicIdentity)
  {
    CFRelease(publicIdentity);
    self->_publicIdentity = 0LL;
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___IDSRealTimeEncryptionIdentity;
  -[IDSRealTimeEncryptionIdentity dealloc](&v5, "dealloc");
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<IDSRealTimeEncryptionIdentity\n  publicIdentity=%@\n  fullIdentity=%@\n>",  self->_publicIdentity,  self->_fullIdentity);
}

- (void)setFullIdentity:(__SecKey *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  fullIdentity = self->_fullIdentity;
  if (fullIdentity)
  {
    CFRelease(fullIdentity);
    self->_fullIdentity = 0LL;
  }

  self->_fullIdentity = (__SecKey *)CFRetain(a3);
  os_unfair_lock_unlock(p_lock);
}

- (void)setPublicIdentity:(__SecKey *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  publicIdentity = self->_publicIdentity;
  if (publicIdentity)
  {
    CFRelease(publicIdentity);
    self->_publicIdentity = 0LL;
  }

  self->_publicIdentity = (__SecKey *)CFRetain(a3);
  os_unfair_lock_unlock(p_lock);
}

- (NSData)publicKeyData
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (-[IDSRealTimeEncryptionIdentity isTestRunning](self, "isTestRunning"))
  {
    if (!self->_publicIdentityData)
    {
      v4 = (NSData *)objc_claimAutoreleasedReturnValue(+[NSData __imDataWithRandomBytes:](&OBJC_CLASS___NSData, "__imDataWithRandomBytes:", 100LL));
      publicIdentityData = self->_publicIdentityData;
      self->_publicIdentityData = v4;

      uint64_t v6 = OSLogHandleForTransportCategory("IDSRTEncryptionController");
      v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = self->_publicIdentityData;
        *(_DWORD *)buf = 134218242;
        v23 = self;
        __int16 v24 = 2112;
        v25 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%p: Returned the random publicKeyData %@ for the simulator",  buf,  0x16u);
      }

      uint64_t v10 = os_log_shim_legacy_logging_enabled(v9);
      if ((_DWORD)v10)
      {
        if (_IDSShouldLogTransport(v10))
        {
          _IDSLogTransport( @"IDSRTEncryptionController",  @"IDS",  @"%p: Returned the random publicKeyData %@ for the simulator");
          if (_IDSShouldLog(0LL, @"IDSRTEncryptionController")) {
            _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSRTEncryptionController",  @"%p: Returned the random publicKeyData %@ for the simulator");
          }
        }
      }
    }

- (BOOL)isExpired
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRealTimeEncryptionIdentity expirationDate](self, "expirationDate"));
  id v5 = [v3 compare:v4];

  if (v5 != (id)-1LL)
  {
    uint64_t v6 = OSLogHandleForTransportCategory("IDSRTEncryptionController");
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRealTimeEncryptionIdentity expirationDate](self, "expirationDate"));
      *(_DWORD *)buf = 134218498;
      uint64_t v15 = self;
      __int16 v16 = 2112;
      v17 = v3;
      __int16 v18 = 2112;
      uint64_t v19 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%p: This IDSRealTimeEncryptionIdentity is expired. (now: %@, expirationDate: %@)",  buf,  0x20u);
    }

    uint64_t v10 = os_log_shim_legacy_logging_enabled(v9);
    if ((_DWORD)v10)
    {
      if (_IDSShouldLogTransport(v10))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRealTimeEncryptionIdentity expirationDate](self, "expirationDate"));
        _IDSLogTransport( @"IDSRTEncryptionController",  @"IDS",  @"%p: This IDSRealTimeEncryptionIdentity is expired. (now: %@, expirationDate: %@)");

        if (_IDSShouldLog(0LL, @"IDSRTEncryptionController"))
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSRealTimeEncryptionIdentity expirationDate](self, "expirationDate", self, v3, v13));
          _IDSLogV( 0LL,  @"IDSFoundation",  @"IDSRTEncryptionController",  @"%p: This IDSRealTimeEncryptionIdentity is expired. (now: %@, expirationDate: %@)");
        }
      }
    }
  }

  return v5 != (id)-1LL;
}

- (NSString)groupID
{
  return self->_groupID;
}

- (void)setGroupID:(id)a3
{
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (NSString)participantID
{
  return self->_participantID;
}

- (void)setParticipantID:(id)a3
{
}

- (NSString)fromID
{
  return self->_fromID;
}

- (void)setFromID:(id)a3
{
}

- (IDSPushToken)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (BOOL)isPublicKeyDistributed
{
  return self->_isPublicKeyDistributed;
}

- (void)setIsPublicKeyDistributed:(BOOL)a3
{
  self->_isPublicKeyDistributed = a3;
}

- (__SecKey)fullIdentity
{
  return self->_fullIdentity;
}

- (__SecKey)publicIdentity
{
  return self->_publicIdentity;
}

- (NSData)publicIdentityData
{
  return self->_publicIdentityData;
}

- (void)setPublicIdentityData:(id)a3
{
}

- (int64_t)wrapMode
{
  return self->_wrapMode;
}

- (void)setWrapMode:(int64_t)a3
{
  self->_wrapMode = a3;
}

- (BOOL)isTestRunning
{
  return self->_isTestRunning;
}

- (void)setIsTestRunning:(BOOL)a3
{
  self->_isTestRunning = a3;
}

- (void).cxx_destruct
{
}

@end