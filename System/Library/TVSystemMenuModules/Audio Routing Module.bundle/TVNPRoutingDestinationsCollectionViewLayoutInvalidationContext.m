@interface TVNPRoutingDestinationsCollectionViewLayoutInvalidationContext
- (BOOL)isEnabled;
- (TVNPRoutingDestinationsCollectionViewLayoutInvalidationContext)init;
- (void)setEnabled:(BOOL)a3;
@end

@implementation TVNPRoutingDestinationsCollectionViewLayoutInvalidationContext

- (TVNPRoutingDestinationsCollectionViewLayoutInvalidationContext)init
{
  SEL v6 = a2;
  v7 = 0LL;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVNPRoutingDestinationsCollectionViewLayoutInvalidationContext;
  v4 = -[TVNPRoutingDestinationsCollectionViewLayoutInvalidationContext init](&v5, "init");
  v7 = v4;
  objc_storeStrong((id *)&v7, v4);
  if (v4) {
    v7->_enabled = 1;
  }
  v3 = v7;
  objc_storeStrong((id *)&v7, 0LL);
  return v3;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

@end