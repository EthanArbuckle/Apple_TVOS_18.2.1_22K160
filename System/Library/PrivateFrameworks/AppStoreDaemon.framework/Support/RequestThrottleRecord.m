@interface RequestThrottleRecord
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (RequestThrottleRecord)initWithCoder:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RequestThrottleRecord

- (BOOL)isEqual:(id)a3
{
  v4 = (RequestThrottleRecord *)a3;
  v6 = v4;
  if (v4)
  {
    if (v4 == self)
    {
      unsigned __int8 v11 = 1;
      goto LABEL_17;
    }

    uint64_t v7 = objc_opt_class(&OBJC_CLASS___RequestThrottleRecord, v5);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    {
      v8 = v6;
      itemID = self->_itemID;
      v10 = v8->_itemID;
      if (itemID == v10) {
        goto LABEL_8;
      }
      unsigned __int8 v11 = 0;
      if (itemID && v10)
      {
        if (-[NSString isEqual:](itemID, "isEqual:"))
        {
LABEL_8:
          externalVersionID = self->_externalVersionID;
          v13 = v8->_externalVersionID;
          if (externalVersionID == v13)
          {
            unsigned __int8 v11 = 1;
          }

          else
          {
            unsigned __int8 v11 = 0;
            if (externalVersionID && v13) {
              unsigned __int8 v11 = -[NSString isEqual:](externalVersionID, "isEqual:");
            }
          }

          goto LABEL_16;
        }

        unsigned __int8 v11 = 0;
      }

- (unint64_t)hash
{
  return -[NSString hash](self->_itemID, "hash");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RequestThrottleRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___RequestThrottleRecord;
  v6 = -[RequestThrottleRecord init](&v23, "init");
  if (v6)
  {
    id v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSError, v5), @"_error");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
    error = v6->_error;
    v6->_error = (NSError *)v8;

    id v11 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v10), @"_itemID");
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    itemID = v6->_itemID;
    v6->_itemID = (NSString *)v12;

    id v15 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSString, v14),  @"_externalVersionID");
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    externalVersionID = v6->_externalVersionID;
    v6->_externalVersionID = (NSString *)v16;

    id v19 = objc_msgSend( v4,  "decodeObjectOfClass:forKey:",  objc_opt_class(NSDate, v18),  @"_requestDate");
    uint64_t v20 = objc_claimAutoreleasedReturnValue(v19);
    requestDate = v6->_requestDate;
    v6->_requestDate = (NSDate *)v20;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  error = self->_error;
  if (error)
  {
    uint64_t v5 = ASDErrorWithSafeUserInfo(error);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    [v7 encodeObject:v6 forKey:@"_error"];
  }

  [v7 encodeObject:self->_itemID forKey:@"_itemID"];
  [v7 encodeObject:self->_externalVersionID forKey:@"_externalVersionID"];
  [v7 encodeObject:self->_requestDate forKey:@"_requestDate"];
}

- (void).cxx_destruct
{
}

@end