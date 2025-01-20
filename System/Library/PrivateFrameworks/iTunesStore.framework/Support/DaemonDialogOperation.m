@interface DaemonDialogOperation
- (BOOL)displaysOnLockscreen;
- (DaemonDialogOperation)initWithDialog:(id)a3;
- (ISDialog)dialog;
- (SSVDialogResponse)dialogResponse;
- (id)outputBlock;
- (void)dealloc;
- (void)run;
- (void)setDisplaysOnLockscreen:(BOOL)a3;
- (void)setOutputBlock:(id)a3;
@end

@implementation DaemonDialogOperation

- (DaemonDialogOperation)initWithDialog:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___DaemonDialogOperation;
  v4 = -[DaemonDialogOperation init](&v6, "init");
  if (v4) {
    v4->_dialog = (ISDialog *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___DaemonDialogOperation;
  -[DaemonDialogOperation dealloc](&v3, "dealloc");
}

- (ISDialog)dialog
{
  objc_super v3 = self->_dialog;
  -[DaemonDialogOperation unlock](self, "unlock");
  return v3;
}

- (SSVDialogResponse)dialogResponse
{
  id v3 = -[SSVDialogResponse copy](self->_dialogResponse, "copy");
  -[DaemonDialogOperation unlock](self, "unlock");
  return (SSVDialogResponse *)v3;
}

- (BOOL)displaysOnLockscreen
{
  BOOL displaysOnLockscreen = self->_displaysOnLockscreen;
  -[DaemonDialogOperation unlock](self, "unlock");
  return displaysOnLockscreen;
}

- (id)outputBlock
{
  id v3 = self->_outputBlock;
  -[DaemonDialogOperation unlock](self, "unlock");
  return v3;
}

- (void)setDisplaysOnLockscreen:(BOOL)a3
{
  self->_BOOL displaysOnLockscreen = a3;
  -[DaemonDialogOperation unlock](self, "unlock");
}

- (void)setOutputBlock:(id)a3
{
  id outputBlock = self->_outputBlock;
  if (outputBlock != a3)
  {

    self->_id outputBlock = [a3 copy];
  }

  -[DaemonDialogOperation unlock](self, "unlock");
}

- (void)run
{
  uint64_t v8 = 0LL;
  -[ISDialog setShouldDisplayAsTopMost:]( self->_dialog,  "setShouldDisplayAsTopMost:",  -[DaemonDialogOperation displaysOnLockscreen](self, "displaysOnLockscreen"));
  -[ISDialog setDisplaysOnLockscreen:]( self->_dialog,  "setDisplaysOnLockscreen:",  -[DaemonDialogOperation displaysOnLockscreen](self, "displaysOnLockscreen"));
  id v3 = objc_alloc_init(&OBJC_CLASS___ISDialogOperation);
  [v3 setDialog:self->_dialog];
  [v3 setPerformDefaultActions:0];
  -[DaemonDialogOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v3, &v8);
  id v4 = [v3 selectedButton];
  if (!v4)
  {
    v7 = -[DaemonDialogOperation outputBlock](self, "outputBlock");
    objc_super v6 = 0LL;
    if (!v7) {
      goto LABEL_6;
    }
LABEL_5:
    v7[2](v7, v6, v8);
    -[DaemonDialogOperation setOutputBlock:](self, "setOutputBlock:", 0LL);
    goto LABEL_6;
  }

  v5 = v4;
  objc_super v6 = objc_alloc_init(&OBJC_CLASS___SSVDialogResponse);
  -[SSVDialogResponse setSelectedButtonIndex:]( v6,  "setSelectedButtonIndex:",  objc_msgSend(-[ISDialog buttons](self->_dialog, "buttons"), "indexOfObject:", v5));
  -[SSVDialogResponse setTextFieldValues:](v6, "setTextFieldValues:", [v3 textFieldValues]);
  v7 = -[DaemonDialogOperation outputBlock](self, "outputBlock");
  if (v7) {
    goto LABEL_5;
  }
  [v5 performDefaultActionForDialog:self->_dialog];
LABEL_6:
  -[DaemonDialogOperation lock](self, "lock");
  self->_dialogResponse = v6;
  -[DaemonDialogOperation unlock](self, "unlock");
  -[DaemonDialogOperation setError:](self, "setError:", v8);
  -[DaemonDialogOperation setSuccess:](self, "setSuccess:", v6 != 0LL);
}

@end