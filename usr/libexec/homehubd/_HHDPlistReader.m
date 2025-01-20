@interface _HHDPlistReader
+ (id)plistReader;
- (id)getJobDataForURL:(id)a3 error:(id *)a4;
@end

@implementation _HHDPlistReader

+ (id)plistReader
{
  if (qword_10002E6C8 != -1) {
    dispatch_once(&qword_10002E6C8, &stru_100024D38);
  }
  return (id)qword_10002E6C0;
}

- (id)getJobDataForURL:(id)a3 error:(id *)a4
{
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfURL:error:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfURL:error:",  a3,  a4));
  id v5 = [v4 mutableCopy];

  return v5;
}

@end