@interface ACTSelectPopupVariant
- (ACTSelectPopupVariant)initWithIntendedKey:(id)a3 timestamp:(double)a4;
- (NSString)intendedKey;
- (double)timestamp;
- (id)description;
- (id)shortDescription;
- (void)applyWithTyper:(id)a3 log:(id)a4;
@end

@implementation ACTSelectPopupVariant

- (ACTSelectPopupVariant)initWithIntendedKey:(id)a3 timestamp:(double)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___ACTSelectPopupVariant;
  v7 = -[ACTSelectPopupVariant init](&v11, "init");
  if (v7)
  {
    v8 = (NSString *)[v6 copy];
    intendedKey = v7->_intendedKey;
    v7->_intendedKey = v8;

    v7->_timestamp = a4;
  }

  return v7;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ACTSelectPopupVariant intendedKey](self, "intendedKey"));
  -[ACTSelectPopupVariant timestamp](self, "timestamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: intended=%@, t=%.2f>",  v5,  v6,  v7));

  return v8;
}

- (void)applyWithTyper:(id)a3 log:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[ACTSelectPopupVariant intendedKey](self, "intendedKey"));
  -[ACTSelectPopupVariant timestamp](self, "timestamp");
  id v8 = objc_msgSend(v9, "_performVariantKey:timestamp:typingLog:", v7, v6);
}

- (id)shortDescription
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"select popup: %@ ",  self->_intendedKey);
}

- (NSString)intendedKey
{
  return self->_intendedKey;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
}

@end