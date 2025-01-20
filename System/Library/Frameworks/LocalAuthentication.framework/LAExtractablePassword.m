@interface LAExtractablePassword
- (BOOL)stashPassword:(id)a3 error:(id *)a4;
- (LAExtractablePassword)init;
- (id)extractPassword:(id *)a3;
- (void)extractPasswordWithCompletion:(id)a3;
- (void)stashPassword:(id)a3 completion:(id)a4;
@end

@implementation LAExtractablePassword

- (LAExtractablePassword)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___LAExtractablePassword;
  v2 = -[LAExtractablePassword init](&v8, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1896107C8];
    __29__LAExtractablePassword_init__block_invoke();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = [v3 passwordPersistenceWithOptions:v4];
    persistence = v2->_persistence;
    v2->_persistence = (LACExtractablePasswordPersistence *)v5;
  }

  return v2;
}

id __29__LAExtractablePassword_init__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1896107D0]);
  v1 = objc_alloc_init(&OBJC_CLASS___LAContextProvider);
  v2 = (void *)[v0 initWithContextProvider:v1];

  return v2;
}

- (void)extractPasswordWithCompletion:(id)a3
{
}

- (id)extractPassword:(id *)a3
{
  return (id)-[LACExtractablePasswordPersistence extractPassword:](self->_persistence, "extractPassword:", a3);
}

- (BOOL)stashPassword:(id)a3 error:(id *)a4
{
  return -[LACExtractablePasswordPersistence stashPassword:error:](self->_persistence, "stashPassword:error:", a3, a4);
}

- (void)stashPassword:(id)a3 completion:(id)a4
{
}

- (void).cxx_destruct
{
}

@end