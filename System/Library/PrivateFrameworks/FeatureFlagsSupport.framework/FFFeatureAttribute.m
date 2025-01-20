@interface FFFeatureAttribute
- (BOOL)matchesAgainst:(id)a3;
- (FFFeatureAttribute)initWithName:(id)a3 value:(id)a4;
- (NSString)name;
- (NSString)value;
- (id)description;
- (void)setName:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation FFFeatureAttribute

- (FFFeatureAttribute)initWithName:(id)a3 value:(id)a4
{
  id v6 = a3;
  v7 = (__CFString *)a4;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___FFFeatureAttribute;
  v8 = -[FFFeatureAttribute init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    -[FFFeatureAttribute setName:](v8, "setName:", v6);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = v9;
      v11 = v7;
LABEL_9:
      -[FFFeatureAttribute setValue:](v10, "setValue:", v11);
      goto LABEL_10;
    }

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      else {
        v11 = @"false";
      }
      v10 = v9;
      goto LABEL_9;
    }
  }

- (id)description
{
  id v3 = objc_alloc(NSString);
  v4 = -[FFFeatureAttribute name](self, "name");
  v5 = -[FFFeatureAttribute value](self, "value");
  id v6 = (void *)[v3 initWithFormat:@"Attribute %@=%@", v4, v5];

  return v6;
}

- (BOOL)matchesAgainst:(id)a3
{
  id v4 = a3;
  [v4 value];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FFFeatureAttribute value](self, "value");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  char v7 = [v5 isEqual:v6];

  if ((v7 & 1) == 0)
  {
    v9 = -[FFFeatureAttribute value](self, "value");
    [v9 lowercaseString];
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (isBooleanYes(v10))
    {
      [v4 value];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      [v4 value];
      objc_super v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if ((isKindOfClass & 1) == 0)
      {
        LOBYTE(v8) = [v13 BOOLValue];
        goto LABEL_15;
      }

      [v13 lowercaseString];
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      char v16 = isBooleanYes(v15);
    }

    else
    {
      if (!isBooleanNo(v10))
      {
        LOBYTE(v8) = 0;
LABEL_16:

        goto LABEL_17;
      }

      [v4 value];
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      char v18 = objc_opt_isKindOfClass();

      [v4 value];
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v19;
      if ((v18 & 1) == 0)
      {
        if (v19)
        {
          [v4 value];
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          int v8 = [v20 BOOLValue] ^ 1;
        }

        else
        {
          LOBYTE(v8) = 0;
        }

        goto LABEL_15;
      }

      [v19 lowercaseString];
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      char v16 = isBooleanNo(v15);
    }

    LOBYTE(v8) = v16;
    v14 = v15;
LABEL_15:

    goto LABEL_16;
  }

  LOBYTE(v8) = 1;
LABEL_17:

  return v8;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end