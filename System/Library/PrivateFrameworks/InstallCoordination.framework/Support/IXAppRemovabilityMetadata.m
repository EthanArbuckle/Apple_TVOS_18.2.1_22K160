@interface IXAppRemovabilityMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUnknown;
- (IXAppRemovabilityMetadata)initWithCoder:(id)a3;
- (IXAppRemovabilityMetadata)initWithMetadataDictionary:(id)a3;
- (IXAppRemovabilityMetadata)initWithRemovability:(unint64_t)a3 client:(unint64_t)a4;
- (NSDictionary)dictionaryRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)client;
- (unint64_t)hash;
- (unint64_t)removability;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IXAppRemovabilityMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IXAppRemovabilityMetadata)initWithRemovability:(unint64_t)a3 client:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___IXAppRemovabilityMetadata;
  result = -[IXAppRemovabilityMetadata init](&v7, "init");
  if (result)
  {
    result->_removability = a3;
    result->_client = a4;
  }

  return result;
}

- (IXAppRemovabilityMetadata)initWithMetadataDictionary:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"removability"]);
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber);
    id v8 = v6;
    if ((objc_opt_isKindOfClass(v8, v7) & 1) != 0) {
      id v9 = v8;
    }
    else {
      id v9 = 0LL;
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"client"]);
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSNumber);
    id v13 = v11;
    if ((objc_opt_isKindOfClass(v13, v12) & 1) != 0) {
      id v14 = v13;
    }
    else {
      id v14 = 0LL;
    }

    v10 = 0LL;
    if (v9 && v14)
    {
      self =  -[IXAppRemovabilityMetadata initWithRemovability:client:]( self,  "initWithRemovability:client:",  [v9 unsignedIntegerValue],  objc_msgSend(v14, "unsignedIntegerValue"));
      v10 = self;
    }
  }

  else
  {
    v10 = 0LL;
  }

  return v10;
}

- (NSDictionary)dictionaryRepresentation
{
  v7[0] = @"removability";
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[IXAppRemovabilityMetadata removability](self, "removability")));
  v7[1] = @"client";
  v8[0] = v3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[IXAppRemovabilityMetadata client](self, "client")));
  v8[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v8,  v7,  2LL));

  return (NSDictionary *)v5;
}

- (BOOL)isUnknown
{
  return !-[IXAppRemovabilityMetadata removability](self, "removability")
      && !-[IXAppRemovabilityMetadata client](self, "client");
}

- (id)description
{
  v3 = IXStringForAppRemovability(-[IXAppRemovabilityMetadata removability](self, "removability"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = IXStringForAppRemovabilityClient(-[IXAppRemovabilityMetadata client](self, "client"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@:%@", v4, v6));

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_msgSend( objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3),  "initWithRemovability:client:",  -[IXAppRemovabilityMetadata removability](self, "removability"),  -[IXAppRemovabilityMetadata client](self, "client"));
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (IXAppRemovabilityMetadata *)a3;
  v5 = v4;
  if (self == v4)
  {
    BOOL v10 = 1;
  }

  else if (v4 && (uint64_t v6 = objc_opt_class(self), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    uint64_t v7 = v5;
    id v8 = -[IXAppRemovabilityMetadata removability](v7, "removability");
    BOOL v10 = 0;
    if (v8 == (id)-[IXAppRemovabilityMetadata removability](self, "removability"))
    {
      id v9 = -[IXAppRemovabilityMetadata client](v7, "client");
      if (v9 == (id)-[IXAppRemovabilityMetadata client](self, "client")) {
        BOOL v10 = 1;
      }
    }
  }

  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3 = -[IXAppRemovabilityMetadata removability](self, "removability");
  return -[IXAppRemovabilityMetadata client](self, "client") ^ v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[IXAppRemovabilityMetadata removability](self, "removability")));
  [v4 encodeObject:v5 forKey:@"removability"];

  id v6 = (id)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[IXAppRemovabilityMetadata client](self, "client")));
  [v4 encodeObject:v6 forKey:@"client"];
}

- (IXAppRemovabilityMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___IXAppRemovabilityMetadata;
  v5 = -[IXAppRemovabilityMetadata init](&v11, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"removability"];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v5->_removability = (unint64_t)[v7 unsignedLongLongValue];

    id v8 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"client"];
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v5->_client = (unint64_t)[v9 unsignedLongLongValue];
  }

  return v5;
}

- (unint64_t)removability
{
  return self->_removability;
}

- (unint64_t)client
{
  return self->_client;
}

@end