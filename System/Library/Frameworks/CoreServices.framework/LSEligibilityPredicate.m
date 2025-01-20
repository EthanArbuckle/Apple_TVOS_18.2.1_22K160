@interface LSEligibilityPredicate
- (LSEligibilityPredicate)initWithDictionary:(id)a3 error:(id *)a4;
- (id).cxx_construct;
- (id)description;
- (id)evaluateWithDomainEligibilityResolver:(id)a3 error:(id *)a4;
@end

@implementation LSEligibilityPredicate

- (LSEligibilityPredicate)initWithDictionary:(id)a3 error:(id *)a4
{
  if (!v11)
  {

LABEL_5:
    v7 = 0LL;
    goto LABEL_8;
  }

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___LSEligibilityPredicate;
  v6 = -[LSEligibilityPredicate init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    LaunchServices::DelayedInitable<LaunchServices::EligibilityPredicateEvaluation::Predicate>::emplace<LaunchServices::EligibilityPredicateEvaluation::Predicate>( (uint64_t)&v6->_predicate,  v10);
    goto LABEL_8;
  }

  if (!a4) {
    goto LABEL_5;
  }
  _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607688],  12LL,  (uint64_t)"-[LSEligibilityPredicate initWithDictionary:error:]",  145LL,  0LL);
  v7 = 0LL;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:
  if (v11) {
    std::__tree<std::__value_type<os_eligibility_domain_t,std::vector<os_eligibility_answer_t>>,std::__map_value_compare<os_eligibility_domain_t,std::__value_type<os_eligibility_domain_t,std::vector<os_eligibility_answer_t>>,std::less<os_eligibility_domain_t>,true>,std::allocator<std::__value_type<os_eligibility_domain_t,std::vector<os_eligibility_answer_t>>>>::destroy( (uint64_t)v10,  (void *)v10[1]);
  }
  return v7;
}

- (id)evaluateWithDomainEligibilityResolver:(id)a3 error:(id *)a4
{
  unsigned __int16 v4 = LaunchServices::EligibilityPredicateEvaluation::Predicate::evaluate( &self->_predicate._storage.var0.__val_._match_map.__tree_.__begin_node_,  a3,  (uint64_t)a4);
  if (v4 < 0x100u) {
    return 0LL;
  }
  v6 = (id *)MEMORY[0x189604DE0];
  if ((_BYTE)v4) {
    v6 = (id *)MEMORY[0x189604DE8];
  }
  return *v6;
}

- (id)description
{
  v3 = (void *)NSString;
  uint64_t v4 = objc_opt_class();
  LaunchServices::EligibilityPredicateEvaluation::Predicate::to_string( (LaunchServices::EligibilityPredicateEvaluation::Predicate *)&self->_predicate,  &__p);
  if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::stringbuf::string_type *)__p.__r_.__value_.__r.__words[0];
  }
  [v3 stringWithFormat:@"<%@ %p %s>", v4, self, p_p];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  return v6;
}

- (void).cxx_destruct
{
  if (self->_predicate._storage.__engaged_) {
    std::__tree<std::__value_type<os_eligibility_domain_t,std::vector<os_eligibility_answer_t>>,std::__map_value_compare<os_eligibility_domain_t,std::__value_type<os_eligibility_domain_t,std::vector<os_eligibility_answer_t>>,std::less<os_eligibility_domain_t>,true>,std::allocator<std::__value_type<os_eligibility_domain_t,std::vector<os_eligibility_answer_t>>>>::destroy( (uint64_t)&self->_predicate,  (void *)self->_predicate._storage.var0.__val_._match_map.__tree_.__pair1_.__value_.__left_);
  }
}

- (id).cxx_construct
{
  *((_BYTE *)self + 8) = 0;
  *((_BYTE *)self + 32) = 0;
  return self;
}

@end