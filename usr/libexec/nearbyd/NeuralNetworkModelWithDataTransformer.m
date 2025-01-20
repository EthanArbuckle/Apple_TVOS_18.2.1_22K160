@interface NeuralNetworkModelWithDataTransformer
- (NeuralNetworkModel)neuralNetworkModel;
- (NeuralNetworkModelWithDataTransformer)initWithNeuralNetworkModel:(NeuralNetworkModel *)a3 andDataTransformer:(id)a4;
- (RangeBiasEstimatorModelDataTransformer)rangeBiasEstimatorModelDataTransformer;
- (void)dealloc;
- (void)setNeuralNetworkModel:(NeuralNetworkModel *)a3;
- (void)setRangeBiasEstimatorModelDataTransformer:(id)a3;
@end

@implementation NeuralNetworkModelWithDataTransformer

- (NeuralNetworkModelWithDataTransformer)initWithNeuralNetworkModel:(NeuralNetworkModel *)a3 andDataTransformer:(id)a4
{
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___NeuralNetworkModelWithDataTransformer;
  v8 = -[NeuralNetworkModelWithDataTransformer init](&v14, "init");
  v9 = v8;
  if (v8)
  {
    __int128 v10 = *(_OWORD *)&a3->plan;
    v8->_neuralNetworkModel.modelNet = a3->modelNet;
    *(_OWORD *)&v8->_neuralNetworkModel.plan = v10;
    objc_storeStrong((id *)&v8->_rangeBiasEstimatorModelDataTransformer, a4);
  }

  v11 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "#bias-est, Neural network espresso model initialized with data transformer.",  v13,  2u);
  }

  return v9;
}

- (void)dealloc
{
  v3 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "#bias-est, Destroying espresso plan and context for Bias estimator.",  buf,  2u);
  }

  espresso_plan_destroy(self->_neuralNetworkModel.plan);
  espresso_context_destroy(self->_neuralNetworkModel.ctx);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NeuralNetworkModelWithDataTransformer;
  -[NeuralNetworkModelWithDataTransformer dealloc](&v4, "dealloc");
}

- (NeuralNetworkModel)neuralNetworkModel
{
  return result;
}

- (void)setNeuralNetworkModel:(NeuralNetworkModel *)a3
{
}

- (RangeBiasEstimatorModelDataTransformer)rangeBiasEstimatorModelDataTransformer
{
  return (RangeBiasEstimatorModelDataTransformer *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setRangeBiasEstimatorModelDataTransformer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end