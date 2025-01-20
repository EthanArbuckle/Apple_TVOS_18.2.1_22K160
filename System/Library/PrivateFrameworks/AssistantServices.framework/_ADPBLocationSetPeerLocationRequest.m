@interface _ADPBLocationSetPeerLocationRequest
+ (unsigned)_ADPBLocationRequestType;
- (BOOL)hasCodedLocation;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)codedLocation;
- (id)ad_location;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)_ad_performForPeerLocationWithCompletion:(id)a3;
- (void)ad_setLocation:(id)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCodedLocation:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _ADPBLocationSetPeerLocationRequest

- (void)_ad_performForPeerLocationWithCompletion:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[_ADPBLocationSetPeerLocationRequest ad_location](self, "ad_location"));
    (*((void (**)(id, id))a3 + 2))(v5, v6);
  }

- (BOOL)hasCodedLocation
{
  return self->_codedLocation != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS____ADPBLocationSetPeerLocationRequest;
  id v3 = -[_ADPBLocationSetPeerLocationRequest description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[_ADPBLocationSetPeerLocationRequest dictionaryRepresentation](self, "dictionaryRepresentation"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = v3;
  codedLocation = self->_codedLocation;
  if (codedLocation) {
    [v3 setObject:codedLocation forKey:@"coded_location"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  while (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(void *)((char *)a3
                                                                              + OBJC_IVAR___PBDataReader__length))
  {
    if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v5 = 0;
    unsigned int v6 = 0;
    unint64_t v7 = 0LL;
    while (1)
    {
      unint64_t v8 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      char v9 = *(_BYTE *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v8);
      *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v8 + 1;
      v7 |= (unint64_t)(v9 & 0x7F) << v5;
      if ((v9 & 0x80) == 0) {
        goto LABEL_11;
      }
      v5 += 7;
      if (v6++ >= 9)
      {
        unint64_t v7 = 0LL;
        int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }

    *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
    if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v7 = 0LL;
    }
LABEL_13:
    if (v11 || (v7 & 7) == 4) {
      break;
    }
    if ((v7 >> 3) == 1)
    {
      uint64_t Data = PBReaderReadData(a3);
      v14 = (NSData *)objc_claimAutoreleasedReturnValue(Data);
      codedLocation = self->_codedLocation;
      self->_codedLocation = v14;
    }

    else
    {
      int v16 = PBReaderSkipValueWithTag(a3);
      if (!v16) {
        return v16;
      }
    }
  }

  LOBYTE(v16) = *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v16;
}

- (void)writeTo:(id)a3
{
  codedLocation = self->_codedLocation;
  if (codedLocation) {
    PBDataWriterWriteDataField(a3, codedLocation, 1LL);
  }
}

- (void)copyTo:(id)a3
{
  codedLocation = self->_codedLocation;
  if (codedLocation) {
    [a3 setCodedLocation:codedLocation];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  char v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  id v6 = -[NSData copyWithZone:](self->_codedLocation, "copyWithZone:", a3);
  unint64_t v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class(self)])
  {
    codedLocation = self->_codedLocation;
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
  return (unint64_t)-[NSData hash](self->_codedLocation, "hash");
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[_ADPBLocationSetPeerLocationRequest setCodedLocation:](self, "setCodedLocation:");
  }
}

- (NSData)codedLocation
{
  return self->_codedLocation;
}

- (void)setCodedLocation:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id)ad_location
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_ADPBLocationSetPeerLocationRequest codedLocation](self, "codedLocation"));
  if (v2)
  {
    id v3 = -[NSKeyedUnarchiver initForReadingFromData:error:]( objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver),  "initForReadingFromData:error:",  v2,  0LL);
    id v4 = -[NSKeyedUnarchiver decodeObjectOfClass:forKey:]( v3,  "decodeObjectOfClass:forKey:",  objc_opt_class(&OBJC_CLASS___CLLocation),  @"Location");
    char v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    -[NSKeyedUnarchiver finishDecoding](v3, "finishDecoding");
  }

  else
  {
    char v5 = 0LL;
  }

  return v5;
}

- (void)ad_setLocation:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    char v5 = -[NSKeyedArchiver initRequiringSecureCoding:]( objc_alloc(&OBJC_CLASS___NSKeyedArchiver),  "initRequiringSecureCoding:",  1LL);
    -[NSKeyedArchiver encodeObject:forKey:](v5, "encodeObject:forKey:", v4, @"Location");

    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSKeyedArchiver encodedData](v5, "encodedData"));
    id v7 = [v6 copy];
  }

  else
  {
    id v7 = 0LL;
  }

  -[_ADPBLocationSetPeerLocationRequest setCodedLocation:](self, "setCodedLocation:", v7);
}

+ (unsigned)_ADPBLocationRequestType
{
  return 2;
}

@end