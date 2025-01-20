@interface ActivityManagerDebugRecentActionItem
- (ActivityManagerDebugRecentActionItem)initWithString:(id)a3;
- (NSDate)when;
- (NSString)str;
- (void)setStr:(id)a3;
- (void)setWhen:(id)a3;
@end

@implementation ActivityManagerDebugRecentActionItem

- (ActivityManagerDebugRecentActionItem)initWithString:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ActivityManagerDebugRecentActionItem;
  v5 = -[ActivityManagerDebugRecentActionItem init](&v9, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    -[ActivityManagerDebugRecentActionItem setWhen:](v5, "setWhen:", v6);

    id v7 = [v4 copy];
    -[ActivityManagerDebugRecentActionItem setStr:](v5, "setStr:", v7);
  }

  return v5;
}

- (NSDate)when
{
  return (NSDate *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setWhen:(id)a3
{
}

- (NSString)str
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setStr:(id)a3
{
}

- (void).cxx_destruct
{
}

@end