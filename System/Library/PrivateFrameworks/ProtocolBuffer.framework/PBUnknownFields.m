@interface PBUnknownFields
- (id)description;
- (id)dictionaryRepresentation;
- (void)dealloc;
- (void)writeTo:(id)a3;
@end

@implementation PBUnknownFields

- (id)dictionaryRepresentation
{
  if (self->_bufLen)
  {
    v2 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithBytesNoCopy:self->_buf length:self->_bufLen freeWhenDone:0];
    v3 = -[PBDataReader initWithData:](objc_alloc(&OBJC_CLASS___PBDataReader), "initWithData:", v2);
    [MEMORY[0x189603FC8] dictionary];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _dictionaryRepresentation(v3, 0LL, 6, v4);
  }

  else
  {
    [MEMORY[0x189603F68] dictionary];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (id)description
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 description];
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)writeTo:(id)a3
{
  if (self->_bufLen) {
    objc_msgSend(a3, "write:maxLength:", self->_buf);
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBUnknownFields;
  -[PBUnknownFields dealloc](&v3, sel_dealloc);
}

@end