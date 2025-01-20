@interface SRCompactKeyboardState
- (CGRect)frame;
- (CGRect)frameForAnimation;
- (SRCompactKeyboardAnimation)animation;
- (SRCompactKeyboardState)initWithFrame:(CGRect)a3 animation:(id)a4;
- (SRCompactKeyboardState)initWithKeyboardNotification:(id)a3;
@end

@implementation SRCompactKeyboardState

- (SRCompactKeyboardState)initWithFrame:(CGRect)a3 animation:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___SRCompactKeyboardState;
  v11 = -[SRCompactKeyboardState init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    v11->_frame.origin.CGFloat x = x;
    v11->_frame.origin.CGFloat y = y;
    v11->_frame.size.CGFloat width = width;
    v11->_frame.size.CGFloat height = height;
    objc_storeStrong((id *)&v11->_animation, a4);
  }

  return v12;
}

- (SRCompactKeyboardState)initWithKeyboardNotification:(id)a3
{
  id v4 = a3;
  if ((sub_10001450C(v4) & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:UIKeyboardFrameBeginUserInfoKey]);
    [v6 CGRectValue];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:UIKeyboardFrameEndUserInfoKey]);
    [v15 CGRectValue];
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;

    id v24 = v4;
    v25 = (void *)objc_claimAutoreleasedReturnValue([v24 name]);
    id v26 = sub_1000148D8();
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    unsigned __int8 v28 = [v27 containsObject:v25];

    if ((v28 & 1) == 0)
    {
      id v29 = sub_100014990();
      v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
      unsigned __int8 v31 = [v30 containsObject:v25];

      if ((v31 & 1) != 0)
      {

        double v8 = v17;
        double v10 = v19;
        double v12 = v21;
        double v14 = v23;
LABEL_11:
        v34 = -[SRCompactKeyboardAnimation initWithKeyboardNotification:]( objc_alloc(&OBJC_CLASS___SRCompactKeyboardAnimation),  "initWithKeyboardNotification:",  v24);
        self =  -[SRCompactKeyboardState initWithFrame:animation:]( self,  "initWithFrame:animation:",  v34,  v8,  v10,  v12,  v14);

        v33 = self;
        goto LABEL_12;
      }

      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_FAULT)) {
        sub_10006A180();
      }
    }

    goto LABEL_11;
  }

  v32 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_FAULT)) {
    sub_10006A1F4(v32, v4);
  }
  v33 = 0LL;
LABEL_12:

  return v33;
}

- (CGRect)frameForAnimation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactKeyboardState animation](self, "animation"));
  id v4 = v3;
  if (v3) {
    [v3 endingFrame];
  }
  else {
    -[SRCompactKeyboardState frame](self, "frame");
  }
  double v9 = v5;
  double v10 = v6;
  double v11 = v7;
  double v12 = v8;

  double v13 = v9;
  double v14 = v10;
  double v15 = v11;
  double v16 = v12;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (CGRect)frame
{
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (SRCompactKeyboardAnimation)animation
{
  return self->_animation;
}

- (void).cxx_destruct
{
}

@end