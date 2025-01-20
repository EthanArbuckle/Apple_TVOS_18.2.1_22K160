@interface TPECPublicKeyFactory
- (id)keyFromSPKI:(id)a3;
@end

@implementation TPECPublicKeyFactory

- (id)keyFromSPKI:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    [MEMORY[0x189612718] keyWithSubjectPublicKeyInfo:v3];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v4 = 0LL;
  }

  return v4;
}

@end