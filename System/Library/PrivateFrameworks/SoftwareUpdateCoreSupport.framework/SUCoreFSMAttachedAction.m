@interface SUCoreFSMAttachedAction
- (Class)eventInfoClass;
- (NSString)fsmAction;
- (SUCoreFSMAttachedAction)initWithAction:(id)a3 usingDelegate:(id)a4 withInfoClass:(Class)a5;
- (id)actionDelegate;
- (id)description;
@end

@implementation SUCoreFSMAttachedAction

- (SUCoreFSMAttachedAction)initWithAction:(id)a3 usingDelegate:(id)a4 withInfoClass:(Class)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___SUCoreFSMAttachedAction;
  v11 = -[SUCoreFSMAttachedAction init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_fsmAction, a3);
    objc_storeWeak(&v12->_actionDelegate, v10);
    objc_storeStrong((id *)&v12->_eventInfoClass, a5);
  }

  return v12;
}

- (id)description
{
  id v3 = objc_alloc(NSString);
  v4 = -[SUCoreFSMAttachedAction fsmAction](self, "fsmAction");
  v5 = -[SUCoreFSMAttachedAction actionDelegate](self, "actionDelegate");
  v6 = (void *)[v3 initWithFormat:@"action(%@),delegate(%@),class(%@)", v4, v5, -[SUCoreFSMAttachedAction eventInfoClass](self, "eventInfoClass")];

  return v6;
}

- (NSString)fsmAction
{
  return self->_fsmAction;
}

- (id)actionDelegate
{
  return objc_loadWeakRetained(&self->_actionDelegate);
}

- (Class)eventInfoClass
{
  return self->_eventInfoClass;
}

- (void).cxx_destruct
{
}

@end