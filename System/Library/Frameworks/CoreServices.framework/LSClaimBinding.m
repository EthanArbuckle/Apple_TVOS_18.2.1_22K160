@interface LSClaimBinding
+ (BOOL)supportsSecureCoding;
+ (id)_claimBindingsForBindingEvaluator:(const void *)a3 error:(id *)a4;
+ (id)claimBindingsWithConfiguration:(id)a3 error:(id *)a4;
+ (id)claimBindingsWithTypeIdentifier:(id)a3 error:(id *)a4;
+ (id)claimBindingsWithURL:(id)a3 error:(id *)a4;
+ (id)new;
- (LSBundleRecord)bundleRecord;
- (LSClaimBinding)init;
- (LSClaimBinding)initWithCoder:(id)a3;
- (LSClaimBinding)initWithConfiguration:(id)a3 error:(id *)a4;
- (LSClaimBinding)initWithTypeIdentifier:(id)a3 error:(id *)a4;
- (LSClaimBinding)initWithURL:(id)a3 error:(id *)a4;
- (LSClaimRecord)claimRecord;
- (UTTypeRecord)typeRecord;
- (id)_initWithBindingEvaluator:(const void *)a3 error:(id *)a4;
- (id)_initWithClaimRecord:(id)a3 typeRecord:(id)a4 bundleRecord:(id)a5;
- (id)_initWithContext:(LSContext *)a3 binding:(const LSBinding *)a4 coreTypesBundleRecord:(id *)a5 typeRecord:(id)a6 error:(id *)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (void)detach;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LSClaimBinding

+ (id)new
{
}

- (LSClaimBinding)init
{
}

- (LSClaimBinding)initWithTypeIdentifier:(id)a3 error:(id *)a4
{
  v8[21] = *MEMORY[0x1895F89C0];
  LaunchServices::BindingEvaluator::CreateWithUTI( (LaunchServices::BindingEvaluator *)a3,  0LL,  (LaunchServices::BindingEvaluator *)v8);
  v6 = -[LSClaimBinding _initWithBindingEvaluator:error:](self, "_initWithBindingEvaluator:error:", v8, a4);
  LaunchServices::BindingEvaluator::~BindingEvaluator((LaunchServices::BindingEvaluator *)v8);
  return v6;
}

+ (id)claimBindingsWithTypeIdentifier:(id)a3 error:(id *)a4
{
  v8[21] = *MEMORY[0x1895F89C0];
  LaunchServices::BindingEvaluator::CreateWithUTI( (LaunchServices::BindingEvaluator *)a3,  0LL,  (LaunchServices::BindingEvaluator *)v8);
  [a1 _claimBindingsForBindingEvaluator:v8 error:a4];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LaunchServices::BindingEvaluator::~BindingEvaluator((LaunchServices::BindingEvaluator *)v8);
  return v6;
}

- (LSClaimBinding)initWithURL:(id)a3 error:(id *)a4
{
  v8[21] = *(FSNode **)MEMORY[0x1895F89C0];
  LaunchServices::BindingEvaluator::CreateWithURL((LaunchServices::BindingEvaluator *)a3, v8);
  v6 = -[LSClaimBinding _initWithBindingEvaluator:error:](self, "_initWithBindingEvaluator:error:", v8, a4);
  LaunchServices::BindingEvaluator::~BindingEvaluator((LaunchServices::BindingEvaluator *)v8);
  return v6;
}

+ (id)claimBindingsWithURL:(id)a3 error:(id *)a4
{
  v8[21] = *(FSNode **)MEMORY[0x1895F89C0];
  LaunchServices::BindingEvaluator::CreateWithURL((LaunchServices::BindingEvaluator *)a3, v8);
  [a1 _claimBindingsForBindingEvaluator:v8 error:a4];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LaunchServices::BindingEvaluator::~BindingEvaluator((LaunchServices::BindingEvaluator *)v8);
  return v6;
}

- (id)_initWithClaimRecord:(id)a3 typeRecord:(id)a4 bundleRecord:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___LSClaimBinding;
  v8 = -[LSClaimBinding init](&v11, sel_init);
  p_isa = (id *)&v8->super.isa;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_claimRecord, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
  }

  return p_isa;
}

- (id)_initWithContext:(LSContext *)a3 binding:(const LSBinding *)a4 coreTypesBundleRecord:(id *)a5 typeRecord:(id)a6 error:(id *)a7
{
  v31[1] = *MEMORY[0x1895F89C0];
  if (a3)
  {
    if (a4) {
      goto LABEL_3;
    }
LABEL_22:
    [MEMORY[0x1896077D8] currentHandler];
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    [v24 handleFailureInMethod:a2, self, @"LSClaimRecord.mm", 239, @"Invalid parameter not satisfying: %@", @"binding != NULL" object file lineNumber description];

    if (!self) {
      goto LABEL_23;
    }
    goto LABEL_4;
  }

  [MEMORY[0x1896077D8] currentHandler];
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  [v23 handleFailureInMethod:a2, self, @"LSClaimRecord.mm", 238, @"Invalid parameter not satisfying: %@", @"ctx != NULL" object file lineNumber description];

  if (!a4) {
    goto LABEL_22;
  }
LABEL_3:
  if (!self)
  {
LABEL_23:

    if (a7)
    {
      uint64_t v30 = *MEMORY[0x189607490];
      v31[0] = @"The claim record was bound to an unknown bundle record.";
      [MEMORY[0x189603F68] dictionaryWithObjects:v31 forKeys:&v30 count:1];
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -10817LL,  (uint64_t)"-[LSClaimBinding _initWithContext:binding:coreTypesBundleRecord:typeRecord:error:]",  279LL,  v25);
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }

    v20 = 0LL;
    id v15 = 0LL;
    goto LABEL_26;
  }

+ (id)_claimBindingsForBindingEvaluator:(const void *)a3 error:(id *)a4
{
  CurrentContext = (void **)_LSDatabaseContextGetCurrentContext((LaunchServices::DatabaseContext *)a1);
  id v26 = 0LL;
  char v27 = 0;
  id v28 = 0LL;
  +[_LSDServiceDomain defaultServiceDomain]();
  v6 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  v7 = (LSContext *)LaunchServices::Database::Context::_get( (LaunchServices::Database::Context *)&CurrentContext,  v6,  0LL);

  if (v7)
  {
    v23 = 0LL;
    id v24 = 0LL;
    LaunchServices::BindingEvaluator::evaluateBindings((LaunchServices::BindingEvaluator *)a3, v7, &v23, a4, &v21);
    if (v21 == v22)
    {
      v13 = 0LL;
    }

    else
    {
      id v8 = objc_alloc_init(MEMORY[0x189603FA8]);
      uint64_t v9 = v21;
      for (uint64_t i = v22; v9 != i; v9 += 48LL)
      {
        objc_super v11 = objc_alloc(&OBJC_CLASS___LSClaimBinding);
        id v12 = -[LSClaimBinding _initWithContext:binding:coreTypesBundleRecord:typeRecord:error:]( v11,  "_initWithContext:binding:coreTypesBundleRecord:typeRecord:error:",  v7,  v9,  &v24,  v23,  0LL);
        if (v12) {
          [v8 addObject:v12];
        }
      }

      v13 = (void *)[v8 copy];
    }

    v29 = (void **)&v21;
    std::vector<LSBinding>::__destroy_vector::operator()[abi:nn180100](&v29);
  }

  else if (a4)
  {
    +[_LSDServiceDomain defaultServiceDomain]();
    v14 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v14, 0LL);

    if (v15) {
      id v16 = 0LL;
    }
    else {
      id v16 = v28;
    }
    v13 = 0LL;
    *a4 = v16;
  }

  else
  {
    v13 = 0LL;
  }

  id v17 = v13;
  if (CurrentContext && v27) {
    _LSContextDestroy(CurrentContext);
  }
  id v18 = v26;
  CurrentContext = 0LL;
  id v26 = 0LL;

  char v27 = 0;
  id v19 = v28;
  id v28 = 0LL;

  return v17;
}

- (id)_initWithBindingEvaluator:(const void *)a3 error:(id *)a4
{
  CurrentContext = (void **)_LSDatabaseContextGetCurrentContext((LaunchServices::DatabaseContext *)self);
  id v22 = 0LL;
  char v23 = 0;
  id v24 = 0LL;
  +[_LSDServiceDomain defaultServiceDomain]();
  v7 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
  id v8 = (LSContext *)LaunchServices::Database::Context::_get( (LaunchServices::Database::Context *)&CurrentContext,  v7,  0LL);

  if (v8)
  {
    id v19 = 0LL;
    id v20 = 0LL;
    LaunchServices::BindingEvaluator::getBestBinding(v17, (LaunchServices::BindingEvaluator *)a3, v8, &v19, a4);
    if (v18)
    {
      id v9 = -[LSClaimBinding _initWithContext:binding:coreTypesBundleRecord:typeRecord:error:]( self,  "_initWithContext:binding:coreTypesBundleRecord:typeRecord:error:",  v8,  v17,  &v20,  v19,  a4);
    }

    else
    {

      id v9 = 0LL;
    }

    if (v18)
    {
    }
  }

  else
  {

    if (a4)
    {
      +[_LSDServiceDomain defaultServiceDomain]();
      v10 = (_LSDServiceDomain *)objc_claimAutoreleasedReturnValue();
      uint64_t v11 = LaunchServices::Database::Context::_get((LaunchServices::Database::Context *)&CurrentContext, v10, 0LL);

      if (v11) {
        id v12 = 0LL;
      }
      else {
        id v12 = v24;
      }
      id v9 = 0LL;
      *a4 = v12;
    }

    else
    {
      id v9 = 0LL;
    }
  }

  id v13 = v9;
  if (CurrentContext && v23) {
    _LSContextDestroy(CurrentContext);
  }
  id v14 = v22;
  CurrentContext = 0LL;
  id v22 = 0LL;

  char v23 = 0;
  id v15 = v24;
  id v24 = 0LL;

  return v13;
}

- (void)detach
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (LSClaimBinding)initWithCoder:(id)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"typeRecord");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"bundleRecord");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = -[LSClaimBinding _initWithClaimRecord:typeRecord:bundleRecord:]( self,  "_initWithClaimRecord:typeRecord:bundleRecord:",  v5,  v6,  v7);

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = -[LSClaimRecord copyWithZone:](self->_claimRecord, "copyWithZone:");
  id v6 = -[LSRecord copyWithZone:](self->_typeRecord, "copyWithZone:", a3);
  id v7 = -[LSBundleRecord copyWithZone:](self->_bundleRecord, "copyWithZone:", a3);
  id v8 = -[LSClaimBinding _initWithClaimRecord:typeRecord:bundleRecord:]( +[LSClaimBinding allocWithZone:](&OBJC_CLASS___LSClaimBinding, "allocWithZone:", a3),  "_initWithClaimRecord:typeRecord:bundleRecord:",  v5,  v6,  v7);

  return v8;
}

- (LSClaimRecord)claimRecord
{
  return (LSClaimRecord *)objc_getProperty(self, a2, 8LL, 1);
}

- (UTTypeRecord)typeRecord
{
  return (UTTypeRecord *)objc_getProperty(self, a2, 16LL, 1);
}

- (LSBundleRecord)bundleRecord
{
  return (LSBundleRecord *)objc_getProperty(self, a2, 24LL, 1);
}

- (void).cxx_destruct
{
}

- (LSClaimBinding)initWithConfiguration:(id)a3 error:(id *)a4
{
  v8[21] = *MEMORY[0x1895F89C0];
  CreateBindingEvaluatorWithConfiguration((LSClaimBindingConfiguration *)a3, (LaunchServices::BindingEvaluator *)v8);
  id v6 = -[LSClaimBinding _initWithBindingEvaluator:error:](self, "_initWithBindingEvaluator:error:", v8, a4);
  LaunchServices::BindingEvaluator::~BindingEvaluator((LaunchServices::BindingEvaluator *)v8);
  return v6;
}

+ (id)claimBindingsWithConfiguration:(id)a3 error:(id *)a4
{
  v8[21] = *MEMORY[0x1895F89C0];
  CreateBindingEvaluatorWithConfiguration((LSClaimBindingConfiguration *)a3, (LaunchServices::BindingEvaluator *)v8);
  [a1 _claimBindingsForBindingEvaluator:v8 error:a4];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  LaunchServices::BindingEvaluator::~BindingEvaluator((LaunchServices::BindingEvaluator *)v8);
  return v6;
}

@end