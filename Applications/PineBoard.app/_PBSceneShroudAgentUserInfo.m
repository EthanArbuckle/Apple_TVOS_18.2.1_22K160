@interface _PBSceneShroudAgentUserInfo
- (BSInvalidatable)presentationAssertion;
- (NSString)bundleID;
- (_PBSceneShroudAgentUserInfo)initWithBundleID:(id)a3;
- (int64_t)style;
- (void)dealloc;
- (void)invalidate;
- (void)setPresentationAssertion:(id)a3;
- (void)setStyle:(int64_t)a3;
@end

@implementation _PBSceneShroudAgentUserInfo

- (_PBSceneShroudAgentUserInfo)initWithBundleID:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____PBSceneShroudAgentUserInfo;
  v5 = -[_PBSceneShroudAgentUserInfo init](&v9, "init");
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    bundleID = v5->_bundleID;
    v5->_bundleID = v6;

    v5->_style = 0LL;
  }

  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____PBSceneShroudAgentUserInfo;
  -[_PBSceneShroudAgentUserInfo dealloc](&v3, "dealloc");
}

- (void)invalidate
{
  v2 = self->_presentationAssertion;
  objc_super v3 = v2;
  if (v2)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100110E74;
    block[3] = &unk_1003CFF08;
    v5 = v2;
    dispatch_async(&_dispatch_main_q, block);
  }
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (BSInvalidatable)presentationAssertion
{
  return self->_presentationAssertion;
}

- (void)setPresentationAssertion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end