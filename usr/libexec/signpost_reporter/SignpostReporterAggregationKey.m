@interface SignpostReporterAggregationKey
- (BOOL)isEqual:(id)a3;
- (NSString)category;
- (NSString)subsystem;
- (SignpostReporterAggregationKey)initWithSubsystem:(id)a3 category:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation SignpostReporterAggregationKey

- (SignpostReporterAggregationKey)initWithSubsystem:(id)a3 category:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___SignpostReporterAggregationKey;
  v9 = -[SignpostReporterAggregationKey init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_subsystem, a3);
    objc_storeStrong((id *)&v10->_category, a4);
  }

  return v10;
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostReporterAggregationKey subsystem](self, "subsystem"));
  unint64_t v4 = (unint64_t)[v3 hash];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostReporterAggregationKey category](self, "category"));
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4 = +[SignpostReporterAggregationKey allocWithZone:]( &OBJC_CLASS___SignpostReporterAggregationKey,  "allocWithZone:",  a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostReporterAggregationKey subsystem](self, "subsystem"));
  id v6 = [v5 copy];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostReporterAggregationKey category](self, "category"));
  id v8 = [v7 copy];
  v9 = -[SignpostReporterAggregationKey initWithSubsystem:category:](v4, "initWithSubsystem:category:", v6, v8);

  return v9;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostReporterAggregationKey subsystem](self, "subsystem"));
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostReporterAggregationKey category](self, "category"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@/%@", v3, v4));

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (SignpostReporterAggregationKey *)a3;
  if (self == v4)
  {
    unsigned __int8 v11 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class(self);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      id v6 = v4;
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostReporterAggregationKey subsystem](v6, "subsystem"));
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostReporterAggregationKey subsystem](self, "subsystem"));
      if ([v7 isEqualToString:v8])
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostReporterAggregationKey category](v6, "category"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[SignpostReporterAggregationKey category](self, "category"));
        unsigned __int8 v11 = [v9 isEqualToString:v10];
      }

      else
      {
        unsigned __int8 v11 = 0;
      }
    }

    else
    {
      unsigned __int8 v11 = 0;
    }
  }

  return v11;
}

- (NSString)subsystem
{
  return self->_subsystem;
}

- (NSString)category
{
  return self->_category;
}

- (void).cxx_destruct
{
}

@end