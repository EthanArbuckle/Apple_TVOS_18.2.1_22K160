@interface SCATCandidateBarManager
- (BOOL)canBeActiveElementManager;
- (BOOL)handleInputAction:(id)a3 withElement:(id)a4;
- (NSArray)typingCandidates;
- (SCATCandidateBarManagerDelegate)delegate;
- (void)didFetchElements:(id)a3 foundNewElements:(BOOL)a4 currentFocusContext:(id)a5 didChangeActiveElementManager:(BOOL)a6;
- (void)driver:(id)a3 willFocusOnContext:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setTypingCandidates:(id)a3;
@end

@implementation SCATCandidateBarManager

- (BOOL)canBeActiveElementManager
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATCandidateBarManager typingCandidates](self, "typingCandidates"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (void)driver:(id)a3 willFocusOnContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 element]);
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATCandidateBarManager typingCandidates](self, "typingCandidates"));
    unsigned __int8 v10 = [v9 containsObject:v8];

    if ((v10 & 1) == 0)
    {
      v11 = v8;
      _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATCandidateBarManager.m",  37LL,  "-[SCATCandidateBarManager driver:willFocusOnContext:]",  @"The driver told us it focused on a context, but that context's element (%@) is not one of ours.  Why are we getting this message?");
    }

    else {
      _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATCandidateBarManager.m",  39LL,  "-[SCATCandidateBarManager driver:willFocusOnContext:]",  @"All of our typing candidates should be AX elements");
    }
  }

  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___SCATCandidateBarManager;
  -[SCATElementManager driver:willFocusOnContext:](&v12, "driver:willFocusOnContext:", v6, v7);
}

- (BOOL)handleInputAction:(id)a3 withElement:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 action] == (id)100
    || [v6 action] == (id)103
    || [v6 action] == (id)109)
  {
    -[SCATCandidateBarManager setTypingCandidates:](self, "setTypingCandidates:", 0LL);
  }

  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___SCATCandidateBarManager;
  BOOL v8 = -[SCATElementManager handleInputAction:withElement:](&v10, "handleInputAction:withElement:", v6, v7);

  return v8;
}

- (void)didFetchElements:(id)a3 foundNewElements:(BOOL)a4 currentFocusContext:(id)a5 didChangeActiveElementManager:(BOOL)a6
{
  BOOL v6 = a4;
  id v8 = a3;
  if (v6)
  {
    id v12 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATCandidateBarManager delegate](self, "delegate"));
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(-[SCATCandidateBarManager typingCandidates](self, "typingCandidates"));
    unsigned __int8 v11 = [v9 candidateBarManager:self hasValidTypingCandidates:v10];

    id v8 = v12;
    if ((v11 & 1) == 0)
    {
      -[SCATCandidateBarManager setTypingCandidates:](self, "setTypingCandidates:", 0LL);
      else {
        [v12 useFocusContextOnResume:0];
      }
      id v8 = v12;
    }
  }
}

- (SCATCandidateBarManagerDelegate)delegate
{
  return (SCATCandidateBarManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)typingCandidates
{
  return self->_typingCandidates;
}

- (void)setTypingCandidates:(id)a3
{
}

- (void).cxx_destruct
{
}

@end