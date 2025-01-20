@interface PBSystemGestureTableHandleResult
+ (id)resultWithHandle:(id)a3 descriptor:(id)a4 deferringTargetHandle:(id)a5;
- (PBSystemGestureHandle)deferringTargetHandle;
- (PBSystemGestureHandle)handle;
- (PBSystemGestureRecognizerDescriptor)descriptor;
@end

@implementation PBSystemGestureTableHandleResult

+ (id)resultWithHandle:(id)a3 descriptor:(id)a4 deferringTargetHandle:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = (id *)objc_alloc_init((Class)a1);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong(v12 + 1, a3);
    objc_storeStrong(v13 + 2, a4);
    objc_storeStrong(v13 + 3, a5);
  }

  return v13;
}

- (PBSystemGestureHandle)handle
{
  return self->_handle;
}

- (PBSystemGestureRecognizerDescriptor)descriptor
{
  return self->_descriptor;
}

- (PBSystemGestureHandle)deferringTargetHandle
{
  return self->_deferringTargetHandle;
}

- (void).cxx_destruct
{
}

@end