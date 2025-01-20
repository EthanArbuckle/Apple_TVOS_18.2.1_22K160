@interface HighEngagementResolver
+ (id)fetchHighEngagementCategories;
@end

@implementation HighEngagementResolver

+ (id)fetchHighEngagementCategories
{
  v2 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  &stru_10012E768,  @"TopCategory1");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  &stru_10012E768,  @"TopCategory2");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  &stru_10012E768,  @"TopCategory3");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  &stru_10012E768,  @"HighEngagementCategory1");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v2,  "setObject:forKeyedSubscript:",  &stru_10012E768,  @"HighEngagementCategory2");
  if (objc_opt_class(&OBJC_CLASS___BMStream) && objc_opt_class(&OBJC_CLASS___BMPublisherOptions))
  {
    uint64_t v3 = BiomeLibrary();
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 OSAnalytics]);
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 CA]);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 HighEngagementDevices]);

    v8 = objc_opt_new(&OBJC_CLASS___NSDateComponents);
    -[NSDateComponents setDay:](v8, "setDay:", -1LL);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 dateByAddingComponents:v8 toDate:v9 options:0]);

    id v12 = [[BMPublisherOptions alloc] initWithStartDate:v11 endDate:v9 maxEvents:1 lastN:1 reversed:0];
    v13 = (void *)objc_claimAutoreleasedReturnValue([v7 publisherWithOptions:v12]);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10004B268;
    v16[3] = &unk_100127B18;
    v17 = v2;
    id v14 = [v13 sinkWithCompletion:&stru_100127AF0 receiveInput:v16];
  }

  return v2;
}

@end