@interface _LSExtensionPointRecordEnumerator
- (BOOL)_getObject:(id *)a3 atIndex:(unint64_t)a4 context:(LSContext *)a5;
- (BOOL)_prepareWithContext:(LSContext *)a3 error:(id *)a4;
- (LSApplicationRecord)parentApplicationRecord;
- (_LSExtensionPointRecordEnumerator)initWithExtensionPointIdentifier:(id)a3;
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setParentApplicationRecord:(id)a3;
@end

@implementation _LSExtensionPointRecordEnumerator

- (_LSExtensionPointRecordEnumerator)initWithExtensionPointIdentifier:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS____LSExtensionPointRecordEnumerator;
  v4 = -[_LSDBEnumerator _initWithContext:](&v8, sel__initWithContext_, 0LL);
  uint64_t v5 = [a3 copy];
  extensionPointID = v4->_extensionPointID;
  v4->_extensionPointID = (NSString *)v5;

  return v4;
}

- (BOOL)_prepareWithContext:(LSContext *)a3 error:(id *)a4
{
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  int v7 = [v6 unitID];

  int StringForCFString = _LSDatabaseGetStringForCFString(a3->db, (const __CFString *)self->_extensionPointID, 0);
  db = a3->db;
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __63___LSExtensionPointRecordEnumerator__prepareWithContext_error___block_invoke;
  v12[3] = &unk_189D76ED0;
  v12[4] = self;
  int v13 = v7;
  int v14 = StringForCFString;
  _LSEnumerateExtensionPoints(db, (uint64_t)v12);
  v10 = (os_log_s *)_LSEnumeratorLog;
  if (os_log_type_enabled((os_log_t)_LSEnumeratorLog, OS_LOG_TYPE_DEBUG)) {
    -[_LSExtensionPointRecordEnumerator _prepareWithContext:error:].cold.1((uint64_t)self, v10);
  }
  return 1;
}

- (BOOL)_getObject:(id *)a3 atIndex:(unint64_t)a4 context:(LSContext *)a5
{
  begin = self->_extensionIDs.__begin_;
  unint64_t v7 = self->_extensionIDs.__end_ - begin;
  if (v7 > a4)
  {
    uint64_t v8 = begin[a4];
    if ((_DWORD)v8)
    {
      if (_LSGetExtensionPointData((uint64_t)a5->db, begin[a4]))
      {
        id v11 = -[LSRecord _initWithContext:tableID:unitID:]( objc_alloc(&OBJC_CLASS___LSExtensionPointRecord),  "_initWithContext:tableID:unitID:",  a5,  a5->db->schema.extensionPointTable,  v8);
        id v12 = *a3;
        *a3 = v11;
      }
    }
  }

  return v7 > a4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS____LSExtensionPointRecordEnumerator;
  v4 = -[_LSDBEnumerator copyWithZone:](&v8, sel_copyWithZone_, a3);
  uint64_t v5 = v4;
  if (v4) {
    BOOL v6 = v4 == (char *)self;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6) {
    std::vector<unsigned int>::__assign_with_size[abi:nn180100]<unsigned int *,unsigned int *>( v4 + 96,  (char *)self->_extensionIDs.__begin_,  (uint64_t)self->_extensionIDs.__end_,  self->_extensionIDs.__end_ - self->_extensionIDs.__begin_);
  }
  return v5;
}

- (LSApplicationRecord)parentApplicationRecord
{
  return (LSApplicationRecord *)objc_getProperty(self, a2, 120LL, 1);
}

- (void)setParentApplicationRecord:(id)a3
{
}

- (void).cxx_destruct
{
  begin = self->_extensionIDs.__begin_;
  if (begin)
  {
    self->_extensionIDs.__end_ = begin;
    operator delete(begin);
  }

  objc_storeStrong((id *)&self->_extensionPointID, 0LL);
}

- (id).cxx_construct
{
  *((void *)self + 13) = 0LL;
  *((void *)self + 14) = 0LL;
  *((void *)self + 12) = 0LL;
  return self;
}

- (void)_prepareWithContext:(uint64_t)a1 error:(os_log_s *)a2 .cold.1(uint64_t a1, os_log_s *a2)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  uint64_t v2 = (uint64_t)(*(void *)(a1 + 104) - *(void *)(a1 + 96)) >> 2;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_183E58000, a2, OS_LOG_TYPE_DEBUG, "Will enumerate %llu EPs", (uint8_t *)&v3, 0xCu);
}

@end