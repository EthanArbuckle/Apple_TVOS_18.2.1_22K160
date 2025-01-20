@interface CSDMessagingPersonNameComponents
- (BOOL)hasFamilyName;
- (BOOL)hasGivenName;
- (BOOL)hasMiddleName;
- (BOOL)hasNamePrefix;
- (BOOL)hasNameSuffix;
- (BOOL)hasNickname;
- (BOOL)hasPhoneticRepresentation;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CSDMessagingPersonNameComponents)initWithPersonNameComponents:(id)a3;
- (CSDMessagingPersonNameComponents)phoneticRepresentation;
- (NSPersonNameComponents)personNameComponents;
- (NSString)familyName;
- (NSString)givenName;
- (NSString)middleName;
- (NSString)namePrefix;
- (NSString)nameSuffix;
- (NSString)nickname;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFamilyName:(id)a3;
- (void)setGivenName:(id)a3;
- (void)setMiddleName:(id)a3;
- (void)setNamePrefix:(id)a3;
- (void)setNameSuffix:(id)a3;
- (void)setNickname:(id)a3;
- (void)setPhoneticRepresentation:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingPersonNameComponents

- (CSDMessagingPersonNameComponents)initWithPersonNameComponents:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___CSDMessagingPersonNameComponents;
  v5 = -[CSDMessagingPersonNameComponents init](&v21, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 givenName]);
    -[CSDMessagingPersonNameComponents setGivenName:](v5, "setGivenName:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 middleName]);
    -[CSDMessagingPersonNameComponents setMiddleName:](v5, "setMiddleName:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 familyName]);
    -[CSDMessagingPersonNameComponents setFamilyName:](v5, "setFamilyName:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 namePrefix]);
    -[CSDMessagingPersonNameComponents setNamePrefix:](v5, "setNamePrefix:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue([v4 nameSuffix]);
    -[CSDMessagingPersonNameComponents setNameSuffix:](v5, "setNameSuffix:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue([v4 nickname]);
    -[CSDMessagingPersonNameComponents setNickname:](v5, "setNickname:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue([v4 phoneticRepresentation]);
    if (v12)
    {
      v13 = objc_alloc_init(&OBJC_CLASS___CSDMessagingPersonNameComponents);
      v14 = (void *)objc_claimAutoreleasedReturnValue([v4 phoneticRepresentation]);
      v15 = (void *)objc_claimAutoreleasedReturnValue([v14 givenName]);
      -[CSDMessagingPersonNameComponents setGivenName:](v13, "setGivenName:", v15);

      v16 = (void *)objc_claimAutoreleasedReturnValue([v4 phoneticRepresentation]);
      v17 = (void *)objc_claimAutoreleasedReturnValue([v16 middleName]);
      -[CSDMessagingPersonNameComponents setMiddleName:](v13, "setMiddleName:", v17);

      v18 = (void *)objc_claimAutoreleasedReturnValue([v4 phoneticRepresentation]);
      v19 = (void *)objc_claimAutoreleasedReturnValue([v18 familyName]);
      -[CSDMessagingPersonNameComponents setFamilyName:](v13, "setFamilyName:", v19);

      -[CSDMessagingPersonNameComponents setPhoneticRepresentation:](v5, "setPhoneticRepresentation:", v13);
    }
  }

  return v5;
}

- (NSPersonNameComponents)personNameComponents
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSPersonNameComponents);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingPersonNameComponents givenName](self, "givenName"));
  -[NSPersonNameComponents setGivenName:](v3, "setGivenName:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingPersonNameComponents middleName](self, "middleName"));
  -[NSPersonNameComponents setMiddleName:](v3, "setMiddleName:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingPersonNameComponents familyName](self, "familyName"));
  -[NSPersonNameComponents setFamilyName:](v3, "setFamilyName:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingPersonNameComponents namePrefix](self, "namePrefix"));
  -[NSPersonNameComponents setNamePrefix:](v3, "setNamePrefix:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingPersonNameComponents nameSuffix](self, "nameSuffix"));
  -[NSPersonNameComponents setNameSuffix:](v3, "setNameSuffix:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingPersonNameComponents nickname](self, "nickname"));
  -[NSPersonNameComponents setNickname:](v3, "setNickname:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingPersonNameComponents phoneticRepresentation](self, "phoneticRepresentation"));
  if (v10)
  {
    v11 = objc_alloc_init(&OBJC_CLASS___NSPersonNameComponents);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingPersonNameComponents phoneticRepresentation](self, "phoneticRepresentation"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 givenName]);
    -[NSPersonNameComponents setGivenName:](v11, "setGivenName:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingPersonNameComponents phoneticRepresentation](self, "phoneticRepresentation"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 middleName]);
    -[NSPersonNameComponents setMiddleName:](v11, "setMiddleName:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingPersonNameComponents phoneticRepresentation](self, "phoneticRepresentation"));
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 familyName]);
    -[NSPersonNameComponents setFamilyName:](v11, "setFamilyName:", v17);

    -[NSPersonNameComponents setPhoneticRepresentation:](v3, "setPhoneticRepresentation:", v11);
  }

  return v3;
}

- (BOOL)hasNamePrefix
{
  return self->_namePrefix != 0LL;
}

- (BOOL)hasGivenName
{
  return self->_givenName != 0LL;
}

- (BOOL)hasMiddleName
{
  return self->_middleName != 0LL;
}

- (BOOL)hasFamilyName
{
  return self->_familyName != 0LL;
}

- (BOOL)hasNameSuffix
{
  return self->_nameSuffix != 0LL;
}

- (BOOL)hasNickname
{
  return self->_nickname != 0LL;
}

- (BOOL)hasPhoneticRepresentation
{
  return self->_phoneticRepresentation != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CSDMessagingPersonNameComponents;
  id v3 = -[CSDMessagingPersonNameComponents description](&v8, "description");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingPersonNameComponents dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v4 = v3;
  namePrefix = self->_namePrefix;
  if (namePrefix) {
    [v3 setObject:namePrefix forKey:@"namePrefix"];
  }
  givenName = self->_givenName;
  if (givenName) {
    [v4 setObject:givenName forKey:@"givenName"];
  }
  middleName = self->_middleName;
  if (middleName) {
    [v4 setObject:middleName forKey:@"middleName"];
  }
  familyName = self->_familyName;
  if (familyName) {
    [v4 setObject:familyName forKey:@"familyName"];
  }
  nameSuffix = self->_nameSuffix;
  if (nameSuffix) {
    [v4 setObject:nameSuffix forKey:@"nameSuffix"];
  }
  nickname = self->_nickname;
  if (nickname) {
    [v4 setObject:nickname forKey:@"nickname"];
  }
  phoneticRepresentation = self->_phoneticRepresentation;
  if (phoneticRepresentation)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue( -[CSDMessagingPersonNameComponents dictionaryRepresentation]( phoneticRepresentation,  "dictionaryRepresentation"));
    [v4 setObject:v12 forKey:@"phoneticRepresentation"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000B270C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  namePrefix = self->_namePrefix;
  id v12 = v4;
  if (namePrefix)
  {
    PBDataWriterWriteStringField(v4, namePrefix, 1LL);
    id v4 = v12;
  }

  givenName = self->_givenName;
  if (givenName)
  {
    PBDataWriterWriteStringField(v12, givenName, 2LL);
    id v4 = v12;
  }

  middleName = self->_middleName;
  if (middleName)
  {
    PBDataWriterWriteStringField(v12, middleName, 3LL);
    id v4 = v12;
  }

  familyName = self->_familyName;
  if (familyName)
  {
    PBDataWriterWriteStringField(v12, familyName, 4LL);
    id v4 = v12;
  }

  nameSuffix = self->_nameSuffix;
  if (nameSuffix)
  {
    PBDataWriterWriteStringField(v12, nameSuffix, 5LL);
    id v4 = v12;
  }

  nickname = self->_nickname;
  if (nickname)
  {
    PBDataWriterWriteStringField(v12, nickname, 6LL);
    id v4 = v12;
  }

  phoneticRepresentation = self->_phoneticRepresentation;
  if (phoneticRepresentation)
  {
    PBDataWriterWriteSubmessage(v12, phoneticRepresentation, 7LL);
    id v4 = v12;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_namePrefix)
  {
    objc_msgSend(v4, "setNamePrefix:");
    id v4 = v5;
  }

  if (self->_givenName)
  {
    objc_msgSend(v5, "setGivenName:");
    id v4 = v5;
  }

  if (self->_middleName)
  {
    objc_msgSend(v5, "setMiddleName:");
    id v4 = v5;
  }

  if (self->_familyName)
  {
    objc_msgSend(v5, "setFamilyName:");
    id v4 = v5;
  }

  if (self->_nameSuffix)
  {
    objc_msgSend(v5, "setNameSuffix:");
    id v4 = v5;
  }

  if (self->_nickname)
  {
    objc_msgSend(v5, "setNickname:");
    id v4 = v5;
  }

  if (self->_phoneticRepresentation)
  {
    objc_msgSend(v5, "setPhoneticRepresentation:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = -[NSString copyWithZone:](self->_namePrefix, "copyWithZone:", a3);
  v7 = (void *)v5[4];
  v5[4] = v6;

  id v8 = -[NSString copyWithZone:](self->_givenName, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  id v10 = -[NSString copyWithZone:](self->_middleName, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  id v12 = -[NSString copyWithZone:](self->_familyName, "copyWithZone:", a3);
  v13 = (void *)v5[1];
  v5[1] = v12;

  id v14 = -[NSString copyWithZone:](self->_nameSuffix, "copyWithZone:", a3);
  v15 = (void *)v5[5];
  v5[5] = v14;

  id v16 = -[NSString copyWithZone:](self->_nickname, "copyWithZone:", a3);
  v17 = (void *)v5[6];
  v5[6] = v16;

  id v18 = -[CSDMessagingPersonNameComponents copyWithZone:](self->_phoneticRepresentation, "copyWithZone:", a3);
  v19 = (void *)v5[7];
  v5[7] = v18;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5))
    && ((namePrefix = self->_namePrefix, !((unint64_t)namePrefix | v4[4]))
     || -[NSString isEqual:](namePrefix, "isEqual:"))
    && ((givenName = self->_givenName, !((unint64_t)givenName | v4[2]))
     || -[NSString isEqual:](givenName, "isEqual:"))
    && ((middleName = self->_middleName, !((unint64_t)middleName | v4[3]))
     || -[NSString isEqual:](middleName, "isEqual:"))
    && ((familyName = self->_familyName, !((unint64_t)familyName | v4[1]))
     || -[NSString isEqual:](familyName, "isEqual:"))
    && ((nameSuffix = self->_nameSuffix, !((unint64_t)nameSuffix | v4[5]))
     || -[NSString isEqual:](nameSuffix, "isEqual:"))
    && ((nickname = self->_nickname, !((unint64_t)nickname | v4[6]))
     || -[NSString isEqual:](nickname, "isEqual:")))
  {
    phoneticRepresentation = self->_phoneticRepresentation;
    else {
      unsigned __int8 v13 = 1;
    }
  }

  else
  {
    unsigned __int8 v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_namePrefix, "hash");
  unint64_t v4 = -[NSString hash](self->_givenName, "hash") ^ v3;
  NSUInteger v5 = -[NSString hash](self->_middleName, "hash");
  unint64_t v6 = v4 ^ v5 ^ -[NSString hash](self->_familyName, "hash");
  NSUInteger v7 = -[NSString hash](self->_nameSuffix, "hash");
  unint64_t v8 = v7 ^ -[NSString hash](self->_nickname, "hash");
  return v6 ^ v8 ^ -[CSDMessagingPersonNameComponents hash](self->_phoneticRepresentation, "hash");
}

- (void)mergeFrom:(id)a3
{
  unint64_t v6 = a3;
  if (v6[4]) {
    -[CSDMessagingPersonNameComponents setNamePrefix:](self, "setNamePrefix:");
  }
  if (v6[2]) {
    -[CSDMessagingPersonNameComponents setGivenName:](self, "setGivenName:");
  }
  if (v6[3]) {
    -[CSDMessagingPersonNameComponents setMiddleName:](self, "setMiddleName:");
  }
  if (v6[1]) {
    -[CSDMessagingPersonNameComponents setFamilyName:](self, "setFamilyName:");
  }
  if (v6[5]) {
    -[CSDMessagingPersonNameComponents setNameSuffix:](self, "setNameSuffix:");
  }
  if (v6[6]) {
    -[CSDMessagingPersonNameComponents setNickname:](self, "setNickname:");
  }
  phoneticRepresentation = self->_phoneticRepresentation;
  uint64_t v5 = v6[7];
  if (phoneticRepresentation)
  {
    if (v5) {
      -[CSDMessagingPersonNameComponents mergeFrom:](phoneticRepresentation, "mergeFrom:");
    }
  }

  else if (v5)
  {
    -[CSDMessagingPersonNameComponents setPhoneticRepresentation:](self, "setPhoneticRepresentation:");
  }
}

- (NSString)namePrefix
{
  return self->_namePrefix;
}

- (void)setNamePrefix:(id)a3
{
}

- (NSString)givenName
{
  return self->_givenName;
}

- (void)setGivenName:(id)a3
{
}

- (NSString)middleName
{
  return self->_middleName;
}

- (void)setMiddleName:(id)a3
{
}

- (NSString)familyName
{
  return self->_familyName;
}

- (void)setFamilyName:(id)a3
{
}

- (NSString)nameSuffix
{
  return self->_nameSuffix;
}

- (void)setNameSuffix:(id)a3
{
}

- (NSString)nickname
{
  return self->_nickname;
}

- (void)setNickname:(id)a3
{
}

- (CSDMessagingPersonNameComponents)phoneticRepresentation
{
  return self->_phoneticRepresentation;
}

- (void)setPhoneticRepresentation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end