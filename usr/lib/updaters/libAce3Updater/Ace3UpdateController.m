@interface Ace3UpdateController
- (id)createUpdaterInstanceFor:(unsigned int)a3 helper:(id)a4 options:(id)a5;
@end

@implementation Ace3UpdateController

- (id)createUpdaterInstanceFor:(unsigned int)a3 helper:(id)a4 options:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v7 = a5;
  id v8 = a4;
  v9 = -[UARPSoCUpdaterInstance initWithLogicUnitNumber:helper:options:]( objc_alloc(&OBJC_CLASS___Ace3UpdaterInstance),  "initWithLogicUnitNumber:helper:options:",  v6,  v8,  v7);

  return v9;
}

@end