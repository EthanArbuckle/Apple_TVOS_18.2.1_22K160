@interface _PFWeakReference
+ (id)weakReferenceWithObject:(uint64_t)a1;
- (BOOL)isEqual:(id)a3;
- (_PFWeakReference)initWithObject:(id)a3;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation _PFWeakReference

+ (id)weakReferenceWithObject:(uint64_t)a1
{
  v3 = (objc_class *)objc_opt_self();
  if (a2) {
    return (id)[[v3 alloc] initWithObject:a2];
  }
  else {
    return 0LL;
  }
}

- (_PFWeakReference)initWithObject:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS____PFWeakReference;
  v4 = -[_PFWeakReference init](&v7, sel_init);
  v5 = v4;
  if (!a3) {
    goto LABEL_5;
  }
  if (v4)
  {
    if (objc_storeWeakOrNil(&v4->_object, a3))
    {
      v5->_objectAddress = (int64_t)a3;
      return v5;
    }

- (void)dealloc
{
  if (self->_objectAddress) {
    objc_storeWeakOrNil(&self->_object, 0LL);
  }
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____PFWeakReference;
  -[_PFWeakReference dealloc](&v3, sel_dealloc);
}

- (unint64_t)hash
{
  return self->_objectAddress;
}

- (BOOL)isEqual:(id)a3
{
  return (objc_opt_isKindOfClass() & 1) != 0 && *((void *)a3 + 2) == self->_objectAddress;
}

@end