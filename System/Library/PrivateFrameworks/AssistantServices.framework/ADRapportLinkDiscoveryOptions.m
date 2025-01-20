@interface ADRapportLinkDiscoveryOptions
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (ADRapportLinkDiscoveryOptions)init;
- (ADRapportLinkDiscoveryOptions)initWithBuilder:(id)a3;
- (ADRapportLinkDiscoveryOptions)initWithCoder:(id)a3;
- (ADRapportLinkDiscoveryOptions)initWithIncludesFamily:(int64_t)a3 includesHome:(int64_t)a4 includesRemoraDevices:(int64_t)a5;
- (BOOL)isEqual:(id)a3;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (int64_t)includesFamily;
- (int64_t)includesHome;
- (int64_t)includesRemoraDevices;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ADRapportLinkDiscoveryOptions

- (ADRapportLinkDiscoveryOptions)initWithBuilder:(id)a3
{
  v4 = (void (**)(id, _ADRapportLinkDiscoveryOptionsMutation *))a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ADRapportLinkDiscoveryOptions;
  v5 = -[ADRapportLinkDiscoveryOptions init](&v9, "init");
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_ADRapportLinkDiscoveryOptionsMutation initWithBase:]( objc_alloc(&OBJC_CLASS____ADRapportLinkDiscoveryOptionsMutation),  "initWithBase:",  0LL);
    v4[2](v4, v7);
    if (-[_ADRapportLinkDiscoveryOptionsMutation isDirty](v7, "isDirty"))
    {
      v6->_includesFamily = -[_ADRapportLinkDiscoveryOptionsMutation getIncludesFamily](v7, "getIncludesFamily");
      v6->_includesHome = -[_ADRapportLinkDiscoveryOptionsMutation getIncludesHome](v7, "getIncludesHome");
      v6->_includesRemoraDevices = -[_ADRapportLinkDiscoveryOptionsMutation getIncludesRemoraDevices]( v7,  "getIncludesRemoraDevices");
    }
  }

  return v6;
}

- (ADRapportLinkDiscoveryOptions)init
{
  return -[ADRapportLinkDiscoveryOptions initWithBuilder:](self, "initWithBuilder:", 0LL);
}

- (ADRapportLinkDiscoveryOptions)initWithIncludesFamily:(int64_t)a3 includesHome:(int64_t)a4 includesRemoraDevices:(int64_t)a5
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100115448;
  v6[3] = &unk_1004F1BF8;
  v6[4] = a3;
  v6[5] = a4;
  v6[6] = a5;
  return -[ADRapportLinkDiscoveryOptions initWithBuilder:](self, "initWithBuilder:", v6);
}

- (id)description
{
  return -[ADRapportLinkDiscoveryOptions _descriptionWithIndent:](self, "_descriptionWithIndent:", 0LL);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  v4 = objc_alloc(&OBJC_CLASS___NSString);
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ADRapportLinkDiscoveryOptions;
  id v5 = -[ADRapportLinkDiscoveryOptions description](&v9, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = -[NSString initWithFormat:]( v4,  "initWithFormat:",  @"%@ {includesFamily = %lld, includesHome = %lld, includesRemoraDevices = %lld}",  v6,  self->_includesFamily,  self->_includesHome,  self->_includesRemoraDevices);

  return v7;
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", self->_includesFamily));
  unint64_t v4 = (unint64_t)[v3 hash];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", self->_includesHome));
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  self->_includesRemoraDevices));
  unint64_t v8 = v6 ^ (unint64_t)[v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (ADRapportLinkDiscoveryOptions *)a3;
  if (self == v4)
  {
    BOOL v10 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___ADRapportLinkDiscoveryOptions);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      unint64_t v6 = v4;
      id includesFamily = (id)self->_includesFamily;
      if (includesFamily == (id)-[ADRapportLinkDiscoveryOptions includesFamily](v6, "includesFamily")
        && (id includesHome = (id)self->_includesHome,
            includesHome == (id)-[ADRapportLinkDiscoveryOptions includesHome](v6, "includesHome")))
      {
        id includesRemoraDevices = (id)self->_includesRemoraDevices;
        BOOL v10 = includesRemoraDevices == (id)-[ADRapportLinkDiscoveryOptions includesRemoraDevices]( v6,  "includesRemoraDevices");
      }

      else
      {
        BOOL v10 = 0;
      }
    }

    else
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

- (ADRapportLinkDiscoveryOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"ADRapportLinkDiscoveryOptions::includesFamily"];
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = [v6 integerValue];

  id v8 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"ADRapportLinkDiscoveryOptions::includesHome"];
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = [v9 integerValue];

  id v11 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"ADRapportLinkDiscoveryOptions::includesRemoraDevices"];
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  id v13 = [v12 integerValue];
  return -[ADRapportLinkDiscoveryOptions initWithIncludesFamily:includesHome:includesRemoraDevices:]( self,  "initWithIncludesFamily:includesHome:includesRemoraDevices:",  v7,  v10,  v13);
}

- (void)encodeWithCoder:(id)a3
{
  int64_t includesFamily = self->_includesFamily;
  id v5 = a3;
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", includesFamily));
  [v5 encodeObject:v6 forKey:@"ADRapportLinkDiscoveryOptions::includesFamily"];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", self->_includesHome));
  [v5 encodeObject:v7 forKey:@"ADRapportLinkDiscoveryOptions::includesHome"];

  id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", self->_includesRemoraDevices));
  [v5 encodeObject:v8 forKey:@"ADRapportLinkDiscoveryOptions::includesRemoraDevices"];
}

- (int64_t)includesFamily
{
  return self->_includesFamily;
}

- (int64_t)includesHome
{
  return self->_includesHome;
}

- (int64_t)includesRemoraDevices
{
  return self->_includesRemoraDevices;
}

+ (id)newWithBuilder:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)objc_opt_class(a1)) initWithBuilder:v4];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _ADRapportLinkDiscoveryOptionsMutation *))a3;
  if (v4)
  {
    id v5 = -[_ADRapportLinkDiscoveryOptionsMutation initWithBase:]( objc_alloc(&OBJC_CLASS____ADRapportLinkDiscoveryOptionsMutation),  "initWithBase:",  self);
    v4[2](v4, v5);
    if (-[_ADRapportLinkDiscoveryOptionsMutation isDirty](v5, "isDirty"))
    {
      unint64_t v6 = objc_alloc_init(&OBJC_CLASS___ADRapportLinkDiscoveryOptions);
      v6->_int64_t includesFamily = -[_ADRapportLinkDiscoveryOptionsMutation getIncludesFamily](v5, "getIncludesFamily");
      v6->_id includesHome = -[_ADRapportLinkDiscoveryOptionsMutation getIncludesHome](v5, "getIncludesHome");
      v6->_id includesRemoraDevices = -[_ADRapportLinkDiscoveryOptionsMutation getIncludesRemoraDevices]( v5,  "getIncludesRemoraDevices");
    }

    else
    {
      unint64_t v6 = (ADRapportLinkDiscoveryOptions *)-[ADRapportLinkDiscoveryOptions copy](self, "copy");
    }
  }

  else
  {
    unint64_t v6 = (ADRapportLinkDiscoveryOptions *)-[ADRapportLinkDiscoveryOptions copy](self, "copy");
  }

  return v6;
}

@end