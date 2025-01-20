@interface NSUUID
+ (id)csd_UUIDv5ForString:(id)a3;
@end

@implementation NSUUID

+ (id)csd_UUIDv5ForString:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = -[NSUUID initWithUUIDString:]( objc_alloc(&OBJC_CLASS___NSUUID),  "initWithUUIDString:",  @"A910C931-A590-41EF-A783-910BFBE500B3");
    if (v5) {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "tu_UUIDv5ForString:namespaceUUID:", v4, v5));
    }
    else {
      v6 = 0LL;
    }
  }

  else
  {
    v6 = 0LL;
  }

  return v6;
}

@end