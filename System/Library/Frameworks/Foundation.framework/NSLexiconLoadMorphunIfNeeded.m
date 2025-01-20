@interface NSLexiconLoadMorphunIfNeeded
@end

@implementation NSLexiconLoadMorphunIfNeeded

void *___NSLexiconLoadMorphunIfNeeded_block_invoke()
{
  result = dlopen("/usr/lib/libmorphun.dylib", 256);
  if (result)
  {
    v1 = result;
    v2 = (uint64_t (*)(void))dlsym(result, "mlccfp_getDefaultCommonConceptFactoryProvider");
    if (!v2) {
      __assert_rtn("_NSLexiconLoadMorphunIfNeeded_block_invoke", "NSLexiconMorphun.m", 190, "symbol");
    }
    off_18C496808 = v2;
    v3 = dlsym(v1, "mlccfp_getCommonConceptFactory");
    if (!v3) {
      __assert_rtn("_NSLexiconLoadMorphunIfNeeded_block_invoke", "NSLexiconMorphun.m", 191, "symbol");
    }
    off_18C496810 = (uint64_t (*)(void, void, void))v3;
    v4 = dlsym(v1, "mccf_getSemanticFeatureModel");
    if (!v4) {
      __assert_rtn("_NSLexiconLoadMorphunIfNeeded_block_invoke", "NSLexiconMorphun.m", 192, "symbol");
    }
    off_18C496818 = (uint64_t (*)(void, void))v4;
    v5 = dlsym(v1, "mss_create");
    if (!v5) {
      __assert_rtn("_NSLexiconLoadMorphunIfNeeded_block_invoke", "NSLexiconMorphun.m", 193, "symbol");
    }
    off_18C496820 = (uint64_t (*)(void, void))v5;
    v6 = dlsym(v1, "minf_create");
    if (!v6) {
      __assert_rtn("_NSLexiconLoadMorphunIfNeeded_block_invoke", "NSLexiconMorphun.m", 194, "symbol");
    }
    off_18C496828 = (uint64_t (*)(void, void, void))v6;
    v7 = dlsym(v1, "minf_toSpeakableString");
    if (!v7) {
      __assert_rtn("_NSLexiconLoadMorphunIfNeeded_block_invoke", "NSLexiconMorphun.m", 195, "symbol");
    }
    off_18C496840 = (uint64_t (*)(void, void))v7;
    v8 = dlsym(v1, "minf_getFeatureValueByNameCopy");
    if (!v8) {
      __assert_rtn("_NSLexiconLoadMorphunIfNeeded_block_invoke", "NSLexiconMorphun.m", 196, "symbol");
    }
    off_18C496838 = (uint64_t (*)(void, void, void))v8;
    v9 = dlsym(v1, "minf_toSemanticFeatureConcept");
    if (!v9) {
      __assert_rtn("_NSLexiconLoadMorphunIfNeeded_block_invoke", "NSLexiconMorphun.m", 197, "symbol");
    }
    off_18C496918 = (uint64_t (*)(void, void))v9;
    v10 = dlsym(v1, "mss_createPrintCopy");
    if (!v10) {
      __assert_rtn("_NSLexiconLoadMorphunIfNeeded_block_invoke", "NSLexiconMorphun.m", 198, "symbol");
    }
    off_18C496848 = (uint64_t (*)(void, void))v10;
    v11 = (uint64_t (*)(void))dlsym(v1, "mss_destroy");
    if (!v11) {
      __assert_rtn("_NSLexiconLoadMorphunIfNeeded_block_invoke", "NSLexiconMorphun.m", 199, "symbol");
    }
    off_18C496850 = v11;
    v12 = (uint64_t (*)(void))dlsym(v1, "minf_destroy");
    if (!v12) {
      __assert_rtn("_NSLexiconLoadMorphunIfNeeded_block_invoke", "NSLexiconMorphun.m", 200, "symbol");
    }
    off_18C496858 = v12;
    v13 = dlsym(v1, "minf_putConstraintByName");
    if (!v13) {
      __assert_rtn("_NSLexiconLoadMorphunIfNeeded_block_invoke", "NSLexiconMorphun.m", 201, "symbol");
    }
    _MergedGlobals_109 = (uint64_t (*)(void, void, void, void))v13;
    v14 = dlsym(v1, "matlm_getSurfaceFormGrammemes");
    if (!v14) {
      __assert_rtn("_NSLexiconLoadMorphunIfNeeded_block_invoke", "NSLexiconMorphun.m", 202, "symbol");
    }
    off_18C4968B8 = (uint64_t (*)(void, void))v14;
    v15 = dlsym(v1, "matmwt_createLemmaMappings");
    if (!v15) {
      __assert_rtn("_NSLexiconLoadMorphunIfNeeded_block_invoke", "NSLexiconMorphun.m", 203, "symbol");
    }
    off_18C4968B0 = (uint64_t (*)(void, void))v15;
    v16 = dlsym(v1, "matmwt_getMorphologicalWordToken");
    if (!v16) {
      __assert_rtn("_NSLexiconLoadMorphunIfNeeded_block_invoke", "NSLexiconMorphun.m", 204, "symbol");
    }
    off_18C4968A8 = (uint64_t (*)(void, void))v16;
    v17 = dlsym(v1, "mca_createTokenChain");
    if (!v17) {
      __assert_rtn("_NSLexiconLoadMorphunIfNeeded_block_invoke", "NSLexiconMorphun.m", 205, "symbol");
    }
    off_18C496890 = (uint64_t (*)(void, void, void))v17;
    v18 = dlsym(v1, "mdaf_create");
    if (!v18) {
      __assert_rtn("_NSLexiconLoadMorphunIfNeeded_block_invoke", "NSLexiconMorphun.m", 206, "symbol");
    }
    off_18C496940 = v18;
    v19 = dlsym(v1, "mdaf_getAnalyzer");
    if (!v19) {
      __assert_rtn("_NSLexiconLoadMorphunIfNeeded_block_invoke", "NSLexiconMorphun.m", 207, "symbol");
    }
    off_18C496860 = (uint64_t (*)(void, void, void))v19;
    v20 = dlsym(v1, "mddmd_createPropertyNames");
    if (!v20) {
      __assert_rtn("_NSLexiconLoadMorphunIfNeeded_block_invoke", "NSLexiconMorphun.m", 208, "symbol");
    }
    off_18C4968C0 = (uint64_t (*)(void, void, void))v20;
    v21 = dlsym(v1, "mddmd_getDictionary");
    if (!v21) {
      __assert_rtn("_NSLexiconLoadMorphunIfNeeded_block_invoke", "NSLexiconMorphun.m", 209, "symbol");
    }
    off_18C496880 = (uint64_t (*)(void, void))v21;
    v22 = dlsym(v1, "mtok_createTokenizer");
    if (!v22) {
      __assert_rtn("_NSLexiconLoadMorphunIfNeeded_block_invoke", "NSLexiconMorphun.m", 210, "symbol");
    }
    off_18C496868 = (uint64_t (*)(void, void))v22;
    v23 = dlsym(v1, "mtok_createTokenChain");
    if (!v23) {
      __assert_rtn("_NSLexiconLoadMorphunIfNeeded_block_invoke", "NSLexiconMorphun.m", 211, "symbol");
    }
    off_18C496888 = (uint64_t (*)(void, void, void))v23;
    v24 = (uint64_t (*)(void))dlsym(v1, "mtok_destroy");
    if (!v24) {
      __assert_rtn("_NSLexiconLoadMorphunIfNeeded_block_invoke", "NSLexiconMorphun.m", 212, "symbol");
    }
    off_18C496878 = v24;
    v25 = dlsym(v1, "mtok_setStyle");
    if (!v25) {
      __assert_rtn("_NSLexiconLoadMorphunIfNeeded_block_invoke", "NSLexiconMorphun.m", 213, "symbol");
    }
    off_18C496870 = (uint64_t (*)(void, void, void))v25;
    v26 = dlsym(v1, "mtok_isType");
    if (!v26) {
      __assert_rtn("_NSLexiconLoadMorphunIfNeeded_block_invoke", "NSLexiconMorphun.m", 214, "symbol");
    }
    off_18C4968A0 = (uint64_t (*)(void, void, void))v26;
    v27 = dlsym(v1, "mtokc_getToken");
    if (!v27) {
      __assert_rtn("_NSLexiconLoadMorphunIfNeeded_block_invoke", "NSLexiconMorphun.m", 215, "symbol");
    }
    off_18C496898 = (uint64_t (*)(void, void, void))v27;
    v28 = (uint64_t (*)(void))dlsym(v1, "mtokc_destroy");
    if (!v28) {
      __assert_rtn("_NSLexiconLoadMorphunIfNeeded_block_invoke", "NSLexiconMorphun.m", 216, "symbol");
    }
    off_18C4968C8 = v28;
    v29 = dlsym(v1, "minf_isExists");
    if (!v29) {
      __assert_rtn("_NSLexiconLoadMorphunIfNeeded_block_invoke", "NSLexiconMorphun.m", 217, "symbol");
    }
    off_18C496830 = (uint64_t (*)(void, void))v29;
    v30 = dlsym(v1, "mpron_toSemanticFeatureConcept");
    if (!v30) {
      __assert_rtn("_NSLexiconLoadMorphunIfNeeded_block_invoke", "NSLexiconMorphun.m", 218, "symbol");
    }
    off_18C4968E0 = (uint64_t (*)(void, void))v30;
    v31 = dlsym(v1, "mpron_toPronounConcept");
    if (!v31) {
      __assert_rtn("_NSLexiconLoadMorphunIfNeeded_block_invoke", "NSLexiconMorphun.m", 219, "symbol");
    }
    qword_18C496948 = (uint64_t)v31;
    v32 = dlsym(v1, "mpron_createWithCustom");
    if (!v32) {
      __assert_rtn("_NSLexiconLoadMorphunIfNeeded_block_invoke", "NSLexiconMorphun.m", 220, "symbol");
    }
    off_18C496900 = (uint64_t (*)(void, void, void, void))v32;
    v33 = dlsym(v1, "mpron_createWithDefaults");
    if (!v33) {
      __assert_rtn("_NSLexiconLoadMorphunIfNeeded_block_invoke", "NSLexiconMorphun.m", 221, "symbol");
    }
    qword_18C496950 = (uint64_t)v33;
    v34 = dlsym(v1, "mpron_createFromInitialPronoun");
    if (!v34) {
      __assert_rtn("_NSLexiconLoadMorphunIfNeeded_block_invoke", "NSLexiconMorphun.m", 222, "symbol");
    }
    off_18C4968D8 = (uint64_t (*)(void, void, void))v34;
    v35 = (uint64_t (*)(void))dlsym(v1, "mpron_destroy");
    if (!v35) {
      __assert_rtn("_NSLexiconLoadMorphunIfNeeded_block_invoke", "NSLexiconMorphun.m", 223, "symbol");
    }
    off_18C496930 = v35;
    v36 = dlsym(v1, "msfc_isExists");
    if (!v36) {
      __assert_rtn("_NSLexiconLoadMorphunIfNeeded_block_invoke", "NSLexiconMorphun.m", 224, "symbol");
    }
    off_18C496910 = (uint64_t (*)(void, void))v36;
    v37 = dlsym(v1, "msfc_createConstraintByNameCopy");
    if (!v37) {
      __assert_rtn("_NSLexiconLoadMorphunIfNeeded_block_invoke", "NSLexiconMorphun.m", 225, "symbol");
    }
    qword_18C496958 = (uint64_t)v37;
    v38 = dlsym(v1, "msfc_putConstraintByName");
    if (!v38) {
      __assert_rtn("_NSLexiconLoadMorphunIfNeeded_block_invoke", "NSLexiconMorphun.m", 226, "symbol");
    }
    off_18C4968E8 = (uint64_t (*)(void, void, void, void))v38;
    v39 = dlsym(v1, "msfc_clearConstraintByName");
    if (!v39) {
      __assert_rtn("_NSLexiconLoadMorphunIfNeeded_block_invoke", "NSLexiconMorphun.m", 227, "symbol");
    }
    off_18C4968F0 = (uint64_t (*)(void, void, void))v39;
    v40 = dlsym(v1, "msfc_reset");
    if (!v40) {
      __assert_rtn("_NSLexiconLoadMorphunIfNeeded_block_invoke", "NSLexiconMorphun.m", 228, "symbol");
    }
    qword_18C496960 = (uint64_t)v40;
    v41 = dlsym(v1, "msfc_createFeatureValueByNameCopy");
    if (!v41) {
      __assert_rtn("_NSLexiconLoadMorphunIfNeeded_block_invoke", "NSLexiconMorphun.m", 229, "symbol");
    }
    off_18C496908 = (uint64_t (*)(void, void, void))v41;
    v42 = dlsym(v1, "msfc_toSpeakableStringCopy");
    if (!v42) {
      __assert_rtn("_NSLexiconLoadMorphunIfNeeded_block_invoke", "NSLexiconMorphun.m", 230, "symbol");
    }
    off_18C496928 = (uint64_t (*)(void, void))v42;
    v43 = dlsym(v1, "msfc_toSpeakableStringWithDependencyCopy");
    if (!v43) {
      __assert_rtn("_NSLexiconLoadMorphunIfNeeded_block_invoke", "NSLexiconMorphun.m", 231, "symbol");
    }
    off_18C496920 = (uint64_t (*)(void, void, void))v43;
    v44 = dlsym(v1, "msfc_clone");
    if (!v44) {
      __assert_rtn("_NSLexiconLoadMorphunIfNeeded_block_invoke", "NSLexiconMorphun.m", 232, "symbol");
    }
    qword_18C496968 = (uint64_t)v44;
    v45 = dlsym(v1, "msfc_destroy");
    if (!v45) {
      __assert_rtn("_NSLexiconLoadMorphunIfNeeded_block_invoke", "NSLexiconMorphun.m", 233, "symbol");
    }
    qword_18C496970 = (uint64_t)v45;
    v46 = dlsym(v1, "mdv_create");
    if (!v46) {
      __assert_rtn("_NSLexiconLoadMorphunIfNeeded_block_invoke", "NSLexiconMorphun.m", 234, "symbol");
    }
    off_18C4968F8 = v46;
    result = dlsym(v1, "mdv_destroy");
    if (!result) {
      __assert_rtn("_NSLexiconLoadMorphunIfNeeded_block_invoke", "NSLexiconMorphun.m", 235, "symbol");
    }
    off_18C4968D0 = (uint64_t (*)(void))result;
  }

  return result;
}

@end