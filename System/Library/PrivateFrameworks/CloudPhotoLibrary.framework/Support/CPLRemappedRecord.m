@interface CPLRemappedRecord
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation CPLRemappedRecord

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CPLRemappedRecord;
  id v3 = -[CPLRemappedRecord description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLRemappedRecord dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = v3;
  createdByUserID = self->_createdByUserID;
  if (createdByUserID) {
    [v3 setObject:createdByUserID forKey:@"createdByUserID"];
  }
  recordID = self->_recordID;
  if (recordID) {
    [v4 setObject:recordID forKey:@"recordID"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return CPLRemappedRecordReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  createdByUserID = self->_createdByUserID;
  if (!createdByUserID) {
    sub_1001911C8();
  }
  id v7 = v4;
  PBDataWriterWriteStringField(v4, createdByUserID, 1LL);
  recordID = self->_recordID;
  if (!recordID) {
    sub_1001911F0();
  }
  PBDataWriterWriteStringField(v7, recordID, 2LL);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  id v6 = -[NSString copyWithZone:](self->_createdByUserID, "copyWithZone:", a3);
  id v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = -[NSString copyWithZone:](self->_recordID, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class(self)]
    && ((createdByUserID = self->_createdByUserID, !((unint64_t)createdByUserID | v4[1]))
     || -[NSString isEqual:](createdByUserID, "isEqual:")))
  {
    recordID = self->_recordID;
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
  NSUInteger v3 = -[NSString hash](self->_createdByUserID, "hash");
  return -[NSString hash](self->_recordID, "hash") ^ v3;
}

- (void).cxx_destruct
{
}

@end