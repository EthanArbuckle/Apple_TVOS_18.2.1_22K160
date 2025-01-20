@interface KCJoiningRequestAccountCircleDelegate
+ (id)delegate;
- (BOOL)processCircleJoinData:(id)a3 version:(int)a4 error:(id *)a5;
- (__OpaqueSOSPeerInfo)copyPeerInfoError:(id *)a3;
@end

@implementation KCJoiningRequestAccountCircleDelegate

- (__OpaqueSOSPeerInfo)copyPeerInfoError:(id *)a3
{
  return (__OpaqueSOSPeerInfo *)SOSCCCopyApplication();
}

- (BOOL)processCircleJoinData:(id)a3 version:(int)a4 error:(id *)a5
{
  return SOSCCJoinWithCircleJoiningBlob();
}

+ (id)delegate
{
  return objc_alloc_init(&OBJC_CLASS___KCJoiningRequestAccountCircleDelegate);
}

@end