@interface TKSEPClientTokenSession
- (BOOL)forceSystemSession;
- (TKSEPClientTokenSession)initWithToken:(id)a3 LAContext:(id)a4 parameters:(id)a5 error:(id *)a6;
- (TKTokenID)tokenID;
- (id)createObjectWithAttributes:(id)a3 error:(id *)a4;
- (id)objectForObjectID:(id)a3 error:(id *)a4;
@end

@implementation TKSEPClientTokenSession

- (TKTokenID)tokenID
{
  v3 = objc_alloc(&OBJC_CLASS___TKTokenID);
  v4 = -[TKClientTokenSession token](self, "token");
  [v4 tokenID];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TKTokenID initWithTokenID:](v3, "initWithTokenID:", v5);

  return v6;
}

- (BOOL)forceSystemSession
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKeyedSubscript:@"forceSystemSession"];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  char v4 = [v3 BOOLValue];

  return v4;
}

- (TKSEPClientTokenSession)initWithToken:(id)a3 LAContext:(id)a4 parameters:(id)a5 error:(id *)a6
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TKSEPClientTokenSession;
  id v7 = -[TKClientTokenSession _initWithToken:LAContext:parameters:error:]( &v14,  sel__initWithToken_LAContext_parameters_error_,  a3,  a4,  a5);
  if (!v7) {
    goto LABEL_3;
  }
  v8 = +[TKSEPClientToken builtinTokenIDs](&OBJC_CLASS___TKSEPClientToken, "builtinTokenIDs");
  [v7 tokenID];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 stringRepresentation];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  char v11 = [v8 containsObject:v10];

  if ((v11 & 1) == 0)
  {
    if (a6)
    {
      [MEMORY[0x189607870] errorWithDomain:@"CryptoTokenKit" code:-1 userInfo:0];
      v12 = 0LL;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v12 = 0LL;
    }
  }

  else
  {
LABEL_3:
    v12 = (TKSEPClientTokenSession *)v7;
  }

  return v12;
}

- (id)createObjectWithAttributes:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = _os_activity_create( &dword_186E58000,  "SEPClientObject: createKey",  MEMORY[0x1895F8D48],  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v7, &state);
  id v16 = 0LL;
  v8 = -[TKClientTokenSession processObjectCreationAttributes:authContext:error:]( self,  "processObjectCreationAttributes:authContext:error:",  v6,  &v16,  a4);
  id v9 = v16;

  if (!v8)
  {
    v12 = 0LL;
    goto LABEL_5;
  }

  v10 = objc_alloc(&OBJC_CLASS___TKSEPKey);
  char v11 = (void *)[v8 mutableCopy];
  v12 = -[TKSEPKey initWithAttributes:authContext:forceSystemSession:error:]( v10,  "initWithAttributes:authContext:forceSystemSession:error:",  v11,  v9,  -[TKSEPClientTokenSession forceSystemSession](self, "forceSystemSession"),  a4);
  v13 = -[TKClientTokenSession LAContext](self, "LAContext");
  -[TKSEPKey setAuthContext:](v12, "setAuthContext:", v13);

  if (!v12)
  {
LABEL_5:
    objc_super v14 = 0LL;
    goto LABEL_6;
  }

  objc_super v14 = -[TKSEPClientTokenObject initWithSession:key:error:]( objc_alloc(&OBJC_CLASS___TKSEPClientTokenObject),  "initWithSession:key:error:",  self,  v12,  a4);
LABEL_6:

  os_activity_scope_leave(&state);
  return v14;
}

- (id)objectForObjectID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = _os_activity_create(&dword_186E58000, "SEPClientObject: getKey", MEMORY[0x1895F8D48], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v7, &v15);
  v8 = -[TKSEPClientTokenSession tokenID](self, "tokenID");
  [v8 decodedKeyID:v6 error:a4];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_alloc(&OBJC_CLASS___TKSEPKey);
    -[TKClientTokenSession LAContext](self, "LAContext");
    char v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[TKSEPKey initWithObjectID:authContext:forceSystemSession:error:]( v10,  "initWithObjectID:authContext:forceSystemSession:error:",  v9,  v11,  -[TKSEPClientTokenSession forceSystemSession](self, "forceSystemSession"),  a4);

    if (v12) {
      v13 = -[TKSEPClientTokenObject initWithSession:key:error:]( objc_alloc(&OBJC_CLASS___TKSEPClientTokenObject),  "initWithSession:key:error:",  self,  v12,  a4);
    }
    else {
      v13 = 0LL;
    }
  }

  else
  {
    v13 = 0LL;
  }

  os_activity_scope_leave(&v15);
  return v13;
}

@end