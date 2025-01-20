@interface ADAnalyticsIdentifiersUtils
+ (BOOL)isPartOfHome:(id)a3;
+ (id)idWhenNotPartOfHome;
+ (id)logger;
@end

@implementation ADAnalyticsIdentifiersUtils

+ (id)logger
{
  if (qword_100577FC0 != -1) {
    dispatch_once(&qword_100577FC0, &stru_1004F3CA0);
  }
  return (id)qword_100577FB8;
}

+ (id)idWhenNotPartOfHome
{
  if (qword_100577FD0 != -1) {
    dispatch_once(&qword_100577FD0, &stru_1004F3CC0);
  }
  return (id)qword_100577FC8;
}

+ (BOOL)isPartOfHome:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[ADAnalyticsIdentifiersUtils idWhenNotPartOfHome]( &OBJC_CLASS___ADAnalyticsIdentifiersUtils,  "idWhenNotPartOfHome"));
  unsigned __int8 v5 = [v3 isEqual:v4];

  char v6 = v5 ^ 1;
  return v6;
}

@end