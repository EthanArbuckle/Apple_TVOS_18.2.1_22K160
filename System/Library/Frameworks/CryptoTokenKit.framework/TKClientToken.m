@interface TKClientToken
+ (NSArray)builtinTokenIDs;
- (BOOL)_testing_noAutomaticReconnect;
- (NSString)tokenID;
- (NSXPCListenerEndpoint)SEPKeyEndpoint;
- (NSXPCListenerEndpoint)configurationEndpoint;
- (NSXPCListenerEndpoint)endpoint;
- (NSXPCListenerEndpoint)watcherEndpoint;
- (TKClientToken)initWithTokenID:(id)a3;
- (TKClientToken)initWithTokenID:(id)a3 serverEndpoint:(id)a4 targetUID:(id)a5;
- (id)_initWithTokenID:(id)a3;
- (id)sessionWithLAContext:(id)a3 error:(id *)a4;
- (void)set_testing_noAutomaticReconnect:(BOOL)a3;
@end

@implementation TKClientToken

- (id)_initWithTokenID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TKClientToken;
  v6 = -[TKClientToken init](&v9, sel_init);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_tokenID, a3);
  }

  return v7;
}

- (TKClientToken)initWithTokenID:(id)a3
{
  return -[TKClientToken initWithTokenID:serverEndpoint:targetUID:]( self,  "initWithTokenID:serverEndpoint:targetUID:",  a3,  0LL,  0LL);
}

- (TKClientToken)initWithTokenID:(id)a3 serverEndpoint:(id)a4 targetUID:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  BOOL v11 = +[TKSEPClientToken handlesTokenID:](&OBJC_CLASS___TKSEPClientToken, "handlesTokenID:", v10);
  v12 = off_189F89778;
  if (v11) {
    v12 = off_189F89788;
  }
  v13 = (TKClientToken *)[objc_alloc(*v12) initWithTokenID:v10 serverEndpoint:v9 targetUID:v8];

  return v13;
}

- (id)sessionWithLAContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = objc_alloc(&OBJC_CLASS___TKClientTokenSession);
  id v8 = -[TKClientTokenSession initWithToken:LAContext:parameters:error:]( v7,  "initWithToken:LAContext:parameters:error:",  self,  v6,  MEMORY[0x189604A60],  a4);

  return v8;
}

+ (NSArray)builtinTokenIDs
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[TKExtensionClientToken builtinTokenIDs](&OBJC_CLASS___TKExtensionClientToken, "builtinTokenIDs");
  [v2 arrayByAddingObjectsFromArray:v3];
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSString)tokenID
{
  return self->_tokenID;
}

- (NSXPCListenerEndpoint)endpoint
{
  return self->_endpoint;
}

- (NSXPCListenerEndpoint)configurationEndpoint
{
  return self->_configurationEndpoint;
}

- (NSXPCListenerEndpoint)watcherEndpoint
{
  return self->_watcherEndpoint;
}

- (NSXPCListenerEndpoint)SEPKeyEndpoint
{
  return self->_SEPKeyEndpoint;
}

- (BOOL)_testing_noAutomaticReconnect
{
  return self->__testing_noAutomaticReconnect;
}

- (void)set_testing_noAutomaticReconnect:(BOOL)a3
{
  self->__testing_noAutomaticReconnect = a3;
}

- (void).cxx_destruct
{
}

@end