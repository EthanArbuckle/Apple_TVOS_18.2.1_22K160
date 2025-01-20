@interface SHLMutableLibraryTrack
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation SHLMutableLibraryTrack

- (id)copyWithZone:(_NSZone *)a3
{
  return -[SHLLibraryTrack initWithLibraryTrack:]( +[SHLLibraryTrack allocWithZone:](&OBJC_CLASS___SHLLibraryTrack, "allocWithZone:", a3),  "initWithLibraryTrack:",  self);
}

@end