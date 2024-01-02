#!/bin/bash

#wget -q http://drbl.sourceforge.net/GPG-KEY-DRBL -O- | apt-key add -

YERITH_CLONEZILLA_REPOSITORY="deb http://drbl.sourceforge.net/drbl-core drbl stable"

YERITH_ETC_APT_SOURCELIST="/etc/apt/sources.list"

cp ${YERITH_ETC_APT_SOURCELIST} ${YERITH_ETC_APT_SOURCELIST}.YERITH

#sed -i "1s_^_\n ${YERITH_CLONEZILLA_REPOSITORY} \n_" ${YERITH_ETC_APT_SOURCELIST}

TEST=$(cat word)

sed -i "s_word_${TEST} \n_" t
