@interface GKMultiplayerMatchServicePrivate
+ (Class)interfaceClass;
+ (unint64_t)requiredEntitlements;
- (void)invitePlayersV2:(id)a3 toGame:(id)a4 handler:(id)a5;
@end

@implementation GKMultiplayerMatchServicePrivate

+ (Class)interfaceClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___GKMultiplayerServicePrivateInterface, a2);
}

+ (unint64_t)requiredEntitlements
{
  return 0x800000LL;
}

- (void)invitePlayersV2:(id)a3 toGame:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%s:%d %s",  "GKMultiplayerMatchService.m",  2379LL,  "-[GKMultiplayerMatchServicePrivate invitePlayersV2:toGame:handler:]"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[GKService transactionGroupWithName:](self, "transactionGroupWithName:", v11));

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10007EC54;
  v23[3] = &unk_10026B408;
  id v13 = v9;
  id v24 = v13;
  id v25 = v12;
  id v26 = v8;
  id v14 = v8;
  id v15 = v12;
  [v15 performOnManagedObjectContext:v23];
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[GKService clientProxy](self, "clientProxy"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 replyQueue]);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10007EE44;
  v20[3] = &unk_10026B030;
  id v21 = v13;
  id v22 = v10;
  id v18 = v13;
  id v19 = v10;
  [v15 notifyOnQueue:v17 block:v20];
}

@end