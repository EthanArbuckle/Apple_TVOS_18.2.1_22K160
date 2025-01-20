@interface MTIDSecret
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSynchronized;
- (MTIDSecret)init;
- (MTIDSecret)initWithCoder:(id)a3;
- (MTIDSecret)initWithValue:(id)a3 effectiveDate:(id)a4 expirationDate:(id)a5 isSynchronize:(BOOL)a6;
- (NSDate)effectiveDate;
- (NSDate)expirationDate;
- (NSString)syncStatusCode;
- (NSString)value;
- (id)debugInfo;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setEffectiveDate:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setIsSynchronized:(BOOL)a3;
- (void)setSyncStatusCode:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation MTIDSecret

- (MTIDSecret)init
{
  return 0LL;
}

- (MTIDSecret)initWithValue:(id)a3 effectiveDate:(id)a4 expirationDate:(id)a5 isSynchronize:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___MTIDSecret;
  v14 = -[MTIDSecret init](&v17, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_value, a3);
    objc_storeStrong((id *)&v15->_effectiveDate, a4);
    objc_storeStrong((id *)&v15->_expirationDate, a5);
    v15->_isSynchronized = a6;
  }

  return v15;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDSecret value](self, "value"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDSecret effectiveDate](self, "effectiveDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDSecret expirationDate](self, "expirationDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p, value: %@, effective: %@, expiration: %@ >",  v5,  self,  v6,  v7,  v8));

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(self);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    id v6 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDSecret value](self, "value"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 value]);
    if ([v7 isEqual:v8])
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDSecret effectiveDate](self, "effectiveDate"));
      [v9 timeIntervalSince1970];
      double v11 = v10;
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 effectiveDate]);
      [v12 timeIntervalSince1970];
      if (v11 == v13)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDSecret expirationDate](self, "expirationDate"));
        [v14 timeIntervalSince1970];
        double v16 = v15;
        objc_super v17 = (void *)objc_claimAutoreleasedReturnValue([v6 expirationDate]);
        [v17 timeIntervalSince1970];
        BOOL v19 = v16 == v18;
      }

      else
      {
        BOOL v19 = 0;
      }
    }

    else
    {
      BOOL v19 = 0;
    }
  }

  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (id)debugInfo
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDSecret value](self, "value"));
  [v3 setObject:v4 forKeyedSubscript:@"value"];

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDSecret effectiveDate](self, "effectiveDate"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 description]);
  [v3 setObject:v6 forKeyedSubscript:@"effectiveDate"];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDSecret expirationDate](self, "expirationDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 description]);
  [v3 setObject:v8 forKeyedSubscript:@"expirationDate"];

  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[MTIDSecret isSynchronized](self, "isSynchronized")));
  [v3 setObject:v9 forKeyedSubscript:@"isSynchronized"];

  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDSecret syncStatusCode](self, "syncStatusCode"));
  [v3 setObject:v10 forKeyedSubscript:@"syncStatusCode"];

  id v11 = [v3 copy];
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDSecret value](self, "value"));
  [v4 encodeObject:v5 forKey:@"value"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDSecret effectiveDate](self, "effectiveDate"));
  [v4 encodeObject:v6 forKey:@"effectiveDate"];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDSecret expirationDate](self, "expirationDate"));
  [v4 encodeObject:v7 forKey:@"expirationDate"];

  objc_msgSend(v4, "encodeBool:forKey:", -[MTIDSecret isSynchronized](self, "isSynchronized"), @"isSynchronized");
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[MTIDSecret syncStatusCode](self, "syncStatusCode"));
  [v4 encodeObject:v8 forKey:@"syncStatusCode"];
}

- (MTIDSecret)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___MTIDSecret;
  uint64_t v5 = -[MTIDSecret init](&v15, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"value"];
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[MTIDSecret setValue:](v5, "setValue:", v7);

    id v8 = [v4 decodeObjectOfClass:objc_opt_class(NSDate) forKey:@"effectiveDate"];
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[MTIDSecret setEffectiveDate:](v5, "setEffectiveDate:", v9);

    id v10 = [v4 decodeObjectOfClass:objc_opt_class(NSDate) forKey:@"expirationDate"];
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[MTIDSecret setExpirationDate:](v5, "setExpirationDate:", v11);

    -[MTIDSecret setIsSynchronized:]( v5,  "setIsSynchronized:",  [v4 decodeBoolForKey:@"isSynchronized"]);
    id v12 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"syncStatusCode"];
    double v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    -[MTIDSecret setSyncStatusCode:](v5, "setSyncStatusCode:", v13);
  }

  return v5;
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (NSDate)effectiveDate
{
  return self->_effectiveDate;
}

- (void)setEffectiveDate:(id)a3
{
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (BOOL)isSynchronized
{
  return self->_isSynchronized;
}

- (void)setIsSynchronized:(BOOL)a3
{
  self->_isSynchronized = a3;
}

- (NSString)syncStatusCode
{
  return self->_syncStatusCode;
}

- (void)setSyncStatusCode:(id)a3
{
}

- (void).cxx_destruct
{
}

@end