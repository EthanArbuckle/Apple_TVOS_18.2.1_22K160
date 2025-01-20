@interface ASSyncChangeInfo
- (BOOL)isDelete;
- (NSString)postAnchor;
- (SADomainObject)object;
- (id)description;
- (void)setIsDelete:(BOOL)a3;
- (void)setObject:(id)a3;
- (void)setPostAnchor:(id)a3;
@end

@implementation ASSyncChangeInfo

- (id)description
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___ASSyncChangeInfo;
  id v3 = -[ASSyncChangeInfo description](&v11, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (-[ASSyncChangeInfo isDelete](self, "isDelete")) {
    v5 = @"YES";
  }
  else {
    v5 = @"NO";
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASSyncChangeInfo postAnchor](self, "postAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASSyncChangeInfo object](self, "object"));
  id v8 = [v4 stringByAppendingFormat:@" isDelete: %@, postAnchor: %@, change: %@", v5, v6, objc_opt_class(v7)];
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  return v9;
}

- (SADomainObject)object
{
  return self->object;
}

- (void)setObject:(id)a3
{
}

- (NSString)postAnchor
{
  return self->postAnchor;
}

- (void)setPostAnchor:(id)a3
{
}

- (BOOL)isDelete
{
  return self->isDelete;
}

- (void)setIsDelete:(BOOL)a3
{
  self->isDelete = a3;
}

- (void).cxx_destruct
{
}

@end