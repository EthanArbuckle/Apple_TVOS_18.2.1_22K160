@interface MediaSocialAuthenticationCoordinator
- (BOOL)isFinished;
- (MediaSocialAuthenticationCoordinator)initWithDispatchQueue:(id)a3;
- (MediaSocialAuthenticationDelegate)delegate;
- (id)_enqueueOperationIfNecessaryWithAccountIdentifier:(id)a3;
- (id)_newAuthenticateOperationWithAccountIdentifier:(id)a3;
- (void)_finishResponse:(id)a3;
- (void)authenticateForPostWithIdentifier:(int64_t)a3 accountIdentifier:(id)a4;
- (void)authenticateForUploadWithIdentifier:(int64_t)a3 accountIdentifier:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation MediaSocialAuthenticationCoordinator

- (MediaSocialAuthenticationCoordinator)initWithDispatchQueue:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MediaSocialAuthenticationCoordinator;
  v6 = -[MediaSocialAuthenticationCoordinator init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dispatchQueue, a3);
    v8 = objc_alloc_init(&OBJC_CLASS___ISOperationQueue);
    operationQueue = v7->_operationQueue;
    v7->_operationQueue = v8;

    -[ISOperationQueue setMaxConcurrentOperationCount:](v7->_operationQueue, "setMaxConcurrentOperationCount:", 1LL);
    -[ISOperationQueue setName:]( v7->_operationQueue,  "setName:",  @"com.apple.itunesstored.MediaSocialAuthenticationCoordinator");
  }

  return v7;
}

- (void)authenticateForPostWithIdentifier:(int64_t)a3 accountIdentifier:(id)a4
{
  id v5 = (id)objc_claimAutoreleasedReturnValue( -[MediaSocialAuthenticationCoordinator _enqueueOperationIfNecessaryWithAccountIdentifier:]( self,  "_enqueueOperationIfNecessaryWithAccountIdentifier:",  a4));
  [v5 addPostIdentifier:a3];
}

- (void)authenticateForUploadWithIdentifier:(int64_t)a3 accountIdentifier:(id)a4
{
  id v5 = (id)objc_claimAutoreleasedReturnValue( -[MediaSocialAuthenticationCoordinator _enqueueOperationIfNecessaryWithAccountIdentifier:]( self,  "_enqueueOperationIfNecessaryWithAccountIdentifier:",  a4));
  [v5 addUploadIdentifier:a3];
}

- (BOOL)isFinished
{
  return -[NSMutableArray count](self->_pendingResponses, "count") == 0LL;
}

- (id)_enqueueOperationIfNecessaryWithAccountIdentifier:(id)a3
{
  id v20 = a3;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  v4 = self->_pendingResponses;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v27,  v31,  16LL);
  if (!v5)
  {

LABEL_13:
    v14 = objc_alloc_init(&OBJC_CLASS___MediaSocialAuthenticationResponse);
    -[MediaSocialAuthenticationResponse setAccountIdentifier:](v14, "setAccountIdentifier:", v20);
    pendingResponses = self->_pendingResponses;
    if (!pendingResponses)
    {
      v16 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      v17 = self->_pendingResponses;
      self->_pendingResponses = v16;

      pendingResponses = self->_pendingResponses;
    }

    -[NSMutableArray addObject:](pendingResponses, "addObject:", v14, v20);
    id v18 = -[MediaSocialAuthenticationCoordinator _newAuthenticateOperationWithAccountIdentifier:]( self,  "_newAuthenticateOperationWithAccountIdentifier:",  v20);
    objc_initWeak(&location, v18);
    objc_initWeak(&from, self);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_1000AE08C;
    v21[3] = &unk_10034D6E8;
    objc_copyWeak(&v23, &from);
    objc_copyWeak(&v24, &location);
    v6 = v14;
    v22 = v6;
    [v18 setCompletionBlock:v21];
    -[ISOperationQueue addOperation:](self->_operationQueue, "addOperation:", v18);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);

    goto LABEL_16;
  }

  v6 = 0LL;
  uint64_t v7 = *(void *)v28;
  do
  {
    for (i = 0LL; i != v5; i = (char *)i + 1)
    {
      if (*(void *)v28 != v7) {
        objc_enumerationMutation(v4);
      }
      v9 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "accountIdentifier", v20));
      objc_super v11 = (void *)objc_claimAutoreleasedReturnValue([v9 accountIdentifier]);
      unsigned int v12 = [v10 isEqual:v11];

      if (v12)
      {
        v13 = v9;

        v6 = v13;
      }
    }

    id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v27,  v31,  16LL);
  }

  while (v5);

  if (!v6) {
    goto LABEL_13;
  }
LABEL_16:

  return v6;
}

- (void)_finishResponse:(id)a3
{
  id v6 = a3;
  -[NSMutableArray removeObject:](self->_pendingResponses, "removeObject:");
  if (!-[NSMutableArray count](self->_pendingResponses, "count"))
  {
    pendingResponses = self->_pendingResponses;
    self->_pendingResponses = 0LL;
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MediaSocialAuthenticationCoordinator delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v5, "authenticationCoordinator:didFinishAuthenticationWithResponse:") & 1) != 0) {
    [v5 authenticationCoordinator:self didFinishAuthenticationWithResponse:v6];
  }
}

- (id)_newAuthenticateOperationWithAccountIdentifier:(id)a3
{
  id v3 = a3;
  v4 = -[SSMutableAuthenticationContext initWithAccountIdentifier:]( objc_alloc(&OBJC_CLASS___SSMutableAuthenticationContext),  "initWithAccountIdentifier:",  v3);
  -[SSMutableAuthenticationContext setCanCreateNewAccount:](v4, "setCanCreateNewAccount:", 0LL);
  -[SSMutableAuthenticationContext setCanSetActiveAccount:](v4, "setCanSetActiveAccount:", 0LL);
  -[SSMutableAuthenticationContext setPromptStyle:](v4, "setPromptStyle:", 1LL);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](&OBJC_CLASS___SSAccountStore, "defaultStore"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 accountWithUniqueIdentifier:v3]);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 accountName]);
  if ([v7 length])
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.storeservices"));
    v9 = (void *)objc_claimAutoreleasedReturnValue( [v8 localizedStringForKey:@"MEDIA_SOCIAL_ENTER_PASSWORD_FORMAT_%@" value:&stru_10035EB18 table:@"MediaSocial"]);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v9, v7));
    -[SSMutableAuthenticationContext setReasonDescription:](v4, "setReasonDescription:", v10);
  }

  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.storeservices"));
    v9 = (void *)objc_claimAutoreleasedReturnValue( [v8 localizedStringForKey:@"MEDIA_SOCIAL_ENTER_PASSWORD_NO_ACCOUNT" value:&stru_10035EB18 table:@"MediaSocial"]);
    -[SSMutableAuthenticationContext setReasonDescription:](v4, "setReasonDescription:", v9);
  }

  id v11 = [[ISStoreAuthenticateOperation alloc] initWithAuthenticationContext:v4];
  return v11;
}

- (MediaSocialAuthenticationDelegate)delegate
{
  return (MediaSocialAuthenticationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end