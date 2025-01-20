@interface LACDTOMutableSensorRepairState
+ (id)nullInstance;
- (BOOL)isEqual:(id)a3;
- (LACDTOMutableSensorRepairState)initWithFlag:(int64_t)a3;
- (NSString)description;
- (int64_t)repairFlag;
- (void)setRepairFlag:(int64_t)a3;
@end

@implementation LACDTOMutableSensorRepairState

- (LACDTOMutableSensorRepairState)initWithFlag:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___LACDTOMutableSensorRepairState;
  result = -[LACDTOMutableSensorRepairState init](&v5, sel_init);
  if (result) {
    result->_repairFlag = a3;
  }
  return result;
}

+ (id)nullInstance
{
  v2 = objc_alloc_init(&OBJC_CLASS___LACDTOMutableSensorRepairState);
  -[LACDTOMutableSensorRepairState setRepairFlag:](v2, "setRepairFlag:", 0LL);
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_18C799BE0])
  {
    id v5 = v4;
    int64_t v6 = -[LACDTOMutableSensorRepairState repairFlag](self, "repairFlag");
    uint64_t v7 = [v5 repairFlag];

    BOOL v8 = v6 == v7;
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (NSString)description
{
  v13[1] = *MEMORY[0x1895F89C0];
  v3 = (void *)NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = (void *)NSString;
  int64_t v6 = -[LACDTOMutableSensorRepairState repairFlag](self, "repairFlag");
  else {
    uint64_t v7 = off_18A36A008[v6 - 1];
  }
  [v5 stringWithFormat:@"repairFlag: %@", v7];
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  [MEMORY[0x189603F18] arrayWithObjects:v13 count:1];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 componentsJoinedByString:@"; "];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"<%@ %p; %@>", v4, self, v10];
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (int64_t)repairFlag
{
  return self->_repairFlag;
}

- (void)setRepairFlag:(int64_t)a3
{
  self->_repairFlag = a3;
}

@end