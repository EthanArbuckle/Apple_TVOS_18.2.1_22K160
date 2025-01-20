@interface FPMemoryMultiRegion
- (NSString)auxDataName;
- (id)auxData;
- (unint64_t)regionSize;
- (unsigned)totalRegions;
- (void)setAuxDataName:(id)a3;
- (void)setRegionSize:(unint64_t)a3;
- (void)setTotalRegions:(unsigned int)a3;
@end

@implementation FPMemoryMultiRegion

- (id)auxData
{
  v5 = @"element_size";
  v2 = -[FPAuxData initWithValue:shouldAggregate:]( objc_alloc(&OBJC_CLASS___FPAuxData),  "initWithValue:shouldAggregate:",  self->_regionSize,  0LL);
  v6 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));

  return v3;
}

- (NSString)auxDataName
{
  auxDataName = self->_auxDataName;
  if (auxDataName) {
    return auxDataName;
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___FPMemoryMultiRegion;
  v4 = -[FPMemoryRegion auxDataName](&v5, "auxDataName");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue(v4);
}

- (void)setAuxDataName:(id)a3
{
}

- (unsigned)totalRegions
{
  return self->_totalRegions;
}

- (void)setTotalRegions:(unsigned int)a3
{
  self->_totalRegions = a3;
}

- (unint64_t)regionSize
{
  return self->_regionSize;
}

- (void)setRegionSize:(unint64_t)a3
{
  self->_regionSize = a3;
}

- (void).cxx_destruct
{
}

@end