@interface SKPartitionDescriptor
- (id)newPartition;
@end

@implementation SKPartitionDescriptor

- (id)newPartition
{
  v3 = (void *)objc_opt_new(&OBJC_CLASS___SKPartition, a2);
  objc_msgSend(v3, "setSize:", -[SKPartitionDescriptor size](self, "size"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKPartitionDescriptor innerDescriptor](self, "innerDescriptor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 filesystem]);
  [v3 setFs:v5];

  return v3;
}

@end