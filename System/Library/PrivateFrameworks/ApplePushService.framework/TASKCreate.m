@interface TASKCreate
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
@end

@implementation TASKCreate

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TASKCreate;
  id v3 = -[TASKCreate description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TASKCreate dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  return +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
}

- (BOOL)readFrom:(id)a3
{
  return sub_10003A230((uint64_t)self, (uint64_t)a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  LOBYTE(self) = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5));

  return (char)self;
}

- (unint64_t)hash
{
  return 0LL;
}

@end