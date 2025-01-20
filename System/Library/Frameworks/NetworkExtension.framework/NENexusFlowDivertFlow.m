@interface NENexusFlowDivertFlow
- (id)clientIdentifier;
- (id)endpoint;
- (id)parameters;
- (void)dealloc;
@end

@implementation NENexusFlowDivertFlow

- (void)dealloc
{
  if (self)
  {
    flowDivertFlow = self->_flowDivertFlow;
    if (flowDivertFlow)
    {
      CFRelease(flowDivertFlow);
      self->_flowDivertFlow = 0LL;
    }
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NENexusFlowDivertFlow;
  -[NENexusFlow dealloc](&v4, sel_dealloc);
}

- (id)endpoint
{
  if (self) {
    self = (NENexusFlowDivertFlow *)objc_getProperty(self, a2, 48LL, 1);
  }
  return self;
}

- (id)parameters
{
  if (self) {
    self = (NENexusFlowDivertFlow *)objc_getProperty(self, a2, 56LL, 1);
  }
  return self;
}

- (id)clientIdentifier
{
  if (self) {
    self = (NENexusFlowDivertFlow *)objc_getProperty(self, a2, 40LL, 1);
  }
  return self;
}

- (void).cxx_destruct
{
}

@end