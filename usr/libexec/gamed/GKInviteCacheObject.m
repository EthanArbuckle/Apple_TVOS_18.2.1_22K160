@interface GKInviteCacheObject
+ (id)entityName;
+ (id)fetchSortDescriptors;
- (void)awakeFromInsert;
@end

@implementation GKInviteCacheObject

+ (id)entityName
{
  return @"Invite";
}

- (void)awakeFromInsert
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___GKInviteCacheObject;
  -[GKInviteCacheObject awakeFromInsert](&v4, "awakeFromInsert");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[GKInviteCacheObject setTimeStamp:](self, "setTimeStamp:", v3);

  -[GKInviteCacheObject setType:](self, "setType:", 0LL);
}

+ (id)fetchSortDescriptors
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  @"timeStamp",  0LL));
  v5 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v5, 1LL));

  return v3;
}

@end