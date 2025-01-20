@interface TVSSFaceTimeNearbyDeviceContent
- (NSUUID)conversationID;
- (TUNearbyDeviceHandle)nearbyDeviceHandle;
- (TVSSFaceTimeNearbyDeviceContent)initWithNearbyDeviceHandle:(id)a3 conversationID:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation TVSSFaceTimeNearbyDeviceContent

- (TVSSFaceTimeNearbyDeviceContent)initWithNearbyDeviceHandle:(id)a3 conversationID:(id)a4
{
  v16 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v14 = 0LL;
  objc_storeStrong(&v14, a4);
  if ([location[0] deviceModel] == (id)2) {
    v4 = @"ipad";
  }
  else {
    v4 = @"iphone";
  }
  id v12 = v4;
  v8 = v16;
  id v10 = [location[0] name];
  id v9 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", v12);
  v16 = 0LL;
  v11.receiver = v8;
  v11.super_class = (Class)&OBJC_CLASS___TVSSFaceTimeNearbyDeviceContent;
  v16 = -[TVSSFaceTimeNearbyDeviceContent initWithTitle:image:text1:](&v11, "initWithTitle:image:text1:", v10);
  objc_storeStrong((id *)&v16, v16);

  if (v16)
  {
    objc_storeStrong((id *)&v16->_nearbyDeviceHandle, location[0]);
    objc_storeStrong((id *)&v16->_conversationID, v14);
  }

  v6 = v16;
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v16, 0LL);
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TVSSFaceTimeNearbyDeviceContent initWithNearbyDeviceHandle:conversationID:]( +[TVSSFaceTimeNearbyDeviceContent allocWithZone:]( &OBJC_CLASS___TVSSFaceTimeNearbyDeviceContent,  "allocWithZone:",  a3),  "initWithNearbyDeviceHandle:conversationID:",  self->_nearbyDeviceHandle,  self->_conversationID);
}

- (NSUUID)conversationID
{
  return self->_conversationID;
}

- (TUNearbyDeviceHandle)nearbyDeviceHandle
{
  return self->_nearbyDeviceHandle;
}

- (void).cxx_destruct
{
}

@end