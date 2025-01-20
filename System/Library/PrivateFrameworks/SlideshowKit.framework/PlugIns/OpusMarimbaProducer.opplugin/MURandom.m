@interface MURandom
+ ($C3997F145DA9CFB88D7C332041F986CA)poolInfo;
+ (BOOL)clearVars;
+ (id)randomGeneratorWithSeed:(unint64_t)a3;
- (double)randomFloatInRange:(double)a3 :(double)a4;
- (void)_seed:(unint64_t)a3;
@end

@implementation MURandom

+ ($C3997F145DA9CFB88D7C332041F986CA)poolInfo
{
  return ($C3997F145DA9CFB88D7C332041F986CA *)&unk_2B0540;
}

+ (BOOL)clearVars
{
  return 0;
}

- (void)_seed:(unint64_t)a3
{
}

+ (id)randomGeneratorWithSeed:(unint64_t)a3
{
  v4 = objc_alloc_init(&OBJC_CLASS___MURandom);
  -[MURandom _seed:](v4, "_seed:", a3);
  return v4;
}

- (double)randomFloatInRange:(double)a3 :(double)a4
{
  return a3 + (double)-[MURandom randomInt](self, "randomInt") * 4.65661287e-10 * (a4 - a3);
}

@end