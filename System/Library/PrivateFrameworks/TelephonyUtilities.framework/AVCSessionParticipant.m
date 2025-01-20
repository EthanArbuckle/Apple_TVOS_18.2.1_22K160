@interface AVCSessionParticipant
- (int64_t)captionsToken;
@end

@implementation AVCSessionParticipant

- (int64_t)captionsToken
{
  return (int64_t)-[AVCSessionParticipant streamTokenForStreamGroupID:]( self,  "streamTokenForStreamGroupID:",  1667330164LL);
}

@end