@interface ADRapportLinkConnectionOptions
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (ADRapportLinkConnectionOptions)init;
- (ADRapportLinkConnectionOptions)initWithBuilder:(id)a3;
- (ADRapportLinkConnectionOptions)initWithCoder:(id)a3;
- (ADRapportLinkConnectionOptions)initWithUsesOnDemandConnection:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (int64_t)usesOnDemandConnection;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ADRapportLinkConnectionOptions

- (ADRapportLinkConnectionOptions)initWithBuilder:(id)a3
{
  v4 = (void (**)(id, _ADRapportLinkConnectionOptionsMutation *))a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ADRapportLinkConnectionOptions;
  v5 = -[ADRapportLinkConnectionOptions init](&v9, "init");
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_ADRapportLinkConnectionOptionsMutation initWithBase:]( objc_alloc(&OBJC_CLASS____ADRapportLinkConnectionOptionsMutation),  "initWithBase:",  0LL);
    v4[2](v4, v7);
    if (-[_ADRapportLinkConnectionOptionsMutation isDirty](v7, "isDirty")) {
      v6->_usesOnDemandConnection = -[_ADRapportLinkConnectionOptionsMutation getUsesOnDemandConnection]( v7,  "getUsesOnDemandConnection");
    }
  }

  return v6;
}

- (ADRapportLinkConnectionOptions)init
{
  return -[ADRapportLinkConnectionOptions initWithBuilder:](self, "initWithBuilder:", 0LL);
}

- (ADRapportLinkConnectionOptions)initWithUsesOnDemandConnection:(int64_t)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10025DA10;
  v4[3] = &unk_1004F7C50;
  v4[4] = a3;
  return -[ADRapportLinkConnectionOptions initWithBuilder:](self, "initWithBuilder:", v4);
}

- (id)description
{
  return -[ADRapportLinkConnectionOptions _descriptionWithIndent:](self, "_descriptionWithIndent:", 0LL);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  v4 = objc_alloc(&OBJC_CLASS___NSString);
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ADRapportLinkConnectionOptions;
  id v5 = -[ADRapportLinkConnectionOptions description](&v9, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = -[NSString initWithFormat:]( v4,  "initWithFormat:",  @"%@ {usesOnDemandConnection = %lld}",  v6,  self->_usesOnDemandConnection);

  return v7;
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  self->_usesOnDemandConnection));
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ADRapportLinkConnectionOptions *)a3;
  if (self == v4)
  {
    BOOL v7 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___ADRapportLinkConnectionOptions);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      id usesOnDemandConnection = (id)self->_usesOnDemandConnection;
      BOOL v7 = usesOnDemandConnection == (id)-[ADRapportLinkConnectionOptions usesOnDemandConnection]( v4,  "usesOnDemandConnection");
    }

    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (ADRapportLinkConnectionOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"ADRapportLinkConnectionOptions::usesOnDemandConnection"];
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  id v7 = [v6 integerValue];
  return -[ADRapportLinkConnectionOptions initWithUsesOnDemandConnection:](self, "initWithUsesOnDemandConnection:", v7);
}

- (void)encodeWithCoder:(id)a3
{
  int64_t usesOnDemandConnection = self->_usesOnDemandConnection;
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", usesOnDemandConnection));
  [v4 encodeObject:v5 forKey:@"ADRapportLinkConnectionOptions::usesOnDemandConnection"];
}

- (int64_t)usesOnDemandConnection
{
  return self->_usesOnDemandConnection;
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
  id v4 = (void (**)(id, _ADRapportLinkConnectionOptionsMutation *))a3;
  if (v4)
  {
    id v5 = -[_ADRapportLinkConnectionOptionsMutation initWithBase:]( objc_alloc(&OBJC_CLASS____ADRapportLinkConnectionOptionsMutation),  "initWithBase:",  self);
    v4[2](v4, v5);
    if (-[_ADRapportLinkConnectionOptionsMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(&OBJC_CLASS___ADRapportLinkConnectionOptions);
      v6->_int64_t usesOnDemandConnection = -[_ADRapportLinkConnectionOptionsMutation getUsesOnDemandConnection]( v5,  "getUsesOnDemandConnection");
    }

    else
    {
      v6 = (ADRapportLinkConnectionOptions *)-[ADRapportLinkConnectionOptions copy](self, "copy");
    }
  }

  else
  {
    v6 = (ADRapportLinkConnectionOptions *)-[ADRapportLinkConnectionOptions copy](self, "copy");
  }

  return v6;
}

@end