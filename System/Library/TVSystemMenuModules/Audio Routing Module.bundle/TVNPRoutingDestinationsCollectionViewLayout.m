@interface TVNPRoutingDestinationsCollectionViewLayout
+ (Class)invalidationContextClass;
+ (Class)layoutAttributesClass;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (void)invalidateLayoutWithContext:(id)a3;
@end

@implementation TVNPRoutingDestinationsCollectionViewLayout

+ (Class)layoutAttributesClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___TVNPRoutingDestinationsCollectionViewLayoutAttributes);
}

+ (Class)invalidationContextClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___TVNPRoutingDestinationsCollectionViewLayoutInvalidationContext);
}

- (void)invalidateLayoutWithContext:(id)a3
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v6 = location[0];
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___TVNPRoutingDestinationsCollectionViewLayoutInvalidationContext);
  if ((objc_opt_isKindOfClass(v6, v3) & 1) != 0)
  {
    unsigned __int8 v4 = [location[0] isEnabled];
    v9->_enabled = v4 & 1;
  }

  v7.receiver = v9;
  v7.super_class = (Class)&OBJC_CLASS___TVNPRoutingDestinationsCollectionViewLayout;
  -[TVNPRoutingDestinationsCollectionViewLayout invalidateLayoutWithContext:]( &v7,  "invalidateLayoutWithContext:",  location[0],  location);
  objc_storeStrong(v5, 0LL);
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGRect v16 = a3;
  v15 = self;
  v14[1] = (id)a2;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TVNPRoutingDestinationsCollectionViewLayout;
  v14[0] =  -[TVNPRoutingDestinationsCollectionViewLayout layoutAttributesForElementsInRect:]( &v13,  "layoutAttributesForElementsInRect:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  memset(__b, 0, sizeof(__b));
  id obj = v14[0];
  id v10 = [obj countByEnumeratingWithState:__b objects:v17 count:16];
  if (v10)
  {
    uint64_t v6 = *(void *)__b[2];
    uint64_t v7 = 0LL;
    id v8 = v10;
    while (1)
    {
      uint64_t v5 = v7;
      if (*(void *)__b[2] != v6) {
        objc_enumerationMutation(obj);
      }
      id v12 = *(id *)(__b[1] + 8 * v7);
      [v12 setEnabled:v15->_enabled];
      ++v7;
      if (v5 + 1 >= (unint64_t)v8)
      {
        uint64_t v7 = 0LL;
        id v8 = [obj countByEnumeratingWithState:__b objects:v17 count:16];
        if (!v8) {
          break;
        }
      }
    }
  }

  id v4 = v14[0];
  objc_storeStrong(v14, 0LL);
  return v4;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v5.receiver = v8;
  v5.super_class = (Class)&OBJC_CLASS___TVNPRoutingDestinationsCollectionViewLayout;
  id v6 =  -[TVNPRoutingDestinationsCollectionViewLayout layoutAttributesForItemAtIndexPath:]( &v5,  "layoutAttributesForItemAtIndexPath:",  location[0]);
  [v6 setEnabled:v8->_enabled];
  id v4 = v6;
  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(location, 0LL);
  return v4;
}

@end