@interface TFAppleWatch
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation TFAppleWatch

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TFAppleWatch;
  id v3 = -[TFAppleWatch description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TFAppleWatch dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = v3;
  model = self->_model;
  if (model) {
    [v3 setObject:model forKey:@"model"];
  }
  osVersion = self->_osVersion;
  if (osVersion) {
    [v4 setObject:osVersion forKey:@"osVersion"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1002A1E38((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  model = self->_model;
  id v7 = v4;
  if (model)
  {
    PBDataWriterWriteStringField(v4, model, 1LL);
    id v4 = v7;
  }

  osVersion = self->_osVersion;
  if (osVersion)
  {
    PBDataWriterWriteStringField(v7, osVersion, 2LL);
    id v4 = v7;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = -[NSString copyWithZone:](self->_model, "copyWithZone:", a3);
  id v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = -[NSString copyWithZone:](self->_osVersion, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5))
    && ((model = self->_model, !((unint64_t)model | v4[1]))
     || -[NSString isEqual:](model, "isEqual:")))
  {
    osVersion = self->_osVersion;
    else {
      unsigned __int8 v8 = 1;
    }
  }

  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = -[NSString hash](self->_model, "hash");
  return -[NSString hash](self->_osVersion, "hash") ^ v3;
}

- (void).cxx_destruct
{
}

@end