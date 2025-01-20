@interface _PBProfileUpdateContext
- (UPAddProfileRequest)addRequest;
- (UPProfile)profile;
- (UPRemoveProfileRequest)removeRequest;
- (UPUpdateProfileRequest)updateRequest;
- (_PBProfileUpdateContext)initWithAddRequest:(id)a3;
- (_PBProfileUpdateContext)initWithProfile:(id)a3 removeRequest:(id)a4;
- (_PBProfileUpdateContext)initWithProfile:(id)a3 updateRequest:(id)a4;
@end

@implementation _PBProfileUpdateContext

- (_PBProfileUpdateContext)initWithAddRequest:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____PBProfileUpdateContext;
  v6 = -[_PBProfileUpdateContext init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_addRequest, a3);
  }

  return v7;
}

- (_PBProfileUpdateContext)initWithProfile:(id)a3 updateRequest:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS____PBProfileUpdateContext;
  objc_super v9 = -[_PBProfileUpdateContext init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_profile, a3);
    objc_storeStrong((id *)&v10->_updateRequest, a4);
  }

  return v10;
}

- (_PBProfileUpdateContext)initWithProfile:(id)a3 removeRequest:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS____PBProfileUpdateContext;
  objc_super v9 = -[_PBProfileUpdateContext init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_profile, a3);
    objc_storeStrong((id *)&v10->_removeRequest, a4);
  }

  return v10;
}

- (UPProfile)profile
{
  return self->_profile;
}

- (UPAddProfileRequest)addRequest
{
  return self->_addRequest;
}

- (UPUpdateProfileRequest)updateRequest
{
  return self->_updateRequest;
}

- (UPRemoveProfileRequest)removeRequest
{
  return self->_removeRequest;
}

- (void).cxx_destruct
{
}

@end