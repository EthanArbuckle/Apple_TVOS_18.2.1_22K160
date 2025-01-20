@interface ADAcousticIDHelper
- (ADAcousticIDHelperDelegate)delegate;
- (BOOL)hasRelatedCommandForRefId:(id)a3;
- (BOOL)sessionIsComplete;
- (BOOL)shouldSendFingerprintForDuration:(double)a3;
- (id)cancelSessionCommand;
- (id)currentSession;
- (id)searchCommandForFingerprintData:(id)a3 withDuration:(double)a4;
- (void)_addOutstandingSearchId:(id)a3;
- (void)_clearOutstandingSearchIds;
- (void)_removeOutstandingSearchForRefId:(id)a3;
- (void)failCurrentSession;
- (void)handleCommandFailed:(id)a3;
- (void)handleRetrySearch:(id)a3;
- (void)handleSearchCompleted:(id)a3;
- (void)reset;
- (void)setDelegate:(id)a3;
- (void)startNewAcousticIDSessionWithRequestId:(id)a3 refId:(id)a4;
@end

@implementation ADAcousticIDHelper

- (void)_addOutstandingSearchId:(id)a3
{
  id v4 = a3;
  outstandingSearches = self->_outstandingSearches;
  id v8 = v4;
  if (!outstandingSearches)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    v7 = self->_outstandingSearches;
    self->_outstandingSearches = v6;

    id v4 = v8;
    outstandingSearches = self->_outstandingSearches;
  }

  -[NSMutableSet addObject:](outstandingSearches, "addObject:", v4);
}

- (void)_clearOutstandingSearchIds
{
  outstandingSearches = self->_outstandingSearches;
  self->_outstandingSearches = 0LL;
}

- (void)reset
{
  completed = self->_completed;
  self->_completed = 0LL;

  self->_sessionIsComplete = 0;
  self->_minimumFingerprintDuration = 0.0;
  currentSession = self->_currentSession;
  self->_currentSession = 0LL;
}

- (void)startNewAcousticIDSessionWithRequestId:(id)a3 refId:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[ADAcousticIDHelper reset](self, "reset");
  id v8 = objc_alloc_init(&OBJC_CLASS___SAAIStartSession);
  -[SAAIStartSession setAcousticIdSessionId:](v8, "setAcousticIdSessionId:", v7);

  uint64_t v10 = SiriCoreUUIDStringCreate(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  -[SAAIStartSession setAceId:](v8, "setAceId:", v11);

  -[SAAIStartSession setRefId:](v8, "setRefId:", v6);
  currentSession = self->_currentSession;
  self->_currentSession = v8;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained acousticIDHelperDidStartSession:self];
}

- (BOOL)sessionIsComplete
{
  return self->_sessionIsComplete;
}

- (id)currentSession
{
  return self->_currentSession;
}

- (id)searchCommandForFingerprintData:(id)a3 withDuration:(double)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(&OBJC_CLASS___SAAISearch);
  [v7 setFingerprint:v6];

  uint64_t v8 = SiriCoreUUIDStringCreate([v7 setDuration:a4]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  [v7 setAceId:v9];

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SAAIStartSession refId](self->_currentSession, "refId"));
  v11 = v10;
  if (v10) {
    id v12 = v10;
  }
  else {
    id v12 = (id)objc_claimAutoreleasedReturnValue(-[SAAIStartSession aceId](self->_currentSession, "aceId"));
  }
  v13 = v12;

  [v7 setRefId:v13];
  v14 = (void *)objc_claimAutoreleasedReturnValue([v7 aceId]);
  -[ADAcousticIDHelper _addOutstandingSearchId:](self, "_addOutstandingSearchId:", v14);

  return v7;
}

- (id)cancelSessionCommand
{
  id v3 = objc_alloc_init(&OBJC_CLASS___SAAICancelSession);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SAAIStartSession aceId](self->_currentSession, "aceId"));
  [v3 setRefId:v4];

  return v3;
}

- (BOOL)hasRelatedCommandForRefId:(id)a3
{
  id v4 = a3;
  if ((-[NSMutableSet containsObject:](self->_outstandingSearches, "containsObject:", v4) & 1) != 0)
  {
    unsigned __int8 v5 = 1;
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SAAIStartSession aceId](self->_currentSession, "aceId"));
    unsigned __int8 v5 = [v6 isEqualToString:v4];
  }

  return v5;
}

- (void)_removeOutstandingSearchForRefId:(id)a3
{
}

- (void)handleSearchCompleted:(id)a3
{
  id v7 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v7 refId]);
  -[ADAcousticIDHelper _removeOutstandingSearchForRefId:](self, "_removeOutstandingSearchForRefId:", v5);
  if (!self->_sessionIsComplete)
  {
    objc_storeStrong((id *)&self->_completed, a3);
    self->_sessionIsComplete = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained acousticIDHelper:self didCompleteSessionSuccessfully:1];
  }
}

- (void)handleRetrySearch:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 refId]);
  -[ADAcousticIDHelper _removeOutstandingSearchForRefId:](self, "_removeOutstandingSearchForRefId:", v5);

  [v4 minimumDurationForRetry];
  double v7 = v6;

  self->_minimumFingerprintDuration = v7;
}

- (void)handleCommandFailed:(id)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue([a3 refId]);
  if (-[ADAcousticIDHelper hasRelatedCommandForRefId:](self, "hasRelatedCommandForRefId:"))
  {
    -[ADAcousticIDHelper _removeOutstandingSearchForRefId:](self, "_removeOutstandingSearchForRefId:", v5);
    if (!self->_sessionIsComplete)
    {
      self->_sessionIsComplete = 1;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained acousticIDHelper:self didCompleteSessionSuccessfully:0];
    }
  }
}

- (BOOL)shouldSendFingerprintForDuration:(double)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ADAcousticIDHelper currentSession](self, "currentSession"));
  BOOL v6 = v5
    && !-[ADAcousticIDHelper sessionIsComplete](self, "sessionIsComplete")
    && self->_minimumFingerprintDuration <= a3;

  return v6;
}

- (void)failCurrentSession
{
  if (self->_currentSession && !self->_sessionIsComplete)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained acousticIDHelper:self didCompleteSessionSuccessfully:0];
  }

  -[ADAcousticIDHelper reset](self, "reset");
}

- (ADAcousticIDHelperDelegate)delegate
{
  return (ADAcousticIDHelperDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end