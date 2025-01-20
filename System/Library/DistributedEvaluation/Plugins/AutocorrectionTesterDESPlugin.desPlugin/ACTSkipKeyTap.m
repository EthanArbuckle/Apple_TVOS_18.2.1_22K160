@interface ACTSkipKeyTap
- (ACTSkipKeyTap)initWithIntendedKey:(id)a3 timestamp:(double)a4;
- (UIKBTree)intendedKey;
- (double)timestamp;
- (id)description;
- (id)shortDescription;
- (void)applyWithTyper:(id)a3 log:(id)a4;
@end

@implementation ACTSkipKeyTap

- (ACTSkipKeyTap)initWithIntendedKey:(id)a3 timestamp:(double)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___ACTSkipKeyTap;
  v8 = -[ACTSkipKeyTap init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_intendedKey, a3);
    v9->_timestamp = a4;
  }

  return v9;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ACTSkipKeyTap intendedKey](self, "intendedKey"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 representedString]);
  -[ACTSkipKeyTap timestamp](self, "timestamp");
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: intended=%@, t=%.2f>",  v5,  v7,  v8));

  return v9;
}

- (void)applyWithTyper:(id)a3 log:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[ACTSkipKeyTap timestamp](self, "timestamp");
  double v9 = v8;
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[ACTSkipKeyTap intendedKey](self, "intendedKey"));
  [v7 _skipTapTimestamp:v10 intendedKey:v6 typingLog:v9];
}

- (id)shortDescription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ACTSkipKeyTap intendedKey](self, "intendedKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 representedString]);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SkipKey intended: %@",  v3));

  return v4;
}

- (UIKBTree)intendedKey
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