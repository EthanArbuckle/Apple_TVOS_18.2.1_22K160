@interface PLNetworkEnergyModel
- (NSArray)linkCost;
- (NSArray)linkDuration;
- (NSArray)linkLevel1Parameters;
- (NSString)taskUUID;
- (PLNetworkEnergyModel)initWithLinkType:(unsigned __int8)a3;
- (PLNetworkEnergyModel)initWithLinkType:(unsigned __int8)a3 withTaskUUID:(id)a4;
- (double)computeLevel1TimeWithBytes:(double)a3;
- (double)getEnergy;
- (double)overallBytes;
- (double)overallDuration;
- (double)powerlevel1Duration;
- (double)powerlevel2Duration;
- (double)powerlevel3Duration;
- (id)description;
- (unsigned)linkType;
- (unsigned)updateCount;
- (void)reportEnergyToPowerlogWithClientID:(signed __int16)a3;
- (void)setLinkCost:(id)a3;
- (void)setLinkDuration:(id)a3;
- (void)setLinkLevel1Parameters:(id)a3;
- (void)setLinkType:(unsigned __int8)a3;
- (void)setOverallBytes:(double)a3;
- (void)setOverallDuration:(double)a3;
- (void)setPowerlevel1Duration:(double)a3;
- (void)setPowerlevel2Duration:(double)a3;
- (void)setPowerlevel3Duration:(double)a3;
- (void)setTaskUUID:(id)a3;
- (void)setUpdateCount:(unsigned int)a3;
- (void)updateAllLevelTimesWithLevel1Time:(double)a3 withUpdateDuration:(double)a4;
- (void)updateWithBytes:(double)a3 withDuration:(double)a4;
@end

@implementation PLNetworkEnergyModel

- (PLNetworkEnergyModel)initWithLinkType:(unsigned __int8)a3
{
  v22[4] = *MEMORY[0x1895F89C0];
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___PLNetworkEnergyModel;
  v4 = -[PLNetworkEnergyModel init](&v18, sel_init);
  v5 = (PLNetworkEnergyModel *)v4;
  if (v4)
  {
    *(void *)(v4 + 20) = 0LL;
    *(void *)(v4 + 12) = 0LL;
    *((_DWORD *)v4 + 9) = 0;
    *(void *)(v4 + 28) = 0LL;
    v4[8] = a3;
    *((void *)v4 + 5) = 0LL;
    *((void *)v4 + 6) = 0LL;
    v6 = (void *)*((void *)v4 + 7);
    *((void *)v4 + 7) = &stru_189E9F260;

    linkDuration = v5->_linkDuration;
    v5->_linkDuration = (NSArray *)&unk_189EA4980;

    linkCost = v5->_linkCost;
    v5->_linkCost = (NSArray *)&unk_189EA49F8;

    v22[0] = &unk_189EA4A10;
    [MEMORY[0x189607968] numberWithDouble:0.000002];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v9;
    v21[1] = &unk_189EA45C8;
    [MEMORY[0x189603F18] arrayWithObjects:v21 count:2];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v10;
    [MEMORY[0x189607968] numberWithDouble:0.000005];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v11;
    v20[1] = &unk_189EA4A28;
    [MEMORY[0x189603F18] arrayWithObjects:v20 count:2];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22[2] = v12;
    [MEMORY[0x189607968] numberWithDouble:0.000001];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v13;
    v19[1] = &unk_189EA4A28;
    [MEMORY[0x189603F18] arrayWithObjects:v19 count:2];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22[3] = v14;
    uint64_t v15 = [MEMORY[0x189603F18] arrayWithObjects:v22 count:4];
    linkLevel1Parameters = v5->_linkLevel1Parameters;
    v5->_linkLevel1Parameters = (NSArray *)v15;
  }

  return v5;
}

- (PLNetworkEnergyModel)initWithLinkType:(unsigned __int8)a3 withTaskUUID:(id)a4
{
  uint64_t v5 = a3;
  id v7 = a4;
  v8 = -[PLNetworkEnergyModel initWithLinkType:](self, "initWithLinkType:", v5);
  v9 = v8;
  if (v7 && v8) {
    objc_storeStrong((id *)&v8->_taskUUID, a4);
  }

  return v9;
}

- (id)description
{
  v3 = (void *)NSString;
  -[PLNetworkEnergyModel powerlevel1Duration](self, "powerlevel1Duration");
  uint64_t v5 = v4;
  -[PLNetworkEnergyModel powerlevel2Duration](self, "powerlevel2Duration");
  uint64_t v7 = v6;
  -[PLNetworkEnergyModel powerlevel3Duration](self, "powerlevel3Duration");
  uint64_t v9 = v8;
  unsigned int v10 = -[PLNetworkEnergyModel linkType](self, "linkType");
  -[PLNetworkEnergyModel overallBytes](self, "overallBytes");
  uint64_t v12 = v11;
  -[PLNetworkEnergyModel overallDuration](self, "overallDuration");
  uint64_t v14 = v13;
  -[PLNetworkEnergyModel getEnergy](self, "getEnergy");
  uint64_t v16 = v15;
  v17 = -[PLNetworkEnergyModel taskUUID](self, "taskUUID");
  [v3 stringWithFormat:@"powerlevel1Duration=%f, powerlevel2Duration=%f, powerlevel3Duration=%f, linkType=%d, overallBytes=%f, overallDuration=%f TotalEnergy=%f, taskID=%@", v5, v7, v9, v10, v12, v14, v16, v17];
  objc_super v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (void)updateWithBytes:(double)a3 withDuration:(double)a4
{
}

- (double)getEnergy
{
  double v4 = v3;
  -[PLNetworkEnergyModel linkCost](self, "linkCost");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", -[PLNetworkEnergyModel linkType](self, "linkType"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 objectAtIndexedSubscript:0];
  double v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 doubleValue];
  double v9 = v8;
  -[PLNetworkEnergyModel powerlevel2Duration](self, "powerlevel2Duration");
  double v11 = v10;
  -[PLNetworkEnergyModel linkCost](self, "linkCost");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", -[PLNetworkEnergyModel linkType](self, "linkType"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 objectAtIndexedSubscript:1];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 doubleValue];
  double v16 = v11 * v15 + v4 * v9;
  -[PLNetworkEnergyModel powerlevel3Duration](self, "powerlevel3Duration");
  double v18 = v17;
  v19 = -[PLNetworkEnergyModel linkCost](self, "linkCost");
  objc_msgSend(v19, "objectAtIndexedSubscript:", -[PLNetworkEnergyModel linkType](self, "linkType"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 objectAtIndexedSubscript:2];
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 doubleValue];
  double v23 = (v16 + v18 * v22) / 3600.0;

  return v23;
}

- (double)computeLevel1TimeWithBytes:(double)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", -[PLNetworkEnergyModel linkType](self, "linkType"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 objectAtIndexedSubscript:0];
  double v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 doubleValue];
  double v9 = v8;
  -[PLNetworkEnergyModel linkLevel1Parameters](self, "linkLevel1Parameters");
  double v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", -[PLNetworkEnergyModel linkType](self, "linkType"));
  double v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 objectAtIndexedSubscript:1];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 doubleValue];
  double v14 = v13 + a3 * v9;

  return v14;
}

- (void)updateAllLevelTimesWithLevel1Time:(double)a3 withUpdateDuration:(double)a4
{
  double v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", -[PLNetworkEnergyModel linkType](self, "linkType"));
  double v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 objectAtIndexedSubscript:1];
  double v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 doubleValue];
  double v11 = v10;

  -[PLNetworkEnergyModel linkDuration](self, "linkDuration");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", -[PLNetworkEnergyModel linkType](self, "linkType"));
  double v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 objectAtIndexedSubscript:2];
  double v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 doubleValue];
  double v16 = v15;

  if (a4 >= a3) {
    double v17 = a3;
  }
  else {
    double v17 = a4;
  }
  -[PLNetworkEnergyModel powerlevel1Duration](self, "powerlevel1Duration");
  -[PLNetworkEnergyModel setPowerlevel1Duration:](self, "setPowerlevel1Duration:", v17 + v18);
  double v19 = a4 - a3;
  double v20 = fmax(v19, 0.0);
  if (v11 >= v20) {
    double v21 = v20;
  }
  else {
    double v21 = v11;
  }
  -[PLNetworkEnergyModel powerlevel2Duration](self, "powerlevel2Duration");
  -[PLNetworkEnergyModel setPowerlevel2Duration:](self, "setPowerlevel2Duration:", v21 + v22);
  double v23 = fmax(v19 - v11, 0.0);
  if (v16 >= v23) {
    double v24 = v23;
  }
  else {
    double v24 = v16;
  }
  -[PLNetworkEnergyModel powerlevel3Duration](self, "powerlevel3Duration");
  -[PLNetworkEnergyModel setPowerlevel3Duration:](self, "setPowerlevel3Duration:", v24 + v25);
}

- (void)reportEnergyToPowerlogWithClientID:(signed __int16)a3
{
  uint64_t v3 = a3;
  v17[6] = *MEMORY[0x1895F89C0];
  -[PLNetworkEnergyModel getEnergy](self, "getEnergy");
  v16[0] = @"Energy";
  objc_msgSend(MEMORY[0x189607968], "numberWithDouble:");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v5;
  v16[1] = @"UpdateCount";
  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:", -[PLNetworkEnergyModel updateCount](self, "updateCount"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v6;
  v16[2] = @"OverallBytes";
  double v7 = (void *)MEMORY[0x189607968];
  -[PLNetworkEnergyModel overallBytes](self, "overallBytes");
  objc_msgSend(v7, "numberWithDouble:");
  double v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v8;
  v16[3] = @"OverallDuration";
  double v9 = (void *)MEMORY[0x189607968];
  -[PLNetworkEnergyModel overallDuration](self, "overallDuration");
  objc_msgSend(v9, "numberWithDouble:");
  double v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v10;
  v16[4] = @"LinkType";
  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedChar:", -[PLNetworkEnergyModel linkType](self, "linkType"));
  double v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v11;
  v16[5] = @"taskUUID";
  uint64_t v12 = -[PLNetworkEnergyModel taskUUID](self, "taskUUID");
  double v13 = (void *)v12;
  double v14 = &stru_189E9F260;
  if (v12) {
    double v14 = (const __CFString *)v12;
  }
  v17[5] = v14;
  [MEMORY[0x189603F68] dictionaryWithObjects:v17 forKeys:v16 count:6];
  double v15 = (void *)objc_claimAutoreleasedReturnValue();

  PLLogRegisteredEvent(v3, @"NetworkEnergyModel", v15);
}

- (double)powerlevel1Duration
{
  return self->_powerlevel1Duration;
}

- (void)setPowerlevel1Duration:(double)a3
{
  self->_powerlevel1Duration = a3;
}

- (double)powerlevel2Duration
{
  return self->_powerlevel2Duration;
}

- (void)setPowerlevel2Duration:(double)a3
{
  self->_powerlevel2Duration = a3;
}

- (double)powerlevel3Duration
{
  return self->_powerlevel3Duration;
}

- (void)setPowerlevel3Duration:(double)a3
{
  self->_powerlevel3Duration = a3;
}

- (unsigned)linkType
{
  return self->_linkType;
}

- (void)setLinkType:(unsigned __int8)a3
{
  self->_linkType = a3;
}

- (double)overallBytes
{
  return self->_overallBytes;
}

- (void)setOverallBytes:(double)a3
{
  self->_overallBytes = a3;
}

- (double)overallDuration
{
  return self->_overallDuration;
}

- (void)setOverallDuration:(double)a3
{
  self->_overallDuration = a3;
}

- (unsigned)updateCount
{
  return self->_updateCount;
}

- (void)setUpdateCount:(unsigned int)a3
{
  self->_updateCount = a3;
}

- (NSString)taskUUID
{
  return (NSString *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setTaskUUID:(id)a3
{
}

- (NSArray)linkCost
{
  return (NSArray *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setLinkCost:(id)a3
{
}

- (NSArray)linkDuration
{
  return (NSArray *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setLinkDuration:(id)a3
{
}

- (NSArray)linkLevel1Parameters
{
  return (NSArray *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setLinkLevel1Parameters:(id)a3
{
}

- (void).cxx_destruct
{
}

@end