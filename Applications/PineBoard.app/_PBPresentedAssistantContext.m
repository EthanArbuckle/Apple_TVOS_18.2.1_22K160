@interface _PBPresentedAssistantContext
- (NSString)displayID;
- (PBDialogContext)dialogueContext;
- (PBSDisplayAssistantPresentationRequest)presentationRequest;
- (UIViewController)presentedController;
- (_PBPresentedAssistantContext)initWithDisplayID:(id)a3;
- (id)description;
- (id)dismissHandler;
- (void)setDialogueContext:(id)a3;
- (void)setDismissHandler:(id)a3;
- (void)setDisplayID:(id)a3;
- (void)setPresentationRequest:(id)a3;
- (void)setPresentedController:(id)a3;
@end

@implementation _PBPresentedAssistantContext

- (_PBPresentedAssistantContext)initWithDisplayID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____PBPresentedAssistantContext;
  v6 = -[_PBPresentedAssistantContext init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_displayID, a3);
  }

  return v7;
}

- (id)description
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_PBPresentedAssistantContext displayID](self, "displayID"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[_PBPresentedAssistantContext presentationRequest](self, "presentationRequest"));
  id v6 = [v5 kind];
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_PBPresentedAssistantContext presentationRequest](self, "presentationRequest"));
  id v8 = [v7 source];
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[_PBPresentedAssistantContext presentedController](self, "presentedController"));
  v10 = -[NSString initWithFormat:]( v3,  "initWithFormat:",  @"_PBPresentedAssistantContext<%p> { displayID: %@, assistantKind: %ld, assistantSource: %ld, presentedController: %@}",  self,  v4,  v6,  v8,  v9);

  return v10;
}

- (UIViewController)presentedController
{
  return self->_presentedController;
}

- (void)setPresentedController:(id)a3
{
}

- (NSString)displayID
{
  return self->_displayID;
}

- (void)setDisplayID:(id)a3
{
}

- (PBSDisplayAssistantPresentationRequest)presentationRequest
{
  return self->_presentationRequest;
}

- (void)setPresentationRequest:(id)a3
{
}

- (PBDialogContext)dialogueContext
{
  return self->_dialogueContext;
}

- (void)setDialogueContext:(id)a3
{
}

- (id)dismissHandler
{
  return self->_dismissHandler;
}

- (void)setDismissHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end