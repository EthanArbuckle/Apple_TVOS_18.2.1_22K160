@interface SHUpdatedGroupLocalGroupPair
- (SHGroupMO)localGroup;
- (SHMediaLibraryGroup)updatedGroup;
- (SHUpdatedGroupLocalGroupPair)initWithUpdatedGroup:(id)a3 localGroup:(id)a4;
@end

@implementation SHUpdatedGroupLocalGroupPair

- (SHUpdatedGroupLocalGroupPair)initWithUpdatedGroup:(id)a3 localGroup:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___SHUpdatedGroupLocalGroupPair;
  v9 = -[SHUpdatedGroupLocalGroupPair init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_updatedGroup, a3);
    objc_storeStrong((id *)&v10->_localGroup, a4);
  }

  return v10;
}

- (SHMediaLibraryGroup)updatedGroup
{
  return self->_updatedGroup;
}

- (SHGroupMO)localGroup
{
  return self->_localGroup;
}

- (void).cxx_destruct
{
}

@end