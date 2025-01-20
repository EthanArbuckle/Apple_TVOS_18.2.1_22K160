@interface LSPlugInQueryWithIdentifier
+ (BOOL)supportsSecureCoding;
- (BOOL)isBindingMapValid;
- (BOOL)isEqual:(id)a3;
- (LSPlugInQueryWithIdentifier)initWithCoder:(id)a3;
- (id)_identifier;
- (id)_initWithIdentifier:(id)a3 inMap:(int)a4;
- (unint64_t)hash;
- (void)_enumerateWithXPCConnection:(id)a3 block:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LSPlugInQueryWithIdentifier

- (id)_initWithIdentifier:(id)a3 inMap:(int)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___LSPlugInQueryWithIdentifier;
  v7 = -[LSPlugInQuery _init](&v12, sel__init);
  v8 = v7;
  if (v7)
  {
    v7[3] = a4;
    uint64_t v9 = [v6 copy];
    v10 = (void *)v8[2];
    v8[2] = v9;
  }

  return v8;
}

- (id)_identifier
{
  return *(id *)&self->_bindingMap;
}

- (BOOL)isBindingMapValid
{
  return (*((_DWORD *)&self->super.super._legacy + 1) - 9) < 3;
}

- (void)_enumerateWithXPCConnection:(id)a3 block:(id)a4
{
  v17[1] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  v7 = (void (**)(id, void, id))a4;
  if (*(void *)&self->_bindingMap && -[LSPlugInQueryWithIdentifier isBindingMapValid](self, "isBindingMapValid"))
  {
    id v14 = 0LL;
    v15 = 0LL;
    int inited = _LSContextInitReturningError((uint64_t)&v15, (uint64_t)&v14);
    id v9 = v14;
    if (inited)
    {
      [MEMORY[0x189603FE0] set];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      _LSDatabaseGetStringForCFString(v15, *(const __CFString **)&self->_bindingMap, 0);
      uint64_t v12 = MEMORY[0x1895F87A8];
      id v13 = v10;
      _LSDatabaseEnumeratingBindingMap();
      -[LSPlugInQuery sort:pluginIDs:andYield:context:]( self,  "sort:pluginIDs:andYield:context:",  1LL,  v13,  v7,  &v15,  v12,  3221225472LL,  __65__LSPlugInQueryWithIdentifier__enumerateWithXPCConnection_block___block_invoke,  &unk_189D77C80);
      _LSContextDestroy(&v15);
    }

    else
    {
      v7[2](v7, 0LL, v9);
    }
  }

  else
  {
    uint64_t v16 = *MEMORY[0x189607490];
    v17[0] = @"invalid bundleIdentifier";
    [MEMORY[0x189603F68] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -50LL,  (uint64_t)"-[LSPlugInQueryWithIdentifier _enumerateWithXPCConnection:block:]",  52LL,  v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0LL, v11);
  }
}

void __65__LSPlugInQueryWithIdentifier__enumerateWithXPCConnection_block___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 addObject:v2];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___LSPlugInQueryWithIdentifier;
  if (-[LSPlugInQuery isEqual:](&v9, sel_isEqual_, v4) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = *(void **)&self->_bindingMap;
    [v4 _identifier];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    char v7 = [v5 isEqualToString:v6];
  }

  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [*(id *)&self->_bindingMap hash];
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___LSPlugInQueryWithIdentifier;
  return -[LSPlugInQuery hash](&v5, sel_hash) ^ v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4 = *(void *)&self->_bindingMap;
  id v5 = a3;
  [v5 encodeObject:v4 forKey:@"identifier"];
  [v5 encodeInt32:*((unsigned int *)&self->super.super._legacy + 1) forKey:@"bindingMap"];
}

- (LSPlugInQueryWithIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"identifier");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v4 decodeInt32ForKey:@"bindingMap"];

  char v7 = -[LSPlugInQueryWithIdentifier _initWithIdentifier:inMap:](self, "_initWithIdentifier:inMap:", v5, v6);
  return v7;
}

- (void).cxx_destruct
{
}

@end