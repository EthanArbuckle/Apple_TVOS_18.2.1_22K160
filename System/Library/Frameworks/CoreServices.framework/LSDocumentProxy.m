@interface LSDocumentProxy
+ (BOOL)supportsSecureCoding;
+ (id)documentProxyForName:(id)a3 type:(id)a4 MIMEType:(id)a5;
+ (id)documentProxyForName:(id)a3 type:(id)a4 MIMEType:(id)a5 isContentManaged:(BOOL)a6 sourceAuditToken:(id *)a7;
+ (id)documentProxyForName:(id)a3 type:(id)a4 MIMEType:(id)a5 managedSourceAuditToken:(id *)a6;
+ (id)documentProxyForName:(id)a3 type:(id)a4 MIMEType:(id)a5 sourceIsManaged:(BOOL)a6;
+ (id)documentProxyForURL:(id)a3;
+ (id)documentProxyForURL:(id)a3 isContentManaged:(BOOL)a4 sourceAuditToken:(id *)a5;
+ (id)documentProxyForURL:(id)a3 managedSourceAuditToken:(id *)a4;
+ (id)documentProxyForURL:(id)a3 sourceIsManaged:(BOOL)a4;
- (BOOL)isContentManaged;
- (BOOL)isImageOrVideo;
- (BOOL)sourceIsManaged;
- (LSDocumentProxy)initWithCoder:(id)a3;
- (LSDocumentProxy)initWithURL:(id)a3 name:(id)a4 type:(id)a5 MIMEType:(id)a6 isContentManaged:(BOOL)a7 sourceAuditToken:(id *)a8;
- (NSString)MIMEType;
- (NSString)containerOwnerApplicationIdentifier;
- (NSString)name;
- (NSString)typeIdentifier;
- (NSURL)URL;
- (const)managedSourceAuditToken;
- (const)sourceAuditToken;
- (id)applicationsAvailableForOpeningByDraggingAndDroppingWithError:(id *)a3;
- (id)applicationsAvailableForOpeningFromAirDropWithError:(id *)a3;
- (id)applicationsAvailableForOpeningWithError:(id *)a3;
- (id)applicationsAvailableForOpeningWithHandlerRanks:(id)a3 error:(id *)a4;
- (id)applicationsAvailableForOpeningWithStyle:(unsigned __int8)a3 limit:(unint64_t)a4 XPCConnection:(id)a5 error:(id *)a6;
- (id)applicationsOrClaimBindings:(BOOL)a3 availableForOpeningWithStyle:(unsigned __int8)a4 handlerRank:(id)a5 limit:(unint64_t)a6 XPCConnection:(id)a7 error:(id *)a8;
- (id)availableClaimBindingsForMode:(unsigned __int8)a3 error:(id *)a4;
- (id)availableClaimBindingsForMode:(unsigned __int8)a3 handlerRank:(id)a4 error:(id *)a5;
- (id)availableClaimBindingsReturningError:(id *)a3;
- (id)claimBindingsAvailableForOpeningWithStyle:(unsigned __int8)a3 handlerRank:(id)a4 limit:(unint64_t)a5 XPCConnection:(id)a6 error:(id *)a7;
- (id)debugDescription;
- (id)description;
- (id)iconDataForVariant:(int)a3 withOptions:(int)a4;
- (id)uniqueIdentifier;
- (optional<LaunchServices::BindingEvaluator>)_bindingEvaluatorWithAuditToken:(SEL)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LSDocumentProxy

+ (id)documentProxyForURL:(id)a3 isContentManaged:(BOOL)a4 sourceAuditToken:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = objc_alloc((Class)a1);
  [v8 path];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 lastPathComponent];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)[v9 initWithURL:v8 name:v11 type:0 MIMEType:0 isContentManaged:v6 sourceAuditToken:a5];

  return v12;
}

+ (id)documentProxyForName:(id)a3 type:(id)a4 MIMEType:(id)a5 isContentManaged:(BOOL)a6 sourceAuditToken:(id *)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v15 = (void *)[objc_alloc((Class)a1) initWithURL:0 name:v12 type:v13 MIMEType:v14 isContentManaged:v8 sourceAuditToken:a7];

  return v15;
}

+ (id)documentProxyForURL:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  [v4 path];
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 lastPathComponent];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v8 = (void *)[v5 initWithURL:v4 name:v7 type:0 MIMEType:0 isContentManaged:0 sourceAuditToken:0];

  return v8;
}

+ (id)documentProxyForName:(id)a3 type:(id)a4 MIMEType:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)[objc_alloc((Class)a1) initWithURL:0 name:v8 type:v9 MIMEType:v10 isContentManaged:0 sourceAuditToken:0];

  return v11;
}

- (LSDocumentProxy)initWithURL:(id)a3 name:(id)a4 type:(id)a5 MIMEType:(id)a6 isContentManaged:(BOOL)a7 sourceAuditToken:(id *)a8
{
  id v15 = a3;
  v16 = (__CFString *)a4;
  id v17 = a5;
  id v18 = a6;
  if (v16) {
    v19 = v16;
  }
  else {
    v19 = @"untitled";
  }
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___LSDocumentProxy;
  v20 = -[LSResourceProxy _initWithLocalizedName:](&v30, sel__initWithLocalizedName_, v19);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong(v20 + 8, a3);
    uint64_t v22 = -[__CFString copy](v19, "copy");
    id v23 = v21[9];
    v21[9] = (id)v22;

    uint64_t v24 = [v17 copy];
    id v25 = v21[10];
    v21[10] = (id)v24;

    uint64_t v26 = [v18 copy];
    id v27 = v21[11];
    v21[11] = (id)v26;

    *((_BYTE *)v21 + 56) = a7;
    if (!a8) {
      a8 = (const $115C4C562B26FF47E01F9F4EA65B5887 *)_LSGetAuditTokenForSelf();
    }
    __int128 v28 = *(_OWORD *)&a8->var0[4];
    *(_OWORD *)(v21 + 3) = *(_OWORD *)a8->var0;
    *(_OWORD *)(v21 + 5) = v28;
  }

  return (LSDocumentProxy *)v21;
}

- (BOOL)isImageOrVideo
{
  return 0;
}

- (NSString)containerOwnerApplicationIdentifier
{
  return 0LL;
}

- (const)sourceAuditToken
{
  return (const $115C4C562B26FF47E01F9F4EA65B5887 *)&self->_sourceAuditToken;
}

- (id)availableClaimBindingsReturningError:(id *)a3
{
  return -[LSDocumentProxy claimBindingsAvailableForOpeningWithStyle:handlerRank:limit:XPCConnection:error:]( self,  "claimBindingsAvailableForOpeningWithStyle:handlerRank:limit:XPCConnection:error:",  0LL,  0LL,  -1LL,  0LL,  a3);
}

- (id)availableClaimBindingsForMode:(unsigned __int8)a3 error:(id *)a4
{
  return -[LSDocumentProxy claimBindingsAvailableForOpeningWithStyle:handlerRank:limit:XPCConnection:error:]( self,  "claimBindingsAvailableForOpeningWithStyle:handlerRank:limit:XPCConnection:error:",  a3,  0LL,  -1LL,  0LL,  a4);
}

- (id)availableClaimBindingsForMode:(unsigned __int8)a3 handlerRank:(id)a4 error:(id *)a5
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)applicationsAvailableForOpeningWithHandlerRanks:(id)a3 error:(id *)a4
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  CFSetRef v6 = (CFSetRef)a3;
  v7 = (void *)MEMORY[0x186E2A59C]();
  if (!v6) {
    CFSetRef v6 = _LSCopyAllHandlerRankStrings();
  }
  id v8 = objc_alloc_init(MEMORY[0x189603FE0]);
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v9 = v6;
  uint64_t v10 = -[__CFSet countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v26,  v36,  16LL);
  if (v10)
  {
    uint64_t v11 = *(void *)v27;
    do
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = -[_LSDocumentProxyBindingQuery initWithDocumentProxy:style:handlerRank:]( objc_alloc(&OBJC_CLASS____LSDocumentProxyBindingQuery),  "initWithDocumentProxy:style:handlerRank:",  self,  0LL,  *(void *)(*((void *)&v26 + 1) + 8 * v12));
        if (v13) {
          [v8 addObject:v13];
        }

        ++v12;
      }

      while (v10 != v12);
      uint64_t v10 = -[__CFSet countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v26,  v36,  16LL);
    }

    while (v10);
  }

  +[_LSQueryContext defaultContext](&OBJC_CLASS____LSQueryContext, "defaultContext");
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  id v25 = 0LL;
  [v14 resolveQueries:v8 error:&v25];
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  id v16 = v25;

  if (v15)
  {
    id v17 = objc_alloc_init(MEMORY[0x189603FC8]);
    v23[0] = MEMORY[0x1895F87A8];
    v23[1] = 3221225472LL;
    v23[2] = __73__LSDocumentProxy_applicationsAvailableForOpeningWithHandlerRanks_error___block_invoke;
    v23[3] = &unk_189D76740;
    id v18 = (os_log_s *)v17;
    uint64_t v24 = v18;
    [v15 enumerateKeysAndObjectsUsingBlock:v23];
    v19 = v24;
  }

  else
  {
    _LSDefaultLog();
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = -[__CFSet allObjects](v9, "allObjects");
      objc_msgSend(v20, "componentsJoinedByString:", @", ");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v31 = self;
      __int16 v32 = 2112;
      v33 = v21;
      __int16 v34 = 2112;
      id v35 = v16;
      _os_log_impl(&dword_183E58000, v19, OS_LOG_TYPE_DEFAULT, "Could not find apps for %@ (ranks %@): %@.", buf, 0x20u);
    }

    id v18 = 0LL;
  }

  objc_autoreleasePoolPop(v7);
  if (a4 && !v18) {
    *a4 = v16;
  }

  return v18;
}

void __73__LSDocumentProxy_applicationsAvailableForOpeningWithHandlerRanks_error___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v6 = a3;
  [a2 handlerRank];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && v5) {
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
  }
}

- (id)applicationsAvailableForOpeningWithError:(id *)a3
{
  return -[LSDocumentProxy applicationsAvailableForOpeningWithStyle:limit:XPCConnection:error:]( self,  "applicationsAvailableForOpeningWithStyle:limit:XPCConnection:error:",  0LL,  -1LL,  0LL,  a3);
}

- (id)applicationsAvailableForOpeningFromAirDropWithError:(id *)a3
{
  return -[LSDocumentProxy applicationsAvailableForOpeningWithStyle:limit:XPCConnection:error:]( self,  "applicationsAvailableForOpeningWithStyle:limit:XPCConnection:error:",  1LL,  -1LL,  0LL,  a3);
}

- (id)applicationsAvailableForOpeningByDraggingAndDroppingWithError:(id *)a3
{
  return -[LSDocumentProxy applicationsAvailableForOpeningWithStyle:limit:XPCConnection:error:]( self,  "applicationsAvailableForOpeningWithStyle:limit:XPCConnection:error:",  2LL,  -1LL,  0LL,  a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LSDocumentProxy)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___LSDocumentProxy;
  id v5 = -[LSResourceProxy initWithCoder:](&v20, sel_initWithCoder_, v4);
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"URL");
    v7 = (void *)*((void *)v5 + 8);
    *((void *)v5 + 8) = v6;

    uint64_t v8 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"name");
    id v9 = (void *)*((void *)v5 + 9);
    *((void *)v5 + 9) = v8;

    uint64_t v10 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"typeIdentifier");
    uint64_t v11 = (void *)*((void *)v5 + 10);
    *((void *)v5 + 10) = v10;

    uint64_t v12 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"MIMEType");
    id v13 = (void *)*((void *)v5 + 11);
    *((void *)v5 + 11) = v12;

    v5[56] = [v4 decodeBoolForKey:@"contentManaged"];
    objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"sourceAuditToken");
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    id v15 = v14;
    if (v14)
    {
      if ([v14 length] == 32)
      {
        id v16 = (_OWORD *)[v15 bytes];
        __int128 v17 = v16[1];
        *(_OWORD *)(v5 + 24) = *v16;
        *(_OWORD *)(v5 + 40) = v17;
      }

      else
      {
        _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607460],  4864LL,  (uint64_t)"-[LSDocumentProxy initWithCoder:]",  269LL,  0LL);
        id v18 = (void *)objc_claimAutoreleasedReturnValue();
        [v4 failWithError:v18];
      }
    }
  }

  return (LSDocumentProxy *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___LSDocumentProxy;
  -[LSResourceProxy encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  [v4 encodeObject:self->_URL forKey:@"URL"];
  [v4 encodeObject:self->_name forKey:@"name"];
  [v4 encodeObject:self->_typeIdentifier forKey:@"typeIdentifier"];
  [v4 encodeObject:self->_MIMEType forKey:@"MIMEType"];
  [v4 encodeBool:self->_isContentManaged forKey:@"contentManaged"];
  [MEMORY[0x189603F48] dataWithBytes:&self->_sourceAuditToken length:32];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v5 forKey:@"sourceAuditToken"];
}

- (id)uniqueIdentifier
{
  id v3 = objc_alloc_init(MEMORY[0x189603FB8]);
  -[LSDocumentProxy name](self, "name");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[LSDocumentProxy name](self, "name");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 dataUsingEncoding:4];
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 appendData:v6];
  }
  v7 = -[LSDocumentProxy typeIdentifier](self, "typeIdentifier");
  if (v7)
  {
    -[LSDocumentProxy typeIdentifier](self, "typeIdentifier");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 dataUsingEncoding:4];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 appendData:v9];
  }

  -[LSDocumentProxy MIMEType](self, "MIMEType");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[LSDocumentProxy MIMEType](self, "MIMEType");
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 dataUsingEncoding:4];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 appendData:v12];
  }

  BOOL v15 = -[LSDocumentProxy isContentManaged](self, "isContentManaged");
  [v3 appendBytes:&v15 length:1];
  objc_msgSend(MEMORY[0x189607AB8], "_LS_UUIDWithData:digestType:", v3, 2);
  id v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)description
{
  id v3 = objc_alloc(NSString);
  -[LSResourceProxy localizedName](self, "localizedName");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LSDocumentProxy typeIdentifier](self, "typeIdentifier");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LSDocumentProxy MIMEType](self, "MIMEType");
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)[v3 initWithFormat:@"LSDocumentProxy: Name=%@ UTI=%@ MIMEType=%@", v4, v5, v6];

  return v7;
}

- (id)debugDescription
{
  BOOL v3 = -[LSDocumentProxy isContentManaged](self, "isContentManaged");
  id v4 = objc_alloc(MEMORY[0x189603F48]);
  id v5 = self;
  objc_super v6 = (void *)objc_msgSend( v4,  "initWithBytes:length:",  -[LSDocumentProxy sourceAuditToken](v5, "sourceAuditToken"),  32);
  id v7 = objc_alloc(NSString);
  uint64_t v8 = objc_opt_class();
  -[LSDocumentProxy URL](v5, "URL");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[LSDocumentProxy name](v5, "name");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[LSDocumentProxy typeIdentifier](v5, "typeIdentifier");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[LSDocumentProxy MIMEType](v5, "MIMEType");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = [v6 description];
  id v14 = (void *)v13;
  BOOL v15 = "no";
  if (v3) {
    BOOL v15 = "yes";
  }
  id v16 = (void *)[v7 initWithFormat:@"<%@ %p> { URL: %@, Name: %@, UTI: %@, MIMEType: %@, isContentManaged: %s, sourceAuditToken: %@ }", v8, v5, v9, v10, v11, v12, v15, v13];

  return v16;
}

+ (id)documentProxyForURL:(id)a3 managedSourceAuditToken:(id *)a4
{
  [a1 documentProxyForURL:a3 isContentManaged:a4 != 0 sourceAuditToken:a4];
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)documentProxyForURL:(id)a3 sourceIsManaged:(BOOL)a4
{
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)documentProxyForName:(id)a3 type:(id)a4 MIMEType:(id)a5 managedSourceAuditToken:(id *)a6
{
  [a1 documentProxyForName:a3 type:a4 MIMEType:a5 isContentManaged:a6 != 0 sourceAuditToken:a6];
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)documentProxyForName:(id)a3 type:(id)a4 MIMEType:(id)a5 sourceIsManaged:(BOOL)a6
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)sourceIsManaged
{
  return self->_isContentManaged;
}

- (const)managedSourceAuditToken
{
  return (const $115C4C562B26FF47E01F9F4EA65B5887 *)&self->_sourceAuditToken;
}

- (BOOL)isContentManaged
{
  return self->_isContentManaged;
}

- (NSURL)URL
{
  return self->_URL;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)typeIdentifier
{
  return self->_typeIdentifier;
}

- (NSString)MIMEType
{
  return self->_MIMEType;
}

- (void).cxx_destruct
{
}

- (optional<LaunchServices::BindingEvaluator>)_bindingEvaluatorWithAuditToken:(SEL)a3
{
  v22[21] = *(FSNode **)MEMORY[0x1895F89C0];
  retstr->var0.var0 = 0;
  retstr->var1 = 0;
  -[LSDocumentProxy URL](self, "URL");
  id v7 = (LaunchServices::BindingEvaluator *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = v7;
  if (v7)
  {
    else {
      id v9 = &kUTTypeData;
    }
    BOOL v10 = +[FSNode canReadURL:fromSandboxWithAuditToken:]( &OBJC_CLASS___FSNode,  "canReadURL:fromSandboxWithAuditToken:",  v8,  a4);
    uint64_t v11 = *v9;
    if (v10)
    {
      LaunchServices::BindingEvaluator::CreateWithURL(v8, v22);
      std::optional<LaunchServices::BindingEvaluator>::operator=[abi:nn180100]<LaunchServices::BindingEvaluator,void>( (LaunchServices::BindingEvaluator *)retstr,  (const LaunchServices::BindingEvaluator *)v22);
      LaunchServices::BindingEvaluator::~BindingEvaluator((LaunchServices::BindingEvaluator *)v22);
      goto LABEL_19;
    }
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  -[LSDocumentProxy typeIdentifier](self, "typeIdentifier");
  uint64_t v12 = (LaunchServices::BindingEvaluator *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[LSDocumentProxy name](self, "name");
    uint64_t v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    LaunchServices::BindingEvaluator::CreateWithUTI(v12, v13, (LaunchServices::BindingEvaluator *)v22);
    std::optional<LaunchServices::BindingEvaluator>::operator=[abi:nn180100]<LaunchServices::BindingEvaluator,void>( (LaunchServices::BindingEvaluator *)retstr,  (const LaunchServices::BindingEvaluator *)v22);
    LaunchServices::BindingEvaluator::~BindingEvaluator((LaunchServices::BindingEvaluator *)v22);
  }

  else
  {
    -[LSDocumentProxy name](self, "name");
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 pathExtension];
    BOOL v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      PreferredIdentifierForTag = (LaunchServices::BindingEvaluator *)UTTypeCreatePreferredIdentifierForTag( @"public.filename-extension",  v15,  v11);
      if (PreferredIdentifierForTag)
      {
        -[LSDocumentProxy name](self, "name");
        __int128 v17 = (NSString *)objc_claimAutoreleasedReturnValue();
        LaunchServices::BindingEvaluator::CreateWithUTI( PreferredIdentifierForTag,  v17,  (LaunchServices::BindingEvaluator *)v22);
        std::optional<LaunchServices::BindingEvaluator>::operator=[abi:nn180100]<LaunchServices::BindingEvaluator,void>( (LaunchServices::BindingEvaluator *)retstr,  (const LaunchServices::BindingEvaluator *)v22);
        LaunchServices::BindingEvaluator::~BindingEvaluator((LaunchServices::BindingEvaluator *)v22);
      }
    }

    else
    {
      -[LSDocumentProxy MIMEType](self, "MIMEType");
      PreferredIdentifierForTag = (LaunchServices::BindingEvaluator *)objc_claimAutoreleasedReturnValue();
      if (PreferredIdentifierForTag)
      {
        id v18 = (LaunchServices::BindingEvaluator *)UTTypeCreatePreferredIdentifierForTag( @"public.mime-type",  (CFStringRef)PreferredIdentifierForTag,  v11);
        if (v18)
        {
          -[LSDocumentProxy name](self, "name");
          v19 = (NSString *)objc_claimAutoreleasedReturnValue();
          LaunchServices::BindingEvaluator::CreateWithUTI(v18, v19, (LaunchServices::BindingEvaluator *)v22);
          std::optional<LaunchServices::BindingEvaluator>::operator=[abi:nn180100]<LaunchServices::BindingEvaluator,void>( (LaunchServices::BindingEvaluator *)retstr,  (const LaunchServices::BindingEvaluator *)v22);
          LaunchServices::BindingEvaluator::~BindingEvaluator((LaunchServices::BindingEvaluator *)v22);
        }
      }
    }
  }

LABEL_19:
  if (!retstr->var1)
  {
    if (v11) {
      objc_super v20 = (LaunchServices::BindingEvaluator *)v11;
    }
    else {
      objc_super v20 = (LaunchServices::BindingEvaluator *)@"public.data";
    }
    LaunchServices::BindingEvaluator::CreateWithUTI(v20, 0LL, (LaunchServices::BindingEvaluator *)v22);
    std::optional<LaunchServices::BindingEvaluator>::operator=[abi:nn180100]<LaunchServices::BindingEvaluator,void>( (LaunchServices::BindingEvaluator *)retstr,  (const LaunchServices::BindingEvaluator *)v22);
    LaunchServices::BindingEvaluator::~BindingEvaluator((LaunchServices::BindingEvaluator *)v22);
  }

  return result;
}

- (id)applicationsOrClaimBindings:(BOOL)a3 availableForOpeningWithStyle:(unsigned __int8)a4 handlerRank:(id)a5 limit:(unint64_t)a6 XPCConnection:(id)a7 error:(id *)a8
{
  uint64_t v10 = a4;
  BOOL v11 = a3;
  uint64_t v42 = *MEMORY[0x1895F89C0];
  id v13 = a5;
  id v14 = a7;
  BOOL v15 = (void *)MEMORY[0x186E2A59C]();
  __int128 v29 = v13;
  v36 = -[_LSDocumentProxyBindingQuery initWithDocumentProxy:style:handlerRank:]( objc_alloc(&OBJC_CLASS____LSDocumentProxyBindingQuery),  "initWithDocumentProxy:style:handlerRank:",  self,  v10,  v13);
  -[_LSDocumentProxyBindingQuery setYieldClaimBindings:](v36, "setYieldClaimBindings:", v11);
  +[_LSQueryContext defaultContext](&OBJC_CLASS____LSQueryContext, "defaultContext");
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v17 = (void *)[objc_alloc(MEMORY[0x189604010]) initWithObjects:&v36 count:1];
  if (v14)
  {
    id v35 = 0LL;
    [v16 _resolveQueries:v17 XPCConnection:v14 error:&v35];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    id v19 = v35;
    [v18 allValues];
    objc_super v20 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = [v20 firstObject];
  }

  else
  {
    id v34 = 0LL;
    [v16 resolveQueries:v17 error:&v34];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    id v19 = v34;
    [v18 allValues];
    objc_super v20 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = [v20 firstObject];
  }

  uint64_t v22 = (void *)v21;

  if (v22)
  {
    id v23 = objc_alloc_init(MEMORY[0x189603FA8]);
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    id v24 = v22;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v30 objects:v41 count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v31;
      do
      {
        for (uint64_t i = 0LL; i != v25; ++i)
        {
          if (*(void *)v31 != v26) {
            objc_enumerationMutation(v24);
          }
          [v23 addObject:*(void *)(*((void *)&v30 + 1) + 8 * i)];
        }

        uint64_t v25 = [v24 countByEnumeratingWithState:&v30 objects:v41 count:16];
      }

      while (v25);
    }
  }

  else
  {
    _LSDefaultLog();
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v38 = self;
      __int16 v39 = 2112;
      id v40 = v19;
      _os_log_impl(&dword_183E58000, (os_log_t)v24, OS_LOG_TYPE_DEFAULT, "Could not find apps for %@: %@.", buf, 0x16u);
    }

    id v23 = 0LL;
  }

  objc_autoreleasePoolPop(v15);
  if (a8 && !v23) {
    *a8 = v19;
  }

  return v23;
}

- (id)applicationsAvailableForOpeningWithStyle:(unsigned __int8)a3 limit:(unint64_t)a4 XPCConnection:(id)a5 error:(id *)a6
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)claimBindingsAvailableForOpeningWithStyle:(unsigned __int8)a3 handlerRank:(id)a4 limit:(unint64_t)a5 XPCConnection:(id)a6 error:(id *)a7
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)iconDataForVariant:(int)a3 withOptions:(int)a4
{
  return 0LL;
}

@end