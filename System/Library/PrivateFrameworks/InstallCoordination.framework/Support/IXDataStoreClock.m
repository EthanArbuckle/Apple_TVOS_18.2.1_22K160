@interface IXDataStoreClock
+ (BOOL)supportsSecureCoding;
+ (id)newClock;
+ (id)newClockWithDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (IXDataStoreClock)initWithCoder:(id)a3;
- (IXDataStoreClock)initWithGUID:(id)a3 sequenceNumber:(unint64_t)a4;
- (NSDictionary)dictionaryRepresentation;
- (NSDictionary)notificationDictionary;
- (NSUUID)guid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)sequenceNumber;
- (void)encodeWithCoder:(id)a3;
- (void)increment;
- (void)setGuid:(id)a3;
- (void)setSequenceNumber:(unint64_t)a3;
@end

@implementation IXDataStoreClock

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)newClock
{
  id v2 = objc_alloc((Class)objc_opt_class(a1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v4 = [v2 initWithGUID:v3 sequenceNumber:0];

  return v4;
}

+ (id)newClockWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"guid"]);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSString);
  id v7 = v5;
  if ((objc_opt_isKindOfClass(v7, v6) & 1) != 0) {
    id v8 = v7;
  }
  else {
    id v8 = 0LL;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"sequenceNumber"]);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSNumber);
  id v11 = v9;
  if ((objc_opt_isKindOfClass(v11, v10) & 1) != 0) {
    id v12 = v11;
  }
  else {
    id v12 = 0LL;
  }

  id v13 = 0LL;
  if (v8 && v12)
  {
    id v14 = objc_alloc((Class)objc_opt_class(a1));
    v15 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v8);
    id v13 = objc_msgSend(v14, "initWithGUID:sequenceNumber:", v15, objc_msgSend(v12, "unsignedLongLongValue"));
  }

  return v13;
}

- (IXDataStoreClock)initWithGUID:(id)a3 sequenceNumber:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___IXDataStoreClock;
  id v8 = -[IXDataStoreClock init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_guid, a3);
    v9->_sequenceNumber = a4;
  }

  return v9;
}

- (void)increment
{
  unint64_t v3 = -[IXDataStoreClock sequenceNumber](self, "sequenceNumber");
  if (v3 == -1LL)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    -[IXDataStoreClock setGuid:](self, "setGuid:", v4);

    unint64_t v3 = 0LL;
  }

  -[IXDataStoreClock setSequenceNumber:](self, "setSequenceNumber:", v3 + 1);
}

- (IXDataStoreClock)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___IXDataStoreClock;
  v5 = -[IXDataStoreClock init](&v12, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSUUID) forKey:@"guid"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    guid = v5->_guid;
    v5->_guid = (NSUUID *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"sequenceNumber"];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v5->_sequenceNumber = (unint64_t)[v10 unsignedLongLongValue];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXDataStoreClock guid](self, "guid"));
  [v4 encodeObject:v5 forKey:@"guid"];

  id v6 = (id)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[IXDataStoreClock sequenceNumber](self, "sequenceNumber")));
  [v4 encodeObject:v6 forKey:@"sequenceNumber"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [(id)objc_opt_class(self) allocWithZone:a3];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IXDataStoreClock guid](self, "guid"));
  id v7 = [v6 copyWithZone:a3];
  id v8 = objc_msgSend(v5, "initWithGUID:sequenceNumber:", v7, -[IXDataStoreClock sequenceNumber](self, "sequenceNumber"));

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (IXDataStoreClock *)a3;
  if (v4 == self)
  {
    BOOL v13 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class(self);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      id v6 = v4;
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IXDataStoreClock guid](self, "guid"));
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IXDataStoreClock guid](v6, "guid"));
      id v9 = v7;
      id v10 = v8;
      objc_super v11 = v10;
      if ((v9 != 0) != (v10 != 0) || v9 && v10 && ![v9 isEqual:v10])
      {

        BOOL v13 = 0;
      }

      else
      {

        id v12 = -[IXDataStoreClock sequenceNumber](self, "sequenceNumber");
        BOOL v13 = v12 == (id)-[IXDataStoreClock sequenceNumber](v6, "sequenceNumber");
      }
    }

    else
    {
      BOOL v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[IXDataStoreClock guid](self, "guid"));
  unint64_t v4 = (unint64_t)[v3 hash];
  unint64_t v5 = -[IXDataStoreClock sequenceNumber](self, "sequenceNumber") ^ v4;

  return v5;
}

- (NSDictionary)dictionaryRepresentation
{
  v8[0] = @"sequenceNumber";
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[IXDataStoreClock sequenceNumber](self, "sequenceNumber")));
  v8[1] = @"guid";
  v9[0] = v3;
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[IXDataStoreClock guid](self, "guid"));
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);
  v9[1] = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v9,  v8,  2LL));

  return (NSDictionary *)v6;
}

- (NSDictionary)notificationDictionary
{
  v8[0] = @"sequenceNumber";
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  -[IXDataStoreClock sequenceNumber](self, "sequenceNumber")));
  v8[1] = @"guid";
  v9[0] = v3;
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[IXDataStoreClock guid](self, "guid"));
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 UUIDString]);
  v9[1] = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v9,  v8,  2LL));

  return (NSDictionary *)v6;
}

- (id)description
{
  unint64_t v3 = (objc_class *)objc_opt_class(self);
  unint64_t v4 = NSStringFromClass(v3);
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IXDataStoreClock guid](self, "guid"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@ guid:%@ serialNumber:%llu>",  v5,  v6,  -[IXDataStoreClock sequenceNumber](self, "sequenceNumber")));

  return v7;
}

- (NSUUID)guid
{
  return self->_guid;
}

- (void)setGuid:(id)a3
{
}

- (unint64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(unint64_t)a3
{
  self->_sequenceNumber = a3;
}

- (void).cxx_destruct
{
}

@end