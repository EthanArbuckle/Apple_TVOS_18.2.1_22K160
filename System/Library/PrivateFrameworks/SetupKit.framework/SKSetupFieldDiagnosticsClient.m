@interface SKSetupFieldDiagnosticsClient
- (SKSetupFieldDiagnosticsClient)init;
- (void)_activate;
- (void)_prepareSteps;
- (void)_run;
@end

@implementation SKSetupFieldDiagnosticsClient

- (SKSetupFieldDiagnosticsClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SKSetupFieldDiagnosticsClient;
  v2 = -[SKSetupBase initWithLogCategory:](&v6, sel_initWithLogCategory_, &gLogCategory_SKSetupFieldDiagnosticsClient);
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (void)_activate
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SKSetupFieldDiagnosticsClient;
  -[SKSetupBase _activate](&v3, sel__activate);
}

- (void)_prepareSteps
{
  objc_super v3 = objc_alloc_init(&OBJC_CLASS___SKStepBasicConfigClient);
  -[SKStepBasicConfigClient setDispatchQueue:](v3, "setDispatchQueue:", self->super._dispatchQueue);
  -[SKStepBasicConfigClient setSkMessaging:](v3, "setSkMessaging:", self);
  uint64_t v4 = MEMORY[0x1895F87A8];
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __46__SKSetupFieldDiagnosticsClient__prepareSteps__block_invoke;
  v7[3] = &unk_18A282310;
  v7[4] = self;
  v7[5] = v3;
  -[SKStepBasicConfigClient setSkCompletionHandler:](v3, "setSkCompletionHandler:", v7);
  -[SKSetupBase _addStep:](self, "_addStep:", v3);

  v5 = objc_alloc_init(&OBJC_CLASS___SKStepWiFiSetupClientLegacy);
  -[SKStepWiFiSetupClientLegacy setDispatchQueue:](v5, "setDispatchQueue:", self->super._dispatchQueue);
  -[SKStepWiFiSetupClientLegacy setSkMessaging:](v5, "setSkMessaging:", self);
  v6[0] = v4;
  v6[1] = 3221225472LL;
  v6[2] = __46__SKSetupFieldDiagnosticsClient__prepareSteps__block_invoke_2;
  v6[3] = &unk_18A282310;
  v6[4] = self;
  v6[5] = v5;
  -[SKStepWiFiSetupClientLegacy setSkCompletionHandler:](v5, "setSkCompletionHandler:", v6);
  -[SKSetupBase _addStep:](self, "_addStep:", v5);
}

- (void)_run
{
  if (!self->super._invalidateCalled)
  {
    while (1)
    {
      int runState = self->super._runState;
      switch(runState)
      {
        case 11:
          -[SKSetupBase _connectionStartWithSKConnection:clientMode:completeOnFailure:completion:]( self,  "_connectionStartWithSKConnection:clientMode:completeOnFailure:completion:",  0LL,  1LL,  1LL,  &__block_literal_global);
          int v4 = self->super._runState + 1;
          break;
        case 12:
          int v5 = -[SKConnection state](self->super._skCnx, "state");
          int v4 = self->super._runState;
          if (v5 != 1) {
            goto LABEL_13;
          }
          goto LABEL_10;
        case 13:
          BOOL v6 = -[SKSetupBase _runSteps](self, "_runSteps");
          int v4 = self->super._runState;
          if (!v6) {
            goto LABEL_13;
          }
LABEL_10:
          ++v4;
          break;
        case 14:
          -[SKSetupBase _completeWithError:](self, "_completeWithError:", 0LL);
          int v4 = self->super._runState;
          goto LABEL_13;
        default:
          if (runState) {
            return;
          }
          int v4 = 11;
          break;
      }

      self->super._int runState = v4;
LABEL_13:
      if (v4 == runState) {
        break;
      }
      int var0 = self->super._ucat->var0;
    }
  }

uint64_t __46__SKSetupFieldDiagnosticsClient__prepareSteps__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _completedStep:*(void *)(a1 + 40) error:a2];
}

uint64_t __46__SKSetupFieldDiagnosticsClient__prepareSteps__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _completedStep:*(void *)(a1 + 40) error:a2];
}

@end