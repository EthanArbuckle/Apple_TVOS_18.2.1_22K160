@interface PBMRSupportedPlaybackRatesTransaction
- (NSArray)supportedPlaybackRates;
- (PBMRSupportedCommandsProviding)supportedCommandsProvider;
- (PBMRSupportedPlaybackRatesTransaction)initWithParentTransaction:(id)a3;
- (PBMRSupportedPlaybackRatesTransaction)initWithQueue:(id)a3 supportedCommandsProvider:(id)a4;
- (PBPlaybackRateList)supportedPlaybackRateList;
- (id)_changePlaybackRateCommandInfo;
- (id)queue;
- (void)_begin;
@end

@implementation PBMRSupportedPlaybackRatesTransaction

- (PBMRSupportedPlaybackRatesTransaction)initWithQueue:(id)a3 supportedCommandsProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___PBMRSupportedPlaybackRatesTransaction;
  v9 = -[PBMRSupportedPlaybackRatesTransaction init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    objc_storeWeak((id *)&v10->_supportedCommandsProvider, v8);
  }

  return v10;
}

- (PBMRSupportedPlaybackRatesTransaction)initWithParentTransaction:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 queue]);
  v6 = -[PBMRSupportedPlaybackRatesTransaction initWithQueue:supportedCommandsProvider:]( self,  "initWithQueue:supportedCommandsProvider:",  v5,  v4);

  if (v6) {
    [v4 addChildTransaction:v6 withSchedulingPolicy:1];
  }

  return v6;
}

- (id)queue
{
  return self->_queue;
}

- (void)_begin
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PBMRSupportedPlaybackRatesTransaction;
  -[PBMRSupportedPlaybackRatesTransaction _begin](&v7, "_begin");
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[PBMRSupportedPlaybackRatesTransaction _changePlaybackRateCommandInfo]( self,  "_changePlaybackRateCommandInfo"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 options]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:kMRMediaRemoteCommandInfoSupportedPlaybackRates]);
  if (v5) {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v5));
  }
  else {
    v6 = 0LL;
  }
  objc_storeStrong((id *)&self->_supportedPlaybackRates, v6);
  if (v5) {
}
  }

- (id)_changePlaybackRateCommandInfo
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_supportedCommandsProvider);
  v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained supportedCommands]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bs_firstObjectPassingTest:", &stru_1003D7658));

  return v4;
}

- (NSArray)supportedPlaybackRates
{
  return self->_supportedPlaybackRates;
}

- (PBMRSupportedCommandsProviding)supportedCommandsProvider
{
  return (PBMRSupportedCommandsProviding *)objc_loadWeakRetained((id *)&self->_supportedCommandsProvider);
}

- (void).cxx_destruct
{
}

- (PBPlaybackRateList)supportedPlaybackRateList
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBMRSupportedPlaybackRatesTransaction supportedPlaybackRates](self, "supportedPlaybackRates"));
  if (v2) {
    v3 = -[PBPlaybackRateList initWithNumberArray:]( objc_alloc(&OBJC_CLASS___PBPlaybackRateList),  "initWithNumberArray:",  v2);
  }
  else {
    v3 = 0LL;
  }

  return v3;
}

@end