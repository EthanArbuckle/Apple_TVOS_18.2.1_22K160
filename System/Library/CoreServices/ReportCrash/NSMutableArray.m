@interface NSMutableArray
- (void)addLines:(id)a3;
@end

@implementation NSMutableArray

- (void)addLines:(id)a3
{
  id v7 = (id)objc_claimAutoreleasedReturnValue([a3 componentsSeparatedByString:@"\n"]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v7 valueForKey:@"stringByTrimming"]);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"SELF != ''"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 filteredArrayUsingPredicate:v5]);

  if ([v6 count]) {
    -[NSMutableArray addObjectsFromArray:](self, "addObjectsFromArray:", v6);
  }
}

@end