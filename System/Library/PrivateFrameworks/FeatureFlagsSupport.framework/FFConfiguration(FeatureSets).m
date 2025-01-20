@interface FFConfiguration(FeatureSets)
@end

@implementation FFConfiguration(FeatureSets)

- (void)_valueForFeatureSet:()FeatureSets atLevel:.cold.1(uint64_t a1)
{
  qword_18C68EFE0 = (uint64_t)"BUG IN CLIENT OF LIBFEATUREFLAGS: this API can't be used with this FFLevel";
  qword_18C68F010 = a1;
  __break(1u);
}

@end