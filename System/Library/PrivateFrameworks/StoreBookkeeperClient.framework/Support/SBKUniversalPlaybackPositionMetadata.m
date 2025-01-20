@interface SBKUniversalPlaybackPositionMetadata
+ (id)SBKPropertyValueForML3PropertyValue:(id)a3 ML3Property:(id)a4;
@end

@implementation SBKUniversalPlaybackPositionMetadata

+ (id)SBKPropertyValueForML3PropertyValue:(id)a3 ML3Property:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (qword_1000238A8 != -1) {
    dispatch_once(&qword_1000238A8, &stru_10001CCB0);
  }
  uint64_t v7 = objc_claimAutoreleasedReturnValue([(id)qword_1000238A0 objectForKey:v6]);
  v8 = (void *)v7;
  if (v7)
  {
    uint64_t v9 = (*(uint64_t (**)(uint64_t, id))(v7 + 16))(v7, v5);
    id v10 = (id)objc_claimAutoreleasedReturnValue(v9);
  }

  else
  {
    id v10 = v5;
  }

  v11 = v10;

  return v11;
}

@end