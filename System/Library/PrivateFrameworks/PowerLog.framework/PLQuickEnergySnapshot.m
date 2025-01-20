@interface PLQuickEnergySnapshot
- (NSDate)timestamp;
- (PLQuickEnergySnapshot)initWithEnergies:(double)a3 andNetworkEnergy:(double)a4;
- (double)computeEnergyDiff:(id)a3;
- (double)cpuEnergy;
- (double)getTotalEnergy;
- (double)networkEnergy;
- (id)description;
- (void)setCpuEnergy:(double)a3;
- (void)setNetworkEnergy:(double)a3;
- (void)setTimestamp:(id)a3;
@end

@implementation PLQuickEnergySnapshot

- (PLQuickEnergySnapshot)initWithEnergies:(double)a3 andNetworkEnergy:(double)a4
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___PLQuickEnergySnapshot;
  v6 = -[PLQuickEnergySnapshot init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    -[PLQuickEnergySnapshot setCpuEnergy:](v6, "setCpuEnergy:", a3);
    -[PLQuickEnergySnapshot setNetworkEnergy:](v7, "setNetworkEnergy:", a4);
    [MEMORY[0x189603F50] date];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLQuickEnergySnapshot setTimestamp:](v7, "setTimestamp:", v8);
  }

  return v7;
}

- (double)computeEnergyDiff:(id)a3
{
  id v4 = a3;
  -[PLQuickEnergySnapshot cpuEnergy](self, "cpuEnergy");
  double v6 = v5;
  [v4 cpuEnergy];
  double v8 = v6 - v7;
  -[PLQuickEnergySnapshot networkEnergy](self, "networkEnergy");
  double v10 = v8 + v9;
  [v4 networkEnergy];
  double v12 = v11;

  return v10 - v12;
}

- (double)getTotalEnergy
{
  double v4 = v3;
  -[PLQuickEnergySnapshot networkEnergy](self, "networkEnergy");
  return v4 + v5;
}

- (id)description
{
  double v3 = (void *)NSString;
  -[PLQuickEnergySnapshot timestamp](self, "timestamp");
  double v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLQuickEnergySnapshot cpuEnergy](self, "cpuEnergy");
  uint64_t v6 = v5;
  -[PLQuickEnergySnapshot networkEnergy](self, "networkEnergy");
  [v3 stringWithFormat:@"timestamp=%@, cpuEnergy=%f, networkEnergy=%f", v4, v6, v7];
  double v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSDate)timestamp
{
  return (NSDate *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setTimestamp:(id)a3
{
}

- (double)cpuEnergy
{
  return self->_cpuEnergy;
}

- (void)setCpuEnergy:(double)a3
{
  self->_cpuEnergy = a3;
}

- (double)networkEnergy
{
  return self->_networkEnergy;
}

- (void)setNetworkEnergy:(double)a3
{
  self->_networkEnergy = a3;
}

- (void).cxx_destruct
{
}

@end