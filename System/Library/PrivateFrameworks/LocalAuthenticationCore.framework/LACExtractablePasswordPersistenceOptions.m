@interface LACExtractablePasswordPersistenceOptions
- (LACContextProviding)contextProvider;
- (LACExtractablePasswordPersistenceOptions)initWithContextProvider:(id)a3;
@end

@implementation LACExtractablePasswordPersistenceOptions

- (LACExtractablePasswordPersistenceOptions)initWithContextProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___LACExtractablePasswordPersistenceOptions;
  v6 = -[LACExtractablePasswordPersistenceOptions init](&v9, sel_init);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_contextProvider, a3);
  }

  return v7;
}

- (LACContextProviding)contextProvider
{
  return self->_contextProvider;
}

- (void).cxx_destruct
{
}

@end