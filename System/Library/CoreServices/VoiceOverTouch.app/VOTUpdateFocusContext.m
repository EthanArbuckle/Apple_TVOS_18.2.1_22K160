@interface VOTUpdateFocusContext
+ (id)context:(int64_t)a3;
- (BOOL)senderIsAppExtension;
- (BOOL)shouldIgnorePreviousFocusedElement;
- (NSString)senderBundleID;
- (VOTAppTransitionContext)appTransition;
- (VOTElement)focusElement;
- (VOTUpdateFocusContext)init;
- (id)description;
- (id)updateFocusComplete;
- (int)senderPID;
- (int64_t)reason;
- (void)setAppTransition:(id)a3;
- (void)setFocusElement:(id)a3;
- (void)setReason:(int64_t)a3;
- (void)setSenderBundleID:(id)a3;
- (void)setSenderIsAppExtension:(BOOL)a3;
- (void)setSenderPID:(int)a3;
- (void)setShouldIgnorePreviousFocusedElement:(BOOL)a3;
- (void)setUpdateFocusComplete:(id)a3;
@end

@implementation VOTUpdateFocusContext

+ (id)context:(int64_t)a3
{
  v4 = objc_alloc_init(&OBJC_CLASS___VOTUpdateFocusContext);
  -[VOTUpdateFocusContext setReason:](v4, "setReason:", a3);
  return v4;
}

- (VOTUpdateFocusContext)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___VOTUpdateFocusContext;
  result = -[VOTUpdateFocusContext init](&v3, "init");
  if (result) {
    result->_senderPID = -1;
  }
  return result;
}

- (id)description
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[VOTUpdateFocusContext shouldIgnorePreviousFocusedElement]( self,  "shouldIgnorePreviousFocusedElement")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUpdateFocusContext focusElement](self, "focusElement"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[VOTUpdateFocusContext senderPID](self, "senderPID")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VOTUpdateFocusContext senderBundleID](self, "senderBundleID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[VOTUpdateFocusContext senderIsAppExtension](self, "senderIsAppExtension")));
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"VOTUpdateFocusContext <%p>.\n\tReason:%@\n\tIgnorePrevious:%@\n\tFocus:%@\n\tSender PID: %@ BundleID: %@. Is Extension:%@",  self,  0LL,  v3,  v4,  v5,  v6,  v7));

  return v8;
}

- (BOOL)shouldIgnorePreviousFocusedElement
{
  return self->_shouldIgnorePreviousFocusedElement;
}

- (void)setShouldIgnorePreviousFocusedElement:(BOOL)a3
{
  self->_shouldIgnorePreviousFocusedElement = a3;
}

- (VOTElement)focusElement
{
  return self->_focusElement;
}

- (void)setFocusElement:(id)a3
{
}

- (int64_t)reason
{
  return self->_reason;
}

- (void)setReason:(int64_t)a3
{
  self->_reason = a3;
}

- (VOTAppTransitionContext)appTransition
{
  return self->_appTransition;
}

- (void)setAppTransition:(id)a3
{
}

- (id)updateFocusComplete
{
  return self->_updateFocusComplete;
}

- (void)setUpdateFocusComplete:(id)a3
{
}

- (int)senderPID
{
  return self->_senderPID;
}

- (void)setSenderPID:(int)a3
{
  self->_senderPID = a3;
}

- (NSString)senderBundleID
{
  return self->_senderBundleID;
}

- (void)setSenderBundleID:(id)a3
{
}

- (BOOL)senderIsAppExtension
{
  return self->_senderIsAppExtension;
}

- (void)setSenderIsAppExtension:(BOOL)a3
{
  self->_senderIsAppExtension = a3;
}

- (void).cxx_destruct
{
}

@end