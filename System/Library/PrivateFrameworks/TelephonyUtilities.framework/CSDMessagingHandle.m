@interface CSDMessagingHandle
+ (CSDMessagingHandle)handleWithTUHandle:(id)a3;
- (BOOL)hasIsoCountryCode;
- (BOOL)hasSiriDisplayName;
- (BOOL)hasType;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)isoCountryCode;
- (NSString)siriDisplayName;
- (NSString)value;
- (TUHandle)tuHandle;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasType:(BOOL)a3;
- (void)setIsoCountryCode:(id)a3;
- (void)setSiriDisplayName:(id)a3;
- (void)setType:(int)a3;
- (void)setValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingHandle

- (int)type
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 4) {
    return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  *(void *)&a3));
  }
  else {
    return off_1003D8148[a3];
  }
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"None"])
  {
    int v4 = 0;
  }

  else if ([v3 isEqualToString:@"Generic"])
  {
    int v4 = 1;
  }

  else if ([v3 isEqualToString:@"PhoneNumber"])
  {
    int v4 = 2;
  }

  else if ([v3 isEqualToString:@"EmailAddress"])
  {
    int v4 = 3;
  }

  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasValue
{
  return self->_value != 0LL;
}

- (BOOL)hasIsoCountryCode
{
  return self->_isoCountryCode != 0LL;
}

- (BOOL)hasSiriDisplayName
{
  return self->_siriDisplayName != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CSDMessagingHandle;
  id v3 = -[CSDMessagingHandle description](&v8, "description");
  int v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingHandle dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    uint64_t type = self->_type;
    if (type >= 4) {
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  self->_type));
    }
    else {
      v5 = off_1003D8148[type];
    }
    [v3 setObject:v5 forKey:@"type"];
  }

  value = self->_value;
  if (value) {
    [v3 setObject:value forKey:@"value"];
  }
  isoCountryCode = self->_isoCountryCode;
  if (isoCountryCode) {
    [v3 setObject:isoCountryCode forKey:@"isoCountryCode"];
  }
  siriDisplayName = self->_siriDisplayName;
  if (siriDisplayName) {
    [v3 setObject:siriDisplayName forKey:@"siriDisplayName"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10004A748((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field(v4, self->_type, 1LL);
    id v4 = v8;
  }

  value = self->_value;
  if (value)
  {
    PBDataWriterWriteStringField(v8, value, 2LL);
    id v4 = v8;
  }

  isoCountryCode = self->_isoCountryCode;
  if (isoCountryCode)
  {
    PBDataWriterWriteStringField(v8, isoCountryCode, 4LL);
    id v4 = v8;
  }

  siriDisplayName = self->_siriDisplayName;
  if (siriDisplayName)
  {
    PBDataWriterWriteStringField(v8, siriDisplayName, 5LL);
    id v4 = v8;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[6] = self->_type;
    *((_BYTE *)v4 + 40) |= 1u;
  }

  v5 = v4;
  if (self->_value)
  {
    objc_msgSend(v4, "setValue:");
    id v4 = v5;
  }

  if (self->_isoCountryCode)
  {
    objc_msgSend(v5, "setIsoCountryCode:");
    id v4 = v5;
  }

  if (self->_siriDisplayName)
  {
    objc_msgSend(v5, "setSiriDisplayName:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v5 + 6) = self->_type;
    *((_BYTE *)v5 + 40) |= 1u;
  }

  id v7 = -[NSString copyWithZone:](self->_value, "copyWithZone:", a3);
  id v8 = (void *)v6[4];
  v6[4] = v7;

  id v9 = -[NSString copyWithZone:](self->_isoCountryCode, "copyWithZone:", a3);
  v10 = (void *)v6[1];
  v6[1] = v9;

  id v11 = -[NSString copyWithZone:](self->_siriDisplayName, "copyWithZone:", a3);
  v12 = (void *)v6[2];
  v6[2] = v11;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_type != *((_DWORD *)v4 + 6)) {
      goto LABEL_13;
    }
  }

  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
LABEL_13:
    unsigned __int8 v9 = 0;
    goto LABEL_14;
  }

  value = self->_value;
  isoCountryCode = self->_isoCountryCode;
  if ((unint64_t)isoCountryCode | *((void *)v4 + 1))
  {
  }

  siriDisplayName = self->_siriDisplayName;
  else {
    unsigned __int8 v9 = 1;
  }
LABEL_14:

  return v9;
}

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    uint64_t v3 = 2654435761LL * self->_type;
  }
  else {
    uint64_t v3 = 0LL;
  }
  unint64_t v4 = -[NSString hash](self->_value, "hash") ^ v3;
  NSUInteger v5 = -[NSString hash](self->_isoCountryCode, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_siriDisplayName, "hash");
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  if ((v4[10] & 1) != 0)
  {
    self->_uint64_t type = v4[6];
    *(_BYTE *)&self->_has |= 1u;
  }

  NSUInteger v5 = v4;
  if (*((void *)v4 + 4))
  {
    -[CSDMessagingHandle setValue:](self, "setValue:");
    unint64_t v4 = v5;
  }

  if (*((void *)v4 + 1))
  {
    -[CSDMessagingHandle setIsoCountryCode:](self, "setIsoCountryCode:");
    unint64_t v4 = v5;
  }

  if (*((void *)v4 + 2))
  {
    -[CSDMessagingHandle setSiriDisplayName:](self, "setSiriDisplayName:");
    unint64_t v4 = v5;
  }
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (NSString)isoCountryCode
{
  return self->_isoCountryCode;
}

- (void)setIsoCountryCode:(id)a3
{
}

- (NSString)siriDisplayName
{
  return self->_siriDisplayName;
}

- (void)setSiriDisplayName:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (CSDMessagingHandle)handleWithTUHandle:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    unint64_t v4 = objc_alloc_init(&OBJC_CLASS___CSDMessagingHandle);
    NSUInteger v5 = (void *)objc_claimAutoreleasedReturnValue([v3 isoCountryCode]);
    -[CSDMessagingHandle setIsoCountryCode:](v4, "setIsoCountryCode:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue([v3 value]);
    -[CSDMessagingHandle setValue:](v4, "setValue:", v6);

    id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 siriDisplayName]);
    -[CSDMessagingHandle setSiriDisplayName:](v4, "setSiriDisplayName:", v7);

    id v8 = (char *)[v3 type];
  }

  else
  {
    unint64_t v4 = 0LL;
  }

  return v4;
}

- (TUHandle)tuHandle
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingHandle value](self, "value"));
  if ([v3 length])
  {
    switch(-[CSDMessagingHandle type](self, "type"))
    {
      case 0:
        goto LABEL_9;
      case 1:
LABEL_7:
        uint64_t v5 = objc_claimAutoreleasedReturnValue( +[TUHandle normalizedGenericHandleForValue:]( &OBJC_CLASS___TUHandle,  "normalizedGenericHandleForValue:",  v3));
        goto LABEL_10;
      case 2:
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingHandle isoCountryCode](self, "isoCountryCode"));
        unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[TUHandle normalizedPhoneNumberHandleForValue:isoCountryCode:]( &OBJC_CLASS___TUHandle,  "normalizedPhoneNumberHandleForValue:isoCountryCode:",  v3,  v6));

        break;
      case 3:
LABEL_9:
        uint64_t v5 = objc_claimAutoreleasedReturnValue( +[TUHandle normalizedEmailAddressHandleForValue:]( &OBJC_CLASS___TUHandle,  "normalizedEmailAddressHandleForValue:",  v3));
LABEL_10:
        unint64_t v4 = (void *)v5;
        break;
      default:
        unint64_t v4 = 0LL;
        break;
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSDMessagingHandle siriDisplayName](self, "siriDisplayName"));
    [v4 setSiriDisplayName:v7];
  }

  else
  {
    unint64_t v4 = 0LL;
  }

  return (TUHandle *)v4;
}

@end