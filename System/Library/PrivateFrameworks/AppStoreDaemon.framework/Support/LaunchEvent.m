@interface LaunchEvent
+ (Class)databaseEntityClass;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation LaunchEvent

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = sub_1002CFD24(self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"bundleID: %@", v5));
  [v3 addObject:v6];

  id v7 = sub_1002CFD48(self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v8)
  {
    id v9 = sub_1002CFD48(self);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    id v11 = sub_1001E83D8(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"startTime: %@",  v12));
    [v3 addObject:v13];
  }

  id v14 = sub_1002CFDA8(self);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  id v16 = sub_1001E83D8(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"endTime: %@", v17));
  [v3 addObject:v18];

  id v19 = sub_1002CFE08(self);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

  if (v20)
  {
    id v21 = sub_1002CFE08(self);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"launchReason: %@",  v22));
    [v3 addObject:v23];
  }

  id v24 = sub_1002CFEC8(self);
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  id v26 = [v25 length];

  if (v26)
  {
    id v27 = sub_1002CFEC8(self);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"bundleID: %@",  v28));
    [v3 addObject:v29];
  }

  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsJoinedByString:", @", "));
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"{ %@ }", v30));

  return v31;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___LaunchEvent;
  return -[SQLiteMemoryEntity copyWithZone:](&v4, "copyWithZone:", a3);
}

+ (Class)databaseEntityClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___LaunchEventEntity, a2);
}

@end