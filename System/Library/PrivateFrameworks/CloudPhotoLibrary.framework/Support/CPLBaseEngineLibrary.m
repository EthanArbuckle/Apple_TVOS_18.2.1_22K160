@interface CPLBaseEngineLibrary
- (BOOL)createLibraryWithError:(id *)a3;
- (id)componentName;
- (void)closeAndDeactivate:(BOOL)a3 completionHandler:(id)a4;
- (void)getStatusDictionaryWithCompletionHandler:(id)a3;
- (void)getStatusWithCompletionHandler:(id)a3;
- (void)openWithCompletionHandler:(id)a3;
@end

@implementation CPLBaseEngineLibrary

- (BOOL)createLibraryWithError:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLBaseEngineLibrary abstractObject](self, "abstractObject"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 clientLibraryBaseURL]);
  LOBYTE(a3) = [v5 createDirectoryAtURL:v7 withIntermediateDirectories:1 attributes:0 error:a3];

  return (char)a3;
}

- (void)openWithCompletionHandler:(id)a3
{
  id v8 = 0LL;
  v4 = (void (**)(id, void))a3;
  LODWORD(self) = -[CPLBaseEngineLibrary createLibraryWithError:](self, "createLibraryWithError:", &v8);
  id v5 = v8;
  v6 = v5;
  if ((_DWORD)self) {
    id v7 = 0LL;
  }
  else {
    id v7 = v5;
  }
  ((void (**)(id, id))v4)[2](v4, v7);
}

- (void)closeAndDeactivate:(BOOL)a3 completionHandler:(id)a4
{
}

- (id)componentName
{
  return @"engine";
}

- (void)getStatusWithCompletionHandler:(id)a3
{
  v3 = (void (**)(id, id, void))a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[CPLTransaction transactions](&OBJC_CLASS___CPLTransaction, "transactions"));
  v3[2](v3, v4, 0LL);
}

- (void)getStatusDictionaryWithCompletionHandler:(id)a3
{
  id v7 = @"transactions";
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  +[CPLTransaction transactionCount](&OBJC_CLASS___CPLTransaction, "transactionCount")));
  id v8 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));
  (*((void (**)(id, void *, void))a3 + 2))(v4, v6, 0LL);
}

@end