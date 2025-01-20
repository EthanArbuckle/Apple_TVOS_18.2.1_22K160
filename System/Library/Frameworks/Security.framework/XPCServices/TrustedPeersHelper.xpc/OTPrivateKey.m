@interface OTPrivateKey
+ (__SecKey)createSecKey:(id)a3;
+ (id)fromECKeyPair:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)keyData;
- (id)asECKeyPair:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)keyTypeAsString:(int)a3;
- (int)StringAsKeyType:(id)a3;
- (int)keyType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setKeyData:(id)a3;
- (void)setKeyType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation OTPrivateKey

- (id)asECKeyPair:(id *)a3
{
  if (-[OTPrivateKey keyType](self, "keyType") == 1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrivateKey keyData](self, "keyData"));
    v6 = +[OTPrivateKey createSecKey:](&OBJC_CLASS___OTPrivateKey, "createSecKey:", v5);

    v7 = -[_SFECKeyPair initWithSecKey:](objc_alloc(&OBJC_CLASS____SFECKeyPair), "initWithSecKey:", v6);
    if (v6) {
      CFRelease(v6);
    }
  }

  else
  {
    v7 = 0LL;
    if (a3) {
      *a3 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  OctagonErrorDomain,  29LL,  0LL));
    }
  }

  return v7;
}

+ (id)fromECKeyPair:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new(&OBJC_CLASS___OTPrivateKey);
  -[OTPrivateKey setKeyType:](v4, "setKeyType:", 1LL);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 keyData]);

  -[OTPrivateKey setKeyData:](v4, "setKeyData:", v5);
  return v4;
}

+ (__SecKey)createSecKey:(id)a3
{
  v7[0] = kSecAttrKeyClass;
  v7[1] = kSecAttrKeyType;
  v8[0] = kSecAttrKeyClassPrivate;
  v8[1] = kSecAttrKeyTypeEC;
  id v3 = (const __CFData *)a3;
  v4 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v8,  v7,  2LL));
  v5 = SecKeyCreateWithData(v3, v4, 0LL);

  return v5;
}

- (id)keyTypeAsString:(int)a3
{
  if (a3 == 1) {
    id v3 = @"EC_NIST_CURVES";
  }
  else {
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3));
  }
  return v3;
}

- (int)StringAsKeyType:(id)a3
{
  return 1;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___OTPrivateKey;
  id v3 = -[OTPrivateKey description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTPrivateKey dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if (self->_keyType == 1) {
    v4 = @"EC_NIST_CURVES";
  }
  else {
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  self->_keyType));
  }
  [v3 setObject:v4 forKey:@"keyType"];

  keyData = self->_keyData;
  if (keyData) {
    [v3 setObject:keyData forKey:@"keyData"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1001CD850((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t keyType = self->_keyType;
  id v5 = a3;
  PBDataWriterWriteInt32Field(v5, keyType, 1LL);
  PBDataWriterWriteDataField(v5, self->_keyData, 2LL);
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 4) = self->_keyType;
  [a3 setKeyData:self->_keyData];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v5[4] = self->_keyType;
  id v6 = -[NSData copyWithZone:](self->_keyData, "copyWithZone:", a3);
  v7 = (void *)*((void *)v5 + 1);
  *((void *)v5 + 1) = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class(self)] && self->_keyType == *((_DWORD *)v4 + 4))
  {
    keyData = self->_keyData;
    else {
      unsigned __int8 v6 = 1;
    }
  }

  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2 = 2654435761LL * self->_keyType;
  return (unint64_t)-[NSData hash](self->_keyData, "hash") ^ v2;
}

- (void)mergeFrom:(id)a3
{
  self->_uint64_t keyType = *((_DWORD *)a3 + 4);
  if (*((void *)a3 + 1)) {
    -[OTPrivateKey setKeyData:](self, "setKeyData:");
  }
}

- (int)keyType
{
  return self->_keyType;
}

- (void)setKeyType:(int)a3
{
  self->_uint64_t keyType = a3;
}

- (NSData)keyData
{
  return self->_keyData;
}

- (void)setKeyData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end