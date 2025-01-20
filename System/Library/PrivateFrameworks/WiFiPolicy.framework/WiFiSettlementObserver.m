@interface WiFiSettlementObserver
- (NSDate)settledDate;
- (NSMutableArray)callbacks;
- (WiFiScanProvider)scanProvider;
- (WiFiSettlementConfiguration)configuration;
- (WiFiSettlementContext)currentContext;
- (WiFiSettlementObserver)initWithScanProvider:(id)a3 configuration:(id)a4;
- (int64_t)status;
- (unint64_t)confidence;
- (unint64_t)consecutiveScansWithoutMatch;
- (void)_callSettlementCallbackWithStatus:(int64_t)a3 userInfo:(id)a4;
- (void)_handleScanResults:(id)a3 error:(id)a4 userInfo:(id)a5;
- (void)_updateSettlementStatus:(int64_t)a3 confidence:(unint64_t)a4;
- (void)addSettlementCallback:(id)a3;
- (void)removeSettlementCallback:(id)a3;
- (void)resetSettlement;
- (void)setCallbacks:(id)a3;
- (void)setConfidence:(unint64_t)a3;
- (void)setConfiguration:(id)a3;
- (void)setConsecutiveScansWithoutMatch:(unint64_t)a3;
- (void)setCurrentContext:(id)a3;
- (void)setScanProvider:(id)a3;
- (void)setSettledDate:(id)a3;
- (void)setStatus:(int64_t)a3;
@end

@implementation WiFiSettlementObserver

- (WiFiSettlementObserver)initWithScanProvider:(id)a3 configuration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___WiFiSettlementObserver;
  v9 = -[WiFiSettlementObserver init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_scanProvider, a3);
    objc_storeStrong((id *)&v10->_configuration, a4);
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    callbacks = v10->_callbacks;
    v10->_callbacks = v11;

    NSLog(@"%s: configuration: %@", "-[WiFiSettlementObserver initWithScanProvider:configuration:]", v8);
    objc_initWeak(&location, v10);
    scanProvider = v10->_scanProvider;
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    v15[2] = __61__WiFiSettlementObserver_initWithScanProvider_configuration___block_invoke;
    v15[3] = &unk_18A16CEF8;
    objc_copyWeak(&v16, &location);
    -[WiFiScanProvider addScanResultsCallback:](scanProvider, "addScanResultsCallback:", v15);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v10;
}

void __61__WiFiSettlementObserver_initWithScanProvider_configuration___block_invoke( uint64_t a1,  void *a2,  void *a3,  void *a4)
{
  v6 = (id *)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  [WeakRetained _handleScanResults:v9 error:v8 userInfo:v7];
}

- (void)_handleScanResults:(id)a3 error:(id)a4 userInfo:(id)a5
{
  id v37 = a3;
  id v7 = a5;
  [v7 objectForKeyedSubscript:@"resultType"];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 integerValue];

  [v7 objectForKeyedSubscript:@"clientName"];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 objectForKeyedSubscript:@"directed"];
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  NSLog( @"%s: scanType=%lu client='%@' directed=%d results='%@'",  "-[WiFiSettlementObserver _handleScanResults:error:userInfo:]",  v9,  v10,  v11 != 0LL,  v37);
  if (!v11)
  {
    [MEMORY[0x1896079C8] predicateWithBlock:&__block_literal_global_2];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v37 filteredSetUsingPredicate:v12];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[WiFiSettlementObserver currentContext](self, "currentContext");
    if (v14)
    {
    }

    else if ([v13 count])
    {
      v31 = objc_alloc(&OBJC_CLASS___WiFiSettlementContext);
      v32 = -[WiFiSettlementObserver configuration](self, "configuration");
      v33 = -[WiFiSettlementContext initWithNetworks:maxCount:]( v31,  "initWithNetworks:maxCount:",  v13,  [v32 maxNetworksForSettlement]);
      -[WiFiSettlementObserver setCurrentContext:](self, "setCurrentContext:", v33);

      goto LABEL_19;
    }
    v15 = -[WiFiSettlementObserver currentContext](self, "currentContext");
    if (v15)
    {
      -[WiFiSettlementObserver currentContext](self, "currentContext");
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      int v17 = [v16 compareWithScanResults:v13];

      if (!v17)
      {
        unint64_t v34 = -[WiFiSettlementObserver consecutiveScansWithoutMatch](self, "consecutiveScansWithoutMatch");
        v35 = -[WiFiSettlementObserver configuration](self, "configuration");
        unint64_t v36 = [v35 maxScansWithoutMatchForUnsettlement];

        if (v34 >= v36) {
          -[WiFiSettlementObserver resetSettlement](self, "resetSettlement");
        }
        else {
          -[WiFiSettlementObserver setConsecutiveScansWithoutMatch:]( self,  "setConsecutiveScansWithoutMatch:",  -[WiFiSettlementObserver consecutiveScansWithoutMatch](self, "consecutiveScansWithoutMatch") + 1);
        }
        goto LABEL_19;
      }

      -[WiFiSettlementObserver currentContext](self, "currentContext");
      objc_super v18 = (void *)objc_claimAutoreleasedReturnValue();
      [v18 creationDate];
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      [v19 timeIntervalSinceNow];
      double v21 = -v20;

      NSLog( @"%s: settled for %.2f seconds",  "-[WiFiSettlementObserver _handleScanResults:error:userInfo:]",  *(void *)&v21);
      -[WiFiSettlementObserver setConsecutiveScansWithoutMatch:](self, "setConsecutiveScansWithoutMatch:", 0LL);
      v22 = -[WiFiSettlementObserver currentContext](self, "currentContext");
      [v22 updateNetworks:v37];

      if (-[WiFiSettlementObserver confidence](self, "confidence")
        || (-[WiFiSettlementObserver configuration](self, "configuration"),
            v23 = (void *)objc_claimAutoreleasedReturnValue(),
            [v23 lowConfidenceSettlementTime],
            double v25 = v24,
            v23,
            v25 > v21))
      {
        if (-[WiFiSettlementObserver confidence](self, "confidence") > 1) {
          goto LABEL_19;
        }
        v26 = -[WiFiSettlementObserver configuration](self, "configuration");
        [v26 highConfidenceSettlementTime];
        double v28 = v27;

        if (v28 > v21) {
          goto LABEL_19;
        }
        v29 = self;
        uint64_t v30 = 2LL;
      }

      else
      {
        v29 = self;
        uint64_t v30 = 1LL;
      }

      -[WiFiSettlementObserver _updateSettlementStatus:confidence:]( v29,  "_updateSettlementStatus:confidence:",  1LL,  v30);
    }

BOOL __60__WiFiSettlementObserver__handleScanResults_error_userInfo___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[WiFiSettlementContext networkQualifiesForSettlement:]( &OBJC_CLASS___WiFiSettlementContext,  "networkQualifiesForSettlement:",  a2);
}

- (void)_updateSettlementStatus:(int64_t)a3 confidence:(unint64_t)a4
{
  v13[1] = *MEMORY[0x1895F89C0];
  if (self->_status != a3)
  {
    NSLog( @"%s: settlement status changed from %ld -> %ld",  a2,  "-[WiFiSettlementObserver _updateSettlementStatus:confidence:]",  self->_status,  a3);
    self->_status = a3;
    if (a3 == 1)
    {
      [MEMORY[0x189603F50] date];
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[WiFiSettlementObserver setSettledDate:](self, "setSettledDate:", v9);
    }

    else
    {
      -[WiFiSettlementObserver setSettledDate:](self, "setSettledDate:", 0LL);
    }

    p_unint64_t confidence = &self->_confidence;
    unint64_t confidence = self->_confidence;
    if (confidence == a4) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }

  p_unint64_t confidence = &self->_confidence;
  unint64_t confidence = self->_confidence;
  if (confidence != a4)
  {
LABEL_8:
    NSLog( @"%s: settlement confidence changed from %lu -> %lu",  a2,  "-[WiFiSettlementObserver _updateSettlementStatus:confidence:]",  confidence,  a4);
    *p_unint64_t confidence = a4;
LABEL_9:
    v12 = @"confidence";
    [MEMORY[0x189607968] numberWithUnsignedInteger:self->_confidence];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v10;
    [MEMORY[0x189603F68] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[WiFiSettlementObserver _callSettlementCallbackWithStatus:userInfo:]( self,  "_callSettlementCallbackWithStatus:userInfo:",  self->_status,  v11);
  }

- (void)addSettlementCallback:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    -[WiFiSettlementObserver callbacks](self, "callbacks");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1895BA9F4](v4);

    [v6 addObject:v5];
  }

- (void)removeSettlementCallback:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    -[WiFiSettlementObserver callbacks](self, "callbacks");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1895BA9F4](v4);

    [v6 removeObject:v5];
  }

- (void)_callSettlementCallbackWithStatus:(int64_t)a3 userInfo:(id)a4
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v5 = a4;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  -[WiFiSettlementObserver callbacks](self, "callbacks", 0LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * v10++) + 16LL))();
      }

      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v8);
  }
}

- (void)resetSettlement
{
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (unint64_t)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(unint64_t)a3
{
  self->_unint64_t confidence = a3;
}

- (NSDate)settledDate
{
  return self->_settledDate;
}

- (void)setSettledDate:(id)a3
{
  self->_settledDate = (NSDate *)a3;
}

- (WiFiScanProvider)scanProvider
{
  return self->_scanProvider;
}

- (void)setScanProvider:(id)a3
{
}

- (WiFiSettlementContext)currentContext
{
  return self->_currentContext;
}

- (void)setCurrentContext:(id)a3
{
}

- (unint64_t)consecutiveScansWithoutMatch
{
  return self->_consecutiveScansWithoutMatch;
}

- (void)setConsecutiveScansWithoutMatch:(unint64_t)a3
{
  self->_consecutiveScansWithoutMatch = a3;
}

- (NSMutableArray)callbacks
{
  return self->_callbacks;
}

- (void)setCallbacks:(id)a3
{
}

- (WiFiSettlementConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
}

@end