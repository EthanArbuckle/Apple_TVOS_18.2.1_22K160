@interface _LSApplicationExtensionRecordEnumerator
- (BOOL)_evaluatePluginNoIO:(unsigned int)a3 data:(const LSPluginData *)a4 extensionPointID:(unsigned int)a5 context:(LSContext *)a6;
- (BOOL)_getExtensionPointID:(unsigned int *)a3 context:(LSContext *)a4 error:(id *)a5;
- (BOOL)_getObject:(id *)a3 atIndex:(unint64_t)a4 context:(LSContext *)a5;
- (BOOL)_prepareWithContext:(LSContext *)a3 error:(id *)a4;
- (_LSApplicationExtensionRecordEnumerator)initWithExtensionPoint:(id)a3 options:(unint64_t)a4;
- (_LSApplicationExtensionRecordEnumerator)initWithExtensionPointIdentifier:(id)a3 options:(unint64_t)a4;
- (_LSApplicationExtensionRecordEnumerator)initWithExtensionPointIdentifier:(id)a3 options:(unint64_t)a4 filter:(id)a5;
- (_LSApplicationExtensionRecordEnumerator)initWithExtensionPointIdentifier:(id)a3 options:(unint64_t)a4 platform:(unsigned int)a5;
- (_LSApplicationExtensionRecordEnumerator)initWithExtensionPointIdentifier:(id)a3 options:(unint64_t)a4 platform:(unsigned int)a5 filter:(id)a6;
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation _LSApplicationExtensionRecordEnumerator

- (_LSApplicationExtensionRecordEnumerator)initWithExtensionPointIdentifier:(id)a3 options:(unint64_t)a4
{
  return -[_LSApplicationExtensionRecordEnumerator initWithExtensionPointIdentifier:options:platform:]( self,  "initWithExtensionPointIdentifier:options:platform:",  a3,  a4,  0LL);
}

- (_LSApplicationExtensionRecordEnumerator)initWithExtensionPointIdentifier:(id)a3 options:(unint64_t)a4 platform:(unsigned int)a5
{
  return -[_LSApplicationExtensionRecordEnumerator initWithExtensionPointIdentifier:options:platform:filter:]( self,  "initWithExtensionPointIdentifier:options:platform:filter:",  a3,  a4,  *(void *)&a5,  0LL);
}

- (_LSApplicationExtensionRecordEnumerator)initWithExtensionPointIdentifier:(id)a3 options:(unint64_t)a4 filter:(id)a5
{
  return -[_LSApplicationExtensionRecordEnumerator initWithExtensionPointIdentifier:options:platform:filter:]( self,  "initWithExtensionPointIdentifier:options:platform:filter:",  a3,  a4,  0LL,  a5);
}

- (_LSApplicationExtensionRecordEnumerator)initWithExtensionPointIdentifier:(id)a3 options:(unint64_t)a4 platform:(unsigned int)a5 filter:(id)a6
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS____LSApplicationExtensionRecordEnumerator;
  v10 = -[_LSDBEnumerator _initWithContext:](&v18, sel__initWithContext_, 0LL);
  if (v10)
  {
    uint64_t v11 = [a3 copy];
    extensionPointID = v10->_extensionPointID;
    v10->_extensionPointID = (NSString *)v11;

    v10->_options = a4;
    uint64_t v13 = [a6 copy];
    id filterBlock = v10->_filterBlock;
    v10->_id filterBlock = (id)v13;

    v10->_platform = a5;
    if (a6)
    {
      uint64_t v15 = _LSLazyPropertyListGetSharedEmptyPropertyList();
      propertyList = v10->_propertyList;
      v10->_propertyList = (LSPropertyList *)v15;
    }
  }

  return v10;
}

- (_LSApplicationExtensionRecordEnumerator)initWithExtensionPoint:(id)a3 options:(unint64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS____LSApplicationExtensionRecordEnumerator;
  v6 = -[_LSDBEnumerator _initWithContext:](&v10, sel__initWithContext_, 0LL);
  if (v6)
  {
    [a3 identifier];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v6->_extensionPointID, v7);
    v6->_options = a4;
    id filterBlock = v6->_filterBlock;
    v6->_id filterBlock = 0LL;

    v6->_platform = [a3 platform];
    objc_storeStrong((id *)&v6->_extensionPointRecord, a3);
  }

  return v6;
}

- (BOOL)_prepareWithContext:(LSContext *)a3 error:(id *)a4
{
  int v20 = 0;
  BOOL v6 = -[_LSApplicationExtensionRecordEnumerator _getExtensionPointID:context:error:]( self,  "_getExtensionPointID:context:error:",  &v20,  a3,  a4);
  if (v6)
  {
    int v7 = (LOBYTE(self->_options) >> 4) & 1;
    v17[0] = MEMORY[0x1895F87A8];
    v17[1] = 3221225472LL;
    v17[2] = __69___LSApplicationExtensionRecordEnumerator__prepareWithContext_error___block_invoke;
    v17[3] = &unk_189D77BD8;
    int v18 = v20;
    v17[4] = self;
    v17[5] = a3;
    char v19 = v7;
    id v8 = (id)MEMORY[0x186E2A7B8](v17);
    _CSStringBindingEnumerateAllBindings();
    v9 = (os_log_s *)_LSEnumeratorLog;
    if (os_log_type_enabled((os_log_t)_LSEnumeratorLog, OS_LOG_TYPE_DEBUG)) {
      -[_LSApplicationExtensionRecordEnumerator _prepareWithContext:error:].cold.1( (uint64_t)self,  v9,  v10,  v11,  v12,  v13,  v14,  v15);
    }
  }

  return v6;
}

- (BOOL)_getObject:(id *)a3 atIndex:(unint64_t)a4 context:(LSContext *)a5
{
  begin = self->_plugins.__begin_;
  unint64_t v7 = self->_plugins.__end_ - begin;
  if (v7 > a4)
  {
    uint64_t v11 = begin[a4];
    uint64_t v12 = _LSGetPlugin((uint64_t)a5->db, begin[a4]);
    if (v12)
    {
      uint64_t v13 = v12;
      unint64_t v14 = self->_options >> 63;
      db = a5->db;
      v21 = 0LL;
      int IsValid = _LSPluginIsValid(db, v11, v13, 0LL, v14, (const __CFString **)&v21);
      v17 = v21;
      if (IsValid)
      {
        if (self->_extensionPointRecord) {
          id v18 = -[LSApplicationExtensionRecord _initWithContext:pluginID:pluginData:extensionPointRecord:error:]( objc_alloc(&OBJC_CLASS___LSApplicationExtensionRecord),  "_initWithContext:pluginID:pluginData:extensionPointRecord:error:",  a5,  v11,  v13,  self->_extensionPointRecord,  0LL);
        }
        else {
          id v18 = -[LSApplicationExtensionRecord _initWithContext:pluginID:pluginData:error:]( objc_alloc(&OBJC_CLASS___LSApplicationExtensionRecord),  "_initWithContext:pluginID:pluginData:error:",  a5,  v11,  v13,  0LL);
        }
        id v19 = *a3;
        *a3 = v18;
      }

      else if (os_log_type_enabled((os_log_t)_LSEnumeratorLog, OS_LOG_TYPE_DEBUG))
      {
        -[_LSApplicationExtensionRecordEnumerator _getObject:atIndex:context:].cold.1();
      }
    }
  }

  return v7 > a4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS____LSApplicationExtensionRecordEnumerator;
  v5 = -[_LSDBEnumerator copyWithZone:](&v13, sel_copyWithZone_);
  if (v5)
  {
    uint64_t v6 = -[NSString copyWithZone:](self->_extensionPointID, "copyWithZone:", a3);
    extensionPointID = v5->_extensionPointID;
    v5->_extensionPointID = (NSString *)v6;

    v5->_options = self->_options;
    uint64_t v8 = [self->_filterBlock copy];
    id filterBlock = v5->_filterBlock;
    v5->_id filterBlock = (id)v8;

    uint64_t v10 = -[LSPropertyList copyWithZone:](self->_propertyList, "copyWithZone:", a3);
    propertyList = v5->_propertyList;
    v5->_propertyList = v10;

    if (v5 != self) {
      std::vector<unsigned int>::__assign_with_size[abi:nn180100]<unsigned int *,unsigned int *>( (char *)&v5->_plugins,  (char *)self->_plugins.__begin_,  (uint64_t)self->_plugins.__end_,  self->_plugins.__end_ - self->_plugins.__begin_);
    }
    objc_storeStrong((id *)&v5->_extensionPointRecord, self->_extensionPointRecord);
  }

  return v5;
}

- (void).cxx_destruct
{
  p_plugins = &self->_plugins;
  begin = self->_plugins.__begin_;
  if (begin)
  {
    p_plugins->__end_ = begin;
    operator delete(begin);
  }

  objc_storeStrong((id *)&self->_propertyList, 0LL);
  objc_storeStrong(&self->_filterBlock, 0LL);
  objc_storeStrong((id *)&self->_extensionPointRecord, 0LL);
  objc_storeStrong((id *)&self->_extensionPointID, 0LL);
}

- (id).cxx_construct
{
  *((void *)self + 18) = 0LL;
  *((void *)self + 19) = 0LL;
  *((void *)self + 17) = 0LL;
  return self;
}

- (BOOL)_getExtensionPointID:(unsigned int *)a3 context:(LSContext *)a4 error:(id *)a5
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  extensionPointID = (const __CFString *)self->_extensionPointID;
  unsigned int StringForCFString = _LSDatabaseGetStringForCFString(a4->db, extensionPointID, 0);
  if (!StringForCFString)
  {
    v9 = (os_log_s *)_LSEnumeratorLog;
    BOOL v10 = os_log_type_enabled((os_log_t)_LSEnumeratorLog, OS_LOG_TYPE_DEFAULT);
    unsigned int StringForCFString = 0;
    if (v10)
    {
      uint64_t v11 = self->_extensionPointID;
      int v13 = 138477827;
      unint64_t v14 = v11;
      _os_log_impl( &dword_183E58000,  v9,  OS_LOG_TYPE_DEFAULT,  "Could not find extension point %{private}@ in database; will yield nothing",
        (uint8_t *)&v13,
        0xCu);
LABEL_5:
      unsigned int StringForCFString = 0;
    }
  }

  if (a3) {
    *a3 = StringForCFString;
  }
  return 1;
}

- (BOOL)_evaluatePluginNoIO:(unsigned int)a3 data:(const LSPluginData *)a4 extensionPointID:(unsigned int)a5 context:(LSContext *)a6
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  if (a5 && a4->var4 != a5)
  {
    uint64_t v16 = _LSEnumeratorLog;
    BOOL v15 = os_log_type_enabled((os_log_t)_LSEnumeratorLog, OS_LOG_TYPE_DEBUG);
    if (!v15) {
      return v15;
    }
    uint64_t var4 = a4->var4;
    int v25 = 134218496;
    uint64_t v26 = a3;
    __int16 v27 = 2048;
    *(void *)v28 = a5;
    *(_WORD *)&v28[8] = 2048;
    uint64_t v29 = var4;
    id v18 = "Skipping plugin %llx during enumeration because it is on the wrong extension point (want %llx, had %llx)";
    id v19 = (os_log_s *)v16;
    uint32_t v20 = 32;
    goto LABEL_17;
  }

  if ((self->_options & 1) != 0 && (*(_BYTE *)&a4->var0.flags & 1) != 0)
  {
    BOOL v15 = os_log_type_enabled((os_log_t)_LSEnumeratorLog, OS_LOG_TYPE_DEBUG);
    if (!v15) {
      return v15;
    }
    -[_LSApplicationExtensionRecordEnumerator(Private) _evaluatePluginNoIO:data:extensionPointID:context:].cold.2();
    goto LABEL_21;
  }

  unsigned int platform = self->_platform;
  if (platform && a4->var0.platform != platform)
  {
    uint64_t v21 = _LSEnumeratorLog;
    BOOL v15 = os_log_type_enabled((os_log_t)_LSEnumeratorLog, OS_LOG_TYPE_DEBUG);
    if (!v15) {
      return v15;
    }
    unsigned int v22 = a4->var0.platform;
    unsigned int v23 = self->_platform;
    int v25 = 134218496;
    uint64_t v26 = a3;
    __int16 v27 = 1024;
    *(_DWORD *)v28 = v22;
    *(_WORD *)&v28[4] = 1024;
    *(_DWORD *)&v28[6] = v23;
    id v18 = "Skipping plugin %llx during enumeration because it is the wrong platform (%x, want %x)";
    id v19 = (os_log_s *)v21;
    uint32_t v20 = 24;
LABEL_17:
    _os_log_debug_impl(&dword_183E58000, v19, OS_LOG_TYPE_DEBUG, v18, (uint8_t *)&v25, v20);
    goto LABEL_21;
  }

  if (self->_filterBlock)
  {
    +[_LSLazyPropertyList lazyPropertyListWithContext:unit:]( &OBJC_CLASS____LSLazyPropertyList,  "lazyPropertyListWithContext:unit:",  a6,  a4->var0.infoDictionary);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[_LSLazyPropertyList lazyPropertyListWithContext:unit:]( &OBJC_CLASS____LSLazyPropertyList,  "lazyPropertyListWithContext:unit:",  a6,  _LSPluginGetSDKDictionaryDataUnit(a6->db, a3, (uint64_t)a4));
    int v13 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v14 = -[_LSPlugInPropertyList initWithInfoPlist:SDKPlist:]( objc_alloc(&OBJC_CLASS____LSPlugInPropertyList),  "initWithInfoPlist:SDKPlist:",  v12,  v13);
    objc_storeStrong((id *)&self->_propertyList, v14);
    if (((*((uint64_t (**)(void))self->_filterBlock + 2))() & 1) != 0)
    {

      goto LABEL_10;
    }

    if (os_log_type_enabled((os_log_t)_LSEnumeratorLog, OS_LOG_TYPE_DEBUG)) {
      -[_LSApplicationExtensionRecordEnumerator(Private) _evaluatePluginNoIO:data:extensionPointID:context:].cold.1();
    }

LABEL_21:
    LOBYTE(v15) = 0;
    return v15;
  }

- (void)_prepareWithContext:(uint64_t)a3 error:(uint64_t)a4 .cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)_getObject:atIndex:context:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_2_4();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_debug_impl( &dword_183E58000,  v1,  OS_LOG_TYPE_DEBUG,  "Skipping plugin %llx during enumeration because it is invalid: %{public}@",  v2,  0x16u);
  OUTLINED_FUNCTION_1();
}

@end