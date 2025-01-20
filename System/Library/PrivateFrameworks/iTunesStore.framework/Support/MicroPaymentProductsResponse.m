@interface MicroPaymentProductsResponse
- (BOOL)loadFromDictionary:(id)a3 error:(id *)a4;
- (NSArray)expectedIdentifiers;
- (NSArray)invalidIdentifiers;
- (NSArray)products;
- (void)dealloc;
- (void)setExpectedIdentifiers:(id)a3;
@end

@implementation MicroPaymentProductsResponse

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MicroPaymentProductsResponse;
  -[MicroPaymentProductsResponse dealloc](&v3, "dealloc");
}

- (BOOL)loadFromDictionary:(id)a3 error:(id *)a4
{
  v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if (self->_expectedIdentifiers) {
    v8 = -[NSMutableSet initWithArray:]( objc_alloc(&OBJC_CLASS___NSMutableSet),  "initWithArray:",  self->_expectedIdentifiers);
  }
  else {
    v8 = 0LL;
  }
  id v9 = [a3 objectForKey:@"available-subproducts"];
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
  {
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v20;
      do
      {
        v14 = 0LL;
        do
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v9);
          }
          v15 = -[MicroPaymentProduct initWithDictionary:]( objc_alloc(&OBJC_CLASS___MicroPaymentProduct),  "initWithDictionary:",  *(void *)(*((void *)&v19 + 1) + 8LL * (void)v14));
          if (v15)
          {
            v16 = v15;
            -[NSMutableArray addObject:](v7, "addObject:", v15);
            -[NSMutableSet removeObject:]( v8,  "removeObject:",  -[MicroPaymentProduct productIdentifier](v16, "productIdentifier"));
          }

          v14 = (char *)v14 + 1;
        }

        while (v12 != v14);
        id v12 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }

      while (v12);
    }
  }

  if (-[NSMutableSet count](v8, "count")) {
    -[NSMutableArray addObjectsFromArray:](v6, "addObjectsFromArray:", -[NSMutableSet allObjects](v8, "allObjects"));
  }

  self->_invalidIdentifiers = (NSArray *)-[NSMutableArray copy](v6, "copy");
  self->_products = (NSArray *)-[NSMutableArray copy](v7, "copy");

  if (a4) {
    *a4 = 0LL;
  }
  return 1;
}

- (NSArray)expectedIdentifiers
{
  return self->_expectedIdentifiers;
}

- (void)setExpectedIdentifiers:(id)a3
{
}

- (NSArray)invalidIdentifiers
{
  return self->_invalidIdentifiers;
}

- (NSArray)products
{
  return self->_products;
}

@end