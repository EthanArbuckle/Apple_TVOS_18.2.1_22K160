@interface MSDServer
- (MSDSession)session;
- (id)taskInfoFromCommandRequest:(id)a3;
- (void)sendQueryForRequest:(id)a3 toPath:(id)a4 maxRetry:(int64_t)a5;
- (void)sendRequest:(id)a3 toEndpoint:(id)a4 postData:(BOOL)a5 maxRetry:(int64_t)a6;
- (void)setSession:(id)a3;
@end

@implementation MSDServer

- (void)sendQueryForRequest:(id)a3 toPath:(id)a4 maxRetry:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_10000ACB8;
  v26[3] = &unk_1000F9450;
  id v10 = v8;
  id v27 = v10;
  v11 = objc_retainBlock(v26);
  if ([v10 isValid])
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue([v10 getQueryItems]);

    if (v12)
    {
      if (v9)
      {
        v13 = objc_alloc_init(&OBJC_CLASS___NSURLComponents);
        v14 = (void *)objc_claimAutoreleasedReturnValue([v10 getQueryItems]);
        -[NSURLComponents setQueryItems:](v13, "setQueryItems:", v14);

        -[NSURLComponents setPath:](v13, "setPath:", v9);
        v15 = (MSDServerResponse *)objc_claimAutoreleasedReturnValue(-[MSDServer taskInfoFromCommandRequest:](self, "taskInfoFromCommandRequest:", v10));
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLComponents URL](v13, "URL"));
        v17 = (void *)objc_claimAutoreleasedReturnValue([v16 absoluteString]);
        -[MSDServerResponse setEndpoint:](v15, "setEndpoint:", v17);

        -[MSDServerResponse setMaxRetry:](v15, "setMaxRetry:", a5);
        -[MSDServerResponse setHandler:](v15, "setHandler:", v11);
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServer session](self, "session"));
        [v18 launchTaskWithInfo:v15];

        id v19 = 0LL;
        goto LABEL_5;
      }

      id v23 = sub_10003A95C();
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_10009091C(v10);
      }
    }

    else
    {
      id v22 = sub_10003A95C();
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_1000908A4(v10);
      }
    }
  }

  else
  {
    id v20 = sub_10003A95C();
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_100090994(v10);
    }
  }

  id v25 = 0LL;
  sub_100087610(&v25, 3727744769LL, (uint64_t)@"Input is invalid");
  id v19 = v25;
  v24 = (void *)objc_claimAutoreleasedReturnValue([v10 completion]);

  if (!v24) {
    goto LABEL_6;
  }
  v13 = (NSURLComponents *)objc_claimAutoreleasedReturnValue([v10 completion]);
  v15 = -[MSDServerResponse initWithError:](objc_alloc(&OBJC_CLASS___MSDServerResponse), "initWithError:", v19);
  ((void (*)(NSURLComponents *, MSDServerResponse *))v13[2].super.isa)(v13, v15);
LABEL_5:

LABEL_6:
}

- (void)sendRequest:(id)a3 toEndpoint:(id)a4 postData:(BOOL)a5 maxRetry:(int64_t)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_10000AFCC;
  v26[3] = &unk_1000F9450;
  id v12 = v10;
  id v27 = v12;
  v13 = objc_retainBlock(v26);
  if (([v12 isValid] & 1) == 0)
  {
    id v21 = sub_10003A95C();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100090994(v12);
    }
    goto LABEL_14;
  }

  if (v7)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue([v12 getPostData]);
    if (!v14)
    {
      id v15 = sub_10003A95C();
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_100090A0C(v12);
      }
LABEL_14:
      v14 = 0LL;
      goto LABEL_19;
    }
  }

  else
  {
    v14 = 0LL;
  }

  if (v11)
  {
    v17 = (void (**)(void, void))objc_claimAutoreleasedReturnValue( -[MSDServer taskInfoFromCommandRequest:]( self,  "taskInfoFromCommandRequest:",  v12));
    if (v17)
    {
      v18 = v17;
      [v17 setEndpoint:v11];
      [v18 setMaxRetry:a6];
      [v18 setPostData:v14];
      [v18 setHandler:v13];
      id v19 = (MSDServerResponse *)objc_claimAutoreleasedReturnValue(-[MSDServer session](self, "session"));
      -[MSDServerResponse launchTaskWithInfo:](v19, "launchTaskWithInfo:", v18);
      id v20 = 0LL;
      goto LABEL_10;
    }

    id v23 = sub_10003A95C();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100090AFC(v12);
    }
  }

  else
  {
    id v22 = sub_10003A95C();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100090A84(v12);
    }
  }

- (id)taskInfoFromCommandRequest:(id)a3
{
  return 0LL;
}

- (MSDSession)session
{
  return (MSDSession *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setSession:(id)a3
{
}

- (void).cxx_destruct
{
}

@end