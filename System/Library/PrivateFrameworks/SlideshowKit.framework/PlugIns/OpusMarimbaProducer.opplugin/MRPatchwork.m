@interface MRPatchwork
- (MRPatchwork)init;
- (MRPatchwork)patchworkWithPatch:(id)a3;
- (void)addPatch:(id)a3;
- (void)dealloc;
- (void)removeAllPatches;
@end

@implementation MRPatchwork

- (MRPatchwork)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MRPatchwork;
  v2 = -[MRPatchwork init](&v4, "init");
  if (v2) {
    v2->_patches = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  }
  return v2;
}

- (void)dealloc
{
  self->_patches = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRPatchwork;
  -[MRPatchwork dealloc](&v3, "dealloc");
}

- (MRPatchwork)patchworkWithPatch:(id)a3
{
  objc_super v4 = objc_alloc_init(&OBJC_CLASS___MRPatchwork);
  -[MRPatchwork addPatch:](v4, "addPatch:", a3);
  return v4;
}

- (void)addPatch:(id)a3
{
}

- (void)removeAllPatches
{
}

@end