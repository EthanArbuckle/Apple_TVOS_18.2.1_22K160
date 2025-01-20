@interface CKRecord
- (BOOL)mt_isSynchronized;
- (NSString)mt_secretValue;
- (void)mt_setSecretValue:(id)a3;
- (void)mt_setSynchronized:(BOOL)a3;
@end

@implementation CKRecord

- (BOOL)mt_isSynchronized
{
  id AssociatedObject = objc_getAssociatedObject(self, "mt_isSynchronized");
  v3 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (void)mt_setSynchronized:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  objc_setAssociatedObject(self, "mt_isSynchronized", v4, (void *)3);
}

- (NSString)mt_secretValue
{
  id AssociatedObject = objc_getAssociatedObject(self, "mt_secretValue");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord encryptedValuesByKey](self, "encryptedValuesByKey"));
    id v6 = (id)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"secretValue"]);
  }

  return (NSString *)v6;
}

- (void)mt_setSecretValue:(id)a3
{
  id value = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord encryptedValuesByKey](self, "encryptedValuesByKey"));
  [v4 setObject:value forKeyedSubscript:@"secretValue"];

  objc_setAssociatedObject(self, "mt_secretValue", value, (void *)3);
}

@end