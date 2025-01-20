@interface PBFBSDisplayTransformer
- (PBFBSDisplayTransformer)init;
- (id)transformDisplayConfiguration:(id)a3;
@end

@implementation PBFBSDisplayTransformer

- (PBFBSDisplayTransformer)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PBFBSDisplayTransformer;
  v2 = -[PBFBSDisplayTransformer init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___PBTVMainDisplayTransformer);
    mainDisplayTransformer = v2->_mainDisplayTransformer;
    v2->_mainDisplayTransformer = (FBSDisplayTransformer *)v3;
  }

  return v2;
}

- (id)transformDisplayConfiguration:(id)a3
{
  mainDisplayTransformer = self->_mainDisplayTransformer;
  if (mainDisplayTransformer) {
    v4 = (void *)objc_claimAutoreleasedReturnValue( -[FBSDisplayTransformer transformDisplayConfiguration:]( mainDisplayTransformer,  "transformDisplayConfiguration:",  a3));
  }
  else {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", a3));
  }
  return v4;
}

- (void).cxx_destruct
{
}

@end