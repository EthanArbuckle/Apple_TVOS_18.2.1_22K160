@interface TASKOutput
- (BOOL)hasEdgeDNS;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (TASKEdgeDnsOutput)edgeDNS;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEdgeDNS:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TASKOutput

- (BOOL)hasEdgeDNS
{
  return self->_edgeDNS != 0LL;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TASKOutput;
  id v3 = -[TASKOutput description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TASKOutput dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ %@", v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  edgeDNS = self->_edgeDNS;
  if (edgeDNS)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TASKEdgeDnsOutput dictionaryRepresentation](edgeDNS, "dictionaryRepresentation"));
    [v3 setObject:v5 forKey:@"edgeDNS"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100071950((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  edgeDNS = self->_edgeDNS;
  if (edgeDNS) {
    PBDataWriterWriteSubmessage(a3, edgeDNS, 1LL);
  }
}

- (void)copyTo:(id)a3
{
  edgeDNS = self->_edgeDNS;
  if (edgeDNS) {
    [a3 setEdgeDNS:edgeDNS];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  id v6 = -[TASKEdgeDnsOutput copyWithZone:](self->_edgeDNS, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
  {
    edgeDNS = self->_edgeDNS;
    else {
      unsigned __int8 v7 = 1;
    }
  }

  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return -[TASKEdgeDnsOutput hash](self->_edgeDNS, "hash");
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  edgeDNS = self->_edgeDNS;
  uint64_t v6 = v4[1];
  if (edgeDNS)
  {
    if (v6)
    {
      unsigned __int8 v7 = v4;
      -[TASKEdgeDnsOutput mergeFrom:](edgeDNS, "mergeFrom:");
LABEL_6:
      v4 = v7;
    }
  }

  else if (v6)
  {
    unsigned __int8 v7 = v4;
    -[TASKOutput setEdgeDNS:](self, "setEdgeDNS:");
    goto LABEL_6;
  }
}

- (TASKEdgeDnsOutput)edgeDNS
{
  return self->_edgeDNS;
}

- (void)setEdgeDNS:(id)a3
{
}

- (void).cxx_destruct
{
}

@end