@interface IDSServerDesiredPreKeyMaterialSet
- (BOOL)isEqual:(id)a3;
- (BOOL)requireSignature;
- (IDSServerDesiredPreKeyMaterialSet)initWithPublicPreKeyData:(id)a3 wrapMode:(int64_t)a4 creationDate:(id)a5;
- (IDSServerDesiredPreKeyMaterialSet)initWithUUID:(id)a3 publicPreKeyData:(id)a4 wrapMode:(int64_t)a5 creationDate:(id)a6;
- (NSData)publicPreKeyData;
- (NSDate)creationDate;
- (NSString)description;
- (NSUUID)uuid;
- (id)materialDataByID;
- (int)type;
- (int64_t)wrapMode;
- (unint64_t)forParticipantID;
- (unint64_t)hash;
@end

@implementation IDSServerDesiredPreKeyMaterialSet

- (IDSServerDesiredPreKeyMaterialSet)initWithPublicPreKeyData:(id)a3 wrapMode:(int64_t)a4 creationDate:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  v11 = -[IDSServerDesiredPreKeyMaterialSet initWithUUID:publicPreKeyData:wrapMode:creationDate:]( self,  "initWithUUID:publicPreKeyData:wrapMode:creationDate:",  v10,  v9,  a4,  v8);

  return v11;
}

- (IDSServerDesiredPreKeyMaterialSet)initWithUUID:(id)a3 publicPreKeyData:(id)a4 wrapMode:(int64_t)a5 creationDate:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___IDSServerDesiredPreKeyMaterialSet;
  v14 = -[IDSServerDesiredPreKeyMaterialSet init](&v18, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_publicPreKeyData, a4);
    v15->_type = 11;
    objc_storeStrong((id *)&v15->_uuid, a3);
    v15->_wrapMode = a5;
    objc_storeStrong((id *)&v15->_creationDate, a6);
    v15->_requireSignature = 1;
    v16 = v15;
  }

  return v15;
}

- (unint64_t)forParticipantID
{
  return 0LL;
}

- (NSString)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p preKey=%@>",  objc_opt_class(self, a2),  self,  self->_publicPreKeyData);
}

- (unint64_t)hash
{
  return (unint64_t)-[NSData hash](self->_publicPreKeyData, "hash");
}

- (BOOL)isEqual:(id)a3
{
  v5 = (id *)a3;
  if (v5
    && (uint64_t v6 = objc_opt_class(&OBJC_CLASS___IDSServerDesiredPreKeyMaterialSet, v4),
        (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    unsigned __int8 v7 = [v5[2] isEqual:self->_publicPreKeyData];
  }

  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (id)materialDataByID
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  uint64_t v4 = IDSGetUUIDDataFromNSUUID(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  objc_super v18 = v5;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[IDSGroupEncryptionPreKeyDictionaryKeys publicPreKey]( &OBJC_CLASS____TtC17identityservicesd38IDSGroupEncryptionPreKeyDictionaryKeys,  "publicPreKey"));
  v16[0] = v6;
  v17[0] = self->_publicPreKeyData;
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue( +[IDSGroupEncryptionPreKeyDictionaryKeys creationDate]( &OBJC_CLASS____TtC17identityservicesd38IDSGroupEncryptionPreKeyDictionaryKeys,  "creationDate"));
  v16[1] = v7;
  -[NSDate timeIntervalSince1970](self->_creationDate, "timeIntervalSince1970");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
  v17[1] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[IDSGroupEncryptionPreKeyDictionaryKeys wrapMode]( &OBJC_CLASS____TtC17identityservicesd38IDSGroupEncryptionPreKeyDictionaryKeys,  "wrapMode"));
  v16[2] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", self->_wrapMode));
  v17[2] = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v17,  v16,  3LL));
  uint64_t v12 = JWEncodeDictionary(v11);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v19 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));

  return v14;
}

- (NSData)publicPreKeyData
{
  return (NSData *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSDate)creationDate
{
  return (NSDate *)objc_getProperty(self, a2, 24LL, 1);
}

- (int64_t)wrapMode
{
  return self->_wrapMode;
}

- (int)type
{
  return self->_type;
}

- (BOOL)requireSignature
{
  return self->_requireSignature;
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 40LL, 1);
}

- (void).cxx_destruct
{
}

@end