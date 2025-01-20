@interface SKSetupAppleIDSignInClient
- (SKSetupAppleIDSignInClient)init;
- (void)_activate;
- (void)_prepareSteps;
- (void)_run;
@end

@implementation SKSetupAppleIDSignInClient

- (SKSetupAppleIDSignInClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SKSetupAppleIDSignInClient;
  v2 = -[SKSetupBase initWithLogCategory:](&v6, sel_initWithLogCategory_, &gLogCategory_SKSetupAppleIDSignInClient);
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (void)_activate
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SKSetupAppleIDSignInClient;
  -[SKSetupBase _activate](&v3, sel__activate);
}

- (void)_prepareSteps
{
  objc_super v3 = objc_alloc_init(&OBJC_CLASS___SKStepBasicConfigClient);
  -[SKStepBasicConfigClient setDispatchQueue:](v3, "setDispatchQueue:", self->super._dispatchQueue);
  -[SKStepBasicConfigClient setSkMessaging:](v3, "setSkMessaging:", self);
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __43__SKSetupAppleIDSignInClient__prepareSteps__block_invoke;
  v4[3] = &unk_18A282310;
  v4[4] = self;
  v4[5] = v3;
  -[SKStepBasicConfigClient setSkCompletionHandler:](v3, "setSkCompletionHandler:", v4);
  -[SKSetupBase _addStep:](self, "_addStep:", v3);
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
          -[SKSetupBase _connectionStartWithSKConnection:clientMode:completeOnFailure:completion:]( self,  "_connectionStartWithSKConnection:clientMode:completeOnFailure:completion:",  0LL,  1LL,  1LL,  &__block_literal_global_955);
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

uint64_t __43__SKSetupAppleIDSignInClient__prepareSteps__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _completedStep:*(void *)(a1 + 40) error:a2];
}

@end