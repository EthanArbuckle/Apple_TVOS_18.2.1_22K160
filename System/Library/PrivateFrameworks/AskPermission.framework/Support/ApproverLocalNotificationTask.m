@interface ApproverLocalNotificationTask
- (ApproverLocalNotificationTask)initWithRequest:(id)a3;
- (RequestProtocol)request;
- (id)perform;
@end

@implementation ApproverLocalNotificationTask

- (ApproverLocalNotificationTask)initWithRequest:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ApproverLocalNotificationTask;
  v6 = -[ApproverLocalNotificationTask init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_request, a3);
  }

  return v7;
}

- (id)perform
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100001E3C;
  v3[3] = &unk_100030560;
  v3[4] = self;
  return (id)objc_claimAutoreleasedReturnValue( -[ApproverLocalNotificationTask performBinaryTaskWithBlock:]( self,  "performBinaryTaskWithBlock:",  v3));
}

- (RequestProtocol)request
{
  return self->_request;
}

- (void).cxx_destruct
{
}

@end