@interface AFDiagnosticsNetworkAnalyzerResults
- (BOOL)analyzedSuccessfulRetry;
- (BOOL)isForUserRequest;
- (BOOL)wwanPreferred;
- (NSNumber)connectionInterface;
- (NSNumber)gatewayPingDuration;
- (NSNumber)gatewayPingsDropped;
- (NSNumber)gatewayPingsSent;
- (NSNumber)knownURLLoadDuration;
- (NSNumber)sendBufferBytesRemaining;
- (NSNumber)siriSaltURLLoadDuration;
- (NSNumber)siriURLLoadDuration;
- (id)metricValue;
- (int64_t)gatewayStatus;
- (unint64_t)_durationInMillisecondsForDuration:(id)a3;
- (void)setAnalyzedSuccessfulRetry:(BOOL)a3;
- (void)setConnectionInterface:(id)a3;
- (void)setForUserRequest:(BOOL)a3;
- (void)setGatewayPingDuration:(id)a3;
- (void)setGatewayPingsDropped:(id)a3;
- (void)setGatewayPingsSent:(id)a3;
- (void)setGatewayStatus:(int64_t)a3;
- (void)setKnownURLLoadDuration:(id)a3;
- (void)setSendBufferBytesRemaining:(id)a3;
- (void)setSiriSaltURLLoadDuration:(id)a3;
- (void)setSiriURLLoadDuration:(id)a3;
- (void)setWwanPreferred:(BOOL)a3;
@end

@implementation AFDiagnosticsNetworkAnalyzerResults

- (BOOL)isForUserRequest
{
  return self->_forUserRequest;
}

- (void)setForUserRequest:(BOOL)a3
{
  self->_forUserRequest = a3;
}

- (BOOL)analyzedSuccessfulRetry
{
  return self->_analyzedSuccessfulRetry;
}

- (void)setAnalyzedSuccessfulRetry:(BOOL)a3
{
  self->_analyzedSuccessfulRetry = a3;
}

- (BOOL)wwanPreferred
{
  return self->_wwanPreferred;
}

- (void)setWwanPreferred:(BOOL)a3
{
  self->_wwanPreferred = a3;
}

- (NSNumber)connectionInterface
{
  return self->_connectionInterface;
}

- (void)setConnectionInterface:(id)a3
{
}

- (NSNumber)sendBufferBytesRemaining
{
  return self->_sendBufferBytesRemaining;
}

- (void)setSendBufferBytesRemaining:(id)a3
{
}

- (NSNumber)knownURLLoadDuration
{
  return self->_knownURLLoadDuration;
}

- (void)setKnownURLLoadDuration:(id)a3
{
}

- (NSNumber)siriURLLoadDuration
{
  return self->_siriURLLoadDuration;
}

- (void)setSiriURLLoadDuration:(id)a3
{
}

- (NSNumber)siriSaltURLLoadDuration
{
  return self->_siriSaltURLLoadDuration;
}

- (void)setSiriSaltURLLoadDuration:(id)a3
{
}

- (int64_t)gatewayStatus
{
  return self->_gatewayStatus;
}

- (void)setGatewayStatus:(int64_t)a3
{
  self->_gatewayStatus = a3;
}

- (NSNumber)gatewayPingDuration
{
  return self->_gatewayPingDuration;
}

- (void)setGatewayPingDuration:(id)a3
{
}

- (NSNumber)gatewayPingsSent
{
  return self->_gatewayPingsSent;
}

- (void)setGatewayPingsSent:(id)a3
{
}

- (NSNumber)gatewayPingsDropped
{
  return self->_gatewayPingsDropped;
}

- (void)setGatewayPingsDropped:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id)metricValue
{
  v3 = (void *)objc_opt_new(&OBJC_CLASS___AWDSiriNetworkAnalyzerRun);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AFDiagnosticsNetworkAnalyzerResults connectionInterface](self, "connectionInterface"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AFDiagnosticsNetworkAnalyzerResults connectionInterface](self, "connectionInterface"));
    objc_msgSend(v3, "setInterface:", objc_msgSend(v5, "intValue"));
  }

  objc_msgSend( v3,  "setIsUserRequest:",  -[AFDiagnosticsNetworkAnalyzerResults isForUserRequest](self, "isForUserRequest"));
  objc_msgSend( v3,  "setAnalyzingSuccessfulRetry:",  -[AFDiagnosticsNetworkAnalyzerResults analyzedSuccessfulRetry](self, "analyzedSuccessfulRetry"));
  objc_msgSend(v3, "setWwanPreferred:", -[AFDiagnosticsNetworkAnalyzerResults wwanPreferred](self, "wwanPreferred"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AFDiagnosticsNetworkAnalyzerResults sendBufferBytesRemaining](self, "sendBufferBytesRemaining"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[AFDiagnosticsNetworkAnalyzerResults sendBufferBytesRemaining](self, "sendBufferBytesRemaining"));
    objc_msgSend(v3, "setSendBufferBytesRemaining:", objc_msgSend(v7, "intValue"));
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AFDiagnosticsNetworkAnalyzerResults knownURLLoadDuration](self, "knownURLLoadDuration"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[AFDiagnosticsNetworkAnalyzerResults knownURLLoadDuration](self, "knownURLLoadDuration"));
    objc_msgSend( v3,  "setKnownURLLoadDuration:",  -[AFDiagnosticsNetworkAnalyzerResults _durationInMillisecondsForDuration:]( self,  "_durationInMillisecondsForDuration:",  v9));
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[AFDiagnosticsNetworkAnalyzerResults siriURLLoadDuration](self, "siriURLLoadDuration"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[AFDiagnosticsNetworkAnalyzerResults siriURLLoadDuration](self, "siriURLLoadDuration"));
    objc_msgSend( v3,  "setSiriURLLoadDuration:",  -[AFDiagnosticsNetworkAnalyzerResults _durationInMillisecondsForDuration:]( self,  "_durationInMillisecondsForDuration:",  v11));
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[AFDiagnosticsNetworkAnalyzerResults siriSaltURLLoadDuration](self, "siriSaltURLLoadDuration"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[AFDiagnosticsNetworkAnalyzerResults siriSaltURLLoadDuration](self, "siriSaltURLLoadDuration"));
    objc_msgSend( v3,  "setSiriSaltURLLoadDuration:",  -[AFDiagnosticsNetworkAnalyzerResults _durationInMillisecondsForDuration:]( self,  "_durationInMillisecondsForDuration:",  v13));
  }

  objc_msgSend(v3, "setGatewayStatus:", -[AFDiagnosticsNetworkAnalyzerResults gatewayStatus](self, "gatewayStatus"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[AFDiagnosticsNetworkAnalyzerResults gatewayPingDuration](self, "gatewayPingDuration"));

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[AFDiagnosticsNetworkAnalyzerResults gatewayPingDuration](self, "gatewayPingDuration"));
    objc_msgSend( v3,  "setGatewayPingDuration:",  -[AFDiagnosticsNetworkAnalyzerResults _durationInMillisecondsForDuration:]( self,  "_durationInMillisecondsForDuration:",  v15));
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[AFDiagnosticsNetworkAnalyzerResults gatewayPingsSent](self, "gatewayPingsSent"));

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[AFDiagnosticsNetworkAnalyzerResults gatewayPingsSent](self, "gatewayPingsSent"));
    objc_msgSend(v3, "setGatewayPingsSent:", objc_msgSend(v17, "unsignedIntValue"));
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[AFDiagnosticsNetworkAnalyzerResults gatewayPingsDropped](self, "gatewayPingsDropped"));

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[AFDiagnosticsNetworkAnalyzerResults gatewayPingsDropped](self, "gatewayPingsDropped"));
    objc_msgSend(v3, "setGatewayPingsDropped:", objc_msgSend(v19, "unsignedIntValue"));
  }

  return v3;
}

- (unint64_t)_durationInMillisecondsForDuration:(id)a3
{
  return (unint64_t)(v3 * 1000.0);
}

@end