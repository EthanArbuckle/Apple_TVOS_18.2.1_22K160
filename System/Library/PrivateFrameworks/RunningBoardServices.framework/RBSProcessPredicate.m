@interface RBSProcessPredicate
+ (BOOL)supportsRBSXPCSecureCoding;
+ (id)predicate;
+ (id)predicateForClearTheBoard;
+ (id)predicateForMemoryMonitor;
+ (id)predicateForSymptomsd;
+ (id)predicateMatching:(id)a3;
+ (id)predicateMatchingAnyPredicate:(id)a3;
+ (id)predicateMatchingAuid:(unsigned int)a3;
+ (id)predicateMatchingBeforeTranslocationBundlePath:(id)a3;
+ (id)predicateMatchingBundleIdentifier:(id)a3;
+ (id)predicateMatchingBundleIdentifiers:(id)a3;
+ (id)predicateMatchingDextsBundledWithBundleID:(id)a3;
+ (id)predicateMatchingEuid:(unsigned int)a3;
+ (id)predicateMatchingExecPathStartsWith:(id)a3;
+ (id)predicateMatchingExtensionPoint:(id)a3;
+ (id)predicateMatchingHandle:(id)a3;
+ (id)predicateMatchingHostIdentifier:(id)a3;
+ (id)predicateMatchingIdentifier:(id)a3;
+ (id)predicateMatchingIdentifiers:(id)a3;
+ (id)predicateMatchingIdentity:(id)a3;
+ (id)predicateMatchingJobLabel:(id)a3;
+ (id)predicateMatchingLSApplicationIdentity:(id)a3;
+ (id)predicateMatchingLaunchServicesProcesses;
+ (id)predicateMatchingPlatform:(int)a3;
+ (id)predicateMatchingPredicates:(id)a3;
+ (id)predicateMatchingProcessTypeApplication;
+ (id)predicateMatchingServiceName:(id)a3;
+ (id)predicateMatchingSuspendableProcesses;
+ (id)predicateMatchingTarget:(id)a3;
+ (id)predicateNotMatchingPredicate:(id)a3;
+ (id)predicatePowerLogProcesses;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesProcess:(id)a3;
- (NSString)beforeTranslocationBundlePath;
- (NSString)bundleIdentifier;
- (NSString)description;
- (NSString)extensionPoint;
- (NSString)jobLabel;
- (NSString)serviceName;
- (RBSProcessIdentity)processIdentity;
- (RBSProcessPredicate)initWithPredicate:(id)a3;
- (RBSProcessPredicate)initWithRBSXPCCoder:(id)a3;
- (RBSProcessPredicateImpl)predicate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)processIdentifier;
- (id)processIdentifiers;
- (unint64_t)hash;
- (unsigned)auid;
- (unsigned)euid;
- (void)encodeWithRBSXPCCoder:(id)a3;
@end

@implementation RBSProcessPredicate

+ (id)predicateMatchingProcessTypeApplication
{
  v2 = objc_alloc_init(&OBJC_CLASS___RBSProcessPredicateTypeApplication);
  v3 = +[RBSProcessPredicate predicateMatching:](&OBJC_CLASS___RBSProcessPredicate, "predicateMatching:", v2);
  return v3;
}

+ (id)predicatePowerLogProcesses
{
  return +[RBSProcessReportedProcesses reportedPredicate]( &OBJC_CLASS___RBSProcessReportedProcesses,  "reportedPredicate");
}

+ (id)predicateForSymptomsd
{
  return +[RBSProcessReportedProcesses reportedPredicate]( &OBJC_CLASS___RBSProcessReportedProcesses,  "reportedPredicate");
}

+ (id)predicateForMemoryMonitor
{
  return +[RBSProcessReportedProcesses reportedPredicate]( &OBJC_CLASS___RBSProcessReportedProcesses,  "reportedPredicate");
}

+ (id)predicateForClearTheBoard
{
  return +[RBSProcessReportedProcesses reportedPredicate]( &OBJC_CLASS___RBSProcessReportedProcesses,  "reportedPredicate");
}

+ (id)predicate
{
  return objc_alloc_init((Class)a1);
}

+ (id)predicateMatching:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 handleFailureInMethod:a2, a1, @"RBSProcessPredicate.m", 26, @"Invalid parameter not satisfying: %@", @"predicate" object file lineNumber description];
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    uint64_t v6 = [objc_alloc((Class)a1) initWithPredicate:v5];
  }

  else
  {
    uint64_t v6 = [v5 processPredicate];
  }

  v7 = (void *)v6;

  return v7;
}

+ (id)predicateMatchingPredicates:(id)a3
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if ((unint64_t)[v4 count] < 2)
  {
    [v4 firstObject];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [v5 predicate];
  }

  else
  {
    [MEMORY[0x189603FA8] array];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        uint64_t v10 = 0LL;
        do
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v10), "predicate", (void)v16);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          [v5 addObject:v11];

          ++v10;
        }

        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }

      while (v8);
    }

    uint64_t v12 = (uint64_t)-[RBSCompoundAllPredicate initWithPredicates:](objc_alloc(&OBJC_CLASS___RBSCompoundAllPredicate), v5);
  }

  v13 = (void *)v12;

  v14 = (void *)[objc_alloc((Class)a1) initWithPredicate:v13];
  return v14;
}

+ (id)predicateMatchingAnyPredicate:(id)a3
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if ((unint64_t)[v4 count] < 2)
  {
    [v4 firstObject];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [v5 predicate];
  }

  else
  {
    [MEMORY[0x189603FA8] array];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        uint64_t v10 = 0LL;
        do
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v10), "predicate", (void)v16);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          [v5 addObject:v11];

          ++v10;
        }

        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }

      while (v8);
    }

    uint64_t v12 = (uint64_t)-[RBSCompoundAnyPredicate initWithPredicates:](objc_alloc(&OBJC_CLASS___RBSCompoundAnyPredicate), v5);
  }

  v13 = (void *)v12;

  v14 = (void *)[objc_alloc((Class)a1) initWithPredicate:v13];
  return v14;
}

+ (id)predicateNotMatchingPredicate:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  id v6 = objc_alloc(&OBJC_CLASS___RBSNotPredicate);
  [v4 predicate];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v8 = -[RBSNotPredicate initNotWithPredicate:]((id *)&v6->super.super.isa, v7);
  uint64_t v9 = (void *)[v5 initWithPredicate:v8];

  return v9;
}

- (RBSProcessPredicate)initWithPredicate:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    NSClassFromString(@"RBSProcessPredicateImpl");
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [MEMORY[0x1896077D8] currentHandler];
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 handleFailureInMethod:a2, self, @"RBSProcessPredicate.m", 67, @"Invalid condition not satisfying: %@", @"[object isKindOfClass:RBSProcessPredicateImplClass]" object file lineNumber description];
    }
  }

  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___RBSProcessPredicate;
  uint64_t v7 = -[RBSProcessPredicate init](&v11, sel_init);
  uint64_t v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_predicate, a3);
  }

  return v8;
}

- (BOOL)matchesProcess:(id)a3
{
  return -[RBSProcessPredicateImpl matchesProcess:](self->_predicate, "matchesProcess:", a3);
}

- (unint64_t)hash
{
  return -[RBSProcessPredicateImpl hash](self->_predicate, "hash");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RBSProcessPredicate *)a3;
  if (self == v4) {
    goto LABEL_8;
  }
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class())
  {
    char v6 = 0;
    goto LABEL_9;
  }

  predicate = self->_predicate;
  uint64_t v8 = v4->_predicate;
  if (predicate == v8)
  {
LABEL_8:
    char v6 = 1;
    goto LABEL_9;
  }

  char v6 = 0;
  if (predicate && v8) {
    char v6 = -[RBSProcessPredicateImpl isEqual:](predicate, "isEqual:");
  }
LABEL_9:

  return v6;
}

- (NSString)description
{
  id v3 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = (void *)[v3 initWithFormat:@"<%@ %@>", v4, self->_predicate];

  return (NSString *)v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[RBSProcessPredicate initWithPredicate:]( +[RBSProcessPredicate allocWithZone:](&OBJC_CLASS___RBSProcessPredicate, "allocWithZone:", a3),  "initWithPredicate:",  self->_predicate);
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
}

- (RBSProcessPredicate)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[RBSProcessPredicate init](self, "init");
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_predicate"];
    predicate = v5->_predicate;
    v5->_predicate = (RBSProcessPredicateImpl *)v6;
  }

  return v5;
}

- (RBSProcessPredicateImpl)predicate
{
  return self->_predicate;
}

- (void).cxx_destruct
{
}

+ (id)predicateMatchingEuid:(unsigned int)a3
{
  id v3 = -[RBSProcessIntPredicate initWithIdentifier:]( objc_alloc(&OBJC_CLASS___RBSProcessEUIDPredicate),  "initWithIdentifier:",  a3);
  +[RBSProcessPredicate predicateMatching:](&OBJC_CLASS___RBSProcessPredicate, "predicateMatching:", v3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)predicateMatchingAuid:(unsigned int)a3
{
  id v3 = -[RBSProcessIntPredicate initWithIdentifier:]( objc_alloc(&OBJC_CLASS___RBSProcessAUIDPredicate),  "initWithIdentifier:",  a3);
  +[RBSProcessPredicate predicateMatching:](&OBJC_CLASS___RBSProcessPredicate, "predicateMatching:", v3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unsigned)euid
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v3 = v2;
  }
  else {
    id v3 = 0LL;
  }
  id v4 = v3;

  unsigned int v5 = [v4 identifier];
  return v5;
}

- (unsigned)auid
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v3 = v2;
  }
  else {
    id v3 = 0LL;
  }
  id v4 = v3;

  unsigned int v5 = [v4 identifier];
  return v5;
}

+ (id)predicateMatchingPlatform:(int)a3
{
  id v3 = -[RBSProcessPlatformPredicate initWithPlatform:]( objc_alloc(&OBJC_CLASS___RBSProcessPlatformPredicate),  "initWithPlatform:",  *(void *)&a3);
  +[RBSProcessPredicate predicateMatching:](&OBJC_CLASS___RBSProcessPredicate, "predicateMatching:", v3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)predicateMatchingBundleIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = -[RBSProcessStringPredicate initWithIdentifier:]( objc_alloc(&OBJC_CLASS___RBSProcessBundleIdentifierPredicate),  "initWithIdentifier:",  v3);

  +[RBSProcessPredicate predicateMatching:](&OBJC_CLASS___RBSProcessPredicate, "predicateMatching:", v4);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateMatchingExtensionPoint:(id)a3
{
  id v3 = a3;
  id v4 = -[RBSProcessStringPredicate initWithIdentifier:]( objc_alloc(&OBJC_CLASS___RBSProcessExtensionPointPredicate),  "initWithIdentifier:",  v3);

  +[RBSProcessPredicate predicateMatching:](&OBJC_CLASS___RBSProcessPredicate, "predicateMatching:", v4);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateMatchingBeforeTranslocationBundlePath:(id)a3
{
  id v3 = a3;
  id v4 = -[RBSProcessBeforeTranslocationBundlePathPredicate initWithIdentifier:]( objc_alloc(&OBJC_CLASS___RBSProcessBeforeTranslocationBundlePathPredicate),  "initWithIdentifier:",  v3);

  +[RBSProcessPredicate predicateMatching:](&OBJC_CLASS___RBSProcessPredicate, "predicateMatching:", v4);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateMatchingBundleIdentifiers:(id)a3
{
  id v3 = a3;
  id v4 = -[RBSProcessBundleIdentifiersPredicate initWithIdentifiers:]( objc_alloc(&OBJC_CLASS___RBSProcessBundleIdentifiersPredicate),  "initWithIdentifiers:",  v3);

  +[RBSProcessPredicate predicateMatching:](&OBJC_CLASS___RBSProcessPredicate, "predicateMatching:", v4);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateMatchingExecPathStartsWith:(id)a3
{
  id v3 = a3;
  id v4 = -[RBSProcessStringPredicate initWithIdentifier:]( objc_alloc(&OBJC_CLASS___RBSProcessExecPathStartsWithPredicate),  "initWithIdentifier:",  v3);

  +[RBSProcessPredicate predicateMatching:](&OBJC_CLASS___RBSProcessPredicate, "predicateMatching:", v4);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateMatchingDextsBundledWithBundleID:(id)a3
{
  id v3 = a3;
  id v4 = -[RBSProcessStringPredicate initWithIdentifier:]( objc_alloc(&OBJC_CLASS___RBSProcessBundledDextPredicate),  "initWithIdentifier:",  v3);

  +[RBSProcessPredicate predicateMatching:](&OBJC_CLASS___RBSProcessPredicate, "predicateMatching:", v4);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateMatchingLSApplicationIdentity:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[RBSProcessPredicate predicateMatchingIdentity:](&OBJC_CLASS___RBSProcessPredicate, "predicateMatchingIdentity:", v3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)bundleIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v3 = v2;
  }
  else {
    id v3 = 0LL;
  }
  id v4 = v3;

  [v4 identifier];
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)extensionPoint
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v3 = v2;
  }
  else {
    id v3 = 0LL;
  }
  id v4 = v3;

  [v4 identifier];
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)beforeTranslocationBundlePath
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v3 = v2;
  }
  else {
    id v3 = 0LL;
  }
  id v4 = v3;

  [v4 beforeTranslocationBundlePath];
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

+ (id)predicateMatchingIdentifier:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v4 = -[RBSProcessIdentifierPredicate initWithIdentifier:]( objc_alloc(&OBJC_CLASS___RBSProcessInstancePredicate),  "initWithIdentifier:",  v3);
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      unsigned int v5 = objc_alloc(&OBJC_CLASS___RBSProcessInstancePredicate);
      [v3 instance];
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      id v4 = -[RBSProcessIdentifierPredicate initWithIdentifier:](v5, "initWithIdentifier:", v6);
    }

    else
    {
      uint64_t v7 = +[RBSProcessIdentifier identifierForIdentifier:]( &OBJC_CLASS___RBSProcessIdentifier,  "identifierForIdentifier:",  v3);

      id v4 = -[RBSProcessIdentifierPredicate initWithIdentifier:]( objc_alloc(&OBJC_CLASS___RBSProcessIdentifierPredicate),  "initWithIdentifier:",  v7);
      id v3 = (id)v7;
    }
  }

  +[RBSProcessPredicate predicateMatching:](&OBJC_CLASS___RBSProcessPredicate, "predicateMatching:", v4);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)predicateMatchingHandle:(id)a3
{
  id v3 = a3;
  id v4 = -[RBSProcessHandlePredicateImpl initWithHandle:]( objc_alloc(&OBJC_CLASS___RBSProcessHandlePredicateImpl),  "initWithHandle:",  v3);

  +[RBSProcessPredicate predicateMatching:](&OBJC_CLASS___RBSProcessPredicate, "predicateMatching:", v4);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateMatchingIdentifiers:(id)a3
{
  id v3 = a3;
  id v4 = -[RBSProcessIdentifiersPredicate initWithIdentifiers:]( objc_alloc(&OBJC_CLASS___RBSProcessIdentifiersPredicate),  "initWithIdentifiers:",  v3);

  +[RBSProcessPredicate predicateMatching:](&OBJC_CLASS___RBSProcessPredicate, "predicateMatching:", v4);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateMatchingHostIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = -[RBSProcessIdentifierPredicate initWithIdentifier:]( objc_alloc(&OBJC_CLASS___RBSProcessHostIdentifierPredicate),  "initWithIdentifier:",  v3);

  +[RBSProcessPredicate predicateMatching:](&OBJC_CLASS___RBSProcessPredicate, "predicateMatching:", v4);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)processIdentifier
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0LL;
  }
  id v5 = v4;

  [v5 identifier];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }

  else
  {
    -[RBSProcessPredicate predicate](self, "predicate");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 0LL;
    }
    id v11 = v10;

    [v11 processIdentifier];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      id v8 = v12;
    }

    else
    {
      v14 = -[RBSProcessPredicate predicate](self, "predicate");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0) {
        v15 = v14;
      }
      else {
        v15 = 0LL;
      }
      id v16 = v15;

      [v16 processIdentifier];
      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
      __int128 v18 = v17;
      if (v17)
      {
        id v8 = v17;
      }

      else
      {
        -[RBSProcessPredicate predicate](self, "predicate");
        __int128 v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0) {
          v20 = v19;
        }
        else {
          v20 = 0LL;
        }
        id v21 = v20;

        [v21 processIdentifier];
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v22;
        if (v22)
        {
          id v8 = v22;
        }

        else
        {
          v24 = -[RBSProcessPredicate predicate](self, "predicate");
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0) {
            v25 = v24;
          }
          else {
            v25 = 0LL;
          }
          id v26 = v25;

          [v26 processIdentifier];
          id v8 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
    }
  }

  return v8;
}

- (id)processIdentifiers
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0LL;
  }
  id v5 = v4;

  uint64_t v6 = [v5 processIdentifiers];
  if (v6)
  {
    id v7 = (id)v6;
LABEL_6:

    return v7;
  }

  -[RBSProcessPredicate predicate](self, "predicate");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0LL;
  }
  id v10 = v9;

  [v10 processIdentifiers];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = v11;
  if (v11)
  {
    id v7 = v11;
  }

  else
  {
    v13 = -[RBSProcessPredicate predicate](self, "predicate");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      v14 = v13;
    }
    else {
      v14 = 0LL;
    }
    id v15 = v14;

    [v15 processIdentifiers];
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v17 = v16;
    if (v16)
    {
      id v7 = v16;
    }

    else
    {
      -[RBSProcessPredicate predicate](self, "predicate");
      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0) {
        __int128 v19 = v18;
      }
      else {
        __int128 v19 = 0LL;
      }
      id v20 = v19;

      [v20 processIdentifiers];
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  if (!v7)
  {
    -[RBSProcessPredicate processIdentifier](self, "processIdentifier");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v22 = (void *)MEMORY[0x189604010];
      v23 = +[RBSProcessIdentifier identifierForIdentifier:]( &OBJC_CLASS___RBSProcessIdentifier,  "identifierForIdentifier:",  v5);
      [v22 setWithObject:v23];
      id v7 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v7 = 0LL;
    }

    goto LABEL_6;
  }

  return v7;
}

+ (id)predicateMatchingLaunchServicesProcesses
{
  v2 = objc_alloc_init(&OBJC_CLASS___RBSProcessPredicateLaunchServicesProcesses);
  +[RBSProcessPredicate predicateMatching:](&OBJC_CLASS___RBSProcessPredicate, "predicateMatching:", v2);
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)predicateMatchingSuspendableProcesses
{
  v2 = objc_alloc_init(&OBJC_CLASS___RBSProcessPredicateSuspendable);
  +[RBSProcessPredicate predicateMatching:](&OBJC_CLASS___RBSProcessPredicate, "predicateMatching:", v2);
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)predicateMatchingJobLabel:(id)a3
{
  id v3 = a3;
  id v4 = -[RBSProcessStringPredicate initWithIdentifier:]( objc_alloc(&OBJC_CLASS___RBSProcessLaunchdJobLabelPredicate),  "initWithIdentifier:",  v3);

  +[RBSProcessPredicate predicateMatching:](&OBJC_CLASS___RBSProcessPredicate, "predicateMatching:", v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateMatchingServiceName:(id)a3
{
  id v3 = a3;
  id v4 = -[RBSProcessStringPredicate initWithIdentifier:]( objc_alloc(&OBJC_CLASS___RBSProcessServiceNamePredicate),  "initWithIdentifier:",  v3);

  +[RBSProcessPredicate predicateMatching:](&OBJC_CLASS___RBSProcessPredicate, "predicateMatching:", v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateMatchingIdentity:(id)a3
{
  id v3 = a3;
  id v4 = -[RBSProcessIdentityPredicate initWithIdentity:](objc_alloc(&OBJC_CLASS___RBSProcessIdentityPredicate), v3);

  +[RBSProcessPredicate predicateMatching:](&OBJC_CLASS___RBSProcessPredicate, "predicateMatching:", v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)predicateMatchingTarget:(id)a3
{
  return +[RBSProcessPredicate predicateMatching:](&OBJC_CLASS___RBSProcessPredicate, "predicateMatching:", a3);
}

- (NSString)jobLabel
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v3 = v2;
  }
  else {
    id v3 = 0LL;
  }
  id v4 = v3;

  [v4 identifier];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)serviceName
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v3 = v2;
  }
  else {
    id v3 = 0LL;
  }
  id v4 = v3;

  [v4 identifier];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (RBSProcessIdentity)processIdentity
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    id v3 = v2;
  }
  else {
    id v3 = 0LL;
  }
  id v4 = v3;

  if (v4) {
    id v5 = (void *)v4[1];
  }
  else {
    id v5 = 0LL;
  }
  uint64_t v6 = v5;

  return v6;
}

@end