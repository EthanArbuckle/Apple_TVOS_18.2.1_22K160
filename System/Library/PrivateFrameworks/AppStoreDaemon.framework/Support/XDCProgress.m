@interface XDCProgress
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation XDCProgress

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___XDCProgress;
  id v3 = -[XDCProgress description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[XDCProgress dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = v3;
  bundleID = self->_bundleID;
  if (bundleID) {
    [v3 setObject:bundleID forKey:@"bundleID"];
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithLongLong:",  self->_completedUnitCount));
  [v4 setObject:v6 forKey:@"completedUnitCount"];

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", self->_totalUnitCount));
  [v4 setObject:v7 forKey:@"totalUnitCount"];

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10021D300((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  bundleID = self->_bundleID;
  id v5 = a3;
  PBDataWriterWriteStringField(v5, bundleID, 1LL);
  PBDataWriterWriteInt64Field(v5, self->_completedUnitCount, 2LL);
  PBDataWriterWriteInt64Field(v5, self->_totalUnitCount, 3LL);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = -[NSString copyWithZone:](self->_bundleID, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v5[1] = self->_completedUnitCount;
  v5[2] = self->_totalUnitCount;
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  BOOL v7 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5))
    && ((bundleID = self->_bundleID, !((unint64_t)bundleID | v4[3]))
     || -[NSString isEqual:](bundleID, "isEqual:"))
    && self->_completedUnitCount == v4[1]
    && self->_totalUnitCount == v4[2];

  return v7;
}

- (unint64_t)hash
{
  return (2654435761LL * self->_completedUnitCount) ^ -[NSString hash](self->_bundleID, "hash") ^ (2654435761LL
                                                                                                 * self->_totalUnitCount);
}

- (void).cxx_destruct
{
}

@end