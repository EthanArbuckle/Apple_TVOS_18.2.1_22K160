@interface AFExperimentConfiguration
- (NSArray)allGroups;
@end

@implementation AFExperimentConfiguration

- (NSArray)allGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AFExperimentConfiguration controlGroup](self, "controlGroup"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AFExperimentConfiguration experimentGroups](self, "experimentGroups"));
  v5 = v4;
  if (!v3)
  {
    v8 = &__NSArray0__struct;
    if (v4) {
      v8 = v4;
    }
    id v9 = v8;
    goto LABEL_8;
  }

  if (![v4 count])
  {
    v11 = v3;
    id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
LABEL_8:
    id v7 = v9;
    goto LABEL_9;
  }

  id v6 = [v5 mutableCopy];
  [v6 insertObject:v3 atIndex:0];
  id v7 = [v6 copy];

LABEL_9:
  return (NSArray *)v7;
}

@end