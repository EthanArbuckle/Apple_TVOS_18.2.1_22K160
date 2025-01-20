@interface CPLPrequeliteSynthesizedVariable
+ (void)initialize;
- (id)valueWithConstructor:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation CPLPrequeliteSynthesizedVariable

+ (void)initialize
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSObject);
  v3 = (void *)qword_1002A3B20;
  qword_1002A3B20 = (uint64_t)v2;
}

- (id)valueWithConstructor:(id)a3
{
  v4 = (uint64_t (**)(void))a3;
  if (-[CPLPrequeliteVariable hasCachedValueForIdentifier:](self, "hasCachedValueForIdentifier:", qword_1002A3B20))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( -[CPLPrequeliteVariable cachedValueForIdentifier:]( self,  "cachedValueForIdentifier:",  qword_1002A3B20));
  }

  else
  {
    uint64_t v6 = v4[2](v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[CPLPrequeliteVariable setCachedValue:forIdentifier:](self, "setCachedValue:forIdentifier:", v5, qword_1002A3B20);
  }

  return v5;
}

- (void)setValue:(id)a3
{
}

@end