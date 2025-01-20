@interface ADRapportLinkTransportOptions
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (ADRapportLinkTransportOptions)init;
- (ADRapportLinkTransportOptions)initWithAllowsAWDL:(int64_t)a3 allowsBLE:(int64_t)a4 allowsInfraWiFi:(int64_t)a5 allowsBTPipe:(int64_t)a6 allowsForceBLE:(int64_t)a7 allowsForceAWDL:(int64_t)a8 noL2Cap:(int64_t)a9;
- (ADRapportLinkTransportOptions)initWithBuilder:(id)a3;
- (ADRapportLinkTransportOptions)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (int64_t)allowsAWDL;
- (int64_t)allowsBLE;
- (int64_t)allowsBTPipe;
- (int64_t)allowsForceAWDL;
- (int64_t)allowsForceBLE;
- (int64_t)allowsInfraWiFi;
- (int64_t)noL2Cap;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ADRapportLinkTransportOptions

- (ADRapportLinkTransportOptions)initWithBuilder:(id)a3
{
  v4 = (void (**)(id, _ADRapportLinkTransportOptionsMutation *))a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ADRapportLinkTransportOptions;
  v5 = -[ADRapportLinkTransportOptions init](&v9, "init");
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_ADRapportLinkTransportOptionsMutation initWithBase:]( objc_alloc(&OBJC_CLASS____ADRapportLinkTransportOptionsMutation),  "initWithBase:",  0LL);
    v4[2](v4, v7);
    if (-[_ADRapportLinkTransportOptionsMutation isDirty](v7, "isDirty"))
    {
      v6->_allowsAWDL = -[_ADRapportLinkTransportOptionsMutation getAllowsAWDL](v7, "getAllowsAWDL");
      v6->_allowsBLE = -[_ADRapportLinkTransportOptionsMutation getAllowsBLE](v7, "getAllowsBLE");
      v6->_allowsInfraWiFi = -[_ADRapportLinkTransportOptionsMutation getAllowsInfraWiFi](v7, "getAllowsInfraWiFi");
      v6->_allowsBTPipe = -[_ADRapportLinkTransportOptionsMutation getAllowsBTPipe](v7, "getAllowsBTPipe");
      v6->_allowsForceBLE = -[_ADRapportLinkTransportOptionsMutation getAllowsForceBLE](v7, "getAllowsForceBLE");
      v6->_allowsForceAWDL = -[_ADRapportLinkTransportOptionsMutation getAllowsForceAWDL](v7, "getAllowsForceAWDL");
      v6->_noL2Cap = -[_ADRapportLinkTransportOptionsMutation getNoL2Cap](v7, "getNoL2Cap");
    }
  }

  return v6;
}

- (ADRapportLinkTransportOptions)init
{
  return -[ADRapportLinkTransportOptions initWithBuilder:](self, "initWithBuilder:", 0LL);
}

- (ADRapportLinkTransportOptions)initWithAllowsAWDL:(int64_t)a3 allowsBLE:(int64_t)a4 allowsInfraWiFi:(int64_t)a5 allowsBTPipe:(int64_t)a6 allowsForceBLE:(int64_t)a7 allowsForceAWDL:(int64_t)a8 noL2Cap:(int64_t)a9
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10004F894;
  v10[3] = &unk_1004EE620;
  v10[4] = a3;
  v10[5] = a4;
  v10[6] = a5;
  v10[7] = a6;
  v10[8] = a7;
  v10[9] = a8;
  v10[10] = a9;
  return -[ADRapportLinkTransportOptions initWithBuilder:](self, "initWithBuilder:", v10);
}

- (id)description
{
  return -[ADRapportLinkTransportOptions _descriptionWithIndent:](self, "_descriptionWithIndent:", 0LL);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  v4 = objc_alloc(&OBJC_CLASS___NSString);
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ADRapportLinkTransportOptions;
  id v5 = -[ADRapportLinkTransportOptions description](&v9, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = -[NSString initWithFormat:]( v4,  "initWithFormat:",  @"%@ {allowsAWDL = %lld, allowsBLE = %lld, allowsInfraWiFi = %lld, allowsBTPipe = %lld, allowsForceBLE = %lld, allowsForceAWDL = %lld, noL2Cap = %lld}",  v6,  self->_allowsAWDL,  self->_allowsBLE,  self->_allowsInfraWiFi,  self->_allowsBTPipe,  self->_allowsForceBLE,  self->_allowsForceAWDL,  self->_noL2Cap);

  return v7;
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", self->_allowsAWDL));
  unint64_t v4 = (unint64_t)[v3 hash];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", self->_allowsBLE));
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", self->_allowsInfraWiFi));
  unint64_t v8 = (unint64_t)[v7 hash];
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", self->_allowsBTPipe));
  unint64_t v10 = v6 ^ v8 ^ (unint64_t)[v9 hash];
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", self->_allowsForceBLE));
  unint64_t v12 = (unint64_t)[v11 hash];
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", self->_allowsForceAWDL));
  unint64_t v14 = v12 ^ (unint64_t)[v13 hash];
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", self->_noL2Cap));
  unint64_t v16 = v10 ^ v14 ^ (unint64_t)[v15 hash];

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (ADRapportLinkTransportOptions *)a3;
  if (self == v4)
  {
    BOOL v14 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___ADRapportLinkTransportOptions);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      unint64_t v6 = v4;
      id allowsAWDL = (id)self->_allowsAWDL;
      if (allowsAWDL == (id)-[ADRapportLinkTransportOptions allowsAWDL](v6, "allowsAWDL")
        && (id allowsBLE = (id)self->_allowsBLE,
            allowsBLE == (id)-[ADRapportLinkTransportOptions allowsBLE](v6, "allowsBLE"))
        && (id allowsInfraWiFi = (id)self->_allowsInfraWiFi,
            allowsInfraWiFi == (id)-[ADRapportLinkTransportOptions allowsInfraWiFi](v6, "allowsInfraWiFi"))
        && (id allowsBTPipe = (id)self->_allowsBTPipe,
            allowsBTPipe == (id)-[ADRapportLinkTransportOptions allowsBTPipe](v6, "allowsBTPipe"))
        && (id allowsForceBLE = (id)self->_allowsForceBLE,
            allowsForceBLE == (id)-[ADRapportLinkTransportOptions allowsForceBLE](v6, "allowsForceBLE"))
        && (id allowsForceAWDL = (id)self->_allowsForceAWDL,
            allowsForceAWDL == (id)-[ADRapportLinkTransportOptions allowsForceAWDL](v6, "allowsForceAWDL")))
      {
        id noL2Cap = (id)self->_noL2Cap;
        BOOL v14 = noL2Cap == (id)-[ADRapportLinkTransportOptions noL2Cap](v6, "noL2Cap");
      }

      else
      {
        BOOL v14 = 0;
      }
    }

    else
    {
      BOOL v14 = 0;
    }
  }

  return v14;
}

- (ADRapportLinkTransportOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"ADRapportLinkTransportOptions::allowsAWDL"];
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = [v6 integerValue];

  id v8 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"ADRapportLinkTransportOptions::allowsBLE"];
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = [v9 integerValue];

  id v11 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"ADRapportLinkTransportOptions::allowsInfraWiFi"];
  unint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = [v12 integerValue];

  id v14 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"ADRapportLinkTransportOptions::allowsBTPipe"];
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  id v16 = [v15 integerValue];

  id v17 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"ADRapportLinkTransportOptions::allowsForceBLE"];
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  id v19 = [v18 integerValue];

  id v20 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"ADRapportLinkTransportOptions::allowsForceAWDL"];
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  id v22 = [v21 integerValue];

  id v23 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"ADRapportLinkTransportOptions::noL2Cap"];
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

  id v25 = [v24 integerValue];
  return -[ADRapportLinkTransportOptions initWithAllowsAWDL:allowsBLE:allowsInfraWiFi:allowsBTPipe:allowsForceBLE:allowsForceAWDL:noL2Cap:]( self,  "initWithAllowsAWDL:allowsBLE:allowsInfraWiFi:allowsBTPipe:allowsForceBLE:allowsForceAWDL:noL2Cap:",  v7,  v10,  v13,  v16,  v19,  v22,  v25);
}

- (void)encodeWithCoder:(id)a3
{
  int64_t allowsAWDL = self->_allowsAWDL;
  id v5 = a3;
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", allowsAWDL));
  [v5 encodeObject:v6 forKey:@"ADRapportLinkTransportOptions::allowsAWDL"];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", self->_allowsBLE));
  [v5 encodeObject:v7 forKey:@"ADRapportLinkTransportOptions::allowsBLE"];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", self->_allowsInfraWiFi));
  [v5 encodeObject:v8 forKey:@"ADRapportLinkTransportOptions::allowsInfraWiFi"];

  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", self->_allowsBTPipe));
  [v5 encodeObject:v9 forKey:@"ADRapportLinkTransportOptions::allowsBTPipe"];

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", self->_allowsForceBLE));
  [v5 encodeObject:v10 forKey:@"ADRapportLinkTransportOptions::allowsForceBLE"];

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", self->_allowsForceAWDL));
  [v5 encodeObject:v11 forKey:@"ADRapportLinkTransportOptions::allowsForceAWDL"];

  id v12 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", self->_noL2Cap));
  [v5 encodeObject:v12 forKey:@"ADRapportLinkTransportOptions::noL2Cap"];
}

- (int64_t)allowsAWDL
{
  return self->_allowsAWDL;
}

- (int64_t)allowsBLE
{
  return self->_allowsBLE;
}

- (int64_t)allowsInfraWiFi
{
  return self->_allowsInfraWiFi;
}

- (int64_t)allowsBTPipe
{
  return self->_allowsBTPipe;
}

- (int64_t)allowsForceBLE
{
  return self->_allowsForceBLE;
}

- (int64_t)allowsForceAWDL
{
  return self->_allowsForceAWDL;
}

- (int64_t)noL2Cap
{
  return self->_noL2Cap;
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
  id v4 = (void (**)(id, _ADRapportLinkTransportOptionsMutation *))a3;
  if (v4)
  {
    id v5 = -[_ADRapportLinkTransportOptionsMutation initWithBase:]( objc_alloc(&OBJC_CLASS____ADRapportLinkTransportOptionsMutation),  "initWithBase:",  self);
    v4[2](v4, v5);
    if (-[_ADRapportLinkTransportOptionsMutation isDirty](v5, "isDirty"))
    {
      unint64_t v6 = objc_alloc_init(&OBJC_CLASS___ADRapportLinkTransportOptions);
      v6->_int64_t allowsAWDL = -[_ADRapportLinkTransportOptionsMutation getAllowsAWDL](v5, "getAllowsAWDL");
      v6->_id allowsBLE = -[_ADRapportLinkTransportOptionsMutation getAllowsBLE](v5, "getAllowsBLE");
      v6->_id allowsInfraWiFi = -[_ADRapportLinkTransportOptionsMutation getAllowsInfraWiFi](v5, "getAllowsInfraWiFi");
      v6->_id allowsBTPipe = -[_ADRapportLinkTransportOptionsMutation getAllowsBTPipe](v5, "getAllowsBTPipe");
      v6->_id allowsForceBLE = -[_ADRapportLinkTransportOptionsMutation getAllowsForceBLE](v5, "getAllowsForceBLE");
      v6->_id allowsForceAWDL = -[_ADRapportLinkTransportOptionsMutation getAllowsForceAWDL](v5, "getAllowsForceAWDL");
      v6->_id noL2Cap = -[_ADRapportLinkTransportOptionsMutation getNoL2Cap](v5, "getNoL2Cap");
    }

    else
    {
      unint64_t v6 = (ADRapportLinkTransportOptions *)-[ADRapportLinkTransportOptions copy](self, "copy");
    }
  }

  else
  {
    unint64_t v6 = (ADRapportLinkTransportOptions *)-[ADRapportLinkTransportOptions copy](self, "copy");
  }

  return v6;
}

@end