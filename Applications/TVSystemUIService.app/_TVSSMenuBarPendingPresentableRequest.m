@interface _TVSSMenuBarPendingPresentableRequest
- (TVSSBannerPresentable)presentable;
- (_TVSSMenuBarPendingPresentableRequest)initWithPresentableViewController:(id)a3 completion:(id)a4;
- (id)completion;
@end

@implementation _TVSSMenuBarPendingPresentableRequest

- (_TVSSMenuBarPendingPresentableRequest)initWithPresentableViewController:(id)a3 completion:(id)a4
{
  v13 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v11 = 0LL;
  objc_storeStrong(&v11, a4);
  v4 = v13;
  v13 = 0LL;
  v10.receiver = v4;
  v10.super_class = (Class)&OBJC_CLASS____TVSSMenuBarPendingPresentableRequest;
  v13 = -[_TVSSMenuBarPendingPresentableRequest init](&v10, "init");
  objc_storeStrong((id *)&v13, v13);
  objc_storeStrong((id *)&v13->_presentable, location[0]);
  id v5 = [v11 copy];
  id completion = v13->_completion;
  v13->_id completion = v5;

  v9 = v13;
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v13, 0LL);
  return v9;
}

- (TVSSBannerPresentable)presentable
{
  return self->_presentable;
}

- (id)completion
{
  return self->_completion;
}

- (void).cxx_destruct
{
}

@end