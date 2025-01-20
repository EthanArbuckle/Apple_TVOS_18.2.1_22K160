@interface DBGAttributedString
+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5;
+ (id)withAttributedString:(id)a3;
- (DBGAttributedString)initWithAttributedString:(id)a3;
- (NSAttributedString)attributedString;
- (NSString)debugDescription;
- (NSString)description;
- (void)setAttributedString:(id)a3;
@end

@implementation DBGAttributedString

+ (id)withAttributedString:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithAttributedString:v4];

  return v5;
}

- (DBGAttributedString)initWithAttributedString:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___DBGAttributedString;
  v6 = -[DBGAttributedString init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_attributedString, a3);
  }

  return v7;
}

- (NSString)description
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DBGAttributedString objectValue](self, "objectValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 description]);

  return (NSString *)v3;
}

- (NSString)debugDescription
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  id v4 = NSStringFromClass(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DBGAttributedString description](self, "description"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p %@>",  v5,  self,  v6));

  return (NSString *)v7;
}

- (NSAttributedString)attributedString
{
  return (NSAttributedString *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setAttributedString:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (id)valueWithEncodedValue:(id)a3 format:(id)a4 error:(id *)a5
{
  id v8 = a3;
  if ([a4 isEqualToString:@"attrStr"]
    && (uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSString, v9), (objc_opt_isKindOfClass(v8, v10) & 1) != 0))
  {
    v11 = -[NSAttributedString initWithString:](objc_alloc(&OBJC_CLASS___NSAttributedString), "initWithString:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue([a1 withAttributedString:v11]);
  }

  else
  {
    v12 = 0LL;
    if (!v8 && a5)
    {
      v12 = 0LL;
      *a5 = 0LL;
    }
  }

  return v12;
}

@end