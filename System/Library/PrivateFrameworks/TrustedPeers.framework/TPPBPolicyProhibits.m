@interface TPPBPolicyProhibits
- (BOOL)hasCandidateCategory;
- (BOOL)hasExplanation;
- (BOOL)hasPolicyVersion;
- (BOOL)hasSponsorCategory;
- (BOOL)hasSponsorId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)candidateCategory;
- (NSString)explanation;
- (NSString)sponsorCategory;
- (NSString)sponsorId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)policyVersion;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCandidateCategory:(id)a3;
- (void)setExplanation:(id)a3;
- (void)setHasPolicyVersion:(BOOL)a3;
- (void)setPolicyVersion:(unint64_t)a3;
- (void)setSponsorCategory:(id)a3;
- (void)setSponsorId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TPPBPolicyProhibits

- (void)setPolicyVersion:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_policyVersion = a3;
}

- (void)setHasPolicyVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPolicyVersion
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasSponsorId
{
  return self->_sponsorId != 0LL;
}

- (BOOL)hasSponsorCategory
{
  return self->_sponsorCategory != 0LL;
}

- (BOOL)hasCandidateCategory
{
  return self->_candidateCategory != 0LL;
}

- (BOOL)hasExplanation
{
  return self->_explanation != 0LL;
}

- (id)description
{
  v3 = (void *)NSString;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TPPBPolicyProhibits;
  v4 = -[TPPBPolicyProhibits description](&v8, sel_description);
  v5 = -[TPPBPolicyProhibits dictionaryRepresentation](self, "dictionaryRepresentation");
  [v3 stringWithFormat:@"%@ %@", v4, v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    [MEMORY[0x189607968] numberWithUnsignedLongLong:self->_policyVersion];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setObject:v4 forKey:@"policy_version"];
  }

  sponsorId = self->_sponsorId;
  if (sponsorId) {
    [v3 setObject:sponsorId forKey:@"sponsor_id"];
  }
  sponsorCategory = self->_sponsorCategory;
  if (sponsorCategory) {
    [v3 setObject:sponsorCategory forKey:@"sponsor_category"];
  }
  candidateCategory = self->_candidateCategory;
  if (candidateCategory) {
    [v3 setObject:candidateCategory forKey:@"candidate_category"];
  }
  explanation = self->_explanation;
  if (explanation) {
    [v3 setObject:explanation forKey:@"explanation"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return TPPBPolicyProhibitsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v5;
  }

  if (self->_sponsorId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }

  if (self->_sponsorCategory)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }

  if (self->_candidateCategory)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }

  if (self->_explanation)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = self->_policyVersion;
    *((_BYTE *)v4 + 48) |= 1u;
  }

  id v5 = v4;
  if (self->_sponsorId)
  {
    objc_msgSend(v4, "setSponsorId:");
    id v4 = v5;
  }

  if (self->_sponsorCategory)
  {
    objc_msgSend(v5, "setSponsorCategory:");
    id v4 = v5;
  }

  if (self->_candidateCategory)
  {
    objc_msgSend(v5, "setCandidateCategory:");
    id v4 = v5;
  }

  if (self->_explanation)
  {
    objc_msgSend(v5, "setExplanation:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(void *)(v5 + 8) = self->_policyVersion;
    *(_BYTE *)(v5 + 48) |= 1u;
  }

  uint64_t v7 = -[NSString copyWithZone:](self->_sponsorId, "copyWithZone:", a3);
  objc_super v8 = (void *)v6[5];
  v6[5] = v7;

  uint64_t v9 = -[NSString copyWithZone:](self->_sponsorCategory, "copyWithZone:", a3);
  v10 = (void *)v6[4];
  v6[4] = v9;

  uint64_t v11 = -[NSString copyWithZone:](self->_candidateCategory, "copyWithZone:", a3);
  v12 = (void *)v6[2];
  v6[2] = v11;

  uint64_t v13 = -[NSString copyWithZone:](self->_explanation, "copyWithZone:", a3);
  v14 = (void *)v6[3];
  v6[3] = v13;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_policyVersion != *((void *)v4 + 1)) {
      goto LABEL_15;
    }
  }

  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_15:
    char v9 = 0;
    goto LABEL_16;
  }

  sponsorId = self->_sponsorId;
  sponsorCategory = self->_sponsorCategory;
  if ((unint64_t)sponsorCategory | *((void *)v4 + 4))
  {
  }

  candidateCategory = self->_candidateCategory;
  if ((unint64_t)candidateCategory | *((void *)v4 + 2))
  {
  }

  explanation = self->_explanation;
  else {
    char v9 = 1;
  }
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  if ((*(_BYTE *)&self->_has & 1) != 0) {
    unint64_t v3 = 2654435761u * self->_policyVersion;
  }
  else {
    unint64_t v3 = 0LL;
  }
  NSUInteger v4 = -[NSString hash](self->_sponsorId, "hash") ^ v3;
  NSUInteger v5 = -[NSString hash](self->_sponsorCategory, "hash");
  NSUInteger v6 = v4 ^ v5 ^ -[NSString hash](self->_candidateCategory, "hash");
  return v6 ^ -[NSString hash](self->_explanation, "hash");
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if ((v4[6] & 1) != 0)
  {
    self->_policyVersion = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }

  NSUInteger v5 = v4;
  if (v4[5])
  {
    -[TPPBPolicyProhibits setSponsorId:](self, "setSponsorId:");
    NSUInteger v4 = v5;
  }

  if (v4[4])
  {
    -[TPPBPolicyProhibits setSponsorCategory:](self, "setSponsorCategory:");
    NSUInteger v4 = v5;
  }

  if (v4[2])
  {
    -[TPPBPolicyProhibits setCandidateCategory:](self, "setCandidateCategory:");
    NSUInteger v4 = v5;
  }

  if (v4[3])
  {
    -[TPPBPolicyProhibits setExplanation:](self, "setExplanation:");
    NSUInteger v4 = v5;
  }
}

- (unint64_t)policyVersion
{
  return self->_policyVersion;
}

- (NSString)sponsorId
{
  return self->_sponsorId;
}

- (void)setSponsorId:(id)a3
{
}

- (NSString)sponsorCategory
{
  return self->_sponsorCategory;
}

- (void)setSponsorCategory:(id)a3
{
}

- (NSString)candidateCategory
{
  return self->_candidateCategory;
}

- (void)setCandidateCategory:(id)a3
{
}

- (NSString)explanation
{
  return self->_explanation;
}

- (void)setExplanation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end