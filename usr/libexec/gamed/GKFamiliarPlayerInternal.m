@interface GKFamiliarPlayerInternal
+ (int)familiarity;
- (void)updateWithCacheObject:(id)a3;
@end

@implementation GKFamiliarPlayerInternal

- (void)updateWithCacheObject:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___GKFamiliarPlayerInternal;
  id v4 = a3;
  -[GKFamiliarPlayerInternal updateWithCacheObject:](&v10, "updateWithCacheObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstName", v10.receiver, v10.super_class));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 lastName]);

  -[GKFamiliarPlayerInternal setFirstName:](self, "setFirstName:", v5);
  -[GKFamiliarPlayerInternal setLastName:](self, "setLastName:", v6);
  id v8 = objc_msgSend((id)objc_opt_class(self, v7), "compositeNameForFirstName:lastName:", v5, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  -[GKFamiliarPlayerInternal setCompositeName:](self, "setCompositeName:", v9);
}

+ (int)familiarity
{
  return 3;
}

@end