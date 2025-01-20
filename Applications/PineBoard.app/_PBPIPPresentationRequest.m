@interface _PBPIPPresentationRequest
- (NSDictionary)userInfo;
- (PBPIPContainerViewControllerLayout)layout;
- (_PBPIPPresentationRequest)initWithLayout:(id)a3 userInfo:(id)a4;
- (void)setLayout:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation _PBPIPPresentationRequest

- (_PBPIPPresentationRequest)initWithLayout:(id)a3 userInfo:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS____PBPIPPresentationRequest;
  v9 = -[_PBPIPPresentationRequest init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_layout, a3);
    objc_storeStrong((id *)&v10->_userInfo, a4);
  }

  return v10;
}

- (PBPIPContainerViewControllerLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end