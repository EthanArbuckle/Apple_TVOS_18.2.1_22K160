@interface ManageSubscriptionsRequest
+ (BOOL)supportsSecureCoding;
- (ManageSubscriptionsRequest)init;
- (ManageSubscriptionsRequest)initWithCoder:(id)a3;
- (ManageSubscriptionsRequest)initWithFamilyID:(id)a3;
- (ManageSubscriptionsRequest)initWithFamilyID:(id)a3 sceneID:(id)a4;
- (NSString)familyID;
- (NSString)sceneID;
- (void)encodeWithCoder:(id)a3;
- (void)setSceneID:(id)a3;
@end

@implementation ManageSubscriptionsRequest

- (ManageSubscriptionsRequest)init
{
  return -[ManageSubscriptionsRequest initWithFamilyID:sceneID:](self, "initWithFamilyID:sceneID:", 0LL, 0LL);
}

- (ManageSubscriptionsRequest)initWithFamilyID:(id)a3
{
  return -[ManageSubscriptionsRequest initWithFamilyID:sceneID:](self, "initWithFamilyID:sceneID:", a3, 0LL);
}

- (ManageSubscriptionsRequest)initWithFamilyID:(id)a3 sceneID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___ManageSubscriptionsRequest;
  v9 = -[ManageSubscriptionsRequest init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_familyID, a3);
    objc_storeStrong((id *)&v10->_sceneID, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ManageSubscriptionsRequest familyID](self, "familyID"));
  [v4 encodeObject:v5 forKey:@"familyID"];

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[ManageSubscriptionsRequest sceneID](self, "sceneID"));
  [v4 encodeObject:v6 forKey:@"sceneID"];
}

- (ManageSubscriptionsRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"familyID"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"sceneID"];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  v9 = -[ManageSubscriptionsRequest initWithFamilyID:sceneID:](self, "initWithFamilyID:sceneID:", v6, v8);
  return v9;
}

- (NSString)familyID
{
  return self->_familyID;
}

- (NSString)sceneID
{
  return self->_sceneID;
}

- (void)setSceneID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end