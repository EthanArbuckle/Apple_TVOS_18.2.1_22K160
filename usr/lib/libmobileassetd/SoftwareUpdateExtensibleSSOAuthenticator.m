@interface SoftwareUpdateExtensibleSSOAuthenticator
- (BOOL)authenticationSupported;
- (MABrainSoftwareUpdateExtensibleSSOAuthenticatorDelegate)delegate;
- (NSDictionary)otherParameters;
- (NSString)appIdentifier;
- (NSString)envIdentifier;
- (NSString)interactivity;
- (NSString)username;
- (id)copyQueryItemsWithParameters:(id)a3;
- (void)authenticate;
- (void)setAppIdentifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnvIdentifier:(id)a3;
- (void)setInteractivity:(id)a3;
- (void)setOtherParameters:(id)a3;
- (void)setUsername:(id)a3;
@end

@implementation SoftwareUpdateExtensibleSSOAuthenticator

- (id)copyQueryItemsWithParameters:(id)a3
{
  id v3 = a3;
  v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472LL;
  v9 = __73__SoftwareUpdateExtensibleSSOAuthenticator_copyQueryItemsWithParameters___block_invoke_2;
  v10 = &unk_34DA78;
  id v11 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v12 = &__block_literal_global;
  id v4 = v11;
  [v3 enumerateKeysAndObjectsUsingBlock:&v7];

  id v5 = objc_msgSend(v4, "copy", v7, v8, v9, v10);
  return v5;
}

void __73__SoftwareUpdateExtensibleSSOAuthenticator_copyQueryItemsWithParameters___block_invoke( id a1,  NSMutableArray *a2,  NSString *a3,  NSString *a4)
{
  v9 = a2;
  v6 = a3;
  v7 = a4;
  if (-[NSString length](v7, "length"))
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  v6,  v7));
    if (v8) {
      -[NSMutableArray addObject:](v9, "addObject:", v8);
    }
  }
}

uint64_t __73__SoftwareUpdateExtensibleSSOAuthenticator_copyQueryItemsWithParameters___block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  return (*(uint64_t (**)(void, void, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32),  a2,  a3);
}

- (void)authenticate
{
  id updated = SoftwareUpdateSSOlogInfo();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(updated);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl( &dword_0,  v3,  OS_LOG_TYPE_DEFAULT,  "SoftwareUpdateExtensibleSSOController not supported in this environment\n",  v4,  2u);
  }
}

- (BOOL)authenticationSupported
{
  return 0;
}

- (MABrainSoftwareUpdateExtensibleSSOAuthenticatorDelegate)delegate
{
  return (MABrainSoftwareUpdateExtensibleSSOAuthenticatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSString)appIdentifier
{
  return self->_appIdentifier;
}

- (void)setAppIdentifier:(id)a3
{
}

- (NSString)envIdentifier
{
  return self->_envIdentifier;
}

- (void)setEnvIdentifier:(id)a3
{
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
}

- (NSString)interactivity
{
  return self->_interactivity;
}

- (void)setInteractivity:(id)a3
{
}

- (NSDictionary)otherParameters
{
  return self->_otherParameters;
}

- (void)setOtherParameters:(id)a3
{
}

- (void).cxx_destruct
{
}

@end