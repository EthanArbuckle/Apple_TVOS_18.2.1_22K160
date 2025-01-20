@interface NRASMRequest
- (id)description;
@end

@implementation NRASMRequest

- (id)description
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NRASMBrowseRequest);
  if ((objc_opt_isKindOfClass(self, v4) & 1) != 0)
  {
    v5 = @"NRASMBrowseRequest[";
  }

  else
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NRASMResolveRequest);
    if ((objc_opt_isKindOfClass(self, v6) & 1) != 0)
    {
      v5 = @"NRASMResolveRequest[";
    }

    else
    {
      uint64_t v7 = objc_opt_class(&OBJC_CLASS___NRASMListenRequest);
      if ((objc_opt_isKindOfClass(self, v7) & 1) == 0) {
        goto LABEL_8;
      }
      v5 = @"NRASMListenRequest[";
    }
  }

  -[NSMutableString appendString:](v3, "appendString:", v5);
LABEL_8:
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"%p, %@, %@",  self->_client,  self->_identifier,  self->_clientDescription);
  if (self->_localOnly) {
    -[NSMutableString appendString:](v3, "appendString:", @", local");
  }
  -[NSMutableString appendString:](v3, "appendString:", @"]");
  return v3;
}

- (void).cxx_destruct
{
}

@end