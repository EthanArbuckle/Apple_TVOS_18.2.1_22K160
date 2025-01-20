@interface CWFNetworkDenyListInfo
- (CWFNetworkDenyListInfo)init;
- (NSString)BSSID;
- (NSString)reasonString;
- (NSString)stateString;
- (double)reasonTimestamp;
- (double)stateTimestamp;
- (int64_t)reasonData;
- (unint64_t)reason;
- (unint64_t)state;
- (void)setBSSID:(id)a3;
- (void)setReason:(unint64_t)a3;
- (void)setReasonData:(int64_t)a3;
- (void)setReasonString:(id)a3;
- (void)setReasonTimestamp:(double)a3;
- (void)setState:(unint64_t)a3;
- (void)setStateString:(id)a3;
- (void)setStateTimestamp:(double)a3;
@end

@implementation CWFNetworkDenyListInfo

- (CWFNetworkDenyListInfo)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CWFNetworkDenyListInfo;
  return -[CWFNetworkDenyListInfo init](&v3, sel_init);
}

- (unint64_t)reason
{
  return self->_reason;
}

- (void)setReason:(unint64_t)a3
{
  self->_reason = a3;
}

- (int64_t)reasonData
{
  return self->_reasonData;
}

- (void)setReasonData:(int64_t)a3
{
  self->_reasonData = a3;
}

- (NSString)reasonString
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setReasonString:(id)a3
{
}

- (double)reasonTimestamp
{
  return self->_reasonTimestamp;
}

- (void)setReasonTimestamp:(double)a3
{
  self->_reasonTimestamp = a3;
}

- (double)stateTimestamp
{
  return self->_stateTimestamp;
}

- (void)setStateTimestamp:(double)a3
{
  self->_stateTimestamp = a3;
}

- (NSString)BSSID
{
  return (NSString *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setBSSID:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (NSString)stateString
{
  return (NSString *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setStateString:(id)a3
{
}

- (void).cxx_destruct
{
}

@end