@interface MTJSITunesStore
- (void)playMedia:(id)a3 :(id)a4;
@end

@implementation MTJSITunesStore

- (void)playMedia:(id)a3 :(id)a4
{
  id v6 = a3;
  v7 = (void (**)(void, void))objc_claimAutoreleasedReturnValue(-[MTJSITunesStore blockForJSCallback:](self, "blockForJSCallback:", a4));
  v8 = -[MTJSPlaybackRequest initWithJSDictionary:]( objc_alloc(&OBJC_CLASS___MTJSPlaybackRequest),  "initWithJSDictionary:",  v6);

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTJSITunesStore appContext](self, "appContext"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1001200A4;
    v10[3] = &unk_1002454A0;
    v11 = v8;
    v12 = v7;
    [v9 evaluateDelegateBlockSync:v10];
  }

  else
  {
    v7[2](v7, 0LL);
  }
}

@end