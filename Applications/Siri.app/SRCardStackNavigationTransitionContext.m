@interface SRCardStackNavigationTransitionContext
- (BOOL)_isCompleted;
- (CGRect)backgroundPlatteredCardViewOriginalFrame;
- (CGRect)fromPlatteredCardViewOriginalFrame;
- (SRCardStackNavigationTransitionContext)init;
- (SRCardStackNavigationTransitionContext)initWithCompletion:(id)a3;
- (SiriSharedUIDarkening)backgroundPlatteredCardView;
- (SiriSharedUIDarkening)fromPlatteredCardView;
- (SiriSharedUIDarkening)toPlatteredCardView;
- (UIView)containerView;
- (double)percentComplete;
- (double)transitionDuration;
- (id)_completion;
- (int64_t)semanticContentAttribute;
- (void)_setCompleted:(BOOL)a3;
- (void)_setCompletion:(id)a3;
- (void)completeTransition:(BOOL)a3;
- (void)setBackgroundPlatteredCardView:(id)a3;
- (void)setBackgroundPlatteredCardViewOriginalFrame:(CGRect)a3;
- (void)setContainerView:(id)a3;
- (void)setFromPlatteredCardView:(id)a3;
- (void)setFromPlatteredCardViewOriginalFrame:(CGRect)a3;
- (void)setPercentComplete:(double)a3;
- (void)setToPlatteredCardView:(id)a3;
- (void)setTransitionDuration:(double)a3;
@end

@implementation SRCardStackNavigationTransitionContext

- (SRCardStackNavigationTransitionContext)initWithCompletion:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SRCardStackNavigationTransitionContext;
  v5 = -[SRCardStackNavigationTransitionContext init](&v9, "init");
  if (v5)
  {
    id v6 = [v4 copy];
    id completion = v5->_completion;
    v5->_id completion = v6;
  }

  return v5;
}

- (SRCardStackNavigationTransitionContext)init
{
  return -[SRCardStackNavigationTransitionContext initWithCompletion:](self, "initWithCompletion:", &stru_1000BAEB0);
}

- (int64_t)semanticContentAttribute
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRCardStackNavigationTransitionContext toPlatteredCardView](self, "toPlatteredCardView"));
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRCardStackNavigationTransitionContext toPlatteredCardView](self, "toPlatteredCardView"));
    id v5 = [v4 semanticContentAttribute];
  }

  else
  {
    id v5 = 0LL;
  }

  return (int64_t)v5;
}

- (void)completeTransition:(BOOL)a3
{
  BOOL v3 = a3;
  if (-[SRCardStackNavigationTransitionContext _isCompleted](self, "_isCompleted"))
  {
    id v5 = (os_log_s *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_FAULT)) {
      sub_10006C0CC(v5);
    }
  }

  else
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue(-[SRCardStackNavigationTransitionContext _completion](self, "_completion"));
    v7 = (void *)v6;
    if (v6)
    {
      (*(void (**)(uint64_t, BOOL))(v6 + 16))(v6, v3);
    }

    else
    {
      v8 = (os_log_s *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        int v9 = 136315138;
        v10 = "-[SRCardStackNavigationTransitionContext completeTransition:]";
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "%s No completion block was provided for execution, so just marking the transaction as complete and returning",  (uint8_t *)&v9,  0xCu);
      }
    }

    -[SRCardStackNavigationTransitionContext _setCompleted:](self, "_setCompleted:", 1LL);
    -[SRCardStackNavigationTransitionContext _setCompletion:](self, "_setCompletion:", 0LL);
  }

- (double)percentComplete
{
  return self->_percentComplete;
}

- (void)setPercentComplete:(double)a3
{
  self->_percentComplete = a3;
}

- (CGRect)backgroundPlatteredCardViewOriginalFrame
{
  double x = self->_backgroundPlatteredCardViewOriginalFrame.origin.x;
  double y = self->_backgroundPlatteredCardViewOriginalFrame.origin.y;
  double width = self->_backgroundPlatteredCardViewOriginalFrame.size.width;
  double height = self->_backgroundPlatteredCardViewOriginalFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBackgroundPlatteredCardViewOriginalFrame:(CGRect)a3
{
  self->_backgroundPlatteredCardViewOriginalFrame = a3;
}

- (SiriSharedUIDarkening)backgroundPlatteredCardView
{
  return self->_backgroundPlatteredCardView;
}

- (void)setBackgroundPlatteredCardView:(id)a3
{
}

- (CGRect)fromPlatteredCardViewOriginalFrame
{
  double x = self->_fromPlatteredCardViewOriginalFrame.origin.x;
  double y = self->_fromPlatteredCardViewOriginalFrame.origin.y;
  double width = self->_fromPlatteredCardViewOriginalFrame.size.width;
  double height = self->_fromPlatteredCardViewOriginalFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFromPlatteredCardViewOriginalFrame:(CGRect)a3
{
  self->_fromPlatteredCardViewOriginalFrame = a3;
}

- (SiriSharedUIDarkening)fromPlatteredCardView
{
  return self->_fromPlatteredCardView;
}

- (void)setFromPlatteredCardView:(id)a3
{
}

- (SiriSharedUIDarkening)toPlatteredCardView
{
  return self->_toPlatteredCardView;
}

- (void)setToPlatteredCardView:(id)a3
{
}

- (double)transitionDuration
{
  return self->_transitionDuration;
}

- (void)setTransitionDuration:(double)a3
{
  self->_transitionDuration = a3;
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (id)_completion
{
  return self->_completion;
}

- (void)_setCompletion:(id)a3
{
}

- (BOOL)_isCompleted
{
  return self->_completed;
}

- (void)_setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (void).cxx_destruct
{
}

@end