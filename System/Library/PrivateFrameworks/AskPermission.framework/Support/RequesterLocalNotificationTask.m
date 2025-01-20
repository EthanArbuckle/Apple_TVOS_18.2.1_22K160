@interface RequesterLocalNotificationTask
- (RequestProtocol)request;
- (RequesterLocalNotificationTask)initWithRequest:(id)a3;
- (id)perform;
@end

@implementation RequesterLocalNotificationTask

- (RequesterLocalNotificationTask)initWithRequest:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___RequesterLocalNotificationTask;
  v4 = -[RequesterLocalNotificationTask init](&v7, "init");
  v5 = v4;
  if (v4) {
    objc_storeStrong((id *)&v4->_request, a3);
  }
  return v5;
}

- (id)perform
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100011768;
  v3[3] = &unk_100030560;
  v3[4] = self;
  return (id)objc_claimAutoreleasedReturnValue( -[RequesterLocalNotificationTask performBinaryTaskWithBlock:]( self,  "performBinaryTaskWithBlock:",  v3));
}

- (RequestProtocol)request
{
  return self->_request;
}

- (void).cxx_destruct
{
}

@end