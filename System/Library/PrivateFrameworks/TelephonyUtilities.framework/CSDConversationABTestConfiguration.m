@interface CSDConversationABTestConfiguration
- (BOOL)isAuthTagEnabled;
- (BOOL)isShortMKIEnabled;
- (BOOL)isTLEEnabled;
- (CSDConversationABTestConfiguration)initWithGroupUUID:(id)a3;
- (CSDConversationServerBag)serverBag;
- (NSUUID)groupUUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)TLESampleRate;
- (unint64_t)authTagSampleRate;
- (void)_generateABTestConfiguration;
- (void)setAuthTagSampleRate:(unint64_t)a3;
- (void)setIsAuthTagEnabled:(BOOL)a3;
- (void)setIsShortMKIEnabled:(BOOL)a3;
- (void)setIsTLEEnabled:(BOOL)a3;
- (void)setServerBag:(id)a3;
- (void)setTLESampleRate:(unint64_t)a3;
@end

@implementation CSDConversationABTestConfiguration

- (CSDConversationABTestConfiguration)initWithGroupUUID:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___CSDConversationABTestConfiguration;
  v6 = -[CSDConversationABTestConfiguration init](&v13, "init");
  if (v6)
  {
    v7 = objc_alloc_init(&OBJC_CLASS___CSDSharedConversationServerBag);
    serverBag = v6->_serverBag;
    v6->_serverBag = (CSDConversationServerBag *)v7;

    objc_storeStrong((id *)&v6->_groupUUID, a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationABTestConfiguration serverBag](v6, "serverBag"));
    v6->_authTagSampleRate = (unint64_t)[v9 uPlusOneAuthTagSampleRate];

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationABTestConfiguration serverBag](v6, "serverBag"));
    v6->_TLESampleRate = (unint64_t)[v10 groupFaceTimeTLESampleRate];

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationABTestConfiguration serverBag](v6, "serverBag"));
    v6->_isShortMKIEnabled = [v11 isShortMKIEnabled];

    -[CSDConversationABTestConfiguration _generateABTestConfiguration](v6, "_generateABTestConfiguration");
  }

  return v6;
}

- (id)description
{
  v3 = +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"<%@ %p",  objc_opt_class(self, a2),  self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationABTestConfiguration groupUUID](self, "groupUUID"));
  [v4 appendFormat:@" groupUUID=%@", v5];

  if (-[CSDConversationABTestConfiguration isShortMKIEnabled](self, "isShortMKIEnabled")) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  [v4 appendFormat:@" isShortMKIEnabled=%@", v6];
  if (-[CSDConversationABTestConfiguration isAuthTagEnabled](self, "isAuthTagEnabled")) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  [v4 appendFormat:@" isAuthTagEnabled=%@", v7];
  if (-[CSDConversationABTestConfiguration isTLEEnabled](self, "isTLEEnabled")) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  [v4 appendFormat:@" isTLEEnabled=%@", v8];
  objc_msgSend( v4,  "appendFormat:",  @" TLESampleRate=%lu",  -[CSDConversationABTestConfiguration TLESampleRate](self, "TLESampleRate"));
  objc_msgSend( v4,  "appendFormat:",  @" authTagSampleRate=%lu",  -[CSDConversationABTestConfiguration authTagSampleRate](self, "authTagSampleRate"));
  [v4 appendString:@">"];
  id v9 = [v4 copy];

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[CSDConversationABTestConfiguration groupUUID](self, "groupUUID"));
  v6 = (void *)v4[3];
  v4[3] = v5;

  *((_BYTE *)v4 + 8) = -[CSDConversationABTestConfiguration isShortMKIEnabled](self, "isShortMKIEnabled");
  *((_BYTE *)v4 + 9) = -[CSDConversationABTestConfiguration isAuthTagEnabled](self, "isAuthTagEnabled");
  *((_BYTE *)v4 + 10) = -[CSDConversationABTestConfiguration isTLEEnabled](self, "isTLEEnabled");
  v4[5] = -[CSDConversationABTestConfiguration TLESampleRate](self, "TLESampleRate");
  v4[4] = -[CSDConversationABTestConfiguration authTagSampleRate](self, "authTagSampleRate");
  return v4;
}

- (void)_generateABTestConfiguration
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDConversationABTestConfiguration groupUUID](self, "groupUUID"));
  unsigned int v4 = [v3 hash];

  if (-[CSDConversationABTestConfiguration isShortMKIEnabled](self, "isShortMKIEnabled")) {
    BOOL v5 = (id)-[CSDConversationABTestConfiguration authTagSampleRate](self, "authTagSampleRate") == (id)100
  }
      || -[CSDConversationABTestConfiguration authTagSampleRate](self, "authTagSampleRate") >= v4 % 0x64;
  else {
    BOOL v5 = 0LL;
  }
  -[CSDConversationABTestConfiguration setIsAuthTagEnabled:](self, "setIsAuthTagEnabled:", v5);
  if (-[CSDConversationABTestConfiguration isShortMKIEnabled](self, "isShortMKIEnabled")) {
    BOOL v6 = (id)-[CSDConversationABTestConfiguration TLESampleRate](self, "TLESampleRate") == (id)100
  }
      || -[CSDConversationABTestConfiguration TLESampleRate](self, "TLESampleRate") >= v4 % 0x64;
  else {
    BOOL v6 = 0LL;
  }
  -[CSDConversationABTestConfiguration setIsTLEEnabled:](self, "setIsTLEEnabled:", v6);
  if (!-[CSDConversationABTestConfiguration isTLEEnabled](self, "isTLEEnabled")
    && !-[CSDConversationABTestConfiguration isAuthTagEnabled](self, "isAuthTagEnabled")
    && -[CSDConversationABTestConfiguration isShortMKIEnabled](self, "isShortMKIEnabled"))
  {
    -[CSDConversationABTestConfiguration setIsShortMKIEnabled:](self, "setIsShortMKIEnabled:", 0LL);
    id v7 = sub_1001704C4();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "set isShortMKIEnabled to NO since both isTLEEnabled and isAuthTagEnabled are false",  (uint8_t *)&v17,  2u);
    }
  }

  id v9 = sub_1001704C4();
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = @"NO";
    if (-[CSDConversationABTestConfiguration isTLEEnabled](self, "isTLEEnabled")) {
      v12 = @"YES";
    }
    else {
      v12 = @"NO";
    }
    if (-[CSDConversationABTestConfiguration isShortMKIEnabled](self, "isShortMKIEnabled")) {
      objc_super v13 = @"YES";
    }
    else {
      objc_super v13 = @"NO";
    }
    if (-[CSDConversationABTestConfiguration isAuthTagEnabled](self, "isAuthTagEnabled")) {
      v11 = @"YES";
    }
    uint64_t v14 = v4;
    unint64_t v15 = -[CSDConversationABTestConfiguration authTagSampleRate](self, "authTagSampleRate");
    unint64_t v16 = -[CSDConversationABTestConfiguration TLESampleRate](self, "TLESampleRate");
    int v17 = 138413570;
    v18 = v12;
    __int16 v19 = 2112;
    v20 = v13;
    __int16 v21 = 2112;
    v22 = v11;
    __int16 v23 = 2048;
    uint64_t v24 = v14;
    __int16 v25 = 2048;
    unint64_t v26 = v15;
    __int16 v27 = 2048;
    unint64_t v28 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "isTLEEnabled: %@, isShortMKIEnabled: %@, isAuthTagEnabled: %@, hashValue: %lu, authTagSampleRate: %lu, TLESampleRate: %lu",  (uint8_t *)&v17,  0x3Eu);
  }
}

- (BOOL)isShortMKIEnabled
{
  return self->_isShortMKIEnabled;
}

- (void)setIsShortMKIEnabled:(BOOL)a3
{
  self->_isShortMKIEnabled = a3;
}

- (BOOL)isAuthTagEnabled
{
  return self->_isAuthTagEnabled;
}

- (void)setIsAuthTagEnabled:(BOOL)a3
{
  self->_isAuthTagEnabled = a3;
}

- (BOOL)isTLEEnabled
{
  return self->_isTLEEnabled;
}

- (void)setIsTLEEnabled:(BOOL)a3
{
  self->_isTLEEnabled = a3;
}

- (CSDConversationServerBag)serverBag
{
  return self->_serverBag;
}

- (void)setServerBag:(id)a3
{
}

- (NSUUID)groupUUID
{
  return self->_groupUUID;
}

- (unint64_t)authTagSampleRate
{
  return self->_authTagSampleRate;
}

- (void)setAuthTagSampleRate:(unint64_t)a3
{
  self->_authTagSampleRate = a3;
}

- (unint64_t)TLESampleRate
{
  return self->_TLESampleRate;
}

- (void)setTLESampleRate:(unint64_t)a3
{
  self->_TLESampleRate = a3;
}

- (void).cxx_destruct
{
}

@end