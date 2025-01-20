@interface CKRecord
- (NSString)hashedDescription;
- (NSString)type;
- (id)fieldForKey:(id)a3;
- (void)setField:(id)a3 forKey:(id)a4;
@end

@implementation CKRecord

- (NSString)type
{
  return -[CKRecord recordType](self, "recordType");
}

- (NSString)hashedDescription
{
  uint64_t v3 = objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord identifier](self, "identifier"));
  uint64_t v5 = AMSHashIfNeeded(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableString stringWithFormat:]( &OBJC_CLASS___NSMutableString,  "stringWithFormat:",  @"<%@: %p recordIdentifier = %@ | values = {",  v3,  self,  v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord encryptedValuesByKey](self, "encryptedValuesByKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 allKeys]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10015B830;
  v13[3] = &unk_1001B4830;
  id v10 = v7;
  id v14 = v10;
  v15 = self;
  [v9 enumerateObjectsUsingBlock:v13];

  [v10 appendString:@"\n}"];
  id v11 = v10;

  return (NSString *)v11;
}

- (id)fieldForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord encryptedValuesByKey](self, "encryptedValuesByKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);

  return v6;
}

- (void)setField:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[CKRecord encryptedValuesByKey](self, "encryptedValuesByKey"));
  [v8 setObject:v7 forKeyedSubscript:v6];
}

@end