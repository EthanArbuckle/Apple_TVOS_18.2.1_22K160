@interface _LSTypeEnumerator
- (BOOL)_getObject:(id *)a3 atIndex:(unint64_t)a4 context:(LSContext *)a5;
- (BOOL)_prepareWithContext:(LSContext *)a3 error:(id *)a4;
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation _LSTypeEnumerator

- (BOOL)_prepareWithContext:(LSContext *)a3 error:(id *)a4
{
  v6 = (void *)MEMORY[0x186E2A59C](self, a2, a3, a4);
  db = a3->db;
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __47___LSTypeEnumerator__prepareWithContext_error___block_invoke;
  v9[3] = &unk_189D78E08;
  v9[4] = self;
  _UTEnumerateActiveTypes((uint64_t)db, v9);
  objc_autoreleasePoolPop(v6);
  return 1;
}

- (BOOL)_getObject:(id *)a3 atIndex:(unint64_t)a4 context:(LSContext *)a5
{
  begin = self->_typeIDs.__begin_;
  unint64_t v7 = self->_typeIDs.__end_ - begin;
  if (v7 > a4)
  {
    uint64_t v10 = begin[a4];
    if (_UTTypeGet())
    {
      id v11 = -[LSRecord _initWithContext:tableID:unitID:]( objc_alloc(&OBJC_CLASS____UTDeclaredTypeRecord),  "_initWithContext:tableID:unitID:",  a5,  a5->db->schema.utypeTable,  v10);
      id v12 = *a3;
      *a3 = v11;
    }
  }

  return v7 > a4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS____LSTypeEnumerator;
  v4 = -[_LSDBEnumerator copyWithZone:](&v8, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4) {
    BOOL v6 = v4 == (char *)self;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6) {
    std::vector<unsigned int>::__assign_with_size[abi:nn180100]<unsigned int *,unsigned int *>( v4 + 88,  (char *)self->_typeIDs.__begin_,  (uint64_t)self->_typeIDs.__end_,  self->_typeIDs.__end_ - self->_typeIDs.__begin_);
  }
  return v5;
}

- (void).cxx_destruct
{
  p_typeIDs = &self->_typeIDs;
  begin = self->_typeIDs.__begin_;
  if (begin)
  {
    p_typeIDs->__end_ = begin;
    operator delete(begin);
  }

- (id).cxx_construct
{
  *((void *)self + 12) = 0LL;
  *((void *)self + 13) = 0LL;
  *((void *)self + 11) = 0LL;
  return self;
}

@end