@interface NSArray(LocationServices)
- (id)networksSortedBySignalStrengthWithMaxCount:()LocationServices;
@end

@implementation NSArray(LocationServices)

- (id)networksSortedBySignalStrengthWithMaxCount:()LocationServices
{
  v10[1] = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603FA8] array];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ([a1 count])
  {
    [MEMORY[0x189607A20] sortDescriptorWithKey:@"RSSI" ascending:0];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v6;
    [MEMORY[0x189603F18] arrayWithObjects:v10 count:1];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [a1 sortedArrayUsingDescriptors:v7];
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    [v5 addObjectsFromArray:v8];
    if ([v5 count] > a3) {
      objc_msgSend(v5, "removeObjectsInRange:", a3, objc_msgSend(v5, "count") - a3);
    }
  }

  else
  {
    v8 = 0LL;
  }

  return v5;
}

@end