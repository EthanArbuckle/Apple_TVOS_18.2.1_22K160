@interface ASFetchUserActivity
- (ASFetchUserActivity)fetchUserActivityWithCompletion:(id)a3;
- (void)_fetchUserActivityForUUID:(id)a3 withCompletion:(id)a4;
- (void)performWithCompletion:(id)a3;
@end

@implementation ASFetchUserActivity

- (void)performWithCompletion:(id)a3
{
}

- (ASFetchUserActivity)fetchUserActivityWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASFetchUserActivity internalGUID](self, "internalGUID"));
  id v6 = [v5 length];

  if (v6)
  {
    v7 = objc_alloc(&OBJC_CLASS___NSUUID);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASFetchUserActivity internalGUID](self, "internalGUID"));
    v9 = -[NSUUID initWithUUIDString:](v7, "initWithUUIDString:", v8);

    -[ASFetchUserActivity _fetchUserActivityForUUID:withCompletion:]( self,  "_fetchUserActivityForUUID:withCompletion:",  v9,  v4);
  }

  else
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_6614;
    v11[3] = &unk_C510;
    v11[4] = self;
    id v12 = v4;
    +[NSUserActivity _currentUserActivityUUIDWithOptions:completionHandler:]( &OBJC_CLASS___NSUserActivity,  "_currentUserActivityUUIDWithOptions:completionHandler:",  0LL,  v11);
  }

  return result;
}

- (void)_fetchUserActivityForUUID:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  v7 = (void (**)(void, void))v6;
  if (!a3)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid ace command %@, no user activity found",  self));
    if (os_log_type_enabled(AFSiriLogContextService, OS_LOG_TYPE_ERROR))
    {
      sub_7C84();
      if (!v7) {
        goto LABEL_6;
      }
    }

    else if (!v7)
    {
      goto LABEL_6;
    }

    id v9 = [[SACommandFailed alloc] initWithReason:v8];
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 dictionary]);
    ((void (**)(void, void *))v7)[2](v7, v10);

    goto LABEL_6;
  }

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_689C;
  v11[3] = &unk_C538;
  id v12 = v6;
  +[NSUserActivity _fetchUserActivityWithUUID:completionHandler:]( &OBJC_CLASS___NSUserActivity,  "_fetchUserActivityWithUUID:completionHandler:",  a3,  v11);
  v8 = v12;
LABEL_6:
}

@end