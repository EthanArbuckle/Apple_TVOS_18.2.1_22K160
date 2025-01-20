@interface TVMusicSeparatorView
- (TVMusicSeparatorView)init;
@end

@implementation TVMusicSeparatorView

- (TVMusicSeparatorView)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVMusicSeparatorView;
  v2 = -[TVMusicSeparatorView init](&v9, "init");
  v3 = v2;
  if (v2)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1000054C8;
    v7[3] = &unk_100268AC8;
    v4 = v2;
    v8 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithDynamicProvider:](&OBJC_CLASS___UIColor, "colorWithDynamicProvider:", v7));
    -[TVMusicSeparatorView setBackgroundColor:](v4, "setBackgroundColor:", v5);
  }

  return v3;
}

@end