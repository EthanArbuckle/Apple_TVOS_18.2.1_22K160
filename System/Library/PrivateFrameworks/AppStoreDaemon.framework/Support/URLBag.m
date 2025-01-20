@interface URLBag
- (BOOL)isExpired;
- (NSDate)expirationDate;
- (NSString)profile;
- (NSString)profileVersion;
- (URLBag)init;
- (id)BOOLForKey:(id)a3;
- (id)URLForKey:(id)a3;
- (id)URLForKey:(id)a3 account:(id)a4;
- (id)arrayForKey:(id)a3;
- (id)dictionaryForKey:(id)a3;
- (id)doubleForKey:(id)a3;
- (id)integerForKey:(id)a3;
- (id)stringForKey:(id)a3;
- (void)createSnapshotWithCompletion:(id)a3;
@end

@implementation URLBag

- (URLBag)init
{
  return (URLBag *)sub_100255710(self, 0);
}

- (BOOL)isExpired
{
  return -[AMSBag isExpired](self->_bag, "isExpired");
}

- (NSDate)expirationDate
{
  return (NSDate *)-[AMSBag expirationDate](self->_bag, "expirationDate");
}

- (NSString)profile
{
  return (NSString *)@"appstored";
}

- (NSString)profileVersion
{
  return (NSString *)@"1";
}

- (void)createSnapshotWithCompletion:(id)a3
{
}

- (id)arrayForKey:(id)a3
{
  return -[AMSBag arrayForKey:](self->_bag, "arrayForKey:", a3);
}

- (id)BOOLForKey:(id)a3
{
  return -[AMSBag BOOLForKey:](self->_bag, "BOOLForKey:", a3);
}

- (id)dictionaryForKey:(id)a3
{
  bag = self->_bag;
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AMSBag dictionaryForKey:](bag, "dictionaryForKey:", v4));
  unsigned int v6 = [v4 isEqualToString:@"sign-sap-response"];

  if (v6)
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v5 transformWithBlock:&stru_1003EEB10]);

    v5 = (void *)v7;
  }

  return v5;
}

- (id)doubleForKey:(id)a3
{
  return -[AMSBag doubleForKey:](self->_bag, "doubleForKey:", a3);
}

- (id)integerForKey:(id)a3
{
  return -[AMSBag integerForKey:](self->_bag, "integerForKey:", a3);
}

- (id)stringForKey:(id)a3
{
  return -[AMSBag stringForKey:](self->_bag, "stringForKey:", a3);
}

- (id)URLForKey:(id)a3
{
  return -[AMSBag URLForKey:](self->_bag, "URLForKey:", a3);
}

- (id)URLForKey:(id)a3 account:(id)a4
{
  return -[AMSBag URLForKey:account:](self->_bag, "URLForKey:account:", a3, a4);
}

- (void).cxx_destruct
{
}

@end