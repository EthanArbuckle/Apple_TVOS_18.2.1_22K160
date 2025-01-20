@interface SHMediaLibraryQueryManager
- (SHMediaLibraryClient)client;
- (SHMediaLibraryController)libraryController;
- (SHMediaLibraryQueryManager)initWithClient:(id)a3;
- (void)_libraryInfoWithCompletionHandler:(id)a3;
- (void)_queryLibraryWithParameters:(id)a3 completionHandler:(id)a4;
- (void)setLibraryController:(id)a3;
@end

@implementation SHMediaLibraryQueryManager

- (SHMediaLibraryQueryManager)initWithClient:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SHMediaLibraryQueryManager;
  v6 = -[SHMediaLibraryQueryManager init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_client, a3);
  }

  return v7;
}

- (void)_libraryInfoWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, void, void *))a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryQueryManager client](self, "client"));
  id v6 = [v5 type];

  if (!v6 || v6 == (id)2)
  {
    NSErrorUserInfoKey v12 = NSDebugDescriptionErrorKey;
    v13 = @"Invalid client Bundle ID or Team ID";
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue( +[SHError errorWithCode:underlyingError:keyOverrides:]( &OBJC_CLASS___SHError,  "errorWithCode:underlyingError:keyOverrides:",  400LL,  0LL,  v8));
    v4[2](v4, 0LL, v9);

    goto LABEL_6;
  }

  if (v6 == (id)1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryQueryManager libraryController](self, "libraryController"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10002C1EC;
    v10[3] = &unk_10006D910;
    v11 = v4;
    [v7 _libraryInfoWithCompletionHandler:v10];

    v8 = v11;
LABEL_6:
  }
}

- (void)_queryLibraryWithParameters:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryQueryManager client](self, "client"));
  id v9 = [v8 type];

  if (v9)
  {
    if (v9 == (id)2)
    {
      id v21 = objc_alloc(&OBJC_CLASS___SHMediaLibraryQueryParameters);
      id v10 = [v6 resultsLimit];
      id v11 = [v6 ascending];
      id v12 = [v6 shouldUpdate];
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryQueryManager client](self, "client"));
      v14 = (void *)objc_claimAutoreleasedReturnValue([v13 credentials]);
      v15 = (void *)objc_claimAutoreleasedReturnValue([v14 attribution]);
      v16 = (void *)objc_claimAutoreleasedReturnValue([v15 containingAppBundleIdentifier]);
      id v17 = [v21 initWithResultsLimit:v10 filterOptions:1 ascending:v11 shouldUpdate:v12 providerIdentifier:v16];

      id v6 = v17;
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryQueryManager libraryController](self, "libraryController"));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_10002C488;
    v22[3] = &unk_10006D938;
    id v23 = v7;
    [v18 _queryLibraryWithParameters:v6 completionHandler:v22];

    v19 = v23;
  }

  else
  {
    NSErrorUserInfoKey v24 = NSDebugDescriptionErrorKey;
    v25 = @"Invalid client Bundle ID or Team ID";
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v25,  &v24,  1LL));
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[SHError errorWithCode:underlyingError:keyOverrides:]( &OBJC_CLASS___SHError,  "errorWithCode:underlyingError:keyOverrides:",  400LL,  0LL,  v19));
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0LL, 0LL, v20);
  }
}

- (SHMediaLibraryController)libraryController
{
  libraryController = self->_libraryController;
  if (!libraryController)
  {
    v4 = objc_alloc(&OBJC_CLASS___SHMediaLibraryController);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryQueryManager client](self, "client"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 credentials]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 attribution]);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 containingAppBundleIdentifier]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SHMediaLibraryQueryManager client](self, "client"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 credentials]);
    id v11 = -[SHMediaLibraryController initWithBundleIdentifier:clientType:]( v4,  "initWithBundleIdentifier:clientType:",  v8,  [v10 clientType]);
    id v12 = self->_libraryController;
    self->_libraryController = v11;

    libraryController = self->_libraryController;
  }

  return libraryController;
}

- (void)setLibraryController:(id)a3
{
}

- (SHMediaLibraryClient)client
{
  return self->_client;
}

- (void).cxx_destruct
{
}

@end