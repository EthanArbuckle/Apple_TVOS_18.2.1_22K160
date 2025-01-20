@interface _LSBindingForLog
- (_LSBindingForLog)initWithState:(const void *)a3 binding:(const LSBinding *)a4;
- (id).cxx_construct;
- (id)description;
- (id)redactedDescription;
@end

@implementation _LSBindingForLog

- (id).cxx_construct
{
  *((_DWORD *)self + 4) = 0;
  *((void *)self + 3) = 0LL;
  *((_DWORD *)self + 8) = 0;
  *((void *)self + 6) = 0LL;
  *((void *)self + 7) = 0LL;
  *((void *)self + 5) = 0LL;
  return self;
}

- (_LSBindingForLog)initWithState:(const void *)a3 binding:(const LSBinding *)a4
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS____LSBindingForLog;
  v6 = -[_LSBindingForLog init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_db, **(id **)a3);
    __int128 v8 = *(_OWORD *)&a4->claim;
    *(_OWORD *)&v7->_binding.bundle = *(_OWORD *)&a4->bundle;
    *(_OWORD *)&v7->_binding.claim = v8;
    objc_storeStrong((id *)&v7->_binding.userInfo, a4->userInfo);
    objc_storeStrong((id *)&v7->_binding.var0, a4->var0);
  }

  return v7;
}

- (void).cxx_destruct
{
}

- (id)description
{
  v3 = (void *)_CSStringCopyCFString();
  if (!v3)
  {
    v3 = (void *)_CSStringCopyCFString();
    if (!v3) {
      v3 = (void *)_CSStringCopyCFString();
    }
  }

  v4 = (void *)[objc_alloc(NSString) initWithFormat:@"%@%@ (B:0x%llx, C:0x%llx)", v3, &stru_189D7B4C8, self->_binding.bundle, self->_binding.claim];

  return v4;
}

- (id)redactedDescription
{
  return (id)[objc_alloc(NSString) initWithFormat:@"<private>%@ (B:0x%llx, C:0x%llx)", &stru_189D7B4C8, self->_binding.bundle, self->_binding.claim];
}

@end