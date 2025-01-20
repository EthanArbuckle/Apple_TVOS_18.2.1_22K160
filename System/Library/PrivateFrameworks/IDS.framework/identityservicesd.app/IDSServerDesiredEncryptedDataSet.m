@interface IDSServerDesiredEncryptedDataSet
- (BOOL)isEqual:(id)a3;
- (BOOL)requireSignature;
- (IDSServerDesiredEncryptedDataSet)initWithEncryptedData:(id)a3 type:(int)a4 forPublicIdentity:(__SecKey *)a5 forParticipantID:(unint64_t)a6;
- (NSData)encryptedData;
- (NSString)description;
- (__SecKey)forPublicIdentity;
- (id)_wrapData:(id)a3 error:(id *)a4;
- (id)materialDataByID;
- (int)type;
- (unint64_t)forParticipantID;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation IDSServerDesiredEncryptedDataSet

- (IDSServerDesiredEncryptedDataSet)initWithEncryptedData:(id)a3 type:(int)a4 forPublicIdentity:(__SecKey *)a5 forParticipantID:(unint64_t)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___IDSServerDesiredEncryptedDataSet;
  v12 = -[IDSServerDesiredEncryptedDataSet init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_encryptedData, a3);
    v13->_type = a4;
    CFRetain(a5);
    v13->_forPublicIdentity = a5;
    v13->_forParticipantID = a6;
    v13->_requireSignature = 1;
  }

  return v13;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___IDSServerDesiredEncryptedDataSet;
  -[IDSServerDesiredEncryptedDataSet dealloc](&v3, "dealloc");
}

- (NSString)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p forParticipantID: %llu forPublicIdentity: %@ encryptedData: %@>",  objc_opt_class(self, a2),  self,  self->_forParticipantID,  self->_forPublicIdentity,  self->_encryptedData);
}

- (unint64_t)hash
{
  unint64_t v2 = self->_forParticipantID ^ (unint64_t)self->_forPublicIdentity;
  return v2 ^ (unint64_t)-[NSData hash](self->_encryptedData, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  if (v5
    && (uint64_t v6 = objc_opt_class(&OBJC_CLASS___IDSServerDesiredEncryptedDataSet, v4),
        (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    id v7 = v5;
    v8 = (NSData *)objc_claimAutoreleasedReturnValue([v7 encryptedData]);
    BOOL v9 = v8 == self->_encryptedData
      && [v7 forPublicIdentity] == self->_forPublicIdentity
      && [v7 forParticipantID] == (id)self->_forParticipantID;
  }

  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)_wrapData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = objc_claimAutoreleasedReturnValue( +[GFTKeyWrapping encrypt:toKey:error:]( &OBJC_CLASS___GFTKeyWrapping,  "encrypt:toKey:error:",  v6,  self->_forPublicIdentity,  a4));
  v8 = (void *)v7;
  if (a4 || !v7)
  {
    BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog ServerMaterialExchange]( &OBJC_CLASS___IDSFoundationLog,  "ServerMaterialExchange"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      forPublicIdentity = self->_forPublicIdentity;
      unint64_t forParticipantID = self->_forParticipantID;
      id v13 = *a4;
      int v14 = 134218754;
      unint64_t v15 = forParticipantID;
      __int16 v16 = 2112;
      v17 = forPublicIdentity;
      __int16 v18 = 2112;
      id v19 = v13;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "_wrapData: Couldn't protect the data for _forParticipantID: %llu _forPublicIdentity: %@ (error: %@), data: %@",  (uint8_t *)&v14,  0x2Au);
    }
  }

  return v8;
}

- (id)materialDataByID
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  uint64_t v4 = IDSGetUUIDDataFromNSUUID(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  int v7 = IMGetDomainBoolForKey(@"com.apple.ids", @"disableEncryptionForData");
  encryptedData = self->_encryptedData;
  if (v7)
  {
    BOOL v9 = encryptedData;
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog ServerMaterialExchange]( &OBJC_CLASS___IDSFoundationLog,  "ServerMaterialExchange"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "IDSServerDesiredEncryptedDataSet: disableEncryptionForData, use plain data: %@",  buf,  0xCu);
    }

    goto LABEL_10;
  }

  id v25 = 0LL;
  id v11 = (NSData *)objc_claimAutoreleasedReturnValue(-[IDSServerDesiredEncryptedDataSet _wrapData:error:](self, "_wrapData:error:", encryptedData, &v25));
  v12 = (NSData *)v25;
  if (!v12)
  {
    BOOL v9 = v11;
LABEL_10:
    unint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog ServerMaterialExchange]( &OBJC_CLASS___IDSFoundationLog,  "ServerMaterialExchange"));
    __int16 v16 = v15;
    if (v9)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v17 = -[IDSServerDesiredEncryptedDataSet forParticipantID](self, "forParticipantID");
        __int16 v18 = -[IDSServerDesiredEncryptedDataSet forPublicIdentity](self, "forPublicIdentity");
        id v19 = self->_encryptedData;
        *(_DWORD *)buf = 134218754;
        v27 = (NSData *)v17;
        __int16 v28 = 2112;
        v29 = v18;
        __int16 v30 = 2112;
        v31 = v19;
        __int16 v32 = 2112;
        v33 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "IDSServerDesiredEncryptedDataSet materialDataByID: encrypted the data for participantID: %llu, remote pub key: %@, data: %@, protectedData: %@",  buf,  0x2Au);
      }

      CFMutableDictionaryRef v20 = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      -[__CFDictionary setObject:forKeyedSubscript:]( v20,  "setObject:forKeyedSubscript:",  v9,  IDSDSessionMessageRealTimeEncryptionEncryptedData);
      -[__CFDictionary setObject:forKeyedSubscript:]( v20,  "setObject:forKeyedSubscript:",  &off_100946BB8,  IDSDSessionMessageRealTimeEncryptionWrapModeKey);
      id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  self->_forParticipantID));
      -[__CFDictionary setObject:forKeyedSubscript:]( v20,  "setObject:forKeyedSubscript:",  v21,  IDSRealTimeEncryptionParticipantID);

      uint64_t v22 = JWEncodeDictionary(v20);
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      -[__CFDictionary setObject:forKeyedSubscript:](Mutable, "setObject:forKeyedSubscript:", v23, v5);
      int v14 = Mutable;
    }

    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_100699468(v16);
      }
      int v14 = 0LL;
      BOOL v9 = (NSData *)v16;
    }

    goto LABEL_17;
  }

  BOOL v9 = v12;
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog ServerMaterialExchange]( &OBJC_CLASS___IDSFoundationLog,  "ServerMaterialExchange"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_1006994A8((uint64_t)v9, v13);
  }

  int v14 = 0LL;
LABEL_17:

  return v14;
}

- (NSData)encryptedData
{
  return (NSData *)objc_getProperty(self, a2, 16LL, 1);
}

- (int)type
{
  return self->_type;
}

- (BOOL)requireSignature
{
  return self->_requireSignature;
}

- (__SecKey)forPublicIdentity
{
  return self->_forPublicIdentity;
}

- (unint64_t)forParticipantID
{
  return self->_forParticipantID;
}

- (void).cxx_destruct
{
}

@end