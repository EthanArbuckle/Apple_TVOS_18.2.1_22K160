@interface SADyldInfo
- (id)debugDescription;
- (id)initWithTask:(id *)a1;
@end

@implementation SADyldInfo

- (id)initWithTask:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_CLASS___SADyldInfo;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5) {
      objc_storeStrong(v5 + 2, a2);
    }
  }

  return a1;
}

- (id)debugDescription
{
  id v3 = objc_alloc(NSString);
  uint64_t v4 = -[SATask debugDescription](self->_task, "debugDescription");
  v5 = (void *)v4;
  if (self->_isSharedCache) {
    v6 = @" (shared cache)";
  }
  else {
    v6 = &stru_189F64BD8;
  }
  objc_super v7 = (void *)[v3 initWithFormat:@"%@ DYLD info %@@0x%llx id:0x%llx %@%@ (dyld complete:%d, path complete:%d)", v4, *(_OWORD *)&self->_uuid, self->_stringID, self->_path, v6, self->_dyldInfoIsComplete, self->_pathIsComplete];

  return v7;
}

- (void).cxx_destruct
{
}

@end