@interface MessagesDaemon
- (BOOL)isSetupComplete;
- (BOOL)launchListenerForCapability:(unsigned int)a3;
- (IMMessageContext)currentMessageContext;
- (ParentalControlsProtocol)parentalControls;
- (id)intentProcessor;
- (unint64_t)vcCapabilities;
- (unint64_t)vcCapabilitiesForListenerID:(id)a3;
- (void)notifyClientsNewSetupInfoAvailableWithRequiredCapabilities:(unint64_t)a3;
- (void)setCurrentMessageContext:(id)a3;
- (void)setParentalControls:(id)a3;
- (void)setSetupComplete:(BOOL)a3;
@end

@implementation MessagesDaemon

- (ParentalControlsProtocol)parentalControls
{
  return (ParentalControlsProtocol *)(id)swift_unknownObjectRetain(*(void *)self->parentalControls);
}

- (void)setParentalControls:(id)a3
{
  uint64_t v5 = *(void *)self->parentalControls;
  *(void *)self->parentalControls = a3;
  swift_unknownObjectRetain(a3);
  swift_unknownObjectRelease(v5);
}

- (BOOL)isSetupComplete
{
  return self->isSetupComplete[0];
}

- (void)setSetupComplete:(BOOL)a3
{
  self->isSetupComplete[0] = a3;
}

- (IMMessageContext)currentMessageContext
{
  return (IMMessageContext *)*(id *)&self->currentMessageContext[7];
}

- (void)setCurrentMessageContext:(id)a3
{
  uint64_t v5 = *(void **)&self->currentMessageContext[7];
  *(void *)&self->currentMessageContext[7] = a3;
  id v6 = a3;
}

- (BOOL)launchListenerForCapability:(unsigned int)a3
{
  return 1;
}

- (void)notifyClientsNewSetupInfoAvailableWithRequiredCapabilities:(unint64_t)a3
{
  uint64_t v5 = *(void *)&self->connectionManager[31];
  uint64_t v6 = *(void *)&self->connectionManager[39];
  sub_10002DED4(&self->connectionManager[7], v5);
  swift_retain(self);
  dispatch thunk of ClientConnectionManaging.notifyClientsNewSetupInfoAvailable(requiredCapabilities:)(a3, v5, v6);
  swift_release(self);
}

- (id)intentProcessor
{
  void (*v3)(void *__return_ptr, uint64_t);
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _BYTE v8[40];
  void v9[5];
  v3 = *(void (**)(void *__return_ptr, uint64_t))(*(void *)self->_TtCs12_SwiftObject_opaque + 232LL);
  v4 = swift_retain(self);
  v3(v9, v4);
  swift_release(self);
  sub_10002D954((uint64_t)v9, (uint64_t)v8);
  uint64_t v5 = sub_10002D164(&qword_10006FF30);
  uint64_t v6 = (void *)_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)(v8, v5);
  sub_10002EBC8((uint64_t)v9, &qword_10006FF30);
  return v6;
}

- (unint64_t)vcCapabilities
{
  return 0LL;
}

- (unint64_t)vcCapabilitiesForListenerID:(id)a3
{
  return 0LL;
}

@end