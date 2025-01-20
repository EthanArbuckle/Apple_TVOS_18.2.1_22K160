@interface MRDExternalDeviceAuthTokenRecord
- (NSDate)dateCreated;
- (NSDate)expirationDate;
- (NSString)deviceID;
- (NSString)token;
- (id)_copyWithZone:(_NSZone *)a3 usingConcreteClass:(Class)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
@end

@implementation MRDExternalDeviceAuthTokenRecord

- (id)copyWithZone:(_NSZone *)a3
{
  return -[MRDExternalDeviceAuthTokenRecord _copyWithZone:usingConcreteClass:]( self,  "_copyWithZone:usingConcreteClass:",  a3,  objc_opt_class(self));
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[MRDExternalDeviceAuthTokenRecord _copyWithZone:usingConcreteClass:]( self,  "_copyWithZone:usingConcreteClass:",  a3,  objc_opt_class(&OBJC_CLASS___MRDMutableExternalDeviceAuthTokenRecord));
}

- (id)_copyWithZone:(_NSZone *)a3 usingConcreteClass:(Class)a4
{
  id v5 = objc_alloc_init(a4);
  id v6 = -[NSString copy](self->_deviceID, "copy");
  v7 = (void *)*((void *)v5 + 1);
  *((void *)v5 + 1) = v6;

  id v8 = -[NSString copy](self->_token, "copy");
  v9 = (void *)*((void *)v5 + 2);
  *((void *)v5 + 2) = v8;

  objc_storeStrong((id *)v5 + 3, self->_dateCreated);
  objc_storeStrong((id *)v5 + 4, self->_expirationDate);
  return v5;
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (NSString)token
{
  return self->_token;
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void).cxx_destruct
{
}

@end