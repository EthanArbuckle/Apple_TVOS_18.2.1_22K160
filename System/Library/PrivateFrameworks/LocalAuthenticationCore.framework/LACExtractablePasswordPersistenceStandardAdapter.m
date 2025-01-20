@interface LACExtractablePasswordPersistenceStandardAdapter
- (BOOL)_verifyHasRequiredPasswordLength:(id)a3 error:(id *)a4;
- (BOOL)stashPassword:(id)a3 error:(id *)a4;
- (LACExtractablePasswordPersistenceStandardAdapter)initWithOptions:(id)a3;
- (id)extractPassword:(id *)a3;
- (void)extractPasswordWithCompletion:(id)a3;
- (void)stashPassword:(id)a3 completion:(id)a4;
@end

@implementation LACExtractablePasswordPersistenceStandardAdapter

- (LACExtractablePasswordPersistenceStandardAdapter)initWithOptions:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___LACExtractablePasswordPersistenceStandardAdapter;
  v5 = -[LACExtractablePasswordPersistenceStandardAdapter init](&v10, sel_init);
  if (v5)
  {
    [v4 contextProvider];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v6 createContext];
    context = v5->_context;
    v5->_context = (LACContext *)v7;
  }

  return v5;
}

- (id)extractPassword:(id *)a3
{
  return (id)-[LACContext coreCredentialOfType:error:](self->_context, "coreCredentialOfType:error:", -9LL, a3);
}

- (void)extractPasswordWithCompletion:(id)a3
{
  context = self->_context;
  if (context) {
    -[LACContext coreCredentialOfType:reply:](context, "coreCredentialOfType:reply:", -9LL, a3);
  }
  else {
    (*((void (**)(id, void, void))a3 + 2))(a3, 0LL, 0LL);
  }
}

- (BOOL)stashPassword:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (-[LACExtractablePasswordPersistenceStandardAdapter _verifyHasRequiredPasswordLength:error:]( self,  "_verifyHasRequiredPasswordLength:error:",  v6,  a4))
  {
    context = self->_context;
    id v12 = 0LL;
    char v8 = -[LACContext setCoreCredential:type:error:](context, "setCoreCredential:type:error:", v6, -9LL, &v12);
    id v9 = v12;
    objc_super v10 = v9;
    if (a4 && (v8 & 1) == 0) {
      *a4 = v9;
    }
  }

  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void)stashPassword:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v13 = 0LL;
  BOOL v8 = -[LACExtractablePasswordPersistenceStandardAdapter _verifyHasRequiredPasswordLength:error:]( self,  "_verifyHasRequiredPasswordLength:error:",  v6,  &v13);
  id v9 = v13;
  if (v8)
  {
    context = self->_context;
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __77__LACExtractablePasswordPersistenceStandardAdapter_stashPassword_completion___block_invoke;
    v11[3] = &unk_18A368770;
    id v12 = v7;
    -[LACContext setCoreCredential:type:reply:](context, "setCoreCredential:type:reply:", v6, -9LL, v11);
  }

  else
  {
    (*((void (**)(id, id))v7 + 2))(v7, v9);
  }
}

uint64_t __77__LACExtractablePasswordPersistenceStandardAdapter_stashPassword_completion___block_invoke( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (BOOL)_verifyHasRequiredPasswordLength:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if ([v5 length] && (unint64_t)objc_msgSend(v5, "length") <= 0x80)
  {
    LOBYTE(a4) = 1;
  }

  else if (a4)
  {
    objc_msgSend( NSString,  "stringWithFormat:",  @"The provided data should have between %d and %d bytes",  1,  128);
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[LACError errorWithCode:debugDescription:](&OBJC_CLASS___LACError, "errorWithCode:debugDescription:", -1001LL, v6);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a4) = 0;
  }

  return (char)a4;
}

- (void).cxx_destruct
{
}

@end