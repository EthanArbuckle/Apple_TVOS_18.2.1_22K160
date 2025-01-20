@interface LSApplicationIdentityEnumerator
- (LSApplicationIdentityEnumerator)initWithAppEnumerationOptions:(unint64_t)a3;
- (id)nextObject;
@end

@implementation LSApplicationIdentityEnumerator

- (LSApplicationIdentityEnumerator)initWithAppEnumerationOptions:(unint64_t)a3
{
  CurrentContext = (void **)_LSDatabaseContextGetCurrentContext((LaunchServices::DatabaseContext *)self);
  id v25 = 0LL;
  char v26 = 0;
  id v27 = 0LL;
  +[_LSDServiceDomain defaultServiceDomain]();
  v5 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v5, 0LL);

  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___LSApplicationIdentityEnumerator;
  v7 = -[LSEnumerator _initWithContext:](&v23, sel__initWithContext_, v6);
  if (v7)
  {
    if (v6)
    {
      v8 = -[_LSApplicationRecordEnumerator initWithContext:volumeURL:options:]( objc_alloc(&OBJC_CLASS____LSApplicationRecordEnumerator),  "initWithContext:volumeURL:options:",  v6,  0LL,  a3);
      v9 = (void *)v7[5];
      v7[5] = v8;

      v10 = (void *)v7[7];
      v7[7] = 0LL;

      objc_initWeak(&location, v7);
      v11 = (void *)v7[5];
      v20[0] = MEMORY[0x1895F87A8];
      v20[1] = 3221225472LL;
      v20[2] = __65__LSApplicationIdentityEnumerator_initWithAppEnumerationOptions___block_invoke;
      v20[3] = &unk_189D723B0;
      objc_copyWeak(&v21, &location);
      [v11 setErrorHandler:v20];
      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }

    else
    {
      +[_LSDServiceDomain defaultServiceDomain]();
      v12 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      uint64_t v13 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v12, 0LL);

      if (v13) {
        id v14 = 0LL;
      }
      else {
        id v14 = v27;
      }
      v15 = (void *)v7[4];
      v7[4] = v14;
    }
  }

  v16 = v7;
  if (CurrentContext && v26) {
    _LSContextDestroy(CurrentContext);
  }
  id v17 = v25;
  CurrentContext = 0LL;
  id v25 = 0LL;

  char v26 = 0;
  id v18 = v27;
  id v27 = 0LL;

  return v16;
}

void __65__LSApplicationIdentityEnumerator_initWithAppEnumerationOptions___block_invoke( uint64_t a1,  void *a2)
{
  id v5 = a2;
  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained) {
    _LSEnumeratorFireErrorHandler(WeakRetained, v5);
  }
}

- (id)nextObject
{
  ctxError = self->_ctxError;
  if (ctxError)
  {
    _LSEnumeratorFireErrorHandler((unsigned __int8 *)self, ctxError);
  }

  else
  {
    do
    {
      currentRecordIdentitiesEnumerator = self->_currentRecordIdentitiesEnumerator;
      if (!currentRecordIdentitiesEnumerator
        || (-[NSEnumerator nextObject](currentRecordIdentitiesEnumerator, "nextObject"),
            (id v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0LL))
      {
        NextObject = (LSApplicationRecord *)_LSDBEnumeratorGetNextObject((uint64_t)self->_recordEnumerator);
        currentRecord = self->_currentRecord;
        self->_currentRecord = NextObject;
        v8 = -[LSApplicationRecord identities](self->_currentRecord, "identities");
        [v8 objectEnumerator];
        v9 = (NSEnumerator *)objc_claimAutoreleasedReturnValue();
        v10 = self->_currentRecordIdentitiesEnumerator;
        self->_currentRecordIdentitiesEnumerator = v9;

        -[NSEnumerator nextObject](self->_currentRecordIdentitiesEnumerator, "nextObject");
        id v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v5) {
          continue;
        }
      }

      -[LSEnumerator filter](self, "filter");
      v11 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue();
      char v12 = ((uint64_t (**)(void, void *))v11)[2](v11, v5);

      if ((v12 & 1) != 0) {
        return v5;
      }
    }

    while (self->_currentRecord);
  }

  id v5 = 0LL;
  return v5;
}

- (void).cxx_destruct
{
}

@end