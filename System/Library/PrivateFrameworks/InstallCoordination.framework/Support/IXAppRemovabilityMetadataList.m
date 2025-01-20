@interface IXAppRemovabilityMetadataList
+ (BOOL)supportsSecureCoding;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (IXAppRemovabilityMetadataList)initWithCoder:(id)a3;
- (IXAppRemovabilityMetadataList)initWithInitialRemovability:(unint64_t)a3 client:(unint64_t)a4;
- (IXAppRemovabilityMetadataList)initWithInitialRemovabilityMetadata:(id)a3;
- (IXAppRemovabilityMetadataList)initWithMetadataDictionary:(id)a3;
- (IXAppRemovabilityMetadataList)initWithSerializedDictionary:(id)a3;
- (NSDictionary)clientToRemovabilityMetadataMap;
- (NSDictionary)propertyListRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mostRestrictiveRemovabilityMetadata;
- (unint64_t)hash;
- (unint64_t)removabilityForClient:(unint64_t)a3 notFoundRemovability:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setClientToRemovabilityMetadataMap:(id)a3;
- (void)updateRemovability:(unint64_t)a3 forClient:(unint64_t)a4;
- (void)updateRemovabilityWithMetadata:(id)a3;
@end

@implementation IXAppRemovabilityMetadataList

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IXAppRemovabilityMetadataList)initWithMetadataDictionary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___IXAppRemovabilityMetadataList;
    v5 = -[IXAppRemovabilityMetadataList init](&v10, "init");
    if (v5)
    {
      v6 = (NSDictionary *)[v4 copy];
      clientToRemovabilityMetadataMap = v5->_clientToRemovabilityMetadataMap;
      v5->_clientToRemovabilityMetadataMap = v6;
    }

    self = v5;
    v8 = self;
  }

  else
  {
    v8 = 0LL;
  }

  return v8;
}

- (IXAppRemovabilityMetadataList)initWithInitialRemovability:(unint64_t)a3 client:(unint64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___IXAppRemovabilityMetadataList;
  v6 = -[IXAppRemovabilityMetadataList init](&v10, "init");
  if (v6)
  {
    v7 = objc_opt_new(&OBJC_CLASS___NSDictionary);
    clientToRemovabilityMetadataMap = v6->_clientToRemovabilityMetadataMap;
    v6->_clientToRemovabilityMetadataMap = v7;

    -[IXAppRemovabilityMetadataList updateRemovability:forClient:](v6, "updateRemovability:forClient:", a3, a4);
  }

  return v6;
}

- (IXAppRemovabilityMetadataList)initWithInitialRemovabilityMetadata:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___IXAppRemovabilityMetadataList;
    v5 = -[IXAppRemovabilityMetadataList init](&v10, "init");
    if (v5)
    {
      v6 = objc_opt_new(&OBJC_CLASS___NSDictionary);
      clientToRemovabilityMetadataMap = v5->_clientToRemovabilityMetadataMap;
      v5->_clientToRemovabilityMetadataMap = v6;

      -[IXAppRemovabilityMetadataList updateRemovabilityWithMetadata:](v5, "updateRemovabilityWithMetadata:", v4);
    }

    self = v5;
    v8 = self;
  }

  else
  {
    v8 = 0LL;
  }

  return v8;
}

- (IXAppRemovabilityMetadataList)initWithSerializedDictionary:(id)a3
{
  if (a3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKeyedSubscript:@"metadata"]);
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSArray);
    id v6 = v4;
    if ((objc_opt_isKindOfClass(v6, v5) & 1) != 0) {
      id v7 = v6;
    }
    else {
      id v7 = 0LL;
    }

    if (v7)
    {
      v16.receiver = self;
      v16.super_class = (Class)&OBJC_CLASS___IXAppRemovabilityMetadataList;
      v9 = -[IXAppRemovabilityMetadataList init](&v16, "init");
      if (v9)
      {
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472LL;
        v14[2] = sub_100030A98;
        v14[3] = &unk_1000CDD80;
        v15 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
        objc_super v10 = v15;
        [v7 enumerateObjectsUsingBlock:v14];
        v11 = (NSDictionary *)-[NSMutableDictionary copy](v10, "copy");
        clientToRemovabilityMetadataMap = v9->_clientToRemovabilityMetadataMap;
        v9->_clientToRemovabilityMetadataMap = v11;
      }

      self = v9;
      v8 = self;
    }

    else
    {
      v8 = 0LL;
    }
  }

  else
  {
    v8 = 0LL;
  }

  return v8;
}

- (id)mostRestrictiveRemovabilityMetadata
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[IXAppRemovabilityMetadataList clientToRemovabilityMetadataMap]( self,  "clientToRemovabilityMetadataMap"));
  if ([v2 count])
  {
    uint64_t v7 = 0LL;
    v8 = &v7;
    uint64_t v9 = 0x3032000000LL;
    objc_super v10 = sub_100030C80;
    v11 = sub_100030C90;
    id v12 = 0LL;
    v6[0] = 0LL;
    v6[1] = v6;
    v6[2] = 0x2020000000LL;
    v6[3] = 0LL;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_100030C98;
    v5[3] = &unk_1000CDDA8;
    v5[4] = &v7;
    v5[5] = v6;
    [v2 enumerateKeysAndObjectsUsingBlock:v5];
    id v3 = (id)v8[5];
    _Block_object_dispose(v6, 8);
    _Block_object_dispose(&v7, 8);
  }

  else
  {
    id v3 = 0LL;
  }

  return v3;
}

- (void)updateRemovability:(unint64_t)a3 forClient:(unint64_t)a4
{
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[IXAppRemovabilityMetadataList clientToRemovabilityMetadataMap]( self,  "clientToRemovabilityMetadataMap"));
  id v12 = [v7 mutableCopy];

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
  if (a3 == 1)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:v8]);

    if (v9) {
      [v12 removeObjectForKey:v8];
    }
  }

  else
  {
    objc_super v10 = -[IXAppRemovabilityMetadata initWithRemovability:client:]( objc_alloc(&OBJC_CLASS___IXAppRemovabilityMetadata),  "initWithRemovability:client:",  a3,  a4);
    [v12 setObject:v10 forKeyedSubscript:v8];
  }

  id v11 = [v12 copy];
  -[IXAppRemovabilityMetadataList setClientToRemovabilityMetadataMap:](self, "setClientToRemovabilityMetadataMap:", v11);
}

- (void)updateRemovabilityWithMetadata:(id)a3
{
  id v9 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[IXAppRemovabilityMetadataList clientToRemovabilityMetadataMap]( self,  "clientToRemovabilityMetadataMap"));
  id v5 = [v4 mutableCopy];

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v9 client]));
  if ([v9 removability] == (id)1)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v6]);

    if (v7) {
      [v5 removeObjectForKey:v6];
    }
  }

  else
  {
    [v5 setObject:v9 forKeyedSubscript:v6];
  }

  id v8 = [v5 copy];
  -[IXAppRemovabilityMetadataList setClientToRemovabilityMetadataMap:](self, "setClientToRemovabilityMetadataMap:", v8);
}

- (unint64_t)removabilityForClient:(unint64_t)a3 notFoundRemovability:(unint64_t)a4
{
  if (!-[IXAppRemovabilityMetadataList isEmpty](self, "isEmpty"))
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[IXAppRemovabilityMetadataList clientToRemovabilityMetadataMap]( self,  "clientToRemovabilityMetadataMap"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v8]);

    if (v9) {
      a4 = (unint64_t)[v9 removability];
    }
  }

  return a4;
}

- (BOOL)isEmpty
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[IXAppRemovabilityMetadataList clientToRemovabilityMetadataMap]( self,  "clientToRemovabilityMetadataMap"));
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (id)description
{
  BOOL v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[IXAppRemovabilityMetadataList clientToRemovabilityMetadataMap]( self,  "clientToRemovabilityMetadataMap"));
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472LL;
  objc_super v10 = sub_1000310A4;
  id v11 = &unk_1000CDDD0;
  id v12 = v3;
  id v5 = v3;
  [v4 enumerateKeysAndObjectsUsingBlock:&v8];

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@",  v5,  v8,  v9,  v10,  v11));
  return v6;
}

- (NSDictionary)propertyListRepresentation
{
  BOOL v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[IXAppRemovabilityMetadataList clientToRemovabilityMetadataMap]( self,  "clientToRemovabilityMetadataMap"));
  uint64_t v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472LL;
  id v11 = sub_100031200;
  id v12 = &unk_1000CDDD0;
  v13 = v3;
  id v5 = v3;
  [v4 enumerateKeysAndObjectsUsingBlock:&v9];

  v14 = @"metadata";
  id v6 = -[NSMutableArray copy](v5, "copy", v9, v10, v11, v12);
  id v15 = v6;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));

  return (NSDictionary *)v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[IXAppRemovabilityMetadataList allocWithZone:]( &OBJC_CLASS___IXAppRemovabilityMetadataList,  "allocWithZone:",  a3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[IXAppRemovabilityMetadataList clientToRemovabilityMetadataMap]( self,  "clientToRemovabilityMetadataMap"));
  id v6 = -[IXAppRemovabilityMetadataList initWithMetadataDictionary:](v4, "initWithMetadataDictionary:", v5);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (IXAppRemovabilityMetadataList *)a3;
  id v5 = v4;
  if (self == v4)
  {
    unsigned __int8 v9 = 1;
  }

  else if (v4 && (uint64_t v6 = objc_opt_class(self), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[IXAppRemovabilityMetadataList clientToRemovabilityMetadataMap]( v5,  "clientToRemovabilityMetadataMap"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[IXAppRemovabilityMetadataList clientToRemovabilityMetadataMap]( self,  "clientToRemovabilityMetadataMap"));
    unsigned __int8 v9 = [v7 isEqual:v8];
  }

  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[IXAppRemovabilityMetadataList clientToRemovabilityMetadataMap]( self,  "clientToRemovabilityMetadataMap"));
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[IXAppRemovabilityMetadataList clientToRemovabilityMetadataMap](self, "clientToRemovabilityMetadataMap"));
  [v4 encodeObject:v5 forKey:@"clientToRemovabilityMetadataMap"];
}

- (IXAppRemovabilityMetadataList)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___IXAppRemovabilityMetadataList;
  id v5 = -[IXAppRemovabilityMetadataList init](&v14, "init");
  if (v5)
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSNumber);
    unsigned __int8 v9 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v6,  v7,  v8,  objc_opt_class(&OBJC_CLASS___IXAppRemovabilityMetadata),  0LL);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v10 forKey:@"clientToRemovabilityMetadataMap"]);
    clientToRemovabilityMetadataMap = v5->_clientToRemovabilityMetadataMap;
    v5->_clientToRemovabilityMetadataMap = (NSDictionary *)v11;
  }

  return v5;
}

- (NSDictionary)clientToRemovabilityMetadataMap
{
  return self->_clientToRemovabilityMetadataMap;
}

- (void)setClientToRemovabilityMetadataMap:(id)a3
{
}

- (void).cxx_destruct
{
}

@end