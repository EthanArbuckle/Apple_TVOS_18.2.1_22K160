@interface AppEvent
+ (Class)databaseEntityClass;
- (AppEvent)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation AppEvent

- (AppEvent)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___AppEvent;
  return -[SQLiteMemoryEntity init](&v3, "init");
}

- (id)description
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  unsigned __int8 v4 = sub_1001E2698(self, (uint64_t)@"event_type");
  v5 = sub_1001AB5CC((uint64_t)&OBJC_CLASS___AppEvent, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"eventType:%@", v6));
  [v3 addObject:v7];

  if (v4 == 2LL)
  {
    id v8 = sub_1001E2634(self, (uint64_t)@"launch_time");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = v9;
    if (v9)
    {
      id v11 = sub_1001E83D8(v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"launchTime:%@",  v12));
      [v3 addObject:v13];
    }

    id v14 = sub_1001E2634(self, (uint64_t)@"launch_end_time");
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = v15;
    if (v15)
    {
      id v17 = sub_1001E83D8(v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"launchEndTime:%@",  v18));
      [v3 addObject:v19];
    }
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue([v3 componentsJoinedByString:@","]);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"{ %@ }", v20));

  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___AppEvent;
  v5 = -[SQLiteMemoryEntity copyWithZone:](&v9, "copyWithZone:");
  id v6 = -[NSMutableArray copyWithZone:](self->_mutableForegroundEvents, "copyWithZone:", a3);
  v7 = (void *)v5[4];
  v5[4] = v6;

  return v5;
}

+ (Class)databaseEntityClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___AppEventEntity, a2);
}

- (void).cxx_destruct
{
}

@end