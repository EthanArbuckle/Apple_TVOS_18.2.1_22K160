@interface SHLCloudContainerTransformer
- (SHLCloudContainerTransformer)initWithScope:(int64_t)a3;
- (id)cloudBackedContainer;
- (int64_t)scope;
- (void)setScope:(int64_t)a3;
@end

@implementation SHLCloudContainerTransformer

- (SHLCloudContainerTransformer)initWithScope:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SHLCloudContainerTransformer;
  result = -[SHLCloudContainerTransformer init](&v5, "init");
  if (result) {
    result->_scope = a3;
  }
  return result;
}

- (id)cloudBackedContainer
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SHLCloudContext sharedContext](&OBJC_CLASS___SHLCloudContext, "sharedContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "containerWithScope:", -[SHLCloudContainerTransformer scope](self, "scope")));

  objc_super v5 = -[SHLCloudBackedContainer initWithContainer:usingEncryption:]( objc_alloc(&OBJC_CLASS___SHLCloudBackedContainer),  "initWithContainer:usingEncryption:",  v4,  (id)-[SHLCloudContainerTransformer scope](self, "scope") == (id)1);
  return v5;
}

- (int64_t)scope
{
  return self->_scope;
}

- (void)setScope:(int64_t)a3
{
  self->_scope = a3;
}

@end