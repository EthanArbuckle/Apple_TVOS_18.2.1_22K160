@interface MRDVolumeController
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)isMuted;
- (MRDAVRoutingDataSource)routingDataSource;
- (MRDVolumeController)initWithRoutingDataSource:(id)a3;
- (float)currentVolume;
- (unsigned)capabilities;
@end

@implementation MRDVolumeController

+ (id)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class(&OBJC_CLASS___MRDVolumeController) == a1) {
    return +[MRDVolumeController allocWithZone:](&OBJC_CLASS___MRDMediaServerVolumeController, "allocWithZone:", a3);
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___MRDVolumeController;
  return objc_msgSendSuper2(&v6, "allocWithZone:", a3);
}

- (MRDVolumeController)initWithRoutingDataSource:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MRDVolumeController;
  objc_super v6 = -[MRDVolumeController init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_routingDataSource, a3);
  }

  return v7;
}

- (MRDAVRoutingDataSource)routingDataSource
{
  return self->_routingDataSource;
}

- (float)currentVolume
{
  return self->_currentVolume;
}

- (BOOL)isMuted
{
  return self->_isMuted;
}

- (unsigned)capabilities
{
  return self->_capabilities;
}

- (void).cxx_destruct
{
}

@end