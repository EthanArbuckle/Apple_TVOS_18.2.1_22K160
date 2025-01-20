@interface LSMIResultRegistrantServerDatabaseContextProviding
- (LSMIResultRegistrantServerDatabaseContextProviding)init;
- (id).cxx_construct;
- (id)databaseContextWithError:(id *)a3;
- (void)armSaveTimerIfNecessary:(id)a3;
@end

@implementation LSMIResultRegistrantServerDatabaseContextProviding

- (LSMIResultRegistrantServerDatabaseContextProviding)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___LSMIResultRegistrantServerDatabaseContextProviding;
  return -[LSMIResultRegistrantServerDatabaseContextProviding init](&v4, sel_init);
}

- (id)databaseContextWithError:(id *)a3
{
  p_ctx = &self->_ctx;
  +[_LSDServiceDomain defaultServiceDomain]();
  v6 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)p_ctx, v6, 0LL);

  if (v7)
  {
    v8 = -[LSMIResultRegistrantTrueDatabaseContext initWithDatabase:]( objc_alloc(&OBJC_CLASS___LSMIResultRegistrantTrueDatabaseContext),  "initWithDatabase:",  *v7);
    v9 = 0LL;
    if (!a3) {
      goto LABEL_10;
    }
    goto LABEL_8;
  }

  +[_LSDServiceDomain defaultServiceDomain]();
  v10 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)p_ctx, v10, 0LL);

  if (v11) {
    v9 = 0LL;
  }
  else {
    v9 = self->_ctx._error;
  }
  v8 = 0LL;
  if (a3)
  {
LABEL_8:
    if (!v8) {
      *a3 = v9;
    }
  }

- (void)armSaveTimerIfNecessary:(id)a3
{
  id v3 = a3;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __78__LSMIResultRegistrantServerDatabaseContextProviding_armSaveTimerIfNecessary___block_invoke;
  v5[3] = &unk_189D78DA0;
  id v6 = v3;
  id v4 = v3;
  _LSArmSaveTimerWithObserver(5, v5);
}

void __78__LSMIResultRegistrantServerDatabaseContextProviding_armSaveTimerIfNecessary___block_invoke( uint64_t a1,  uint64_t a2,  void *a3,  void *a4)
{
  id v8 = a3;
  id v6 = a4;
  if (v8) {
    v7 = -[LSMIResultRegistrantTrueDatabaseContext initWithDatabase:]( objc_alloc(&OBJC_CLASS___LSMIResultRegistrantTrueDatabaseContext),  "initWithDatabase:",  v8);
  }
  else {
    v7 = 0LL;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void).cxx_destruct
{
  contextPointer = self->_ctx._contextPointer;
  db = self->_ctx._contextStorage.db;
  self->_ctx._contextPointer = 0LL;
  self->_ctx._contextStorage.db = 0LL;

  self->_ctx._created = 0;
  error = self->_ctx._error;
  self->_ctx._error = 0LL;
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0LL;
  *((void *)self + 1) = 0LL;
  *((void *)self + 2) = 0LL;
  *((_BYTE *)self + 24) = 0;
  return self;
}

@end