@interface TASKRequest
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (TASKInput)input;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setInput:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TASKRequest

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TASKRequest;
  id v3 = -[TASKRequest description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TASKRequest dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  input = self->_input;
  if (input)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TASKInput dictionaryRepresentation](input, "dictionaryRepresentation"));
    [v3 setObject:v5 forKey:@"input"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100068EB8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
}

- (void)copyTo:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = -[TASKInput copyWithZone:](self->_input, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
  {
    input = self->_input;
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
  return -[TASKInput hash](self->_input, "hash");
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  input = self->_input;
  uint64_t v6 = v4[1];
  if (input)
  {
    if (v6)
    {
      unsigned __int8 v7 = v4;
      -[TASKInput mergeFrom:](input, "mergeFrom:");
LABEL_6:
      v4 = v7;
    }
  }

  else if (v6)
  {
    unsigned __int8 v7 = v4;
    -[TASKRequest setInput:](self, "setInput:");
    goto LABEL_6;
  }
}

- (TASKInput)input
{
  return self->_input;
}

- (void)setInput:(id)a3
{
}

- (void).cxx_destruct
{
}

@end