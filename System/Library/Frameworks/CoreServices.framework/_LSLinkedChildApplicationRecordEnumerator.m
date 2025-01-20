@interface _LSLinkedChildApplicationRecordEnumerator
- (BOOL)_getObject:(id *)a3 atIndex:(unint64_t)a4 context:(LSContext *)a5;
- (BOOL)_prepareWithContext:(LSContext *)a3 error:(id *)a4;
- (_LSLinkedChildApplicationRecordEnumerator)initWithContext:(LSContext *)a3 parentBundleID:(id)a4 options:(unint64_t)a5;
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation _LSLinkedChildApplicationRecordEnumerator

- (_LSLinkedChildApplicationRecordEnumerator)initWithContext:(LSContext *)a3 parentBundleID:(id)a4 options:(unint64_t)a5
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS____LSLinkedChildApplicationRecordEnumerator;
  v7 = -[_LSDBEnumerator _initWithContext:](&v11, sel__initWithContext_, a3);
  if (v7)
  {
    uint64_t v8 = [a4 copy];
    parentBundleID = v7->_parentBundleID;
    v7->_parentBundleID = (NSString *)v8;

    v7->_options = a5;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS____LSLinkedChildApplicationRecordEnumerator;
  v5 = -[_LSDBEnumerator copyWithZone:](&v10, sel_copyWithZone_);
  v6 = v5;
  if (v5 != self) {
    std::vector<unsigned int>::__assign_with_size[abi:nn180100]<unsigned int *,unsigned int *>( (char *)&v5->_units,  (char *)self->_units.__begin_,  (uint64_t)self->_units.__end_,  self->_units.__end_ - self->_units.__begin_);
  }
  uint64_t v7 = -[NSString copyWithZone:](self->_parentBundleID, "copyWithZone:", a3);
  parentBundleID = v6->_parentBundleID;
  v6->_parentBundleID = (NSString *)v7;

  v6->_options = self->_options;
  return v6;
}

- (BOOL)_prepareWithContext:(LSContext *)a3 error:(id *)a4
{
  self->_units.__end_ = self->_units.__begin_;
  return 1;
}

- (BOOL)_getObject:(id *)a3 atIndex:(unint64_t)a4 context:(LSContext *)a5
{
  begin = self->_units.__begin_;
  unint64_t v7 = self->_units.__end_ - begin;
  if (v7 > a4)
  {
    objc_super v11 = (LSContext *)begin[a4];
    uint64_t v12 = _LSBundleGet(a5->db, begin[a4]);
    if (v12 && (uint64_t v13 = v12, evaluateBundleNoIOCommon(v11, v12, (const LSBundleData *)self->_options)))
    {
      id v20 = 0LL;
      id v14 = -[LSApplicationRecord _initWithContext:bundleID:bundleData:error:]( objc_alloc(&OBJC_CLASS___LSApplicationRecord),  "_initWithContext:bundleID:bundleData:error:",  a5,  v11,  v13,  &v20);
      id v15 = v20;
      if (!v14)
      {
        _LSDefaultLog();
        v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          -[_LSLinkedChildApplicationRecordEnumerator _getObject:atIndex:context:].cold.1();
        }

        _LSEnumeratorFireErrorHandler((unsigned __int8 *)self, v15);
      }

      id v17 = *a3;
      *a3 = v14;
    }

    else
    {
      id v18 = *a3;
      *a3 = 0LL;
    }
  }

  return v7 > a4;
}

- (void).cxx_destruct
{
  begin = self->_units.__begin_;
  if (begin)
  {
    self->_units.__end_ = begin;
    operator delete(begin);
  }

- (id).cxx_construct
{
  *((void *)self + 12) = 0LL;
  *((void *)self + 13) = 0LL;
  *((void *)self + 11) = 0LL;
  return self;
}

- (void)_getObject:atIndex:context:.cold.1()
{
}

@end