@interface SKPartition
- (NSString)name;
- (SKFilesystem)fs;
- (id)buildWithScheme:(int)a3 sectorSize:(unint64_t)a4;
- (unint64_t)size;
- (void)setFs:(id)a3;
- (void)setName:(id)a3;
- (void)setSize:(unint64_t)a3;
@end

@implementation SKPartition

- (id)buildWithScheme:(int)a3 sectorSize:(unint64_t)a4
{
  int v10 = 0;
  v5 = -[SKPartition fs](self, "fs");
  [v5 contentMask];
  v6 = -[SKPartition name](self, "name");
  -[SKPartition size](self, "size");
  v7 = (void *)MKCFBuildPartition();

  id v8 = v7;
  return v8;
}

id __42__SKPartition_buildWithScheme_sectorSize___block_invoke()
{
  v4[1] = *MEMORY[0x1895F89C0];
  v3 = @"faultCode";
  base64Encode((uint64_t)"SKPartitionTable.m", 67LL);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  [MEMORY[0x189603F68] dictionaryWithObjects:v4 forKeys:&v3 count:1];
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (SKFilesystem)fs
{
  return self->_fs;
}

- (void)setFs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end