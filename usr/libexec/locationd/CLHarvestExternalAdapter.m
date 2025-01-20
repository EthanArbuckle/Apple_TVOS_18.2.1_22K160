@interface CLHarvestExternalAdapter
- (BOOL)valid;
- (CLHarvestExternalAdapter)initWithHarvesterExternal:(void *)a3 andSilo:(id)a4;
- (void)invalidate;
- (void)onVisit:(id)a3;
- (void)setValid:(BOOL)a3;
@end

@implementation CLHarvestExternalAdapter

- (CLHarvestExternalAdapter)initWithHarvesterExternal:(void *)a3 andSilo:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CLHarvestExternalAdapter;
  result = -[CLHarvestExternalAdapter init](&v7, "init");
  if (result)
  {
    result->_harvesterExternal = a3;
    result->_silo = (CLDispatchSilo *)a4;
    result->_valid = 1;
  }

  else
  {
    MEMORY[0x18] = 0;
  }

  return result;
}

- (void)onVisit:(id)a3
{
}

- (void)invalidate
{
  self->_valid = 0;
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

@end