@interface BKDisplayAnnotationStringContent
+ (id)contentWithString:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)string;
- (void)setString:(id)a3;
@end

@implementation BKDisplayAnnotationStringContent

+ (id)contentWithString:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  [v5 setString:v4];

  return v5;
}

- (NSString)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  id v4 = [v3 appendObject:self->_string withName:@"string"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return (NSString *)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  if (v5 && (uint64_t v6 = objc_opt_class(self, v4), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    string = self->_string;
    v8 = (void *)objc_claimAutoreleasedReturnValue([v5 string]);
    unsigned __int8 v9 = -[NSString isEqual:](string, "isEqual:", v8);
  }

  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (NSString)string
{
  return self->_string;
}

- (void)setString:(id)a3
{
}

- (void).cxx_destruct
{
}

@end