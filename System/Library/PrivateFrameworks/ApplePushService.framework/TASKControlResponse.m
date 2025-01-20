@interface TASKControlResponse
- (BOOL)hasCreate;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (TASKResponse)create;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCreate:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TASKControlResponse

- (BOOL)hasCreate
{
  return self->_create != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TASKControlResponse;
  id v3 = -[TASKControlResponse description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TASKControlResponse dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  create = self->_create;
  if (create)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TASKResponse dictionaryRepresentation](create, "dictionaryRepresentation"));
    [v3 setObject:v5 forKey:@"create"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100086538((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  create = self->_create;
  if (create) {
    PBDataWriterWriteSubmessage(a3, create, 1LL);
  }
}

- (void)copyTo:(id)a3
{
  create = self->_create;
  if (create) {
    [a3 setCreate:create];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = -[TASKResponse copyWithZone:](self->_create, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
  {
    create = self->_create;
    else {
      unsigned __int8 v7 = 1;
    }
  }

  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return -[TASKResponse hash](self->_create, "hash");
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  create = self->_create;
  uint64_t v6 = v4[1];
  if (create)
  {
    if (v6)
    {
      unsigned __int8 v7 = v4;
      -[TASKResponse mergeFrom:](create, "mergeFrom:");
LABEL_6:
      v4 = v7;
    }
  }

  else if (v6)
  {
    unsigned __int8 v7 = v4;
    -[TASKControlResponse setCreate:](self, "setCreate:");
    goto LABEL_6;
  }
}

- (TASKResponse)create
{
  return self->_create;
}

- (void)setCreate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end