@interface HFItem
- (BOOL)isActionSet;
- (BOOL)isCameraItem;
- (HFActionSetItem)actionSetItem;
- (HFCameraItem)cameraItem;
- (NSString)actionSetName;
- (id)executeActionSet;
- (id)turnOffActionSet;
@end

@implementation HFItem

- (BOOL)isCameraItem
{
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___HFCameraItem);
  return objc_opt_isKindOfClass(self, v2) & 1;
}

- (BOOL)isActionSet
{
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___HFActionSetItem);
  return objc_opt_isKindOfClass(self, v2) & 1;
}

- (NSString)actionSetName
{
  if (!-[HFItem isActionSet](self, "isActionSet")) {
    return (NSString *)&stru_192D0;
  }
  id v3 = -[HFItem actionSet](self, "actionSet");
  id v5 = [v3 name];

  return (NSString *)v5;
}

- (id)turnOffActionSet
{
  if (-[HFItem isActionSet](self, "isActionSet")) {
    return -[HFItem turnOffActionSet](self, "turnOffActionSet");
  }
  id v3 =  +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSCocoaErrorDomain,  1LL,  0LL);
  id v5 = +[NAFuture futureWithError:](&OBJC_CLASS___NAFuture, "futureWithError:");

  return v5;
}

- (id)executeActionSet
{
  if (-[HFItem isActionSet](self, "isActionSet")) {
    return -[HFItem executeActionSet](self, "executeActionSet");
  }
  id v3 =  +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSCocoaErrorDomain,  1LL,  0LL);
  id v5 = +[NAFuture futureWithError:](&OBJC_CLASS___NAFuture, "futureWithError:");

  return v5;
}

- (HFActionSetItem)actionSetItem
{
  if (-[HFItem isActionSet](self, "isActionSet")) {
    return self;
  }
  else {
    return (HFActionSetItem *)0LL;
  }
}

- (HFCameraItem)cameraItem
{
  if (-[HFItem isCameraItem](self, "isCameraItem")) {
    return self;
  }
  else {
    return (HFCameraItem *)0LL;
  }
}

@end