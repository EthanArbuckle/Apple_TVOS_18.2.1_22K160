@interface SECSFAActionAutomaticBugCapture
- (BOOL)hasDomain;
- (BOOL)hasSubtype;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)domain;
- (NSString)subtype;
- (NSString)type;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDomain:(id)a3;
- (void)setSubtype:(id)a3;
- (void)setType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SECSFAActionAutomaticBugCapture

- (BOOL)hasDomain
{
  return self->_domain != 0LL;
}

- (BOOL)hasType
{
  return self->_type != 0LL;
}

- (BOOL)hasSubtype
{
  return self->_subtype != 0LL;
}

- (id)description
{
  v3 = (void *)NSString;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SECSFAActionAutomaticBugCapture;
  v4 = -[SECSFAActionAutomaticBugCapture description](&v8, sel_description);
  v5 = -[SECSFAActionAutomaticBugCapture dictionaryRepresentation](self, "dictionaryRepresentation");
  [v3 stringWithFormat:@"%@ %@", v4, v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  domain = self->_domain;
  if (domain) {
    [v3 setObject:domain forKey:@"domain"];
  }
  type = self->_type;
  if (type) {
    [v4 setObject:type forKey:@"type"];
  }
  subtype = self->_subtype;
  if (subtype) {
    [v4 setObject:subtype forKey:@"subtype"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SECSFAActionAutomaticBugCaptureReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_domain)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }

  if (self->_type)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }

  if (self->_subtype)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_domain)
  {
    objc_msgSend(v4, "setDomain:");
    id v4 = v5;
  }

  if (self->_type)
  {
    objc_msgSend(v5, "setType:");
    id v4 = v5;
  }

  if (self->_subtype)
  {
    objc_msgSend(v5, "setSubtype:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = -[NSString copyWithZone:](self->_domain, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = -[NSString copyWithZone:](self->_type, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  uint64_t v10 = -[NSString copyWithZone:](self->_subtype, "copyWithZone:", a3);
  v11 = (void *)v5[2];
  v5[2] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((domain = self->_domain, !((unint64_t)domain | v4[1]))
     || -[NSString isEqual:](domain, "isEqual:"))
    && ((type = self->_type, !((unint64_t)type | v4[3])) || -[NSString isEqual:](type, "isEqual:")))
  {
    subtype = self->_subtype;
    else {
      char v8 = 1;
    }
  }

  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_domain, "hash");
  NSUInteger v4 = -[NSString hash](self->_type, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_subtype, "hash");
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[1]) {
    -[SECSFAActionAutomaticBugCapture setDomain:](self, "setDomain:");
  }
  if (v4[3]) {
    -[SECSFAActionAutomaticBugCapture setType:](self, "setType:");
  }
  if (v4[2]) {
    -[SECSFAActionAutomaticBugCapture setSubtype:](self, "setSubtype:");
  }
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (NSString)subtype
{
  return self->_subtype;
}

- (void)setSubtype:(id)a3
{
}

- (void).cxx_destruct
{
}

@end