@interface IDSServerDesiredEncryptedDataBlobMaterialSet
- (BOOL)isEqual:(id)a3;
- (BOOL)requireSignature;
- (IDSServerDesiredEncryptedDataBlobMaterialSet)initWithEncryptedBlobData:(id)a3 type:(int)a4 requireSignature:(BOOL)a5;
- (NSData)encryptedDataBlob;
- (NSString)description;
- (id)materialDataByID;
- (int)type;
- (unint64_t)forParticipantID;
- (unint64_t)hash;
@end

@implementation IDSServerDesiredEncryptedDataBlobMaterialSet

- (IDSServerDesiredEncryptedDataBlobMaterialSet)initWithEncryptedBlobData:(id)a3 type:(int)a4 requireSignature:(BOOL)a5
{
  id v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___IDSServerDesiredEncryptedDataBlobMaterialSet;
  v10 = -[IDSServerDesiredEncryptedDataBlobMaterialSet init](&v14, "init");
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_encryptedDataBlob, a3);
    v11->_type = a4;
    v11->_requireSignature = a5;
    v12 = v11;
  }

  return v11;
}

- (unint64_t)forParticipantID
{
  return 0LL;
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class(self, a2);
  v4 = @"YES";
  if (!self->_requireSignature) {
    v4 = @"NO";
  }
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p encryptedDataBlob:%@ type: %d, requireSignature:%@>",  v3,  self,  self->_encryptedDataBlob,  self->_type,  v4);
}

- (unint64_t)hash
{
  return (unint64_t)-[NSData hash](self->_encryptedDataBlob, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  if (v5
    && (uint64_t v6 = objc_opt_class(&OBJC_CLASS___IDSServerDesiredEncryptedDataBlobMaterialSet, v4),
        (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    v7 = (id *)v5;
    BOOL v8 = [v7[2] isEqualToData:self->_encryptedDataBlob]
      && *((_DWORD *)v7 + 3) == self->_type
      && *((unsigned __int8 *)v7 + 8) == self->_requireSignature;
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)materialDataByID
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSData subdataWithRange:](self->_encryptedDataBlob, "subdataWithRange:", 0LL, 16LL));
  -[__CFDictionary setObject:forKeyedSubscript:](Mutable, "setObject:forKeyedSubscript:", self->_encryptedDataBlob, v4);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[IDSFoundationLog ServerMaterialExchange]( &OBJC_CLASS___IDSFoundationLog,  "ServerMaterialExchange"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int type = self->_type;
    encryptedDataBlob = self->_encryptedDataBlob;
    int v9 = 138413058;
    v10 = v4;
    __int16 v11 = 1024;
    int v12 = type;
    __int16 v13 = 2112;
    objc_super v14 = encryptedDataBlob;
    __int16 v15 = 2112;
    CFMutableDictionaryRef v16 = Mutable;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "keyID: %@, type: %d, _encryptedDataBlob: %@, result: %@",  (uint8_t *)&v9,  0x26u);
  }

  return Mutable;
}

- (NSData)encryptedDataBlob
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

- (void).cxx_destruct
{
}

@end