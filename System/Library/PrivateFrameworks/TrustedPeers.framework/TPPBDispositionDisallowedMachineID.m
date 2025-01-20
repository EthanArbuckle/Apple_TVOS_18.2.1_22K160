@interface TPPBDispositionDisallowedMachineID
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
@end

@implementation TPPBDispositionDisallowedMachineID

- (id)description
{
  v3 = (void *)NSString;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TPPBDispositionDisallowedMachineID;
  v4 = -[TPPBDispositionDisallowedMachineID description](&v8, sel_description);
  v5 = -[TPPBDispositionDisallowedMachineID dictionaryRepresentation](self, "dictionaryRepresentation");
  [v3 stringWithFormat:@"%@ %@", v4, v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return (id)[MEMORY[0x189603FC8] dictionary];
}

- (BOOL)readFrom:(id)a3
{
  return TPPBDispositionDisallowedMachineIDReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  char v4 = [v3 isMemberOfClass:objc_opt_class()];

  return v4;
}

- (unint64_t)hash
{
  return 0LL;
}

@end