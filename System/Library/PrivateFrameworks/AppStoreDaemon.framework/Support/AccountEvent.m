@interface AccountEvent
+ (Class)databaseEntityClass;
- (AccountEvent)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation AccountEvent

- (AccountEvent)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___AccountEvent;
  return -[SQLiteMemoryEntity init](&v3, "init");
}

- (id)description
{
  id v3 = sub_1001A4848(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = sub_1001E83D8(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = sub_1001A4824(self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = sub_1001E83D8(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = sub_1001A47DC(self);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = sub_1001A4800(self);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"{ start: %@ end: %@ account: %@/%@  type: %ld }",  v6,  v10,  v12,  v14,  sub_1001A486C(self));
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___AccountEvent;
  return -[SQLiteMemoryEntity copyWithZone:](&v4, "copyWithZone:", a3);
}

+ (Class)databaseEntityClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___AccountEventEntity, a2);
}

@end