@interface DBGFont
+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5;
+ (id)withDescription:(id)a3;
- (DBGFont)initWithDescription:(id)a3;
- (NSDictionary)fontDescription;
- (NSString)debugDescription;
- (NSString)description;
- (id)JSONCompatibleRepresentation;
- (id)displayString;
- (id)objectValue;
@end

@implementation DBGFont

+ (id)withDescription:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithDescription:v4];

  return v5;
}

- (DBGFont)initWithDescription:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___DBGFont;
  v6 = -[DBGFont init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_fontDescription, a3);
  }

  return v7;
}

- (id)displayString
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DBGFont fontDescription](self, "fontDescription"));

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DBGFont fontDescription](self, "fontDescription"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"fontName"]);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DBGFont fontDescription](self, "fontDescription"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"pointSize"]);

    v8 = 0LL;
    if (v5 && v7)
    {
      [v7 floatValue];
      v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %.2fpt",  v5,  v9));
    }
  }

  else
  {
    v8 = 0LL;
  }

  return v8;
}

- (id)objectValue
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DBGFont fontDescription](self, "fontDescription"));

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DBGFont fontDescription](self, "fontDescription"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"fontName"]);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DBGFont fontDescription](self, "fontDescription"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"pointSize"]);
  }

  return -[DBGFont displayString](self, "displayString");
}

- (NSString)description
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DBGFont objectValue](self, "objectValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 description]);

  return (NSString *)v3;
}

- (NSString)debugDescription
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  id v4 = NSStringFromClass(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DBGFont description](self, "description"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p %@>",  v5,  self,  v6));

  return (NSString *)v7;
}

- (NSDictionary)fontDescription
{
  return (NSDictionary *)objc_getProperty(self, a2, 8LL, 1);
}

- (void).cxx_destruct
{
}

+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSDictionary, v10);
  if ((objc_opt_isKindOfClass(v8, v11) & 1) != 0)
  {
    id v17 = 0LL;
    uint64_t v12 = DBGDecodeValueFromJSONCompatibleValue(v8, v9, &v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    id v14 = v17;
    v15 = (void *)objc_claimAutoreleasedReturnValue([a1 withDescription:v13]);
    if (a5 && v14) {
      *a5 = v14;
    }
  }

  else
  {
    v15 = 0LL;
  }

  return v15;
}

- (id)JSONCompatibleRepresentation
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DBGFont fontDescription](self, "fontDescription"));
  id v8 = 0LL;
  uint64_t v3 = DBGEncodeValueAsJSONCompatibleValue(v2, @"font", &v8);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = v8;

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedDescription]);
    NSLog(@"%s Error: %@", "-[DBGFont(JSONSerialization) JSONCompatibleRepresentation]", v6);

    id v4 = 0LL;
  }

  return v4;
}

@end