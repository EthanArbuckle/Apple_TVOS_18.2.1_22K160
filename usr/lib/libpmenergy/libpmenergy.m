double pm_task_subtract_version(uint64_t a1, unint64_t *a2, uint64_t a3, _BYTE *a4, int a5)
{
  double result;
  *(void *)&result = sub_188CC01C8(a1, a2, a3, 0xFFFFFFFF, a4, a5).n128_u64[0];
  return result;
}

__n128 sub_188CC01C8(uint64_t a1, unint64_t *a2, uint64_t a3, unsigned int a4, _BYTE *a5, int a6)
{
  if (a5) {
    *a5 = 0;
  }
  unint64_t v6 = *(void *)(a1 + 148);
  if ((a4 & 0x80000000) == 0)
  {
    *(void *)(a3 + 148) = v6 + *(unint64_t *)((char *)a2 + 148) * a4;
    *(void *)(a3 + 156) = *(void *)(a1 + 156) + *(unint64_t *)((char *)a2 + 156) * a4;
    *(void *)(a3 + 164) = *(void *)(a1 + 164) + *(unint64_t *)((char *)a2 + 164) * a4;
    *(void *)(a3 + 172) = *(void *)(a1 + 172) + *(unint64_t *)((char *)a2 + 172) * a4;
    *(void *)(a3 + 140) = *(void *)(a1 + 140) + *(unint64_t *)((char *)a2 + 140) * a4;
    *(void *)(a3 + 132) = *(void *)(a1 + 132) + *(unint64_t *)((char *)a2 + 132) * a4;
    unint64_t v7 = *(void *)(a1 + 200) + a2[25] * a4;
    *(void *)(a3 + 192) = *(void *)(a1 + 192) + a2[24] * a4;
    *(void *)(a3 + 200) = v7;
    unint64_t v8 = *(void *)(a1 + 216) + a2[27] * a4;
    *(void *)(a3 + 208) = *(void *)(a1 + 208) + a2[26] * a4;
    *(void *)(a3 + 216) = v8;
    unint64_t v9 = *(void *)(a1 + 232) + a2[29] * a4;
    *(void *)(a3 + 224) = *(void *)(a1 + 224) + a2[28] * a4;
    *(void *)(a3 + 232) = v9;
    uint64_t v10 = *(void *)(a1 + 304);
    unint64_t v11 = a2[38];
    unint64_t v12 = *(void *)(a1 + 312) + a2[39] * a4;
    unint64_t v13 = *(void *)(a1 + 328) + a2[41] * a4;
    *(void *)(a3 + 320) = *(void *)(a1 + 320) + a2[40] * a4;
    *(void *)(a3 + 328) = v13;
    unint64_t v14 = *(void *)(a1 + 264) + a2[33] * a4;
    *(void *)(a3 + 256) = *(void *)(a1 + 256) + a2[32] * a4;
    *(void *)(a3 + 264) = v14;
    unint64_t v15 = *(void *)(a1 + 280) + a2[35] * a4;
    *(void *)(a3 + 272) = *(void *)(a1 + 272) + a2[34] * a4;
    *(void *)(a3 + 280) = v15;
    unint64_t v16 = *(void *)(a1 + 296) + a2[37] * a4;
    *(void *)(a3 + 288) = *(void *)(a1 + 288) + a2[36] * a4;
    *(void *)(a3 + 296) = v16;
    *(void *)(a3 + 304) = v10 + v11 * a4;
    *(void *)(a3 + 312) = v12;
    unint64_t v17 = *(void *)(a1 + 344) + a2[43] * a4;
    *(void *)(a3 + 336) = *(void *)(a1 + 336) + a2[42] * a4;
    *(void *)(a3 + 344) = v17;
    unint64_t v18 = *(void *)(a1 + 360) + a2[45] * a4;
    *(void *)(a3 + 352) = *(void *)(a1 + 352) + a2[44] * a4;
    *(void *)(a3 + 360) = v18;
    unint64_t v19 = *(void *)(a1 + 376) + a2[47] * a4;
    *(void *)(a3 + 368) = *(void *)(a1 + 368) + a2[46] * a4;
    *(void *)(a3 + 376) = v19;
    *(void *)(a3 + 384) = *(void *)(a1 + 384) + a2[48] * a4;
    if (a6 > 1)
    {
      unint64_t v20 = *(void *)(a1 + 416) + a2[52] * a4;
      *(void *)(a3 + 408) = *(void *)(a1 + 408) + a2[51] * a4;
      *(void *)(a3 + 416) = v20;
      unint64_t v21 = *(void *)(a1 + 432) + a2[54] * a4;
      *(void *)(a3 + 424) = *(void *)(a1 + 424) + a2[53] * a4;
      *(void *)(a3 + 432) = v21;
    }

    unint64_t v22 = *(void *)(a1 + 392) + a2[49] * a4;
    goto LABEL_128;
  }

  unint64_t v23 = *(unint64_t *)((char *)a2 + 148);
  BOOL v24 = v6 >= v23;
  unint64_t v25 = v6 - v23;
  if (v24)
  {
    *(void *)(a3 + 148) = v25;
    v26 = (unint64_t *)(a1 + 156);
    unint64_t v27 = *(void *)(a1 + 156);
    v28 = (unint64_t *)((char *)a2 + 156);
    unint64_t v29 = *(unint64_t *)((char *)a2 + 156);
    if (v27 >= v29) {
      goto LABEL_14;
    }
    if (!a5) {
      sub_188CC24CC(a1 + 156, (uint64_t)a2 + 156, a3);
    }
    goto LABEL_13;
  }

  if (!a5) {
    sub_188CC13C8(a1 + 148, (uint64_t)a2 + 148, a3);
  }
  *a5 = 1;
  *(void *)(a3 + 148) = 0LL;
  v26 = (unint64_t *)(a1 + 156);
  unint64_t v27 = *(void *)(a1 + 156);
  v28 = (unint64_t *)((char *)a2 + 156);
  unint64_t v29 = *(unint64_t *)((char *)a2 + 156);
  *(void *)(a3 + 148) = *(void *)(a1 + 148) - *(unint64_t *)((char *)a2 + 148);
  if (v27 < v29)
  {
LABEL_13:
    *a5 = 1;
    *(void *)(a3 + 156) = 0LL;
    unint64_t v27 = *v26;
    unint64_t v29 = *v28;
  }

LABEL_14:
  *(void *)(a3 + 156) = v27 - v29;
  unint64_t v30 = *(void *)(a1 + 164);
  unint64_t v31 = *(unint64_t *)((char *)a2 + 164);
  BOOL v24 = v30 >= v31;
  unint64_t v32 = v30 - v31;
  if (v24)
  {
    *(void *)(a3 + 164) = v32;
    v33 = (unint64_t *)(a1 + 172);
    unint64_t v34 = *(void *)(a1 + 172);
    v35 = (unint64_t *)((char *)a2 + 172);
    unint64_t v36 = *(unint64_t *)((char *)a2 + 172);
    if (v34 >= v36) {
      goto LABEL_21;
    }
    if (!a5) {
      sub_188CC2448(a1 + 172, (uint64_t)a2 + 172, a3);
    }
    goto LABEL_20;
  }

  if (!a5) {
    sub_188CC144C(a1 + 164, (uint64_t)a2 + 164, a3);
  }
  *a5 = 1;
  *(void *)(a3 + 164) = 0LL;
  v33 = (unint64_t *)(a1 + 172);
  unint64_t v34 = *(void *)(a1 + 172);
  v35 = (unint64_t *)((char *)a2 + 172);
  unint64_t v36 = *(unint64_t *)((char *)a2 + 172);
  *(void *)(a3 + 164) = *(void *)(a1 + 164) - *(unint64_t *)((char *)a2 + 164);
  if (v34 < v36)
  {
LABEL_20:
    *a5 = 1;
    *(void *)(a3 + 172) = 0LL;
    unint64_t v34 = *v33;
    unint64_t v36 = *v35;
  }

LABEL_21:
  v37 = (uint64_t *)(a1 + 132);
  v38 = (uint64_t *)((char *)a2 + 132);
  *(void *)(a3 + 172) = v34 - v36;
  unint64_t v39 = *(void *)(a1 + 140);
  unint64_t v40 = *(unint64_t *)((char *)a2 + 140);
  BOOL v24 = v39 >= v40;
  unint64_t v41 = v39 - v40;
  if (v24)
  {
    *(void *)(a3 + 140) = v41;
    uint64_t v42 = *v37;
    uint64_t v43 = *v38;
    if (!a5) {
      sub_188CC23C4(a1 + 132, (uint64_t)a2 + 132, a3);
    }
    goto LABEL_27;
  }

  if (!a5) {
    sub_188CC14D0(a1 + 140, (uint64_t)a2 + 140, a3);
  }
  *a5 = 1;
  *(void *)(a3 + 140) = 0LL;
  *(void *)(a3 + 140) = *(void *)(a1 + 140) - *(unint64_t *)((char *)a2 + 140);
  uint64_t v42 = *v37;
  uint64_t v43 = *v38;
  if (*v37 < (unint64_t)*v38)
  {
LABEL_27:
    *a5 = 1;
    *(void *)(a3 + 132) = 0LL;
    uint64_t v42 = *v37;
    uint64_t v43 = *v38;
  }

LABEL_28:
  *(void *)(a3 + 132) = v42 - v43;
  unint64_t v44 = *(void *)(a1 + 192);
  unint64_t v45 = a2[24];
  BOOL v24 = v44 >= v45;
  unint64_t v46 = v44 - v45;
  if (v24)
  {
    *(void *)(a3 + 192) = v46;
    v47 = (unint64_t *)(a1 + 200);
    unint64_t v48 = *(void *)(a1 + 200);
    v49 = a2 + 25;
    unint64_t v50 = a2[25];
    if (v48 >= v50) {
      goto LABEL_35;
    }
    if (!a5) {
      sub_188CC2340(a1 + 200, (uint64_t)(a2 + 25), a3);
    }
    goto LABEL_34;
  }

  if (!a5) {
    sub_188CC1554(a1 + 192, (uint64_t)(a2 + 24), a3);
  }
  *a5 = 1;
  *(void *)(a3 + 192) = 0LL;
  v47 = (unint64_t *)(a1 + 200);
  unint64_t v48 = *(void *)(a1 + 200);
  v49 = a2 + 25;
  unint64_t v50 = a2[25];
  *(void *)(a3 + 192) = *(void *)(a1 + 192) - a2[24];
  if (v48 < v50)
  {
LABEL_34:
    *a5 = 1;
    *(void *)(a3 + 200) = 0LL;
    unint64_t v48 = *v47;
    unint64_t v50 = *v49;
  }

LABEL_35:
  *(void *)(a3 + 200) = v48 - v50;
  unint64_t v51 = *(void *)(a1 + 208);
  unint64_t v52 = a2[26];
  BOOL v24 = v51 >= v52;
  unint64_t v53 = v51 - v52;
  if (v24)
  {
    *(void *)(a3 + 208) = v53;
    v54 = (unint64_t *)(a1 + 216);
    unint64_t v55 = *(void *)(a1 + 216);
    v56 = a2 + 27;
    unint64_t v57 = a2[27];
    if (v55 >= v57) {
      goto LABEL_42;
    }
    if (!a5) {
      sub_188CC22BC(a1 + 216, (uint64_t)(a2 + 27), a3);
    }
    goto LABEL_41;
  }

  if (!a5) {
    sub_188CC15D8(a1 + 208, (uint64_t)(a2 + 26), a3);
  }
  *a5 = 1;
  *(void *)(a3 + 208) = 0LL;
  v54 = (unint64_t *)(a1 + 216);
  unint64_t v55 = *(void *)(a1 + 216);
  v56 = a2 + 27;
  unint64_t v57 = a2[27];
  *(void *)(a3 + 208) = *(void *)(a1 + 208) - a2[26];
  if (v55 < v57)
  {
LABEL_41:
    *a5 = 1;
    *(void *)(a3 + 216) = 0LL;
    unint64_t v55 = *v54;
    unint64_t v57 = *v56;
  }

LABEL_42:
  *(void *)(a3 + 216) = v55 - v57;
  unint64_t v58 = *(void *)(a1 + 224);
  unint64_t v59 = a2[28];
  BOOL v24 = v58 >= v59;
  unint64_t v60 = v58 - v59;
  if (v24)
  {
    *(void *)(a3 + 224) = v60;
    v61 = (unint64_t *)(a1 + 232);
    unint64_t v62 = *(void *)(a1 + 232);
    v63 = a2 + 29;
    unint64_t v64 = a2[29];
    if (v62 >= v64) {
      goto LABEL_49;
    }
    if (!a5) {
      sub_188CC2238(a1 + 232, (uint64_t)(a2 + 29), a3);
    }
    goto LABEL_48;
  }

  if (!a5) {
    sub_188CC165C(a1 + 224, (uint64_t)(a2 + 28), a3);
  }
  *a5 = 1;
  *(void *)(a3 + 224) = 0LL;
  v61 = (unint64_t *)(a1 + 232);
  unint64_t v62 = *(void *)(a1 + 232);
  v63 = a2 + 29;
  unint64_t v64 = a2[29];
  *(void *)(a3 + 224) = *(void *)(a1 + 224) - a2[28];
  if (v62 < v64)
  {
LABEL_48:
    *a5 = 1;
    *(void *)(a3 + 232) = 0LL;
    unint64_t v62 = *v61;
    unint64_t v64 = *v63;
  }

LABEL_49:
  *(void *)(a3 + 232) = v62 - v64;
  unint64_t v65 = *(void *)(a1 + 312);
  unint64_t v66 = a2[39];
  BOOL v24 = v65 >= v66;
  unint64_t v67 = v65 - v66;
  if (v24)
  {
    *(void *)(a3 + 312) = v67;
    unint64_t v68 = *(void *)(a1 + 320);
    unint64_t v69 = a2[40];
    if (v68 >= v69) {
      goto LABEL_56;
    }
    v70 = (unint64_t *)(a1 + 320);
    v71 = a2 + 40;
    if (!a5) {
      sub_188CC21B4(a1 + 320, (uint64_t)(a2 + 40), a3);
    }
    goto LABEL_55;
  }

  if (!a5) {
    sub_188CC16E0(a1 + 312, (uint64_t)(a2 + 39), a3);
  }
  *a5 = 1;
  *(void *)(a3 + 312) = 0LL;
  unint64_t v68 = *(void *)(a1 + 320);
  unint64_t v69 = a2[40];
  *(void *)(a3 + 312) = *(void *)(a1 + 312) - a2[39];
  if (v68 < v69)
  {
    v70 = (unint64_t *)(a1 + 320);
    v71 = a2 + 40;
LABEL_55:
    *a5 = 1;
    *(void *)(a3 + 320) = 0LL;
    unint64_t v68 = *v70;
    unint64_t v69 = *v71;
  }

LABEL_56:
  *(void *)(a3 + 320) = v68 - v69;
  unint64_t v72 = *(void *)(a1 + 328);
  unint64_t v73 = a2[41];
  BOOL v24 = v72 >= v73;
  unint64_t v74 = v72 - v73;
  if (v24)
  {
    *(void *)(a3 + 328) = v74;
    unint64_t v75 = *(void *)(a1 + 256);
    unint64_t v76 = a2[32];
    if (v75 >= v76) {
      goto LABEL_63;
    }
    v77 = (unint64_t *)(a1 + 256);
    v78 = a2 + 32;
    if (!a5) {
      sub_188CC2130(a1 + 256, (uint64_t)(a2 + 32), a3);
    }
    goto LABEL_62;
  }

  if (!a5) {
    sub_188CC1764(a1 + 328, (uint64_t)(a2 + 41), a3);
  }
  *a5 = 1;
  *(void *)(a3 + 328) = 0LL;
  *(void *)(a3 + 328) = *(void *)(a1 + 328) - a2[41];
  unint64_t v75 = *(void *)(a1 + 256);
  unint64_t v76 = a2[32];
  if (v75 < v76)
  {
    v77 = (unint64_t *)(a1 + 256);
    v78 = a2 + 32;
LABEL_62:
    *a5 = 1;
    *(void *)(a3 + 256) = 0LL;
    unint64_t v75 = *v77;
    unint64_t v76 = *v78;
  }

LABEL_63:
  *(void *)(a3 + 256) = v75 - v76;
  unint64_t v79 = *(void *)(a1 + 264);
  unint64_t v80 = a2[33];
  BOOL v24 = v79 >= v80;
  unint64_t v81 = v79 - v80;
  if (v24)
  {
    *(void *)(a3 + 264) = v81;
    unint64_t v82 = *(void *)(a1 + 272);
    unint64_t v83 = a2[34];
    if (v82 >= v83) {
      goto LABEL_70;
    }
    v84 = (unint64_t *)(a1 + 272);
    v85 = a2 + 34;
    if (!a5) {
      sub_188CC20AC(a1 + 272, (uint64_t)(a2 + 34), a3);
    }
    goto LABEL_69;
  }

  if (!a5) {
    sub_188CC17E8(a1 + 264, (uint64_t)(a2 + 33), a3);
  }
  *a5 = 1;
  *(void *)(a3 + 264) = 0LL;
  unint64_t v82 = *(void *)(a1 + 272);
  unint64_t v83 = a2[34];
  *(void *)(a3 + 264) = *(void *)(a1 + 264) - a2[33];
  if (v82 < v83)
  {
    v84 = (unint64_t *)(a1 + 272);
    v85 = a2 + 34;
LABEL_69:
    *a5 = 1;
    *(void *)(a3 + 272) = 0LL;
    unint64_t v82 = *v84;
    unint64_t v83 = *v85;
  }

LABEL_70:
  *(void *)(a3 + 272) = v82 - v83;
  unint64_t v86 = *(void *)(a1 + 280);
  unint64_t v87 = a2[35];
  BOOL v24 = v86 >= v87;
  unint64_t v88 = v86 - v87;
  if (v24)
  {
    *(void *)(a3 + 280) = v88;
    unint64_t v89 = *(void *)(a1 + 288);
    unint64_t v90 = a2[36];
    if (v89 >= v90) {
      goto LABEL_77;
    }
    v91 = (unint64_t *)(a1 + 288);
    v92 = a2 + 36;
    if (!a5) {
      sub_188CC2028(a1 + 288, (uint64_t)(a2 + 36), a3);
    }
    goto LABEL_76;
  }

  if (!a5) {
    sub_188CC186C(a1 + 280, (uint64_t)(a2 + 35), a3);
  }
  *a5 = 1;
  *(void *)(a3 + 280) = 0LL;
  unint64_t v89 = *(void *)(a1 + 288);
  unint64_t v90 = a2[36];
  *(void *)(a3 + 280) = *(void *)(a1 + 280) - a2[35];
  if (v89 < v90)
  {
    v91 = (unint64_t *)(a1 + 288);
    v92 = a2 + 36;
LABEL_76:
    *a5 = 1;
    *(void *)(a3 + 288) = 0LL;
    unint64_t v89 = *v91;
    unint64_t v90 = *v92;
  }

LABEL_77:
  *(void *)(a3 + 288) = v89 - v90;
  unint64_t v93 = *(void *)(a1 + 296);
  unint64_t v94 = a2[37];
  BOOL v24 = v93 >= v94;
  unint64_t v95 = v93 - v94;
  if (v24)
  {
    *(void *)(a3 + 296) = v95;
    unint64_t v96 = *(void *)(a1 + 304);
    unint64_t v97 = a2[38];
    if (v96 >= v97) {
      goto LABEL_84;
    }
    v98 = (unint64_t *)(a1 + 304);
    v99 = a2 + 38;
    if (!a5) {
      sub_188CC1FA4(a1 + 304, (uint64_t)(a2 + 38), a3);
    }
    goto LABEL_83;
  }

  if (!a5) {
    sub_188CC18F0(a1 + 296, (uint64_t)(a2 + 37), a3);
  }
  *a5 = 1;
  *(void *)(a3 + 296) = 0LL;
  unint64_t v96 = *(void *)(a1 + 304);
  unint64_t v97 = a2[38];
  *(void *)(a3 + 296) = *(void *)(a1 + 296) - a2[37];
  if (v96 < v97)
  {
    v98 = (unint64_t *)(a1 + 304);
    v99 = a2 + 38;
LABEL_83:
    *a5 = 1;
    *(void *)(a3 + 304) = 0LL;
    unint64_t v96 = *v98;
    unint64_t v97 = *v99;
  }

LABEL_84:
  *(void *)(a3 + 304) = v96 - v97;
  unint64_t v100 = *(void *)(a1 + 336);
  unint64_t v101 = a2[42];
  BOOL v24 = v100 >= v101;
  unint64_t v102 = v100 - v101;
  if (v24)
  {
    *(void *)(a3 + 336) = v102;
    unint64_t v103 = *(void *)(a1 + 344);
    unint64_t v104 = a2[43];
    if (v103 >= v104) {
      goto LABEL_91;
    }
    v105 = (unint64_t *)(a1 + 344);
    v106 = a2 + 43;
    if (!a5) {
      sub_188CC1F20(a1 + 344, (uint64_t)(a2 + 43), a3);
    }
    goto LABEL_90;
  }

  if (!a5) {
    sub_188CC1974(a1 + 336, (uint64_t)(a2 + 42), a3);
  }
  *a5 = 1;
  *(void *)(a3 + 336) = 0LL;
  unint64_t v103 = *(void *)(a1 + 344);
  unint64_t v104 = a2[43];
  *(void *)(a3 + 336) = *(void *)(a1 + 336) - a2[42];
  if (v103 < v104)
  {
    v105 = (unint64_t *)(a1 + 344);
    v106 = a2 + 43;
LABEL_90:
    *a5 = 1;
    *(void *)(a3 + 344) = 0LL;
    unint64_t v103 = *v105;
    unint64_t v104 = *v106;
  }

LABEL_91:
  *(void *)(a3 + 344) = v103 - v104;
  unint64_t v107 = *(void *)(a1 + 352);
  unint64_t v108 = a2[44];
  BOOL v24 = v107 >= v108;
  unint64_t v109 = v107 - v108;
  if (v24)
  {
    *(void *)(a3 + 352) = v109;
    unint64_t v110 = *(void *)(a1 + 360);
    unint64_t v111 = a2[45];
    if (v110 >= v111) {
      goto LABEL_98;
    }
    v112 = (unint64_t *)(a1 + 360);
    v113 = a2 + 45;
    if (!a5) {
      sub_188CC1E9C(a1 + 360, (uint64_t)(a2 + 45), a3);
    }
    goto LABEL_97;
  }

  if (!a5) {
    sub_188CC19F8(a1 + 352, (uint64_t)(a2 + 44), a3);
  }
  *a5 = 1;
  *(void *)(a3 + 352) = 0LL;
  unint64_t v110 = *(void *)(a1 + 360);
  unint64_t v111 = a2[45];
  *(void *)(a3 + 352) = *(void *)(a1 + 352) - a2[44];
  if (v110 < v111)
  {
    v112 = (unint64_t *)(a1 + 360);
    v113 = a2 + 45;
LABEL_97:
    *a5 = 1;
    *(void *)(a3 + 360) = 0LL;
    unint64_t v110 = *v112;
    unint64_t v111 = *v113;
  }

LABEL_98:
  *(void *)(a3 + 360) = v110 - v111;
  unint64_t v114 = *(void *)(a1 + 368);
  unint64_t v115 = a2[46];
  BOOL v24 = v114 >= v115;
  unint64_t v116 = v114 - v115;
  if (v24)
  {
    *(void *)(a3 + 368) = v116;
    unint64_t v117 = *(void *)(a1 + 376);
    unint64_t v118 = a2[47];
    if (v117 >= v118) {
      goto LABEL_105;
    }
    v119 = (unint64_t *)(a1 + 376);
    v120 = a2 + 47;
    if (!a5) {
      sub_188CC1E18(a1 + 376, (uint64_t)(a2 + 47), a3);
    }
    goto LABEL_104;
  }

  if (!a5) {
    sub_188CC1A7C(a1 + 368, (uint64_t)(a2 + 46), a3);
  }
  *a5 = 1;
  *(void *)(a3 + 368) = 0LL;
  unint64_t v117 = *(void *)(a1 + 376);
  unint64_t v118 = a2[47];
  *(void *)(a3 + 368) = *(void *)(a1 + 368) - a2[46];
  if (v117 < v118)
  {
    v119 = (unint64_t *)(a1 + 376);
    v120 = a2 + 47;
LABEL_104:
    *a5 = 1;
    *(void *)(a3 + 376) = 0LL;
    unint64_t v117 = *v119;
    unint64_t v118 = *v120;
  }

LABEL_105:
  *(void *)(a3 + 376) = v117 - v118;
  unint64_t v121 = *(void *)(a1 + 384);
  unint64_t v122 = a2[48];
  if (v121 < v122)
  {
    if (!a5) {
      sub_188CC1B00(a1 + 384, (uint64_t)(a2 + 48), a3);
    }
    *a5 = 1;
    *(void *)(a3 + 384) = 0LL;
    unint64_t v121 = *(void *)(a1 + 384);
    unint64_t v122 = a2[48];
  }

  *(void *)(a3 + 384) = v121 - v122;
  if (a6 < 2) {
    goto LABEL_124;
  }
  unint64_t v123 = *(void *)(a1 + 408);
  unint64_t v124 = a2[51];
  BOOL v24 = v123 >= v124;
  unint64_t v125 = v123 - v124;
  if (v24)
  {
    *(void *)(a3 + 408) = v125;
    unint64_t v126 = *(void *)(a1 + 416);
    unint64_t v127 = a2[52];
    if (v126 >= v127) {
      goto LABEL_116;
    }
    v128 = (unint64_t *)(a1 + 416);
    v129 = a2 + 52;
    if (!a5) {
      sub_188CC1D94(a1 + 416, (uint64_t)(a2 + 52), a3);
    }
    goto LABEL_115;
  }

  if (!a5) {
    sub_188CC1B84(a1 + 408, (uint64_t)(a2 + 51), a3);
  }
  *a5 = 1;
  *(void *)(a3 + 408) = 0LL;
  unint64_t v126 = *(void *)(a1 + 416);
  unint64_t v127 = a2[52];
  *(void *)(a3 + 408) = *(void *)(a1 + 408) - a2[51];
  if (v126 < v127)
  {
    v128 = (unint64_t *)(a1 + 416);
    v129 = a2 + 52;
LABEL_115:
    *a5 = 1;
    *(void *)(a3 + 416) = 0LL;
    unint64_t v126 = *v128;
    unint64_t v127 = *v129;
  }

LABEL_116:
  *(void *)(a3 + 416) = v126 - v127;
  unint64_t v130 = *(void *)(a1 + 424);
  unint64_t v131 = a2[53];
  BOOL v24 = v130 >= v131;
  unint64_t v132 = v130 - v131;
  if (!v24)
  {
    if (!a5) {
      sub_188CC1C08(a1 + 424, (uint64_t)(a2 + 53), a3);
    }
    *a5 = 1;
    *(void *)(a3 + 424) = 0LL;
    unint64_t v133 = *(void *)(a1 + 432);
    unint64_t v134 = a2[54];
    *(void *)(a3 + 424) = *(void *)(a1 + 424) - a2[53];
    if (v133 >= v134) {
      goto LABEL_123;
    }
    v135 = (unint64_t *)(a1 + 432);
    v136 = a2 + 54;
    goto LABEL_122;
  }

  *(void *)(a3 + 424) = v132;
  unint64_t v133 = *(void *)(a1 + 432);
  unint64_t v134 = a2[54];
  if (v133 < v134)
  {
    v135 = (unint64_t *)(a1 + 432);
    v136 = a2 + 54;
    if (!a5) {
      sub_188CC1D10(a1 + 432, (uint64_t)(a2 + 54), a3);
    }
LABEL_122:
    *a5 = 1;
    *(void *)(a3 + 432) = 0LL;
    unint64_t v133 = *v135;
    unint64_t v134 = *v136;
  }

LABEL_123:
  *(void *)(a3 + 432) = v133 - v134;
LABEL_124:
  unint64_t v137 = *(void *)(a1 + 392);
  unint64_t v138 = a2[49];
  if (v137 < v138)
  {
    v139 = a2 + 49;
    if (!a5) {
      sub_188CC1C8C(a1 + 392, (uint64_t)v139, a3);
    }
    *a5 = 1;
    *(void *)(a3 + 392) = 0LL;
    unint64_t v137 = *(void *)(a1 + 392);
    unint64_t v138 = *v139;
  }

  unint64_t v22 = v137 - v138;
LABEL_128:
  *(void *)(a3 + 392) = v22;
  if (a3 != a1)
  {
    *(_DWORD *)a3 = *(_DWORD *)a1;
    __int128 v140 = *(_OWORD *)(a1 + 4);
    __int128 v141 = *(_OWORD *)(a1 + 20);
    __int128 v142 = *(_OWORD *)(a1 + 36);
    *(_OWORD *)(a3 + 52) = *(_OWORD *)(a1 + 52);
    *(_OWORD *)(a3 + 36) = v142;
    *(_OWORD *)(a3 + 20) = v141;
    *(_OWORD *)(a3 + 4) = v140;
    __n128 result = *(__n128 *)(a1 + 68);
    __int128 v144 = *(_OWORD *)(a1 + 84);
    __int128 v145 = *(_OWORD *)(a1 + 100);
    *(_OWORD *)(a3 + 116) = *(_OWORD *)(a1 + 116);
    *(_OWORD *)(a3 + 100) = v145;
    *(_OWORD *)(a3 + 84) = v144;
    *(__n128 *)(a3 + 68) = result;
  }

  return result;
}

double pm_task_subtract(uint64_t a1, unint64_t *a2, uint64_t a3, _BYTE *a4)
{
  *(void *)&double result = sub_188CC01C8(a1, a2, a3, 0xFFFFFFFF, a4, 1).n128_u64[0];
  return result;
}

double pm_task_add_version(uint64_t a1, unint64_t *a2, uint64_t a3, int a4)
{
  *(void *)&double result = sub_188CC01C8(a1, a2, a3, 1u, 0LL, a4).n128_u64[0];
  return result;
}

double pm_task_add(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  *(void *)&double result = sub_188CC01C8(a1, a2, a3, 1u, 0LL, 1).n128_u64[0];
  return result;
}

double pm_mach_time_to_ns(unint64_t a1)
{
  if (qword_18C749648 != -1) {
    dispatch_once(&qword_18C749648, &unk_18A2F8FB8);
  }
  return *(double *)&qword_18C749650 * (double)a1;
}

double sub_188CC0EB0()
{
  LODWORD(v0) = info.numer;
  LODWORD(v1) = info.denom;
  double result = (double)v0 / (double)v1;
  qword_18C749650 = *(void *)&result;
  return result;
}

void pm_energy_impact_internal(uint64_t a1)
{
  if (!*(void *)(a1 + 368))
  {
    if (qword_18C4FDF70 != -1) {
      dispatch_once(&qword_18C4FDF70, &unk_18A2F8FF8);
    }
    if (qword_18C749648 != -1) {
      dispatch_once(&qword_18C749648, &unk_18A2F8FB8);
    }
  }
}

void pm_energy_impact(uint64_t a1)
{
  if (qword_18C4FDF70 != -1) {
    dispatch_once(&qword_18C4FDF70, &unk_18A2F8FF8);
  }
  pm_energy_impact_internal(a1);
}

double sub_188CC1084()
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  dword_18C7496D0 = getpagesize();
  if ((byte_18C749758 & 1) == 0)
  {
    io_registry_entry_t v0 = IORegistryEntryFromPath(*MEMORY[0x1896086A8], "IODeviceTree:/");
    if (v0)
    {
      io_object_t v1 = v0;
      CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(v0, @"board-id", 0LL, 0);
      if (CFProperty)
      {
        v3 = CFProperty;
        CFTypeID v4 = CFGetTypeID(CFProperty);
        if (v4 == CFDataGetTypeID() && (unint64_t)CFDataGetLength(v3) <= 0x80)
        {
          CFDataGetBytePtr(v3);
          __memcpy_chk();
        }

        CFRelease(v3);
      }

      IOObjectRelease(v1);
    }

    byte_18C749758 = 1;
  }

  snprintf(__str, 0xFFuLL, "%s/%s.plist", "/usr/share/pmenergy", byte_18C7496D8);
  int v5 = open(__str, 0);
  if (v5 < 0)
  {
    snprintf(__str, 0xFFuLL, "%s/%s.plist", "/usr/share/pmenergy", "default");
    int v5 = open(__str, 0);
    if (v5 < 0) {
      goto LABEL_27;
    }
  }

  size_t v6 = lseek(v5, 0LL, 2);
  lseek(v5, 0LL, 0);
  unint64_t v7 = malloc(v6);
  if (!v7 || read(v5, v7, v6) != v6)
  {
    LOBYTE(v12) = 0;
    uint64_t v10 = 0LL;
    goto LABEL_20;
  }

  unint64_t v9 = (void *)xpc_create_from_plist();
  uint64_t v10 = v9;
  if (!v9) {
    goto LABEL_17;
  }
  xpc_object_t value = xpc_dictionary_get_value(v9, "energy_constants");
  unint64_t v12 = value;
  if (!value)
  {
LABEL_20:
    if (!v5) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }

  if (MEMORY[0x1895D5420](value) != MEMORY[0x1895F9250])
  {
LABEL_17:
    LOBYTE(v12) = 0;
    if (!v5) {
      goto LABEL_22;
    }
LABEL_21:
    close(v5);
    goto LABEL_22;
  }

  xpc_dictionary_apply(v12, &unk_18A2F9038);
  LOBYTE(v12) = 1;
  if (v5) {
    goto LABEL_21;
  }
LABEL_22:
  if (v7) {
    free(v7);
  }
  if (v10) {
    xpc_release(v10);
  }
  if ((v12 & 1) == 0)
  {
LABEL_27:
    qword_18C7496C8 = 0LL;
    xmmword_18C749698 = xmmword_188CC2708;
    *(_OWORD *)&qword_18C7496A8 = unk_188CC2718;
    xmmword_18C7496B8 = xmmword_188CC2728;
    xmmword_18C749658 = xmmword_188CC26C8;
    unk_18C749668 = unk_188CC26D8;
    double result = dbl_188CC26F8[0];
    xmmword_18C749678 = xmmword_188CC26E8;
    unk_18C749688 = *(_OWORD *)dbl_188CC26F8;
  }

  return result;
}

uint64_t sub_188CC1320(uint64_t a1, const char *a2, void *a3)
{
  if (MEMORY[0x1895D5420](a3) == MEMORY[0x1895F9258])
  {
    uint64_t v5 = 0LL;
    while (strcmp(a2, off_18A2F9058[v5]))
    {
      if (++v5 == 15) {
        return 1LL;
      }
    }

    *(double *)((char *)&xmmword_18C749658 + v5 * 8) = xpc_double_get_value(a3);
  }

  return 1LL;
}

size_t sub_188CC13A4(const void *a1, uint64_t a2, uint64_t a3, FILE *a4)
{
  return fwrite(a1, 0x13uLL, 1uLL, a4);
}

uint64_t sub_188CC13B0()
{
  return *(void *)v0;
}

void sub_188CC13C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = (FILE *)sub_188CC13B0();
  fprintf( v3,  "%s: %llu\n%s: %llu\nfactor: %d\n",  "current->task_interrupt_wakeups",  v4,  "last->task_interrupt_wakeups",  v5,  v6);
  __assert_rtn("power_info_arithmetic", "pmenergy.c", 112, "false");
}

void sub_188CC144C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = (FILE *)sub_188CC13B0();
  fprintf( v3,  "%s: %llu\n%s: %llu\nfactor: %d\n",  "current->task_timer_wakeups_bin_1",  v4,  "last->task_timer_wakeups_bin_1",  v5,  v6);
  __assert_rtn("power_info_arithmetic", "pmenergy.c", 114, "false");
}

void sub_188CC14D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = (FILE *)sub_188CC13B0();
  fprintf(v3, "%s: %llu\n%s: %llu\nfactor: %d\n", "current->total_system", v4, "last->total_system", v5, v6);
  __assert_rtn("power_info_arithmetic", "pmenergy.c", 116, "false");
}

void sub_188CC1554(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = (FILE *)sub_188CC13B0();
  fprintf(v3, "%s: %llu\n%s: %llu\nfactor: %d\n", "current->recv_packets", v4, "last->recv_packets", v5, v6);
  __assert_rtn("network_stats_arithmetic", "pmenergy.c", 122, "false");
}

void sub_188CC15D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = (FILE *)sub_188CC13B0();
  fprintf(v3, "%s: %llu\n%s: %llu\nfactor: %d\n", "current->recv_bytes", v4, "last->recv_bytes", v5, v6);
  __assert_rtn("network_stats_arithmetic", "pmenergy.c", 124, "false");
}

void sub_188CC165C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = (FILE *)sub_188CC13B0();
  fprintf( v3,  "%s: %llu\n%s: %llu\nfactor: %d\n",  "current->total_wait_state_time",  v4,  "last->total_wait_state_time",  v5,  v6);
  __assert_rtn("wait_info_arithmetic", "pmenergy.c", 130, "false");
}

void sub_188CC16E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = (FILE *)sub_188CC13B0();
  fprintf(v3, "%s: %llu\n%s: %llu\nfactor: %d\n", "current->diskio_bytesread", v4, "last->diskio_bytesread", v5, v6);
  __assert_rtn("pm_task_arithmetic_version", "pmenergy.c", 143, "false");
}

void sub_188CC1764(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = (FILE *)sub_188CC13B0();
  fprintf(v3, "%s: %llu\n%s: %llu\nfactor: %d\n", "current->pageins", v4, "last->pageins", v5, v6);
  __assert_rtn("pm_task_arithmetic_version", "pmenergy.c", 145, "false");
}

void sub_188CC17E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = (FILE *)sub_188CC13B0();
  fprintf(v3, "%s: %llu\n%s: %llu\nfactor: %d\n", "current->qos_maintenance", v4, "last->qos_maintenance", v5, v6);
  __assert_rtn("pm_task_arithmetic_version", "pmenergy.c", 148, "false");
}

void sub_188CC186C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = (FILE *)sub_188CC13B0();
  fprintf(v3, "%s: %llu\n%s: %llu\nfactor: %d\n", "current->qos_utility", v4, "last->qos_utility", v5, v6);
  __assert_rtn("pm_task_arithmetic_version", "pmenergy.c", 150, "false");
}

void sub_188CC18F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = (FILE *)sub_188CC13B0();
  fprintf(v3, "%s: %llu\n%s: %llu\nfactor: %d\n", "current->qos_user_initiated", v4, "last->qos_user_initiated", v5, v6);
  __assert_rtn("pm_task_arithmetic_version", "pmenergy.c", 152, "false");
}

void sub_188CC1974(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = (FILE *)sub_188CC13B0();
  fprintf(v3, "%s: %llu\n%s: %llu\nfactor: %d\n", "current->gpu_ns", v4, "last->gpu_ns", v5, v6);
  __assert_rtn("pm_task_arithmetic_version", "pmenergy.c", 155, "false");
}

void sub_188CC19F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = (FILE *)sub_188CC13B0();
  fprintf(v3, "%s: %llu\n%s: %llu\nfactor: %d\n", "current->windowserver_work", v4, "last->windowserver_work", v5, v6);
  __assert_rtn("pm_task_arithmetic_version", "pmenergy.c", 157, "false");
}

void sub_188CC1A7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = (FILE *)sub_188CC13B0();
  fprintf(v3, "%s: %llu\n%s: %llu\nfactor: %d\n", "current->task_energy", v4, "last->task_energy", v5, v6);
  __assert_rtn("pm_task_arithmetic_version", "pmenergy.c", 160, "false");
}

void sub_188CC1B00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = (FILE *)sub_188CC13B0();
  fprintf(v3, "%s: %llu\n%s: %llu\nfactor: %d\n", "current->task_pset_switches", v4, "last->task_pset_switches", v5, v6);
  __assert_rtn("pm_task_arithmetic_version", "pmenergy.c", 162, "false");
}

void sub_188CC1B84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = (FILE *)sub_188CC13B0();
  fprintf(v3, "%s: %llu\n%s: %llu\nfactor: %d\n", "current->instructions", v4, "last->instructions", v5, v6);
  __assert_rtn("pm_task_arithmetic_version", "pmenergy.c", 164, "false");
}

void sub_188CC1C08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = (FILE *)sub_188CC13B0();
  fprintf(v3, "%s: %llu\n%s: %llu\nfactor: %d\n", "current->pinstructions", v4, "last->pinstructions", v5, v6);
  __assert_rtn("pm_task_arithmetic_version", "pmenergy.c", 166, "false");
}

void sub_188CC1C8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = (FILE *)sub_188CC13B0();
  fprintf(v3, "%s: %llu\n%s: %llu\nfactor: %d\n", "current->interval", v4, "last->interval", v5, v6);
  __assert_rtn("pm_task_arithmetic_version", "pmenergy.c", 171, "false");
}

void sub_188CC1D10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = (FILE *)sub_188CC13B0();
  fprintf(v3, "%s: %llu\n%s: %llu\nfactor: %d\n", "current->pcycles", v4, "last->pcycles", v5, v6);
  __assert_rtn("pm_task_arithmetic_version", "pmenergy.c", 167, "false");
}

void sub_188CC1D94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = (FILE *)sub_188CC13B0();
  fprintf(v3, "%s: %llu\n%s: %llu\nfactor: %d\n", "current->cycles", v4, "last->cycles", v5, v6);
  __assert_rtn("pm_task_arithmetic_version", "pmenergy.c", 165, "false");
}

void sub_188CC1E18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = (FILE *)sub_188CC13B0();
  fprintf(v3, "%s: %llu\n%s: %llu\nfactor: %d\n", "current->task_ptime", v4, "last->task_ptime", v5, v6);
  __assert_rtn("pm_task_arithmetic_version", "pmenergy.c", 161, "false");
}

void sub_188CC1E9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = (FILE *)sub_188CC13B0();
  fprintf( v3,  "%s: %llu\n%s: %llu\nfactor: %d\n",  "current->windowserver_total_work",  v4,  "last->windowserver_total_work",  v5,  v6);
  __assert_rtn("pm_task_arithmetic_version", "pmenergy.c", 158, "false");
}

void sub_188CC1F20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = (FILE *)sub_188CC13B0();
  fprintf( v3,  "%s: %llu\n%s: %llu\nfactor: %d\n",  "current->windowserver_gpu_ns",  v4,  "last->windowserver_gpu_ns",  v5,  v6);
  __assert_rtn("pm_task_arithmetic_version", "pmenergy.c", 156, "false");
}

void sub_188CC1FA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = (FILE *)sub_188CC13B0();
  fprintf( v3,  "%s: %llu\n%s: %llu\nfactor: %d\n",  "current->qos_user_interactive",  v4,  "last->qos_user_interactive",  v5,  v6);
  __assert_rtn("pm_task_arithmetic_version", "pmenergy.c", 153, "false");
}

void sub_188CC2028(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = (FILE *)sub_188CC13B0();
  fprintf(v3, "%s: %llu\n%s: %llu\nfactor: %d\n", "current->qos_legacy", v4, "last->qos_legacy", v5, v6);
  __assert_rtn("pm_task_arithmetic_version", "pmenergy.c", 151, "false");
}

void sub_188CC20AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = (FILE *)sub_188CC13B0();
  fprintf(v3, "%s: %llu\n%s: %llu\nfactor: %d\n", "current->qos_background", v4, "last->qos_background", v5, v6);
  __assert_rtn("pm_task_arithmetic_version", "pmenergy.c", 149, "false");
}

void sub_188CC2130(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = (FILE *)sub_188CC13B0();
  fprintf(v3, "%s: %llu\n%s: %llu\nfactor: %d\n", "current->qos_default", v4, "last->qos_default", v5, v6);
  __assert_rtn("pm_task_arithmetic_version", "pmenergy.c", 147, "false");
}

void sub_188CC21B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = (FILE *)sub_188CC13B0();
  fprintf( v3,  "%s: %llu\n%s: %llu\nfactor: %d\n",  "current->diskio_byteswritten",  v4,  "last->diskio_byteswritten",  v5,  v6);
  __assert_rtn("pm_task_arithmetic_version", "pmenergy.c", 144, "false");
}

void sub_188CC2238(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = (FILE *)sub_188CC13B0();
  fprintf( v3,  "%s: %llu\n%s: %llu\nfactor: %d\n",  "current->total_wait_sfi_state_time",  v4,  "last->total_wait_sfi_state_time",  v5,  v6);
  __assert_rtn("wait_info_arithmetic", "pmenergy.c", 131, "false");
}

void sub_188CC22BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = (FILE *)sub_188CC13B0();
  fprintf(v3, "%s: %llu\n%s: %llu\nfactor: %d\n", "current->sent_bytes", v4, "last->sent_bytes", v5, v6);
  __assert_rtn("network_stats_arithmetic", "pmenergy.c", 125, "false");
}

void sub_188CC2340(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = (FILE *)sub_188CC13B0();
  fprintf(v3, "%s: %llu\n%s: %llu\nfactor: %d\n", "current->sent_packets", v4, "last->sent_packets", v5, v6);
  __assert_rtn("network_stats_arithmetic", "pmenergy.c", 123, "false");
}

void sub_188CC23C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = (FILE *)sub_188CC13B0();
  fprintf(v3, "%s: %llu\n%s: %llu\nfactor: %d\n", "current->total_user", v4, "last->total_user", v5, v6);
  __assert_rtn("power_info_arithmetic", "pmenergy.c", 117, "false");
}

void sub_188CC2448(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = (FILE *)sub_188CC13B0();
  fprintf( v3,  "%s: %llu\n%s: %llu\nfactor: %d\n",  "current->task_timer_wakeups_bin_2",  v4,  "last->task_timer_wakeups_bin_2",  v5,  v6);
  __assert_rtn("power_info_arithmetic", "pmenergy.c", 115, "false");
}

void sub_188CC24CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = (FILE *)sub_188CC13B0();
  fprintf( v3,  "%s: %llu\n%s: %llu\nfactor: %d\n",  "current->task_platform_idle_wakeups",  v4,  "last->task_platform_idle_wakeups",  v5,  v6);
  __assert_rtn("power_info_arithmetic", "pmenergy.c", 113, "false");
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x189602A98](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x189602AB0](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x189602AC8]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x189602D30](cf);
}

void CFRelease(CFTypeRef cf)
{
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x189608398](*(void *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty( io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x189608470](*(void *)&entry, key, allocator, *(void *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x189608488](*(void *)&mainPort, path);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1895F8930]();
}

int close(int a1)
{
  return MEMORY[0x1895FA590](*(void *)&a1);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1895FB360](a1, a2);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1895FB4C8](__ptr, __size, __nitems, __stream);
}

int getpagesize(void)
{
  return MEMORY[0x1895FB608]();
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1895FBA80](*(void *)&a1, a2, *(void *)&a3);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1895FBBF8](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1895FC248](a1, *(void *)&a2);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1895FCC38](*(void *)&a1, a2, a3);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FCF90](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1895FD050](__s1, __s2);
}

uint64_t xpc_create_from_plist()
{
  return MEMORY[0x1895FDAE0]();
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1895FDB78](xdict, applier);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1895FDC68](xdict, key);
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  return result;
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1895FDE70](object);
}