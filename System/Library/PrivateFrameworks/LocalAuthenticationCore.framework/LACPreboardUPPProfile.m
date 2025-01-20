@interface LACPreboardUPPProfile
- (LACPreboardUPPProfile)initWithUUID:(id)a3 teamID:(id)a4 teamName:(id)a5;
- (NSString)teamID;
- (NSString)teamName;
- (NSString)uuid;
- (void)setTeamID:(id)a3;
- (void)setTeamName:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation LACPreboardUPPProfile

- (LACPreboardUPPProfile)initWithUUID:(id)a3 teamID:(id)a4 teamName:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___LACPreboardUPPProfile;
  v12 = -[LACPreboardUPPProfile init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_uuid, a3);
    objc_storeStrong((id *)&v13->_teamID, a4);
    objc_storeStrong((id *)&v13->_teamName, a5);
  }

  return v13;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSString)teamID
{
  return self->_teamID;
}

- (void)setTeamID:(id)a3
{
}

- (NSString)teamName
{
  return self->_teamName;
}

- (void)setTeamName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end