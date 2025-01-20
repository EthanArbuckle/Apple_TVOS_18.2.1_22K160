@interface RangeBiasEstimatorSingleAntennaModel
- (BOOL)checkCirsValid:(id)a3;
- (BOOL)configureWithResourceFileHandler:(id)a3;
- (BOOL)predictBiasEstimate:(unsigned __int8)a3 scaledInputFeatures:(id)a4 output:(id *)a5;
- (NSNumber)biasCorrectionEstimate;
- (RangeBiasEstimatorSingleAntennaModel)init;
- (id).cxx_construct;
- (id)consumeInputFeatures:(id)a3;
- (id)createAndPopulateBiasEstimatorInput:(const void *)a3 ofDimension:(id)a4;
- (id)getResourcePathWithBundleName:()basic_string<char bundleDir:()std:(std::allocator<char>> *)data :char_traits<char> resourceName:resourceExtension:;
- (id)loadResourcesWithResourceIndex:(int)a3;
- (id)predictOutput:(id)a3;
- (id)preprocessInputFeatures:(id)a3;
- (id)scaleCirValuesIfRequired:(id)a3;
- (pair<std::vector<double>,)getNormalizedCirAndPeakMagnitude:(RangeBiasEstimatorSingleAntennaModel *)self;
- (vector<double,)getNormalizedFftCir:(RangeBiasEstimatorSingleAntennaModel *)self;
- (void)addBundleNameToModelResourcePackage:()basic_string<char andBundleDirectory:()std:(std::allocator<char>> *)a3 :char_traits<char>;
- (void)setBiasCorrectionEstimate:(id)a3;
@end

@implementation RangeBiasEstimatorSingleAntennaModel

- (RangeBiasEstimatorSingleAntennaModel)init
{
  v63.receiver = self;
  v63.super_class = (Class)&OBJC_CLASS___RangeBiasEstimatorSingleAntennaModel;
  v2 = -[RangeBiasEstimatorSingleAntennaModel init](&v63, "init");

  if (v2)
  {
    if (byte_1007FECF7 < 0)
    {
      sub_1000063A8(__dst, (void *)xmmword_1007FECE0, *((unint64_t *)&xmmword_1007FECE0 + 1));
    }

    else
    {
      *(_OWORD *)__dst = xmmword_1007FECE0;
      uint64_t v53 = unk_1007FECF0;
    }

    if (byte_1007FED0F < 0)
    {
      sub_1000063A8(&v54, (void *)xmmword_1007FECF8, *((unint64_t *)&xmmword_1007FECF8 + 1));
    }

    else
    {
      __int128 v54 = xmmword_1007FECF8;
      uint64_t v55 = unk_1007FED08;
    }

    int v56 = 0;
    LOBYTE(v57) = 0;
    char v59 = 0;
    LOBYTE(v60) = 0;
    char v62 = 0;
    if (byte_1007FED27 < 0)
    {
      sub_1000063A8(v41, (void *)xmmword_1007FED10, *((unint64_t *)&xmmword_1007FED10 + 1));
    }

    else
    {
      *(_OWORD *)v41 = xmmword_1007FED10;
      uint64_t v42 = unk_1007FED20;
    }

    if (byte_1007FED3F < 0)
    {
      sub_1000063A8(&v43, (void *)xmmword_1007FED28, *((unint64_t *)&xmmword_1007FED28 + 1));
    }

    else
    {
      __int128 v43 = xmmword_1007FED28;
      uint64_t v44 = unk_1007FED38;
    }

    int v45 = 0;
    LOBYTE(v46) = 0;
    char v48 = 0;
    LOBYTE(v49) = 0;
    char v51 = 0;
    if (byte_1007FED57 < 0)
    {
      sub_1000063A8(v30, (void *)xmmword_1007FED40, *((unint64_t *)&xmmword_1007FED40 + 1));
    }

    else
    {
      *(_OWORD *)v30 = xmmword_1007FED40;
      uint64_t v31 = unk_1007FED50;
    }

    if (byte_1007FED6F < 0)
    {
      sub_1000063A8(&v32, (void *)xmmword_1007FED58, *((unint64_t *)&xmmword_1007FED58 + 1));
    }

    else
    {
      __int128 v32 = xmmword_1007FED58;
      uint64_t v33 = unk_1007FED68;
    }

    int v34 = 1;
    LOBYTE(v35) = 0;
    char v37 = 0;
    LOBYTE(v38) = 0;
    char v40 = 0;
    if (byte_1007FED87 < 0)
    {
      sub_1000063A8(v19, (void *)xmmword_1007FED70, *((unint64_t *)&xmmword_1007FED70 + 1));
    }

    else
    {
      *(_OWORD *)v19 = xmmword_1007FED70;
      uint64_t v20 = unk_1007FED80;
    }

    if (byte_1007FED9F < 0)
    {
      sub_1000063A8(&v21, (void *)xmmword_1007FED88, *((unint64_t *)&xmmword_1007FED88 + 1));
    }

    else
    {
      __int128 v21 = xmmword_1007FED88;
      uint64_t v22 = unk_1007FED98;
    }

    int v23 = 1;
    LOBYTE(v24) = 0;
    char v26 = 0;
    LOBYTE(__p) = 0;
    char v29 = 0;
    sub_1002F92D4((char *)v68, (__int128 *)__dst);
    sub_1002F92D4(v69, (__int128 *)v41);
    __int128 v15 = 0uLL;
    v16 = 0LL;
    *(void *)&v66[0] = &v15;
    BYTE8(v66[0]) = 0;
    *(void *)&__int128 v15 = operator new(0xF0uLL);
    *((void *)&v15 + 1) = v15;
    v16 = (NIMLModelResource *)(v15 + 240);
    *((void *)&v15 + 1) = sub_1002F95C8((uint64_t)&v16, v68, &v70, (char *)v15);
    sub_1002F92D4((char *)v66, (__int128 *)v30);
    sub_1002F92D4(v67, (__int128 *)v19);
    __int128 v17 = 0uLL;
    v18 = 0LL;
    v64 = (void **)&v17;
    char v65 = 0;
    *(void *)&__int128 v17 = operator new(0xF0uLL);
    *((void *)&v17 + 1) = v17;
    v18 = (NIMLModelResource *)(v17 + 240);
    *((void *)&v17 + 1) = sub_1002F95C8((uint64_t)&v18, v66, v68, (char *)v17);
    sub_1002F93D0((void **)&v2->_modelResourcePackage.trainedModelResources.__begin_);
    *(_OWORD *)&v2->_modelResourcePackage.trainedModelResources.__begin_ = v15;
    v2->_modelResourcePackage.trainedModelResources.__end_cap_.__value_ = v16;
    __int128 v15 = 0uLL;
    v16 = 0LL;
    sub_1002F93D0((void **)&v2->_modelResourcePackage.dataTranformerResources.__begin_);
    *(_OWORD *)&v2->_modelResourcePackage.dataTranformerResources.__begin_ = v17;
    v2->_modelResourcePackage.dataTranformerResources.__end_cap_.__value_ = v18;
    __int128 v17 = 0uLL;
    v18 = 0LL;
    v64 = (void **)&v17;
    sub_1002F94B0(&v64);
    v64 = (void **)&v15;
    sub_1002F94B0(&v64);
    for (uint64_t i = 0LL; i != -240; i -= 120LL)
    {
      v4 = (void **)((char *)v66 + i);
      if (*((_BYTE *)v4 + 200) && v67[i + 79] < 0) {
        operator delete(v4[22]);
      }
      v5 = (void **)((char *)v66 + i);
      if (v67[i + 47] < 0) {
        operator delete(v5[18]);
      }
    }

    for (uint64_t j = 0LL; j != -240; j -= 120LL)
    {
      v7 = (void **)((char *)v68 + j);
      if (*((_BYTE *)v7 + 200) && v69[j + 79] < 0) {
        operator delete(v7[22]);
      }
      v8 = (void **)((char *)v68 + j);
      if (v69[j + 47] < 0) {
        operator delete(v8[18]);
      }
    }

    remoteTxAntennaMask = v2->_remoteTxAntennaMask;
    v2->_remoteTxAntennaMask = 0LL;

    biasCorrectionEstimate = v2->_biasCorrectionEstimate;
    v2->_biasCorrectionEstimate = 0LL;

    neuralNetworkRangeBiasEstimatorModelAntennaMask1 = v2->_neuralNetworkRangeBiasEstimatorModelAntennaMask1;
    v2->_neuralNetworkRangeBiasEstimatorModelAntennaMask1 = 0LL;

    neuralNetworkRangeBiasEstimatorModelAntennaMask2 = v2->_neuralNetworkRangeBiasEstimatorModelAntennaMask2;
    v2->_neuralNetworkRangeBiasEstimatorModelAntennaMask2 = 0LL;

    if (v29 && v28 < 0) {
      operator delete(__p);
    }
    if (v26 && v25 < 0) {
      operator delete(v24);
    }
    if (SHIBYTE(v22) < 0) {
      operator delete((void *)v21);
    }
    if (SHIBYTE(v20) < 0) {
      operator delete(v19[0]);
    }
    if (v40 && v39 < 0) {
      operator delete(v38);
    }
    if (v37 && v36 < 0) {
      operator delete(v35);
    }
    if (SHIBYTE(v33) < 0) {
      operator delete((void *)v32);
    }
    if (SHIBYTE(v31) < 0) {
      operator delete(v30[0]);
    }
    if (v51 && v50 < 0) {
      operator delete(v49);
    }
    if (v48 && v47 < 0) {
      operator delete(v46);
    }
    if (SHIBYTE(v44) < 0) {
      operator delete((void *)v43);
    }
    if (SHIBYTE(v42) < 0) {
      operator delete(v41[0]);
    }
    if (v62 && v61 < 0) {
      operator delete(v60);
    }
    if (v59 && v58 < 0) {
      operator delete(v57);
    }
    if (SHIBYTE(v55) < 0) {
      operator delete((void *)v54);
    }
    if (SHIBYTE(v53) < 0) {
      operator delete(__dst[0]);
    }
  }

  v13 = v2;

  return v13;
}

- (BOOL)configureWithResourceFileHandler:(id)a3
{
  id v4 = a3;
  v5 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "#bias-est, Configuring bias estimator with resource file handler",  buf,  2u);
  }

  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
      sub_1003AA70C();
    }
    goto LABEL_20;
  }

  id v6 = objc_claimAutoreleasedReturnValue([v4 bundleName]);
  sub_1000065CC(v22, (char *)[v6 UTF8String]);
  id v7 = objc_claimAutoreleasedReturnValue([v4 resourceBundleDir]);
  sub_1000065CC(__p, (char *)[v7 UTF8String]);
  -[RangeBiasEstimatorSingleAntennaModel addBundleNameToModelResourcePackage:andBundleDirectory:]( self,  "addBundleNameToModelResourcePackage:andBundleDirectory:",  v22,  __p);
  if (v21 < 0) {
    operator delete(__p[0]);
  }

  if (v23 < 0) {
    operator delete(v22[0]);
  }

  v8 = (NeuralNetworkModelWithDataTransformer *)objc_claimAutoreleasedReturnValue( -[RangeBiasEstimatorSingleAntennaModel loadResourcesWithResourceIndex:]( self,  "loadResourcesWithResourceIndex:",  0LL));
  neuralNetworkRangeBiasEstimatorModelAntennaMask1 = self->_neuralNetworkRangeBiasEstimatorModelAntennaMask1;
  self->_neuralNetworkRangeBiasEstimatorModelAntennaMask1 = v8;

  if (!self->_neuralNetworkRangeBiasEstimatorModelAntennaMask1)
  {
    uint64_t v17 = qword_1008000A0;
    BOOL v16 = 0;
    if (!os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_21;
    }
    *(_DWORD *)buf = 67109120;
    int v25 = 1;
    v18 = (os_log_s *)v17;
    goto LABEL_19;
  }

  uint64_t v10 = objc_claimAutoreleasedReturnValue( -[RangeBiasEstimatorSingleAntennaModel loadResourcesWithResourceIndex:]( self,  "loadResourcesWithResourceIndex:",  1LL));
  neuralNetworkRangeBiasEstimatorModelAntennaMask2 = self->_neuralNetworkRangeBiasEstimatorModelAntennaMask2;
  p_neuralNetworkRangeBiasEstimatorModelAntennaMask2 = &self->_neuralNetworkRangeBiasEstimatorModelAntennaMask2;
  *p_neuralNetworkRangeBiasEstimatorModelAntennaMask2 = (NeuralNetworkModelWithDataTransformer *)v10;

  v13 = *p_neuralNetworkRangeBiasEstimatorModelAntennaMask2;
  v14 = (os_log_s *)qword_1008000A0;
  BOOL v15 = os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT);
  if (!v13)
  {
    if (!v15)
    {
LABEL_20:
      BOOL v16 = 0;
      goto LABEL_21;
    }

    *(_DWORD *)buf = 67109120;
    int v25 = 2;
    v18 = v14;
LABEL_19:
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "#bias-est, Unable to initialize Model with resources for antenna %d, bypassing bias estimation.",  buf,  8u);
    goto LABEL_20;
  }

  if (v15)
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "#bias-est, Espresso Model initialized for both antennas",  buf,  2u);
  }

  BOOL v16 = 1;
LABEL_21:

  return v16;
}

- (id)consumeInputFeatures:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = atomic_load((unsigned __int8 *)&qword_1007FEDD8);
  if ((v5 & 1) == 0 && __cxa_guard_acquire(&qword_1007FEDD8))
  {
    dword_1007FEDD0 = *((_DWORD *)sub_100005150() + 186);
    __cxa_guard_release(&qword_1007FEDD8);
  }

  biasCorrectionEstimate = self->_biasCorrectionEstimate;
  self->_biasCorrectionEstimate = 0LL;

  if (v4)
  {
    id v7 = (NSNumber *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v4 antennaMask]));
    remoteTxAntennaMask = self->_remoteTxAntennaMask;
    self->_remoteTxAntennaMask = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 cirPacket1]);
    if ([v9 count] != (id)8) {
      __assert_rtn( "-[RangeBiasEstimatorSingleAntennaModel consumeInputFeatures:]",  "NRBYRangeBiasEstimator.mm",  226,  "[CIRValuesPacket1 count] == kDimCIRSamples");
    }
    unsigned __int8 v10 = -[RangeBiasEstimatorSingleAntennaModel checkCirsValid:](self, "checkCirsValid:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v4 cirPacket2]);
    if ([v11 count] != (id)8) {
      __assert_rtn( "-[RangeBiasEstimatorSingleAntennaModel consumeInputFeatures:]",  "NRBYRangeBiasEstimator.mm",  230,  "[CIRValuesPacket2 count] == kDimCIRSamples");
    }
    char v12 = v10 & -[RangeBiasEstimatorSingleAntennaModel checkCirsValid:](self, "checkCirsValid:", v11);
    v13 = (os_log_s *)qword_1008000A0;
    BOOL v14 = os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT);
    if ((v12 & 1) == 0)
    {
      if (v14)
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "#bias-est, Invalid CIRs, not calculating bias estimate.",  buf,  2u);
      }

      char v39 = 0LL;
      goto LABEL_43;
    }

    if (v14)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "#bias-est, Valid CIRs, continuing ... ",  buf,  2u);
    }

    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue( -[RangeBiasEstimatorSingleAntennaModel scaleCirValuesIfRequired:]( self,  "scaleCirValuesIfRequired:",  v9));
    uint64_t v16 = objc_claimAutoreleasedReturnValue(-[RangeBiasEstimatorSingleAntennaModel scaleCirValuesIfRequired:](self, "scaleCirValuesIfRequired:", v11));
    uint64_t v17 = (void *)v16;
    if (v15 && v16)
    {
      -[RangeBiasEstimatorSingleAntennaModel getNormalizedCirAndPeakMagnitude:]( self,  "getNormalizedCirAndPeakMagnitude:",  v15);
      -[RangeBiasEstimatorSingleAntennaModel getNormalizedCirAndPeakMagnitude:]( self,  "getNormalizedCirAndPeakMagnitude:",  v17);
      -[RangeBiasEstimatorSingleAntennaModel getNormalizedFftCir:](self, "getNormalizedFftCir:", v15);
      -[RangeBiasEstimatorSingleAntennaModel getNormalizedFftCir:](self, "getNormalizedFftCir:", v17);
      if (v72 - (_BYTE *)v71 == 56)
      {
        if (v70 - (_BYTE *)__p == 56)
        {
          [v4 rttInitiator];
          double v19 = v18;
          [v4 tatInitiator];
          double v21 = v20;
          [v4 rttResponder];
          double v23 = v22;
          [v4 tatResponder];
          double v25 = v24;
          double v26 = v23 + v24;
          if (v23 + v24 == 0.0) {
            __assert_rtn( "-[RangeBiasEstimatorSingleAntennaModel consumeInputFeatures:]",  "NRBYRangeBiasEstimator.mm",  266,  "(tat_r + rtt_r) != 0");
          }
          [v4 leadingEdgePacket1];
          double v28 = v27;
          [v4 firstPathIndexPacket1];
          double v30 = v29;
          [v4 leadingEdgePacket2];
          double v32 = v31;
          [v4 firstPathIndexPacket2];
          double v34 = v32 - v33;
          if (dword_1007FEDD0 == 1) {
            double v35 = v34 + -1.0;
          }
          else {
            double v35 = v34;
          }
          if (dword_1007FEDD0 == 1) {
            double v36 = v28 - v30 + -1.0;
          }
          else {
            double v36 = v28 - v30;
          }
          [v4 toaNoiseRms];
          if (v37 == 0.0 || v78 == 0.0 || v75 == 0.0)
          {
            v38 = (os_log_s *)qword_1008000A0;
            if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "#bias-est, Cannot calculate snr, returning nil",  buf,  2u);
            }

            char v39 = 0LL;
          }

          else
          {
            objc_msgSend(v4, "toaNoiseRms", v75);
            double v65 = v42;
            double v64 = log10(v78);
            double v63 = log10(v65);
            [v4 toaNoiseRms];
            double v44 = v43;
            double v66 = log10(v75);
            double v62 = log10(v44);
            [v4 soiRssiDbm];
            uint64_t v46 = v45;
            [v4 rssiDbm];
            uint64_t v61 = v47;
            uint64_t v60 = v46;
            [v4 tofPicSecond];
            uint64_t v59 = v48;
            if (dword_1007FEDD0 == 1) {
              double v49 = 0.100000001;
            }
            else {
              double v49 = 1.0;
            }
            [v4 toaNoiseRms];
            double v58 = v50;
            [v4 toaPpwinRms];
            double v57 = v51;
            [v4 toaPpwinPeak];
            *(void *)buf = v61;
            uint64_t v80 = v60;
            uint64_t v81 = v59;
            double v82 = v58 * v49;
            double v83 = v49 * v57;
            double v84 = v49 * v52;
            double v85 = v63 * -20.0 + v64 * 20.0;
            double v86 = v62 * -20.0 + v66 * 20.0;
            double v87 = v36;
            double v88 = v35;
            double v89 = v19 - v25;
            double v90 = v23 - v21;
            double v91 = (v19 + v21 - v26) / v26 * 1000000.0;
            uint64_t v92 = *(void *)v71;
            uint64_t v93 = *((void *)v71 + 1);
            uint64_t v94 = *((void *)v71 + 2);
            uint64_t v95 = *((void *)v71 + 3);
            uint64_t v96 = *((void *)v71 + 4);
            uint64_t v97 = *((void *)v71 + 5);
            uint64_t v98 = *((void *)v71 + 6);
            uint64_t v99 = *(void *)__p;
            uint64_t v100 = *((void *)__p + 1);
            uint64_t v101 = *((void *)__p + 2);
            uint64_t v102 = *((void *)__p + 3);
            uint64_t v103 = *((void *)__p + 4);
            uint64_t v104 = *((void *)__p + 5);
            uint64_t v105 = *((void *)__p + 6);
            uint64_t v106 = *(void *)v76;
            uint64_t v107 = *((void *)v76 + 1);
            uint64_t v108 = *((void *)v76 + 2);
            uint64_t v109 = *((void *)v76 + 3);
            uint64_t v110 = *((void *)v76 + 4);
            uint64_t v111 = *((void *)v76 + 5);
            uint64_t v112 = *((void *)v76 + 6);
            uint64_t v113 = *((void *)v76 + 7);
            uint64_t v114 = *(void *)v73;
            uint64_t v115 = *((void *)v73 + 1);
            uint64_t v116 = *((void *)v73 + 2);
            uint64_t v117 = *((void *)v73 + 3);
            uint64_t v118 = *((void *)v73 + 4);
            uint64_t v119 = *((void *)v73 + 5);
            uint64_t v120 = *((void *)v73 + 6);
            uint64_t v121 = *((void *)v73 + 7);
            sub_1002F5F0C(&v67, buf, 0x2BuLL);
            if (v68 - (_BYTE *)v67 != 344) {
              __assert_rtn( "-[RangeBiasEstimatorSingleAntennaModel consumeInputFeatures:]",  "NRBYRangeBiasEstimator.mm",  347,  "rangeBiasEstimatorModelInputParams.size() == kDimInputFeaturesSingleAntennaRangeBiasModel");
            }
            uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 43LL));
            char v39 = (void *)objc_claimAutoreleasedReturnValue( -[RangeBiasEstimatorSingleAntennaModel createAndPopulateBiasEstimatorInput:ofDimension:]( self,  "createAndPopulateBiasEstimatorInput:ofDimension:",  &v67,  v53));

            if (v39)
            {
              id v54 = v39;
            }

            else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
            {
              sub_1003AA764();
            }

            if (v67)
            {
              v68 = v67;
              operator delete(v67);
            }
          }

          if (__p)
          {
            __int128 v70 = __p;
            operator delete(__p);
          }

          if (v71)
          {
            v72 = v71;
            operator delete(v71);
          }

          if (v73)
          {
            v74 = v73;
            operator delete(v73);
          }

          if (v76)
          {
            v77 = v76;
            operator delete(v76);
          }

- (id)preprocessInputFeatures:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = v4;
  if (v4)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 featureValueForName:@"input"]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 multiArrayValue]);

    if ([v7 count] == (id)43)
    {
      if ((uint64_t)[v7 count] > 12)
      {
        uint64_t v8 = 0LL;
        __p = 0LL;
        double v42 = 0LL;
        double v43 = 0LL;
        do
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:v8]);
          [v9 doubleValue];
          uint64_t v11 = v10;
          char v12 = v42;
          if (v42 >= v43)
          {
            BOOL v14 = (char *)__p;
            uint64_t v15 = (v42 - (_BYTE *)__p) >> 3;
            unint64_t v16 = v15 + 1;
            uint64_t v17 = v43 - (_BYTE *)__p;
            if ((v43 - (_BYTE *)__p) >> 2 > v16) {
              unint64_t v16 = v17 >> 2;
            }
            else {
              unint64_t v18 = v16;
            }
            if (v18)
            {
              double v19 = (char *)sub_1000472C0((uint64_t)&v43, v18);
              BOOL v14 = (char *)__p;
              char v12 = v42;
            }

            else
            {
              double v19 = 0LL;
            }

            double v20 = &v19[8 * v15];
            *(void *)double v20 = v11;
            v13 = v20 + 8;
            while (v12 != v14)
            {
              uint64_t v21 = *((void *)v12 - 1);
              v12 -= 8;
              *((void *)v20 - 1) = v21;
              v20 -= 8;
            }

            __p = v20;
            double v42 = v13;
            double v43 = &v19[8 * v18];
            if (v14) {
              operator delete(v14);
            }
          }

          else
          {
            *(void *)double v42 = v10;
            v13 = v12 + 8;
          }

          double v42 = v13;

          ++v8;
        }

        while (v8 != 13);
        double v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 13LL));
        double v23 = (void *)objc_claimAutoreleasedReturnValue( -[RangeBiasEstimatorSingleAntennaModel createAndPopulateBiasEstimatorInput:ofDimension:]( self,  "createAndPopulateBiasEstimatorInput:ofDimension:",  &__p,  v22));

        if (v23)
        {
          if (-[NSNumber intValue](self->_remoteTxAntennaMask, "intValue") != 1
            && -[NSNumber intValue](self->_remoteTxAntennaMask, "intValue") != 2)
          {
            __assert_rtn( "-[RangeBiasEstimatorSingleAntennaModel preprocessInputFeatures:]",  "NRBYRangeBiasEstimator.mm",  380,  "[_remoteTxAntennaMask intValue] == kAntennaMask1 || [_remoteTxAntennaMask intValue] == kAntennaMask2");
          }

          double v24 = (os_log_s *)(id)qword_1008000A0;
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v25 = -[NSNumber intValue](self->_remoteTxAntennaMask, "intValue");
            *(_DWORD *)buf = 67109120;
            LODWORD(v45) = v25;
            _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "#bias-est, Using Antenna %d NN bias model",  buf,  8u);
          }

          unsigned int v26 = -[NSNumber intValue](self->_remoteTxAntennaMask, "intValue");
          if (v26 == 2)
          {
            double v27 = (void *)objc_claimAutoreleasedReturnValue( -[NeuralNetworkModelWithDataTransformer rangeBiasEstimatorModelDataTransformer]( self->_neuralNetworkRangeBiasEstimatorModelAntennaMask2,  "rangeBiasEstimatorModelDataTransformer"));
            uint64_t v28 = objc_claimAutoreleasedReturnValue([v27 applyTransformation:v23]);
          }

          else
          {
            if (v26 != 1)
            {
              if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
                sub_1003AA7BC();
              }
              char v40 = (os_log_s *)qword_1008000A0;
              if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315650;
                uint64_t v45 = "/Library/Caches/com.apple.xbs/Sources/Proximity/Libraries/NearbyAlgorithms/RangeBiasEstimation/NRB"
                      "YRangeBiasEstimator.mm";
                __int16 v46 = 1024;
                int v47 = 392;
                __int16 v48 = 2080;
                double v49 = "-[RangeBiasEstimatorSingleAntennaModel preprocessInputFeatures:]";
                _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_INFO,  "#bias-est, %s:%d: assertion failure in %s",  buf,  0x1Cu);
              }

              abort();
            }

            double v27 = (void *)objc_claimAutoreleasedReturnValue( -[NeuralNetworkModelWithDataTransformer rangeBiasEstimatorModelDataTransformer]( self->_neuralNetworkRangeBiasEstimatorModelAntennaMask1,  "rangeBiasEstimatorModelDataTransformer"));
            uint64_t v28 = objc_claimAutoreleasedReturnValue([v27 applyTransformation:v23]);
          }

          double v30 = (void *)v28;

          if (v30)
          {
            double v31 = (void *)objc_claimAutoreleasedReturnValue([v30 featureValueForName:@"input"]);
            double v32 = (void *)objc_claimAutoreleasedReturnValue([v31 multiArrayValue]);

            for (uint64_t i = 0LL; i != 13; ++i)
            {
              double v34 = (void *)objc_claimAutoreleasedReturnValue([v32 objectAtIndexedSubscript:i]);
              [v7 setObject:v34 atIndexedSubscript:i];
            }

            double v35 = -[RangeBiasEstimatorInput initWithData:]( objc_alloc(&OBJC_CLASS___RangeBiasEstimatorInput),  "initWithData:",  v7);
            double v29 = v35;
            if (v35)
            {
              double v36 = v35;
            }

            else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
            {
              sub_1003AA764();
            }
          }

          else
          {
            if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
              sub_1003AA7E8();
            }
            double v29 = 0LL;
          }
        }

        else
        {
          if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
            sub_1003AA764();
          }
          double v29 = 0LL;
        }

        if (__p)
        {
          double v42 = (char *)__p;
          operator delete(__p);
        }

        goto LABEL_52;
      }

      v38 = "kStartIdxOfFeaturesThatRequireScaling+kLengthOfFeaturesThatRequireScaling <= [inputFeatureMultiArray count]";
      int v39 = 366;
    }

    else
    {
      v38 = "[inputFeatureMultiArray count] == kDimInputFeaturesSingleAntennaRangeBiasModel";
      int v39 = 365;
    }

    __assert_rtn( "-[RangeBiasEstimatorSingleAntennaModel preprocessInputFeatures:]",  "NRBYRangeBiasEstimator.mm",  v39,  v38);
  }

  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
    sub_1003AA790();
  }
  double v29 = 0LL;
LABEL_52:

  return v29;
}

- (id)predictOutput:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_1003AA814();
    }
    goto LABEL_13;
  }

  if (!-[RangeBiasEstimatorSingleAntennaModel predictBiasEstimate:scaledInputFeatures:output:]( self,  "predictBiasEstimate:scaledInputFeatures:output:",  -[NSNumber intValue](self->_remoteTxAntennaMask, "intValue"),  v4,  v20))
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_1003AA8B4();
    }
LABEL_13:
    id v13 = 0LL;
    goto LABEL_21;
  }

  if (v20[10] != 11LL) {
    __assert_rtn( "-[RangeBiasEstimatorSingleAntennaModel predictOutput:]",  "NRBYRangeBiasEstimator.mm",  449,  "output.width == kDimOutputSingleAntennaRangeBiasModel");
  }
  unsigned __int8 v5 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 11LL);
  uint64_t v6 = 0LL;
  double v7 = 0.0;
  *(void *)&__int128 v8 = 67109376LL;
  __int128 v19 = v8;
  double v9 = 0.0;
  do
  {
    double v10 = *(float *)(v20[0] + 4 * v6);
    uint64_t v11 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = v19;
      *(_DWORD *)double v22 = v6;
      *(_WORD *)&v22[4] = 2048;
      *(double *)&v22[6] = v10;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "#bias-est, Output Probability index = %d, value = %f",  buf,  0x12u);
    }

    char v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v10, v19));
    -[NSMutableArray setObject:atIndexedSubscript:](v5, "setObject:atIndexedSubscript:", v12, v6);

    double v7 = v7 + v10;
    double v9 = v9 + dbl_10042FD98[v6++] * v10;
  }

  while (v6 != 11);
  BOOL v14 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(double *)double v22 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "#bias-est, biasCorrectionEstimate = %f",  buf,  0xCu);
  }

  uint64_t v15 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v9));
  biasCorrectionEstimate = self->_biasCorrectionEstimate;
  self->_biasCorrectionEstimate = v15;

  if (v7 >= 1.00001 || v7 <= 0.99999) {
    __assert_rtn( "-[RangeBiasEstimatorSingleAntennaModel predictOutput:]",  "NRBYRangeBiasEstimator.mm",  467,  "(totalProbability < 1.0 + epsilon) && (totalProbability > 1.0 - epsilon)");
  }
  uint64_t v17 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
    sub_1003AA840(v17, v7);
  }
  id v13 = -[NSMutableArray copy](v5, "copy");

LABEL_21:
  return v13;
}

- (void)addBundleNameToModelResourcePackage:()basic_string<char andBundleDirectory:()std:(std::allocator<char>> *)a3 :char_traits<char>
{
  id v4 = v3;
  begin = self->_modelResourcePackage.trainedModelResources.__begin_;
  if (self->_modelResourcePackage.trainedModelResources.__end_ != begin)
  {
    unint64_t v8 = 0LL;
    uint64_t v9 = 56LL;
    do
    {
      sub_10020148C((std::string *)((char *)begin + v9 + 32), (const std::string *)a3);
      sub_10020148C((std::string *)((char *)self->_modelResourcePackage.trainedModelResources.__begin_ + v9), v4);
      ++v8;
      begin = self->_modelResourcePackage.trainedModelResources.__begin_;
      v9 += 120LL;
    }

    while (0xEEEEEEEEEEEEEEEFLL * ((self->_modelResourcePackage.trainedModelResources.__end_ - begin) >> 3) > v8);
  }

  double v10 = self->_modelResourcePackage.dataTranformerResources.__begin_;
  if (self->_modelResourcePackage.dataTranformerResources.__end_ != v10)
  {
    unint64_t v11 = 0LL;
    uint64_t v12 = 56LL;
    do
    {
      sub_10020148C((std::string *)((char *)v10 + v12 + 32), (const std::string *)a3);
      sub_10020148C((std::string *)((char *)self->_modelResourcePackage.dataTranformerResources.__begin_ + v12), v4);
      ++v11;
      double v10 = self->_modelResourcePackage.dataTranformerResources.__begin_;
      v12 += 120LL;
    }

    while (0xEEEEEEEEEEEEEEEFLL * ((self->_modelResourcePackage.dataTranformerResources.__end_ - v10) >> 3) > v11);
  }

- (id)getResourcePathWithBundleName:()basic_string<char bundleDir:()std:(std::allocator<char>> *)data :char_traits<char> resourceName:resourceExtension:
{
  uint64_t v6 = v5;
  double v7 = v4;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v3));
  double v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", data));
  unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 stringByAppendingPathComponent:v10]);

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](&OBJC_CLASS___NSBundle, "bundleWithPath:", v11));
  id v13 = v11;
  double v20 = (char *)[v13 UTF8String];
  sub_100254554(&v22.__pn_, &v20);
  std::__fs::filesystem::__status(&v22, 0LL);
  unsigned __int8 v14 = v21;
  if (v14 != 255 && v14)
  {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v7));
    unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v6));
    id v15 = (id)objc_claimAutoreleasedReturnValue([v12 pathForResource:v17 ofType:v18]);

    if (v15)
    {
      id v15 = v15;
      unint64_t v16 = v15;
    }

    else
    {
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
        sub_1003AA8E0();
      }
      unint64_t v16 = 0LL;
    }
  }

  else
  {
    id v15 = (id)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR)) {
      sub_1003AA90C((uint64_t)[v13 UTF8String], (uint8_t *)&v22, (os_log_t)v15);
    }
    unint64_t v16 = 0LL;
  }

  return v16;
}

- (id)loadResourcesWithResourceIndex:(int)a3
{
  uint64_t v68 = 0LL;
  uint64_t v69 = 0LL;
  uint64_t v70 = 0LL;
  sub_1002F96EC( (char *)&v68,  (__int128 *)self->_modelResourcePackage.trainedModelResources.__begin_,  (__int128 *)self->_modelResourcePackage.trainedModelResources.__end_,  0xEEEEEEEEEEEEEEEFLL * ((self->_modelResourcePackage.trainedModelResources.__end_ - self->_modelResourcePackage.trainedModelResources.__begin_) >> 3));
  double v65 = 0LL;
  uint64_t v66 = 0LL;
  uint64_t v67 = 0LL;
  sub_1002F96EC( (char *)&v65,  (__int128 *)self->_modelResourcePackage.dataTranformerResources.__begin_,  (__int128 *)self->_modelResourcePackage.dataTranformerResources.__end_,  0xEEEEEEEEEEEEEEEFLL * ((self->_modelResourcePackage.dataTranformerResources.__end_ - self->_modelResourcePackage.dataTranformerResources.__begin_) >> 3));
  unint64_t v5 = 0xEEEEEEEEEEEEEEEFLL * ((v69 - v68) >> 3);
  if (v5 != 0xEEEEEEEEEEEEEEEFLL * ((v66 - (uint64_t)v65) >> 3))
  {
    char v40 = "trainedModelResourceArray.size() == dataTransformerResourceArray.size()";
    int v41 = 514;
    goto LABEL_89;
  }

  if (v5 <= a3)
  {
    char v40 = "trainedModelResourceArray.size() > index";
    int v41 = 515;
LABEL_89:
    __assert_rtn( "-[RangeBiasEstimatorSingleAntennaModel loadResourcesWithResourceIndex:]",  "NRBYRangeBiasEstimator.mm",  v41,  v40);
  }

  uint64_t v6 = 0LL;
  int v7 = a3;
  int v44 = a3 + 1;
  char v8 = 1;
  do
  {
    char v9 = v8;
    memset(&v63, 0, sizeof(v63));
    memset(&v62, 0, sizeof(v62));
    memset(&v61, 0, sizeof(v61));
    memset(&v60, 0, sizeof(v60));
    if ((v8 & 1) != 0)
    {
      uint64_t v10 = v68 + 120LL * v7;
      if (*(_BYTE *)(v10 + 80) && *(_BYTE *)(v68 + 120LL * v7 + 112))
      {
        std::string::operator=(&v61, (const std::string *)(v10 + 56));
        uint64_t v11 = v68 + 120LL * v7;
        if (!*(_BYTE *)(v11 + 112)) {
          goto LABEL_91;
        }
        std::string::operator=(&v60, (const std::string *)(v11 + 88));
        std::string::operator=(&v63, (const std::string *)(v68 + 120LL * v7));
        uint64_t v12 = v68 + 120LL * v7;
        int v13 = *(_DWORD *)(v12 + 48);
        std::string::operator=(&v62, (const std::string *)(v12 + 24));
        goto LABEL_13;
      }

      int v38 = 533;
      int v39 = "trainedModelResourceArray[index].bundleDirectory.has_value() && trainedModelResourceArray[index].bundleName.has_value()";
LABEL_86:
      __assert_rtn( "-[RangeBiasEstimatorSingleAntennaModel loadResourcesWithResourceIndex:]",  "NRBYRangeBiasEstimator.mm",  v38,  v39);
    }

    unsigned __int8 v14 = &v65[15 * v7];
    if (!*((_BYTE *)v14 + 80) || !LOBYTE(v65[15 * v7 + 14]))
    {
      int v38 = 541;
      int v39 = "dataTransformerResourceArray[index].bundleDirectory.has_value() && dataTransformerResourceArray[index].bundl"
            "eName.has_value()";
      goto LABEL_86;
    }

    std::string::operator=(&v61, (const std::string *)(v14 + 7));
    id v15 = &v65[15 * v7];
    if (!*((_BYTE *)v15 + 112)) {
LABEL_91:
    }
      sub_100006080();
    std::string::operator=(&v60, (const std::string *)(v15 + 11));
    std::string::operator=(&v63, (const std::string *)&v65[15 * v7]);
    unint64_t v16 = &v65[15 * v7];
    int v13 = *((_DWORD *)v16 + 12);
    std::string::operator=(&v62, (const std::string *)v16 + 1);
LABEL_13:
    else {
      std::string __dst = v60;
    }
    else {
      std::string v58 = v61;
    }
    else {
      std::string v57 = v63;
    }
    else {
      std::string __p = v62;
    }
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( -[RangeBiasEstimatorSingleAntennaModel getResourcePathWithBundleName:bundleDir:resourceName:resourceExtension:]( self,  "getResourcePathWithBundleName:bundleDir:resourceName:resourceExtension:",  &__dst,  &v58,  &v57,  &__p));
    id v18 = v17;
    sub_1000065CC(v54, (char *)[v18 UTF8String]);
    __int128 v19 = (const std::__fs::filesystem::path *)sub_10015B520(&buf, (char *)v54);
    std::__fs::filesystem::__status(v19, 0LL);
    uint8_t v20 = v72[0];
    if (v20 == 255 || !v20)
    {
      uint64_t v21 = (os_log_s *)qword_1008000A0;
      if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT))
      {
        double v33 = v54;
        if (v55 < 0) {
          double v33 = (void **)v54[0];
        }
        LODWORD(buf.__r_.__value_.__l.__data_) = 136315138;
        *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v33;
        _os_log_fault_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_FAULT,  "#bias-est, Unable to locate resource file %s, bypassing bias estimation.",  (uint8_t *)&buf,  0xCu);
      }

- (BOOL)checkCirsValid:(id)a3
{
  id v3 = a3;
  uint64_t v4 = 0LL;
  int v5 = 0;
  do
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndex:v4]);
    int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 real]);
    [v7 doubleValue];
    if (v8 == 0.0)
    {
      char v9 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndex:v4]);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 imag]);
      [v10 doubleValue];
      double v12 = v11;

      if (v12 == 0.0) {
        ++v5;
      }
    }

    else
    {
    }

    ++v4;
  }

  while (v4 != 8);
  if (v5 == 8)
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_1003AA9D4();
    }
LABEL_17:
    BOOL v23 = 0;
    goto LABEL_18;
  }

  uint64_t v13 = 0LL;
  double v14 = 0.0;
  double v15 = 0.0;
  do
  {
    unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndex:v13]);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 real]);
    [v17 doubleValue];
    double v19 = v18;

    uint8_t v20 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndex:v13]);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 imag]);
    [v21 doubleValue];
    double v15 = v15 + v19;
    double v14 = v14 + v22;

    ++v13;
  }

  while (v13 != 8);
  BOOL v23 = 1;
  if (v15 == 0.0 && v14 == 0.0)
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_1003AAA00();
    }
    goto LABEL_17;
  }

- (id)createAndPopulateBiasEstimatorInput:(const void *)a3 ofDimension:(id)a4
{
  int v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", a4));
  id v22 = 0LL;
  uint64_t v6 = -[MLMultiArray initWithShape:dataType:error:]( objc_alloc(&OBJC_CLASS___MLMultiArray),  "initWithShape:dataType:error:",  v5,  65600LL,  &v22);
  id v7 = v22;
  double v8 = (os_log_s *)qword_1008000A0;
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_FAULT)) {
      sub_1003AAA2C((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);
    }
    double v15 = 0LL;
  }

  else
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "#bias-est, Created biasEstimatorInputMLArray, populating values.",  v21,  2u);
    }

    if (*((void *)a3 + 1) != *(void *)a3)
    {
      unint64_t v16 = 0LL;
      do
      {
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v16));
        double v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  *(double *)(*(void *)a3 + 8 * v16)));
        BOOL v23 = v17;
        double v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v23, 1LL));
        -[MLMultiArray setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v18, v19);

        ++v16;
      }

      while (v16 < (uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 3);
    }

    double v15 = -[RangeBiasEstimatorInput initWithData:]( objc_alloc(&OBJC_CLASS___RangeBiasEstimatorInput),  "initWithData:",  v6);
  }

  return v15;
}

- (BOOL)predictBiasEstimate:(unsigned __int8)a3 scaledInputFeatures:(id)a4 output:(id *)a5
{
  int v5 = a3;
  id v7 = a4;
  std::string __p = 0LL;
  uint64_t v46 = 0LL;
  uint64_t v47 = 0LL;
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 featureValueForName:@"input"]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 multiArrayValue]);

  for (uint64_t i = 0LL; i != 43; ++i)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndexedSubscript:i]);
    [v11 doubleValue];
    float v13 = v12;
    uint64_t v14 = v46;
    if (v46 >= v47)
    {
      unint64_t v16 = (float *)__p;
      uint64_t v17 = ((char *)v46 - (_BYTE *)__p) >> 2;
      unint64_t v18 = v17 + 1;
      uint64_t v19 = (char *)v47 - (_BYTE *)__p;
      else {
        unint64_t v20 = v18;
      }
      if (v20)
      {
        uint64_t v21 = (char *)sub_100031724((uint64_t)&v47, v20);
        unint64_t v16 = (float *)__p;
        uint64_t v14 = v46;
      }

      else
      {
        uint64_t v21 = 0LL;
      }

      id v22 = (float *)&v21[4 * v17];
      *id v22 = v13;
      double v15 = v22 + 1;
      while (v14 != v16)
      {
        int v23 = *((_DWORD *)v14-- - 1);
        *((_DWORD *)v22-- - 1) = v23;
      }

      std::string __p = v22;
      uint64_t v46 = v15;
      uint64_t v47 = (float *)&v21[4 * v20];
      if (v16) {
        operator delete(v16);
      }
    }

    else
    {
      float *v46 = v13;
      double v15 = v14 + 1;
    }

    uint64_t v46 = v15;
  }

  uint64_t v44 = 0LL;
  memset(v43, 0, sizeof(v43));
  uint64_t v49 = 43LL;
  if (espresso_buffer_pack_tensor_shape(v43, 1LL, &v49))
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_1003AAB14();
    }
    goto LABEL_22;
  }

  *(void *)&v43[0] = __p;
  LODWORD(v44) = 65568;
  if (v5 == 2)
  {
    neuralNetworkRangeBiasEstimatorModelAntennaMask2 = self->_neuralNetworkRangeBiasEstimatorModelAntennaMask2;
    if (neuralNetworkRangeBiasEstimatorModelAntennaMask2)
    {
      -[NeuralNetworkModelWithDataTransformer neuralNetworkModel]( neuralNetworkRangeBiasEstimatorModelAntennaMask2,  "neuralNetworkModel");
      neuralNetworkRangeBiasEstimatorModelAntennaMask2 = *(NeuralNetworkModelWithDataTransformer **)buf;
      uint64_t v29 = *(void *)&buf[8];
    }

    else
    {
      uint64_t v29 = 0LL;
      memset(buf, 0, sizeof(buf));
    }

    if (byte_1007FEDB7 >= 0) {
      double v30 = &qword_1007FEDA0;
    }
    else {
      double v30 = (uint64_t *)qword_1007FEDA0;
    }
    if (espresso_network_bind_buffer( neuralNetworkRangeBiasEstimatorModelAntennaMask2,  v29,  v30,  v43,  0x10000LL,  0x20000LL,  0x10000LL))
    {
      if (!os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
      {
LABEL_22:
        BOOL v24 = 0;
        goto LABEL_23;
      }

- (pair<std::vector<double>,)getNormalizedCirAndPeakMagnitude:(RangeBiasEstimatorSingleAntennaModel *)self
{
  id v5 = a4;
  uint64_t v6 = 0LL;
  std::string __p = 0LL;
  char v52 = 0LL;
  uint64_t v53 = 0LL;
  do
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:v6]);
    double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 real]);
    [v8 doubleValue];
    double v10 = v9;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:v6]);
    double v12 = (void *)objc_claimAutoreleasedReturnValue([v11 imag]);
    [v12 doubleValue];
    double v14 = v13;

    double v15 = hypot(v10, v14);
    double v16 = v15;
    uint64_t v17 = v52;
    if (v52 >= v53)
    {
      uint64_t v19 = (double *)__p;
      uint64_t v20 = ((char *)v52 - (_BYTE *)__p) >> 3;
      unint64_t v21 = v20 + 1;
      uint64_t v22 = (char *)v53 - (_BYTE *)__p;
      else {
        unint64_t v23 = v21;
      }
      if (v23)
      {
        BOOL v24 = (char *)sub_1000472C0((uint64_t)&v53, v23);
        uint64_t v19 = (double *)__p;
        uint64_t v17 = v52;
      }

      else
      {
        BOOL v24 = 0LL;
      }

      uint64_t v25 = (double *)&v24[8 * v20];
      *uint64_t v25 = v16;
      unint64_t v18 = v25 + 1;
      while (v17 != v19)
      {
        uint64_t v26 = *((void *)v17-- - 1);
        *((void *)v25-- - 1) = v26;
      }

      std::string __p = v25;
      char v52 = v18;
      uint64_t v53 = (double *)&v24[8 * v23];
      if (v19) {
        operator delete(v19);
      }
    }

    else
    {
      *char v52 = v15;
      unint64_t v18 = v17 + 1;
    }

    char v52 = v18;
    ++v6;
  }

  while (v6 != 8);
  uint64_t v27 = (double *)__p;
  uint64_t v28 = (double *)((char *)__p + 8);
  if (__p != v18 && v28 != v18)
  {
    double v30 = *(double *)__p;
    double v31 = (double *)((char *)__p + 8);
    do
    {
      double v32 = *v31++;
      double v33 = v32;
      if (v30 < v32)
      {
        double v30 = v33;
        uint64_t v27 = v28;
      }

      uint64_t v28 = v31;
    }

    while (v31 != v18);
  }

  double v34 = *v27;
  char v48 = 0LL;
  uint64_t v49 = 0LL;
  char v50 = 0LL;
  if (v34 == 0.0) {
    __assert_rtn( "-[RangeBiasEstimatorSingleAntennaModel getNormalizedCirAndPeakMagnitude:]",  "NRBYRangeBiasEstimator.mm",  749,  "maxMagnitude != 0");
  }
  uint64_t v35 = 0LL;
  for (uint64_t i = 0LL; i != 8; ++i)
  {
    double v37 = log10(fmax(*((double *)__p + i), 1.0e-12) / v34) * 20.0;
    if (v35 >= v50)
    {
      int v38 = v48;
      uint64_t v39 = v35 - v48;
      unint64_t v40 = v39 + 1;
      uint64_t v41 = (char *)v50 - (char *)v48;
      else {
        unint64_t v42 = v40;
      }
      if (v42)
      {
        uint64_t v43 = (char *)sub_1000472C0((uint64_t)&v50, v42);
        int v38 = v48;
        uint64_t v35 = v49;
      }

      else
      {
        uint64_t v43 = 0LL;
      }

      uint64_t v44 = (double *)&v43[8 * v39];
      *uint64_t v44 = v37;
      __int128 v45 = v44 + 1;
      while (v35 != v38)
      {
        uint64_t v46 = *((void *)v35-- - 1);
        *((void *)v44-- - 1) = v46;
      }

      char v48 = v44;
      char v50 = (double *)&v43[8 * v42];
      if (v38) {
        operator delete(v38);
      }
      uint64_t v35 = v45;
    }

    else
    {
      *v35++ = v37;
    }

    uint64_t v49 = v35;
  }

  retstr->var0.var0 = 0LL;
  retstr->var0.var1 = 0LL;
  retstr->var0.var2.var0 = 0LL;
  sub_10011B560(retstr, v48, (uint64_t)v35, v35 - v48);
  retstr->var1 = v34;
  if (v48) {
    operator delete(v48);
  }
  if (__p)
  {
    char v52 = (double *)__p;
    operator delete(__p);
  }

  return result;
}

- (vector<double,)getNormalizedFftCir:(RangeBiasEstimatorSingleAntennaModel *)self
{
  id v5 = a4;
  uint64_t v6 = 0LL;
  *(void *)&__int128 v7 = 0x1000000010LL;
  do
  {
    int32x2_t v8 = vadd_s32((int32x2_t)qword_10042FDF0[v6], (int32x2_t)0x1000000010LL);
    v87[++v6] = vsub_s32( v8,  (int32x2_t)(*(void *)&vsra_n_u32((uint32x2_t)v8, (uint32x2_t)vcltz_s32(v8), 0x1CuLL) & 0xFFFFFFF0FFFFFFF0LL));
  }

  while (v6 != 4);
  double v9 = 0LL;
  int v10 = 0;
  std::string __p = 0LL;
  double v86 = 0LL;
  v87[0] = 0LL;
  do
  {
    if ((unint64_t)v9 >= v87[0])
    {
      uint64_t v11 = (char *)__p;
      uint64_t v12 = (v9 - (_BYTE *)__p) >> 4;
      unint64_t v13 = v12 + 1;
      uint64_t v14 = v87[0] - (void)__p;
      else {
        unint64_t v15 = v13;
      }
      if (v15)
      {
        double v16 = (char *)sub_10011E44C((uint64_t)v87, v15);
        uint64_t v11 = (char *)__p;
        double v9 = v86;
      }

      else
      {
        double v16 = 0LL;
      }

      uint64_t v17 = &v16[16 * v12];
      *(void *)uint64_t v17 = 0LL;
      *((void *)v17 + 1) = 0LL;
      unint64_t v18 = v17;
      if (v9 != v11)
      {
        do
        {
          __int128 v7 = *((_OWORD *)v9 - 1);
          *((_OWORD *)v18 - 1) = v7;
          v18 -= 16;
          v9 -= 16;
        }

        while (v9 != v11);
        uint64_t v11 = (char *)__p;
      }

      double v9 = v17 + 16;
      std::string __p = v18;
      double v86 = v17 + 16;
      v87[0] = &v16[16 * v15];
      if (v11) {
        operator delete(v11);
      }
    }

    else
    {
      *(void *)double v9 = 0LL;
      *((void *)v9 + 1) = 0LL;
      v9 += 16;
    }

    double v86 = v9;
    ++v10;
  }

  while (v10 != 16);
  for (uint64_t i = 0LL; i != 8; ++i)
  {
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", i, *(double *)&v7));
    unint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 real]);
    [v21 doubleValue];
    uint64_t v23 = v22;
    BOOL v24 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:i]);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 imag]);
    [v25 doubleValue];
    uint64_t v26 = (char *)__p + 16 * *((int *)&v87[1] + i);
    *uint64_t v26 = v23;
    v26[1] = v27;
  }

  uint64_t v28 = 0LL;
  __src = 0LL;
  double v83 = 0LL;
  double v84 = 0LL;
  do
  {
    double v30 = *(double *)__p;
    double v29 = *((double *)__p + 1);
    int v31 = v28;
    for (uint64_t j = 16LL; j != 256; j += 16LL)
    {
      double v33 = (char *)__p;
      float64x2_t v77 = vmulq_n_f64((float64x2_t)xmmword_10042FD80, (double)v31);
      sub_10011FB7C(v77.f64);
      v79 = v34;
      std::string __dst = v35;
      double v30 = v30 + sub_10011F9B0((double *)&v33[j], (double *)&v79);
      double v29 = v29 + v36;
      v31 += v28;
    }

    double v37 = v83;
    if (v83 >= v84)
    {
      uint64_t v39 = (double *)__src;
      uint64_t v40 = ((char *)v83 - (_BYTE *)__src) >> 4;
      unint64_t v41 = v40 + 1;
      uint64_t v42 = (char *)v84 - (_BYTE *)__src;
      else {
        unint64_t v43 = v41;
      }
      if (v43)
      {
        uint64_t v44 = (char *)sub_10011E44C((uint64_t)&v84, v43);
        uint64_t v39 = (double *)__src;
        double v37 = v83;
      }

      else
      {
        uint64_t v44 = 0LL;
      }

      __int128 v45 = (double *)&v44[16 * v40];
      *__int128 v45 = v30;
      v45[1] = v29;
      uint64_t v46 = v45;
      if (v37 != v39)
      {
        do
        {
          *((_OWORD *)v46 - 1) = *((_OWORD *)v37 - 1);
          v46 -= 2;
          v37 -= 2;
        }

        while (v37 != v39);
        uint64_t v39 = (double *)__src;
      }

      uint64_t v38 = (uint64_t)(v45 + 2);
      __src = v46;
      double v83 = v45 + 2;
      double v84 = (double *)&v44[16 * v43];
      if (v39) {
        operator delete(v39);
      }
    }

    else
    {
      *double v83 = v30;
      v37[1] = v29;
      uint64_t v38 = (uint64_t)(v37 + 2);
    }

    double v83 = (double *)v38;
    ++v28;
  }

  while (v28 != 16);
  std::string __dst = 0LL;
  uint64_t v81 = 0LL;
  v79 = 0LL;
  sub_1002F9810(&v79, (char *)__src + 128, v38, (v38 - ((uint64_t)__src + 128)) >> 4);
  sub_1002F9888((uint64_t)&v79, (uint64_t)__dst, (char *)__src, (char *)__src + 128, 8LL);
  if ((_BYTE *)__dst - (_BYTE *)v79 != 256) {
    __assert_rtn( "-[RangeBiasEstimatorSingleAntennaModel getNormalizedFftCir:]",  "NRBYRangeBiasEstimator.mm",  789,  "calculatedFftCir16ptShifted.size() == kDimFft");
  }
  float64_t v47 = 0.0;
  uint64_t v48 = 0LL;
  float64x2_t v77 = 0uLL;
  double v78 = 0LL;
  do
  {
    uint64_t v49 = (char *)v79 + 16 * dword_10042FE10[v48];
    if (*(void *)&v47 >= (unint64_t)v78)
    {
      uint64_t v50 = (uint64_t)(*(void *)&v47 - *(void *)&v77.f64[0]) >> 4;
      unint64_t v51 = (uint64_t)&v78[-*(void *)&v77.f64[0]] >> 3;
      if (v51 <= v50 + 1) {
        unint64_t v51 = v50 + 1;
      }
      else {
        unint64_t v52 = v51;
      }
      if (v52) {
        uint64_t v53 = (char *)sub_10011E44C((uint64_t)&v78, v52);
      }
      else {
        uint64_t v53 = 0LL;
      }
      id v54 = &v53[16 * v50];
      *(_OWORD *)id v54 = *v49;
      float64_t v55 = v77.f64[1];
      float64_t v56 = v77.f64[0];
      std::string v57 = v54;
      if (*(void *)&v77.f64[1] != *(void *)&v77.f64[0])
      {
        do
        {
          *((_OWORD *)v57 - 1) = *(_OWORD *)(*(void *)&v55 - 16LL);
          v57 -= 16;
          *(void *)&v55 -= 16LL;
        }

        while (*(void *)&v55 != *(void *)&v56);
        float64_t v55 = v77.f64[0];
      }

      *(void *)&float64_t v47 = v54 + 16;
      *(void *)&v77.f64[0] = v57;
      *(void *)&v77.f64[1] = v54 + 16;
      double v78 = &v53[16 * v52];
      if (v55 != 0.0) {
        operator delete(*(void **)&v55);
      }
    }

    else
    {
      **(_OWORD **)&float64_t v47 = *v49;
      *(void *)&v47 += 16LL;
    }

    v77.f64[1] = v47;
    ++v48;
  }

  while (v48 != 7);
  float64_t v58 = v77.f64[0];
  __int128 v76 = *(_OWORD *)(*(void *)&v77.f64[0] + 48LL);
  retstr->var1 = 0LL;
  retstr->var2.var0 = 0LL;
  retstr->var0 = 0LL;
  if (*(void *)&v47 == *(void *)&v58) {
    goto LABEL_85;
  }
  unint64_t v59 = 0LL;
  float64_t v47 = v58;
  do
  {
    if (hypot(*(double *)&v76, *((double *)&v76 + 1)) == 0.0) {
      __assert_rtn( "-[RangeBiasEstimatorSingleAntennaModel getNormalizedFftCir:]",  "NRBYRangeBiasEstimator.mm",  804,  "std::abs(peakCir) != 0");
    }
    double v60 = sub_1002F8AAC((double *)(*(void *)&v47 + 16 * v59), (double *)&v76);
    double v62 = hypot(v60, v61);
    if (v62 == 0.0) {
      __assert_rtn( "-[RangeBiasEstimatorSingleAntennaModel getNormalizedFftCir:]",  "NRBYRangeBiasEstimator.mm",  806,  "normalizedFftMagnitude != 0");
    }
    double v63 = log10(v62) * 20.0;
    var1 = retstr->var1;
    var0 = retstr->var2.var0;
    if (var1 >= var0)
    {
      uint64_t v67 = retstr->var0;
      uint64_t v68 = var1 - retstr->var0;
      unint64_t v69 = v68 + 1;
      uint64_t v70 = (char *)var0 - (char *)v67;
      if (v70 >> 2 > v69) {
        unint64_t v69 = v70 >> 2;
      }
      else {
        unint64_t v71 = v69;
      }
      if (v71)
      {
        v72 = (char *)sub_1000472C0((uint64_t)&retstr->var2, v71);
        uint64_t v67 = retstr->var0;
        var1 = retstr->var1;
      }

      else
      {
        v72 = 0LL;
      }

      v73 = (double *)&v72[8 * v68];
      double *v73 = v63;
      uint64_t v66 = v73 + 1;
      while (var1 != v67)
      {
        uint64_t v74 = *((void *)var1-- - 1);
        *((void *)v73-- - 1) = v74;
      }

      retstr->var0 = v73;
      retstr->var1 = v66;
      retstr->var2.var0 = (double *)&v72[8 * v71];
      if (v67) {
        operator delete(v67);
      }
    }

    else
    {
      double *var1 = v63;
      uint64_t v66 = var1 + 1;
    }

    retstr->var1 = v66;
    ++v59;
    float64_t v47 = v77.f64[0];
  }

  while (v59 < (uint64_t)(*(void *)&v77.f64[1] - *(void *)&v77.f64[0]) >> 4);
  if (*(void *)&v77.f64[0])
  {
LABEL_85:
    v77.f64[1] = v47;
    operator delete(*(void **)&v47);
  }

  if (v79)
  {
    std::string __dst = v79;
    operator delete(v79);
  }

  if (__src)
  {
    double v83 = (double *)__src;
    operator delete(__src);
  }

  if (__p)
  {
    double v86 = (char *)__p;
    operator delete(__p);
  }

  return result;
}

- (id)scaleCirValuesIfRequired:(id)a3
{
  id v4 = a3;
  int v5 = *((_DWORD *)sub_100005150() + 186);
  if (!v5)
  {
    id v3 = [v4 copy];
    goto LABEL_16;
  }

  if (v5 == 2)
  {
    double v32 = (os_log_s *)qword_1008000A0;
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v34 = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "#bias-est, Unknown platform", v34, 2u);
    }

    goto LABEL_15;
  }

  if (v5 != 1) {
    goto LABEL_16;
  }
  uint64_t v6 = 0LL;
  float v7 = 0.0;
  float v8 = 0.0;
  do
  {
    double v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:v6]);
    int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 real]);
    [v10 doubleValue];
    double v12 = v11;

    unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:v6]);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 imag]);
    [v14 doubleValue];
    float v7 = fmax(fabs(v12), v7);
    float v8 = fmax(fabs(v15), v8);

    ++v6;
  }

  while (v6 != 8);
  float v16 = fmaxf(v7, v8);
  if (v16 <= 0.0)
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR)) {
      sub_1003AAB40();
    }
LABEL_15:
    id v3 = 0LL;
    goto LABEL_16;
  }

  uint64_t v17 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v18 = 0LL;
  double v19 = (float)(32767.0 / v16);
  do
  {
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:v18]);
    unint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 real]);
    [v21 doubleValue];
    double v23 = v22;

    BOOL v24 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:v18]);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 imag]);
    [v25 doubleValue];
    double v27 = v26;

    uint64_t v28 = objc_alloc(&OBJC_CLASS___Complex);
    double v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v23 * v19));
    double v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v27 * v19));
    int v31 = -[Complex initWithRealPart:imagPart:](v28, "initWithRealPart:imagPart:", v29, v30);
    -[NSMutableArray addObject:](v17, "addObject:", v31);

    ++v18;
  }

  while (v18 != 8);
  id v3 = -[NSMutableArray copy](v17, "copy");

LABEL_16:
  return v3;
}

- (NSNumber)biasCorrectionEstimate
{
  return (NSNumber *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setBiasCorrectionEstimate:(id)a3
{
}

- (void).cxx_destruct
{
  p_dataTranformerResources = (NIMLModelResourcePackage *)&self->_modelResourcePackage.dataTranformerResources;
  sub_1002F94B0((void ***)&p_dataTranformerResources);
  p_dataTranformerResources = &self->_modelResourcePackage;
  sub_1002F94B0((void ***)&p_dataTranformerResources);
  objc_storeStrong((id *)&self->_remoteTxAntennaMask, 0LL);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 1) = 0u;
  return self;
}

@end