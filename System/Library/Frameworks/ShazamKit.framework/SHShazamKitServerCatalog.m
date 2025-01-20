@interface SHShazamKitServerCatalog
+ (BOOL)validateClientIdentifier:(id)a3;
- (NSString)clientIdentifier;
- (NSString)installationID;
- (SHServerResponseContextBuilder)contextBuilder;
- (SHShazamKitServerCatalog)initWithClientIdentifier:(id)a3 clientType:(int64_t)a4 installationID:(id)a5;
- (SHShazamKitServerURLBuilder)URLBuilder;
- (id)_createMatcher;
- (id)_initWithConfiguration:(id)a3 installationID:(id)a4;
- (int64_t)clientType;
- (void)loadConfiguration:(id)a3;
- (void)loadContext:(id)a3;
- (void)setContextBuilder:(id)a3;
- (void)setURLBuilder:(id)a3;
@end

@implementation SHShazamKitServerCatalog

- (SHShazamKitServerCatalog)initWithClientIdentifier:(id)a3 clientType:(int64_t)a4 installationID:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if (objc_msgSend((id)objc_opt_class(self, v11), "validateClientIdentifier:", v9))
  {
    id v12 = objc_alloc_init(&OBJC_CLASS___SHCatalogConfiguration);
    [v12 setInstallationID:v10];
    v26.receiver = self;
    v26.super_class = (Class)&OBJC_CLASS___SHShazamKitServerCatalog;
    v13 = -[SHShazamKitServerCatalog initWithConfiguration:error:](&v26, "initWithConfiguration:error:", v12, 0LL);
    v14 = v13;
    if (v13)
    {
      objc_storeStrong((id *)&v13->_clientIdentifier, a3);
      v14->_clientType = a4;
      objc_storeStrong((id *)&v14->_installationID, a5);
      v15 = objc_alloc_init(&OBJC_CLASS___SHShazamKitServerURLBuilder);
      URLBuilder = v14->_URLBuilder;
      v14->_URLBuilder = v15;

      v17 = objc_alloc_init(&OBJC_CLASS___SHServerResponseContextBuilder);
      contextBuilder = v14->_contextBuilder;
      v14->_contextBuilder = v17;
    }

    return v14;
  }

  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ is not a valid client identifier",  v9));
    id v21 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInvalidArgumentException,  v20,  0LL));

    objc_exception_throw(v21);
    return (SHShazamKitServerCatalog *)-[SHShazamKitServerCatalog _initWithConfiguration:installationID:]( v22,  v23,  v24,  v25);
  }

- (id)_initWithConfiguration:(id)a3 installationID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInternalInconsistencyException,  @"-[_initWithConfiguration:installationID:] should not be used on this class",  0LL));
  objc_exception_throw(v7);
  -[SHShazamKitServerCatalog loadConfiguration:](v8, v9, v10);
  return result;
}

- (void)loadConfiguration:(id)a3
{
  id v4 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[SHShazamKitServerCatalog URLBuilder](self, "URLBuilder"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHShazamKitServerCatalog clientIdentifier](self, "clientIdentifier"));
  int64_t v6 = -[SHShazamKitServerCatalog clientType](self, "clientType");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SHShazamKitServerCatalog installationID](self, "installationID"));
  [v8 loadMatchEndpointForClientIdentifier:v5 clientType:v6 installationID:v7 callback:v4];
}

- (void)loadContext:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SHShazamKitServerCatalog contextBuilder](self, "contextBuilder"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHShazamKitServerCatalog clientIdentifier](self, "clientIdentifier"));
  [v6 loadContextForClientIdentifier:v5 completion:v4];
}

- (id)_createMatcher
{
  return  -[SHShazamKitServerMatcher initWithCatalog:]( objc_alloc(&OBJC_CLASS___SHShazamKitServerMatcher),  "initWithCatalog:",  self);
}

+ (BOOL)validateClientIdentifier:(id)a3
{
  return [a3 length] != 0;
}

- (NSString)installationID
{
  return self->_installationID;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (int64_t)clientType
{
  return self->_clientType;
}

- (SHShazamKitServerURLBuilder)URLBuilder
{
  return self->_URLBuilder;
}

- (void)setURLBuilder:(id)a3
{
}

- (SHServerResponseContextBuilder)contextBuilder
{
  return self->_contextBuilder;
}

- (void)setContextBuilder:(id)a3
{
}

- (void).cxx_destruct
{
}

@end