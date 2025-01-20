@interface CKRecord
- (id)_ad_dataOfClass:(Class)a3;
- (id)_ad_dataOfClasses:(id)a3;
- (void)_ad_setData:(id)a3;
@end

@implementation CKRecord

- (id)_ad_dataOfClass:(Class)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord _ad_dataOfClasses:](self, "_ad_dataOfClasses:", v4));

  return v5;
}

- (id)_ad_dataOfClasses:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord encryptedValuesByKey](self, "encryptedValuesByKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"value"]);

  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSData);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0) {
    id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v4,  v6,  0LL));
  }
  else {
    id v8 = v6;
  }
  v9 = v8;

  return v9;
}

- (void)_ad_setData:(id)a3
{
  if (a3) {
    id v5 = (id)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  a3,  1LL,  0LL));
  }
  else {
    id v5 = 0LL;
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord encryptedValuesByKey](self, "encryptedValuesByKey"));
  [v4 setObject:v5 forKey:@"value"];
}

@end